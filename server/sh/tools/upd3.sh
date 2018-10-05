#!/bin/sh

# stderr-Protokoll 
exec 2>> $TRFL/tmp/upd3.log

# Dieses Skript erzeugt kein Output-File, sondern liefert nur
# einen Return-Code 0, wenn das grep-Kommando etwas findet.

# in diesem Fall wird das Modul einfach unveraendert neu kompiliert

CODID=$1	# Code-ID
SRCIN=$2	# Input-Source
SRCOUT=$3	# Output-Source

# alle Module feststellen, die die Makros LAGER_BESTAND oder ZSBLOCK enthalten

if egrep -q '^LAGER_BESTAND|^ZSBLOCK' $SRCIN
then
 echo "$CODID" >&2
 exit 0
fi

exit 1
