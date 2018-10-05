/*
Definitionen Makros fuer Generierungsformate (Fahrt, Sendungen usw)
*/

/*
	28.08.99 WOSC Anlgen Sendung setzen von sdg_orgid geaendert
	18.10.99 rewi Anlgen Lademittelbewegung neu ergaenzt
	03.11.99 rosa Anlegen Sendung und Sendungsbeschreibungszeilen erweitert
	03.11.99 wosc Erweiteren Anlegen von Vekehrsmittelstrecken um eta,ets,ladeschluss
	03.11.99 wosc Erweiteren Anlegen von Stops mit Soll Bis Datum
	14.10.00 rewi Ergaenzen SDG_NN-Format fuer Nachnahme
	      00 wosc Status-Formate ergaenzt
	28.02.01 rewi Status-Formate optisch verschoenert
	  .04.01 rewi Codeumsetzung Format auch fuer Client aktiviert (substr)
	05.11.01 rosa Textadressen anlegen
	10.11.01 rewi Format LA_SUCH - Servertauglich gemacht
	01.01.02 rewi Format Sendung anlegen - Ende - Pruefmodul aufrufen ueber Parameter
	10.01.02 rewi Anlegen Stop hat nicht funktioniert, wenn sto_sort mit Nachkommastellen war
      18.10.02 hemo Anlegen Sdg.beschr.zeile um sdb_gewpfl, sdb_lveid, sdb_artnr und sdb_fgstnr erweitert
      08.12.02 vach Format DIFF_ZEIT_TAGE
      08.02.03 vach Format SAWB_NEU
      08.02.03 vach Format SAWB_NEU_END
      10.02.03 vach Format SAWA_NEU
      10.02.03 vach Format SAWR_NEU
      20.02.03 vach Format SGEO_DIST
      24.02.03 vach Format SGEO_XY
      27.02.03 vach Format SAWA_NEU mit Anlegen von Textadressen erweitert
      03.03.03 vach Format SVMG fuer Pflichtgewicht von Sendungen
      15.05.03 johi Format DIFF_ZEIT_TAGE, letzter Parameter (8) optional.
      05.06.03 johi Format POD-Info - Loop korrigiert (Akzent vor _LOOP)
      03.07.03 dafa Formate SCONTEXT und RCONFIG eingefuegt
      13.10.03 vach Format SKAL_NEU fuer Anlegen in der Tabelle SKAL_KALKULATION
      18.10.03 vach Format SKAL_NEU fuer Anlegen in der Tabelle SKAL_KALKULATION - KM_MAUT hat gefaehlt
      18.11.03 wosc Format SDG_KOP
      19.11.03 wosc Schleife SHI_INFO
      03.12.03 wekl Fehlerkorrektur bei Sendung anlegen, Stellplatz auch mit "!"
      06.12.03 vach Format OPT_FAHRT - sternfoermige Optimierung. Das Package opt_tf befindet sich z.Z. im Schema MOSOLF
                    auf TFE. Die Installationsroutinen fuer die Views und das Package befinden sich in
                    G:\Administration\Kunden\Mosolf\Projektplanung-Dokumentation\Optimierung\*.sql. Nach Absprache mit
                    romo werden diese kuenftig in SPED uebernommen.
      19.12.03 wekl Anlegen Sendungstexte und Lesen Sendungstexte eingefuegt
      13.01.04 romo Format Anlegen Codeumsetzung (CODEUMS_NEU) erstellt
      29.01.04 wekl Fehlerkorrektur bei Lesen Sendungstext auf Sendungsbeschreibung ( Parameter 2 und 3 vertauscht )
		12.04.04 romo eta2 und eta3 in sawb_neu aufgenommen (waren zwar als Para
		              definiert, wurden aber nicht verwendet)
		14.06.04 romo Format fuer Anlegen Hinweistexte zur Sendung
		02.07.04 romo Format zum Konvertieren eines Datum
	ss19.08.04 romo Fehlermeldungen bei CODEUMS_NEU verbessert
		19.08.04 romo Fehlerkorrektur Parameter bei VST_NEU
		22.09.04 stmo LCODE um Parameter Fallback-Adresse erweitert
		14.12.04 stmo Neue Formate
		              PNN_PUT Anlegen Kopfzeile Nachnahme
		              PNN_ADD Anlegen Zusatzzeile Nachnahme
		              PNN_DEL Loeschen Zeilen Nachnahme eines Nachnahmetyp
	 20ss12.04 MAVO Format LESEN-RECID liefert einen Record einer Generischen Tabelle
         26.01.05 MAVO Parameter fuer LESEN-RECID und LESEN-VALUE auf Variable mit ! umbauen
      27.01.05 dafa Format RCONFIG erweitert ( cbus.resolve_config_domain() )
      28.01.05 ANHE Ergaenzungen im define fuer SBG_GEFAHR
      01.02.05 dafa Format SETACL eingefuegt
      02.03.05 wekl Meldung in SDG_KOP fuer Oracleversion < 9.2 ausgebaut, da auch zu 8.1.7 kompartible
                    Issue 6084
      10.03.05 mavo Issue 7949 / put_pnn --> 8. Parameter l_adrids auf l_adrid geaendert
      11.04.05 mavo Issue 8402 / snum.get_next_key -> get_next_key_lim wegen NULL-Werte
		    + Konstanten auf temp-Variablen ungebaut
      13.06.05 dafa Format SCONTEXT_ADRID eingefuegt
      26.07.05 hemo Korrektur bzgl. NVL-Behandlung bei l_barcd, l_gen2 und l_ebene
                    da es sich hier um alphanumerische und nicht um numerische Feldtypen handelt
      14.11.05 mavo Issue 10499 / SDG_NEU Ermittlung Variabler SDGID aus get_next_key_lim
      20.02.06 mavo Issue 8305 / Formate SMR-DEL und SRM_ADD (Frachtsimulation)
      02.05.06 mavo Issue 12353 / Formate SSPL-DEL und SSPL-RELEASE (Sendungssplit)
      10.05.06 mavo Issue 12592 / bei Frachtsimulation ID bei FARID_NEU/SDG_NEU um # erweitern
      15.05.06 mavo Issue 12594 / bei Generierung aus Frachtsimulation far_simid und sdg_simid  
      01.06.06 dafa Issue 12590 / Original-Key vom Produktivsystem (mavo)
      01.06.06 dafa Format SOPT_STOPS_SORT eingefuegt
      08.08.06 mavo Issue 10500 / LADID_NEU aus Funktion last_ladid befuellen
      17.08.06 wekl Issue 13355 / Anlegen Lademittel erweitert um opt1, opt2 und gegenref
      24.10.06 dafa Issue 13971 / Format SIM_GET_SGGORIG eingefuegt
      23.04.07 ankr Issue 14733 / Ergaenzung frachtpflichtiges Volumen (CBMPFL) in SDB_NEU 
      20.10.07 frth Issue 11227 SDH_NEU sdh_zusatz ist 1.000 Zeichen lang
      21.10.07 frth Issue 15316 Codeums-Seq mit VS
      21.10.07 frth Issue 16021 SDB_NEU mit getwert ZEILE_ID
		28.04.08 ankr Issue 17739 Ergaenzung FAHRT_NEU mit Zeitzonen-Spalten
		28.04.08 ankr Issue 17739 Ergaenzung SDG_NEU mit Zeitzonen-Spalten
		16.08.08 frth Issue 18513 SDB_NEU ZEILE_ID selbst ermitteln
		03.10.08 frth Issue 4811 bei jedem call die Variable BIB setzten
		12.11.08 ankr Issue 18442 neues Format SVKB_NEU (VKM-Belegungssatz anlegen) 
		14.11.08 ankr Issue 18433 Erweiterung Format GEBIET um 3. Parameter  
							(Kennzeichen, wo das Gebiet angelegt werden soll: auf Fahrt oder Ladeeinheit
		15.12.08 anhe Issue 19255 Erweiterung SBG_GEFAHR um SBG_FMENGE und SBG_TUNNEL
		16.04.09 rune Issue 20200 Korrektur Format SDB_NEU ZEILE_ID fuer neue SDGID muss 0 liefern
	28.04.09 frth Issue 19974 LAFID in Format FAHRT_NEU und SDG_NEU
	08.06.09 frth Issue 20005 Neus Format LI_DISPO_LE_TR fuer LI-Aufruf pro TR einer LE
)
*/

/*
Format fuer Generieren Fahrt
*/


define(""{""FAHRT_NEU_2""}"",""{""
	 ifelse(_rmhk($1),,l_FAHRTTEXT_YN="N";,l_FAHRTTEXT_YN="Y";l_FAHRTTEXT = @sprintf(_ref(""{""$1""}""));)
	 ifelse(_rmhk($2),,l_FAHRTLADETEXT_YN="N";,l_FAHRTLADETEXT_YN="Y";l_FAHRTLADETEXT= @sprintf(_ref(""{""$2""}""));)
	 ifelse(_rmhk($2),,l_FAHRTLADETEXT_YN="N";,l_FAHRTLADETEXT_YN="Y";l_FAHRTLADETEXT= @sprintf(_ref(""{""$2""}""));)
	 ifelse($3,,l_FAR_RELID_YN="N";,l_FAR_RELID_YN="Y";l_FAR_RELID= _ref(""{""$3""}"");)
	 ifelse(_rmhk($4),,l_FAHRT_VON_TZ_YN="N";,l_FAHRT_VON_TZ_YN="Y";l_FAHRT_VON_TZ = _ref(""{""$4""}"");)
	 ifelse(_rmhk($5),,l_FAHRT_BIS_TZ_YN="N";,l_FAHRT_BIS_TZ_YN="Y";l_FAHRT_BIS_TZ = _ref(""{""$5""}"");)
""}"")

define(""{""FAHRT_NEU""}"",""{""
	 {
/* Initialisierungen fuer Format VST_NEU */
	 l_vst_sort = 0;

/* Wegsichern , resetten aktueller Fahrtwerte  */
	 @save_vars(BIB,FARID, FAHRTSTATUS,AG_ID,DISPONENT,FAHRTBEZ,FAHRTTYP,FAHRT_VON,FAHRT_BIS, FRACHTFUEHRER, FAHRTTEXT, FAHRTLADETEXT, LAFID, FAHRTSTATUS_ALT);
    ifelse(_rmhk($2),,l_FAHRTSTATUS_YN="N";,l_FAHRTSTATUS_YN="Y";l_FAHRTSTATUS = $2;)
	 ifelse(	$3,,l_AG_ID_YN="N";l_AG_ID = @getwert(AG_ID);,l_AG_ID_YN="Y";l_AG_ID = _ref(""{""$3""}"");)
	 ifelse(_rmhk($4),,l_DISPONENT_YN="N";,l_DISPONENT_YN="Y";l_DISPONENT = $4;)
	 ifelse(_rmhk($5),,l_FAHRTBEZ_YN="N";,l_FAHRTBEZ_YN="Y";l_FAHRTBEZ = @substr (@sprintf(_ref(""{""$5""}"")),1,35);)
    ifelse(_rmhk($6),,l_FAHRTTYP_YN="N";,l_FAHRTTYP_YN="Y";l_FAHRTTYP = _ref(""{""$6""}"");)
    ifelse(_rmhk($7),,l_FAHRT_VON_YN="N";,l_FAHRT_VON_YN="Y";l_FAHRT_VON = @sprintf(_ref(""{""""{""$7""}""""}""));)
    ifelse(_rmhk($8),,l_FAHRT_BIS_YN="N";,l_FAHRT_BIS_YN="Y";l_FAHRT_BIS = @sprintf(_ref(""{""""{""$8""}""""}""));)
	 ifelse(_rmhk($9),,l_FRACHTFUEHRER_YN="N";,l_FRACHTFUEHRER_YN="Y";l_FRACHTFUEHRER = _ref(""{""$9""}"");)
	 FAHRT_NEU_2(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))
	 @reset_vars(FAHRTBEZ,FAHRTTYP,FAHRT_VON,FAHRT_BIS, FRACHTFUEHRER, FAHRTTEXT, FAHRTLADETEXT, FAHRTSTATUS_ALT );
l_farid = "";
l_vs = "";
l_farid_temp = "FARID";
l_leer_temp  = "";
l_yes_temp   = "Y";
l_CurNum = @SqlOpenCursor(HSQL);
@SqlPLSQL(l_CurNum,HSQL, "snum.get_next_key_lim(:l_farid_temp, :l_AG_ID,:l_leer_temp,:SYS_DATUM, :l_yes_temp, :l_farid,:l_vs)");
@SqlCloseCursor(l_CurNum, HSQL);
	@print(@sprintf(@nls_gettext_x("li_am.fahrt_neu.snum_getnext")));
if ( @getwert(l_vs ) == "-1")
{
     l_farid = "-1";
}
if ( @getwert(l_farid ) == "-1")
{
	 l_ret = @SqlImmediate("SELECT cfg_cfeld || '-'  \
			|| sseq_farid.nextval   \
			FROM scfg_config  \
			WHERE cfg_cfgid = 'VS'  \
	      INTO :FARID_NEU");

}
else
{
	if ( @getwert(l_vs ) == "FARID_VAR")
	{
		FARID_NEU = l_farid;
	}
	else
	{
		FARID_NEU = l_vs || "-" || l_farid;
	}
}

/* Issue 12592 Start --> wenn SimulationsID gesetzt, dann Farid um # ergaenzen */
l_simid_wc = "";
if ( @gesetzt(SIMID_WC) == TRUE )
	{
                l_simid_wc = @getwert(SIMID_WC);
			@print("Simid WorkCopy: " || l_simid_wc );
		if (l_simid_wc != "")
		{
			FARID_NEU = "#" || @getwert(FARID_NEU);
			@print(@sprintf(@nls_gettext_x("li_am.fahrt_neu.simid")));
		}
	}
/* Issue 12592 Ende  */

l_Sql = "  \
INSERT INTO sfar_fahrt  \
(  \
    FAR_FARID  \
,   FAR_USRID  \
,   FAR_ORGID  \
,   FAR_FTYID  \
,   FAR_FRFID  \
,   FAR_TEXT  \
,   FAR_DATVON  \
,   FAR_DATBIS  \
,   FAR_ARCHIV  \
,   FAR_AEND  \
,   FAR_BEZ  \
,   FAR_LASID  \
,   FAR_TEXTLAD  \
,   FAR_RELID  \
,   FAR_DATVON_TZNAME  \
,   FAR_DATBIS_TZNAME  \
,   FAR_SIMID  \
)  \
VALUES  \
(  \
    :FARID_NEU ";
if ( l_DISPONENT_YN == "Y" )  { l_Sql = l_Sql || ",:l_DISPONENT"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_AG_ID_YN == "Y" )  { l_Sql = l_Sql || ",:l_AG_ID"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_FAHRTTYP_YN == "Y" )  { l_Sql = l_Sql || ",:l_FAHRTTYP"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_FRACHTFUEHRER_YN == "Y" )  { l_Sql = l_Sql || ",:l_FRACHTFUEHRER"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_FAHRTTEXT_YN == "Y" )  { l_Sql = l_Sql || ",:l_FAHRTTEXT"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_FAHRT_VON_YN == "Y" )  { l_Sql = l_Sql || ",tf_util.str_to_date(:l_FAHRT_VON)"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_FAHRT_BIS_YN == "Y" )  { l_Sql = l_Sql || ",tf_util.str_to_date(:l_FAHRT_BIS)"; } else { l_Sql = l_Sql || ",NULL"; }
l_Sql = l_Sql || ",   NULL  \
,   SYSDATE ";
if ( l_FAHRTBEZ_YN == "Y" )  { l_Sql = l_Sql || ",:l_FAHRTBEZ"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_FAHRTSTATUS_YN == "Y" )  { l_Sql = l_Sql || ",:l_FAHRTSTATUS"; FAHRTSTATUS = l_FAHRTSTATUS; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_FAHRTLADETEXT_YN == "Y" )  { l_Sql = l_Sql || ",:l_FAHRTLADETEXT"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_FAR_RELID_YN == "Y" )  { l_Sql = l_Sql || ",:l_FAR_RELID"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_FAHRT_VON_TZ_YN == "Y" )  { l_Sql = l_Sql || ",:l_FAHRT_VON_TZ"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_FAHRT_BIS_TZ_YN == "Y" )  { l_Sql = l_Sql || ",:l_FAHRT_BIS_TZ"; } else { l_Sql = l_Sql || ",NULL"; }
l_Sql = l_Sql || ",:l_simid_wc";
l_Sql = l_Sql || " )";

/* @print(l_Sql); */ 
@print(@sprintf(@nls_gettext_x("li_am.fahrt_neu.insert")));
if (@SqlImmediate(l_Sql) == FALSE)
	{
		return(0-72);
	 }
""}"")

define(""{""FAHRT_NEU_END""}"",""{""

	FARID = FARID_NEU;
/*	if ( @gesetzt(FA_ID) == TRUE ) */
		{
   		l_hCur = @SqlOpenCursor(HSQL);

   		@SqlPrepareAndExecute (l_hCur, HSQL,
      		"SELECT org_orgid from sorg_t_einheit  \
      		 WHERE org_oetid = 'FA'  \
      		START WITH org_orgid = :AG_ID  \
      		CONNECT BY PRIOR org_orgidh = org_orgid  \
      		INTO :FA_ID");

			@SqlFetchNext(l_hCur, HSQL);
   		@SqlCloseCursor(l_hCur, HSQL);

		 }
	BIB = "FAHRT";
	@call(@getwert(BIB),AG_ID,AG_ID,FA_ID,FA_ID);
	@restore_vars();
	@print(@sprintf(@nls_gettext_x("li_am.fahrt_neu_end.end")));
	}
""}"")





/*
Format fuer Generieren Gebiet zu einer Fahrt oder Ladeeinheit
*/

define(""{""GEBIET_NEU""}"",""{""
	 {
	 @save_vars(GEBIET);
    GEBIET = $1;
    l_auto =  ifelse($2,"Y",1,0);
	 l_objekt = ifelse($3,,"FAR",$3);
if (l_objekt == "FAR")
{
		l_Sql_String = "  \
		INSERT INTO sfav_farvar  \
		(  \
			FAV_FARID  \
		,   FAV_TFELD  \
		,   FAV_CODE  \
		,   FAV_AEND  \
		,   FAV_USRID  \
		,   FAV_AUTO  \
		)  \
		VALUES  \
		(  \
			:FARID_NEU  \
		,	 'laf_code1'  \
		,   :GEBIET  \
		,   SYSDATE  \
		,   :USRID  \
		,   :l_auto  \
		)";
}
if (l_objekt == "LE")
{
		l_Sql_String = "  \
		INSERT INTO sbwv_bewvar  \
		(  \
  		  BWV_LAFID  \
		,   BWV_TFELD  \
		,   BWV_CODE  \
		,   BWV_AEND  \
		,   BWV_USRID  \
		,   BWV_AUTO  \
		)  \
		VALUES  \
		(  \
  			 :LAFID_NEU  \
		,	 'laf_code1'  \
		,   :GEBIET  \
		,   SYSDATE  \
		,   :USRID  \
		,   :l_auto  \
		)";
}
/* @print(l_Sql_String); */
if ((l_objekt == "FAR") & (@getwert(FARID_NEU) != "") | (l_objekt == "LE") & (@getwert(LAFID_NEU) != ""))
{
		@print(@sprintf(@nls_gettext_x("li_am.gebiet_neu.insert")));
		if (@SqlImmediate(l_Sql_String) == FALSE)
			{
				return(0-72);
	 		}
}
else
{
		@print(@sprintf(@nls_gettext_x("li_am.gebiet_neu.error")));
}
@restore_vars();
}
""}"")
/*
Format fuer Generieren Verkehrsmittelstrecke
*/

define(""{""VST_2""}"",""{""
	l_VSTDATVON = "";
	l_VSTDATBIS = "";
	l_VSTLADESCHLUSS = "";
	ifelse(_rmhk($1),,l_VSTDATVON_YN = "N";,l_VSTDATVON_YN = "Y";l_VSTDATVON = @sprintf(_ref(""{""$1""}""));)
	ifelse(_rmhk($2),,l_VSTDATBIS_YN = "N";,l_VSTDATBIS_YN = "Y";l_VSTDATBIS =@sprintf( _ref(""{""$2""}""));)
	ifelse(_rmhk($3),,l_VSTLADESCHLUSS_YN = "N";,l_VSTLADESCHLUSS_YN = "Y";l_VSTLADESCHLUSS = @sprintf(_ref(""{""$3""}""));)
	/*11=vkmid2*/ ifelse(_rmhk($4),,l_vkmid2 = "";,l_vkmid2 = @sprintf(_ref(""{""$4""}""));)
	/*12=bez2*/   ifelse(_rmhk($5),,l_bez2   = "";,l_bez2   = @sprintf(_ref(""{""$5""}""));)
""}"")

define(""{""VST_NEU""}"",""{""
        {

/* Parameterabarbeitung */
	 l_ret = @SqlImmediate("SELECT cfg_cfeld || '-'  \
			|| sseq_vstid.nextval   \
			FROM scfg_config  \
			WHERE cfg_cfgid = 'VS'  \
	      INTO :VSTID_NEU");
/* Initialisiert in FAHRT_NEU */
		l_vst_sort = l_vst_sort + 1;
                l_tmpsort= "Select nvl(max(vst_sort),0) + 1 from svst_vkmstop \
                        where vst_farid = :FARID_NEU into :l_vst_sort";

					 @print(@sprintf(@nls_gettext_x("li_am.vst_neu.sortnr")));
                if (@SqlImmediate(l_tmpsort) == FALSE)
                {
                        return (0-72);
                }

	ifelse(_rmhk($1),,l_VKMID_YN="N";,l_VKMID_YN="Y";l_VKMID = $1;)
	ifelse(_rmhk($2),,l_BEZ_YN="N";,l_BEZ_YN="Y";l_BEZ = @sprintf(_ref(""{""$2""}""));)
	ifelse(_rmhk($3),,l_FAHRER_YN="N";,l_FAHRER_YN="Y";l_FAHRER = _ref(_rmhk(""{""$3""}""));)
	ifelse(_rmhk($4),,l_STOIDV_ADR_YN="N";,l_STOIDV_ADR_YN="Y";l_STOIDV_ADR = _ref(_rmhk(""{""$4""}""));)
	ifelse(_rmhk($5),,l_STOIDN_ADR_YN="N";,l_STOIDN_ADR_YN="Y";l_STOIDN_ADR = _ref(_rmhk(""{""$5""}""));)
	l_VKMIDKZ = ifelse($6,,"",_ref(""{""$6""}""));
	if ( l_VKMIDKZ == "" ) { l_VKMIDKZ_YN = "N"; } else { l_VKMIDKZ_YN = "Y"; }
	l_VKMIDKZINT = ifelse($7,,"",_ref(""{""$7""}""));
	if ( l_VKMIDKZINT == "" ) { l_VKMIDKZINT_YN = "N"; } else { l_VKMIDKZINT_YN = "Y"; }
   VST_2(shift(shift(shift(shift(shift(shift(shift($*))))))))

	@print(@sprintf(@nls_gettext_x("li_am.vst_neu.values1")));
	@print(@sprintf(@nls_gettext_x("li_am.vst_neu.values2")));
	if ( l_VKMIDKZ_YN == "Y" )
		{
			l_VKMID = "";
			l_Sql = "  \
			select vkm_vkmid \
			from svkm_vkm  \
			where vkm_amtkz  = :l_VKMIDKZ  \
			ORDER BY NVL(vkm_sperre,0) \
			into :l_VKMID";

			if (@SqlImmediate(l_Sql) == FALSE)
			{
				return(0-72);
			}
		}
		else
		{
			if ( l_VKMIDKZINT_YN == "Y" )
			{
				l_VKMID = "";
				l_Sql = "  \
				select vkm_vkmid \
				from svkm_vkm  \
				where vkm_vkmkz  = :l_VKMIDKZINT  \
				into :l_VKMID";

				if (@SqlImmediate(l_Sql) == FALSE)
				{
					return(0-72);
				}
			}
		}

	if ( l_VKMID != "")
	{
		l_VKMID_YN = "Y";
	}

	l_STOIDV_YN = "N";
	l_STOIDN_YN = "N";
	l_STOIDV = 0;
	l_STOIDN = 0;

	if ( l_STOIDV_ADR_YN == "Y" )
	{
		l_STOIDV_YN = "N";
		l_hCur = @SqlOpenCursor(HSQL);
   	if ( @SqlPrepareAndExecute (l_hCur, HSQL,
			" SELECT vst_stoidv, 'Y'  \
			FROM	 svst_vkmstop,ssto_stop  \
			WHERE  vst_farid = :FARID_NEU  \
		   AND    vst_stoidv = sto_stoid  \
			AND	 vst_farid = sto_farid  \
			AND	 sto_adrid = :l_STOIDV_ADR  \
			ORDER BY STO_SORT desc  \
			INTO	 :l_STOIDV,:l_STOIDV_YN	") == 0 )
			{
				return(0-72);
			}
		@SqlFetchNext(l_hCur, HSQL);
   	@SqlCloseCursor(l_hCur, HSQL);

		if ( l_STOIDV_YN == "N" )
		{
/* Schau bei den Nachstops */
			l_hCur = @SqlOpenCursor(HSQL);
   		if ( @SqlPrepareAndExecute (l_hCur, HSQL,
			"SELECT vst_stoidn, 'Y' \
			FROM	 svst_vkmstop,ssto_stop \
			WHERE  vst_farid = :FARID_NEU \
		   AND    vst_stoidn = sto_stoid \
			AND	 vst_farid = sto_farid \
			AND	 sto_adrid = :l_STOIDV_ADR \
		   ORDER BY sto_sort desc \
			INTO	 :l_STOIDV,:l_STOIDV_YN" ) == 0 )
			{
				return(0-72);
			}
			@SqlFetchNext(l_hCur, HSQL);
   		@SqlCloseCursor(l_hCur, HSQL);
		}

		if ( l_STOIDV_YN == "N" )
		{
/* hole Maxnummer sto_stoid und sto_sort */
			l_Sql = "  \
			select nvl(max(sto_stoid),0) + 1   \
			from ssto_stop  \
			where sto_farid = :FARID_NEU  \
			into :l_STOIDV";

			if (@SqlImmediate(l_Sql) == FALSE)
			{
				return(0-72);
			}

			l_Sql = "  \
			insert into ssto_stop  \
			(  \
			    sto_farid  \
			,   sto_stoid  \
			,   sto_adrid  \
			,   sto_sort  \
			,   sto_datwun  \
			,   sto_datvon  \
			,   sto_datbis  \
			,   sto_km  \
			,   sto_text  \
			,   sto_aend  \
			,   sto_datwunb  \
			)  \
			values  \
			(  \
			    :FARID_NEU  \
			,   :l_STOIDV  \
			,   :l_STOIDV_ADR  \
			,   :l_STOIDV  \
		   ,   NULL  \
			,   NULL  \
			,   NULL  \
			,   NULL  \
			,   NULL  \
			,   SYSDATE  \
			,   NULL  \
			)" ;

			if (@SqlImmediate(l_Sql) == FALSE)
			{
				return(0-72);
			}

		}
	}

	if ( l_STOIDN_ADR_YN == "Y" )
	{
		l_STOIDN_YN = "N";

		if ( l_STOIDV_YN == "Y" )
		{
			l_hCur = @SqlOpenCursor(HSQL);
   		if ( @SqlPrepareAndExecute (l_hCur, HSQL,
				"SELECT vst_stoidn, 'Y' \
				FROM	 svst_vkmstop,ssto_stop \
				WHERE  vst_farid = :FARID_NEU \
		   	AND    vst_stoidn = sto_stoid \
				AND	 vst_farid = sto_farid \
				AND	 sto_adrid = :l_STOIDN_ADR \
				AND	 sto_stoid > :l_STOIDV  \
				INTO	 :l_STOIDN,:l_STOIDN_YN"	) == 0 )
				{
					return(0-72);
				}
			@SqlFetchNext(l_hCur, HSQL);
   		@SqlCloseCursor(l_hCur, HSQL);

		}
		else
		{
			l_hCur = @SqlOpenCursor(HSQL);
   		if ( @SqlPrepareAndExecute (l_hCur, HSQL,
				"SELECT vst_stoidn, 'Y' \
				FROM	 svst_vkmstop,ssto_stop \
				WHERE  vst_farid = :FARID_NEU \
		   	AND    vst_stoidn = sto_stoid \
				AND	 vst_farid = sto_farid \
				AND	 sto_adrid = :l_STOIDN_ADR \
				INTO	 :l_STOIDN,:l_STOIDN_YN"	) == 0 )
				{
					return(0-72);
				}
			@SqlFetchNext(l_hCur, HSQL);
   		@SqlCloseCursor(l_hCur, HSQL);
		}
		if ( ( l_STOIDV_YN == "Y" ) & ( l_STOIDN_YN == "N" ) )
		{
			l_hCur = @SqlOpenCursor(HSQL);
   		if ( @SqlPrepareAndExecute (l_hCur, HSQL,
				"SELECT vst_stoidv, 'Y' \
				FROM	 svst_vkmstop,ssto_stop \
				WHERE  vst_farid = :FARID_NEU \
		   	AND    vst_stoidv = sto_stoid \
				AND	 vst_farid = sto_farid \
				AND	 sto_adrid = :l_STOIDN_ADR \
				AND	 sto_stoid > :l_STOIDV  \
				INTO	 :l_STOIDN,:l_STOIDN_YN" ) == 0 )
				{
					return(0-72);
				}
			@SqlFetchNext(l_hCur, HSQL);
   		@SqlCloseCursor(l_hCur, HSQL);
		}
		if ( l_STOIDN_YN == "N" )
		{
/* hole Maxnummer sto_stoid und sto_sort */
			l_Sql = "  \
			select nvl(max(sto_stoid),0) + 1   \
			from ssto_stop  \
			where sto_farid = :FARID_NEU  \
			into :l_STOIDN";

			if (@SqlImmediate(l_Sql) == FALSE)
			{
				return(0-72);
			}

			l_Sql = "  \
			insert into ssto_stop  \
			(  \
			    sto_farid  \
			,   sto_stoid  \
			,   sto_adrid  \
			,   sto_sort  \
			,   sto_datwun  \
			,   sto_datvon  \
			,   sto_datbis  \
			,   sto_km  \
			,   sto_text  \
			,   sto_aend  \
			,   sto_datwunb  \
			)  \
			values  \
			(  \
			    :FARID_NEU  \
			,   :l_STOIDN  \
			,   :l_STOIDN_ADR  \
			,   :l_STOIDN  \
			,   NULL  \
			,   NULL  \
			,   NULL  \
			,   NULL  \
			,   NULL  \
			,   SYSDATE  \
		   ,   NULL \
			)";

			if (@SqlImmediate(l_Sql) == FALSE)
			{
				return(0-72);
			}

			l_STOIDN_YN="Y";
		}
	}

/* Insert durchfuehren */
  	l_Sql = "  \
	insert into svst_vkmstop  \
	(  \
	    vst_vstid  \
	,   vst_farid  \
	,   vst_vkmid  \
	,   vst_bez  \
	,   vst_stoidv  \
	,   vst_stoidn  \
	,   vst_fahrer  \
	,   vst_vstidh  \
	,   vst_sort  \
	,   vst_aend  \
	,   vst_usrid  \
	,   vst_datvon  \
	,   vst_datbis  \
	,   vst_ladeschluss  \
	)  \
	values  \
	(  \
	    :VSTID_NEU    \
	,   :FARID_NEU ";
	if ( l_VKMID_YN == "Y" )  { l_Sql = l_Sql || ",:l_VKMID"; } else { l_Sql = l_Sql || ",NULL"; }
	if ( l_BEZ_YN == "Y" )  { l_Sql = l_Sql || ",:l_BEZ"; } else { l_Sql = l_Sql || ",NULL"; }
	if ( l_STOIDV_ADR_YN == "Y" )  { l_Sql = l_Sql || ",:l_STOIDV"; } else { l_Sql = l_Sql || ",NULL"; }
	if ( l_STOIDN_ADR_YN == "Y" )  { l_Sql = l_Sql || ",:l_STOIDN"; } else { l_Sql = l_Sql || ",NULL"; }
	if ( l_FAHRER_YN == "Y" )  { l_Sql = l_Sql || ",:l_FAHRER"; } else { l_Sql = l_Sql || ",NULL"; }
	l_Sql = l_Sql || ",   NULL    \
	,   :l_vst_sort  \
	,   SYSDATE   \
	,   :USRID   \
	,   tf_util.str_to_date(:l_VSTDATVON)   \
	,   tf_util.str_to_date(:l_VSTDATBIS)   \
	,   tf_util.str_to_date(:l_VSTLADESCHLUSS)   \
	)";
	@print(@sprintf(@nls_gettext_x("li_am.vst_neu.insert_vstid")));
	if (@SqlImmediate(l_Sql) == FALSE)
	{
		return(0-72);
	}
	if (l_vkmid2 > "" | l_bez2 > "") {
	    l_sql = "INSERT INTO SVST_VKMSTOP \
		    (VST_VKMID ,VST_BEZ ,VST_FARID ,VST_STOIDV ,VST_STOIDN ,VST_VSTIDH ,VST_SORT ,VST_FAHRER , \
		    VST_AEND ,VST_USRID ,VST_LADESCHLUSS ,VST_DATUM ,VST_DATVON ,VST_DATBIS ,VST_TZNAME) ( \
			SELECT \
			:l_vkmid2 ,:l_bez2 ,VST_FARID ,VST_STOIDV ,VST_STOIDN ,vst_vstid ,VST_SORT+1 ,VST_FAHRER , \
			VST_AEND ,VST_USRID ,VST_LADESCHLUSS ,VST_DATUM ,VST_DATVON ,VST_DATBIS ,VST_TZNAME \
			FROM \
			SVST_VKMSTOP \
			where 1=1 \
			and vst_vstid = :VSTID_NEU \
		    )";
	    if (@SqlImmediate(l_sql) == FALSE) {
		return(0-72);
	    }
	    @print("2. VKM: " || l_vkmid2 || " - " || @sprintf(@nls_gettext_x("li_am.vst_neu.insert_vstid")));
	}
}
""}"")



/*
Format fuer Generieren Ladung
*/

define(""{""LDG_NEU""}"",""{""
	 {
    LTYID_NEU = $1;
	 ifelse(_rmhk($2),,l_bez_YN="N"; ,l_bez_YN="Y";l_bez = @sprintf(_ref(""{""$2""}""));)
    ifelse($3,,l_DAT_YN="N";,l_DAT_YN="Y";l_DAT = @sprintf(_ref(""{""""{""$3""}""""}""));)
	 ifelse(_rmhk($4),,l_TEXT_YN="N";,l_TEXT_YN="Y";l_TEXT = @sprintf(_ref(""{""$4""}""));)
	 ifelse(_rmhk($5),,l_zollamt_YN="N"; ,l_zollamt_YN="Y";l_zollamt = @sprintf(_ref(""{""$5""}""));)
	 l_Sql = "  \
	 insert into sldg_ladung \
	 ( \
   	  ldg_farid  \
	 ,   ldg_ltyid  \
	 ,   ldg_bez  \
	 ,   ldg_zollamt  \
	 ,   ldg_dat \
	 ,   ldg_text \
 	 ,   ldg_aend  \
	 )  \
	 values  \
	 (  \
    :FARID_NEU  \
	 ,   :LTYID_NEU ";
if ( l_bez_YN == "Y" )  { l_Sql = l_Sql || ",:l_bez"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_zollamt_YN == "Y" )  { l_Sql = l_Sql || ",:l_zollamt"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_DAT_YN == "Y" )  { l_Sql = l_Sql || ",tf_util.str_to_date(:l_DAT)"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_TEXT == "Y" )  { l_Sql = l_Sql || ",:l_TEXT"; } else { l_Sql = l_Sql || ",NULL"; }
	l_Sql = l_Sql || "	 ,  SYSDATE )";

	 @print(@sprintf(@nls_gettext_x("li_am.ldg_neu.insert_ltyid")));
/*	 @print(l_Sql); */
	 if (@SqlImmediate(l_Sql) == FALSE)
	 {
			return(0-72);
	 }
""}"")

define(""{""LDG_NEU_END""}"",""{""
		@print(@sprintf(@nls_gettext_x("li_am.ldg_neu_end.end")));
	 }
""}"")


/*
Format fuer Generieren Ladungsadresse
*/

define(""{""LDA_NEU""}"",""{""
	 {
	 LDA_ORGID_NEU = ifelse($2,,"",_ref(""{""$2""}""));
	 LDA_ADRID_NEU = ifelse($1,,"",_ref(""{""$1""}""));
	 l_orgid = "NULL";
	 if (@getwert(LDA_ORGID_NEU) != "" )
	 {
		@print("LDA_ORGID_NEU" );
		l_orgid = LDA_ORGID_NEU;
		@reset_vars( LDA_ADRID_NEU );
	 }
	 l_adrid = LDA_ADRID_NEU;
	 l_referenz = @sprintf(ifelse($3,,"",_ref(""{""$3""}"")));
    l_relation = ifelse(_rmhk($4),,"NULL",_ref(""{""$4""}""));
	l_Sql_String = " \
		BEGIN  \
	     slda.slda_ins( "   \
		  || "'" ||  FARID_NEU || "'"  \
		  || ",'" || LTYID_NEU || "'"  \
		  || "," || l_adrid  \
		  || "," || l_orgid  \
		  || ",'" || l_referenz || "'"   \
		  || "," || l_relation   \
		  || ",0  \
			);	  \
	  	END;";
	@print(@sprintf(@nls_gettext_x("li_am.lda_neu.insert")));
	@print(l_Sql_String);
	if (@SqlImmediate(l_Sql_String) == FALSE)
		{
		return (0-72);
		}
 	}

""}"")
/*
Format fuer Generieren Stop
*/

define(""{""STO_NEU""}"",""{""
	 {
	 l_adrid = _ref(""{""$1""}"");
	 l_datwun = @sprintf(ifelse($2,,"",_ref(""{""$2""}"")));
	 l_datwunb = @sprintf(ifelse($4,,"",_ref(""{""$4""}"")));
	 l_text = ifelse($3,,"",@sprintf($3));
    @print(l_datwun || " , " || l_datwunb);
	 l_Sql_String = "  \
		insert into ssto_stop \
		( sto_stoid \
       ,sto_farid \
		 ,sto_sort \
		 ,sto_adrid \
		 ,sto_datwun \
		 ,sto_datwunb \
		 ,sto_aend \
		 ,sto_text \
		 ) \
		 ( select  \
		    stoid.nr  \
			,:FARID_NEU \
			,sort.nr \
			,:l_adrid \
			,tf_util.str_to_date(:l_datwun) \
			,tf_util.str_to_date(:l_datwunb) \
			,sysdate \
			,:l_text \
			from nummer stoid, nummer sort \
			where stoid.nr = ( select nvl(max(sto_stoid),0) + 1 from \
				ssto_stop where sto_farid = :FARID_NEU ) \
			and sort.nr = ( select nvl(trunc(max(sto_sort)),0) + 1 from \
				ssto_stop where sto_farid = :FARID_NEU )  \
			) ";
		@print(l_Sql_String);
	if (@SqlImmediate(l_Sql_String) == FALSE)
		{
		return (0-72);
		}
 	}
	@print(@sprintf(@nls_gettext_x("li_am.sto_neu.end")));

""}"")

/* Format fuer Sendungs-Anlage ********************************************
*/
define(""{""SDG_NEU_5""}"",""{""
    ifelse($1,,l_UNIT_VOLUMEN_YN="N";,l_UNIT_VOLUMEN_YN="Y";l_UNIT_VOLUMEN = _ref(""{""$1""}"");)
    ifelse($2,,l_UNIT_LAENGE_YN="N";,l_UNIT_LAENGE_YN="Y";l_UNIT_LAENGE = _ref(""{""$2""}"");)
    ifelse($3,,l_UNIT_DISTANZ_YN="N";,l_UNIT_DISTANZ_YN="Y";l_UNIT_DISTANZ = _ref(""{""$3""}"");)
    ifelse($4,,l_TERMABVON_TZ_YN="N";,l_TERMABVON_TZ_YN="Y";l_TERMABVON_TZ = _ref(""{""$4""}"");)
    ifelse($5,,l_TERMZUVON_TZ_YN="N";,l_TERMZUVON_TZ_YN="Y";l_TERMZUVON_TZ = _ref(""{""$5""}"");)
""}"")
define(""{""SDG_NEU_4""}"",""{""
    ifelse($1,,l_ABGANGSHAFEN_YN="N";,l_ABGANGSHAFEN_YN="Y";l_ABGANGSHAFEN = _ref(""{""$1""}"");)
    ifelse($2,,l_EMPFANGSHAFEN_YN="N";,l_EMPFANGSHAFEN_YN="Y";l_EMPFANGSHAFEN = _ref(""{""$2""}"");)
    ifelse($3,,l_ETS_YN="N";,l_ETS_YN="Y";l_ETS = _ref(""{""$3""}"");)
    ifelse($4,,l_ETA_YN="N";,l_ETA_YN="Y";l_ETA = _ref(""{""$4""}"");)
    ifelse($5,,l_CLOSING_YN="N";,l_CLOSING_YN="Y";l_CLOSING = _ref(""{""$5""}"");)
    ifelse($6,,l_TPV_YN="N";,l_TPV_YN="Y";l_TPV = _ref(""{""$6""}"");)
    ifelse($7,,l_LCNR_YN="N";,l_LCNR_YN="Y";l_LCNR = _ref(""{""$7""}"");)
    ifelse($8,,l_VOYAGE_YN="N";,l_VOYAGE_YN="Y";l_VOYAGE = _ref(""{""$8""}"");)
    ifelse($9,,l_UNIT_GEWICHT_YN="N";,l_UNIT_GEWICHT_YN="Y";l_UNIT_GEWICHT = _ref(""{""$9""}"");)
    SDG_NEU_5(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))
""}"")

define(""{""SDG_NEU_3""}"",""{""
    ifelse($1,,l_TERMZUBIS_YN="N";,l_TERMZUBIS_YN="Y";l_TERMZUBIS = @sprintf(_ref(""{""""{""$1""}""""}""));)
	 ifelse(_rmhk($2),,l_zolleint_YN="N";,l_zolleint_YN="Y";l_zolleint = @sprintf($2);)
	 ifelse(_rmhk($3),,l_ladeliste_YN="N";,l_ladeliste_YN="Y";l_ladeliste = $3;)
	 ifelse($4,,l_RELATION_YN="N";,l_RELATION_YN="Y";l_RELATION = _ref(""{""""{""$4""}""""}"");)
	 l_sdg_neuid = ifelse(_rmhk($5),, "N1" ,$5);
	 l_sdg_blnummer = ifelse($6,,"",_ref(""{""$6""}""));
	 l_sdg_bldatum = ifelse($7,,"",_ref(""{""$7""}""));
	 l_sdg_check = ifelse($8,,"N",_ref(""{""$8""}""));
	 l_sdg_schiff = ifelse($9,,"",_ref(""{""$9""}""));
	 SDG_NEU_4(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))
""}"")

define(""{""SDG_NEU_2""}"",""{""
    ifelse($1,,l_WERT_YN="N";,l_WERT_YN="Y";l_WERT = _ref(""{""$1""}"");)
	 ifelse(_rmhk($2),,l_WRGID_YN="N";,l_WRGID_YN="Y";l_WRGID = _ref(""{""$2""}"");)
	 ifelse(_rmhk($3),,l_UEBCODE_YN="N";,l_UEBCODE_YN="Y";l_UEBCODE = _ref(""{""$3""}"");)
	 ifelse(_rmhk($4),,l_WLCODE_YN="N";,l_WLCODE_YN="Y";l_WLCODE = _ref(""{""$4""}"");)
	 ifelse(_rmhk($5),,l_ZOLLCODE_YN="N";,l_ZOLLCODE_YN="Y";l_ZOLLCODE = _ref(""{""$5""}"");)
	 ifelse(_rmhk($6),,l_stellplatz_YN="N";,l_stellplatz_YN="Y";l_stellplatz = _ref(""{""$6""}"");)
    ifelse($7,,l_TERMABVON_YN="N";,l_TERMABVON_YN="Y";l_TERMABVON = @sprintf(_ref(""{""""{""$7""}""""}""));)
    ifelse($8,,l_TERMABBIS_YN="N";,l_TERMABBIS_YN="Y";l_TERMABBIS = @sprintf(_ref(""{""""{""$8""}""""}""));)
    ifelse($9,,l_TERMZUVON_YN="N";,l_TERMZUVON_YN="Y";l_TERMZUVON = @sprintf(_ref(""{""""{""$9""}""""}""));)
	 SDG_NEU_3(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))
""}"")

define(""{""SDG_NEU""}"",""{""
	 {

	 @save_vars( LI_MODUL, ZEILE_ID , STATUS_ALT, STATUS_NEU, STATUS_SDG, SYS_DATUM, LAFID );
@reset_vars(LI_MODUL);
l_CurNum = @SqlOpenCursor(HSQL);
l_sdg_orgid = AB_ID;
l_sdg_lfnr = "";
l_sdg_vsvs = "";
l_sdg_vsnr = "";
l_sdgid_temp = "SDGID";
l_leer_temp  = "";
l_tmp_vsnr = "";
l_yes_temp   = "Y";
@SqlPLSQL(l_CurNum,HSQL, "snum.get_next_key_lim(:l_sdgid_temp, :l_sdg_orgid,:l_leer_temp,:SYS_DATUM, :l_yes_temp, :l_sdg_lfnr,:l_sdg_vsnr)");
@SqlCloseCursor(l_CurNum, HSQL);
	@print(@sprintf(@nls_gettext_x("li_am.sdg_neu.snum_getnext")));
l_sdg_lfvs = "1";
if ( @getwert(l_sdg_lfnr ) == "-1" )
{
	l_tmp_vsnr = l_sdg_vsnr;
	l_ret = @SqlImmediate("SELECT cfg_cfeld  \
	 		, to_char(sseq_sdglfnr.nextval)  \
	 		, cfg_cfeld, to_char(1)  \
			FROM scfg_config  \
			WHERE cfg_cfgid = 'VS'  \
	      INTO :l_sdg_vsnr, :l_sdg_lfnr, :l_sdg_vsvs, :l_sdg_lfvs ");
	
	/* Issue 17192 - Vergebende Stelle belassen */
	if ( @getwert(l_tmp_vsnr ) == "-1" )
	{
		/* vsnr bleibt wie im Select aus Hostconfig ermittelt */
	}
	else
	{
		/* vsnr aus dem Package-Returnwert uebernehmen */
		l_sdg_vsnr = l_tmp_vsnr;
	}
}
else
{
l_sdg_vsvs = l_sdg_vsnr;
}

	SDGID_NEU = l_sdg_vsnr || "-" || l_sdg_lfnr || "-";
	SDGID_NEU = SDGID_NEU || l_sdg_vsvs || "-" || l_sdg_lfvs;

if ( @getwert(l_sdg_vsnr ) == "SDGID_VAR" )
{
	@print("l_sdg_lfnr1: " || l_sdg_lfnr );
	l_ret = @SqlImmediate("SELECT replace ('" || l_sdg_lfnr || "' ,'|', '') from dual  \
	                       INTO   :l_sdg_lfnr ");
	@print("l_sdg_lfnr2: " || l_sdg_lfnr );

	l_sdg_vsnr = " ";
	l_sdg_vsvs = " ";
	l_sdg_lfvs = "01";
	SDGID_NEU = l_sdg_lfnr;
}

/* Issue 12592 Start --> wenn SimulationsID gesetzt, dann Sdgid um # ergaenzen */
l_simid_wc = "";
if ( @gesetzt(SIMID_WC) == TRUE )
	{
                l_simid_wc = @getwert(SIMID_WC);
			@print("Simid WorkCopy: " || l_simid_wc );
		if (l_simid_wc != "")
		{
			SDGID_NEU = "#" || SDGID_NEU;
			@print(@sprintf(@nls_gettext_x("li_am.sdg_neu.simid")));
		}
	}
/* Issue 12592 Ende  */

	@print(@sprintf(@nls_gettext_x("li_am.sdg_neu.insert")));

   STATUS_NEU = ifelse(_rmhk($1),,"300",$1);
   STATUS_ALT = "110";
   STATUS_SDG = STATUS_NEU;
	AB_ID = ifelse(	$2,,AB_ID, $2);

/* WOSC 28.08.99 */
	l_sdg_orgid_ab = 0;
	l_sdg_orgid = AB_ID;

	l_ret = @SqlImmediate("SELECT org_orgid   \
			FROM sorg_t_einheit \
			WHERE org_oetid = 'AB'  \
			connect by org_orgid = prior org_orgidh \
			start with org_orgid = :l_sdg_orgid \
	      INTO :l_sdg_orgid_ab");

	if ( l_sdg_orgid == l_sdg_orgid_ab )
	 {
		@print(@sprintf(@nls_gettext_x("li_am.sdg_neu.orgid_ab")));
	 }
	else
	 {
		AG_ID = l_sdg_orgid;
		AB_ID = l_sdg_orgid_ab;
		@print(@sprintf(@nls_gettext_x("li_am.sdg_neu.orgid_ag")));
	 }
/* WOSC 28.08.99 */

   SYS_DATUM 	= @substr (@sprintf($3),1,10);
	SDG_TYP = $4;
	ifelse(_rmhk($5),,l_VERKEHR_YN="N";,l_VERKEHR_YN="Y";l_VERKEHR = _ref(""{""$5""}"");)
	ifelse($6,,l_LI_YN="N";,l_LI_YN="Y";l_LI_MODUL = _ref(""{""$6""}"");)
	ifelse($7,,l_SUCHBEGRIFF_YN="N";,l_SUCHBEGRIFF_YN="Y";l_SUCHBEGRIFF = @sprintf(_ref(""{""$7""}""));)
	ifelse(_rmhk($8),,l_FRANK_YN="N";,l_FRANK_YN="Y";l_FRANK = $8;)
	ifelse($9,,l_FRANKTEXT_YN="N";,l_FRANKTEXT_YN="Y";l_FRANKTEXT = @sprintf(_ref(""{""$9""}""));)
	SDG_NEU_2(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))

	@reset_vars(ZEILE_ID, _SDG_VARS_LOOP , _SDG_VARS_RESET );

/*WOSC 28.08.99 statt AB_ID l_sdg_orgid */
l_Sql = "  \
insert into ssdg_sendung  \
(  \
    sdg_sdgid  \
,   sdg_styid  \
,   sdg_orgid  \
,   sdg_kopie  \
,   sdg_datum  \
,   sdg_vekid  \
,   sdg_relid  \
,   sdg_modv  \
,   sdg_zolid  \
,   sdg_welid  \
,   sdg_fraid  \
,   sdg_fratxt  \
,   sdg_cllanz  \
,   sdg_vepid  \
,   sdg_inh  \
,   sdg_bgew  \
,   sdg_ngew  \
,   sdg_cbm  \
,   sdg_ldm  \
,   sdg_gefg  \
,   sdg_wert  \
,   sdg_wrgid  \
,   sdg_vsg  \
,   sdg_termabvon  \
,   sdg_termabbis  \
,   sdg_termzuvon  \
,   sdg_termzubis  \
,   sdg_stpid  \
,   sdg_grpvsdg  \
,   sdg_such  \
,   sdg_archiv  \
,   sdg_neuid  \
,   sdg_blnummer  \
,   sdg_bldatum  \
,   sdg_vorg  \
,   sdg_stamm  \
,   sdg_vsnr  \
,   sdg_lfnr  \
,   sdg_vsvs  \
,   sdg_lfvs  \
,   sdg_aend  \
,   sdg_usrid  \
,   sdg_lasid  \
,   sdg_sperrig  \
,   sdg_termab  \
,   sdg_termzu  \
,   sdg_zolleint  \
,   sdg_ladeliste  \
,   sdg_uebid  \
,   sdg_erfdat  \
,   sdg_krueb  \
,   sdg_simid \
,   sdg_tpvid \
,   sdg_voyage \
,   sdg_sptidvon \
,   sdg_sptidnach \
,   sdg_ets \
,   sdg_eta \
,   sdg_closing \
,   sdg_lcnr \
,   sdg_unit_gewicht \
,   sdg_unit_laenge \
,   sdg_unit_volumen \
,   sdg_unit_distanz \
,   sdg_termab_tzname \
,   sdg_termzu_tzname \
,   sdg_schiff \
)  \
values  \
(  \
    :SDGID_NEU  \
,   :SDG_TYP  \
,   :l_sdg_orgid  \
,   NULL  \
,   to_date(:SYS_DATUM,'YYYY.MM.DD') " ;


if ( l_VERKEHR_YN == "Y" )  { l_Sql = l_Sql || ",:l_VERKEHR"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_RELATION_YN == "Y" )  { l_Sql = l_Sql || ",:l_RELATION"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_LI_MODUL_YN == "Y" )  { l_Sql = l_Sql || ",:l_LI_MODUL"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_ZOLLCODE_YN == "Y" )  { l_Sql = l_Sql || ",:l_ZOLLCODE"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_WLCODE_YN == "Y" )  { l_Sql = l_Sql || ",:l_WLCODE"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_FRANK_YN == "Y" )  { l_Sql = l_Sql || ",:l_FRANK"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_FRANKTEXT_YN == "Y" )  { l_Sql = l_Sql || ",:l_FRANKTEXT"; } else { l_Sql = l_Sql || ",NULL"; }
l_Sql = l_Sql || "  ,   NULL  \
,   NULL  \
,   NULL  \
,   NULL  \
,   NULL  \
,   NULL  \
,   NULL  \
,   NULL ";
if ( l_WERT_YN == "Y" )  { l_Sql = l_Sql || ",:l_WERT"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_WRGID_YN == "Y" )  { l_Sql = l_Sql || ",:l_WRGID"; } else { l_Sql = l_Sql || ",NULL"; }
l_Sql = l_Sql || "  ,   NULL ";
if ( l_TERMABVON_YN == "Y" )  { l_Sql = l_Sql || ",tf_util.str_to_date(:l_TERMABVON)"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_TERMABBIS_YN == "Y" )  { l_Sql = l_Sql || ",tf_util.str_to_date(:l_TERMABBIS)"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_TERMZUVON_YN == "Y" )  { l_Sql = l_Sql || ",tf_util.str_to_date(:l_TERMZUVON)"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_TERMZUBIS_YN == "Y" )  { l_Sql = l_Sql || ",tf_util.str_to_date(:l_TERMZUBIS)"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_stellplatz_YN == "Y" )  { l_Sql = l_Sql || ",:l_stellplatz"; } else { l_Sql = l_Sql || ",NULL"; }
l_Sql = l_Sql || "  ,   NULL ";
if ( l_SUCHBEGRIFF_YN == "Y" )  { l_Sql = l_Sql || ",upper(:l_SUCHBEGRIFF)"; } else { l_Sql = l_Sql || ",NULL"; }
l_Sql = l_Sql || "  ,   NULL  \
,   :l_sdg_neuid  \
,   :l_sdg_blnummer  \
,    tf_util.str_to_date(:l_sdg_bldatum) \
,   NULL  \
,   NULL  \
,   :l_sdg_vsnr  \
,   :l_sdg_lfnr  \
,   :l_sdg_vsvs  \
,   :l_sdg_lfvs  \
,   SYSDATE  \
,   :USRID  \
,   :STATUS_NEU  \
,   NULL  \
,   NULL  \
,   NULL ";
if ( l_zolleint_YN == "Y" )  { l_Sql = l_Sql || ",:l_zolleint"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_ladeliste_YN == "Y" )  { l_Sql = l_Sql || ",:l_ladeliste"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_UEBCODE_YN == "Y" )  { l_Sql = l_Sql || ",:l_UEBCODE"; } else { l_Sql = l_Sql || ",NULL"; }
l_Sql = l_Sql || "  ,   SYSDATE  \
,   NULL  \
,   :l_simid_wc "; 
@print(@sprintf(@nls_gettext_x("li_am.sdg_neu.insert")));
if ( l_TPV_YN == "Y" )  { l_Sql = l_Sql || ",:l_TPV"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_VOYAGE_YN == "Y" )  { l_Sql = l_Sql || ",:l_VOYAGE"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_ABGANGSHAFEN_YN == "Y" )  { l_Sql = l_Sql || ",:l_ABGANGSHAFEN"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_EMPFANGSHAFEN_YN == "Y" )  { l_Sql = l_Sql || ",:l_EMPFANGSHAFEN"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_ETS_YN == "Y" )  { l_Sql = l_Sql || ",tf_util.str_to_date(:l_ETS)"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_ETA_YN == "Y" )  { l_Sql = l_Sql || ",tf_util.str_to_date(:l_ETA)"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_CLOSING_YN == "Y" )  { l_Sql = l_Sql || ",tf_util.str_to_date(:l_CLOSING)"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_LCNR_YN == "Y" )  { l_Sql = l_Sql || ",:l_LCNR"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_UNIT_GEWICHT_YN == "Y" )  { l_Sql = l_Sql || ",:l_UNIT_GEWICHT"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_UNIT_LAENGE_YN== "Y" )  { l_Sql = l_Sql || ",:l_UNIT_LAENGE"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_UNIT_VOLUMEN_YN == "Y" )  { l_Sql = l_Sql || ",:l_UNIT_VOLUMEN"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_UNIT_DISTANZ_YN == "Y" )  { l_Sql = l_Sql || ",:l_UNIT_DISTANZ"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_TERMABVON_TZ_YN == "Y" )  { l_Sql = l_Sql || ",:l_TERMABVON_TZ"; } else { l_Sql = l_Sql || ",NULL"; }
if ( l_TERMZUVON_TZ_YN == "Y" )  { l_Sql = l_Sql || ",:l_TERMZUVON_TZ"; } else { l_Sql = l_Sql || ",NULL"; }
l_Sql = l_Sql || " ,   :l_sdg_schiff  \)";

@print(@sprintf(@nls_gettext_x("li_am.sdg_neu.insert")));
 @print(l_Sql); 
if (@SqlImmediate(l_Sql) == FALSE)
	{
		return(0-72);
	 }
""}"")

define(""{""SDG_NEU_END""}"",""{""
	SDGID = SDGID_NEU;
	@print(SDGID);
	l_Sql_String = "BEGIN  \
	       ssdg.sdb_summ ('"|| SDGID || "' );  \
	       END;";
/* @print( l_Sql_String); */
	if (@SqlImmediate(l_Sql_String) == FALSE)
	{
		return(0-72);
	}
	SDGID = SDGID_NEU;
	@print(SDGID);
	l_Sql_String = "BEGIN  \
	       sfaktor.setzen_felder ('"|| SDGID || "' );  \
	       END;";
/* @print( l_Sql_String); */
	if (@SqlImmediate(l_Sql_String) == FALSE)
	{
		return(0-72);
	}


/*Aufruf LA-Pruef- und LA-Generierungsmodul
 		Aufruf Pruefmodul nur, wenn es nicht sowieso in Sendung aufgerufen wird
		und nur wenn Parameter gesetzt ist (Kompatibilitaet zu Modulen vor 1.1.2002)
		*/

#ifndef _la_sdg_incl_check
   if ( (l_sdg_check == "Y") )\
	{
		@print(@sprintf(@nls_gettext_x("li_am.sdg_neu_end.check.start")));
		@save_vars(BIB); 
		BIB = "SDG_CHECK"; 
		@call(@getwert(BIB), FA_ID,@getwert(FA_ID), AB_ID,@getwert(AB_ID), \
			LI_MODUL, @getwert(LI_MODUL),ADRID_AB,@getwert(ADRID_AB), ADRID_AG,@getwert(ADRID_AG), \
			ADRID_EM,@getwert(ADRID_EM) ); 
		@restore_vars(); 
	}
#endif
	@print(@sprintf(@nls_gettext_x("li_am.sdg_neu_end.call.lagen")));
        @save_vars(BIB,LA_SDG_INI_SDG_CHECK); 
        BIB = "LA_"||"SDG"; 
	LA_SDG_INI_SDG_CHECK = l_sdg_check;
        @call(@getwert(BIB), FA_ID,@getwert(FA_ID), AB_ID,@getwert(AB_ID), \
                ADRID_AB,@getwert(ADRID_AB), ADRID_AG,@getwert(ADRID_AG), \
                ADRID_EM,@getwert(ADRID_EM) );
        @restore_vars();

/* Setzen Variable Gegenstueck im Format SDGID_NEU */
		@restore_vars();
		@print(@sprintf(@nls_gettext_x("li_am.sdg_neu_end.end")));
	}
""}"")



/*
Format fuer Generieren Sendungsadresse
*/

define(""{""SDA_NEU""}"",""{""
	{
	@save_vars( ADRID );
/* Sendungs-Id in SDGID_NEU */
/* $1 Muss */
	l_satid = $1;
/* $2 Muss */
	l_adrid = $2;
	ifelse($3,,l_ref_YN="N"; ,l_ref_YN="Y"; l_ref = @sprintf(_ref(""{""$3""}""));)
	ifelse($4,,l_termvon_YN="N"; ,l_termvon_YN="Y"; l_termvon = @sprintf(_ref(""{""$4""}""));)
	ifelse($5,,l_termbis_YN="N"; ,l_termbis_YN="Y"; l_termbis = @sprintf(_ref(""{""$5""}""));)

	if ( @getwert(SDGID_NEU) == "" )
	{
		SDGID_NEU = SDGID;
	}

	l_Sql= "  \
	insert into ssda_sdgadr  \
	(  \
	    sda_sdgid  \
	,   sda_satid  \
	,   sda_adrid  \
	,   sda_ref  \
	,   sda_termvon  \
	,   sda_termbis  \
	,   sda_aend  \
	,   sda_usrid  \
	)  \
	values  \
	(  \
	    :SDGID_NEU  \
	,   :l_satid  \
	,   :l_adrid ";
	if ( l_ref_YN  == "Y" )  { l_Sql = l_Sql || ",:l_ref"; } else { l_Sql = l_Sql || ",NULL"; }
	if ( l_termvon_YN  == "Y" )  { l_Sql = l_Sql || ",tf_util.str_to_date(:l_termvon)"; } else { l_Sql = l_Sql || ",NULL"; }
	if ( l_termbis_YN  == "Y" )  { l_Sql = l_Sql || ",tf_util.str_to_date(:l_termbis)"; } else { l_Sql = l_Sql || ",NULL"; }
	l_Sql = l_Sql || "  ,   SYSDATE  \
	,   :USRID   \
	)";

	@print(@sprintf(@nls_gettext_x("li_am.sda_neu.insert")));
/*	@print(l_Sql); */
	if (@SqlImmediate(l_Sql) == FALSE)
		{
		return (0-72);
		}
   @restore_vars();
	}
""}"")

/*
Format fuer Anlegen von Kontakt-Kommunikationstypen und -nummern
*/

define(""{""SCOM_NEU""}"",""{""
   @save_vars( KUNID, COMID );
   l_com_typ = $1; 
   l_kunid = @getwert(KUNID);
   l_comid = @getwert(COMID);
   l_com_adresse = ifelse($2,,"",_ref(""{""$2""}""));
   l_com_teltyp = ifelse($3,,"",_ref(""{""$3""}""));
   l_com_ldvw = ifelse($4,,"",_ref(""{""$4""}""));
   l_com_ortvw = ifelse($5,,"",_ref(""{""$5""}""));
   l_com_komnr = ifelse($6,,"",_ref(""{""$6""}""));
   l_com_dw = ifelse($7,,"",_ref(""{""$7""}""));
   l_com_default = ifelse($8,,"",_ref(""{""$8""}""));
   l_com_text = ifelse($9,,"",_ref(""{""$9""}""));

   if ( l_comid > "" ) {
     /* Aendern oder loeschen eines Kommunikationstypen */
     l_Sql = "UPDATE scom_communication \
         set com_typ = :l_com_typ \
         , com_adresse = :l_com_adresse \
         , com_teltyp = :l_com_teltyp \
         , com_ldvw = :l_com_ldvw \
         , com_ortvw = :l_com_ortvw \
         , com_komnr = :l_com_komnr \
         , com_dw = :l_com_dw \
         , com_default = decode(:l_com_default,'Y',1,0) \
         , com_text = :l_com_text \
         WHERE com_comid = :l_comid and com_kunid = :l_kunid";
   } else {
     /* neu anlegen */
      l_Sql= " \
      insert into scom_communication \
      (  \
         com_comid  \
     ,   com_kunid  \
     ,   com_typ  \
     ,   com_adresse \
     ,   com_teltyp \
     ,   com_ldvw   \
     ,   com_ortvw  \
     ,   com_komnr  \
     ,   com_dw     \
     ,   com_default \
     ,   com_text  \
     ,   com_aend  \
     ,   com_usrid  \
     )  \
     values  \
     (  \
        sglo.get_vsString() || '-' || SSEQ_KONTAKTE.NEXTVAL \
     ,  :l_kunid \
     ,  :l_com_typ \
     ,  :l_com_adresse \
	  ,  :l_com_teltyp \
  	  ,  :l_com_ldvw \
     ,  :l_com_ortvw \
     ,  :l_com_komnr \
     ,  :l_com_dw  \
     ,  decode(:l_com_default,'Y',1,0) \
     ,  :l_com_text \
     ,  sysdate \
     ,  sglo.get_usrid())";
     }

     @print(l_Sql);
     @SqlImmediate(l_Sql);
     @restore_vars();
""}"")


/*
Format fuer Generieren Sendungsbeschreibungszeile
*/
define(""{""SDB_NEU_5""}"",""{""
	ifelse(_rmhk($1),,l_LOCAL_GEWPFL_YN="N";,l_LOCAL_GEWPFL_YN="Y";l_LOCAL_GEWPFL = _ref(_rmhk(""{""$1""}""));)
	ifelse(_rmhk($2),,l_LOCAL_TARA_YN="N";,l_LOCAL_TARA_YN="Y";l_LOCAL_TARA = _ref(_rmhk(""{""$2""}""));)
	ifelse(_rmhk($3),,l_LOCAL_LAENGE_YN="N";,l_LOCAL_LAENGE_YN="Y";l_LOCAL_LAENGE = _ref(_rmhk(""{""$3""}""));)
	ifelse(_rmhk($4),,l_LOCAL_BREITE_YN="N";,l_LOCAL_BREITE_YN="Y";l_LOCAL_BREITE = _ref(_rmhk(""{""$4""}""));)
	ifelse(_rmhk($5),,l_LOCAL_HOEHE_YN="N";,l_LOCAL_HOEHE_YN="Y";l_LOCAL_HOEHE = _ref(_rmhk(""{""$5""}""));)
	ifelse(_rmhk($6),,l_Z_MNR_YN="N";,l_Z_MNR_YN="Y";l_Z_MNR = @sprintf(_ref(""{""$6""}""));)
""}"")


define(""{""SDB_NEU_4""}"",""{""
	l_artnr  = ifelse($1,,"",_ref(""{""$1""}""));
	l_fgstnr = ifelse($2,,"",_ref(""{""$2""}""));
	ifelse(_rmhk($3),,l_SATIDVON_YN="N";,l_SATIDVON_YN="Y";l_SATIDVON = @sprintf(_ref(""{""$3""}""));)
	ifelse(_rmhk($4),,l_SATIDBIS_YN="N";,l_SATIDBIS_YN="Y";l_SATIDBIS = @sprintf(_ref(""{""$4""}""));)
	ifelse(_rmhk($5),,l_Z_CBMPFL_YN="N";,l_Z_CBMPFL_YN="Y";l_Z_CBMPFL = _ref(_rmhk(""{""$5""}""));)
	ifelse(_rmhk($6),,l_LOCAL_BGEW_YN="N";,l_LOCAL_BGEW_YN="Y";l_LOCAL_BGEW = _ref(_rmhk(""{""$6""}""));)
	ifelse(_rmhk($7),,l_LOCAL_NGEW_YN="N";,l_LOCAL_NGEW_YN="Y";l_LOCAL_NGEW = _ref(_rmhk(""{""$7""}""));)
	ifelse(_rmhk($8),,l_LOCAL_CBM_YN="N";,l_LOCAL_CBM_YN="Y";l_LOCAL_CBM = _ref(_rmhk(""{""$8""}""));)
	ifelse(_rmhk($9),,l_LOCAL_LDM_YN="N";,l_LOCAL_LDM_YN="Y";l_LOCAL_LDM = _ref(_rmhk(""{""$9""}""));)
	SDB_NEU_5(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))
""}"")


define(""{""SDB_NEU_3""}"",""{""
	ifelse(_rmhk($1),,l_Z_TARA_YN="N";,l_Z_TARA_YN="Y";l_Z_TARA = @sprintf(_ref(""{""$1""}""));)
	ifelse(_rmhk($2),,l_Z_UNIT_YN="N";,l_Z_UNIT_YN="Y";l_Z_UNIT = @sprintf(_ref(""{""$2""}""));)
	ifelse(_rmhk($3),,l_Z_CONTNR_YN="N";,l_Z_CONTNR_YN="Y";l_Z_CONTNR = _ref(""{""$3""}"");)
	ifelse(_rmhk($4),,l_Z_CONTTYP_YN="N";,l_Z_CONTTYP_YN="Y";l_Z_CONTTYP = _ref(""{""$4""}"");)
	ifelse(_rmhk($5),,l_Z_CONTMAT_YN="N";,l_Z_CONTMAT_YN="Y";l_Z_CONTMAT = _ref(""{""$5""}"");)
	ifelse(_rmhk($6),,l_Z_FREISTELLNR_YN="N";,l_Z_FREISTELLNR_YN="Y";l_Z_FREISTELLNR = _ref(""{""$6""}"");)
	ifelse(_rmhk($7),,l_Z_DEPOT_YN="N";,l_Z_DEPOT_YN="Y";l_Z_DEPOT = _ref(""{""$7""}"");)
	ifelse(_rmhk($8),,l_Z_GEWPFL_YN="N";,l_Z_GEWPFL_YN="Y";l_Z_GEWPFL = _ref(""{""$8""}"");)
	ifelse(_rmhk($9),,l_Z_LVEID_YN="N";,l_Z_LVEID_YN="Y";l_Z_LVEID = @sprintf(_ref(""{""$9""}""));)
	SDB_NEU_4(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))
""}"")


define(""{""SDB_NEU_2""}"",""{""
	ifelse(_rmhk($1),,l_Z_BARCODE_YN="N";,l_Z_BARCODE_YN="Y";l_Z_BARCODE = @sprintf(_ref(""{""$1""}""));)
	ifelse(_rmhk($2),,l_Z_ZTARIF_YN="N";,l_Z_ZTARIF_YN="Y";l_Z_ZTARIF = @sprintf(_ref(""{""$2""}""));)
	ifelse(_rmhk($3),,l_Z_WERT_YN="N";,l_Z_WERT_YN="Y";l_Z_WERT  = _ref(_rmhk(""{""$3""}""));)
	ifelse(_rmhk($4),,l_Z_WRGID_YN="N";,l_Z_WRGID_YN="Y";l_Z_WRGID  = _ref(""{""$4""}"");)
	ifelse(_rmhk($5),,l_Z_GEW_NTO_YN="N";,l_Z_GEW_NTO_YN="Y";l_Z_GEW_NTO = _ref(_rmhk(""{""$5""}""));)
	ifelse(_rmhk($6),,l_Z_LAENGE_YN="N";,l_Z_LAENGE_YN="Y";l_Z_LAENGE  = _ref(_rmhk(""{""$6""}""));)
	ifelse(_rmhk($7),,l_Z_BREITE_YN="N";,l_Z_BREITE_YN="Y";l_Z_BREITE  = _ref(_rmhk(""{""$7""}""));)
	ifelse(_rmhk($8),,l_Z_HOEHE_YN="N";,l_Z_HOEHE_YN="Y";l_Z_HOEHE  = _ref(_rmhk(""{""$8""}""));)
	ifelse(_rmhk($9),,l_Z_TEXT_YN="N";,l_Z_TEXT_YN="Y";l_Z_TEXT = @sprintf(_ref(""{""$9""}""));)
	SDB_NEU_3(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))
""}"")


define(""{""SDB_NEU""}"",""{""
	{
	ifelse(_rmhk($1),,l_Z_SBEID_YN="N";,l_Z_SBEID_YN="Y";l_Z_SBEID = _rmhk($1);)
	ifelse(_rmhk($2),,l_Z_ZNR_YN="N";,l_Z_ZNR_YN="Y";l_Z_ZNR = @sprintf(_ref(""{""$2""}""));)
	ifelse(_rmhk($3),,l_Z_ANZ_YN="N";,l_Z_ANZ_YN="Y";l_Z_ANZ = _ref(_rmhk(""{""$3""}""));)
	ifelse(_rmhk($4),,l_Z_ART_YN="N";,l_Z_ART_YN="Y";l_Z_ART = _ref(""{""$4""}"");)
	ifelse(_rmhk($5),,l_Z_INH_YN="N";,l_Z_INH_YN="Y";l_Z_INH = @sprintf(_ref(""{""$5""}""));)
	ifelse(_rmhk($6),,l_Z_GEW_BTO_YN="N";,l_Z_GEW_BTO_YN="Y";l_Z_GEW_BTO = _ref(_rmhk(""{""$6""}""));)
	ifelse(_rmhk($7),,l_Z_CBM_YN="N";,l_Z_CBM_YN="Y";l_Z_CBM = _ref(_rmhk(""{""$7""}""));)
	ifelse(_rmhk($8),,l_Z_LDM_YN="N";,l_Z_LDM_YN="Y";l_Z_LDM = _ref(_rmhk(""{""$8""}""));)
	ifelse(_rmhk($9),,l_Z_GG_YN="N";,l_Z_GG_YN="Y";l_Z_GG = _ref(_rmhk(""{""$9""}"") );)
	SDB_NEU_2(shift(shift(shift(shift(shift(shift(shift(shift(shift($*))))))))))

	if ( @getwert(SDGID_NEU) <= "" ) {
		SDGID_NEU = SDGID;
	}

	/* ZEILE_ID immer korrekt ermitteln, egal, ob SDGID_NEU oder SDGID gesetzt ist */
	l_sql = "SELECT NVL( MAX(sdb_lfzl), 0 ) FROM ssdb_besch WHERE sdb_sdgid = :SDGID_NEU INTO :ZEILE_ID";
	if (@SqlImmediate(l_sql) == FALSE) {
		return (0-72);
	}
	ZEILE_ID = @getwert(ZEILE_ID) + 1; 

	l_Z_INH_1 = @substr ( @getwert(l_Z_INH),1,250 );
	l_Z_INH_2 = @substr ( @getwert(l_Z_INH),251,100 );

	l_Sql = "  \
	insert into ssdb_besch  \
	(  \
	    sdb_sdgid  \
	,   sdb_lfzl \
	,   sdb_sortnr  \
	,   sdb_sbeid  \
	,   sdb_znr  \
	,   sdb_anz  \
	,   sdb_vepid  \
	,   sdb_inh  \
	,   sdb_bgew  \
	,   sdb_ngew  \
	,   sdb_cbm  \
	,   sdb_ldm  \
	,   sdb_ztarif  \
	,   sdb_wert  \
	,   sdb_wrgid  \
	,   sdb_gefg  \
	,   sdb_text  \
	,   sdb_aend  \
	,   sdb_usrid  \
	,   sdb_laenge  \
	,   sdb_breite  \
	,   sdb_hoehe  \
	,   sdb_barcd  \
	,   sdb_tara \
	,   sdb_unit \
	,   sdb_contnr \
	,   sdb_conttyp \
	,   sdb_contmat \
	,   sdb_freistellnr \
	,   sdb_depot \
	,   sdb_gewpfl \
	,   sdb_lveid \
	,   sdb_artnr \
	,   sdb_fgstnr \
	,   sdb_vonsatid \
	,   sdb_nachsatid \
	,   sdb_cbmpfl \
	,   sdb_local_bgew \
	,   sdb_local_ngew \
	,   sdb_local_cbm \
	,   sdb_local_ldm \
	,   sdb_local_gewpfl \
	,   sdb_local_tara \
	,   sdb_local_laenge \
	,   sdb_local_breite \
	,   sdb_local_hoehe \
	,	 sdb_mnr \
	)  \
	values  \
	(  \
	    :SDGID_NEU  \
	,   :ZEILE_ID  \
	,   :ZEILE_ID ";
if ( l_Z_SBEID_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_SBEID"; }
else
   { l_Sql = l_Sql || ",NULL"; }

if ( l_Z_ZNR_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_ZNR"; }
else
	{ l_Sql = l_Sql || ",NULL"; }

if ( l_Z_ANZ_YN == "Y" )
	{ l_Sql = l_Sql || ",decode(:l_Z_ANZ,0,NULL,:l_Z_ANZ)"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_ART_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_ART"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_INH_YN == "Y" )
	{ l_Sql = l_Sql || ", :l_Z_INH_1 || :l_Z_INH_2 "; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_GEW_BTO_YN == "Y" )
	{ l_Sql = l_Sql || ",decode(:l_Z_GEW_BTO,0,NULL,:l_Z_GEW_BTO)"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_GEW_NTO_YN == "Y" )
	{ l_Sql = l_Sql || ",decode(:l_Z_GEW_NTO,0,NULL,:l_Z_GEW_NTO)"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_CBM_YN == "Y" )
	{ l_Sql = l_Sql || ",decode(:l_Z_CBM,0,NULL,:l_Z_CBM)"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_LDM_YN == "Y" )
	{ l_Sql = l_Sql || ",decode(:l_Z_LDM,0,NULL,:l_Z_LDM)"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_ZTARIF_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_ZTARIF"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_WERT_YN == "Y" )
	{ l_Sql = l_Sql || ",decode(:l_Z_WERT,0,NULL,:l_Z_WERT)"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_WRGID_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_WRGID"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_GG_YN == "Y" )
	{ l_Sql = l_Sql || ",decode(:l_Z_GG,0,NULL,:l_Z_GG)"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_TEXT_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_TEXT"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
l_Sql = l_Sql || "  ,   SYSDATE  \
	,   :USRID ";
if ( l_Z_LAENGE_YN == "Y" )
	{ l_Sql = l_Sql || ",decode(:l_Z_LAENGE,0,NULL,:l_Z_LAENGE)"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_BREITE_YN == "Y" )
	{ l_Sql = l_Sql || ",decode(:l_Z_BREITE,0,NULL,:l_Z_BREITE)"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_HOEHE_YN == "Y" )
	{ l_Sql = l_Sql || ",decode(:l_Z_HOEHE,0,NULL,:l_Z_HOEHE)"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_BARCODE_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_BARCODE"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_TARA_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_TARA"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_UNIT_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_UNIT"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_CONTNR_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_CONTNR"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_CONTTYP_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_CONTTYP"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_CONTMAT_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_CONTMAT"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_FREISTELLNR_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_FREISTELLNR"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_DEPOT_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_DEPOT"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_GEWPFL_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_GEWPFL"; }
else
	{ l_Sql = l_Sql || ",NULL"; }
if ( l_Z_LVEID_YN == "Y" )
	{ l_Sql = l_Sql || ",:l_Z_LVEID"; }
else
	{ l_Sql = l_Sql || ",NULL"; }

l_Sql = l_Sql || " \
,:l_artnr\
,:l_fgstnr";

if ( l_SATIDVON_YN == "Y" )
        { l_Sql = l_Sql || ",:l_SATIDVON"; }
else
        { l_Sql = l_Sql || ",NULL"; }

if ( l_SATIDBIS_YN == "Y" )
        { l_Sql = l_Sql || ",:l_SATIDBIS"; }
else
        { l_Sql = l_Sql || ",NULL"; }


if ( l_Z_CBMPFL_YN == "Y" )
        { l_Sql = l_Sql || ",:l_Z_CBMPFL"; }
else
        { l_Sql = l_Sql || ",NULL"; }

if ( l_LOCAL_BGEW_YN == "Y" )
        { l_Sql = l_Sql || ",:l_LOCAL_BGEW"; }
else
        { l_Sql = l_Sql || ",NULL"; }

if ( l_LOCAL_NGEW_YN == "Y" )
        { l_Sql = l_Sql || ",:l_LOCAL_NGEW"; }
else
        { l_Sql = l_Sql || ",NULL"; }

if ( l_LOCAL_CBM_YN == "Y" )
        { l_Sql = l_Sql || ",:l_LOCAL_CBM"; }
else
        { l_Sql = l_Sql || ",NULL"; }

if ( l_LOCAL_LDM_YN == "Y" )
        { l_Sql = l_Sql || ",:l_LOCAL_LDM"; }
else
        { l_Sql = l_Sql || ",NULL"; }

if ( l_LOCAL_GEWPFL_YN == "Y" )
        { l_Sql = l_Sql || ",:l_LOCAL_GEWPFL"; }
else
        { l_Sql = l_Sql || ",NULL"; }

if ( l_LOCAL_TARA_YN == "Y" )
        { l_Sql = l_Sql || ",:l_LOCAL_TARA"; }
else
        { l_Sql = l_Sql || ",NULL"; }

if ( l_LOCAL_LAENGE_YN == "Y" )
        { l_Sql = l_Sql || ",:l_LOCAL_LAENGE"; }
else
        { l_Sql = l_Sql || ",NULL"; }

if ( l_LOCAL_BREITE_YN == "Y" )
        { l_Sql = l_Sql || ",:l_LOCAL_BREITE"; }
else
        { l_Sql = l_Sql || ",NULL"; }

if ( l_LOCAL_HOEHE_YN == "Y" )
        { l_Sql = l_Sql || ",:l_LOCAL_HOEHE"; }
else
        { l_Sql = l_Sql || ",NULL"; }

if ( l_Z_MNR_YN == "Y" )
		  { l_Sql = l_Sql || ",:l_Z_MNR"; }
else
		  { l_Sql = l_Sql || ",NULL"; }

l_Sql = l_Sql || " )";

	@print(@sprintf(@nls_gettext_x("li_am.sdb_neu.insert")));
	if (@SqlImmediate(l_Sql) == FALSE)
		{
		return (0-72);
		}
 	}

""}"")
/*
Format: Lesen Sendungstext zu Sendungskopf
*/
define(""{""LSDGTEXT""}"", ""{""
l_sdgid      = $1;
l_sdgtexttyp = $2;
@print(@sprintf(@nls_gettext_x("li_am.lsdgtext.read")));
l_into1     = "";
l_into2     = "";
l_into3     = "";
l_into4     = "";
l_into5     = "";
l_into6     = "";
l_into7     = "";
l_into8     = "";

@SqlImmediate("SELECT  \
	Substr(sdt_text,1,250), Substr(sdt_text,251,250), \
	Substr(sdt_text, 501,250), Substr(sdt_text, 751,250), \
	Substr(sdt_text,1001,250), Substr(sdt_text,1251,250), \
	Substr(sdt_text,1501,250), Substr(sdt_text,1751,250) \
	FROM  ssdt_sdgtext \
	WHERE sdt_sdgid = :l_sdgid \
	AND   sdt_sttid = :l_sdgtexttyp \
	AND   nvl(sdt_lfzl,0) = 0 \
	INTO  :l_into1, :l_into2, :l_into3, :l_into4, :l_into5, :l_into6, :l_into7, :l_into8 ");
$3 = l_into1 || l_into2 || l_into3 || l_into4 || l_into5 || l_into6 || l_into7 || l_into8 ;
@print(@sprintf(@nls_gettext_x("li_am.lsdgtext.result")));
""}"")

/*
Format: Lesen Sendungstext zu Sendungsbeschreibung
*/
define(""{""LSDGTEXT_SDB""}"", ""{""
l_sdgid      = $1;
l_lfzl = $2;
l_sdgtexttyp = $3;
@print(@sprintf(@nls_gettext_x("li_am.lsdgtext_sdb.read")));
l_into1     = "";
l_into2     = "";
l_into3     = "";
l_into4     = "";
l_into5     = "";
l_into6     = "";
l_into7     = "";
l_into8     = "";

@SqlImmediate("SELECT  \
	Substr(sdt_text,1,250), Substr(sdt_text,251,250), \
	Substr(sdt_text, 501,250), Substr(sdt_text, 751,250), \
	Substr(sdt_text,1001,250), Substr(sdt_text,1251,250), \
	Substr(sdt_text,1501,250), Substr(sdt_text,1751,250) \
	FROM  ssdt_sdgtext \
	WHERE sdt_sdgid = :l_sdgid \
	AND   sdt_sttid = :l_sdgtexttyp \
	AND   nvl(sdt_lfzl,0) = :l_lfzl \
	INTO  :l_into1, :l_into2, :l_into3, :l_into4, :l_into5, :l_into6, :l_into7, :l_into8 ");
$4 = l_into1 || l_into2 || l_into3 || l_into4 || l_into5 || l_into6 || l_into7 || l_into8 ;
@print(@sprintf(@nls_gettext_x("li_am.lsdgtext_sdb.result")));
""}"")



/*
Format: Anlegen Sendungstext zu Sendungskopf
*/
#define SDT_NEU(sdgid,sdgtexttyp,sdt_text) \
_sdt_neu_m4(""{""sdgid""}"",""{""sdgtexttyp""}"",""{""sdt_text""}"")

define(""{""_sdt_neu_m4""}"",""{""
	l_SDGID = ""{""$1""}"";
	l_SDGTEXTTYP = ""{""$2""}"";
	l_SDGTEXT = @substr (_ref_stable(""{""$3""}""),1,2000);
	@print(@sprintf(@nls_gettext_x("li_am.sdt_neu.insert")));
	l_equal = "null";
	l_sql = "SELECT DECODE(sdt_text,:l_SDGTEXT,'=','!=') FROM ssdt_sdgtext WHERE NVL(sdt_lfzl,0) = 0 AND sdt_sttid = :l_SDGTEXTTYP AND sdt_sdgid = :l_SDGID FOR UPDATE NOWAIT INTO :l_equal";
	@SqlImmediate( l_sql );
	switch {
		case ( l_equal == "!=" ) {
			l_sql = "BEGIN ssdt.update_text( '" || @quote2(l_SDGID) || "', '" || @quote2(l_SDGTEXTTYP) || "', 0, '" || @quote2(l_SDGTEXT) || "' ); END;";
		}
		case ( l_equal == "null" ) {
			l_sql = "INSERT INTO ssdt_sdgtext ( sdt_sdgid, sdt_sttid, sdt_text, sdt_aend, sdt_usrid, sdt_lfzl ) VALUES ( :l_SDGID, :l_SDGTEXTTYP, :l_SDGTEXT, sysdate, :USRID, 0)";
		}
		case (*) {
			l_sql = "";
		}
	}
	if ( l_sql > "" ) {
		l_ret = @SqlImmediate(l_sql);
		if ( l_ret != TRUE ) {
			@print(@sprintf(@nls_gettext_x("li_am.sdt_neu.error")));
			return( 0-72 );
		} 
	}
""}"")

/*
Format: Anlegen Sendungstext zu Sendungsbeschreibung
*/
define(""{""SDT_SDB_NEU""}"",""{""
	l_SDGID = $1;
	l_ZEILE_NR = $2;
	l_SDGTEXTTYP = $3;
	l_SDGTEXT = @substr ($4,1,2000);
	@print(@sprintf(@nls_gettext_x("li_am.sdt_sdb_neu.check")));
	l_equal = "null";
	l_sql = "SELECT DECODE(sdt_text,:l_SDGTEXT,'=','!=') FROM ssdt_sdgtext WHERE NVL(sdt_lfzl,0) = :l_ZEILE_NR AND sdt_sttid = :l_SDGTEXTTYP AND sdt_sdgid = :l_SDGID FOR UPDATE NOWAIT INTO :l_equal";
	@SqlImmediate( l_sql );
	switch {
		case ( l_equal == "!=" ) {
			l_sql = "BEGIN ssdt.update_text( '" || @quote2(l_SDGID) || "', '" || @quote2(l_SDGTEXTTYP) || "', " || l_ZEILE_NR || ", '" || @quote2(l_SDGTEXT) || "' ); END;";
		}
		case ( l_equal == "null" ) {
			l_sql = "INSERT INTO ssdt_sdgtext ( sdt_sdgid, sdt_sttid, sdt_text, sdt_aend, sdt_usrid, sdt_lfzl ) VALUES ( :l_SDGID, :l_SDGTEXTTYP, :l_SDGTEXT, sysdate, :USRID, :l_ZEILE_NR)";
		}
		case (*) {
			l_sql = "";
		}
	}
	if ( l_sql > "" ) {
		l_ret = @SqlImmediate(l_sql);
		if ( l_ret != TRUE ) {
			@print(@sprintf(@nls_gettext_x("li_am.sdt_sdb_neu.error")));
			return( 0-72 );
		} 
	}

""}"")

/*
Format Zuordnung einer Sendung zu einer Sendungsgruppe
*/


define(""{""SDG_GRP""}"",""{""
	ifelse($1,,l_SDGID = SDGID;,l_SDGID = $1;)
	l_SDGIDG = $2;
	l_temp = l_SDGID;
	@print(@sprintf(@nls_gettext_x("li_am.sdg_grp.check")));
	if ( @SqlImmediate( "SELECT sdg_sdgid \
								FROM	 ssdg_sendung \
								WHERE  sdg_sdgid = :l_SDGIDG \
								INTO :l_temp" ) != TRUE )
	{
		@print(@sprintf(@nls_gettext_x("li_am.sdg_grp.nolock1")));
	   return ( 0-72 );
 	}
	if ( l_temp != l_SDGIDG )
	{
		@print(@sprintf(@nls_gettext_x("li_am.sdg_grp.err_group")));
	   return ( 0-72 );
 	}
	if ( @SqlImmediate( "SELECT sdg_sdgid \
								FROM	 ssdg_sendung \
								WHERE  sdg_sdgid = :l_SDGID \
								INTO :l_temp" ) != TRUE )
	{
		@print(@sprintf(@nls_gettext_x("li_am.sdg_grp.nolock2")));
	   return ( 0-72 );
 	}
	if ( l_temp != l_SDGID )
	{
		@print(@sprintf(@nls_gettext_x("li_am.sdg_grp.nosdgid")));
	   return ( 0-72 );
 	}

	l_temp = "BEGIN \
					INSERT INTO ssgg_sdggrp ( sgg_sdgid, sgg_sdgidg ) values ( '" || @quote2(l_SDGID) || "' , '" || @quote2(l_SDGIDG) || "'); \
				EXCEPTION \
					WHEN  DUP_VAL_ON_INDEX THEN \
						NULL; \
				END;";
   if (@SqlImmediate(l_temp) != TRUE )
	{
			@print(@sprintf(@nls_gettext_x("li_am.sdg_grp.err_ins")));
			return( 0-72 );
	}
""}"")



/*
Format fuer Generieren Anlagen fuer Sendung
ROSA 21.3.2000
*/

define(""{""SDG_ANLAGE""}"",""{""
	{
	@save_vars( SDGID , SDGID_NEU );
	l_Anllfnr = 0;
	l_anlid = "";
	l_Anlage	= ifelse($1,,"",_ref(""{""$1""}""));
	l_anlid	= ifelse($2,,"",_ref(""{""$2""}""));
	l_anzahl	= ifelse($3,,"",_ref(""{""$3""}""));
	l_edit	= ifelse($4,,"",_ref(""{""$4""}""));
	l_Anlbez	= ifelse($5,,"",_ref(""{""$5""}""));
	l_Anlnr	= ifelse($6,,"",_ref(""{""$6""}""));
/*
	ifelse(_rmhk($5),,l_Anlbez_YN="N";,l_l_Anlbez_YN="Y";l_name=@sprintf(_ref(""{""$5""}""));)
   ifelse($6,,l_Anlnr_YN="N";,l_Anlnr_YN="Y";l_datum = @sprintf(_ref(""{""""{""$6""}""""}""));)
*/
   ifelse($7,,l_AnlStatus="N";,l_AnlStatus="Y";l_datum = @sprintf(_ref(""{""""{""$7""}""""}""));)

	if ( @getwert(SDGID_NEU) == "" )
	{
		SDGID_NEU = SDGID;
	}

	l_SASelect = "Select san_lfnr from ssan_sdganl where san_sdgid = :SDGID_NEU  \
	and san_anlid = :l_anlid into :l_Anllfnr";

	l_Sql= "  \
	insert into ssan_sdganl \
	(  \
	    san_sdgid  \
	,   san_lfnr  \
	,   san_anlid  \
	,   san_anzahl  \
	,   san_bez  \
	,   san_nr  \
	,   san_status  \
	)  \
	values  \
	(  \
	    :SDGID_NEU  \
	,   :l_Anllfnr \
	,	 :l_anlid \
	,	 :l_anzahl \
	,	 :l_Anlbez \
	,	 :l_Anlnr ";
if ( l_AnlStatus == "Y" )  { l_Sql = l_Sql || ",:l_AnlStatus"; } else { l_Sql = l_Sql || ",NULL"; }
	l_Sql = l_Sql || " )";


		@print(@sprintf(@nls_gettext_x("li_am.sdg_anlage.check")));

		l_lAnlage = @SqlOpenCursor(HSQL);
		@SqlPrepareAndExecute (l_lAnlage, HSQL,  l_SASelect);
		while (@SqlFetchNext (l_lAnlage, HSQL) != 0)
		{
		}
		@SqlCloseCursor(l_lAnlage, HSQL);
		if (( l_Anlage == "Y" ) | ( l_Anllfnr == 0 ))
		{
		l_SLfnr= "Select nvl(max(san_lfnr),0) + 1 from ssan_sdganl \
 			where san_sdgid = :SDGID_NEU into :l_Anllfnr";

		@print(@sprintf(@nls_gettext_x("li_am.sdg_anlage.get_num")));
		if (@SqlImmediate(l_SLfnr) == FALSE)
		{
			return (0-72);
		}

		@print(@sprintf(@nls_gettext_x("li_am.sdg_anlage.insert")));
		@print(l_Sql);
		if (@SqlImmediate(l_Sql) == FALSE)
		{
			return (0-72);
		}
	}
   @restore_vars();
	}
""}"")



/*
Format fuer Generieren von Gefahrgutsaetzen fuer Sendungsbeschreibungszeilen
ROSA 29.9.2000
*/

define(""{""SBG_GEFAHR""}"",""{""
	{
	@save_vars( SDGID , SDGID_NEU );
	l_gefid	        = ifelse($1,,"",_ref(""{""$1""}""));
	l_bez		= ifelse($2,,"",_ref(""{""$2""}""));
	l_klasse	= ifelse($3,,"",_ref(""{""$3""}""));
	l_ziffer	= ifelse($4,,"",_ref(""{""$4""}""));
	l_buchstabe	= ifelse($5,,"",_ref(""{""$5""}""));
	l_unnr	        = ifelse($6,,"",_ref(""{""$6""}""));
	l_code	        = ifelse($7,,"",_ref(""{""$7""}""));
	l_handelsname	= ifelse($8,,"",_ref(""{""$8""}""));
	l_bgew	        = ifelse($9,,"",_ref(""{""$9""}""));
	l_ngew	        = ifelse($10,,"",_ref(""{""$10""}""));
	l_ngewe	        = ifelse($11,,"",_ref(""{""$11""}""));
	l_cbm	        = ifelse($12,,"",_ref(""{""$12""}""));
	l_bmenge	= ifelse($13,,"",_ref(""{""$13""}""));
	l_umwelt	= ifelse($14,,"",_ref(""{""$14""}""));
	l_ausnahme	= ifelse($15,,"",_ref(""{""$15""}""));
	l_leer	        = ifelse($16,,"",_ref(""{""$16""}""));
	l_typ		= ifelse($17,,"",_ref(""{""$17""}""));
	l_unit	        = ifelse($18,,"",_ref(""{""$18""}""));
	l_faktor	= ifelse($19,,"",_ref(""{""$19""}""));
	l_punkte	= ifelse($20,,"",_ref(""{""$20""}""));
	l_veptext	= ifelse($21,,"",_ref(""{""$21""}""));
	l_version	= ifelse($22,,"",_ref(""{""$22""}""));
	l_vgruppe	= ifelse($23,,"",_ref(""{""$23""}""));
	l_zusatz	= ifelse($24,,"",_ref(""{""$24""}""));
	l_vepid	        = ifelse($25,,"",_ref(""{""$25""}""));
	l_zettel	= ifelse($26,,"",_ref(""{""$26""}""));
	l_sondervor     = ifelse($27,,"",_ref(""{""$27""}""));
	l_fmenge	= ifelse($28,,"",_ref(""{""$28""}""));
	l_tunnel	= ifelse($29,,"",_ref(""{""$29""}""));
	l_abfall	= ifelse($30,,"",_ref(""{""$30""}""));

	if ( @getwert(SDGID_NEU) == "" )
	{
		SDGID_NEU = SDGID;
	}

	l_Sql= "  \
	insert into ssbg_gefahr \
	(  \
	    sbg_sdgid,  \
	    sbg_lfzl,  \
	    sbg_gefid,  \
	    sbg_version,  \
	    sbg_bez,  \
	    sbg_klasse,  \
	    sbg_ziffer,  \
	    sbg_buchstabe,  \
	    sbg_vgruppe,  \
	    sbg_unnr,  \
	    sbg_code,  \
	    sbg_handelsname,  \
	    sbg_bgew,  \
	    sbg_ngew,  \
            sbg_ngewe,  \
	    sbg_cbm,  \
	    sbg_bmenge,  \
	    sbg_umwelt,  \
	    sbg_ausnahme,  \
	    sbg_leer,  \
	    sbg_typ,  \
	    sbg_unit,  \
	    sbg_faktor,  \
	    sbg_punkte,  \
	    sbg_veptext,  \
            sbg_zusatz,  \
            sbg_vepid,  \
            sbg_zettel,  \
            sbg_sondervor,  \
	    sbg_fmenge,  \
            sbg_tunnel,  \
            sbg_abfall  \
	)  \
	values  \
	(  \
	    :SDGID_NEU,  \
	    :ZEILE_ID,  \
	    :l_gefid,  \
	    :l_version,  \
	    :l_bez,  \
	    :l_klasse,  \
	    :l_ziffer,  \
	    :l_buchstabe,  \
	    :l_vgruppe,  \
	    :l_unnr,  \
	    :l_code,  \
	    :l_handelsname,  \
	    :l_bgew,  \
	    :l_ngew,  \
            :l_ngewe,  \
	    :l_cbm,  \
	    decode(:l_bmenge,'Y',1,0),  \
	    decode(:l_umwelt,'Y',1,NULL),  \
	    decode(:l_ausnahme,'Y',1,NULL),  \
	    decode(:l_leer,'Y',1,NULL),  \
	    :l_typ,  \
	    :l_unit,  \
	    :l_faktor,  \
	    :l_punkte,  \
	    :l_veptext,  \
            :l_zusatz,  \
            :l_vepid,  \
            :l_zettel,  \
            :l_sondervor,  \
	    decode(:l_fmenge,'Y',1,'1',1,0),  \
	    :l_tunnel,  \
	    decode( :l_abfall,'Y',1,'1',1,0)  \
	)";
		@print(@sprintf(@nls_gettext_x("li_am.sbg_gefahr.insert")));
		@print(l_Sql);
		if (@SqlImmediate(l_Sql) == FALSE)
		{
			return (0-72);
		}
   @restore_vars();
	}
""}"")

/*
Anlegen von Charges zum AWB
*/

define(""{""AWB_CHARGES""}"",""{""
	{
	@save_vars( SDGID , SDGID_NEU );
	l_fraid	= ifelse($1,,"",_ref(""{""$1""}""));
	l_chaid		= 	ifelse($2,,"",_ref(""{""$2""}""));
	l_group	= ifelse($3,,"",_ref(""{""$3""}""));
	l_wert	= ifelse($4,,"",_ref(""{""$4""}""));

	if ( @getwert(LAFID_NEU) == "" )
	{
		LAFID_NEU = LAFID;
	}

l_tmp = "";
l_Sql = "SELECT awf_lafid FROM sawf_awbfrank \
			WHERE awf_lafid = :LAFID_NEU and awf_fraid = :l_fraid \
			INTO :l_tmp";

@SqlImmediate(l_Sql);
if ((l_tmp == "")  & (l_wert != 0 ))
{
	l_Sql= "  \
	insert into sawf_awbfrank \
	(  \
	    awf_lafid,  \
	    awf_fraid,  \
	    awf_chaid,  \
	    awf_fragroup,  \
	    awf_wert  \
	)  \
	values  \
	(  \
	    :LAFID_NEU,  \
	 	 :l_fraid,  \
	    :l_chaid,  \
	    :l_group,  \
	    :l_wert  \
	)";
}
else
{
   if (l_wert == 0 )
	{
		l_Sql ="DELETE FROM  sawf_awbfrank\
			WHERE awf_lafid  = :LAFID_NEU and awf_fraid = :l_fraid \
			";
	}
	else
	{
		l_Sql = "UPDATE sawf_awbfrank \
			set awf_fraid = :l_fraid \
			, awf_chaid = :l_chaid \
			, awf_fragroup = :l_group \
			, awf_wert = :l_wert \
			WHERE awf_lafid = :LAFID_NEU and awf_fraid = :l_fraid";
	}
}

		@print(@sprintf(@nls_gettext_x("li_am.awb_charges.insert")));
		@print(l_Sql);
		if (@SqlImmediate(l_Sql) == FALSE)
		{
			return (0-72);
		}
   @restore_vars();
	}
""}"")

/*
Anlegen Adressklassen
*/

define(""{""ADR_KLASSE""}"",""{""
	l_aklid	= ifelse($1,,"",_ref(""{""$1""}""));
	l_akgid	= ifelse($2,,"",_ref(""{""$2""}""));

	@print(@sprintf(@nls_gettext_x("li_am.adr_klasse.insert")));

	l_tmp = "";
	l_Sql = "SELECT akz_adrid FROM sakz_klaszo \
			WHERE akz_adrid = :ADRID and akz_aklid = :l_aklid and akz_akgid =:l_akgid \
			INTO :l_tmp";

	@SqlImmediate(l_Sql);
	if ( (l_tmp == "") & (l_aklid > "" ) & (l_akgid > "" ) ) {
		l_Sql= "insert into sakz_klaszo \
			( akz_adrid, akz_aklid, akz_akgid, akz_abstim, akz_aend, akz_usrid  )  \
			values  \
			( :ADRID, :l_aklid, :l_akgid, 0, SYSDATE, :USRID )";
		@print(l_Sql);
		if (@SqlImmediate(l_Sql) == FALSE) {
			return (0-72);
		}
	}
""}"")

/*
Anlegen Nachnahme
*/
define(""{""SDG_NN""}"",""{""
l_pnntyp = ifelse($1,,"",_ref($1));
l_wrgid  = ifelse($2,,"",_ref($2));
l_betrag = ifelse($3,,"",_ref($3));
l_pnnid  = ifelse($4,,"",_ref($4));

if (SDGID < " ")
	{ @abort(@sprintf(@nls_gettext_x("li_am.sdg_nn.abort_sdgid"))); }

if (l_pnntyp != "2")
{
		l_pnntyp = "1";
}

if (l_betrag != 0)
{
	l_tmp = "";
	l_Sql = "SELECT pnn_pnnid \
		FROM spnn_parteinn \
		WHERE pnn_pnnid = :l_pnnid \
		INTO	:l_tmp";
	@SqlImmediate(l_Sql);
	if (l_tmp == "")
		{ @abort(@sprintf(@nls_gettext_x("li_am.sdg_nn.abort_pnnid"))); }

	l_tmp = "";
	l_Sql = "SELECT wrg_wrgid \
		FROM swrg_t_waehrg \
		WHERE wrg_wrgid = :l_wrgid \
		INTO	:l_tmp";
	@SqlImmediate(l_Sql);
	if (l_tmp == "")
		{ @abort(@sprintf(@nls_gettext_x("li_am.sdg_nn.abort_wrgid"))); }
}

l_tmp = "";
l_Sql = "SELECT spn_pnntyp FROM sspn_sdgpnn \
			WHERE spn_sdgid = :SDGID and spn_pnntyp = :l_pnntyp \
			INTO :l_tmp";

@SqlImmediate(l_Sql);
if ((l_tmp == "")  & (l_betrag != 0 ))
{
   l_Sql = "INSERT INTO sspn_sdgpnn \
				(spn_sdgid, spn_pnntyp, spn_pnnid, spn_wrgid, spn_betrag) \
				VALUES (:SDGID, :l_pnntyp, :l_pnnid, :l_wrgid, :l_betrag)";
}
else
{
   if (l_betrag == 0 )
	{
		l_Sql ="DELETE FROM sspn_sdgpnn \
			WHERE spn_pnntyp = :l_pnntyp \
			AND	spn_sdgid = :SDGID";
	}
	else
	{
		l_Sql = "UPDATE sspn_sdgpnn \
			set spn_pnnid = :l_pnnid \
			, spn_wrgid = :l_wrgid \
			, spn_betrag = :l_betrag \
			WHERE spn_pnntyp = :l_pnntyp \
			AND	spn_sdgid = :SDGID";
	}
}
@print(@sprintf(@nls_gettext_x("li_am.sdg_nn.insert")));
@SqlImmediate(l_Sql);

""}"")

/*
Format zum Anlegen einer Lademittelbewegung
*/



define(""{""SLAD_LADMIT_NEU""}"",""{""
l_adrid= ifelse($1,,"",_ref($1));
l_lmbid= ifelse($2,,"",_ref($2));
l_anz  = ifelse($3,,0 ,_ref($3));
l_vepid= ifelse($4,,"",_ref($4));
l_datum= ifelse($5,,"",_ref($5));
l_ref  = ifelse($6,,"",_ref($6));
l_ladnr= ifelse($7,,"",_ref($7));
l_text = ifelse($8,,"",_ref($8));
l_orgid= ifelse($9,,AB_ID,_ref($9));
l_sdgid = "";
l_farid = "";
l_ltyid = "";
l_bucid = "";
l_usrid = @getwert(USRID);
l_abgleich = ifelse($10,,"",_ref($10));
l_lmbids = ifelse($11,,"",_ref($11));
l_ende = ifelse($12,,"0",_ref($12));
l_opt1 = ifelse($13,,"",_ref($13));
l_opt2 = ifelse($14,,"",_ref($14));
l_ladref = ifelse($15,,"",_ref($15));
l_konto = ifelse($16,,"",_ref($16));
l_gegenkonto = ifelse($17,,"",_ref($17));
l_belnr = ifelse($18,,"",_ref($18));
l_ortab = ifelse($19,,"",_ref($19));

@reset_vars(LADID_NEU);

if (@gesetzt(SDGID) == TRUE)
{
   if (@getwert(SDGID) > " ")
	{
		l_sdgid = SDGID;
		if (l_datum == "")
			{ l_datum = SDG_DATUM; }
	}
}

if (@gesetzt(FARID) == TRUE)
{
   if (@getwert(FARID) > " ")
	{
		l_farid = FARID;
		if (l_datum == "")
			{ l_datum = FAHRT_VON; }
      if (@getwert(LTYID) > " ")
		{
			l_ltyid = LTYID;
		}
	}
}

if (@gesetzt(BUCID) == TRUE)
{
   if (@getwert(BUCID) > " ")
	{
	   l_bucid = BUCID;
		if (l_datum == "")
			{ l_datum = BUC_DATUM; }
	}
}
if (l_datum == "")
	{ l_datum = SYS_DATUM; }

/* Oracle PL/SQL-Package slad_buch Prozedur ins aufrufen */
l_Sql_String = "BEGIN slad_buch.ins( "||l_adrid||",NULL,"||l_lmbid||", \
	        "||l_anz||", \
	        '"||l_vepid||"', \
	        '"||@quote2(l_ref)||"', \
	        '"||l_sdgid||"', \
	        '"||l_ltyid||"', \
	        '"||l_bucid||"', \
	        '"||l_farid||"', \
	        '"||@quote2(l_ladnr)||"', \
	        slaf.li_to_date('"||l_datum||"'), \
	        "||l_orgid||",0,0, \
	        '"||@quote2(l_text)||"', \
	        '"||l_usrid||"',NULL,'"||l_abgleich||"',\
                '"||l_lmbids||"','"||l_ende||"', \
                '"||@quote2(l_opt1)||"', \
                '"||@quote2(l_opt2)||"', \
                '"||@quote2(l_ladref)||"', \
                '"||@quote2(l_konto)||"', \
                '"||@quote2(l_gegenkonto)||"', \
                '"||@quote2(l_belnr)||"', \
                '"||@quote2(l_ortab)||"', \
                '' ); " \
			  || "END;";
     	       @print(l_Sql_String);
	       if (@SqlImmediate(l_Sql_String) == FALSE)
	       {
		  return (FALSE);
	       }
	       else
	       {
		  @SqlImmediate("select SUBSTR(slad_buch.last_ladid,1,254) from dual INTO :LADID_NEU");
                  @print( "LAST_LADID ->" || @getwert(LADID_NEU)      || "<-" );
	       }
	       ""}"")

/*
Definitionen Makros fuer Statusbibliothek
*/

/*
Format fuer Generieren Fahrt
*/


define(""{""CALL_STATUS""}"",""{""
	l_call = 0;
	@save_vars(BIB);
	BIB="STATUS";
	if ( @gesetzt(SDGID) == TRUE ) {
		l_call = @call(@getwert(BIB),FA_ID,FA_ID,LAUID,@getwert(LAUID),ADRID_EDI,@getwert(ADRID_EDI),ADRID_AG,@getwert(ADRID_AG), ADRID_EM,@getwert(ADRID_EM), ADRID_AB, @getwert(ADRID_AB));
	}
	else {
		l_call = @call(@getwert(BIB),FA_ID,@getwert(FA_ID),LAUID,@getwert(LAUID),ADRID_EDI,@getwert(ADRID_EDI,FALSE) );
	}
	@print (@sprintf(l_call));
	@restore_vars();
""}"")


/*
	Suchen LA Parameter latid, lauid, lasid, code1, code2
	gesaved Traeger Fahrt, Ladung, Sendung, Sendungspositition
	Eingrenzung suche nur auf obige Traeger
*/


define(""{""LA_SUCH""}"",""{""
	 {
/* 		@save_vars(_LA_VARS_LOOP, ANZAHL, FARID, LTYID, SDGID, ZEILE_ID ); */


		l_latid  = ifelse($1,,LATID,_ref(""{""$1""}""));
		l_lauid  = ifelse($2,,LAUID,_ref(""{""$2""}""));
		l_lasid  = ifelse($3,,"",$3);
		l_code1  = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));
		l_code2  = ifelse($5,,"",_ref(""{""$5""}""));
		l_orgidf = ifelse($6,,"",$2);
		if ( l_lasid != "" )
			{ l_sel = l_sel || " and laf_lasid = :l_lasid "; }
		if ( l_code1 != "" )
			{ l_sel = l_sel || " and laf_code1 = :l_code1 "; }
		if ( l_code2 != "" )
			{ l_sel = l_sel || " and laf_code2 = :l_code2 "; }


/* Ueberpruefung ob auf Traeger eingegrenzt werden kann */
	  	l_far = 0;
		l_sdg = 0;
		l_ldg = 0;
		l_t = "";

		l_sel= "Select nvl(lau_far,0), nvl(lau_ldg,0), nvl(lau_sdg,0)\
 			from slau_untertyp \
			where lau_latid = :l_latid \
			and lau_lauid = :l_lauid \
			into :l_far, :l_ldg, :l_sdg";

		@SqlImmediate(l_sel);

		if ( (l_sdg == 1) | (l_sdg == 2) ) {
			if ( @getwert(SDGID) > "" ) {
				l_t = " and  laf_sdgid = :l_la_such_sdgid ";
				l_la_such_sdgid = @getwert(SDGID);
			}
		}

		if ( (l_ldg == 1) | (l_ldg == 2) ) {
			if ( @gesetzt(LTYID) == TRUE ) {
				l_t =  l_t || " and  laf_ltyid = :l_la_such_ltyid ";
                                l_la_such_ltyid = @getwert(LTYID);
			}
		}

		if ( (l_far == 1) | (l_far == 2) ) {
			if ( @getwert(FARID) > "" ) {
				l_t = l_t || " and laf_farid = :l_la_such_farid ";
                                l_la_such_farid = @getwert(FARID);
			}
		}


/* Ende Ueberpruefung ob auf Traeger eingegrenzt werden kann */
/* Aufbau Selectstatement Suchen LA */

		l_sel = "select _LA_VARS_SELECT \
					from slaf_leistanf \
					where laf_latid = :l_latid \
					and laf_lauid = :l_lauid \
					and laf_lasid < '900'";
		if ( l_lasid != "" )
			{ l_sel = l_sel || " and laf_lasid = :l_lasid "; }
		if ( l_code1 != "" )
			{ l_sel = l_sel || " and laf_code1 = :l_code1 "; }
		if ( l_code2 != "" )
			{ l_sel = l_sel || " and laf_code2 = :l_code2 "; }
		if ( l_orgidf != "" )
			{ l_sel = l_sel || " and laf_orgidf = :l_orgidf "; }
  		if ( l_t != "" )
			{ l_sel =  l_sel || l_t ; }
		l_sel = l_sel || " order by laf_lasid into _LA_VARS_INTO";

   	l_sel_Cur = @SqlOpenCursor(HSQL);

		@print(l_sel);

   	@SqlPrepareAndExecute (l_sel_Cur, HSQL, l_sel );

		ANZAHL = 0;

		while (@SqlFetchNext (l_sel_Cur, HSQL) != 0)
		{
			ANZAHL = @getwert(ANZAHL) + 1;
		}
   	@SqlCloseCursor(l_sel_Cur, HSQL);

      if (@getwert(SDGID) < " ")
         { SDGID = l_la_such_sdgid; }
      if (@getwert(FARID) < " ")
			{ FARID = l_la_such_farid; }
      if (@getwert(LTYID) < " ")
			{ LTYID = l_la_such_ltyid; }
/*		@restore_vars(); */

	 }
""}"")

/*
Format fuer Generieren Pod information
WOSC 29.06.2000
neue Version

Voraussetzung auf POD Daten gibt es nur die Selectmethode ueber POD_LAFID
keine Methoden fuer weitere Attribute des POD-DS.

*/

#define LA_POD_INFO(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30) \
_LA_POD_INFO_m4(""{""p1""}"",""{""p2""}"",""{""p3""}"",""{""p4""}"",""{""p5""}"",""{""p6""}"",""{""p7""}"",""{""p8""}"",""{""p9""}"",""{""p10""}"",""{""p11""}"",""{""p12""}"",""{""p13""}"",""{""p14""}"",""{""p15""}"",""{""p16""}"",""{""p17""}"",""{""p18""}"",""{""p19""}"",""{""p20""}"",""{""p21""}"",""{""p22""}"",""{""p23""}"",""{""p24""}"",""{""p25""}"",""{""p26""}"",""{""p27""}"",""{""p28""}"",""{""p29""}"",""{""p30""}"")
define(""{""LA_POD_INFO""}"",""{""_LA_POD_INFO_m4""}"") /* WICHTIG, weil es das format mit Blank gibt, in m4 ist das blank aber weg, frth*/
define(""{""_LA_POD_INFO_m4""}"",""{""
@print(@sprintf(@nls_gettext_x("li_am.la_pod_info.start")));
	l_code      = ifelse(""{""$1""}"",,@getwert(POD_CODE),_ref_stable(""{""$1""}""));
	l_name      = ifelse(""{""$2""}"",,@getwert(POD_NAME),_ref_stable(""{""$2""}""));
	l_datum     = ifelse(""{""$3""}"",,@getwert(POD_DATUM),_ref_stable(""{""$3""}""));
	l_bemerkung = ifelse(""{""$4""}"",,@getwert(POD_BEMERKUNG),_ref_stable(""{""$4""}""));
	l_anzahl    = ifelse(""{""$5""}"",,@getwert(POD_ANZAHL),_ref_stable(""{""$5""}""));
	l_vepid     = ifelse(""{""$6""}"",,@getwert(POD_VEPID),_ref_stable(""{""$6""}""));
	l_znr       = ifelse(""{""$7""}"",,@getwert(POD_ZNR),_ref_stable(""{""$7""}""));
	l_bis       = ifelse(""{""$8""}"",,@getwert(POD_BIS),_ref_stable(""{""$8""}""));
	l_wzeit     = ifelse(""{""$9""}"",,@getwert(POD_WZEIT),_ref_stable(""{""$9""}""));
	l_location  = ifelse(""{""$10""}"",,@getwert(POD_LOCATION),_ref_stable(""{""$10""}""));
	l_lasid     = ifelse(""{""$11""}"",,"",_ref_stable(""{""$11""}""));
	l_such_lauid= ifelse(""{""$12""}"",,"",_ref_stable(""{""$12""}""));
	l_such_lasid= ifelse(""{""$13""}"",,"",_ref_stable(""{""$13""}""));
	l_gen2      = ifelse(""{""$14""}"",,"",_ref_stable(""{""$14""}""));
	l_colli     = ifelse(""{""$15""}"",,"N",_ref_stable(""{""$15""}""));
	l_barcd     = ifelse(""{""$16""}"",,"",_ref_stable(""{""$16""}""));
	l_tage      = ifelse(""{""$17""}"",,"100",_ref_stable(""{""$17""}""));
	l_verarb    = ifelse(""{""$18""}"",,"N",_ref_stable(""{""$18""}""));
	l_ebene     = ifelse(""{""$19""}"",,"",_ref_stable(""{""$19""}""));
	l_posid     = ifelse(""{""$20""}"",,"",_ref_stable(""{""$20""}""));
	l_fariddis  = ifelse(""{""$21""}"",,"",_ref_stable(""{""$21""}""));
	l_vkmid     = ifelse(""{""$22""}"",,"",_ref_stable(""{""$22""}""));
	l_vkmiddis  = ifelse(""{""$23""}"",,"",_ref_stable(""{""$23""}""));
	l_stodatvon = ifelse(""{""$24""}"",,"",_ref_stable(""{""$24""}""));
	l_stodatbis = ifelse(""{""$25""}"",,"",_ref_stable(""{""$25""}""));
	l_codeankunft= ifelse(""{""$26""}"",,"",_ref_stable(""{""$26""}""));
	l_unterschrift= ifelse(""{""$27""}"",,"",_ref_stable(""{""$27""}""));
	l_vepidcode = ifelse(""{""$28""}"",,"",_ref_stable(""{""$28""}""));
	l_vepidtext = ifelse(""{""$29""}"",,"",_ref_stable(""{""$29""}""));
	l_historie  = ifelse(""{""$30""}"",,"",_ref_stable(""{""$30""}""));
	l_adrid     = "NULL";

	l_lafid     = @getwert(POD_LAFID);
	l_sdgid     = @getwert(POD_SDGID);
	l_lfzl      = @getwert(POD_ZEILE_ID);
	l_farid     = @getwert(POD_FARID);
	l_orgidv    = @getwert(AG_ID);
	l_usridv    = @getwert(USRID);

ifelse(substr(""{""$15""}"",0,1),""{"""""}"",""{""""}"",""{""
	if (l_colli == "Y") {
""}"")
ifelse(substr(patsubst(""{""$15""}"",""{""^"Y.*$""}"",""{""VAR""}""),0,1),""{"""""}"",""{""""}"",""{""
		l_Sql_String = "BEGIN \
            SLAF.SET_CODID('" || @codid() || "'); \
				spodcol.setzen_Collistati_neu('" || l_lafid || "','"||
				l_sdgid		|| "', '" ||
				l_farid 	|| "', " ||
				l_lfzl  	|| ", '" ||
				l_barcd 	|| "', '" ||
				l_code		|| "', slaf.li_to_date('" ||
				l_datum	|| "'),'"  ||
				l_such_lauid		|| "', '" ||
				l_such_lasid		|| "', '" ||
				l_usridv	|| "', '" ||
				@quote2(l_location) || "', " ||
				l_anzahl 	|| ", '" ||
				l_vepid  	|| "', '" ||
				@quote2(l_bemerkung) 	|| "', '" ||
				@quote2(l_znr)    	|| "', slaf.li_to_date('" ||
				l_bis  		|| "'), '" ||
				l_wzeit		|| "', " ||
				l_adrid		|| ", '" ||
				@quote2(l_name)		|| "', '" ||
				l_fariddis	|| "', '" ||
				l_vkmid		|| "', '" ||
				l_vkmiddis    	|| "', slaf.li_to_date('" ||
				l_stodatvon  		|| "'), slaf.li_to_date('" ||
				l_stodatbis  	|| "'), '" ||
				l_codeankunft		|| "', '" ||
				@quote2(l_unterschrift)		|| "', '" ||
				l_vepidcode		|| "', '" ||
				@quote2(l_vepidtext)		|| "', '" ||
				l_lasid		|| "', '" ||
				l_verarb	|| "', " ||
				l_tage		|| ", '" ||
				l_posid		|| "','" ||
				l_ebene		|| "', '" ||
				l_gen2 		|| "', " ||
				l_orgidv 	|| ",'" ||
				l_historie 	|| "'" ||
				"); "  ||
            "SLAF.SET_CODID(NULL); " ||
				"END;";

		@print(@sprintf(@nls_gettext_x("li_am.la_pod_info.ebene")));
		@print(l_Sql_String);
		if (@SqlImmediate(l_Sql_String) == FALSE) 
		{
			return (FALSE);
		}

		if (@SqlImmediate("SELECT substr (spodcol.get_lasid,1,4), substr (spodcol.get_status,1,250), \
		 	substr (spodcol.get_sdgid,1,254), substr (spodcol.get_lafid,1,254), \
			 SGLO.get_errcode, SUBSTR( SGLO.get_errtext, 1 ,50 ),SUBSTR( SGLO.get_errclass, 1 ,50 ) from dual \
			INTO :LASID, :POD_RC, :SDGID, :LAFID, :RC, :RCTEXT, :RCCLASS") == FALSE)
		{
			return (FALSE);
		}

		@print(@sprintf("LAFID:(#!LAFID), LASID:(#!LASID), SDGID:(#!SDGID), POD_RC:(#!POD_RC), RC: (#!RC), RCTEXT:(#!RCTEXT), RCCLASS:(#!RCCLASS)"));

""}"")
ifelse(substr(""{""$15""}"",0,1),""{"""""}"",""{""""}"",""{""
	} else {
""}"")
ifelse(substr(patsubst(""{""$15""}"",""{""^[^"]*$""}"",""{"""N""}""),0,2),""{"""Y""}"",""{""""}"",""{""
		l_Sql_String = "BEGIN \
			spod.set_status('" || l_lafid || "','"||
			l_lauid	|| "', '" ||
			l_sdgid 	|| "', '" ||
			l_lfzl  	|| "', '" ||
			l_farid 	|| "', '" ||
			l_barcd	|| "', '" ||
			l_code 	|| "', '" ||
			@quote2(l_name) 	|| "', slaf.li_to_date('" ||
			l_datum	|| "'), '" ||
			@quote2(l_bemerkung) || "', '" ||
			l_anzahl || "', '" ||
			l_vepid  || "', '" ||
			@quote2(l_znr)    || "', slaf.li_to_date('" ||
			l_bis  	|| "'), '" ||
			l_wzeit	|| "', '" ||
			@quote2(l_location)|| "', " ||
			l_adrid	|| ", '" ||
			l_lasid	|| "', '" ||
			l_such_lasid|| "', '" ||
			l_such_lauid|| "', '" ||
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
		@print(@sprintf("POD_LAFID:(#!POD_LAFID)"));
""}"")
ifelse(substr(""{""$15""}"",0,1),""{"""""}"",""{""""}"",""{""
	}
""}"")

""}"")


undefine(""{""_LOOP_RSET""}"")
define(""{""_POD_VARS_INTO""}"",""{"":POD_LAUID, :POD_LASID, :POD_CODE,:POD_NAME,:POD_DATUM,:POD_BIS,:POD_BEMERKUNG,:POD_ANZAHL,:POD_VEPID,:POD_ZNR,:POD_WZEIT,:POD_LOCATION,:POD_LAFID,:POD_SDGID,:POD_ZEILE_ID,:POD_ZEILE_BARCODE,:POD_FARID,:POD_LTYID""}"")

define(""{""_POD_VARS_LOOP""}"",""{"" POD_LAUID,POD_LASID, POD_CODE,POD_NAME,POD_DATUM,POD_BIS,POD_BEMERKUNG,POD_ANZAHL,POD_VEPID,POD_ZNR,POD_WZEIT,POD_LOCATION,POD_LAFID,POD_SDGID,POD_ZEILE_ID,POD_ZEILE_BARCODE,POD_FARID, POD_LTYID""}"")

define(""{""_POD_VARS_SELECT""}"",""{"" LAF_LAUID, LAF_LASID, POD_CODE,POD_NAME,to_char(POD_DATUM,'YYYY.MM.DD HH24:MI'),to_char(POD_BIS,'YYYY.MM.DD HH24:MI'),POD_BEMERKUNG,POD_ANZAHL,POD_VEPID,POD_ZNR,POD_WZEIT,POD_LOCATION,POD_LAFID,POD_SDGID,POD_LFZL,POD_BARCD,LAF_FARID,LAF_LTYID""}"")


define(""{""_LOOP_VARS""}"", ""{""_POD_VARS_LOOP""}"")
define(""{""_LOOP_NAME""}"",""{""POD-Info fuer SDG/FAR/LA""}""  )

define(""{""_LOOP_SELECT""}"", ""{"""select _POD_VARS_SELECT from slaf_leistanf, spod_pod " || l_pod_info_where || " order by laf_lasid desc, laf_daterl, laf_datanf into _POD_VARS_INTO; """}"")

define(""{""POD_INFO""}"", ""{""
	l_pod_info_where = "where laf_lafid = pod_lafid (+) and laf_latid = 'ST' and laf_lasid < '900'";

	l_sdgid  = @getwert(POD_SDGID);
	l_farid  = @getwert(POD_FARID);
	l_lafid  = @getwert(POD_LAFID);
	l_lafidv = @getwert(LAFIDV);

	if ( l_sdgid > "" )
	{
		l_pod_info_where = l_pod_info_where || " and laf_sdgid = :l_sdgid ";
	}
	else
	{
		if ( l_farid > "" )
		{
			l_pod_info_where = l_pod_info_where || " and laf_farid = :l_farid ";
		}
		else
		{
			if ( l_lafid > "" )
			{
				l_pod_info_where = l_pod_info_where || " and laf_lafid = :l_lafid ";
			}
			else
			{
			    /* ( l_lafidv > "" )  */
				 l_pod_info_where = l_pod_info_where || " and laf_lafidv = :l_lafidv ";
			}
		}
	}
	l_pod_info_where = l_pod_info_where || l_p_where;
   ""}""
	_LOOP
   )


/********
Freie Textadressen Anlegen
*/
/* WRAPPER, damit Kommas den M4 nicht verwirren */
#define ADR_NEU(ADR_TXTADR, ADR_NAME1, ADR_NAME2, ADR_ANREDE, ADR_STR, ADR_STR2, ADR_STAID, ADR_ORTID, ADR_PLZ, ADR_ORT, ADR_SPRACHE) \
ADR_NEU_M4(""{""ADR_TXTADR""}"", ""{""ADR_NAME1""}"", ""{""ADR_NAME2""}"", ""{""ADR_ANREDE""}"", ""{""ADR_STR""}"", ""{""ADR_STR2""}"", ""{""ADR_STAID""}"", ""{""ADR_ORTID""}"", ""{""ADR_PLZ""}"", ""{""ADR_ORT""}"", ""{""ADR_SPRACHE""}"")

define(""{""ADR_NEU_M4""}"",""{""
	l_rc = "";
	l_adrtyp	= ifelse($1,,"adx",_ref(""{""$1""}""));
	l_name1	= ifelse(""{""$2""}"",,"",_ref_stable(""{""$2""}""));
	l_name2	= ifelse(""{""$3""}"",,"",_ref_stable(""{""$3""}""));
	l_anrid	= ifelse($4,,"",_ref(""{""$4""}""));
	l_str	= ifelse(""{""$5""}"",,"",_ref_stable(""{""$5""}""));
	l_str2	= ifelse(""{""$6""}"",,"",_ref_stable(""{""$6""}""));
	l_staid	= ifelse($7,,"",_ref(""{""$7""}""));
	l_ortid	= ifelse($8,,"",_ref(""{""$8""}""));
	l_plz	= ifelse(""{""$9""}"",,"",_ref_stable(""{""$9""}""));
	l_ort	= ifelse(""{""$10""}"",,"",_ref_stable(""{""$10""}""));
	l_sprid	= ifelse($11,,"",_ref(""{""$11""}""));
	l_agid = @getwert(AG_ID);
	@print(@sprintf(@nls_gettext_x("li_am.adr_neu.get_num")));
	if ( l_adrtyp == "adr" ) {
		l_Sql_String = "BEGIN SFRI.HOLE_FREIE_ADRID_ORG( '" || l_agid || "' ); END;";
	} else {
		l_Sql_String = "BEGIN sfri.hole_freie_id_intern( lower('" ||l_adrtyp || "') ); END;";
	}
	@print( l_Sql_String);
	if (@SqlImmediate(l_Sql_String) == FALSE) {
		return (0 - 72);
	}
	if (@SqlImmediate("Select sfri.get_freie_adrid, sfri.get_freie_adrid_rc from dual into :ADRID_NEU, :l_rc;" ) == FALSE) {
		return (0-72);
	}
	@print(@sprintf(@nls_gettext_x("li_am.adr_neu.new_adrid")));
	l_Sql_String = " \
	INSERT INTO    sadr_adresse ( \
                  adr_adrid,  adr_name1,  adr_name2,  adr_anrid, \
                  adr_str,    adr_ort,    adr_ortid,  adr_plz, \
                  adr_staid,  adr_sprid,  adr_txtadr, adr_adrkz, \
                  adr_aend,   adr_usrid,  adr_abstim, adr_sperre, \
                  adr_str2) \
   VALUES         ( \
                  :ADRID_NEU,     :l_name1,     :l_name2,     :l_anrid, \
                  :l_str,       :l_ort,       :l_ortid,     :l_plz, \
                  :l_staid,     :l_sprid,     1,          0, \
                  SYSDATE,    :USRID,   0,          0, \
                  :l_str2)";
	@print(l_Sql_String);
	if (@SqlImmediate(l_Sql_String) == FALSE) {
		return (0-72);
	}
  ""}"")

/*************************************************************************
Lesen Codeumsetzung
	Parameter 1: INT/EXT, 2: Attributname, 3: Adresse, 4: Wert, 5:Ergebnis

*/
define(""{""LCODE""}"", ""{""
l_key      = $1;
l_attribut = $2;
l_adrid    = ifelse($3,,ADRID_DU,ifelse(substr($3,0,1),",@sprintf($3),$3));
l_wert     = ifelse(substr($4,0,1),",@sprintf($4),substr($4,0,1),!,@getwert(substr($4,1)),$4);
l_adrdef   = ifelse($6,,"",_ref(""{""$6""}""));
@print(@sprintf(@nls_gettext_x("li_am.lcode.read")));
l_into     = "";
@SqlImmediate("SELECT Substr (scdu.get_code( :l_key , :l_attribut, :l_adrid, :l_wert, :l_adrdef),1,250) \
	FROM  dual \
	INTO  :l_into");
$5 = l_into;
""}"")

/*************************************************************************
Anlegen Codeumsetzung
*/
define(""{""CODEUMS_NEU""}"",""{""
	l_adrid	= ifelse($1,,"",_ref(""{""$1""}""));
	l_attid	= ifelse($2,,"",_ref(""{""$2""}""));
	l_code_ext	= ifelse($3,,"",_ref(""{""$3""}""));
	l_code_int	= ifelse($4,,"",_ref(""{""$4""}""));
	l_nach_int	= ifelse($5,,"N",_ref(""{""$5""}""));
	l_nach_ext	= ifelse($6,,"N",_ref(""{""$6""}""));
	l_dummy = "";
	@print(@sprintf(@nls_gettext_x("li_am.codeums_neu.insert")));

	if ( ( l_nach_int != "Y" ) & ( l_nach_ext != "Y" ) )
	{
		@meldung(@sprintf(@nls_gettext_x("li_am.codeums_neu.err_nach")));
		return (0-12);
	}

	if ( l_nach_int == "Y" )
	{
		l_Sql_String = " SELECT 1 from scdu_codeums \
			where cdu_adrid = :l_adrid and cdu_attid = :l_attid \
			and cdu_cdextern = :l_code_ext \
			and cdu_nachint = 1 \
			INTO :l_dummy ";
		if (@SqlImmediate(l_Sql_String) != FALSE)
		{
			@meldung(@sprintf(@nls_gettext_x("li_am.codeums_neu.err_nach_ext")));
			return (0-12);
		}
	}

	if ( l_nach_ext == "Y" )
	{
		l_Sql_String = " SELECT 1 from scdu_codeums \
			where cdu_adrid = :l_adrid and cdu_attid = :l_attid \
			and cdu_cdintern = :l_code_int \
			and cdu_nachext = 1 \
			INTO :l_dummy ";
		if (@SqlImmediate(l_Sql_String) != FALSE)
		{
			@meldung(@sprintf(@nls_gettext_x("li_am.codeums_neu.err_nach_int")));
			return (0-12);
		}
	}

	l_vs = "-";
        @SqlImmediate("SELECT cfg_cfeld || '-' FROM scfg_config WHERE cfg_cfgid = 'VS' INTO :l_vs");

	l_Sql_String = " \
	INSERT INTO    scdu_codeums ( cdu_cduid, cdu_adrid, cdu_attid, \
							cdu_cdextern, cdu_cdintern, cdu_nachext, cdu_nachint, \
							cdu_deflt, cdu_defltext, cdu_aend, cdu_usrid ) \
   VALUES         ( :l_vs || sseq_scdu.nextval, :l_adrid, :l_attid, \
                  :l_code_ext, :l_code_int, decode(:l_nach_ext, 'Y', 1, 0), \
						decode(:l_nach_int, 'Y', 1, 0), 0, 0, SYSDATE,    :USRID )";

	if (@SqlImmediate(l_Sql_String) == FALSE)
	{
		@print(@sprintf(@nls_gettext_x("li_am.codeums_neu.err_insert")));
		return (0-72);
	}
""}"")

/*************************************************************************
Setzen Session-Context
	Parameter	1: User
					2: Orgid */

define(""{""SCONTEXT""}"", ""{""
l_user  = ifelse($1,,"NULL",_ref(""{""""{""$1""}""""}""));
l_orgid = ifelse($2,,"NULL",_ref(""{""""{""$2""}""""}""));
@print(@sprintf(@nls_gettext_x("li_am.scontext.set")));
if ( @SqlImmediate("BEGIN cbus.set_context('"||l_user||"',"||l_orgid||"); END;") == FALSE )
{
	@abort(@sprintf(@nls_gettext_x("li_am.scontext.abort")));
}
""}"")

/*************************************************************************
Setzen Session-Context-ADRID
	Parameter	1: Adrid - Optional
	Parameter	2: LVEID - Optional
*/

define(""{""SCONTEXT_ADRID""}"", ""{""
l_sql = "";
l_context_string = "";
ifelse($1,,,l_adrid =_ref_stable(""{""$1""}"");
	if (l_adrid+0 != 0 ) {
		l_sql = l_sql || "cbus.set_context_adrid(" || (l_adrid+0) || ");"; 
		l_context_string = (l_context_string || ",ADRID:(" || (l_adrid+0) || ")");
	}
)
ifelse($2,,,l_lveid = _ref(""{""""{""$2""}""""}"");
	if (l_lveid != "" ) {
		l_sql = l_sql || "cbus.set_context_lveid('" || l_lveid || "');";
		l_context_string = (l_context_string || ",LVEID:(" || l_lveid || ")");
	}
)
if (l_sql > "") {
	l_sql = "BEGIN " || l_sql || " END;";
	l_context_string = @substr (l_context_string,2);
	@print(@sprintf(@nls_gettext_x("li_am.scontext_adrid.set")));
	if ( @SqlImmediate(l_sql) == FALSE )
	{
		@abort(@sprintf(@nls_gettext_x("li_am.scontext_adrid.abort")));
	}
}
""}"")

/*************************************************************************
Holen Konfigurations-Wert
	Parameter	1: Name des Konfigurations Objekts
					2: Name eines Property zu Konfigurations-Objekt
	Return		3: Wert des Property */

define(""{""RCONFIG""}"", ""{""
l_sql_attrib = "";
l_sql_into = "";
l_temp = "";
l_komma = ",";
l_conf = ifelse($1,,"NULL",_ref(""{""""{""$1""}""""}""));

l_info = "";
@print(@sprintf(@nls_gettext_x("li_am.rconfig.call")));

ifelse($2,,, l_value1 = ""; l_domain1 = ""; l_prop1 = _ref($2); )
ifelse($2,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop1),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($2,,, l_sql_into   = l_sql_into   || " :l_value1 " || l_komma || " :l_domain1" || l_komma || " ";)

ifelse($4,,, l_value2 = ""; l_domain2 = ""; l_prop2 = _ref($4); )
ifelse($4,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop2),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($4,,, l_sql_into   = l_sql_into   || " :l_value2 " || l_komma || " :l_domain2" || l_komma || " ";)

ifelse($6,,, l_value3 = ""; l_domain3 = ""; l_prop3 = _ref($6); )
ifelse($6,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop3),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($6,,, l_sql_into   = l_sql_into   || " :l_value3 " || l_komma || " :l_domain3" || l_komma || " ";)

ifelse($8,,, l_value4 = ""; l_domain4 = ""; l_prop4 = _ref($8); )
ifelse($8,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop4),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($8,,, l_sql_into   = l_sql_into   || " :l_value4 " || l_komma || " :l_domain4" || l_komma || " ";)

ifelse($10,,, l_value5 = ""; l_domain5 = ""; l_prop5 = _ref($10); )
ifelse($10,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop5),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($10,,, l_sql_into   = l_sql_into   || " :l_value5 " || l_komma || " :l_domain5" || l_komma || " ";)

ifelse($12,,, l_value6 = ""; l_domain6 = ""; l_prop6 = _ref($12); )
ifelse($12,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop6),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($12,,, l_sql_into   = l_sql_into   || " :l_value6 " || l_komma || " :l_domain6" || l_komma || " ";)

ifelse($14,,, l_value7 = ""; l_domain7 = ""; l_prop7 = _ref($14); )
ifelse($14,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop7),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($14,,, l_sql_into   = l_sql_into   || " :l_value7 " || l_komma || " :l_domain7" || l_komma || " ";)

ifelse($16,,, l_value8 = ""; l_domain8 = ""; l_prop8 = _ref($16); )
ifelse($16,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop8),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($16,,, l_sql_into   = l_sql_into   || " :l_value8 " || l_komma || " :l_domain8" || l_komma || " ";)

ifelse($18,,, l_value9 = ""; l_domain9 = ""; l_prop9 = _ref($18); )
ifelse($18,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop9),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($18,,, l_sql_into   = l_sql_into   || " :l_value9 " || l_komma || " :l_domain9" || l_komma || " ";)

ifelse($20,,, l_value10 = ""; l_domain10 = ""; l_prop10 = _ref($20); )
ifelse($20,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop10),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($20,,, l_sql_into   = l_sql_into   || " :l_value10 " || l_komma || " :l_domain10" || l_komma || " ";)

ifelse($22,,, l_value11 = ""; l_domain11 = ""; l_prop11 = _ref($22); )
ifelse($22,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop11),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($22,,, l_sql_into   = l_sql_into   || " :l_value11 " || l_komma || " :l_domain11" || l_komma || " ";)

ifelse($24,,, l_value12 = ""; l_domain12 = ""; l_prop12 = _ref($24); )
ifelse($24,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop12),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($24,,, l_sql_into   = l_sql_into   || " :l_value12 " || l_komma || " :l_domain12" || l_komma || " ";)

ifelse($26,,, l_value13 = ""; l_domain13 = ""; l_prop13 = _ref($26); )
ifelse($26,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop13),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($26,,, l_sql_into   = l_sql_into   || " :l_value13 " || l_komma || " :l_domain13" || l_komma || " ";)

ifelse($28,,, l_value14 = ""; l_domain14 = ""; l_prop14 = _ref($28); )
ifelse($28,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop14),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($28,,, l_sql_into   = l_sql_into   || " :l_value14 " || l_komma || " :l_domain14" || l_komma || " ";)

ifelse($30,,, l_value15 = ""; l_domain15 = ""; l_prop15 = _ref($30); )
ifelse($30,,, l_sql_attrib = l_sql_attrib || " SUBSTR(CBUS.RESOLVE_CONFIG_VALUE(:l_conf,:l_prop15),1,250)" || l_komma || " SUBSTR(CBUS.RESOLVE_CONFIG_DOMAIN(),1,30)" || l_komma || " ";)
ifelse($30,,, l_sql_into   = l_sql_into   || " :l_value15 " || l_komma || " :l_domain15" || l_komma || " ";)

l_session_usrid_neu = "";
l_session_orgid_neu = "";
l_session_adrid_neu = "";

undefine( _RCONFIG_TEMP_SESSION )
ifelse($32,,, ""{""l_session_usrid_neu = _ref($32); define( _RCONFIG_TEMP_SESSION , TEMP_SESSION )""}"" )
ifelse($33,,, ""{""l_session_orgid_neu = _ref($33); define( _RCONFIG_TEMP_SESSION , TEMP_SESSION )""}"" )
ifelse($34,,, ""{""l_session_adrid_neu = _ref($34); define( _RCONFIG_TEMP_SESSION , TEMP_SESSION )""}"" )

l_session_usrid_alt = "";
l_session_orgid_alt = "";
l_session_adrid_alt = "";

ifdef( _RCONFIG_TEMP_SESSION , ""{""
l_sql = "SELECT SUBSTR(CBUS.GET_USRID(),1,254),SUBSTR(CBUS.GET_CONTEXT_ADRID(),1,254),SUBSTR( DECODE(CBUS.GET_AG(), 0, DECODE(CBUS.GET_AB(),0,DECODE(CBUS.GET_NL(),0,DECODE(CBUS.GET_FA(),0,CBUS.GET_KO(),CBUS.GET_FA()),CBUS.GET_NL()),CBUS.GET_AB()), CBUS.GET_AG()),1,254) FROM dual INTO :l_session_usrid_alt, :l_session_adrid_alt, :l_session_orgid_alt ";
@SqlImmediate( l_sql );
l_sql = "BEGIN ";
if ( l_session_usrid_neu > "" | l_session_orgid_neu > "" ) {
	if ( l_session_usrid_neu <= "" ) {
		l_session_usrid_neu = l_session_usrid_alt;
	}
	if ( l_session_orgid_neu <= "" ) {
		l_session_orgid_neu = l_session_orgid_alt;
		if ( l_session_orgid_neu <= "" ) {
			l_session_orgid_neu = "null" ;
			l_session_orgid_alt = "null" ;
		}
	}
	l_sql = l_sql || "CBUS.SET_CONTEXT( '" || @quote2( l_session_usrid_neu ) || "', " || l_session_orgid_neu || "); ";
}
if ( l_session_adrid_neu > "" ) {
	l_sql = l_sql || "CBUS.SET_CONTEXT_ADRID( " || l_session_adrid_neu || " );";
}
l_sql = l_sql || " END;";
@print( l_sql );
@SqlImmediate( l_sql );
""}"")

l_sql = "SELECT " || l_sql_attrib || " 'dummy' FROM dual INTO " || l_sql_into || " :l_temp";
@SqlImmediate( l_sql );

ifelse($3,,,$3 = l_value1;)
ifelse($3,,,@print("property1: (" || l_prop1 || ") value:(" || l_value1 || ") domain:(" || l_domain1 || ")"); )

ifelse($5,,,$5 = l_value2;)
ifelse($5,,,@print("property2: (" || l_prop2 || ") value:(" || l_value2 || ") domain:(" || l_domain2 || ")"); )

ifelse($7,,,$7 = l_value3;)
ifelse($7,,,@print("property3: (" || l_prop3 || ") value:(" || l_value3 || ") domain:(" || l_domain3 || ")"); )

ifelse($9,,,$9 = l_value4;)
ifelse($9,,,@print("property4: (" || l_prop4 || ") value:(" || l_value4 || ") domain:(" || l_domain4 || ")"); )

ifelse($11,,,$11 = l_value5;)
ifelse($11,,,@print("property5: (" || l_prop5 || ") value:(" || l_value5 || ") domain:(" || l_domain5 || ")"); )

ifelse($13,,,$13 = l_value6;)
ifelse($13,,,l_info = l_info || "property6: (" || l_prop6 || ") value:(" || l_value6 || ") domain:(" || l_domain6 || ")" || l_komma || " "; )
ifelse($13,,,@print("property6: (" || l_prop6 || ") value:(" || l_value6 || ") domain:(" || l_domain6 || ")"); )

ifelse($15,,,$15 = l_value7;)
ifelse($15,,,l_info = l_info || "property7: (" || l_prop7 || ") value:(" || l_value7 || ") domain:(" || l_domain7 || ")" || l_komma || " "; )
ifelse($15,,,@print("property7: (" || l_prop7 || ") value:(" || l_value7 || ") domain:(" || l_domain7 || ")"); )

ifelse($17,,,$17 = l_value8;)
ifelse($17,,,@print("property8: (" || l_prop8 || ") value:(" || l_value8 || ") domain:(" || l_domain8 || ")"); )

ifelse($19,,,$19 = l_value9;)
ifelse($19,,,@print("property9: (" || l_prop9 || ") value:(" || l_value9 || ") domain:(" || l_domain9 || ")"); )

ifelse($21,,,$21 = l_value10;)
ifelse($21,,,@print("property10: (" || l_prop10 || ") value:(" || l_value10 || ") domain:(" || l_domain10 || ")"); )

ifelse($23,,,$23 = l_value11;)
ifelse($23,,,@print("property11: (" || l_prop11 || ") value:(" || l_value11 || ") domain:(" || l_domain11 || ")"); )

ifelse($25,,,$25 = l_value12;)
ifelse($25,,,@print("property12: (" || l_prop12 || ") value:(" || l_value12 || ") domain:(" || l_domain12 || ")"); )

ifelse($27,,,$27 = l_value13;)
ifelse($27,,,@print("property13: (" || l_prop13 || ") value:(" || l_value13 || ") domain:(" || l_domain13 || ")"); )

ifelse($29,,,$29 = l_value14;)
ifelse($29,,,@print("property14: (" || l_prop14 || ") value:(" || l_value14 || ") domain:(" || l_domain14 || ")"); )

ifelse($31,,,$31 = l_value15;)
ifelse($31,,,@print("property15: (" || l_prop15 || ") value:(" || l_value15 || ") domain:(" || l_domain15 || ")"); )

ifdef( _RCONFIG_TEMP_SESSION , ""{""
l_sql = "BEGIN ";
if ( l_session_usrid_neu > "" | l_session_orgid_neu > "" ) {
	l_sql = l_sql || "CBUS.SET_CONTEXT( '" || @quote2( l_session_usrid_alt ) || "', " || l_session_orgid_alt || "); ";
}
if ( l_session_adrid_neu > "" ) {
	if ( l_session_adrid_alt <= "" ) { l_session_adrid_alt = "NULL"; }
	l_sql = l_sql || "CBUS.SET_CONTEXT_ADRID( " || l_session_adrid_alt || " );";
}
l_sql = l_sql || " END;";
@print( l_sql );
@SqlImmediate( l_sql );
""}"")
""}"")

/*************************************************************************
Setzen ACL
	Parameter	1: Typ
					2: Key
					3: ACL-Id */

define(""{""SETACL""}"", ""{""
l_typ  = ifelse($1,,"NULL",_ref(""{""""{""$1""}""""}""));
l_key  = ifelse($2,,"NULL",_ref(""{""""{""$2""}""""}""));
l_aclid = ifelse($3,,"NULL",_ref(""{""""{""$3""}""""}""));
if ( (l_typ == "NULL") | (l_key == "NULL") ) {
	@abort(@sprintf(@nls_gettext_x("li_am.setacl.abort_typkey")));
}
@print(@sprintf(@nls_gettext_x("li_am.setacl.call")));
if ( @SqlImmediate("BEGIN cacl.set_acl('"||l_typ||"','"||l_key||"','"||l_aclid||"'); END;") == FALSE ) {
	@abort(@sprintf(@nls_gettext_x("li_am.setacl.abort")));
}
""}"")


/*************************************************************************
Berechnen Anzahl Kalender/Wochen/Arbeitstage
	Parameter :flag(K/W/A),von_datum,bis_datum,adrid,staid,plz,anz_tage_kwa

*/
define(""{""DIFF_ZEIT_TAGE""}"", ""{""
l_key       = ifelse($1,,"",_ref(""{""$1""}""));
l_von_datum = ifelse($2,,"",_ref(""{""$2""}""));
l_bis_datum = ifelse($3,,"",_ref(""{""$3""}""));
l_adrid	= ifelse($4,,"",_ref(""{""$4""}""));
l_staid     = ifelse($5,,"",_ref(""{""$5""}""));
l_plz       = ifelse($6,,"",_ref(""{""$6""}""));
l_anz = "";
l_anz_fei = "";

l_par1 = "slaf.li_to_date('"||l_von_datum||"')";
l_par2 = "slaf.li_to_date('"||l_bis_datum||"')";
l_cmd = "sfei.anz_kwa_tage(:l_von_datum,:l_bis_datum,:l_adrid,:l_staid,:l_plz,:l_key,:l_anz,:l_anz_fei)";
@print (l_cmd);
l_Cur = @SqlOpenCursor(HSQL);
if (@SqlPLSQL(l_Cur,HSQL,l_cmd) == FALSE)
{
	@SqlCloseCursor(l_Cur,HSQL);
	return (FALSE);
}
else
{
	@SqlCloseCursor(l_Cur,HSQL);
	$7 = l_anz;
	ifelse($8,,,$8 = l_anz_fei;)
}
""}"")
/*************************************************************************
	Neuanlegen Luftfracht (Kopfdaten in SAWB_AWB. Das Vorhandenseit der LAF
	ist Voraussetzung

*/

define(""{""SAWB_NEU""}"", ""{""

if (LAFID == ""  ){
 return(FALSE);
 }

        l_latid = "";
        l_lauid = "";
 	l_ret = @SqlImmediate("SELECT laf_latid,laf_lauid   \
			FROM SLAF_LEISTANF \
			WHERE laf_lafid=:LAFID and LAF_LATID='DR'   \
			and LAF_LAUID in ('AWB','HWB','MWB')   \
	      INTO :l_latid,:l_lauid");
        if (l_latid == ""){
				@print(@sprintf(@nls_gettext_x("li_am.sawb_neu.error")));
				return (FALSE);
        }
	@print ("LRET===="||l_latid);

	l_awb_airprefix = ifelse($1,,"",_ref(""{""$1""}""));
	l_awb_awbid = ifelse($2,,"",_ref(""{""$2""}""));
	@print ("AWB ID=="||l_awb_awbid);
	l_awb_absairport = ifelse($3,,"",_ref(""{""$3""}""));
	ABFLUGHAFEN = l_awb_absairport;
	l_awb_empfairport = ifelse($4,,"",_ref(""{""$4""}""));
	EMPFFLUGHAFEN = l_awb_empfairport;
	l_awb_waehrung = ifelse($5,,"",_ref(""{""$5""}""));
	l_awb_frank = ifelse($6,,"",_ref(""{""$6""}""));
	l_awb_frankzusatz = ifelse($7,,"",_ref(""{""$7""}""));
	l_awb_wertcarrier = ifelse($8,,"",_ref(""{""$8""}""));
	l_awb_wertkunden = ifelse($9,,"",_ref(""{""$9""}""));
	l_awb_wertvers = ifelse($10,,"",_ref(""{""$10""}""));
	l_awb_kundenstatu = ifelse($11,,"",_ref(""{""$11""}""));
	l_awb_airid = ifelse($12,,"",_ref(""{""$12""}""));
	l_awb_flugnummer = ifelse($13,,"",_ref(""{""$13""}""));
	l_awb_flugdatum = ifelse($14,,"",_ref(""{""$14""}""));
	l_awb_eta = ifelse($15,,"",_ref(""{""$15""}""));
	l_awb_airid2 = ifelse($16,,"",_ref(""{""$16""}""));
	l_awb_flugnummer2 = ifelse($17,,"",_ref(""{""$17""}""));
	l_awb_flugdatum2 = ifelse($18,,"",_ref(""{""$18""}""));
	l_awb_eta2 = ifelse($19,,"",_ref(""{""$19""}""));
	l_awb_airid3 = ifelse($20,,"",_ref(""{""$20""}""));
	l_awb_flugnummer3 = ifelse($21,,"",_ref(""{""$21""}""));
	l_awb_flugdatum3 = ifelse($22,,"",_ref(""{""$22""}""));
	l_awb_eta3 = ifelse($23,,"",_ref(""{""$23""}""));
	l_awb_hand = ifelse($24,,"",_ref(""{""$24""}""));
	l_awb_marks = ifelse($25,,"",_ref(""{""$25""}""));
	l_awb_docs = ifelse($26,,"",_ref(""{""$26""}""));
	l_awb_text1 = ifelse($27,,"",_ref(""{""$27""}""));
	l_awb_accountinf = ifelse($28,,"",_ref(""{""$28""}""));
	l_awb_text2 = ifelse($29,,"",_ref(""{""$29""}""));
	l_awb_abrechnung = ifelse($30,,"",_ref(""{""$30""}""));
	if ( l_awb_abrechnung == "Y" ){
		l_awb_abrechnung = "1";
	}else{
		if ( l_awb_abrechnung == "N" ){
			l_awb_abrechnung = "0";
		}
	}
	l_awb_masterroute = ifelse($31,,"",_ref(""{""$31""}""));
	if ( l_awb_masterroute == "Y" ){
		l_awb_masterroute = "1";
	}else{
		if ( l_awb_masterroute == "N" ){
			l_awb_masterroute = "0";
		}
	}
	l_awb_mastercharb = ifelse($32,,"",_ref(""{""$32""}""));
	if ( l_awb_mastercharb == "Y" ){
		l_awb_mastercharb = "1";
	}else{
		if ( l_awb_mastercharb == "N" ){
			l_awb_mastercharb = "0";
		}
	}
	l_awb_iata = ifelse($33,,"",_ref(""{""$33""}""));
	l_awb_account = ifelse($34,,"",_ref(""{""$34""}""));
	l_awb_refairline = ifelse($35,,"",_ref(""{""$35""}""));
	l_awb_osc1 = ifelse($36,,"",_ref(""{""$36""}""));
	l_awb_osc2 = ifelse($37,,"",_ref(""{""$37""}""));
	l_awb_route = ifelse($38,,"",_ref(""{""$38""}""));
	l_awb_empfairbez = ifelse($39,,"",_ref(""{""$39""}""));
	l_awb_dgr = ifelse($40,,"",_ref(""{""$40""}""));
	if ( l_awb_dgr == "Y" ){
		l_awb_dgr = "1";
	}else{
		if ( l_awb_dgr == "N" ){
			l_awb_dgr = "0";
		}
	}
	l_awb_hea = ifelse($41,,"",_ref(""{""$41""}""));
	if ( l_awb_hea == "Y" ){
		l_awb_hea = "1";
	}else{
		if ( l_awb_hea == "N" ){
			l_awb_hea = "0";
		}
	}
	l_awb_val = ifelse($42,,"",_ref(""{""$42""}""));
	if ( l_awb_val == "Y" ){
		l_awb_val = "1";
	}else{
		if ( l_awb_val == "N" ){
			l_awb_val = "0";
		}
	}
	l_awb_pac = ifelse($43,,"",_ref(""{""$43""}""));
	if ( l_awb_pac == "Y" ){
		l_awb_pac = "1";
	}else{
		if ( l_awb_pac == "N" ){
			l_awb_pac = "0";
		}
	}
	l_awb_rscharge = ifelse($44,,"",_ref(""{""$44""}""));
	l_awb_rsprozent = ifelse($45,,"",_ref(""{""$45""}""));
	l_awb_dgranzahl = ifelse($46,,"",_ref(""{""$46""}""));
	l_awb_leistdatum = ifelse($47,,"",_ref(""{""$47""}""));
	l_awb_bookanzahl = ifelse($48,,"",_ref(""{""$48""}""));
	l_awb_bookbgew = ifelse($49,,"",_ref(""{""$49""}""));
	l_awb_bookvol = ifelse($50,,"",_ref(""{""$50""}""));
	l_awb_booktext = ifelse($51,,"",_ref(""{""$51""}""));
	l_awb_osi1 = ifelse($52,,"",_ref(""{""$52""}""));
	l_awb_osi2 = ifelse($53,,"",_ref(""{""$53""}""));
	l_awb_osi3 = ifelse($54,,"",_ref(""{""$54""}""));
	l_status = "";
	l_orgid = @getwert(AB_ID);
	if (l_awb_awbid == ""){

		l_temp = 0;
		l_sql = "SELECT COUNT(1) FROM ALL_PROCEDURES WHERE owner = 'SPED' AND object_name = 'AWB' AND procedure_name = 'GET_AWBNUMBER_LI' into :l_temp";
		@SqlImmediate(l_sql);
		if (l_temp+0 > 0)
		{
			l_cmd = "awb.get_awbnumber_li('"||l_awb_airprefix||"', '"||l_orgid||"', '" || l_awb_flugdatum || "', :l_awb_awbid, :l_status)";
		} else {
			l_cmd = "awb.awb_holenummer('"||l_awb_airprefix||"','"||l_orgid||"', :l_awb_awbid, :l_status)";
		}
		@print (l_cmd);
		l_Cur = @SqlOpenCursor(HSQL);
		if (@SqlPLSQL(l_Cur,HSQL,l_cmd) == FALSE){
			@SqlCloseCursor(l_Cur,HSQL);
			return (FALSE);
		} else {
			@SqlCloseCursor(l_Cur,HSQL);
			if (l_temp + 0 <= 0)
			{
				l_awb_awbid = l_awb_airprefix||"-"||l_awb_awbid;
			}
			@print ("AWBID="||l_awb_awbid);
			$2 = l_awb_awbid;
		}
	}

	 l_Sql = " INSERT INTO SAWB_AWB(  \
AWB_LAFID  \
,AWB_AIRPREFIX  \
,AWB_AWBID  	\
,AWB_ABSAIRPORT  \
,AWB_EMPFAIRPORT  \
,AWB_WAEHRUNG  \
,AWB_FRANK  \
,AWB_FRANKZUSATZ  \
,AWB_WERTCARRIER  \
,AWB_WERTKUNDEN  \
,AWB_WERTVERS  \
,AWB_KUNDENSTATUS  \
,AWB_AIRID1  \
,AWB_FLUGNUMMER  \
,AWB_FLUGDATUM  \
,AWB_ETA  \
,AWB_AIRID2  \
,AWB_FLUGNUMMER2  \
,AWB_FLUGDATUM2  \
,AWB_ETA2 \
,AWB_AIRID3  \
,AWB_FLUGNUMMER3  \
,AWB_FLUGDATUM3  \
,AWB_ETA3 \
,AWB_HAND  \
,AWB_MARKS  \
,AWB_DOCS  \
,AWB_TEXT1  \
,AWB_ACCOUNTINF  \
,AWB_TEXT2  \
,AWB_ABRECHNUNG  \
,AWB_MASTERROUTE  \
,AWB_MASTERCHARBGEW  \
,AWB_IATA  \
,AWB_ACCOUNT  \
,AWB_REFAIRLINE  \
,AWB_OSC1  \
,AWB_OSC2  \
,AWB_ROUTE  \
,AWB_EMPFAIRPORTBEZ  \
,AWB_DGR  \
,AWB_HEA  \
,AWB_VAL  \
,AWB_CAO  \
,AWB_RSCHARGE  \
,AWB_RSPROZENT  \
,AWB_DGRANZAHL  \
,AWB_LEISTDATUM  \
,AWB_BOOKANZAHL  \
,AWB_BOOKBGEW  \
,AWB_BOOKVOL  \
,AWB_BOOKTEXT  \
,AWB_OSI1  \
,AWB_OSI2  \
,AWB_OSI3  \
,AWB_USRID  \
,AWB_AEND  \
	) \
	VALUES (  ";
	if (LAFID == "" ){
 		 l_Sql = l_Sql || "NULL";
	} else {
		l_Sql = l_Sql || ":LAFID";
	}
	if (l_awb_airprefix == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_airprefix";
	}
	if (l_awb_awbid == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_awbid";
	}
	if (l_awb_absairport == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_absairport";
	}
	if (l_awb_empfairport == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_empfairport";
	}
	if (l_awb_waehrung == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_waehrung";
	}
	if (l_awb_frank == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_frank";
	}
	if (l_awb_frankzusatz == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_frankzusatz";
	}
	if (l_awb_wertcarrier == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_wertcarrier";
	}
	if (l_awb_wertkunden == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_wertkunden";
	}
	if (l_awb_wertvers == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_wertvers";
	}
	if (l_awb_kundenstatu == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_kundenstatu";
	}
	if (l_awb_airid == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_airid";
	}
	if (l_awb_flugnummer == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_flugnummer";
	}
	if (l_awb_flugdatum == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",tf_util.str_to_date(:l_awb_flugdatum)";
	}
	if (l_awb_eta == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",tf_util.str_to_date(:l_awb_eta)";
	}
	if (l_awb_airid2 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_airid2";
	}
	if (l_awb_flugnummer2 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_flugnummer2";
	}
	if (l_awb_flugdatum2 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",tf_util.str_to_date(:l_awb_flugdatum2)";
	}
	if (l_awb_eta2 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",tf_util.str_to_date(:l_awb_eta2)";
	}
	if (l_awb_airid3 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_airid3";
	}
	if (l_awb_flugnummer3 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_flugnummer3";
	}
	if (l_awb_flugdatum3 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",tf_util.str_to_date(:l_awb_flugdatum3)";
	}
	if (l_awb_eta3 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",tf_util.str_to_date(:l_awb_eta3)";
	}
	if (l_awb_hand == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_hand";
	}
	if (l_awb_marks == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_marks";
	}
	if (l_awb_docs == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_docs";
	}
	if (l_awb_text1 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_text1";
	}
	if (l_awb_accountinf == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_accountinf";
	}
	if (l_awb_text2 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_text2";
	}
	if (l_awb_abrechnung == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_abrechnung";
	}
	if (l_awb_masterroute == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_masterroute";
	}
	if (l_awb_mastercharb == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_mastercharb";
	}
	if (l_awb_iata == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_iata";
	}
	if (l_awb_account == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_account";
	}
	if (l_awb_refairline == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_refairline";
	}
	if (l_awb_osc1 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_osc1";
	}
	if (l_awb_osc2 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_osc2";
	}
	if (l_awb_route == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_route";
	}
	if (l_awb_empfairbez == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_empfairbez";
	}
	if (l_awb_dgr == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_dgr";
	}
	if (l_awb_hea == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_hea";
	}
	if (l_awb_val == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_val";
	}
	if (l_awb_pac == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_pac";
	}
	if (l_awb_rscharge == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_rscharge";
	}
	if (l_awb_rsprozent == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_rsprozent";
	}
	if (l_awb_dgranzahl == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_dgranzahl";
	}
	if (l_awb_leistdatum == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",tf_util.str_to_date(:l_awb_leistdatum)";
	}
	if (l_awb_bookanzahl == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_bookanzahl";
	}
	if (l_awb_bookbgew == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_bookbgew";
	}
	if (l_awb_bookvol == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_bookvol";
	}
	if (l_awb_booktext == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_booktext";
	}
	if (l_awb_osi1 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_osi1";
	}
	if (l_awb_osi2 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_osi2";
	}
	if (l_awb_osi3 == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awb_osi3";
	}
        l_Sql = l_Sql || ",:USRID, SYSDATE ";
	l_Sql = l_Sql || ")" ;
	@print (l_Sql);
	if (@SqlImmediate(l_Sql) == FALSE){
		return(0-72);
	}
""}"")
/***************************************************************************
 Ende Anlegen Luftfracht
*/
define(""{""SAWB_NEU_END""}"",""{""
	@print(@sprintf(@nls_gettext_x("li_am.sawb_neu_end.end")));
""}"")
/***************************************************************************
 Anlegen Luftfrachtadressen
*/

define(""{""SAWA_NEU""}"", ""{""
	l_awa_satid = ifelse($1,,"",_ref(""{""$1""}""));
	l_awa_adrid = ifelse($2,,"",_ref(""{""$2""}""));
	l_awa_ref = ifelse($3,,"",_ref(""{""$3""}""));
	l_rc = "";
	l_adrtyp = "adx";
	l_name1	 = ifelse($4,,"",_ref(""{""$4""}""));
	l_name2	 = ifelse($5,,"",_ref(""{""$5""}""));
	l_anrid	 = ifelse($6,,"",_ref(""{""$6""}""));
	l_str	 = ifelse($7,,"",_ref(""{""$7""}""));
	l_str2	 = ifelse($8,,"",_ref(""{""$8""}""));
	l_staid	 = ifelse($9,,"",_ref(""{""$9""}""));
	l_ortid	 = ifelse($10,,"",_ref(""{""$10""}""));
	l_plz	 = ifelse($11,,"",_ref(""{""$11""}""));
	l_ort	 = ifelse($12,,"",_ref(""{""$12""}""));
	l_sprid	 = ifelse($13,,"",_ref(""{""$13""}""));
	if (l_awa_adrid == ""){
		@print(@sprintf(@nls_gettext_x("li_am.sawa_neu.adrid")));
		l_Sql_String = " \
		BEGIN  \
	     		sfri.hole_freie_id_intern('" ||l_adrtyp || "' ); \
	  	END;";
		if (@SqlImmediate(l_Sql_String) == FALSE){
			return (0-72);
		}

		if (@SqlImmediate("Select sfri.get_freie_adrid,sfri.get_freie_adrid_rc from dual into :ADRID_NEU, :l_rc;" ) == FALSE){
			return (0-72);
		}

		@print(@sprintf(@nls_gettext_x("li_am.sawa_neu.ret_adrid")));
		l_awa_adrid = ADRID_NEU;

		l_Sql_String = " \
		INSERT INTO    sadr_adresse ( \
                  adr_adrid,  adr_name1,  adr_name2,  adr_anrid, \
                  adr_str,    adr_ort,    adr_ortid,  adr_plz, \
                  adr_staid,  adr_sprid,  adr_txtadr, adr_adrkz, \
                  adr_aend,   adr_usrid,  adr_abstim, adr_sperre, \
                  adr_str2) \
   		VALUES         ( \
                  :ADRID_NEU,     :l_name1,     :l_name2,     :l_anrid, \
                  :l_str,       :l_ort,       :l_ortid,     :l_plz, \
                  :l_staid,     :l_sprid,     1,          0, \
                  SYSDATE,    :USRID,   0,          0, \
                  :l_str2)";

		@print(l_Sql_String);
		if (@SqlImmediate(l_Sql_String) == FALSE){
			return (0-72);
		}



        }
	 l_Sql = " INSERT INTO SAWA_AWBADR(  \
AWA_LAFID  \
,AWA_SATID  \
,AWA_ADRID  \
,AWA_REF  \
	) \
	VALUES (  ";
	l_Sql = l_Sql || ":LAFID";
	l_Sql = l_Sql || ",:l_awa_satid";
	l_Sql = l_Sql || ",:l_awa_adrid";
	if (l_awa_ref == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_awa_ref";
	}
	 l_Sql = l_Sql || ")" ;
	@print (l_Sql);
	if (@SqlImmediate(l_Sql) == FALSE){
				return(0-72);
	}

""}"")
/***************************************************************************
 Anlegen Luftfrachtraten
*/
define(""{""SAWR_NEU""}"", ""{""

	l_awr_art = ifelse($1,,"",_ref(""{""$1""}""));
	l_awr_anz = ifelse($2,,"",_ref(""{""$2""}""));
	l_awr_bgew = ifelse($3,,"",_ref(""{""$3""}""));
	l_awr_dim = ifelse($4,,"",_ref(""{""$4""}""));
	l_awr_rateclass = ifelse($5,,"",_ref(""{""$5""}""));
	l_awr_commodity = ifelse($6,,"",_ref(""{""$6""}""));
	l_awr_chargew = ifelse($7,,"",_ref(""{""$7""}""));
	l_awr_rate = ifelse($8,,"",_ref(""{""$8""}""));
	l_awr_total = ifelse($9,,"",_ref(""{""$9""}""));
	l_awr_inh = ifelse($10,,"",_ref(""{""$10""}""));
	l_awr_vol = ifelse($11,,"",_ref(""{""$11""}""));
	l_awr_laenge = ifelse($12,,"",_ref(""{""$12""}""));
	l_awr_breite = ifelse($13,,"",_ref(""{""$13""}""));
	l_awr_hoehe = ifelse($14,,"",_ref(""{""$14""}""));

	l_abflughafen = @getwert(ABFLUGHAFEN);
	l_empfflughafen = @getwert(EMPFFLUGHAFEN);
	@print(@sprintf(@nls_gettext_x("li_am.sawr_neu.call")));
	if ( @gesetzt( RAT_TOTAL ) == 0 ){

		l_cmd = "iataair.get_rate_ratetot_lis(:l_abflughafen,:l_empfflughafen,:l_awr_chargew,:l_awr_rateclass,:l_awr_commodity,:l_awr_rate,:l_awr_total)";
		@print(l_cmd);
		@save_vars(l_Cur);
		l_Cur = @SqlOpenCursor(HSQL);
		l_ret = @SqlPLSQL(l_Cur,HSQL,l_cmd);
		@SqlCloseCursor(l_Cur,HSQL);
		@restore_vars();
		if (l_ret == FALSE){
			return (FALSE);
		} else {
			@print(@sprintf(@nls_gettext_x("li_am.sawr_neu.rate_total_class")));
			$8 = l_awr_rate;
			$9 = l_awr_total;
		}
	}
	if ( @gesetzt( ZEILE_ID ) == 0 ){
			ZEILE_ID = 1;
	} else{
		ZEILE_ID = @getwert(ZEILE_ID) + 1;
	}


	 l_Sql = " INSERT INTO SAWR_AWBRATE(  \
AWR_LAFID  \
,AWR_LFZL  \
,AWR_ART  \
,AWR_ANZ  \
,AWR_BGEW  \
,AWR_DIM  \
,AWR_RATECLASS  \
,AWR_COMMODITY  \
,AWR_CHARGEW  \
,AWR_RATE  \
,AWR_TOTAL  \
,AWR_INH  \
,AWR_VOL  \
,AWR_LAENGE  \
,AWR_BREITE  \
,AWR_HOEHE  \
	) \
	VALUES (  ";
	l_Sql = l_Sql || ":LAFID";
	if (ZEILE_ID == "" ){
 		 l_Sql = l_Sql || ",1";
	} else {
		l_Sql = l_Sql || ",:ZEILE_ID";
	}
	l_Sql = l_Sql || ",:l_awr_art";
	l_Sql = l_Sql || ",:l_awr_anz";
	l_Sql = l_Sql || ",:l_awr_bgew";
	l_Sql = l_Sql || ",:l_awr_dim";
	l_Sql = l_Sql || ",:l_awr_rateclass";
	l_Sql = l_Sql || ",:l_awr_commodity";
	l_Sql = l_Sql || ",:l_awr_chargew";
	l_Sql = l_Sql || ",:l_awr_rate";
	l_Sql = l_Sql || ",:l_awr_total";
	l_Sql = l_Sql || ",:l_awr_inh";
	l_Sql = l_Sql || ",:l_awr_vol";
	l_Sql = l_Sql || ",:l_awr_laenge";
	l_Sql = l_Sql || ",:l_awr_breite";
	l_Sql = l_Sql || ",:l_awr_hoehe";
	l_Sql = l_Sql || ")" ;
	@print(l_Sql);
	if (@SqlImmediate(l_Sql) == FALSE){
		return(0-72);
	}
""}"")
/*************************************************************************
Berechnen Distanz


*/
define(""{""SGEO_DIST""}"", ""{""
l_adrid_von	= ifelse($1,,"",_ref(""{""$1""}""));
l_staid_von	= ifelse($2,,"",_ref(""{""$2""}""));
l_plz_von	= ifelse($3,,"",_ref(""{""$3""}""));
l_ort_von	= ifelse($4,,"",_ref(""{""$4""}""));
l_str_von	= ifelse($5,,"",_ref(""{""$5""}""));
l_adrid_bis	= ifelse($6,,"",_ref(""{""$6""}""));
l_staid_bis	= ifelse($7,,"",_ref(""{""$7""}""));
l_plz_bis	= ifelse($8,,"",_ref(""{""$8""}""));
l_ort_bis	= ifelse($9,,"",_ref(""{""$9""}""));
l_str_bis	= ifelse($10,,"",_ref(""{""$10""}""));
l_v		= ifelse($11,,"",_ref(""{""$11""}""));
l_dist = "";
l_zeit = "";

l_package = ifelse($14,,"sgeo",_ref(""{""$14""}""));
l_cmd = l_package || ".get_dist_zeit( :l_adrid_von, :l_staid_von, :l_plz_von, :l_ort_von, :l_str_von, :l_adrid_bis, :l_staid_bis, :l_plz_bis, :l_ort_bis, :l_str_bis, :l_v, :l_dist, :l_zeit)";
@print (l_cmd);
@save_vars( l_Cur );
l_Cur = @SqlOpenCursor(HSQL);
l_ret = @SqlPLSQL(l_Cur,HSQL,l_cmd);
@SqlCloseCursor(l_Cur,HSQL);
@restore_vars();
ifelse($12,,,$12 = l_dist;)
ifelse($13,,,$13 = l_zeit;)
if ( l_ret == FALSE) {
	return (FALSE);
}
""}"")
/*************************************************************************
Berechnen X,Y und wahlweise UPDATE SADR_ADRESSE.GEO_X,GEO_Y


*/
define(""{""SGEO_XY""}"", ""{""
l_adrid	= ifelse($1,,"",_ref(""{""$1""}""));
l_staid	= ifelse($2,,"",_ref(""{""$2""}""));
l_plz	= ifelse($3,,"",_ref(""{""$3""}""));
l_ort	= ifelse($4,,"",_ref(""{""$4""}""));
l_str	= ifelse($5,,"",_ref(""{""$5""}""));
l_flag	= ifelse($6,,"",_ref(""{""$6""}""));
l_x	= "";
l_y	= "";
l_package = ifelse($9,,"sgeo",_ref(""{""$9""}""));

l_cmd = l_package || ".get_set_xy( :l_adrid, :l_staid, :l_plz, :l_ort , :l_str , :l_flag, :l_x, :l_y )";
@print (l_cmd );
@save_vars( l_Cur );
l_Cur = @SqlOpenCursor(HSQL);
l_ret = @SqlPLSQL(l_Cur,HSQL,l_cmd);
@SqlCloseCursor(l_Cur,HSQL);
@restore_vars();
ifelse($7,,,$7 = l_x;)
ifelse($8,,,$8 = l_y;)
if ( l_ret == FALSE ) {
	return (FALSE);
}
""}"")
/*************************************************************************
Pflichtgewicht von Sendungen:
Parameter:sdgids,adrid,flag,vmgids,orgid,datum,gew

*/
define(""{""SVMG""}"", ""{""
@save_vars( ZUFELD60A, ZUFELD61A, ZUFELD62A, SDGIDS, GEW_PFL_CODE, GEW_PFL );
SDGIDS = ifelse($1,,"",_ref(""{""$1""}""));
@reset_vars(GEW_PFL);
ZUFELD60A = ifelse($2,,"",_ref(""{""$2""}""));
l_flag = ifelse($3,,"",_ref(""{""$3""}""));
l_vmgids = ifelse($4,,"",_ref(""{""$4""}""));
l_flag1 = "K";
if (l_flag == "N"){
	l_flag1 = "F";
}
GEW_PFL_CODE=l_flag1||"/"||l_vmgids;
ZUFELD61A = ifelse($5,,"",_ref(""{""$5""}""));
ZUFELD62A = ifelse($6,,"",_ref(""{""$6""}""));
l_gewicht = @getwert(GEW_PFL,TRUE);
@restore_vars();
$7 = l_gewicht;
""}"")

/***************************************************************************
 Anlegen Kalkulation
*/
define(""{""SKAL_NEU""}"", ""{""
	l_kalid = ifelse($1,,"",_ref(""{""$1""}""));
	l_adrid_von = ifelse($2,,"",_ref(""{""$2""}""));
	l_plz_von = ifelse($3,,"",_ref(""{""$3""}""));
	l_ort_von = ifelse($4,,"",_ref(""{""$4""}""));
	l_str_von	 = ifelse($5,,"",_ref(""{""$5""}""));
	l_staid_von	 = ifelse($6,,"",_ref(""{""$6""}""));
	l_adrid_nach	 = ifelse($7,,"",_ref(""{""$7""}""));
	l_plz_nach	 = ifelse($8,,"",_ref(""{""$8""}""));
	l_ort_nach	 = ifelse($9,,"",_ref(""{""$9""}""));
	l_str_nach	 = ifelse($10,,"",_ref(""{""$10""}""));
	l_staid_nach	 = ifelse($11,,"",_ref(""{""$11""}""));
	l_tarif	 = ifelse($12,,"",_ref(""{""$12""}""));
	l_km	 = ifelse($13,,"",_ref(""{""$13""}""));
	l_mautkm	 = ifelse($14,,"",_ref(""{""$14""}""));
	l_wrgid	 = ifelse($15,,"",_ref(""{""$15""}""));
	l_werttarif	 = ifelse($16,,"",_ref(""{""$16""}""));
	l_rabatt	 = ifelse($17,,"",_ref(""{""$17""}""));
	l_wertkunde	 = ifelse($18,,"",_ref(""{""$18""}""));
	l_datum	 = ifelse($19,,"",_ref(""{""$19""}""));
	 l_Sql = " INSERT INTO SKAL_KALKULATION(  \
KAL_KALID  \
,KAL_ADRIDVON  \
,KAL_PLZVON  \
,KAL_ORTVON  \
,KAL_STRVON  \
,KAL_STAIDVON  \
,KAL_ADRIDNACH  \
,KAL_PLZNACH  \
,KAL_ORTNACH  \
,KAL_STRNACH  \
,KAL_STAIDNACH  \
,KAL_TARIF  \
,KAL_KM  \
,KAL_MAUTKM  \
,KAL_WRGID  \
,KAL_WERTTARIF  \
,KAL_RABATT  \
,KAL_WERTKUNDE  \
,KAL_DATUM  \
	) \
	VALUES (  ";
	l_Sql = l_Sql || ":l_kalid";
	if (l_adrid_von == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_adrid_von";
	}
	if (l_plz_von == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_plz_von";
	}
	if (l_ort_von == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_ort_von";
	}
	if (l_str_von == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_str_von";
	}
	if (l_staid_von == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_staid_von";
	}
	if (l_adrid_nach == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_adrid_nach";
	}
	if (l_plz_nach == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_plz_nach";
	}
	if (l_ort_nach == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_ort_nach";
	}
	if (l_str_nach == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_str_nach";
	}
	if (l_staid_nach == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_staid_nach";
	}
	if (l_tarif == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_tarif";
	}
	if (l_km == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_km";
	}
	if (l_mautkm == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_mautkm";
	}
	if (l_wrgid == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_wrgid";
	}
	if (l_werttarif == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_werttarif";
	}
	if (l_rabatt == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_rabatt";
	}
	if (l_wertkunde == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",:l_wertkunde";
	}
	if (l_datum == "" ){
 		 l_Sql = l_Sql || ",NULL";
	} else {
		l_Sql = l_Sql || ",tf_util.str_to_date(:l_datum)";
	}
	 l_Sql = l_Sql || ")" ;
	@print (l_Sql);
	if (@SqlImmediate(l_Sql) == FALSE){
				return(0-72);
	}
""}"")

/* Sendungen kopieren

   Voraussetzungen 	Status 860
   		        Sendung und ag_id muss gesetzt sein

*/

define(""{""SDG_KOP""}"",""{""
	 {
   l_update  = ifelse($1,,"N",@substr (@sprintf($1),1,1));
   if ( l_update == "Y" )
   {
	l_update = "U"; }
   else
	{
	l_update = "I"; }

   l_lasid = "860";
   l_styid = $2;
   l_styid  = ifelse($2,,SDG_TYP,$2);
   l_ktext  = ifelse($3,,"",@substr (@sprintf($3),1,50));
   l_location  = ifelse($4,,"",@substr (@sprintf($4),1,50));
l_cmd = "ssdg_kop.sdg_kop(:l_update,:SDGID,:l_lasid,:l_styid,:l_ktext,:l_location,:USRID,:AG_ID)";
@print (l_cmd);
l_Cur = @SqlOpenCursor(HSQL);
if (@SqlPLSQL(l_Cur,HSQL,l_cmd) == FALSE)
{
	@SqlCloseCursor(l_Cur,HSQL);
	return (FALSE);
}
else
{
	@SqlCloseCursor(l_Cur,HSQL);
}

}
""}"")

undefine(""{""_LOOP_RSET""}"")

define(""{""_SHI_VARS_INTO""}"",""{"" :KOPIE_SDGID,:KOPIE_STATUS, :KOPIE_SDG_TYP,:KOPIE_BETREFF,:KOPIE_LOCATION,:KOPIE_USRID,:KOPIE_DATUM""}"")
define(""{""_SHI_VARS_LOOP""}"",""{"" KOPIE_SDGID,KOPIE_STATUS, KOPIE_SDG_TYP,KOPIE_BETREFF,KOPIE_LOCATION,KOPIE_USRID,KOPIE_DATUM""}"")
define(""{""_SHI_VARS_SELECT""}"",""{"" shi_sdgidk, shi_lasid, shi_styid,shi_ktext,shi_location, shi_usrid,to_char(shi_aend,'YYYY.MM.DD HH24:MI')""}"")

define(""{""_LOOP_VARS""}"", ""{""_SHI_VARS_LOOP""}"")

define(""{""_LOOP_SELECT""}"", ""{"""select _SHI_VARS_SELECT from sshi_sdghis where shi_sdgido = :SDGID order by shi_aend into  _SHI_VARS_INTO; """}"")

define(""{""_LOOP_NAME""}"",""{""SHI-INFO: History Schleife fuer Sendung""}""  )
define(""{""SHI_INFO""}"", _LOOP )



/*************************************************************************
Optimierung Fahrt
Parameter:opt_typ,opt_farid,opt_adrid_leer,opt_name
*/
define(""{""OPT_FAHRT""}"", ""{""
	@print(@sprintf(@nls_gettext_x("li_am.opt_fahrt.optimierung")));
	l_first_fix = ifelse($1,,"",_ref(""{""$1""}""));
	l_opt_typ = ifelse($2,,"",_ref(""{""$2""}""));
	l_opt_farid = ifelse($3,,"",_ref(""{""$3""}""));
	l_opt_adrid_leer = ifelse($4,,"",_ref(""{""$4""}""));
	l_opt_name_leer = ifelse($5,,"",_ref(""{""$5""}""));
	l_opt_name2_leer = ifelse($6,,"",_ref(""{""$6""}""));
	l_opt_str_leer = ifelse($7,,"",_ref(""{""$7""}""));
	l_opt_str2_leer = ifelse($8,,"",_ref(""{""$8""}""));
	l_opt_staid_leer = ifelse($9,,"",_ref(""{""$9""}""));
	l_opt_ortid_leer = ifelse($10,,"",_ref(""{""$10""}""));
	l_opt_plz_leer = ifelse($11,,"",_ref(""{""$11""}""));
	l_opt_ort_leer = ifelse($12,,"",_ref(""{""$12""}""));
	l_opt_sprid_leer = ifelse($13,,"",_ref(""{""$13""}""));
	l_opt_adrid_folge = ifelse($14,,"",_ref(""{""$14""}""));
	l_opt_name_folge = ifelse($15,,"",_ref(""{""$15""}""));
	l_opt_name2_folge = ifelse($16,,"",_ref(""{""$16""}""));
	l_opt_str_folge = ifelse($17,,"",_ref(""{""$17""}""));
	l_opt_str2_folge = ifelse($18,,"",_ref(""{""$18""}""));
	l_opt_staid_folge = ifelse($19,,"",_ref(""{""$19""}""));
	l_opt_ortid_folge = ifelse($20,,"",_ref(""{""$20""}""));
	l_opt_plz_folge = ifelse($21,,"",_ref(""{""$21""}""));
	l_opt_ort_folge = ifelse($22,,"",_ref(""{""$22""}""));
	l_opt_sprid_folge = ifelse($23,,"",_ref(""{""$23""}""));
	l_opt_kosten_km_voll = ifelse($24,,"",_ref(""{""$24""}""));
	l_opt_kosten_km_leer = ifelse($25,,"",_ref(""{""$25""}""));
	l_opt_distanz_voll = ifelse($26,,"",_ref(""{""$26""}""));
	l_opt_distanz_leer = ifelse($27,,"",_ref(""{""$27""}""));
	l_opt_maut_voll = ifelse($28,,"",_ref(""{""$28""}""));
	l_opt_maut_leer = ifelse($29,,"",_ref(""{""$29""}""));
	l_rc = "";
	l_adrtyp = "adx";
	l_opt_distanz_voll = "";
	l_opt_distanz_leer = "";
	l_opt_maut_voll = "";
	l_opt_maut_leer = "";
	l_opt_kosten = "";
	@print(@sprintf(@nls_gettext_x("li_am.opt_fahrt.parameter")));

	if ((l_opt_adrid_leer == "") & (l_opt_staid_leer != "" ) ){
		@print(@sprintf(@nls_gettext_x("li_am.opt_fahrt.adrid_leer")));
		l_Sql_String = " \
		BEGIN  \
	     		sfri.hole_freie_id_intern('" ||l_adrtyp || "' ); \
	  	END;";
		if (@SqlImmediate(l_Sql_String) == FALSE){
			return (0-72);
		}

		if (@SqlImmediate("Select sfri.get_freie_adrid,sfri.get_freie_adrid_rc from dual into :l_opt_adrid_leer, :l_rc;" ) == FALSE){
			return (0-72);
		}

		@print(@sprintf(@nls_gettext_x("li_am.opt_fahrt.adrid_leer_neu")));

		l_Sql_String = " \
		INSERT INTO    sadr_adresse ( \
                  adr_adrid,  adr_name1,  adr_name2,   \
                  adr_str,    adr_str2, adr_ort,    adr_ortid,  adr_plz, \
                  adr_staid,  adr_sprid,  adr_txtadr, adr_adrkz, \
                  adr_aend,   adr_usrid,  adr_abstim, adr_sperre) \
   		VALUES         ( \
                  :l_opt_adrid_leer,  :l_opt_name_leer,     :l_opt_name2_leer, \
                  :l_opt_str_leer, :l_opt_str2_leer,    :l_opt_ort_leer,  :l_opt_ortid_leer,     :l_opt_plz_leer, \
                  :l_opt_staid_leer,  :l_opt_sprid_leer,  1,   0, \
                  SYSDATE,    :USRID,   0,          0)";

		@print(l_Sql_String);
		if (@SqlImmediate(l_Sql_String) == FALSE){
			return (0-72);
		}



        }
	if ( (l_opt_adrid_folge == "") & (l_opt_staid_folge != "") ){
		@print(@sprintf(@nls_gettext_x("li_am.opt_fahrt.adrid_folge")));
		l_Sql_String = " \
		BEGIN  \
	     		sfri.hole_freie_id_intern('" ||l_adrtyp || "' ); \
	  	END;";
		if (@SqlImmediate(l_Sql_String) == FALSE){
			return (0-72);
		}

		if (@SqlImmediate("Select sfri.get_freie_adrid,sfri.get_freie_adrid_rc from dual into :l_opt_adrid_folge, :l_rc;" ) == FALSE){
			return (0-72);
		}

		@print(@sprintf(@nls_gettext_x("li_am.opt_fahrt.adrid_folge_neu")));

		l_Sql_String = " \
		INSERT INTO    sadr_adresse ( \
                  adr_adrid,  adr_name1,  adr_name2,   \
                  adr_str,    adr_str2, adr_ort,    adr_ortid,  adr_plz, \
                  adr_staid,  adr_sprid,  adr_txtadr, adr_adrkz, \
                  adr_aend,   adr_usrid,  adr_abstim, adr_sperre) \
   		VALUES         ( \
                  :l_opt_adrid_folge,  :l_opt_name_folge,     :l_opt_name2_folge, \
                  :l_opt_str_folge, :l_opt_str2_folge,    :l_opt_ort_folge,  :l_opt_ortid_folge,     :l_opt_plz_folge, \
                  :l_opt_staid_folge,  :l_opt_sprid_folge,  1,   0, \
                  SYSDATE,    :USRID,   0,          0)";

		@print(l_Sql_String);
		if (@SqlImmediate(l_Sql_String) == FALSE){
			return (0-72);
		}



        }
	@print(@sprintf(@nls_gettext_x("li_am.opt_fahrt.adrid_leer_folge")));
	l_cmd = "opt_tf.main_from_li(:l_opt_farid,:l_opt_typ,:l_first_fix,:l_opt_adrid_leer,:l_opt_adrid_folge,:l_opt_kosten_km_voll,:l_opt_kosten_km_leer,:l_opt_distanz_voll,:l_opt_distanz_leer,:l_opt_maut_voll,:l_opt_maut_leer)";
	@print (l_cmd);
	l_Cur = @SqlOpenCursor(HSQL);
	if (@SqlPLSQL(l_Cur,HSQL,l_cmd) == FALSE)
	{
		@SqlCloseCursor(l_Cur,HSQL);
		return (FALSE);
	}
	else
	{
		@SqlCloseCursor(l_Cur,HSQL);
		$26 = l_opt_distanz_voll;
		$27 = l_opt_distanz_leer;
		$28 = l_opt_maut_voll;
		$29 = l_opt_maut_leer;
	}
	@print(@sprintf(@nls_gettext_x("li_am.opt_fahrt.distanz_voll")));
""}"")


/*
Format fuer Anlegen von Hinweistexten zur Sendung
romo 14.6.2004
*/

define(""{""SDH_NEU""}"",""{""
	l_sdgid	= ifelse($1,,"",_ref(""{""$1""}""));
	l_gruppe	= ifelse($2,,"",_ref(""{""$2""}""));
	l_code	= ifelse($3,,"",_ref(""{""$3""}""));
	l_zusatz	= ifelse($4,,"",_ref(""{""$4""}""));
	l_htcid	= "";
	l_zusatzorig = "";
	l_found	= "";
	l_typ		= 0;
	l_format	= "";

 	@SqlImmediate("SELECT htc_htcid, htc_typ, htc_datformat   \
			FROM shtc_hinwtxtcode, shtg_hinwtxtgruppe \
			WHERE htg_bez = :l_gruppe \
			AND htc_code = :l_code \
			and htc_htgid = htg_htgid \
	      INTO :l_htcid, :l_typ, :l_format");

	if (l_htcid == ""){
		@print(@sprintf(@nls_gettext_x("li_am.sdh_neu.error")));
		return (FALSE);
	}

	if ( l_typ == 1 ) {
		l_zusatz_date = "";
		@SqlImmediate("SELECT to_char(tf_util.str_to_date(:l_zusatz), :l_format) \
			FROM dual \
	      INTO :l_zusatz_date");
		l_zusatz = l_zusatz_date;
	}

 	@SqlImmediate("SELECT 'Y', sdh_zusatz   \
			FROM ssdh_sdghtc \
			WHERE sdh_htcid = :l_htcid \
			AND sdh_sdgid = :l_sdgid \
	      INTO :l_found, :l_zusatzorig");

	if (l_found == "Y"){
		@print(@sprintf(@nls_gettext_x("li_am.sdh_neu.upd_sdgid")));
   	}
	else
	{
		l_Sql= "insert into ssdh_sdghtc \
		(  \
			 sdh_htcid,  \
			 sdh_sdgid  \
		)  \
		values  \
		(  \
			 :l_htcid,  \
			 :l_sdgid  \
		)";
		@print(@sprintf(@nls_gettext_x("li_am.sdh_neu.ins_sdgid")));
		@print(l_Sql);
		if (@SqlImmediate(l_Sql) == FALSE)
		{
			return (0-72);
		}
	}

	@save_vars(SDGID,HWT_ID,HWT_ZUSATZ);
		SDGID = l_sdgid;
		HWT_ID = l_htcid;
		HWT_ZUSATZ = l_zusatz;
		@setzen_feld_original(HWT_ZUSATZ);
	@restore_vars();

""}"")


/*
Format zum Loeschen von Hinweistexten zur Sendung
romo 14.6.2004
*/

define(""{""SDH_DEL""}"",""{""
	l_sdgid	= ifelse($1,,"",_ref(""{""$1""}""));
	l_htcid	= ifelse($2,,"",_ref(""{""$2""}""));

	l_Sql= "delete from ssdh_sdghtc \
		where sdh_sdgid = :l_sdgid \
		and sdh_htcid = :l_htcid";
		@print(@sprintf(@nls_gettext_x("li_am.sdh_del.del_htcid")));

	@print(l_Sql);
	if (@SqlImmediate(l_Sql) == FALSE)
	{
		return (0-72);
	}
""}"")

/*
Format zum Konvertieren eines Datums
romo 02.07.2004
*/

#define CONVDATUM(p1,p2,p3,p4) CONVDATUM_m4(""{""p1""}"",""{""p2""}"",""{""p3""}"",""{""p4""}"")

define(""{""CONVDATUM_m4""}"",""{""
	l_datum		= ifelse(""{""$1""}"",,"",_ref(""{""$1""}""));
	l_datformat	= ifelse(""{""$2""}"",,"YYYY.MM.DD HH24:MI:SS",_ref_stable(""{""$2""}""));
	l_zielformat = ifelse(""{""$3""}"",,"YYYY.MM.DD HH24:MI",_ref_stable(""{""$3""}""));
	l_erg			= "";

	l_Sql= "select to_char(tf_util.str_to_date(:l_datum, :l_datformat), \
									:l_zielformat) \
				from dual \
				into :l_erg";

	@print(@sprintf(@nls_gettext_x("li_am.convdatum.call")));

	if (@SqlImmediate(l_Sql) == FALSE)
	{
		return (0-72);
	}
	""{""$4""}"" = l_erg;
""}"")
/*************************************************************************
Nachnahme NEU einfuegen
   Parameter 1: ID, 2: Typ, 3:Wrg 4: Betrag , 5: Spesencode, 6: Text, 7: Satids, 8: Adrid (SDGID muss gesetzt sein)

*/
define(""{""PNN_PUT""}"", ""{""
l_id      = ifelse($1,,"",_ref(""{""$1""}""));
l_typ     = ifelse($2,,"",_ref(""{""$2""}""));
l_wrg     = ifelse($3,,"",_ref(""{""$3""}""));
l_betrag  = ifelse($4,,"",_ref(""{""$4""}""));
l_spcid   = ifelse($5,,"",_ref(""{""$5""}""));
l_text    = ifelse($6,,"",_ref(""{""$6""}""));
l_satids  = ifelse($7,,"",_ref(""{""$7""}""));
l_adrid   = ifelse($8,,"",_ref(""{""$8""}""));
l_sdgid    = @getwert(SDGID);
l_error    = "90000";
if ( @getwert(l_sdgid ) == "" )
{
	@print(@sprintf(@nls_gettext_x("li_am.pnn_put.error")));
   RC=l_error;
   @print( "RC     ->" || @getwert(RC)      || "<-" );
   return (FALSE);
}
else
{
	@print(@sprintf(@nls_gettext_x("li_am.pnn_put.call")));
}
         l_Sql_String = "BEGIN \
            sspn.put_pnn('" || l_sdgid || "','"||
            l_id  || "', '" ||
            l_typ  || "', '" ||
            l_wrg   || "', '" ||
            l_betrag  || "', '" ||
            l_spcid  || "', '" ||
            l_text   || "', '" ||
            l_satids   || "', '" ||
            l_adrid   || "');" ||
            "END;";

            @print(l_Sql_String);
            if (@SqlImmediate(l_Sql_String) == FALSE)
            {
               return (FALSE);
            }

          if (@SqlImmediate( "SELECT SGLO.get_errcode, \
                             SUBSTR( SGLO.get_errtext, 1 ,50 ), \
                             SUBSTR( SGLO.get_errclass, 1 ,50 ) \
                             FROM DUAL INTO :RC, :RCTEXT, :RCCLASS" ) == FALSE)
            {
               return (FALSE);
            }
            @print( "RC     ->" || @getwert(RC)      || "<-" );
            @print( "RCTEXT ->" || @getwert(RCTEXT)  || "<-" );
            @print( "RCCLASS->" || @getwert(RCCLASS) || "<-" );

""}"")
/*************************************************************************
Nachnahme Add einfuegen
   Parameter 1: ID, 2: Betrag, 3:Spesencode, 4: Text (SDGID muss gesetzt sein)

*/
define(""{""PNN_ADD""}"", ""{""
l_id      = ifelse($1,,"",_ref(""{""$1""}""));
l_betrag  = ifelse($2,,"",_ref(""{""$2""}""));
l_spcid   = ifelse($3,,"",_ref(""{""$3""}""));
l_text    = ifelse($4,,"",_ref(""{""$4""}""));
l_sdgid    = @getwert(SDGID);
l_error    = "90000";
if ( @getwert(l_sdgid ) == "" )
{
	@print(@sprintf(@nls_gettext_x("li_am.pnn_add.error")));
   RC=l_error;
   @print( "RC     ->" || @getwert(RC)      || "<-" );
   return (FALSE);
}
else
{
	@print(@sprintf(@nls_gettext_x("li_am.pnn_add.call")));
}
         l_Sql_String = "BEGIN \
            sspn.add_pnn('" || l_sdgid || "','"||
            l_id  || "', '" ||
            l_betrag  || "', '" ||
            l_spcid  || "', '" ||
            l_text     || "');" ||
            "END;";

            @print(l_Sql_String);
            if (@SqlImmediate(l_Sql_String) == FALSE)
            {
               return (FALSE);
            }

          if (@SqlImmediate( "SELECT SGLO.get_errcode, \
                             SUBSTR( SGLO.get_errtext, 1 ,50 ), \
                             SUBSTR( SGLO.get_errclass, 1 ,50 ) \
                             FROM DUAL INTO :RC, :RCTEXT, :RCCLASS" ) == FALSE)
            {
               return (FALSE);
            }
            @print( "RC     ->" || @getwert(RC)      || "<-" );
            @print( "RCTEXT ->" || @getwert(RCTEXT)  || "<-" );
            @print( "RCCLASS->" || @getwert(RCCLASS) || "<-" );

""}"")

/*************************************************************************
Nachnahme Zeilen von einem Typ loeschen
   Parameter 1: ID (SDGID muss gesetzt sein)

*/
define(""{""PNN_DEL""}"", ""{""
l_id      = ifelse($1,,"",_ref(""{""$1""}""));
l_sdgid    = @getwert(SDGID);
l_error    = "90000";
if ( @getwert(l_sdgid ) == "" )
{
	@print(@sprintf(@nls_gettext_x("li_am.pnn_del.error")));
   RC=l_error;
   @print( "RC     ->" || @getwert(RC)      || "<-" );
   return (FALSE);
}
else
{
	@print(@sprintf(@nls_gettext_x("li_am.pnn_del.call")));
}

         l_Sql_String = "BEGIN \
            sspn.del_pnn('" || l_sdgid || "','"||
            l_id     || "');" ||
            "END;";

            @print(l_Sql_String);
            if (@SqlImmediate(l_Sql_String) == FALSE)
            {
               return (FALSE);
            }

          if (@SqlImmediate( "SELECT SGLO.get_errcode, \
                             SUBSTR( SGLO.get_errtext, 1 ,50 ), \
                             SUBSTR( SGLO.get_errclass, 1 ,50 ) \
                             FROM DUAL INTO :RC, :RCTEXT, :RCCLASS" ) == FALSE)
            {
               return (FALSE);
            }
            @print( "RC     ->" || @getwert(RC)      || "<-" );
            @print( "RCTEXT ->" || @getwert(RCTEXT)  || "<-" );
            @print( "RCCLASS->" || @getwert(RCCLASS) || "<-" );
""}"")

/*************************************************************
mavo 20.12.04 Lesen rec-recid von srec-genrecord
*/

define(""{""LESEN_RECID""}"",""{""
l_tabid    = ifelse($1,,"",_ref($1));
l_datum    = ifelse($2,,"",_ref($2));
l_spaid1   = ifelse($3,,"",_ref($3));
l_value1   = ifelse($4,,"",_ref($4));
l_spaid2   = ifelse($5,,"",_ref($5));
l_value2   = ifelse($6,,"",_ref($6));
l_spaid3   = ifelse($7,,"",_ref($7));
l_value3   = ifelse($8,,"",_ref($8));
l_spaid4   = ifelse($9,,"",_ref($9));
l_value4   = ifelse($10,,"",_ref($10));
l_spaid5   = ifelse($11,,"",_ref($11));
l_value5   = ifelse($12,,"",_ref($12));

l_select = "Select substr (sget.get_recid('"|| l_tabid || "'," || "tf_util.str_to_date(:l_datum)" || ",'" || \
l_spaid1 || "','" || l_value1 || "','" || l_spaid2 || "','" || l_value2 || "','" || \
l_spaid3 || "','" || l_value3 || "','" || l_spaid4 || "','" || l_value4 || "','" || \
l_spaid5 || "','" || l_value5 || "') ,1,254) from dual into :REC_RECID";
@print(l_select);

if (@SqlImmediate(l_select) == TRUE)
      {
			@print(@sprintf(@nls_gettext_x("li_am.lesen_recid.call")));
      }
      else
      {
			@print(@sprintf(@nls_gettext_x("li_am.lesen_recid.error")));
      }

""}"")

/*************************************************************
mavo 20.12.04 Lesen val-_value von srec_genrecord
*/

define(""{""LESEN_VALUE""}"",""{""
l_tabid    = ifelse($1,,"",_ref($1));
l_recid    = ifelse($2,,"",_ref($2));
l_sql_attrib = "";
l_sql_into = "";
l_temp = "";
l_komma = ",";
l_info = "LES" || "EN_VA" || "LUE: ";

ifelse($3,,,l_spaid1 = _ref($3);)
ifelse($3,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid1 ), 1, 254)" || l_komma || " " ;)
ifelse($3,,,l_sql_into = l_sql_into || " :l_value1" || l_komma || " "; ) 

ifelse($5,,,l_spaid2 = _ref($5);)
ifelse($5,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid2 ), 1, 254)" || l_komma || " " ;)
ifelse($5,,,l_sql_into = l_sql_into || " :l_value2" || l_komma || " "; ) 

ifelse($7,,,l_spaid3 = _ref($7);)
ifelse($7,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid3 ), 1, 254)" || l_komma || " " ;)
ifelse($7,,,l_sql_into = l_sql_into || " :l_value3" || l_komma || " "; ) 

ifelse($9,,,l_spaid4 = _ref($9);)
ifelse($9,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid4 ), 1, 254)" || l_komma || " " ;)
ifelse($9,,,l_sql_into = l_sql_into || " :l_value4" || l_komma || " "; ) 

ifelse($11,,,l_spaid5 = _ref($11);)
ifelse($11,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid5 ), 1, 254)" || l_komma || " " ;)
ifelse($11,,,l_sql_into = l_sql_into || " :l_value5" || l_komma || " "; ) 

ifelse($13,,,l_spaid6 = _ref($13);)
ifelse($13,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid6 ), 1, 254)" || l_komma || " " ;)
ifelse($13,,,l_sql_into = l_sql_into || " :l_value6" || l_komma || " "; )

ifelse($15,,,l_spaid7 = _ref($15);)
ifelse($15,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid7 ), 1, 254)" || l_komma || " " ;)
ifelse($15,,,l_sql_into = l_sql_into || " :l_value7" || l_komma || " "; ) 

ifelse($17,,,l_spaid8 = _ref($17);)
ifelse($17,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid8 ), 1, 254)" || l_komma || " " ;)
ifelse($17,,,l_sql_into = l_sql_into || " :l_value8" || l_komma || " "; ) 

ifelse($19,,,l_spaid9 = _ref($19);)
ifelse($19,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid9 ), 1, 254)" || l_komma || " " ;)
ifelse($19,,,l_sql_into = l_sql_into || " :l_value9" || l_komma || " "; ) 

ifelse($21,,,l_spaid10 = _ref($21);)
ifelse($21,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid10 ), 1, 254)" || l_komma || " " ;)
ifelse($21,,,l_sql_into = l_sql_into || " :l_value10" || l_komma || " "; ) 

ifelse($23,,,l_spaid11 = _ref($23);)
ifelse($23,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid11 ), 1, 254)" || l_komma || " " ;)
ifelse($23,,,l_sql_into = l_sql_into || " :l_value11" || l_komma || " "; ) 

ifelse($25,,,l_spaid12 = _ref($25);)
ifelse($25,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid12 ), 1, 254)" || l_komma || " " ;)
ifelse($25,,,l_sql_into = l_sql_into || " :l_value12" || l_komma || " "; )

ifelse($27,,,l_spaid13 = _ref($27);)
ifelse($27,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid13 ), 1, 254)" || l_komma || " " ;)
ifelse($27,,,l_sql_into = l_sql_into || " :l_value13" || l_komma || " "; ) 

ifelse($29,,,l_spaid14 = _ref($29);)
ifelse($29,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid14 ), 1, 254)" || l_komma || " " ;)
ifelse($29,,,l_sql_into = l_sql_into || " :l_value14" || l_komma || " "; ) 

ifelse($31,,,l_spaid15 = _ref($31);)
ifelse($31,,,l_sql_attrib = l_sql_attrib || " substr (sget.get_value ( :l_tabid , :l_recid , :l_spaid15 ), 1, 254)" || l_komma || " " ;)
ifelse($31,,,l_sql_into = l_sql_into || " :l_value15" || l_komma || " "; )

l_sql = "SELECT " || l_sql_attrib || " 'dummy' FROM dual INTO " || l_sql_into || " :l_temp";
@SqlImmediate( l_sql );

ifelse($4,,,$4 = l_value1;)
ifelse($4,,,l_info = l_info || l_spaid1 || ": (" || l_value1 || ")" || l_komma || " "; )
ifelse($6,,,$6 = l_value2;)
ifelse($6,,,l_info = l_info || l_spaid2 || ": (" || l_value2 || ")" || l_komma || " "; )
ifelse($8,,,$8 = l_value3;)
ifelse($8,,,l_info = l_info || l_spaid3 || ": (" || l_value3 || ")" || l_komma || " "; )
ifelse($10,,,$10 = l_value4;)
ifelse($10,,,l_info = l_info || l_spaid4 || ": (" || l_value4 || ")" || l_komma || " "; )
ifelse($12,,,$12 = l_value5;)
ifelse($12,,,l_info = l_info || l_spaid5 || ": (" || l_value5 || ")" || l_komma || " "; )
ifelse($14,,,$14 = l_value6;)
ifelse($14,,,l_info = l_info || l_spaid6 || ": (" || l_value6 || ")" || l_komma || " "; )
ifelse($16,,,$16 = l_value7;)
ifelse($16,,,l_info = l_info || l_spaid7 || ": (" || l_value7 || ")" || l_komma || " "; )
ifelse($18,,,$18 = l_value8;)
ifelse($18,,,l_info = l_info || l_spaid8 || ": (" || l_value8 || ")" || l_komma || " "; )
ifelse($20,,,$20 = l_value9;)
ifelse($20,,,l_info = l_info || l_spaid9 || ": (" || l_value9 || ")" || l_komma || " "; )
ifelse($22,,,$22 = l_value10;)
ifelse($22,,,l_info = l_info || l_spaid10 || ": (" || l_value10 || ")" || l_komma || " "; )
ifelse($24,,,$24 = l_value11;)
ifelse($24,,,l_info = l_info || l_spaid11 || ": (" || l_value11 || ")" || l_komma || " "; )
ifelse($26,,,$26 = l_value12;)
ifelse($26,,,l_info = l_info || l_spaid12 || ": (" || l_value12 || ")" || l_komma || " "; )
ifelse($28,,,$28 = l_value13;)
ifelse($28,,,l_info = l_info || l_spaid13 || ": (" || l_value13 || ")" || l_komma || " "; )
ifelse($30,,,$30 = l_value14;)
ifelse($30,,,l_info = l_info || l_spaid14 || ": (" || l_value14 || ")" || l_komma || " "; )
ifelse($32,,,$32 = l_value15;)
ifelse($32,,,l_info = l_info || l_spaid15 || ": (" || l_value15 || ")" || l_komma || " "; )
@print( l_info );
""}"")

/*************************************************************
mavo 02.05.06 SSPL-RELEASE Zuordnung Mastersendung/Splitsendung aufloesen
*/

define(""{""SSPL_RELEASE""}"",""{""
l_sdgid_master = ifelse($1,,"",_ref($1));
l_sdgid_split  = ifelse($2,,"",_ref($2));
l_zsp_sdgid    = " ";

/*
Schritt 1: Pruefen, ob die Mastersendung zur Splitsendung passt 
*/
if (@SqlImmediate("SELECT zsp_sdgid FROM szsp_sdgsplit WHERE zsp_sdgidm = :l_sdgid_master and zsp_sdgid =:l_sdgid_split into :l_zsp_sdgid ") == FALSE) {
	@print(@sprintf(@nls_gettext_x("li_am.sspl_release.error_zsp_sdgid")));
	return (FALSE);
        }

/*
Schritt 2: Zuordnung aufloesen
*/
l_Sql_String = "BEGIN sspl.release_split('"||l_sdgid_master||"','"||l_sdgid_split||"'); END;";
            @print(l_Sql_String);
            if (@SqlImmediate(l_Sql_String) == FALSE)
            {
					@print(@sprintf(@nls_gettext_x("li_am.sspl_release.error_release")));
					return (FALSE);
            }
""}"")

/*************************************************************
mavo 02.05.06 SSPL-DEL Splitsendung loeschen und Zuordnung Mastersendung/Splitsendung aufloesen
*/

define(""{""SSPL_DEL""}"",""{""
l_sdgid_split  = ifelse($1,,"",_ref($1));
l_zsp_sdgidm   = " ";

/*
Schritt 1: Pruefen, ob es sich um eine Splitsendung handelt
*/
if (@SqlImmediate("SELECT zsp_sdgidm FROM szsp_sdgsplit WHERE zsp_sdgid =:l_sdgid_split into :l_zsp_sdgidm ") == FALSE) 
	{
		@print(@sprintf(@nls_gettext_x("li_am.sspl_del.error_split_sdgid")));
		return (FALSE);
	}

/*
Schritt 2: Splitsendung loeschen 
*/
l_Sql_String = "BEGIN sspl.ssdg_delete('"||l_sdgid_split||"'); END;";
            @print(l_Sql_String);
            if (@SqlImmediate(l_Sql_String) == FALSE)
            {
					@print(@sprintf(@nls_gettext_x("li_am.sspl_del.error_split_sdgid_del")));
					return (FALSE);
            }
""}"")

/*
Schritt 3: Zuordnung aufloesen
*/
l_Sql_String = "BEGIN sspl.release_split('"||l_zsp_sdgidm||"','"||l_sdgid_split||"'); END;";
            @print(l_Sql_String);
            if (@SqlImmediate(l_Sql_String) == FALSE)
            {
					@print(@sprintf(@nls_gettext_x("li_am.sspl_del.error_zuord_del")));
               return (FALSE);
            }
""}"")

/*************************************************************
mavo 20.02.06 SMR-DEL Simulationszuordnung FRASI aufheben
*/

define(""{""SMR_DEL""}"",""{""
l_simid    = ifelse($1,,"",_ref($1));
l_simkey   = ifelse($2,,"",_ref($2));
l_simtyp   = " ";

/*
Schritt 1: Simulationstyp aus der SimulationsID ermitteln, zugleich Pruefung simid/simkey
*/
if (@SqlImmediate("SELECT smr_type FROM ssmr_simref WHERE smr_key = :l_simkey and smr_simid =:l_simid into :l_simtyp ") == FALSE) {
		@print(@sprintf(@nls_gettext_x("li_am.smr_del.error_simid")));
		return (FALSE);
	}

/*
Schritt 2: Simulationszuordnung aufloesen
*/
l_Sql_String = "BEGIN ssim.smr_del('"||l_simid||"','"||l_simtyp||"','"||l_simkey||"'); END;";
            @print(l_Sql_String);
            if (@SqlImmediate(l_Sql_String) == FALSE)
            {
					@print(@sprintf(@nls_gettext_x("li_am.smr_del.error_del")));
					return (FALSE);
            }
""}"")

/*************************************************************
mavo 20.02.06 SMR-ADD Simulationszuordnung erfassen
dafa 01.06.06 issue 12590
*/

define(""{""SMR_ADD""}"",""{""
l_simid     = ifelse($1,,"",_ref($1));
l_simtyp    = ifelse($2,,"",_ref($2));
l_simkey    = ifelse($3,,"",_ref($3));
l_simkeyorig= ifelse($4,,"",_ref($4));

l_Sql_String = "BEGIN ssim.smr_add('"||l_simid||"','"||l_simtyp||"','"||l_simkey||"','"||l_simkeyorig||"'); END;";
            @print(l_Sql_String);
            if (@SqlImmediate(l_Sql_String) == FALSE)
            {
					@print(@sprintf(@nls_gettext_x("li_am.smr_add.error_add")));
					return (FALSE);
            }
""}"")

/*************************************************************************
dafa 01.06.06 Stopsortierung (vormals Tourenoptimierung)

*/
define(""{""SOPT_STOPS_SORT""}"", ""{""
	l_farid		= ifelse($1,,"",_ref(""{""$1""}""));
	l_start_lkz	= ifelse($2,,"",_ref(""{""$2""}""));
	l_start_plz	= ifelse($3,,"",_ref(""{""$3""}""));
	l_start_ort	= ifelse($4,,"",_ref(""{""$4""}""));
	l_ziel_lkz	= ifelse($5,,"",_ref(""{""$5""}""));
	l_ziel_plz	= ifelse($6,,"",_ref(""{""$6""}""));
	l_ziel_ort	= ifelse($7,,"",_ref(""{""$7""}""));
	l_dist_voll	= ifelse($8,,"",_ref(""{""$8""}""));
	l_dist_leer	= ifelse($9,,"",_ref(""{""$9""}""));
	l_maut_voll	= ifelse($10,,"",_ref(""{""$10""}""));
	l_maut_leer	= ifelse($11,,"",_ref(""{""$11""}""));
	l_opt_pkg	= ifelse($12,,"SOPT",_ref(""{""$12""}""));

	@print(@sprintf(@nls_gettext_x("li_am.sopt_stops_sort.call")));

	if ( l_opt_pkg == "SOPT" ) {
		l_sql = "sopt.stops_sort(:l_farid,:l_start_lkz,:l_start_plz,:l_start_ort,:l_ziel_lkz,:l_ziel_plz,:l_ziel_ort,:l_dist_voll,:l_dist_leer,:l_maut_voll,:l_maut_leer)";
	} else {
		l_sql = "sopt.stops_sort_v2( :l_opt_pkg, :l_farid,:l_start_lkz,:l_start_plz,:l_start_ort,:l_ziel_lkz,:l_ziel_plz,:l_ziel_ort,:l_dist_voll,:l_dist_leer,:l_maut_voll,:l_maut_leer)";
	}
	@save_vars( l_Cur );
	l_Cur = @SqlOpenCursor(HSQL);
	l_ret = @SqlPLSQL(l_Cur,HSQL, l_sql );
	@SqlCloseCursor(l_Cur,HSQL);
	@restore_vars();
	if ( l_ret == FALSE) {
		return (FALSE);
	}

	ifelse( $8,,,$8 = l_dist_voll; )
	ifelse( $9,,,$9 = l_dist_leer; )
	ifelse( $10,,,$10 = l_maut_voll; )
	ifelse( $11,,,$11 = l_maut_leer; )
	@print(@sprintf(@nls_gettext_x("li_am.sopt_stops_sort.distanz")));
""}"")

/*************************************************************************
dafa 24.10.06 Sendungsgruppen-Kind-Original (verwendung in Simulation)

*/
define(""{""SIM_GET_SGGORIG""}"", ""{""
	@print(@sprintf(@nls_gettext_x("li_am.sim_get_sggorig.call")));
	l_sim_sdgidg		= ifelse($1,,"",_ref(""{""$1""}""));
	l_sim_sdgid			= ifelse($2,,"",_ref(""{""$2""}""));
	l_sim_sdgid_orig	= "";

	if (@SqlImmediate("SELECT sgg_sdgid_orig FROM ssgg_sdggrp WHERE sgg_sdgidg=:l_sim_sdgidg AND sgg_sdgid=:l_sim_sdgid INTO :l_sim_sdgid_orig") == FALSE)
	{
		l_sim_sdgid_orig = "";
	}
	$3	= l_sim_sdgid_orig;
	@print(@sprintf(@nls_gettext_x("li_am.sim_get_sggorig.check")));
""}"")

define(""{""LSTOPNEXT""}"", ""{""
	@print(@sprintf(@nls_gettext_x("li_am.lstopnext.call")));
	l_farid     = ifelse($1,,"",_ref(""{""$1""}""));
	l_stopb = ifelse($2,,"",_ref(""{""$2""}""));
	l_stope = ifelse($3,,"",_ref(""{""$3""}""));
	l_entf = ifelse($4,,"",_ref(""{""$4""}""));

	@print(@sprintf(@nls_gettext_x("li_am.lstopnext.call")));
	if (@SqlImmediate("SELECT NEXT_DISTANZ.get_next_stop(:l_farid, :l_stopb, :l_stope, :l_entf) from dual \
		INTO :l_stopnext") == FALSE)
	{
		l_stopnext = 0;
	}
	$5 = l_stopnext;
	@print(@sprintf(@nls_gettext_x("li_am.lstopnext.result")));
""}"")

/*************************************************************************
ankr 12.11.08 SVKB_NEU VKM-Belegungssatz anlegen 
*/

#define SVKB_NEU(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11) \
_SVKB_NEU_m4(""{""p1""}"",""{""p2""}"",""{""p3""}"",""{""p4""}"",""{""p5""}"",""{""p6""}"",""{""p7""}"",""{""p8""}"",""{""p9""}"",""{""p10""}"",""{""p11""}"")

define(""{""_SVKB_NEU_m4""}"",""{""
	l_farid   = ifelse($1,,"",_ref(""{""$1""}""));
	l_vkmid   = ifelse($2,,"",_ref(""{""$2""}""));
	l_adrid   = ifelse($3,,"",_ref(""{""$3""}""));
	l_orgid   = ifelse($4,,"",_ref(""{""$4""}""));
	l_datum_von  = ifelse($5,,"",_ref(""{""$5""}""));
	l_datum_bis  = ifelse($6,,"",_ref(""{""$6""}""));
	l_status   = ifelse($7,,"",_ref(""{""$7""}""));
	l_verfuegbar    = ifelse($8,,"",_ref(""{""$8""}""));
	l_storno  = ifelse($9,,"",@substr (_ref(""{""$9""}""),1,18));
	l_lafid   = ifelse($10,,"",_ref(""{""$10""}""));
	l_text   = ifelse(""{""$11""}"",,"",_ref_stable(""{""$11""}""));
	l_vkbid = "";
	l_return = "";
	l_usrid = @getwert(USRID);
	if (l_text > "") {
		l_vkb = "svkb.insert_svkb_li2(:l_vkbid, :l_lafid, :l_farid, :l_vkmid, :l_adrid, :l_orgid, :l_datum_von, :l_datum_bis, :l_status, :l_verfuegbar, :l_usrid, :l_storno, :l_return, :l_text)";
	} else {
		l_vkb = "svkb.insert_svkb_li(:l_vkbid, :l_lafid, :l_farid, :l_vkmid, :l_adrid, :l_orgid, :l_datum_von, :l_datum_bis, :l_status, :l_verfuegbar, :l_usrid, :l_storno, :l_return)";
	}

	if ((l_vkmid != "" ) & (l_adrid != "") & (l_datum_von != "") & (l_datum_bis != "") & (l_status != "") & (l_verfuegbar != "")) {
		l_Cur_svkb_neu = @SqlOpenCursor(HSQL);
		@print(@sprintf(@nls_gettext_x("li_am.svkb_neu.call")));
		if (@SqlPLSQL(l_Cur_svkb_neu,HSQL,l_vkb) == FALSE) {
			@print(@sprintf(@nls_gettext_x("li_am.svkb_neu.error")));
			@SqlCloseCursor(l_Cur_svkb_neu,HSQL);
			return (0-72);
		}  else {
			@SqlCloseCursor(l_Cur_svkb_neu,HSQL);
			@print(@sprintf(@nls_gettext_x("li_am.svkb_neu.insert")));
		}					
	} else {
		@print(@sprintf(@nls_gettext_x("li_am.svkb_neu.error_call")));
		@print(l_vkb);
		@print(@sprintf(@nls_gettext_x("li_am.svkb_neu.error_param")));
	}
""}"")

define(""{""SMAB_NEU""}"",""{""
	l_adrid   = ifelse(""{""$1""}"",,"",_ref_stable(""{""$1""}""));
	l_farid   = ifelse(""{""$2""}"",,"",_ref_stable(""{""$2""}""));
	l_vstid   = ifelse(""{""$3""}"",,"",_ref_stable(""{""$3""}""));
	l_orgid   = ifelse(""{""$4""}"",,"",_ref_stable(""{""$4""}""));
	l_datum_von  = ifelse(""{""$5""}"",,"",_ref_stable(""{""$5""}""));
	l_datum_bis  = ifelse(""{""$6""}"",,"",_ref_stable(""{""$6""}""));
	l_adrid_von  = ifelse(""{""$7""}"",,"",_ref_stable(""{""$7""}""));
	l_adrid_bis  = ifelse(""{""$8""}"",,"",_ref_stable(""{""$8""}""));
	l_status   = ifelse(""{""$9""}"",,"",_ref_stable(""{""$9""}""));
	l_vkmid    = ifelse(""{""$10""}"",,"",_ref_stable(""{""$10""}""));
	l_mabid = "";
	MABID_NEU = "";
	if ( (l_adrid > "") & (l_datum_von > "") & (l_datum_bis > "") & (l_status > "")) {
		l_mab = "smab.insert_smab_li(:l_mabid, :l_adrid, :l_farid, :l_vstid, :l_datum_von, :l_datum_bis, :l_adrid_von, :l_adrid_bis, :l_status, :l_orgid, :l_vkmid)";
		l_Cur_smab_neu = @SqlOpenCursor(HSQL);
		@print(@sprintf(@nls_gettext_x("li_am.smab_neu.call")));

		@print("l_adrid:(" || l_adrid || "), l_farid:(" || l_farid || "), l_vstid:(" || l_vstid || "), l_datum_von:(" || l_datum_von || "), l_datum_bis:(" || l_datum_bis || "), l_adrid_von:(" || l_adrid_von || "), l_adrid_bis:(" || l_adrid_bis || "), l_status:(" || l_status || "), l_orgid:(" || l_orgid || "), l_vkmid:(" || l_vkmid || ")");
		if (@SqlPLSQL(l_Cur_smab_neu,HSQL,l_mab) == FALSE) {
			@print(@sprintf(@nls_gettext_x("li_am.smab_neu.error")));
			@SqlCloseCursor(l_Cur_smab_neu,HSQL);
			return (0-72);
		}  else {
			@SqlCloseCursor(l_Cur_smab_neu,HSQL);
			@print(@sprintf(@nls_gettext_x("li_am.smab_neu.insert")));
			if (l_mabid != "NULL") { MABID_NEU = l_mabid; }
		}					
	} else {
		@print(@sprintf(@nls_gettext_x("li_am.smab_neu.error_call")));
		@print(@sprintf(@nls_gettext_x("li_am.smab_neu.error_param")));
	}
""}"")

/*************************************************************************
frth 08.06.2009 LI-DISPO-LE-TR LI aufruf der Dispo-Bib pro zugeordneter TR
*/
define(""{""LI_DISPO_LE_TR""}"",""{""
	l_lafid_le = @getwert(LAFID);
	l_taetigk = @getwert(TAETIGK);
	@save_vars(BIB,TAETIGK);

	/* Schleife ueber Ladeeinheiten nutzen */
	define(""{""_LOOP_SELECT""}"",""{"""SELECT _LA_VARS_SELECT FROM   slaf_leistanf  WHERE  laf_traegerlafid = :l_lafid_le AND laf_latid = 'TR' INTO  _LA_VARS_INTO """}"" )
	define(""{""_LOOP_RSET""}"",""{""_LA_VARS_RESET""}"")
	define(""{""_LOOP_VARS""}"",""{""_LA_VARS_LOOP""}"")
	define(""{""_LOOP_NAME""}"",""{""LI-DISPO-LE-TR: LI-Aufruf Disposition pro LAs der Ladeeinheit""}"")
	BIB = "DISP" || "OSITION";
	_LA_VARS_INIT 
	_LOOP
	@print(@sprintf(@nls_gettext_x("li_am.li_dispo_le_tr.call")));

	@call(@getwert(BIB),AG_ID,AG_ID,FA_ID,FA_ID,TAETIGK,TAETIGK);

	_LOOP_END
	undefine(""{""_LOOP_SELECT""}"")
	undefine(""{""_LOOP_RSET""}"")
	undefine(""{""_LOOP_VARS""}"")
	undefine(""{""_LOOP_NAME""}"")
	@restore_vars();
""}"")
