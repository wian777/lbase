#	2010.03.26 rune:	awk script to "compile with line_numbers" if ( lines = "L" )
#	2010.05.17 rune:	turn m4 traceon if ( trace = "X" )
BEGIN {
#	list of format names separated by ";" where LINE_NUMBER_LPEC must be suppressed
	l_no_lineno = ";COMMON;DECLARE;KOMM;ENTAND;ENTYES;ENTNO;ENTBAND;ENTBANR;ENTBANR999;ENTBNR;ENTBNR999;DENTYES;TBLOCK;TBLOCKTEXT;TBLOCKEND;DBPRUEFYES;IMMEDIATE_LOOPE;LILA;";
	if ( trace == "X" ) { print " traceon "; }
}
{	if ( lines == "L" ) {
		n=split($0,w,"[()]");
		l_pos = 0;
		l_search = ";"w[1]";";
		if ( n > 0 ) { l_pos = match(l_no_lineno,l_search); }
		# printf "n=%d, w[1]=<%s>, l=%d\n", n, l_search, l_pos;
		if ( l_pos == 0 && $0 > " " ) { print "@ln(" FNR ");"; }
		print $0;
	} else {
		print $0;
	  }
}
