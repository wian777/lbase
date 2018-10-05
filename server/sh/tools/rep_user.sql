
set heading off
set pause off
spool REP_USER
select 'CREATE ROLE REP_USER NOT IDENTIFIED;' from dual;
select 'GRANT CREATE VIEW TO REP_USER;' from dual;
select 'CREATE USER TF_REPORT IDENTIFIED BY tf_report DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE USERS PROFILE DEFAULT;' from dual;
select 'GRANT CONNECT TO TF_REPORT;' from dual;
select 'GRANT REP_USER TO TF_REPORT;' from dual;
select 'ALTER USER TF_REPORT DEFAULT ROLE ALL;' from dual;
select 'grant select on ' || table_name || ' to REP_USER; ' from
user_tables;
select 'Grants auf Tabellen vergeben;' from dual;
select 'grant select on ' || view_name || ' to REP_USER; ' from
user_views ;
select 'Grants auf Views vergeben;' from dual;
select 'grant execute on ' || object_name || ' to REP_USER; ' from
user_objects
where object_type like 'PACKAGE%'
or object_type in ('PROCEDURE', 'FUNCTION' );
select 'Grants auf Packages, Procedures und Functions vergeben;' from dual;
spool off;
start REP_USER.lst
exit

