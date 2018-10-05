#!/usr/bin/ksh
#
#Beschreibung: ...
#
# 18.12.2009  frth	erzeugt cbus.properties 
#clear
#set -x

usage () {
	echo ""
	echo "$0 ..." 
	echo "...-c erzeugt vorsichtig ein ./cbus.properties - File mit sinnvollen Werten und vielen Properties als Vorlage (auskommentiert)"
	exit 1
}

while [ $# -ge 1 ] # Gibt es noch Parameter vor dem ersten nicht -
do
	case "$1" in
		*)	usage
			;;
	esac
done
[ $# -ne 0 ] && usage

FILE_NAME="cbus.properties"
DATE=`date +"%Y.%m.%d %H:%M:%S"`
INFO="### created with ${0} at ${DATE} by user ${USER} ### " 
echo ${INFO} >> ${FILE_NAME}

LBASEINSTANCE=`echo $PWD | sed "s/.*\///g"`
CMD="tnsping ${LBASEINSTANCE}" 
${CMD} 1>/dev/null 2>/dev/null
RC=$?
if [ $RC -ne 0 ]
then
	echo "$0: Datenbank (${LBASEINSTANCE}) wurde nicht erreicht ueber TNSPING " 
	exit 1;
fi

#DB-Description ermitteln 
VALUE=`tnsping ${LBASEINSTANCE} | grep "Attempting to contact" | sed "s/^Attempting to contact *(/(/" `
RC_TNS=$?
if [ $RC_TNS -ne 0 ] 
then
	echo "$0: Datenbank-Details fuer (${LBASEINSTANCE}) konnte nicht aus tnsnames.ora ermittelt werden" 
	exit 1;
fi

NADEL="lbase.database.connection.description"
VORHANDEN=`grep "^${NADEL}" ${FILE_NAME} | wc -l`
if [ $VORHANDEN -eq 0 ]
then
	echo "${NADEL}=${VALUE}" >> ${FILE_NAME} 
fi

#DB-SID
NADEL="lbase.database.sid"
VORHANDEN=`grep "^${NADEL}" ${FILE_NAME} | wc -l`
if [ $VORHANDEN -eq 0 ]
then
	echo "${NADEL}=${LBASEINSTANCE}" >> ${FILE_NAME} 
fi


# appserver
VALUE=""
DBPASSWD=`grep "lbase.database.password=" ${FILE_NAME} | cut -d "=" -f 2`
[ -z "$DBPASSWD" ] && DBPASSWD="sped"
DBUSER=`grep "lbase.database.schema=" ${FILE_NAME} | cut -d "=" -f 2`
[ -z "$DBUSER" ] && DBUSER="sped"

if [ $RC_TNS -eq 0 ] 
then
	VALUE=`sqlplus -S ${DBUSER}/${DBPASSWD}@${LBASEINSTANCE} 2>/dev/null << !!EOF
	set heading off
	set pagesize 0
	set feedback off
	set doc off
	set echo off
	set show off
	set autoprint off
	set pause off
	set verify off
	select
	snod.get_all_apphostnames
	from
	dual
;
exit;
!!EOF`
RC=$?
fi

NADEL="lbase.appserver.host"
VORHANDEN=`grep "^${NADEL}" ${FILE_NAME} | wc -l`
if [ $VORHANDEN -eq 0 ]
then
	if [ $RC -eq 0 ]
	then
		echo "${NADEL}=${VALUE}" >> ${FILE_NAME} 
	fi
fi

# dpserver
VALUE=""
DBPASSWD=`grep "lbase.database.password=" ${FILE_NAME} | cut -d "=" -f 2`
[ -z "$DBPASSWD" ] && DBPASSWD="sped"
DBUSER=`grep "lbase.database.schema=" ${FILE_NAME} | cut -d "=" -f 2`
[ -z "$DBUSER" ] && DBUSER="sped"

if [ $RC_TNS -eq 0 ] 
then
	VALUE=`sqlplus -S ${DBUSER}/${DBPASSWD}@${LBASEINSTANCE} 2>/dev/null << !!EOF
	set heading off
	set pagesize 0
	set feedback off
	set doc off
	set echo off
	set show off
	set autoprint off
	set pause off
	set verify off
	select max(nod_dbhostname) 
	from
	SNOD_T_RECHNER
	where 1=1
	and nvl(nod_sperre,0) = 0
	and nod_dbname = '${LBASEINSTANCE}'
;
exit;
!!EOF`
RC=$?
fi

NADEL="lbase.database.host"
VORHANDEN=`grep "^${NADEL}" ${FILE_NAME} | wc -l`
if [ $VORHANDEN -eq 0 ]
then
	if [ $RC -eq 0 ]
	then
		echo "${NADEL}=${VALUE}" >> ${FILE_NAME} 
	fi
fi

for NADEL in "lbase.database.schema=sped" "lbase.database.password=sped" "lbase.appserver.user=sped" "lbase.appserver.password=sped" "cbus.basedir=../workspace" "cbus.verbose=1" "#knd-rule.ignore=1" "#AMERICAN.updateable=0" "#cbus.readonly=0" "lbase.appserver.protocol=ftp" "#lbase.appserver.homedir=/d1/group/sped" "#cbus.cvsroot=:pserver:frth@tfdbnbld01:/TIG-DBN" "#log4j.logger.tf=DEBUG" "#supported-locales-rule.ignore=1" "#development-locales-rule.ignore=1" "#lver-testflag-rule.ignore=1" "#SATT.sperre-rule.ignore=1"
do
	NADELKEY=` echo ${NADEL} | sed "s/=.*//" `
	VORHANDEN=`grep "${NADELKEY}" ${FILE_NAME} | wc -l`
	if [ $VORHANDEN -eq 0 ]
	then
		echo "${NADEL}" >> ${FILE_NAME}
	fi
done

[ ${USER} == "dabe" ]  && echo "*** Hallo Consulting-Queen ;-) ***"

echo ${INFO} >> ${FILE_NAME}
