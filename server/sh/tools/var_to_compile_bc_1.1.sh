#!/bin/ksh
#
# Beschreibung: Neukompilieren aller LI-Variablen mit ByteCode < 1.1
#
# 15.03.2012 dabe,frth 
#

# ===========================================
# Variable TF_UID sollte bereits gesetzt sein
# (vor allem bei Mandanten-Installation)
# wenn nicht, auf Standard-Wert setzen
# -------------------------------------------
#set -x
if [ -z "$TF_UID" ]
then
	if [ -z "$TRFL" ]
	then
		export TRFL=/d1/group/sped
	fi
	if [ -x $TRFL/kunden/sh/setTFUID.sh ]
	then
		. $TRFL/kunden/sh/setTFUID.sh
	else
		. $TRFL/sh/setTFUID.sh
	fi
fi
# ===========================================

SQLPATH=/dev/null sqlplus -s ${TF_UID}@${ORACLE_SID} > /dev/null << !!EOF
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
	set linesize 1000
	spool var_to_compile_bc_1.1.tmp 

	SELECT
	lvar_codid || chr(9)|| lvar_vanid || chr(9) || lvar_typname 
	FROM
	lbcd_bytecode,
	lvar_variable
	WHERE 1=1
	AND NVL(lbcd_bc_version,'0.7') < '1.1'
	AND lbcd_codid(+) = lvar_codid
	AND lvar_codid IS NOT NULL;

	spool off
	exit;
!!EOF

awk '
BEGIN { l_date = strftime("%Y%m%d%H%M%S"); }
{
	l_codid = $1 ;
	l_vanid = $2 ;
	l_typname = $3 ;

	l_command = "bc_tool -a get -3 -c " ENVIRON["TF_UID"] "@" ENVIRON["ORACLE_SID"] " -n " l_codid " -s var_to_compile_bc_1.1.li" ;
	print( l_command );
	system( l_command );

	l_command = "var_tool -a upd -c " ENVIRON["TF_UID"] "@" ENVIRON["ORACLE_SID"] " -n " l_vanid " -s var_to_compile_bc_1.1.li -m " l_typname " | tee -a " ENVIRON["SQR"] "/log/var_to_compile_bc_1.1_" l_date ".log";
	print( l_command );
	system( l_command );
	
}' var_to_compile_bc_1.1.tmp


[ -f var_to_compile_bc_1.1.tmp ] && rm -f var_to_compile_bc_1.1.tmp 
[ -f var_to_compile_bc_1.1.li ] && rm -f var_to_compile_bc_1.1.li 
