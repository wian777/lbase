#!/bin/sh
#
# johi	2009-09-15    neu geschrieben wegen Unicode-Migration (.mc-File muss ASCII sein)
#

# ersetzt in m4-Sourcen die Delimiter Grave Accent U+0060 und Acute Accent U+00B4
# durch die Folgen ""{"" und ""}""

# Es wird das Kommando uconv mit Unicode-Escapes verwendet, um vom Encoding unabhaengig 
# zu sein, und die Source von diesem Skript soll nur ASCII-Zeichen enthalten.

# Weiters werden CR (0x0d) entfernt, diese sind zwar im m4-Source nicht erlaubt,
# kommen aber laut Murphy doch vor, und fuehren dann zu schwierig zuordenbaren
# Folgefehlern.

# Motiv:
# Makrodefinitionen wie define(`_LPL_VARS_LOOP', ...) sind mit Gravis und Akut 
# etwas leichter lesbar. Andererseits sind  in den eigentlichen LI-Modulen Gravis und Akut
# in Zeichenketten erlaubt, waehrend die Folgen ""{"" und ""}"" in Zeichenketten 
# von LI-Modulen nicht vorkommen koennen.

function mc_convert()
{
if [ -f ${1}.m4 ]
then
   echo -e "Konvertiere ${1}.m4 nach ${1}.mc"
   if $TRFL/binsrv/uconv -f iso-8859-1 -t ascii \
                         -x '\u0060 > \"\"\{\"\";\u00b4 > \"\"\}\"\";\u000d > ' \
			 -o ${1}.mc ${1}.m4 
   then 
      return 0
   else
      rm -f ${1}.mc
      mc_conv_error ${1}
      return 1
   fi
fi
return 0
}
mc_conv_error()
{
echo Konvertierungsfehler ${1}.m4 nach ASCII, ${1}.mc wurde geloescht.
echo Hinweis: in .m4-Sourcen sind ausser Akut keine Non-ASCII-Zeichen erlaubt.
echo 
}

mc_convert lager
mc_convert la
mc_convert chz
mc_convert fahrplan
mc_convert allgmodul
mc_convert kunden
# existiert nicht mehr ?
mc_convert status
mc_convert LBaseLI_File.opt
