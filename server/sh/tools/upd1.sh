:
# Alle 4GL-Module sollen mit upd3.sh bearbeitet werden
# Wenn upd3.sh 0 liefert, wird das Modul neu compiliert.

bc_regen -u ./upd3.sh -4 -c sped/sped@$ORACLE_SID
