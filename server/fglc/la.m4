/*
Definitionen der Leistungsanforderungs-Generierungs-Makros

23.10.99  rewi  Betreff auf 50 Stellen abschneiden
20.01.00  rewi  Korrektur Ladeauftrag: durchfuehrender User wurde mit 
					 Ladungstyp befuellt
28.01.00  rewi  Erweiterung Umschlag LA-Generierungs-Flag + Variable KZ
24.02.00  rewi  Variables Kennzeichen 2 bei Abrechnung korrigiert
27.02.00  rewi  LA fuer Status-Ereignis ergaenzt
21.02.01  romo  LA fuer Stammdaten ergaenzt
28.02.01  rewi  Generieren Status-LA verschoenert
15.07.01  rewi  Ausfuehren am Server mit Direkt-Option (Druck Etiketten)
20.07.01  rewi  Ausfuehren - Code reduziert , Meldung bei LA-Ausfuehren
08.04.04  stmo  Setzen Belid rausgenommen, SconM Version 1.2 zurueckgeholt
07.05.04  johi  Tuning LA_BEARB Status-Wechsel: exec vor laexec vermeidet fork
20.04.04  mavo  Format LA_ALLG (allgemeine LA generieren)
07.04.04  wekl  Belid als Parameter uebergeben... Wird in das Neue Feld in der sdrx_druckla eingefuegt
03.04.04  wekl  Fehlerkorrektur bei ressetfile - LAFID wird in den Filenamen inkludiert
27.10.04  stmo  xab_pnnid wurde nach Befuellung auf leer gesetzt                                  
14.06.05  wekl  Aenderungen von ROSA korrigiert - Parameter Files am Schluss eingefuegt
09.08.05  wekl  Aenderung in LA_ALLG - Blank bei Feld l_adrid nach dem ' Entfernt (siehe diff)
13.04.06  stmo  Resultatset bei Dirketausfuehrung um HH24:MI erweitert                                 
29.02.08  frth  LA-Anlegen auch mit Hochkomma erlaubt in ktext und text Issue 14735                                 
03.12.08  ankr  Neues Format SXBW_NEU Issue 18433                                 
26.03.10  ankr  Erweiterung Format SXBW_NEU um Abfertigungsstatus Issue 21726                                 
*/

define(`_LA_2´,` 
l_prior  = ifelse($1,,"3",$1);
l_lasid  = ifelse($2,,"",$2);
l_evidenz= ifelse($3,,"0",$3);
l_rmeld  = ifelse($4,,"0",$4);
l_orgidv = ifelse($5,,AG_ID,$5);
l_usridv = ifelse($6,,USRID,"$6");
l_datwvon= ifelse($7,,"",_ref($7));
l_datwbis= ifelse($8,,"",_ref($8));
´)

/* 
LA fuer Abrechnung 
*/

define(`_LA_XAB4´,` 
l_latid  = ifelse($1,,"AB",_ref(`$1´));
l_orgidab= ifelse($2,,"NULL",_ref(`$2´));
/*l_pnnid= ifelse($3,,"NULL",_ref(`$3´));i */
l_pnnid= ifelse($3,,"",_ref(`$3´));
´)

/* kopie von _LA_DR3 damit das original erweitert werden kann ohne dass 
 Abrechnung  _LA_XAB4 verschoben wird */
define(`_LA_XAB_DR3´,`
l_varkz2= ifelse($1,,"",_ref(``$1´´));
´)

/* kopie von _LA_DR2 damit das original erweitert werden kann ohne dass 
 Abrechnung  _LA_XAB4 verschoben wird */
define(`_LA_XAB_DR2´,`
l_repid = ifelse($1,,"",$1);
l_kmtid = ifelse($2,,"",$2);
l_dest  = ifelse($3,,"",_ref(``$3´´));
l_forid = ifelse($4,,"",$4);
l_anz   = ifelse($5,,"NULL",$5);
l_param = ifelse($6,,"",$6);
l_sprid = ifelse($7,,"",$7);
l_gen   = ifelse($8,,"9",$8);
l_varkz1= ifelse($9,,"",_ref(``$9´´));
_LA_XAB_DR3(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))
´)

#define LA_XAB( p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28 ) \
_LA_XAB_m4( `p1´, `p2´, `p3´, `p4´, `p5´, `p6´, `p7´, `p8´, `p9´, `p10´, `p11´, `p12´, `p13´, `p14´, `p15´, `p16´, `p17´, `p18´, `p19´, `p20´, `p21´, `p22´, `p23´, `p24´, `p25´, `p26´, `p27´, `p28´)

define(`_LA_XAB_m4´,`
l_subtyp = $1;
l_orgidf = ifelse($2,,"NULL",$2);
l_usridf = ifelse($3,,"",_ref(``$3´´));
l_adrid  = ifelse($4,,"NULL",$4);
l_satids = ifelse($5,,"",$5);
l_ktext  = ifelse(`$6´,,"",@substr (@sprintf(`_ref_stable(`$6´)´),1,50));
l_text   = ifelse(`$7´,,"",@sprintf(`_ref_stable(`$7´)´));
_LA_2(shift(shift(shift(shift(shift(shift(shift($*))))))))
_LA_XAB_DR2(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))))))))
_LA_XAB4(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($* ))))))))))))))))))))))))))

@reset_vars(LAFID_NEU);

l_xab_bucid = "";
/*l_pnnid = "";*/

if ( @getwert(SDGID) > " " )
	{ l_traeger = "'"|| @getwert(SDGID) || "', NULL, NULL" ; }
else
   { 
		if ( @gesetzt(BUCID) == TRUE )
			{ l_xab_bucid = @getwert(BUCID); }
		l_traeger = "NULL, '"|| @getwert(FARID) || "', '" || 
		@getwert(LTYID) || "'"; 
	}

/* Oracle PL/SQL-Package slaf Prozedur gen_la_xab aufrufen */
l_Sql_String = "BEGIN \
	slaf.set_codid('" || @codid() || "'); \
	slaf.gen_la_xab2('" || l_latid || "','"||
		l_subtyp	|| "', " ||
		l_orgidf	|| ", '" ||
		l_usridf	|| "', " ||
		l_adrid	|| ", replace('" ||
		l_satids	|| "',',',';'), '" ||
		@quote2(l_ktext)|| "', '" ||
		@quote2(l_text)	|| "', " ||
		l_orgidv	|| ", '" ||
		l_usridv	|| "', '" ||
		l_prior	|| "', '" ||
		l_lasid	|| "', '" ||
		l_evidenz	|| "', '" ||
		l_rmeld	|| "', '" ||
		l_datwvon || "', '" ||
		l_datwbis || "', '" ||
		l_varkz1|| "', '" ||
		l_varkz2|| "', " ||
		l_traeger || ", "||
		"NULL, " ||
		l_orgidab || ", '"||
		l_sprid || "', '" ||
		l_repid || "', '" ||
		l_kmtid || "', '" ||
		l_dest  || "', '" ||
		l_forid || "', " ||
		l_anz   || ", '" ||
		l_param || "', '" ||
		l_xab_bucid || "', '" ||
		l_pnnid || "', " ||
		"NULL, " ||
		"NULL, " ||
		"NULL, " ||
		"NULL, " ||
		"NULL, '" ||
		l_gen   || "'); \
		slaf.set_codid(NULL); \
		END;";

		@print(l_Sql_String);   
		if (@SqlImmediate(l_Sql_String) == FALSE)
		{
			return (FALSE);
		}
´)

/* 
LA fuer Sendungsbehandlung Nachnahme
*/

define(`_LA_3´,`
l_gen    = ifelse($1,,"9",$1);
l_varkz1 = ifelse($2,,"",_ref(``$2´´));
´)

define(`LA_SB´,`
l_subtyp = ifelse($1,,"NN",$1);
l_orgidf = ifelse($2,,"NULL",$2);
l_usridf = ifelse($3,,"",_ref(``$3´´));
l_adrid  = ifelse($4,,"",_ref(`$4´));
l_satids = ifelse($5,,"",$5);
l_ktext  = ifelse($6,,"",@substr (@sprintf($6),1,50));
l_text   = ifelse($7,,"",@sprintf($7));
_LA_2(shift(shift(shift(shift(shift(shift(shift($*))))))))
_LA_3(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))))))))

@reset_vars(LAFID_NEU);

if ( @getwert(SDGID) > " " )
	{ l_traeger = "'"|| @getwert(SDGID) || "', NULL, NULL" ; }
else
	{ l_traeger = "NULL, '"|| @getwert(FARID) || "', '" || 
	@getwert(LTYID) || "'"; }

/* Oracle PL/SQL-Package slaf Prozedur gen_la_std aufrufen */
l_Sql_String = "BEGIN \
	slaf.set_codid('" || @codid() || "'); \
	 slaf.gen_la_std('SB','"||
	 l_subtyp	|| "', " ||
	 l_orgidf	|| ", '" ||
	 l_usridf	|| "', '" ||
	 @quote2(l_ktext)|| "', '" ||
	 @quote2(l_text)|| "', " ||
	 l_orgidv	|| ", '" ||
	 l_usridv	|| "', '" ||
	 l_prior	|| "', '" ||
	 l_lasid	|| "', '" ||
	 l_evidenz	|| "', '" ||
	 l_rmeld	|| "', " ||
	 "NULL, " ||
	 "NULL, '" ||
	 l_varkz1|| "', " ||
	 "NULL, " ||
	 l_traeger || ",'"||
	 /* @getwert(BELID) || */ "', '" ||
	 /* @getwert(STOID) || */ "', '" ||
	 /* @getwert(GERID) || */ "', '" ||
	 @getwert(RELATION) || "', '" ||
	 l_adrid|| "', " ||
	 "NULL, " ||
	 "NULL, '" ||
	 /* @getwert(BUCID) || */ "', '" ||
	 /* @getwert(LVEID) || */ "', " ||
	 "NULL, " ||
	 "NULL, " ||
	 "NULL, " ||
	 "NULL, " ||
	 "NULL, '" ||
	 l_gen|| "'); \
	slaf.set_codid(NULL); \
	 END;";
    @print(l_Sql_String);   
	 if (@SqlImmediate(l_Sql_String) == FALSE)
	 {
	 	 return (FALSE);
	 }
´)


/* 
LA fuer Transport
*/

define(`_LA_XTR_3´,` 
l_evidenz= ifelse($1,,"0",$1);
l_rmeld  = ifelse($2,,"0",$2);
l_orgidv = ifelse($3,,AG_ID,$3);
l_usridv = ifelse($4,,USRID,"$4");
l_code1  = ifelse($5,,"",_ref(``$5´´));
l_code2  = ifelse($6,,"",_ref(`$6´));
l_autom  = ifelse($7,,"",@sprintf(_ref(``$7´´)));
l_haupt  = ifelse($8,,"NULL",$8);
l_gen    = ifelse($9,,"",$9);
´)

define(`_LA_XTR_2´,`
l_datwzu_bis = ifelse($1,,"",_ref(``$1´´));
l_adrid_a_ko = ifelse($2,,"",_ref(``$2´´));
l_orgid_a_ko = ifelse($3,,"",_ref(``$3´´));
l_adrid_e_ko = ifelse($4,,"",_ref(``$4´´));
l_orgid_e_ko = ifelse($5,,"",_ref(``$5´´));
l_ktext  = ifelse($6,,"",@substr (@sprintf($6),1,50));
l_text       = ifelse($7,,"",@sprintf($7));
l_prior      = ifelse($8,,"3",$8);
l_lasid      = ifelse($9,,"",$9);
_LA_XTR_3(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))
	       ´)

define(`LA_XTR´,`
l_subtyp     = $1;
l_orgidf     = ifelse($2,,"NULL",$2);
l_usridf     = ifelse($3,,"",_ref(``$3´´));
l_ltyid      = $4;
l_adrid_von  = ifelse($5,,"NULL",$5);
l_datwab_von = ifelse($6,,"",_ref(``$6´´));
l_datwab_bis = ifelse($7,,"",_ref(``$7´´));
l_adrid_nach = ifelse($8,,"NULL",_ref(``$8´´));
l_datwzu_von = ifelse($9,,"",_ref(``$9´´));
_LA_XTR_2(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))

@reset_vars(LAFID_NEU);

/* Oracle PL/SQL-Package slaf Prozedur gen_la_xtr aufrufen */
/* @SqlImmediate("BEGIN \ */
l_Sql_String = "BEGIN \
			slaf.set_codid('" || @codid() || "'); \
	       slaf.gen_la_xtr('TR','"||
		  l_subtyp	|| "', " ||
		  l_orgidf	|| ", '" ||
		  l_usridf	|| "', '" ||
		  l_ltyid    	|| "', " ||
		  l_adrid_von	|| ", '" ||
		  l_datwab_von	|| "', '" ||
		  l_datwab_bis	|| "', " ||
		  l_adrid_nach	|| ", '" ||
		  l_datwzu_von	|| "', '" ||
		  l_datwzu_bis	|| "', '" ||
		  l_adrid_a_ko	|| "', '" ||
		  l_orgid_a_ko	|| "', '" ||
		  l_adrid_e_ko	|| "', '" ||
		  l_orgid_e_ko	|| "', '" ||
		  @quote2(l_ktext)|| "', '" ||
		  @quote2(l_text)|| "', " ||
		  l_orgidv	|| ", '" ||
		  l_usridv	|| "', '" ||
		  l_prior	|| "', '" ||
		  l_lasid	|| "', '" ||
		  l_evidenz	|| "', '" ||
		  l_rmeld	|| "', '" ||
		  l_code1	|| "', '" ||
		  l_code2   || "', '" ||
		  @getwert(SDGID) || "', " ||
		  l_haupt	||", '" ||
		  l_autom	||"', " ||
		  "NULL, '"||
		  l_gen  	||"'); \
			slaf.set_codid(NULL); \
	       END;";
     	       @print(l_Sql_String);   
	       if (@SqlImmediate(l_Sql_String) == FALSE)
	       {
		  return (FALSE);
		  /* @abort("SQL-Error LA fuer Transport"); */
	       }
	       ´)



/*
LA fuer Ladeeinheit
*/


define(`SXBW_NEU´,`
l_subtyp     = $1;
l_orgidf     = ifelse($2,,"NULL",_ref(``$2´´));
l_usridf     = ifelse($3,,"",_ref(``$3´´));
l_adrid_von  = ifelse($4,,"NULL",_ref(``$4´´));
l_adrid_nach = ifelse($5,,"NULL",_ref(``$5´´));
l_dat_beginn_v = ifelse($6,,"",_ref(``$6´´));
l_dat_beginn_b = ifelse($7,,"",_ref(``$7´´));
l_dat_ende_v = ifelse($8,,"",_ref(``$8´´));
l_dat_ende_b = ifelse($9,,"",_ref(``$9´´));
l_vkmid = ifelse($10,,"",_ref(``$10´´));
l_relid = ifelse($11,,"NULL",$11);
l_ktext  = ifelse($12,,"",@substr (@sprintf($12),1,50));
l_text =   ifelse($13,,"",@substr (@sprintf($13),1,2000));
l_adrid_re =ifelse($14,,"NULL",_ref(``$14´´));
l_adrid_ko =ifelse($15,,"NULL",_ref(``$15´´));
l_lekz = ifelse($16,,"",@substr (_ref(``$16´´),1,35));
l_lelaenge = ifelse($17,,"NULL",_ref(_rmhk(``$17´´)));
l_plombenr = ifelse($18,,"",@substr (_ref(``$18´´),1,35));
l_lasid = ifelse($19,,"", _ref(``$19´´));
l_code1  = ifelse($20,,"",_ref(``$20´´));
l_code2  = ifelse($21,,"",_ref(``$21´´));
l_autom  = ifelse($22,,"",@sprintf(_ref(``$22´´)));
l_orgidv = ifelse($23,,AG_ID,$23);
l_usridv = ifelse($24,,USRID,$24);
l_evidenz = ifelse($25,,"0",$25);
l_prior = ifelse($26,,"0",$26);
l_rmeld = ifelse($27,,"0",$27);
l_gen = ifelse($28,,"0",$28);
l_xbwlasid = ifelse($29,,"",_ref(``$29´´));

if ( l_lelaenge == "" ) { l_lelaenge = "NULL"; }
if ( l_adrid_von == "" ) { l_adrid_von = "NULL"; }
if ( l_adrid_nach == "" ) { l_adrid_nach = "NULL"; }
if ( l_adrid_re == "" ) { l_adrid_re = "NULL"; }
if ( l_adrid_ko == "" ) { l_adrid_ko = "NULL"; }

@reset_vars(LAFID_NEU);

/* Oracle PL/SQL-Package slaf Prozedur gen_la_xbw aufrufen */
l_Sql_String = "BEGIN \
			slaf.set_codid('" || @codid() || "'); \
			slaf.gen_la_xbw('LE','"||
			l_subtyp	|| "', " ||
			l_orgidf	|| ", '" ||
			l_usridf	|| "', " ||
			l_adrid_von || ", " ||
			l_adrid_nach || ", \
			slaf.li_to_date('" || l_dat_beginn_v || "'), \
			slaf.li_to_date('" || l_dat_beginn_b || "'), \
			slaf.li_to_date('" || l_dat_ende_v || "'), \
			slaf.li_to_date('" || l_dat_ende_b || "'), " ||
			l_adrid_re || ", " ||
			l_adrid_ko || ", '" ||
			@quote2(l_ktext) || "', '" ||
			@quote2(l_text) || "', " ||
			l_orgidv || ", '" ||
			l_usridv || "', " ||
			l_prior || ", '" ||
			l_lasid || "', " ||
			l_evidenz || ", " ||
			l_rmeld || ", '" ||
			l_code1 || "', '" ||
			l_code2 || "', '" ||
			l_vkmid || "', " ||
			l_relid || ", '" ||
			l_lekz || "', " ||
			l_lelaenge || ", '" ||
			l_plombenr || "', '" ||
			l_autom || "', '" ||
			l_gen || "', '" ||
			l_xbwlasid  	||"'); \
			slaf.set_codid(NULL); \
	       END;";
     	       @print(l_Sql_String);
	       if (@SqlImmediate(l_Sql_String) == FALSE)
	       {
		  return (FALSE);
	       }
	       ´)

define(`SXBW_NEU_EN´,`
	@save_vars( LAFID, BIB, AG_ID, FA_ID );
	l_lafid = @getwert(LAFID_NEU);
	LAFID = l_lafid;
	l_fa_id = ""; l_ag_id = "";
	l_sql = "SELECT \
		SORG.GET_ORGIDH('FA',laf_orgidf), \
		laf_orgidf \
		FROM \
		slaf_leistanf \
		WHERE 1=1 \
		AND laf_lafid = :l_lafid \
		INTO :l_fa_id, :l_ag_id";
	@SqlImmediate(l_sql);
	AG_ID = l_ag_id;
	FA_ID = l_fa_id;

	/* Bibliothek nur aufrufen, wenn vorhanden */
	BIB = "LADEEINHEIT";
	l_modul_prgid = "0";
	l_sql = "select lprg.get_prgid( 'BIB'||chr(12)||:BIB ||chr(12)||'AG_ID'||chr(12)|| :l_ag_id ||chr(12)||'FA_ID'||chr(12)|| :l_fa_id ) from dual into :l_modul_prgid";
	@SqlImmediate(l_sql);
	if ( l_modul_prgid+0 > 0 ) {
		@call(@getwert(BIB),AG_ID,AG_ID,FA_ID,FA_ID);
	} else {
		@print(@sprintf(@nls_gettext_x("li_la.sxbw_neu_en.no_li_call")));
	}
	
	@restore_vars();
	@print("SXBW_N" || "EU_END");
´)


/* 
LA fuer Scannung
*/

define(`_LA_SC2´,`
l_adrid = ifelse($1,,"NULL",_ref(`$1´));
l_gen   = ifelse($2,,"9",$2);
´)
define(`LA_SC´,`
l_subtyp = $1;
l_orgidf = ifelse($2,,"NULL",$2);
l_usridf = ifelse($3,,"",_ref(``$3´´));
l_ktext  = ifelse($4,,"",@substr (@sprintf($4),1,50));
l_text   = ifelse($5,,"",@sprintf($5));
_LA_2(shift(shift(shift(shift(shift($*))))))
_LA_SC2(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))))))

@reset_vars(LAFID_NEU);

/* Oracle PL/SQL-Package slaf Prozedur gen_la_std aufrufen */
/* @SqlImmediate("BEGIN \ */
l_Sql_String = "BEGIN \
			slaf.set_codid('" || @codid() || "'); \
	       slaf.gen_la_std('SC','"||
		  l_subtyp	|| "', " ||
		  l_orgidf	|| ", '" ||
		  l_usridf	|| "', '" ||
		  @quote2(l_ktext)|| "', '" ||
		  @quote2(l_text)|| "', " ||
		  l_orgidv	|| ", '" ||
		  l_usridv	|| "', '" ||
		  l_prior	|| "', '" ||
		  l_lasid	|| "', '" ||
		  l_evidenz	|| "', '" ||
		  l_rmeld	|| "', " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, '" ||
		  @getwert(SDGID) || "', '" ||
		  @getwert(FARID) || "', '" ||
		  @getwert(LTYID) || "', '" ||
		  /* @getwert(BELID) || */ "', '" ||
		  /* @getwert(STOID) || */ "', '" ||
		  /* @getwert(GERID) || */ "', '" ||
		  @getwert(RELATION) || "', " ||
		  l_adrid || ", " ||
		  "NULL, " ||
		  "NULL, '" ||
		  @getwert(BUCID) || "', '" ||
		  /* @getwert(LVEID) || */ "', " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, '" ||
		  l_gen|| "'); \
			slaf.set_codid(NULL); \
	       END;";
     	       @print(l_Sql_String);   
	       if (@SqlImmediate(l_Sql_String) == FALSE)
	       {
		  return (FALSE);
		  /* @abort("SQL-Error LA fuer Scannung"); */
	       }
	       ´)



/* 
LA fuer Sonstiges
*/

define(`_LA_SO2´,`
l_adrid = ifelse($1,,"NULL",_ref(`$1´));
l_gen   = ifelse($2,,"9",$2);
l_code1 = ifelse($3,,"",_ref(``$3´´));
l_code2 = ifelse($4,,"",_ref(``$4´´));
l_latyp = ifelse($5,,"SO",_ref(``$5´´));
´)
define(`LA_SO´,`
l_subtyp = $1;
l_orgidf = ifelse($2,,"NULL",$2);
l_usridf = ifelse($3,,"",_ref(``$3´´));
l_ktext  = ifelse($4,,"",@substr (@sprintf($4),1,50));
l_text   = ifelse($5,,"",@sprintf($5));
_LA_2(shift(shift(shift(shift(shift($*))))))
_LA_SO2(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))))))

@reset_vars(LAFID_NEU);

/* Oracle PL/SQL-Package slaf Prozedur gen_la_std aufrufen */
/* @SqlImmediate("BEGIN \ */
l_Sql_String = "BEGIN \
			slaf.set_codid('"|| @codid() || "'); \
	       slaf.gen_la_std('"|| l_latyp||"','"||
		  l_subtyp	|| "', " ||
		  l_orgidf	|| ", '" ||
		  l_usridf	|| "', '" ||
		  @quote2(l_ktext)|| "', '" ||
		  @quote2(l_text)|| "', " ||
		  l_orgidv	|| ", '" ||
		  l_usridv	|| "', '" ||
		  l_prior	|| "', '" ||
		  l_lasid	|| "', '" ||
		  l_evidenz	|| "', '" ||
		  l_rmeld	|| "', " ||
		  "NULL, "  ||
		  "NULL, '" ||
		  l_code1   || "', '" ||
		  l_code2   || "', '" ||
		  @getwert(SDGID) || "', '" ||
		  @getwert(FARID) || "', '" ||
		  @getwert(LTYID) || "', "; 
		  l_belid = "NULL";
		  if ( @gesetzt(BELID) == TRUE ) 
			{ l_belid = "'" || @getwert(BELID) || "'"; }
		  l_stoid = "NULL"; 
		  if ( @gesetzt(STOID) == TRUE ) 
			{ l_stoid = @getwert(STOID); }
		  l_Sql_String = l_Sql_String || l_belid || "," ||  
		  l_stoid || ",'" ||  
		  /* @getwert(GERID) || */ "', '" ||
		  @getwert(RELATION) || "', " ||
		  l_adrid || ", " ||
		  "NULL, " ||
		  "NULL, '" ||
		  @getwert(BUCID) || "', '" ||
		  /* @getwert(LVEID) || */ "', " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, '" ||
		  l_gen|| "'); \
		  slaf.set_codid(NULL); \
	       END;";
     	       @print(l_Sql_String);   
	       if (@SqlImmediate(l_Sql_String) == FALSE)
	       {
		  return (FALSE);
		  /* @abort("SQL-Error LA fuer Sonstiges"); */
	       }
	       ´)





/*
Allgemeines LA´s LA_ALLG
mavo, 20.04.2004
*/

define(""{""_LA_ALLG2""}"",""{""
l_adrid = ifelse($1,,"NULL",_ref(""{""$1""}""));
l_gen   = ifelse($2,,"9",$2);
l_code1 = ifelse($3,,"",_ref(""{""""{""$3""}""""}""));
l_code2 = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));
l_datei = ifelse($5,,"NULL",_ref(""{""$5""}""));
""}"")
define(""{""LA_ALLG""}"",""{""
l_latyp  = $1;
l_subtyp = $2;
l_orgidf = ifelse($3,,"NULL",$3);
l_usridf = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));
l_ktext  = ifelse($5,,"",@substr (@sprintf($5),1,50));
l_text   = ifelse($6,,"",@sprintf($6));
_LA_2(shift(shift(shift(shift(shift(shift($*)))))))
_LA_ALLG2(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($*)))))))))))))))

@reset_vars(LAFID_NEU);

l_Sql_String = "BEGIN \
					slaf.set_codid('" || @codid() || "'); \
               slaf.gen_la_std('"|| l_latyp||"','"||
                  l_subtyp      || "', " ||
                  l_orgidf      || ", '" ||
                  l_usridf      || "', '" ||
                  @quote2(l_ktext)|| "', '" ||
                  @quote2(l_text)|| "', " ||
                  l_orgidv      || ", '" ||
                  l_usridv      || "', '" ||
                  l_prior       || "', '" ||
                  l_lasid       || "', '" ||
                  l_evidenz     || "', '" ||
                  l_rmeld       || "', " ||
                  "NULL, "  ||
                  "NULL, '" ||
                  l_code1   || "', '" ||
                  l_code2   || "', '" ||
                  @getwert(SDGID) || "', '" ||
                  @getwert(FARID) || "', '" ||
                  @getwert(LTYID) || "', ";
                  l_belid = "NULL";
                  if ( @gesetzt(BELID) == TRUE )
                        { l_belid = "'" || @getwert(BELID) || "'"; }
                  l_stoid = "NULL";
                  if ( @gesetzt(STOID) == TRUE )
                        { l_stoid = @getwert(STOID); }
                  l_Sql_String = l_Sql_String || l_belid || "," ||
                  l_stoid || ",'" ||
                  "', '" ||
                  @getwert(RELATION) || "', " ||
                  l_adrid || ",'" ||
                  l_datei || "', " ||
                  "NULL, '" ||
                  @getwert(BUCID) || "', '" ||
                  "', " ||
                  "NULL, " ||
                  "NULL, " ||
                  "NULL, " ||
                  "NULL, " ||
                  "NULL, '" ||
                  l_gen|| "'); slaf.set_codid(NULL);";

					if ( @getwert(KUNID) > "" ) {
						l_Sql_String = l_Sql_String || " slaf.set_last_lafid_latraeger('KUNID', '" || KUNID || "' );";
					}
					if ( @getwert(KONID) > "" ) {
						l_Sql_String = l_Sql_String || " slaf.set_last_lafid_latraeger('KOND', '" || KONID || "' );";
					}

               l_Sql_String = l_Sql_String || " END;";

               @print(l_Sql_String);
               if (@SqlImmediate(l_Sql_String) == FALSE)
               {
                  return (FALSE);
               }
               ""}"")

^L

/* 
LA fuer Stammdaten
*/

define(`_LA_SD2´,`
l_adrid = ifelse($1,,"NULL",_ref(`$1´));
l_gen   = ifelse($2,,"9",$2);
l_code1 = ifelse($3,,"",_ref(``$3´´));
l_code2 = ifelse($4,,"",_ref(``$4´´));
´)
define(`LA_SD´,`
l_subtyp = $1;
l_orgidf = ifelse($2,,"NULL",$2);
l_usridf = ifelse($3,,"",_ref(``$3´´));
l_ktext  = ifelse($4,,"",@substr (@sprintf($4),1,50));
l_text   = ifelse($5,,"",@sprintf($5));
_LA_2(shift(shift(shift(shift(shift($*))))))
_LA_SD2(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))))))

@reset_vars(LAFID_NEU);

/* Oracle PL/SQL-Package slaf Prozedur gen_la_std aufrufen */
/* @SqlImmediate("BEGIN \ */
l_Sql_String = "BEGIN \
			slaf.set_codid('" || @codid() || "'); \
	       slaf.gen_la_std('SD','"||
		  l_subtyp	|| "', " ||
		  l_orgidf	|| ", '" ||
		  l_usridf	|| "', '" ||
		  @quote2(l_ktext)|| "', '" ||
		  @quote2(l_text)|| "', " ||
		  l_orgidv	|| ", '" ||
		  l_usridv	|| "', '" ||
		  l_prior	|| "', '" ||
		  l_lasid	|| "', '" ||
		  l_evidenz	|| "', '" ||
		  l_rmeld	|| "', " ||
		  "NULL, "  ||
		  "NULL, '" ||
		  l_code1   || "', '" ||
		  l_code2   || "', '" ||
		  @getwert(SDGID) || "', '" ||
		  @getwert(FARID) || "', '" ||
		  @getwert(LTYID) || "', "; 
		  l_belid = "NULL";
		  if ( @gesetzt(BELID) == TRUE ) 
			{ l_belid = "'" || @getwert(BELID) || "'"; }
		  l_stoid = "NULL"; 
		  if ( @gesetzt(STOID) == TRUE ) 
			{ l_stoid = @getwert(STOID); }
		  l_Sql_String = l_Sql_String || l_belid || "," ||  
		  l_stoid || ",'" ||  
		  /* @getwert(GERID) || */ "', '" ||
		  @getwert(RELATION) || "', " ||
		  l_adrid || ", " ||
		  "NULL, " ||
		  "NULL, '" ||
		  @getwert(BUCID) || "', '" ||
		  /* @getwert(LVEID) || */ "', " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, '" ||
		  l_gen|| "'); \
			slaf.set_codid(NULL); \
	       END;";
     	       @print(l_Sql_String);   
	       if (@SqlImmediate(l_Sql_String) == FALSE)
	       {
		  return (FALSE);
		  /* @abort("SQL-Error LA fuer Stammdaten"); */
	       }
	       ´)




/* 
LA fuer Status-Ereignis
*/





define(`_LA_ST2´,`
l_adrid = ifelse($1,,"NULL",_ref(`$1´));
l_gen   = ifelse($2,,"9",$2);
l_code1 = ifelse($3,,"",_ref(``$3´´));
l_code2 = ifelse($4,,"",_ref(``$4´´));
´)

define(`_LA_ST3´,`
	
	l_code	   = ifelse($1,,"",_ref($1));
	l_name	   = ifelse($2,,"",_ref($2));
	l_datum     = ifelse($3,,"",_ref($3));
	l_bemerkung = ifelse($4,,"",_ref($4));
	l_anzahl    = ifelse($5,,0,_ref($5));
	l_vepid     = ifelse($6,,"",_ref($6));
	l_znr       = ifelse($7,,"",_ref($7));
	l_bis       = ifelse($8,,"",_ref($8));
	l_wzeit     = ifelse($9,,0,_ref($9));
	l_location  = ifelse($10,,"",_ref($10));
´)

define(`LA_ST_ER´,`
l_subtyp = $1;
l_orgidf = ifelse($2,,"NULL",$2);
l_usridf = ifelse($3,,"",_ref(``$3´´));
l_ktext  = ifelse($4,,"",@substr (@sprintf($4),1,50));
l_text   = ifelse($5,,"",@sprintf($5));
_LA_2(shift(shift(shift(shift(shift($*))))))
_LA_ST2(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))))))
_LA_ST3(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))))))))))

@reset_vars(LAFID_NEU);

/* Oracle PL/SQL-Package slaf Prozedur gen_la_std aufrufen */
@print(@sprintf(@nls_gettext_x("li_la.la_st_er.call")));
/* @SqlImmediate("BEGIN \ */
l_Sql_String = "BEGIN \
		  slaf.set_codid('" || @codid() || "'); \
		  slaf.gen_la_std('ST','"||
		  l_subtyp	|| "', " ||
		  l_orgidf	|| ", '" ||
		  l_usridf	|| "', '" ||
		  @quote2(l_ktext)|| "', '" ||
		  @quote2(l_text)|| "', " ||
		  l_orgidv	|| ", '" ||
		  l_usridv	|| "', '" ||
		  l_prior	|| "', '" ||
		  l_lasid	|| "', '" ||
		  l_evidenz	|| "', '" ||
		  l_rmeld	|| "', " ||
		  "NULL, "  ||
		  "NULL, '" ||
		  l_code1   || "', '" ||
		  l_code2   || "', '" ||
		  @getwert(SDGID) || "', '" ||
		  @getwert(FARID) || "', '" ||
		  @getwert(LTYID) || "', "; 
		  l_belid = "NULL";
		  if ( @gesetzt(BELID) == TRUE ) 
			{ l_belid = "'" || @getwert(BELID) || "'"; }
		  l_stoid = "NULL"; 
		  if ( @gesetzt(STOID) == TRUE ) 
			{ l_stoid = @getwert(STOID); }
		  l_Sql_String = l_Sql_String || l_belid || "," ||  
		  l_stoid || ",'" ||  
		  /* @getwert(GERID) || */ "', '" ||
		  @getwert(RELATION) || "', " ||
		  l_adrid || ", " ||
		  "NULL, " ||
		  "NULL, '" ||
		  @getwert(BUCID) || "', '" ||
		  /* @getwert(LVEID) || */ "', " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, '" ||
		  l_gen|| "'); \
			slaf.set_codid(NULL); \
		  END;";
		@print(l_Sql_String);   
		if (@SqlImmediate(l_Sql_String) == FALSE)
		{
			return (FALSE);
			/* @abort("SQL-Error LA fuer Sonstiges"); */
		}

		l_lasid_alt = "";
		@SqlImmediate("select laf_lafid, laf_lasid \
				 from slaf_leistanf \
				 where laf_lafid = slaf.last_lafid \
				 INTO :LAFID_NEU, :l_lasid_alt");

     
		if ( (@getwert(LAFID_NEU) > "" ) & 
			  ( l_lasid > "200" ) | (l_code > " ") )
		{
			l_sdgid    = @getwert(SDGID);
			l_farid    = @getwert(FARID);
			l_ltyid    = @getwert(LTYID);
			l_lfzl     = @getwert(ZEILE_ID );
			l_barcd    = @getwert(ZEILE_BARCODE);
			l_laud     = l_subtyp;
			l_Sql_String = "BEGIN \
				spod.set_status('" || LAFID_NEU || "','"||
				l_lauid	|| "', '" ||
				l_sdgid 	|| "', '" ||
				l_lfzl  	|| "', '" ||
				l_farid 	|| "', '" ||
				l_barcd	|| "', '" ||
				l_code 	|| "', '" ||
				l_name 	|| "', slaf.li_to_date('" ||
				l_datum	|| "'), '" ||
				l_bemerkung || "', '" ||
				l_anzahl || "', '" ||
				l_vepid  || "', '" ||
				l_znr    || "', slaf.li_to_date('" ||
				l_bis  	|| "'), '" ||
				l_wzeit	|| "', '" ||
				l_location|| "', " ||
				l_adrid	|| ", '" ||
				l_lasid	|| "', '" ||
				"', '" ||
				"', '" ||
				l_gen2 || "', " ||
				l_orgidv	|| ", '" ||
				l_usridv	|| "', " ||
				"NULL, " ||
				"NULL, " ||
				"NULL, " ||
				"NULL, " ||
				"NULL ); "  ||
				"END;";

				@print(l_Sql_String);   
				if (@SqlImmediate(l_Sql_String) == FALSE)
				{
					return (FALSE);
				}
			if (@SqlImmediate("SELECT spod.last_lafid from dual INTO :POD_LAFID ") == FALSE)
			{
				return (FALSE);
			}

			@print(@sprintf(@nls_gettext_x("li_la.la_st_er.end")));
		}
´)

/* 
LA fuer Zollbehandlung
*/

define(`LA_ZOLL´,`
l_subtyp = $1;
l_orgidf = ifelse($2,,"NULL",$2);
l_usridf = ifelse($3,,"",_ref(``$3´´));
l_ktext  = ifelse($4,,"",@substr (@sprintf($4),1,50));
l_text   = ifelse($5,,"",@sprintf($5));
_LA_2(shift(shift(shift(shift(shift($*))))))
l_gen   = "9";

@reset_vars(LAFID_NEU);

/* Oracle PL/SQL-Package slaf Prozedur gen_la_std aufrufen */
/* @SqlImmediate("BEGIN \ */
l_Sql_String = "BEGIN \
			slaf.set_codid('" || @codid() || "'); \
	       slaf.gen_la_std('ZO','"||
		  l_subtyp	|| "', " ||
		  l_orgidf	|| ", '" ||
		  l_usridf	|| "', '" ||
		  @quote2(l_ktext)|| "', '" ||
		  @quote2(l_text)|| "', " ||
		  l_orgidv	|| ", '" ||
		  l_usridv	|| "', '" ||
		  l_prior	|| "', '" ||
		  l_lasid	|| "', '" ||
		  l_evidenz	|| "', '" ||
		  l_rmeld	|| "', " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, '" ||
		  @getwert(SDGID) || "', '" ||
		  @getwert(FARID) || "', '" ||
		  @getwert(LTYID) || "', '" ||
		  /* @getwert(BELID) || */ "', '" ||
		  /* @getwert(STOID) || */ "', '" ||
		  /* @getwert(GERID) || */ "', '" ||
		  @getwert(RELATION) || "', " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, '" ||
		  "', '" ||
		  "', " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, '" ||
		  l_gen|| "'); \
			slaf.set_codid(NULL); \
	      END;";
     	       @print(l_Sql_String);   
	       if (@SqlImmediate(l_Sql_String) == FALSE)
	       {
		  return (FALSE);
		  /* @abort("SQL-Error ZOLL fuer Sonstiges"); */
	       }
	       ´)




/* 
LA fuer Ausdruck
*/
define(`_LA_DR3´,`
l_varkz2= ifelse($1,,"",_ref(``$1´´));
l_ccmail= ifelse($2,,"",_ref(``$2´´));
l_bccmail= ifelse($3,,"",_ref(``$3´´));
´)

/* Es gibt die KOPIE _LA_XAB_DR2/3. Die Kopieen durefen nicht erweitert werden wegen positional-Parameters
 - nur das letzte darf geaendert werde */
define(`_LA_DR2´,`
l_repid = ifelse($1,,"",$1);
l_kmtid = ifelse($2,,"",$2);
l_dest  = ifelse($3,,"",_ref(``$3´´));
l_forid = ifelse($4,,"",$4);
l_anz   = ifelse($5,,"NULL",$5);
l_param = ifelse($6,,"",$6);
l_sprid = ifelse($7,,"",$7);
l_gen   = ifelse($8,,"9",$8);
l_varkz1= ifelse($9,,"",_ref(``$9´´));
_LA_DR3(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))
´)

define(`LA_DR´,`
l_subtyp = $1;
l_orgidf = ifelse($2,,"NULL",$2);
l_usridf = ifelse($3,,"",_ref(``$3´´));
l_ktext  = ifelse($4,,"",@substr (@sprintf($4),1,50));
l_text   = ifelse($5,,"",@sprintf($5));
l_adrid  = ifelse($6,,"NULL",_ref(`$6´)+0);
_LA_2(shift(shift(shift(shift(shift(shift($*)))))))
_LA_DR2(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($*)))))))))))))))


if ( @getwert(SDGID) > " " )
	{ l_traeger = "'"|| @getwert(SDGID) || "', NULL, NULL" ; }
else
	{ l_traeger = "NULL, '"|| @getwert(FARID) || "', '" || 
	  @getwert(LTYID) || "'"; }

@reset_vars(LAFID_NEU);

l_Sql_String = "BEGIN \
			slaf.set_codid('" || @codid() || "'); \
	       slaf.gen_la_xdr('DR','"||
		  l_subtyp	|| "', " ||
		  l_orgidf	|| ", '" ||
		  l_usridf	|| "', '" ||
		  @quote2(l_ktext)|| "', '" ||
		  @quote2(l_text)|| "', " ||
		  l_orgidv	|| ", '" ||
		  l_usridv	|| "', '" ||
		  l_prior	|| "', '" ||
		  l_lasid	|| "', '" ||
		  l_evidenz	|| "', '" ||
		  l_rmeld	|| "', " ||
		  "NULL, " ||
		  "NULL, '" ||
		  l_varkz1 || "', '" ||
		  l_varkz2 || "', " ||
		  l_traeger || ", '"||
		  @getwert(BELID) || "', '" ||
		  @getwert(STOID) || "', '" ||
		  "', '" ||
		  @getwert(RELATION) || "', " ||
		  l_adrid || ", '" ||
		  l_files || "', '" ||
		  l_sprid || "', '" ||
		  l_repid || "', '" ||
		  l_kmtid || "', '" ||
		  l_dest  || "', '" ||
		  l_forid || "', " ||
		  l_anz   || ", '" ||
		  l_param || "', '" ||
		  l_gen   || "', '" ||
		  l_ccmail || "', '" ||
		  l_bccmail || "'); \
		  slaf.set_codid(NULL); ";
        if ( @getwert(KUNID) > "" ) {
           l_Sql_String = l_Sql_String || " slaf.set_last_lafid_latraeger('KUNID', '" || KUNID || "' );";
        }

        l_Sql_String = l_Sql_String || " END;";
        @print(l_Sql_String);   
        if (@SqlImmediate(l_Sql_String) == FALSE) {
		     return (FALSE);
        }
	       ´)

/* 
LA fuer Umschlag
*/
define(`_LA_UM_3´,`
l_code1  = ifelse($1,,"",_ref(``$1´´));
l_code2  = ifelse($2,,"",_ref(``$2´´));
l_gen    = ifelse($3,,"9",$3);
	´)

define(`LA_UM´,`
l_subtyp = $1;
l_orgidf = ifelse($2,,"NULL",$2);
l_usridf = ifelse($3,,"",_ref(``$3´´));
l_ktext  = ifelse($4,,"",@substr (@sprintf($4),1,50));
l_text   = ifelse($5,,"",@sprintf($5));
_LA_2(shift(shift(shift(shift(shift($*))))))
_LA_UM_3(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))))))

@reset_vars(LAFID_NEU);

/* Oracle PL/SQL-Package slaf Prozedur gen_la_std aufrufen */
/* @SqlImmediate("BEGIN \ */
l_Sql_String = "BEGIN \
			slaf.set_codid('" || @codid() || "'); \
	       slaf.gen_la_std('UM','"||
		  l_subtyp	|| "', " ||
		  l_orgidf	|| ", '" ||
		  l_usridf	|| "', '" ||
		  @quote2(l_ktext)|| "', '" ||
		  @quote2(l_text)|| "', " ||
		  l_orgidv	|| ", '" ||
		  l_usridv	|| "', '" ||
		  l_prior	|| "', '" ||
		  l_lasid	|| "', '" ||
		  l_evidenz	|| "', '" ||
		  l_rmeld	|| "', " ||
		  "NULL, "  ||
		  "NULL, '" ||
		  l_code1   || "', '" ||
		  l_code2   || "', '" ||
		  @getwert(SDGID) || "', '" ||
		  @getwert(FARID) || "', '" ||
		  @getwert(LTYID) || "', " ||
		  "NULL, '" || /* @getwert(BELID) || "', '" || */ 
		  @getwert(STOID) || "', " ||
		  "NULL, " || /* @getwert(GERID) ||  "', '" || */
		  "NULL, " || /* @getwert(RELATION) || "', " || */
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, '" ||
		  @getwert(BUCID) || "', '" ||
		  /* @getwert(LVEID) || */ "', " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, '" ||
		  l_gen|| "'); \
			slaf.set_codid(NULL); \
	      END;";
     	       @print(l_Sql_String);   
	       if (@SqlImmediate(l_Sql_String) == FALSE)
	       {
		  return (FALSE);
		  /* @abort("SQL-Error LA fuer Umschlag"); */
	       }
	       ´)


/* 
LA fuer Ausdruck Ladeauftrag Sendung 
    (Aehnlich wie LA fuer Transport (XTR))
*/

define(`_LA_DRTR_3´,`
l_code1  = ifelse($1,,"",_ref(``$1´´));
l_code2  = ifelse($2,,"",_ref(``$2´´));
l_gen    = ifelse($3,,"",$3);
	´)

define(`_LA_DRTR_2´,`
l_adrid 	= ifelse($1,,"",_ref(``$1´´));
l_ktext  = ifelse($2,,"",@substr (@sprintf($2),1,50));
l_text   = ifelse($3,,"",@sprintf($3));
l_prior  = ifelse($4,,"3",$4);
l_lasid  = ifelse($5,,"",$5);
l_evidenz= ifelse($6,,"0",$6);
l_rmeld  = ifelse($7,,"0",$7);
l_orgidv = ifelse($8,,AG_ID,$8);
l_usridv = ifelse($9,,USRID,"$9");
_LA_DRTR_3(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))
	´)

define(`LA_DRTA´,`
l_orgidf     = ifelse($1,,"NULL",$1);
l_usridf     = ifelse($2,,"",_ref(``$2´´));
l_ltyid      = $3;
l_adrid_von  = ifelse($4,,"NULL",_ref(``$4´´));
l_datwab_von = ifelse($5,,"",_ref(``$5´´));
l_datwab_bis = ifelse($6,,"",_ref(``$6´´));
l_adrid_nach = ifelse($7,,"NULL",_ref(``$7´´));
l_datwzu_von = ifelse($8,,"",_ref(``$8´´));
l_datwzu_bis = ifelse($9,,"",_ref(``$9´´));
_LA_DRTR_2(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))

@reset_vars(LAFID_NEU);

/* Oracle PL/SQL-Package slaf Prozedur gen_la_xtr aufrufen */
l_Sql_String = "BEGIN \
			slaf.set_codid('" || @codid() || "'); \
	       slaf.gen_la_xtr('DR', 'TA', " ||
		  l_orgidf	|| ", '" ||
		  l_usridf	|| "', '" ||
		  l_ltyid    	|| "', " ||
		  l_adrid_von	|| ", '" ||
		  l_datwab_von	|| "', '" ||
		  l_datwab_bis	|| "', " ||
		  l_adrid_nach	|| ", '" ||
		  l_datwzu_von	|| "', '" ||
		  l_datwzu_bis	|| "', '" ||
		  l_adrid     	|| "', " ||
		  "NULL, "  ||
		  "NULL, "  ||
		  "NULL, '" ||
		  @quote2(l_ktext)|| "', '" ||
		  @quote2(l_text)|| "', " ||
		  l_orgidv	|| ", '" ||
		  l_usridv	|| "', '" ||
		  l_prior	|| "', '" ||
		  l_lasid	|| "', '" ||
		  l_evidenz	|| "', '" ||
		  l_rmeld	|| "', '" ||
		  l_code1	|| "','" ||
		  l_code2	|| "','" ||
		  @getwert(SDGID) || "', " ||
		  "NULL , " ||
		  "NULL , " ||
		  "NULL, '" ||
		  l_gen  	||"'); \
			slaf.set_codid(NULL); \
	      END;";
		 @print(l_Sql_String);   
		 if (@SqlImmediate(l_Sql_String) == FALSE)
		 {
		 	return (FALSE);
			  /* @abort("SQL-Error LA fuer Druck Ladeauftrag Sendung"); */
		 }
	´)


/*
LA-Statuswechsel
*/
define(LA_BEARB,` /* LA-Statuswechsel */
while( TRUE == TRUE )
{
    RC = 0;
    l_Lafid = ifelse($1,,"",_ref(``$1´´) );
    l_Latid = ifelse($2,,"",_ref(``$2´´) );
    l_Lauid = ifelse($3,,"",_ref(``$3´´) );
    l_Lasid = ifelse($4,,"",_ref(``$4´´) );
    l_Lmeld = ifelse($5,,"",_ref(``$5´´) );
    l_Lexec = ifelse($6,,"",_ref(``$6´´) );
   
    if ( l_Lafid != "" )
    {
	    LAFID = l_Lafid;
	    @reset_vars(LATID,LAUID,LASID);
    }
    if ( @getwert(LAFID) == "" )
    {
		ifelse(substr($1,0,1),!,`break;´,) 
		@meldung(@nls_gettext_x("li_la.la_bearb.message"));
		return(FALSE); 
    }
   
    if ( l_Latid != "" ) 
       { 
          if ( l_Latid != LATID ) 
	          { break; } 
       } 
    if ( l_Lauid != "" ) 
      { 
          if ( l_Lauid != LAUID )
	          { break; } 
      } 
   
    ifelse($5,,,`
		 if ( l_Lmeld == "Y" )
		 {
			 l_meldung = "LA: " || LAFID || ",Typ: " || LATID || ",Subtyp:    " || LAUID;
			 if ( l_Lasid == "1" )
			 {
				 l_meldung = l_meldung || "\r\n" || "Bearbeiten?";
			 }
			 else 
			 { 
				 if ( l_Lasid == "2" )
				 { 
					 l_meldung = l_meldung || "\r\n" || "Nachbearbeiten?";
				 }
				 else 
				 { 
					 if ( l_Lasid != "" )
					 {
						 l_meldung = l_meldung || "\r\n" || "Status: " || LASID || 
							 " --> " || l_Lasid || " ok?";
					 }
				 } 
			 } 
			
			 if ( @inputjn(l_meldung) == FALSE )
			 {
				 break; 
			 }
		 }
   ´)
   
	@print(@sprintf(@nls_gettext_x("li_la.la_bearb.exec")));
	l_section = "LA" || SEC_ID;
	SEC_ID = SEC_ID + 1;
   ifelse($6,,,`
		if (( l_Lexec == "Y") & (ZZISGUI == "N")) { 
			l_ret = "";
			l_tmp = "exec $TRFL/fglc/li_laexec.sh -l " || LAFID || " -s " || l_Lasid;
				l_return = "";
		 		l_Sql_String = "select snod.la_change_dfueHostname( :LAFID, :l_Lasid , NULL) from dual INTO :l_return";
	       			@SqlImmediate(l_Sql_String);
				if (l_return == "") {
					@print(l_tmp); 
					l_ret = @system(l_tmp); 
				} else {
					@print("DEFAULT-DFUE-Server: (" || l_return || ") :" || l_tmp); 
					l_ret = @system(l_tmp, l_return); 
				}
				@print(@sprintf(@nls_gettext_x("li_var.common.ret_l_ret")));
		} else { 
   ´)
	@AddSection(l_section);
	@SetItem(l_section, "LAFID" , LAFID);
	@SetItem(l_section, "LASID", l_Lasid); 
   ifelse($6,,,`
		} 
   ´)
	break;
}
´)


/* 
LA fuer Lagerbuchungs-Ausdruck
*/

define(`LA_LB´,`
l_subtyp = $1;
l_orgidf = ifelse($2,,"NULL",$2);
l_usridf = ifelse($3,,"",_ref(``$3´´));
l_ktext  = ifelse($4,,"",@substr (@sprintf($4),1,50));
l_text   = ifelse($5,,"",@sprintf($5));
l_adrid  = ifelse($6,,"NULL",$6);
_LA_2(shift(shift(shift(shift(shift(shift($*)))))))
_LA_DR2(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))))))

@reset_vars(LAFID_NEU);

/* Oracle PL/SQL-Package slaf Prozedur gen_la_lb aufrufen */
/* @SqlImmediate("BEGIN \ */
l_Sql_String = "BEGIN \
			slaf.set_codid('" || @codid() || "'); \
	      slaf.gen_la_lb('LB','"||
		  l_subtyp	|| "', " ||
		  l_orgidf	|| ", '" ||
		  l_usridf	|| "', '" ||
		  @quote2(l_ktext)|| "', '" ||
		  @quote2(l_text)|| "', " ||
		  l_orgidv	|| ", '" ||
		  l_usridv	|| "', '" ||
		  l_prior	|| "', '" ||
		  l_lasid	|| "', '" ||
		  l_evidenz	|| "', '" ||
		  l_rmeld	|| "', " ||
		  "NULL, " ||
		  "NULL, '" ||
		  @getwert(LVEID)|| "', " ||
		  "NULL, '" ||
		  @getwert(SDGID) || "', '" ||
		  @getwert(FARID) || "', '" ||
		  LVEID || "', '" ||
		  @getwert(BUCID) || "', '" ||
		  @getwert(JOBID) || "', " ||
		  l_adrid || ", '" ||
		  l_files || "', '" ||
		  l_sprid || "', '" ||
		  l_repid || "', '" ||
		  l_kmtid || "', '" ||
		  l_dest  || "', '" ||
		  l_forid || "', " ||
		  l_anz   || ", '" ||
		  l_param || "', '" ||
		  l_gen   || "'); \
			slaf.set_codid(NULL); \
	      END;";
     	       @print(l_Sql_String);   
	       if (@SqlImmediate(l_Sql_String) == FALSE)
	       {
		  return (FALSE);
		  /* @abort("SQL-Error LA fuer Lagerbuchungs-Ausdruck"); */
	       }
	       ´)


/* 
LA fuer Datenuebermittlung
*/

define(`_LA_UB_2´,`l_gen   = ifelse($1,,"9",$1);
l_adrid  = ifelse($2,,"NULL",_ref(`$2´));
l_varkz1 = ifelse($3,,"",_ref(``$3´´));
l_varkz2 = ifelse($4,,"",_ref(``$4´´));
l_lafidv = ifelse($5,,"",_ref(``$5´´));
´)

define(`LA_UB´,`
l_subtyp = $1;
l_orgidf = ifelse($2,,"NULL",_ref(``$2´´));
l_usridf = ifelse($3,,"",_ref(``$3´´));
l_ktext  = ifelse($4,,"",@substr (@sprintf($4),1,50));
l_text   = ifelse($5,,"",@sprintf($5));
_LA_2(shift(shift(shift(shift(shift($*))))))
_LA_UB_2(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))))))

@reset_vars(LAFID_NEU);

/* Oracle PL/SQL-Package slaf Prozedur gen_la_std aufrufen */
/* @SqlImmediate("BEGIN \ */
l_Sql_String = "BEGIN \
			slaf.set_codid('" || @codid() || "'); \
	      slaf.gen_la_std('DU','"||
		  l_subtyp	|| "', " ||
		  l_orgidf	|| ", '" ||
		  l_usridf	|| "', '" ||
		  @quote2(l_ktext)|| "', '" ||
		  @quote2(l_text)|| "', " ||
		  l_orgidv	|| ", '" ||
		  l_usridv	|| "', '" ||
		  l_prior	|| "', '" ||
		  l_lasid	|| "', '" ||
		  l_evidenz	|| "', '" ||
		  l_rmeld	|| "', " ||
		  "NULL, " ||
		  "NULL, '" ||
		  l_varkz1 || "', '" ||
		  l_varkz2 || "', '" ||
		  @getwert(SDGID) || "', '" ||
		  @getwert(FARID) || "', '" ||
		  @getwert(LTYID) || "', '" ||
		  /* @getwert(BELID) || */ "', '" ||
		  @getwert(STOID) ||  "', '" ||
		  /* @getwert(GERID) || */ "', '" ||
		  @getwert(RELATION) || "', " ||
		  l_adrid || ", " ||
		  "NULL, " ||
		  "NULL, '" ||
		  @getwert(BUCID) || "', '" ||
		  /* @getwert(LVEID) || */ "', '" ||
		  @getwert(JOBID) || "', '" ||
		  l_lafidv || "', " ||
		  "NULL, " ||
		  "NULL, " ||
		  "NULL, '" ||
		  l_gen|| "'); \
			slaf.set_codid(NULL); \
	      END;";
     	       @print(l_Sql_String);   
	       if (@SqlImmediate(l_Sql_String) == FALSE)
	       {
		  return (FALSE);
		  /* @abort("SQL-Error LA fuer Sonstiges"); */
	       }
	       ´)

