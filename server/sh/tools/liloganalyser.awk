#
# LI-LOG-Analyser: awk -f liloganalyser.awk li-log.txt
# Ausgabe nach Standardout
# offen: cursor
#
BEGIN {
	gi = 0
	longestDuration = 0
	FEHLER_AUSGABE = 0
	SPACE=""
}
# Fehler erkennen
/^LisExecCodePlan liefert -.*$/ {
	FEHLER_AUSGABE = 1
}
# Nach aufgetretenem Fehler alles ausgeben
/.*/ {
	if ( FEHLER_AUSGABE > 0 ) {
		print $0
	}
}
END {
	for ( i = gi; i > 0; i-- ) {
		printf("\nModul-Level der letzten CODIDs: %3d Codid: %s mit jeweils noch %d offenen save_vars\n", i, gCODID[i], CODIDSAVEVARS[ gCODID[gi] ])
	}
	printf("longest lasting CODID in Sek: %d\n", longestDuration)
}
# MODUL anfang
/^[[:space:]]*[[:print:]]+=[[:print:]]+,[[:space:]]+[[:print:]]+=[[:print:]]+[[:space:]]+"[[:print:]]+":.*$/ {
	BIB   = gensub( /^[[:space:]]*[[:print:]]+=([[:print:]]+),[[:space:]]+[[:print:]]+=([[:print:]]+)[[:space:]]+"([[:print:]]+)":.*$/, "\\1", "g")
	KRIT  = gensub( /^[[:space:]]*[[:print:]]+=([[:print:]]+),[[:space:]]+[[:print:]]+=([[:print:]]+)[[:space:]]+"([[:print:]]+)":.*$/, "\\2", "g")
	MODUL = gensub( /^[[:space:]]*[[:print:]]+=([[:print:]]+),[[:space:]]+[[:print:]]+=([[:print:]]+)[[:space:]]+"([[:print:]]+)":.*$/, "\\3", "g")
	#printf( "%6d: %-10s %-10s %-20s\n", NR, BIB, KRIT, MODUL)
	next
}
# STB anfang
/^[[:space:]]*STB[[:space:]]+[[:digit:]]+[[:space:]]+[[:print:]]+-[[:digit:]]+[[:space:]]+\(.*\).*$/	{
	STBID       = gensub( /^[[:space:]]*STB[[:space:]]+([[:digit:]]+)[[:space:]]+([[:print:]]+-[[:digit:]]+)[[:space:]]+\(([[:print:]]+)[[:space:]]+([[:digit:]\.]+)[[:space:]]+([[:digit:]:]+).*\).*$/, "\\1", "g")
	CODID       = gensub( /^[[:space:]]*STB[[:space:]]+([[:digit:]]+)[[:space:]]+([[:print:]]+-[[:digit:]]+)[[:space:]]+\(([[:print:]]+)[[:space:]]+([[:digit:]\.]+)[[:space:]]+([[:digit:]:]+).*\).*$/, "\\2", "g")
	INTERPRETER = gensub( /^[[:space:]]*STB[[:space:]]+([[:digit:]]+)[[:space:]]+([[:print:]]+-[[:digit:]]+)[[:space:]]+\(([[:print:]]+)[[:space:]]+([[:digit:]\.]+)[[:space:]]+([[:digit:]:]+).*\).*$/, "\\3", "g")
	BC_VERSION  = gensub( /^[[:space:]]*STB[[:space:]]+([[:digit:]]+)[[:space:]]+([[:print:]]+-[[:digit:]]+)[[:space:]]+\(([[:print:]]+)[[:space:]]+([[:digit:]\.]+)[[:space:]]+([[:digit:]:]+).*\).*$/, "\\4", "g")
	ENTER_TIME  = gensub( /^[[:space:]]*STB[[:space:]]+([[:digit:]]+)[[:space:]]+([[:print:]]+-[[:digit:]]+)[[:space:]]+\(([[:print:]]+)[[:space:]]+([[:digit:]\.]+)[[:space:]]+([[:digit:]:]+).*\).*$/, "\\5", "g")
	gi++
	printf( "%6d:%2d %-15s STBID:%2d BC: %-3s START:%-6s GELADEN: %-6s |%*sMODUL %s %s | %s\n", NR, gi, CODID, STBID, BC_VERSION, ENTER_TIME, INTERPRETER, gi, SPACE, MODUL, BIB, KRIT)
	gCODID[gi] = CODID
	CODIDSTARTTIME[ gCODID[gi] ] =  mktime( gensub(/([[:digit:]]+):([[:digit:]]+):([[:digit:]]+)/, "1990 01 01 \\1 \\2 \\3", "g", ENTER_TIME) )
	gBIB[gi] = BIB
	gKRIT[gi] = KRIT
	gMODUL[gi] = MODUL
	next
}
# VERSION auswahl
/^([[:space:]]*[[:print:]]+[[:space:]]+"[[:print:]]+":)?[[:space:]]+STB[[:space:]]+[[:digit:]]+([[:space:]]+FIX)?[[:space:]]+Version[[:space:]]+[[:digit:]]+[[:space:]]+[[:print:]]+[[:space:]]+[[:print:]]+.*$/ {
	VERID     = gensub( /^([[:space:]]*[[:print:]]+[[:space:]]+"[[:print:]]+":)?[[:space:]]+STB[[:space:]]+[[:digit:]]+([[:space:]]+FIX)?[[:space:]]+Version[[:space:]]+([[:digit:]]+)[[:space:]]+([[:print:]]+)[[:space:]]+([[:print:]]+).*$/, "\\3", "g")
	CODID     = gensub( /^([[:space:]]*[[:print:]]+[[:space:]]+"[[:print:]]+":)?[[:space:]]+STB[[:space:]]+[[:digit:]]+([[:space:]]+FIX)?[[:space:]]+Version[[:space:]]+([[:digit:]]+)[[:space:]]+([[:print:]]+)[[:space:]]+([[:print:]]+).*$/, "\\4", "g")
	COMPONENT = gensub( /^([[:space:]]*[[:print:]]+[[:space:]]+"[[:print:]]+":)?[[:space:]]+STB[[:space:]]+[[:digit:]]+([[:space:]]+FIX)?[[:space:]]+Version[[:space:]]+([[:digit:]]+)[[:space:]]+([[:print:]]+)[[:space:]]+([[:print:]]+).*$/, "\\5", "g")
	#printf( "%6d: %-10s VERID:%2d Komponente: %s\n", NR, CODID, VERID, COMPONENT)
	next
}
# Version anfang
/^[[:space:]]*[^\.]+-[[:digit:]]+[[:space:]]+\([[:print:]]+[[:space:]]+[[:digit:]\.]+[[:space:]]+[[:digit:]:]+\).*$/ {
	CODID       = gensub( /^[[:space:]]*([[:print:]]+-[[:digit:]]+)[[:space:]]+\(([[:print:]]+)[[:space:]]+([[:digit:]\.]+)[[:space:]]+([[:digit:]:]+)\).*$/, "\\1", "g")
	INTERPRETER = gensub( /^[[:space:]]*([[:print:]]+-[[:digit:]]+)[[:space:]]+\(([[:print:]]+)[[:space:]]+([[:digit:]\.]+)[[:space:]]+([[:digit:]:]+)\).*$/, "\\2", "g")
	BC_VERSION  = gensub( /^[[:space:]]*([[:print:]]+-[[:digit:]]+)[[:space:]]+\(([[:print:]]+)[[:space:]]+([[:digit:]\.]+)[[:space:]]+([[:digit:]:]+)\).*$/, "\\3", "g")
	ENTER_TIME  = gensub( /^[[:space:]]*([[:print:]]+-[[:digit:]]+)[[:space:]]+\(([[:print:]]+)[[:space:]]+([[:digit:]\.]+)[[:space:]]+([[:digit:]:]+)\).*$/, "\\4", "g")
	gi++
	 printf( "%6d:%2d %-15s VERSION  BC: %-3s START:%-6s GELADEN: %-6s |%*sMODUL %s %s | %s | %s\n", NR, gi, CODID, BC_VERSION, ENTER_TIME, INTERPRETER, gi, SPACE, MODUL, BIB, KRIT, COMPONENT)
	gCODID[gi] = CODID
	CODIDSTARTTIME[ gCODID[gi] ] =  mktime( gensub(/([[:digit:]]+):([[:digit:]]+):([[:digit:]]+)/, "1990 01 01 \\1 \\2 \\3", "g", ENTER_TIME) )
	next
}
# VAR anfang
/^[[:space:]]*[[:print:]]+\.(select|update)[[:space:]]+[[:print:]]+[[:space:]]+\([[:print:]]+[[:space:]]+[^[:space:]]+[[:space:]]+[[:print:]]+\).*$/ {
	VANID       = gensub( /^[[:space:]]*([^\.]+)\.((select|update))[[:space:]]+([[:print:]]+)[[:space:]]+\(([^[:space:]]+)[[:space:]]+([^[:space:]]+)[[:space:]]+([^) ]+)\).*$/, "\\1", "g")
	VARTYP      = gensub( /^[[:space:]]*([^\.]+)\.((select|update))[[:space:]]+([[:print:]]+)[[:space:]]+\(([^[:space:]]+)[[:space:]]+([^[:space:]]+)[[:space:]]+([^) ]+)\).*$/, "\\3", "g")
	CODID       = gensub( /^[[:space:]]*([^\.]+)\.((select|update))[[:space:]]+([[:print:]]+)[[:space:]]+\(([^[:space:]]+)[[:space:]]+([^[:space:]]+)[[:space:]]+([^) ]+)\).*$/, "\\4", "g")
	INTERPRETER = gensub( /^[[:space:]]*([^\.]+)\.((select|update))[[:space:]]+([[:print:]]+)[[:space:]]+\(([^[:space:]]+)[[:space:]]+([^[:space:]]+)[[:space:]]+([^) ]+)\).*$/, "\\5", "g")
	BC_VERSION  = gensub( /^[[:space:]]*([^\.]+)\.((select|update))[[:space:]]+([[:print:]]+)[[:space:]]+\(([^[:space:]]+)[[:space:]]+([^[:space:]]+)[[:space:]]+([^) ]+)\).*$/, "\\6", "g")
	ENTER_TIME  = gensub( /^[[:space:]]*([^\.]+)\.((select|update))[[:space:]]+([[:print:]]+)[[:space:]]+\(([^[:space:]]+)[[:space:]]+([^[:space:]]+)[[:space:]]+([^) ]+)\).*$/, "\\7", "g")
	gi++
	printf( "%6d:%2d %-15s VAR      BC: %-3s START:%-6s GELADEN: %-6s |%*sVANID: %s VARTYP: %s\n", NR, gi, CODID, BC_VERSION, ENTER_TIME, INTERPRETER, gi, SPACE, VANID, VARTYP)
	gCODID[gi] = CODID
	CODIDSTARTTIME[ gCODID[gi] ] =  mktime( gensub(/([[:digit:]]+):([[:digit:]]+):([[:digit:]]+)/, "1990 01 01 \\1 \\2 \\3", "g", ENTER_TIME) )
	next
}
# CODID ende a) exit
/^[[:space:]]*[[:print:]]+-[[:digit:]]+:[[:space:]]+exit[[:space:]]+\([[:digit:]:]+).*$/ {
	CODID = gensub( /^[[:space:]]*([[:print:]]+-[[:digit:]]+):[[:space:]]+exit[[:space:]]\(([[:digit:]:]+)).*$/, "\\1", "g")
	EXIT_TIME = gensub( /^[[:space:]]*([[:print:]]+-[[:digit:]]+):[[:space:]]+exit[[:space:]]\(([[:digit:]:]+)).*$/, "\\2", "g")
	CODIDENDTIME =  mktime( gensub(/([[:digit:]]+):([[:digit:]]+):([[:digit:]]+)/, "1990 01 01 \\1 \\2 \\3", "g", EXIT_TIME) )
	CODIDTIME = CODIDENDTIME - CODIDSTARTTIME[ gCODID[gi] ] 
	if ( CODIDSAVEVARS[ gCODID[gi] ] != 0 ) {
		printf("ACHTUNG: %d vars-Aufrufe in CODID %s offen\n", CODIDSAVEVARS[gCODID[gi]], gCODID[gi])
	}
	if ( longestDuration < CODIDTIME ) {
		 longestDuration = CODIDTIME
	} 
	printf( "%6d:%2d %-15s                   ENDE:%-6s DURATION:%d\n", NR, gi, CODID, EXIT_TIME, CODIDTIME )
	gi--
	next
}
# CODID ende b) return
/^[[:space:]]*[[:print:]]+-[[:digit:]]+:[[:space:]]+returns[[:space:]]+to[[:space:]]+.*\([[:digit:]:]+\).*$/ {
	CODID     = gensub( /^[[:space:]]*([[:print:]]+-[[:digit:]]+):[[:space:]]+returns[[:space:]]+to[[:space:]]+.*\(([[:digit:]:]+)\).*$/, "\\1", "g")
	EXIT_TIME = gensub( /^[[:space:]]*([[:print:]]+-[[:digit:]]+):[[:space:]]+returns[[:space:]]+to[[:space:]]+.*\(([[:digit:]:]+)\).*$/, "\\2", "g")
	CODIDENDTIME =  mktime( gensub(/([[:digit:]]+):([[:digit:]]+):([[:digit:]]+)/, "1990 01 01 \\1 \\2 \\3", "g", EXIT_TIME) )
	CODIDTIME = CODIDENDTIME - CODIDSTARTTIME[ gCODID[gi] ] 
	if ( CODIDSAVEVARS[ gCODID[gi] ] != 0 ) {
		printf("ACHTUNG: %d vars-Aufrufe in CODID %s offen\n", CODIDSAVEVARS[gCODID[gi]], gCODID[gi])
	}
	if ( longestDuration < CODIDTIME ) {
		 longestDuration = CODIDTIME
	} 
	printf( "%6d:%2d %-15s                   ENDE:%-6s DURATION:%d\n", NR, gi, CODID, EXIT_TIME, CODIDTIME )
	gi--
	next
}
# save_vars
/^[[:space:]]*@save_vars\([[:digit:]]+\).*$/ {
	COUNT     = gensub( /^[[:space:]]*@save_vars\(([[:digit:]]+)\).*$/, "\\1", "g")
	CODIDSAVEVARS[ gCODID[gi] ]++
	#printf("%d savevars mit %d Variablen in CODID %s in Zeile %6d\n", CODIDSAVEVARS[ gCODID[gi] ], COUNT, gCODID[gi], NR)
	next
}
# restore_vars
/^[[:space:]]*@restore_vars\([[:digit:]]+\).*$/ {
	COUNT     = gensub( /^[[:space:]]*@restore_vars\(([[:digit:]]+)\).*$/, "\\1", "g")
	CODIDSAVEVARS[ gCODID[gi] ]--
	#printf("%d restorevars mit %d Variablen in CODID %s in Zeile %6d\n", CODIDSAVEVARS[ gCODID[gi] ], COUNT, gCODID[gi], NR)
	next
}
