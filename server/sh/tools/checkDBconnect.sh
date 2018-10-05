#!/usr/bin/ksh
#
#	check DB_connectivity:
#
#	Author:	rune
#	Date:		2010.05.20
# 2011.06.28 dafa Event publisher (LBASE NT) added. Entry, exit and possible
#                 errors will fire events. - Component "LBaseNT" and an 
#                 adequate OSGi runtime environment are assumed
#----------------------------------

[ -f ${TRFL}/binsrv/lble.functions ] && { . ${TRFL}/binsrv/lble.functions && _lble=1; } || _lble=0

ORA_OUTPUT="/tmp/ora_outp$$.log"
ORA_OERRLOG="/tmp/ora_oerr_$$.log"

((_lble)) && le_begin DB

echo " "
echo "Enter DB-Name   to  check connections    (default: ${ORACLE_SID}): \c"
read SID
[ -z "${SID}" ] && SID=${ORACLE_SID}
tnsping ${SID}
RC=$?
if [ "${RC}" -ne 0 ] ; then
	echo "\ncannot tnsping ORACLE_SID ${SID}" 
	((_lble)) && le_fail 1 DB
	exit 1
fi

echo " "
echo "Enter LOOPCOUNT for connection to ${SID} (default: 10)           : \c"
echo " "
read antw
e=10
let f=antw+0
[ ${f} -gt ${e} ] && e=${f}

a=0
while [ 1 = 1 ]
do
	let a=${a}+1
	[ ${a} -gt ${e} ] && break

	sqlplus -S ${TF_UID}@${SID} <<EOF 1> ${ORA_OUTPUT} 2>${ORA_OERRLOG}
	set feedback off
	set pause off
	select	global_name,
		dbms_utility.current_instance instance, 
		'  ${a}' cnt, 
		to_char(sysdate,'HH24:MI:SS') hh_mi_ss 
	from
	( select  substr(global_name,1,50) global_name
	   from global_name
	);
	quit
EOF

	RC=$?

	if [ ${RC} -ne 0 ] ; then
		echo "***ERROR: LOOPCOUNT ${a}"
		_msg=$(grep -h "ORA-" ${ORA_OUTPUT} ${ORA_OERRLOG})
		echo ${_msg}
		((_lble)) && le_fail 1 DB "msg=${_msg}"
	else
		cat ${ORA_OUTPUT}
	fi
done
((_lble)) && le_end DB

rm ${ORA_OUTPUT} ${ORA_OERRLOG}
