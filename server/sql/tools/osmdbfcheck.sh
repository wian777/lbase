#/usr/bin/sh
# wian 20051018
# file: osmdbfcheck.sh
# osmdbfcheck ohne perl, führt osmdbfcheck.sql aus
# check Oracle Tablespaces
# set +x
#--------------------------------- exec profile for cronjobs if ${TRFL} not set
if [ -z "${TRFL}" ] ; then
   . /etc/profile
fi
#--------------------------------- set TFECHO,HOST,TFOS variables
#                                  analogous: ${TRFL}/etc/tfosenv.sh
if [ -z "${TFECHO}" ] ; then
	[ -x ${TRFL}/etc/tfosenv.sh ] && . ${TRFL}/etc/tfosenv.sh
fi
#--------------------------------- if not found
#--------------------------------- load actual standard tfosenv.sh
if [ -z "${TFECHO}" ] ; then
#  als erstes ECHO laden mit standard
	TFECHO="echo"
	#  wenn /bin/echo da ist, dann verwenden
	[ -x /bin/echo ] && TFECHO="/bin/echo"
	#  wenn /bin/echo da ist und option -e funktioniert, verwenden
	[ -x /bin/echo -a -z "`/bin/echo -e`" ] && TFECHO="/bin/echo -e"
	#  wenn build in echo mit option -e funktioniert, verwenden
	[ -z "`echo -e`" ] && TFECHO="echo -e"
	#  wenn build in echo one option -e funktioniert, verwenden
	[ -z "`echo \"\n\"`" ] && TFECHO=echo
	export TFECHO
fi
[ -z "${HOST}" ] && export HOST=`hostname`
[ -z "${TFOS}" ] && export TFOS=`uname`

#--------------------------------- ORACLE_SID abfragen
if [ -z "${ORACLE_SID}" ] ; then
   ${TFECHO} "There is no ORACLE_SID!"
	exit 1
   # ${TFECHO} "Which ORACLE_SID: \c"
	# read sid
	# ${TFECHO} "Do you realy want to change the Sid to ${sid}? \n
	# y/n: \c"
	# read yn
	# [ "x${yn}" -eq "x[Yy]" ] && export ORACLE_SID=${sid}
fi

PCNT=90
PID=$$
MAILADR=control
CHECKLST=/tmp/osmdbfcheck${PID}.lst
MAILLST=/tmp/osmdbfcheck${PID}.txt
_NOW=`date +"%Y.%m.%d-%H:%M:%S"`
[ -z "${HOST}" ] && export HOST=`hostname`
TMPFILE=/tmp/osmdbfcheck${PID}.tmp
if [ -e ${CHECKLST} ] 
then 
	chmod 664 ${CHECKLST}
else
	touch ${CHECKLST}
	chmod 664 ${CHECKLST}
fi

# remove temporary created files on exit
exit_trap() {
	# echo fertig
	rm -rf ${CHECKLST} ${MAILLST} ${TMPFILE}
}
trap exit_trap EXIT

go_sql() {
# SQL ausführen
sqlplus -s sped/sped@${ORACLE_SID} <<HERE
set feedback off
set verify off
set echo off
set heading off
set termout off
set serveroutput on
@osmdbfcheck.sql
set echo on
select * from osmdbfcheck;
drop table osmdbfcheck;
exit;
HERE
}


intomail() {
cat <<END
Startzeit:         ${_NOW}
Hostname:          ${HOST}
Datenbank:         ${ORACLE_SID}
Prozess-ID:        ${PID}


Tablespace              Gesamt kB    Verwendet kB       Frei kB  belegt %    Gr.Block kB
----------------------------------------------------------------------------------------- 
END
}

intomail > ${MAILLST}

go_sql|grep -v "^$" > ${CHECKLST}

oIFS=${IFS}
HIGHEST=""
nHIGH=0
nPERCENT=0
FLAG=OK
IFS='
';

# Für Subject im Mail grössten Prozentsatz ermitteln
highest() {
	if [ -z ${HIGHEST} ] 
	then 
		HIGHEST=" ---> ${TBLSP} ${nPERCENT} %" 
	else
		if [ `echo ${HIGHEST}|awk '{print $3}'` -gt ${nPERCENT} ] 
		then
			HIGHEST="${HIGHEST} ---> ${TBLSP} ${nPERCENT} %"
		else
			HIGHEST=" ---> ${TBLSP} ${nPERCENT} %${HIGHEST}"
		fi 
	fi
}
lnr=0
for line in `cat ${CHECKLST}`
do
   LINE=`echo ${line}|\
			awk '{printf( "%-14s         %10s   %13s    %10s    %6s    %11s",
			substr($1,1,20),substr($2,1,24),substr($3,1,15),substr($4,1,8),substr($5,1,5),substr($6,1,20))}'`
	TBLSP=`echo ${line}|awk '{printf $1}'`
   nPERCENT=`echo ${line}|awk '{print $5}'`
	[ ${nPERCENT} -gt ${nHIGH} ] && nHIGH=${nPERCENT}
   [ ${nPERCENT} -gt ${PCNT} ] && FLAG=ERR && highest && \
					echo -e "Tablespace ${TBLSP}: ${nPERCENT} Prozent!"|\
					awk -F: '{printf( "%-35s    %s\n",
					substr($1,1,35), substr($2,1,35))}' >> ${TMPFILE}
   echo ${LINE} >> ${MAILLST}
done
######################################
IFS=${oIFS}
[ -f ${TMPFILE} ] && echo -e "\n\nACHTUNG: Folgende Tablespace sind ueber ${PCNT} Prozent belegt!\
               \n-----------------------------------------------------------" >> ${MAILLST} \
					&& sort -nk 3 -r ${TMPFILE} >>  ${MAILLST}
# wenn ueber ${PCNT} 90% --> Mail an control
mk_subj() {
# Info:ORACHECK:TFE:tfdbnlx02:ERR:Oracle Check  ---> TS_INDEX 97% 
	SUBJ="Info:DBFCHECK:${ORACLE_SID}:${HOST}:${FLAG}:Oracle Check${HIGHEST}"
}
gomail() {
	mk_subj
	mail -s "${SUBJ}" ${MAILADR} < ${MAILLST}
}
if [ "${1}" = "-a" ]
then
	gomail
else
	[ "${FLAG}" = "ERR" ] && gomail
fi

exit
