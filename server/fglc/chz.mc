/*
Schweizer Zoll - Definitionen fuer Vorgaben
AEnderungen:
12.03.01  rewi Erweiterung Schleife CHZ_ZAB_SDG
*/
#define CHZ_PRA(_row,_pratyp,_pranr,_pradat,_fix) \
 l_sektion = "PRAEFERENZ_"|| LFD_SEKTION; \
 LFD_SEKTION = LFD_SEKTION + 1; \
 @AddSection(l_sektion); \
 ifelse(_row,,,@SetItem(l_sektion,"ZEILE",_row);) \
 @SetItem(l_sektion,"DOKUTYP",_pratyp); \
 @SetItem(l_sektion,"NR",_pranr); \
 ifelse(_pradat,,,@SetItem(l_sektion,"DATUM",_pradat);) \
 ifelse(_fix,"Y",@SetItem(l_sektion,"FIX",_fix);,)
 
#define CHZ_CVPM(_row,_depid,_vepanz,_vepid,_mark,_warbes,_fix) \
 l_sektion = "VERPMARK_"|| LFD_SEKTION; \
 LFD_SEKTION = LFD_SEKTION + 1; \
 @AddSection(l_sektion); \
 ifelse(_row,,,@SetItem(l_sektion,"ZEILE",_row);) \
 @SetItem(l_sektion,"DEPID",_depid); \
 ifelse(_vepanz,,,@SetItem(l_sektion,"VEPANZ",_vepanz);) \
 ifelse(_vepid,,,@SetItem(l_sektion,"VEPID",_vepid);) \
 ifelse(_mark,,,@SetItem(l_sektion,"MARK",@sprintf(_mark));) \
 ifelse(_warbes,,,@SetItem(l_sektion,"WARBES",@sprintf(_warbes));) \
 ifelse(_fix,"Y",@SetItem(l_sektion,"FIX",_fix);,)

#define CHZ_CDEP(_depid,_hwc,_abfc,_tarid,_tarid_r,_tasid,_staidu,_eiggew,_eiggew_r, \
_statmenge,_statmenge_r,_zollgew,_zollgew_r,_statwert,_statwert_r,_ustwert,_ustwert_r, \
_zollans,_zollans_r,_ustans,_btogew,_zmc,_tarazu,_tarazu_r,_ntogew,_rc,_rinhnr, \
_fmtid,_fmtid_r,_chassisnr,_stammnr,_vdokart,_vdoknr,_vdokdt,_vdoktext,_genliznr, \
_geneinfbwc,_lagerc,_montc,_staidtu,_duepna,_duepph,_duepka,_ngpc,_bpc,_bpsc,_fix) \
 l_sektion = "CDEP_"|| LFD_SEKTION; \
 LFD_SEKTION = LFD_SEKTION + 1; \
 @AddSection(l_sektion); \
 @SetItem(l_sektion,"DEPID",_depid); \
 ifelse(_hwc,,,@SetItem(l_sektion,"HWC",_hwc);) \
 ifelse(_abfc,,,@SetItem(l_sektion,"ABFC",_abfc);) \
 ifelse(_tarid,,,@SetItem(l_sektion,"TARID",_tarid); \
   @SetItem(l_sektion,"TARID_R",ifelse(_tarid_r,"Y","Y","N"));) \
 ifelse(_tasid,,,@SetItem(l_sektion,"TASID",_tasid);) \
 ifelse(_staidu,,,@SetItem(l_sektion,"STAIDU",_staidu);) \
 ifelse(_eiggew,,,@SetItem(l_sektion,"EIGGEW",_ref(""{""_eiggew""}"")); \
   @SetItem(l_sektion,"EIGGEW_R",ifelse(_eiggew_r,"Y","Y","N")); ) \
 ifelse(_statmenge,,,@SetItem(l_sektion,"STATMENGE",_statmenge); \
   @SetItem(l_sektion,"STATMENGE_R",ifelse(_statmenge_r,"Y","Y","N")); )\
 ifelse(_zollgew,,,@SetItem(l_sektion,"ZOLLGEW",_zollgew); \
   @SetItem(l_sektion,"ZOLLGEW_R",ifelse(_zollgew_r,"Y","Y","N")); )\
 ifelse(_statwert,,,@SetItem(l_sektion,"STATWERT",_statwert); \
   @SetItem(l_sektion,"STATWERT_R",ifelse(_statwert_r,"Y","Y","N")); )\
 ifelse(_ustwert,,,@SetItem(l_sektion,"USTWERT",_ustwert); \
   @SetItem(l_sektion,"USTWERT_R",ifelse(_ustwert_r,"Y","Y","N")); )\
 ifelse(_zollans,,,@SetItem(l_sektion,"ZOLLANS",_zollans); \
   @SetItem(l_sektion,"ZOLLANS_R",ifelse(_zollans_r,"Y","Y","N")); )\
 ifelse(_ustans,,,@SetItem(l_sektion,"USTANS",_ustans);) \
 ifelse(_btogew,,,@SetItem(l_sektion,"BTOGEW",_ref(""{""_btogew""}""));) \
 ifelse(_zmc,,,@SetItem(l_sektion,"ZMC",_zmc);) \
 ifelse(_tarazu,,,@SetItem(l_sektion,"TARAZU",_ref(""{""_tarazu""}"")); \
   @SetItem(l_sektion,"TARAZU_R",ifelse(_tarazu_r,"Y","Y","N")); )\
 ifelse(_ntogew,,,@SetItem(l_sektion,"NTOGEW",_ref(""{""_ntogew""}""));) \
 ifelse(_rc,,,@SetItem(l_sektion,"RC",_rc);) \
 ifelse(_rinhnr,,,@SetItem(l_sektion,"RINHNR",_rinhnr);) \
 ifelse(_fmtid,,,@SetItem(l_sektion,"FMTID",_fmtid); \
   @SetItem(l_sektion,"FMTID_R",ifelse(_fmtid_r,"Y","Y","N")); )\
 ifelse(_chassisnr,,,@SetItem(l_sektion,"CHASSISNR",_chassisnr);) \
 ifelse(_stammnr,,,@SetItem(l_sektion,"STAMMNR",_stammnr);) \
 ifelse(_vdokart,,,@SetItem(l_sektion,"VDOKART",_vdokart);) \
 ifelse(_vdoknr,,,@SetItem(l_sektion,"VDOKNR",_vdoknr);) \
 ifelse(_vdokdt,,,@SetItem(l_sektion,"VDOKDT",_vdokdt);) \
 ifelse(_vdoktext,"",,@SetItem(l_sektion,"VDOKTEXT",_vdoktext);) \
 ifelse(_genliznr,,,@SetItem(l_sektion,"GENLIZNR",_genliznr);) \
 ifelse(_geneinfbwc,,,@SetItem(l_sektion,"GENEINFBEWC",_geneinfbwc);) \
 ifelse(_lagerc,,,@SetItem(l_sektion,"LAGERC",_lagerc);) \
 ifelse(_montc,,,@SetItem(l_sektion,"MONTC",_montc);) \
 ifelse(_staidtu,,,@SetItem(l_sektion,"STAIDTU",_staidtu);) \
 ifelse(_duepna,,,@SetItem(l_sektion,"DUEPNA",_duepna);) \
 ifelse(_duepph,,,@SetItem(l_sektion,"DUEPPH",_duepph);) \
 ifelse(_duepka,,,@SetItem(l_sektion,"DUEPKA",_duepka);) \
 ifelse(_ngpc,,,@SetItem(l_sektion,"NGPC",_ngpc);) \
 ifelse(_bpc,,,@SetItem(l_sektion,"BPC",_bpc);) \
 ifelse(_bpsc,,,@SetItem(l_sektion,"BPSC",_bpsc);) \
 ifelse(_fix,"Y",@SetItem(l_sektion,"FIX",_fix);,)

#define CHZ_WARBES(_row,_depid,_warbes,_fix) \
 l_sektion = "WARBES_"|| LFD_SEKTION; \
 LFD_SEKTION = LFD_SEKTION + 1; \
 @AddSection(l_sektion); \
 ifelse(_row,,,@SetItem(l_sektion,"ZEILE",_row);) \
 @SetItem(l_sektion,"DEPID",_depid); \
 @SetItem(l_sektion,"WARBES",@sprintf(_warbes)); \
 ifelse(_fix,"Y",@SetItem(l_sektion,"FIX",_fix);,)
 
#define CHZ_CZAB(_row,_depid,_naac,_naac_r,_naschl,_namenge,_naansatz,_volprz,_fix) \
 l_sektion = "ZUSATZABG_"|| LFD_SEKTION; \
 LFD_SEKTION = LFD_SEKTION + 1; \
 @AddSection(l_sektion); \
 ifelse(_row,,,@SetItem(l_sektion,"ZEILE",_row);) \
 @SetItem(l_sektion,"DEPID",_depid); \
 @SetItem(l_sektion,"NAAC",_naac); \
 @SetItem(l_sektion,"NAAC_R",ifelse(_naac_r,"Y","Y","N")); \
 ifelse(_naschl,,,@SetItem(l_sektion,"NASCHL",_naschl);) \
 @SetItem(l_sektion,"NAMENGE",_namenge); \
 ifelse(_naansatz,,,@SetItem(l_sektion,"NAANSATZ",_naansatz);) \
 ifelse(_volprz,,,@SetItem(l_sektion,"VOLPRZ",_volprz);) \
 ifelse(_fix,"Y",@SetItem(l_sektion,"FIX",_fix);,)
 
#define CHZ_CBEW(_row,_depid,_nr,_dat,_verm,_fix) \
 l_sektion = "BEWILLIG_"|| LFD_SEKTION; \
 LFD_SEKTION = LFD_SEKTION + 1; \
 @AddSection(l_sektion); \
 ifelse(_row,,,@SetItem(l_sektion,"ZEILE",_row);) \
 @SetItem(l_sektion,"DEPID",_depid); \
 @SetItem(l_sektion,"NR",_nr); \
 @SetItem(l_sektion,"DAT",_dat); \
 ifelse(_verm,,,@SetItem(l_sektion,"VERM",_verm);) \
 ifelse(_fix,"Y",@SetItem(l_sektion,"FIX",_fix);,)

#define CHZ_ZVVDO(_text) \
 l_sektion = "ZVVDO_"|| LFD_SEKTION; \
 LFD_SEKTION = LFD_SEKTION + 1; \
 @AddSection(l_sektion); \
 ifelse(_text,,,@SetItem(l_sektion,"TEXT",_text);,)


/*************************************************************************
Schleife ueber alle Deklarationen einer Sendung 
*/

define(""{""_CDEK_LOOP_VARS""}"",""{"" ""}"")

define(""{""_LOOP_SELECT""}"", ""{"""SELECT \
	cdek_dekid, cdek_stzoll, to_char(cdek_nrsped), to_char(cdek_nrzoll), \
	cdek_dossiernr, to_char(cdek_zollbetr), to_char(cdek_ustbetr), cdek_zollktonr, \
	cdek_ustktonr, to_char(cdek_anldat,'YYYY.MM.DD') || ' '|| cdek_anlzeit, \
	czam_adrid, czam_zamnr, \
	imp.cdad_adrid, emp.cdad_adrid, \
	count(*), \
	max(decode(cdep_depid,1,cdep_vdokart,' ')), \
	max(decode(cdep_depid,1,cdep_vdoktext,' ')), \
	max(decode(cdep_depid,1,cdep_vdoknr,' ')), \
	Substr(max(decode(cdep_depid,1,to_char(cdep_vdokdt,'YYYY.MM.DD'),' ')),1,10), \
	max(decode(cdep_depid,1,cdep_lagerc,' ')) \
FROM cdek_deklkopf, czam_zollamt, cdep_deklpos, \
	cdad_dekladr imp, cdad_dekladr emp \
WHERE cdek_sdgid = :SDGID \
and cdek_adridz = czam_adrid(+) \
and cdek_dekid  = cdep_dekid \
and cdek_dekid  = imp.cdad_dekid(+) \
and 'IM'        = imp.cdad_satid(+) \
and cdek_dekid  = emp.cdad_dekid(+) \
and 'CN'        = emp.cdad_satid(+) \
GROUP BY cdek_dekid, cdek_stzoll, cdek_nrsped, cdek_nrzoll,  \
	cdek_dossiernr, cdek_zollbetr, cdek_ustbetr, cdek_zollktonr, \
	cdek_ustktonr, to_char(cdek_anldat,'YYYY.MM.DD') || ' '|| cdek_anlzeit, \
	czam_adrid, czam_zamnr, \
	imp.cdad_adrid, emp.cdad_adrid \
ORDER BY cdek_dekid  \
INTO :CHZ_DEKID, :CHZ_STZOLL, :CHZ_NRSPED, :CHZ_NRZOLL, \
	:CHZ_DOSSNR, :CHZ_ZOLLBETR, :CHZ_USTBETR, :CHZ_ZKTONR, \
   :CHZ_USTKTONR, :CHZ_ANLDAT, \
	:CHZ_ADRIDZ, :CHZ_ZAMNR, \
	:ADRID_IM, :ADRID_EM,\
	:ZOLLTNR, \
	:CHZ_VDOKART, \
	:CHZ_VDOKTEXT, \
	:CHZ_VDOKNR, \
	:CHZ_VDOKDT, \
	:CHZ_LAGERC"""}"")

define(""{""_LOOP_VARS""}"", ""{""CHZ_DEKID, CHZ_STZOLL, CHZ_NRSPED, CHZ_NRZOLL, \
	CHZ_DOSSNR, CHZ_ZOLLBETR, CHZ_USTBETR, CHZ_ZKTONR, \
   CHZ_USTKTONR, CHZ_ANLDAT, \
   CHZ_DOSSNR, CHZ_ZOLLBETR, CHZ_USTBETR, \
	CHZ_ADRIDZ, CHZ_ZAMNR, \
	ADRID_IM, ADRID_EM,\
	ZOLLTNR, \
	CHZ_VDOKART, \
	CHZ_VDOKTEXT, \
	CHZ_VDOKNR, \
	CHZ_VDOKDT, \
	CHZ_LAGERC""}"")

undefine(""{""_LOOP_RSET""}"")
define(""{""_LOOP_NAME""}"",""{""CHZ-DEKL-SDG: Deklarationen der Sendung""}"")
define(""{""CHZ_DEKL_SDG""}"", _LOOP )

/*************************************************************************
Schleife ueber alle Zoll-Abgaben zu den Deklarationen einer Sendung 
*/
define(""{""_LOOP_SELECT""}"", ""{"""SELECT \
   cdek_dekid, czab_naac, czab_naschl \
	FROM czab_zabgabe, cdek_deklkopf \
	WHERE  czab_dekid = cdek_dekid \
	AND	cdek_sdgid = :SDGID \
	INTO :CHZ_DEKID, :CHZ_ZABART, :CHZ_ZABSCHL" ""}"")

define(""{""_LOOP_VARS""}"",""{""CHZ_DEKID""}"")
undefine(""{""_LOOP_RSET""}"")

define(""{""_LOOP_NAME""}"",""{""CHZ-ZAB-SDG: Zoll-Abgaben der Sendung""}"")
define(""{""CHZ_ZAB_SDG""}"", _LOOP )

/*************************************************************************
Schleife ueber alle Tarifnummern (Positionen) einer Deklaration
*/
define(""{""_LOOP_SELECT""}"", ""{"""SELECT \
   cdep_tarid || ' '|| cdep_tasid \
	FROM cdep_deklpos \
	WHERE  cdep_dekid = :CHZ_DEKID \
	INTO :ZEILE_ZTARIF " ""}"")

define(""{""_LOOP_VARS""}"",""{""ZEILE_ZTARIF""}"")
undefine(""{""_LOOP_RSET""}"")

define(""{""_LOOP_NAME""}"",""{""CHZ-DEKL-POS: Positionen der Deklaration""}"")
define(""{""CHZ_DEKL_POS""}"", _LOOP )

/*************************************************************************
Schleife ueber alle Folgedeklarationen zu einer Deklaration
Liefert alle Folgedeklarationen oder die aktuelle (Nichtfolge)-Deklaration
*/
define(""{""_LOOP_SELECT""}"", ""{"""SELECT \
   cdek_dekid  \
	FROM cdek_deklkopf \
	where cdek_dekid like substr (:l_dekid, 1, \
		decode(instr (:l_dekid,'-',5),0, \
			length (:l_dekid), \
			instr (:l_dekid,'-',5))) || '%' \
	INTO :CHZ_DEKID " ""}"")

define(""{""_LOOP_VARS""}"",""{""CHZ_DEKID""}"")
undefine(""{""_LOOP_RSET""}"")

define(""{""_LOOP_NAME""}"",""{""CHZ-FOLGE-DEKL: Folgedeklarationen zur Deklaration""}"")
define(""{""CHZ_FOLGE_DEKL""}"",""{""l_dekid = @getwert(CHZ_DEKID); ""}"" _LOOP )
