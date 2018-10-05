/* Initialisierungsmodul fuer Abrechnung 

????????  rewi  bei weiterschalten Adresse return(2)
22.12.99  rewi  @abre_start() jetzt am Ende des Offerts aufrufen
08.02.01  rewi  ABCCODE am Schluss setzen
18.01.06  mavo  Issue http://10.208.83.22/myissue/issue_edit.aspx?id=14
                neue Variablen ZZ_FIXTAG und ZZ_PLUSMONAT
09.12.08   woba Issue 17039 neue Variable ADR_SAEUMNISZA
*/

define(""{""OFFERT_INIT""}"",""{""


if ( @call("ABR_KD_INIT", ADRID_RE, ADRID_RE, FA_ID, FA_ID) == 2 )
{
 return(2);
}


if (@IsSection ("VARIABLE") == FALSE )
{
   @AddSection("VARIABLE");
}

@SetItem("VARIABLE", "ADRID_KRIT", ADRID_KRIT);
@SetItem("VARIABLE", "BELEGTYP", BELEGTYP);
@SetItem("VARIABLE", "FA_ID", FA_ID);
@SetItem("VARIABLE", "FA_WRGID", FA_WRGID);
@SetItem("VARIABLE", "FA_RDG", FA_RDG);
@SetItem("VARIABLE", "KUTID", KUTID);
@SetItem("VARIABLE", "KURSDATUM", KURSDATUM);
@SetItem("VARIABLE", "KD_WRGID", KD_WRGID);
@SetItem("VARIABLE", "KD_RDG", KD_RDG);
@SetItem("VARIABLE", "SAMCODE", @getwert(SAMCODE));
@SetItem("VARIABLE", "SAMTKZS", @getwert(SAMTKZS));
@SetItem("VARIABLE", "SAMTKZ", @getwert(SAMTKZ));
@SetItem("VARIABLE", "SAMZR", @getwert(SAMZR));
@SetItem("VARIABLE", "ZZ_FRACHT", @getwert(ZZ_FRACHT));
@SetItem("VARIABLE", "ZZ_ZOLL", @getwert(ZZ_ZOLL));
@SetItem("VARIABLE", "ZZ_VAR", ZZ_VAR);
@SetItem("VARIABLE", "ZZ_FIXTAG", @getwert(ZZ_FIXTAG));
@SetItem("VARIABLE", "ZZ_PLUSMONAT", @getwert(ZZ_PLUSMONAT));
@SetItem("VARIABLE", "ABCCODE", @getwert(ABCCODE));
@SetItem("VARIABLE", "ABR_MODUL1", @codid());
@SetItem("VARIABLE", "ADR_SAEUMNISZA", @getwert(ADR_SAEUMNISZA));
""}"")
