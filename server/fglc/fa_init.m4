/* 
Initialisierungsmodul fuer Firma 

03.10.96 rewi	Aenderung bei Initialisiertung Kundenwaehrung 
09.12.97 rewi	Setzen der Kostentraeger in die Variablen-Section
				 	erfolgt jetzt erst am Ende der Firmen-Einstellungen
					Bisher war es am Anfang der Firmeneinstellungen, damit
					K_AB_ID bei Bedarf im Firmeneinstellungsmodul auf die AG
					gesetzt werden kann.
25.02.98 rewi  K_FARID nur setzen, wenn K_SDGID leer ist, damit nach Abrechnung
               noch umdisponiert werden kann. (Anpassung ueber Hauptlauf)
25.01.02 rewi  Bei Returncode 2 aus ABR_KD_INIT wird ausgestiegen
25.06.10 mavo  K_LAFID setzen (Ladeeinheit als Kostentraeger) + K_VKMID
*/


define(""{""ABR_KD_INIT_INIT""}"",""{""
if (_KRIID != "ABR_FA_ID" & _KRIID != "ABR_KOND" & _KRIID != "ABR_ALLG") 
   { 
		if (@call("ABR_KD_INIT", FA_ID, FA_ID) == 2)
		{
			return(2);
		}
   }
else
{
	/* wird jetzt in Variablen-Methoden gesetzt
   l_wrgid   = " ";
   l_abccode = " ";
   l_kd_rdg  = " ";
   l_kutid   = " ";
   l_kursdat = "";
	if (@gesetzt (KD_WRGID) == TRUE )
		{ l_kd_wrgid = KD_WRGID; }
	else
		{ l_kd_wrgid = ""; }
   l_ret = @SqlImmediate (
   "SELECT fir_wrgid, fir_kutid, nvl(fiw_wrgid, fir_wrgid), \
   to_char(sysdate,'YYYY.MM.DD'), fiw_abc, fiw_rdg \
   FROM sfir_firma, sadr_adresse, sfiw_firwrg \
   WHERE fir_orgid = :FA_ID \
   AND adr_adrid = :ADRID_RE \
   AND fir_orgid = fiw_orgid(+) \
   AND fiw_wrgid = nvl(:l_kd_wrgid, fir_wrgid) \
   INTO :FA_WRGID, :l_kutid, :l_wrgid, \
   :l_kursdat, :l_abccode, :l_kd_rdg");
	if (l_ret != TRUE)
   {
      @print("Fehler bei Initialisierung Waehrung/Error Currency !!!!!!!!!!!!");
		l_kursdat = SYS_DATUM;
	}

   if ( @gesetzt(KUTID) == FALSE )
		{ KUTID  = l_kutid; }
   if ( @gesetzt(KD_WRGID) == FALSE )
		{ KD_WRGID = l_wrgid; }
   if ( @gesetzt(ABCCODE) == FALSE )
		{ ABCCODE  = l_abccode; }
   if ( @gesetzt(KURSDATUM) == FALSE )
		{ KURSDATUM  = l_kursdat; }
   if ( @gesetzt(KD_RDG) == FALSE )
		{ KD_RDG  = l_kd_rdg; }
	*/

   /* Kostentraeger (Sendung, Fahrt, Ladung, Relation, Abteilung) */
   if (@IsSection ("VARIABLE") == FALSE )
   {
      @AddSection("VARIABLE");
   }

   if (@gesetzt(SDGID) == TRUE)
   {  
		if (@getwert(SDGID) > " ")
		{  
			K_SDGID = @getwert(SDGID); 
		}
		else
		{  
			K_FARID = @getwert(FARID); 
			K_LTYID = @getwert(LTYID);
		}
   }
	else
   {  
      K_FARID = @getwert(FARID); 
      K_LTYID = @getwert(LTYID);
   }

   K_RELID = RELATION;

   if (@gesetzt(LAFID) == TRUE )
   {  
		if (@getwert(LAF_TRAEGERLAFID) > " ")
		{  
   			K_LAFID = @getwert(LAF_TRAEGERLAFID);
   		}
		if (@getwert(LAF_VKMID) > " ")
		{  
  			K_VKMID = @getwert(LAF_VKMID);
   		}
   }

   if (@gesetzt(K_AB_ID) == FALSE )
		{ K_AB_ID = @getwert(AB_ID); }

   if (@gesetzt(K_LDATUM) == FALSE )
		{ K_LDATUM = @getwert(LDATUM); }

}
""}"")

define(""{""ABR_KD_INIT_END""}"",""{""
	if (_KRIID == "ABR_FA_ID") 
	{ 
		if (@gesetzt(SDGID) == TRUE)
		{  
         @SetItem ("VARIABLE", "K_SDGID", @getwert(K_SDGID));
		}
		@SetItem ("VARIABLE", "K_FARID", @getwert(K_FARID));
      @SetItem ("VARIABLE", "K_LTYID", @getwert(K_LTYID));
		@SetItem ("VARIABLE", "K_RELID", K_RELID);
		@SetItem ("VARIABLE", "K_AB_ID", K_AB_ID);
		@SetItem ("VARIABLE", "K_LDATUM", K_LDATUM);
	}
""}"")
