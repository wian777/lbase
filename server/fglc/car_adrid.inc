/*liest die Bezeichnung des Airline-Codes in ZUFELD1A
und stellt die entsprechende Adrid ins Feld ZUFELD2A

z. B.
vor include:
IN:  ZUFELD1A = (Variable-ID)
OUT: ZUFELD2A = ADRID (Carrier)
*/

@SqlImmediate("SELECT car_adrid \
FROM scar_carrier \
WHERE car_carid = :ZUFELD1A INTO :ZUFELD2A");

@print("   Lesen Carrier IATA-Code für ZUFELD1A (" || @getwert(ZUFELD1A) ||
") liefert in ZUFELD2A (" || ZUFELD2A || ")");
