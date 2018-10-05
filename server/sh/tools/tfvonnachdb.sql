-- Voraussetzung Eintrag fuer nach_nodid in
-- snod_rechner vorhanden
 
update sorg_t_einheit 
set org_nodid = '&&nach_nodid'
where org_nodid = '&&von_nodid';

alter table sdrf_drufor
disable constraint fk_drf_druid;

update sdrf_drufor
set drf_nodid = '&&nach_nodid' 
where drf_nodid = '&&von_nodid';

update sdru_drucker
set dru_nodid = '&&nach_nodid' 
where dru_nodid = '&&von_nodid';

update sdrv_druckvor
set drv_nodid = '&&nach_nodid' 
where drv_nodid = '&&von_nodid';

update sfir_firma 
set fir_nodid = '&&nach_nodid' 
where fir_nodid = '&&von_nodid';

update sidv_idvergabe 
set idv_nodid = '&&nach_nodid' 
where idv_nodid = '&&von_nodid';

update slaf_leistanf 
set laf_nodids = '&&nach_nodid' 
where laf_nodids = '&&von_nodid';

update scfg_config
set cfg_cfeld = ( select nod_vst from
   snod_t_rechner where nod_nodid = '&&nach_nodid' ) 
where cfg_cfgid = 'VS';


alter table sdrf_drufor enable constraint fk_dru_nodid;

