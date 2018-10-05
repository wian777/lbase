#!/bin/ksh
#
#Beschreibung: ...
#
# 22.08.03  romo direkten SQL-Connect durch TF_UID ersetzt
#                Korn-Shell eingetragen
# 2011.06.28 dafa Event publisher (LBASE NT) added. Entry, exit and possible
#                 errors will fire events. - Component "LBaseNT" and an 
#                 adequate OSGi runtime environment are assumed
#

[ -f ${TRFL}/binsrv/lble.functions ] && { . ${TRFL}/binsrv/lble.functions && _lble=1; } || _lble=0

if [ $# -lt 2 ]
then
	echo "Aufruf:"
	echo ""
	echo "$0 ..." 
	echo "...[-l] -b Bibliothek | -n codid" 
	echo "    -l                         --> mit Zeilennummer"
	echo "        -b                     --> Alle Module der Bibliothek kompilieren"
	echo "                        -n     --> diese CODID neu kompilieren"

	((_lble)) && le_fail 1 LICOMP
	exit 1
fi


# ===========================================
# Variable TF_UID sollte bereits gesetzt sein
# (vor allem bei Mandanten-Installation)
# wenn nicht, auf Standard-Wert setzen
# -------------------------------------------
if [ -z "$TF_UID" ]
then
	if [ -z "$TRFL" ]
	then
		export TRFL=/d1/group/sped
	fi
	. $TRFL/sh/setTFUID.sh
fi
# ===========================================

((_lble)) && le_begin LICOMP

LINENUMBER_4GL=""
i=$#
while [ $# -ge 0 -a ${i} -gt 0 ]
do
	case "$1" in
		"-l") LINENUMBER_4GL=" -l "
			shift
			;;
	esac
	let i=$i-1
done

if [ $1 = -b ]
then
  shift
  BIBLIOTHEK=$1
  MODUL_LISTE=tmp_grep_module.lst
  shift
  sqlplus ${TF_UID}@$ORACLE_SID @list_module $BIBLIOTHEK $MODUL_LISTE
  MODULE="-f ${MODUL_LISTE}"

else
	if [ $1 = "-n" ]
	then
		MODULE="-n $2"
	else
		echo "Fehlerhafter aufruf"
		((_lble)) && le_fail 1 LICOMP
		exit
	fi
fi

echo "Beginne mit Konvertieren ..."
bc_regen ${LINENUMBER_4GL} -4 -3 -c ${TF_UID}@$ORACLE_SID $MODULE
_lblerc=${?}
((_lble)) && le_end LICOMP
return ${_lblerc}
