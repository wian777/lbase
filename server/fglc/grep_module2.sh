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

((_lble)) && le_begin LIGREP "grep_module2.codid=${CODID}" "grep_module2.srcin=${SRCIN}" "grep_module2.srcout=${SRCOUT}"

# MOD_SUCHBEGRIFF="^MESSAGE"
if [ "x${MOD_FILECODIDS}" = "x" ]
then
   MOD_FILECODIDS="/tmp/mod_codids$$"
fi

if [ -z "${GL_CODE4}" -o "${GL_CODE4}" = "Y" ] ; then
	if [ -f "${GREP_FILE}" ] ; then
		ERGEBNIS=`grep ${GREP_OPT} -f ${GREP_FILE} ${SRCIN} `
	else
		ERGEBNIS=`grep ${GREP_OPT} \"${MOD_SUCHBEGRIFF}\" ${SRCIN} `
	fi
	RC=$?
fi

#--	also check 3GL Code
if [ "${GL_CODE3}" = "Y" ] ; then
#echo "pwd=$PWD(`pwd`), CODID=$CODID, TRFL=$TRFL"
	SQLPATH=/dev/null sqlplus -s ${TF_UID}@${ORACLE_SID} << !!EOF | ksh
	set echo off
	set show off
	set pause off
	set autoprint off
	set feedback off
	set verify off
	--set term off
	set heading off
	set pagesize 0
	set linesize 32000
	set trimspool on

	select 	decode( lsou_codid, null,
		'$TRFL/fglc/fglc.sh '||lkri_bibid||' '||lprg_kriid||' ${SRCIN} > /tmp/'||lver_codid||'.li 2>/dev/null',
		'cd /tmp; getsrc3 ''' || LSOU_CODID || ''' >/dev/null 2>/dev/null')
	from 
		LSOU_SOURCECODE,
		lkri_t_kriterium,
		lprg_t_programm, 
		lver_version 
	where 1=1
		and lsou_codid(+) = lver_codid
		and lkri_kriid = lprg_kriid
		and lprg_prgid = lver_prgid
		and lver_codid = '${CODID}'
	union
	select 	decode( lsou_codid, null,
		'$TRFL/fglc/fglc.sh '||lkri_bibid||'_STB '||lprg_kriid||' ${SRCIN} > /tmp/'||lstb_codid||'.li 2>/dev/null',
		'cd /tmp; getsrc3 ''' || LSOU_CODID || ''' >/dev/null 2>/dev/null')
	from 
		LSOU_SOURCECODE,
		lkri_t_kriterium,
		lprg_t_programm, 
		lstb_startbed 
	where 1=1
		and lsou_codid(+) = lstb_codid
		and lkri_kriid = lprg_kriid
		and lprg_prgid = lstb_prgid
		and lstb_codid = '${CODID}'
/
exit;
!!EOF
	if [ -f "/tmp/${CODID}.li" ] ; then
		if [ -f "${GREP_FILE}" ] ; then
			ERG3=`grep ${GREP_OPT} -f ${GREP_FILE} /tmp/${CODID}.li `
		else
			ERG3=`grep ${GREP_OPT} \"${MOD_SUCHBEGRIFF}\" /tmp/${CODID}.li `
		fi
		RC3=$?
		if [ ${RC3} -eq 0 ] ; then
			if [ "${KUERZEL_PRINT}" = "1" ] 
			then  

				SQLPATH=/dev/null 
				sqlplus -s ${TF_UID}@${ORACLE_SID} << !!EOF
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
	
				SELECT
				'3GL_Modul-VER ' || lver_codid || ': "' || replace(lprg_kuerzel,chr(12),'^L') || '|' || lprg_kriid || '" (' || cbus.get_component( 'LPRG', lprg_kuerzel || '|' || lprg_kriid ) || ')'
				FROM
				lprg_t_programm,
				lver_version
				WHERE 1=1
				AND lprg_prgid = lver_prgid
				AND lver_codid = '${CODID}'
				UNION
				SELECT
				'3GL_Modul-STB ' || lstb_codid || ': "' ||  replace(lprg_kuerzel,chr(12),'^L') || '|' || lprg_kriid || '" (' || cbus.get_component( 'LPRG', lprg_kuerzel || '|' || lprg_kriid ) || ')'
				FROM
				lprg_t_programm,
				lstb_startbed
				WHERE 1=1
				AND lprg_prgid = lstb_prgid
				AND lstb_codid = '${CODID}'
				;
	
				spool off
				exit;
!!EOF
			else
				echo "3GL_Modul ${CODID}:"
			fi

		    echo ${ERG3}
                    RC=0

#		else
#		    echo "-------------------------------------------------------- ${GREP_FILE}"
#		    cat ${GREP_FILE}
#		    echo "-------------------------------------------------------- Start ${CODID}.li"
#		    cat ${CODID}.li
#		    echo "-------------------------------------------------------- Ende  ${CODID}.li"

		fi
		rm -f /tmp/${CODID}.li
	else
		echo "..3GL_Modul ${CODID}: CODE FEHLT!"
	fi
fi

if [ "${RC}" = "0" ]
then
	if [ "${KUERZEL_PRINT}" = "1" ] 
	then  

		SQLPATH=/dev/null 
		sqlplus -s ${TF_UID}@${ORACLE_SID} << !!EOF
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

		SELECT
		'4GL_Modul-VER ' || lver_codid || ': "' ||  replace(lprg_kuerzel,chr(12),'^L') || '|' || lprg_kriid || '" (' || cbus.get_component( 'LPRG', lprg_kuerzel || '|' || lprg_kriid ) || ')'
		FROM
		lprg_t_programm,
		lver_version
		WHERE 1=1
		AND lprg_prgid = lver_prgid
		AND lver_codid = '${CODID}'
		UNION
		SELECT
		'4GL_Modul-STB ' || lstb_codid || ': "' ||  replace(lprg_kuerzel,chr(12),'^L') || '|' || lprg_kriid || '" (' || cbus.get_component( 'LPRG', lprg_kuerzel || '|' || lprg_kriid ) || ')'
		FROM
		lprg_t_programm,
		lstb_startbed
		WHERE 1=1
		AND lprg_prgid = lstb_prgid
		AND lstb_codid = '${CODID}'
		;
	
		spool off
		exit;
!!EOF
	else
		echo "4GL_Modul ${CODID}:" 
	fi

	echo "${ERGEBNIS}"
	echo "${CODID}" >> ${MOD_FILECODIDS}

	((_lble)) && le_end LIGREP

	 # exit 0 fuehrt zum erneuten konvertieren der Module
	 exit ${MOD_EXITCODE}
fi

((_lble)) && le_fail 1 LIGREP
exit 1
