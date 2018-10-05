REM 	28.06.1998 WOSC
REM 	Elimnieren von Sessions mit Locks und keiner Aktivitaet
REM   PARAMETER: 1 	Lock seit wann Zeitangabe in Sekunden
REM   PARAMETER: 2   Session inaktiv seit ( Lockzeit - Param2 ) in Sekunden
REM	PARAMETER: 3	Scriptdatei fuer Kill session

set serveroutput on
set pause off 
set heading off
spool &3..sql 
select 'kill_lock_sessions.sql' , to_char(sysdate,'YYMMDD HH24:MI')
from dual;
declare
cursor v_lock is
select sid  from
v$lock a
where exists ( select 1 from v$lock b
					where a.sid = b.sid
					and	b.lmode in ( 3,5,6)
					and   b.ctime > &1
					and   ( b.id1 in (select object_id from dba_objects
					where owner = 'SPED'
					and object_type    = 'TABLE') 
						or ( b.id2 in (select object_id from dba_objects
					where owner = 'SPED' 
					and object_type    = 'TABLE') 
					) )  
					)
and not exists ( select 1 from v$session b 
					where a.sid = b.sid 
					and   b.last_call_et < ( a.ctime - &2 ) 
					)
group by sid;

cursor v_session 
( p_sid v$session.sid%TYPE
) is
select sid, serial# from
v$session
where sid = p_sid
group by sid, serial#;

begin
	for i in v_lock loop
		for j in v_session (i.sid) loop
			dbms_output.put_line('alter system kill session ''' || j.sid || ',' || j.serial#  || ''';'    );
		end loop;
	end loop;
	null;
end;
/
select 'exit;' from dual;
spool off;
--ed &3
@&3
exit;
