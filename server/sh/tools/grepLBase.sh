#!/usr/bin/ksh

#	file:			grepLBase.sh
#	purpose:		grep existing sources
#					. DB-Objects
#					. shells
#					. SQR-
#					. LI-
#					. OSM-destinations
#	author:		rune
#	remark:		Linux version

HOST=`hostname`

echo "---------------------------------------------------"
echo "grepLBase.sh: (HOST=${HOST}, DB=${ORACLE_SID})"
echo "---------------------------------------------------"

if [ -z "${1}" ] ; then
	echo "use:"
	echo "grepLBase.sh PATTERN"
	echo "             use ORACLE style '%'-character as wildcard"
	exit 1
fi

PATTERN="${1}"
UNIX_PATTERN="${PATTERN}"

while [ -n "${UNIX_PATTERN%%%*}" -a -n "${UNIX_PATTERN#*%}" -a "${UNIX_PATTERN%%%*}" != "${UNIX_PATTERN#*%}" ]
do
   praefix="${UNIX_PATTERN%%%*}"
   suffix="${UNIX_PATTERN#*%}"
   UNIX_PATTERN=`echo "${praefix}.*${suffix}"`
done

_NOW=`date +"%Y.%m.%d-%H:%M:%S"`
LOGFILE="/tmp/FOUND${USER}_${_NOW}.log"
SQLFILE="/tmp/SQL${USER}_${_NOW}.sql"
SQL_LOG="/tmp/SQL${USER}_${_NOW}.log"

echo "---------------------------------------------------" 	 > ${LOGFILE}
echo "grepLBase.sh: (HOST=${HOST}, DB=${ORACLE_SID}" 			>> ${LOGFILE}
echo "---------------------------------------------------" 	>> ${LOGFILE}

echo "set echo off  pagesize 0  linesize 1000  trimspool on  tab off  feedback off pause off"  > ${SQLFILE}
echo "spool ${SQL_LOG}" >> ${SQLFILE}

echo "set heading off" >> ${SQLFILE}
echo "select 'Objectnames like [%${PATTERN}%]' from dual;"  >> ${SQLFILE}
echo "select '------------------------------------------ ' from dual;" >> ${SQLFILE}
echo "set heading on;" >> ${SQLFILE}
echo " " >> ${SQLFILE}

echo "select owner||'.'||object_name, object_type, status, created, last_ddl_time" >> ${SQLFILE}
echo "from dba_objects where object_name like '%'||upper('${PATTERN}')||'%'" >> ${SQLFILE}
echo "and owner in ('SPED','LAGER','KUNDEN','OSM','INTERNET','PUBLIC','CHZOLL','EWS_D','EWS_E','GFT','GU_2001','GU_2005','GU_2008','INTEX','RKT','STARTER','USER1','SOLITAS');" >> ${SQLFILE}
echo " " >> ${SQLFILE}

echo "set heading off;" >> ${SQLFILE}
echo "select ' ' from dual;" >> ${SQLFILE}
echo "select 'Functions, Procedures and Packages accessing [%${PATTERN}%]' from dual;"  >> ${SQLFILE}
echo "select '------------------------------------------ ' from dual;" >> ${SQLFILE}
echo "set heading on;" >> ${SQLFILE}

echo "select owner||'.'||name, type, line, text  from dba_source" >> ${SQLFILE}
echo "where upper(text) like '%'||upper('${PATTERN}')||'%'" >> ${SQLFILE}
echo "and owner in ('SPED','LAGER','KUNDEN','OSM','INTERNET','PUBLIC','CHZOLL','EWS_D','EWS_E','GFT','GU_2001','GU_2005','GU_2008','INTEX','RKT','STARTER','USER1','SOLITAS');" >> ${SQLFILE}

echo "set heading off;" >> ${SQLFILE}
echo "select ' ' from dual;" >> ${SQLFILE}
echo "select 'AZAIDs accessing [%${PATTERN}%]' from dual;"  >> ${SQLFILE}
echo "select '------------------------------------------ ' from dual;" >> ${SQLFILE}
echo "set heading on;" >> ${SQLFILE}

echo "select aza_azaid, substr(stxt.get_text(aza_t_bez),1,50) aza_bez" >> ${SQLFILE}
echo "    ,substr(decode(sign(instr(upper(aza_select ),upper('${PATTERN}'))),1,'aza_select : pos='||to_char(instr(upper(aza_select  ),upper('${PATTERN}'))),'--' ),1,25) sel_pos" >> ${SQLFILE}
echo "    ,substr(decode(sign(instr(upper(aza_select2),upper('${PATTERN}'))),1,'aza_select2: pos='||to_char(instr(upper(aza_select2 ),upper('${PATTERN}'))),'--' ),1,25) sel_pos2" >> ${SQLFILE}
echo "    ,substr(decode(sign(instr(upper(aza_from   ),upper('${PATTERN}'))),1,'aza_from   : pos='||to_char(instr(upper(aza_from    ),upper('${PATTERN}'))),'--' ),1,25) sel_from" >> ${SQLFILE}
echo "    ,substr(decode(sign(instr(upper(aza_where  ),upper('${PATTERN}'))),1,'aza_where  : pos='||to_char(instr(upper(aza_where   ),upper('${PATTERN}'))),'--' ),1,25) sel_where" >> ${SQLFILE}
echo "    ,substr(decode(sign(instr(upper(aza_where2 ),upper('${PATTERN}'))),1,'aza_where2 : pos='||to_char(instr(upper(aza_where2  ),upper('${PATTERN}'))),'--' ),1,25) sel_where2" >> ${SQLFILE}
echo "    ,substr(decode(sign(instr(upper(aza_groupby),upper('${PATTERN}'))),1,'aza_groupby: pos='||to_char(instr(upper(aza_groupby ),upper('${PATTERN}'))),'--' ),1,25) sel_groupby" >> ${SQLFILE}
echo " from SAZA_T_ART" >> ${SQLFILE}
echo "where instr(upper(aza_select) ,upper('${PATTERN}')) > 0" >> ${SQLFILE}
echo "   or instr(upper(aza_select2),upper('${PATTERN}')) > 0" >> ${SQLFILE}
echo "   or instr(upper(aza_where)  ,upper('${PATTERN}')) > 0" >> ${SQLFILE}
echo "   or instr(upper(aza_where2) ,upper('${PATTERN}')) > 0" >> ${SQLFILE}
echo "   or instr(upper(aza_from)   ,upper('${PATTERN}')) > 0" >> ${SQLFILE}
echo "   or instr(upper(aza_groupby),upper('${PATTERN}')) > 0" >> ${SQLFILE}
echo "order by aza_azaid;" >> ${SQLFILE}

echo "spool off" >> ${SQLFILE}
echo "exit" >> ${SQLFILE}


echo " " 	>> ${LOGFILE}
echo "...searching: (${PATTERN}) in DB:" >> ${LOGFILE}
echo "===================================================" 	>> ${LOGFILE}

sqlplus -S sped/sped@${ORACLE_SID} @${SQLFILE} 

cat ${SQL_LOG} >> ${LOGFILE}
rm -f ${SQL_LOG}

if [ -n "${UNIX_PATTERN}" ] ; then
	PATTERN=${UNIX_PATTERN}
fi

echo " " 	>> ${LOGFILE}
echo "...searching: (${PATTERN}) in filesystem" >> ${LOGFILE}
echo "===================================================" 	>> ${LOGFILE}

OLDPWD=`pwd`

#----------------------------------------------
cd ${TRFL}
RC=0
if [ $? -eq 0 ] ; then
	echo "   .. in ${TRFL}" 

	for i in binlnx binaix binhpux cbus dfue etc fglc li_inc li_module li_module/var local sh sh/tools sh/sqr sql sql/tools sql/install sqr sqr/src sqr/include tab/modi tab/modi2 tab/modi3 tf_archiv app32
	do
		cd ${TRFL}/${i} 2>/dev/null
		if [ $? -eq 0 ] ; then
			[ ${RC} -eq 0 ] && \
			echo "   ##################################################" >> ${LOGFILE}
			echo "   .. in ${TRFL}/${i}" >> ${LOGFILE}
			echo "   ##################################################" >> ${LOGFILE}
			if [ "${i}" = "app32" ] ; then
	 			find . -maxdepth 1 ! -name "\.*" -name "*.apt" -type f -print0 | xargs -0 grep -i "${PATTERN}" >> ${LOGFILE}
				RC=$?
			else
	 			find . -maxdepth 1 ! -name "\.*" -name "*" -type f -print0 | xargs -0 grep -i "${PATTERN}" >> ${LOGFILE}
				RC=$?
			fi
		fi
	done
else
	echo "   .. NO such directory ${TRFL}" 
fi

#----------------------------------------------
cd ${TRFL}/kunden
if [ $? -eq 0 ] ; then
	echo "   .. in ${TRFL}/kunden"

	for i in li_inc li_module li_module/var sh sh/tools sql sql/tools sql/install sqr/src sqr/include
	do
		cd ${TRFL}/kunden/${i} 2>/dev/null
		if [ $? -eq 0 ] ; then
			[ ${RC} -eq 0 ] && \
			echo "   ##################################################" >> ${LOGFILE}
			echo "   .. in ${TRFL}/kunden/${i}" >> ${LOGFILE}
			echo "   ##################################################" >> ${LOGFILE}
	 		find . -maxdepth 1 ! -name "\.*" -name "*" -type f  -print0 | xargs -0 grep -i "${PATTERN}" >> ${LOGFILE}
			RC=$?
		fi
	done
else
	echo "   .. NO such directory ${TRFL}/kunden" 
fi

#----------------------------------------------
cd ${OSM}
if [ $? -eq 0 ] ; then
	echo "   .. in ${OSM}"

	for i in sql sql/tools sqr sqr/module tab tab/modi
	do
		cd ${OSM}/${i} 2>/dev/null
		if [ $? -eq 0 ] ; then
			[ ${RC} -eq 0 ] && \
			echo "   ##################################################" >> ${LOGFILE}
			echo "   .. in ${OSM}/${i}" >> ${LOGFILE}
			echo "   ##################################################" >> ${LOGFILE}
	 		find . -maxdepth 1 ! -name "\.*" -name "*" -type f -print0 | xargs -0 grep -i "${PATTERN}" >> ${LOGFILE}
			RC=$?
		fi
	done
else
	echo "   .. NO such directory ${OSM}" 
fi

cd ${OLDPWD}
rm -f ${SQLFILE}
cat ${LOGFILE}

echo " "
echo "   #------------------------------------------------------>"
echo "   .. your LOGFILE is: ${LOGFILE}"
echo "   #------------------------------------------------------>"
