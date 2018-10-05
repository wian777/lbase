#!/bin/ksh
#
#Beschreibung: ...
#
# 22.08.03  romo direkten SQL-Connect durch TF_UID ersetzt
#

# ===========================================
# Variable TF_UID sollte bereits gesetzt sein
# (vor allem bei Mandanten-Installation)
# wenn nicht, auf Standard-Wert setzen
# -------------------------------------------
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

sed -e "s///" $1 >$1.dat
IFS="\$" 
while read l_frmid l_frmbez l_frmklasse l_frmauswahlid l_uebersid
do
  echo $l_frmid
  echo $l_frmbez
  echo $l_frmklasse
  echo $l_frmauswahlid
  echo $l_uebersid
sqlplus ${TF_UID} @mskgen.sql <<here
$l_frmid
$l_frmbez
$l_frmklasse
$l_frmauswahlid
$l_uebersid
here
done < $1.dat
IFS=" "
