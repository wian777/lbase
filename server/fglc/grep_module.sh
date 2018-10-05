#!/usr/bin/ksh
#
#Beschreibung: ...
#
# 22.08.2003  romo direkten SQL-Connect durch TF_UID ersetzt
#                  Korn-Shell eingetragen
# 21.09.2006  rune Optionen erweitert [-3|-4] [-f|-t] [-i] [-n Modulname]
#                  alle "-?"_Optionen koennen in beliebiger Reihenfolge vor dem Suchbegriff stehen
#                  inlining von frueherem list_module.sql
#                  Achtung auf abhaengiges grep_module2.sh
# 27.07.2007  frth Option -m Component erweitert 
# 20.12.2010  rune -m korrigiert, Componente kann als "Component.[name]" oder nur [name] benutzt werden
# 07.06.2011  frth -t geaenderte Funktion, ist jetzt "test compile - do not modify bytecode nor LILA"
# 2011.06.28  dafa Event publisher (LBASE NT) added. Entry, exit and possible
#                  errors will fire events. - Component "LBaseNT" and an 
#                  adequate OSGi runtime environment are assumed

[ -f ${TRFL}/binsrv/lble.functions ] && { . ${TRFL}/binsrv/lble.functions && _lble=1; } || _lble=0

usage () {
echo ""
echo "Aufruf:"
echo ""
echo "$0 ..." 
echo "...[-3|-4] [-f] [-t] [-i] [-k[-l]] [-p] [-b Bibliothek] [-n Modulname] [-m Component] Suchbegriff [all/codid]"
echo "    -3            --> 3GL Codes untersuchen"
echo "    -4            --> 4GL Codes untersuchen (default)"
echo "    -f            --> nur nicht gesperrte Module suchen"
echo "    -t            --> test-compilieren - keine Aenderung an LBCD/LSOU"
echo "    -i            --> nicht case-sensitiven grep benutzen"
echo "    -k            --> mit konvertieren wenn Suchbegriff gefunden wird"
echo "    -k -l         --> mit konvertieren mit Zeilennummer wenn Suchbegriff gefunden wird"
echo "    -p            --> Modulkuerzel, Kriterium und Komponente mit ausgeben"
echo "    -b Bibliothek --> Bibliothek (equal)"
echo "    -n Modulname  --> und/oder Modulname (like) muss angegeben werden"
echo "    -m Component  --> und/oder Component (equal) muss angegeben werden"

((_lble)) && le_fail 1 LIGREP
exit 1
}

[ $# -lt 2 ] && usage

# ===========================================
# Variable TF_UID sollte bereits gesetzt sein
# (vor allem bei Mandanten-Installation)
# wenn nicht, auf Standard-Wert setzen
# -------------------------------------------
if [ -z "${TF_UID}" ] ; then
	if [ -z "${TRFL}" ] ; then
		export TRFL=/d1/group/sped
	fi
	. ${TRFL}/sh/setTFUID.sh
fi
# ===========================================
GREP_MODULE2="./grep_module2.sh"
[ ! -x ${GREP_MODULE2} ] && GREP_MODULE2="$TRFL/fglc/grep_module2.sh"

BIBLIOTHEK=""
COMPONENT=""
MODUL_CODID=""
MODUL_NAME=""
SPERR_FLAG=""
TEST_FLAG=""
GL_CODE3="N"
GL_CODE4="N"
GREP_OPT=""
MOD_EXITCODE=1
LINENUMBER_4GL=""

i=$#
while [ $# -ge 1 -a ${i} -gt 0 ]
do
	case "$1" in
		"-f")	SPERR_FLAG="F"
			shift
			;;
		"-t")	TEST_FLAG="T"
			shift
			;;
		"-i")	GREP_OPT="-i"
			shift
			;;
		"-k")	MOD_EXITCODE=0
			shift
			case "$1" in
				"-l") LINENUMBER_4GL=" -l "
					shift
					;;
			esac
			;;
		"-3")	GL_CODE3="Y"
			shift
			;;
		"-4")	GL_CODE4="Y"
			shift
			;;
		"-b")	shift
			let i=$i-1
			BIBLIOTHEK="${1}"
			shift
			;;
		"-n")	shift
			let i=$i-1
			MODUL_NAME="${1}"
			shift
			;;
		"-m")	shift
			let i=$i-1
			COMPONENT="${1}"
			shift
			;;
		"-p")	export KUERZEL_PRINT=1 
			shift
			;;
	esac
	let i=$i-1
done

#- es muss mindestens noch ein Suchbegriff vorkommen
[ $# -lt 1 ] && usage

[ "${GL_CODE3}" = "N" -a "${GL_CODE4}" = "N" ] && GL_CODE4="Y"
export GL_CODE3 GL_CODE4
export GREP_OPT

if [ "${2}" = "all" ] ; then
	MODUL_NAME="%"
else
	MODUL_CODID="$2"
fi

MOD_SUCHBEGRIFF="${1}"

((_lble)) && le_begin LIGREP "grep_module.bibliothek=${BIBLIOTHEK}" "grep_module.modul_name=${MODUL_NAME}" "grep_module.component=${COMPONENT}" "grep_module.modul_codid=${MODUL_CODID}"

if [ ! -z "${BIBLIOTHEK}" -o ! -z "${MODUL_NAME}" -o ! -z "${COMPONENT}" -o ! -z "${MODUL_CODID}" ]
then
  MODUL_LISTE="/tmp/grep_module_codids.$BIBLIOTHEK.$MODUL_NAME.$COMPONENT.$MODUL_CODID.$$.lst"

  SQLPATH=/dev/null sqlplus -s ${TF_UID}@${ORACLE_SID} << !!EOF
	set doc off
	set echo off
	set show off
	set autoprint off
	set pause off
	set verify off
	set feedback off
	set pagesize 0
	set heading off
	set trimspool on
	spool ${MODUL_LISTE}



	select lstb_codid
          from lkri_t_kriterium, cobj_object, lprg_t_programm, lstb_startbed
          where 1=1
          and decode('${BIBLIOTHEK}','','1',lkri_bibid) = decode('${BIBLIOTHEK}','','1','${BIBLIOTHEK}')
          and lkri_kriid = lprg_kriid
          and decode('${COMPONENT}','','1',
						substr(obj_domain,instr(obj_domain,'.')+1))
				= decode('${COMPONENT}','','1',
						decode(instr('${COMPONENT}','.'),0,'${COMPONENT}',substr('${COMPONENT}',instr('${COMPONENT}','.')+1)))
          and obj_type(+) = 'LPRG'
          and obj_key (+) = lprg_kuerzel||'|'||lprg_kriid
          and decode('${MODUL_NAME}','','1',lprg_kuerzel) like decode('${MODUL_NAME}','','1','%${MODUL_NAME}%')
          and decode('${MODUL_CODID}','','1',lstb_codid) = decode('${MODUL_CODID}','','1','${MODUL_CODID}')
          and lprg_prgid = lstb_prgid
          and lstb_codid is not null
	union
	select lver_codid
          from lkri_t_kriterium, cobj_object, lprg_t_programm, lver_version
          where 1=1
          and decode('${BIBLIOTHEK}','','1',lkri_bibid) = decode('${BIBLIOTHEK}','','1','${BIBLIOTHEK}')
          and lkri_kriid = lprg_kriid
          and decode('${COMPONENT}','','1',
						substr(obj_domain,instr(obj_domain,'.')+1))
				= decode('${COMPONENT}','','1',
						decode(instr('${COMPONENT}','.'),0,'${COMPONENT}',substr('${COMPONENT}',instr('${COMPONENT}','.')+1)))
          and obj_type(+) = 'LPRG'
          and obj_key (+) = lprg_kuerzel||'|'||lprg_kriid
          and decode('${MODUL_NAME}','','1',lprg_kuerzel) like decode('${MODUL_NAME}','','1','%${MODUL_NAME}%')
          and lprg_prgid = lver_prgid
          and decode('${SPERR_FLAG}','','1',lver_test_flag) = decode('${SPERR_FLAG}','','1','${SPERR_FLAG}')
          and decode('${MODUL_CODID}','','1',lver_codid) = decode('${MODUL_CODID}','','1','${MODUL_CODID}')
          and lver_codid is not null
        order by 1 ;

	spool off
	exit;
!!EOF

  MODULE="-f ${MODUL_LISTE}"

else
	usage
fi

MOD_FILECODIDS=/tmp/mod_codids$$.txt

export MOD_SUCHBEGRIFF
export MOD_EXITCODE
export MOD_FILECODIDS
export GREP_FILE=/tmp/grep_module_search_pattern$$.search.file
echo "${MOD_SUCHBEGRIFF}" > ${GREP_FILE}

echo "Suchbegriff: ${MOD_SUCHBEGRIFF} (${GREP_OPT})"

[ -f ${MOD_FILECODIDS} ] && rm ${MOD_FILECODIDS}

if [ "$TEST_FLAG" = "T" ] ; then
	COMPILE_TYPE="-t"
else
	COMPILE_TYPE="-3"
fi
bc_regen ${LINENUMBER_4GL} -u "${GREP_MODULE2}" -4 ${COMPILE_TYPE} -c ${TF_UID}@${ORACLE_SID} ${MODULE} 

# cat $MOD_FILECODIDS

[ -f ${GREP_FILE}      ] && rm ${GREP_FILE}
[ -f ${MOD_FILECODIDS} ] && rm ${MOD_FILECODIDS}
[ -f ${MODUL_LISTE} ] && rm ${MODUL_LISTE}
_lblerc=${?}
((_lble)) && le_end LIGREP
return ${_lblerc}
