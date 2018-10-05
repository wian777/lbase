#!/usr/bin/ksh
################################################################################################
#	file:		make_lobs_all.sh
#	date:		2013.08.20
#	author:	rune
#	purpose:	change all LONG types to LOB-Objects
#           inherited from 5.2 preinstall (LI-Enhancments)
#				LONG_RAW --> BLOB:
#				LBCD_BYTECODE.LBCD_CODE
#				LONG     --> CLOB:
#				LPEC_PECODE.LPEC_SOURCECODE
#				LSOU_SOURCECODE.LSOU_SOURCECODE
#           new in LBASE 6.0:
#           SERR_ERRORLOG.ERR_LONGTEXT
#				HSDT_SDGTEXT.SDT_LTEXT
#				SSDT_SDGTEXT.SDT_LTEXT
#				SXAB_LAABRECH.XAB_RESSET
#           before this change is done, a backup of these tables is produced 
#           in directory=/d1/install/ora_exp with filename before_lob_YYYYMMDD_HHMISS.exp
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
###   only if not set
if [ -z "${TF_UID}" -o -z "${ORACLE_SID}" ] ; then
	if [ -f /usr/local/LBASE/etc/${TF_MANID}_profile.tf ] ; then
		. /usr/local/LBASE/etc/${TF_MANID}_profile.tf
	else
		echo ".. /usr/local/LBASE/etc/${TF_MANID}_profile.tf NOT FOUND!"
	fi
fi
[ -z "${TF_UID}" ]		&& echo "***ERROR: TF_UID not set!" && exit 9
[ -z "${ORACLE_SID}" ]	&& echo "***ERROR: ORACLE_SID not set!" && exit 9

echo ".. using ORACLE_SID=${ORACLE_SID}, TF_UID=${TF_UID}"

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
echo " WHERE owner='SPED' AND table_name='LBCD_BYTECODE' AND column_name='LBCD_CODE'" >> ${SQLFILE}
echo "UNION " >> ${SQLFILE}
echo "SELECT 'LPEC_SOURCECODE_TYPE=\"'||replace(data_type,' ','_')||'\"'  " >> ${SQLFILE}
echo "  FROM all_tab_columns  " >> ${SQLFILE}
echo " WHERE owner='SPED' AND table_name='LPEC_PECODE' AND column_name='LPEC_SOURCECODE'" >> ${SQLFILE}
echo "UNION " >> ${SQLFILE}
echo "SELECT 'LSOU_SOURCECODE_TYPE=\"'||replace(data_type,' ','_')||'\"'  " >> ${SQLFILE}
echo "  FROM all_tab_columns  " >> ${SQLFILE}
echo " WHERE owner='SPED' AND table_name='LSOU_SOURCECODE' AND column_name='LSOU_SOURCECODE'" >> ${SQLFILE}
echo "UNION " >> ${SQLFILE}
echo "SELECT 'ERR_LONGTEXT_TYPE=\"'||replace(data_type,' ','_')||'\"'  " >> ${SQLFILE}
echo "  FROM all_tab_columns  " >> ${SQLFILE}
echo " WHERE owner='SPED' AND table_name='SERR_ERRORLOG' AND column_name='ERR_LONGTEXT'" >> ${SQLFILE}
echo "UNION " >> ${SQLFILE}
echo "SELECT 'HSDT_LTEXT_TYPE=\"'||replace(data_type,' ','_')||'\"'  " >> ${SQLFILE}
echo "  FROM all_tab_columns  " >> ${SQLFILE}
echo " WHERE owner='SPED' AND table_name='HSDT_SDGTEXT' AND column_name='SDT_LTEXT'" >> ${SQLFILE}
echo "UNION " >> ${SQLFILE}
echo "SELECT 'SSDT_LTEXT_TYPE=\"'||replace(data_type,' ','_')||'\"'  " >> ${SQLFILE}
echo "  FROM all_tab_columns  " >> ${SQLFILE}
echo " WHERE owner='SPED' AND table_name='SSDT_SDGTEXT' AND column_name='SDT_LTEXT'" >> ${SQLFILE}
echo "UNION " >> ${SQLFILE}
echo "SELECT 'XAB_RESSET_TYPE=\"'||replace(data_type,' ','_')||'\"'  " >> ${SQLFILE}
echo "  FROM all_tab_columns  " >> ${SQLFILE}
echo " WHERE owner='SPED' AND table_name='SXAB_LAABRECH' AND column_name='XAB_RESSET';" >> ${SQLFILE}
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
echo "..          ORACLE_SID = ${ORACLE_SID}"
echo "..                LANG = ${LANG}"
echo " " 
echo "..            NLS_LANG = ${NLS_LANG}"
echo "..    NLS_CHARACTERSET = ${NLS_CHARACTERSET}"
echo "..      LBCD_CODE_TYPE = ${LBCD_CODE_TYPE}"
echo "..LPEC_SOURCECODE_TYPE = ${LPEC_SOURCECODE_TYPE}"
echo "..LSOU_SOURCECODE_TYPE = ${LSOU_SOURCECODE_TYPE}"
echo "..   ERR_LONGTEXT_TYPE = ${ERR_LONGTEXT_TYPE}"
echo "..     HSDT_LTEXT_TYPE = ${HSDT_LTEXT_TYPE}"
echo "..     SSDT_LTEXT_TYPE = ${SSDT_LTEXT_TYPE}"
echo "..     XAB_RESSET_TYPE = ${XAB_RESSET_TYPE}"
echo " " 
echo "-----------------------------------------------------------"
echo " " 

rm ${SQLFILE} ${SQL_LOG}

### --------------------------------------- change LONG%types to LOB%types if necessary
SAVE_TABLES=""
SAVE_DELIM=""
if [ ${LBCD_CODE_TYPE} = "LONG_RAW" ] ; then
	SAVE_TABLES=`echo "${SAVE_TABLES}${SAVE_DELIM}LBCD_BYTECODE"`
	SAVE_DELIM=","
fi
if [ ${LPEC_SOURCECODE_TYPE} = "LONG" ] ; then
	SAVE_TABLES=`echo "${SAVE_TABLES}${SAVE_DELIM}LPEC_PECODE"`
	SAVE_DELIM=","
fi
if [ ${LSOU_SOURCECODE_TYPE} = "LONG" ] ; then
	SAVE_TABLES=`echo "${SAVE_TABLES}${SAVE_DELIM}LSOU_SOURCECODE"`
	SAVE_DELIM=","
fi
if [ ${ERR_LONGTEXT_TYPE} = "LONG" ] ; then
	SAVE_TABLES=`echo "${SAVE_TABLES}${SAVE_DELIM}SERR_ERRORLOG"`
	SAVE_DELIM=","
fi
if [ ${HSDT_LTEXT_TYPE} = "LONG" ] ; then
	SAVE_TABLES=`echo "${SAVE_TABLES}${SAVE_DELIM}HSDT_SDGTEXT"`
	SAVE_DELIM=","
fi
if [ ${SSDT_LTEXT_TYPE} = "LONG" ] ; then
	SAVE_TABLES=`echo "${SAVE_TABLES}${SAVE_DELIM}SSDT_SDGTEXT"`
	SAVE_DELIM=","
fi
if [ ${XAB_RESSET_TYPE} = "LONG" ] ; then
	SAVE_TABLES=`echo "${SAVE_TABLES}${SAVE_DELIM}SXAB_LAABRECH"`
	SAVE_DELIM=","
fi

if [ -n "${SAVE_TABLES}" ] ; then

	echo "> exporting tables: [${SAVE_TABLES}]"
	if [ ! -x ${ORACLE_HOME}/bin/exp ] ; then
		_msg="***ERROR: cannot execute ${ORACLE_HOME}/bin/exp"
		echo ${_msg}
		((_lble)) && le_fail 1 DB "msg=${_msg}"
		exit 1
	fi
	_NOW=`date +"%Y%m%d_%H%M%S"`
	DEST_DIR="/d1/install/ora_exp"
	DEST_FIL="before_lob_${_NOW}.exp"
	[ ! -d "${DEST_DIR}" ] && mkdir -p "${DEST_DIR}"
	if [ ! -d "${DEST_DIR}" ] ; then
		_msg="***ERROR: cannot create ${DEST_DIR}"
		echo ${_msg}
		((_lble)) && le_fail 9 DB "msg=${_msg}"
		exit 9
	fi
	${ORACLE_HOME}/bin/exp ${TF_UID}@${ORACLE_SID} BUFFER=20000 FULL=N TABLES=${SAVE_TABLES} FILE=${DEST_DIR}/${DEST_FIL}
	RC=$?
	echo "> export returned RC = ${RC}"
	echo ">        export file = ${DEST_DIR}/${DEST_FIL}" 
	echo " "
	ls -l ${DEST_DIR}/${DEST_FIL}
	echo " "
	if [ "${RC}" -ne 0 ] ; then
		_msg="***ERROR: exporting tables ${SAVE_TABLES}"
		echo ${_msg}
		((_lble)) && le_fail 9 DB "rc=${RC}" "msg=${_msg}"
		exit 9
	fi	

	#- to restore exported table use:
	#- sqlplus: -> drop table [tablename];
	#- ${ORACLE_HOME}/bin/imp ${TF_UID}@${ORACLE_SID} FILE=${DEST_DIR}/${DEST_FIL} TABLES=[tablename]
	#- where [tablename] is (comma_separated_list of names from) 
   #- LBCD_CODE|LPEC_PECODE|LSOU_SOURCECODE|SERR_ERRORLOG|HSDT_SDGTEXT|SSDT_SDGTEXT|SXAB_LAABRECH
	#- and recompile invalid object:
	#- ALTER VIEW SPED.LMOD_MODUL COMPILE;

	echo "set echo off pagesize 0  linesize 1000 trimspool on  tab off pause off"  > ${SQLFILE}
	echo "set echo off termout off heading off   feedback off" >> ${SQLFILE}
	echo "spool ${SQL_LOG}" >> ${SQLFILE}

if [ ${LBCD_CODE_TYPE} = "LONG_RAW" ] ; then
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
fi

if [ ${LPEC_SOURCECODE_TYPE} = "LONG" ] ; then
	echo "select 'ALTER TABLE lpec_pecode nologging;' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE lpec_pecode nologging;" >> ${SQLFILE}

	echo "select 'ALTER TABLE lpec_pecode ' from dual;" >> ${SQLFILE}
	echo "select '      modify (lpec_sourcecode clob);' from dual;" >> ${SQLFILE} 
	echo "ALTER TABLE lpec_pecode " >> ${SQLFILE}
   echo "      modify (lpec_sourcecode clob);" >> ${SQLFILE}

	echo "select 'ALTER TABLE lpec_pecode LOGGING; ' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE lpec_pecode LOGGING; " >> ${SQLFILE}

	echo "select 'ALTER INDEX LPEC_PECODE_IP rebuild;' from dual;" >> ${SQLFILE}
	echo "ALTER INDEX LPEC_PECODE_IP rebuild;" >> ${SQLFILE}
fi

if [ ${LSOU_SOURCECODE_TYPE} = "LONG" ] ; then
	echo "select 'ALTER TABLE lsou_sourcecode nologging;' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE lsou_sourcecode nologging;" >> ${SQLFILE}

	echo "select 'ALTER TABLE lsou_sourcecode ' from dual;" >> ${SQLFILE}
	echo "select '      modify (lsou_sourcecode clob);' from dual;" >> ${SQLFILE} 
	echo "ALTER TABLE lsou_sourcecode " >> ${SQLFILE}
   echo "      modify (lsou_sourcecode clob);" >> ${SQLFILE}

	echo "select 'ALTER TABLE lsou_sourcecode LOGGING; ' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE lsou_sourcecode LOGGING; " >> ${SQLFILE}

	echo "select 'ALTER INDEX LSOU_SOURCECODE_IP rebuild;' from dual;" >> ${SQLFILE}
	echo "ALTER INDEX LSOU_SOURCECODE_IP rebuild;" >> ${SQLFILE}
fi

if [ ${ERR_LONGTEXT_TYPE} = "LONG" ] ; then
	echo "select 'ALTER TABLE SERR_ERRORLOG nologging;' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE SERR_ERRORLOG nologging;" >> ${SQLFILE}

	echo "select 'ALTER TABLE SERR_ERRORLOG ' from dual;" >> ${SQLFILE}
	echo "select '      modify (ERR_LONGTEXT clob);' from dual;" >> ${SQLFILE} 
	echo "ALTER TABLE SERR_ERRORLOG " >> ${SQLFILE}
   echo "      modify (ERR_LONGTEXT clob);" >> ${SQLFILE}

	echo "select 'ALTER TABLE SERR_ERRORLOG LOGGING; ' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE SERR_ERRORLOG LOGGING; " >> ${SQLFILE}

	echo "select 'ALTER INDEX SERR_ERRORLOG_IP rebuild;' from dual;" >> ${SQLFILE}
	echo "ALTER INDEX SERR_ERRORLOG_IP rebuild;" >> ${SQLFILE}

	echo "select 'ALTER INDEX SERR_IX1 rebuild;' from dual;" >> ${SQLFILE}
	echo "ALTER INDEX SERR_IX1 rebuild;" >> ${SQLFILE}
fi

if [ ${HSDT_LTEXT_TYPE} = "LONG" ] ; then
	echo "select 'ALTER TABLE HSDT_SDGTEXT nologging;' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE HSDT_SDGTEXT nologging;" >> ${SQLFILE}

	echo "select 'ALTER TABLE HSDT_SDGTEXT ' from dual;" >> ${SQLFILE}
	echo "select '      modify (SDT_LTEXT clob);' from dual;" >> ${SQLFILE} 
	echo "ALTER TABLE HSDT_SDGTEXT " >> ${SQLFILE}
   echo "      modify (SDT_LTEXT clob);" >> ${SQLFILE}

	echo "select 'ALTER TABLE HSDT_SDGTEXT LOGGING; ' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE HSDT_SDGTEXT LOGGING; " >> ${SQLFILE}

	echo "select 'ALTER INDEX HSDT_SDGTEXT_IP rebuild;' from dual;" >> ${SQLFILE}
	echo "ALTER INDEX HSDT_SDGTEXT_IP rebuild;" >> ${SQLFILE}
fi

if [ ${SSDT_LTEXT_TYPE} = "LONG" ] ; then
	echo "select 'ALTER TABLE SSDT_SDGTEXT nologging;' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE SSDT_SDGTEXT nologging;" >> ${SQLFILE}

	echo "select 'ALTER TABLE SSDT_SDGTEXT ' from dual;" >> ${SQLFILE}
	echo "select '      modify (SDT_LTEXT clob);' from dual;" >> ${SQLFILE} 
	echo "ALTER TABLE SSDT_SDGTEXT " >> ${SQLFILE}
   echo "      modify (SDT_LTEXT clob);" >> ${SQLFILE}

	echo "select 'ALTER TABLE SSDT_SDGTEXT LOGGING; ' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE SSDT_SDGTEXT LOGGING; " >> ${SQLFILE}

	echo "select 'ALTER INDEX SSDT_SDGTEXT_IP rebuild;' from dual;" >> ${SQLFILE}
	echo "ALTER INDEX SSDT_SDGTEXT_IP rebuild;" >> ${SQLFILE}
fi

if [ ${XAB_RESSET_TYPE} = "LONG" ] ; then
	echo "select 'ALTER TABLE SXAB_LAABRECH nologging;' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE SXAB_LAABRECH nologging;" >> ${SQLFILE}

	echo "select 'ALTER TABLE SXAB_LAABRECH ' from dual;" >> ${SQLFILE}
	echo "select '      modify (XAB_RESSET clob);' from dual;" >> ${SQLFILE} 
	echo "ALTER TABLE SXAB_LAABRECH " >> ${SQLFILE}
   echo "      modify (XAB_RESSET clob);" >> ${SQLFILE}

	echo "select 'ALTER TABLE SXAB_LAABRECH LOGGING; ' from dual;" >> ${SQLFILE}
	echo "ALTER TABLE SXAB_LAABRECH LOGGING; " >> ${SQLFILE}

	echo "select 'ALTER INDEX SXAB_LAABRECH_IP rebuild;' from dual;" >> ${SQLFILE}
	echo "ALTER INDEX SXAB_LAABRECH_IP rebuild;" >> ${SQLFILE}

	echo "select 'ALTER INDEX SXAB_IX1 rebuild;' from dual;" >> ${SQLFILE}
	echo "ALTER INDEX SXAB_IX1 rebuild;" >> ${SQLFILE}
fi

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
