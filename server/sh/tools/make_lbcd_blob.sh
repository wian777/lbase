#!/usr/bin/ksh
################################################################################################
#	file:		make_lbcd_blob.sh
#	date:		2009.11.04
#	author:	rune
#	purpose:	change lbcd_bytecode.lbcd_code from "LONG RAW" type to "BLOB"
#           before this change is done, a backup of table LBCD_BYTECODE is produced 
#           in directory=/d1/install/ora_exp with filename lbcd_bytecode_YYYYMMDD_HHMISS.exp
#           by ORACLE export utility which must be available
#           where YYYYMMDD_HHMISS is replaced with actual timestamp
################################################################################################
#	RUN THIS SCRIPT ONLY WHEN MIGRATING FROM LBASE-Version < 5.0 TO LBASE-Version 5.0 or HIGHER
#
#	REQUIRED if BYTECODE Version 1.0 or higher will be used
#	RESPECTIVE AppServer CHANGES are required	
################################################################################################
# 2011.06.28 dafa Event publisher (LBASE NT) added. Entry, exit and possible
#                 errors will fire events. - Component "LBaseNT" and an 
#                 adequate OSGi runtime environment are assumed
#set -x

###	load environment
export TF_MANID="SPED"
if [ -f /usr/local/LBASE/etc/${TF_MANID}_profile.tf ] ; then
	. /usr/local/LBASE/etc/${TF_MANID}_profile.tf
else
	echo ".. /usr/local/LBASE/etc/${TF_MANID}_profile.tf NOT FOUND!"
fi
[ -z "${TF_UID}" ]		&& echo "***ERROR: TF_UID not set!" && exit 9
[ -z "${ORACLE_SID}" ]	&& echo "***ERROR: ORACLE_SID not set!" && exit 9

[ -f ${TRFL}/binsrv/lble.functions ] && { . ${TRFL}/binsrv/lble.functions && _lble=1; } || _lble=0

_NOW=`date +"%Y.%m.%d-%H:%M:%S"`
LOGFILE="/tmp/FOUND${USER}_${_NOW}.log"
SQLFILE="/tmp/SQL${USER}_${_NOW}.sql"
SQL_LOG="/tmp/SQL${USER}_${_NOW}.log"

###	get actual settings from DB instance
echo "set echo off pagesize 0  linesize 1000 trimspool on  tab off pause off"  > ${SQLFILE}
echo "set echo off termout off heading off   feedback off" >> ${SQLFILE}
echo "spool ${SQL_LOG}" >> ${SQLFILE}

echo "SELECT parameter||'=\"'||value||'\"' " >> ${SQLFILE}
echo "  FROM v\$nls_parameters " >> ${SQLFILE}
echo " WHERE parameter='NLS_CHARACTERSET' " >> ${SQLFILE}
echo "UNION " >> ${SQLFILE}
echo "SELECT 'LBCD_CODE_TYPE=\"'||replace(data_type,' ','_')||'\"'  " >> ${SQLFILE}
echo "  FROM all_tab_columns  " >> ${SQLFILE}
echo " WHERE owner='SPED' AND table_name='LBCD_BYTECODE' AND column_name='LBCD_CODE';" >> ${SQLFILE}
echo "spool off " >> ${SQLFILE}
echo "quit " >> ${SQLFILE}

((_lble)) && le_begin DB "sql.connect=${TF_UID}@${ORACLE_SID}" "sql.file=file://${HOSTNAME}${PWD}/${SQLFILE}"

sqlplus -S ${TF_UID}@${ORACLE_SID} @${SQLFILE}

chmod +x ${SQL_LOG}
. ${SQL_LOG}

echo " " 
echo "-----------------------------------------------------------"
echo " " 
echo "environment: "
echo "------------ "
echo " " 
echo "..      ORACLE_SID = ${ORACLE_SID}"
echo "..            LANG = ${LANG}"
echo " " 
echo "..        NLS_LANG = ${NLS_LANG}"
echo "..NLS_CHARACTERSET = ${NLS_CHARACTERSET}"
echo "..  LBCD_CODE_TYPE = ${LBCD_CODE_TYPE}"
echo " " 
echo "-----------------------------------------------------------"
echo " " 

rm ${SQLFILE} ${SQL_LOG}

### --------------------------------------- change LBCD_CODE to BLOB if necessary
if [ ${LBCD_CODE_TYPE} = "LONG_RAW" ] ; then

	echo "> try exporting LBCD_BYTECODE table"
	if [ ! -x ${ORACLE_HOME}/bin/exp ] ; then
		_msg="***ERROR: cannot execute ${ORACLE_HOME}/bin/exp"
		echo ${_msg}
		((_lble)) && le_fail 1 DB "msg=${_msg}"
		exit 1
	fi
	_NOW=`date +"%Y%m%d_%H%M%S"`
	DEST_DIR="/d1/install/ora_exp"
	DEST_FIL="lbcd_bytecode_${_NOW}.exp"
	[ ! -d "${DEST_DIR}" ] && mkdir -p "${DEST_DIR}"
	if [ ! -d "${DEST_DIR}" ] ; then
		_msg="***ERROR: cannot create ${DEST_DIR}"
		echo ${_msg}
		((_lble)) && le_fail 9 DB "msg=${_msg}"
		exit 9
	fi
	${ORACLE_HOME}/bin/exp ${TF_UID}@${ORACLE_SID} BUFFER=20000 FULL=N TABLES=LBCD_BYTECODE FILE=${DEST_DIR}/${DEST_FIL}
	RC=$?
	echo "> export returned RC = ${RC}"
	echo ">        export file = ${DEST_DIR}/${DEST_FIL}" 
	echo " "
	ls -l ${DEST_DIR}/${DEST_FIL}
	echo " "
	if [ "${RC}" -ne 0 ] ; then
		_msg="***ERROR: exporting table LBCD_BYTECODE"
		echo ${_msg}
		((_lble)) && le_fail 9 DB "rc=${RC}" "msg=${_msg}"
		exit 9
	fi	

	#- to restore exported table use:
	#- sqlplus: -> drop table LBCD_BYTECODE;
	#- ${ORACLE_HOME}/bin/imp ${TF_UID}@${ORACLE_SID} FILE=${DEST_DIR}/${DEST_FIL} TABLES=LBCD_BYTECODE
	#- and recompile invalid object:
	#- ALTER VIEW SPED.LMOD_MODUL COMPILE;

	echo "set echo off pagesize 0  linesize 1000 trimspool on  tab off pause off"  > ${SQLFILE}
	echo "set echo off termout off heading off   feedback off" >> ${SQLFILE}
	echo "spool ${SQL_LOG}" >> ${SQLFILE}

	echo "select 'ALTER TABLE lbcd_bytecode nologging;' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE lbcd_bytecode nologging;" >> ${SQLFILE}

	echo "select 'ALTER TABLE lbcd_bytecode ' from dual;" >> ${SQLFILE}
	echo "select '      modify (lbcd_code blob) lob (lbcd_code)  store as (nocache nologging);' from dual;" >> ${SQLFILE} 
	echo "ALTER TABLE lbcd_bytecode " >> ${SQLFILE}
   echo "      modify (lbcd_code blob) lob (lbcd_code)  store as (nocache nologging);" >> ${SQLFILE}

	echo "select 'ALTER TABLE lbcd_bytecode MODIFY LOB (lbcd_code) (CACHE);' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE lbcd_bytecode MODIFY LOB (lbcd_code) (CACHE);" >> ${SQLFILE}

	echo "select 'ALTER TABLE lbcd_bytecode LOGGING; ' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE lbcd_bytecode LOGGING; " >> ${SQLFILE}

	echo "select 'ALTER INDEX LBCD_BYTECODE_IP rebuild;' from dual;" >> ${SQLFILE}
	echo "ALTER INDEX LBCD_BYTECODE_IP rebuild;" >> ${SQLFILE}
	echo "spool off " >> ${SQLFILE}
	echo "quit " >> ${SQLFILE}

	((_lble)) && le_begin DB "sql.file=file://${HOSTNAME}${PWD}/${SQLFILE}"

	sqlplus -S ${TF_UID}@${ORACLE_SID} @${SQLFILE}
	RC=$?
	echo " "
	echo "-----------------------------------------------------------"
	echo "check results of executed script ${SQLFILE}:"
	echo "	Returncode=${RC} "
	echo "	Logfile   =${SQL_LOG}"
	echo "-----------------------------------------------------------"
	cat ${SQL_LOG}
	echo "-----------------------------------------------------------"

	if [ ${RC} -ne 0 ] ; then
		((_lble)) && le_fail ${RC} DB "sql.log=file://${HOSTNAME}${SQL_LOG}"
	else
		((_lble)) && le_end DB
	fi
	return ${RC}
else
	echo " " 
	echo "--> NOTHING TO DO !!! " 
	echo " "
	((_lble)) && le_end DB
	return 0
fi
