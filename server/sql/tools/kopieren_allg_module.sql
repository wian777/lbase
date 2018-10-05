-- 27.06.2000 wosc  
-- UEbernahme Allgemeine Module 
-- Select fuer Auswahl Prgid Cursor ( c_lprg ) ist anzupassen
-- RemoteDB Kennung in den Statements anpassen
-- Tnsnames.ora und Database-Link anlegen 

declare

cursor c_lprg
is
	select 
 				 LPRG_PRGID  
 				,LPRG_KUERZEL
 				,LPRG_KRIID 
 				,LPRG_BEZ
--	from latt_attribut@welz a, latt_attribut@welz b, lprg_programm@welz
	from lprg_programm@welz
--	where lprg_prgid = a.latt_prgid 
--	and a.latt_prgid = b.latt_prgid
--	and a.latt_wert = '691'
--	and b.latt_wert like 'CT%';
	where ( lprg_kriid = 'ALLG'
    or lprg_kriid = 'ALLG_FA' )
	and lprg_bez like 'CT%';

cursor c_next_lprg_prgid
is 
 select lprg_prg_id_seq.nextval lprg_prgid from dual; 

cursor c_lstb
	( p_prgid lprg_t_programm.lprg_prgid%TYPE )
is
	select
	 LSTB_PRGID         
	, LSTB_STBID        
	, LSTB_PRIORITAET  
	, LSTB_BEZ        
	, LSTB_TEXT      
	, LSTB_CODID    
	, LSTB_ORGID   
	, LSTB_USRID  
	, LSTB_AEND
	from lstb_startbed@welz
	where lstb_prgid = p_prgid;

cursor c_lver
	( p_prgid lprg_t_programm.lprg_prgid%TYPE,
	  p_stbid lstb_startbed.lstb_stbid%TYPE )
is
	select
 		LVER_PRGID  
 		,LVER_STBID 
 		,LVER_START
 		,LVER_ENDE
 		,LVER_VON
 		,LVER_BIS    
 		,LVER_CODID 
 		,LVER_TEST_FLAG 
 		,LVER_VERSNR   
 		,LVER_AEND    
 		,LVER_TEXT   
	from lver_version@welz
	where lver_prgid = p_prgid
	and lver_stbid = p_stbid ;

	cursor c_lpec ( p_codid lpec_pecode.lpec_codid%TYPE )
	is
		select lpec_sourcecode from lpec_pecode@welz
		where lpec_codid = p_codid;


	cursor c_lbcd ( p_codid lbcd_bytecode.lbcd_codid%TYPE )
	is
		select lbcd_code from lbcd_bytecode@welz
		where lbcd_codid = p_codid;


	l_txtid_kbez varchar2(20);
	l_txtid_bez  varchar2(20);

	l_prgid lprg_t_programm.lprg_prgid%TYPE;

	l_lpec_sourcecode lpec_pecode.lpec_sourcecode%TYPE;
   l_lbcd_code lbcd_bytecode.lbcd_code%TYPE;	


begin

	for i in c_lprg
	loop
		l_prgid := NULL;
		l_txtid_bez := txt_ins(i.lprg_bez,'lprg_t_bez');
		for j in c_next_lprg_prgid
		loop
			l_prgid := j.lprg_prgid;
		end loop;

	   insert into lprg_t_programm
			(		
 				LPRG_PRGID  
 				,LPRG_KUERZEL
 				,LPRG_KRIID 
 				,LPRG_T_BEZ
 				,LPRG_AEND
 				,LPRG_USRID
	 		)
      	values 
	 		( 
				l_prgid 
 				,i.LPRG_KUERZEL
 				,i.LPRG_KRIID 
 				,l_txtid_bez
 				,sysdate
 				,'DFUE'
			) ;

	   insert into latt_attribut 
			(
	 			LATT_KRIID 
	 			,LATT_PRGID 
	 			,LATT_VANID
	 			,LATT_WERT
	 			,LATT_AEND  
	 			,LATT_USRID
			)
		 select 
	 			LATT_KRIID 
	 			,l_prgid
	 			,LATT_VANID
	 			,LATT_WERT
	 			,sysdate
				,'DFUE'
		 from latt_attribut@welz
		 where latt_prgid = i.lprg_prgid;


		for k  in c_lstb ( i.lprg_prgid ) 
		loop
	
	   	insert into lstb_startbed
			(
		 		LSTB_PRGID         
				, LSTB_STBID        
				, LSTB_PRIORITAET  
				, LSTB_BEZ        
				, LSTB_TEXT      
				, LSTB_CODID    
				, LSTB_ORGID   
				, LSTB_USRID  
				, LSTB_AEND
			)
			values
			(
		 		  l_prgid         
				, k.LSTB_STBID        
				, k.LSTB_PRIORITAET  
				, k.LSTB_BEZ        
				, k.LSTB_TEXT      
				, k.LSTB_CODID    
				, NULL 
				, 'DFUE'
				, sysdate  
			);
	
			insert into lcod_code
			select * from lcod_code@welz
			where lcod_codid = k.LSTB_CODID;
	
			for m in c_lpec (k.LSTB_CODID ) loop
				l_lpec_sourcecode := m.lpec_sourcecode;
				insert into lpec_pecode
				( lpec_codid, lpec_sourcecode )
				values
				( k.LSTB_CODID, l_lpec_sourcecode );
			end loop;
			for m in c_lbcd (k.LSTB_CODID ) loop
				l_lbcd_code := m.lbcd_code;
				insert into lbcd_bytecode
				( lbcd_codid, lbcd_code)
				values
				( k.LSTB_CODID, l_lbcd_code);
			end loop;
	
	
			for l  in c_lver ( k.lstb_prgid, k.lstb_stbid ) 
			loop
		
		   	insert into lver_version
				(
 					LVER_PRGID  
 					,LVER_STBID 
 					,LVER_START
 					,LVER_ENDE
 					,LVER_VON
 					,LVER_BIS    
 					,LVER_CODID 
 					,LVER_TEST_FLAG 
 					,LVER_VERSNR   
 					,LVER_AEND    
 					,LVER_TEXT   
				)
				values
				(
 					l_prgid
					,l.LVER_STBID 
 					,l.LVER_START
 					,l.LVER_ENDE
 					,l.LVER_VON
 					,l.LVER_BIS    
 					,l.LVER_CODID 
 					,l.LVER_TEST_FLAG 
 					,l.LVER_VERSNR   
 					,sysdate    
 					,l.LVER_TEXT   
				);
		
				insert into lcod_code
				select * from lcod_code@welz
				where lcod_codid = l.LVER_CODID;
		
				for m in c_lpec (l.LVER_CODID ) loop
					l_lpec_sourcecode := m.lpec_sourcecode;
					insert into lpec_pecode
					( lpec_codid, lpec_sourcecode )
					values
					( l.LVER_CODID, l_lpec_sourcecode );
				end loop;
				for m in c_lbcd (l.LVER_CODID ) loop
					l_lbcd_code := m.lbcd_code;
					insert into lbcd_bytecode
					( lbcd_codid, lbcd_code)
					values
					( l.LVER_CODID, l_lbcd_code);
				end loop;

			end loop;	
	
		end loop;
	end loop;
		
end;
/

