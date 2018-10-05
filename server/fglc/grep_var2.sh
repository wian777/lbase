#!/bin/ksh
#stderr-Protokoll
# exec 2>> /tmp/grep_mod_$$.log

# Diese Script sucht in allen Modulen nach einem bestimmten Suchbegriff (Format,
# Variable
# Der Suchbegriff kann ueber die Environmenvariable 
# export MOD_SUCHBEGRIFF=... gesetzt werden

# 21.09.2006  rune erweiterte Optionen [-3|-4] [-f|-t] [-i] [-n Modulname] von Superscript
#                  grep_module.sh verarbeiten
# 2011.06.28 dafa Event publisher (LBASE NT) added. Entry, exit and possible
#                 errors will fire events. - Component "LBaseNT" and an 
#                 adequate OSGi runtime environment are assumed
#
#echo "Params    : $* "
#echo "Searchfile: ${GREP_FILE}/$GREP_OPT/$BS_CODE"
#export GREP_OPT (e.g. "-i") in calling script 
#export GL_CODE3 (e.g. "Y") for additional search in 3GL Code
#export GL_CODE4 (e.g. "Y") for additional search in 4GL Code

[ -f ${TRFL}/binsrv/lble.functions ] && { . ${TRFL}/binsrv/lble.functions && _lble=1; } || _lble=0

CODID=$1    # Code-ID
SRCIN=$2    # Filename Input-Source
SRCOUT=$3   # Filename modifizierte-Source

((_lble)) && le_begin LIGREP "grep_var2.codid=${CODID}" "grep_var2.srcin=${SRCIN}" "grep_var2.srcout=${SRCOUT}"

# MOD_SUCHBEGRIFF="^MESSAGE"
if [ "x${MOD_FILECODIS}" = "x" ]
then
   MOD_FILECODIS="/tmp/mod_codids$$"
fi

if [ -z "${GL_CODE3}" -o "${GL_CODE3}" = "Y" ] ; then
	if [ -f "${GREP_FILE}" ] ; then
		ERGEBNIS=`grep ${GREP_OPT} -f ${GREP_FILE} ${SRCIN} `
	else
		ERGEBNIS=`grep ${GREP_OPT} \"${MOD_SUCHBEGRIFF}\" ${SRCIN} `
	fi
	RC=$?
fi

if [ "${RC}" = "0" ]
then
    echo "3GL_Variable ${CODID}:" 

    if [ "${VANID_PRINT}" = "1" ] 
    then  

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
        spool /dev/null

        select
                lvar_vanid||' '|| lvar_typname||' '|| component.obj_key
        from
                cobj_object component,
                cobj_object domain,
                lvar_variable
        where 1=1
                and component.obj_domain(+) = domain.obj_domain
                and component.obj_type(+) = 'Component'
                and domain.obj_key(+) = lvar_vanid
                and domain.obj_type(+) = 'LVAN'
                and lvar_codid = '${CODID}';

        spool off
        exit;
!!EOF

    fi

    echo ${ERGEBNIS}
    echo ${CODID} >> ${MOD_FILECODIDS}

    ((_lble)) && le_end LIGREP
	 # exit 0 fuehrt zum erneuten konvertieren der Module
    exit ${MOD_EXITCODE}
fi

((_lble)) && le_fail 1 LIGREP
exit 1
