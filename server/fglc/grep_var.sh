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
# 27.07.2007  frth grep_var von grep_module abgeleitet
# 2011.06.28 dafa Event publisher (LBASE NT) added. Entry, exit and possible
#                 errors will fire events. - Component "LBaseNT" and an 
#                 adequate OSGi runtime environment are assumed
#

[ -f ${TRFL}/binsrv/lble.functions ] && { . ${TRFL}/binsrv/lble.functions && _lble=1; } || _lble=0

usage () {
echo ""
echo "Aufruf:"
echo ""
echo "$0 ..." 
echo "... [-i] [-k] [-p] -n Variablenname [-m Component] Suchbegriff [all/codid]"
echo "... [-i] [-k] [-p] [-n Variablenname] -m Component Suchbegriff [all/codid]"
echo "... [-i] [-k] [-p] [-n Variablenname] [-m Component] Suchbegriff all/codid"
echo "     -i            --> nicht case-sensitiven grep benutzen"
echo "          -k       --> mit konvertieren wenn Suchbegriff gefunden wird"
echo "               -p  --> VANID mit ausgeben"
echo "                   -n Variablenname  --> und/oder Variablenname (like+upper) muss angegeben werden"
echo "                   -m Component  --> und/oder Component (equal+upper) muss angegeben werden"

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

COMPONENT=""
MODUL_CODID=""
MODUL_NAME=""
GREP_OPT=""
MOD_EXITCODE=1

i=$#
while [ $# -ge 1 -a ${i} -gt 0 ]
do
	case "$1" in
		"-i")	GREP_OPT="-i"
			shift
			;;
		"-k")	MOD_EXITCODE=0
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
		"-p")	export VANID_PRINT=1
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

((_lble)) && le_begin LIGREP "grep_var.modul_name=${MODUL_NAME}" "grep_var.component=${COMPONENT}" "grep_var.modul_codid=${MODUL_CODID}"

if [ ! -z "${MODUL_NAME}" -o ! -z "${COMPONENT} -o ! -z "${MODUL_CODID} ]
then
  MODUL_LISTE="/tmp/grep_var_codids.$MODUL_NAME.$COMPONENT.$MODUL_CODID.$$.lst"

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

	select
		lvar_codid
	from
		cobj_object component,
		cobj_object domain,
		lsou_sourcecode,
		lvar_variable
	where 1=1
          	and decode(UPPER('${COMPONENT}'),'','1',UPPER(component.obj_key)) = decode(UPPER('${COMPONENT}'),'','1',UPPER('${COMPONENT}'))
          	and component.obj_domain(+) = domain.obj_domain
          	and component.obj_type(+) = 'Component'
		and domain.obj_key(+) = lvar_vanid
		and domain.obj_type(+) = 'LVAN'
		and lsou_codid = lvar_codid
		and lvar_codid is not null
          	and decode(UPPER('${MODUL_NAME}'),'','1',UPPER(lvar_vanid)) like decode(UPPER('${MODUL_NAME}'),'','1',UPPER('%${MODUL_NAME}%'))
          	and decode('${MODUL_CODID}','','1',lvar_codid) = decode('${MODUL_CODID}','','1','${MODUL_CODID}')
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
export GREP_FILE=/tmp/grep_var_search_pattern$$.search.file
echo "${MOD_SUCHBEGRIFF}" > ${GREP_FILE}

echo "Suchbegriff: ${MOD_SUCHBEGRIFF} (${GREP_OPT})"

[ -f ${MOD_FILECODIDS} ] && rm ${MOD_FILECODIDS}

bc_regen -u "grep_var2.sh" -3 -c ${TF_UID}@${ORACLE_SID} ${MODULE} 

# cat $MOD_FILECODIDS

[ -f ${GREP_FILE} ] && rm ${GREP_FILE}
[ -f ${MOD_FILECODIDS} ] && rm ${MOD_FILECODIDS}
[ -f ${MODUL_LISTE} ] && rm ${MODUL_LISTE}
_lblerc=${?}

((_lble)) && le_end LIGREP
return ${_lblerc}
