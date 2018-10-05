-- wian 20051018
-- osmdbfcheck ohne perl
-- - wian: drop table osmdbfcheck BEGINN 
drop table osmdbfcheck; 
-- - wian: drop table osmdbfcheck END 

-- - wian: create table osmdbfcheck mit Total vorhandenem Speicher BEGINN 
create table osmdbfcheck ( 
tablespace, 
total, 
used, 
avail, 
pct, 
bigblk) 
as select 
substr(tablespace_name,1,19), 
sum(bytes)/1024, 
0, 
0, 
0, 
0  
from dba_data_files 
group by tablespace_name;
-- - wian: create table osmdbfcheck mit Total vorhandenem Speicher END 

-- - wian: ermitteln des gesammten Speicherplatzes BEGINN 
-- update osmdbfcheck 
-- set total=( select sum(bytes)/1024 from dba_segments 
-- where osmdbfcheck.tablespace = tablespace_name group by dba_segments.tablespace_name ) 
-- where exists ( 
-- select distinct(tablespace_name) 
-- from dba_segments );
-- - wian: ermitteln des gesammten Speicherplatzes END 


-- - wian: ermitteln, wieviel schon verbraucht ist BEGINN 
update osmdbfcheck 
set used=( select sum(bytes)/1024 from dba_segments 
where osmdbfcheck.tablespace = tablespace_name group by dba_segments.tablespace_name ) 
where exists ( 
select distinct(tablespace_name) 
from dba_segments );
-- - wian: ermitteln, wieviel schon verbraucht ist END 

-- - wian: ermitteln, wieviel noch frei ist BEGINN 
update osmdbfcheck 
set avail=( 
select sum(bytes)/1024 from dba_free_space 
where osmdbfcheck.tablespace=tablespace_name 
group by tablespace_name ) 
where exists ( 
select distinct(tablespace_name) 
from dba_free_space );
-- - wian: ermitteln, wieviel noch frei ist END 


-- - wian: Prozent ermitteln BEGINN 
update osmdbfcheck 
set pct=round(used*100/total,0);
-- - wian: Prozent ermitteln END 

-- - wian: groessten zusammenhaengenden block von jedem tablespace BEGINN 
update osmdbfcheck  
set bigblk=( 
select max(bytes)/1024 from dba_free_space 
where osmdbfcheck.tablespace=tablespace_name 
group by tablespace_name ) 
where exists ( 
select distinct(tablespace_name) 
from dba_free_space );
-- - wian: groessten zusammenhaengenden block von jedem tablespace END 

