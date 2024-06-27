$PBExportHeader$w_migrationorthocom.srw
forward
global type w_migrationorthocom from w_child
end type
type cb_13 from commandbutton within w_migrationorthocom
end type
type cb_11 from commandbutton within w_migrationorthocom
end type
type cb_12 from commandbutton within w_migrationorthocom
end type
type cb_10 from commandbutton within w_migrationorthocom
end type
type cb_9 from commandbutton within w_migrationorthocom
end type
type cb_8 from commandbutton within w_migrationorthocom
end type
type cb_6 from commandbutton within w_migrationorthocom
end type
type cb_7 from commandbutton within w_migrationorthocom
end type
type cb_5 from commandbutton within w_migrationorthocom
end type
type st_count from statictext within w_migrationorthocom
end type
type st_1 from statictext within w_migrationorthocom
end type
type cb_4 from commandbutton within w_migrationorthocom
end type
type cb_3 from commandbutton within w_migrationorthocom
end type
type cb_2 from commandbutton within w_migrationorthocom
end type
type cb_1 from commandbutton within w_migrationorthocom
end type
type cb_migdossfin from commandbutton within w_migrationorthocom
end type
type cb_migpat from commandbutton within w_migrationorthocom
end type
end forward

global type w_migrationorthocom from w_child
integer x = 214
integer y = 221
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean ib_isupdateable = false
cb_13 cb_13
cb_11 cb_11
cb_12 cb_12
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_6 cb_6
cb_7 cb_7
cb_5 cb_5
st_count st_count
st_1 st_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_migdossfin cb_migdossfin
cb_migpat cb_migpat
end type
global w_migrationorthocom w_migrationorthocom

type variables
transaction bdorthocom

end variables

on w_migrationorthocom.create
int iCurrent
call super::create
this.cb_13=create cb_13
this.cb_11=create cb_11
this.cb_12=create cb_12
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_6=create cb_6
this.cb_7=create cb_7
this.cb_5=create cb_5
this.st_count=create st_count
this.st_1=create st_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_migdossfin=create cb_migdossfin
this.cb_migpat=create cb_migpat
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_13
this.Control[iCurrent+2]=this.cb_11
this.Control[iCurrent+3]=this.cb_12
this.Control[iCurrent+4]=this.cb_10
this.Control[iCurrent+5]=this.cb_9
this.Control[iCurrent+6]=this.cb_8
this.Control[iCurrent+7]=this.cb_6
this.Control[iCurrent+8]=this.cb_7
this.Control[iCurrent+9]=this.cb_5
this.Control[iCurrent+10]=this.st_count
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.cb_4
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.cb_2
this.Control[iCurrent+15]=this.cb_1
this.Control[iCurrent+16]=this.cb_migdossfin
this.Control[iCurrent+17]=this.cb_migpat
end on

on w_migrationorthocom.destroy
call super::destroy
destroy(this.cb_13)
destroy(this.cb_11)
destroy(this.cb_12)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_6)
destroy(this.cb_7)
destroy(this.cb_5)
destroy(this.st_count)
destroy(this.st_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_migdossfin)
destroy(this.cb_migpat)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

bdorthocom = create transaction

bdorthocom.DBMS       = 'ODBC'
bdorthocom.DbParm     = "ConnectString='DSN=patientcare;ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"
connect using bdorthocom;
if bdorthocom.SqlCode = 0 then
	messagebox("Information","Vvous êtes maintenant connecté à la base de données",Information!,Ok!)
else
	messagebox("Information",bdorthocom.SqlErrText,Information!,Ok!)
end if

end event

type cb_13 from commandbutton within w_migrationorthocom
integer x = 1915
integer y = 1240
integer width = 768
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Responsable"
end type

event clicked;long ll_id, ll_nbligne, i
integer li_pos,li_pat
string ls_patnumr,ls_address,ls_town,ls_postcode,ls_homephne,ls_workphne,ls_resname,ls_relation
string ls_nom,ls_prenom,ls_resptype,ls_rporder
setPointer(hourglass!)
delete from t_contacts;

SELECT count(*) into :ll_nbligne FROM rpty using bdorthocom;
i = 1

DECLARE rpty CURSOR FOR

	SELECT patnumr,
	       address,
			 town,
			 postcode,
			 homephne,
			 workphne,
			 resname,
			 relation,
			 rporder
			 
	FROM rpty
	WHERE relation <> 'SELF'
	ORDER BY patnumr ASC using bdorthocom;
	
	OPEN rpty;
	
		FETCH rpty into :ls_patnumr, 
							 :ls_address, 
							 :ls_town, 
							 :ls_postcode, 
							 :ls_homephne, 
							 :ls_workphne, 
							 :ls_resname, 
							 :ls_relation,
							 :ls_rporder;
								 
		DO WHILE bdorthocom.SQLCode = 0
			
			if isnull(ls_patnumr) = false and ls_resptype <> 'SELF' then
				ll_id = long(ls_patnumr)
				li_pos = pos(ls_town,',')
				if li_pos > 0 then
					ls_town = left(ls_town,li_pos - 1)
				end if
				if match(ls_postcode,'-') then
					li_pos = pos(ls_postcode,'-')
					ls_postcode = replace(ls_postcode,li_pos,1,'')
				end if
				if match(ls_postcode,' ') then
					li_pos = pos(ls_postcode,' ')
					ls_postcode = replace(ls_postcode,li_pos,1,'')
				end if
				if match(ls_homephne,'(') then
					li_pos = pos(ls_homephne,'(')
					ls_homephne = replace(ls_homephne,li_pos,1,'')
				end if
				if match(ls_homephne,')') then
					li_pos = pos(ls_homephne,')')
					ls_homephne = replace(ls_homephne,li_pos,1,'')
				end if
				if match(ls_homephne,'-') then
					li_pos = pos(ls_homephne,'-')
					ls_homephne = trim(replace(ls_homephne,li_pos,1,''))
				end if
				if match(ls_workphne,'(') then
					li_pos = pos(ls_workphne,'(')
					ls_workphne = replace(ls_workphne,li_pos,1,'')
				end if
				if match(ls_workphne,')') then
					li_pos = pos(ls_workphne,')')
					ls_workphne = replace(ls_workphne,li_pos,1,'')
				end if
				if match(ls_workphne,'-') then
					li_pos = pos(ls_workphne,'-')
					ls_workphne = trim(replace(ls_workphne,li_pos,1,''))
				end if
				li_pos = pos(ls_resname,',')
				ls_nom = trim(left(ls_resname,li_pos - 1))
				if isnull(ls_nom) then ls_nom = ''
				ls_prenom = trim(mid(ls_resname,li_pos + 1))
				choose case trim(ls_relation)
					case 'Aunt'
						ls_resptype = 't'
						li_pat = 0
					case 'Daughter'
						ls_resptype = 'a'
						li_pat = 0
					case 'Father'
						ls_resptype = 'p'
						li_pat = 0
					case 'Father-in-'
						ls_resptype = 'bp'
						li_pat = 0
					case 'Grandmothe'
						ls_resptype = 'gm'
						li_pat = 0
					case 'Mother'
						ls_resptype = 'm'
						li_pat = 0
					case 'Mother-in-'
						ls_resptype = 'm'
						li_pat = 0	
					case 'grand-mère'
						ls_resptype = 'gm'
						li_pat = 0
					case 'mère'
						ls_resptype = 'm'
						li_pat = 0
					case 'père'
						ls_resptype = 'm'
						li_pat = 0
					case else
						ls_resptype = 'a'
						li_pat = 0
				end choose
				select count(*) into :li_pos from patient where patient_id = :ll_id;
				if li_pos > 0 then
					insert into t_contact(ortho_id,patient_id,nom,prenom,adresse,ville,zip,telres,telbur,province,langue,resptype,pat,email)
					values(1,:ll_id,:ls_nom,:ls_prenom,:ls_address,:ls_town,:ls_postcode,:ls_homephne,:ls_workphne,'QC','an',:ls_resptype,:li_pat,:ls_rporder);
					if (SQLCA.sqlCode <> 0) then
						messagebox('ERROR', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText)
						exit 
					end if
				end if
			end if
			
			st_count.text = string(i) + "/" + string(ll_nbligne)
			i++
			
			FETCH rpty into :ls_patnumr, 
								 :ls_address, 
								 :ls_town, 
								 :ls_postcode, 
								 :ls_homephne, 
								 :ls_workphne, 
								 :ls_resname, 
								 :ls_relation,
							 	 :ls_rporder;
		LOOP
	
	CLOSE rpty;
end event

type cb_11 from commandbutton within w_migrationorthocom
integer x = 1888
integer y = 1100
integer width = 768
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration des patients"
end type

event clicked;string ls_patnum, ls_adresse, ls_town, ls_postcode,ls_recu
string ls_hometel, ls_worktel, ls_sex, ls_birthdate
string ls_inscov, ls_socins, ls_patname, ls_status,ls_datesyst
string ls_modelno, ls_langue, ls_ext, ls_email, ls_fax,ls_patid
string ls_jour, ls_mois, ls_annee, ls_nom, ls_prenom,ls_refd
long ll_patid, ll_pos,  ll_idcont, ll_nbligne, i,ll_idpatstatus
date ldt_birth,ldt_opendoss

SELECT count(*) into :ll_nbligne FROM patmast using bdorthocom;
i  = 1

setPointer(hourglass!)
DECLARE listpat CURSOR FOR

	SELECT patnumr,
			 birtdate,
			 mobphone
		FROM patmast using bdorthocom;
		
	OPEN listpat;
	
	FETCH listpat INTO :ls_patnum, 
							 :ls_birthdate,
							 :ls_hometel;
			
								 
	DO WHILE bdorthocom.SQLCODE = 0

		ll_patid = long(ls_patnum)
		ls_hometel = trim(ls_hometel)
		ls_hometel = replace(ls_hometel,1,1,"")
		ls_hometel = replace(ls_hometel,4,1,"")
		ls_hometel = replace(ls_hometel,7,1,"")
		ls_annee = left(ls_birthdate,4)
		ls_jour = right(ls_birthdate,2)
		ls_mois = mid(ls_birthdate,5,2)
		ldt_birth = date(long(ls_annee), long(ls_mois),long(ls_jour))
		ls_patid = string(ll_patid)
		
		update patient set telcell =  :ls_hometel, date_naissance = :ldt_birth where patient_id = :ll_patid;
		if SQLCA.SqlCode <> 0 then
			messagebox("Avertissement",sqlca.sqlerrtext)
		end if
			
		st_count.text = string(i) + '/' + string(ll_nbligne)
		i++
		
		
		FETCH listpat INTO :ls_patnum, 
							 :ls_birthdate,
							 :ls_hometel;
		
	LOOP
			
CLOSE listpat;
commit using SQLCA;
//update patient set patient_id = test;
//commit using SQLCA;
//

//SELECT count(*) into :ll_nbligne FROM patient;
//i = 1
//
//DECLARE listpat2 CURSOR FOR
//
//	SELECT patient_id,
//			 patient_nom,
//			 patient_prenom,
//	       adresse,
//			 ville,
//			 code_postale,
//			 tel_maison,
//			 tel_bureau,
//			 sex,
//			 date_naissance,
//			 langue,
//			 text1,
//			 email
//		FROM patient;
//		
//	OPEN listpat2;
//	
//	FETCH listpat2 INTO :ll_patid, 
//							 :ls_nom, 
//							 :ls_prenom,
//							 :ls_adresse,
//							 :ls_town,
//							 :ls_postcode,
//							 :ls_hometel,
//							 :ls_worktel, 
//							 :ls_sex, 
//							 :ldt_birth,
//							 :ls_langue, 
//							 :ls_ext,
//							 :ls_email;
//			
//								 
//	DO WHILE SQLCA.SQLCODE = 0
//		
//		insert into t_contact(patient_id,adresse,ville,zip,telres,telbur,sex,date_naissance,prenom,nom,langue,telext,email,ortho_id,province) 
//		values(:ll_patid, :ls_adresse, :ls_town, :ls_postcode,:ls_hometel,:ls_worktel,:ls_sex, :ldt_birth, :ls_prenom, :ls_nom,:ls_langue,:ls_ext,:ls_email,1,'QC');
//		if SQLCA.SqlCode <> 0 then
//			messagebox("Avertissement",sqlca.sqlerrtext)
//		end if
//		
//		st_count.text = string(i) + '/' + string(ll_nbligne)
//		i++
//		
//		FETCH listpat2 INTO :ll_patid,
//							 :ls_nom, 
//							 :ls_prenom,
//							 :ls_adresse,
//							 :ls_town,
//							 :ls_postcode,
//							 :ls_hometel,
//							 :ls_worktel, 
//							 :ls_sex, 
//							 :ldt_birth,
//							 :ls_langue, 
//							 :ls_ext,
//							 :ls_email;
//		
//	LOOP
//			
//CLOSE listpat2;
//commit using SQLCA;
//
//update t_contact set pat = 1;
//if SQLCA.SqlCode <> 0 then
//	commit using SQLCA;
//	messagebox("Avertissement",sqlca.sqlerrtext)
//else
//	rollback using SQLCA;
//end if
//update patient set id_contact = (select t_contact.id_contact from t_contact where t_contact.patient_id = patient.patient_id );
//if SQLCA.SqlCode <> 0 then
//	commit using SQLCA;
//	messagebox("Avertissement",sqlca.sqlerrtext)
//else
//	rollback using SQLCA;
//end if
end event

type cb_12 from commandbutton within w_migrationorthocom
integer x = 2213
integer y = 700
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;long ll_id, ll_nbligne, i
integer li_pos
string ls_dentnumr, ls_daddress, ls_dtown, ls_dpost, ls_dentphne, ls_dentname, ls_dentphn2, ls_dsex, ls_daddress2
string ls_nom,ls_prenom


setPointer(hourglass!)
//delete from t_dentists;

SELECT count(*) into :ll_nbligne from dentmast;
i = 1

DECLARE dentmast CURSOR FOR

	SELECT dentnumr,
	       daddress,
			 daddress2
	FROM dentmast
	ORDER BY dentnumr ASC using bdorthocom;
	
	OPEN dentmast;
	
		FETCH dentmast into :ls_dentnumr, 
								  :ls_daddress, 
								  :ls_daddress2;
								 
		DO WHILE bdorthocom.SQLCode = 0
			
			if isnull(ls_dentnumr) = false then
				
				ll_id = long(ls_dentnumr)	
				if isnull(ls_daddress) then ls_daddress = ""
				if isnull(ls_daddress2) then ls_daddress2 = ""
				ls_daddress = ls_daddress + ' ' + ls_daddress2
				
				update t_dentists set det_add = :ls_daddress where id_dentist = :ll_id;
				update t_referents set ref_adresse = :ls_daddress where id = :ll_id;
	
				if (SQLCA.sqlCode <> 0) then
					messagebox('ERROR', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText)
					exit
				end if
			end if
			
			st_count.text = string(i) + "/" + string(ll_nbligne)
			i++
			
			FETCH dentmast into :ls_dentnumr, 
								  :ls_daddress, 
								  :ls_daddress2;
		LOOP
	
	CLOSE dentmast;
	update t_dentists set id_dentist = test;
	commit;
end event

type cb_10 from commandbutton within w_migrationorthocom
integer x = 978
integer y = 524
integer width = 768
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "MIgration facture"
end type

event clicked;dec ld_montant, ld_montorg, ld_totfact, ld_balprem, ld_repetfee, ld_lperfee, ld_montdiff
dec ld_totfactmens
string ls_trantype, ls_phase, ls_chgdate, ls_cheqnbr, ls_patnumold, ls_phaseold
string ls_patnum, ls_mod, ls_jour, ls_mois, ls_annee, ls_acte,ls_rpty
long ll_patnum, ll_patnumold = 0, ll_phaseold = 0, ll_statusid, ll_nbmens
long ll_phase, ll_traitid, ll_idcont, ll_nocheque, ll_nbligne, i, j,ll_idcontact
date ldt_date, ldt_datefact
integer li_jour, li_mois, li_annee

setpointer(hourglass!)

SELECT count(*) into :ll_nbligne FROM tranrec using bdorthocom;
j = 1

DECLARE listtrans CURSOR FOR

	SELECT amount,
	       trantype,
			 aphase,
			 chgdate,
			 cheqnbr,
			 patnumr,
			 ptype,
			 servcode,
			 rpty
	FROM tranrec
	ORDER BY patnumr ASC, aphase ASC, chgdate ASC using bdorthocom;
	
OPEN listtrans;
	
FETCH listtrans into :ld_montant,
							:ls_trantype,
							:ls_phase, 
							:ls_chgdate, 
							:ls_cheqnbr,
							:ls_patnum,
							:ls_mod,
							:ls_acte,
							:ls_rpty;
							
	
DO WHILE bdorthocom.SQLCode = 0
	
	ls_jour = right(ls_chgdate,2)
	ls_mois = mid(ls_chgdate,5,2)
	ls_annee = left(ls_chgdate,4)
	ll_phase = long(ls_phase)
	ll_patnum = long(ls_patnum)
	ls_rpty = replace(ls_rpty,1,1,'000')
	select id_contact into :ll_idcontact from t_contact where patient_id = :ll_patnum and pat = 1;
	
	ldt_date = date(ls_jour + '-' + ls_mois + '-' + ls_annee)
	
	setnull(ll_traitid)
	select traitement_id into :ll_traitid 
	from traitements 
	where phase = :ll_phase and patient_id = :ll_patnum; 
	
	if isnull(ll_traitid) then	
		select feequote - confee into :ld_montorg from patstat where patnumr = :ls_patnum and curphase = :ls_phase using bdorthocom;
		insert into traitements(patient_id,phase,debut_traitement,montant_original) 
		values(:ll_patnum,:ll_phase,:ldt_date,:ld_montorg);
		error_type(-1)
		select max(traitement_id) into :ll_traitid from traitements; 
	end if
		
	if LEFT(ls_trantype,1) = 'C' then
		
		CHOOSE CASE ls_acte
			CASE 'CHG'
				ll_statusid = 44
			CASE 'CMO'
				ll_statusid = 45
			CASE 'CNS'
				ll_statusid = 46
			CASE 'CRF'
				ll_statusid = 47
			CASE 'CRV'
				ll_statusid = 48
			CASE 'CWO'
				ll_statusid = 49
			CASE ELSE
				ll_statusid = 1
		END CHOOSE
				
		insert into factures_traitements(affect,cache,date_facture,imp,montant,status_id,traitement_id,id_contact)
		values(1,0,:ldt_date,1,:ld_montant,:ll_statusid,:ll_traitid,:ll_idcontact);
		error_type(-1)
		ldt_datefact = ldt_date
		
	end if
				
	st_count.text = string(j) + '/' + string(ll_nbligne)
	j++
	
	FETCH listtrans into :ld_montant,
							:ls_trantype,
							:ls_phase, 
							:ls_chgdate, 
							:ls_cheqnbr,
							:ls_patnum,
							:ls_mod,
							:ls_acte,
							:ls_rpty;
								
				
lOOP
CLOSE listtrans;

/*
		
// OPTION DU FUTUR DEBUT

	select sum(montant) into :ld_totfact from factures_traitements where traitement_id = :ll_traitid and status_id <> 2;
	if ld_montorg <> ld_totfact then
		select balprem,repetfee, lperfee into :ld_balprem, :ld_repetfee, :ld_lperfee FROM patstat where patnumr = :ls_patnum and curphase = :ls_phase using bdorthocom;
		if ld_repetfee <> 0 then
			select sum(montant) into :ld_totfactmens from factures_traitements where traitement_id = :ll_traitid and status_id = 1;
			ld_montdiff = ld_balprem - ld_totfactmens
			ll_nbmens = int(ld_montdiff / ld_repetfee)
			for i = 1 to  ll_nbmens
				li_jour = day(ldt_datefact)
				li_mois = month(ldt_datefact)
				li_annee = year(ldt_datefact)
				li_mois = li_mois + 1
				if li_mois > 12 then
					li_mois = 1
					li_annee = li_annee + 1
				end if
				li_jour = correction_jour(li_jour,li_mois,li_annee)
				ldt_datefact = date(li_annee,li_mois,li_jour)
			 
				// insérer la facture
			
				insert into factures_traitements(affect,cache,date_facture,imp,montant,status_id,traitement_id,id_contact)
				values(1,0,:ldt_datefact,1,:ld_repetfee,1,:ll_traitid,:ll_idcontact);
				error_type(-1)	 
			next
		 
		 // On ajoute la dernière mensualité s'il en a une
		 
			if ld_lperfee > 0 and ld_lperfee <> ld_repetfee then
				li_jour = day(ldt_datefact)
				li_mois = month(ldt_datefact)
				li_annee = year(ldt_datefact)
				li_mois = li_mois + 1
				if li_mois > 12 then
					li_mois = 1
					li_annee = li_annee + 1
				end if
				li_jour = correction_jour(li_jour,li_mois,li_annee)
				ldt_datefact = date(li_annee,li_mois,li_jour)
			 
			 // Insérer facture
			 
				insert into factures_traitements(affect,cache,date_facture,imp,montant,status_id,traitement_id,id_contact)
				values(1,0,:ldt_datefact,1,:ld_lperfee,1,:ll_traitid,:ll_idcontact);
				error_type(-1)
			 
			end if
		end if
	end if

	// OPTION DU FUTUR FIN
	
	*/

end event

type cb_9 from commandbutton within w_migrationorthocom
integer x = 32
integer y = 1256
integer width = 768
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rendez-vous"
end type

event clicked;long ll_step, ll_length, ll_year, ll_month, ll_day, ll_patid, ll_col, ll_duree
long ll_traitid
string ls_patnumr, ls_apptdate, ls_apptcode, ls_chair, ls_status, ls_appttime24
date ldt_rdvdate
time lt_rdvheure

select hor_step into :ll_step from t_options where ortho_id = :v_no_ortho;

setPointer(hourglass!)

DECLARE listrdv CURSOR FOR
	SELECT patnumr,
			 apptdate,
			 apptcode,
			 length,
			 chair,
			 status,
			 appttime24
	FROM   appt  using bdorthocom;
	
OPEN listrdv;

FETCH listrdv INTO   :ls_patnumr,
							:ls_apptdate,
							:ls_apptcode,
							:ll_length,
							:ls_chair,
							:ls_status,
							:ls_appttime24;

DO WHILE bdorthocom.SQLCode = 0
	
	ll_year = long(left(ls_apptdate,4))
	ll_month = long(mid(ls_apptdate,5,2))
	ll_day = long(right(ls_apptdate,2))
	ldt_rdvdate = date(ll_year,ll_month,ll_day)
	
	if ldt_rdvdate >= today()  then
	
		ll_patid = long(ls_patnumr)
		lt_rdvheure = time(ls_appttime24)
		CHOOSE CASE ls_apptcode
			CASE '3X3'
				ll_traitid = 11
			CASE 'A/W'
				ll_traitid = 5
			CASE 'ADJ'
				ll_traitid = 6
			CASE 'B/B'
				ll_traitid = 19
			CASE 'BAN'
				ll_traitid = 12
			CASE 'BON'
				ll_traitid = 4
			CASE 'CON'
				ll_traitid = 2
			CASE 'CP'
				ll_traitid = 16
			CASE 'DEB'
				ll_traitid = 3
			CASE 'DEL'
				ll_traitid = 14
			CASE 'ELS'
				ll_traitid = 20
			CASE 'EMG'
				ll_traitid = 17
			CASE 'H/G'
				ll_traitid = 21
			CASE 'IMP'
				ll_traitid = 15
			CASE 'LLA'
				ll_traitid = 22
			CASE 'MAR'
				ll_traitid = 23
			CASE 'PAN'
				ll_traitid = 24
			CASE 'POS'
				ll_traitid = 28
			CASE 'PRO'
				ll_traitid = 25
			CASE 'RCL'
				ll_traitid = 8
			CASE 'REC'
				ll_traitid = 7
			CASE 'RET'
				ll_traitid = 10
			CASE 'RPE'
				ll_traitid = 26
			CASE 'SEP'
				ll_traitid = 27
			CASE '~~~~~~'
				ll_traitid = 1
			CASE ELSE
				ll_traitid = 1
		END CHOOSE
		
		insert into appt(patnumr,apptdate,apptcode,appttime24,id_trait)
		values(:ll_patid,:ldt_rdvdate,:ls_apptcode,:lt_rdvheure,:ll_traitid);
		error_type(-1)
		
	end if
	
	
	
	FETCH listrdv INTO   :ls_patnumr,
							:ls_apptdate,
							:ls_apptcode,
							:ll_length,
							:ls_chair,
							:ls_status,
							:ls_appttime24;
	
LOOP

CLOSE listrdv;
end event

type cb_8 from commandbutton within w_migrationorthocom
integer x = 1138
integer y = 132
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;string ls_patnum,ls_apptdate, ls_apptcode
long i, ll_patid, ll_nbligne, ll_traitid, ll_year, ll_month, ll_day
integer li_duree
date ldt_rdvdate

SELECT count(*) into :ll_nbligne FROM patmast using bdorthocom;
i = 1

setPointer(hourglass!)
DECLARE listpat CURSOR FOR

	SELECT patnumr,
			 recldate,
			 pattype
		FROM patmast using bdorthocom;
		
	OPEN listpat;
	
	FETCH listpat INTO :ls_patnum,
							 :ls_apptdate,
							 :ls_apptcode;

	DO WHILE bdorthocom.SQLCODE = 0
		ll_patid = long(ls_patnum)
		CHOOSE CASE ls_apptcode
			CASE 'CON'
				ll_traitid = 2
			CASE 'RC'
				ll_traitid = 3
			CASE 'EVA'
				ll_traitid = 4
			CASE 'REC'
				ll_traitid = 5
			CASE 'PC'
				ll_traitid = 6
			CASE 'MB1'
				ll_traitid = 7
			CASE 'MB'
				ll_traitid = 8
			CASE 'EM'
				ll_traitid = 17
			CASE 'DB'
				ll_traitid = 10
			CASE 'APC'
				ll_traitid = 11
			CASE 'FR'
				ll_traitid = 12
			CASE 'RET'
				ll_traitid = 13
			CASE 'SEP'
				ll_traitid = 14
			CASE 'URG'
				ll_traitid = 15
			CASE 'FIL'
				ll_traitid = 16
			CASE ELSE
				ll_traitid = 9
		END CHOOSE
		ll_year = long(left(ls_apptdate,4))
		ll_month = long(mid(ls_apptdate,5,2))
		ll_day = long(right(ls_apptdate,2))
		ldt_rdvdate = date(ll_year,ll_month,ll_day)
		select duree into :li_duree from type_de_traitement where type_traitement_id = :ll_traitid;
		if isnull(ls_apptdate) = false and len(ls_apptdate) > 0 and ldt_rdvdate > date('17-10-2005') then
			insert into rendezvous(prochain_rv,patient_id,no_ortho,ortho_id,duree,date_vue,id_raptrait,type_traitement_id)
			values(:ldt_rdvdate,:ll_patid,1,1,:li_duree,today(),1,:ll_traitid);
			if SQLCA.SqlCode <> 0 then
				messagebox("Avertissement",sqlca.sqlerrtext)
			end if	
		end if
		
		st_count.text = string(i) + '/' + string(ll_nbligne)
		i++
		
		FETCH listpat INTO :ls_patnum, 
							 	 :ls_apptdate,
							 	 :ls_apptcode;
		
	LOOP
			
CLOSE listpat;
end event

type cb_6 from commandbutton within w_migrationorthocom
integer x = 32
integer y = 952
integer width = 768
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rendez-vous"
end type

event clicked;long ll_step, ll_length, ll_year, ll_month, ll_day, ll_patid, ll_col, ll_duree
long ll_traitid
string ls_patnumr, ls_apptdate, ls_apptcode, ls_chair, ls_status, ls_appttime24
date ldt_rdvdate
time lt_rdvheure

select hor_step into :ll_step from t_options where ortho_id = :v_no_ortho;

setPointer(hourglass!)

DECLARE listrdv CURSOR FOR
	SELECT patnumr,
			 apptdate,
			 apptcode,
			 length,
			 chair,
			 status,
			 appttime24
	FROM   appt  using bdorthocom;
	
OPEN listrdv;

FETCH listrdv INTO   :ls_patnumr,
							:ls_apptdate,
							:ls_apptcode,
							:ll_length,
							:ls_chair,
							:ls_status,
							:ls_appttime24;

DO WHILE bdorthocom.SQLCode = 0
	
	ll_year = long(left(ls_apptdate,4))
	ll_month = long(mid(ls_apptdate,5,2))
	ll_day = long(right(ls_apptdate,2))
	ldt_rdvdate = date(ll_year,ll_month,ll_day)
	
//	if ldt_rdvdate >= today()  then
	
		ll_patid = long(ls_patnumr)
		ll_col = long(ls_chair)
		ll_duree = ll_length / ll_step
		lt_rdvheure = time(ls_appttime24)
		CHOOSE CASE ls_apptcode
			CASE 'ADJ'
				ll_traitid = 2
			CASE 'AJF'
				ll_traitid = 3
			CASE 'APC'
				ll_traitid = 4
			CASE 'APL'
				ll_traitid = 5
			CASE 'APP'
				ll_traitid = 6
			CASE 'BAN'
				ll_traitid = 7
			CASE 'BON'
				ll_traitid = 8
			CASE 'C&A'
				ll_traitid = 9
			CASE 'CAS'
				ll_traitid = 10
			CASE 'CHK'
				ll_traitid = 11
			CASE 'CHY'
				ll_traitid = 12
			CASE 'COQ'
				ll_traitid = 13
			CASE 'CQH'
				ll_traitid = 14
			CASE 'DEB'
				ll_traitid = 15
			CASE 'DOC'
				ll_traitid = 16
			CASE 'DVP'
				ll_traitid = 17
			CASE 'EMG'
				ll_traitid = 18
			CASE 'FIN'
				ll_traitid = 19
			CASE 'FIX'
				ll_traitid = 20
			CASE 'IMP'
				ll_traitid = 21
			CASE 'LLA'
				ll_traitid = 22
			CASE 'NPX'
				ll_traitid = 23
			CASE 'PAN'
				ll_traitid = 24
			CASE 'QH'
				ll_traitid = 25
			CASE 'RCL'
				ll_traitid = 26
			CASE 'REP'
				ll_traitid = 27
			CASE 'RET'
				ll_traitid = 28
			CASE 'RPE'
				ll_traitid = 29
			CASE 'SEP'
				ll_traitid = 30
			CASE 'VIS'
				ll_traitid = 31
			CASE ELSE
				ll_traitid = 1
		END CHOOSE
		
		insert into t_rdv(patient_id,rdvdate,typetraitid,duree,colonne,rdvetat,rdvheure)
		values(:ll_patid,:ldt_rdvdate,:ll_traitid,:ll_duree,:ll_col,:ls_status,:lt_rdvheure);
		error_type(-1)
		
//	end if
	
	
	
	FETCH listrdv INTO   :ls_patnumr,
							:ls_apptdate,
							:ls_apptcode,
							:ll_length,
							:ls_chair,
							:ls_status,
							:ls_appttime24;
	
LOOP

CLOSE listrdv;
end event

type cb_7 from commandbutton within w_migrationorthocom
integer x = 3209
integer y = 1892
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type cb_5 from commandbutton within w_migrationorthocom
integer x = 32
integer y = 256
integer width = 768
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "MIgration dossier financier"
end type

event clicked;dec ld_montant, ld_montorg, ld_totfact, ld_balprem, ld_repetfee, ld_lperfee, ld_montdiff
dec ld_totfactmens
string ls_trantype, ls_phase, ls_chgdate, ls_cheqnbr, ls_patnumold, ls_phaseold
string ls_patnum, ls_mod, ls_jour, ls_mois, ls_annee, ls_acte,ls_rpty
long ll_patnum, ll_patnumold = 0, ll_phaseold = 0, ll_statusid, ll_nbmens
long ll_phase, ll_traitid, ll_idcont, ll_nocheque, ll_nbligne, i, j,ll_idcontact
date ldt_date, ldt_datefact
integer li_jour, li_mois, li_annee

setpointer(hourglass!)

SELECT count(*) into :ll_nbligne FROM tranrec using bdorthocom;
j = 1

DECLARE listtrans CURSOR FOR

	SELECT amount,
	       trantype,
			 aphase,
			 chgdate,
			 cheqnbr,
			 patnumr,
			 ptype,
			 servcode,
			 rpty
	FROM tranrec
	ORDER BY patnumr ASC, aphase ASC, chgdate ASC using bdorthocom;
	
OPEN listtrans;
	
FETCH listtrans into :ld_montant,
							:ls_trantype,
							:ls_phase, 
							:ls_chgdate, 
							:ls_cheqnbr,
							:ls_patnum,
							:ls_mod,
							:ls_acte,
							:ls_rpty;
							
	
DO WHILE bdorthocom.SQLCode = 0
	
	ls_jour = right(ls_chgdate,2)
	ls_mois = mid(ls_chgdate,5,2)
	ls_annee = left(ls_chgdate,4)
	ll_phase = long(ls_phase)
	ll_patnum = long(ls_patnum)
	ls_rpty = replace(ls_rpty,1,1,'000')
	select id_contact into :ll_idcontact from t_contact where patient_id = :ll_patnum and pat = 1;
	
	ldt_date = date(long(ls_annee),long(ls_mois),long(ls_jour))
	if ll_phase <> ll_phaseold or ll_patnum <> ll_patnumold then	
		
		/*
		// OPTION DU FUTUR DEBUT
		
			select sum(montant) into :ld_totfact from factures_traitements where traitement_id = :ll_traitid and status_id <> 2;
			if ld_montorg <> ld_totfact then
				select balprem,repetfee, lperfee into :ld_balprem, :ld_repetfee, :ld_lperfee FROM patstat where patnumr = :ls_patnumold and curphase = :ls_phaseold using bdorthocom;
				if ld_repetfee <> 0 then
					select sum(montant) into :ld_totfactmens from factures_traitements where traitement_id = :ll_traitid and status_id = 1;
					ld_montdiff = ld_balprem - ld_totfactmens
					ll_nbmens = int(ld_montdiff / ld_repetfee)
					for i = 1 to  ll_nbmens
						li_jour = day(ldt_datefact)
						li_mois = month(ldt_datefact)
						li_annee = year(ldt_datefact)
						li_mois = li_mois + 1
						if li_mois > 12 then
							li_mois = 1
							li_annee = li_annee + 1
						end if
						li_jour = correction_jour(li_jour,li_mois,li_annee)
						ldt_datefact = date(li_annee,li_mois,li_jour)
						// insérer la facture
						
						insert into factures_traitements(affect,cache,date_facture,imp,montant,status_id,traitement_id,id_contact)
						values(1,0,:ldt_datefact,1,:ld_repetfee,1,:ll_traitid,:ll_idcontact);
						error_type(-1)	 
					next
				 
				 // On ajoute la dernière mensualité s'il en a une
				 
					if ld_lperfee > 0 and ld_lperfee <> ld_repetfee then
						li_jour = day(ldt_datefact)
						li_mois = month(ldt_datefact)
						li_annee = year(ldt_datefact)
						li_mois = li_mois + 1
						if li_mois > 12 then
							li_mois = 1
							li_annee = li_annee + 1
						end if
						li_jour = correction_jour(li_jour,li_mois,li_annee)
						ldt_datefact = date(li_annee,li_mois,li_jour)
					 
					 // Insérer facture
					 
						insert into factures_traitements(affect,cache,date_facture,imp,montant,status_id,traitement_id,id_contact)
						values(1,0,:ldt_datefact,1,:ld_lperfee,1,:ll_traitid,:ll_idcontact);
						error_type(-1)
					 
					end if
				end if
			end if
		
			// OPTION DU FUTUR FIN */
		
			ll_patnumold = ll_patnum
			ll_phaseold = ll_phase
			ls_patnumold = ls_patnum
			ls_phaseold = ls_phase
			select feequote - confee into :ld_montorg from patstat where patnumr = :ls_patnum and curphase = :ls_phase using bdorthocom;
			insert into traitements(patient_id,phase,debut_traitement,montant_original) 
			values(:ll_patnum,:ll_phase,:ldt_date,:ld_montorg);
			error_type(-1)
		end if
		select max(traitement_id) into :ll_traitid from traitements; 
		if LEFT(ls_trantype,1) = 'C' then
			CHOOSE CASE ls_acte
				CASE 'APP'
					ll_statusid = 2
				CASE 'CON'
					ll_statusid = 3
				CASE 'LAB'
					ll_statusid = 4
				CASE 'MON'
					ll_statusid = 5
				CASE 'MSC'
					ll_statusid = 6
				CASE 'REC'
					ll_statusid = 7
				CASE 'RET'
					ll_statusid = 8
				CASE 'SVC'
					ll_statusid = 9
				CASE 'XRR'
					ll_statusid = 10
				CASE 'XRY'
					ll_statusid = 11
				CASE ELSE
					ll_statusid = 12
			END CHOOSE
					
			insert into factures_traitements(affect,cache,date_facture,imp,montant,status_id,traitement_id,id_contact)
			values(1,0,:ldt_date,1,:ld_montant,:ll_statusid,:ll_traitid,:ll_idcontact);
			error_type(-1)
			ldt_datefact = ldt_date
		else
			CHOOSE CASE ls_mod
				CASE '$'
					ls_mod = '$'
				CASE 'D'
					ls_mod = 'PD'
				CASE 'C'
					ls_mod = 'C'
				CASE 'M'
					ls_mod = 'MC'
				CASE 'V'
					ls_mod = 'Visa'
				CASE 'A'
					ls_mod = 'AmEx'
				CASE ELSE
					ls_mod = '$'
			END CHOOSE
			ll_nocheque = long(ls_cheqnbr)
			ld_montant = ld_montant * -1
//			select id_contact into :ll_idcont from t_contact where patient_id = :ll_patnum;
			insert into paiement(affect,cache,date_paiement,imp,montant_recu,nocheque,traitement_patient_id,paiement,id_contact)
			values(1,0,:ldt_date,1,:ld_montant,:ll_nocheque,:ll_traitid,:ls_mod,:ll_idcontact);
			error_type(-1)
		end if
		
		st_count.text = string(j) + '/' + string(ll_nbligne)
		j++
		
		FETCH listtrans into :ld_montant,
								:ls_trantype,
								:ls_phase, 
								:ls_chgdate, 
								:ls_cheqnbr,
								:ls_patnum,
								:ls_mod,
								:ls_acte,
								:ls_rpty;
								
				
lOOP
CLOSE listtrans;

/*
		
// OPTION DU FUTUR DEBUT

	select sum(montant) into :ld_totfact from factures_traitements where traitement_id = :ll_traitid and status_id <> 2;
	if ld_montorg <> ld_totfact then
		select balprem,repetfee, lperfee into :ld_balprem, :ld_repetfee, :ld_lperfee FROM patstat where patnumr = :ls_patnum and curphase = :ls_phase using bdorthocom;
		if ld_repetfee <> 0 then
			select sum(montant) into :ld_totfactmens from factures_traitements where traitement_id = :ll_traitid and status_id = 1;
			ld_montdiff = ld_balprem - ld_totfactmens
			ll_nbmens = int(ld_montdiff / ld_repetfee)
			for i = 1 to  ll_nbmens
				li_jour = day(ldt_datefact)
				li_mois = month(ldt_datefact)
				li_annee = year(ldt_datefact)
				li_mois = li_mois + 1
				if li_mois > 12 then
					li_mois = 1
					li_annee = li_annee + 1
				end if
				li_jour = correction_jour(li_jour,li_mois,li_annee)
				ldt_datefact = date(li_annee,li_mois,li_jour)
			 
				// insérer la facture
			
				insert into factures_traitements(affect,cache,date_facture,imp,montant,status_id,traitement_id,id_contact)
				values(1,0,:ldt_datefact,1,:ld_repetfee,1,:ll_traitid,:ll_idcontact);
				error_type(-1)	 
			next
		 
		 // On ajoute la dernière mensualité s'il en a une
		 
			if ld_lperfee > 0 and ld_lperfee <> ld_repetfee then
				li_jour = day(ldt_datefact)
				li_mois = month(ldt_datefact)
				li_annee = year(ldt_datefact)
				li_mois = li_mois + 1
				if li_mois > 12 then
					li_mois = 1
					li_annee = li_annee + 1
				end if
				li_jour = correction_jour(li_jour,li_mois,li_annee)
				ldt_datefact = date(li_annee,li_mois,li_jour)
			 
			 // Insérer facture
			 
				insert into factures_traitements(affect,cache,date_facture,imp,montant,status_id,traitement_id,id_contact)
				values(1,0,:ldt_datefact,1,:ld_lperfee,1,:ll_traitid,:ll_idcontact);
				error_type(-1)
			 
			end if
		end if
	end if

	// OPTION DU FUTUR FIN
	
	*/

end event

type st_count from statictext within w_migrationorthocom
integer x = 439
integer y = 1972
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_1 from statictext within w_migrationorthocom
integer x = 18
integer y = 1972
integer width = 411
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Avancement:"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_migrationorthocom
integer x = 32
integer y = 704
integer width = 768
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Lier Ref / Dent"
end type

event clicked;string ls_dent, ls_pat
long ll_dent, ll_pat

DECLARE listpat cursor for
   
	select dentnumr,
	       patnumr
	from patmast using bdorthocom;
	
OPEN listpat;

	FETCH listpat into :ls_dent,
	                   :ls_pat;
							 
	DO WHILE bdorthocom.sqlcode = 0
		
      ll_pat = long(ls_pat)
		ll_dent = long(ls_dent)
		update patient set referant_nom = :ll_dent, id_dentist = :ll_dent where patient_id = :ll_pat;
		
		FETCH listpat into :ls_dent,
	                   :ls_pat;
		
	LOOP
CLOSE listpat;
end event

type cb_3 from commandbutton within w_migrationorthocom
integer x = 32
integer y = 144
integer width = 768
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Responsable"
end type

event clicked;long ll_id, ll_nbligne, i
integer li_pos,li_pat
string ls_patnumr,ls_address,ls_town,ls_postcode,ls_homephne,ls_workphne,ls_resname,ls_relation
string ls_nom,ls_prenom,ls_resptype,ls_rporder
setPointer(hourglass!)
delete from t_contacts;

SELECT count(*) into :ll_nbligne FROM rpty using bdorthocom;
i = 1

DECLARE rpty CURSOR FOR

	SELECT patnumr,
	       address,
			 town,
			 postcode,
			 homephne,
			 workphne,
			 resname,
			 relation,
			 rporder
			 
	FROM rpty
	ORDER BY patnumr ASC using bdorthocom;
	
	OPEN rpty;
	
		FETCH rpty into :ls_patnumr, 
							 :ls_address, 
							 :ls_town, 
							 :ls_postcode, 
							 :ls_homephne, 
							 :ls_workphne, 
							 :ls_resname, 
							 :ls_relation,
							 :ls_rporder;
								 
		DO WHILE bdorthocom.SQLCode = 0
			
			if isnull(ls_patnumr) = false then
				ll_id = long(ls_patnumr)
				li_pos = pos(ls_town,',')
				if li_pos > 0 then
					ls_town = left(ls_town,li_pos - 1)
				end if
				if match(ls_postcode,'-') then
					li_pos = pos(ls_postcode,'-')
					ls_postcode = replace(ls_postcode,li_pos,1,'')
				end if
				if match(ls_postcode,' ') then
					li_pos = pos(ls_postcode,' ')
					ls_postcode = replace(ls_postcode,li_pos,1,'')
				end if
				if match(ls_homephne,'(') then
					li_pos = pos(ls_homephne,'(')
					ls_homephne = replace(ls_homephne,li_pos,1,'')
				end if
				if match(ls_homephne,')') then
					li_pos = pos(ls_homephne,')')
					ls_homephne = replace(ls_homephne,li_pos,1,'')
				end if
				if match(ls_homephne,'-') then
					li_pos = pos(ls_homephne,'-')
					ls_homephne = trim(replace(ls_homephne,li_pos,1,''))
				end if
				if match(ls_workphne,'(') then
					li_pos = pos(ls_workphne,'(')
					ls_workphne = replace(ls_workphne,li_pos,1,'')
				end if
				if match(ls_workphne,')') then
					li_pos = pos(ls_workphne,')')
					ls_workphne = replace(ls_workphne,li_pos,1,'')
				end if
				if match(ls_workphne,'-') then
					li_pos = pos(ls_workphne,'-')
					ls_workphne = trim(replace(ls_workphne,li_pos,1,''))
				end if
				li_pos = pos(ls_resname,',')
				ls_nom = trim(left(ls_resname,li_pos - 1))
				if isnull(ls_nom) then ls_nom = ''
				ls_prenom = trim(mid(ls_resname,li_pos + 1))
				choose case left(trim(ls_relation),1)
					case 'S'
						ls_resptype = 'pat'
						li_pat = 1
					case 'M'
						ls_resptype = 'm'
						li_pat = 0
					case 'P'
						ls_resptype = 'p'
						li_pat = 0
					case else
						ls_resptype = ''
						li_pat = 0
				end choose
				select count(*) into :li_pos from patient where patient_id = :ll_id;
				if li_pos > 0 then
					insert into t_contact(ortho_id,patient_id,nom,prenom,adresse,ville,zip,telres,telbur,province,langue,resptype,pat,email)
					values(1,:ll_id,:ls_nom,:ls_prenom,:ls_address,:ls_town,:ls_postcode,:ls_homephne,:ls_workphne,'QC','an',:ls_resptype,:li_pat,:ls_rporder);
					if (SQLCA.sqlCode <> 0) then
						messagebox('ERROR', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText)
						exit 
					end if
				end if
			end if
			
			st_count.text = string(i) + "/" + string(ll_nbligne)
			i++
			
			FETCH rpty into :ls_patnumr, 
								 :ls_address, 
								 :ls_town, 
								 :ls_postcode, 
								 :ls_homephne, 
								 :ls_workphne, 
								 :ls_resname, 
								 :ls_relation,
							 	 :ls_rporder;
		LOOP
	
	CLOSE rpty;
end event

type cb_2 from commandbutton within w_migrationorthocom
integer x = 32
integer y = 480
integer width = 768
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Dent / Ref"
end type

event clicked;long ll_id, ll_nbligne, i
integer li_pos
string ls_dentnumr, ls_daddress, ls_dtown, ls_dpost, ls_dentphne, ls_dentname, ls_dentphn2, ls_dsex, ls_daddress2
string ls_nom,ls_prenom


setPointer(hourglass!)
//delete from t_dentists;

SELECT count(*) into :ll_nbligne from dentmast;
i = 1

DECLARE dentmast CURSOR FOR

	SELECT dentnumr,
	       daddress,
			 dtown,
			 dpost,
			 dentphne,
			 dentname,
			 dentphn2,
			 dsex,
			 daddress2
	FROM dentmast
	ORDER BY dentnumr ASC using bdorthocom;
	
	OPEN dentmast;
	
		FETCH dentmast into :ls_dentnumr, 
								  :ls_daddress, 
								  :ls_dtown, 
								  :ls_dpost, 
								  :ls_dentphne, 
								  :ls_dentname, 
								  :ls_dentphn2, 
								  :ls_dsex, 
								  :ls_daddress2;
								 
		DO WHILE bdorthocom.SQLCode = 0
			
			if isnull(ls_dentnumr) = false then
				ll_id = long(ls_dentnumr)
				li_pos = pos(ls_dtown,',')
				if li_pos > 0 then
					ls_dtown = left(ls_dtown,li_pos - 1)
				end if
				ls_dtown = left(ls_dtown,15)
				ls_daddress = left(ls_daddress + ' ' + ls_daddress2,50)
				if match(ls_dpost,'-') then
					li_pos = pos(ls_dpost,'-')
					ls_dpost = replace(ls_dpost,li_pos,1,'')
				end if
				if match(ls_dpost,' ') then
					li_pos = pos(ls_dpost,' ')
					ls_dpost = replace(ls_dpost,li_pos,1,'')
				end if
				ls_dpost = left(ls_dpost,15)
				if match(ls_dentphne,'(') then
					li_pos = pos(ls_dentphne,'(')
					ls_dentphne = replace(ls_dentphne,li_pos,1,'')
				end if
				if match(ls_dentphne,')') then
					li_pos = pos(ls_dentphne,')')
					ls_dentphne = replace(ls_dentphne,li_pos,1,'')
				end if
				if match(ls_dentphne,'-') then
					li_pos = pos(ls_dentphne,'-')
					ls_dentphne = trim(replace(ls_dentphne,li_pos,1,''))
				end if
				if match(ls_dentphn2,'(') then
					li_pos = pos(ls_dentphn2,'(')
					ls_dentphn2 = replace(ls_dentphn2,li_pos,1,'')
				end if
				if match(ls_dentphn2,')') then
					li_pos = pos(ls_dentphn2,')')
					ls_dentphn2 = replace(ls_dentphn2,li_pos,1,'')
				end if
				if match(ls_dentphn2,'-') then
					li_pos = pos(ls_dentphn2,'-')
					ls_dentphn2 = trim(replace(ls_dentphn2,li_pos,1,''))
				end if
				li_pos = pos(ls_dentname,',')
				ls_nom = left(trim(left(ls_dentname,li_pos - 1)),25)
				ls_prenom = left(trim(mid(ls_dentname,li_pos + 1)),25)
				insert into t_dentists(id_dentist,det_add,det_ville,det_zip,det_telbur,det_nom,det_prenom,det_fax,det_sex,ortho_id,det_prov,det_langue,det_suf)
				values(:ll_id,:ls_daddress,:ls_dtown,:ls_dpost,:ls_dentphne,:ls_nom,:ls_prenom,:ls_dentphn2,:ls_dsex,1,'QC','an','Dr');
				insert into t_referents(id,ref_adresse,ref_ville,ref_zip,ref_tel_bur,ref_nom,ref_prenom,ref_tel_fax,ref_sexe,ortho_id,ref_province,ref_langue,ref_suffix) 
				values(:ll_id,:ls_daddress,:ls_dtown,:ls_dpost,:ls_dentphne,:ls_nom,:ls_prenom,:ls_dentphn2,:ls_dsex,1,'QC','an','Dr');
				if (SQLCA.sqlCode <> 0) then
					messagebox('ERROR', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText)
					exit
				end if
			end if
			
			st_count.text = string(i) + "/" + string(ll_nbligne)
			i++
			
			FETCH dentmast into :ls_dentnumr, 
								  :ls_daddress, 
								  :ls_dtown, 
								  :ls_dpost, 
								  :ls_dentphne, 
								  :ls_dentname, 
								  :ls_dentphn2, 
								  :ls_dsex, 
								  :ls_daddress2;
		LOOP
	
	CLOSE dentmast;
	update t_dentists set id_dentist = test;
	commit;
end event

type cb_1 from commandbutton within w_migrationorthocom
integer x = 32
integer y = 368
integer width = 768
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration chèque postdaté"
end type

event clicked;dec{2} ld_mont
string ls_date, ls_patnum, ls_jour, ls_mois, ls_annee,ls_rpty
date ldt_date
long ll_patid, ll_idcont, ll_traitid, ll_nbligne, i,ll_idcontact

setPointer(hourglass!)

SELECT count(*) into :ll_nbligne FROM cheqonhd using bdorthocom;

DECLARE listCPD CURSOR FOR

	SELECT amount,
	       cdate,
			 patnumr,
			 Rpty
	FROM cheqonhd
	ORDER BY cdate DESC using bdorthocom;
	
	OPEN listCPD;
	
		FETCH listCPD into :ld_mont,
		                   :ls_date,
								 :ls_patnum,
								 :ls_rpty;
								 
		DO WHILE bdorthocom.SQLCode = 0
			
			ll_patid = long(ls_patnum)
			ls_jour = right(ls_date,2)
			ls_mois = mid(ls_date,5,2)
			ls_annee = left(ls_date,4)
			ldt_date = date(long(ls_annee),long(ls_mois), long(ls_jour))
			ls_rpty = replace(ls_rpty,1,1,'000')
			select id_contact into :ll_idcontact from t_contact where patient_id = :ll_patid and email = :ls_rpty;
			select max(traitement_id) into :ll_traitid from traitements where patient_id = :ll_patid;
			if ldt_date > today() then
				insert into cheques_postdates(affect,date_cheque,id_contact,indicateur,modalite,paiement,traitement_patient_id)
				values(1,:ldt_date,:ll_idcontact,0,'P',:ld_mont,:ll_traitid);
			end if
			
			st_count.text = string(i) + "/" + string(ll_nbligne) 
			i++
			
			FETCH listCPD into :ld_mont,
									 :ls_date,
									 :ls_patnum,
									 :ls_rpty;
			
		LOOP
	
	CLOSE listCPD;
end event

type cb_migdossfin from commandbutton within w_migrationorthocom
integer x = 32
integer y = 828
integer width = 768
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Note dossier patient"
end type

event clicked;string ls_patnumr, ls_comm, ls_note, ls_date, ls_datemod
long ll_patnumr, ll_year, ll_month, ll_day
date ldt_date

DECLARE listnote CURSOR FOR
	SELECT patnumr, comm, rdate 
	FROM hcomm
	ORDER BY patnumr ASC using bdorthocom;
	
OPEN listnote;

FETCH listnote INTO :ls_patnumr,
						  :ls_comm,
						  :ls_date;
						  
DO WHILE bdorthocom.SQLCode = 0
	
	ll_patnumr = long(ls_patnumr)
	if isnull(ls_comm) then ls_comm = ""
	select note into :ls_note from patient where patient_id = :ll_patnumr;
	if isnull(ls_note) then ls_note = ""
	ll_year = long(left(ls_date,4))
	ll_month = long(mid(ls_date,5,2))
	ll_day = long(mid(ls_date,7,2))
	ls_datemod = string(date(ll_year,ll_month,ll_day))
	ls_note += ls_datemod + ' ' + ls_comm 
//	messagebox(ls_patnumr,string(ll_patnumr))
	update patient set note = :ls_note where patient_id = :ll_patnumr;
//	if error_type(-1) = 1 then
//		commit using sqlca;
//	else
//		rollback using sqlca;
//	end if
	
	FETCH listnote INTO  :ls_patnumr,
						  		:ls_comm,
						  		:ls_date;
								  
LOOP

CLOSE listnote;
	

end event

type cb_migpat from commandbutton within w_migrationorthocom
integer x = 32
integer y = 28
integer width = 768
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration des patients"
end type

event clicked;string ls_patnum, ls_adresse, ls_town, ls_postcode,ls_recu
string ls_hometel, ls_worktel, ls_sex, ls_birthdate
string ls_inscov, ls_socins, ls_patname, ls_status,ls_datesyst
string ls_modelno, ls_langue, ls_ext, ls_email, ls_fax,ls_patid
string ls_jour, ls_mois, ls_annee, ls_nom, ls_prenom,ls_refd
long ll_patid, ll_pos,  ll_idcont, ll_nbligne, i,ll_idpatstatus
date ldt_birth,ldt_opendoss

SELECT count(*) into :ll_nbligne FROM patmast using bdorthocom;
i  = 1

setPointer(hourglass!)
DECLARE listpat CURSOR FOR

	SELECT patnumr,
	       paddress,
			 ptown,
			 postcode,
			 homephne,
			 workphne,
			 patsex,
			 birtdate,
			 inscov,
			 socins,
			 patname,
			 modelno,
			 language,
			 extension,
			 email,
			 datesyst,
			 status
			 
		FROM patmast using bdorthocom;
		
	OPEN listpat;
	
	FETCH listpat INTO :ls_patnum, 
							 :ls_adresse,
							 :ls_town,
							 :ls_postcode,
							 :ls_hometel,
							 :ls_worktel, 
							 :ls_sex, 
							 :ls_birthdate,
							 :ls_inscov, 
							 :ls_socins, 
							 :ls_patname, 
							 :ls_modelno, 
							 :ls_langue, 
							 :ls_ext,
							 :ls_email,
							 :ls_datesyst,
							 :ls_status;
			
								 
	DO WHILE bdorthocom.SQLCODE = 0
		ll_patid = long(ls_patnum)
		ls_adresse = left(trim(ls_adresse),36)
		ls_town = left(trim(ls_town),50)
		ls_postcode = replace(ls_postcode,4,1,"")
		ls_hometel = trim(ls_hometel)
		ls_hometel = replace(ls_hometel,1,1,"")
		ls_hometel = replace(ls_hometel,4,1,"")
		ls_hometel = replace(ls_hometel,7,1,"")
		ls_worktel = trim(ls_worktel)
		ls_worktel = replace(ls_worktel,1,1,"")
		ls_worktel = replace(ls_worktel,4,1,"")
		ls_worktel = replace(ls_worktel,7,1,"")
		ls_annee = left(ls_birthdate,4)
		ls_jour = right(ls_birthdate,2)
		ls_mois = mid(ls_birthdate,5,2)
		ldt_birth = date(ls_jour + '-' + ls_mois + '-' + ls_annee)
		ls_annee = left(ls_datesyst,4)
		ls_jour = right(ls_datesyst,2)
		ls_mois = mid(ls_datesyst,5,2)
		ldt_opendoss = date(ls_jour + '-' + ls_mois + '-' + ls_annee)
//		if ls_inscov = 'N' then
//			ls_inscovass = 'non'
//		else
//			if ls_inscov = 'Y' then
//				ls_inscovass = 'oui'
//			end if
//		end if
		ll_pos = pos(ls_patname,",") - 1
		ls_nom = left(ls_patname,ll_pos)
		ls_prenom = trim(right(ls_patname, len(ls_patname) - ll_pos - 1))
		if isnull(ls_nom) then ls_nom = ' '
		if isnull(ls_prenom) then ls_prenom = ' '
		if ls_langue = 'E' then
			ls_langue = 'A'
		end if
		if ls_inscov = 'Y' then
			ls_inscov = 'oui'
			ls_recu = '1'
		else
			ls_inscov = 'non'
			ls_recu = '0'
		end if
		setnull(ll_idpatstatus)
		select id_patstatus into :ll_idpatstatus from t_patstatus where nom = :ls_status;
		if isnull(ll_idpatstatus) then
			insert into t_patstatus(nom,ortho_id) values(:ls_status,1);
			select max(id_patstatus) into :ll_idpatstatus from t_patstatus;
		end if
		ls_patid = string(ll_patid)
		insert into patient(patient_id,adresse,ville,code_postale,tel_maison,tel_bureau,sex,date_naissance,nas,patient_nom,patient_prenom,no_boite,new_dossier,langue,text2,email,no_ortho,province,recu_automatique,assurance,opendoss,id_patstatus)
		values(:ll_patid,:ls_adresse,:ls_town,:ls_postcode,:ls_hometel,:ls_worktel,:ls_sex,:ldt_birth, :ls_socins, :ls_nom, :ls_prenom, :ls_modelno, :ls_patid, :ls_langue, :ls_ext,:ls_email,1,'QC',:ls_recu,:ls_inscov,:ldt_opendoss,:ll_idpatstatus);
		if SQLCA.SqlCode <> 0 then
			messagebox("Avertissement",sqlca.sqlerrtext)
		end if
		
		insert into t_contact(nom, prenom, adresse, zip, ville, telres, telbur,  province, sex, langue, pat, patient_id, ortho_id,  date_naissance)
		values(:ls_nom, :ls_prenom, :ls_adresse, :ls_postcode, :ls_town, :ls_hometel, :ls_worktel, 'QC', :ls_sex, :ls_langue, 1,:ll_patid, 1);
		if SQLCA.SqlCode <> 0 then
			messagebox("Avertissement",sqlca.sqlerrtext)
		end if
		
		st_count.text = string(i) + '/' + string(ll_nbligne)
		i++
		
		
		FETCH listpat INTO :ls_patnum, 
								 :ls_adresse,
								 :ls_town,
								 :ls_postcode,
								 :ls_hometel,
								 :ls_worktel, 
								 :ls_sex, 
								 :ls_birthdate,
								 :ls_inscov, 
								 :ls_socins, 
								 :ls_patname, 
								 :ls_modelno, 
								 :ls_langue, 
								 :ls_ext,
								 :ls_email,
								 :ls_datesyst,
								 :ls_status;
		
	LOOP
			
CLOSE listpat;
commit using SQLCA;
//update patient set patient_id = test;
//commit using SQLCA;
//

//SELECT count(*) into :ll_nbligne FROM patient;
//i = 1
//
//DECLARE listpat2 CURSOR FOR
//
//	SELECT patient_id,
//			 patient_nom,
//			 patient_prenom,
//	       adresse,
//			 ville,
//			 code_postale,
//			 tel_maison,
//			 tel_bureau,
//			 sex,
//			 date_naissance,
//			 langue,
//			 text1,
//			 email
//		FROM patient;
//		
//	OPEN listpat2;
//	
//	FETCH listpat2 INTO :ll_patid, 
//							 :ls_nom, 
//							 :ls_prenom,
//							 :ls_adresse,
//							 :ls_town,
//							 :ls_postcode,
//							 :ls_hometel,
//							 :ls_worktel, 
//							 :ls_sex, 
//							 :ldt_birth,
//							 :ls_langue, 
//							 :ls_ext,
//							 :ls_email;
//			
//								 
//	DO WHILE SQLCA.SQLCODE = 0
//		
//		insert into t_contact(patient_id,adresse,ville,zip,telres,telbur,sex,date_naissance,prenom,nom,langue,telext,email,ortho_id,province) 
//		values(:ll_patid, :ls_adresse, :ls_town, :ls_postcode,:ls_hometel,:ls_worktel,:ls_sex, :ldt_birth, :ls_prenom, :ls_nom,:ls_langue,:ls_ext,:ls_email,1,'QC');
//		if SQLCA.SqlCode <> 0 then
//			messagebox("Avertissement",sqlca.sqlerrtext)
//		end if
//		
//		st_count.text = string(i) + '/' + string(ll_nbligne)
//		i++
//		
//		FETCH listpat2 INTO :ll_patid,
//							 :ls_nom, 
//							 :ls_prenom,
//							 :ls_adresse,
//							 :ls_town,
//							 :ls_postcode,
//							 :ls_hometel,
//							 :ls_worktel, 
//							 :ls_sex, 
//							 :ldt_birth,
//							 :ls_langue, 
//							 :ls_ext,
//							 :ls_email;
//		
//	LOOP
//			
//CLOSE listpat2;
//commit using SQLCA;
//
//update t_contact set pat = 1;
//if SQLCA.SqlCode <> 0 then
//	commit using SQLCA;
//	messagebox("Avertissement",sqlca.sqlerrtext)
//else
//	rollback using SQLCA;
//end if
//update patient set id_contact = (select t_contact.id_contact from t_contact where t_contact.patient_id = patient.patient_id );
//if SQLCA.SqlCode <> 0 then
//	commit using SQLCA;
//	messagebox("Avertissement",sqlca.sqlerrtext)
//else
//	rollback using SQLCA;
//end if
end event

