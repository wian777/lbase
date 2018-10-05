
define(`_LOOP_SELECT´,`l_selectstm´)
define(`_LOOP_VARS´, ` VARIANTE, PRIORITAET,ANZAHL, VERKKURS, TERM_VON, TERM_NACH  ´)
undefine(`_LOOP_RSET´) 
define(`_FAHRPLAN_LOOP´,_LOOP)
define(`FAHRPLAN_END´,_LOOP_END )




#define FAHRPLAN(Orgid, Code , Zeitvon, Zeitnach, Sortierung )  \
if ( Sortierung == "" ) \
 { l_Sortierung = "ver_nachzeit, ver_vonzeit DESC"; } \
else \
 { l_Sortierung = Sortierung; } \
l_selectstm = "SELECT ver_nr ,0 ,ver_anzverb ,`substr´(ver_text,1,35) ,to_char(ver_vonzeit,'HH24:MI') ,to_char(ver_nachzeit,'HH24:MI') FROM sver_v_verbind ORDER BY "; \
l_selectstm = l_selectstm || l_Sortierung; \
l_selectstm = l_selectstm || " INTO :VARIANTE ,:PRIORITAET ,:ANZAHL ,:VERKKURS ,:TERM_VON  ,:TERM_NACH"; \
l_orgid = Orgid; \
l_code = Code; \
l_zeitvon = Zeitvon; \
l_zeitnach = Zeitnach; \
l_Sql_String = "BEGIN fahrplan.load_sver( " || l_orgid || ",'" || l_code || "',  to_date('" || l_zeitvon || "','YYYY.MM.DD HH24:MI'),to_date( '" || l_zeitnach ||"','YYYY.MM.DD HH24:MI')); END; "; \
@print(l_Sql_String); \
if ( @SqlImmediate(l_Sql_String) == FALSE ) { return(FALSE)  ; } \
_FAHRPLAN_LOOP \
@print(VARIANTE);\
@print(VERKKURS || TERM_VON || TERM_NACH ); \

define(`_LOOP_SELECT´, `" \
select  \
		 fahrplan.adridvon(nr,:VARIANTE) \
		,fahrplan.adridnach(nr,:VARIANTE) \
		,fahrplan.orgidab(nr,:VARIANTE) \
		,fahrplan.orgidem(nr,:VARIANTE) \
		,fahrplan.spedab(nr,:VARIANTE) \
		,fahrplan.spedem(nr,:VARIANTE) \
		,to_char(fahrplan.termvon(nr,:VARIANTE),'YYYY.MM.DD HH24:MI') \
		,to_char(fahrplan.termnach(nr,:VARIANTE) , 'YYYY.MM.DD HH24:MI' ) \
		,SUBSTR(fahrplan.verkkurs(nr,:VARIANTE),1,35) \
from nummer \
where nr >= 1 \
and nr <= fahrplan.get_slawanz(:VARIANTE) \
order by nr  \
into \
		 :ADRID_VON  \
		,:ADRID_NACH \
		,:ORGID_VON \
		,:ORGID_NACH \
		,:SPED_VON \
		,:SPED_NACH \
		,:TERM_VON \
		,:TERM_NACH \
		,:VERKKURS  "
´ )

define(`_LOOP_VARS´, ` ADRID_VON, ADRID_NACH, SPED_VON, SPED_NACH, ORGID_VON, ORGID_NACH, VERKKURS, TERM_VON, TERM_NACH  ´)
undefine(`_LOOP_RSET´) 
define(`_LAUFWEG_LOOP´,_LOOP) 
undefine(`_LOOP_VARS´)



#define LAUFWEG  \
_LAUFWEG_LOOP \
@print("Variante: " || VARIANTE ); \
@print(VERKKURS || TERM_VON || TERM_NACH ); \

