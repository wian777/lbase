REM ****************************************************************************
REM Zeigt Sessions an
REM ****************************************************************************
column iid format a3
column sid_ser format a9
column osuser_term format a15
column programm format a20 trunc
column status format a6 trunc
column logon format a14
column idle format a7
SELECT to_char(inst_id) AS iid,
  sid || ',' || serial# AS sid_ser,
  osuser || '@' || terminal AS osuser_term,
  SUBSTR(program, instr(program, '\', -1, 1)+1) AS programm,
  status,
  TO_CHAR(logon_time, 'DD.MM.YY HH24:MI') AS logon,
  TO_CHAR(TRUNC(last_call_et/3600)) || TO_CHAR(to_date(mod(last_call_et, 86400),'sssss'),':mi') AS idle
FROM gv$session
WHERE username IS NOT NULL
AND type       != 'BACKGROUND'
ORDER BY inst_id, osuser, terminal, sid, serial#;
