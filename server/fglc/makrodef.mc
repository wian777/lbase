divert(-1)
changequote(`,´)
changecom(/*,*/)
/* mit `divert´(-1) wird verhindert, dass die Kommentare aus dieser Datei  */
/* in die Ausgabe-Datei kopiert werden                                  */

/* Fuer jede Bibliothek muessen vier Makros definiert sein:               
 Muster SPC

#define SPC_INIT
#define SPC_END
#define SPC_STB_INIT
#define SPC_STB_END START

*/

/*
   30.10.96 REWI Sendungschleifen um Kostentraegerfelder ergaenzt
   12.12.96 REWI Abrechnungs-Initialisierung beim 1. Spesencode und
                 am Offert-Ende, falls kein Spesencode im Offert vorkommt
   03.12.97 WOSC STATUS_LA_ABSCH STATUS_SDG_FAR auskommentiert
   09.12.97 REWI Abrechnungs-Initialisierung Firma  in fa_init.m4 uebernommen
   06.02.98 ROMO Lesen und Setzen von Zusatzattributen der Lagervereinbarung
   20.02.98 ROMO Lesen und Setzen von Zusatzattributen des Artikel
   29.03.98 REWI Schleife SDG-ADRID ergaenzt
   13.05.98 WOSC SZUSATZ 4 Parameter (Key)  als Konstante und Variable
   14.05.98 WOSC SZUSATZ um Fahrt erweitert
   14.05.98 WOSC LZUSATZ 4 Parameter (Key)  als Konstante und Variable
   14.05.98 WOSC LZUSATZ um Fahrt erweitert
   14.05.98 WOSC LZUSATZ "ADRID" zu ADRID
   29.09.98 WOSC AUSWDIALOGSTART ZZAUSWTXT gesetzt
   29.09.98 WOSC Schleife VKM-FAHRT erweitert
   09.11.98 REWI allgemeine Schleife erweitert
   19.11.98 REWI Schleife ueber Ladelistentrennkennzeichen
   01.12.98 WOSC Initialisierungen fuer Dispostionsbibliothek
   24.01.99 REWI Bibliothek SDG_DFUE neu ergaenzt
   25.02.99 REWI Schleife SDG_AB_ID ergaenzt - alle Sendungen der Abteilung
                 Sendungsschleife SDG_DATUM zuruecksetzen
   26.03.99 REWI aufruf SDG_CHECK in LA_SDG_INIT integriert
                 (siehe include la_sdg_check.mc)
   27.04.99 REWI Setzen Entfernungswerk
   02.05.99 REWI UEBCODE in Sendungsschleife aufgenommen
   05.05.99 REWI Aenderung Setzen Distanz (km)
   07.05.99 REWI Kommentarblock jetzt als false-Entscheidung
   18.05.99 WOSC kunden.mc
   27.06.99 REWI neue Schleife ABR-ZEILEN-LA
   27.07.99 ROMO Zusatzattribute zur Buchungsposition lesen/setzen
   09.08.99 REWI Zeitberechnungsfunktionen ADD_ZEIT, DIFF_ZEIT, WOCHEN_TAG
   19.10.99 REWI Schleife ueber Lademittelbewegungen ergaenzt
   04.11.99 WOSC Schleife VKM-FAHRT mit datvon,datbis,ladeschluss ergaenzt
   04.11.99 WOSC Schleife STOPS-FAHRT mit datwunb ergaenzt
   05.11.99 REWI Schleife ADR-KL-LAND um REGION erweitert
   17.11.99 ROSA Schleife ADR-KL-LAND sortiert nach adr_sort
   21.12.99 WOSC Erweitern LZUSATZ,SZUSATZ um ADR,VKM,LAF
   22.12.99 REWI Abrechnungsinitialisierung am Ende des Offerts
   07.01.00 REWI Sendungsvorgabe Beschreibungszeile LANGE, BREITE, HOEHE
                 kann jetzt auch mit ! erfasst werden
   11.01.00 REWI Korrektur Lademittelschleifen
   24.02.00 WOSC FAHRTEN_AG_ID ergaenzt um K_Variablen
   05.04.00 REWI Aenderung Sendungs-Datum in Sdg-Schleifen
                 Erweiterung Abrechnungszeilenschleife mit KD_WRGID, KD_BETRAG
   07.04.00 REWI neue Schleife LA_AG_ID_OFFEN
                 - alle offenen LAs einer Arbeitsgruppe
                 neue Schleife LA_AG_ID_ALLE
                 - alle offenen LAs DATUM_VON - DATUM_BIS
   21.04.00 REWI Schleifen - Sortierung und Weitere Where-Bedingungen
   27.04.00 REWI ZZWHERE als zusaetzliche Where-Bedingung fuer LOOPS
   28.04.00 JOHI Debug-LOG ENT-Makro (_ent2) mittels LI-Funktion @if()
   02.05.00 REWI Korrektur Entscheidung bei @xmatch (Konvertierungs-Fehler)
   22.05.00 REWI Allgemeine Schleife ohne SQL-Aufruf von 2048 auf 10000 durchlaeufe
   07.07.00 REWI LA-Schleifen: PRIORITAET ergaenzt
   07.07.00 REWI VKM-Schleife VKM-AG_ID ergaenzt
   04.09.00 REWI Tagespreisformat eingebaut
   15.09.00 REWI Korrektur Tagespreisformat bei Angabe Leistungsdatum
   15.09.00 REWI Funktion _ref erweitert, so dass negative Konstanten
                 in die Berechnung (0-Zahl) umgewandelt werden.
   05.10.00 REWI Loeschen Zusatzattribute bei Update mit ""
   12.10.00 REWI Korrektur Tagespreisformat Leistungsdatum wurde ignoriert
   21.10.00 REWI Erweiterung Fahrtschleifen um ADRID_FR
   21.01.01 REWI neue Schleife PLZ_ORT
   21.02.01 ROMO Bibliothek LAGERARTIKEL angelegt
   08.04.01 REWI ZEILE_VEPKBEZ in Sendungsbeschreibungszeilenschleife zuruecks.
   13.05.01 REWI neues Format Feldinhalte sichern und ruecksetzen
   23.06.01 REWI Sortierung Sendungen nach Land, PLZ, ORT, NAME
   28.06.01 REWI Sortierung Sendungen nach Land, PLZ, ORT, NAME weiter Schleifen
   10.07.01 REWI Sortierung korrigiert fuer Schleif SDG-LDG-A und SDG-LDG-U
   30.07.01 REWI FAR-VARS-Select korrigiert (Schleife FAHRTEN_AG_ID)
   09.08.01 ROMO Format DBPRUEF aufgenommen
   09.08.01 ROMO Format DBPRUEF um BUCID, BUC_NR und AGRID erweitert
   09.08.01 ROSA neue Bib. SDG_ALLG
   05.09.01 REWI Format Sprachtext ergaenzt mit Uebersetzung (setzt Variable l_lbl_...)
   20.09.01 REWI Waehrungscode - im Berechnungselement entfernen
   20.10.01 ROMO neue Bib. UEBERS_ALLG
   19.11.01 REWI Weiterschalten Adresse - Adress-Id ohne addhk, damit Variable
                 angegeben werden kann
   25.11.01 REWI Teil um Parameter fuer Blank abschneiden erweitert
   25.11.01 REWI neue Wherebedingung W_SDG_LDG_x_SDGADR fuer Einschraenkung
                 nach Sendungsadresstyp SDGADRTYP und Adresse=Adrid
   25.11.01 REWI neue Sortierung nach Matchcode S_SDG_LDG_x_MATCH
   27.11.01 REWI Fehlerkorrektur bei Weiterschalten Adresse sein 19.11.01
   28.11.01 WOSC Schleife Adressklassen -gruppen zu einer Adresse
   05.12.01 WOSC LZUSATZ,SZUSATZ Kostenstelle-Relationszuordnung
   24.02.02 REWI addcr bei Spesencode im Spesencodeformat entfernt @sp_code
   12.03.02 ROMO Setzen Feld mit Textersatz um Format-Parameter erweitert
   13.03.02 STMO Format NUMM_NEU fuer Nummernkreisermittlung erstellt
   14.03.02 REWI Verkehrsmittelkennzeichen in POS-STAPEL-Schleife ergaenzt
   19.03.02 STMO Format LZONE fuer Zonenermittlung erstellt
   21.03.02 REWI neue Schleife LA-BELEG - Alle LAs zu einem Beleg
   31.03.02 REWI Einschraenkungen zu LA-Schleifen
   01.04.02 REWI Ergaenzung Format INKLU mit Parameter
                 Ergaenzung Allg. Modul und Loops mit Parameter
   06.05.02 STMO Format NUMM_NEU mit Parameter Hierarchie an Stelle 5 ergaenzt
   10.05.02 REWI Format Setzen Feld mit Textersatz gekuerzt, wenn ohne Format
   10.05.02 REWI Bei Labels sprintf ergaenzt
   15.05.02 RUNE l_p_where bei folgenden Schleifen ergaenzt: LA_SDGEN_FA, LA_SDG,
                 ADRESS_SDG, SDG_BESCH_G, SDG_BESCH_C, SDG_BESCH_V, SDG_BESCH_A
   17.06.02 RUNE l_p_where ergaenzt in: FAHRTEN_AG_ID
   21.06.02 MASR pos_verarb1 = '0' durch 1=1 bei Scan-Schleife ersetzt
   09.07.02 RUNE neue Variable ADR_SPERRE (Y/N) in Ladresse eingebaut
   22.07.02 REWI where-Bedinung zu LA-Schleife korrigiert W_LATID_LA_AG_ID_ALLE_
   23.07.02 REWI Bei Labels sprintf ergaenzt - 2. Versuch
   24.07.02 RUNE in Sendungsschleifen SDG_GEFG, SDG_ERFDAT eingebaut
   27.09.02 HEMO ZEILE_GEWFPF, ZEILE_LVEID, ZEILE_ARTNR, ZEILE_ARTID, ZEILE_FGSTNR eingebaut
   03.10.02 RUNE LADATANF, LADATERL in LA_Loops ergaenzt
   11.10.02 REWI Sprachtextzeile auf cpp-Makro umgestellt, damit kommas keine Probleme machen
   11.10.02 REWI Abrechnungszeilen-Schleife reset_vars korrigiert
   29.01.03 REWI VKM-AG_ID-Schleife um VKM_FAHRER und VKM_ORGIDK ergaenzt
   31.01.03 REWI LFD_SEKTION mit @getwert (!) behandeln
   15.02.03 VACH Schleife ORG_PRO_FIRMA
   24.04.03 VACH Format DISTANZ mit einem Mautfeld erweitert
   07.05.03 JOHI Prozentvergleich indirekt aktiviert
                 ZUFELD1A="68%"; Vergleich PLZ mit ZUFELD1A
		 setzt LI-Version mindestens 02/01/18 Engine 1.0.0.65 voraus.
   14.05.03 VACH DISTANZ wenn Maut nicht gesetzt ist, kein Fehler beim Compilieren
   15.05.03 JOHI Prozentvergleich indirekt aktiviert, auch fuer ungleich
   31.07.03 STMO Schleife Verkehrsmittel der Arbeitsgruppe auf von-bis Datum (Sysdate) erweitert
   30.10.03 WEKL Formate fuer Mehrfachdialog eingebaut. ACHTUNG: LI_BAS32.dll muss vom Release 3.14 sein
   30.10.03 JOHI Prozentvergleich indirekt wieder deaktiviert. ( _ent2 ) 
   29.10.03 MAVO Schleife CONSOL-FLUEGE fuer Luftfracht ergaenzt (Parameter DATUM_VON DATUM_BIS)
   02.11.03 HEMO ZEILE_LFNR wegen Abwaertskompatibilitaet wieder implementiert
   05.11.03 WEKL Fehleingabe bei Flag in MFD_SETZEN wird abgefangen (NUR M ODER O sind erlaubt) 
   10.11.03 WEKL Bei Fragetext ist eine Variable mit ! erlaubt, deshalb Funkitonsaufruf mit _ref
	19.11.03 ROMO Schleife CONSOL-FLUEGE war mitten in Sendungsschleifen
	02.12.03 WEKL LZUSATZ und SZUSATZ um Kundenadressen erweitert
	08.12.03 ROMO Variablen fuer WMS-Felder in Sendungsbeschreibungs-Schleife
   15.12.03 MAVO Schleife SCOF_CONSFLUG um COF_ZUSATZ ergaenzt
   13.01.04 ROMO Format LADRESSE erweitert um Parameter fuer Lesen von Kundenadr.
	14.01.04 ROMO Schleife fuer Zusatzattribute - Stammdaten (ATT_STD) eingefuegt
	              Schleife fuer Zusatzattribute zur Sendung (ATT_SDG) eingefuegt
	              Schleife fuer Zusatzattribute zur SDB (ATT_SDB) eingefuegt
	              Schleife fuer Zusatzattribute zur Fahrt (ATT_FAR) eingefuegt
	              Schleife fuer Zusatzattribute zur Adresse (ATT_ADR) eingefuegt
	15.01.04 ROMO Schleife fuer Zustellfenster (ZFP_ADR) eingefuegt
	16.01.04 WEKL Format LZUSATZ UND SZUSATZ bei den Kundenadressen von ADA auf ADU geaendert
	18.01.04 WOSC Schleife GEN-SPALTE 
	25.01.04 ROMO Fehler in ZFP-ADR korrigiert
					  Fehler in LADRESSE korrigiert
	01.02.04 ROMO ZFP-ADR erweitert (Zeitfenster ueber Datumsgrenze)
	05.02.04 WEKL MFD_SETZEN, Vorschlag auch mit "!" gueltig
	23.02.04 ROMO neuer Parameter "dynfeld" fuer MFD_SETZEN
	              neue Bibliothek SDG_START
					  neue Formate LOCK% fuer Bibliothek SDG_START
   04.03.04 WEKL LADRESSE um ADR_ILN1 und ADR_ILN2 erweitert
	10.03.04 WEKL VORGABE_BESCH um ZEILE_PLOMBENR erweitert
	12.03.04 ROMO Format SFELDI erstellt
	30.04.04 ROMO Formate fuer MFD umgestellt (Textparameter analog zu Setzen
	              Feld mit Textersatz) - ISSUE 2934
        12,05,04 MAVO Format LZONE erweitert
	12.05.04 WOSC Tagespreise erweitert um Parameter Hinzufuegen zusaetzliche Abrechnungszeile 
	25.05.04 JOHI Parameter XFlag (Mustervergleich ja/nein) fuer Entscheidungen
	15.06.04 ROMO Formate fuer Hinweistextbehandlung
	02.07.04 ROMO neue Schleife fuer Hinweistexte der Gruppe (HWT_STD_GRP)
	09.07.04 ROMO neue Formate LOCKATT und VORGABE_ATT
	04.09.04 ROMO Formate LOCKATT korrigiert
	08.09.04 ROSA Schleife VKM-Fahrt erweitert ISSUE 748
	08.09.04 ROSA Schleife VKM-Sendungsanlagen erweitern um SAN_BEZ und SAN_BNR
	16.12.04 MAVO Schleife _FARSDG auf Hinweis rune / Statment wegen Performance umgebaut
	"laf_farid = :FARID" mit "sxtr.get_farid_haupt(laf_sdgid) = laf_farid" tauschen
	11.01.05 WEKL Schleife ZFP_ADR - Uhrzeit von 10:00 auf 10.00 umgestellt
	24.01.05 GEKL/BEEL Schleife SDG_AB_ID um ZZWHERE l_p_where erweitert
	28.01.05 ANHE Erweiterungen der Variablen ZEILEG unter SDB_VARS_RESET
	10.02.05 JOHI Berechnungs-Element: Tarifname auch aus Variable
	09.03.05 MAVO GEN-TAB Schleife Generische Daten
	07.04.05 WEKL ZFP_ADR Schleife auf NLS_TERRITORY=GERMANY angepasst fuer Serveraufruf
	12.10.05 MAVO neues Format DISTANZ_MG (Issue 10164) fuer die Komunikation mit INet-Server
	14.11.05 MAVO l_p_where bei folgenden Schleifen ergaenzt: LA_FAHRT_ALLE, LA_FAHRT
	15.12.05 DAFA Format SIM_LOOP eingefuegt
	30.01.06 WEKL MFD_SETZEN angepasst auf die neuen Parameter
	31.01.06 DAFA SIM_LOOP auf lokalen Kontext (Variablen) umgestellt
	31.01.06 WEKL MFD_SETZEN --> neue Parameter wieder rausgenommen
        31.01.06 WEKL MFD_SETZEN_ERW --> neue Parameter in neues Format gepackt
	21.02.06 MAVO Issue 12009 --> Schleife GEN-TAB auf native Tabellen erweitert
	10.04.06 ROMO Zusatzattribute auf Stop-Ebene
	24.04.06 MAVO Issue 12353 --> SDG_SPLIT_INIT ergaenzt
	03.05.06 MAVO Issue 12353 --> Schleife SSPL-LOOP fuer Sendungssplitt 
	31.05.06 WEKL Issue 12941 --> Schleife der Lademittel befuellt jetzt auch die LADID
        09.08.06 ANHE Issue 12321 --> SEWK-Aufruf ueberarbeitet
	19.10.06 DAFA Format SIM_LOOP um sim_key_orig erweitert
	14.03.07 ANKR Issue 12569: Erweiterungen div. Schleifen um l_p_where 
	12.04.07 ROMO [15111] Korrektur Tippfehler in Schleife SDG_BESCH_G
	20.04.07 ANKR Issue 14733: VORGABE_BESCH um ZEILE_CBMFPF erweitert
	20.04.07 ANKR Issue 14733: Sendungsbeschreibungsschleifen um ZEILE_CBMFPF erweitert
	18.05.07 ANKR Issue 12569: Erweiterung Schleife ORG_PRO_FIRMA um l_p_where 
	04.07.07 MAVO Issue 15302: Schleife SLDN fuer Lademittelnummern
	18.10.07 FRTH Issue 15693: Schleife GEN_TAB mit REC_RECID gesichert
	14.02.08 MISA Issue 17315: Fehlende Variablen und fehlerhafte Sendungsbeschreibungszeile 
	23.04.08 ANKR Issue 17739: Ergaenzung div. Schleifen mit den neuen Zeitzonen-Spalten 
	06.06.08 FRTH Issue 18063: Korrektur Sendungs-Schleifen bzgl. local
	24.06.08 FRTH Issue 15493: Schleife ORG_PRO_FIRMA korrigiert
	05.08.08 FRTH Issue 18401: Neues Format RECHNEN_FORMAT zum schnellen Rechnen ohne Nebeneffekte
	08.09.08 FRTH Issue 18624: Neue Schleife ueber Generische Tabellen-Werte
	01.10.08 FRTH Issue 18623: ABZ_NEU_FORMAT Abrechnungs-Zeilen-einfuegen fuer Eingangsbelege
	03.12.08 ANKR Issue 18430: neue Bibliothek LADEEINHEIT
	08.12.08 ANHE Issue 19255: Erweiterung um ZEILEG_FMENGE und ZEILEG_TUNNEL
	10.12.08 FRTH Issue 19383: Neues Format LMON_FORMAT fuer Laufzeitmessungen
	02.03.09 ROMO Issue 19350: Attribute auf Bewegungen
	18.03.09 ANKR Issue 19627: Erweiterung Schleife ueber Abrechnungszeilen um Variable ABZID
	09.04.09 FRTH Issue 20170: IMMEDIATE_LOOP: Schleife mit direktem sql-Befehl
	10.03.02 RUNE Barth: Schleife SDG-OPTADRID "sdg_orgid + 0 IN.." um usage SSDG_IX1 statt _IX2 zu erzwingen
	10.03.02 RUNE Barth: Schleife SDG-AB-ABHOL "sdg_orgid + 0 IN.." um usage SSDG_IX1 statt _IX2 zu erzwingen
	                     und Korrektur join auf ssda
	18.05.19 RUNE Issue 22352 Erweiterung Format DECLARE (_declare_m4)
	18.05.19 RUNE Issue 22625 Korrektur SFELD fuer Vorgabe mit Komma
                 ABER: SFELD(ZUFELD21N,,"-5,76",)->"-567" no chance in makrodef, da Typ nicht bekannt
   15.06.10 RUNE (bereits seit 03.12.97 WOSC) auskommentierte Formate STATUS_LA_ABSCH STATUS_SDG_FAR geloescht 
   15.06.10 RUNE ebenso Format ANLEGEN_COL_STA geloescht
   15.06.10 RUNE Uebersetzungen der Textkonstanten via @nls_gettext_x() und [language].txt files eingebaut
	27.01.11 FRTH Issue 24994: Erweiterung Schleife ATT_KUN und SZUSATZ mit KUN
	01.02.11 ELRO Issue 24994: Erweiterung LZUSATZ mit KUN
        08.10.12 JAZU Issue 30214: Formate Lesen/Setzen Zusatzattribut um LPL-Bereich erweitert
*/


/*
 #define OFFERT_INIT @abre_start();
 #define OFFERT_END
*/
#include <abrinit.m4>

#define OFFERT_END @abre_start();
#define OFFERT_STB_INIT
#define OFFERT_STB_END START

#define SPC_INIT
#define SPC_END
#define SPC_STB_INIT
#define SPC_STB_END START

#define TARIF_INIT
#define TARIF_END
#define TARIF_STB_INIT
#define TARIF_STB_END START

#define SPBLK_INIT
#define SPBLK_END
#define SPBLK_STB_INIT
#define SPBLK_STB_END START

#define BELEG_IMPORT_INIT
#define BELEG_IMPORT_END

#define BIBLIOTHEK_BELEG_INIT
#define BIBLIOTHEK_BELEG_END


#define ZOLL_INIT
#define ZOLL_END
#define ZOLL_STB_INIT
#define ZOLL_STB_END START

#define ALLG_INIT
#define ALLG_END
#define ALLG_STB_INIT
#define ALLG_STB_END START

#define LADEEINHEIT_ALLG_INIT
#define LADEEINHEIT_ALLG_END 
#define LADEEINHEIT_ALLG_STB_INIT
#define LADEEINHEIT_ALLG_STB_END START

#define SDG_ZUORDNUNG_INIT
#define SDG_ZUORDNUNG_END 
#define SDG_ZUORDNUNG_STB_INIT
#define SDG_ZUORDNUNG_STB_END START

#define STATUS_INIT
#define STATUS_END
#define STATUS_STB_INIT
#define STATUS_STB_END START

#define LADEMITTEL_INIT
#define LADEMITTEL_END
#define LADEMITTEL_STB_INIT
#define LADEMITTEL_STB_END START

#define ABR_FA_INIT_INIT
#define ABR_FA_INIT_END
#define ABR_FA_INIT_STB_INIT
#define ABR_FA_INIT_STB_END START

#define KONDITION_INIT
#define KONDITION_END 
#define KONDITION_STB_INIT
#define KONDITION_STB_END START

#include <fa_init.m4>
/* #define ABR_KD_INIT_INIT */
/* #define ABR_KD_INIT_END  */
#define ABR_KD_INIT_STB_INIT
#define ABR_KD_INIT_STB_END START

#define SDG_VORG_INIT \
  if (@IsSection("VORGABE") == FALSE) \
     { @AddSection("VORGABE"); } \
  if (@IsSection("VORGABE_FIX") == FALSE) \
     { @AddSection("VORGABE_FIX"); } \
  if (@gesetzt(LFD_SEKTION) == FALSE) \
     { LFD_SEKTION = 1; }
#define SDG_VORG_END
#define SDG_VORG_STB_INIT
#define SDG_VORG_STB_END START

#define SDG_START_INIT \
  if (@IsSection("RECHTE") == FALSE) \
     { @AddSection("RECHTE"); } \
  if (@gesetzt(LFD_SEKTION) == FALSE) \
     { LFD_SEKTION = 1; }
#define SDG_START_END
#define SDG_START_STB_INIT
#define SDG_START_STB_END START

#define SDG_SCANNEN_INIT \
  if (@IsSection("VORGABE") == FALSE) \
     { @AddSection("VORGABE"); } \
  if (@IsSection("VORGABE_FIX") == FALSE) \
     { @AddSection("VORGABE_FIX"); } \
  if (@gesetzt(LFD_SEKTION) == FALSE) \
     { LFD_SEKTION = 1; }
#define SDG_SCANNEN_END
#define SDG_SCANNEN_STB_INIT
#define SDG_SCANNEN_STB_END START

#define KALCULATION_INIT \
  if (@IsSection("VORGABE") == FALSE) \
     { @AddSection("VORGABE"); } \
  if (@IsSection("VORGABE_FIX") == FALSE) \
     { @AddSection("VORGABE_FIX"); } \
  if (@gesetzt(LFD_SEKTION) == FALSE) \
     { LFD_SEKTION = 1; }
#define KALCULATION_END
#define KALCULATION_STB_INIT
#define KALCULATION_STB_END START

#define SDG_ALLG_INIT \
  if (@IsSection("VORGABE") == FALSE) \
     { @AddSection("VORGABE"); } \
  if (@IsSection("VORGABE_FIX") == FALSE) \
     { @AddSection("VORGABE_FIX"); } \
  if (@gesetzt(LFD_SEKTION) == FALSE) \
     { LFD_SEKTION = 1; }
#define SDG_ALLG_END
#define SDG_ALLG_STB_INIT
#define SDG_ALLG_STB_END START

#define UEBERS_ALLG_INIT \
  if (@IsSection("VORGABE") == FALSE) \
     { @AddSection("VORGABE"); } \
  if (@IsSection("VORGABE_FIX") == FALSE) \
     { @AddSection("VORGABE_FIX"); } \
  if (@gesetzt(LFD_SEKTION) == FALSE) \
     { LFD_SEKTION = 1; }
#define UEBERS_ALLG_END
#define UEBERS_ALLG_STB_INIT
#define UEBERS_ALLG_STB_END START



#define AWB_INIT \
  if (@IsSection("VORGABE") == FALSE) \
     { @AddSection("VORGABE"); } \
  if (@IsSection("VORGABE_FIX") == FALSE) \
     { @AddSection("VORGABE_FIX"); } \
  if (@gesetzt(LFD_SEKTION) == FALSE) \
     { LFD_SEKTION = 1; }
#define AWB_END
#define AWB_STB_INIT
#define AWB_STB_END START

#define DOKUMENT_INIT \
  if (@IsSection("VORGABE") == FALSE) \
     { @AddSection("VORGABE"); } \
  if (@IsSection("VORGABE_FIX") == FALSE) \
     { @AddSection("VORGABE_FIX"); } \
  if (@gesetzt(LFD_SEKTION) == FALSE) \
     { LFD_SEKTION = 1; }
#define DOKUMENT_END
#define DOKUMENT_STB_INIT
#define DOKUMENT_STB_END START

#define CHZ_INIT \
  if ( ((_KRIID == "CHZ_FA") | (_KRIID == "CHF_AG")) & (@getwert(CHZ_NOCHMAL) == 2) ) \
     { /* @print("KEIN 2. DURCHLAUF"); */ return (TRUE);  } \
  if (@IsSection("VORGABE") == FALSE) \
     { @AddSection("VORGABE"); } \
  if (@IsSection("VORGABE_FIX") == FALSE) \
     { @AddSection("VORGABE_FIX"); } \
  if (@gesetzt(LFD_SEKTION) == FALSE) \
     { LFD_SEKTION = 1; }
#define CHZ_END \
  if (@gesetzt(CHZ_NOCHMAL) == TRUE) \
  {  if (@getwert(CHZ_NOCHMAL) == 1) \
     { \
       CHZ_NOCHMAL = 2; \
       @call ("CHZ",FA_ID,FA_ID, ADRID_IM,ADRID_IM); \
     } \
  }
#define CHZ_STB_INIT
#define CHZ_STB_END START

#define SDG_CHECK_INIT
#define SDG_CHECK_END
#define SDG_CHECK_STB_INIT
#define SDG_CHECK_STB_END START

#define MASKE_INIT
#define MASKE_END
#define MASKE_STB_INIT
#define MASKE_STB_END START

#define SDG_SPLIT_INIT
#define SDG_SPLIT_END START

#define SDG_SPLIT_START_INIT
#define SDG_SPLIT_START_END START

#define ALVE_INIT
#define ALVE_END 
#define ALVE_STB_INIT
#define ALVE_STB_END START

#include <la_sdg_check.mc>

#ifdef _la_sdg_incl_check
#define LA_SDG_INIT \
ifelse(_KRIID,ifelse(_la_sdg_incl_check,,"LA_SDG_AB_ID",_addhk(_la_sdg_incl_check)),\
   if ( @getwert(BATCH) != 1 & @getwert(LA_SDG_INI_SDG_CHECK) != "N")\
	{\
		@print(@sprintf(@nls_gettext_x("li_mc.la_sdg_init.check.start"))); \
		@save_vars(BIB); \
		BIB = "SDG_CHECK"; \
		@call(@getwert(BIB), FA_ID,@getwert(FA_ID), AB_ID,@getwert(AB_ID), \
			LI_MODUL, @getwert(LI_MODUL),ADRID_AB,@getwert(ADRID_AB), ADRID_AG,@getwert(ADRID_AG), \
			ADRID_EM,@getwert(ADRID_EM) ); \
		@restore_vars();\
		@print(@sprintf(@nls_gettext_x("li_mc.la_sdg_init.check.end"))); \
	},)
#else
#define LA_SDG_INIT
#endif

#define LA_SDG_END
#define LA_SDG_STB_INIT
#define LA_SDG_STB_END START

#define SDG_DFUE_INIT
#define SDG_DFUE_END \
   @SqlImmediate ("COMMIT"); \
	@print(@sprintf(@nls_gettext_x("li_mc.sdg_dfue_end.commit"))); \
	@save_vars(BIB); \
	BIB = "SDG_CHECK"; \
	@call(@getwert(BIB), FA_ID,@getwert(FA_ID), AB_ID,@getwert(AB_ID), \
		LI_MODUL, @getwert(LI_MODUL),ADRID_AB,@getwert(ADRID_AB), ADRID_AG,@getwert(ADRID_AG), \
		ADRID_EM,@getwert(ADRID_EM) ); \
	@restore_vars(); \
	@print(@sprintf(@nls_gettext_x("li_mc.sdg_dfue_end.call.lagen"))); \
	@save_vars(BIB); \
	BIB = "LA_"||"SDG"; \
	@call(@getwert(BIB), FA_ID,@getwert(FA_ID), AB_ID,@getwert(AB_ID), \
		ADRID_AB,@getwert(ADRID_AB), ADRID_AG,@getwert(ADRID_AG), \
		ADRID_EM,@getwert(ADRID_EM) );\
	@restore_vars();
#define SDG_DFUE_STB_INIT
#define SDG_DFUE_STB_END START

#define FAHRT_INIT
#define FAHRT_END  \
	if ( @getwert(FAHRTSTATUS) == "710" \
	   & @getwert(FAHRT_VON) == "" ) \
		{ @abort("Kein Fahrtbeginn! (Musseingabe bei Status abgeschlossen)"); }
#define FAHRT_STB_INIT
#define FAHRT_STB_END START

#define FAR_ALLG_INIT
#define FAR_ALLG_END  \
	if ( @getwert(FAHRTSTATUS) == "710" \
	   & @getwert(FAHRT_VON) == "" ) \
		{ @abort("Kein Fahrtbeginn! (Musseingabe bei Status abgeschlossen)"); }
#define FAR_ALLG_STB_INIT
#define FAR_ALLG_STB_END START

#define LAGERBUCH_INIT
#define LAGERBUCH_END
#define LAGERBUCH_STB_INIT
#define LAGERBUCH_STB_END START

#define LAGERARTIKEL_INIT
#define LAGERARTIKEL_END
#define LAGERARTIKEL_STB_INIT
#define LAGERARTIKEL_STB_END START

#define DISPOSITION_INIT
#define DISPOSITION_END
#define DISPOSITION_STB_INIT
#define DISPOSITION_STB_END START
#
#define DISPO_POOL_INIT
#define DISPO_POOL_END
#define DISPO_POOL_STB_INIT
#define DISPO_POOL_STB_END START

#define LADEEINHEIT_INIT
#define LADEEINHEIT_END
#define LADEEINHEIT_STB_INIT
#define LADEEINHEIT_STB_END START

#define DISPOSITION_GR_INIT
#define DISPOSITION_GR_END
#define DISPOSITION_GR_STB_INIT
#define DISPOSITION_GR_STB_END START

#define VALIDIERUNG_INIT \
  if (@IsSection("VORGABE") == FALSE) \
     { @AddSection("VORGABE"); } \
  if (@IsSection("VORGABE_FIX") == FALSE) \
     { @AddSection("VORGABE_FIX"); } \
  if (@gesetzt(LFD_SEKTION) == FALSE) \
     { LFD_SEKTION = 1; }
#define VALIDIERUNG_END
#define VALIDIERUNG_STB_INIT
#define VALIDIERUNG_STB_END START

/*************************************************************************
LA Formate (Generierung usw.) sind in Includ la.mc ausgelagert */
#include <la.mc>

/*************************************************************************
Schleifen-Makros (Aktionszeilen) und Lesen Adresse */

/*
Makrodefinitionen fuer Aktionszeilen (Schleifen) + Lesen Adresse
*/

/* Allgemeiner Aufbau der Schleife */
define(`_LOOP´,
`ifdef(`_LOOP_VARS´,`ifdef(`_LOOP_RSET´, `@save_vars (l_loopCur, _LOOP_VARS, _LOOP_RSET);´,`@save_vars (l_loopCur, _LOOP_VARS);´)´,ifdef(`_LOOP_RSET´,`@save_vars(l_loopCur, _LOOP_RSET);´))´
l_loopCur = @SqlOpenCursor(HSQL);
@SqlPrepareAndExecute (l_loopCur, HSQL, _LOOP_SELECT );
while (@SqlFetchNext (l_loopCur, HSQL) != 0)
{
	@print(@sprintf(@nls_gettext_x("li_mc.loop.name") || " `_LOOP_NAME´"));
   `ifdef(`_LOOP_RSET´, @reset_vars(_LOOP_RSET); )´
)

define(`_LOOP_END´,`
}
if ( l_loopCur != 0-999 )
{
   @SqlCloseCursor(l_loopCur, HSQL);
}´
`ifdef(`_LOOP_VARS´,@restore_vars();, ifdef(`_LOOP_RSET´, @restore_vars();))´
)

define(`LOOPBREAK´,`break;´);
/*************************************************************************
Sendungschleifen

WOSC 27.11.1995 Variable STATUS_SDG in SDG_VARS_RESET aufgenommen. Select
         Methode fuer die Variable eingefuegt
*/

define(`_SDG_VARS_LOOP´,  `SDGID, FRANK, GEW_BTO, WLCODE, \
	UEBCODE, RELATION, STATUS_SDG, K_AB_ID, SDG_KM, SDG_DATUM, SDG_ERFDAT, SDG_GEFG´)
define(`_SDG_VARS_RESET´,  `K_SDGID, K_RELID, CLLANZ, LADMETER,
	CUBMETER, ADRID_WE, ADRID_AB, ADRID_KO, PLZ_WE, PLZ_AB, PNN, PNNCODE,
	SDG_TEXT_AB, SDG_TEXT_AL, SDG_TEXT_EM, SDG_TEXT_IN, SDG_TEXT_LD, SDG_TEXT_ZO, SDG_TEXT_ZU, SDG_ERFDAT, SDG_GEFG´)
define(`_SDG_VARS_SELECT´, `sdg_sdgid, sdg_fraid, nvl(sdg_local_bgew,sdg_bgew), sdg_welid, \
	sdg_uebid, sdg_relid, sdg_lasid, ssdg.get_orgidkst(sdg_sdgid), sdg_km, \
	to_char(trunc(sdg_datum),'YYYY.MM.DD'), to_char(trunc(sdg_erfdat),'YYYY.MM.DD'), sdg_gefg´)
define(`_SDG_VARS_INTO´,   `:SDGID, :FRANK, :GEW_BTO, :WLCODE, \
	:UEBCODE, :RELATION, :STATUS_SDG, :K_AB_ID, :SDG_KM, :SDG_DATUM, :SDG_ERFDAT, :SDG_GEFG ´)
define(`_SDG_VARS_INIT´, `l_sdgid = @getwert(SDGID);´)
define(`_SDG_VARS_LOAD´, `K_SDGID = @getwert(SDGID); K_RELID = @getwert(RELATION);´)

define(`S_SDG_LDG_O_ZUST_LPO_SORT´, `sadr.get_lpo_sort(ssda.get_adrid(sdg_sdgid,'DP,CN',1))´)
define(`S_SDG_LDG_U_ZUST_LPO_SORT´, `sadr.get_lpo_sort(ssda.get_adrid(sdg_sdgid,'DP,CN',1))´)
define(`S_SDG_LDG_A_ZUST_LPO_SORT´, `sadr.get_lpo_sort(ssda.get_adrid(sdg_sdgid,'DP,CN',1))´)
define(`S_SDG_LDG_O_ABH_LPO_SORT´, `sadr.get_lpo_sort(ssda.get_adrid(sdg_sdgid,'PW,SU,CZ',1))´)
define(`S_SDG_LDG_U_ABH_LPO_SORT´, `sadr.get_lpo_sort(ssda.get_adrid(sdg_sdgid,'PW,SU,CZ',1))´)
define(`S_SDG_LDG_A_ABH_LPO_SORT´, `sadr.get_lpo_sort(ssda.get_adrid(sdg_sdgid,'PW,SU,CZ',1))´)
define(`S_SDG_LDG_O_LTY_LPO_SORT´, `sadr.get_lpo_sort( \
	ssda.get_adrid(sdg_sdgid,decode(:LTYID,'E','PW,SU,CZ','DP,CN'),1))´)
define(`S_SDG_LDG_U_LTY_LPO_SORT´, `sadr.get_lpo_sort( \
	ssda.get_adrid(sdg_sdgid,decode(:LTYID,'E','PW,SU,CZ','DP,CN'),1))´)
define(`S_SDG_LDG_A_LTY_LPO_SORT´, `sadr.get_lpo_sort( \
	ssda.get_adrid(sdg_sdgid,decode(:LTYID,'E','PW,SU,CZ','DP,CN'),1))´)

/* muss noch getestet werden */
/*
define(`S_SDG_LDG_O_LTY_MATCH´, `decode (:LTYID,'E', \
   nvl(ssba.get_ssba(sdg_sdgid,0,'MATCH_WE'), \
		sadr.get_match (ssda.get_adrid(sdg_sdgid,'PW,SU,CZ',1))), \
   nvl(ssba.get_ssba(sdg_sdgid,0,'MATCH_WA'), \
		sadr.get_match (ssda.get_adrid(sdg_sdgid,'DP,CN',1))))
	ssda.get_adrid(sdg_sdgid,decode(:LTYID,'E','PW,SU,CZ','DP,CN'),1)))´)
	*/
define(`S_SDG_LDG_O_ZUST_MATCH´, `nvl(ssba.get_ssba(sdg_sdgid,0,'MATCH_WE'), \
	sadr.get_match( ssda.get_adrid(sdg_sdgid,'DP,CN',1)))´)
define(`S_SDG_LDG_U_ZUST_MATCH´, `nvl(ssba.get_ssba(sdg_sdgid,0,'MATCH_WE'), \
	sadr.get_match( ssda.get_adrid(sdg_sdgid,'DP,CN',1)))´)
define(`S_SDG_LDG_A_ZUST_MATCH´, `nvl(ssba.get_ssba(sdg_sdgid,0,'MATCH_WE'), \
	sadr.get_match( ssda.get_adrid(sdg_sdgid,'DP,CN',1)))´)

define(`S_SDG_LDG_O_ABH_MATCH´, `nvl(ssba.get_ssba(sdg_sdgid,0,'MATCH_WA'), \
	sadr.get_match( ssda.get_adrid(sdg_sdgid,'PW,SU,CZ',1)))´)
define(`S_SDG_LDG_U_ABH_MATCH´, `nvl(ssba.get_ssba(sdg_sdgid,0,'MATCH_WA'), \
	sadr.get_match( ssda.get_adrid(sdg_sdgid,'PW,SU,CZ',1)))´)
define(`S_SDG_LDG_A_ABH_MATCH´, `nvl(ssba.get_ssba(sdg_sdgid,0,'MATCH_WA'), \
	sadr.get_match( ssda.get_adrid(sdg_sdgid,'PW,SU,CZ',1)))´)

define(`S_SDG_LDG_O_LTY_MATCH´, `nvl(ssba.get_ssba(sdg_sdgid,0, \
  decode(:LTYID,'E','MATCH_WA','MATCH_WE')),sadr.get_match( \
	ssda.get_adrid(sdg_sdgid,decode(:LTYID,'E','PW,SU,CZ','DP,CN'),1)))´)
define(`S_SDG_LDG_U_LTY_MATCH´, `nvl(ssba.get_ssba(sdg_sdgid,0, \
  decode(:LTYID,'E','MATCH_WA','MATCH_WE')),sadr.get_match( \
	ssda.get_adrid(sdg_sdgid,decode(:LTYID,'E','PW,SU,CZ','DP,CN'),1)))´)
define(`S_SDG_LDG_A_LTY_MATCH´, `nvl(ssba.get_ssba(sdg_sdgid,0, \
  decode(:LTYID,'E','MATCH_WA','MATCH_WE')),sadr.get_match( \
	ssda.get_adrid(sdg_sdgid,decode(:LTYID,'E','PW,SU,CZ','DP,CN'),1)))´)

define(`W_SDG_LDG_U_SDGADR´, `(ssda.get_adrid(sdg_sdgid,:SDGADRTYP,1) = :ADRID or :SDGADRTYP <= ' ')´)
define(`W_SDG_LDG_O_SDGADR´, `(ssda.get_adrid(sdg_sdgid,:SDGADRTYP,1) = :ADRID or :SDGADRTYP <= ' ')´)
define(`W_SDG_LDG_A_SDGADR´, `(ssda.get_adrid(sdg_sdgid,:SDGADRTYP,1) = :ADRID or :SDGADRTYP <= ' ')´)

define(`_LOOP_VARS´, `_SDG_VARS_LOOP´)
define(`_LOOP_RSET´, `_SDG_VARS_RESET´)
/*
SDG_LDG_A Sendungsschleife ueber alle Sendungen der aktuellen Ladung
	(alle Ebene)
*/

define(`_LOOP_SELECT´, `"SELECT _SDG_VARS_SELECT \
		FROM ssdg_sendung \
		WHERE sdg_sdgid IN (SELECT sgg_sdgid  \
			FROM ssgg_sdggrp  \
			START WITH sgg_sdgidg IN  \
				(SELECT sdg_sdgid \
				FROM ssdg_sendung , slaf_leistanf  \
				WHERE laf_sdgid = sdg_sdgid \
				AND laf_latid = 'TR' \
				AND laf_farid = :FARID \
				AND laf_ltyid = :LTYID " || l_p_where || ") \
			CONNECT BY PRIOR sgg_sdgid = sgg_sdgidg  \
		UNION \
		   SELECT sdg_sdgid \
		   FROM ssdg_sendung , slaf_leistanf  \
		   WHERE laf_sdgid = sdg_sdgid \
		   AND laf_latid = 'TR' \
		   AND laf_farid = :FARID \
		   AND laf_ltyid = :LTYID "|| l_p_where || ") \
		ORDER BY "|| l_p_orderby || " sdg_sdgid \
		INTO _SDG_VARS_INTO"´)

define(`_LOOP_NAME´,`SDG-LDG-A: alle Sendungen der Ladung´)
define(`SDG_LDG_A´, _SDG_VARS_INIT _LOOP _SDG_VARS_LOAD)

/*
SDG_LDG_O Sendungsschleife ueber alle Sendungen der aktuellen Ladung
	(oberste Ebene)
	frueher AKTIONSZEILE 1+2
*/

define(`_LOOP_SELECT´, `"SELECT _SDG_VARS_SELECT \
			FROM ssdg_sendung , slaf_leistanf \
			WHERE laf_sdgid = sdg_sdgid \
			AND laf_latid = 'TR' \
			AND laf_farid = :FARID \
			AND laf_ltyid = :LTYID "|| l_p_where || "\
			ORDER BY "|| l_p_orderby || " sdg_sdgid \
		 	INTO _SDG_VARS_INTO"´)

define(`_LOOP_NAME´,`SDG-LDG-O: alle Sendungen der Ladung´)
define(`SDG_LDG_O´, _SDG_VARS_INIT _LOOP _SDG_VARS_LOAD)

/*
SDG_LDG_U Sendungsschleife ueber alle Sendungen der aktuellen Ladung
	(unterste Ebene)
*/

define(`_LOOP_SELECT´, `"SELECT _SDG_VARS_SELECT \
		FROM ssdg_sendung \
		WHERE sdg_sdgid IN (SELECT sgg_sdgid  \
			FROM ssgg_sdggrp  \
			START WITH sgg_sdgidg IN  \
				(SELECT sdg_sdgid \
				FROM ssdg_sendung , slaf_leistanf  \
				WHERE laf_sdgid = sdg_sdgid \
				AND laf_latid = 'TR' \
				AND laf_farid = :FARID \
				AND laf_ltyid = :LTYID "|| l_p_where || ") \
			CONNECT BY PRIOR sgg_sdgid = sgg_sdgidg  \
		UNION \
			SELECT sdg_sdgid \
			FROM ssdg_sendung , slaf_leistanf  \
			WHERE laf_sdgid = sdg_sdgid \
			AND laf_latid = 'TR' \
			AND laf_farid = :FARID \
			AND laf_ltyid = :LTYID "|| l_p_where || ") \
		AND NOT EXISTS (SELECT 1  \
					 FROM ssgg_sdggrp  \
					 WHERE sgg_sdgidg = sdg_sdgid) \
		ORDER BY "|| l_p_orderby || " sdg_sdgid \
	 	INTO _SDG_VARS_INTO"´)

define(`_LOOP_NAME´,`SDG-LDG-U: alle Sendungen der Ladung´)
define(`SDG_LDG_U´, _SDG_VARS_INIT _LOOP   _SDG_VARS_LOAD)

/*
SDG_GRP_O Sendungsschleife ueber alle Sendungen der aktuellen Gruppe
	der obersten (= naechst-darunterliegenden) Ebene
*/

define(`_LOOP_SELECT´, `"SELECT _SDG_VARS_SELECT \
			FROM ssdg_sendung \
			WHERE sdg_sdgid IN (SELECT sgg_sdgid \
					    FROM ssgg_sdggrp \
					    WHERE sgg_sdgidg = :l_sdgid) "|| l_p_where || " \
		 	INTO _SDG_VARS_INTO"´)

define(`_LOOP_NAME´,`SDG-GRP-O: alle Sendungen der Sendunggruppe´)
define(`SDG_GRP_O´, _SDG_VARS_INIT _LOOP   _SDG_VARS_LOAD)

/*
GRP_SDG_U Sendungsschleife ueber alle Sendungsgruppen der aktuellen Sendung
	der naechst-darueberliegenden (unterste) Ebene
*/

define(`_LOOP_SELECT´, `"SELECT _SDG_VARS_SELECT \
			FROM ssdg_sendung \
			WHERE sdg_sdgid IN (SELECT sgg_sdgidg \
					    FROM ssgg_sdggrp \
					    WHERE sgg_sdgid = :l_sdgid) "|| l_p_where || " \
		 	INTO _SDG_VARS_INTO"´)

define(`_LOOP_NAME´,`GRP-SDG-U: alle Sendungsgruppen der Sendungen´)
define(`GRP_SDG_U´, _SDG_VARS_INIT _LOOP _SDG_VARS_LOAD)

/*
SDG_GRP_U Sendungsschleife ueber alle Sendungen der aktuellen Gruppe
	nur die unterste Ebene
	Hinweis zum Select: Es wird der ganze Sendungsgruppenbaum nach unten
	aufgeloest und alle Sendungen mit Gruppenkinder werden exkludiert
	frueher AKTIONSZEILE 7+8
*/

define(`_LOOP_SELECT´, `"SELECT _SDG_VARS_SELECT \
			FROM ssdg_sendung \
			WHERE sdg_sdgid IN (SELECT sgg_sdgid \
					    FROM ssgg_sdggrp \
					    START WITH sgg_sdgidg = :l_sdgid \
					    CONNECT BY PRIOR sgg_sdgid = sgg_sdgidg) "|| l_p_where ||"  \
			AND NOT EXISTS (SELECT 1 \
					    FROM ssgg_sdggrp \
					    WHERE sgg_sdgidg = sdg_sdgid) \
		 	INTO _SDG_VARS_INTO"´)

define(`_LOOP_NAME´,`SDG-GRP-U: alle Sendungen der Sendunggruppe´)
define(`SDG_GRP_U´, _SDG_VARS_INIT _LOOP _SDG_VARS_LOAD)


/*
SDG_GRP_A Sendungsschleife ueber alle Sendungen der aktuellen Gruppe
	nur die unterste Ebene
	Hinweis zum Select: Es wird der ganze Sendungsgruppenbaum nach unten
	aufgeloest und alle Sendungen mit Gruppenkinder werden exkludiert
	frueher AKTIONSZEILE 7+8
*/

define(`_LOOP_SELECT´, `"SELECT _SDG_VARS_SELECT \
			FROM ssdg_sendung \
			WHERE sdg_sdgid IN (SELECT sgg_sdgid \
					    FROM ssgg_sdggrp \
					    START WITH sgg_sdgidg = :l_sdgid \
					    CONNECT BY PRIOR sgg_sdgid = sgg_sdgidg) \
			"|| l_p_where || "\
		 	INTO _SDG_VARS_INTO"´)

define(`_LOOP_NAME´,`SDG-GRP-A: alle Sendungen der Gruppe´)
define(`SDG_GRP_A´, _SDG_VARS_INIT _LOOP   _SDG_VARS_LOAD)

/*
SDG-ADRID Sendungsschleife ueber alle Sendungen der aktuellen Adresse
	im Zeitraum DATUM_VON bis DATUM_BIS der AB_ID --RUNE: Absicht: kein 'sdg_orgid + 0'
*/

define(`_LOOP_SELECT´, `"SELECT _SDG_VARS_SELECT \
			FROM ssdg_sendung \
			WHERE sdg_lasid != '860' and  sdg_sdgid IN (SELECT sda_sdgid \
					    FROM ssda_sdgadr \
					    WHERE sda_adrid = :ADRID) "|| l_p_where ||" \
			AND sdg_orgid IN (select org_orgid FROM sorg_t_einheit \
									Start with org_orgid = :AB_ID \
									Connect by org_orgidh = prior org_orgid ) \
			AND sdg_datum >= to_date(Substr (:DATUM_VON,1,10),'YYYY.MM.DD') \
			AND sdg_datum <  to_date(Substr (:DATUM_BIS,1,10),'YYYY.MM.DD') + 1 \
			ORDER BY sdg_datum, sdg_relid, sdg_sdgid \
		 	INTO _SDG_VARS_INTO"´)

define(`_LOOP_NAME´,`SDG-ADRID: alle Sendungen der Adresse´)
define(`SDG_ADRID´, _SDG_VARS_INIT _LOOP   _SDG_VARS_LOAD)

/*
SDG-OPTADRID Sendungsschleife ueber alle Sendungen der aktuellen Adresse
   im Zeitraum DATUM_VON bis DATUM_BIS der AB_ID optimiert ueber Adresse
*/

define(`_LOOP_SELECT´, `"SELECT _SDG_VARS_SELECT \
         FROM ssdg_sendung \
         WHERE  exists ( SELECT /*+ INDEX(SSDA_SDGADR SSDA_SDGADR_IP) \
			 */ sda_sdgid FROM ssda_sdgadr \
                   WHERE sda_adrid = :ADRID and sda_sdgid = sdg_sdgid) \
         AND sdg_orgid + 0 IN (select org_orgid FROM sorg_t_einheit \
                           Start with org_orgid = :AB_ID \
                           Connect by org_orgidh = prior org_orgid ) \
         AND sdg_lasid != '860' and sdg_datum >= to_date(Substr (:DATUM_VON,1,10),'YYYY.MM.DD') \
         AND sdg_datum <  to_date(Substr (:DATUM_BIS,1,10),'YYYY.MM.DD') + 1 "|| l_p_where ||" \
         ORDER BY sdg_datum, sdg_relid, sdg_sdgid \
         INTO _SDG_VARS_INTO"´)

define(`_LOOP_NAME´,`SDG-OPTADRID: alle Sendungen der Adresse´)
define(`SDG_OPTADRID´, _SDG_VARS_INIT _LOOP   _SDG_VARS_LOAD)



/*
SDG-AB_ID Sendungsschleife ueber alle Sendungen der aktuellen Abteilung
	im Zeitraum DATUM_VON bis DATUM_BIS --RUNE: Absicht: kein 'sdg_orgid + 0'
*/

define(`_LOOP_SELECT´, `"SELECT _SDG_VARS_SELECT \
			FROM ssdg_sendung \
			WHERE sdg_orgid IN (select org_orgid FROM sorg_t_einheit \
									Start with org_orgid = :AB_ID \
									Connect by org_orgidh = prior org_orgid ) \
			AND sdg_lasid != '860' \
			AND sdg_datum >= to_date(Substr (:DATUM_VON,1,10),'YYYY.MM.DD') \
			AND sdg_datum <  to_date(Substr (:DATUM_BIS,1,10),'YYYY.MM.DD') + 1 "|| l_p_where || "\
			ORDER BY sdg_datum, sdg_relid, sdg_sdgid \
		 	INTO _SDG_VARS_INTO"´)

define(`_LOOP_NAME´,`SDG-AB_ID: alle Sendungen der Abteilung´)
define(`SDG_AB_ID´, _SDG_VARS_INIT _LOOP   _SDG_VARS_LOAD)
/*
SDG-Abhol Sendungsschleife ueber alle Sendungen der aktuellen Abteilung
	im Zeitraum DATUM_VON bis DATUM_BIS und Abholer
*/

define(`_LOOP_SELECT´, `"SELECT _SDG_VARS_SELECT \
		  	from ssdg_sendung, ssda_sdgadr \
			WHERE sdg_orgid + 0 IN (select org_orgid FROM sorg_t_einheit \
									Start with org_orgid = :AB_ID \
									Connect by org_orgidh = prior org_orgid ) \
			AND sdg_lasid != '860' \
			AND sdg_datum >= to_date(Substr (:DATUM_VON,1,10),'YYYY.MM.DD') \
			AND sdg_datum <  to_date(Substr (:DATUM_BIS,1,10),'YYYY.MM.DD') + 1 \
			AND sdg_styid in ('G','GA') \
			AND sda_satid = 'SU' AND sda_sdgid = sdg_sdgid \
			AND sda_adrid = :ADRID	 "|| l_p_where || "\
			ORDER BY sdg_datum, sdg_relid, sdg_sdgid \
		 	INTO _SDG_VARS_INTO"´)

define(`_LOOP_NAME´,`ABHOL: alle Sendungen der Abteilung´)
define(`SDG_AB_ABHOL´, _LOOP )


/*
SDG_STOP Taetigkeiten/Sendungen des aktuellen Stops
*/

define(`_LOOP_SELECT´, `"SELECT _SDG_VARS_SELECT, LST_TATID \
			FROM slst_lastop, slaf_leistanf, ssdg_sendung \
			WHERE lst_stoid = :STOID \
			  AND lst_farid = :FARID \
			  AND lst_lafid = laf_lafid(+) \
			  AND laf_sdgid = sdg_sdgid(+) "|| l_p_where || "\
		 	INTO _SDG_VARS_INTO, :TAETIGK"´)

define(`_LOOP_VARS´, `_SDG_VARS_LOOP, TAETIGK´)
define(`_LOOP_NAME´,`SDG-STOP: alle Taetigkeiten/Sendungen am Stop´)
define(`SDG_STOP´, _SDG_VARS_INIT _LOOP   _SDG_VARS_LOAD)


/*************************************************************************
Sendungsbeschreibungs-Schleifen


*/
define(`_SDB_VARS_LOOP´,   `ZEILE_ID, ZEILE_LFNR, ZEILE_EBENE, ZEILE_ZNR, ZEILE_ANZ, \
			ZEILE_ART, ZEILE_INH, ZEILE_GEW_BTO, ZEILE_GEW_NTO, ZEILE_CBM, ZEILE_LDM, \
			ZEILE_ZTARIF, ZEILE_WRGID, ZEILE_WERT, ZEILE_GG, ZEILE_BARCODE, \
			ZEILE_LAENGE, ZEILE_BREITE, ZEILE_HOEHE, ZEILE_TARA, \
			ZEILE_UNIT, ZEILE_CONTNR, ZEILE_CONTTYP, ZEILE_MAT, \
			ZEILE_FREISTELLNR, ZEILE_DEPOT, ZEILE_GEWFPF, \
                  ZEILE_LVEID, ZEILE_ARTNR, ZEILE_FGSTNR, ZEILE_CBMFPF´)
define(`_SDB_VARS_RESET´,  `ZEILE_TEXT, ZEILEG_GEFID, ZEILEG_BEZ, ZEILEG_UNNR, \
			ZEILEG_KLASSE, ZEILEG_ZIFFER, ZEILEG_BUCHSTABE, ZEILEG_BEZ, ZEILEG_ABFALL, \
			ZEILEG_HANDELSNAME, ZEILEG_AUSNAHME, ZEILEG_LEHR, ZEILEG_BMENGE, \
			ZEILEG_UMWELT, ZEILEG_UNIT, ZEILEG_BGEW, ZEILEG_NGEW, ZEILEG_NGEWE, \
			ZEILEG_CBM, ZEILEG_FAKTOR, ZEILEG_PUNKTE, ZEILEG_ZETTEL, ZEILEG_VERSION, \
		   ZEILEG_CODE, ZEILEG_LEER, ZEILEG_TYP, ZEILEG_VEPTEXT, ZEILEG_VGRUPPE, \
         ZEILEG_ZUSATZ, ZEILEG_VEPID, ZEILEG_SONDERVOR, ZEILEG_FMENGE, ZEILEG_TUNNEL, \
		   ZEILE_VEPKBEZ, ZEILE_LOCAL_GEW_BTO, ZEILE_LOCAL_GEW_NTO, ZEILE_LOCAL_CBM, ZEILE_LOCAL_LDM´)
define(`_SDB_VARS_SELECT´, `sdb_lfzl, sdb_lfzl, sdb_sbeid, SUBSTR(sdb_znr,1,254),sdb_anz,\
			sdb_vepid, SUBSTR(sdb_inh,1,254), sdb_bgew, sdb_ngew, sdb_cbm, sdb_ldm, \
			sdb_ztarif, sdb_wrgid, sdb_wert, sdb_gefg, sdb_barcd, \
			sdb_laenge, sdb_breite, sdb_hoehe, sdb_tara, \
			sdb_unit, sdb_contnr, sdb_conttyp, sdb_contmat, \
                  sdb_freistellnr, sdb_depot, sdb_gewpfl, \
                  sdb_lveid, sdb_artnr, sdb_fgstnr, sdb_vonsatid, sdb_nachsatid, \
		  sdb_local_bgew, sdb_local_ngew, sdb_local_cbm, sdb_local_ldm, sdb_mnr´)
define(`_SDB_VARS_INTO´,   `:ZEILE_ID, :ZEILE_LFNR, :ZEILE_EBENE, :ZEILE_ZNR, :ZEILE_ANZ, \
			:ZEILE_ART, :ZEILE_INH, :ZEILE_GEW_BTO, :ZEILE_GEW_NTO, :ZEILE_CBM, :ZEILE_LDM, \
			:ZEILE_ZTARIF, :ZEILE_WRGID, :ZEILE_WERT, :ZEILE_GG, :ZEILE_BARCODE, \
			:ZEILE_LAENGE, :ZEILE_BREITE, :ZEILE_HOEHE, :ZEILE_TARA, \
			:ZEILE_UNIT, :ZEILE_CONTNR, :ZEILE_CONTTYP, :ZEILE_MAT, \
			:ZEILE_FREISTELLNR, :ZEILE_DEPOT, :ZEILE_GEWFPF, \
                  :ZEILE_LVEID, :ZEILE_ARTNR, :ZEILE_FGSTNR, :ZEILE_VON, :ZEILE_NACH,  \
		  :ZEILE_LOCAL_GEW_BTO, :ZEILE_LOCAL_GEW_NTO, :ZEILE_LOCAL_CBM, :ZEILE_LOCAL_LDM, :ZEILE_MNR´)

define(`_SBW_VARS_LOOP´,   `ZEILEW_ADATUM, ZEILEW_ANZ2IN1, ZEILEW_ANZ3IN2, \
			ZEILEW_ANZ4IN3, ZEILEW_ANZ5IN4, ZEILEW_COLLINR, ZEILEW_MARK, \
			ZEILEW_GRUP1, ZEILEW_GRUP2, ZEILEW_LSPID, ZEILEW_SPERRGRUND, \
			ZEILEW_MENGE, ZEILEW_PRODATUM´)
define(`_SBW_VARS_RESET´,   `ZEILEW_ADATUM, ZEILEW_ANZ2IN1, ZEILEW_ANZ3IN2, \
			ZEILEW_ANZ4IN3, ZEILEW_ANZ5IN4, ZEILEW_COLLINR, ZEILEW_MARK, \
			ZEILEW_GRUP1, ZEILEW_GRUP2, ZEILEW_LSPID, ZEILEW_SPERRGRUND, \
			ZEILEW_MENGE, ZEILEW_PRODATUM´)
define(`_SBW_VARS_SELECT´, `to_char(sbw_adatum, 'YYYY.MM.DD'), sbw_2in1, sbw_3in2, \
			sbw_4in3, sbw_5in4, sbw_collinr, sbw_mark, \
			sbw_grup1, sbw_grup2, sbw_lspid, SUBSTR(sbw_sperrgrund,1,254), \
			sbw_menge, to_char(sbw_prodatum, 'YYYY.MM.DD')´)
define(`_SBW_VARS_INTO´,   `:ZEILEW_ADATUM, :ZEILEW_ANZ2IN1, :ZEILEW_ANZ3IN2, \
			:ZEILEW_ANZ4IN3, :ZEILEW_ANZ5IN4, :ZEILEW_COLLINR, :ZEILEW_MARK, \
			:ZEILEW_GRUP1, :ZEILEW_GRUP2, :ZEILEW_LSPID, :ZEILEW_SPERRGRUND, \
			:ZEILEW_MENGE, :ZEILEW_PRODATUM´)

define(`_LOOP_VARS´, `_SDB_VARS_LOOP, _SBW_VARS_LOOP´)
define(`_LOOP_RSET´, `_SDB_VARS_RESET, _SBW_VARS_RESET´)
/*
SDG_BESCH_G Sendungsbeschreibungszeilen aller Ebenen der aktuellen Sendung
*/
define(`_LOOP_SELECT´, `"SELECT _SDB_VARS_SELECT, _SBW_VARS_SELECT \
			FROM ssbw_wmsbpo, ssdb_besch \
			WHERE sdb_sdgid = :l_sdgid " || l_p_where || " \
			AND	sdb_sdgid = sbw_sdgid(+) \
			AND	sdb_lfzl = sbw_lfzl(+) \
			ORDER BY sdb_sortnr \
		 	INTO _SDB_VARS_INTO, _SBW_VARS_INTO" ´)

define(`_LOOP_NAME´,`SDG-BESCH-G: Sendungsbeschreibungszeilen´)
define(`SDG_BESCH_G´, _SDG_VARS_INIT _LOOP)

/*
SDG_BESCH_C Sendungsbeschreibungszeilen der 1. Ebene (Colli-Ebene) der
	aktuellen Sendung
*/

define(`_LOOP_SELECT´, `"SELECT _SDB_VARS_SELECT, _SBW_VARS_SELECT \
				FROM ssbw_wmsbpo, ssdb_besch \
				WHERE sdb_sdgid = :l_sdgid \
				AND sdb_sbeid = 1 " || l_p_where || " \
				AND	sdb_sdgid = sbw_sdgid(+) \
				AND	sdb_lfzl = sbw_lfzl(+) \
				ORDER BY sdb_sortnr \
		 		INTO _SDB_VARS_INTO, _SBW_VARS_INTO "´)

define(`_LOOP_NAME´,`SDG-BESCH-C: Sendungsbeschreibungszeilen´)
define(`SDG_BESCH_C´, _SDG_VARS_INIT _LOOP)

/*
SDG_BESCH_V Sendungsbeschreibungszeilen der 2. Ebene (Verpackungs-Ebene) der
	aktuellen Sendung
	Hinweis zum Select: alle der Ebene 2 und alle der Ebene 1, auf die kein
		Satz mit der Ebene 2 folgt
		Datenbank-SUBSTR wird gross geschrieben, weil es sonst mit
		dem Macro verwechselt wird
	frueher AKTIONSZEILE 3+4, 5+6
*/

define(`_LOOP_SELECT´, `"SELECT _SDB_VARS_SELECT, _SBW_VARS_SELECT \
			FROM ssbw_wmsbpo, ssdb_besch a \
			WHERE sdb_sdgid = :l_sdgid \
			AND (sdb_sbeid = 2 \
 			OR (sdb_sbeid = 1 \
 			AND '2' != (SELECT nvl(SUBSTR(min(to_char(sdb_sortnr,'99999.9999999999') || to_char(sdb_sbeid,'9' )),19,1),'1' ) \
				FROM ssdb_besch b  \
				WHERE b.sdb_sdgid = a.sdb_sdgid   \
				AND b.sdb_sortnr > a.sdb_sortnr ) \
			) ) " || l_p_where || " \
			AND	sdb_sdgid = sbw_sdgid(+) \
			AND	sdb_lfzl = sbw_lfzl(+) \
			ORDER BY sdb_sortnr \
		 		INTO _SDB_VARS_INTO, _SBW_VARS_INTO "´)

define(`_LOOP_NAME´,`SDG-BESCH-V: Sendungsbeschreibungszeilen´)
define(`SDG_BESCH_V´, _SDG_VARS_INIT _LOOP)

/*
SDG_BESCH_A Sendungsbeschreibungszeilen der 3. Ebene (Verpackungs-Ebene) der
	aktuellen Sendung
	Hinweis zum Select: alle der Ebene 3 oder alle Saetze deren folgender
		Satz eine niedere Ebene als die eigene Ebene aufweisen
*/

define(`_LOOP_SELECT´, `"SELECT _SDB_VARS_SELECT, _SBW_VARS_SELECT \
			FROM ssbw_wmsbpo, ssdb_besch a \
			WHERE sdb_sdgid = :l_sdgid \
			AND (sdb_sbeid = 3 \
 			OR (sdb_sbeid >= \
			(SELECT nvl(SUBSTR(min(to_char(sdb_sortnr,'99999.9999999999') \
			|| to_char(sdb_sbeid,'9' )),19,1),'1' ) \
				FROM ssdb_besch b  \
				WHERE b.sdb_sdgid = a.sdb_sdgid   \
				AND b.sdb_sortnr > a.sdb_sortnr ) \
			) ) " || l_p_where || " \
			AND	sdb_sdgid = sbw_sdgid(+) \
			AND	sdb_lfzl = sbw_lfzl(+) \
			ORDER BY sdb_sortnr \
		 		INTO _SDB_VARS_INTO, _SBW_VARS_INTO "´)

define(`_LOOP_NAME´,`SDG-BESCH-A: Sendungsbeschreibungszeilen´)
define(`SDG_BESCH_A´, _SDG_VARS_INIT _LOOP)


/*************************************************************************
Ladungsschleifen
*/

/*
LDG_FAHRT Ladungsschleife ueber alle Ladungen der aktuellen Fahrt
   rewi 10.03.98 Ladungstyp reset in Hochkomma, K_LTYID nur setzen
*/

define(`_LDG_RSET´,`GEW_LDG_BTO, K_FARID, K_LTYID, STATUS_LA_AS´)
define(`_LDG_VARS´,`LTYID´)
define(`_LOOP_SELECT´,`"SELECT ldg_ltyid \
            FROM sldg_ladung  \
            WHERE ldg_farid = :FARID "|| l_p_where ||" \
             INTO :LTYID" ´)

define(`_LOOP_VARS´,_LDG_VARS)
define(`_LOOP_RSET´,`_LDG_RSET´)
define(`_LOOP_NAME´,`LDG-FAHRT: alle Ladungen der Fahrt´)
define(`LDG_FAHRT´, _LOOP   `K_FARID= FARID; K_LTYID = LTYID;´)
undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)

/*************************************************************************
SAN_SDGID Schleife ueber Anlagen einer Sendung
*/
define(`_SAN_VARS´,`SAN_ANZAHL,SAN_ANLID´)
define(`_LOOP_SELECT´,`"SELECT san_anlid, san_anzahl,san_bez,san_nr \
            FROM ssan_sdganl  \
            WHERE san_sdgid = :SDGID "|| l_p_where ||" \
             INTO :SAN_ANLID, :SAN_ANZAHL, :SAN_BEZ, :SAN_BNR" ´)
define(`_LOOP_VARS´,`_SAN_VARS´)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,`SAN-SDGID: alle Anlagen einer Sendung ´)
define(`SAN_SDGID´, _LOOP)
undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)


/*
POD-Stapel Schleife

*/


define(_POS_VARS_SELECT,`pos_posid, pos_lafid, pos_sdgid, pos_barcd, pos_lauid, \
		to_char(pos_datum,'YYYY.MM.DD HH24:MI'), \
      pos_farid, pos_code, pos_anz, pos_vepid, pos_bemerkung, pos_location, \
      pos_adridur, pos_name, pos_wzeit, to_char(pos_bis,'YYYY.MM.DD HH24:MI') \
		, substr (pos_znr,1,200), pos_orgid, pos_usrid, \
		pos_amtkz, pos_vkmkz, substr (pos_info,1,254), pos_tzname´)

define(_POS_VARS_INTO,`:POSID, :POD_LAFID, :POD_SDGID, :POD_ZEILE_BARCODE, :LAUID, :POD_DATUM, \
	:FARID, :POD_CODE, :POD_ANZAHL, :POD_VEPID, :POD_BEMERKUNG, :POD_LOCATION, \
	:ADRID, :POD_NAME, :POD_WZEIT ,:POD_BIS, :POD_ZNR, :AG_ID, :USRID, \
	:VKMKZ, :VKMKZINT, :TEXT, :POD_TZNAME´)

define(_POS_VARS_LOOP,`POSID, POD_LAFID, POD_SDGID, POD_ZEILE_BARCODE, LAUID, POD_DATUM, \
	FARID, POD_CODE, POD_ANZAHL, POD_VEPID, POD_BEMERKUNG, POD_LOCATION, \
	ADRID, POD_NAME, POD_WZEIT ,POD_BIS, POD_ZNR, AG_ID, USRID, \
	VKMKZ, VKMKZINT   , TEXT, POD_TZNAME´)


define(_POS_VARS_RESET, `´)

define(`_LOOP_SELECT´,`"SELECT _POS_VARS_SELECT \
         FROM spos_podstapel \
 			WHERE 1=1 " || l_p_where || " \
          INTO _POS_VARS_INTO" ´)

define(`_LOOP_VARS´,`_POS_VARS_LOOP´)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,`POS-STAPEL:´)
define(POS_STAPEL,_LOOP)
undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)


/*
Schleife ueber Nachname

*/


define(_PNN_VARS_SELECT,`SPN_PNNTYP, SPN_PNNID, SPN_WRGID, SPN_BETRAG, SPN_SATIDV, SPN_SATIDF, \
SPN_SPCID, substr (SPN_TEXT,1,254) , SPN_SATIDS, SPN_ADRID´)

define(_PNN_VARS_INTO,`:SPN_PNNTYP, :SPN_PNNID, :SPN_WRGID, :SPN_BETRAG, :SPN_SATIDV, :SPN_SATIDF, \
:SPN_SPCID, :SPN_TEXT, :SPN_SATIDS, :SPN_ADRID´)

define(_PNN_VARS_LOOP,`SPN_PNNTYP, SPN_PNNID, SPN_WRGID, SPN_BETRAG, SPN_SATIDV, SPN_SATIDF, \
SPN_SPCID, SPN_TEXT, SPN_SATIDS, SPN_ADRID´)


define(_PNN_VARS_RESET, `´)

define(`_LOOP_SELECT´,`"SELECT _PNN_VARS_SELECT \
         FROM sspn_sdgpnn \
 			WHERE spn_sdgid = :SDGID " || l_p_where || " \
          INTO _PNN_VARS_INTO" ´)

define(`_LOOP_VARS´,`_PNN_VARS_LOOP´)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,`PNN-SDGID: Schleife ueber die Parteinachnamen ´)
define(`PNN_SDGID´, _LOOP)


/*
Offen Fahrt POD-Schleife

*/


define(_POD_VARS_SELECT,`sdb_sdgid, sdb_lfzl, sdb_barcd, laf_lafid, laf_lauid´)

define(_POD_VARS_INTO,`:SDGID, :ZEILE_ID, ,:POD_ZEILE_BARCODE, :LAFID, :LAUID´)

define(_POD_VARS_LOOP,`SDGID, ZEILE_ID, POD_ZEILE_BARCODE, LAFID, LAUID´)


define(_POD_VARS_RESET, `´)

define(`_LOOP_SELECT´,`"SELECT _POD_VARS_SELECT \
         FROM ssdb_besch,slaf_leistanf,sfar_fahrt   \
 			WHERE not exists (Select sdb_sdgid from spod_pod where  \
	pod_lafid = laf_lafid and pod_sdgid = sdb_sdgid and pod_lfzl = sdb_lfzl) \
	and sdb_barcd is not null and laf_latid = 'ST' and \
	laf_lasid > 200 and laf_lasid < '700'  and  laf_sdgid = sdb_sdgid and \
	laf_farid = far_farid and far_farid = :FARID  " || l_p_where || " \
          INTO _POD_VARS_INTO" ´)

define(`_LOOP_VARS´,`_POD_VARS_LOOP´)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,`POD-FAHRT_POD_OFFEN:´)
define(POD_FAR_OFFEN,_LOOP)
undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)



/*************************************************************************
Korrespondenten-Schleifen
*/

/*
KORR_LDG Ladungsschleife ueber alle Ladungen der aktuellen Fahrt
*/

define(_ADR_VARS_SELECT,`adr_adrid, adr_name1, adr_name2, adr_str, \
         adr_staid, adr_plz, adr_ort, decode(adr_txtadr,1,'Y','N'), \
			Substr(adr_text,1,250), decode(adr_sperre,0,'N','Y'),adr_iln1, adr_iln2,adr_adridbh´)
define(_ADR_VARS_INTO,`:ADRID, :NAME1, :NAME2, :STRASSE, \
         :LAND, :PLZ, :ORT, :TXTADR, :TEXT, :ADR_SPERRE, \
         :ADR_ILN1, :ADR_ILN2,:ADRID_BHF´)
define(_ADU_VARS_SELECT,`adu_idintern, adu_name1, adu_name2, adu_str, \
         adu_staid, adu_plz, adu_ort, \
			Substr(adu_text,1,250), decode(adu_sperre,0,'N','Y'), \
			adu_iln1, adu_iln2´)
define(_ADU_VARS_INTO,`:ADRID, :NAME1, :NAME2, :STRASSE, \
         :LAND, :PLZ, :ORT, :TEXT, :ADR_SPERRE, :ADR_ILN1, :ADR_ILN2´)
define(_ADR_VARS_LOOP,`ADRID, NAME1, NAME2, STRASSE,
         LAND, PLZ, ORT, TXTADR, TEXT, ADR_SPERRE´)
define(_ADR_VARS_RESET,`KRL_KRITISCH, KRL_SALDO, KRL_LIMIT´)

define(_KORR_VARS_SELECT,`_ADR_VARS_SELECT, lda_ref, lda_relid´)
define(_KORR_VARS_INTO,  `_ADR_VARS_INTO, :REFERENZ, :RELATION´)
define(_KORR_VARS_LOOP, `_ADR_VARS_LOOP, REFERENZ, RELATION´)
define(_KORR_VARS_RESET, `_ADR_VARS_RESET´)

define(`_LOOP_SELECT´,`"SELECT _KORR_VARS_SELECT \
         FROM slda_ldgadr, sadr_adresse \
         WHERE lda_adrid = adr_adrid \
         AND lda_farid = :FARID \
         AND lda_ltyid = :LTYID "|| l_p_where ||" \
          INTO _KORR_VARS_INTO" ´)

define(`_LOOP_VARS´,`_KORR_VARS_LOOP´)
define(`_LOOP_RSET´,`_KORR_VARS_RESET´)
define(`_LOOP_NAME´,`KORR-LDG: alle Korrespondenten der Ladung´)
define(KORR_LDG,_LOOP)
undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)

/*
ADRESS_SDG  Schleife ueber aller Adressen der Sendung sortiert nach sort
*/

define(`_LOOP_SELECT´,`"SELECT _ADR_VARS_SELECT, sda_ref, sda_satid \
	 ,to_char(sda_termvon,'YYYY.MM.DD HH24:MI') \
	 ,to_char(sda_termbis,'YYYY.MM.DD HH24:MI') \
         FROM ssda_sdgadr, sadr_adresse, ssat_sdgadrtyp \
         WHERE sda_adrid = adr_adrid \
         AND sda_satid = sat_satid \
         AND sda_sdgid = :l_sdgid " || l_p_where || " \
			ORDER BY sat_order \
         INTO _ADR_VARS_INTO, :REFERENZ, :SDGADRTYP, :SDA_TERMVON, :SDA_TERMBIS" ´)

define(`_LOOP_VARS´,`_ADR_VARS_LOOP, REFERENZ, SDGADRTYP, SDA_TERMVON, SDA_TERMBIS ´)
define(`_LOOP_RSET´,`_ADR_VARS_RESET´)
define(`_LOOP_NAME´,`ADRESS-SDG: alle Adressen der Sendung´)
define(ADRESS_SDG, _SDG_VARS_INIT _LOOP)


/*
ADRESS_KL  Schleife ueber aller Adressen einer Adress-Klasse und LAND
          ZUFELD1A: Adress-Klassengruppe
          ZUFELD2A: Adress-Klasse
*/
define(`_LOOP_SELECT´,`"SELECT _ADR_VARS_SELECT  \
         FROM sadr_adresse, sakz_klaszo \
         WHERE akz_adrid = adr_adrid \
         AND akz_akgid = :ZUFELD1A \
         AND akz_aklid = :ZUFELD2A "
			|| l_statement1 ||" "|| l_p_where ||" \
			ORDER BY "|| l_p_orderby || " adr_sort \
         INTO _ADR_VARS_INTO"´)

define(`_LOOP_VARS´,`_ADR_VARS_LOOP´)
define(`_LOOP_RSET´,`_ADR_VARS_RESET´)
define(`_LOOP_NAME´,`ADR-KL-LAND: Adressen nach Adressklasse und Land´)
define(ADR_KL_LAND,` l_statement1 = "";
if (@getwert(LAND) > " ")
	{
		l_staid = LAND;
		l_statement1 = " AND adr_staid = :l_staid ";
	}
if (@getwert(REGION) > " ")
	{
		l_region = REGION;
		l_statement1 = l_statement1 || " AND \
			exists (select 1 from sreg_region, sort_ort \
			where ort_staid = adr_staid \
			and ort_staid = reg_staid \
			and ort_regid = reg_regid\
			and ort_ortid = adr_ortid \
			and reg_bez like :l_region) ";
if (@getwert(AG_ID) > " ")
        {
                l_ag_id = AG_ID;
                @SqlImmediate ("SELECT sorg.GET_RANGE_CONDITION('adr_adrid',sorg.get_org_range_search(:l_ag_id)) \
                                FROM  dual INTO  :l_orgid_where");
                if (l_orgid_where > " ")
                {
                l_statement1 =  l_statement1 || " AND " || l_orgid_where;
                }
        }

}´ _LOOP)

/*************************************************************************
ALLGEMEINE-SCHLEIFE max. 10000 Durchlaeufe
*/

define(`ALLGEMEINE_SCHLEIFE´,`
@save_vars(ANZAHL,l_loopCur);
l_loopCur = 0-999;
ANZAHL = 0;
while (@getwert(ANZAHL) < 10000)
{
   ANZAHL = @getwert(ANZAHL) + 1;´)

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)

/*************************************************************************
VORGABE_SSDT_-SCHLEIFE sdg+sdb
*/

define(`VORGABE_SSDT_LOOP´,`
@save_vars(l_cur_sect, l_loopCur, TEXT, ZEILE_ID, SDG_TEXT_TYP);
l_loopCur = 0-999;
l_cur_sect = @GetFirstSection( FALSE );
@print(@sprintf(@nls_gettext_x("li_mc.loop.name") || " VORGABE_SSDT_L" || "OOP"));
while ( l_cur_sect > "" ) {
	if ( @xmatch( l_cur_sect, "SSDT_%" ) == TRUE ) { 
		TEXT = @GetItemValue(l_cur_sect,"TEXT");
		ZEILE_ID = @GetItemValue(l_cur_sect,"LFZL");
		SDG_TEXT_TYP = @GetItemValue(l_cur_sect,"TYP");
		if (@getwert(ZEILE_ID) == 0) {
			@print("SDG_TEXT_TYP:(" || @getwert(SDG_TEXT_TYP) || "),TEXT:(" || @getwert(TEXT) || ")");
		} else {
			@print("SDB_TEXT_TYP:(" || @getwert(SDG_TEXT_TYP) || "),TEXT:(" || @getwert(TEXT) || "), ZEILE_ID:(" || ZEILE_ID || ")");
		}

		define(`_LOOPEND_COMMAND´,`} l_cur_sect = @GetNextSection( l_cur_sect, FALSE );´)
´)

/*************************************************************************
LIST-LOOP Schleife ueber eine LI-Variable mit Trennzeichen getrennten Werten
*/

define(`VARIABLE_DIFF_LOOP´,`
	@save_vars(ANZAHL,l_loopCur,l_ANZAHL,l_heu,l_trennz,l_TEXT,l_pos_start,l_pos_trenn_end,l_length, l_length_heu, l_old_value, l_new_value, l_p1_new);
	l_p1_new = "";
	l_heu = @getwert(P1);
	l_trennz = @getwert(P2);
	l_loopCur = 0-999; 
	l_ANZAHL = 0;
	if ( l_trennz <= "" ) {
		l_trennz = ";";
	}
	l_length = @length( l_trennz );
	l_length_heu = @length( l_heu );
	l_pos_trenn_end = 1 - l_length;
	@print( "VARIABLE_D" || "IFF_LOOP" );
	while ( TRUE ) {
		l_ANZAHL = l_ANZAHL + 1;

		l_pos_start = l_pos_trenn_end + l_length;
		if ( l_pos_start+0 > l_length_heu+0 ) {
			break;
		}
		l_pos_trenn_end = @pos( l_heu, l_trennz, l_pos_start+0 );

		if ( l_pos_trenn_end+0 > 0 ) {
			if ( l_pos_trenn_end - l_pos_start > 0 ) {
				l_TEXT = @substr ( l_heu, l_pos_start, l_pos_trenn_end - l_pos_start );
			} else {
				l_TEXT = "";
			}
		} else {
			l_pos_trenn_end = l_length_heu;
			l_TEXT = @substr ( l_heu, l_pos_start );
		}

		if (l_TEXT > "") {
			l_old_value = @GetItemValue( "VARIABLE_OLD", l_TEXT);
			l_new_value = @GetItemValue( "VARIABLE", l_TEXT);
			if ( l_old_value != l_new_value )
			{
				if (l_p1_new > "") {
					l_p1_new = l_p1_new || l_trennz || l_TEXT;
				} else {
					l_p1_new = l_TEXT;
				}
			}
		}
	}
	l_heu = l_p1_new;
	l_ANZAHL = 0;
	l_length_heu = @length( l_heu );
	l_pos_trenn_end = 1 - l_length;
	while ( TRUE ) {
		l_ANZAHL = l_ANZAHL + 1;

		l_pos_start = l_pos_trenn_end + l_length;
		if ( l_pos_start+0 > l_length_heu+0 ) {
			break;
		}
		l_pos_trenn_end = @pos( l_heu, l_trennz, l_pos_start+0 );

		if ( l_pos_trenn_end+0 > 0 ) {
			if ( l_pos_trenn_end - l_pos_start > 0 ) {
				l_TEXT = @substr ( l_heu, l_pos_start, l_pos_trenn_end - l_pos_start );
			} else {
				l_TEXT = "";
			}
		} else {
			l_pos_trenn_end = l_length_heu;
			l_TEXT = @substr ( l_heu, l_pos_start );
		}

		l_old_value = @GetItemValue( "VARIABLE_OLD", l_TEXT);
		l_new_value = @GetItemValue( "VARIABLE", l_TEXT);

		@print( l_ANZAHL || ". " || l_TEXT || ": (" || l_old_value || ") -> (" || l_new_value || ")" );
		ANZAHL = l_ANZAHL;
		TEXT = l_TEXT;
		NEW_VALUE = l_new_value;
		OLD_VALUE = l_old_value;
´)

/*************************************************************************
LIST-LOOP Schleife ueber eine LI-Variable mit Trennzeichen getrennten Werten
*/

define(`LIST_LOOP´,`
	@save_vars(ANZAHL,TEXT,l_loopCur,l_ANZAHL,l_heu,l_trennz,l_TEXT,l_pos_start,l_pos_trenn_end,l_length, l_length_heu);
	l_heu = @getwert(P1);
	l_trennz = @getwert(P2);
	l_loopCur = 0-999; 
	l_ANZAHL = 0;
	if ( l_trennz <= "" ) {
		l_trennz = ";";
	}
	l_length = @length( l_trennz );
	l_length_heu = @length( l_heu );
	l_pos_trenn_end = 1 - l_length;
	@print( @sprintf(@nls_gettext_x("li_mc.list_loop.list_all")) );
	while ( TRUE ) {
		l_ANZAHL = l_ANZAHL + 1;

		l_pos_start = l_pos_trenn_end + l_length;
		if ( l_pos_start+0 > l_length_heu+0 ) {
			break;
		}
		l_pos_trenn_end = @pos( l_heu, l_trennz, l_pos_start+0 );

		if ( l_pos_trenn_end+0 > 0 ) {
			if ( l_pos_trenn_end - l_pos_start > 0 ) {
				l_TEXT = @substr ( l_heu, l_pos_start, l_pos_trenn_end - l_pos_start );
			} else {
				l_TEXT = "";
			}
		} else {
			l_pos_trenn_end = l_length_heu;
			l_TEXT = @substr ( l_heu, l_pos_start );
		}

		@print( @sprintf(@nls_gettext_x("li_mc.list_loop.list_loop")) );
		ANZAHL = l_ANZAHL;
		TEXT = l_TEXT;
´)

/*************************************************************************
Schleifen Ladelistentrennkennzeichen der Fahrt
*/


/*
ZOLLTKZ_FAHRT Ladungsschleife ueber alle Ladelistentrennkennzeichen der Fahrt
*/

define(`_LOOP_SELECT´,`"SELECT sdg_ladeliste \
            FROM ssdg_sendung, slaf_leistanf \
            WHERE laf_farid = :FARID  \
            AND  laf_sdgid = sdg_sdgid  \
				AND  laf_latid = 'TR' \
				and  laf_lasid < '900' "|| l_p_where ||" \
				group by sdg_ladeliste \
             INTO :ZOLLTKZ" ´)

define(`_LOOP_VARS´,_LDG_VARS)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,`ZOLLTKZ-FAHRT: alle Zollladelisten-Trennkennzeichen der Fahrt´)
define(`ZOLLTKZ_FAHRT´, _LOOP  )
undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)


/*************************************************************************
Schleifen Adressklassen -gruppen zu einer Adresse
*/


/*
ADRID_KLSGRP Adressklassen -gruppen zu einer Adresse
*/

define(`_LOOP_SELECT´,`"SELECT akz_aklid, akz_akgid \
            FROM sakz_klaszo \
            WHERE akz_adrid = :ADRID "|| l_p_where ||" \
            INTO :ADRID_KLS, :ADRID_GRP" ´)

define(`_LOOP_VARS´,`ADRID_KLS, ADRID_GRP´)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,`ADRID-KLSGRP: Alle Adressklassen -gruppen einer Adresse´)
define(`ADRID_KLSGRP´, _LOOP  )
undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)


/*
BUC_SDG Buchungen zu einer Sendung
*/

define(`_LOOP_SELECT´,`"SELECT buc_bucid, buc_bstid \
            FROM abuc_buchung \
            WHERE buc_sdgid = :SDGID \
            INTO :BUCID, :BUC_STATUS" ´)

define(`_LOOP_VARS´,`BUCID,BUC_STATUS´)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,`BUC-SDG: Alle Buchungen zu einer Sendung´)
define(`BUC_SDG´, _LOOP  )
undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)



/*
LA-BELEG  Alle LAs zu einem Beleg
*/

define(`_LOOP_SELECT´,`"SELECT laf_lafid, laf_lasid, laf_latid, laf_lauid, xab_ref \
         FROM  sxab_laabrech, slaf_leistanf \
         WHERE laf_belid = :l_belid \
			AND xab_lafid = laf_lafid "|| l_p_where || " \
         INTO :LAFID, :LASID, :LATID, :LAUID, :REFERENZ" ´)

define(`_LOOP_VARS´, `LAFID, LASID, REFERENZ´)
define(`_LOOP_RSET´, `LAF_CODE1, LAF_CODE2, BETREFF´)
define(`_LOOP_NAME´,`LA-BELEG: alle LAs zu einem Beleg´)
define(`LA_BELEG´,`l_belid = @getwert(BELID); ´ _LOOP)

/*************************************************************************
Abrechnungszeilen
*/

define(`_ABZ_VARS_LOOP´, `SPCD, TEXT, BETRAG, KD_BETRAG, KD_WRGID,
			LAFID, LATID, LASID,
			K_AB_ID, K_RELID, K_LDATUM, K_SDGID, K_FARID, K_LTYID, K_VKMID, K_LAFID, ABZID´)
define(`_ABZ_VARS_RESET´,  `LAUID, BETREFF´)
define(`_ABZ_VARS_SELECT´, `abz_spcid, Substr(abz_text,1,250), \
			decode(abz_satzkz,'A',0, abz_betnto), \
			decode(abz_satzkz,'A',0, abz_kwnto), decode(bel_belid,null,abz_dwrgid,bel_kwrgid), \
			abz_lafid, laf_latid, laf_lasid, \
			abz_orgidk, abz_relid, to_char(abz_kper,'YYYY.MM.DD HH24:MI'), abz_sdgid, abz_farid, abz_ltyid, abz_vkmid, abz_traegerlafid, abz_abzid´)
define(`_ABZ_VARS_INTO´,   `:SPCD, :TEXT, :BETRAG, :KD_BETRAG, :KD_WRGID, \
			:LAFID, :LATID, :LASID, \
			:K_AB_ID, :K_RELID, :K_LDATUM, :K_SDGID, :K_FARID, :K_LTYID, :K_VKMID, :K_LAFID, :ABZID´)

define(`_LOOP_VARS´, `_ABZ_VARS_LOOP´)
define(`_LOOP_RSET´, `_ABZ_VARS_RESET´)

/*
ABR-ZEILEN-SDG  Schleife ueber alle Abrechnungszeilen (Spesencodes) der Sendung
*/

define(`_LOOP_SELECT´,`"SELECT _ABZ_VARS_SELECT \
         FROM svab_abrech \
         WHERE status < 2 \
         AND abz_sdgid = :SDGID "|| l_p_where ||" \
			ORDER BY abz_lafid, abz_abzid \
         INTO _ABZ_VARS_INTO" ´)

define(`_LOOP_NAME´,`ABR-ZEILEN-SDG: alle Abrechnungszeilen der Sendung´)
define(ABR_ZEILEN_SDG,_LOOP)

/*
ABR-ZEILEN-FARSDG Schleife ueber alle Abrechnungszeilen (Spesencodes)
         der Fahrt und der dazugehoerigen Sendungen
*/

define(`_LOOP_SELECT´,`"SELECT _ABZ_VARS_SELECT \
			FROM	svab_abrech \
			WHERE	status < 2 \
			AND	abz_farid is null \
			AND	abz_sdgid IN ( \
				SELECT	laf_sdgid \
				FROM	slaf_leistanf \
				WHERE	sxtr.get_farid_haupt(laf_sdgid) = laf_farid ) \
				AND	laf_latid = 'TR' \
				AND	laf_lasid < '900' \
				AND	laf_lasid > '200' \
				AND	laf_farid = :FARID "|| l_p_where ||" \
			UNION \
			SELECT	_ABZ_VARS_SELECT \
			FROM	svab_abrech  \
			WHERE	status < 2 \
			AND	abz_farid = :FARID "|| l_p_where ||" \
			ORDER BY abz_lafid \
         INTO _ABZ_VARS_INTO" ´)

define(`_LOOP_NAME´,`ABR-ZEILEN-FARSDG: alle Abrechnungszeilen der Fahrt´)
define(ABR_ZEILEN_FARSDG,_LOOP)

/*
ABR-ZEILEN-SAMMEL  Schleife ueber alle Abrechnungszeilen (Spesencodes) der
			gerade verarbeiteten Sammelfakturen-Endabrechnung
*/

define(`_LOOP_SELECT´,`"SELECT _ABZ_VARS_SELECT \
         FROM sbel_beleg, slaf_leistanf,sabz_abrzl \
         WHERE laf_lasid = '556' \
         AND abz_lafid = laf_lafid \
         AND laf_belid = bel_belid \
			AND laf_adrid = :ADRID_RE \
			AND laf_lafid != :l_lafid "|| l_p_where ||" \
			ORDER BY abz_lafid, abz_abzid \
         INTO _ABZ_VARS_INTO" ´)

define(`_LOOP_NAME´,`ABR-ZEILEN-SAMMEL: alle Abrechnungszeilen der Sammelabrechnung´)
define(`ABR_ZEILEN_SAMMEL´,`l_lafid = @getwert(LAFID); ´ _LOOP)

/*
ABR-ZEILEN-LA  Schleife ueber alle Abrechnungszeilen einer LA
*/

define(`_LOOP_SELECT´,`"SELECT _ABZ_VARS_SELECT \
         FROM  sbel_beleg, slaf_leistanf,sabz_abrzl \
         WHERE laf_lafid = :l_lafid \
         AND   laf_belid = bel_belid(+) \
			AND	laf_lafid = abz_lafid "|| l_p_where ||" \
			ORDER BY abz_lafid, abz_abzid \
         INTO _ABZ_VARS_INTO" ´)

define(`_LOOP_NAME´,`ABR-ZEILEN-LA: alle Abrechnungszeilen eine LA´)
define(`ABR_ZEILEN_LA´,`l_lafid = @getwert(LAFID); ´ _LOOP)

/*************************************************************************
Fahrt-Schleifen
*/

define(`_FAR_VARS_LOOP´, `FARID, FAHRTSTATUS, FAHRT_VON, FAHRT_BIS, ADRID_FR,
			FAHRTTYP, FAHRTBEZ, RELATION, K_AB_ID, K_RELID, K_FARID, K_LDATUM, FAHRT_VON_TZNAME,
			FAHRT_BIS_TZNAME´)
define(`_FAR_VARS_RESET´,  `FAHRTTEXT, FAHRTLADETEXT, VKMID, VKMKZ, VKMKZINT´)
define(`_FAR_VARS_SELECT´, `far_farid, far_lasid \
         , to_char(far_datvon,'YYYY.MM.DD HH24:MI') \
         , to_char(far_datbis,'YYYY.MM.DD HH24:MI') \
			, far_frfid, far_ftyid, far_bez \
			, far_relid, far_farid, far_relid \
         , to_char(nvl(far_datvon,far_datbis),'YYYY.MM.DD HH24:MI') \
			, decode(org_kst, 1, org_orgid, org_orgidh ) \
			, far_datvon_tzname, far_datbis_tzname \
			´)
define(`_FAR_VARS_INTO´, `:FARID, :FAHRTSTATUS \
			,:FAHRT_VON, :FAHRT_BIS \
			,:ADRID_FR, :FAHRTTYP, :FAHRTBEZ \
			,:RELATION, :K_FARID, :K_RELID \
			,:K_LDATUM \
			,:K_AB_ID \
			,:FAHRT_VON_TZNAME \
			,:FAHRT_BIS_TZNAME´)

define(`_LOOP_VARS´, `_FAR_VARS_LOOP´)
define(`_LOOP_RSET´, `_FAR_VARS_RESET´)

/*
FAHRTEN-AG-ID  Schleife ueber alle Fahrten einer Arbeitsgruppe
              	im Zeitraum DATUM_VON und DATUM_BIS
*/

define(`_LOOP_SELECT´,`"SELECT _FAR_VARS_SELECT \
         FROM sorg_t_einheit, sfar_fahrt \
         WHERE far_orgid = :AG_ID \
         AND   far_datvon >= to_date(Substr (:DATUM_VON,1,10),'YYYY.MM.DD') \
			AND   far_datvon <  to_date(Substr (:DATUM_BIS,1,10),'YYYY.MM.DD') +1 \
			AND   far_orgid = org_orgid " || l_p_where || " \
			ORDER BY  "|| l_p_orderby || " far_datvon \
         INTO _FAR_VARS_INTO" ´)

define(`_LOOP_NAME´,`FAHRTEN-AG_ID: alle Fahrten der AG_ID´)
define(FAHRTEN_AG_ID,_LOOP)

/*************************************************************************
Lademittelbewegungs-Schleife
*/
define(`_LAD_VARS_LOOP´, `ADRID, ZEILE_ANZ, ZEILE_ART, LADEMITC, LADID, LAD_SUMQUALITY, LAD_QUALITY´)
define(`_LAD_VARS_SELECT´, `lad_adrid, lad_anz, lad_vepid, lad_lmbid, lad_ladid, lad_sumquality, lad_quality´)
define(`_LAD_VARS_INTO´, `:ADRID, :ZEILE_ANZ, :ZEILE_ART, :LADEMITC, :LADID, :LAD_SUMQUALITY, :LAD_QUALITY´)

define(`_LOOP_VARS´, `_LAD_VARS_LOOP´)
undefine(`_LOOP_RSET´)

/*************************************************************************/
/* Lademittel der Sendung */

define(`_LOOP_SELECT´,`"SELECT _LAD_VARS_SELECT \
         FROM slad_ladmit \
         WHERE lad_sdgid = :l_sdgid "|| l_p_where ||" \
			ORDER BY lad_vepid, lad_ref, lad_lmbid \
         INTO _LAD_VARS_INTO" ´)

define(`_LOOP_NAME´,`LADEMITTTEL-SDG: alle Lademittelbewegungen der Sendung´)
define(LADEMITTEL_SDG, _SDG_VARS_INIT _LOOP)

/*************************************************************************/
/* Lademittel der Lagerbuchung */

define(`_LOOP_SELECT´,`"SELECT _LAD_VARS_SELECT \
         FROM slad_ladmit \
         WHERE lad_bucid = :l_bucid "|| l_p_where ||" \
			ORDER BY lad_vepid, lad_ref, lad_lmbid \
         INTO _LAD_VARS_INTO" ´)

define(`_LOOP_NAME´,`LADEMITTTEL-BUC: alle Lademittelbewegungen der Buchung´)
define(LADEMITTEL_BUC, l_bucid = @getwert(BUCID); _LOOP)

/*************************************************************************/
/* Lademittel der Fahrt */

define(`_LOOP_SELECT´,`"SELECT _LAD_VARS_SELECT, lad_ltyid, lad_sdgid \
         FROM slad_ladmit \
         WHERE lad_farid = :l_farid "|| l_p_where ||" \
			ORDER BY lad_vepid, lad_ref, lad_lmbid \
         INTO _LAD_VARS_INTO, :LTYID, :SDGID" ´)

define(`_LOOP_VARS´, `_LAD_VARS_LOOP, LTYID, SDGID´)
define(`_LOOP_NAME´,`LADEMITTTEL-FAR: alle Lademittelbewegungen der Fahrt´)
define(LADEMITTEL_FAR, l_farid = @getwert(FARID); _LOOP)

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)

/*************************************************************************/
/* Include fuer Lager */
#include <lager.mc>

/* Include fuer Schweizer Zoll */
#include <chz.mc>

#define LOOP(loopname,loopwhere,sort,p1,p2,p3, p4, p5, p6) \
_loop_m4(`loopname´,`loopwhere´,`sort´,`p1´,`p2´,`p3´,`p4´,`p5´,`p6´)

define(`_loop_m4´, `
ifelse(`$4´,,,P1=_ref_stable(`$4´);)
ifelse(`$5´,,,P2=_ref_stable(`$5´);)
ifelse(`$6´,,,P3=_ref_stable(`$6´);)
ifelse(`$7´,,,P4=_ref_stable(`$7´);)
ifelse(`$8´,,,P5=_ref_stable(`$8´);)
ifelse(`$9´,,,P6=_ref_stable(`$9´);)
l_p_where   = ifelse($2,,"", " AND _rmhk($2)");
if (@getwert(ZZWHERE) > " ") {
	l_p_where = l_p_where || " AND " || ZZWHERE;
	@print( @sprintf(@nls_gettext_x("li_mc.loop.zusatz")) );
	ZZWHERE = "";
}
l_p_orderby = translit(ifelse($3,,"", `$3 || ";"´),`;´,`,´);´ 
_rmhk($1) 
`pushdef( `_LOOPEND_COMMAND_STACK´,ifdef(`_LOOPEND_COMMAND´,`_LOOPEND_COMMAND´,`´)) ´
`undefine(`_LOOPEND_COMMAND´)´
)

define(`LOOPEND´, `_LOOPEND_COMMAND_STACK´ `popdef(`_LOOPEND_COMMAND_STACK´)´ _LOOP_END)

/*************************************************************************
Lesen Adressen lt. Sendungsadresstyp oder lt. Adress-Id
-Adress-Variable im adr-Loop definiert
*/

define(`LADRESSE´,
`ifelse($1,,`
l_temp = ifelse($2,,"",$2);
if (l_temp == "")
{
	l_temp = @getwert(ADRID);
}
l_extern = ifelse($3,,"",_ref($3));
ifelse($3,,`l_sql = "SELECT _ADR_VARS_SELECT FROM sadr_adresse WHERE adr_adrid = :l_temp INTO _ADR_VARS_INTO"; ´
	, ` if (l_extern > " " ) { 
		l_sql = "SELECT _ADU_VARS_SELECT FROM sadu_adrums WHERE adu_adridfuer = :l_temp AND adu_idextern = :l_extern INTO _ADU_VARS_INTO"; 
	} else { 
		l_sql = "SELECT _ADR_VARS_SELECT FROM sadr_adresse WHERE adr_adrid = :l_temp INTO _ADR_VARS_INTO";}´)
´ ,`l_temp = $1;
l_sql = "SELECT _ADR_VARS_SELECT, sda_ref FROM ssda_sdgadr, sadr_adresse WHERE adr_adrid = sda_adrid AND sda_satid = :l_temp AND sda_sdgid = :SDGID INTO _ADR_VARS_INTO, :REFERENZ";´
)´ 
ADRID = 0; 
@SqlImmediate(l_sql);)

/*************************************************************************
Lesen Zusatzattribut zu Adresse(ADR),
	Sendung(SDG),
	Sendungsbeschreibungszeile ((SDB),
	Lager
	Parameter 1: Typ, 2: Attributname, 3:Ergebnisvariable, 4:Key

*/
define(`LZUSATZ´,
`
l_attribut = $2;
l_into = "";
ifelse($1,"ADR",`l_key = ifelse($4,,ADRID,ifelse(substr($4,0,1),",@sprintf($4),$4)); l_key2 = 0; \
l_key_ausgabe = l_key;
@SqlImmediate ("SELECT aat_wert \
				FROM  saat_adratt \
				WHERE aat_adrid  = :l_key \
				AND   aat_attid  = :l_attribut \
				INTO  :l_into");´,) \
ifelse($1,"KUN",`l_key = ifelse($4,,KUNID,ifelse(substr($4,0,1),",@sprintf($4),$4)); l_key2 = 0; \
l_key_ausgabe = l_key;
@SqlImmediate ("SELECT kat_wert \
            FROM  skat_kunatt \
            WHERE kat_kunid  = :l_key \
            AND   kat_attid  = :l_attribut \
            INTO  :l_into");´,) \
ifelse($1,"ZRL",`l_key = RELATION; l_key2 = ifelse($4,,\
""; \
l_ag_id = @getwert(AG_ID);   \
l_ab_id = @getwert(AB_ID);   \
if ( l_ag_id == "" & l_ab_id == "" ) {   \
 @meldung(@nls_gettext_x("li_mc.lzusatz.meldung1")); \
 return(0 - 12); \
} \
,$4;)  \
l_key_ausgabe = l_key || " " || l_key2;
@SqlImmediate ("SELECT zat_wert \
				FROM  szat_zrlatt \
				WHERE zat_orgid  =  \
			ifelse($4,,sorg.get_kst(:l_ag_id,:l_ab_id,NULL),:l_key2) \
				AND   zat_relid  = :l_key \
				AND   zat_attid  = :l_attribut \
				INTO  :l_into");´,) \
ifelse($1,"SDB",`l_key = SDGID; l_key2 = ifelse($4,,ZEILE_ID,$4);  \
l_key_ausgabe = l_key || " " || l_key2;
@SqlImmediate ("SELECT sba_wert \
				FROM ssba_attr   \
				WHERE sba_sdgid  = :l_key \
				AND   sba_lfzl   = :l_key2 \
				AND   sba_attid  = :l_attribut \
				INTO  :l_into");´,)\
ifelse($1,"SDG",`l_key = ifelse($4,,SDGID,ifelse(substr($4,0,1),",@sprintf($4),$4)); l_key2 = 0; \
l_key_ausgabe = l_key;
@SqlImmediate ("SELECT sba_wert \
				FROM ssba_attr   \
				WHERE sba_sdgid  = :l_key \
				AND   sba_lfzl   = :l_key2 \
				AND   sba_attid  = :l_attribut \
				INTO  :l_into");´,)\
ifelse($1,"FAR",`l_key = ifelse($4,,FARID,ifelse(substr($4,0,1),",@sprintf($4),$4)); l_key2 = 0; \
l_key_ausgabe = l_key;
@SqlImmediate ("SELECT fat_wert \
				FROM sfat_faratt \
				WHERE fat_farid  = :l_key \
				AND   fat_attid  = :l_attribut \
				INTO  :l_into");´,) \
ifelse($1,"LVE",`l_key = ifelse($4,,LVEID,ifelse(substr($4,0,1),",@sprintf($4),$4)); l_key2 = 0; \
l_key_ausgabe = l_key;
@SqlImmediate ("SELECT lat_wert \
				FROM alat_attr   \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ALVE' \
				AND   lat_attid  = :l_attribut \
				INTO  :l_into");´,)\
ifelse($1,"ART",`l_key = ifelse($4,,ARTID,ifelse(substr($4,0,1),",@sprintf($4),$4)); l_key2 = 0; \
l_key_ausgabe = l_key;
@SqlImmediate ("SELECT lat_wert \
				FROM alat_attr   \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'AART' \
				AND   lat_attid  = :l_attribut \
				INTO  :l_into");´,)\
ifelse($1,"BPO",`l_key = ifelse($4,,BPOID,ifelse(substr($4,0,1),",@sprintf($4),$4)); l_key2 = 0; \
l_key_ausgabe = l_key;
@SqlImmediate ("SELECT lat_wert \
				FROM alat_attr   \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ABPO' \
				AND   lat_attid  = :l_attribut \
				INTO  :l_into");´,)\
ifelse($1,"BUC",`l_key = ifelse($4,,BUCID,ifelse(substr($4,0,1),",@sprintf($4),$4)); l_key2 = 0; \
l_key_ausgabe = l_key;
@SqlImmediate ("SELECT lat_wert \
				FROM alat_attr   \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ABUC' \
				AND   lat_attid  = :l_attribut \
				INTO  :l_into");´,)\
ifelse($1,"BEW",`l_key = ifelse($4,,BEWID,ifelse(substr($4,0,1),",@sprintf($4),$4)); l_key2 = 0; \
l_key_ausgabe = l_key;
@SqlImmediate ("SELECT lat_wert \
				FROM alat_attr   \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ABEW' \
				AND   lat_attid  = :l_attribut \
				INTO  :l_into");´,)\
ifelse($1,"LPL",`l_key = ifelse($4,,LPLID,ifelse(substr($4,0,1),",@sprintf($4),$4)); l_key2 = 0; \
l_key_ausgabe = l_key;
@SqlImmediate ("SELECT lat_wert \
				FROM alat_attr   \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ALPL' \
				AND   lat_attid  = :l_attribut \
                                INTO  :l_into");´,)\
ifelse($1,"LAF",`l_key = ifelse($4,,LAFID,ifelse(substr($4,0,1),",@sprintf($4),$4)); l_key2 = 0; \
l_key_ausgabe = l_key;
@SqlImmediate ("SELECT atl_wert \
				FROM satl_attr   \
				WHERE atl_lafid     = :l_key \
				AND   atl_attid  = :l_attribut \
				INTO  :l_into");´,)\
ifelse($1,"ADU",`l_key = ADRID; l_key2 = ifelse($4,,IDEXTERN,$4);  \
l_key_ausgabe = l_key || " " || l_key2;
@SqlImmediate ("SELECT ada_wert \
				FROM sada_adrumsattr   \
				WHERE ada_adridfuer  = :l_key \
				AND   ada_idextern = :l_key2 \
				AND   ada_attid  = :l_attribut \
				INTO  :l_into");´,)\
ifelse($1,"VKM",`l_key = ifelse($4,,VKMID,ifelse(substr($4,0,1),",@sprintf($4),$4)); l_key2 = 0; \
l_key_ausgabe = l_key;
@SqlImmediate ("SELECT vka_wert \
				FROM svka_vkmatt   \
				WHERE vka_vkmid     = :l_key \
				AND   vka_attid  = :l_attribut \
				INTO  :l_into");´,)\
ifelse($1,"STO",`l_key = FARID; l_key2 = ifelse($4,,STOID,$4);  \
l_key_ausgabe = l_key || " " || l_key2;
@SqlImmediate ("SELECT ats_wert \
				FROM sats_stopatt   \
				WHERE ats_farid  = :l_key \
				AND   ats_stoid  = :l_key2 \
				AND   ats_attid  = :l_attribut \
				INTO  :l_into");´,)\
@print( @sprintf(@nls_gettext_x("li_mc.lzusatz.lesen_zusatz"))|| $1 || " (" || l_key_ausgabe || ") : (" || $2 || ") = (" || l_into || ")" );
$3 = l_into;´)\


/*************************************************************************
Speichern Zusatzattribut Sendung(SDG),
	Sendungsbeschreibungszeile ((SDB),
	Lager
	Parameter 1: Typ, 2: Attributname, 3:Wert/Variable, 4:Key

*/
define(`SZUSATZ´,
`l_attribut = $2;
l_wert = _ref(`$3´);
l_into = "";
ifelse($1,"SDG",` l_key = ifelse($4,,SDGID,ifelse(substr($4,0,1),",@sprintf($4),$4 )); l_key2 = 0; \
l_key_ausgabe = l_key;
l_select = "SELECT sba_wert \
				FROM ssba_attr   \
				WHERE sba_sdgid  = :l_key \
				AND   sba_lfzl   = :l_key2 \
				AND   sba_attid  = :l_attribut \
            FOR UPDATE OF sba_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE ssba_attr \
				SET sba_wert = :l_wert \
				WHERE sba_sdgid  = :l_key \
				AND   sba_lfzl   = :l_key2 \
				AND   sba_attid  = :l_attribut";
l_insert = "INSERT INTO ssba_attr \
				(sba_sdgid, sba_lfzl, sba_attid, sba_wert) \
				VALUES \
				(:l_key, :l_key2, :l_attribut, :l_wert)";´,)
ifelse($1,"FAR",` l_key = ifelse($4,,FARID,ifelse(substr($4,0,1),",@sprintf($4),$4 )); l_key2 = 0; \
l_key_ausgabe = l_key;
l_select = "SELECT fat_wert \
				FROM sfat_faratt   \
				WHERE fat_farid  = :l_key \
				AND   fat_attid  = :l_attribut \
            FOR UPDATE OF fat_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE sfat_faratt \
				SET fat_wert = :l_wert \
				WHERE fat_farid  = :l_key \
				AND   fat_attid  = :l_attribut";
l_insert = "INSERT INTO sfat_faratt \
				(fat_farid, fat_attid, fat_wert) \
				VALUES \
				(:l_key, :l_attribut, :l_wert)";´,)

ifelse($1,"SDB",`l_key = SDGID; l_key2 = ifelse($4,,ZEILE_ID,$4); \
l_key_ausgabe = l_key || " " || l_key2;
l_select = "SELECT sba_wert \
				FROM ssba_attr   \
				WHERE sba_sdgid  = :l_key \
				AND   sba_lfzl   = :l_key2 \
				AND   sba_attid  = :l_attribut \
            FOR UPDATE OF sba_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE ssba_attr \
				SET sba_wert = :l_wert \
				WHERE sba_sdgid  = :l_key \
				AND   sba_lfzl   = :l_key2 \
				AND   sba_attid  = :l_attribut";
l_insert = "INSERT INTO ssba_attr \
				(sba_sdgid, sba_lfzl, sba_attid, sba_wert) \
				VALUES \
				(:l_key, :l_key2, :l_attribut, :l_wert)";´ ,)

ifelse($1,"LVE",` l_key = ifelse($4,,LVEID,ifelse(substr($4,0,1),",@sprintf($4),$4 )); l_key2 = 0; \
l_key_ausgabe = l_key;
l_select = "SELECT lat_wert \
				FROM alat_attr   \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ALVE' \
				AND   lat_attid  = :l_attribut \
            FOR UPDATE OF lat_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE alat_attr \
				SET lat_wert = :l_wert \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ALVE' \
				AND   lat_attid  = :l_attribut";
l_insert = "INSERT INTO alat_attr \
				(lat_id, lat_tabid, lat_attid, lat_wert) \
				VALUES \
				(:l_key, 'ALVE', :l_attribut, :l_wert)";´ ,)

ifelse($1,"ART",` l_key = ifelse($4,,ARTID,ifelse(substr($4,0,1),",@sprintf($4),$4 )); l_key2 = 0; \
l_key_ausgabe = l_key;
l_select = "SELECT lat_wert \
				FROM alat_attr   \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'AART' \
				AND   lat_attid  = :l_attribut \
            FOR UPDATE OF lat_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE alat_attr \
				SET lat_wert = :l_wert \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'AART' \
				AND   lat_attid  = :l_attribut";
l_insert = "INSERT INTO alat_attr \
				(lat_id, lat_tabid, lat_attid, lat_wert) \
				VALUES \
				(:l_key, 'AART', :l_attribut, :l_wert)";´ ,)

ifelse($1,"BPO",` l_key = ifelse($4,,BPOID,ifelse(substr($4,0,1),",@sprintf($4),$4 )); l_key2 = 0; \
l_key_ausgabe = l_key;
l_select = "SELECT lat_wert \
				FROM alat_attr   \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ABPO' \
				AND   lat_attid  = :l_attribut \
            FOR UPDATE OF lat_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE alat_attr \
				SET lat_wert = :l_wert \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ABPO' \
				AND   lat_attid  = :l_attribut";
l_insert = "INSERT INTO alat_attr \
				(lat_id, lat_tabid, lat_attid, lat_wert) \
				VALUES \
				(:l_key, 'ABPO', :l_attribut, :l_wert)";´ ,)

ifelse($1,"BUC",` l_key = ifelse($4,,BUCID,ifelse(substr($4,0,1),",@sprintf($4),$4 )); l_key2 = 0; \
l_key_ausgabe = l_key;
l_select = "SELECT lat_wert \
				FROM alat_attr   \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ABUC' \
				AND   lat_attid  = :l_attribut \
            FOR UPDATE OF lat_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE alat_attr \
				SET lat_wert = :l_wert \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ABUC' \
				AND   lat_attid  = :l_attribut";
l_insert = "INSERT INTO alat_attr \
				(lat_id, lat_tabid, lat_attid, lat_wert) \
				VALUES \
				(:l_key, 'ABUC', :l_attribut, :l_wert)";´ ,)

ifelse($1,"BEW",` l_key = ifelse($4,,BEWID,ifelse(substr($4,0,1),",@sprintf($4),$4 )); l_key2 = 0; \
l_key_ausgabe = l_key;
l_select = "SELECT lat_wert \
				FROM alat_attr   \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ABEW' \
				AND   lat_attid  = :l_attribut \
            FOR UPDATE OF lat_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE alat_attr \
				SET lat_wert = :l_wert \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ABEW' \
				AND   lat_attid  = :l_attribut";
l_insert = "INSERT INTO alat_attr \
				(lat_id, lat_tabid, lat_attid, lat_wert) \
				VALUES \
				(:l_key, 'ABEW', :l_attribut, :l_wert)";´ ,)

ifelse($1,"LPL",` l_key = ifelse($4,,LPLID,ifelse(substr($4,0,1),",@sprintf($4),$4 )); l_key2 = 0; \
l_key_ausgabe = l_key;
l_select = "SELECT lat_wert \
				FROM alat_attr   \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ALPL' \
				AND   lat_attid  = :l_attribut \
            FOR UPDATE OF lat_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE alat_attr \
				SET lat_wert = :l_wert \
				WHERE lat_id     = :l_key \
				AND   lat_tabid  = 'ALPL' \
				AND   lat_attid  = :l_attribut";
l_insert = "INSERT INTO alat_attr \
				(lat_id, lat_tabid, lat_attid, lat_wert) \
				VALUES \
				(:l_key, 'ALPL', :l_attribut, :l_wert)";´ ,)
				
ifelse($1,"ADR",` l_key = ifelse($4,,ADRID,ifelse(substr($4,0,1),",@sprintf($4),$4 )); l_key2 = 0; \
l_key_ausgabe = l_key;
l_select = "SELECT aat_wert \
				FROM saat_adratt   \
				WHERE aat_adrid     = :l_key \
				AND   aat_attid  = :l_attribut \
            FOR UPDATE OF aat_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE saat_adratt \
				SET aat_wert = :l_wert \
				WHERE aat_adrid     = :l_key \
				AND   aat_attid  = :l_attribut";
l_insert = "INSERT INTO saat_adratt \
				(aat_adrid, aat_attid, aat_wert) \
				VALUES \
				(:l_key, :l_attribut, :l_wert)";´ ,)

ifelse($1,"KUN",` l_key = ifelse($4,,KUNID,ifelse(substr($4,0,1),",@sprintf($4),$4 )); l_key2 = 0; \
l_key_ausgabe = l_key;
l_select = "SELECT kat_wert \
				FROM skat_kunatt   \
				WHERE kat_kunid     = :l_key \
				AND   kat_attid  = :l_attribut \
            FOR UPDATE OF kat_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE skat_kunatt \
				SET kat_wert = :l_wert \
				WHERE kat_kunid     = :l_key \
				AND   kat_attid  = :l_attribut";
l_insert = "INSERT INTO skat_kunatt \
				(kat_kunid, kat_attid, kat_wert) \
				VALUES \
				(:l_key, :l_attribut, :l_wert)";´ ,)

ifelse($1,"STO",`l_key = FARID; l_key2 = ifelse($4,,STOID,$4); \
l_key_ausgabe = l_key || " " || l_key2;
l_select = "SELECT ats_wert \
				FROM sats_stopatt   \
				WHERE ats_farid  = :l_key \
				AND   ats_stoid  = :l_key2 \
				AND   ats_attid  = :l_attribut \
            FOR UPDATE OF ats_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE sats_stopatt \
				SET ats_wert = :l_wert \
				WHERE ats_farid  = :l_key \
				AND   ats_stoid  = :l_key2 \
				AND   ats_attid  = :l_attribut";
l_insert = "INSERT INTO sats_stopatt \
				(ats_farid, ats_stoid, ats_attid, ats_wert) \
				VALUES \
				(:l_key, :l_key2, :l_attribut, :l_wert)";´ ,)

ifelse($1,"ZRL",`l_key = RELATION; l_key2 = ifelse($4,, \
""; \
l_ag_id = @getwert(AG_ID);   \
l_ab_id = @getwert(AB_ID);   \
if ( l_ag_id == "" & l_ab_id == "" ) {   \
 @meldung(@nls_gettext_x("li_mc.szusatz.meldung1")); \
 return(0 - 12); \
} \
,$4;)  \
l_key_ausgabe = l_key || " " || l_key2;
l_select = "SELECT zat_wert \
				FROM  szat_zrlatt \
				WHERE zat_orgid  =  \
			ifelse($4,,sorg.get_kst(:l_ag_id,:l_ab_id,NULL),:l_key2) \
				AND   zat_relid  = :l_key \
				AND   zat_attid  = :l_attribut \
            		FOR UPDATE OF zat_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE szat_zrlatt \
				SET zat_wert = :l_wert \
				WHERE zat_orgid  =  \
			ifelse($4,,sorg.get_kst(:l_ag_id,:l_ab_id,NULL),:l_key2) \
				AND   zat_relid  = :l_key \
				AND   zat_attid  = :l_attribut";
l_insert = "INSERT INTO szat_zrlatt \
				(zat_orgid, zat_relid, zat_attid, zat_wert) \
				VALUES  ( \
			ifelse($4,,sorg.get_kst(:l_ag_id,:l_ab_id,NULL),:l_key2) \
				 ,:l_key, :l_attribut, :l_wert)";´ ,)
ifelse($1,"VKM",` l_key = ifelse($4,,VKMID,ifelse(substr($4,0,1),",@sprintf($4),$4 )); l_key2 = 0; \
l_key_ausgabe = l_key;
l_select = "SELECT vka_wert \
				FROM svka_vkmatt   \
				WHERE vka_vkmid     = :l_key \
				AND   vka_attid  = :l_attribut \
            FOR UPDATE OF vka_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE svka_vkmatt \
				SET vka_wert = :l_wert \
				,vka_usrid = :USRID \
				,vka_aend = sysdate \
				WHERE vka_vkmid     = :l_key \
				AND   vka_attid  = :l_attribut";
l_insert = "INSERT INTO svka_vkmatt \
				(vka_vkmid, vka_attid, vka_wert, vka_usrid, vka_aend) \
				VALUES \
				(:l_key, :l_attribut, :l_wert, :USRID, sysdate )";´ ,)
ifelse($1,"ADU",`l_key = ADRID; l_key2 = ifelse($4,,IDEXTERN,$4); \
l_key_ausgabe = l_key || " " || l_key2;
l_select = "SELECT ada_wert \
				FROM sada_adrumsattr   \
				WHERE ada_adridfuer  = :l_key \
				AND   ada_idextern   = :l_key2 \
				AND   ada_attid  = :l_attribut \
            FOR UPDATE OF ada_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE sada_adrumsattr \
				SET ada_wert = :l_wert \
				WHERE ada_adridfuer  = :l_key \
				AND   ada_idextern   = :l_key2 \
				AND   ada_attid  = :l_attribut";
l_insert = "INSERT INTO sada_adrumsattr \
				(ada_adridfuer, ada_idextern, ada_attid, ada_wert) \
				VALUES \
				(:l_key, :l_key2, :l_attribut, :l_wert)";´ ,)
ifelse($1,"LAF",` l_key = ifelse($4,,LAFID,ifelse(substr($4,0,1),",@sprintf($4),$4 )); l_key2 = 0; \
l_key_ausgabe = l_key;
l_select = "SELECT atl_wert \
				FROM satl_attr   \
				WHERE atl_lafid     = :l_key \
				AND   atl_attid  = :l_attribut \
            FOR UPDATE OF atl_wert NOWAIT \
				INTO  :l_into";
l_update = "UPDATE satl_attr \
				SET atl_wert = :l_wert \
				,atl_usrid = :USRID \
				,atl_aend = sysdate \
				WHERE atl_lafid     = :l_key \
				AND   atl_attid  = :l_attribut";
l_insert = "INSERT INTO satl_attr \
				(atl_lafid, atl_attid, atl_wert,atl_usrid, atl_aend) \
				VALUES \
				(:l_key, :l_attribut, :l_wert, :USRID, sysdate)";´ ,)

@print( @nls_gettext_x("li_mc.szusatz.setzen_zusatz")|| $1 || " (" || l_key_ausgabe || ") : ("|| $2 || ")" || @nls_gettext_x("li_mc.szusatz.setzen_zusatz_mit") || "(" || _ref(`$3´) || ")" );
l_ret = @SqlImmediate(l_select);
if (( l_ret == TRUE ) | (l_wert == "")) {
	if (l_wert == "") {
		/* Achtung Select immer gleich schreiben -
		1. Zeile mit SELECT ... und ab FOR UPDATE ... muss gleich sein
		*/

		if (@substr (l_select, 0-47,10) == "FOR UPDATE") {
			l_delete = "DELETE "|| @substr (l_select,16,@length (l_select) - 64);
			l_ret = @SqlImmediate (l_delete);
		} else {
			@print (@nls_gettext_x("li_mc.szusatz.kein_loeschen")|| @substr (l_select, 0-47,10));
		}
	} else {
		if ( l_into != l_wert) {
			l_ret = @SqlImmediate (l_update);
		}
	}
} else { 
	l_ret = @SqlImmediate(l_insert); 
}
if (l_ret != TRUE)
{ \
	@abort("SQL Error - Format: szusatz "|| $1|| ": "|| $2 ||
	@nls_gettext_x("li_mc.szusatz.setzen_zusatz_mit")|| _ref(`$3´) ||@nls_gettext_x("li_mc.szusatz.setzen_zusatz_fuer")|| l_key); \
} \
´)


/*************************************************************          
SSPL-LOOP Schleife Sendungssplitt
mavo, 3.5.06 
*/

define(`_LOOP_NAME´,`SSPL Schleife´)
define(`_LOOP_VARS´,`SDGID´)
undefine(`_LOOP_RSET´)
define(`_LOOP_SELECT´,`"SELECT distinct zsp_sdgid \
			FROM szsp_sdgsplit \
			WHERE zsp_sdgidm = :l_SDGIDM "|| l_p_where || " INTO :SDGID"´)

define(`SSPL_LOOP´, 

l_SDGIDM = @getwert(SDGIDM);
l_forget = "";

if (@SqlImmediate("SELECT zsp_sdgidm \
		   FROM szsp_sdgsplit \
		   WHERE zsp_sdgidm= :l_SDGIDM INTO :l_forget ") == TRUE) {
	@print (@nls_gettext_x("li_mc.sspl_loop.vorhanden"));
} 
else
{
	@meldung(@nls_gettext_x("li_mc.sspl_loop.fehler"));
}

_LOOP

)

undefine(`_LOOP_NAME´) 
undefine(`_LOOP_VARS´)
undefine(`_LOOP_RSET´)
undefine(`_LOOP_SELECT´)



/*************************************************************          
GEN-TAB Schleife Generische Tabellen
*/

define(`_GENTAB_VARS_INTO´,`:REC_RECID´)
define(`_LOOP_VARS´,`REC_RECID´)
define(`W_GEN_STD_DAT´, `rec_von <= SLAF.LI_TO_DATE('" || @quote2(P1) || "') AND rec_bis >= SLAF.LI_TO_DATE('" || @quote2(P1) || "')´)
define(`_LOOP_SELECT´,`"SELECT REC_RECID FROM GNVW_" || l_tab_tabid || " WHERE 1=1 " || l_p_where_gentab || " INTO :l_rec_recid"´ ) 
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,`GEN" || "_TAB: (" || l_tab_tabid || ")´)
define(`GEN_TAB´,
l_tab_tabid = "";
l_tab_ora_pk = "";
l_rec_recid = "";
l_sql_tab = ("SELECT tab_tabid, tab_ora_pk FROM stab_t_gentabelle WHERE tab_tabid = :TAB_TABID INTO :l_tab_tabid, :l_tab_ora_pk");
l_ret = @SqlImmediate(l_sql_tab);
if ( l_tab_tabid <= "" ) {
	@print ("GEN_"||"TAB: "||@sprintf(@nls_gettext_x("li_mc.gen_tab.nicht_vorhanden")));
} 
if ( l_ret == FALSE ) {
	return (FALSE);
} 
l_old = @xmatch( l_p_where , "%val_%;%rec_tabid%");
if ( l_old == TRUE ) {

	@save_vars(REPORT,SPRACH_LABEL,SPRACHE);
	REPORT = "lbase";
	if ( @getwert(SPRACHE) <= " " ) {
		SPRACHE = @getwert(ZZLANG);
		if ( @getwert(SPRACHE) <= " " ) {
			SPRACHE = "GERMAN";
		}
	}

	if ( l_tab_ora_pk > "" ) {
		l_p_where_gentab = "";
		SPRACH_LABEL = "$LOOP_GEN_TAB_LEGNOK";
	} else {
		l_p_where_gentab = " AND rec_recid IN ( SELECT rec_recid FROM sval_genvalue, srec_genrecord WHERE 1=1 " || l_p_where || " AND val_recid = rec_recid AND rec_tabid = :l_tab_tabid )";
		SPRACH_LABEL = "$LOOP_GEN_TAB_LEG_OK";
	}
	@setzen_feld_original(SPRACH_LABEL);
	@print( @sprintf(@sprintf( "#!SPRACH_LABEL")) );
	@restore_vars();
} else {
	l_p_where_gentab = l_p_where;
}
 _LOOP  
@print("REC_RECID: (" || l_rec_recid || ")" );
REC_RECID = l_rec_recid;
)
   
undefine(`_LOOP_SELECT´) 
undefine(`_LOOP_VARS´)

/*************************************************************          
GEN_TAB_VALUE Schleife Generische Tabellen-Werte
*/

define(`_GEN_TAB_VARS_INTO´,	` :VAL_VALUE, :REC_RECID, :SPA_SPAID, :SPA_SPERRE, :TEXT, :WEBID, :PFLICHTFELD, :TAB_SPERRE ´)
define(`_GEN_TAB_VARS´, 	` VAL_VALUE, REC_RECID, SPA_SPAID, SPA_SPERRE, TEXT, WEBID, PFLICHTFELD, TAB_SPERRE ´)
define(`_LOOP_VARS´,`_GEN_TAB_VARS´)
undefine(`_LOOP_RSET´)
define(`_LOOP_SELECT´,`"SELECT " || l_sel_def || " into _GEN_TAB_VARS_INTO"´)
define(`_LOOP_NAME´,`GEN" || "_TAB_VALUE: (" || l_tab_tabid || ")´)
define(`GEN_TAB_VALUE´,
l_tab_tabid = "";
l_tab_ora_pk = "";
l_DATUM = @getwert(DATUM);
l_sql_tab = ("SELECT tab_tabid, tab_ora_pk FROM stab_t_gentabelle WHERE tab_tabid = :TAB_TABID INTO :l_tab_tabid, :l_tab_ora_pk");
l_ret = @SqlImmediate(l_sql_tab);
if ( l_tab_tabid <= "" ) {
	@print ("GEN_"||"TAB_VALUE: "|| @sprintf(@nls_gettext_x("li_mc.gen_tab.nicht_vorhanden")));
} 
if ( l_ret == FALSE ) {
	return (FALSE);
} 
if (l_tab_ora_pk > "") {
    l_sel_def = ("SUBSTR(SGET.GET_VALUE(tab_tabid, " || l_tab_tabid || "_recid, spa_spaid),1,254), " || l_tab_tabid || "_recid,spa_spaid, DECODE(spa_sperre, 1, 'Y', 'N'), SUBSTR(STXT.GET_TEXT(spa_t_bez),1,254),spa_webid, DECODE(spa_muss, 1, 'Y', 'N'), DECODE(tab_sperre, 1, 'Y', 'N')");
    l_sel_def = l_sel_def || (" FROM " || l_tab_tabid || " , sspa_t_genspalte, stab_t_gentabelle WHERE 1=1 AND " || l_tab_tabid || "_bis >= NVL(SLAF.LI_TO_DATE(:l_DATUM)," || l_tab_tabid || "_bis) AND " || l_tab_tabid || "_von <= NVL(SLAF.LI_TO_DATE(:l_DATUM)," || l_tab_tabid || "_von) AND spa_tabid = tab_tabid AND tab_tabid = :l_tab_tabid ORDER BY " || l_tab_tabid || "_recid, spa_sort ");
} else {
    l_sel_def = ("SUBSTR(SGET.GET_VALUE(tab_tabid, rec_recid, spa_spaid),1,254),rec_recid,spa_spaid, DECODE(spa_sperre, 1, 'Y', 'N'), SUBSTR(STXT.GET_TEXT(spa_t_bez),1,254),spa_webid, DECODE(spa_muss, 1, 'Y', 'N'), DECODE(tab_sperre, 1, 'Y', 'N')");
    l_sel_def = l_sel_def || (" FROM srec_genrecord , sspa_t_genspalte, stab_t_gentabelle WHERE 1=1 " || l_p_where || " AND rec_bis >= NVL(SLAF.LI_TO_DATE(:l_DATUM),rec_bis) AND rec_von <= NVL(SLAF.LI_TO_DATE(:l_DATUM),rec_von) and rec_tabid = tab_tabid AND spa_tabid = tab_tabid AND tab_tabid = :l_tab_tabid ORDER BY rec_recid, spa_sort ");
}
_LOOP
)

undefine(`_LOOP_NAME´) 
undefine(`_LOOP_VARS´)
undefine(`_LOOP_SELECT´) 

/*******************************************************************************
SIM_LOOP	Schleife, welche nach Simulationstyp Sendungs-ID oder Fahrt-ID liefert.
*/

define(`SIM_LOOP´, `

l_sim_wcid	 = ifelse($1,,"",$1);
l_sim_runid	 = ifelse($2,,"",$2);
l_sim_type	 = "";
l_sim_into	 = "SDGID";
l_sim_key	 = "";
SIM_KEY_ORIG = "";

if (l_sim_runid == "") {
	@abort(@sprintf("RUN-ID not set"));
}

if (@SqlImmediate("SELECT sim_type FROM ssim_simulation WHERE sim_simid=:l_sim_wcid INTO :l_sim_type") == TRUE) {
	if (@SqlImmediate("BEGIN ssim.set_current_run('"||l_sim_runid||"'); END;") == FALSE) {
		@abort(@sprintf("ERROR in setting Simulation-Context (Run-ID:"||l_sim_runid||")"));
	}
	if (l_sim_type == "SFAR") {
		l_sim_into = "FARID";
	}
	@print ("SIM_LO"||"OP: TYPE ["||l_sim_type||"] WORKCOPY-ID ["||l_sim_wcid ||"] RUN-ID ["||l_sim_runid||"]");
} 
else
{
	@abort(@sprintf("ERROR in SIM_LO"||"OP (SIMID:"||l_sim_wcid||")"));
}

define(`_LOOP_SELECT´,`"SELECT smr_key,smr_key,smr_key_orig FROM ssmr_simref WHERE smr_simid = :l_sim_wcid INTO :l_sim_key,:"||l_sim_into||",:SIM_KEY_ORIG"´)
define(`_LOOP_NAME´,`SIM: KEY-"||l_sim_type||" ["||l_sim_key||"] KEY-ORIG ["||@getwert(SIM_KEY_ORIG)||"]´)
define(`_LOOP_VARS´,`SIM_KEY_ORIG, @var(l_sim_into)´)
undefine(`_LOOP_RSET´)
_LOOP
´)

define(`SIM_LOOPEND´,`_LOOP_END´)


/************************************************************************
	Fakturenanhang schreiben - Laufende Zeile steht im Resultat
*/

define(`ANHANG´,`
ANHANG_LFNR = @getwert(ANHANG_LFNR) + 1;
@SetItem("VARIABLE","ANHANG_LFNR",@getwert(ANHANG_LFNR));
l_text = @sprintf($1);
@SqlImmediate("INSERT INTO SABA_ABRANH \
	(ABA_LAFID, ABA_SORT, ABA_TEXT, ABA_FETT, ABA_SCHMAL) \
	VALUES \
	(:LAFID, :ANHANG_LFNR, :l_text, 0, 1)");
´)

/************************************************************************/
/* m4-Makros beginnen mit Understreichung                               */
/* Argumente muessen so oft in Quotes gesetzt werden wie sie in Makros   */
/* eingesetzt werden                                                    */

/* Hilfsmakro fuer
/* Variablen-Referenz _var_ref(vanid)                    */

/* Wenn der Variablen ein Rufezeichen vorangestellt wird, so erfolgt die */
/* Referenz per @getwert (Variable darf auch 0 bzw. nicht gesetzt sein)  */

/* Wenn VANID leer ist (nicht angegeben) wird ein Leerstring eingesetzt  */

/* Vorsicht, Position wird bei substr wie in C ab 0 gezaehlt             */
/* Wenn Arg 1 leer, Ergebnis leer              */
/* Wenn !Vanid, Ergebnis @getwert(Vanid)       */
/* sonst String --> Ergebnis unveraendert       */
/* Wenn MinusZahl --> (0-Zahl), da LI keine negativen Konstanten kann */
/* Wenn Erste Stelle keine Ziffer unveraendert  */
/* wenn ;:? vorkommt --> Ergebnis in Hochkomma */
/* sonst Ergebnis unveraendert                  */


define(_ref,`ifelse($1,,,
substr($1,0,1),!,@getwert(substr($1,1)),
substr($1,0,1),",`$1´,
substr($1,0,1),-,`(0$1)´,
index(0123456789,substr($1,0,1)),-1,`$1´,
index($1,;)index($1,:)index($1,?),-1-1-1,`$1´,`"$1"´
)´)

/* _rmhk(string): Hochkommata entfernen falls vorhanden 		*/
define(_rmhk,`ifelse(substr($1,0,1),",substr($1,1,eval(len($1)-2)),`$1´)´)

/* _addhk(string): Hochkommata hinzufuegen falls noch nicht vorhanden 	*/
define(_addhk,`ifelse(substr($1,0,1)substr($1,eval(len($1)-1)),"",`$1´,"`$1´")´)


#define DISTANZ(eweid,vland,vplz,vort,bland,bplz,bort,ergebnis,ergebnis_maut) \
l_dst_eweid = ifelse(eweid,,"EWS_E",eweid); \
l_dst_vland = _ref(`vland´); \
l_dst_vplz  = _ref(`vplz´);  \
l_dst_vort  = ifelse(vort,,"",_ref(`vort´)); \
l_dst_bland = _ref(`bland´); \
l_dst_bplz  = _ref(`bplz´);  \
l_dst_bort  = ifelse(bort,,"",_ref(`bort´)); \
l_dst_ergeb = ""; \
l_dst_erg_maut = ""; \
l_select = "Select sewk.distanz(:l_dst_eweid,  \
:l_dst_vland,  :l_dst_vplz,  :l_dst_vort, \
:l_dst_bland,  :l_dst_bplz,  :l_dst_bort ) \
from dual into :l_dst_ergeb"; \
@print("sewk_distanz-call: " || l_dst_eweid || "," || l_dst_vland || "," || l_dst_vplz || "," || l_dst_vort || ","|| l_dst_bland || "," || l_dst_bplz || "," || l_dst_bort ); \
@SqlImmediate(l_select); \
@print("sewk.distanz:  "||l_dst_ergeb); \
ergebnis = l_dst_ergeb;\
l_select1 = "Select sewk.distanz_maut(:l_dst_eweid , \
:l_dst_vland ,  :l_dst_vplz ,:l_dst_vort ,\
:l_dst_bland ,  :l_dst_bplz ,:l_dst_bort ) \
from dual into :l_dst_erg_maut"; \
@print("sewk_distanz-call-maut: " || l_dst_eweid || "," || l_dst_vland || "," || l_dst_vplz || "," || l_dst_vort || ","|| l_dst_bland || "," || l_dst_bplz || "," || l_dst_bort ); \
@SqlImmediate(l_select1); \
@print("sewk.distanz_maut = "||l_dst_erg_maut); \
ifelse(ergebnis_maut,,, ergebnis_maut = l_dst_erg_maut;)

define(DISTANZ_MG,`
l_dstmg_adrlist		= ifelse($1,,"",_ref(`$1´));
l_dstmg_vkmprofil	= ifelse($2,,"",_ref(`$2´));
l_dstmg_package		= ifelse($3,,"SMAG",_ref(`$3´));
l_dstmg_requestid	= "";
l_dstmg_rc		= "";
l_dstmg_nodid		= ""; 
@print( "DIS" || "TANZ_MG Adressliste: (" || l_dstmg_adrlist || "), Profil: (" || l_dstmg_vkmprofil || "), Package: (" || l_dstmg_package || ")" );
switch {
	case ( l_dstmg_package == "LBASEMAPSERVICE" ) {
		@print("LBASEMAPSERVICE");
		l_sql = "SELECT SUBSTR( LBASEMAPSERVICE.GETREQUESTID( TRANSLATE( :l_dstmg_adrlist, ',',';'), TRIM( TRANSLATE( :l_dstmg_vkmprofil, '\"', ' ')) ),1,254) FROM dual INTO :l_dstmg_requestid";
		@SqlImmediate( l_sql );
		if ( @xmatch( l_dstmg_requestid, "%-MAP") == TRUE ) {
			l_dstmg_rc = 0;
		} else {
			l_dstmg_rc = 1;
			l_dstmg_requestid = "";
		}
	}
	case ( * ) {
		l_adrlist_komma = "";
		l_vkmprofil_text = "";
		l_sql = "SELECT SUBSTR(sglo.get_vsString() || '-' || sseq_requestid.nextval,1,254), nod_hostname, " || 
			"SUBSTR( TRIM( TRANSLATE( :l_dstmg_adrlist ,';',',')),1,254), " || 
			"SUBSTR('\"' || TRIM( TRANSLATE( :l_dstmg_vkmprofil, '\"',' ') ) || '\"',1,254) " ||
			"FROM snod_t_rechner, sorg_t_einheit WHERE nod_nodid = org_nodid AND org_orgid = :AG_ID " ||
			"INTO :l_dstmg_requestid, :l_dstmg_nodid, :l_adrlist_komma, :l_vkmprofil_text";
		@SqlImmediate( l_sql );
		l_dstmg_systemcall = "java -jar /d1/group/sped/adressen/mgutil.jar -maut -adr " || l_adrlist_komma || " -reqId " 
			|| l_dstmg_requestid || " -vehicle " || l_vkmprofil_text || " -write -propfile /d1/group/sped/adressen/mgutil.properties";
		@print( "MG Hostname: (" || l_dstmg_nodid || "), call: (" || l_dstmg_systemcall || ")" );
		l_dstmg_rc = @system( l_dstmg_systemcall, l_dstmg_nodid );
	}
}
@print("MG_RC: (" || l_dstmg_rc || "), MG_REQUESTID: (" || l_dstmg_requestid || ")" );
MG_RC = l_dstmg_rc;
MG_REQUESTID = l_dstmg_requestid;
´)

define(SDISTANZ,`
l_dst_eweid = ifelse($1,,"X",$1);
l_dst_vstaid= $2;
l_dst_vplz  = ifelse($3,,"",_ref(`$3´));
l_dst_vort  = ifelse($4,,"",_ref(`$4´));
l_dst_bstaid= $5;
l_dst_bplz  = ifelse($6,,"",_ref(`$6´));
l_dst_bort  = ifelse($7,,"",_ref(`$7´));
l_dst_km    = $8;
l_km_alt    =  0;

l_dst_where = "WHERE ew3_eweid	  = :l_dst_eweid \
		AND	ew3_vonstaid  = upper(:l_dst_vstaid) \
		AND	ew3_vonplz    = nvl(upper(:l_dst_vplz),0) \
		AND	ew3_vonort    = nvl(upper(:l_dst_vort),' ') \
		AND	ew3_nachstaid = upper(:l_dst_bstaid) \
		AND	ew3_nachplz   = nvl(upper(:l_dst_bplz),0) \
		AND	ew3_nachort   = nvl(upper(:l_dst_bort),' ') ";

l_dst_sql = "Select ew3_km \
	FROM sew3_ortort " ||
	l_dst_where ||
	" FOR UPDATE OF ew3_km NOWAIT \
	into :l_km_alt";

@print(@nls_gettext_x("li_mc.sdistanz.sel_upd"));
l_ret = @SqlImmediate(l_dst_sql);
@print(@sprintf(@nls_gettext_x("li_mc.sdistanz.ret_old")));
if ( l_ret == TRUE )
{
   if (l_dst_km == 0-1)
	{
		l_dst_sql = "DELETE FROM sew3_ortort " || l_dst_where ;
		@print(@nls_gettext_x("li_mc.sdistanz.del"));
	}
	else
	{
		l_dst_sql = "UPDATE sew3_ortort \
			SET ew3_km = :l_dst_km \
			  , ew3_usrid = :USRID \
			  , ew3_aend = sysdate " || l_dst_where ;
		@print(@sprintf(@nls_gettext_x("li_mc.sdistanz.upd")));
	}
	@SqlImmediate(l_dst_sql);
}
else
{
	if (l_dst_km < 0 )
	{
		@abort(@sprintf(@nls_gettext_x("li_mc.sdistanz.abort")));
	}
	l_dst_sql = "Insert into sew3_ortort \
		(ew3_eweid, ew3_vonstaid, ew3_vonplz, \
		 ew3_vonort, ew3_nachstaid, \
		 ew3_nachplz, ew3_nachort, \
		 ew3_km, ew3_usrid, ew3_aend) \
		Values (:l_dst_eweid, upper(:l_dst_vstaid), nvl(upper(:l_dst_vplz),' '), \
		  nvl(upper(:l_dst_vort),' '), upper(:l_dst_bstaid), \
		 nvl(upper(:l_dst_bplz),' '), nvl(upper(:l_dst_bort),' '), \
		 :l_dst_km, :USRID, sysdate)";
	@print(@sprintf(@nls_gettext_x("li_mc.sdistanz.insert")));
	@SqlImmediate(l_dst_sql); \
}

´)

l_dst_eweid = ifelse(eweid,,"GU",eweid); \
l_dst_vland = vland; \
l_dst_vplz  = vplz;  \
l_dst_vort  = ifelse(vort,,"",vort); \
l_dst_bland = bland; \
l_dst_bplz  = bplz;  \
l_dst_bort  = ifelse(bort,,"",bort); \
l_dst_ergeb = ""; \
l_select = "Select sewk.distanz('"|| l_dst_eweid || "','" || \
l_dst_vland || "','" || l_dst_vplz || "','" ||l_dst_vort || "','" || \
l_dst_bland || "','" || l_dst_bplz || "','" ||l_dst_bort || "') \
from dual into :l_dst_ergeb"; \
@print(l_select); \
@SqlImmediate(l_select); \
@print("sewk.distanz = "||l_dst_ergeb); \
ergebnis = l_dst_ergeb;


/* Definition BERELEM ------------------------------------------------- */
/* 1. bedingte m4-Makro-Aufrufe _setze_x_bed, _setze_y_bed              */
/* 2. Aufruf Berechnungs-Element                                        */

#define BERELEM(b2,b3,b4,b5,wrgid,m1,m2,m3,m4,\
                x_typ,y_typ,x_frage,y_frage,x_vanid,y_vanid,kennz,ziel_vanid) \
_setze_x_bed(_rmhk(x_typ),``x_frage´´,_ref(x_vanid)) \
_setze_y_bed(_rmhk(y_typ),``y_frage´´,_ref(y_vanid)) \
ifelse(ziel_vanid,,,`ziel_vanid=´) \
@berechnung(ifelse(kennz,,FALSE,ifelse(kennz,"Y",TRUE,FALSE)),_ref(b2),_addhk(b3),_addhk(b4),ifelse(b4,"T",_ref(b5),_addhk(b5)),ifelse(wrgid,"-",,_ref(``wrgid´´)),_addhk(m1),_ref_nonumber_stable(`m2´),m3,m4);


/* Bei Setzen Variable ist entweder x_vanid oder x_typ und x_frage angegeben */

/* Wenn x_typ ($1) oder x_vanid ($3) angegeben sind */
/* X-Variable bedingt setzen                        */

define(_setze_x_bed,`ifelse($1`´$3,,,
  if(@gesetzt_x() == FALSE)
  {
    @setze_x`(´ifelse($1,,$3,@setzen_feld("$1",`$2´))`);´
  }
)´)

/* Dasselbe nochmal fuer Setzen Y-Variable */
define(_setze_y_bed,`ifelse($1`´$3,,,
  if(@gesetzt_y() == FALSE)
  {
    @setze_y`(´ifelse($1,,$3,@setzen_feld("$1",`$2´))`);´
  }
)´)

/* ------------------- Ende Definition BERELEM() ----------------------- */

#ifdef LBaseLI_Fileoptmc 
#include <LBaseLI_File.opt.mc>
#endif

/* Definition RECHNEN_FORMAT -------------------------------------------- */
#define RECHNEN_FORMAT( RECHNEN_FORMAT_von, RECHNEN_FORMAT_operator, RECHNEN_FORMAT_operand, RECHNEN_FORMAT_ergebnis ) \
l_von = _ref(RECHNEN_FORMAT_von); \
l_operator = _ref(RECHNEN_FORMAT_operand); \
RECHNEN_FORMAT_ergebnis = ( _ref(RECHNEN_FORMAT_von) _rmhk(RECHNEN_FORMAT_operator) _ref(RECHNEN_FORMAT_operand) ); \
@print("RECH" || "NEN_FORMAT: RECHNEN_FORMAT_von: (" || l_von || "), Operator: (" || _addhk(RECHNEN_FORMAT_operator) || "), RECHNEN_FORMAT_operand: (" || l_operator || ") = RECHNEN_FORMAT_ergebnis: (" || @getwert(_ref(RECHNEN_FORMAT_ergebnis),FALSE) || ")" ) ; 

/* Ende Definition RECHNEN_FORMAT --------------------------------------- */

/* Definition MDMATRIX_FORMAT -------------------------------------------- */
define(MDMATRIX_FORMAT,`
l_matid = _ref($1);
l_vanid = "$2";
l_vanx = "";
l_vany = "";
l_typx = "";
l_typy = "";
l_feld_von = "";
l_rundung_in = "";
l_rundung_out = "";
l_per = "I";
l_maximum = "";
l_minimum = "";
l_zuschlag = "";
l_wrgid = "";
@print(@sprintf(@nls_gettext_x("li_mc.mdmatrix_format.call")));
l_sql = "SELECT x.lvan_vanid, y.lvan_vanid, x.lvan_vartyp, y.lvan_vartyp FROM lvan_t_varname y, lvan_t_varname x, lmat_matrix where y.lvan_vanid(+) = SUBSTR(lmat_vary,2) AND x.lvan_vanid(+) = SUBSTR(lmat_varx,2) AND lmat_matid = :l_matid INTO  :l_vanx, :l_vany, :l_typx, :l_typy";
@SqlImmediate( l_sql );
if ( l_vanx > "" ) {
	l_inhaltx = @var(l_vanx);
	@print( "X="|| l_vanx || "=" || l_typx || ": (" || l_inhaltx || ")" );
	if ( @gesetzt_x() == FALSE ) { 
		if ( l_typx == "N" ) {
			@setze_x(l_inhaltx+0); 
		} else {
			@setze_x(l_inhaltx); 
		}
	}
}
if ( l_vany > "" ) {
	l_inhalty = @var(l_vany);
	@print( "Y="|| l_vany || "=" || l_typy || ": (" || l_inhalty || ")" );
	if ( @gesetzt_y() == FALSE ) { 
		if ( l_typy == "N" ) {
			@setze_y(l_inhalty+0); 
		} else {
			@setze_y(l_inhalty); 
		}
	}
}
l_ergebnis = @berechnung(TRUE,l_feld_von,l_rundung_in,l_per,l_matid,l_wrgid,l_rundung_out,l_zuschlag,l_minimum,l_maximum);
$2 = l_ergebnis;
´)
/* Ende Definition MDMATRIX_FORMAT --------------------------------------- */

/* Labelzaehler-Stand wird in 3GL nicht mehr benoetigt */
#define COMMON(x)

/* Labelzaehler jetzt bereits in 4GL vorhanden        */
#define SPC(code,text,textkz,stdber,akkukz,label) sp_code`´label: \
@sp_code(code,label,akkukz,_stdber(stdber),ifelse(textkz,1,,`text´));

/* stdber J / N durch TRUE / FALSE ersetzen */
define(_stdber,`ifelse(_rmhk($1),J,TRUE,FALSE)´)

#define SPCEND @sp_code_end();
#define GL ==
#define KL <
#define KG <=
#define GG >=
#define GR >

#define AKKU(code,text,akkukz) @akkuzeile(akkukz,_addhk(code),text);

#define ALT(minmax, text) @alt_anfang(_alt_typ(_addhk(minmax)));
/* Umsetzung von 4GL "MIN" bzw. "MAX" auf 3GL "<" bzw. ">" */
define(_alt_typ,`ifelse($1,"MIN","<",$1,"MAX",">","?")´)
#define ALTEND @alt_ende();
#define ALTZWEIG(altnum) @alt_start(altnum);


#define CANCEL(text)  @abort(@sprintf(text));
#define KOMM(text)    /* text */
#define TBLOCKTEXT KOMM
dnl/* Wenn erster Kommentarblock, dann jede Ausgabe verwerfen, und zaehlen, das schon ein Kommentar da war */
#define TBLOCK(text) TBLOCK_M4
define(`TBLOCK_M4´,`ifelse(tblock_counter,`isdef´,`´,`divert(-1)´)pushdef(`tblock_counter´,`isdef´)´)dnl
dnl/* Eine Ebene vom Kommentarblock reduzieren, wenn letzte Ebene, dann Ausgabe reaktivieren */
define(`TBLOCKEND´,`popdef(`tblock_counter´)ifelse(tblock_counter,`isdef´,,`divert(`1´)´)dnl´)dnl
#define MESSAGE(text)  @meldung(@sprintf(text));

#define DENT(text) if (@inputjn(@sprintf(_ref(``text´´))) == TRUE)

#define DENTYES {
#define DENTNO  } else {
#define DENTEND }

#define DSCHL(name,frage) while (@inputjn(frage) == TRUE)  {

/* diese Definition von DSCHLBREAK setzt voraus, dass DSCHLBREAK nicht */
/* nicht tiefer verschachtelt ist !!!!!!!                             */
/* andernfalls goto + label erforderlich !!!!!!!                      */
#define DSCHLBREAK break;

#define DSCHLEND }

#define ENT(feld,oper,text,xflag) if ( _ent2(feld,_rmhk(oper),_ref(``text´´),_rmhk(xflag))

define(_ent2,`ifelse($4,,dnl
ifelse(index($3,;)index($3,:)index($3,?)index($3,%),-1-1-1-1,dnl
@if(_ref($1),"$2",$3) == TRUE,@xmatch(_ref($1),$3) ifelse($2,=,==,$2) TRUE),dnl
$4,Y,@xmatch(_ref($1),$3) ifelse($2,=,==,$2) TRUE,
$4,N,@if(_ref($1),"$2",$3) == TRUE)´)


#define ENTAND(feld,oper,text,xflag) & _ent2(feld,_rmhk(oper),_ref(``text´´),_rmhk(xflag))

#define ENTYES ) \
{
#define ENTNO } \
else \
{
#define ENTEND }

#define DBPRUEF(feld,wert) \
l_select = ""; \
l_erg = ""; \
l_wert = _ref(``wert´´); \
if (feld == "ARTID") {  \
	l_select = "Select art_artid from aart_t_artikel where art_artid = :l_wert INTO :l_erg"; \
} \
if (feld == "AGRID") {  \
	l_select = "Select agr_agrid from aagr_artikelgruppe where agr_agrid = :l_wert INTO :l_erg"; \
} \
if (feld == "LBEID") \
{ \
	l_select = "Select lbe_lbeid from albe_lbereich where lbe_lbeid = :l_wert INTO :l_erg"; \
} \
if (feld == "BUCID") \
{ \
	l_select = "Select buc_bucid from abuc_buchung where buc_bucid = :l_wert INTO :l_erg"; \
} \
if (feld == "BEWID") \
{ \
	l_select = "Select bew_bewid from abew_bewegung where bew_bewid = :l_wert INTO :l_erg"; \
} \
if (feld == "LPLID") \
{ \
	l_select = "Select lpl_lplid from alpl_lplatz where lpl_lplid = :l_wert INTO :l_erg"; \
} \
if (feld == "BUC_NR") \
{ \
	if ( @gesetzt(LVEID) == TRUE ) \
	{ \
		l_lveid = @getwert(LVEID); \
		l_select = "Select buc_nr from abuc_buchung where buc_nr = :l_wert \
						and buc_lveid = :l_lveid INTO :l_erg"; \
	} \
	else \
	{ \
		l_select = "Select buc_nr from abuc_buchung where buc_nr = :l_wert INTO :l_erg"; \
	} \
} \
if (feld == "ART_NR") \
{ \
	if ( @gesetzt(LVEID) == TRUE ) \
	{ \
		l_lveid = @getwert(LVEID); \
		l_select = "Select art_nr from aart_t_artikel where art_nr = :l_wert \
						and art_lveid = :l_lveid INTO :l_erg"; \
	} \
	else \
	{ \
		l_select = "Select art_nr from aart_t_artikel where art_nr = :l_wert INTO :l_erg"; \
	} \
} \
if (feld == "LPL_BEZ") \
{ \
	l_select = "Select lpl_bez from alpl_lplatz where lpl_bez = :l_wert INTO :l_erg"; \
} \
@SqlImmediate (l_select); \
if ( l_erg == l_wert \

#define DBPRUEFYES ) \
{
#define DBPRUEFNO } \
else \
{
#define DBPRUEFEND }

define(_BSTUF_,0)
#define ENTB(comment) define(`_BSTUF_´,eval(_BSTUF_+1)) @print(@nls_gettext_x("li_mc.entb.kommentar")||comment); switch {

#define ENTBANR(feld,oper,text,nr,xflag) _ENTBANR_(nr) case ( _ent2(feld,_rmhk(oper),_ref(``text´´),_rmhk(xflag))
#define ENTBAND(feld,oper,text,xflag) & _ent2(feld,_rmhk(oper),_ref(``text´´),_rmhk(xflag))
#define ENTBANR999 _ENTBANR_(999) case (*)  { \
ZZAUSAUT = 999; \
} \
} @print(@nls_gettext_x("li_mc.entb.auswahl")||ZZAUSAUT); switch { \
undefine(`_ANR_´)

define(_ENTBANR_,`ifdef(`_ANR_´, `)´
{
   ZZAUSAUT = _ANR_;
},)´ `define(`_ANR_´,$1)´)


#define ENTBNR(anr) _ENTBNR_ case (ZZAUSAUT == anr) {
#define ENTBNR999 ENTBNR(999)
#define ENTBEND _ENTBNR_ undefine(`_BNR_´_BSTUF_) define(`_BSTUF_´,eval(_BSTUF_-1)) }

define(_ENTBNR_,`ifdef(`_BNR_´_BSTUF_, }
,`define(`_BNR_´_BSTUF_)´)´)

#define DENTB(p1,p2) @clr_dialog(); \
@def_dialog(0-1,0,0,p1); \
l_vorschlag = ifelse(p2,,"",p2); \
@save_vars (l_vorschlag);

#define DENTBFR(p1,p2) @def_dialog(p1,0,0,p2);

/* es wird hier ein "unmoeglicher" Case eroeffnet, der dann von DENTBAZ */
/* abgeschlossen wird */

#define DENTBTRENN @restore_vars(); \
ZZAUSWNR = @run_dialog(l_vorschlag,ZZAUSWTXT); \
switch \
{ case (FALSE) {

#define DENTBAZ(p1) } \
case (ZZAUSWNR == p1) \
{ \

#define DENTBEND } \
}


#define SXY(x_art,x_wert,y_art,y_wert) \
  _setze_x(_rmhk(x_art),_ref(``x_wert´´))_setze_y(_rmhk(y_art),_ref(``y_wert´´))

define(_setze_x,`ifelse($2,,,@setze_x($2);
)´)

define(_setze_y,`ifelse($2,,,@setze_y($2);
)´)

#define RSFELD(feld) @reset_vars(feld);

#define SFELD(feld,art,text,vorschlag) \
 ifelse(`vorschlag´,, \
 `@setzen_feld(feld,ifelse(_rmhk(art),,,_addhk(art)),_ref_stable(`text´));´, \
 ifelse(`vorschlag´,`""´, \
 ``@setzen_feld(feld,ifelse(_rmhk(art),,,_addhk(art)),_ref_stable(`text´));´´, \
 ``@setzen_feld(feld,ifelse(_rmhk(art),,,_addhk(art)),_ref_stable(`text´),_ref_stable(`vorschlag´));´´))

#define SFELDI(feld,pointer) \
 @setzen_feld(feld,,@var(pointer));

#define SFELDS(feld,text,laenge,rechtsbuendig,format) \
 @setzen_feld(feld,,@sprintf(_ref_stable(`text´))); \
 ifelse(laenge,,,\
 l_spaces = "                                                                                                                                                                                                        "; \
	 ifelse(rechtsbuendig,"Y",\
		 feld = ```@substr´´´(l_spaces || @getwert(feld) ,0-laenge, laenge);, \
		 feld = ```@substr´´´(@getwert(feld) || l_spaces, 1, laenge);)) \
	ifelse(format,,,` \
	if ((format == "U")) \
	{ \
		l_wert_neu = ""; \
		if (@SqlImmediate( "Select UPPER ('" || @quote2(@substr (@getwert(feld),1,254)) || "') from dual into :l_wert_neu") == TRUE) \
		{ \
			feld = l_wert_neu; \
		} \
		else \
		{ \
			@print(@nls_gettext_x("li_mc.sfelds.format_error")); \
		} \
	} \
	else \
	{ \
		if ((format == "L")) \
		{ \
			l_wert_neu = ""; \
			if (@SqlImmediate( "Select LOWER ('" || @quote2(@substr (@getwert(feld),1,254)) || "') from dual into :l_wert_neu") == TRUE) \
			{ \
				@print(l_wert_neu); \
				feld = l_wert_neu; \
			} \
			else \
			{ \
				@print(@nls_gettext_x("li_mc.sfelds.format_error")); \
			} \
		} \
	} \
	´)


#define SFELDO(feld,art,wert) \
 @setzen_feld(feld,ifelse(_rmhk(art),,,_addhk(art)),_ref(``wert´´)); \
 @setzen_feld_original(feld);

#define TEILSTRING(_von,_ab,_laenge,_nach, _ltrim) \
 _nach = `@substr´(_ref(``_von´´), _ab, _laenge); \
  if ((ifelse(_ltrim,,"N",_ltrim) == "Y") /* & (@length(@getwert(_nach)) > 0 ) */ ) \
  { \
	 l_trimpos = @length(_nach); \
	 while ( l_trimpos > 0 ) \
	 { \
		 if (@substr (_nach, l_trimpos, 1) != " " ) \
			 { break; } \
		 l_trimpos = l_trimpos -1; \
	 } \
	 if ( l_trimpos > 0 ) \
		 { _nach = @substr (_nach,1,l_trimpos); } \
  }

#define MFD_CREATE(name) \
	@array_new(name);

#define MFD_SETZEN(name,feld,feldtext,vorgabe,flag,dynfeld) \
  	@array_add_col(name, ifelse(dynfeld,"Y",@var(feld),feld)); \
        /* Wenn abhvar nicht leer ist, dann darf auch das dbfield nicht leer sein */\
   @array_mod_col(name, ifelse(dynfeld,"Y",@var(feld),feld), @sprintf(_ref(``feldtext´´)), ifelse(flag,"M","M","O") , _ref(``vorgabe´´)); 


#define MFD_SETZEN_ERW(name,feld,feldtext,vorgabe,flag,dynfeld,rowname,abhvar,dbfield,select,into) \
        @array_add_col(name, ifelse(dynfeld,"Y",@var(feld),feld)); \
        /* Wenn abhvar nicht leer ist, dann darf auch das dbfield nicht leer sein */\
   @array_mod_col(name, ifelse(dynfeld,"Y",@var(feld),feld), @sprintf(_ref(``feldtext´´)), ifelse(flag,"M","M",ifelse(flag,"H","H","O")) , _ref(``vorgabe´´),rowname,abhvar,dbfield,select,into);

#define MFD_STARTEN(name,hinweistext,fragetext,window_h,col1_width, col2_width, col3_width,focus_feld) \
	@array_mfdialog(name, ifelse(hinweistext,,,@sprintf(_ref(``hinweistext´´))), @sprintf(_ref(``fragetext´´)),window_h,col1_width,col2_width,col3_width,_ref(``focus_feld´´));

#define MFD_DELETE(name) \
	@array_destroy(name);

#define MFA_CREATE(name) \
	@array_new(name);

#define MFA_SETZEN(name,feld,feldtext,vorgabe,flag,dynfeld) \
   @array_add_col(name, ifelse(dynfeld,"Y",@var(feld),feld)); \
   @array_mod_col(name, ifelse(dynfeld,"Y",@var(feld),feld), @sprintf(_ref(``feldtext´´)),ifelse(flag,"Y","M","O") , _ref(``vorgabe´´));

#define MFA_STARTEN(name,hinweistext,fragetext,window_h,col1_width, col2_width, col3_width) \
	@array_mfdialog(name, ifelse(hinweistext,,,@sprintf(_ref(``hinweistext´´))), @sprintf(_ref(``fragetext´´)),window_h,col1_width,col2_width,col3_width,"",1);

#define MFA_DELETE(name) \
	@array_destroy(name);

#define LAENGE(_von,_nach) \
 _nach = @length(_ref(``_von´´));

#define VORGABE(feld,art,text,_fix) \
 @setzen_feld(feld,ifelse(_rmhk(art),,,_addhk(art)),_ref_stable(`text´)); \
 ifelse(_fix,"Y", @SetItem("VORGABE_FIX","feld",@getwert(feld));,\
   @SetItem("VORGABE","feld",@getwert(feld));)

#define VORGABE_ATT(tab,att,text,_fix) \
 l_item = tab || "ATTRIBUT_" || _ref(``att´´); \
 if (tab == "SDG") { \
	ifelse(_fix,"Y", @SetItem("VORGABE_FIX",l_item,_ref(``text´´));,\
		@SetItem("VORGABE",l_item,_ref(``text´´));) \
 } \
 else { \
	l_tmp = 0 - 1; \
	l_tmp = l_tmp + @getwert(LFD_SEKTION); \
	 l_sektion = "SV_BESCH_"|| l_tmp; \
	 @SetItem(l_sektion,l_item,_ref(``text´´)); \
 }

#define VORGABE_SSDT(daten,sttid,wert) \
	if (_ref_stable(`daten´) == "SDB") { \
		l_SECTION_NAME = "SSDT_" || _ref_stable(`sttid´) || "_" || @getwert(ZEILE_ID); \
		if (@IsSection(l_SECTION_NAME) == FALSE) { @AddSection(l_SECTION_NAME);} \
		@SetItem(l_SECTION_NAME, "LFZL", @getwert(ZEILE_ID)); \
	} else { \
		l_SECTION_NAME = "SSDT_" || _ref_stable(`sttid´) || "_0"; \
		if (@IsSection(l_SECTION_NAME) == FALSE) { @AddSection(l_SECTION_NAME);} \
		@SetItem(l_SECTION_NAME, "LFZL", "0"); \
	}  \
	@SetItem(l_SECTION_NAME, "TEXT", @sprintf(_ref_stable(`wert´))); \
	@SetItem(l_SECTION_NAME, "TYP", _ref_stable(`sttid´)); 

#define VORGABE_SDA(_satid,_adrid,_refnr,_fix,_termvon,_termnach,_name1,_name2,_str,_str2,_land,_plz,_ort) \
 l_sektion = "SV_ADRESSE_"|| @getwert(LFD_SEKTION); \
 LFD_SEKTION = @getwert(LFD_SEKTION) + 1; \
 @AddSection(l_sektion); \
 @SetItem(l_sektion,"ADR_SATID",_satid); \
 @SetItem(l_sektion,"ADR_ADRID",_ref(``_adrid´´)); \
 @SetItem(l_sektion,"ADR_REFNR",_ref(``_refnr´´)); \
 @SetItem(l_sektion,"ADR_FIX",_fix); \
 @SetItem(l_sektion,"ADR_TERMVON",_termvon); \
 @SetItem(l_sektion,"ADR_TERMBIS",_termnach); \
 @SetItem(l_sektion,"ADR_NAME1",_ref(``_name1´´)); \
 @SetItem(l_sektion,"ADR_NAME2",_ref(``_name2´´)); \
 @SetItem(l_sektion,"ADR_STR",_ref(``_str´´)); \
 @SetItem(l_sektion,"ADR_STR2",_ref(``_str2´´)); \
 @SetItem(l_sektion,"ADR_LAND",_ref(``_land´´)); \
 @SetItem(l_sektion,"ADR_PLZ",_ref(``_plz´´)); \
 @SetItem(l_sektion,"ADR_ORT",_ref(``_ort´´)); 
 if ((_satid == "IM") | (_satid == "CN")) \
    { \
      if ((_satid == "IM") | (@gesetzt(ADRID_IM) == FALSE)) \
         { ADRID_IM = _adrid; } \
      if (@getwert(CHZ_NOCHMAL) == 0) \
         { CHZ_NOCHMAL = 1; } \
    }

#define VORGABE_BESCH(_lfnr, _ebene,_znr,_anz,_art,_inh,_bgew,_ngew,_cbm,_ldm,_ztarif,_wrgid,_wert,_gefg,_text,_barcode, \
_laenge,_breite,_hoehe, _tara, \
_unit, _contnr, _conttyp, _mat, _freistellnr, _depot, _gewpfl, _lveid, _artnr, _fgstnr, _von, _nach, _plombenr, _cbmpfl, \
_local_bgew, _local_ngew, _local_cbm, _local_ldm, _local_gewpfl, _local_cbmpfl, _local_tara, _local_laenge, _local_breite, _local_hoehe, _mnr, _ifs_food, _ifs_haltbar, _ifs_temp )\
 l_sektion = "SV_BESCH_"|| @getwert(LFD_SEKTION); \
 LFD_SEKTION = @getwert(LFD_SEKTION) + 1; \
 @AddSection(l_sektion); \
 ifelse(_lfnr,,,@SetItem(l_sektion,"ZEILE_ID",_lfnr);) \
 ifelse(_lfnr,,,@SetItem(l_sektion,"ZEILE_LFNR",_lfnr);) \
 ifelse(_ebene,,,@SetItem(l_sektion,"ZEILE_SBEID",_ebene);) \
 ifelse(`_znr´,,,@SetItem(l_sektion,"ZEILE_ZNR",@sprintf(`_znr´));) \
 ifelse(_anz,,,@SetItem(l_sektion,"ZEILE_ANZ",_anz);) \
 ifelse(_art,,,@SetItem(l_sektion,"ZEILE_ART",_ref(``_art´´));) \
 ifelse(`_inh´,,,@SetItem(l_sektion,"ZEILE_INH",@sprintf(`_inh´));) \
 ifelse(_bgew,,,@SetItem(l_sektion,"ZEILE_GEW_BTO",_ref(`_bgew´));) \
 ifelse(_ngew,,,@SetItem(l_sektion,"ZEILE_GEW_NTO",_ref(`_ngew´));) \
 ifelse(_cbm,,,@SetItem(l_sektion,"ZEILE_CBM",_ref(`_cbm´));) \
 ifelse(_ldm,,,@SetItem(l_sektion,"ZEILE_LDM",_ref(`_ldm´));) \
 ifelse(_ztarif,,,@SetItem(l_sektion,"ZEILE_ZTARIF",_ref(`_ztarif´));) \
 ifelse(_wrgid,,,@SetItem(l_sektion,"ZEILE_WRGID",_ref(`_wrgid´));) \
 ifelse(_wert,,,@SetItem(l_sektion,"ZEILE_WERT",_ref(`_wert´));) \
 ifelse(_gefg,,,@SetItem(l_sektion,"ZEILE_GG",_ref(`_gefg´));) \
 ifelse(`_text´,,,@SetItem(l_sektion,"ZEILE_TEXT",@sprintf(`_text´));) \
 ifelse(_barcode,,,@SetItem(l_sektion,"ZEILE_BARCODE",_ref(``_barcode´´));) \
 ifelse(_laenge,,,@SetItem(l_sektion,"ZEILE_LAENGE",_ref(`_laenge´));) \
 ifelse(_breite,,,@SetItem(l_sektion,"ZEILE_BREITE",_ref(`_breite´));) \
 ifelse(_hoehe,,,@SetItem(l_sektion,"ZEILE_HOEHE",_ref(`_hoehe´));) \
 ifelse(_tara,,,@SetItem(l_sektion,"ZEILE_TARA",_ref(`_tara´));) \
 ifelse(_unit,,,@SetItem(l_sektion,"ZEILE_UNIT",_ref(`_unit´));) \
 ifelse(_contnr,,,@SetItem(l_sektion,"ZEILE_CONTNR",_ref(`_contnr´));) \
 ifelse(_conttyp,,,@SetItem(l_sektion,"ZEILE_CONTTYP",_ref(`_conttyp´));) \
 ifelse(_mat,,,@SetItem(l_sektion,"ZEILE_MAT",_ref(`_mat´));) \
 ifelse(_freistellnr,,,@SetItem(l_sektion,"ZEILE_FREISTELLNR",_ref(`_freistellnr´));) \
 ifelse(_depot,,,@SetItem(l_sektion,"ZEILE_DEPOT",_ref(`_depot´));) \
 ifelse(_gewpfl,,,@SetItem(l_sektion,"ZEILE_GEWFPF",_ref(`_gewpfl´));) \
 ifelse(_lveid,,,@SetItem(l_sektion,"ZEILE_LVEID",_ref(`_lveid´));) \
 ifelse(_artnr,,,@SetItem(l_sektion,"ZEILE_ARTNR",_ref(`_artnr´));) \
 ifelse(_fgstnr,,,@SetItem(l_sektion,"ZEILE_FGSTNR",_ref(`_fgstnr´));) \
 ifelse(_von,,,@SetItem(l_sektion,"ZEILE_VON",_ref(`_von´));) \
 ifelse(_nach,,,@SetItem(l_sektion,"ZEILE_NACH",_ref(`_nach´));) \
 ifelse(_plombenr,,,@SetItem(l_sektion,"ZEILE_PLOMBENR",_ref(`_plombenr´));) \
 ifelse(_cbmpfl,,,@SetItem(l_sektion,"ZEILE_CBMFPF",_ref(`_cbmpfl´));) \
 ifelse(_local_bgew,,,@SetItem(l_sektion,"ZEILE_LOCAL_GEW_BTO",_ref(`_local_bgew´));) \
 ifelse(_local_ngew,,,@SetItem(l_sektion,"ZEILE_LOCAL_GEW_NTO",_ref(`_local_ngew´));) \
 ifelse(_local_cbm,,,@SetItem(l_sektion,"ZEILE_LOCAL_CBM",_ref(`_local_cbm´));) \
 ifelse(_local_ldm,,,@SetItem(l_sektion,"ZEILE_LOCAL_LDM",_ref(`_local_ldm´));) \
 ifelse(_local_gewpfl,,,@SetItem(l_sektion,"ZEILE_LOCAL_GEWFPF",_ref(`_local_gewpfl´));) \
 ifelse(_local_cbmpfl,,,@SetItem(l_sektion,"ZEILE_LOCAL_CBMFPF",_ref(`_local_cbmpfl´));) \
 ifelse(_local_tara,,,@SetItem(l_sektion,"ZEILE_LOCAL_TARA",_ref(`_local_tara´));) \
 ifelse(_local_laenge,,,@SetItem(l_sektion,"ZEILE_LOCAL_LAENGE",_ref(`_local_laenge´));) \
 ifelse(_local_breite,,,@SetItem(l_sektion,"ZEILE_LOCAL_BREITE",_ref(`_local_breite´));) \
 ifelse(_local_hoehe,,,@SetItem(l_sektion,"ZEILE_LOCAL_HOEHE",_ref(`_local_hoehe´));) \
 ifelse(_mnr,,,@SetItem(l_sektion,"ZEILE_MNR_NR",_ref(`_mnr´));) \
 ifelse(_ifs_food,,,@SetItem(l_sektion,"ZEILE_IFS_FOOD",_ref(`_ifs_food´));) \
 ifelse(_ifs_haltbar,,,@SetItem(l_sektion,"ZEILE_IFS_HALTBAR",_ref(`_ifs_haltbar´));) \
 ifelse(_ifs_temp,,,@SetItem(l_sektion,"ZEILE_IFS_TEMPERATUR",_ref(`_ifs_temp´));) \

/*
#define VORGABE_SDGTEXT(_sdgtexttyp, _text) \
	l_sektion = "SV_SDGTEXT_"|| @getwert(LFD_SEKTION); \
	LFD_SEKTION = @getwert(LFD_SEKTION) + 1; \
	@AddSection(l_sektion); \
	@SetItem(l_sektion,"SDT_STTID,_sdgtexttyp);
	@SetItem(l_sektion,"SDT_TEXT, _text 
*/

#define LOCKFELD(feld) \
  @SetItem("RECHTE","feld","LOCK");

#define LOCKATT(tab,att) \
	l_action = "LOCKATT"; \
	l_item = _ref(``att´´) || tab; \
  @SetItem("RECHTE",l_item,l_action);

#define LOCKREC \
  @SetItem("RECHTE","RECORD","LOCK");

#define LOCKTABLE(tabelle, edit, add, delete) \
 ifelse(tabelle,"SSDA", @SetItem("RECHTE","ADRID","FKT"||ifelse(edit,"Y","Y","N")||ifelse(add,"Y","Y","N")||ifelse(delete,"Y","Y","N")), @SetItem("RECHTE","ZEILE_ID","FKT"||ifelse(edit,"Y","Y","N")||ifelse(add,"Y","Y","N")||ifelse(delete,"Y","Y","N")));

#define SFOCUS(feldname) \
   if (@IsSection("FOCUS") == FALSE) \
      { @AddSection("FOCUS"); } \
   @SetItem("FOCUS","FELD",_addhk(feldname));

#define SKURS(wrgid,wert) @setzen_kurs(_ref(``wrgid´´),wert);
#define RSKURS(wrgid)     @reset_kurs(_ref(``wrgid´´));
#define LKURS(wrgid,kz)  KURS = @kurs(_ref(``wrgid´´),ifelse(_rmhk(kz),G,TRUE,FALSE));

define(`CALL_ALLG´,`
ifelse($2,,,P1=_ref($2);)
ifelse($3,,,P2=_ref($3);)
ifelse($4,,,P3=_ref($4);)
ifelse($5,,,P4=_ref($5);)
ifelse($6,,,P5=_ref($6);)
ifelse($7,,,P6=_ref($7);)
@call("ALLG",FA_ID,@getwert(FA_ID),MODUL,_addhk($1));´)

define(`INKLU´,`
ifelse($2,,,P1=_ref($2);)
ifelse($3,,,P2=_ref($3);)
ifelse($4,,,P3=_ref($4);)
ifelse($5,,,P4=_ref($5);)
ifelse($6,,,P5=_ref($6);)
ifelse($7,,,P6=_ref($7);)
include(_rmhk($1))
´)

#define SBLOCK(name) @spesenblock(_ref(name));

#define ZSBLOCK(kdnr,rikz) \
@call("ZOLL",ADRID_KRIT,kdnr,LAUID_KRIT,_ref(``rikz´´),FA_ID,FA_ID);

#define START return(TRUE);
#define STOP  return(FALSE);
#define STOP_12  return(0 - 12);

#define TEXT(Kz,Text) @sp_print(_addhk(Kz),Text);
#define NEU_ADRID(_adrid,_nur_modul) \
if (@IsSection("STATUS") == FALSE) \
   { @AddSection("STATUS"); } \
@SetItem("STATUS",ifelse(_nur_modul,"Y","NEU_ADRID_MOD","NEU_ADRID"),_adrid); \
@print( @sprintf( @nls_gettext_x("li_mc.neu_adrid")|| " / " || _adrid || " / " || _addhk(_nur_modul)));\
return(2);


/* Zeitberechnungen Addieren, Differenz und Wochentag  */

define(`DIFF_ZEIT´,` $3 = @diff_sekunden($1,$2) / 60 ; ´)
define(`WOCHEN_TAG´,` $2 = @wochentag($1); ´)
define(`ADD_ZEIT´,`l_sekunden = ifelse($2,,0,_ref(`$2´)*60);
	$3 = @add_sekunden($1, l_sekunden); ´)


/* Abschluss-Kommentar */

/* Programm-Beginn  +  Programm-Abschluss durch } */
/* m4wrap() spinnt, nach Einfuegen eines Leerzeichens hinter der 1. Klammer */
/* verschwindet ueberfluessiges Rufezeichen                                  */


/*************************************************************************
Schleifen fuer Statuswechsel bei Fahrten
*/

/*
BE_ENTL  Schleife ueber alle TLA's bei denen die Entladung vor der
         Beladung erfolgt
*/

define(`_LOOP_SELECT´,` \
   "SELECT a_lst.lst_lafid , a_lst.lst_stoid \
   FROM   slst_lastop a_lst , ssto_stop a_sto \
   WHERE  a_lst.lst_farid = :FARID \
   AND    a_lst.lst_farid = a_sto.sto_farid \
   AND    a_lst.lst_stoid = a_sto.sto_stoid \
   AND    a_lst.lst_tatid = 2 \
   AND     EXISTS (    SELECT 1 \
                        FROM  slst_lastop b_lst, ssto_stop b_sto \
                        WHERE b_lst.lst_farid = :FARID \
                        AND   b_lst.lst_farid = b_sto.sto_farid \
                        AND   b_lst.lst_stoid = b_sto.sto_stoid \
                        AND   b_lst.lst_lafid = a_lst.lst_lafid \
                        AND   b_lst.lst_tatid = 1 \
                        AND   ( b_sto.sto_sort > a_sto.sto_sort \
                           OR \
                              ( b_sto.sto_sort = a_sto.sto_sort ) \
                              AND \
                              ( b_lst.lst_sort > a_lst.lst_sort ) ) ) \
   ORDER BY sto_sort, lst_sort \
   INTO :l_lafid, :l_stoid" ´)

undefine(`_LOOP_VARS´)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,```-BE-ENTL-LOOP: ´´´)
define(`_BE_ENTL_LOOP´,_LOOP)
define(`_BE_ENTL_LOOP_END´,_LOOP_END)
undefine(`_LOOP_SELECT´)


#define BE_ENTL(Programmabbruch, Text) l_zaehler = 0; \
_BE_ENTL_LOOP \
l_zaehler = l_zaehler + 1; \
l_text = "LA-ID: " || l_lafid || ", STOP: " || l_stoid || "    " || Text ; \
if ( @inputjn(l_text) == FALSE ) { break; } \
_BE_ENTL_LOOP_END \
if  (( Programmabbruch == "D" ) & ( l_zaehler > 0 ))  \
   { \
      if ( @inputjn("Programm abbrechen (J/N) ?" ) == TRUE ) \
         { \
            STOP_12 \
         } \
   } \
if  (( Programmabbruch == "Y" ) & ( l_zaehler > 0 )) \
{ \
STOP_12  \
}


/*
STOP   Schleife ueber alle Stops
*/

define(`_LOOP_SELECT´,` \
   "select    sto_stoid \
            , sto_adrid \
            , to_char(sto_datwun,'YYYY.MM.DD HH24:MI') \
            , to_char(sto_datwunb,'YYYY.MM.DD HH24:MI') \
            , to_char(sto_datvon ,'YYYY.MM.DD HH24:MI') \
            , to_char(sto_ladebeginn ,'YYYY.MM.DD HH24:MI') \
            , to_char(sto_datbis ,'YYYY.MM.DD HH24:MI') \
            , sto_adrid \
            , to_char(sto_datwun,'YYYY-MM-DD-HH24:MI:SS') \
            , to_char(sto_datwunb,'YYYY-MM-DD-HH24:MI:SS') \
            , to_char(sto_datvon ,'YYYY-MM-DD-HH24:MI:SS') \
            , to_char(sto_ladebeginn ,'YYYY-MM-DD-HH24:MI:SS') \
            , to_char(sto_datbis ,'YYYY-MM-DD-HH24:MI:SS') \
            , nvl(sto_km,-1) \
            , sto_sort \
            , sto_text \
            , sto_tzname \
   from       ssto_stop \
   where      sto_farid = :FARID "|| l_p_where || " \
   order by   sto_sort \
   INTO       :STOID \
            , :STOADR \
            , :STODATWUN \
            , :STODATWUNB \
            , :STODATVON \
            , :STOLADEBEGINN \
            , :STODATBIS \
            , :l_sto_adrid \
            , :l_sto_datwun \
            , :l_sto_datwunb \
            , :l_sto_datvon \
            , :l_sto_ladebeginn \
            , :l_sto_datbis \
            , :l_sto_km \
            , :l_sto_sort \
            , :STOTEXT  \
            , :STO_TZNAME " \
   ´ )

define(`_LOOP_VARS´,`STOID, STOADR, STODATWUN, STODATWUNB, STODATVON, STOLADEBEGINN, STODATBIS, STOTEXT, 
			STO_TZNAME´)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,`-Stop-Loop: alle Stops der Fahrt´)
define(`_STOP_LOOP´,_LOOP)
define(`_STOP_LOOP_END´,_LOOP_END)
undefine(`_LOOP_SELECT´)




#define STOP_LOOP \
l_zaehler = 0; \
l_sto_adrid = 0; \
l_sto_datwun = ""; \
l_sto_datwunb = ""; \
l_sto_datvon = ""; \
l_sto_ladebeginn = ""; \
l_sto_datbis = ""; \
l_sto_km   = 0;  \
l_sto_sort = 0; \
l_sto_adrid_prev = 0; \
l_sto_datwun_prev = ""; \
l_sto_datwunb_prev = ""; \
l_sto_datvon_prev = ""; \
l_sto_ladebeginn_prev = ""; \
l_sto_datbis_prev = ""; \
l_sto_km_prev = 0;  \
l_sto_sort_prev = 0; \
_STOP_LOOP

define(`STOPS_FAHRT´, `STOP_LOOP´)

/* Initialisierungen von Schleifenvariablen
	werden aufgerufen werden in jedem Format
	innerhalb der Schleife
*/


#define STOP_LOOP_SET_VAR \
l_sto_adrid_prev = l_sto_adrid; \
if ( l_sto_datwun != "" ) { l_sto_datwun_prev = l_sto_datwun ; } \
if ( l_sto_datwunb != "" ) { l_sto_datwunb_prev = l_sto_datwunb ; } \
if ( l_sto_datvon != "" ) { l_sto_datvon_prev = l_sto_datvon ; } \
if ( l_sto_datbis != "" ) { l_sto_datbis_prev = l_sto_datbis ; } \
l_sto_km_prev = l_sto_km;  \
l_sto_sort_prev = l_sto_sort;

#define STOP_LOOPEND \
_STOP_LOOP_END \

#define STOP_LOOP_ZEIT(Programmabbruch,Text )  \
if ( ( l_sto_datvon == "" ) | ( l_sto_datbis == "" )) \
{ \
   l_text = "STOP: " || STOID || "   " || Text; \
   @meldung( l_text ); \
   if  ( Programmabbruch == "D" )  \
      {  \
         if ( @inputjn("Programm abbrechen (J/N) ?" ) == TRUE )  \
            {  \
               @SqlCloseCursor( l_loopCur, HSQL ); \
				@restore_vars(); \
            STOP_12   \
            }  \
      }  \
   if  ( Programmabbruch == "Y" )  \
   {     \
      @SqlCloseCursor( l_loopCur, HSQL ); \
		@restore_vars();\
      STOP_12 \
   } \
} \
STOP_LOOP_SET_VAR \

#define STOP_LOOP_SORT(Programmabbruch,Text )  \
if ( l_sto_datvon != "" ) \
{ l_dat_akt = l_sto_datvon ; } \
else \
{ l_dat_akt = l_sto_datbis ; } \
if ( l_sto_datbis_prev != "" ) \
{ l_dat_prev = l_sto_datbis_prev ; } \
else \
{ l_dat_prev = l_sto_datvon_prev ; } \
 \
if (  l_dat_akt < l_dat_prev )  \
{ \
   l_text = "STOP: " || STOID || "   " || Text; \
   @meldung( l_text ); \
   if  ( Programmabbruch == "D" )  \
      {  \
         if ( @inputjn("Programm abbrechen (J/N) ?" ) == TRUE )  \
            {  \
               @SqlCloseCursor( l_loopCur, HSQL ); \
					@restore_vars(); \
               STOP_12  \
            }  \
      }  \
   if  ( Programmabbruch == "Y" )  \
   {     \
      @SqlCloseCursor( l_loopCur, HSQL ); \
		@restore_vars(); \
      STOP_12   \
   } \
} \
STOP_LOOP_SET_VAR \

#define STOP_LOOP_KM(Programmabbruch,Text )  \
if (  l_sto_km == (0 - 1 ))  \
{ \
   l_text = "STOP: " || STOID || "   " || Text; \
   @meldung( l_text ); \
   if  ( Programmabbruch == "D" )  \
      {  \
         if ( @inputjn("Programm abbrechen (J/N) ?" ) == TRUE )  \
            {  \
               @SqlCloseCursor( l_loopCur, HSQL ); \
               @restore_vars(); \
					STOP_12  \
            }  \
      }  \
   if  ( Programmabbruch == "Y" )  \
   {     \
      @SqlCloseCursor( l_loopCur, HSQL ); \
		@restore_vars(); \
      STOP_12   \
   } \
} \
STOP_LOOP_SET_VAR \

/*
STOP_SORTIERUNG Schleife ueber alle Stops be denen die Sortierung
            nicht mit den Stopzeiten uebereinstimmt
*/

define(`_LOOP_SELECT´,` \
 "select a_sto.sto_stoid \
 from ssto_stop a_sto \
 where a_sto.sto_farid = :FARID \
 and NVL(a_sto.sto_datvon, \
 NVL(a_sto.sto_datbis,a_sto.sto_datwun) ) IS NOT NULL \
 and EXISTS \
 (select b_sto.sto_stoid \
 from ssto_stop b_sto \
 where b_sto.sto_farid = a_sto.sto_farid \
 and b_sto.sto_sort < a_sto.sto_sort \
 and greatest( \
 NVL( a_sto.sto_datbis, \
 to_date( '1900','YYYY')) , \
 NVL( a_sto.sto_datvon, \
 to_date('1900','YYYY')) , \
 decode( a_sto.sto_datbis, \
 NULL, \
 decode( a_sto.sto_datvon, \
 NULL, \
 a_sto.sto_datwun, \
 to_date('1900','YYYY')) , \
 to_date('1900','YYYY') ) \
 ) \
 < \
 least( \
 NVL( b_sto.sto_datbis, \
 to_date('2100','YYYY')) , \
 NVL( b_sto.sto_datvon, \
 to_date('2100','YYYY') ), \
 decode( b_sto.sto_datbis, \
 NULL, \
 decode( b_sto.sto_datvon, \
 NULL, \
 b_sto.sto_datwun, \
 to_date('2100','YYYY') ), \
 to_date('2100','YYYY') ) \
 ) \
 ) \
 order by a_sto.sto_sort into :l_stoid " \
   ´)

undefine(`_LOOP_VARS´)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,```-STOP-SORTIERUNG-LOOP: ´´´)
define(`_STOP_SORTIERUNG_LOOP´,_LOOP)
define(`_STOP_SORTIERUNG_LOOP_END´,_LOOP_END)
undefine(`_LOOP_SELECT´)


#define STOP_SORTIERUNG(Programmabbruch, Text) l_zaehler = 0; \
l_stoid = 0; \
_STOP_SORTIERUNG_LOOP \
l_zaehler = l_zaehler + 1; \
l_text = "STOP: " || l_stoid || "    " || Text ; \
if ( @inputjn(l_text) == FALSE ) { break; } \
\
_STOP_SORTIERUNG_LOOP_END \
if  (( Programmabbruch == "D" ) & ( l_zaehler > 0 ))  \
   { \
      if ( @inputjn("Programm abbrechen (J/N) ?" ) == TRUE ) \
         { \
            STOP \
         } \
   } \
if  (( Programmabbruch == "Y" ) & ( l_zaehler > 0 )) \
{ \
STOP  \
}


/*
UEBERLADUNG Schleife ueber alle VKM die beteiligt mit
         Feststellung ob Ueberladung vorliegt
*/

/* Schleife Verkehrsmittel
	WOSC 24.09.1998
*/
define(`_VKM_VST_VARS_LOOP´, `VKM_STRECKE,VKM_NACH, VKM_VON, VSTDATVON, VSTDATBIS, VSTLADESCHLUSS, VKM_NUTZLAST, VKM_FAHRER, VKM_FRFID, VKMKZ,LAND_VKM,VKMKZINT,VKMID,VKM_ART,VKMBEZ,VKM_ORGIDK,VST_TZNAME, VST_FAHRER´)
define(`_VKM_LOOP_INIT´,` l_text = ""; l_nlast = ""; l_gefg = "";
		l_std = ""; l_vst_bez = "";´)
define(`_VKM_LOOP_SELECT´,` \
   "SELECT vst_vstid, \
   	   vst_stoidv, \
   	   vst_stoidn, \
   	   vkm_amtkz, \
          vkm_staid, \
          nvl(vkm_nlast,-1),  \
          nvl(vkm_nlast,-1),  \
          nvl(vkm_gefg,1) ,\
          vst_bez, \
          vkm_std, \
          vkm_vkmkz, \
          vkm_vkmid, \
          vkm_std, \
          vst_bez, \
          to_char(vst_datvon,'YYYY.MM.DD HH24:MI'), \
          to_char(vst_datbis,'YYYY.MM.DD HH24:MI'), \
          to_char(vst_ladeschluss,'YYYY.MM.DD HH24:MI'), \
	  vkm_orgidk, \
	  vkm_FAHRER, \
	  vkm_FRFID, \
	  vst_tzname, \
	  vst_fahrer \
   FROM    svst_vkmstop, svkm_vkm \
   WHERE  vst_farid = :l_farid  \
   AND vst_vkmid = vkm_vkmid "|| l_p_where || " \
   ORDER BY vst_sort \
   INTO :VKM_STRECKE,:VKM_VON, :VKM_NACH, :VKMKZ, :LAND_VKM, :l_nlast, :VKM_NUTZLAST, :l_gefg,  :l_vst_bez , :l_std, :VKMKZINT , :VKMID, :VKM_ART, :VKMBEZ ,:VSTDATVON, :VSTDATBIS, :VSTLADESCHLUSS, :VKM_ORGIDK, :VKM_FAHRER, :VKM_FRFID, :VST_TZNAME, :VST_FAHRER "   \
   ´)



define(`_GEW_AM_STOP_SELECT´,` \
         "SELECT \
         min  (a_sto.sto_stoid) , \
         sum  ( decode (     \
                  b_lst.lst_tatid,  \
                    1, sped.ssdg_grp.grpwert_bgew( b_laf.laf_sdgid),  \
                    2, -1*sped.ssdg_grp.grpwert_bgew( b_laf.laf_sdgid),  \
                  0) \
         )  \
      FROM \
          ssto_stop a_sto \
         ,ssto_stop b_sto \
         ,slst_lastop b_lst \
         ,slaf_leistanf b_laf \
      WHERE a_sto.sto_farid = :FARID \
      AND a_sto.sto_farid = b_sto.sto_farid \
      AND a_sto.sto_sort >= b_sto.sto_sort  \
      AND b_sto.sto_stoid = b_lst.lst_stoid \
      AND b_sto.sto_farid = b_lst.lst_farid \
      AND b_lst.lst_lafid = b_laf.laf_lafid \
      AND ( b_lst.lst_vstid = :VKM_STRECKE\
         OR ( b_lst.lst_vstid IS NULL \
              AND \
              :VKM_STRECKE = (  \
               SELECT    vst_1.vst_vstid  \
               FROM      svst_vkmstop vst_1 \
                 WHERE    vst_1.vst_farid = :FARID \
               AND      vst_sort = ( \
                     SELECT MIN(vst_2.vst_sort) \
                     FROM   svst_vkmstop vst_2 \
                     WHERE   vst_2.vst_farid = :FARID )  \
                              ) \
                ) \
            ) \
   GROUP BY a_sto.sto_sort  \
   ORDER BY a_sto.sto_sort \
   INTO   :l_stoid, :l_gew_am_stoid " \
   ´)

define(`_LOOP_VARS´,`_VKM_VST_VARS_LOOP´)
undefine(`_LOOP_RSET´)
define(`_LOOP_SELECT´,`_VKM_LOOP_SELECT´)
define(`_LOOP_NAME´,`UEBERLADUNG ´)
define(`_LOOP_NAME´,`-UEBERLADUNG: ´)
define(`_UEBERLADUNG_LOOP´, l_farid = @getwert(FARID); _LOOP)
define(`_LOOP_NAME´,`VKM-FAHRT: alle Verkehrsmittel der Fahrt´)
define(`VKM_FAHRT´, _VKM_LOOP_INIT l_farid = @getwert(FARID); _LOOP)
define(`_UEBERLADUNG_LOOP_END´,_LOOP_END)
undefine(`_LOOP_SELECT´)


#define UEBERLADUNG(Programmabbruch, Text) l_zaehler = 0;  \
l_text = ""; \
l_nlast = 0 - 1; \
l_gefg = 0;  \
l_std = 0 ; \
l_vst_bez = "";  \
l_break = 0;  \
l_gew_am_stoid = 0; \
_UEBERLADUNG_LOOP  \
 \
/*  @meldung( "Nutzlast = " || l_nlast ); */ \
if ( l_nlast >= 0 ) \
{ \
   l_loopCur2 = @SqlOpenCursor(HSQL);  \
   @SqlPrepareAndExecute (l_loopCur2, HSQL, _GEW_AM_STOP_SELECT );  \
   while (@SqlFetchNext (l_loopCur2, HSQL) != 0)  \
      {  \
/*			@meldung( "Gewicht am Stlp = " || l_gew_am_stoid ); */ \
         if ( l_nlast + 0  < l_gew_am_stoid + 0  ) \
         { \
/* @meldung( "GewStop/Nutzlast = " || l_gew_am_stoid || "/" || l_nlast ); */ \
            l_zaehler = l_zaehler + 1; \
       \
            l_text = "VKM: " || l_vkmbez || " ,STOP: " || l_stoid || "   " ||Text ; \
            if ( @inputjn(l_text) == FALSE )  \
               {  \
                  break; \
                  l_break = 1; \
               } \
         } \
      } \
@SqlCloseCursor(l_loopCur2, HSQL); \
} \
if ( l_break == 1 ) \
   { \
      break; \
   } \
_UEBERLADUNG_LOOP_END  \
if  (( Programmabbruch == "D" ) & ( l_zaehler > 0 ))  \
   { \
      if ( @inputjn("Programm abbrechen (J/N) ?" ) == TRUE ) \
         { \
            STOP_12 \
         } \
   } \
if  (( Programmabbruch == "Y" ) & ( l_zaehler > 0 ))  \
{     \
STOP_12   \
}



/*
Schleife ueber alle VKM-Strecken
Liefert jene VKM die keine Gefahrengutkennzeichnung haben aber
auf denen Gefahrengut liegt
*/


define(`_GEFG_SELECT´,` \
      "SELECT  \
          MAX( sped.ssdg_grp.grpwert_gefg( laf_sdgid) )   \
      FROM  \
          ssto_stop  \
         ,slst_lastop  \
         ,slaf_leistanf  \
      WHERE   sto_farid = :FARID   \
      AND sto_stoid = lst_stoid  \
      AND sto_farid = lst_farid  \
      AND lst_lafid = laf_lafid  \
      AND lst_tatid = 1 \
	   AND nvl(lst_vstid, \
				dispo_util.get_first_vstid(lst_farid)) =:VKM_STRECKE \
      INTO   :l_gefg " \
      ´)

define(`_LOOP_VARS´,`_VKM_VST_VARS_LOOP´)
undefine(`_LOOP_RSET´)
define(`_LOOP_SELECT´,`_VKM_LOOP_SELECT´)
define(`_LOOP_NAME´,`-GEFG-SCHLEIFE: ´)
define(`_GEFG_LOOP´, l_farid = @getwert(FARID); _LOOP)
define(`_GEFG_LOOP_END´,_LOOP_END)
undefine(`_LOOP_SELECT´)



#define GEFG(Programmabbruch, Text) l_zaehler = 0; \
l_text = "";\
l_nlast = 0 - 1; \
l_gefg = 0;  \
l_std = 0;   \
l_vst_bez = ""; \
l_break = 0;  \
_GEFG_LOOP \
 \
if ( l_gefg == 0 ) \
{ \
   l_loopCur2 = @SqlOpenCursor(HSQL);  \
   @SqlPrepareAndExecute (l_loopCur2, HSQL, _GEFG_SELECT );  \
   while (@SqlFetchNext (l_loopCur2, HSQL) != 0)  \
      {  \
         l_zaehler = l_zaehler + 1; \
         l_text = "VKM: " || l_vkmbez || "   " ||Text ; \
         if ( @inputjn(l_text) == FALSE )  \
            {  \
                 break; \
                 l_break = 1; \
            } \
      } \
	@SqlCloseCursor(l_loopCur2, HSQL); \
} \
if ( l_break == 1 ) \
   { \
      break; \
   } \
_GEFG_LOOP_END  \
if  (( Programmabbruch == "D" ) & ( l_zaehler > 0 ))  \
   { \
      if ( @inputjn("Programm abbrechen (J/N) ?" ) == TRUE ) \
         { \
            STOP_12 \
         } \
   } \
if  (( Programmabbruch == "Y" ) & ( l_zaehler > 0 ))  \
{     \
STOP_12   \
}


/*
STD_VKM
Schleife ueber alle VKM-Strecken
Liefert jene VKM die Standardverkehrsmittel sind im Feld vst_bez
aber keine Indentifierzierung enthalten.
*/


define(`_LOOP_VARS´,`_VKM_VST_VARS_LOOP´)
undefine(`_LOOP_RSET´)
define(`_LOOP_SELECT´,`_VKM_LOOP_SELECT´)
define(`_LOOP_NAME´,`-STD-VKM Schleife: ´)
define(`_STD_VKM_LOOP´, l_farid = @getwert(FARID); _LOOP)
define(`_STD_VKM_LOOP_END´,_LOOP_END)
undefine(`_LOOP_SELECT´)



#define STD_VKM(Programmabbruch, Text)   \
l_zaehler = 0;   \
l_text = ""; \
l_nlast = 0 - 1;  \
l_gefg = 0;   \
l_std = 0;   \
l_vst_bez = ""; \
l_break = 0;   \
_STD_VKM_LOOP  \
  \
if ( (l_std == 1) & (l_vst_bez == "" )  )  \
{  \
   l_zaehler = l_zaehler + 1;  \
   l_text = l_text || ": " || l_vkmbez || "   " ||Text ;  \
   if ( @inputjn(l_text) == FALSE )   \
      {   \
           break;  \
      }  \
 }  \
_STD_VKM_LOOP_END   \
if  (( Programmabbruch == "D" ) & ( l_zaehler > 0 ))   \
   {  \
      if ( @inputjn("Programm abbrechen (J/N) ?" ) == TRUE )  \
         {  \
            STOP_12  \
         }  \
   }  \
if  (( Programmabbruch == "Y" ) & ( l_zaehler > 0 ))   \
{      \
STOP_12    \
}


/*
VKM_STRECKE
ist ueberhaupt eine VKM-STRECKE vorhanden ?
*/


define(`_LOOP_VARS´,`_VKM_VST_VARS_LOOP´)
undefine(`_LOOP_RSET´)
define(`_LOOP_SELECT´,`_VKM_LOOP_SELECT´)
define(`_LOOP_NAME´,`-VKM-STRECKE-SCHLEIFE: ´)
define(`_VKM_STRECKE_LOOP´, l_farid = @getwert(FARID); _LOOP)
define(`_VKM_STRECKE_LOOP_END´,_LOOP_END)
undefine(`_LOOP_SELECT´)



#define VKM_STRECKE(Programmabbruch, Text)    \
l_zaehler = 0;    \
l_text = "";  \
l_nlast = 0 - 1;   \
l_gefg = 0;    \
l_std = 0;   \
l_vst_bez = ""; \
l_break = 0;    \
_VKM_STRECKE_LOOP   \
l_zaehler = l_zaehler + 1;  \
break;  \
_VKM_STRECKE_LOOP_END    \
if ( l_zaehler == 0 ) \
{ \
   @meldung(Text); \
   if  ( Programmabbruch == "D" )  \
     {   \
      if ( @inputjn("Programm abbrechen (J/N)?" ) == TRUE )   \
        {   \
            STOP_12   \
        }   \
     }   \
   if  ( Programmabbruch == "Y" )  \
   {       \
      STOP_12     \
   } \
} \



/*
Schleife ueber alle VKMStrecken
Liefert alle LAs, die auf Stops liegen, die aber nicht innerhalb
der VKM-Strecke liegen
*/

define(`_VSTID_CHECK_SELECT´,`" \
     SELECT \
          sto_stoid, lst_lafid  \
      FROM \
          ssto_stop \
         ,slst_lastop \
      WHERE   sto_farid = :FARID  \
      AND sto_stoid = lst_stoid \
		AND ( lst_tatid = 1 or lst_tatid = 2 ) \
      AND sto_farid = lst_farid \
      AND nvl(lst_vstid, \
				dispo_util.get_first_vstid(lst_farid)) = :VKM_STRECKE \
	   AND					\
       		( sto_sort < ( select nvl(min(b.sto_sort ),0) \
                         from ssto_stop b, svst_vkmstop  \
                         where b.sto_farid = vst_farid  \
                         and   b.sto_stoid = vst_stoidv  \
                         and   vst_vstid = :VKM_STRECKE \
                         ) \
            OR \
              sto_sort > ( select nvl(max(b.sto_sort ),9999 ) \
                         from ssto_stop b, svst_vkmstop  \
                         where b.sto_farid = vst_farid \
								 and   b.sto_stoid = vst_stoidn \
                         and   vst_vstid = :VKM_STRECKE \
								 ) \
           	) \
      INTO   :l_stoid, :l_lafid " \
      ´)


undefine(`_LOOP_VARS´)
undefine(`_LOOP_RSET´)
define(`_LOOP_SELECT´,`_VSTID_CHECK_SELECT´)
define(`_LOOP_NAME´,```-VSTID-CHECK-LOOP: ´´´)
define(`_VSTID_CHECK_LOOP´,_LOOP)
define(`_VSTID_CHECK_LOOP_END´,_LOOP_END)
undefine(`_LOOP_SELECT´)


#define VSTID_CHECK(Programmabbruch, Text) l_zaehler = 0; \
l_text = "";\
l_nlast = 0 - 1; \
l_gefg = 0;  \
l_std = 0;   \
l_vst_bez = ""; \
l_break = 0;  \
_VSTID_CHECK_LOOP \
 \
   l_zaehler = l_zaehler + 1; \
   l_text =  "VKM: " || VKM_STRECKE || " ,LA-ID: " || l_lafid || " ,STOP-ID: " || l_stoid || "   " || Text ; \
   if ( @inputjn(l_text) == FALSE )  \
   	{  \
     		break; \
      } \
_VSTID_CHECK_LOOP_END \
if  (( Programmabbruch == "D" ) & ( l_zaehler > 0 ))  \
   { \
      if ( @inputjn("Programm abbrechen (J/N) ?" ) == TRUE ) \
         { \
            STOP_12 \
         } \
   } \
if  (( Programmabbruch == "Y" ) & ( l_zaehler > 0 ))  \
{     \
STOP_12   \
}


/*
STOP_ZEITEN_CHECK Schleife ueber alle Stops Check auf vorhandene
Stopzeiten
*/

define(`_LOOP_SELECT´,` \
   "SELECT sto_stoid \
    FROM   ssto_stop \
    WHERE  sto_datvon IS NULL \
    AND     sto_datbis IS NULL \
    AND     sto_farid = :FARID \
    INTO   :l_stoid " \
   ´ )

undefine(`_LOOP_VARS´)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,```-STOP-ZEIT-LOOP: ´´´)
define(`_STOP_ZEIT_LOOP´,_LOOP)
define(`_STOP_ZEIT_LOOP_END´,_LOOP_END)
undefine(`_LOOP_SELECT´)


#define STOP_ZEIT_CHECK(Programmabbruch, Text) l_zaehler = 0; \
l_stoid = 0; \
_STOP_ZEIT_LOOP \
l_zaehler = l_zaehler + 1; \
l_text = "STOP-ID: " || l_stoid || "    " || Text ; \
if ( @inputjn(l_text) == FALSE ) { break; } \
 \
_STOP_ZEIT_LOOP_END \
if  (( Programmabbruch == "D" ) & ( l_zaehler > 0 ))  \
   { \
      if ( @inputjn("Programm abbrechen (J/N) ?" ) == TRUE ) \
         { \
            STOP_12 \
         } \
   } \
if  (( Programmabbruch == "Y" ) & ( l_zaehler > 0 )) \
{ \
STOP_12  \
}


/*
LA_KETTEN_CHECK Untersucht ob fuer eine Sendung eine geschlossene
Kette von LA's vorhanden ist
*/

define(`_LOOP_SELECT´,`" \
      select count(*), a_laf.laf_sdgid  \
      from sxtr_latransp a_xtr   \
             ,slaf_leistanf a_laf   \
      where a_xtr.xtr_lafid = a_laf.laf_lafid \
      and a_laf.laf_farid = :FARID \
      and a_laf.laf_latid = 'TR' \
      and ( NOT EXISTS ( select 1 \
                   from sxtr_latransp b_xtr \
                       ,slaf_leistanf b_laf \
                   where b_xtr.xtr_lafid = b_laf.laf_lafid \
                   and   b_laf.laf_farid = :FARID  \
                   and   b_laf.laf_latid = 'TR' \
                   and   b_laf.laf_lafid != a_laf.laf_lafid \
                   and   b_xtr.xtr_von = a_xtr.xtr_nach \
                   and   b_laf.laf_sdgid = a_laf.laf_sdgid ) ) \
      group by a_laf.laf_sdgid \
      into :l_anzahl, :l_sdgid"  \
´ )

undefine(`_LOOP_VARS´)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,```-LA-KETTEN-LOOP´´´)
define(`_LA_KETTEN_LOOP´,_LOOP)
define(`_LA_KETTEN_LOOP_END´,_LOOP_END)
undefine(`_LOOP_SELECT´)


#define LA_KETTEN_CHECK(Programmabbruch, Text) \
l_zaehler = 0; \
l_sdgid = ""; \
l_anzahl = 0; \
_LA_KETTEN_LOOP \
l_zaehler = l_zaehler + 1; \
l_text = "SDG_ID: " || l_sdgid || "    " || Text ; \
if ( @inputjn(l_text) == FALSE ) { break; } \
 \
_LA_KETTEN_LOOP_END \
if  (( Programmabbruch == "D" ) & ( l_zaehler > 0 ))  \
   { \
      if ( @inputjn("Programm abbrechen (J/N) ?" ) == TRUE ) \
         { \
            STOP_12 \
         } \
   } \
if  (( Programmabbruch == "Y" ) & ( l_zaehler > 0 )) \
{ \
STOP_12  \
}

/***************************************************************************
LA Schleifendefinitionen allgemein
*/

define(`_LA_VARS_LOOP´,`LAFID, LATID, LAUID, LASID, SDGID, \
					 FARID, LTYID, LAF_CODE1, LAF_CODE2, ADRID, \
					 PRIORITAET, LADATANF, LADATERL, LAF_TRAEGERLAFID´)
define(`_LA_VARS_SELECT´,`laf_lafid,laf_latid,laf_lauid,laf_lasid,laf_sdgid,\
					 laf_farid, laf_ltyid, laf_code1, laf_code2, laf_adrid, \
					 laf_prior, to_char(laf_datanf,'YYYY.MM.DD HH24:MI'), to_char(laf_daterl,'YYYY.MM.DD HH24:MI'), laf_traegerlafid´)
define(`_LA_VARS_INTO´,`:LAFID, :LATID, :LAUID, :LASID, :SDGID, \
					 :FARID, :LTYID, :LAF_CODE1, :LAF_CODE2, :ADRID, \
					 :PRIORITAET, :LADATANF, :LADATERL, :LAF_TRAEGERLAFID´)
define(`_LA_VARS_RESET´, `STATUS_SDG, BETREFF´)
define(`_LA_VARS_INIT´, `l_sdgid = @getwert(SDGID);
	l_ltyid = @getwert(LTYID);
	l_farid = @getwert(FARID);´)

/*******************************
LAs der Fahrt
*/
define(`_LOOP_SELECT´,`"SELECT _LA_VARS_SELECT \
    FROM   slaf_leistanf  \
    WHERE  laf_farid = :l_farid \
    " || l_p_where || " \
	 AND  ( ( laf_ltyid IS NULL ) \
    OR  (  laf_latid  = 'TR' ) ) \
    INTO   _LA_VARS_INTO "´ )

define(`_LOOP_RSET´,`_LA_VARS_RESET´)
define(`_LOOP_VARS´,`_LA_VARS_LOOP´)
define(`_LOOP_NAME´,`LA-FAHRT: LAs der Fahrt´)
define(`LA_FAHRT´,_LA_VARS_INIT _LOOP)
undefine(`_LOOP_SELECT´)
define(`LA_FAHRT_END´,`_LOOP_END´)

/*******************************
LAs der Fahrt fuer Stornierungen
*/
define(`_LOOP_SELECT´,`"SELECT _LA_VARS_SELECT \
    FROM   slaf_leistanf  \
    WHERE  laf_farid = :l_farid \
    " || l_p_where || " \
    INTO   _LA_VARS_INTO "´ )

define(`_LOOP_RSET´,`_LA_VARS_RESET´)
define(`_LOOP_VARS´,`_LA_VARS_LOOP´)
define(`_LOOP_NAME´,`LA-FAHRT-ALLE: LAs der Fahrt´)
define(`LA_FAHRT_ALLE´,_LA_VARS_INIT _LOOP)
undefine(`_LOOP_SELECT´)
define(`LA_FAHRT_ALLE_END´,`_LOOP_END´)

/*******************************
LAs der Ladung (ohne Transport-LAs)
*/

define(`_LOOP_SELECT´,`  \
   "SELECT _LA_VARS_SELECT \
    FROM   slaf_leistanf  \
    WHERE  laf_farid = :l_farid \
    AND    laf_ltyid = :l_ltyid \
    AND    laf_latid !=  'TR' "|| l_p_where ||" \
    INTO   _LA_VARS_INTO "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_RSET´,`_LA_VARS_RESET´)
define(`_LOOP_VARS´,`_LA_VARS_LOOP´)
define(`_LOOP_NAME´,`LA-LDGEN: LAs der Ladung´)
define(`LA_LDGEN´,_LA_VARS_INIT _LOOP)
undefine(`_LOOP_SELECT´)
define(`LA_LDGEN_END´,`_LOOP_END´)


/*******************************
LA s der Sendungen einer Fahrt
*/

define(`_LOOP_SELECT´,`  \
   "SELECT _LA_VARS_SELECT , sdg_lasid \
    FROM   slaf_leistanf,ssdg_sendung   \
    WHERE  laf_sdgid IN ( SELECT laf_sdgid  \
                          FROM	slaf_leistanf \
                          WHERE	laf_farid = :l_farid \
		   	  AND	laf_latid = 'TR')\
    AND	laf_sdgid = sdg_sdgid \
    AND  (  (   laf_farid != :l_farid   \
            OR  laf_farid IS NULL   \
   			)  \
   		OR (   laf_farid = :l_farid \
   			AND ( laf_latid != 'TR' \
   				 ) \
   			 ) \
   		) " || l_p_where || " \
    INTO   _LA_VARS_INTO, :STATUS_SDG"
   ´ )

define(`_LOOP_RSET´,`BETREFF´)
define(`_LOOP_VARS´,`_LA_VARS_LOOP, STATUS_SDG´)
define(`_LOOP_NAME´,`LA-SDGEN-FA: LAs der Sendungen der Fahrt´ )
define(`LA_SDGEN_FA´,_LA_VARS_INIT _LOOP)
undefine(`_LOOP_SELECT´)
define(`LA_SDGEN_FA_END´,`_LOOP_END´)

/*******************************
LA s einer Sendung, Key steht in SDGID
*/

/*
alt_define(`_LA_VARS_LOOP´, `LAFID, SDGID, STATUS_SDG,
								 LTYID ,LATID, LAUID,
								 FARID, LASID, LAF_CODE1, LAF_CODE2´)
alt_define(`_LA_VARS_SELECT´, `laf_lafid, laf_sdgid, sdg_lasid, \
                         laf_ltyid, laf_latid, laf_lauid, \
								 laf_farid, laf_lasid, laf_code1,laf_code2´)
alt_define(`_LA_VARS_INTO´,  `:LAFID, :SDGID, :STATUS_SDG, \
								 :LTYID, :LATID, :LAUID, \
								 :FARID, :LASID, :LAF_CODE1, :LAF_CODE2´)
*/

define(`_LOOP_SELECT´,`  \
   "SELECT _LA_VARS_SELECT ,sdg_lasid \
    FROM   slaf_leistanf,ssdg_sendung  \
    WHERE  laf_sdgid IN :l_sdgid \
    AND	  laf_sdgid = sdg_sdgid " || l_p_where || " \
    INTO   _LA_VARS_INTO, :STATUS_SDG " ´ )


define(`_LOOP_VARS´, `_LA_VARS_LOOP, STATUS_SDG´)
define(`_LOOP_NAME´, `LA-SDG: LAs der Sendung´)
define(`LA_SDG´,_LA_VARS_INIT _LOOP)

/*******************************
LAs der Ladeeinheit
*/
define(`_LOOP_SELECT´,`"SELECT _LA_VARS_SELECT \
    FROM   slaf_leistanf  \
    WHERE  laf_traegerlafid = :l_lafid_le " || l_p_where || " \
    INTO   _LA_VARS_INTO "´ )
define(`_LOOP_RSET´,`_LA_VARS_RESET´)
define(`_LOOP_VARS´,`_LA_VARS_LOOP´)
define(`_LOOP_NAME´,`LA_" || "LADEEINHEIT: LAs der Ladeeinheit: (" || l_lafid_le || ")´)
define(`LA_LADEEINHEIT´,_LA_VARS_INIT l_lafid_le = @getwert(LAF_TRAEGERLAFID); _LOOP) 
undefine(`_LOOP_SELECT´)
define(`LA_LADEEINHEIT_END´,`_LOOP_END´)

/*******************************
LAs der Arbeitsgruppe offene
*/

define(`_LOOP_SELECT´,`  \
   "SELECT _LA_VARS_SELECT \
    FROM   slaf_leistanf \
    WHERE  laf_orgidfo = :AG_ID " || l_p_where || " \
    INTO   _LA_VARS_INTO"´ )

define(`_LOOP_VARS´,`_LA_VARS_LOOP´)
define(`_LOOP_NAME´,`LA-AG_ID-OFFEN: offene LAs der Arbeitsgruppe´ )
define(`LA_AG_ID_OFFEN´,_LA_VARS_INIT _LOOP)

/*******************************
LAs der Arbeitsgruppe von bis
*/

define(`_LOOP_SELECT´,`  \
   "SELECT _LA_VARS_SELECT \
    FROM   slaf_leistanf \
    WHERE  laf_orgidf = :AG_ID " || l_p_where || " \
    AND  laf_datanf >= to_date(Substr (:DATUM_VON,1,10),'YYYY.MM.DD') \
    AND  laf_datanf < to_date(Substr (:DATUM_BIS,1,10),'YYYY.MM.DD') +1\
    INTO   _LA_VARS_INTO"´ )

define(`_LOOP_VARS´,`_LA_VARS_LOOP´)
define(`_LOOP_NAME´,`LA-AG_ID-ALLE: LAs der Arbeitsgruppe´ )
define(`LA_AG_ID_ALLE´,_LA_VARS_INIT _LOOP)

define(`W_LATID_LA_AG_ID_OFFEN´, ` laf_latid = :P1 ´)
define(`W_LAUID_LA_AG_ID_OFFEN´, ` laf_latid = :P1 and laf_lauid IN (:P2) ´)
define(`W_LATID_LA_AG_ID_ALLE´, ` laf_latid = :P1 ´)
define(`W_LAUID_LA_AG_ID_ALLE´, ` laf_latid = :P1 and laf_lauid IN (:P2) ´)

/*******************************
Offene LAs des Kundenkontakts
*/

define(`_LOOP_SELECT´,`  \
   "SELECT _LA_VARS_SELECT \
    FROM   sltr_latraeger, slaf_leistanf \
    WHERE 1=1 " || l_p_where || " \
	 AND ltr_wert = :l_kunid \
	 AND ltr_attid = 'KUNID' \
	 AND ltr_lafid = laf_lafid \
	 AND laf_lasid < '700' \
	 AND laf_orgidfo > 0 \
    INTO   _LA_VARS_INTO"´ )

define(`_LOOP_RSET´,`_LA_VARS_RESET´)
define(`_LOOP_VARS´,`_LA_VARS_LOOP´)
define(`_LOOP_NAME´,`LA_KU" || "N_OFFEN: (#l_kunid)")); @print( @sprintf("LAFID: (#!LAFID), LATID: (#!LATID), LAUID: (#!LAUID), LASID: (#!LASID)´ )
define(`LA_KUN_OFFEN´,l_kunid = @getwert(KUNID); _LOOP)

/*******************************
VACH
Organisationseinheiten pro Firma
Parameter: AG - alle Arbeitsgruppen, AB - alle Abteilungen, N - alle Niederlassungen
befuellt werden: AG 	- AG_ID, AB_ID, NL_ID
				AB 	- AB_ID,NL_ID
				N	- NL_ID
*/

define(`_LOOP_NAME´,`ORG-PRO-FIRMA:alle Org.Einh. der Firma´ )
define(`_LOOP_VARS´, `_ORG_VARS_LOOP´)
define(`_ORG_VARS_LOOP´,`NL_ID,AB_ID,AG_ID´)
undefine(`_LOOP_RSET´)
define(`_ORG_VARS_INIT´, `l_p_wh = "";
if (@gesetzt(FA_ID) == 0){
	l_fa_id = "";
}
else {
	l_fa_id = @getwert(FA_ID);
	l_p_wh = " and a.org_orgid="||l_fa_id;
}
l_select = ("SELECT b.org_orgid, c.org_orgid, d.org_orgid \
                        FROM SORG_t_EINHEIT a, SORG_t_EINHEIT b,SORG_t_EINHEIT c,SORG_t_EINHEIT d \
                        WHERE a.org_oetid='FA'\
						and b.org_oetid='NL' \
						and c.org_oetid='AB'\
						and d.org_oetid='AG' \
						and a.org_orgid=b.org_orgidh \
						and b.org_orgid=c.org_orgidh  \
						and c.org_orgid=d.org_orgidh "||l_p_wh|| 
						" "||l_p_where || " INTO :NL_ID,:AB_ID,:AG_ID");
if (@getwert(P1) == "AB"){
l_select = ("SELECT b.org_orgid, c.org_orgid \
                        FROM SORG_t_EINHEIT a, SORG_t_EINHEIT b,SORG_t_EINHEIT c \
                        WHERE a.org_oetid='FA'\
						and b.org_oetid='NL' \
						and c.org_oetid='AB'\
						and a.org_orgid=b.org_orgidh \
						and b.org_orgid=c.org_orgidh "||l_p_wh||
						" "|| l_p_where || " ORDER BY a.org_orgid,b.org_orgid,c.org_orgid "||
						"  INTO :NL_ID,:AB_ID");
}
if (@getwert(P1) == "N"){
l_select = ("SELECT b.org_orgid \
                        FROM SORG_t_EINHEIT a, SORG_t_EINHEIT b \
                        WHERE a.org_oetid='FA'\
						and b.org_oetid='NL' \
						and a.org_orgid=b.org_orgidh "||l_p_wh||
						" "|| l_p_where || " INTO :NL_ID");

}
´)

	define(`_ORG_VARS_INTO´,`:FA_ID,:NL_ID,:AB_ID,:AG_ID´) 
	define(`_ORG_VARS_SELECT´,`a.org_orgid,b.org_orgid,c.org_orgid,d.org_orgid´)

	define(`_LOOP_SELECT´,`l_select´)
}						

define(`ORG_PRO_FIRMA´, _ORG_VARS_INIT _LOOP)
define(`WH_OETID´, ` org_oetid = :P1 ´)



/***********************************
VACH ENDE
*/


/*
MAVO
SCOF_CONSFLUG Schleife ueber Consolfluege (Tabelle scof_consflug)
				  der Abteilungs-ID
*/

define(`_SCOF_VARS_SELECT´, `COF_CARID,COF_ORGID, COF_DEPAIRID, COF_DEPLAND, \
		COF_DESAIRID, COF_DESLAND, COF_VONDATUM, COF_BISDATUM, COF_FLUGNR, \
                COF_ALLOTMENT, COF_SERVICETYP, COF_DEADLINE, \
		to_char(cof_vondatum + nr, 'YYYY.MM.DD') || ' ' || COF_DEPZEIT, \
		to_char(decode(nvl(cof_datflag,'0'), 'P', cof_vondatum + nr, \
      ' ', cof_vondatum + nr, cof_vondatum + nr + to_number(nvl(cof_datflag,0))),'YYYY.MM.DD') || ' ' || COF_DESZEIT, \
		COF_ZUSATZ, COF_1_CARID, COF_1_DEPAIRID, COF_1_DEPLAND, COF_1_DESAIRID, \
		COF_1_DESLAND, COF_1_FLUGNR, \
		to_char(cof_vondatum + nr + nvl(cof_1_folgetag,0), 'YYYY.MM.DD') || ' ' || COF_1_DEPZEIT, \
		to_char(decode(nvl(cof_1_datflag,'0'), 'P', cof_vondatum + nr + nvl(cof_1_folgetag,0), \
      ' ', cof_vondatum + nr + cof_1_folgetag, cof_vondatum + nr + cof_1_folgetag + to_number(nvl(cof_1_datflag,0))),'YYYY.MM.DD') || ' ' || COF_1_DESZEIT, \
		COF_2_CARID, COF_2_DEPAIRID, COF_2_DEPLAND,	COF_2_DESAIRID, COF_2_DESLAND, COF_2_FLUGNR, \
		to_char(cof_vondatum + nr + nvl(cof_1_folgetag,0) + nvl(cof_2_folgetag,0), 'YYYY.MM.DD') || ' ' || COF_2_DEPZEIT, \
		to_char(decode(nvl(cof_2_datflag,'0'), 'P', cof_vondatum + nr + nvl(cof_1_folgetag,0) + nvl(cof_2_folgetag,0), \
      ' ', cof_vondatum + nr + nvl(cof_1_folgetag,0) + nvl(cof_2_folgetag,0), cof_vondatum + nr + nvl(cof_1_folgetag,0) + nvl(cof_2_folgetag,0) + to_number(nvl(cof_2_datflag,0))),'YYYY.MM.DD') || ' ' || COF_2_DESZEIT ´)
define(`_SCOF_VARS_INTO´,   `:COF_CARID,:COF_ORGID, :COF_DEPAIRID, :COF_DEPLAND, \
		:COF_DESAIRID, :COF_DESLAND, :COF_VONDATUM, :COF_BISDATUM, :COF_FLUGNR, \
                :COF_ALLOTMENT, :COF_SERVICETYP, :COF_DEADLINE, \
		:COF_ABDATUMZEIT, \
		:COF_ANDATUMZEIT, :COF_ZUSATZ, \
		:COF_1_CARID, :COF_1_DEPAIRID, :COF_1_DEPLAND, :COF_1_DESAIRID, \
		:COF_1_DESLAND, :COF_1_FLUGNR, \
		:COF_1_ABDATUMZEIT, \
		:COF_1_ANDATUMZEIT, \
		:COF_2_CARID, :COF_2_DEPAIRID, :COF_2_DEPLAND, :COF_2_DESAIRID, :COF_2_DESLAND, :COF_2_FLUGNR, \
		:COF_2_ABDATUMZEIT, \
		:COF_2_ANDATUMZEIT ´)
define(`_COF_VARS_LOOP´,   `COF_CARID,COF_ORGID,COF_DEPAIRID,COF_DEPLAND,\
		COF_DESAIRID,COF_DESLAND,COF_VONDATUM,COF_BISDATUM,COF_FLUGNR,\
      COF_ALLOTMENT,COF_SERVICETYP,COF_DEADLINE,\
		COF_ABDATUMZEIT,\
		COF_ANDATUMZEIT,COF_ZUSATZ,\
		COF_1_CARID,COF_1_DEPAIRID,COF_1_DEPLAND,COF_1_DESAIRID,\
		COF_1_DESLAND,COF_1_FLUGNR,\
		COF_1_ABDATUMZEIT,\
		COF_1_ANDATUMZEIT,\
		COF_2_CARID,COF_2_DEPAIRID,COF_2_DEPLAND,COF_2_DESAIRID,COF_2_DESLAND,COF_2_FLUGNR,\
		COF_2_ABDATUMZEIT,\
		COF_2_ANDATUMZEIT´)

define(`_LOOP_SELECT´, `"SELECT _SCOF_VARS_SELECT \
			FROM scof_consflug, nummer \
			WHERE instr(cof_tagkz,to_char(cof_vondatum + nr,'D')) > 0 \
			AND cof_vondatum + nr < cof_bisdatum \
			and sysdate between cof_vondatum and cof_bisdatum \
			and cof_vondatum + nr between to_date(:DATUM_VON, 'YYYY-MM-DD') \
			and to_date(:DATUM_BIS, 'YYYY-MM-DD') "|| l_p_where ||" \
			INTO _SCOF_VARS_INTO"´)
define(`_LOOP_VARS´,`_COF_VARS_LOOP´)
undefine(`_LOOP_RSET´)
define(`_LOOP_NAME´,`CONSOL-FLUEGE: Schleife ueber Consol-Fluege´)
define(`CONSOL_FLUEGE´,  _LOOP)
undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)




/***************************************************************************
VKM Schleifendefinitionen
*/

define(`_VKM_VARS_LOOP´,`VKMID, VKMKZ, VKMKZINT, ADRID_FR, VKMTID, VKMSID, VKM_FAHRER, VKM_ORGIDK´)
define(`_VKM_VARS_SELECT´,`vkm_vkmid, vkm_amtkz, vkm_vkmkz, vkm_frfid, vkm_vktid, vkm_vksid, vkm_fahrer, vkm_orgidk´)
define(`_VKM_VARS_INTO´,`:VKMID, :VKMKZ, :VKMKZINT, :ADRID_FR, :VKMTID, :VKMSID, :VKM_FAHRER, :VKM_ORGIDK´)

define(`S_VKM_VKMKZ_SORT´, `vkm_vkmkz´)
define(`S_VKM_AMTKZ_SORT´, `vkm_amtkz´)
/*******************************
VKM der Arbeitsgruppe
*/
define(`_LOOP_SELECT´,`"SELECT _VKM_VARS_SELECT \
    FROM   svkm_vkm, svko_vkmorg  \
    WHERE  vkm_vkmid = vko_vkmid \
	 AND  vko_orgid = :AG_ID \
    AND trunc(vkm_datvon) <= trunc(sysdate) \
    AND trunc(vkm_datbis) > trunc(sysdate) \
	 AND	vkm_sperre = 0 "|| l_p_where || " \
		ORDER BY "|| l_p_orderby || " vkm_vkmid \
    INTO _VKM_VARS_INTO "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_VKM_VARS_LOOP´)
define(`_LOOP_NAME´,`VKM-AG_ID: VKMS der Arbeitsgruppe´)
define(`VKM_AG_ID´, _LOOP)

/***************************************************************************
Entfernungswerk-Ortsverzeichnis Schleifendefinitionen
*/

define(`_EWK_VARS_LOOP´,`LAND, PLZ, ORT´)
define(`_EWK_VARS_INTO´,`:LAND, :PLZ, :ORT´)

/*******************************
GU-Entfernungswerk
*/
define(`_LOOP_SELECT´,`"SELECT distinct ew2_staid, ew2_plz, ew2_bez \
    FROM   sew2_ortknt \
    WHERE  ew2_eweid = 'GU' \
	 AND  ew2_staid = 'CH' \
	 AND  upper(ew2_bez) like upper(:l_ort_gu) "|| l_p_where ||" \
    INTO _EWK_VARS_INTO "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_EWK_VARS_LOOP´)
define(`_LOOP_NAME´,`EWK-CH-GU: Ortsverzeichnis GU Schweiz´)
define(`EWK_CH_GU´, `l_ort_gu = @getwert(ORT) || "%"; ´_LOOP)

undefine(`_LOOP_SELECT´)
/***************************************************************************
Ortsverzeichnis Schleifendefinitionen
*/

define(`_ORT_PLO_VARS_LOOP´,`ORT´)
define(`_ORT_PLO_VARS_INTO´,`:ORT´)

/*******************************
GU-Entfernungswerk  Provisiorisch Abfrage Postfach und OrderBy
*/
define(`_LOOP_SELECT´,`"SELECT ort_bez \
    FROM   splo_plzort, sort_ort \
    WHERE  ort_ortid = plo_ortid \
	 AND  plo_staid = :LAND \
	 AND  plo_plz =  :PLZ \
	 AND  nvl(plo_postfach,0)  =  0 "|| l_p_where || " \
	 ORDER BY ort_bez \
    INTO _ORT_PLO_VARS_INTO "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_ORT_PLO_VARS_LOOP´)
define(`_LOOP_NAME´,`ORT-PLO: Ortsverzeichnis transflow´)
define(`ORT_PLO´, _LOOP)


/***************************************************************************
alle PLZs eines Ortes ohne Postfachplzs
*/
define(`_PLZ_ORT_VARS_LOOP´,`PLZ, ORT´)
define(`_PLZ_ORT_VARS_INTO´,`:PLZ, :ORT´)

define(`_LOOP_SELECT´,`"SELECT plo_plz, ort_bez \
    FROM   splo_plzort, sort_ort \
    WHERE  ort_ortid = plo_ortid \
	 AND  ort_staid = :LAND \
	 AND  upper(ort_bez) like upper(:l_ort)||'%' \
	 AND  (ort_bez like upper  (substr (:l_ort,1,2))||'%' \
	    OR ort_bez like lower  (substr (:l_ort,1,2))||'%' \
	    OR ort_bez like initcap(substr (:l_ort,1,2))||'%' \
	    OR ort_bez like lower(substr (:l_ort,1,1))||upper(substr (:l_ort,2,1))||'%' )\
	 AND  nvl(plo_postfach,0)  =  0 "|| l_p_where ||" \
	 ORDER BY plo_plz, ort_bez \
    INTO _PLZ_ORT_VARS_INTO "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_PLZ_ORT_VARS_LOOP´)
define(`_LOOP_NAME´,`PLZ-ORT: PLZ zum Ort aus Ortsverzeichnis´)
define(`PLZ_ORT´, `l_ort = @getwert(ORT); ´ _LOOP)

undefine(`_LOOP_SELECT´)

define(`LA_FAHRT_END´,`_LOOP_END´)

/*******************************
*/

define(`LA_SDGEN_FA_END´,`_LOOP_END´)

undefine(`_LOOP_SELECT´)

/*************************************************************
ATT-STD Schleife ueber Zusatzattribute
romo 14.01.04 
*/

define(`_ATT_VARS_LOOP´,`ATTID, ATT_BEZ, ATT_EDIT´)
define(`_ATT_VARS_SELECT´,`att_attid, att_bez, att_edit´)
define(`_ATT_VARS_INTO´,`:ATTID, :ATT_BEZ, :ATT_EDIT´)

define(`_ATG_VARS_LOOP´,`ATG_ATGID, ATG_BEZ´)
define(`_ATG_VARS_SELECT´,`atg_atgid, atg_bez´)
define(`_ATG_VARS_INTO´,`:ATG_ATGID, :ATG_BEZ´)

define(`W_ATT_STD_SDG´, `att_sdg = 1´)
define(`W_ATT_STD_SDB´, `att_sdb = 1´)
define(`W_ATT_STD_FAR´, `att_far = 1´)
define(`W_ATT_STD_ADR´, `att_adr = 1´)
define(`W_ATT_STD_VKM´, `att_vkm = 1´)
define(`W_ATT_STD_ZRL´, `att_zrl = 1´)
define(`W_ATT_STD_LVE´, `att_lve = 1´)
define(`W_ATT_STD_ART´, `att_art = 1´)
define(`W_ATT_STD_BUC´, `att_buc = 1´)
define(`W_ATT_STD_BPO´, `att_bpo = 1´)
define(`W_ATT_STD_ADRUMS´, `att_adrums = 1´)

define(`_LOOP_SELECT´,`"SELECT _ATT_VARS_SELECT, _ATG_VARS_SELECT \
    FROM   satg_attgrp, satt_attribut  \
    WHERE  att_atgid = atg_atgid(+) \
	 AND  att_sperre = 0 " || l_p_where || " \
    ORDER BY "|| l_p_orderby || " att_attid \
    INTO _ATT_VARS_INTO, _ATG_VARS_INTO "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_ATT_VARS_LOOP, _ATG_VARS_LOOP´)
define(`_LOOP_NAME´,`ATT-STD: Attribute Stammdaten´)
define(`ATT_STD´, _LOOP)

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)


/*************************************************************
ATT-SDG Schleife ueber Zusatzattribute zur Sendung
romo 14.01.04
*/

define(`_LOOP_SELECT´,`"SELECT _ATT_VARS_SELECT, sba_wert \
    FROM   satt_attribut, ssba_attr  \
    WHERE  sba_sdgid = :SDGID \
	 AND sba_attid = att_attid \
	 AND  sba_lfzl = 0 " || l_p_where || " \
    ORDER BY "|| l_p_orderby || " sba_attid \
    INTO _ATT_VARS_INTO, :ATT_WERT "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_ATT_VARS_LOOP, ATT_WERT´)
define(`_LOOP_NAME´,`ATT-SDG: Attribute zur Sendung´)
define(`ATT_SDG´, _LOOP)

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)

/*************************************************************
ATT-SDB Schleife ueber Zusatzattribute zur Sendung
romo 14.01.04
*/

define(`_LOOP_SELECT´,`"SELECT _ATT_VARS_SELECT, sba_wert \
    FROM   satt_attribut, ssba_attr  \
    WHERE  sba_sdgid = :SDGID \
	 AND sba_attid = att_attid \
	 AND  sba_lfzl = :ZEILE_ID " || l_p_where || " \
    ORDER BY "|| l_p_orderby || " sba_attid \
    INTO _ATT_VARS_INTO, :ATT_WERT "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_ATT_VARS_LOOP, ATT_WERT´)
define(`_LOOP_NAME´,`ATT-SDB: Attribute zur Sendungsbeschreibungszeile´)
define(`ATT_SDB´, _LOOP)

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)


/*************************************************************
ATT-FAR Schleife ueber Zusatzattribute zur Fahrt
romo 14.01.04
*/

define(`_LOOP_SELECT´,`"SELECT _ATT_VARS_SELECT, fat_wert \
    FROM   satt_attribut, sfat_faratt  \
    WHERE  fat_farid = :FARID \
	 AND fat_attid = att_attid " || l_p_where || " \
    ORDER BY "|| l_p_orderby || " fat_attid \
    INTO _ATT_VARS_INTO, :ATT_WERT "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_ATT_VARS_LOOP, ATT_WERT´)
define(`_LOOP_NAME´,`ATT-FAR: Attribute zur Fahrt´)
define(`ATT_FAR´, _LOOP)

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)


/*************************************************************
ATT-ADR Schleife ueber Zusatzattribute zur Adresse
romo 14.01.04
*/

define(`_LOOP_SELECT´,`"SELECT _ATT_VARS_SELECT, aat_wert \
    FROM   satt_attribut, saat_adratt  \
    WHERE  aat_adrid = :ADRID \
	 AND aat_attid = att_attid " || l_p_where || " \
    ORDER BY "|| l_p_orderby || " aat_attid \
    INTO _ATT_VARS_INTO, :ATT_WERT "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_ATT_VARS_LOOP, ATT_WERT´)
define(`_LOOP_NAME´,`ATT-ADR: Attribute zur Adresse´)
define(`ATT_ADR´, _LOOP)

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)

/*************************************************************
ATT-KUN Schleife ueber Zusatzattribute zum Kontakt
*/

define(`_LOOP_SELECT´,`"SELECT _ATT_VARS_SELECT, kat_wert \
    FROM   satt_attribut, skat_kunatt  \
    WHERE  kat_kunid = :l_kunid \
	 AND kat_attid = att_attid " || l_p_where || " \
    ORDER BY "|| l_p_orderby || " kat_attid \
    INTO _ATT_VARS_INTO, :ATT_WERT "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_ATT_VARS_LOOP, ATT_WERT´)
define(`_LOOP_NAME´,`ATT" || "_KUN: (#l_kunid)")); @print(@sprintf("   ATTID: (#!ATTID), ATT_WERT: (#!ATT_WERT), ATT_BEZ: (#!ATT_BEZ), ATT_EDIT: (#!ATT_EDIT)´)
define(`ATT_KUN´, l_kunid = @getwert(KUNID); _LOOP)



/*************************************************************
ZFP-ADR Schleife ueber Zustellfenster zur Adresse
romo 15.01.04
*/

define(`_ZFP_VARS_LOOP´,`DATUM_VON, DATUM_BIS, TAETIGK´)
define(`_ZFP_VARS_INTO´,`:DATUM_VON, :DATUM_BIS, :TAETIGK´)

define(`_ZFP_VARS_INIT´,`
l_datum_von = DATUM_VON;
l_datum_bis = DATUM_BIS;
l_taetigk = @getwert(TAETIGK);
if ( l_taetigk == 0 ) {
	l_taetigk = "";
}
l_id_extern = @getwert(IDEXTERN);
if ( l_id_extern == 0 ) {
	l_id_extern = "";
}
l_proid = @getwert(PROID);
l_orgid = @getwert(AG_ID);
if ( l_orgid == "" ) {
	l_orgid = @getwert(AB_ID);
	if ( l_orgid == "" ) {
		l_orgid = @getwert(NL);
		if ( l_orgid == "" ) {
			l_orgid = FA_ID;
		}
	}
}
@print(@sprintf(@nls_gettext_x("li_mc.zfp_adr.call")));
´)
define(`_LOOP_SELECT´,`"SELECT \
		to_char (ldatum, 'YYYY.MM.DD') || ' ' || zfp_zeitvon, \
		to_char (ldatum+decode(sign( \
			(to_number(SUBSTR (zfp_zeitvon,1,2))*60 \
			+to_number(SUBSTR (zfp_zeitvon,4,2)) \
			) - (to_number(SUBSTR (zfp_zeitbis,1,2))*60 \
			+to_number(SUBSTR (zfp_zeitbis,4,2)) \
			) \
			),1,1,0), 'YYYY.MM.DD') || ' ' || zfp_zeitbis, \
									zfp_taetigkeit \
	from szfp_zeitfensterperiode, szfk_zeitfensterkopf, \
		(select to_date(SUBSTR (:l_datum_von,1,10),'YYYY.MM.DD')+(nr-1) as ldatum \
			from nummer \
			where nr-1 <= to_date (SUBSTR (:l_datum_bis,1,10), 'YYYY.MM.DD') \
								- to_date (SUBSTR (:l_datum_von,1,10),'YYYY.MM.DD')) \
	where zfk_zfkid = (	select SUBSTR (min (ltrim (to_char (ebene,'000')) || DECODE(zfk_proid,null,'1','0') || zfk_zfkid), 5, 999) \
			from szfk_zeitfensterkopf, ( \
			select level as ebene, org_orgid, org_orgidh, org_oetid \
			from sorg_t_einheit \
			connect by prior org_orgidh = org_orgid \
			start with org_orgid = :l_orgid) \
			where zfk_orgid = org_orgid \
			and zfk_adrid = :ADRID \
			and zfk_datvon <= ldatum \
			and zfk_datbis >= ldatum \
			and nvl(zfk_idextern, -1) = nvl(:l_id_extern, -1) \
			and nvl(zfk_proid, nvl(:l_proid,'###')) = nvl(:l_proid, '###') \
	) \
	and zfk_zfkid = zfp_zfkid \
        and SUBSTR (zfp_tage,decode(to_number(to_char(ldatum, 'd'))+ \
        (select decode(to_char(to_date('20050102','yyyymmdd'),'d'),'1',0,1) from dual),8,1, \
        to_number(to_char(ldatum, 'd'))+ \
        (select decode(to_char(to_date('20050102','yyyymmdd'),'d'),'1',0,1) from dual)), 1) = 1 \
	and zfp_taetigkeit = nvl(decode(:l_taetigk,0,zfp_taetigkeit,:l_taetigk),zfp_taetigkeit) " || l_p_where || " \
   ORDER BY "|| l_p_orderby || " ldatum, zfp_zeitvon \
   INTO _ZFP_VARS_INTO "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_ZFP_VARS_LOOP´)
define(`_LOOP_NAME´,`ZFP_A" || "DR: DATUM_VON: (" || @getwert(DATUM_VON) || "), DATUM_BIS: (" || @getwert(DATUM_BIS) || "), TAETIGK: (" || @getwert(TAETIGK) || ")´)
define(`ZFP_ADR´, _ZFP_VARS_INIT _LOOP)

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)


/*---------------------------
Schleife ueber alle Zeilen fuer Organisationseinheit, Tabellenname, Spalte, Datum 

define(`_GEN_SPALTE_VARS_SELECT´, `GEN_ZEIID, GEN_WERT´)
define(`_GEN_SPALTE_VARS_LOOP´, `GEN_ZEIID, GEN_WERT´)
define(`_GEN_SPALTE_VARS_INTO´, `:GEN_ZEIID, :GEN_WERT´)

define(`S_GEN_SPALTE_ZEILE´, `gen_zeiid´)
define(`S_GEN_SPALTE_WERT´, `gen_wert´)

define(`_GEN_SPALTE_VARS_INIT´, `
	l_p_orgid = @getwert(P1);
	l_p_tabelle = @getwert(P2);
	l_p_spaid = @getwert(P3);
	l_p_datum = @getwert(P4);
	l_p_test = "0";
	l_CurNum = @SqlOpenCursor(HSQL);
	if (@SqlPLSQL(l_CurNum,HSQL, "sgen.load_col_rows(:l_p_tabelle, :l_p_spaid,  \
		:l_p_orgid, :l_p_datum,  :l_p_datum, :l_p_test  ) " ) == FALSE)
    	{
       	return (FALSE);
    	}
	@SqlCloseCursor(l_CurNum, HSQL);
	´)

define(`_LOOP_SELECT´, `"SELECT gen_zeiid, gen_wert \
			FROM sgen_gendat \
			WHERE gen_genid in  \
	( SELECT sgen.get_column_genid (nr - 1 )  \
	  from nummer  where (nr  - 1 ) <= ( select sgen.get_row_count () from dual ) \
	)  \
	  order by " || l_p_orderby || " gen_zeiid, gen_wert \
		 	INTO :GEN_ZEIID, :GEN_WERT "´)

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_GEN_SPALTE_VARS_LOOP´)
define(`_LOOP_NAME´,`GEN-SPALTE alle Rows und Werte zu einer Spalte ´)
define(`GEN_SPALTE´, _GEN_SPALTE_VARS_INIT _LOOP ) 

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)

/***************************************************************************
SLDN Schleife ueber Lademittel-Nummern
*/

define(`_SLDN_VARS_LOOP´,`LDN_LADID, LDN_LFNR, LDN_INDNR, LDN_VEPID, LDN_AZ´)
define(`_SLDN_VARS_SELECT´,`ldn_ladid, ldn_lfnr, ldn_indnr, ldn_vepid, ldn_az´)
define(`_SLDN_VARS_INTO´,`:LDN_LADID, :LDN_LFNR, :LDN_INDNR, :LDN_VEPID, :LDN_AZ´)

define(`_LOOP_SELECT´,`"SELECT _SLDN_VARS_SELECT \
from ( SELECT 	ldn_ladid ,to_char(ldn_lfnr) as ldn_lfnr ,ldn_indnr ,lad_vepid as ldn_vepid \
		,decode(lad_vorz, 1, 'A', 'Z') as ldn_az \
FROM 	slad_ladmit, sldn_ladnummer \
WHERE 	lad_ladid = ldn_ladid \
AND	lad_belnr = :l_lad_belnr \
UNION \
SELECT 	ldn_ladid, to_char(ldn_lfnr) as ldn_lfnr, ldn_indnr ,ldn_info_vepid as ldn_vepid ,ldn_info_az as ldn_az \
from sldn_ladnummer \
where ldn_belnr = :l_lad_belnr \
and  ldn_ladid not in (select lad_ladid from slad_ladmit where lad_belnr = :l_lad_belnr ) \
) "|| l_p_where || " \
INTO _SLDN_VARS_INTO "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_SLDN_VARS_LOOP´)
define(`_LOOP_NAME´,`SLDN: Schleife ueber Lademittel indiv. LDM-Nummer´)
define(`SLDN_LOOP´, l_lad_belnr = @getwert(LAD_BELNR); _LOOP)

/***************************************************************************
SCOM Schleife ueber Kommunikationstypen eines Kontaktes
*/

define(`_SCOM_VARS_LOOP´,`COMID, COM_TYP, COM_ADRESSE, COM_TEXT, COM_TELTYP, COM_LDVW, COM_ORTVW, COM_KOMNR, COM_DW, COM_DEFAULT´)
define(`_SCOM_VARS_SELECT´,`com_comid, com_typ, com_adresse, com_teltyp, com_ldvw, com_ortvw, com_komnr, com_dw,  \
decode(com_default,1,'Y','N'), SUBSTR(com_text,1,250), SUBSTR(com_text,251,250),SUBSTR(com_text,501,250),SUBSTR(com_text,751,250),SUBSTR(com_text,1001,250),SUBSTR(com_text,1251,250),SUBSTR(com_text,1501,250),SUBSTR(com_text,1751,250)´)
define(`_SCOM_VARS_INTO´,`:COMID, :COM_TYP, :COM_ADRESSE, :COM_TELTYP, :COM_LDVW, :COM_ORTVW, :COM_KOMNR, :COM_DW, :COM_DEFAULT, :l_COM_TEXT1, :l_COM_TEXT2, :l_COM_TEXT3, :l_COM_TEXT4, :l_COM_TEXT5, :l_COM_TEXT6, :l_COM_TEXT7, :l_COM_TEXT8 ´)

define(`_LOOP_SELECT´,`"SELECT _SCOM_VARS_SELECT \
    FROM   scom_communication \
    WHERE  com_kunid = :l_kunid " || l_p_where || " \
    ORDER BY "|| l_p_orderby || " com_comid \
    INTO _SCOM_VARS_INTO "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_SCOM_VARS_LOOP´)
define(`_LOOP_NAME´,`SCOM: Schleife ueber Kommunikationstypen eines Kontaktes"));COM_TEXT=l_COM_TEXT1 || l_COM_TEXT2 || l_COM_TEXT3 || l_COM_TEXT4 || l_COM_TEXT5 || l_COM_TEXT6 || l_COM_TEXT7 || l_COM_TEXT8;@sprintf(@sprintf("´)
define(`SCOM_LOOP´, l_kunid = @getwert(KUNID); l_COM_TEXT1=""; l_COM_TEXT2=""; l_COM_TEXT3=""; l_COM_TEXT4="";l_COM_TEXT5="";l_COM_TEXT6="";l_COM_TEXT7="";l_COM_TEXT8=""; _LOOP)

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)

/*************************************************************
SANS Schleife ueber die Anschriften eines Kontaktes
*/

define(`_SANS_VARS_LOOP´,`ANSID, ANS_ANSTYPID, ANS_STR, ANS_STR2, ANS_PLZ, ANS_ORT, ANS_ORTID, ANS_ORTZUSATZ, ANS_STAAT, ANS_DEFAULT´)
define(`_SANS_VARS_SELECT´,`ans_ansid, ans_anstypid, ans_str, ans_str2, ans_plz, ans_ort, ans_ortid, ans_ortzusatz, ans_staat, ans_default´)
define(`_SANS_VARS_INTO´,`:ANSID, :ANS_ANSTYPID, :ANS_STR, :ANS_STR2, :ANS_PLZ, :ANS_ORT, :ANS_ORTID, :ANS_ORTZUSATZ, :ANS_STAAT, :ANS_DEFAULT´)

define(`_LOOP_SELECT´,`"SELECT _SANS_VARS_SELECT \
    FROM   sans_anschriften \
    WHERE  ans_kunid = :l_kunid " || l_p_where || " \
    ORDER BY "|| l_p_orderby || " ans_ansid \
    INTO _SANS_VARS_INTO "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_SANS_VARS_LOOP´)
define(`_LOOP_NAME´,`SANS: Schleife ueber die Anschriften eines Kontaktes´)
define(`SANS_LOOP´, l_kunid = @getwert(KUNID); _LOOP)

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)

/*************************************************************
HWT-STD Schleife ueber Hinweistexte
romo 14.06.04 
*/

define(`S_HWT_CODE´, `htc_code´)
define(`S_HWT_BEZ´, `htc_bez´)

define(`_HWT_VARS_LOOP´,`HWT_ID, HWT_CODE, HWT_BEZ, HWT_TEXT, HWT_FORMAT, HWT_GRUPPE, HWT_LAENGE, HWT_TYP´)
define(`_HWT_VARS_SELECT´,`htc_htcid, htc_code, htc_bez, SUBSTR(htc_text,1,250), decode(htc_typ, 1, htc_datformat, 3, htc_numformat, NULL), htg_bez, nvl(htc_laenge,decode(htc_typ,0,NULL,htg_deflaenge)), htc_typ´)
define(`_HWT_VARS_INTO´,`:HWT_ID, :HWT_CODE, :HWT_BEZ, :HWT_TEXT, :HWT_FORMAT, :HWT_GRUPPE, :HWT_LAENGE, :HWT_TYP´)

define(`_LOOP_SELECT´,`"SELECT _HWT_VARS_SELECT \
    FROM   shtg_hinwtxtgruppe, shtc_hinwtxtcode  \
    WHERE  htc_htgid = htg_htgid " || l_p_where || " \
    ORDER BY "|| l_p_orderby || " htg_bez, htc_code \
    INTO _HWT_VARS_INTO "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_HWT_VARS_LOOP´)
define(`_LOOP_NAME´,`HWT-STD: Hinweistexte Stammdaten´)
define(`HWT_STD´, _LOOP)

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)


/*************************************************************
HWT-STD-GRP Schleife ueber Hinweistexte der Gruppe
romo 02.07.04 
*/

define(`S_HWTGRP_CODE´, `htc_code´)
define(`S_HWTGRP_BEZ´, `htc_bez´)

define(`_LOOP_SELECT´,`"SELECT _HWT_VARS_SELECT \
    FROM   shtc_hinwtxtcode, shtg_hinwtxtgruppe \
    WHERE  htc_htgid = htg_htgid \
	 AND		htg_bez = :l_gruppe " || l_p_where || " \
    ORDER BY "|| l_p_orderby || " htg_bez, htc_code \
    INTO _HWT_VARS_INTO "´ )

undefine(`_LOOP_RSET´)
define(`_LOOP_VARS´,`_HWT_VARS_LOOP´)
define(`_LOOP_NAME´,`HWT-STD-GRP: Hinweistexte der Gruppe - Stammdaten´)
define(`HWT_STD_GRP´, l_gruppe = HWT_GRUPPE; _LOOP)

undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)

/*************************************************************
HWT-SDG Schleife ueber Hinweistexte der Sendung
romo 14.06.04 
*/

define(`S_HWTSDG_CODE´, `htc_code´)
define(`S_HWTSDG_BEZ´, `htc_bez´)
define(`_LOOP_RSET´,`HWT_ZUSATZ´)

define(`_LOOP_SELECT´,`"SELECT _HWT_VARS_SELECT \
    FROM   shtg_hinwtxtgruppe, shtc_hinwtxtcode, ssdh_sdghtc  \
    WHERE  sdh_htcid = htc_htcid \
	 AND htc_htgid = htg_htgid \
	 AND sdh_sdgid = :SDGID " || l_p_where || " \
    ORDER BY "|| l_p_orderby || " htg_bez, htc_code \
    INTO _HWT_VARS_INTO "´ )

define(`_LOOP_VARS´,`_HWT_VARS_LOOP´)
define(`_LOOP_NAME´,`HWT-SDG: Hinweistexte zur Sendung´)
define(`HWT_SDG´, _LOOP)

undefine(`_LOOP_RSET´)
undefine(`_LOOP_SELECT´)
undefine(`_LOOP_VARS´)



/*************************************************************************
rewi 04.09.00 Tagespreisformat ergaenzt
*/

define(`TAGESPREIS´,`
l_lafid  = ifelse($1,,"LAFID",$1);
l_spcid  = ifelse($2,,"",$2);
l_text   = ifelse($3,,"",@sprintf($3));
l_betrag = ifelse($4,,"",_ref(``$4´´));
l_wrgid  = ifelse($5,,"",_ref(``$5´´));
/* wekl: 09.03.2006 Issue 12232 Offert = Y, dann MOF in laf_files schreiben, bei N OOF in Laf_files schreiben. */
l_offert = ifelse($6,,"",ifelse($6,"Y","MOF","OOF"));
l_orgidk = ifelse($7,,"",_ref(``$7´´));
/* rune: 2010-03-08: vi problem mit folgender Zeile an 1024er Grenze */
l_relid  = ifelse($8,,"",_ref(``$8´´));
l_ldat   = ifelse($9,,"''"," to_date ('"|| _ref(``$9´´)	|| "','YYYY.MM.DD') ");
l_weitere_zeile  = ifelse($10,,"N",$10);
l_Sql_String = "BEGIN stgp.set_tgp('";
if ( l_weitere_zeile == "Y" )
{
l_Sql_String = "BEGIN stgp.add_tgp('";
}

/* Oracle PL/SQL-Package slaf Prozedur gen_la_std aufrufen */
l_Sql_String = l_Sql_String || l_lafid	 || "', '" ||
	 l_spcid	 || "', '" ||
	 l_text 	 || "', " ||
	 l_betrag || ", '" ||
	 l_wrgid  || "', '" ||
	 l_orgidk || "', '" ||
	 l_relid	 || "', " ||
	 l_ldat	 || ", " ||
	 "null, " ||
	 "null, " ||
	 "null, '" ||
	 l_offert || "');" ||
	 "END;";
    @print(l_Sql_String);
	 if (@SqlImmediate(l_Sql_String) == FALSE)
	 {
	 	 return (FALSE);
	 }
´)

/*************************************************************
stmo 13.03.02 Nummernermittlung hinzugefuegt
*/

define(`NUMM_NEU´,`
l_bereich  = ifelse($1,,"",$1);
l_orgid    = ifelse($2,,"",$2+0);
l_adrid    = ifelse($3,,"",_ref($3)+0);
l_datum    = ifelse($4,,"",$4);
l_hierarch = ifelse($5,,"",_ref($5));
l_zahl     = "";
$6         = "";
l_CurNum = @SqlOpenCursor(HSQL);
if (@SqlPLSQL(l_CurNum,HSQL, "snum.get_next_lim(:l_bereich, :l_orgid, :l_adrid, :l_datum, :l_hierarch, :l_zahl)") == FALSE) {
	return (FALSE);
}
$6       = l_zahl;
@SqlCloseCursor(l_CurNum, HSQL);
@print(@sprintf(@nls_gettext_x("li_mc.num_neu.call")));
´)

/*************************************************************
rosa 22.03.02 Lesen Raten von srat_raten
*/

define(`LESEN_RATE´,`
l_adrid  = ifelse($1,,"",$1);
l_produkt    = ifelse($2,,"",$2);
l_von      = ifelse($3,,"",$3);
l_bis      = ifelse($4,,"",$4);
l_gewicht      = ifelse($5,,"",$5);
l_rateclass      = ifelse($6,,"",$6);
l_art      = ifelse($7,,"",$7);

l_select = "Select substr (srat.get_rate("|| l_adrid || ",'" || \
l_produkt || "','" || l_von || "','" || l_bis || "','" || \
l_gewicht || "','" || l_rateclass || "','" || l_commodity || "'," || \
l_art || "),1,10), substr (srat.get_rateclass,1,1), \
substr (srat.get_ratetotal,1,10), substr (srat.get_gewicht,1,10) \
from dual into :RAT_RATE, :RAT_RATECLASS, :RAT_TOTAL, :RAT_GEWICHT";
@print(l_select);

if (@SqlImmediate(l_select) == TRUE)
      {
         @print("LESEN" || "_RATE: " || RAT_TOTAL );
      }
      else
      {
			@print(@sprintf(@nls_gettext_x("li_mc.lesen_rate.error")));
      }

´)

/*************************************************************
stmo 19.03.02 Zonenermittlung hinzugefuegt
mavo 11.04.04 Erweiterung um l_orgid
*/

define(`LZONE´,`
l_bereich  = ifelse($1,,"",$1);
l_staid    = ifelse($2,,"",$2);
l_plz      = ifelse($3,,"",$3);
l_ort      = ifelse($4,,"",_ref(``$4´´));
l_datum    = ifelse($5,,"",_ref(``$5´´));
$6         = "";
l_orgid    = ifelse($7,,"",_ref(``$7´´)+0);
l_zone     = "";

@print(@sprintf(@nls_gettext_x("li_mc.lzone.call")));

l_select = "SELECT SUBSTR (SZON.GET_ZONE( :l_bereich , :l_staid , :l_plz , :l_ort , slaf.li_to_date( :l_datum ) , DECODE( :l_orgid, '0', NULL, to_number( :l_orgid) ) ),1,254) FROM DUAL INTO :l_zone";
if (@SqlImmediate(l_select) == TRUE) { 
	@print(@sprintf(@nls_gettext_x("li_mc.lzone.return")));
	$6 = l_zone;
} else  { 
	@print(@sprintf(@nls_gettext_x("li_mc.lzone.error")));
}
´)

define(`LZEITZONE´,`
l_adrid  = ifelse($1,,0,$1);
l_zzone     = "";
/* wekl: Zeitzone ist maximal 64 stellen lang */
l_select = "Select substr (stzm.get_zeitzone("|| l_adrid || "),1,64) from dual into :l_zzone";

@print(l_select); \

if (@SqlImmediate(l_select) == TRUE) \
      { \
         @print("LZEI"|| "TZONE: " || l_zzone); \
         ADR_TZNAME = l_zzone; \
      } \
      else \
      { \
			@print(@sprintf(@nls_gettext_x("li_mc.lzeitzone.error"))); \
      } \

´)

/*************************************************************
stmo 03.03.03 Adressbeziehung Ermittlung hinzugefuegt
*/

define(`LADBEZIEH´,`
l_adridv   = $1;
l_btzid    = $2;
l_lfnr     = $3;
l_adridk   = "";
$4         = "";


l_select = "Select substr (sadb.get_adrid(" || l_adridv || ",'" || l_btzid || "'," || l_lfnr || "),1,10) \
from dual into :l_adridk";

if (@SqlImmediate(l_select) == TRUE) \
      { \
			@print(@sprintf(@nls_gettext_x("li_mc.ladbezieh.read"))); \
         $4 = l_adridk; \
      } \
      else \
      { \
			@print(@sprintf(@nls_gettext_x("li_mc.ladbezieh.error"))); \
      } \
´)

#define AUSWDIALOGZEILE(Auswahl,Text) \
l_zeilennr = l_zeilennr + 1; \
@def_dialog(Auswahl, l_zeilennr, 0, @sprintf(_ref(``Text´´)));

#define AUSWDIALOGINIT(Text) \
l_zeilennr = 0; \
@clr_dialog(); \
@def_dialog(0-1,0,0,@sprintf(_ref(``Text´´)));

#define AUSWDIALOGSTART(Vorschlag) \
ZZAUSWNR = @run_dialog(ifelse(Vorschlag,,0,Vorschlag),ZZAUSWTXT);

#include <fahrplan.mc>
#include <allgmodul.mc>

#include <kunden.mc>

/* Definition LMON_FORMAT ----------------------------------------------- */
#ifdef _lmon_no_compile
#define LMON_FORMAT( LMON_FORMAT_MARKIERUNG, LMON_FORMAT_NEUE_SEQUENZ, LMON_FORMAT_ENDE, LMON_FORMAT_ADD_INFO )
#else
#define LMON_FORMAT( LMON_FORMAT_MARKIERUNG, LMON_FORMAT_NEUE_SEQUENZ, LMON_FORMAT_ENDE, LMON_FORMAT_ADD_INFO ) \
@save_vars(l_text, l_orgid, l_usrid, l_codid, l_farid, l_sdgid, l_lafid, l_belid, l_sql, l_Cur, l_ret, l_azaid, l_frmid, l_bucid, l_lveid, l_info); \
l_text = @substr ( _ref(LMON_FORMAT_MARKIERUNG) ,1,100); \
l_orgid = @getwert(AG_ID,FALSE); \
l_usrid = @getwert(USRID,FALSE); \
l_codid = @codid(); \
l_farid = @getwert(FARID,FALSE); \
l_sdgid = @getwert(SDGID,FALSE); \
l_lafid = @getwert(LAFID,FALSE); \
l_belid = @getwert(BELID,FALSE); \
l_ret = ""; \
l_azaid = ""; \
l_frmid = ""; \
l_bucid = @getwert(BUCID,FALSE); \
l_lveid = @getwert(LVEID,FALSE); \
l_info = @substr ( ifelse(LMON_FORMAT_ADD_INFO,,"",_ref(LMON_FORMAT_ADD_INFO)) ,1,2000); \
if (  _ref(LMON_FORMAT_NEUE_SEQUENZ) == "Y" ) { \
	l_sql = "lmon.lm_init( :l_text, :l_orgid, :l_usrid, :l_codid, :l_farid, :l_sdgid, :l_lafid, :l_belid, :l_ret, :l_azaid, :l_frmid, :l_bucid, :l_lveid, :l_info )"; \
} else { \
	if ( ifelse( LMON_FORMAT_ENDE,,"N", _ref(LMON_FORMAT_ENDE)) == "Y" ) { \
		l_sql = "lmon.lm_ende( :l_text, :l_orgid, :l_usrid, :l_codid, :l_farid, :l_sdgid, :l_lafid, :l_belid, :l_ret, :l_azaid, :l_frmid, :l_bucid, :l_lveid, :l_info )"; \
	} else { \
		l_sql = "lmon.lm_upd( :l_text, :l_orgid, :l_usrid, :l_codid, :l_farid, :l_sdgid, :l_lafid, :l_belid, :l_ret, :l_azaid, :l_frmid, :l_bucid, :l_lveid, :l_info )"; \
	} \
} \
@print( "LMON_"||"FORMAT (" || l_text || ")"); \
l_Cur = @SqlOpenCursor(HSQL); \
@SqlPLSQL(l_Cur,HSQL, l_sql ); \
@SqlCloseCursor(l_Cur, HSQL); \
@print("Return value: (" || l_ret || ")"); \
@restore_vars(); 
#endif
/* Ende Definition LMON_FORMAT ------------------------------------------ */

#define LILA(_3gl_code) \
_rmhk(_3gl_code)

#define FAR_LDATUM \
l_SqlString = "BEGIN sabschluss.ldatum('"||FARID || "'); END;"; \
@print (l_SqlString); \
@SqlImmediate(l_SqlString);

#define DEBUG(_debugtext) \
@print (@sprintf(`_debugtext´));

define(`SAVE_VARS_BEGIN´,`@save_vars($1 ifelse($2,,,`,´$2) ifelse($3,,,`,´$3) ifelse($4,,,`,´$4) ifelse($5,,,`,´$5) ifelse($6,,,`,´$6) ifelse($7,,,`,´$7) ifelse($8,,,`,´$8) ifelse($9,,,`,´$9));´)
define(`SAVE_VARS_END´,`@restore_vars();´)

#define SPRTEXTANF(_plabel,_plang,_ptext,_plangvar) \
define(`_l_var´,`l_lbl_´_rmhk(_plabel)) \
_l_var = @sprintf(_ptext); \
l__lang = ifelse(_plangvar,,@getwert(ZZLANG),_plangvar);

#define SPRTEXTZ(_plang,_ptext) \
if (l__lang == ifelse(_plang,,"",_plang)) \
   { _l_var = @sprintf(_ptext); }

define(`SPRTEXTEND´,`´)

/* Definition Abrechnungszeile(EB) -------------------------------------------- */
define(`ABZ_NEU_FORMAT´,`
l_ABZ_NEU_FORMAT_lafid    = @getwert(LAFID,FALSE); 
if ( l_ABZ_NEU_FORMAT_lafid > "" ) {
	l_ABZ_NEU_FORMAT_k_usrid  = @getwert(USRID,TRUE); 
	l_ABZ_NEU_FORMAT_k_sdgid  = @getwert(K_SDGID,FALSE); 
	l_ABZ_NEU_FORMAT_k_farid  = @getwert(K_FARID,FALSE); 
	l_ABZ_NEU_FORMAT_k_ltyid  = @getwert(K_LTYID,FALSE); 
	l_ABZ_NEU_FORMAT_k_relid  = @getwert(K_RELID,FALSE); 
	l_ABZ_NEU_FORMAT_k_ab_id  = @getwert(K_AB_ID,FALSE); 
	l_ABZ_NEU_FORMAT_k_ldatum = @getwert(K_LDATUM,FALSE); 
ifelse($4,,,P1=_ref($4);)
	l_ABZ_NEU_FORMAT_spcid    = ifelse($1,,"",_ref($1)) ;
	l_ABZ_NEU_FORMAT_betnto   = ifelse($2,,"",_ref($2)) ;
	l_ABZ_NEU_FORMAT_text     = ifelse($3,,"",_ref($3)) ;
	l_ABZ_NEU_FORMAT_stcid    = ifelse($4,,"",_ref($4)) ;
	l_ABZ_NEU_FORMAT_betst    = ifelse($5,,"",_ref($5)) ;
	l_ABZ_NEU_FORMAT_ablage   = ifelse($6,,"",_ref($6)) ;
	l_ABZ_NEU_FORMAT_ref1     = ifelse($7,,"",_ref($7)) ;
	l_ABZ_NEU_FORMAT_ref2     = ifelse($8,,"",_ref($8)) ;
	l_ABZ_NEU_FORMAT_sql = "INSERT INTO sabz_abrzl \
		(abz_lafid,abz_abzid,abz_satzkz,abz_spcid, abz_betnto, abz_text, \
		abz_aend, abz_usrid,abz_sdgid, abz_farid, abz_ltyid, abz_relid, \
		abz_orgidk, abz_kper, abz_stcid, abz_betst, abz_abmonat, abz_ablage, abz_ref1, abz_ref2 ) \
		VALUES ( :l_ABZ_NEU_FORMAT_lafid, (select NVL(max(abz_abzid),0)+1 from sabz_abrzl where abz_lafid = :l_ABZ_NEU_FORMAT_lafid), \
		'S', :l_ABZ_NEU_FORMAT_spcid, (:l_ABZ_NEU_FORMAT_betnto +0), :l_ABZ_NEU_FORMAT_text,  sysdate, \
		:l_ABZ_NEU_FORMAT_k_usrid,:l_ABZ_NEU_FORMAT_k_sdgid,:l_ABZ_NEU_FORMAT_k_farid,:l_ABZ_NEU_FORMAT_k_ltyid, \
		(:l_ABZ_NEU_FORMAT_k_relid +0),(:l_ABZ_NEU_FORMAT_k_ab_id +0),slaf.li_to_date(:l_ABZ_NEU_FORMAT_k_ldatum),:l_ABZ_NEU_FORMAT_stcid, \
		(:l_ABZ_NEU_FORMAT_betst +0),'9',(:l_ABZ_NEU_FORMAT_ablage +0), :l_ABZ_NEU_FORMAT_ref1,:l_ABZ_NEU_FORMAT_ref2 )"; 
	@SqlImmediate( l_ABZ_NEU_FORMAT_sql );
} else {
	@save_vars( REPORT, SPRACHE, SPRACH_LABEL);
	SPRACH_LABEL = "$ABZ_NEU_FORMAT_NOLA";
	REPORT = "lbase";
	@setzen_feld_original(SPRACH_LABEL);
	@print( @getwert(SPRACH_LABEL) );
	@restore_vars();
}
´);

/* Definition Direktschleife  -------------------------------------------- */

/* von inparameter nur den teil nach INTO und ohne letztes " und ohne doppelpunkte */
define(_save_vars_string,`patsubst(`patsubst(`translit(`$*´,`:"´,`  ´)´,`\\r´,` ´)´,`\\n´,` ´)´)
/* INTO-VAR Liste, die ;-separiert ist */
define(`IMMEDIATE_out_var´,`patsubst(patsubst(patsubst(translit(`$1´,`,:´,`; ´),`\\r\|\\t\|\\n\| +\|\\"´,` ´),`^.* [iI][nN][tT][oO] \(.*\)$´,`\1´),` +´,`´)´)
define(`IMMEDIATE_in_var´,`
		/* Alle INPUT-Bind-Variablen merken als semikolon-getrennte liste in Variable */
		l_i = 1;
		l_all_bind_in = "";
		l_SQLSELECT = `$1´;
		l_length = @length( l_SQLSELECT );
		l_SQLSELECT = l_SQLSELECT || " ";
		while ( TRUE ) {
			l_char_at_i = @substr ( l_SQLSELECT, l_i+0, 1 );
			l_char_is_identifier = 0;

			/* Welche Variablen-Liste wird befuellt? */
			l_next_4_chars = @substr ( l_SQLSELECT, l_i+0, 4);
			if ( l_next_4_chars == "into" & l_is_text+0 == 0 ) {
				break;
			}

			/* kann das ein Name einer Bind-Variablen sein? */
			if ( l_start_pos_doppelpunkt+0 > 0 ) {
				if ( l_char_at_i >= "a" & l_char_at_i <= "z" |
				     l_char_at_i >= "A" & l_char_at_i <= "Z" |
				     l_char_at_i >= "0" & l_char_at_i <= "9" & l_start_pos_doppelpunkt+1 < l_i+0 |
				     l_char_at_i == "_" ) {
					l_char_is_identifier = 1;
				}
			}

			switch {
				case ( l_char_at_i == "'" ) {
					l_i = @pos(l_SQLSELECT,"'",l_i+1); /* ignoriere alles bis zum naechste hochkomma */
				}		
				case ( l_char_at_i == ":" ) {
					l_start_pos_doppelpunkt = l_i;
				}
				case ( l_char_is_identifier+0 > 0 ) {
				}
				case ( * ) {
					if ( l_start_pos_doppelpunkt+0 > 0 ) {
						l_all_bind_in = l_all_bind_in || @substr ( l_SQLSELECT, l_start_pos_doppelpunkt+1, l_i - l_start_pos_doppelpunkt -1 ) || ";";	
						l_start_pos_doppelpunkt = 0;
					}
				}
			}
			if ( l_i+0 > l_length+0 ) {
				break;
			}
			l_i = l_i + 1;
		}

		/* Input-Bind-Variablen ausgeben */
		l_sg = l_all_bind_in;
		l_sg_length = @length( l_sg );
		l_sg_start_pos = 1;
		while( TRUE ) {
			if ( l_sg_start_pos+0 > l_sg_length+0 | l_sg_start_pos+0 <= 0 ) {
				break;
			}
			l_sg_semikolon_pos = @pos( l_sg, ";", l_sg_start_pos+0);	
			if (l_sg_semikolon_pos+0 == 0 ) {
				l_sg_last_pos_before_semikolon = l_sg_length;
			} else {
				l_sg_last_pos_before_semikolon = l_sg_semikolon_pos-1;
			}
			l_sg_varname = @substr ( l_sg, l_sg_start_pos+0, l_sg_last_pos_before_semikolon - l_sg_start_pos + 1 );
			@print( "IN : (" || l_sg_varname || ") -> (" || @sprintf("#!" ||l_sg_varname) || ")" );
			l_sg_start_pos = l_sg_last_pos_before_semikolon+2;
		}
´)
define(`IMMEDIATE_out_var_print´,`
	/* Output-Bind-Variablen ausgeben */
	l_sg = l_all_bind_out;
	l_sg_length = @length( l_sg );
	l_sg_start_pos = 1;
	while( TRUE ) {
		if ( l_sg_start_pos+0 > l_sg_length+0 | l_sg_start_pos+0 <= 0 ) {
			break;
		}
		l_sg_semikolon_pos = @pos( l_sg, ";", l_sg_start_pos+0);
		if (l_sg_semikolon_pos+0 == 0 ) {
			l_sg_last_pos_before_semikolon = l_sg_length;
		} else {
			l_sg_last_pos_before_semikolon = l_sg_semikolon_pos-1;
		}
		l_sg_varname = @substr ( l_sg, l_sg_start_pos+0, l_sg_last_pos_before_semikolon - l_sg_start_pos + 1 );
		if (@xmatch(l_sg_varname,"#%")==FALSE) {
		    @print( "OUT: (" || l_sg_varname || ") -> (" || @getwert(@var(l_sg_varname), FALSE) || ")" ); 
		}
		l_sg_start_pos = l_sg_last_pos_before_semikolon+2;
	} 
	@print("");
´)

#define IMMEDIATE_LOOP( SQL ) \
	@save_vars(l_IMMEDIATE_LOOP_sql,l_i,l_all_bind_in,l_SQLSELECT,l_length,l_char_at_i,l_char_is_identifier,l_next_4_chars,l_is_text,l_start_pos_doppelpunkt,l_sg,l_sg_length,l_sg_start_pos,l_sg_semikolon_pos,l_sg_last_pos_before_semikolon,l_sg_varname);\
	l_IMMEDIATE_LOOP_sql = @sprintf(`SQL´);\
	@print( "`IMMEDIATE_LOOP´: " || l_IMMEDIATE_LOOP_sql );\
	IMMEDIATE_in_var(`l_IMMEDIATE_LOOP_sql´) \
	@save_vars(_save_vars_string( substr(`SQL´,eval(index(patsubst(``SQL´´,`[iI][nN][tT][oO]´,`INTO´),`INTO´)+4))), l_loopCur, l_all_bind_out);\
	l_loopCur = @SqlOpenCursor(HSQL); \
	l_all_bind_out = _addhk_stable(IMMEDIATE_out_var(`SQL´)); \
	@SqlPrepareAndExecute( l_loopCur, HSQL, l_IMMEDIATE_LOOP_sql );\
	while( @SqlFetchNext( l_loopCur, HSQL ) != 0 ) \
	{ \
		IMMEDIATE_out_var_print()

#define IMMEDIATE_LOOPE \
	} \
	@SqlCloseCursor( l_loopCur, HSQL ); \
	@restore_vars();\
	@restore_vars();

/* Definition IS_SET_FORMAT -------------------------------------------- */
define(`IS_SET_FORMAT´,`
if ( @gesetzt(ifelse(`$3´,`"Y"´,`@var($1)´,`$1´)) == TRUE ) {
	$2 = "Y";
	l_value = " with Value: (" || @getwert(ifelse(`$3´,`"Y"´,`@var($1)´,`$1´),FALSE) || ")";
} else {
	$2 = "N";
	l_value = "";
}
@print("IS_SET_FOR" || "MAT: " || ifelse(`$3´,`"Y"´,`$1´,_addhk(`$1´)) || " is set: (" || $2 || ")" || l_value);
´)

/* m4 Makros fuer DECLARE  -------------------------------------------- */

/* _rmhk_stable(string): Hochkommata entfernen falls vorhanden, auch wenn Kommas enthalten sind     */
define(`_rmhk_stable´,`patsubst(`$1´,`^"?\(.*[^"]\)"?$´,``\1´´)´)

/* _addhk_stable(string): Hochkommata hinzufuegen falls noch nicht vorhanden, auch wenn Kommas enthalten sind  */
define(`_addhk_stable´,`patsubst(`$1´,`^"?\(.*[^"]\)"?$´,``"\1"´´)´)

/* Erkennt Leerstring, getwert, LI-Text, Negativ-Zahlen, Variablen ohne!, Ansonsten LI-Zahl */
define(`_ref_stable´,`ifelse(`$1´,,,dnl
substr(`$1´,0,1),!,`@getwert(substr(`$1´,1))´,dnl 
substr(`$1´,0,1),",``$1´´,dnl
substr(`$1´,0,1),-,(0translit(``$1´´,`,´,`.´)),dnl 
index(0123456789,substr(`$1´,0,1)),-1,``$1´´,dnl 
translit(``$1´´,`,´,`.´)dnl 
)´)

/* Erkennt Leerstring, getwert, LI-Text, Variablen ohne! */
define(`_ref_nonumber_stable´,`ifelse(`$1´,,,dnl
substr(`$1´,0,1),!,`@getwert(substr(`$1´,1))´,dnl 
substr(`$1´,0,1),",``$1´´,dnl
index(+-0123456789,substr(`$1´,0,1)),-1,``$1´´,dnl 
``"$1"´´dnl 
)´)

/* Definition SIFELD -------------------------------------------- */
#define SIFELD(text,feld) \
@print("SIFEL" || "D:(" || text || ")=(" || _ref_stable(feld) || ")"); \
@setzen_feld(@var(text),,_ref_stable(feld));

/* -------------------------------------------- */
define(`_declare_m4´,`dnl
ifelse(dnl
substr(_rmhk_stable(`$1´),`1´,`1´),`n´,`number ´,dnl
substr(_rmhk_stable(`$1´),`1´,`1´),`d´,`datetime ´,dnl
`string ´dnl
)dnl
_rmhk_stable(`$2´)`´dnl
ifelse(dnl
_rmhk_stable(`$4´),`´,`´,dnl
` := ´dnl
ifelse(dnl
substr(_rmhk_stable(`$1´),1,1),`n´,`_ref_stable(_rmhk_stable(`$4´))´,dnl
`_ref_stable(ifelse(index(`0123456789-´,substr(`$4´,0,1)),`-1´,``$4´´,`_addhk_stable(`$4´)´))´dnl
)``´´dnl
)dnl
`;´dnl
´)

/* Definition DECLARE -------------------------------------------- */
#define DECLARE(typ,name,kommentar,initial) \
_declare_m4(`typ´,`name´,`kommentar´,`initial´)
)
/*------------------------------------*/

divert(0)dnl
@PRGNAME()
{
   INIT_MAKRO
