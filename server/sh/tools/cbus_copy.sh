#!/bin/bash
#
# echo 'select obj_domain || ' ' || obj_type || ' ' || obj_key from COBJ_OBJECT ...' | cbus_copy SOURCE-SID TARGET-SID 
#

#set -x

usage()
{
	echo "echo 'select  obj_domain || ' ' || obj_type || ' ' || obj_key from COBJ_OBJECT ...' | cbus_copy SOURCE-SID TARGET-SID"
	echo "(current) cbus-dir must have sub-folder SOURCE-SID, TARGET_SID"
	echo "cbus export - runfile and import - runfile is created"
	echo "cbus run from source to target"
	exit 1;
}


if [ -f /usr/local/LBASE/etc/profile.tf.batch ] ; then
   . /usr/local/LBASE/etc/profile.tf.batch
else
   . /etc/profile
fi

# ===========================================
# Variable TF_UID sollte bereits gesetzt sein
# (vor allem bei Mandanten-Installation)
# wenn nicht, auf Standard-Wert setzen
# -------------------------------------------
/bin/echo -e "${0}-1: \c" ; date
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


BASEDIR="$(pwd)"
SOURCESID="$1"
TARGETSID="$2"

# check's
if [ $# -ne 2 -o $(basename $BASEDIR) != 'cbus' -o ! -d $BASEDIR/$SOURCESID -o ! -d $BASEDIR/$TARGETSID  -o ! -f $BASEDIR/$SOURCESID/cbus.properties -o ! -f $BASEDIR/$TARGETSID/cbus.properties ]
then
	usage
fi
SQL=$( cat )

# execut sql
VALUE=$(SQLPATH=/dev/null sqlplus -S ${TF_UID}@${SOURCESID} 2>/dev/null << !!EOF
    set heading off
    set pagesize 0
    set feedback off
    set doc off
    set echo off
    set show off
    set autoprint off
    set pause off
    set verify off
	set linesize 32000
${SQL}
;
exit;
!!EOF
)
RET=$?
if [ $RET -ne 0 ] 
then
	exit $RET
fi

# create runfiles
echo "${VALUE}" | sed -e 's/^/export /' > $BASEDIR/$SOURCESID/export.cbusrun
echo "${VALUE}" | sed -e "s/^'?'/Localhost/" -e "s/^?/Localhost/" -e 's/^/import /'  > $BASEDIR/$TARGETSID/import.cbusrun

# run cbus
pushd $SOURCESID;
cbus run export.cbusrun
RET=$?
if [ $RET -ne 0 ] 
then
	exit $RET
fi
popd
pushd $TARGETSID;
cbus run import.cbusrun
RET=$?
popd

exit $RET
