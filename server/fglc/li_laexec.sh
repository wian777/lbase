#!/usr/bin/ksh
#
#Beschreibung: ...
#
# 04.05.2010 stal/frth wrapper, der stdout filtert fuer li
#                      und modul-groessen reduzierung
# 2011.06.28 dafa Event publisher (LBASE NT) added. Entry, exit and possible
#                 errors will fire events. - Component "LBaseNT" and an 
#                 adequate OSGi runtime environment are assumed
#set -x

[ -f ${TRFL}/binsrv/lble.functions ] && { . ${TRFL}/binsrv/lble.functions && _lble=1; } || _lble=0

usage () {
	echo ""
	echo "Aufruf:"
	echo "$0 [-n] [-l LAFID] [-s LASID]"
	echo "-n --> NO-Debug -> Standard-OUT von laexec wird unsichtbar"
	echo "-l --> PFLICHTFELD: Enth?lt die LAFID der auszufuehrenden LA."
	echo "-s --> PFLICHTFELD: Enth?lt den neuen Status der auszufuehrenden LA."
	echo ""

	((_lble)) && le_fail 1 LICOMP
	exit 1
}

DEBUG=1
# DEBUG ist standard, Wenn Umgebungs-Variable LI_LAEXEC_DEBUG=0 dann kein Debug
if [ -n "${LI_LAEXEC_DEBUG}" -a "${LI_LAEXEC_DEBUG}" -eq 0 ] ; then
	DEBUG=0
fi

LAFID=""
LASID=""

if [ "$#" -eq 0 ]  ; then
	usage
fi

while [ "$#" -ge 1 ]
do
	case "$1" in
		"-n")	DEBUG=0
			shift
			;;
		"-l")	LAFID="${2}"
			shift 2
			;;
		"-s")	LASID="${2}"
			shift 2
			;;
		"*")	usage
	esac
done

((_lble)) && le_begin LA "li_laexec.lafid=${LAFID}" "li_laexec.lasid=${LASID}"

RESSET=$SQR/output/resvor_${LAFID}_$(date "+%Y.%m.%d_%H:%M:%S")_$$.res;
echo "[LA1]" > $RESSET;
echo "LAFID=${LAFID}" >> $RESSET;
echo "LASID=${LASID}" >> $RESSET;

if [ "${DEBUG}" -eq 1 ] ; then
	echo "${0} -> LAFID: (${LAFID}), LASID: (${LASID}), DEBUG: (${DEBUG})"
	exec $TRFL/sh/sqr/laexec.sh $RESSET ;
	RC=$?
else	
	exec $TRFL/sh/sqr/laexec.sh $RESSET > /dev/null ;
	RC=$?
fi

[ "${RC}" -ne 0 ] && ((_lble)) && le_fail ${RC} LA

((_lble)) && le_end LA
return ${RC}

