#!/bin/sh

# Aufruf der Makro-Interpreter cpp und m4
# zur Umwandlung der 4GL-Makros in LI-3GL-Code

# Das vorgeschaltete sed-Skript macht aus den m4-Begrenzungszeichen ` ',
# welche in makrodef.mc zu besseren Lesbarkeit benutzt werden,
# die Folgen ""{"" und ""}"", welche in einem C-Hochkomma-String nicht
# vorkommen duerfen.
# Motiv: ` und ' koennen in C-Strings vorkommen und wuerden m4 stoeren.

# 2006-03-23	johi 	cpp-define -DBIB=${BIB} entfernt. [12199]
#                       Durchsuchen der Module in TFE hat keine Referenz
#			auf dieses define ergeben.

# 2010.03.26	rune	Erweiterung neuer 4. Parameter "L" oder "l" fuer Compile with Numbers
# 2010.04.07	frth	AWKDIR, Suchreihenfolge und Ausgabe 
# 2010.05.17    rune    shell changed to /usr/bin/ksh
# 2010.05.17	rune	nur noch ein fglc.awk Script mit Optionen aufgerufen -l LINE_NUMBERS -x TRACE_ON
# 2010.05.17	rune	mit Option -x m4 Option "d" statt "ap" setzen (siehe M4_DEBUG)
# 2010.06.14    johi    shell changed back to /bin/sh because of random ksh failure on tfdbnmir03
# 2011.06.28    dafa    Event publisher (LBASE NT) added. Entry, exit and possible
#                       errors will fire events. - Component "LBaseNT" and an 
#                       adequate OSGi runtime environment are assumed
# 2014-04-08    johi    use temp file FGLC_CPP_FILE instead of pipe to avoid EOVERFLOW system error
#                       cpp0: : Value too large for defined data type

[ -f ${TRFL}/binsrv/lble.functions ] && { . ${TRFL}/binsrv/lble.functions && _lble=1; } || _lble=0

# Die Makrodefinitions-Datei befindet sich im selben Verzeichnis
# wie das Skript selbst:
MAKRODIR=`dirname $0`

# -l  ... generate line numbers
CMP_LINE_NO="N"	   # default is no line numbers
# -x  ... trace shell commands, keep temp files
FGLC_XTRACE="N"
M4_DEBUG="=ap"

# process flags with getopt
args=`getopt lx $*`
set -- $args
for i
do
  case "$i"
  in
    -l) 
       CMP_LINE_NO="L"
       shift;;
    -x) 
       FGLC_XTRACE="X"
		 M4_DEBUG=""
       shift;;
    --)
       shift; 
       break;;
  esac
done

[ $FGLC_XTRACE = "X" ] && set -x 

# 1. Parameter: Definition Bibliothek
BIB=$1

# 2. Parameter: Kriteriums-ID
KRIID=$2

# 3. Parameter: Input Source (voller Pfadname erforderlich)
SOURCE=$3

FGLC_AWK="fglc.awk"
AWKDIR=`dirname $0`

((_lble)) && le_begin LICOMP "fglc.bib=${BIB}" "fglc.kriid=${KRIID}" "fglc.source=${SOURCE}"

# erforderliche Programme: 
# cat cpp dirname echo gm4 rmcr sed sh tr

BIN_DIR=bin${PROCESSOR_ARCHITECTURE:-srv}
test -d ${TRFL}/$BIN_DIR || BIN_DIR=binaix

# unter neueren Suse-Distribution GNU-cpp 2.95 verwenden.
CPP_CMD=/opt/gcc295/bin/cpp
if [ '!' -f ${CPP_CMD} ]
then
# do we have $TRFL/binsrv/cpp ?
   CPP_CMD=${TRFL}/${BIN_DIR}/cpp
# else /usr/bin/cpp
   test -f $CPP_CMD || CPP_CMD=/usr/bin/cpp
fi
CPP_CMD=${CPP_CMD}\ -traditional

M4_CMD=${TRFL}/${BIN_DIR}/gm4
test -f $M4_CMD || M4_CMD=/usr/bin/m4

if [ `uname` = Linux ]
then
   ECHO_CMD=/bin/echo\ -e
else
   ECHO_CMD=/bin/echo
fi

if [ `uname` != "HP-UX" ]
then
   CPP_CMD=${CPP_CMD}\ -H
fi

# SED_PATH=
# SHELL=C:/bin/SH hardkodiert
# TR_PATH

# 1. sed: Ersetzung der Quotes in Makro-Definition makrodef.mc
#
#
# 2. cpp-Parameter:	-P 	keine #line-Information
#			-C	C-Kommentare in den Output uebernehmen
#
# 3. m4-Parameter: Input block size -B 50000

cd $MAKRODIR

INCLUDEDIR="-I$MAKRODIR"

if [ -d $TRFL/li_inc ]
then
   INCLUDEDIR="-I$TRFL/li_inc "$INCLUDEDIR
fi
if [ -d $TRFL/kunden/li_inc ]
then
   INCLUDEDIR="-I$TRFL/kunden/li_inc "$INCLUDEDIR
fi
if [ -d $HOME/fglc ]
then
   INCLUDEDIR="-I$HOME/fglc "$INCLUDEDIR
	if [ -f $HOME/fglc/makrodef.mc ]
	then
		MAKRODIR=$HOME/fglc
	fi
	if [ -f $HOME/fglc/${FGLC_AWK} ]
	then
		AWKDIR=$HOME/fglc
	fi
fi
# wekl / 20.09.2005 / Issue 7921 --> wenn kein lager.mc und kein kunden.mc, dann eines anlegen
TMP=`dirname $0`
if ! [ -f $TMP/lager.mc ]
then
   touch $TMP/lager.mc
fi

if ! [ -f $TMP/kunden.mc ]
then
   touch $TMP/kunden.mc
fi

OPT_INCLUDE=""
for i in $(find $TRFL/fglc/ -name "*opt.mc")
do 
    F_NAME=`basename "${i}"`
    F_ID=`echo $F_NAME | tr -d '. '`
    OPT_INCLUDE="${OPT_INCLUDE} -D${F_ID}=\"${F_NAME}\" "
done

LANG=C
# stderr zuerst in Datei schreiben. 
FGLC_STDERR=/tmp/fglc_err_$$.txt

# check and log two important files
ls -1 $AWKDIR/${FGLC_AWK} > $FGLC_STDERR 2>&1
ls -1 $MAKRODIR/makrodef.mc >> $FGLC_STDERR 2>&1


FGLC_CPP_FILE=/tmp/fglc_cpp_$$.txt

($TRFL/binsrv/uconv -f iso-8859-1 -t ascii \
	-x '\u0060 > \"\"\{\"\";\u00b4 > \"\"\}\"\";\u000d > ' \
$MAKRODIR/makrodef.mc; awk -f $AWKDIR/${FGLC_AWK} -v trace="${FGLC_XTRACE}" -v lines="${CMP_LINE_NO}" $SOURCE; $ECHO_CMD '\nEND_MAKRO\n}\n') > ${FGLC_CPP_FILE}
( $CPP_CMD $INCLUDEDIR -DPRGNAME=${BIB}_MAIN -DINIT_MAKRO=${BIB}_INIT -DEND_MAKRO=${BIB}_END -D_KRIID=\"${KRIID}\" ${OPT_INCLUDE} -P -C ${FGLC_CPP_FILE} \
| $M4_CMD --debug${M4_DEBUG} --trace=include -B50000 $INCLUDEDIR | tr '\f' '\n' ) 2>>$FGLC_STDERR

# Fehlermeldungen auch auf stderr ausgeben.
cat $FGLC_STDERR >&2

# stderr auf Fehlermeldungen pruefen..
if fgrep -q "No such file or directory"  $FGLC_STDERR  
then 
	EXITCODE=1
	((_lble)) && le_fail ${EXITCODE} LICOMP
else 
	EXITCODE=0
	((_lble)) && le_end LICOMP
fi

[ $FGLC_XTRACE != "X" ] && rm -f ${FGLC_CPP_FILE} $FGLC_STDERR
exit $EXITCODE
