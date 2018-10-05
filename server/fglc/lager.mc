
/* Formate und Schleifen fuer Lager

   -----------------------------------------------------------------------
   $Log: lager.mc,v $
   Revision 1.77  2018/01/16 12:42:13  dafa
   (jazu): [WMS-1215]: Inventurformat Schwundposition mit KZ 6 moeglich

   Revision 1.77  2017/11/17 12:37:40  dafa
   (jazu): [WMS-1164]: neue Variablen BUCID_UMS_EIN,BUCID_UMS_AUS, BUCID_UMS_UML

   Revision 1.76  2017/09/21 12:43:01  dafa
   (jazu): [WMS-1164]: Korrektur AUMS

   Revision 1.75  2017/09/18 13:22:36  dafa
   (jazu): [WMS-1164]: Neues Format AUMS "Anlegen Bestandsmodifikation"

   Revision 1.74  2017/02/15 10:37:31  dafa
   (jazu): [WMS-924]: Generierung Lagertransporte

   Revision 1.73.2.1  2016/04/17 13:46:20  frth
   (jazu): [WMS-924]: Generierung Lagertransporte

   Revision 1.73  2015/06/24 15:02:36  dafa
   (frth): [WMS-771]: AGEN_BUC um buc_leistdat erweitert

   Revision 1.72  2014/08/15 11:03:46  dafa
   (jazu): [WMS-457]: PRLogs Zusatz-Checks fuer Datumsformate

   Revision 1.71  2014/08/13 18:31:14  dafa
   (jazu): [WMS-441]: Korrektur

   Revision 1.70  2014/08/13 17:42:34  dafa
   (jazu): [WMS-441]: Formate APRL* angepasst. Wegen Prog.Name bei nicht ALLG-Module. Codid hinzugefuegt.

   Revision 1.69  2014/05/07 13:41:08  dafa
   (jazu): [WMS-194]: PRLog Formate erweitert. Modul wird ermittelt.

   Revision 1.68  2014/04/15 13:30:15  dafa
   (jazu): [WMS-194]: Format APRL korrigiert

   Revision 1.67  2014/04/15 11:46:47  dafa
   (jazu): [WMS-194]: Formate APRL_1, APRL_START und APRL_END korrigiert l_prl_menge = NULL wenn leer

   Revision 1.66  2014/03/14 09:11:04  dafa
   (jazu): [WMS-194]: Neue Formate APRL_1, APRL_START, APRL_END und unsupported APRL

   Revision 1.65  2013/11/06 14:22:18  dafa
   (frth): [LBASE-415]: Schleife korrigiert

   Revision 1.64  2013/06/19 15:04:16  dafa
   (jazu): [33053]: Format LG_Switchbewdyn um die Vepid (Param5) erweitert

   Revision 1.63  2013/06/17 09:59:23  dafa
   (jazu): [33053]: Neues Format "Auslagerungsbewegung dyn. tauschen" (Bewegungsswitch dynamisch)

   Revision 1.62  2013/01/04 12:37:27  dafa
   (jazu): [31633]: Format fuer die Fixplatzanlage korrigiert

   Revision 1.61  2012/08/23 08:10:24  dafa
   (jazu): [30558]: Meldung im Format AGEN_FPV korrigiert

   Revision 1.60  2012/08/06 14:58:03  dafa
   (jazu): [30436]: Bewegungen im Status EB/ER im Format LAGER_BESTAND exkludiert

   Revision 1.59  2012/07/18 13:37:18  dafa
   (jazu): [28564]: Prozedur agen.bpo_neu um die orgid-AG_ID erweitert.

   Revision 1.58  2011/10/26 09:00:17  dafa
   (jazu): [24698]: Neues Format START_AABR

   Revision 1.57  2011/06/27 14:34:05  dafa
   (elro): [24548]: ueberfluessiges undefine von _ART_VARS_RESET und _HST_VARS_RESET in LG_BESTANDSHISTORY entfernt

   Revision 1.56  2011/06/20 15:07:37  dafa
   (frth): [24548]: LBaseWMS Schleife LG_BUCH_POS_ZE hatte falsches RESET_VARS

   Revision 1.55  2011/05/12 07:49:48  dafa
   (frth): [24548]: Ruecksetztenfeld von Schleife LG_PLATZ war falsch

   Revision 1.54  2011/03/10 07:22:20  dafa
   (frth): [24149]: Schleife LG_LVE die Variablen gesichert

   Revision 1.53  2011/02/11 12:20:18  dafa
   (jazu): [24698]: Neue Schleife LG_WGR

   **************************************************************************
   09.01.97  REWI  Neu
   15.01.98  DAFA  bpo_bemerkung eingefuegt
   23.01.98  DAFA  art_grup1, art_grup2 eingefuegt
   14.08.98  REWI/DAFA  Umbuchungen bei Schleifen LG_SUMMEN ignorieren
   11.09.98  DAFA  bpo_mark in Schleife LG_BUCH_POS eingefuegt
   03.11.98  ROMO  Fehler im Select fuer Lagerstand per ... korrigiert
   14.06.99  DAFA  bew_mark + bew_prodat in Schleife LG_BUCH_BEW eingefuegt
   23.06.99  DAFA  art_iwertpreis, art_iwertanzahl und art_ze_iwert in
                   _ART_VARS_SELECT und _ART_VARS_INTO eingefuegt
   09.08.99  REWI  Schleife ueber alle Lagervereinbarungen (fuer Abrechnung)
   09.08.99  REWI  Schleife ueber alle LAs zur Buchung
   21.10.99  DAFA  aze_laenge und aze_hoehe in _AZE_VARS_LOOP,
                   _AZE_VARS_SELECT und _AZE_VARS_INTO eingefuegt
   29.11.99  DAFA  Jahreszahl in LG_SUMMEN_W, LG_SUMMEN_M und LG_SUMMEN_D
                   auf 4 Stellen erweitert.
   16.03.00  ROMO  BPO_POSNR und BPO_SETREFID eingebaut
   30.03.00  ROMO  BEW_LSPID eingebaut
   30.03.00  REWI  LG-EBEW-ABEW Auslager.Beweg
   04.04.00  REWI  Tippfehler Lgerverienbarung in Schleife korrigiert
   25.04.00  ROMO  BPO_POSNR und BPO_SETREFID wieder ausgebaut, da Array-
                   ueberlauf. Funktioniert nur mit EXE ab April 2000 !!!
   25.04.00  ROMO  neue Sortierungen/Where-Bedingungen fuer Schleife LG_BUCH
   27.04.00  REWI  ZZWHERE als zusaetzliche Where-Bedingung fuer LAGER-STAND
   27.04.00  ROMO  zusaetzliche WHERE-Bedingung in Schleifen LG_SUMMEN
                   eingebaut ( keine Bedinungen definiert, jedoch funktioniert
                   ZZWHERE )
   03.05.00  ROMO  BUC_TYP in Buchungsschleife zuruecksetzen !!!
   03.05.00  ROMO  ART_TEMP_MIN, ART_TEMP_MAX in Positionsschleife zuruecksetzen
   27.05.00  DAFA  Lagergeldfreie Tage:
                   (4. Format-Param.)     leer  =  0 Tage
                                          nn    = nn Tage
                                          'W'   = Einlagerungswoche frei
                                          'M'   = Einlagerungsmonat frei
   07.06.00 ROST Formate agen_buc und agen_bpo
   16.06.00 REWI Format agen_bpo erweiterung um Artikel-Nr
   28.06.00 DAFA Fehlerkorrektur Format agen_bpo ( 11,14,17 )
   29.06.00 DAFA Fehlerkorrektur Format agen_bpo ( 28,29,30 )
   22.08.00 DAFA Neue Formate ASTAT_BUC, ASTAT_BPO und ASTAT_BEW eingefuegt
   25.08.00 ROMO Neue Schleife fuer Bestandsbewegungen eines Artikels
   04.09.00 ROMO Neue Schleife erweitert um Zugriffszahl
   04.09.00 DAFA W_LG_BUCH_EIN und W_LG_BUCH_AUS auf buc_art gelegt
   18.09.00 ROMO Schleife LG_BEST_BEW: Bedingungen auf lokale Variablen
   18.09.00 DAFA Fuer Formate ASTAT_BUC, ASTAT_BPO und ASTAT_BEW Fehler-
                 behandlung eingefuegt ( auf SGLO gelegt )
   20.09.00 ROMO Sortierung fuer Schleife LG_LVE
   21.09.00 ROMO Bewegungsdatum in Schleife LG_BEST_BEW auf LI-Format
   25.09.00 DAFA Reserveparameter fuer die Formate Statuswechsel eingefuegt
   29.09.00 ROMO Format LG_STAND umgestellt (akzeptiert wieder Var. mit !
   03.10.00 DAFA Where- und Orderklausel in LG_ARTIKEL eingebaut
   06.10.00 DAFA Fehlerbehandlung fuer Formate ASTAT_BUC, ASTAT_BPO und
                 ASTAT_BEW um Fehlerklasse erweitert und Fehlertextlaenge
                 auf 50 Stellen erweitert.
   06.11.00 DAFA Formatparameter 'exceptions' fuer ASTAT_BUC,ASTAT_BPO und
                 ASTAT_BEW eingefuegt
   21.11.00 WOPR WWS-Preise in BPO_VARS_RESET
   22.11.00 WOPR Gefahrgut in BPO_VARS_RESET
   08.01.01 WOPR BPO_FVEPKBEZ in BPO_VARS_RESET
   20.02.01 DAFA Format AGEN_BPO mit Umlagerung erweitert und erweitertes
                 Fehlerhandling eingefuegt
   07.03.01 ROMO W_LG_BUCH_EIN_EV und W_LG_BUCH_AUS_AV fuer Schleife LG_BUCH
                 Schleife LG_BUCH_POS: auch ohne BUCID verwendbar; gesetzt
                 sein sollten DATUM_VON und DATUM_BIS, zusaetzlich dzt. ARTID
   12.03.01 ROMO Neue Schleife LG_BUCH_POS_ZE
   12.03.01 ROMO Neue Schleife LG_ART_ZE
   26.03.01 DAFA Neue Schleife LG_NACHSCHUB und neues Format
                 Selektionsschleife Nachschubdaten (ANAC_BPO) eingefuegt
                 (Achtung: Das Format ANAC_BPO ist mit DB-Package ANAC
                           verheiratet. Bei Verteilung beachten !!!)
   28.03.01 DAFA ANAC_BPO kommunikativer gestaltet (Errorhandling eingebaut)
                 LG_NACHSCHUB fuer Artikel ohne Bestand im LBE erweitert
   04.04.01 DAFA LG_NACHSCHUB fuer logische Bereiche erweitert und Rueckgabe
                 der Variable PRIORITAET (prozentuelle Bedarfsmenge)
   15.05.01 ROMO Neue Formate fuer Inventur anlegen (AGEN_INV, AGEN_INVE,
                 AGEN_INV_ART)
   23.06.01 ROMO zusaetzliche WHERE-Bedingungen fuer LG_BUC
   25.06.01 REWI Korrektur Where-Bedingung (Hochkomma hat gefehlt)
   02.07.01 ROMO Sortierung fuer Schleife LG_BUCH_BEW (Std. auf bew_bpoid,
                 bew_bewid)
                 Schleife erweitert, damit auch ohne BPOID (nur BUCID)
                 verwendbar
   03.07.01 ROMO Neue Schleife fuer BEWEGUNGEN, LG_BUCH_BEW wieder auf alten
                 Stand
   10.07.01 ROMO Neue Schleife fuer Lagerplaetze (LG_PLATZ)
   16.07.01 ROMO Schleifen LG_BEW und LG_PLATZ um LBEID erweitert
   17.07.01 ROMO Statuswechsel Bewegung um Parameter fuer neuen Platz erweitert
   18.07.01 ROMO Buchung/Position in LG_BEW aufgenommen, damit ZZWHERE
                 auch ueber diese Felder moeglich
   03.08.01 ROMO Schleife LG_BEW: Einschraenkungen angepasst
   29.09.01 ROMO zusaetzliche Bedingung W_LG_BUCH_NOT_ERL fuer Schleife LG_BUCH
   09.11.01 DAFA ZZWHERE in Format LAGER_BESTAND auswerten
   24.01.02 ROMO neue Sortierung fuer Schleife LG_BUCH_POS
   06.03.02 DAFA/INBU Neue Schleife LG_NACHSCHUBWA, Format ANAC_BPO um
                 Parameter Rundung erweitert
   20.03.02 MAGR Neue Schleife LG_ART_EAN
   30.03.02 DAFA Schleife LG_NACHSCHUBWA komplett ueberarbeitet, ZA in
                 Auftragsmengenselektion beruecksichtigt,Alternativ-
                 Bestaende beruecksichtigt.
                 ANAC_BPO um Regel-ID EIN und AUS erweitert
   02.04.02 DAFA/INBU Format ANAC_BPO um Rundungsebene erweitert
   04.04.02 DAFA Format ANAC_BPO um Regelkennzeichen erweitert
   09.05.02 DAFA Format LAGER_BESTAND um Kumulationskennzeichen erweitert
                 ACHTUNG: Bei Verteilung NEUEN Format-Parameter beruecksichtigen
                 Format LG_SUMMEN mit P1 fuer Kumulationskennzeichen erweitert
   23.05.02 MIST Format AMENGEN_UPD (Mengenaenderung Bewegung) -- AFOR-Package
                 Entscheidung Aufruf Einlagerung oder Auslagerung
   12.09.02 DAFA Format AGEN_BUC mit neuem Parameter (Code=BUC_DEL_EMPTY)
                 "Buchung o. POS loeschen" erweitert und Format AGEN_BUCE mit
                 der Auswertung dieses Param. ergaenzt
   11.11.02 INBU Format ANAC_BPO um Bestandsrundungskennzeichen und -ebene erweitert
   13.11.02 MIST Format AMENGEN_UPD (Mengenaenderung Bewegung) -- AFOR-Package
                 Parameteraenderung und Statusabfrage
   15.11.02 INBU Format LG_NACHSCHUBWA erweitert. KOMMLBEMIN wurde bis dato
                 nicht beruecksichtigt und daher immer nachgeschoben (Teil 3 und 4).
   29.11.02 INBU Format LG_NACHSCHUBWA erweitert. Bei Auftragsberuecksichtigung wurde
                 nur der theoretische Lagerstand im Zielbereich beruecksichtigt.
                 Ermittlungskomponente Teil 2 um tatsaechlichen Lagerstand im
                 Zielbereich erweitert anstatt KOMMLBEMAX.
   20.12.02 INBU Format LG_NACHSCHUBWA erweitert. Um Artikel nur nachzuschieben, wenn
                 es Auftragsdaten gibt, wird KOMMLBEMIN auf 0 gesetzt.
   09.01.03 KAZE Schleife LB_BUCH um die Felder BUC_NR_ALT,BUC_TYP_ALT(BUC_BTYID)
                 ,BUC_SDGID_ALT erweitert
   04.02.03 WEKL Parameter bei bpo_neu (bpo_adrid) eingefuegt
   04.02.03 DAFA Erweiterung vom 12.09.02 NOCHMALS integriert und AGEN_BPO laut
                 wekl korrigiert
   24.02.03 DAFA AGEN_BPO korrigiert
   24.02.03 INBU LG_NACHSCHUBWA: Ermittlungskomponente Teil 2
                 KOMMLBEMIN ausgebaut, NVL(MAX(Best.mge),0)
   04.04.03 DAFA FIX Kumulationskennzeichen (P1) in LG_SUMMEN
   09.04.03 ROMO Artikelgruppe in LG_ARTIKEL aufgenommen + Sortierungen def.
   16.06.03 ALBU buc_nr wg. Widerspruch bei order by mit Synomym
   26.06.03 ANBU LG_BUCH_POS Sortierung S_LG_BPO_ARTNR hinzugefuegt
   30.07.03 JAZU AGEN_BUC Fehlerkorrektur agen_buc parametern (10,12,14) vom char -> number
   02.04.04 JAZU BPO_POSNR und BPO_SETREFID in LG_BUCH_POS eingebaut
   22.11.04 ROMO Bibliothek fuer Inventur
                 Format fuer neue Zaehlung
   03.02.05 ROMO AZE_SPEDITION zu div. Schleifen hinzugefuegt
   21.06.05 ROMO Bibliothek fuer Nachschub
   29.08.05 ROMO Format lagerstand um History-Tabelle erweitert
   06.09.05 ROMO Schleife fuer Nachschubeinleitungen der Buchung
   06.09.05 ROMO Schleife fuer Bestandshistory
   17.10.05 ROMO neues Format fuer Bewegungsswitch
   18.11.05 ROSI neues Format fuer Bewegungssplit
   03.10.06 ROMO Applikationsspezifische Fehler beim Statuswechsel werden
                 ueber Returncode zurueckgeliefert und loesen keinen Abbruch
                 aus (ISSUE 13688)
   28.03.07 ROMO 10184 Format AGEN_BUC - Rechnungsempfaenger ist optional
   21.08.07 JAZU 15868 Format AGEN_FPV fuer die Anlage der Fixplatzvariante erstellt
   23.08.07 JAZU 15868 Format AGEN_FPL fuer die Anlage der Fixplatzzuordnung erstellt
   25.08.07 JAZU 15868 Schleife LG_FPL fuer die Fixplatzdefinitionen
   27.08.07 JAZU 15868 ZZORDERBY in LG_FPL eingefuegt.
   05.09.07 JAZU 15868 WMSORDERBY laut ROBU in den schleifen LG_BEW und LG_PLATZ hinzugefuegt.
   13.09.07 JAZU 15868 Lagervereinbarung ins Format AGEN_FPV eingefuegt.
   28.09.07 JAZU 15868 Abfrage ob WMSORDERBY gesetzt ist um Promp zu vermeiden.
   20.01.08 JAZU 15868 WMSORDERBY zur  Schleife LG_BUCH_POS hinzugefuegt.
   06.05.08 WEHA/FRTH 17693 AGEN_INV mit NVL versehen
   20.07.09 WEKL 20686 ORDER BY bei LG_SUMMEN%
   10.11.09 JAZU 19602 Fixplatz Schleife und Format um fpl_grup1, fpl_grup2 erweitert.
   30.11.09 JAZU 21232 Format AIPO_BEARB Inventur-Positionsbearbeitung hinzugefuegt.
   15.09.10 JAZU 23697 WMSORDERBY auch im LG_BUCH
   15.09.10 WEHA 21232 Format AIPO_BEARB: Validierung Param l_bestand, l_art_lveid,
                 l_artid und l_vepid geaendert
   10.11.10 JAZU 23735 WMSORDERBY aus LG_BUCH wieder entfernt und neue Sortierungen erstellt.
/**************************************************************************
Bibliotheken:
*/

#define LAGERPLATZ_INIT
#define LAGERPLATZ_END
#define LAGERPLATZ_STB_INIT
#define LAGERPLATZ_STB_END START

#define AINV_INIT
#define AINV_END
#define AINV_STB_INIT
#define AINV_STB_END START

#define ANAC_INIT
#define ANAC_END
#define ANAC_STB_INIT
#define ANAC_STB_END START


/* Loops basieren auf _LOOP in makrodef.mc */

/*************************************************************************
Lagerplatz-Schleife
*/

define(""{""_LPL_VARS_LOOP""}"",  ""{""LPLID, LPL_BEZ, LPL_BELEGT, LPL_BRUTTO, \
   LPL_MAXBELAST, LPL_SPERRE""}"")
define(""{""_LPL_VARS_RESET""}"",  ""{""""}"")
undefine(""{""_LPL_VARS_RESET""}"")
define(""{""_LPL_VARS_SELECT""}"", ""{""lpl_lplid, lpl_bez, lpl_belegt, lpl_brutto, \
   lpl_maxbelast, lpl_sperre""}"")
define(""{""_LPL_VARS_INTO""}"",  ""{"":LPLID, :LPL_BEZ, :LPL_BELEGT, :LPL_BRUTTO, \
   :LPL_MAXBELAST, :LPL_SPERRE""}"")
define(""{""_LPL_VARS_INIT""}"", ""{"" ""}"")

define(""{""_LOOP_VARS""}"", ""{""_LPL_VARS_LOOP""}"")
undefine(""{""_LOOP_RSET""}"")

/* ---------------------------------------------------------------------
LG-PLATZ Schleife der Lagerplaetze
   als Einschraenkung werden folgende VARIABLEN beruecksichtigt:
   - LBEID
*/
define(""{""W_LG_PLATZ_BELEGT""}"", ""{""lpl_belegt > 0""}"")
define(""{""W_LG_PLATZ_NOT_BEL""}"", ""{""lpl_belegt = 0""}"")

define(""{""S_LG_PLATZ_BEZ""}"", ""{""lpl_bez""}"")

define(""{""_LPL_VARS_INIT""}"", ""{""l_where = " ";
if (@gesetzt(WMSORDERBY) == TRUE) 
   {
      l_orderby =  @getwert(WMSORDERBY) || " " ||  l_p_orderby;
   }
	else
	{
	   l_orderby = l_p_orderby; 
	}

if (@gesetzt(LBEID) == TRUE) { if (@getwert(LBEID) > " ")
   {
      l_lbeid = @getwert(LBEID);
      l_lbe_log = 0;
      l_ret = @SqlImmediate(" \
         SELECT lbe_log \
         FROM albe_lbereich \
         WHERE lbe_lbeid = :l_lbeid \
         INTO :l_lbe_log ");
		@print(@sprintf(@nls_gettext_x("li_lg.lpl_vars_init.par_lbeid")));
      if ( l_lbe_log == 1 )
      {
			@print(@sprintf(@nls_gettext_x("li_lg.lpl_vars_init.par_lbe_log")));
         l_where = l_where || " AND lpl_lplid in ( select lpb_lplid \
                                       from alpb_lpl_lbe \
                                       where lpb_lbeid = :l_lbeid) ";
      }
      else
      {
         l_where = l_where || " AND lpl_lbeid = :l_lbeid ";
      }
   }
}
""}"")

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _LPL_VARS_SELECT \
      FROM alpl_lplatz " ||
      " WHERE  1 = 1 " ||
      l_where || l_p_where ||
      " ORDER BY " || l_orderby || " lpl_lplid \
      INTO _LPL_VARS_INTO"""}"")

define(""{""_LOOP_NAME""}"",""{""LG-PLATZ: Lagerplaetze""}"")
define(""{""LG_PLATZ""}"", ""{""_LPL_VARS_INIT""}"" _LOOP )


/*************************************************************************
Buchungssschleife

*/

define(""{""_BUC_VARS_LOOP""}"",  ""{""BUCID, BUC_NR, BUC_ART, BUC_STATUS, \
   BUC_DATUM, BUC_ADRID_AB, BUC_ADRID_EM, \
   BUC_REF_AB, BUC_REF_EM, \
   BUC_NR_ALT, BUC_TYP_ALT, BUC_SDGID_ALT, BUC_SDGID""}"")
define(""{""_BUC_VARS_RESET""}"",  ""{""BPOID, BUC_MENGE1, BUC_MENGE2, BUC_MENGE3, \
   BUC_MENGE4, BUC_MENGE5, BUC_BRUTTO, BUC_TYP""}"")
define(""{""_BUC_VARS_SELECT""}"", ""{""buc_bucid, buc_nr, buc_art, buc_bstid, \
   to_char(buc_datum,'YYYY.MM.DD'), buc_abs_adrid, buc_empf_adrid, \
   buc_abs_ref, buc_empf_ref, \
   buc_nr buc_nr_alt, buc_btyid, buc_sdgid, buc_sdgid""}"")
define(""{""_BUC_VARS_INTO""}"",  ""{"":BUCID, :BUC_NR, :BUC_ART, :BUC_STATUS, \
   :BUC_DATUM, :BUC_ADRID_AB, :BUC_ADRID_EM, \
   :BUC_REF_AB, :BUC_REF_EM, \
   :BUC_NR_ALT, :BUC_TYP_ALT, :BUC_SDGID_ALT, :BUC_SDGID""}"")
define(""{""_BUC_VARS_INIT""}"", ""{"" ""}"")

define(""{""_LOOP_VARS""}"", ""{""_BUC_VARS_LOOP""}"")
define(""{""_LOOP_RSET""}"", ""{""_BUC_VARS_RESET""}"")

/* ---------------------------------------------------------------------
LG-BUCH Buchungen der aktuellen Lagervereinbarung in einem Zeitraum
       LVEID, DATUM_VON, DATUM_BIS
*/
define(""{""W_LG_BUCH_EIN""}"", ""{""buc_art = 'EIN'""}"")
define(""{""W_LG_BUCH_AUS""}"", ""{""buc_art = 'AUS'""}"")
define(""{""W_LG_BUCH_EE""}"", ""{""buc_bstid = 'EIN07'""}"")
define(""{""W_LG_BUCH_AE""}"", ""{""buc_bstid = 'AUS05'""}"")
define(""{""W_LG_BUCH_EV""}"", ""{""buc_bstid = 'EIN01'""}"")
define(""{""W_LG_BUCH_AV""}"", ""{""buc_bstid = 'AUS01'""}"")
define(""{""W_LG_BUCH_EIN_NOT_EE""}"", ""{""buc_art = 'EIN' and buc_bstid != 'EIN07'""}"")
define(""{""W_LG_BUCH_AUS_NOT_AE""}"", ""{""buc_art = 'AUS' and buc_bstid != 'AUS05'""}"")
define(""{""W_LG_BUCH_NOT_ERL""}"", ""{""buc_bstid != 'EIN07' and buc_bstid != 'AUS05' and buc_bstid != 'UML05'""}"")

define(""{""S_LG_BUCH_DAT_EMPF""}"", ""{""buc_datum;buc_empf_adrid""}"")
define(""{""S_LG_BUCH_DAT_ABSREF""}"", ""{""buc_datum;buc_abs_ref""}"")
define(""{""S_LG_BUCH_DAT_NR""}"", ""{""buc_datum;buc_nr""}"")
define(""{""S_LG_BUCH_DAT_JOBID_NR""}"", ""{""buc_datum;lpad(buc_autokomm,10,'0');buc_nr""}"")
define(""{""S_LG_BUCH_NR""}"", ""{""buc_nr""}"")
define(""{""S_LG_BUCH_KLASSE""}"", ""{""buc_bklid""}"")
define(""{""S_LG_BUCH_ART""}"", ""{""buc_art""}"")
define(""{""S_LG_BUCH_STATUS""}"", ""{""buc_bstid""}"")
define(""{""S_LG_BUCH_ABS""}"", ""{""buc_abs_adrid""}"")
define(""{""S_LG_BUCH_EMPF""}"", ""{""buc_empf_adrid""}"")
define(""{""S_LG_BUCH_RECH_EMPF""}"", ""{""buc_rech_adrid""}"")


define(""{""_BUC_VARS_INIT""}"", ""{""""}"")

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _BUC_VARS_SELECT \
      FROM abuc_buchung " ||
      " WHERE  buc_datum >= to_date(:DATUM_VON, 'YYYY.MM.DD') \
      AND buc_datum < to_date(:DATUM_BIS, 'YYYY.MM.DD') +1 \
      AND buc_lveid = :LVEID " ||
      l_p_where   ||
      " ORDER BY " || l_p_orderby || " buc_datum, buc_art \
      INTO _BUC_VARS_INTO"""}"")

define(""{""_LOOP_NAME""}"",""{""LG-BUCH: Buchungen""}"")
define(""{""LG_BUCH""}"", ""{""_BUC_VARS_INIT""}"" _LOOP )


/*************************************************************************
Nachschubeinleitungsschleife

*/

define(""{""_NEI_VARS_LOOP""}"",  ""{""NEIID, NEI_NR, NEI_STATUS""}"")
define(""{""_NEI_VARS_RESET""}"",  ""{""""}"")
undefine(""{""_NEI_VARS_RESET""}"")
define(""{""_NEI_VARS_SELECT""}"", ""{""nei_neiid, nei_nr, nei_status""}"")
define(""{""_NEI_VARS_INTO""}"",  ""{"":NEIID, :NEI_NR, :NEI_STATUS""}"")
define(""{""_NEI_VARS_INIT""}"", ""{"" ""}"")

define(""{""_LOOP_VARS""}"", ""{""_NEI_VARS_LOOP""}"")
define(""{""_LOOP_RSET""}"", ""{""_NEI_VARS_RESET""}"")

/* ---------------------------------------------------------------------
LG-BUCH-NEI Nachschubeinleitungen der aktuellen Buchung
*/

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _NEI_VARS_SELECT \
      FROM anei_ns_einleitung \
      WHERE nei_bucid_ref = :BUCID " || \
      l_p_where || "\
      ORDER BY " || l_p_orderby || " nei_neiid \
      INTO _NEI_VARS_INTO"""}"")

define(""{""_LOOP_NAME""}"",""{""LG-BUCH-NEI: Nachschubeinleitungen""}"")
define(""{""LG_BUCH_NEI""}"", _NEI_VARS_INIT _LOOP )


/*************************************************************************
Buchungspositionsschleife

*/

define(""{""_BPO_VARS_LOOP""}"",  ""{""BPOID, BPO_DATUM, \
   BPO_STATUS, BPO_BRUTTO, BPO_MENGE1, BPO_MENGE2, BPO_MENGE3, \
   BPO_MENGE4, BPO_MENGE5, VEP_KBEZ1, VEP_KBEZ2, VEP_KBEZ3, \
   VEP_KBEZ4, VEP_KBEZ5, BPO_BEMERKUNG, BPO_MARK, BPO_POSNR, BPO_SETREFID""}"")
define(""{""_BPO_VARS_RESET""}"",""{""AGR_BEZ, ART_TEMP_MIN, ART_TEMP_MAX,                \
   BPO_EPREIS, BPO_FMENGE, BPO_FVEPID, BPO_FVEPKBEZ, BPO_GPREIS,                          \
   BPO_KWEPREIS, BPO_KWGPREIS, BPO_RABATT,                                    \
   ART_GG,ART_GG_AUSNAHME,ART_GG_AZUSTAND,ART_GG_BUCHSTABE,ART_GG_CHEMBEZ,    \
   ART_GG_CODE,ART_GG_FAKTOR,ART_GG_GEFID,ART_GG_KEMLERNR,ART_GG_KLASSE,      \
   ART_GG_LEERGUT,ART_GG_MMEINH,ART_GG_OECHEMV,ART_GG_TYP,ART_GG_UMWELT,      \
   ART_GG_UN,ART_GG_WGK,ART_GG_ZIFFER,                \
   BPO_GG_NEX, BPO_GG_LIT, BPO_GG_BGW, BPO_GG_NGW ""}"")
define(""{""_BPO_VARS_SELECT""}"", ""{""bpo_bpoid, to_char(bpo_datum,'YYYY.MM.DD'), \
   bpo_bstid, bpo_brutto, bpo_menge1, bpo_menge2, bpo_menge3, \
   bpo_menge4, bpo_menge5, vep_kbez1, vep_kbez2, vep_kbez3, \
   vep_kbez4, vep_kbez5, SUBSTR( bpo_bemerkung, 1, 254 ), bpo_mark, bpo_posnr, bpo_setrefid""}"")
define(""{""_BPO_VARS_INTO""}"",  ""{"":BPOID, :BPO_DATUM, \
   :BPO_STATUS, :BPO_BRUTTO, :BPO_MENGE1, :BPO_MENGE2, :BPO_MENGE3, \
   :BPO_MENGE4, :BPO_MENGE5, :VEP_KBEZ1, :VEP_KBEZ2, :VEP_KBEZ3, \
   :VEP_KBEZ4, :VEP_KBEZ5, :BPO_BEMERKUNG, :BPO_MARK, :BPO_POSNR, :BPO_SETREFID""}"")
define(""{""_BPO_VARS_INIT""}"", ""{""l_where = " "; l_artid = @getwert(ARTID);

if (@gesetzt(WMSORDERBY) == TRUE)
   {
      l_orderby =  @getwert(WMSORDERBY) || " " ||  l_p_orderby;
   }
   else
   {
      l_orderby = l_p_orderby;
   }

if (@getwert(BUCID) > " ")
{ l_where = " AND bpo_bucid = :BUCID "; }
else
{
   l_where = l_where || " AND bpo_lveid = :LVEID ";
   if (@getwert(DATUM_VON) > " ")
   { l_where = l_where || " AND bpo_datum >= to_date(:DATUM_VON, 'YYYY.MM.DD') "; }
   if (@getwert(DATUM_BIS) > " ")
   { l_where = l_where || " AND bpo_datum < to_date(:DATUM_BIS, 'YYYY.MM.DD') +1 "; }
   if ((@getwert(ARTID) > " ") & (@gesetzt(ARTID) == TRUE))
   { l_where = l_where ||" AND bpo_artid = :l_artid "; }
}
""}"")

define(""{""_ART_VARS_LOOP""}"",  ""{""ARTID, ART_NR, ART_AGRID, ART_WGRID, \
   ART_BEZ, ART_MATCHCODE, ART_GRUP1, ART_GRUP2""}"")
undefine(""{""_ART_VARS_RESET""}"")
define(""{""_ART_VARS_SELECT""}"",  ""{""art_artid, art_nr, art_agrid, art_wgrid, \
   art_bez, art_matchcode, art_grup1, art_grup2, art_iwertpreis, \
   art_iwertanzahl, art_ze_iwert ""}"")

define(""{""_ART_VARS_INTO""}"",  ""{"":ARTID, :ART_NR, :ART_AGRID, :ART_WGRID, \
   :ART_BEZ, :ART_MATCHCODE, :ART_GRUP1, :ART_GRUP2, :ART_IV_WERT, \
   :ART_IV_ANZ, :ART_IV_VEPID ""}"")
define(""{""_ART_VARS_INIT""}"", ""{""l_artid = @getwert(ARTID);""}"")

define(""{""_AZE_VARS_LOOP""}"",  ""{""ART_BREITE, ART_LAENGE, ART_HOEHE""}"")
undefine(""{""_AZE_VARS_RESET""}"")
define(""{""_AZE_VARS_SELECT""}"",  ""{""aze_breite, aze_laenge, aze_hoehe""}"")
define(""{""_AZE_VARS_INTO""}"",  ""{"":ART_BREITE, :ART_LAENGE, :ART_HOEHE""}"")
define(""{""_AZE_VARS_INIT""}"", ""{""l_artid = @getwert(ARTID);""}"")

define(""{""_LOOP_VARS""}"", ""{""_BPO_VARS_LOOP, _ART_VARS_LOOP, _AZE_VARS_LOOP""}"")
define(""{""_LOOP_RSET""}"", ""{""_BPO_VARS_RESET""}"")

/* ---------------------------------------------------------------------
LG-BUCH-POS Positionen (Artikel) der aktuellen Buchung BUCID
    nach Artikelgruppen-Artikel-Id sortiert (wegen Generieren Sdg)
*/
define(""{""W_LG_BPO_EIN""}"", ""{""bpo_art = 'EIN'""}"")
define(""{""W_LG_BPO_AUS""}"", ""{""bpo_art = 'AUS'""}"")
define(""{""W_LG_BPO_EE""}"", ""{""bpo_bstid = 'EIN07'""}"")
define(""{""W_LG_BPO_AE""}"", ""{""bpo_bstid = 'AUS05'""}"")
define(""{""W_LG_BPO_EV""}"", ""{""bpo_bstid = 'EIN01'""}"")
define(""{""W_LG_BPO_AV""}"", ""{""bpo_bstid = 'AUS01'""}"")
define(""{""S_LG_BPO_SORTIER""}"", ""{""nvl(lpad(alat.get_za(bpo_artid, 'AART', 'SORTIERNR'), 35, '0'), art_nr)""}"")
define(""{""S_LG_BPO_BPOIDNUM""}"", ""{""Length(bpo_bpoid);bpo_bpoid""}"")

/* define(""{""S_LG_BPO_ARTNR""}"", ""{""art_nr""}"") */

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _BPO_VARS_SELECT, \
         _ART_VARS_SELECT, \
         _AZE_VARS_SELECT \
      FROM    abpo_art_b, aaze_artikel_ze \
      WHERE art_artid = aze_artid \
      AND   aze_sortnr = 1 "||\
      l_where || l_p_where || "\
      ORDER BY " || l_orderby || " art_agrid, art_nr \
      INTO _BPO_VARS_INTO, _ART_VARS_INTO, _AZE_VARS_INTO"""}"")

define(""{""_LOOP_NAME""}"",""{""LG-BUCH-POS-A: Buchungspositionen""}"")
define(""{""LG_BUCH_POS""}"", _BPO_VARS_INIT _LOOP )

/* ---------------------------------------------------------------------
BPO-Zaehleinheiten Schleife

*/
define(""{""_BPZ_VARS_LOOP""}"",  ""{""BPZ_SORTNR, BPZ_BUCHUNG, BPZ_MENGE, \
   BPZ_ANZAHL, BPZ_SOLL, BPZ_VEPID""}"")
undefine(""{""_BPZ_VARS_RESET""}"")
define(""{""_BPZ_VARS_SELECT""}"", ""{""bpz_sortnr, bpz_buchung, bpz_menge, \
   bpz_anzahl, bpz_soll, bpz_vepid""}"")
define(""{""_BPZ_VARS_INTO""}"",  ""{"":BPZ_SORTNR, :BPZ_BUCHUNG, :BPZ_MENGE, \
   :BPZ_ANZAHL, :BPZ_SOLL, :BPZ_VEPID""}"")
define(""{""_BPZ_VARS_INIT""}"", ""{"" ""}"")

define(""{""_AZE2_VARS_LOOP""}"",  ""{""AZE_SORTNR, AZE_BUCHUNG, AZE_ANZAHL, AZE_BRUTTO, \
   AZE_TARA, AZE_NETTO, AZE_LAENGE, AZE_BREITE, AZE_HOEHE, AZE_SPEDITION""}"")
undefine(""{""_AZE2_VARS_RESET""}"")

define(""{""_AZE2_VARS_SELECT""}"",  ""{""aze_sortnr, aze_buchung, aze_anzahl, aze_brutto, \
   aze_tara, aze_netto, aze_laenge, aze_breite, aze_hoehe, aze_spedition""}"")
define(""{""_AZE2_VARS_INTO""}"",  ""{"":AZE_SORTNR, :AZE_BUCHUNG, :AZE_ANZAHL, :AZE_BRUTTO, \
   :AZE_TARA, :AZE_NETTO, :AZE_LAENGE, :AZE_BREITE, :AZE_HOEHE, :AZE_SPEDITION""}"")
define(""{""_AZE2_VARS_INIT""}"", ""{""""}"")

define(""{""_LOOP_VARS""}"", ""{""_BPZ_VARS_LOOP, _AZE2_VARS_LOOP""}"")
undefine(""{""_LOOP_RSET""}"")

/* ---------------------------------------------------------------------
LG-BUCH-POS-ZE Mengen der aktuellen Buchungsposition BPOID
*/

define(""{""S_LG_BPZ_SORTNR""}"", ""{""bpz_sortnr""}"")
define(""{""S_LG_BPZ_SORTNR_DESC""}"", ""{""bpz_sortnr desc""}"")
define(""{""S_LG_BPZ_BUCHUNG""}"", ""{""bpz_buchung""}"")
define(""{""S_LG_BPZ_BUCHUNG_DESC""}"", ""{""bpz_buchung desc""}"")

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _BPZ_VARS_SELECT, _AZE2_VARS_SELECT \
      FROM aaze_artikel_ze, abpz_buchpos_ze, abpo_buchposition \
      WHERE bpz_bpoid = bpo_bpoid \
      AND   bpo_artid = aze_artid \
      AND   bpz_sortnr = aze_sortnr \
      AND   bpo_bpoid = :BPOID "||\
      l_p_where || "\
      ORDER BY " || l_p_orderby || " bpz_sortnr \
      INTO _BPZ_VARS_INTO, _AZE2_VARS_INTO"""}"")

define(""{""_LOOP_NAME""}"",""{""LG-BUCH-POS-ZE-A: Zaehleinheiten zu Position""}"")
define(""{""LG_BUCH_POS_ZE""}"", _BPZ_VARS_INIT _AZE2_VARS_INIT _LOOP )


/* ---------------------------------------------------------------------
Buchungsbewegungsschleife

*/

define(""{""_BEW_VARS_LOOP""}"",  ""{""BEWID, ARTID, BEW_STATUS, BEW_BRUTTO, \
   BEW_GRUP1, BEW_GRUP2, BEW_PLATZ, \
   BEW_MENGE1, BEW_MENGE2, BEW_MENGE3, BEW_MENGE4, BEW_MENGE5, \
   VEP_KBEZ1, VEP_KBEZ2, VEP_KBEZ3, VEP_KBEZ4, VEP_KBEZ5, \
   BEW_MARK, BEW_PRODAT, BEW_LSPID""}"")
undefine(""{""_BEW_VARS_RESET""}"")
define(""{""_BEW_VARS_SELECT""}"", ""{""bew_bewid, bew_bstid, bew_brutto, \
   bew_grup1, bew_grup2, bew_platz, \
   bew_menge1, bew_menge2, bew_menge3, bew_menge4, bew_menge5, \
   vep_kbez1, vep_kbez2, vep_kbez3, vep_kbez4, vep_kbez5, \
   bew_mark, TO_CHAR( bew_prodat, 'YYYY.MM.DD'), bew_lspid""}"")
define(""{""_BEW_VARS_INTO""}"",  ""{"":BEWID, :BEW_STATUS, :BEW_BRUTTO, \
   :BEW_GRUP1, :BEW_GRUP2, :BEW_PLATZ, \
   :BEW_MENGE1, :BEW_MENGE2, :BEW_MENGE3, :BEW_MENGE4, :BEW_MENGE5, \
   :VEP_KBEZ1, :VEP_KBEZ2, :VEP_KBEZ3, :VEP_KBEZ4, :VEP_KBEZ5, \
   :BEW_MARK, :BEW_PRODAT, :BEW_LSPID""}"")
define(""{""_BEW_VARS_INIT""}"", ""{""""}"")

define(""{""_LOOP_VARS""}"", ""{""_BEW_VARS_LOOP""}"")
undefine(""{""_LOOP_RSET""}"")

/* ---------------------------------------------------------------------
LG-BUCH-BEW Bewegungen der aktuellen Buchungsposition BPOID
*/
define(""{""S_LG_BEW_PLATZ""}"", ""{""bew_platz""}"")

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _BEW_VARS_SELECT , bew_artid \
      FROM abew_art_b \
      WHERE bew_bpoid = :BPOID " || \
      l_p_where || "\
      ORDER BY " || l_p_orderby || " bew_bpoid, bew_bewid \
      INTO _BEW_VARS_INTO , :ARTID"""}"")

define(""{""_LOOP_NAME""}"",""{""LG-BUCH-BEW-A: Buchungsbewegungen""}"")
define(""{""LG_BUCH_BEW""}"", _BEW_VARS_INIT _LOOP )


/* ---------------------------------------------------------------------
LG-BEW allgemeine Bewegungs-Schleife
   als Einschraenkung werden folgende VARIABLEN beruecksichtigt:
   - LVEID
   - BUCID
   - BPOID
   - ARTID
   - LBEID
   - BEW_STATUS
   - DATUM_VON
   - DATUM_BIS
*/
define(""{""S_LG_BEW_PLATZBEZ""}"", ""{""bew_platz""}"")

undefine(""{""_BEW_VARS_RESET""}"")

define(""{""_LOOP_SELECT""}"", ""{"""SELECT to_char(buc_datum, 'YYYY.MM.DD'), \
      _BEW_VARS_SELECT, _ART_VARS_SELECT \
      FROM " || l_from || ", abuc_buchung, abpo_buchposition, abew_art_b \
      WHERE bew_bpoid = bpo_bpoid \
      AND bpo_bucid = buc_bucid " ||
      l_where || " " || l_p_where || "\
      ORDER BY " || l_orderby || " bew_bpoid, bew_bewid \
      INTO :BUC_DATUM, _BEW_VARS_INTO, _ART_VARS_INTO"""}"")

define(""{""_LOOP_VARS""}"", ""{""_BEW_VARS_LOOP, _ART_VARS_LOOP""}"")
undefine(""{""_LOOP_RSET""}"")

define(""{""_BEW_VARS_INIT""}"", ""{""l_where = " "; l_from = " dual ";
if (@gesetzt(BUCID) == TRUE) { if (@getwert(BUCID) > " ")
   {	l_bucid = @getwert(BUCID); l_where = l_where || " AND buc_bucid = :l_bucid ";
		@print(@sprintf(@nls_gettext_x("li_lg.bew_vars_init.par_bucid")));
   }
}
else
{
   if (@gesetzt(LVEID) == TRUE) { if (@getwert(LVEID) > " ")
      {	l_lveid = @getwert(LVEID); l_where = l_where || " AND bew_lveid = :l_lveid ";
			@print(@sprintf(@nls_gettext_x("li_lg.bew_vars_init.par_lveid")));
      }
   }
}
if (@gesetzt(BPOID) == TRUE) { if (@getwert(BPOID) > " ")
   {	l_bpoid = @getwert(BPOID); l_where = l_where || " AND bew_bpoid = :l_bpoid ";
		@print(@sprintf(@nls_gettext_x("li_lg.bew_vars_init.par_bpoid")));
   }
}
if (@gesetzt(BEW_STATUS) == TRUE) { if (@getwert(BEW_STATUS) > " ")
   {	l_status = @getwert(BEW_STATUS); l_where = l_where || " AND bew_bstid = :l_status ";
		@print(@sprintf(@nls_gettext_x("li_lg.bew_vars_init.par_status")));
   }
}
if (@gesetzt(ARTID) == TRUE) { if (@getwert(ARTID) > " ")
   {	l_artid = @getwert(ARTID); l_where = l_where ||" AND bew_artid = :l_artid ";
		@print(@sprintf(@nls_gettext_x("li_lg.bew_vars_init.par_artid")));
   }
}
if (@getwert(DATUM_VON) > " ")
{ l_where = l_where || " AND bew_datum >= to_date(:DATUM_VON, 'YYYY.MM.DD') ";
  @print(@sprintf(@nls_gettext_x("li_lg.bew_vars_init.par_datumvon")));
}
if (@getwert(DATUM_BIS) > " ")
{ l_where = l_where || " AND bew_datum < to_date(:DATUM_BIS, 'YYYY.MM.DD') +1 ";
  @print(@sprintf(@nls_gettext_x("li_lg.bew_vars_init.par_datumbis")));
}
if (@gesetzt(WMSORDERBY) == TRUE)
   {
      l_orderby =  @getwert(WMSORDERBY) || " " ||  l_p_orderby;
   }
   else
   {
      l_orderby = l_p_orderby;
   }

if (@gesetzt(LBEID) == TRUE) { if (@getwert(LBEID) > " ")
   {
      l_lbeid = @getwert(LBEID);
      l_lbe_log = 0;
      l_ret = @SqlImmediate(" \
         SELECT lbe_log \
         FROM albe_lbereich \
         WHERE lbe_lbeid = :l_lbeid \
         INTO :l_lbe_log ");
		@print(@sprintf(@nls_gettext_x("li_lg.bew_vars_init.par_lbeid")));
      if ( l_lbe_log == 1 )
      {
			@print(@sprintf(@nls_gettext_x("li_lg.bew_vars_init.par_lbe_log")));
         l_from = " alpb_lpl_lbe ";
         l_where = l_where || " AND bew_lplid = lpb_lplid \
                                 AND lpb_lbeid = :l_lbeid ";
      }
      else
      {
         l_from = " alpl_lplatz ";
         l_where = l_where || " AND bew_lplid = lpl_lplid \
                                 AND lpl_lbeid = :l_lbeid ";
      }
   }
}
@print(@sprintf(@nls_gettext_x("li_lg.bew_vars_init.par_where")));
""}"")

define(""{""_LOOP_NAME""}"",""{""LG-BEW: Bewegungen""}"")
define(""{""LG_BEW""}"", _BEW_VARS_INIT _LOOP )



/* ---------------------------------------------------------------------
LG-EBEW-ABEW Ausgangs-Bewegungen der aktuellen BEWID (Eingang)
*/

define(""{""_LOOP_SELECT""}"", ""{"""SELECT to_char(buc_datum,'YYYY.MM.DD'), _BEW_VARS_SELECT ,bew_artid \
      FROM abuc_buchung, abpo_buchposition, abew_art_b \
      WHERE bew_refid = :l_bewid \
      AND bew_bpoid = bpo_bpoid \
      AND bpo_bucid = buc_bucid \
      ORDER BY buc_datum, bew_bewid \
      INTO :BUC_DATUM, _BEW_VARS_INTO , :ARTID"""}"")

define(""{""_LOOP_VARS""}"", ""{""_BEW_VARS_LOOP, BUC_DATUM""}"")
define(""{""_BEW_VARS_INIT""}"", ""{"" l_bewid = BEWID; ""}"")

define(""{""_LOOP_NAME""}"",""{""LG-EBEW-ABEW: Ausl.Bewegungen zur Einl.Bewegung""}"")
define(""{""LG_EBEW_ABEW""}"", _BEW_VARS_INIT _LOOP )


/*************************************************************************
Bestandshistory-Schleife

*/
define(""{""S_LG_HST_DATUM_ARTNR""}"", ""{""hst_datum;art_nr""}"")
define(""{""S_LG_HST_DATUMAB_ARTNR""}"", ""{""hst_datum desc;art_nr""}"")
define(""{""S_LG_HST_ARTNR_DATUM""}"", ""{""art_nr;hst_datum""}"")
define(""{""S_LG_HST_ARTNR_DATUMAB""}"", ""{""art_nr;hst_datum desc""}"")

define(""{""_HST_VARS_LOOP""}"",  ""{""DATUM_VON, LG_BESTAND1, LG_BESTAND2, LG_BESTAND3, \
         LG_BESTAND4, LG_BESTAND5, LG_BESTAND_BTO""}"")
undefine(""{""_HST_VARS_RESET""}"")
define(""{""_HST_VARS_SELECT""}"", ""{""to_char(hst_datum, 'YYYY.MM.DD'), sum(hst_bestand1), sum(hst_bestand2), \
         sum(hst_bestand3), sum(hst_bestand4), sum(hst_bestand5), sum(hst_brutto)""}"")
define(""{""_HST_VARS_INTO""}"",  ""{"":DATUM_VON, :LG_BESTAND1, :LG_BESTAND2, :LG_BESTAND3, \
         :LG_BESTAND4, :LG_BESTAND5, :LG_BESTAND_BTO""}"")
define(""{""_HST_VARS_INIT""}"", ""{""l_where = " ";
if (@gesetzt(LVEID) == TRUE) { if (@getwert(LVEID) > " ")
   {	l_lveid = @getwert(LVEID); l_where = l_where || " AND lve_lveid = :l_lveid ";
		@print(@sprintf(@nls_gettext_x("li_lg.hst_vars_init.par_lveid")));
   }
}
if (@gesetzt(ARTID) == TRUE) { if (@getwert(ARTID) > " ")
   {	l_artid = @getwert(ARTID); l_where = l_where ||" AND art_artid = :l_artid ";
		@print(@sprintf(@nls_gettext_x("li_lg.hst_vars_init.par_artid")));
   }
}
if (@getwert(DATUM_VON) > " ")
{ l_datum_von = DATUM_VON;
  l_where = l_where || " AND hst_datum >= to_date(:l_datum_von, 'YYYY.MM.DD') ";
  @print(@sprintf(@nls_gettext_x("li_lg.hst_vars_init.par_datumvon")));
}
if (@getwert(DATUM_BIS) > " ")
{ l_where = l_where || " AND hst_datum < to_date(:DATUM_BIS, 'YYYY.MM.DD') +1 ";
  @print(@sprintf(@nls_gettext_x("li_lg.hst_vars_init.par_datumbis")));
}
@print(@sprintf(@nls_gettext_x("li_lg.hst_vars_init.par_where")));
""}"")

define(""{""_LOOP_VARS""}"", ""{""_ART_VARS_LOOP, _HST_VARS_LOOP""}"")
undefine(""{""_LOOP_RSET""}"")

/* ---------------------------------------------------------------------
LG-BESTANDSHISTORY Schleife ueber den historisierten Bestand
*/

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _ART_VARS_SELECT, _HST_VARS_SELECT \
      FROM ahst_historybestand, aart_artikel, alve_lagerv \
      WHERE art_lveid = lve_lveid \
      AND hst_artid = art_artid \
      " || l_where || " " || l_p_where || "\
      GROUP BY _ART_VARS_SELECT, hst_datum \
      ORDER BY " || l_p_orderby || " hst_datum, art_artid \
      INTO _ART_VARS_INTO, _HST_VARS_INTO"""}"")

define(""{""_LOOP_NAME""}"",""{""LG-BESTANDSHISTORY: historisierter Bestand""}"")
define(""{""LG_BESTANDSHISTORY""}"", _ART_VARS_INIT _HST_VARS_INIT _LOOP )



/* ---------------------------------------------------------------------
Artikelschleife

*/

define(""{""_LOOP_VARS""}"", ""{""_ART_VARS_LOOP, _AZE_VARS_LOOP""}"")
define(""{""_LOOP_RSET""}"", ""{""_ART_VARS_RESET""}"")
undefine(""{""_LOOP_RSET""}"")

/* ---------------------------------------------------------------------
ARTIKEL Alle Artikel der aktuellen Lagervereinbarung LVEID
*/
define(""{""S_LG_ARTIKEL_NR""}"", ""{""art_nr""}"")
define(""{""S_LG_ARTIKEL_AGR_NR""}"", ""{""agr_bez;art_nr""}"")

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _ART_VARS_SELECT, _AZE_VARS_SELECT \
      FROM    aagr_artikelgruppe, aart_artikel, aaze_artikel_ze \
      WHERE art_lveid = :LVEID \
      AND   art_agrid = agr_agrid \
      AND   art_artid = aze_artid AND aze_sortnr = 1 " ||
      l_p_where ||
      " ORDER BY " || l_p_orderby || " art_agrid, art_nr \
      INTO _ART_VARS_INTO, _AZE_VARS_INTO"""}"")

define(""{""_LOOP_NAME""}"",""{""LG-ARTIKEL: Artikelstamm""}"")
define(""{""LG_ARTIKEL""}"", _ART_VARS_INIT _LOOP )

/* ---------------------------------------------------------------------
ARTIKEL_GURPPE Alle Artikelgruppen der aktuellen Lagervereinbarung LVEID
*/

define(""{""_LOOP_SELECT""}"", ""{"""SELECT agr_agrid, agr_bez \
      FROM    aagr_artikelgruppe \
      WHERE agr_lveid = :LVEID \
      ORDER BY agr_agrid \
      INTO :ART_AGRID, :AGR_BEZ"""}"")

define(""{""_LOOP_VARS""}"", ""{""ART_AGRID, AGR_BEZ""}"")
undefine(""{""_LOOP_RSET""}"")
define(""{""_LOOP_NAME""}"",""{""LG-ART-GRP: Artikelgruppen""}"")
define(""{""LG_ART_GRP""}"",_LOOP )



/* ---------------------------------------------------------------------
WARENGRUPPE Alle Warengruppen der aktuellen Organisation angefangen bei der Firma
*/

define(""{""_LOOP_SELECT""}"", ""{"""SELECT wgr_wgrid, wgr_bez \
      FROM    awgr_warengruppe\
      WHERE   (wgr_orgid is null \
               OR wgr_orgid IN ( SELECT org_orgid  \
                                 FROM sorg_t_einheit \
                                 START WITH org_orgid = :FA_ID \
                                 CONNECT BY PRIOR org_orgid = org_orgidh \
                               )) \
      ORDER BY wgr_wgrid \
      INTO :ART_WGRID, :WGR_BEZ"""}"")

define(""{""_LOOP_VARS""}"", ""{""ART_WGRID, WGR_BEZ""}"")
undefine(""{""_LOOP_RSET""}"")
define(""{""_LOOP_NAME""}"",""{""LG-WGR: Warengruppen zur Firma""}"")
define(""{""LG_WGR""}"",_LOOP )



/* ---------------------------------------------------------------------
LG-ART-POS Positionen des aktuellen Artikels in einem Zeitraum
              (LVEID, ARTID, DATUM_VON, DATUM_BIS)
*/

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _BPO_VARS_SELECT, _ART_VARS_SELECT \
      FROM  abpo_art_b \
      WHERE bpo_artid = :ARTID \
      AND bpo_datum >= to_date(:DATUM_VON, 'YYYY.MM.DD') \
      AND bpo_datum < to_date(:DATUM_BIS, 'YYYY.MM.DD') +1 \
      ORDER BY bpo_datum \
      INTO _BPO_VARS_INTO, _ART_VARS_INTO"""}"")

define(""{""_LOOP_NAME""}"",""{""LG-ART-POS: Artikelpositionen""}"")
define(""{""LG_ART_POS""}"", _BPO_VARS_INIT _LOOP )


/* ---------------------------------------------------------------------
LG-ART-ZE Alle Zaehleinheiten des aktuellen Artikel ARTID
*/

define(""{""S_LG_AZE_SORTNR""}"", ""{""aze_sortnr""}"")
define(""{""S_LG_AZE_SORTNR_DESC""}"", ""{""aze_sortnr desc""}"")
define(""{""S_LG_AZE_BUCHUNG""}"", ""{""aze_buchung""}"")
define(""{""S_LG_AZE_BUCHUNG_DESC""}"", ""{""aze_buchung desc""}"")

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _AZE2_VARS_SELECT \
      FROM    aaze_artikel_ze \
      WHERE aze_artid = :ARTID " ||\
      l_p_where || "\
      ORDER BY " || l_p_orderby || " aze_sortnr \
      INTO _AZE2_VARS_INTO"""}"")

define(""{""_LOOP_VARS""}"", ""{""_AZE2_VARS_LOOP""}"")
undefine(""{""_LOOP_RSET""}"")
define(""{""_LOOP_NAME""}"",""{""LG-ART-ZE-A: Artikel-Zaehleinheiten""}"")
define(""{""LG_ART_ZE""}"", _AZE2_VARS_INIT _LOOP )

/* ---------------------------------------------------------------------
LG-ART-EAN Schleife zur Selektion der Artikel mit der EAN-Nummer
*/

define(""{""_LOOP_SELECT""}"", ""{"""SELECT art_artid, art_nr \
      FROM    aaze_artikel_ze ,aart_artikel \
      WHERE art_artid = aze_artid \
      AND     art_lveid = :LVEID \
      AND     aze_barcode = :ART_BARCODE \
      INTO :ARTID , :ART_NR"""}"")

define(""{""_LOOP_VARS""}"", ""{""ARTID, ART_NR""}"")
undefine(""{""_LOOP_RSET""}"")
define(""{""_LOOP_NAME""}"",""{""LG-ART-EAN: Artikelnummern ""}"")
define(""{""LG_ART_EAN""}"",_LOOP )

/* ---------------------------------------------------------------------
LG-STAND  Format, das den Lagerbestand fuer einen bestimmten Artikel
             (ARTID) oder ueber alle Artikel der LVEID ermittelt.
        -> DATUM_VON, ARTID, AGRID, Lagergeldfreie Tage
        <- LG_BESTAND1, LG_BESTAND2, LG_BESTAND3, LG_BESTAND4, LG_BESTAND5
*/
define(""{""LAGER_BESTAND""}"",""{""

l_methode = "CALCULATE";
@SqlImmediate ( "SELECT nvl(SUBSTR (cbus.resolve_config_value('LBase-WMS', 'FORMAT_LAGERSTAND'),1,30), \
                  'CALCULATE') \
                  from dual \
                  into :l_methode" );
@print(@sprintf(@nls_gettext_x("li_lg.lager_bestand.methode")));

l_datum = ifelse($1,,DATUM_VON,$1);
l_lgeldfrei = ifelse($4,,"0",_ref(""{""""{""$4""}""""}""));
if ( l_methode == "HISTORY" & l_lgeldfrei != "0" )
{
	@print(@sprintf(@nls_gettext_x("li_lg.lager_bestand.methode_change")));
   l_methode = "CALCULATE";
}

ifelse($3,,,""{""l_agrid = $3;
if ( l_methode == "HISTORY" )
{
   l_where = " and hst_artid IN (SELECT art_artid FROM aart_artikel \
      WHERE art_agrid = :l_agrid) ";
}
else
{
   l_where = " and bew_artid IN (SELECT art_artid FROM aart_artikel \
      WHERE art_agrid = :l_agrid) ";
}
""}"")
ifelse($2,,,""{""l_artid = $2;
if ( l_methode == "HISTORY" )
{
   l_where = " and hst_artid = :l_artid ";
}
else
{
   l_where = " and bew_artid = :l_artid ";
}
""}"")
l_kumkz = ifelse($5,,"0",_ref(""{""""{""$5""}""""}""));

if (@getwert(ZZWHERE) > " ")
   {
   l_where = l_where || " AND " || ZZWHERE;
	@print(@sprintf(@nls_gettext_x("li_lg.lager_bestand.zusatz")));
   ZZWHERE = "";
   }
if (l_lgeldfrei > " ")
{
   if (l_lgeldfrei == "M")
   { l_lgeldfrei = "(LAST_DAY(bew_datum)+1 - bew_datum)";}
   else
   {
      if (l_lgeldfrei == "W")
      { l_lgeldfrei = "(NEXT_DAY(bew_datum,'MONDAY') - bew_datum)";}
      else
      { l_lgeldfrei = l_lgeldfrei;}
   }
}
else
{ l_lgeldfrei ="0";}

define(""{""_bew_datum_lgfrei""}"", ""{"" bew_datum ""}""ifelse(l_lgeldfrei,"0",,
""{"" + decode(bew_art,'EIN', " || l_lgeldfrei || ",0)""}"") )

/*************************************************************
*  SELECT-KLAUSEL-MAKRO FUER KUMULATION BEWEGUNGEN
*************************************************************/
define(""{""_sel_bew_kum""}"",""{""SELECT sum(bew_bestand1 * nvl(bew_rest,0)) \
                - sum(decode(sign(_bew_datum_lgfrei-to_date(:l_datum,'YYYY.MM.DD')), \
                  -1,0,bew_menge1 * decode(bew_vorz-bew_rest,-2,0,bew_vorz))), \
                sum(bew_bestand2 * nvl(bew_rest,0)) \
                - sum(decode(sign(_bew_datum_lgfrei-to_date(:l_datum,'YYYY.MM.DD')), \
                  -1,0,bew_menge2 * decode(bew_vorz-bew_rest,-2,0,bew_vorz))), \
                sum(bew_bestand3 * nvl(bew_rest,0)) \
                - sum(decode(sign(_bew_datum_lgfrei-to_date(:l_datum,'YYYY.MM.DD')), \
                  -1,0,bew_menge3 * decode(bew_vorz-bew_rest,-2,0,bew_vorz))), \
                sum(bew_bestand4 * nvl(bew_rest,0)) \
                - sum(decode(sign(_bew_datum_lgfrei-to_date(:l_datum,'YYYY.MM.DD')), \
                  -1,0,bew_menge4 * decode(bew_vorz-bew_rest,-2,0,bew_vorz))), \
                sum(bew_bestand5 * nvl(bew_rest,0)) \
                - sum(decode(sign(_bew_datum_lgfrei-to_date(:l_datum,'YYYY.MM.DD')), \
                  -1,0,bew_menge5 * decode(bew_vorz-bew_rest,-2,0,bew_vorz))), \
                sum(bew_rest_brutto * nvl(bew_rest,0)) \
                - sum(decode(sign(_bew_datum_lgfrei-to_date(:l_datum,'YYYY.MM.DD')), \
                  -1,0,bew_brutto * decode(bew_vorz-bew_rest,-2,0,bew_vorz))) \
      FROM   abew_b \
      WHERE  bew_lveid = :LVEID "|| l_where || "\
      AND    bew_bstid != 'AUS02' \
      AND    bew_bstid != 'EIN02' \
      AND    bew_bstid != 'EIN03' \
      AND    ( bew_rest = 1 \
                OR       _bew_datum_lgfrei >= to_date(:l_datum,'YYYY.MM.DD'))""}"")

/*************************************************************
*  SELECT-KLAUSEL-MAKRO FUER KUMULATION LAGERPLAETZE
*************************************************************/
define(""{""_sel_lpl_kum""}"",""{""SELECT SUM(b1),SUM(b2),SUM(b3),SUM(b4),SUM(b5),SUM(bto) \
 FROM ( \
 SELECT DECODE(SIGN((SUM(bew_bestand1*NVL(bew_rest,0)) \
         -SUM(DECODE(SIGN(_bew_datum_lgfrei-TO_DATE(:l_datum,'YYYY.MM.DD')),-1,0,bew_menge1 \
            *DECODE(bew_vorz-bew_rest,-2,0,bew_vorz))))-1),1,1,0,1,NULL,NULL,0) b1 \
       ,DECODE(SIGN((SUM(bew_bestand2*NVL(bew_rest,0)) \
         -SUM(DECODE(SIGN(_bew_datum_lgfrei-TO_DATE(:l_datum,'YYYY.MM.DD')),-1,0,bew_menge2 \
            *DECODE(bew_vorz-bew_rest,-2,0,bew_vorz))))-MAX(bew_menge2)),1,MAX(bew_menge2),0,MAX(bew_menge2),NULL,NULL,0) b2 \
       ,DECODE(SIGN((SUM(bew_bestand3*NVL(bew_rest,0)) \
         -SUM(DECODE(SIGN(_bew_datum_lgfrei-TO_DATE(:l_datum,'YYYY.MM.DD')),-1,0,bew_menge3 \
            *DECODE(bew_vorz-bew_rest,-2,0,bew_vorz))))-MAX(bew_menge3)),1,MAX(bew_menge3),0,MAX(bew_menge3),NULL,NULL,0) b3 \
       ,DECODE(SIGN((SUM(bew_bestand4*NVL(bew_rest,0)) \
         -SUM(DECODE(SIGN(_bew_datum_lgfrei-TO_DATE(:l_datum,'YYYY.MM.DD')),-1,0,bew_menge4 \
         *DECODE(bew_vorz-bew_rest,-2,0,bew_vorz))))-MAX(bew_menge4)),1,MAX(bew_menge4),0,MAX(bew_menge4),NULL,NULL,0) b4 \
       ,DECODE(SIGN((SUM(bew_bestand5*NVL(bew_rest,0)) \
         -SUM(DECODE(SIGN(_bew_datum_lgfrei-TO_DATE(:l_datum,'YYYY.MM.DD')),-1,0,bew_menge5 \
         *DECODE(bew_vorz-bew_rest,-2,0,bew_vorz))))-MAX(bew_menge5)),1,MAX(bew_menge5),0,MAX(bew_menge5),NULL,NULL,0) b5 \
       ,DECODE(SIGN((SUM(bew_rest_brutto*NVL(bew_rest,0)) \
         -SUM(DECODE(SIGN(_bew_datum_lgfrei-TO_DATE(:l_datum,'YYYY.MM.DD')),-1,0,bew_brutto \
         *DECODE(bew_vorz-bew_rest,-2,0,bew_vorz))))-MAX(bew_brutto)),1,MAX(bew_brutto),0,MAX(bew_brutto),NULL,NULL,0) bto \
      FROM   abew_b \
      WHERE  bew_lveid = :LVEID "|| l_where || "\
      AND    bew_bstid != 'AUS02' \
      AND    bew_bstid != 'EIN02' \
      AND    bew_bstid != 'EIN03' \
      AND    ( bew_rest = 1 \
                OR       _bew_datum_lgfrei >= to_date(:l_datum,'YYYY.MM.DD')) \
 GROUP BY bew_lplid)""}"")

if (l_methode == "HISTORY" )
{
   l_sel = "SELECT sum(hst_bestand1), sum(hst_bestand2), sum(hst_bestand3), \
                  sum(hst_bestand4), sum(hst_bestand5), sum(hst_brutto) \
            FROM ahst_historybestand \
            WHERE hst_lveid = :LVEID \
            AND hst_datum = to_date(:l_datum,'YYYY.MM.DD')-1 " || l_where;
}
else
{
   if (l_kumkz == "0")
   {
      l_sel = "_sel_bew_kum";
   }
   else
   {
      l_sel = "_sel_lpl_kum";
   }
}

/* Alle Bestaende abzueglich alle Bestandsveraenderungen nach dem Termin (ohne Ausgaenge  mit Restbestand) */
@SqlImmediate ( l_sel || " \
      INTO   :LG_BESTAND1, :LG_BESTAND2, :LG_BESTAND3, \
                       :LG_BESTAND4, :LG_BESTAND5, :LG_BESTAND_BTO");
undefine(""{""_sel_bew_kum""}"")
undefine(""{""_sel_lpl_kum""}"")
""}"");

/* ---------------------------------------------------------------------
LG_SUMMEN   Schleife, die innerhalb der gewaehlten Zeitperiode
      die Lagereingaenge und Lagerausgaenge kumuliert, gruppiert
      nach Tag, Woche oder Monat (TYP).
      Wenn zuvor das Format LAGER-BESTAND im gleichen Modul verwendet wurde,
      werden die Lagergeldfreien Tage von dort bei den Summen beruecksichtigt
      (Dort wird das Makro -bew_datum_lgfrei und die Variable l_lgeldfrei
      definiert)

*/

define (""{""_bew_datum_lgfrei""}"",""{""bew_datum""}"")

undefine(""{""_SUMMEN_VARS_RESET""}"")
define(""{""_SUMMEN_VARS_INIT""}"",""{""l_where = " "; l_lgeldfrei = l_lgeldfrei || "+0 ";

if ((@getwert(ARTID) > " ") & (@gesetzt(ARTID) == TRUE))
   { l_where = l_where ||" AND bew_artid = :ARTID ";}
else
{
   if (@gesetzt(ART_AGRID) == TRUE)
      { l_where = l_where ||" AND bew_artid IN (SELECT art_artid \
      FROM aart_artikel WHERE art_agrid = :ART_AGRID)";}
}

if (@gesetzt(P1) == TRUE)
{
   if (@getwert(P1) == "1")
   {
      l_summen_sel  = ("_SUMMEN_VARS_SEL_T3");
   }
   else
   {
      l_summen_sel  = ("_SUMMEN_VARS_SEL_T2");
		@print(@sprintf(@nls_gettext_x("li_lg.summen_vars_init.default")));
   }
}
else
{
   l_summen_sel  = ("_SUMMEN_VARS_SEL_T2");
}
""}"")

define(""{""_SUMMEN_VARS_SELECT""}"", ""{""sum(decode(bew_vorz,1,bew_menge1,0)), \
   sum(decode(bew_vorz,1,bew_menge2,0)), \
   sum(decode(bew_vorz,1,bew_menge3,0)), \
   sum(decode(bew_vorz,1,bew_menge4,0)), \
   sum(decode(bew_vorz,1,bew_menge5,0)), \
   sum(decode(bew_vorz,1,bew_brutto,0)), \
   sum(decode(bew_vorz,-1,bew_menge1,0)), \
   sum(decode(bew_vorz,-1,bew_menge2,0)), \
   sum(decode(bew_vorz,-1,bew_menge3,0)), \
   sum(decode(bew_vorz,-1,bew_menge4,0)), \
   sum(decode(bew_vorz,-1,bew_menge5,0)),\
   sum(decode(bew_vorz,-1,bew_brutto,0)),NULL lplid""}"")

define(""{""_SUMMEN_VARS_SELECT2""}"",""{""DECODE(SIGN(SUM(DECODE(bew_vorz,1,bew_menge1,0))-1),1,1,0,1,-1,0) em1, \
   DECODE(SIGN(SUM(DECODE(bew_vorz,1,bew_menge2,0))-MAX(bew_menge2)),1,MAX(bew_menge2),0,MAX(bew_menge2),-1,MAX(DECODE(bew_vorz,1,bew_menge2,0))) em2, \
   DECODE(SIGN(SUM(DECODE(bew_vorz,1,bew_menge3,0))-MAX(bew_menge3)),1,MAX(bew_menge3),0,MAX(bew_menge3),-1,MAX(DECODE(bew_vorz,1,bew_menge3,0))) em3, \
   DECODE(SIGN(SUM(DECODE(bew_vorz,1,bew_menge4,0))-MAX(bew_menge4)),1,MAX(bew_menge4),0,MAX(bew_menge4),-1,MAX(DECODE(bew_vorz,1,bew_menge4,0))) em4, \
   DECODE(SIGN(SUM(DECODE(bew_vorz,1,bew_menge5,0))-MAX(bew_menge5)),1,MAX(bew_menge5),0,MAX(bew_menge5),-1,MAX(DECODE(bew_vorz,1,bew_menge5,0))) em5, \
   DECODE(SIGN(SUM(DECODE(bew_vorz,1,bew_brutto,0))-MAX(bew_brutto)),1,MAX(bew_brutto),0,MAX(bew_brutto),-1,MAX(DECODE(bew_vorz,1,bew_brutto,0))) ebto, \
   DECODE(SIGN(SUM(DECODE(bew_vorz,-1,bew_menge1,0))-1),1,1,0,1,-1,0) am1, \
   DECODE(SIGN(SUM(DECODE(bew_vorz,-1,bew_menge2,0))-MAX(bew_menge2)),1,MAX(bew_menge2),0,MAX(bew_menge2),-1,MAX(DECODE(bew_vorz,-1,bew_menge2,0))) am2, \
   DECODE(SIGN(SUM(DECODE(bew_vorz,-1,bew_menge3,0))-MAX(bew_menge3)),1,MAX(bew_menge3),0,MAX(bew_menge3),-1,MAX(DECODE(bew_vorz,-1,bew_menge3,0))) am3, \
   DECODE(SIGN(SUM(DECODE(bew_vorz,-1,bew_menge4,0))-MAX(bew_menge4)),1,MAX(bew_menge4),0,MAX(bew_menge4),-1,MAX(DECODE(bew_vorz,-1,bew_menge4,0))) am4, \
   DECODE(SIGN(SUM(DECODE(bew_vorz,-1,bew_menge5,0))-MAX(bew_menge5)),1,MAX(bew_menge5),0,MAX(bew_menge5),-1,MAX(DECODE(bew_vorz,-1,bew_menge5,0))) am5, \
   DECODE(SIGN(SUM(DECODE(bew_vorz,-1,bew_brutto,0))-MAX(bew_brutto)),1,MAX(bew_brutto),0,MAX(bew_brutto),-1,MAX(DECODE(bew_vorz,-1,bew_brutto,0))) abto, \
   bew_lplid""}"")

define(""{""_SUMMEN_VARS_SEL_T1""}"", ""{""SELECT periode, \
      sum(ein1), sum(ein2), sum(ein3), sum(ein4), sum(ein5), sum(ein_bto),\
      sum(aus1), sum(aus2), sum(aus3), sum(aus4), sum(aus5), sum(aus_bto) \
      FROM ( \
         SELECT to_char(to_date('"|| DATUM_VON || "','YYYY.MM.DD') \
            +nr - 1,_GROUP_BY) periode, \
         0 ein1, 0 ein2, 0 ein3, 0 ein4, 0 ein5, 0 ein_bto,\
         0 aus1, 0 aus2, 0 aus3, 0 aus4, 0 aus5, 0 aus_bto, NULL lplid \
         FROM nummer \
         WHERE nr <= (to_date(:DATUM_BIS,'YYYY.MM.DD') - to_date(:DATUM_VON,'YYYY.MM.DD')) +1 \
         GROUP BY to_char(to_date('"|| DATUM_VON || "','YYYY.MM.DD') \
         +nr - 1,_GROUP_BY) \
      UNION""}"")

define(""{""_SUMMEN_VARS_SEL_T2""}"", ""{""SELECT to_char(_bew_datum_lgfrei,_GROUP_BY), _SUMMEN_VARS_SELECT \
         FROM    abew_b \
         WHERE bew_lveid = :LVEID \
         AND   _bew_datum_lgfrei >= to_date(:DATUM_VON,'YYYY.MM.DD') \
         AND   _bew_datum_lgfrei <  to_date(:DATUM_BIS,'YYYY.MM.DD')+1 \
         AND   bew_datum >= to_date(:DATUM_VON,'YYYY.MM.DD') - " || l_lgeldfrei || " \
         AND   bew_datum <  to_date(:DATUM_BIS,'YYYY.MM.DD')+1 \
         AND   bew_ubewid is null "||\
         l_where || l_p_where || "\
         GROUP BY to_char(_bew_datum_lgfrei,_GROUP_BY)""}"")

define(""{""_SUMMEN_VARS_SEL_T3""}"", ""{""SELECT periode,SUM(em1),SUM(em2),SUM(em3),SUM(em4),SUM(em5),SUM(ebto), \
          SUM(am1),SUM(am2),SUM(am3),SUM(am4),SUM(am5),SUM(abto),bew_lplid  \
   FROM ( \
         SELECT to_char(_bew_datum_lgfrei,_GROUP_BY) periode, _SUMMEN_VARS_SELECT2 \
         FROM    abew_b \
         WHERE bew_lveid = :LVEID \
         AND   _bew_datum_lgfrei >= to_date(:DATUM_VON,'YYYY.MM.DD') \
         AND   _bew_datum_lgfrei <  to_date(:DATUM_BIS,'YYYY.MM.DD')+1 \
         AND   bew_datum >= to_date(:DATUM_VON,'YYYY.MM.DD') - " || l_lgeldfrei || " \
         AND   bew_datum <  to_date(:DATUM_BIS,'YYYY.MM.DD')+1 \
         AND   bew_ubewid is null "||\
         l_where || l_p_where || "\
      GROUP BY to_char(_bew_datum_lgfrei,_GROUP_BY),bew_lplid) \
   GROUP BY periode,bew_lplid""}"")

define(""{""_SUMMEN_VARS_INTO""}"",  ""{"":LG_PERIODE, \
   :LG_EIN1, :LG_EIN2, :LG_EIN3, :LG_EIN4, :LG_EIN5, :LG_EIN_BTO,\
   :LG_AUS1, :LG_AUS2, :LG_AUS3, :LG_AUS4, :LG_AUS5, :LG_AUS_BTO""}"")

define(""{""_LOOP_SELECT""}"", ""{"""_SUMMEN_VARS_SEL_T1 \
      " || l_summen_sel || " \
      ) \
      GROUP BY periode \
		ORDER BY periode \
      INTO _SUMMEN_VARS_INTO"""}"")

/* ---------------------------------------------------------------------
LG_SUMMEN_W  Schleife, die innerhalb der gewaehlten Zeitperiode die Lagereingaenge und Lagerausgaenge kumuliert, gruppiert
      nach Woche.
*/

define(""{""_GROUP_BY""}"",""{""'IYYY/IW'""}"")

define(""{""_LOOP_NAME""}"",""{""LG-SUMMEN-W: Lagersummen Woche""}"")
define(""{""LG_SUMMEN_W""}"", _SUMMEN_VARS_INIT _LOOP )

/* ---------------------------------------------------------------------
LG_SUMMEN_M  Schleife, die innerhalb der gewaehlten Zeitperiode
      die Lagereingaenge und Lagerausgaenge kumuliert, gruppiert
      nach Monat.
*/

/*
define(""{""_xLOOP_SELECT""}"", ""{"""SELECT to_char(bew_datum,'MM.YY'), _SUMMEN_VARS_SELECT \
      FROM    abew_b \
      WHERE bew_lveid = :LVEID \
      AND   bew_datum >= to_date(:DATUM_VON,'YYYY.MM.DD') \
      AND   bew_datum <  to_date(:DATUM_BIS,'YYYY.MM.DD')+1 "|| l_where ||"\
      GROUP BY to_char(bew_datum,'MM.YY') \
      INTO _SUMMEN_VARS_INTO"""}"")
*/

define(""{""_GROUP_BY""}"",""{""'YYYY.MM'""}"")
define(""{""_LOOP_NAME""}"",""{""LG-SUMMEN-M: Lagersummen Monat""}"")
define(""{""LG_SUMMEN_M""}"", _SUMMEN_VARS_INIT _LOOP )

/* ---------------------------------------------------------------------
LG_SUMMEN_D  Schleife, die innerhalb der gewaehlten Zeitperiode
      die Lagereingaenge und Lagerausgaenge kumuliert, gruppiert
      nach Tag.
*/

define(""{""_GROUP_BY""}"",""{""'YYYY.MM.DD'""}"")

define(""{""_LOOP_NAME""}"",""{""LG-SUMMEN-D: Lagersummen Tag""}"")
define(""{""LG_SUMMEN_D""}"", _SUMMEN_VARS_INIT _LOOP )
undefine(""{""_GROUP_BY""}"")

/* ---------------------------------------------------------------------
LG-LVE alle Lagervereinbarungen (auf dem Rechner)
*/
define(""{""S_LG_LVE_BEZ""}"", ""{""lve_bez""}"")

define(""{""_LOOP_SELECT""}"", ""{"""SELECT lve_lveid, lve_adrid, lve_relid, lve_bez \
      FROM alve_lagerv \
      WHERE 1 = 1 " ||
      l_p_where ||
      " ORDER BY " || l_p_orderby || " lve_lveid \
      INTO :LVEID, :ADRID, :RELATION, :TEXT"""}"")

define(""{""_LOOP_VARS""}"", ""{""LVEID, ADRID, RELATION, TEXT""}"")
undefine(""{""_LOOP_RSET""}"")
define(""{""_LOOP_NAME""}"",""{""LV-LVE: Lagervereinbarungen""}"")
define(""{""LG_LVE""}"", _LOOP )
/* ---------------------------------------------------------------------
LA-BUCH alle Leistungsanforderungen der Buchung (auf dem Rechner)
*/

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _LA_VARS_SELECT \
      FROM sltr_latraeger, slaf_leistanf \
      WHERE laf_lafid = ltr_lafid \
      AND   ltr_attid = 'BUCID' \
      AND   ltr_wert  = :BUCID \
      ORDER BY laf_lafid \
      INTO  _LA_VARS_INTO"""}"")

define(""{""_LOOP_VARS""}"", ""{""_LA_VARS_LOOP""}"")
define(""{""_LOOP_RSET""}"", ""{""_LA_VARS_RESET""}"")
define(""{""_LOOP_NAME""}"",""{""LA_BU" || "CH: LAs der Buchung""}"")
define(""{""LA_BUCH""}"", _LOOP )

/* ---------------------------------------------------------------------
Generieren von Buchungen und Positionen
*/

define(""{""AGEN_BUC""}"",""{""
   l_ret = @SqlImmediate(" \
      SELECT cfg_cfeld \ || '-'  \
         || aseq_bucid.nextval   \
      FROM scfg_config \
      WHERE cfg_cfgid = 'VS' \
      INTO :BUCID_NEU ");
	@print(@sprintf(@nls_gettext_x("li_lg.agen_buc.get_num")));

   BUC_STATUS = ifelse($3,,$2 || "01",$3);
   l_del_code = ifelse($32,,"N",$32);
   l_del_count = 0;
   l_rech_adrid = ifelse($14,,"",_ref(""{""""{""$14""}""""}""));

   l_Sql_String = " \
      BEGIN  agen.buc_neu ('" || \
      BUCID_NEU || "', '" || \
      $1 || "', '" || $2 || "', '" || \
      BUC_STATUS || "', '" || ifelse($4,,"",_ref(""{""""{""$4""}""""}"")) || "', '" || \
      ifelse($5,,"",_ref(""{""""{""$5""}""""}"")) || "', '" || $6 || "', '" || \
      ifelse($7,,"",_ref(""{""""{""$7""}""""}"")) || "', '" || ifelse($8,,"",_ref(""{""""{""$8""}""""}"")) || "', '" || \
      ifelse($9,,"",_ref(""{""""{""$9""}""""}"")) || "', " || ifelse($10,,"NULL",_ref(""{""""{""$10""}""""}"")) || ", '" || \
      ifelse($11,,"",_ref(""{""""{""$11""}""""}"")) || "', " || ifelse($12,,"NULL",_ref(""{""""{""$12""}""""}"")) || ", '" || \
      ifelse($13,,"",_ref(""{""""{""$13""}""""}"")) || "', " ;
   if (l_rech_adrid == "" | l_rech_adrid == "0")
      { l_Sql_String = l_Sql_String || "NULL"; }
   else { l_Sql_String = l_Sql_String || l_rech_adrid; }
   l_Sql_String = l_Sql_String || ", '" || \
      ifelse($15,,"",_ref(""{""""{""$15""}""""}"")) || "', '" || ifelse($16,,"",_ref(""{""""{""$16""}""""}"")) || "', '" || \
      ifelse($17,,"",_ref(""{""""{""$17""}""""}"")) || "', '" || ifelse($18,,"",_ref(""{""""{""$18""}""""}"")) || "', '" || \
      ifelse($19,,"",_ref(""{""""{""$19""}""""}"")) || "', '" || ifelse($20,,"",_ref(""{""""{""$20""}""""}"")) || "', '" || \
      ifelse($21,,"",_ref(""{""""{""$21""}""""}"")) || "', '" || ifelse($22,,"",_ref(""{""""{""$22""}""""}"")) || "', " || \
      ifelse($23,,"NULL",_ref(""{""""{""$23""}""""}"")) || ", " || ifelse($24,,"NULL",_ref(""{""""{""$24""}""""}"")) || ", '" || \
      ifelse($25,,"",_ref(""{""""{""$25""}""""}"")) || "', " || ifelse($26,,"NULL",_ref(""{""""{""$26""}""""}"")) || ", '" || \
      ifelse($27,,"",_ref(""{""""{""$27""}""""}"")) || "', " || ifelse($28,,"NULL",_ref(""{""""{""$28""}""""}"")) || ", '" || \
      ifelse($29,,"",_ref(""{""""{""$29""}""""}"")) || "', " || ifelse($30,,"NULL",_ref(""{""""{""$30""}""""}"")) || ", '" || \
      ifelse($31,,"",_ref(""{""""{""$31""}""""}"")) || "', '" || "" || "', '" || \
      "" || "', '" || "" || "', '" || \
      "" || "', '" || "" || "', '" || \
      "" || "', " || "NULL" || ", " || \
      "NULL" || ", " || "NULL" || "  ); \
      END;";
   @print( l_Sql_String );
   if (@SqlImmediate(l_Sql_String) == FALSE)
      {
         return (FALSE);
      }

	l_buc_leistdat = ifelse(""{""$33""}"",""{""""}"","",_ref_stable(""{""""{""$33""}""""}""));
	if (l_buc_leistdat > "") {
		l_sql = "UPDATE ABUC_BUCHUNG SET BUC_LEISTDATUM = slaf.li_to_date(:l_buc_leistdat) WHERE buc_bucid = :BUCID_NEU";
		@print(l_sql); 
		@SqlImmediate(l_sql);
	}
	
   LVEID = $1;
   BUC_ART = $2;
   BUC_DATUM = $6;
""}"")

define(""{""AGEN_BUCE""}"",""{""
   /* Buchung ohne Positionen bei Loeschcode=Y loeschen */
   if ( l_del_code == "Y" )
   {
		@print(@sprintf(@nls_gettext_x("li_lg.agen_buce.check_del")));
      if (@SqlImmediate("SELECT COUNT(*) FROM abpo_buchposition WHERE bpo_bucid = :BUCID_NEU INTO :l_del_count ") == FALSE)
      {
         return (FALSE);
      }
      else
      {
         if ( l_del_count == 0 )
         {
            if (@SqlImmediate("DELETE FROM abuc_buchung WHERE buc_bucid = :BUCID_NEU") == FALSE)
            {
					@print(@sprintf(@nls_gettext_x("li_lg.agen_buce.check_del_err")));
               return (FALSE);
            }
				@print(@sprintf(@nls_gettext_x("li_lg.agen_buce.check_del_ok")));
         }
         else
         {
				@print(@sprintf(@nls_gettext_x("li_lg.agen_buce.check_del_nok")));
         }
      }
   }
	@print(@sprintf(@nls_gettext_x("li_lg.agen_buce.end")));
/* @restore_vars();*/
""}"")

define(""{""AGEN_BPO""}"",""{""

   BPO_STATUS = ifelse($1,,BUC_STATUS,$1);

   if ( @getwert(ZZTEST) == "Y" )
   {
		@print(@nls_gettext_x("li_lg.agen_bpo.msg_start"));
		@print(@nls_gettext_x("li_lg.agen_bpo.msg_line"));
      if ( BUC_ART == "UML" )
      {
			@print(@nls_gettext_x("li_lg.agen_bpo.legende_umlage"));
			@print(@nls_gettext_x("li_lg.agen_bpo.legende_all_mu"));
			@print(@nls_gettext_x("li_lg.agen_bpo.legende_all_mb"));
			@print(@nls_gettext_x("li_lg.agen_bpo.legende_uml_mc"));
         l_mu  = "[M]";
         l_muc = "[MC]";
         l_mea = "   ";
         l_ma  = "    ";
         l_mc  = "    ";
      }
      else
      {
			@print(@nls_gettext_x("li_lg.agen_bpo.legende_einaus"));
			@print(@nls_gettext_x("li_lg.agen_bpo.legende_all_mu"));
			@print(@nls_gettext_x("li_lg.agen_bpo.legende_e_a_ma"));
			@print(@nls_gettext_x("li_lg.agen_bpo.legende_all_mb"));
			@print(@nls_gettext_x("li_lg.agen_bpo.legende_e_a_mc"));
         l_mu  = "   ";
         l_mea = "[M]";
         l_ma  = "[MA]";
         l_mc  = "[MC]";
         l_muc = "    ";
      }
		l_par_artnr = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
		l_par_artid = ifelse($3,,"",_ref(""{""""{""$3""}""""}""));
		l_par_kurzb = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));
		l_par_meng1 = ifelse($5,,"",_ref(""{""""{""$5""}""""}""));
		l_par_einh1 = ifelse($6,,"",_ref(""{""""{""$6""}""""}""));
		l_par_inht2 = ifelse($7,,"",_ref(""{""""{""$7""}""""}""));
		l_par_meng2 = ifelse($8,,"",_ref(""{""""{""$8""}""""}""));
		l_par_einh2 = ifelse($9,,"",_ref(""{""""{""$9""}""""}""));
		l_par_inht3 = ifelse($10,,"",_ref(""{""""{""$10""}""""}""));
		l_par_meng3 = ifelse($11,,"",_ref(""{""""{""$11""}""""}""));
		l_par_einh3 = ifelse($12,,"",_ref(""{""""{""$12""}""""}""));
		l_par_inht4 = ifelse($13,,"",_ref(""{""""{""$13""}""""}""));
		l_par_meng4 = ifelse($14,,"",_ref(""{""""{""$14""}""""}""));
		l_par_einh4 = ifelse($15,,"",_ref(""{""""{""$15""}""""}""));
		l_par_inht5 = ifelse($16,,"",_ref(""{""""{""$16""}""""}""));
		l_par_meng5 = ifelse($17,,"",_ref(""{""""{""$17""}""""}""));
		l_par_einh5 = ifelse($18,,"",_ref(""{""""{""$18""}""""}""));
		l_par_btogw = ifelse($19,,"",_ref(""{""""{""$19""}""""}""));
		l_par_grup1 = ifelse($20,,"",_ref(""{""""{""$20""}""""}""));
		l_par_grup2 = ifelse($21,,"",_ref(""{""""{""$21""}""""}""));
		l_par_markg = ifelse($22,,"",_ref(""{""""{""$22""}""""}""));
		l_par_sperc = ifelse($23,,"",_ref(""{""""{""$23""}""""}""));
		l_par_sperg = ifelse($24,,"",_ref(""{""""{""$24""}""""}""));
		l_par_abldt = ifelse($25,,"",_ref(""{""""{""$25""}""""}""));
		l_par_prodt = ifelse($26,,"",_ref(""{""""{""$26""}""""}""));
		l_par_platz = ifelse($27,,"",_ref(""{""""{""$27""}""""}""));
		l_par_pallg = ifelse($28,,"",_ref(""{""""{""$28""}""""}""));
		l_par_palwi = ifelse($29,,"",_ref(""{""""{""$29""}""""}""));
		l_par_palhi = ifelse($30,,"",_ref(""{""""{""$30""}""""}""));
		l_par_colli = ifelse($31,,"",_ref(""{""""{""$31""}""""}""));
		l_par_bemkg = ifelse($32,,"",_ref(""{""""{""$32""}""""}""));
		l_par_urlld = ifelse($33,,"",_ref(""{""""{""$33""}""""}""));
		l_par_soll1 = ifelse($34,,"",_ref(""{""""{""$34""}""""}""));
		l_par_soll2 = ifelse($35,,"",_ref(""{""""{""$35""}""""}""));
		l_par_soll3 = ifelse($36,,"",_ref(""{""""{""$36""}""""}""));
		l_par_soll4 = ifelse($37,,"",_ref(""{""""{""$37""}""""}""));
		l_par_soll5 = ifelse($38,,"",_ref(""{""""{""$38""}""""}""));
		l_par_posit = ifelse($39,,"",_ref(""{""""{""$39""}""""}""));
		l_par_uml_bewid = ifelse($40,,"",_ref(""{""""{""$40""}""""}""));
		l_par_uml_lplid = ifelse($41,,"",_ref(""{""""{""$41""}""""}""));
		l_par_adrid_eig = ifelse($42,,"",_ref(""{""""{""$42""}""""}""));

		@print(@nls_gettext_x("li_lg.agen_bpo.msg_line"));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.bucid_neu")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.lveid")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.buc_art")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.buc_datum")));
		@print(@nls_gettext_x("li_lg.agen_bpo.msg_line"));
		@print(@nls_gettext_x("li_lg.agen_bpo.par_start"));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_status")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_artnr")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_artid")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_kurzb")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_meng1")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_einh1")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_inht2")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_meng2")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_einh2")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_inht3")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_meng3")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_einh3")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_inht4")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_meng4")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_einh4")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_inht5")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_meng5")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_einh5")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_btogw")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_grup1")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_grup2")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_markg")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_sperc")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_sperg")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_abldt")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_prodt")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_platz")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_pallg")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_palwi")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_palhi")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_colli")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_bemkg")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_urlld")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_soll1")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_soll2")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_soll3")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_soll4")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_soll5")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_posit")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_uml_bewid")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_uml_lplid")));
		@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.par_adrid_eig")));
		@print(@nls_gettext_x("li_lg.agen_bpo.par_ende"));
		@print(@nls_gettext_x("li_lg.agen_bpo.msg_line"));
   }

   l_Sql_String = " \
      BEGIN  agen.bpo_neu ('" || \
      BUCID_NEU                           || "','" || LVEID                               || "','" || \
      BUC_ART                             || "','" || BUC_DATUM                           || "','" || \
      BPO_STATUS                          || "',"  || \
      ifelse($39,,"NULL",_ref(""{""$39""}""))     || ",'"  || ifelse($3,,"",_ref(""{""""{""$3""}""""}""))         || "','" || \
      ifelse($4,,"",_ref(""{""""{""$4""}""""}""))         || "',"  || ifelse($5,,"NULL",_ref(""{""""{""$5""}""""}""))     || ",'"  || \
      ifelse($6,,"",_ref(""{""""{""$6""}""""}""))         || "',"  || ifelse($7,,"NULL",_ref(""{""""{""$7""}""""}""))     || ","   || \
      ifelse($8,,"NULL",$8)               || ",'"  || ifelse($9,,"",_ref(""{""""{""$9""}""""}""))         || "',"  || \
      ifelse($10,,"NULL",_ref(""{""""{""$10""}""""}""))   || ","   || ifelse($11,,"NULL",$11)             || ",'"  || \
      ifelse($12,,"",_ref(""{""""{""$12""}""""}""))       || "',"  || ifelse($13,,"NULL",_ref(""{""""{""$13""}""""}""))   || ","   || \
      ifelse($14,,"NULL",$14)             || ",'"  || ifelse($15,,"",_ref(""{""""{""$15""}""""}""))       || "',"  || \
      ifelse($16,,"NULL",_ref(""{""""{""$16""}""""}""))   || ","   || ifelse($17,,"NULL",$17)             || ",'"  || \
      ifelse($18,,"",_ref(""{""""{""$18""}""""}""))       || "',"  || ifelse($19,,"NULL",_ref(""{""""{""$19""}""""}""))   || ",'"  || \
      ifelse($20,,"",_ref(""{""""{""$20""}""""}""))       || "','" || ifelse($21,,"",_ref(""{""""{""$21""}""""}""))       || "','" || \
      ifelse($22,,"",_ref(""{""""{""$22""}""""}""))       || "','" || ifelse($23,,"",_ref(""{""""{""$23""}""""}""))       || "','" || \
      ifelse($24,,"",_ref(""{""""{""$24""}""""}""))       || "','" || ifelse($25,,"",_ref(""{""""{""$25""}""""}""))       || "','" || \
      ifelse($26,,"",_ref(""{""""{""$26""}""""}""))       || "','" || ifelse($27,,"",_ref(""{""""{""$27""}""""}""))       || "',"  || \
      ifelse($28,,"NULL",_ref(""{""""{""$28""}""""}""))   || ","   || ifelse($29,,"NULL",_ref(""{""""{""$29""}""""}""))   || ","   || \
      ifelse($30,,"NULL",_ref(""{""""{""$30""}""""}""))   || ",'"  || ifelse($31,,"",_ref(""{""""{""$31""}""""}""))       || "','" || \
      ifelse($32,,"",_ref(""{""""{""$32""}""""}""))       || "','" || ifelse($33,,"",_ref(""{""""{""$33""}""""}""))       || "',"  || \
      ifelse($34,,"NULL",$34)             || ","   || ifelse($35,,"NULL",$35)             || ","   || \
      ifelse($36,,"NULL",$36)             || ","   || ifelse($37,,"NULL",$37)             || ","   || \
      ifelse($38,,"NULL",$38)             || ",'"  || ifelse($2,,"",_ref(""{""""{""$2""}""""}""))         || "','" || \
      ifelse($40,,"",_ref(""{""""{""$40""}""""}""))       || "','" || ifelse($41,,"",_ref(""{""""{""$41""}""""}""))       || "','" || \
      ""                                  || "','" || ""                                  || "','" || \
      ""                                  || "',"  || ifelse($42,,"NULL",_ref(""{""""{""$42""}""""}""))   || ","   || \
      AG_ID                               || ","   || "NULL"                              || " );  \
      END;";

   @print( l_Sql_String );

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
   else
   {
      if ( @getwert(ZZTEST) == "Y" )
      {
			@print(@nls_gettext_x("li_lg.agen_bpo.msg_line"));
			@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.rc_val")));
			@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.rc_txt")));
			@print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.rc_cls")));
			@print(@nls_gettext_x("li_lg.agen_bpo.msg_line"));
			@print(@nls_gettext_x("li_lg.agen_bpo.msg_end"));
      }
   }

   if ( @getwert(RC) != 0 )
   {
		@abort(@sprintf(@nls_gettext_x("li_lg.agen_bpo.abort")));
   }
   else
   {
      if ( BUC_ART != "UML" )
      {
         /* nach erfolgreicher Anlage der Position die aktuelle bpoid fuer die Bewegungen holen */
         l_ret = @SqlImmediate(" \
            SELECT MAX( bpo_bpoid ) \
            FROM  abpo_buchposition \
            WHERE bpo_bucid = :BUCID_NEU \
            INTO :BPOID_NEU ");
         @print(@sprintf(@nls_gettext_x("li_lg.agen_bpo.bpoid_neu")));
      }
   }""}"")

define(""{""AGEN_BPOE""}"",""{""
   @print("Bpo-Ende");""}"")


/* ---------------------------------------------------------------------
Statuswechsel Buchung
*/

define(""{""ASTAT_BUC""}"",""{""

   l_Sql_String = "\
      BEGIN \
      savepoint lager_m4_astat_buc; \
      astat.chg_stat( 'BUC', '" || BUCID || "', '" || ifelse($1,,"NOSTATE",_ref(""{""""{""$1""}""""}"")) || "','" || \
                      ifelse($2,,"",_ref(""{""""{""$2""}""""}"")) || \
                      "',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL ); \
      EXCEPTION \
      WHEN OTHERS THEN \
         IF SQLCODE >= -20999 AND SQLCODE <= -20000 \
         THEN \
            rollback to lager_m4_astat_buc; \
            IF SGLO.set_errcode( SQLCODE ) > 0 THEN NULL; END IF; \
         ELSE \
            RAISE; \
         END IF; \
      END;";

   @print( l_Sql_String );

   if (@SqlImmediate(l_Sql_String) == FALSE)
      {
         return (FALSE);
      }
      else
      {
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
      }
""}"")


/* ---------------------------------------------------------------------
Statuswechsel Buchungsposition
*/

define(""{""ASTAT_BPO""}"",""{""

   l_Sql_String = "\
      BEGIN \
      savepoint lager_m4_astat_bpo; \
      astat.chg_stat( 'BPO', '" || BPOID || "', '" || ifelse($1,,"NOSTATE",_ref(""{""""{""$1""}""""}"")) || "','" || \
                      ifelse($2,,"",_ref(""{""""{""$2""}""""}"")) || \
                      "',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL ); \
      EXCEPTION \
      WHEN OTHERS THEN \
         IF SQLCODE >= -20999 AND SQLCODE <= -20000 \
         THEN \
            rollback to lager_m4_astat_bpo; \
            IF SGLO.set_errcode( SQLCODE ) > 0 THEN NULL; END IF; \
         ELSE \
            RAISE; \
         END IF; \
      END;";

   @print( l_Sql_String );

   if (@SqlImmediate(l_Sql_String) == FALSE)
      {
         return (FALSE);
      }
      else
      {
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
      }
""}"")


/* ---------------------------------------------------------------------
Statuswechsel Bewegung
*/

define(""{""ASTAT_BEW""}"",""{""

   l_Sql_String = "\
      BEGIN \
      savepoint lager_m4_astat_bew; \
      astat.chg_stat( 'BEW', '" || BEWID || "', '" || ifelse($1,,"NOSTATE",_ref(""{""""{""$1""}""""}"")) || "','" || \
                      ifelse($2,,"",_ref(""{""""{""$2""}""""}"")) || \
                      "', '" || ifelse($3,,"",_ref(""{""""{""$3""}""""}"")) || \
                      "',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL ); \
      EXCEPTION \
      WHEN OTHERS THEN \
         IF SQLCODE >= -20999 AND SQLCODE <= -20000 \
         THEN \
            rollback to lager_m4_astat_bew; \
            IF SGLO.set_errcode( SQLCODE ) > 0 THEN NULL; END IF; \
         ELSE \
            RAISE; \
         END IF; \
      END;";

   @print( l_Sql_String );

   if (@SqlImmediate(l_Sql_String) == FALSE)
      {
         return (FALSE);
      }
      else
      {
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
      }
""}"")

define(""{""ASTAT_DEL_BPO""}"",""{""
   l_Sql_String = "\
      BEGIN \
      savepoint lager_m4_astat_del_bpo; \
      astat.del_Position( '" || _ref(""{""""{""$1""}""""}"") || "', '" || _ref(""{""""{""$2""}""""}"") || "'  \
                      ,NULL,NULL,NULL,NULL,NULL ); \
      EXCEPTION \
      WHEN OTHERS THEN \
         IF SQLCODE >= -20999 AND SQLCODE <= -20000 \
         THEN \
            rollback to lager_m4_astat_bew; \
            IF SGLO.set_errcode( SQLCODE ) > 0 THEN NULL; END IF; \
         ELSE \
            RAISE; \
         END IF; \
      END;";

   @print( l_Sql_String );

   if (@SqlImmediate(l_Sql_String) == FALSE)
      {
         return (FALSE);
      }
      else
      {
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
      } 
""}"")

/* ---------------------------------------------------------------------
Bestandsbewegungsschleife

*/

define(""{""_BEST_VARS_LOOP""}"",  ""{""BEWID, BUC_DATUM, BEW_STATUS, BEW_BRUTTO, \
   BEW_GRUP1, BEW_GRUP2, BEW_PLATZ, \
   BEW_MENGE1, BEW_MENGE2, BEW_MENGE3, BEW_MENGE4, BEW_MENGE5, \
   VEP_KBEZ1, VEP_KBEZ2, VEP_KBEZ3, VEP_KBEZ4, VEP_KBEZ5, \
   BEW_MARK, BEW_PRODAT, BEW_LSPID, BEW_ZUGRIFFSZAHL""}"")
undefine(""{""_BEST_VARS_RESET""}"")
define(""{""_BEST_VARS_SELECT""}"", ""{""bew_bewid, TO_CHAR(bew_datum, 'YYYY.MM.DD'), \
   bew_bstid, bew_brutto, bew_grup1, bew_grup2, bew_platz, \
   bew_bestand1, bew_bestand2, bew_bestand3, bew_bestand4, bew_bestand5, \
   vep_kbez1, vep_kbez2, vep_kbez3, vep_kbez4, vep_kbez5, \
   bew_mark, TO_CHAR( bew_prodat, 'YYYY.MM.DD'), bew_lspid, \
   abew_sum.getzugriffszahl(bew_bewid)""}"")
define(""{""_BEST_VARS_INTO""}"",  ""{"":BEWID, :BUC_DATUM, :BEW_STATUS, :BEW_BRUTTO, \
   :BEW_GRUP1, :BEW_GRUP2, :BEW_PLATZ, \
   :BEW_MENGE1, :BEW_MENGE2, :BEW_MENGE3, :BEW_MENGE4, :BEW_MENGE5, \
   :VEP_KBEZ1, :VEP_KBEZ2, :VEP_KBEZ3, :VEP_KBEZ4, :VEP_KBEZ5, \
   :BEW_MARK, :BEW_PRODAT, :BEW_LSPID, :BEW_ZUGRIFFSZAHL""}"")
define(""{""_BEST_VARS_INIT""}"",""{""l_where = " ";

if ((@getwert(LVEID) > " ") & (@gesetzt(LVEID) == TRUE))
   {
      l_lveid = "";
      l_lveid = LVEID;
      l_where = l_where ||" AND bew_lveid = :l_lveid ";
   }
if ((@getwert(BEW_PLATZ) > " ") & (@gesetzt(BEW_PLATZ) == TRUE))
   {
      l_platz = "";
      l_platz = BEW_PLATZ;
      l_where = l_where ||" AND bew_platz = :l_platz ";
   }
if ((@getwert(BEW_GRUP1) > " ") & (@gesetzt(BEW_GRUP1) == TRUE))
   {
      l_grup1 = "";
      l_grup1 = BEW_GRUP1;
      l_where = l_where ||" AND bew_grup1 = upper(:l_grup1) ";
   }
if ((@getwert(BEW_GRUP2) > " ") & (@gesetzt(BEW_GRUP2) == TRUE))
   {
      l_grup2 = "";
      l_grup2 = BEW_GRUP2;
      l_where = l_where ||" AND bew_grup2 = upper(:l_grup2) ";
   }
if ((@getwert(BEW_LSPID) > " ") & (@gesetzt(BEW_LSPID) == TRUE))
   {
      l_lspid = "";
      l_lspid = BEW_LSPID;
      l_where = l_where ||" AND bew_lspid = upper(:l_lspid) ";
   }
if ((@getwert(ARTID) > " ") & (@gesetzt(ARTID) == TRUE))
   {
      l_artid = "";
      l_artid = ARTID;
      l_where = l_where ||" AND bew_artid = :l_artid ";
   }
else
{
   if ((@getwert(ART_NR) > " ") & (@gesetzt(ART_NR) == TRUE))
      {
         l_artnr = "";
         l_artnr = ART_NR;
         l_where = l_where ||" AND bew_artid IN (SELECT art_artid \
               FROM aart_artikel WHERE art_nr = upper(:l_artnr))";
      }
   else
      {
      if ((@getwert(ART_AGRID) > " ") & (@gesetzt(ART_AGRID) == TRUE))
         {
            l_agrid = "";
            l_agrid = ART_AGRID;
            l_where = l_where ||" AND bew_artid IN (SELECT art_artid \
                     FROM aart_artikel WHERE art_agrid = :l_agrid)";
         }
      }
}
if ( l_where > "" )
{ @print(@sprintf(@nls_gettext_x("li_lg.best_vars_init.zusatz"))); }
else
{ @print(@nls_gettext_x("li_lg.best_vars_init.zusatz_no")); }
""}"")


define(""{""_LOOP_VARS""}"", ""{""_BEST_VARS_LOOP""}"")
undefine(""{""_LOOP_RSET""}"")

/* ---------------------------------------------------------------------
LG-BEST-BEW Bestandsbewegungen des aktuellen Artikels BPOID
*/
define(""{""S_LG_BEST_BEW_ZUGRIFFSZAHL""}"", ""{""abew_sum.getzugriffszahl(bew_bewid)""}"")
define(""{""S_LG_BEST_BEW_ZUGRZAHL_DAT""}"", ""{""abew_sum.getzugriffszahl(bew_bewid);bew_datum""}"")

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _BEST_VARS_SELECT \
      FROM abew_best_art_b \
      WHERE 1 = 1 " ||
      l_where || l_p_where ||
      " ORDER BY " || l_p_orderby || " bew_platz \
      INTO _BEST_VARS_INTO"""}"")

define(""{""_LOOP_NAME""}"",""{""LG-BEST-BEW: Bestandsbewegungen""}"")
define(""{""LG_BEST_BEW""}"", _BEST_VARS_INIT _LOOP )

/* ---------------------------------------------------------------------
LG_NACHSCHUB   Schleife, welche Artikel fuer Nachbefuellung ermittelt.
               Die Schleife ist wegen Ueberlaenge (fuer Anzeige 3-GL Code
               im vi -> max. 2048 Chars) mit 2 define's _NACHSCHUB_ART_SEL
               und _NACHSCHUB_BEST_SEL erstellt worden.
*/

define(""{""_NACHSCHUB_VARS_INIT""}"",  ""{""
l_lg_artanz_where = "";
if ((@getwert(BEW_ZUGRIFFSZAHL) > 0) & (@gesetzt(BEW_ZUGRIFFSZAHL) == TRUE))
{
   l_lg_artanz_where = "WHERE rownum <= :BEW_ZUGRIFFSZAHL";
}
""}"")

define(""{""_NACHSCHUB_ART_SEL""}"",  ""{""select artnr,artid,diff_zu_max,pzt_zu_min from (\
select   art_nr as artnr,art_artid as artid,\
to_number(alat.get_za(art_artid,'AART','KOMMLBEMAX')) diff_zu_max,\
((alat.get_za(art_artid,'AART','KOMMLBEMIN') / alat.get_za(art_artid,'AART','KOMMLBEMIN'))*100)*-1 pzt_zu_min \
from  aart_t_artikel \
where art_lveid = :LVEID \
and   alat.get_za(art_artid,'AART','KOMMLBEMIN') is not null \
and   alat.get_za(art_artid,'AART','KOMMLBEMAX') is not null \
and   alat.get_za(art_artid,'AART','KOMMLPLMAX') is not null \
and   not exists (select bew_artid from abew_best_h where bew_artid = art_artid and bew_lplid in (select lpl_lplid from alpl_lplatz where lpl_lbeid= :LBEID )) \
and   not exists (select bew_artid from abew_best_h where bew_artid = art_artid and bew_lplid in (select lpb_lplid from alpb_lpl_lbe where lpb_lbeid= :LBEID )) \""}"")

define(""{""_NACHSCHUB_BEST_SEL""}"",  ""{""select max(art_nr),bew_artid,\
      alat.get_za(bew_artid,'AART','KOMMLBEMAX') - \
      nvl(sum(decode(aart.get_maxsort(bew_artid),1,bew_bestand1,2,bew_bestand2,3,bew_bestand3,4,bew_bestand4,5,bew_bestand5,0)),0) diff_zu_max,\
      round(((alat.get_za(bew_artid,'AART','KOMMLBEMIN') - \
      nvl(sum(decode(aart.get_maxsort(bew_artid),1,bew_bestand1,2,bew_bestand2,3,bew_bestand3,4,bew_bestand4,5,bew_bestand5,0)),0)) / alat.get_za(bew_artid,'AART','KOMMLBEMIN'))*100,2)*-1 pzt_zu_min \
from  abew_best_h,\
      aart_t_artikel \
where bew_artid = art_artid \
and   bew_lveid = :LVEID \
and   alat.get_za(art_artid,'AART','KOMMLBEMIN') is not null \
and   alat.get_za(art_artid,'AART','KOMMLBEMAX') is not null \
and   alat.get_za(art_artid,'AART','KOMMLPLMAX') is not null \
and   ( bew_lplid in (select lpb_lplid from alpb_lpl_lbe where lpb_lbeid = :LBEID) or \
        bew_lplid in (select lpl_lplid from alpl_lplatz where lpl_lbeid = :LBEID)) \
group by bew_artid \
having   nvl(sum(decode(aart.get_maxsort(bew_artid),1,bew_bestand1,2,bew_bestand2,3,bew_bestand3,4,bew_bestand4,5,bew_bestand5,0)),0) < alat.get_za(bew_artid,'AART','KOMMLBEMIN')) \
group by pzt_zu_min,artnr,artid,diff_zu_max) \""}"")

define(""{""_NACHSCHUB_VARS_LOOP""}"",  ""{""ART_NR,ARTID,LG_EIN,PRIORITAET""}"")
define(""{""_NACHSCHUB_VARS_INTO""}"",  ""{"":ART_NR,:ARTID,:LG_EIN,:PRIORITAET""}"")
undefine(""{""_LOOP_RSET""}"")
define(""{""_LOOP_VARS""}"", ""{""_NACHSCHUB_VARS_LOOP""}"")

define(""{""_LOOP_SELECT""}"", ""{"""select artnr,artid,diff_zu_max,pzt_zu_min*-1 from (" ||
                        "_NACHSCHUB_ART_SEL " ||
                        "union " ||
                        "_NACHSCHUB_BEST_SEL " ||
                        l_lg_artanz_where ||
                        " into _NACHSCHUB_VARS_INTO"""}"")

define(""{""_LOOP_NAME""}"",""{""LG-NACHSCHUB: Nachschub""}"")
define(""{""LG_NACHSCHUB""}"", _NACHSCHUB_VARS_INIT _LOOP )

undefine(""{""_NACHSCHUB_ART_SEL""}"")
undefine(""{""_NACHSCHUB_BEST_SEL""}"")

/* ---------------------------------------------------------------------------
LG_NACHSCHUBWA Schleife, welche Artikel fuer Nachbefuellung mit Beruecksichtigung
               der anstehenden Warenausgaenge ermittelt.
*/

/*************************************************************
*  WHERE-KLAUSEL-MAKRO FUER ARTIKEL-SELEKTION
*************************************************************/

define(""{""_NACHSCHUBWA_ATT_WHERE""}"",""{""\
AND alat.get_za(bew_artid,'AART','KOMMLBEMIN') IS NOT NULL \
AND alat.get_za(bew_artid,'AART','KOMMLBEMAX') IS NOT NULL \
AND alat.get_za(bew_artid,'AART','KOMMLPLMAX') IS NOT NULL \""}"")

/*************************************************************
*  SELECT-KLAUSEL-MAKRO FUER BESTANDS-SELEKTION
*************************************************************/

define(""{""_NACHSCHUBWA_BEST_COL""}"",  ""{""\
SELECT SUBSTR(aart.getnr(bew_artid),1,30),bew_artid,alat.get_za(bew_artid,'AART','KOMMLBEMAX')-NVL(SUM(DECODE(aart.get_maxsort(bew_artid),1,bew_bestand1,2,bew_bestand2,3,bew_bestand3,4,bew_bestand4,5,bew_bestand5,0)),0),\
ROUND(((alat.get_za(bew_artid,'AART','KOMMLBEMAX')-NVL(SUM(DECODE(aart.get_maxsort(bew_artid),1,bew_bestand1,2,bew_bestand2,3,bew_bestand3,4,bew_bestand4,5,bew_bestand5,0)),0))/ alat.get_za(bew_artid,'AART','KOMMLBEMAX'))*100,2)*-1 \""}"")

/*************************************************************
*  SELECT-KLAUSEL-MAKRO FUER BESTANDS-ALTERNATIV-SELEKTION
*************************************************************/
define(""{""_NACHSCHUBWA_BESTA_COL""}"",  ""{""\
SELECT SUBSTR(aart.getnr(bew_artid),1,30),bew_artid,\
NVL(SUM(DECODE(aart.get_maxsort(bew_artid),1,bew_bestand1,2,bew_bestand2,3,bew_bestand3,4,bew_bestand4,5,bew_bestand5,0)),0)*-1,\
ROUND(((NVL(SUM(DECODE(aart.get_maxsort(bew_artid),1,bew_bestand1,2,bew_bestand2,3,bew_bestand3,4,bew_bestand4,5,bew_bestand5,0)),0))/ alat.get_za(bew_artid,'AART','KOMMLBEMAX'))*100,2) \""}"")

/*************************************************************
*  ERMITTLUNGSKOMPONENTE  1. TEIL
*  ARTIKEL OHNE BESTAND IM ZIELBEREICH SELEKTIEREN
*************************************************************/

define(""{""_NACHSCHUBWA_ART_SEL""}"",""{""SELECT artnr,artid,SUM(wamenge) as diff_zu_max,SUM(pztmax) as pzt_zu_max \
FROM (SELECT art_nr as artnr,art_artid as artid \
      ,TO_NUMBER(alat.get_za(art_artid, 'AART','KOMMLBEMAX')) as wamenge \
      ,((alat.get_za(art_artid,'AART','KOMMLBEMAX')/ \
      alat.get_za(art_artid,'AART','KOMMLBEMAX'))*100)*-1 as pztmax \
FROM AART_T_ARTIKEL \
WHERE art_lveid = :LVEID \
AND alat.get_za(art_artid,'AART','KOMMLBEMIN') IS NOT NULL \
AND alat.get_za(art_artid,'AART','KOMMLBEMAX') IS NOT NULL \
AND alat.get_za(art_artid,'AART','KOMMLPLMAX') IS NOT NULL \
AND to_number(alat.get_za(art_artid,'AART','KOMMLBEMIN')) > 0 \
AND NOT EXISTS( SELECT bew_artid FROM abew_best_h WHERE bew_artid = art_artid AND bew_lplid IN (SELECT lpl_lplid FROM ALPL_LPLATZ WHERE lpl_lbeid = :LBEID)) \
AND NOT EXISTS( SELECT bew_artid FROM abew_best_h WHERE bew_artid = art_artid AND bew_lplid IN (SELECT lpb_lplid FROM ALPB_LPL_LBE WHERE lpb_lbeid = :LBEID)) \""}"")

/*************************************************************
*  ERMITTLUNGSKOMPONENTE  2. TEIL
*  AUFTRAGSMENGEN ('AV','AB') SELEKTIEREN
*************************************************************/

define(""{""_NACHSCHUBWA_AUFT_SEL""}"",  ""{""\
SELECT   MAX(art_nr),bpo_artid \
         ,DECODE(SIGN(SUM(abpo_sum.getmengenorm(bpo_bpoid))-NVL(MAX(Best.mge),0)) \
               ,1,SUM(abpo_sum.getmengenorm(bpo_bpoid))-NVL(MAX(Best.mge),0),0) \
         ,DECODE(SIGN(SUM(abpo_sum.getmengenorm(bpo_bpoid))-NVL(MAX(Best.mge),0)) \
               ,1,ROUND(((SUM(abpo_sum.getmengenorm(bpo_bpoid))-NVL(MAX(Best.mge),0)) \
               /alat.get_za(bpo_artid,'AART','KOMMLBEMAX'))*100,2)*-1,0) \
FROM ABPO_BUCHPOSITION, AART_T_ARTIKEL \
    ,(SELECT art_artid, SUM(DECODE(bew_bestand5,NULL,DECODE(bew_bestand4,NULL,DECODE(bew_bestand3,NULL,DECODE(bew_bestand3,NULL,bew_bestand1,bew_bestand3),bew_bestand3),bew_bestand4),bew_bestand5)) mge \
      FROM abew_best_art_b \
     WHERE (bew_ubewid IS NULL OR bew_art = 'EIN') \
       AND bew_lveid = :LVEID \
       AND art_lveid = :LVEID \
       AND bew_lplid IN ( SELECT lpl_lplid \
                            FROM ALPL_LPLATZ \
                           WHERE lpl_lbeid IN (:LBEID) \
                           ) \
       AND (bew_verfuegbar = 1 OR bew_bewid IS NULL) \
     GROUP BY art_artid) best \
WHERE bpo_artid = AART_T_ARTIKEL.art_artid \
AND best.art_artid(+) = AART_T_ARTIKEL.art_artid \
AND bpo_lveid = :LVEID \
AND bpo_bstid IN ('AUS01', 'AUS02') \
AND alat.get_za(bpo_artid,'AART','KOMMLBEMIN') IS NOT NULL \
AND alat.get_za(bpo_artid,'AART','KOMMLBEMAX') IS NOT NULL \
AND alat.get_za(bpo_artid,'AART','KOMMLPLMAX') IS NOT NULL \
AND DECODE(:LG_AUS,'ALLE','X',alat.get_za(bpo_bucid,'ABUC','NACHGRP')) = DECODE(:LG_AUS,'ALLE','X',:LG_AUS) \
GROUP BY bpo_artid \""}"")

/*************************************************************
*  ERMITTLUNGSKOMPONENTE  3. TEIL
*  BESTAENDE IM ZIELBEREICH -> LOGISCHER BEREICH
*************************************************************/

define(""{""_NACHSCHUBWA_BEST1_SEL""}"",""{""_NACHSCHUBWA_BEST_COL
FROM abew_best_h,alpb_lpl_lbe \
WHERE bew_lplid = lpb_lplid _NACHSCHUBWA_ATT_WHERE
AND lpb_lbeid = :LBEID \
AND bew_lveid = :LVEID \
AND to_number(alat.get_za(bew_artid,'AART','KOMMLBEMIN')) > 0 \
group by bew_artid \
HAVING SUM(DECODE(aart.get_maxsort(bew_artid),1,bew_bestand1,2,bew_bestand2,3,bew_bestand3,4,bew_bestand4,5,bew_bestand5,0)) < MIN(alat.get_za(bew_artid,'AART','KOMMLBEMIN')) ""}"")

/*************************************************************
*  ERMITTLUNGSKOMPONENTE  4. TEIL
*  BESTAENDE IM ZIELBEREICH -> PHYSISCHER BEREICH
*************************************************************/

define(""{""_NACHSCHUBWA_BEST2_SEL""}"",""{""_NACHSCHUBWA_BEST_COL
FROM abew_best_h,alpl_lplatz \
WHERE bew_lplid = lpl_lplid _NACHSCHUBWA_ATT_WHERE
AND lpl_lbeid = :LBEID \
AND bew_lveid = :LVEID \
AND to_number(alat.get_za(bew_artid,'AART','KOMMLBEMIN')) > 0 \
group by bew_artid \
HAVING SUM(DECODE(aart.get_maxsort(bew_artid),1,bew_bestand1,2,bew_bestand2,3,bew_bestand3,4,bew_bestand4,5,bew_bestand5,0)) < MIN(alat.get_za(bew_artid,'AART','KOMMLBEMIN')) ""}"")

/*************************************************************
*  ERMITTLUNGSKOMPONENTE  5. TEIL
*  BESTAENDE AUF ALTERNATIVPLAETZEN LAUT REGELID-EIN
*************************************************************/

define(""{""_NACHSCHUBWA_BEST3_SEL""}"",""{""_NACHSCHUBWA_BESTA_COL
FROM abew_best_h,alok_lokation \
WHERE bew_lplid = lok_lplid _NACHSCHUBWA_ATT_WHERE
AND NVL(lok_lbeid,'?') != :LBEID \
AND lok_lbrid = :LG_LBRIDEIN \
AND bew_lveid = :LVEID \
AND to_number(alat.get_za(bew_artid,'AART','KOMMLBEMIN')) > 0 \
group by bew_artid ) \
group by artnr,artid ) \
group by pzt_zu_max,artnr,artid,diff_zu_max \
having diff_zu_max > 0 \ ""}"")

define(""{""_NACHSCHUBWA_VARS_LOOP""}"",  ""{""ART_NR,ARTID,LG_EIN,PRIORITAET""}"")
define(""{""_NACHSCHUBWA_VARS_INTO""}"",  ""{"":ART_NR,:ARTID,:LG_EIN,:PRIORITAET""}"")
undefine(""{""_LOOP_RSET""}"")
define(""{""_LOOP_VARS""}"", ""{""_NACHSCHUBWA_VARS_LOOP""}"")

/*************************************************************
*  GESAMTE ERMITTLUNGSKOMPONENTE  1.+2.+3.+4.+5. TEIL
*************************************************************/

define(""{""_LOOP_SELECT""}"", ""{"""select artnr,artid,diff_zu_max,pzt_zu_max*-1 from (" ||
                        "_NACHSCHUBWA_ART_SEL " ||
                        "union " ||
                        "_NACHSCHUBWA_AUFT_SEL " ||
                        "union " ||
                        "_NACHSCHUBWA_BEST1_SEL " ||
                        "union " ||
                        "_NACHSCHUBWA_BEST2_SEL " ||
                        "union " ||
                        "_NACHSCHUBWA_BEST3_SEL " ||
                        " into _NACHSCHUBWA_VARS_INTO"""}"")

define(""{""_LOOP_NAME""}"",""{""LG-NACHSCHUB: Nachschub""}"")
define(""{""LG_NACHSCHUBWA""}"", _LOOP )

undefine(""{""_NACHSCHUBWA_ATT_WHERE""}"")
undefine(""{""_NACHSCHUBWA_BEST_COL""}"")
undefine(""{""_NACHSCHUBWA_BESTA_COL""}"")
undefine(""{""_NACHSCHUBWA_ART_SEL""}"")
undefine(""{""_NACHSCHUBWA_AUFT_SEL""}"")
undefine(""{""_NACHSCHUBWA_BEST1_SEL""}"")
undefine(""{""_NACHSCHUBWA_BEST2_SEL""}"")
undefine(""{""_NACHSCHUBWA_BEST3_SEL""}"")

/* ---------------------------------------------------------------------
ANAC_BPO FORMAT Selektionsschleife Nachschubdaten
*/

define(""{""ANAC_BPO""}"",""{""
@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.msg_start")));
if ( @getwert(ZZTEST) == "Y" )
{
	l_par_berid = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
	l_par_artid = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
	l_par_mgeeh = ifelse($3,,"",_ref(""{""""{""$3""}""""}""));
	l_par_zielp = ifelse($4,,"N",_ref(""{""""{""$4""}""""}""));
	l_par_rdgart = ifelse($5,,"1",_ref(""{""""{""$5""}""""}""));
	l_par_rdeart = ifelse($8,,"",_ref(""{""""{""$8""}""""}""));
	l_par_regaus = ifelse($6,,"",_ref(""{""""{""$6""}""""}""));
	l_par_regein = ifelse($7,,"",_ref(""{""""{""$7""}""""}""));
	l_par_regart = ifelse($9,,"",_ref(""{""""{""$9""}""""}""));
	l_par_rdgbst = ifelse($10,,"0",_ref(""{""""{""$10""}""""}""));
	l_par_rdebst = ifelse($11,,"",_ref(""{""""{""$11""}""""}""));

	@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.art_nr")));
	@print(@nls_gettext_x("li_lg.anac_bpo.par_start"));
	@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.par_berid")));
	@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.par_artid")));
	@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.par_mgeeh")));
	@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.par_zielp")));
	@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.par_rdgart")));
	@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.par_rdeart")));
	@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.par_regaus")));
	@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.par_regein")));
	@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.par_regart")));
	@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.par_rdgbst")));
	@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.par_rdebst")));
	@print(@nls_gettext_x("li_lg.anac_bpo.par_ende"));
}
l_lg_status = "???????";
if ( @SqlImmediate("begin anac.process_init('" ||ifelse($1,,"",_ref(""{""""{""$1""}""""}""))||"','"||ifelse($2,,"",_ref(""{""""{""$2""}""""}""))||"',"||ifelse($3,,"",_ref(""{""""{""$3""}""""}""))||",'"||ifelse($4,,"N",_ref(""{""""{""$4""}""""}""))||"',"||ifelse($5,,1,_ref(""{""""{""$5""}""""}""))||",'"||ifelse($6,,"",_ref(""{""""{""$6""}""""}""))||"','"||ifelse($7,,"",_ref(""{""""{""$7""}""""}""))||"','"||ifelse($8,,"",_ref(""{""""{""$8""}""""}""))||"',"||ifelse($9,,0,_ref(""{""""{""$9""}""""}""))||","||ifelse($10,,"",_ref(""{""""{""$10""}""""}""))||",'"||ifelse($11,,"",_ref(""{""""{""$11""}""""}""))||"'); end;") == TRUE )
{
   while (l_lg_status != "PROCESSING_COMPLETE")
   {
      if ( @SqlImmediate("begin anac.process_next; end;") == TRUE )
      {
         if ( @SqlImmediate(  "SELECT  SUBSTR(anac.get_bewiduml,1,15),SUBSTR(anac.get_lpliduml,1,10),anac.get_menge,SUBSTR(anac.get_vepid,1,7),SUBSTR(anac.get_status,1,20) " ||
                              "FROM    dual " ||
                              "INTO :BEWID_UML,:LPLID_UML,:BEW_MENGE1,:VEPID,:l_lg_status") == TRUE )
         {
            if ( @getwert(ZZTEST) == "Y" )
            {
					@print(@sprintf(@nls_gettext_x("li_lg.anac_bpo.msg_loop")));
            }
            if (l_lg_status == "PROCESSING")
            {""}"")

/* ---------------------------------------------------------------------
ANAC_BPOE FORMATENDE Selektionsschleife Nachschubdaten
*/

define(""{""ANAC_BPOE""}"",""{""          }
         }
      }
   }
   if ( @SqlImmediate("begin anac.process_end; end;") == TRUE )
   {
      if (@SqlImmediate( "SELECT SGLO.get_errcode,SUBSTR( SGLO.get_errtext, 1 ,50 ),SUBSTR( SGLO.get_errclass, 1 ,50 ) \
                          FROM DUAL INTO :RC, :RCTEXT, :RCCLASS" ) == FALSE)
      {
         return (FALSE);
      }
      else
      {
         if ( @getwert(ZZTEST) == "Y" )
         {
            @print( "  ---------------------------------------------------------------------------------" );
            @print( "  RC      [" || @getwert(RC)      || "]" );
            @print( "  RCTEXT  [" || @getwert(RCTEXT)  || "]" );
            @print( "  RCCLASS [" || @getwert(RCCLASS) || "]" );
            @print( "  ---------------------------------------------------------------------------------" );
         }
      }
      if ( @getwert(RC) != 0 )
      {
			@abort(@sprintf(@nls_gettext_x("li_lg.anac_bpoe.error")));
      }
   }
}
@print(@sprintf(@nls_gettext_x("li_lg.anac_bpoe.msg_ende")));
""}"")


/* ---------------------------------------------------------------------
Generieren von Inventuren
*/

define(""{""AGEN_INV""}"",""{""
   l_ret = @SqlImmediate(" \
      SELECT cfg_cfeld \ || '-'  \
         || aseq_invid.nextval   \
      FROM scfg_config \
      WHERE cfg_cfgid = 'VS' \
      INTO :INVID_NEU ");
	@print(@sprintf(@nls_gettext_x("li_lg.agen_inv.invid_neu")));

   l_nr = 0;
   l_ret = @SqlImmediate(" \
      SELECT nvl(max(inv_nr),0)+1 \
      FROM ainv_inventur \
      WHERE inv_lveid = '" || $1 || "' \
      INTO :l_nr ");
   INV_NR = l_nr; 
	@print(@sprintf(@nls_gettext_x("li_lg.agen_inv.inventur_nr")));

   l_Sql_String = " \
      INSERT INTO ainv_inventur \
      (inv_invid, inv_lveid, inv_nr, inv_storno, inv_bemerkung, \
      inv_usrid) \
      values \
      ( '" || INVID_NEU || "', '" || \
      $1 || "', " || \
      INV_NR || ", " || \
      "0" || ", '" || \
      ifelse($2,,"",_ref(""{""""{""$2""}""""}"")) || "', '" || \
      USRID || "')";
   @print( l_Sql_String );
   if (@SqlImmediate(l_Sql_String) == FALSE)
      {
         return (FALSE);
      }
   LVEID = $1;
""}"")

define(""{""AGEN_INVE""}"",""{""
	@print(@sprintf(@nls_gettext_x("li_lg.agen_inve.msg_ende")));
/* @restore_vars();*/
""}"")

define(""{""AGEN_INV_ART""}"",""{""
   l_Sql_String = " \
      INSERT INTO aina_inv_artikel \
      ( ina_invid, ina_artid ) \
      values \
      ( '" || INVID_NEU || "', '" || \
      $1 || "')";
   @print( l_Sql_String );
   if (@SqlImmediate(l_Sql_String) == FALSE)
      {
         return (FALSE);
      }
""}"")

/* ---------------------------------------------------------------------
Mengenaenderung Bewegung
*/


define(""{""AMENGEN_UPD""}"",""{""
   l_art = "";
   l_sql_string = "";
   l_lg_status = "???????";

   if (@SqlImmediate(" \
         SELECT bew_art \
         FROM abew_bewegung \
         WHERE  bew_bewid = :BEWID \
         INTO :l_art ") == FALSE)
            {
               return (FALSE);
            }

	@print(@sprintf(@nls_gettext_x("li_lg.amengen_upd.art_bew")));

   if ( l_art == "AUS" )
      {
         l_sql_string = "\
         BEGIN \
         afor.ausl_chg_menge( '" || BEWID || "', " || _ref(""{""""{""$1""}""""}"") || ", " || _ref(""{""""{""$2""}""""}"") || ", " || _ref(""{""""{""$3""}""""}"") ||");\
         END;";
      }
   else
      {
         if ( l_art == "EIN" )
         {
            l_sql_string = "\
            BEGIN \
            afor.einl_chg_menge( '" || BEWID || "', " || _ref(""{""""{""$1""}""""}"") || ", " || _ref(""{""""{""$2""}""""}"") || ", " || _ref(""{""""{""$3""}""""}"") ||");\
            END;";
         }
         else
         {
               return (FALSE);
         }
      }
   @print( l_sql_string );
   if (@SqlImmediate(l_sql_string) == FALSE)
      {
         return (FALSE);
      }
      else
      {
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

      }
""}"")

define(""{""AIEI_ZAEHLUNG""}"",""{""
   l_invid = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
   l_Sql_String = "BEGIN aiei.aiei_li('" || l_invid || "', \
            NULL, \
            NULL, \
            NULL, \
            NULL, \
            NULL, \
            NULL, \
            NULL, \
            NULL, \
            NULL, \
            NULL, \
            NULL, \
            NULL, \
            NULL, \
            NULL, \
            NULL, \
            5); END;";

   @print( l_Sql_String );

   if (@SqlImmediate(l_Sql_String) == FALSE)
   {
      return (FALSE);
   }
   else
   {
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
   }
""}"")


/* ---------------------------------------------------------------------
Bewegungsswitch dynamisch. 
Kann mitgegeben werden ob nur 1 Auslagerung umgeswitch wird und welche
*/
define(""{""LG_SWITCHBEWDYN""}"",""{""
   l_bewid_aus = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
   l_bewid_ein = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
   l_switch_one = ifelse($3,,"0",_ref(""{""""{""$3""}""""}""));
   l_bewid_aus2 = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));
   l_vepid      = ifelse($5,,"",_ref(""{""""{""$5""}""""}""));

   
   l_Sql_String = "BEGIN abewto.switchbew_dyn('" || l_bewid_aus || "', \
            '" || l_bewid_ein || "','" || l_switch_one || "','" || l_bewid_aus2 || "','" || l_vepid || "'); END;";


   @print( l_Sql_String );

   if (@SqlImmediate(l_Sql_String) == FALSE)
   {
      return (FALSE);
   }
   else
   {
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
   }
""}"")


/* ---------------------------------------------------------------------
Bewegungsswitch
*/
define(""{""LG_SWITCHBEW""}"",""{""
   l_bewid_aus = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
   l_bewid_ein = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
   l_Sql_String = "BEGIN abewto.switchbew('" || l_bewid_aus || "', \
            '" || l_bewid_ein || "'); END;";

   @print( l_Sql_String );

   if (@SqlImmediate(l_Sql_String) == FALSE)
   {
      return (FALSE);
   }
   else
   {
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
   }
""}"")

/* ---------------------------------------------------------------------
Bewegungssplit
*/
define(""{""LG_SPLITBEW""}"",""{""
   l_bewid     = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
   l_menge     = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
    l_vepid     = ifelse($3,,"",_ref(""{""""{""$3""}""""}""));
    BEWID_NEU = "";

   if (@SqlImmediate( "SELECT SUBSTR( aglo.get_newid(), 1, 50) FROM DUAL INTO :BEWID_NEU") == FALSE)
   {
      return (FALSE);
   }

	@print(@sprintf(@nls_gettext_x("li_lg.lg_splitbew.bewid_neu")));

   l_Sql_String = "BEGIN abewto.bew_split_li( \
               '" || l_bewid     || "', \
            '" || BEWID_NEU   || "', \
            '" || l_menge     || "', \
            '" || l_vepid     || "'); END;";

   @print( l_Sql_String );

   if (@SqlImmediate(l_Sql_String) == FALSE)
   {
      return (FALSE);
   }
   else
   {
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
   }
""}"")


/* ---------------------------------------------------------------------
Generieren von Fixplatzvarianten
*/
define(""{""AGEN_FPV""}"",""{""
   l_bez     = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
   l_lveid   = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
   l_von     = ifelse($3,,"",_ref(""{""""{""$3""}""""}""));
   l_bis     = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));
   l_sperre  = ifelse($5,"Y",1,0);
   FPVID_NEU = "";
   RC        = 0;
   RCTEXT    = "";
   RCCLASS   = "";

	@print(@nls_gettext_x("li_lg.agen_fpv.msg_start"));
	@print(@nls_gettext_x("li_lg.agen_fpv.legende"));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpv.par_start")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpv.par_lveid")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpv.par_bez")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpv.par_von")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpv.par_bis")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpv.par_sperre")));
	@print(@nls_gettext_x("li_lg.agen_fpv.par_ende"));
   @print( " -- -- -- " );


   if (@SqlImmediate( "SELECT SUBSTR( aglo.get_newid(), 1, 50) FROM DUAL INTO :FPVID_NEU") == FALSE)
   {
		@print(@sprintf(@nls_gettext_x("li_lg.agen_fpv.error")));
      return (FALSE);
   }
   else
   {
		@print(@sprintf(@nls_gettext_x("li_lg.agen_fpv.fpvid_neu")));
   }
      
   l_Sql_String = " \
      BEGIN  afpl.ins_afpv_li ('" || \
                 FPVID_NEU || "', '" || \
                 l_lveid   || "', '" || \
                 l_bez     || "', '" || \
                 l_von     || "','"  || \
                 l_bis     || "',"   || \
                 l_sperre  || "); END;";  
      
   
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
   else
   {
      if ( @getwert(ZZTEST) == "Y" )
      {
         @print( "  ---------------------------------------------------------------------------------" );
         @print( "  RC      [" || @getwert(RC)      || "]" );
         @print( "  RCTEXT  [" || @getwert(RCTEXT)  || "]" );
         @print( "  RCCLASS [" || @getwert(RCCLASS) || "]" );
         @print( "  ---------------------------------------------------------------------------------" );
			@print(@nls_gettext_x("li_lg.agen_fpv.msg_ende"));
      }
   }

   if ( @getwert(RC) != 0 )
   {
		@abort(@sprintf(@nls_gettext_x("li_lg.agen_fpv.msg_abort")));
   }  
      
""}"")

define(""{""AGEN_FPVE""}"",""{""
	@print(@nls_gettext_x("li_lg.agen_fpve.msg_ende"));
/* @restore_vars();*/
""}"")


/* ---------------------------------------------------------------------
Generieren von Fixplatzzuordnungen
*/

define(""{""AGEN_FPL""}"",""{""
  
  l_artid     = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
  l_ord       = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
  l_lorid     = ifelse($3,,"",_ref(""{""""{""$3""}""""}""));
  l_lbeid     = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));
  l_lplid     = ifelse($5,,"",_ref(""{""""{""$5""}""""}""));
  l_min       = ifelse($6,,"",_ref(""{""""{""$6""}""""}""));
  l_max       = ifelse($7,,"",_ref(""{""""{""$7""}""""}""));
  l_vepid     = ifelse($8,,"",_ref(""{""""{""$8""}""""}""));
  l_palausl   = ifelse($9,,"",_ref(""{""""{""$9""}""""}""));
  
  l_kz_ueberf = ifelse($10,,"",_ref(""{""""{""$10""}""""}"")); /* 0-nein; 1-ja; 2-genau; 3-nein,gebinderein*/
  l_sperre    = ifelse($11,"Y",1,0);
  l_grup1     = ifelse($12,,"",_ref(""{""""{""$12""}""""}""));
  l_grup2     = ifelse($13,,"",_ref(""{""""{""$13""}""""}""));
  
  l_action = 1; /* 1=insert, 2=Update, 3=delete */
  FPLID_NEU = "";
  
  RC        = 0;
  RCTEXT    = "";
  RCCLASS   = "";
   
   
	@print(@nls_gettext_x("li_lg.agen_fpl.msg_start"));
	@print(@nls_gettext_x("li_lg.agen_fpl.legende"));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.fpvid_neu")));
	@print(@nls_gettext_x("li_lg.agen_fpl.par_start"));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_fpvid_neu")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_artid")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_sort")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_lorid")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_lbeid")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_lplid")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_min")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_max")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_vepid")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_palausl")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_kz_ueberf")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_sperre")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_grup1")));
	@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.par_grup2")));
	@print(@nls_gettext_x("li_lg.agen_fpl.par_ende"));
   @print( " -- -- -- " );
   
   
   if (@SqlImmediate( "SELECT SUBSTR( aglo.get_newid(), 1, 50) FROM DUAL INTO :FPLID_NEU") == FALSE)
   {
		@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.error")));
      return (FALSE);
   }
   else
   {
		@print(@sprintf(@nls_gettext_x("li_lg.agen_fpl.fplid_neu")));
   }
   
   l_Sql_String = " \
      BEGIN afpl.afpl_liV2('" ||
                FPLID_NEU   || "', '" || \
                l_artid     || "',  " || \
                l_ord       || " , '" || \
                l_lorid     || "', '" || \
                l_lbeid     || "', '" || \
                l_lplid     || "',  " || \
                l_min       || " ,  " || \
                l_max       || " , '" || \
                l_vepid     || "',  " || \
                l_palausl   || " ,  " || \
                l_kz_ueberf || " , '" || \
                l_grup1     || "', '" || \
                l_grup2     || "',  " || \
                l_sperre    || " , '" || \
                FPVID_NEU   || "', " || \
                l_action    || ");   END;";
                 
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
   else
   {
      if ( @getwert(ZZTEST) == "Y" )
      {
         @print( "  ---------------------------------------------------------------------------------" );
         @print( "  RC      [" || @getwert(RC)      || "]" );
         @print( "  RCTEXT  [" || @getwert(RCTEXT)  || "]" );
         @print( "  RCCLASS [" || @getwert(RCCLASS) || "]" );
         @print( "  ---------------------------------------------------------------------------------" );
			@print(@nls_gettext_x("li_lg.agen_fpl.msg_ende"));
      }
   }

   if ( @getwert(RC) != 0 )
   {
		@abort(@sprintf(@nls_gettext_x("li_lg.agen_fpl.msg_abort")));
   }  
   FPLID = FPLID_NEU;
""}"")

/*************************************************************************
 LG-FPL Schleife fuer die Fixplatzdefinitionen (Zuordnungen) 
*/

define(""{""_FPL_VARS_LOOP""}"",  ""{""FPLID, FPL_ARTID, FPL_ORD, FPL_LORID, FPL_LBEID, \
                           FPL_LPLID, FPL_MIN, FPL_MAX, FPL_VEPID, \
                           FPL_PALAUSL, FPL_KZ_UEBERF, FPL_GRUP1, FPL_GRUP2, \
                           FPL_SPERRE, FPL_FPVID ""}"")
                           
define(""{""_FPL_VARS_SELECT""}"",""{""fpl_fplid, fpl_artid, fpl_ord, fpl_lorid, fpl_lbeid, \
                           fpl_lplid, fpl_min, fpl_max, fpl_vepid, \
                           fpl_palausl, fpl_kz_ueberf, fpl_grup1, fpl_grup2, \
                           decode(fpl_sperre,1,'Y','N'), fpl_fpvid ""}"")
                           
                           
define(""{""_FPL_VARS_INTO""}"",  ""{"":FPLID, :FPL_ARTID, :FPL_ORD, :FPL_LORID, :FPL_LBEID, \
                           :FPL_LPLID, :FPL_MIN, :FPL_MAX, :FPL_VEPID, \
                           :FPL_PALAUSL, :FPL_KZ_UEBERF, :FPL_GRUP1, :FPL_GRUP2, \
                           :FPL_SPERRE, :FPL_FPVID ""}"")
define(""{""_FPL_VARS_INIT""}"", ""{"" l_p_orderby_complete = l_p_orderby || @getwert(ZZORDERBY);
                           if (l_p_orderby_complete > "") { l_p_orderby_complete = " ORDER BY " || l_p_orderby_complete; }
""}"")

define(""{""_LOOP_VARS""}"", ""{""_FPL_VARS_LOOP""}"")


/*--------------------------------------------------------------*/

define(""{""_LOOP_SELECT""}"", ""{"""SELECT _FPL_VARS_SELECT  \
                         FROM afpa_fixpl_var_aktiv  \
                         WHERE  1 = 1   " \
                         || l_p_where || " \
                         " || l_p_orderby_complete || " \
                         INTO _FPL_VARS_INTO"""}"")

define(""{""_LOOP_NAME""}"",""{""LG" || "_FPL: Fixplatzdefinitionen""}"")
define(""{""LG_FPL""}"", ""{""_FPL_VARS_INIT""}"" _LOOP )


/*************************************************************************
   Inventurpositionen bearbeiten
*/

define(""{""AIPO_BEARB""}"",""{""
  
  
   l_ipoid           = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
   l_ieiid           = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
   l_lorid           = ifelse($3,,"",_ref(""{""""{""$3""}""""}""));
   l_lbeid           = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));
   l_lplid           = ifelse($5,,"",_ref(""{""""{""$5""}""""}""));
   l_art_lveid       = ifelse($6,,"",_ref(""{""""{""$6""}""""}""));
   l_artid           = ifelse($7,,"",_ref(""{""""{""$7""}""""}""));
   l_bestand         = ifelse($8,,"NULL",_ref(""{""""{""$8""}""""}""));
   l_sortnr          = ifelse($9,,"NULL",_ref(""{""""{""$9""}""""}""));
   l_vepid           = ifelse($10,,"",_ref(""{""""{""$10""}""""}""));
   l_grup1           = ifelse($11,,"",_ref(""{""""{""$11""}""""}""));
   l_grup2           = ifelse($12,,"",_ref(""{""""{""$12""}""""}""));
   l_mark            = ifelse($13,,"",_ref(""{""""{""$13""}""""}""));
   l_adatum          = ifelse($14,,"",_ref(""{""""{""$14""}""""}""));
   l_lspid           = ifelse($15,,"",_ref(""{""""{""$15""}""""}""));
   l_prodat          = ifelse($16,,"",_ref(""{""""{""$16""}""""}""));
   l_collinr         = ifelse($17,,"",_ref(""{""""{""$17""}""""}""));
   l_adrid           = ifelse($18,,"NULL",_ref(""{""""{""$18""}""""}""));
   l_action          = ifelse($19,,0,_ref(""{""""{""$19""}""""}"")); /* 4=Pos-Bearb, 5=Neue Pos. */
   
   l_posnr           = "NULL";
   l_nr              = "NULL";
   l_bewid           = "";
   l_barcode         = "";
   l_sperre          = "NULL";   
   l_anbruch         = "NULL";
   l_strdat          = "";     
   l_platz           = "";
   l_brutto          = "NULL";
   l_sperrdat        = "";
   l_sperrgrund      = "";
   l_laenge          = "NULL";
   l_breite          = "NULL";
   l_hoehe           = "NULL";
   
   l_intern          = "NULL";
   
   l_reservnr        = "";
   l_lsnr            = "";
   l_ls_menge        = "NULL";
   l_wert            = "NULL";
   l_lor_bez         = "";
   l_lbe_bez         = "";
   l_lpl_bez         = "";
   
   l_art_nr          = "";
   l_art_agrid       = "";
   l_art_bez         = "";
   l_art_matchcode   = "";
   l_art_wgrid       = "";
   
  
   RC        = 0;
   RCTEXT    = "";
   RCCLASS   = "";
   
   
	@print(@nls_gettext_x("li_lg.aipo_bearb.msg_start"));
	@print(@nls_gettext_x("li_lg.aipo_bearb.legende"));
	@print(@nls_gettext_x("li_lg.aipo_bearb.par_start"));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_ipoid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_ieiid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_lorid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_lbeid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_lplid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_art_lveid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_artid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_bestand")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_vepid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_sortnr")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_grup1")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_grup2")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_mark")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_adatum")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_lspid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_prodat")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_collinr")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_adrid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.par_action")));
	@print(@nls_gettext_x("li_lg.aipo_bearb.par_ende"));
   @print( " -- -- -- " );
   
   
     /* ------------------------------------------------------------------------
      Parameter pruefen
   */
   if ((l_action != 4) & (l_action != 5) & (l_action != 6))
   {
		@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.err_action")));
      return (FALSE);
   }
   else
   {
      if ((l_action == 4) & (l_ipoid == ""))
      {
			@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.err_ipoid")));
         return (FALSE);
      }
   }
   
   if (l_lorid == "") 
   {
		@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.err_lorid")));
      return (FALSE);
   }
      
   if (l_lbeid == "") 
   {
		@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.err_lbeid")));
      return (FALSE);
   }
   
   if (l_lplid == "") 
   {
		@print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.err_lplid")));
      return (FALSE);
   }
/* --- fuer Inv Pos ohne Bestand muss l_bestand mind 0 sein --- */
   if (l_bestand == "") 
   {
      @print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.err_bestand")));
      return (FALSE);
   }

   if (l_bestand > 0) 
   {
	   if (l_art_lveid == "") 
	   {
	      @print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.err_art_lveid")));
      	return (FALSE);
	   }
	   
	   if (l_artid == "") 
	   {
	      @print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.err_artid")));
      	return (FALSE);
	   }
	   if (l_vepid == "") 
	   {
	      @print(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.err_vepid")));
      return (FALSE);
	   }
   }

   /* ------------------------------------------------------------------------
     Verarbeitung
   */
   
   l_Sql_String = " \
      BEGIN aipo.aipo_li('"     ||                
                l_ipoid         || "', '" || \
                l_ieiid         || "',  " || \
                l_posnr         || " ,  " || \
                l_nr            || " , '" || \
                l_bewid         || "', '" || \
                l_lorid         || "', '" || \
                l_lbeid         || "', '" || \
                l_lplid         || "', '" || \
                l_artid         || "', '" || \
                l_lspid         || "', '" || \
                l_barcode       || "',  " || \
                l_sperre        || " , '" || \
                l_adatum        || "',  " || \
                l_anbruch       || " , '" || \
                l_strdat        || "', '" || \
                l_prodat        || "', '" || \
                l_grup1         || "', '" || \
                l_grup2         || "', '" || \
                l_platz         || "',  " || \
                l_brutto        || " , '" || \
                l_mark          || "', '" || \
                l_sperrdat      || "', '" || \
                l_sperrgrund    || "',  " || \
                l_laenge        || " ,  " || \
                l_breite        || " ,  " || \
                l_hoehe         || " , '" || \
                l_collinr       || "',  " || \
                l_intern        || " ,  " || \
                l_adrid         || " , '" || \
                l_reservnr      || "', '" || \
                l_lsnr          || "',  " || \
                l_ls_menge      || " ,  " || \
                l_bestand       || " ,  " || \
                l_sortnr        || " , '" || \
                l_vepid         || "',  " || \
                l_wert          || " , '" || \
                l_lor_bez       || "', '" || \
                l_lbe_bez       || "', '" || \
                l_lpl_bez       || "', '" || \
                l_art_lveid     || "', '" || \
                l_art_nr        || "', '" || \
                l_art_agrid     || "', '" || \
                l_art_bez       || "', '" || \
                l_art_matchcode || "', '" || \
                l_art_wgrid     || "',  " || \
                l_action        || ");   END;";
       
   @print( l_Sql_String );
   
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
   else
   {
      if ( @getwert(ZZTEST) == "Y" )
      {
         @print( "  ---------------------------------------------------------------------------------" );
         @print( "  RC      [" || @getwert(RC)      || "]" );
         @print( "  RCTEXT  [" || @getwert(RCTEXT)  || "]" );
         @print( "  RCCLASS [" || @getwert(RCCLASS) || "]" );
         @print( "  ---------------------------------------------------------------------------------" );
			@print(@nls_gettext_x("li_lg.aipo_bearb.msg_ende"));
      }
   }

   if ( @getwert(RC) != 0 )
   {
		@abort(@sprintf(@nls_gettext_x("li_lg.aipo_bearb.abort")));
   }  
   
   /* neue IPOOD_SOLL holen. Wird aber momentan nicht benoetigt.
   else
   {
      if (l_action == 5)
      {
         if (@SqlImmediate( "SELECT MAX(ipo_ipoid)       \
                             FROM   aipo_inv_position \
                             WHERE  ipo_ieiid   = '" || l_ieiid      || "' \
                             AND    ipo_lplid   = '" || l_lplid      || "' \
                             AND    ipo_artid   = '" || l_artid      || "' \
                             AND    ipo_bestand = '" || l_bestand    || "' \
                             AND    ipo_vepid   = '" || l_vepid      || "' \
                             AND    ipo_grup1   = '" || l_grup1      || '" \
                             AND    ipo_grup2   = '" || l_grup2      || '" \
                             AND    ipo_mark    = '" || l_mark       || '" \
                             AND    ipo_adatum  = '" || l_adatum     || '" \
                             AND    ipo_lspid   = '" || l_lspid      || '" \
                             AND    ipo_prodat  = '" || l_prodat     || '" \
                             AND    ipo_collinr = '" || l_collinr    || '" \
                             AND    ipo_adrid   = '" || l_adrid      || '" \
                             AND    ipo_nr      = 0 \
                             INTO   :IPO_IPOID_SOLL" ) == FALSE)
         {
            return (FALSE);
         }  
      }
   }
   */
   
	@print(@nls_gettext_x("li_lg.aipo_bearb.msg_ende"));
   
""}"")
      

/* ---------------------------------------------------------------------
  Generieren von Prozesszeit-Eintraege
  ist ab Version 6.1 desupported und wird nicht mehr ausgeliefert.
  Format wird durch APRL_START, APRL_END und APRL_1 ersetzt.
*/

define(""{""APRL""}"",""{""
   /* 
      -----------------------------------------------------------------
      Variablen initialisierung 
      -----------------------------------------------------------------
   */
   l_prl_prdid       = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
   l_prl_bemerkung   = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
   l_start           = ifelse($3,,"",_ref(""{""""{""$3""}""""}""));
   l_end             = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));  
   l_prl_menge       = ifelse($5,,"NULL",_ref(""{""""{""$5""}""""}""));  
   l_prl_vepid       = ifelse($6,,"",_ref(""{""""{""$6""}""""}""));  
   l_prl_lspid       = ifelse($7,,"",_ref(""{""""{""$7""}""""}""));  
   l_prl_lplid       = ifelse($8,,"",_ref(""{""""{""$8""}""""}""));  
   l_prl_platz       = ifelse($9,,"",_ref(""{""""{""$9""}""""}""));  
   l_prl_barcode     = ifelse($10,,"",_ref(""{""""{""$10""}""""}""));
   l_prl_lveid       = ifelse($11,,"",_ref(""{""""{""$11""}""""}""));
   l_prl_bucid       = ifelse($12,,"",_ref(""{""""{""$12""}""""}""));
   l_prl_bpoid       = ifelse($13,,"",_ref(""{""""{""$13""}""""}""));
   l_prl_bewid       = ifelse($14,,"",_ref(""{""""{""$14""}""""}""));
   l_prl_artid       = ifelse($15,,"",_ref(""{""""{""$15""}""""}""));
   l_prl_bstid_alt   = ifelse($16,,"",_ref(""{""""{""$16""}""""}""));
   l_prl_bstid       = ifelse($17,,"",_ref(""{""""{""$17""}""""}""));
   l_prl_grup1       = ifelse($18,,"",_ref(""{""""{""$18""}""""}""));
   l_prl_grup2       = ifelse($19,,"",_ref(""{""""{""$19""}""""}""));
   l_prl_mark        = ifelse($20,,"",_ref(""{""""{""$20""}""""}""));
   l_prl_adatum      = ifelse($21,,"",_ref(""{""""{""$21""}""""}""));
   l_prl_collinr     = ifelse($22,,"",_ref(""{""""{""$22""}""""}""));
   l_codid           = "";
   
   /* -----------------------------------------------------------------
      Programmname ermitteln
   */
   
   /* Leider wird die Variable MODUL nicht richtig beffuellt. */
   l_codid           = @codid();
   
   l_sql_string = " \
      select SUBSTR ( ( lprg_kuerzel ), 1, 254 ) \
      from lkri_t_kriterium, lprg_t_programm, lver_version \
      where lkri_kriid(+) = lprg_kriid \
      and lprg_prgid(+) =  lver_prgid \
      and lver_codid = :l_codid into :l_prl_prog";
   
   if (@SqlImmediate( l_sql_string ) == FALSE)
   {
      @print( "  ---------------------------------------------------------------------------------" );
      @print(@nls_gettext_x("li_lg.aprl.error_modul_sel"));
      @print( "  ---------------------------------------------------------------------------------" );
   
      return (FALSE);
   }
   
   /* WMS-441 Prg-Info bei nicht ALLG-Modulen */
   l_prl_prog = l_prl_prog || " (" || l_codid || ")";
   
   /* -----------------------------------------------------------------
      User ermitteln
   */
   
   if (@gesetzt(USRID) == TRUE) { if (@getwert(USRID) > " ")
      { 
         l_prl_usrid = @getwert(USRID); 
      }
   }
  
   RC        = 0;
   RCTEXT    = "";
   RCCLASS   = "";
   @print( "  !!!!!!   **** FORMAT IS UNSUPPORTED **** !!!!!" );
   
	@print(@nls_gettext_x("li_lg.aprl.msg_start"));
	@print(@nls_gettext_x("li_lg.aprl.legende_start"));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_start")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_end")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_prdid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_prog")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bemerkung")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_menge")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_vepid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_lspid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_lplid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_platz")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_barcode")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_lveid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bucid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bpoid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bewid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_artid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bstid_alt")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bstid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_grup1")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_grup2")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_mark")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_adatum")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_collinr")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_usrid")));
	@print(@nls_gettext_x("li_lg.aprl.legende_end"));
	@print(@nls_gettext_x("li_lg.aprl.legende_exit"));
   
   /* 
      -----------------------------------------------------------------
      Verarbeitung
      -----------------------------------------------------------------
   */
   
   l_Sql_String = " \
      BEGIN aprl.log_verarb_li('" || \
          l_start          || "', '" || \
          l_end            || "', '" || \
          l_prl_prdid      || "', '" || \
          l_prl_prog       || "', '" || \
          l_prl_bemerkung  || "',  " || \
          l_prl_menge      || ",  '" || \
          l_prl_vepid      || "', '" || \
          l_prl_lspid      || "', '" || \
          l_prl_lplid      || "', '" || \
          l_prl_platz      || "', '" || \
          l_prl_barcode    || "', '" || \
          l_prl_lveid      || "', '" || \
          l_prl_bucid      || "', '" || \
          l_prl_bpoid      || "', '" || \
          l_prl_bewid      || "', '" || \
          l_prl_artid      || "', '" || \
          l_prl_bstid_alt  || "', '" || \
          l_prl_bstid      || "', '" || \
          l_prl_grup1      || "', '" || \
          l_prl_grup2      || "', '" || \
          l_prl_mark       || "', to_date('" || \
          l_prl_adatum     || "','YYYY.MM.DD'), '" || \
          l_prl_collinr    || "', '" || \
          l_prl_usrid      || "');   END;";
   
   @print( l_Sql_String );              
   
   if (@SqlImmediate(l_Sql_String) == FALSE)
   {
      return (FALSE);
   }
   
   /* PRL_PRLID und PRL_COUNT wird ermittelt */
   if (@SqlImmediate( "SELECT SUBSTR( aprl.get_current_prlid, 1 , 50 ) , \
                       aprl.get_current_count \
                       FROM DUAL INTO :PRLOG_PRLID, :PRLOG_COUNT" ) == FALSE)
   {
      return (FALSE);
   }
   else
   {
      @print( "  PRLOG_PRLID [" || @getwert(PRLOG_PRLID) || "] PRLOG_COUNT[" || @getwert(PRLOG_COUNT) || "]");
   }
   
   /*
      -----------------------------------------------------------------
      ERROR HANDLING
      -----------------------------------------------------------------
   */
   
   if (@SqlImmediate( "SELECT SGLO.get_errcode, \
                       SUBSTR( SGLO.get_errtext, 1 ,50 ), \
                       SUBSTR( SGLO.get_errclass, 1 ,50 ) \
                       FROM DUAL INTO :RC, :RCTEXT, :RCCLASS" ) == FALSE)
   {
      return (FALSE);
   }
   else
   {
      if ( @getwert(ZZTEST) == "Y" )
      {
         @print( "  ---------------------------------------------------------------------------------" );
         @print( "  RC      [" || @getwert(RC)      || "]" );
         @print( "  RCTEXT  [" || @getwert(RCTEXT)  || "]" );
         @print( "  RCCLASS [" || @getwert(RCCLASS) || "]" );
         @print( "  ---------------------------------------------------------------------------------" );
			@print(@nls_gettext_x("li_lg.aprl.msg_ende"));
      }
   }

   if ( @getwert(RC) != 0 )
   {
		@abort(@sprintf(@nls_gettext_x("li_lg.aprl.abort")));
   } 
""}"")


/* ---------------------------------------------------------------------
  Generieren von Prozesszeit-Eintraege = PRLog fuer Prozess (Start und Ende mit einem Aufruf)  
*/

define(""{""APRL_1""}"",""{""
   /* 
      -----------------------------------------------------------------
      Variablen initialisierung 
      -----------------------------------------------------------------
   */
   l_prl_prdid       = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
   l_prl_bemerkung   = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
   l_prl_menge       = ifelse($3,,"NULL",_ref(""{""""{""$3""}""""}""));
   l_prl_vepid       = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));  
   l_prl_lspid       = ifelse($5,,"",_ref(""{""""{""$5""}""""}""));  
   l_prl_lplid       = ifelse($6,,"",_ref(""{""""{""$6""}""""}""));  
   l_prl_platz       = ifelse($7,,"",_ref(""{""""{""$7""}""""}""));  
   l_prl_barcode     = ifelse($8,,"",_ref(""{""""{""$8""}""""}""));  
   l_prl_lveid       = ifelse($9,,"",_ref(""{""""{""$9""}""""}""));  
   l_prl_bucid       = ifelse($10,,"",_ref(""{""""{""$10""}""""}""));
   l_prl_bpoid       = ifelse($11,,"",_ref(""{""""{""$11""}""""}""));
   l_prl_bewid       = ifelse($12,,"",_ref(""{""""{""$12""}""""}""));
   l_prl_artid       = ifelse($13,,"",_ref(""{""""{""$13""}""""}""));
   l_prl_bstid_alt   = ifelse($14,,"",_ref(""{""""{""$14""}""""}""));
   l_prl_bstid       = ifelse($15,,"",_ref(""{""""{""$15""}""""}""));
   l_prl_grup1       = ifelse($16,,"",_ref(""{""""{""$16""}""""}""));
   l_prl_grup2       = ifelse($17,,"",_ref(""{""""{""$17""}""""}""));
   l_prl_mark        = ifelse($18,,"",_ref(""{""""{""$18""}""""}""));
   l_prl_adatum      = ifelse($19,,"",_ref(""{""""{""$19""}""""}""));
   l_prl_collinr     = ifelse($20,,"",_ref(""{""""{""$20""}""""}""));
   l_codid           = "";
   /* -----------------------------------------------------------------
      Programmname ermitteln
   */
   
   /* Leider wird die Variable MODUL nicht richtig beffuellt. */
   l_codid           = @codid();
   
   l_sql_string = " \
      select SUBSTR ( ( lprg_kuerzel ), 1, 254 ) \
      from lkri_t_kriterium, lprg_t_programm, lver_version \
      where lkri_kriid(+) = lprg_kriid \
      and lprg_prgid(+) =  lver_prgid \
      and lver_codid = :l_codid into :l_prl_prog";
   
   if (@SqlImmediate( l_sql_string ) == FALSE)
   {
      @print( "  ---------------------------------------------------------------------------------" );
      @print(@nls_gettext_x("li_lg.aprl.error_modul_sel"));
      @print( "  ---------------------------------------------------------------------------------" );
   
      return (FALSE);
   }
   
   /* WMS-441 Prg-Info bei nicht ALLG-Modulen */
   l_prl_prog = l_prl_prog || " (" || l_codid || ")";
   
   /* -----------------------------------------------------------------
      User ermitteln
   */
   
   if (@gesetzt(USRID) == TRUE) { if (@getwert(USRID) > " ")
      { 
         l_prl_usrid = @getwert(USRID); 
      }
   }
   
   RC        = 0;
   RCTEXT    = "";
   RCCLASS   = "";
   
   
	@print(@nls_gettext_x("li_lg.aprl_1.msg_start"));
	@print(@nls_gettext_x("li_lg.aprl.legende_start"));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_prdid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_prog")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bemerkung")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_menge")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_vepid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_lspid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_lplid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_platz")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_barcode")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_lveid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bucid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bpoid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bewid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_artid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bstid_alt")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bstid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_grup1")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_grup2")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_mark")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_adatum")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_collinr")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_usrid")));
	@print(@nls_gettext_x("li_lg.aprl.legende_end"));
	@print(@nls_gettext_x("li_lg.aprl.legende_exit"));
   
   /* 
      -----------------------------------------------------------------
      Verarbeitung
      -----------------------------------------------------------------
   */
   l_Sql_String = " \
      BEGIN aprl.log_at_once_li('" || \
          l_prl_prdid      || "', '" || \
          l_prl_prog       || "', '" || \
          l_prl_bemerkung  || "',  " || \
          l_prl_menge      || ",  '" || \
          l_prl_vepid      || "', '" || \
          l_prl_lspid      || "', '" || \
          l_prl_lplid      || "', '" || \
          l_prl_platz      || "', '" || \
          l_prl_barcode    || "', '" || \
          l_prl_lveid      || "', '" || \
          l_prl_bucid      || "', '" || \
          l_prl_bpoid      || "', '" || \
          l_prl_bewid      || "', '" || \
          l_prl_artid      || "', '" || \
          l_prl_bstid_alt  || "', '" || \
          l_prl_bstid      || "', '" || \
          l_prl_grup1      || "', '" || \
          l_prl_grup2      || "', '" || \
          l_prl_mark       || "', to_date('" || \
          l_prl_adatum     || "','YYYY.MM.DD'), '" || \
          l_prl_collinr    || "', '" || \
          l_prl_usrid      || "');   END;";
   
   @print( l_Sql_String );              
   
   if (@SqlImmediate(l_Sql_String) == FALSE)
   {
      return (FALSE);
   }
   
   /* PRLID und PRL_COUNT wird ermittelt */
   if (@SqlImmediate( "SELECT SUBSTR( aprl.get_current_prlid, 1 , 50 ) , \
                       aprl.get_current_count \
                       FROM DUAL INTO :PRLOG_PRLID, :PRLOG_COUNT" ) == FALSE)
   {
      return (FALSE);
   }
   else
   {
      @print( "  PRLOG_PRLID [" || @getwert(PRLOG_PRLID) || "] PRLOG_COUNT[" || @getwert(PRLOG_COUNT) || "]");
   }
   
   /*
      -----------------------------------------------------------------
      ERROR HANDLING
      -----------------------------------------------------------------
   */
      
   if (@SqlImmediate( "SELECT SGLO.get_errcode, \
                       SUBSTR( SGLO.get_errtext, 1 ,50 ), \
                       SUBSTR( SGLO.get_errclass, 1 ,50 ) \
                       FROM DUAL INTO :RC, :RCTEXT, :RCCLASS" ) == FALSE)
   {
      return (FALSE);
   }
   else
   {
      if ( @getwert(ZZTEST) == "Y" )
      {
         @print( "  ---------------------------------------------------------------------------------" );
         @print( "  RC      [" || @getwert(RC)      || "]" );
         @print( "  RCTEXT  [" || @getwert(RCTEXT)  || "]" );
         @print( "  RCCLASS [" || @getwert(RCCLASS) || "]" );
         @print( "  ---------------------------------------------------------------------------------" );
			@print(@nls_gettext_x("li_lg.aprl_1.msg_ende"));
      }
   }

   if ( @getwert(RC) != 0 )
   {
		@abort(@sprintf(@nls_gettext_x("li_lg.aprl.abort")));
   } 
""}"")



/* ---------------------------------------------------------------------
  Generieren von Prozesszeit-Eintraege = START PRLog fuer Prozess
  Erstellt der "Beginn-Satz" eines PRLogs
*/

define(""{""APRL_START""}"",""{""
   /* 
      -----------------------------------------------------------------
      Variablen initialisierung 
      -----------------------------------------------------------------
   */
   l_prl_prdid       = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
   l_prl_bemerkung   = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
   l_prl_menge       = ifelse($3,,"NULL",_ref(""{""""{""$3""}""""}""));
   l_prl_vepid       = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));  
   l_prl_lspid       = ifelse($5,,"",_ref(""{""""{""$5""}""""}""));  
   l_prl_lplid       = ifelse($6,,"",_ref(""{""""{""$6""}""""}""));  
   l_prl_platz       = ifelse($7,,"",_ref(""{""""{""$7""}""""}""));  
   l_prl_barcode     = ifelse($8,,"",_ref(""{""""{""$8""}""""}""));  
   l_prl_lveid       = ifelse($9,,"",_ref(""{""""{""$9""}""""}""));  
   l_prl_bucid       = ifelse($10,,"",_ref(""{""""{""$10""}""""}""));
   l_prl_bpoid       = ifelse($11,,"",_ref(""{""""{""$11""}""""}""));
   l_prl_bewid       = ifelse($12,,"",_ref(""{""""{""$12""}""""}""));
   l_prl_artid       = ifelse($13,,"",_ref(""{""""{""$13""}""""}""));
   l_prl_bstid_alt   = ifelse($14,,"",_ref(""{""""{""$14""}""""}""));
   l_prl_bstid       = ifelse($15,,"",_ref(""{""""{""$15""}""""}""));
   l_prl_grup1       = ifelse($16,,"",_ref(""{""""{""$16""}""""}""));
   l_prl_grup2       = ifelse($17,,"",_ref(""{""""{""$17""}""""}""));
   l_prl_mark        = ifelse($18,,"",_ref(""{""""{""$18""}""""}""));
   l_prl_adatum      = ifelse($19,,"",_ref(""{""""{""$19""}""""}""));
   l_prl_collinr     = ifelse($20,,"",_ref(""{""""{""$20""}""""}""));
   l_codid           = "";
   
   /* -----------------------------------------------------------------
      Programmname ermitteln
   */
   
   /* Leider wird die Variable MODUL nicht richtig beffuellt. */
   l_codid           = @codid();
   
   l_sql_string = " \
      select SUBSTR ( ( lprg_kuerzel ), 1, 254 ) \
      from lkri_t_kriterium, lprg_t_programm, lver_version \
      where lkri_kriid(+) = lprg_kriid \
      and lprg_prgid(+) =  lver_prgid \
      and lver_codid = :l_codid into :l_prl_prog";
   
   if (@SqlImmediate( l_sql_string ) == FALSE)
   {
      @print( "  ---------------------------------------------------------------------------------" );
      @print(@nls_gettext_x("li_lg.aprl.error_modul_sel"));
      @print( "  ---------------------------------------------------------------------------------" );
   
      return (FALSE);
   }
   
   /* WMS-441 Prg-Info bei nicht ALLG-Modulen */
   l_prl_prog = l_prl_prog || " (" || l_codid || ")";
   
   /* -----------------------------------------------------------------
      User ermitteln
   */
   
   if (@gesetzt(USRID) == TRUE) { if (@getwert(USRID) > " ")
      { 
         l_prl_usrid = @getwert(USRID); 
      }
   }
  
   RC        = 0;
   RCTEXT    = "";
   RCCLASS   = "";
   
   
	@print(@nls_gettext_x("li_lg.aprl_start.msg_start"));
	@print(@nls_gettext_x("li_lg.aprl.legende_start"));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_prdid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_prog")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bemerkung")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_menge")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_vepid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_lspid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_lplid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_platz")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_barcode")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_lveid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bucid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bpoid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bewid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_artid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bstid_alt")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bstid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_grup1")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_grup2")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_mark")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_adatum")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_collinr")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_usrid")));
	@print(@nls_gettext_x("li_lg.aprl.legende_end"));
	@print(@nls_gettext_x("li_lg.aprl.legende_exit"));
   
   /* 
      -----------------------------------------------------------------
      Verarbeitung
      -----------------------------------------------------------------
   */
   
   l_Sql_String = " \
      BEGIN aprl.log_start_li('" || \
          l_prl_prdid      || "', '" || \
          l_prl_prog       || "', '" || \
          l_prl_bemerkung  || "',  " || \
          l_prl_menge      || ",  '" || \
          l_prl_vepid      || "', '" || \
          l_prl_lspid      || "', '" || \
          l_prl_lplid      || "', '" || \
          l_prl_platz      || "', '" || \
          l_prl_barcode    || "', '" || \
          l_prl_lveid      || "', '" || \
          l_prl_bucid      || "', '" || \
          l_prl_bpoid      || "', '" || \
          l_prl_bewid      || "', '" || \
          l_prl_artid      || "', '" || \
          l_prl_bstid_alt  || "', '" || \
          l_prl_bstid      || "', '" || \
          l_prl_grup1      || "', '" || \
          l_prl_grup2      || "', '" || \
          l_prl_mark       || "', to_date('" || \
          l_prl_adatum     || "','YYYY.MM.DD'), '" || \
          l_prl_collinr    || "', '" || \
          l_prl_usrid      || "');   END;";
   
   @print( l_Sql_String );              
   
   if (@SqlImmediate(l_Sql_String) == FALSE)
   {
      return (FALSE);
   }
   
   /* PRLID und PRL_COUNT wird ermittelt */
   if (@SqlImmediate( "SELECT SUBSTR( aprl.get_current_prlid, 1 , 50 ) , \
                       aprl.get_current_count \
                       FROM DUAL INTO :PRLOG_PRLID, :PRLOG_COUNT" ) == FALSE)
   {
      return (FALSE);
   }
   else
   {
      @print( "  PRLOG_PRLID [" || @getwert(PRLOG_PRLID) || "] PRLOG_COUNT[" || @getwert(PRLOG_COUNT) || "]");
   }
   
   /*
      -----------------------------------------------------------------
      ERROR HANDLING
      -----------------------------------------------------------------
   */
   if (@SqlImmediate( "SELECT SGLO.get_errcode, \
                       SUBSTR( SGLO.get_errtext, 1 ,50 ), \
                       SUBSTR( SGLO.get_errclass, 1 ,50 ) \
                       FROM DUAL INTO :RC, :RCTEXT, :RCCLASS" ) == FALSE)
   {
      return (FALSE);
   }
   else
   {
      if ( @getwert(ZZTEST) == "Y" )
      {
         @print( "  ---------------------------------------------------------------------------------" );
         @print( "  RC      [" || @getwert(RC)      || "]" );
         @print( "  RCTEXT  [" || @getwert(RCTEXT)  || "]" );
         @print( "  RCCLASS [" || @getwert(RCCLASS) || "]" );
         @print( "  ---------------------------------------------------------------------------------" );
			@print(@nls_gettext_x("li_lg.aprl_start.msg_ende"));
      }
   }

   if ( @getwert(RC) != 0 )
   {
		@abort(@sprintf(@nls_gettext_x("li_lg.aprl.abort")));
   } 
""}"")



/* ---------------------------------------------------------------------
  Schliesst die Zeitmessung des Prozesses = Ende PRLog fuer Prozess  
*/

define(""{""APRL_END""}"",""{""
   /* 
      -----------------------------------------------------------------
      Variablen initialisierung 
      -----------------------------------------------------------------
   */
   l_prl_prdid       = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
   l_prl_bemerkung   = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
   l_prl_menge       = ifelse($3,,"NULL",_ref(""{""""{""$3""}""""}""));
   l_prl_vepid       = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));  
   l_prl_lspid       = ifelse($5,,"",_ref(""{""""{""$5""}""""}""));  
   l_prl_lplid       = ifelse($6,,"",_ref(""{""""{""$6""}""""}""));  
   l_prl_platz       = ifelse($7,,"",_ref(""{""""{""$7""}""""}""));  
   l_prl_barcode     = ifelse($8,,"",_ref(""{""""{""$8""}""""}""));  
   l_prl_lveid       = ifelse($9,,"",_ref(""{""""{""$9""}""""}""));  
   l_prl_bucid       = ifelse($10,,"",_ref(""{""""{""$10""}""""}""));
   l_prl_bpoid       = ifelse($11,,"",_ref(""{""""{""$11""}""""}""));
   l_prl_bewid       = ifelse($12,,"",_ref(""{""""{""$12""}""""}""));
   l_prl_artid       = ifelse($13,,"",_ref(""{""""{""$13""}""""}""));
   l_prl_bstid_alt   = ifelse($14,,"",_ref(""{""""{""$14""}""""}""));
   l_prl_bstid       = ifelse($15,,"",_ref(""{""""{""$15""}""""}""));
   l_prl_grup1       = ifelse($16,,"",_ref(""{""""{""$16""}""""}""));
   l_prl_grup2       = ifelse($17,,"",_ref(""{""""{""$17""}""""}""));
   l_prl_mark        = ifelse($18,,"",_ref(""{""""{""$18""}""""}""));
   l_prl_adatum      = ifelse($19,,"",_ref(""{""""{""$19""}""""}""));
   l_prl_collinr     = ifelse($20,,"",_ref(""{""""{""$20""}""""}""));
   l_codid           = "";
   
   /* -----------------------------------------------------------------
      Programmname ermitteln
   */
   
   /* Leider wird die Variable MODUL nicht richtig beffuellt. */
   l_codid           = @codid();
   
   l_sql_string = " \
      select SUBSTR ( ( lprg_kuerzel ), 1, 254 ) \
      from lkri_t_kriterium, lprg_t_programm, lver_version \
      where lkri_kriid(+) = lprg_kriid \
      and lprg_prgid(+) =  lver_prgid \
      and lver_codid = :l_codid into :l_prl_prog";
   
   if (@SqlImmediate( l_sql_string ) == FALSE)
   {
      @print( "  ---------------------------------------------------------------------------------" );
      @print(@nls_gettext_x("li_lg.aprl.error_modul_sel"));
      @print( "  ---------------------------------------------------------------------------------" );
   
      return (FALSE);
   }
   
   /* WMS-441 Prg-Info bei nicht ALLG-Modulen */
   l_prl_prog = l_prl_prog || " (" || l_codid || ")";
   
   /* -----------------------------------------------------------------
      User ermitteln
   */
   
   if (@gesetzt(USRID) == TRUE) { if (@getwert(USRID) > " ")
      { 
         l_prl_usrid = @getwert(USRID); 
      }
   }
   
   RC        = 0;
   RCTEXT    = "";
   RCCLASS   = "";
   
   
	@print(@nls_gettext_x("li_lg.aprl_end.msg_start"));
	@print(@nls_gettext_x("li_lg.aprl.legende_start"));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_prdid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_prog")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bemerkung")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_menge")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_vepid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_lspid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_lplid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_platz")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_barcode")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_lveid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bucid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bpoid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bewid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_artid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bstid_alt")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_bstid")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_grup1")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_grup2")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_mark")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_adatum")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_collinr")));
	@print(@sprintf(@nls_gettext_x("li_lg.aprl.par_usrid")));
	@print(@nls_gettext_x("li_lg.aprl.legende_end"));
	@print(@nls_gettext_x("li_lg.aprl.legende_exit"));
   
   /* 
      -----------------------------------------------------------------
      Verarbeitung
      -----------------------------------------------------------------
   */
   l_Sql_String = " \
      BEGIN aprl.log_end_li('" || \
          l_prl_prdid      || "', '" || \
          l_prl_prog       || "', '" || \
          l_prl_bemerkung  || "',  " || \
          l_prl_menge      || ",  '" || \
          l_prl_vepid      || "', '" || \
          l_prl_lspid      || "', '" || \
          l_prl_lplid      || "', '" || \
          l_prl_platz      || "', '" || \
          l_prl_barcode    || "', '" || \
          l_prl_lveid      || "', '" || \
          l_prl_bucid      || "', '" || \
          l_prl_bpoid      || "', '" || \
          l_prl_bewid      || "', '" || \
          l_prl_artid      || "', '" || \
          l_prl_bstid_alt  || "', '" || \
          l_prl_bstid      || "', '" || \
          l_prl_grup1      || "', '" || \
          l_prl_grup2      || "', '" || \
          l_prl_mark       || "', to_date('" || \
          l_prl_adatum     || "','YYYY.MM.DD'), '" || \
          l_prl_collinr    || "', '" || \
          l_prl_usrid      || "');   END;";
   
   @print( l_Sql_String );              
   
   if (@SqlImmediate(l_Sql_String) == FALSE)
   {
      return (FALSE);
   }
   
   /* PRLID und PRL_COUNT wird ermittelt */
   if (@SqlImmediate( "SELECT SUBSTR( aprl.get_current_prlid, 1 , 50 ) , \
                       aprl.get_current_count \
                       FROM DUAL INTO :PRLOG_PRLID, :PRLOG_COUNT" ) == FALSE)
   {
      return (FALSE);
   }
   else
   {
      @print( "  PRLOG_PRLID [" || @getwert(PRLOG_PRLID) || "] PRLOG_COUNT[" || @getwert(PRLOG_COUNT) || "]");
   }
   
   /*
      -----------------------------------------------------------------
      ERROR HANDLING
      -----------------------------------------------------------------
   */
   
   if (@SqlImmediate( "SELECT SGLO.get_errcode, \
                       SUBSTR( SGLO.get_errtext, 1 ,50 ), \
                       SUBSTR( SGLO.get_errclass, 1 ,50 ) \
                       FROM DUAL INTO :RC, :RCTEXT, :RCCLASS" ) == FALSE)
   {
      return (FALSE);
   }
   else
   {
      if ( @getwert(ZZTEST) == "Y" )
      {
         @print( "  ---------------------------------------------------------------------------------" );
         @print( "  RC      [" || @getwert(RC)      || "]" );
         @print( "  RCTEXT  [" || @getwert(RCTEXT)  || "]" );
         @print( "  RCCLASS [" || @getwert(RCCLASS) || "]" );
         @print( "  ---------------------------------------------------------------------------------" );
			@print(@nls_gettext_x("li_lg.aprl_end.msg_ende"));
      }
   }

   if ( @getwert(RC) != 0 )
   {
		@abort(@sprintf(@nls_gettext_x("li_lg.aprl.abort")));
   } 
""}"")



/* ---------------------------------------------------------------------
   Start neue WMS Abrechnung LBaseWMS-Invoice
*/

define(""{""START_AABR""}"",""{""
  
   l_abvid        = "";
   
   l_von_datum    = ifelse($1,,"",_ref(""{""""{""$1""}""""}""));
   l_bis_datum    = ifelse($2,,"",_ref(""{""""{""$2""}""""}""));
   l_vorp_datum   = ifelse($3,,"",_ref(""{""""{""$3""}""""}""));
   l_abdid        = ifelse($4,,"",_ref(""{""""{""$4""}""""}""));
   l_gen_la       = ifelse($5,,"",_ref(""{""""{""$5""}""""}""));
   
   
   l_tmp     = "x";
   RC        = 0;
   RCTEXT    = "";
   RCCLASS   = "";
   ABVID_NEU = "";
   
   @print(@nls_gettext_x("li_lg.start_aabr.msg_start"));
   @print(@nls_gettext_x("li_lg.start_aabr.legende_start"));
   @print(@nls_gettext_x("li_lg.start_aabr.par_start"));
   @print(@nls_gettext_x("li_lg.start_aabr.par_von_datum"));
   @print(@nls_gettext_x("li_lg.start_aabr.par_bis_datum"));
   @print(@nls_gettext_x("li_lg.start_aabr.par_vorp_datum"));
   @print(@nls_gettext_x("li_lg.start_aabr.par_abdid"));
   @print(@nls_gettext_x("li_lg.start_aabr.par_gen_la"));
   @print(@nls_gettext_x("li_lg.start_aabr.legende_end"));
   @print(@nls_gettext_x("li_lg.start_aabr.legende_exit"));
   
   
   if (@SqlImmediate( "SELECT SUBSTR(aabr.get_new_id(), 1, 50) FROM DUAL INTO :ABVID_NEU") == FALSE)
   {
      @print(@nls_gettext_x("li_lg.start_aabr.err_get_new_abvid"));
      return (FALSE);
   }
   else
   {
      @print(@nls_gettext_x("li_lg.start_aabr.new_abvid"));
   }
   
   l_Sql_String = " BEGIN aabr.start_abr_li('" || ABVID_NEU     \
               || "','" || LVEID \
               || "', to_date('" || l_von_datum   || "','YYYY.MM.DD')" \
               || " , to_date('" || l_bis_datum   || "','YYYY.MM.DD')" \
               || " , to_date('" || l_vorp_datum  || "','YYYY.MM.DD'),'" \
               || l_abdid       || "', " \
               || l_gen_la      || ");   END;";
   
   @print( "Stmt: " || l_Sql_String);
   
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
   else
   {
      if ( @getwert(ZZTEST) == "Y" )
      {
         @print( "  ---------------------------------------------------------------------------------" );
         @print( "  RC      [" || @getwert(RC)      || "]" );
         @print( "  RCTEXT  [" || @getwert(RCTEXT)  || "]" );
         @print( "  RCCLASS [" || @getwert(RCCLASS) || "]" );
         @print( "  ---------------------------------------------------------------------------------" );
         
      }
   }
   
   if ( @getwert(RC) != 0 )
   {
      @abort(@sprintf(@nls_gettext_x("li_lg.start_aabr.msg_abort")));
   }  
   ABVID = ABVID_NEU;
   @print(@nls_gettext_x("li_lg.start_aabr.msg_ende"));
   
""}"")




/* ---------------------------------------------------------------------
  Anlage Lagertransport fuer Auslagerungsbewegung
*/
define(""{""ATRP_F_AUSL""}"",""{""
   
   l_Sql_String = "BEGIN \
      atrp.gen_trp_f_ausl('"  || ifelse($1,,"",_ref(""{""""{""$1""}""""}"")) || "','" \
                              || ifelse($2,,"",_ref(""{""""{""$2""}""""}"")) || "','" \
                              || ifelse($3,,"",_ref(""{""""{""$3""}""""}"")) || "','" \
                              || ifelse($4,,"",_ref(""{""""{""$4""}""""}"")) || "'," \
                              || ifelse($5,,"NULL",ifelse($5,"Y","TRUE","FALSE")) || ");  \
      EXCEPTION \
         WHEN OTHERS THEN \
            IF SGLO.set_errcode( SQLCODE ) > 0 THEN NULL; END IF; \
      END;";
   
   @print( l_Sql_String );

   if (@SqlImmediate(l_Sql_String) == FALSE)
      {
         return (FALSE);
      }
      else
      {
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
      }
      

""}"")



/* ---------------------------------------------------------------------
  Anlage Lagertransport fuer Bestandsbewegung
*/
define(""{""ATRP_F_BEST""}"",""{""

   l_Sql_String = "\
      BEGIN \
      atrp.gen_trp_f_best('"  || ifelse($1,,"",_ref(""{""""{""$1""}""""}"")) || "','" \
                              || ifelse($2,,"",_ref(""{""""{""$2""}""""}"")) || "'," \
                              || ifelse($3,,"NULL",ifelse($3,"Y","TRUE","FALSE")) || ");  \
      EXCEPTION \
         WHEN OTHERS THEN \
            IF SGLO.set_errcode( SQLCODE ) > 0 THEN NULL; END IF; \
      END;";

   @print( l_Sql_String );

   if (@SqlImmediate(l_Sql_String) == FALSE)
      {
         return (FALSE);
      }
      else
      {
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
      }
""}"")



/* ---------------------------------------------------------------------
  Bestandsmodifikation
*/
define(""{""AUMS""}"",""{""


   l_mengeaus =  ifelse($15,,"",_ref(""{""""{""$15""}""""}""));
   l_mengeein =  ifelse($17,,"",_ref(""{""""{""$17""}""""}""));
   


   l_Sql_String = "\
      BEGIN \
      aums.ums_li('" || ifelse($1,,"",_ref(""{""""{""$1""}""""}"")) || "','" \
                  || ifelse($2,,"",_ref(""{""""{""$2""}""""}"")) || "','" \
                  || ifelse($3,,"",_ref(""{""""{""$3""}""""}"")) || "','" \
                  || ifelse($5,,"",_ref(""{""""{""$5""}""""}"")) || "','" \
                  || ifelse($24,,"",_ref(""{""""{""$24""}""""}"")) || "','" \
                  || ifelse($6,,"",_ref(""{""""{""$6""}""""}"")) || "','" \
                  || ifelse($4,,"",_ref(""{""""{""$4""}""""}"")) || "','" \
                  || ifelse($25,,"",_ref(""{""""{""$25""}""""}"")) || "','" \
                  || ifelse($7,,"",_ref(""{""""{""$7""}""""}"")) || "','" \
                  || ifelse($8,,"",_ref(""{""""{""$8""}""""}"")) || "','" \
                  || ifelse($9,,"",_ref(""{""""{""$9""}""""}"")) || "','" \
                  || ifelse($10,,"",_ref(""{""""{""$10""}""""}"")) || "','" \
                  || ifelse($11,,"",_ref(""{""""{""$11""}""""}"")) || "','" \
                  || ifelse($12,,"",_ref(""{""""{""$12""}""""}"")) || "','" \
                  || ifelse($13,,"",_ref(""{""""{""$13""}""""}"")) || "','" \
                  || ifelse($14,,"",_ref(""{""""{""$14""}""""}"")) || "',";
   if (l_mengeaus == "")
      { l_Sql_String = l_Sql_String || "NULL"; }
   else { l_Sql_String = l_Sql_String || l_mengeaus; }
   
   l_Sql_String = l_Sql_String || ",'" \
                  || ifelse($16,,"",_ref(""{""""{""$16""}""""}"")) || "',";
                  
   if (l_mengeein == "")
      { l_Sql_String = l_Sql_String || "NULL"; }
   else { l_Sql_String = l_Sql_String || l_mengeein; }
                  
   l_Sql_String = l_Sql_String || ",'" \
                  || ifelse($18,,"",_ref(""{""""{""$18""}""""}"")) || "','" \
                  || ifelse($19,,"",_ref(""{""""{""$19""}""""}"")) || "','" \
                  || ifelse($20,,"",_ref(""{""""{""$20""}""""}"")) || "','" \
                  || ifelse($21,,"",_ref(""{""""{""$21""}""""}"")) || "','" \
                  || ifelse($22,,"",_ref(""{""""{""$22""}""""}"")) || "','" \
                  || ifelse($23,,"",_ref(""{""""{""$23""}""""}"")) || "'" \
                  || ");  \
      EXCEPTION \
         WHEN OTHERS THEN \
            IF SGLO.set_errcode( SQLCODE ) > 0 THEN NULL; END IF; \
      END;";

   @print( l_Sql_String );

   if (@SqlImmediate(l_Sql_String) == FALSE)
      {
         return (FALSE);
      }
      else
      {
         if (@SqlImmediate( "SELECT SGLO.get_errcode, \
                             SUBSTR( SGLO.get_errtext, 1 ,50 ), \
                             SUBSTR( SGLO.get_errclass, 1 ,50 ), \
                             aums.get_bucid_ein, aums.get_bucid_aus, aums.get_bucid_uml \
                             FROM DUAL \
                             INTO :RC, :RCTEXT, :RCCLASS, :BUCID_UMS_EIN, :BUCID_UMS_AUS, :BUCID_UMS_UML" ) == FALSE)
            {
               return (FALSE);
            }

         @print( "RC     ->" || @getwert(RC)      || "<-" );
         @print( "RCTEXT ->" || @getwert(RCTEXT)  || "<-" );
         @print( "RCCLASS->" || @getwert(RCCLASS) || "<-" );
         
         @print( "----------------------------------" );
         @print( "BUCID_UMS_EIN (" || @getwert(BUCID_UMS_EIN) || ")" );
         @print( "BUCID_UMS_AUS (" || @getwert(BUCID_UMS_AUS) || ")" );
         @print( "BUCID_UMS_UML (" || @getwert(BUCID_UMS_UML) || ")" );
         @print( "----------------------------------" );
      }
""}"")


