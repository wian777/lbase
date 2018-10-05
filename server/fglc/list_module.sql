set doc off
set echo off
set verify off
set feedback off
set pagesize 0
set heading off
set trimspool on
spool &2

select lstb_codid
from lstb_startbed, lprg_programm, lkri_kriterium
where lstb_prgid = lprg_prgid
and lprg_kriid = lkri_kriid
and lkri_bibid = '&1'
and lstb_codid is not null
order by lstb_codid
;

select lver_codid
from lver_version, lprg_programm, lkri_kriterium
where lver_prgid = lprg_prgid
and lprg_kriid = lkri_kriid
and lkri_bibid = '&1'
order by lver_codid
;

spool off
exit;
