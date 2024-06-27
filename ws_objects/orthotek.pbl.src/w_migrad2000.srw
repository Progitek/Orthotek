$PBExportHeader$w_migrad2000.srw
forward
global type w_migrad2000 from w_main
end type
type cb_13 from commandbutton within w_migrad2000
end type
type cb_12 from commandbutton within w_migrad2000
end type
type cb_11 from commandbutton within w_migrad2000
end type
type cb_10 from commandbutton within w_migrad2000
end type
type cb_9 from commandbutton within w_migrad2000
end type
type cb_8 from commandbutton within w_migrad2000
end type
type cb_7 from commandbutton within w_migrad2000
end type
type cb_6 from commandbutton within w_migrad2000
end type
type cb_4 from commandbutton within w_migrad2000
end type
type cb_migdentist from commandbutton within w_migrad2000
end type
type st_2 from statictext within w_migrad2000
end type
type sle_qte from singlelineedit within w_migrad2000
end type
type cb_2 from commandbutton within w_migrad2000
end type
type st_11 from statictext within w_migrad2000
end type
type cb_5 from commandbutton within w_migrad2000
end type
type sle_count from singlelineedit within w_migrad2000
end type
type st_10 from statictext within w_migrad2000
end type
type sle_facture_id from singlelineedit within w_migrad2000
end type
type st_9 from statictext within w_migrad2000
end type
type sle_post from singlelineedit within w_migrad2000
end type
type st_8 from statictext within w_migrad2000
end type
type cb_3 from commandbutton within w_migrad2000
end type
type st_1 from statictext within w_migrad2000
end type
type dw_general from u_dw within w_migrad2000
end type
type dw_patients from u_dw within w_migrad2000
end type
type cb_1 from commandbutton within w_migrad2000
end type
end forward

global type w_migrad2000 from w_main
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean ib_isupdateable = false
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_4 cb_4
cb_migdentist cb_migdentist
st_2 st_2
sle_qte sle_qte
cb_2 cb_2
st_11 st_11
cb_5 cb_5
sle_count sle_count
st_10 st_10
sle_facture_id sle_facture_id
st_9 st_9
sle_post sle_post
st_8 st_8
cb_3 cb_3
st_1 st_1
dw_general dw_general
dw_patients dw_patients
cb_1 cb_1
end type
global w_migrad2000 w_migrad2000

type variables
transaction ad2000
end variables

on w_migrad2000.create
int iCurrent
call super::create
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_4=create cb_4
this.cb_migdentist=create cb_migdentist
this.st_2=create st_2
this.sle_qte=create sle_qte
this.cb_2=create cb_2
this.st_11=create st_11
this.cb_5=create cb_5
this.sle_count=create sle_count
this.st_10=create st_10
this.sle_facture_id=create sle_facture_id
this.st_9=create st_9
this.sle_post=create sle_post
this.st_8=create st_8
this.cb_3=create cb_3
this.st_1=create st_1
this.dw_general=create dw_general
this.dw_patients=create dw_patients
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_13
this.Control[iCurrent+2]=this.cb_12
this.Control[iCurrent+3]=this.cb_11
this.Control[iCurrent+4]=this.cb_10
this.Control[iCurrent+5]=this.cb_9
this.Control[iCurrent+6]=this.cb_8
this.Control[iCurrent+7]=this.cb_7
this.Control[iCurrent+8]=this.cb_6
this.Control[iCurrent+9]=this.cb_4
this.Control[iCurrent+10]=this.cb_migdentist
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.sle_qte
this.Control[iCurrent+13]=this.cb_2
this.Control[iCurrent+14]=this.st_11
this.Control[iCurrent+15]=this.cb_5
this.Control[iCurrent+16]=this.sle_count
this.Control[iCurrent+17]=this.st_10
this.Control[iCurrent+18]=this.sle_facture_id
this.Control[iCurrent+19]=this.st_9
this.Control[iCurrent+20]=this.sle_post
this.Control[iCurrent+21]=this.st_8
this.Control[iCurrent+22]=this.cb_3
this.Control[iCurrent+23]=this.st_1
this.Control[iCurrent+24]=this.dw_general
this.Control[iCurrent+25]=this.dw_patients
this.Control[iCurrent+26]=this.cb_1
end on

on w_migrad2000.destroy
call super::destroy
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_4)
destroy(this.cb_migdentist)
destroy(this.st_2)
destroy(this.sle_qte)
destroy(this.cb_2)
destroy(this.st_11)
destroy(this.cb_5)
destroy(this.sle_count)
destroy(this.st_10)
destroy(this.sle_facture_id)
destroy(this.st_9)
destroy(this.sle_post)
destroy(this.st_8)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.dw_general)
destroy(this.dw_patients)
destroy(this.cb_1)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)


ad2000 = create transaction

ad2000.DBMS       = 'ODBC'
ad2000.LOCK		  = "0"
ad2000.AutoCommit = True
ad2000.DbParm     = "ConnectString='DSN=lafond',ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"

connect using ad2000;
if ad2000.sqlcode <> 0 then
	MessageBox ("Impossible de se connecter!", ad2000.sqlerrtext)
else
	MessageBox ("Information!","Vous êtes connecté")
end if

end event

type cb_13 from commandbutton within w_migrad2000
integer x = 2606
integer y = 1832
integer width = 608
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rappel"
end type

event clicked;long i, ll_nbligne, ll_ordre
string ls_desf1, ls_desf2, ls_desf3, ls_desf4, ls_desf5, ls_dese1, ls_dese2, ls_dese3, ls_dese4,ls_dese5, ls_descf, ls_desca

i = 1

SELECT count(*) into :ll_nbligne FROM orth_cod using ad2000;

// aller chercher facture et paiement
DECLARE listlapto CURSOR FOR
	select fdes1,fdes2,fdes3,fdes4,fdes5,edes1,edes2,edes3,edes4,edes5 from orth_cod using ad2000;
	
OPEN listlapto;

FETCH listlapto into :ls_desf1, :ls_desf2, :ls_desf3, :ls_desf4, :ls_desf5, :ls_dese1, :ls_dese2, :ls_dese3, :ls_dese4, :ls_dese5;
						  
DO WHILE ad2000.SQLCode = 0
	
	ls_descf = ls_desf1 + ls_desf2 + ls_desf3 + ls_desf4 + ls_desf5
	ls_desca = ls_dese1 + ls_dese2 + ls_dese3 + ls_dese4 + ls_dese5
	ll_ordre = 10 * i
	
	insert into t_plans(description,descriptionan,id_catplan,ordre)
	values(:ls_descf,:ls_desca,1,:ll_ordre);
	error_type(-1)
		
	FETCH listlapto into :ls_desf1, :ls_desf2, :ls_desf3, :ls_desf4, :ls_desf5, :ls_dese1, :ls_dese2, :ls_dese3, :ls_dese4, :ls_dese5;
							  
								 
	sle_post.text = string(i) + '/' + string(ll_nbligne)
	i++
	
LOOP

CLOSE listlapto;





end event

type cb_12 from commandbutton within w_migrad2000
integer x = 2606
integer y = 1720
integer width = 608
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rappel"
end type

event clicked;long ll_patid, i, ll_nbligne
date ldt_datevue, ldt_datedue
string ls_raison, ls_nodos

i = 1

SELECT count(*) into :ll_nbligne FROM rappel where patno <> '' using ad2000;

// aller chercher facture et paiement
DECLARE listrappel CURSOR FOR
	select patno,rdate,raison,duedate from rappel where patno <> '' using ad2000;
	
OPEN listrappel;

FETCH listrappel into 	:ls_nodos,
						  		:ldt_datevue,
						  		:ls_raison,
								:ldt_datedue;
						  
DO WHILE ad2000.SQLCode = 0
	
	ll_patid = long(ls_nodos)
	
	if ldt_datedue >= today() then
			
		insert into rendezvous(patient_id,date_vue,note1,prochain_rv,duree,ortho_id,no_ortho)
		values(:ll_patid,:ldt_datevue,:ls_raison,:ldt_datedue,2,1,1);
		error_type(-1)
		
	end if
	
	FETCH listrappel into 	:ls_nodos,
									:ldt_datevue,
									:ls_raison,
									:ldt_datedue;
							  
								 
	sle_post.text = string(i) + '/' + string(ll_nbligne)
	i++
	
LOOP

CLOSE listrappel;





end event

type cb_11 from commandbutton within w_migrad2000
integer x = 2606
integer y = 1492
integer width = 608
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Créer dent-ref"
end type

event clicked;insert into t_referents(id, ref_nom, ref_prenom, ref_adresse, ref_ville, ref_province, ref_zip, ref_tel_bur, ref_tel_fax, ref_langue,ortho_id,actif)
(select id_dentist, det_nom, det_prenom, det_add, det_ville, det_prov, det_zip, det_telbur, det_fax, det_langue, 1, 1 from t_dentists);
error_type(-1)
commit using SQLCA;


end event

type cb_10 from commandbutton within w_migrad2000
integer x = 2606
integer y = 1608
integer width = 608
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Referent"
end type

event clicked;string ls_dossref, ls_nodos
long ll_patid, ll_nbligne, i, ll_count, ll_refid

i = 1


select count(*) into :ll_nbligne from referent using ad2000;


// aller chercher facture et paiement
DECLARE postdate CURSOR FOR
	select dossier,referf from referent using ad2000;
	
OPEN postdate;

FETCH postdate into :ls_nodos,
						  :ls_dossref;
						  
DO WHILE ad2000.SQLCode = 0
	
	ll_patid = long(ls_nodos)
	
	if left(ls_dossref,1) = 'A' then
		
		// Cas dentiste
		ll_refid = long(mid(ls_dossref,2))
		select count(*) into :ll_count from t_referents where id = :ll_refid;
		if ll_count > 0 then
			update patient set referant_nom = :ll_refid where patient_id = :ll_patid;
			error_type(-1)
		end if

	else
		ll_refid = long(ls_dossref)
		
		// Cas patient
		
		select count(*) into :ll_count from t_referents where ref_note = :ls_dossref; 
		if ll_count = 0 then
			insert into t_referents(ref_nom, ref_prenom, ref_adresse, ref_ville, ref_province, ref_zip, ref_tel_bur, ref_langue,ortho_id,actif,ref_note)
			(select patient_nom, patient_prenom, adresse, ville, province, code_postale, tel_bureau, langue, 1, 1,:ls_dossref from patient where patient_id = :ll_refid);
			error_type(-1)
			select max(id) into :ll_refid from t_referents;
		else
			select id into :ll_refid from t_referents where ref_note = :ls_dossref;
		end if
		update patient set referant_nom = :ll_refid where patient_id = :ll_patid;
		error_type(-1)
	end if
	
	FETCH postdate into 	:ls_nodos,
						  		:ls_dossref;
							  
								 
	sle_post.text = string(i) + '/' + string(ll_nbligne)
	i++
	
LOOP

CLOSE postdate;





end event

type cb_9 from commandbutton within w_migrad2000
integer x = 1998
integer y = 1836
integer width = 608
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Postdaté"
end type

event clicked;integer li_phase
string ls_patid, ls_mode, ls_phase, ls_nodos
long ll_patid, ll_traitid, ll_nbligne, i, ll_patpres, ll_contid, ll_ind
date ldt_date
dec{2} ld_totpost,ld_totfact, ld_totpaie

i = 1

SELECT count(*) into :ll_nbligne
	FROM postdate using ad2000;

// aller chercher facture et paiement
DECLARE postdate CURSOR FOR
	SELECT rpatno,
			 rdate,
			 ramtrec
	FROM postdate
	order by rpatno , rdate using ad2000;
	
OPEN postdate;

FETCH postdate into :ls_nodos,
						  :ldt_date,
						  :ld_totpost;
						  
DO WHILE ad2000.SQLCode = 0
	li_phase = integer(ls_phase)
	ll_patid = long(ls_nodos)
	select id_contact into :ll_contid from t_contact where patient_id = :ll_patid and pat = 1;

	// verifier si la phase existe
	select max(phase) into :li_phase from traitements where patient_id = :ll_patid;
	if li_phase = 0 then
		error_type(0)
	else
		select traitement_id into :ll_traitid from traitements where patient_id = :ll_patid and phase = :li_phase;
		if ld_totpost <> 0 then
			if ldt_date > today() then
				ll_ind = 0
			else
				ll_ind = 1
			end if
			insert into cheques_postdates(date_cheque,paiement,traitement_patient_id,affect,modalite,id_contact,indicateur)
			values(:ldt_date,:ld_totpost,:ll_traitid,1,'P',:ll_contid,:ll_ind);
			error_type(-1)
		end if
	end if
	
	FETCH postdate into :ls_nodos,
							  :ldt_date,
							  :ld_totpost;
							  
								 
	sle_post.text = string(i) + '/' + string(ll_nbligne)
	i++
	
LOOP

CLOSE postdate;





end event

type cb_8 from commandbutton within w_migrad2000
integer x = 1998
integer y = 1724
integer width = 608
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Facture - Paiement"
end type

event clicked;integer li_phase,li_count
string ls_patid, ls_mode, ls_test, ls_phase, ls_doss
long ll_patid, ll_traitid, ll_nbligne, i,j, ll_patpres, ll_contid
date ldt_date
dec{2} ld_totfact, ld_totpaie, ld_coutrait
j = 1
i = 1

SELECT count(*) into :ll_nbligne
	FROM medic2 sing ad2000;

// aller chercher facture et paiement
DECLARE listfact CURSOR FOR
	SELECT dossier,
		    rinv,
			 idate,
			 itotal,
			 iamtrec,
			 imode
	FROM medic2
	order by dossier , idate using ad2000;
	
OPEN listfact;

FETCH listfact into :ls_doss,
						  :ls_phase,
						  :ldt_date,
						  :ld_totfact,
						  :ld_totpaie,
						  :ls_mode;
						  
DO WHILE ad2000.SQLCode = 0
	
	ll_patid = long(ls_doss)
	select id_contact into :ll_contid from t_contact where patient_id = :ll_patid and pat = 1;
	li_phase = integer(ls_phase)
	if li_phase = 0 then li_phase = 1
	// verifier si la phase existe
	select count(*) into :li_count from traitements where patient_id = :ll_patid and phase = :li_phase;
	
	if li_count = 0 then
		// creer la phase
		select trait_orth into :ld_coutrait from general where dossier = :ls_doss using ad2000;
		insert into traitements(phase,patient_id,montant_original) values(:li_phase,:ll_patid,:ld_coutrait);
		if error_type(-1) = 1 then
			select traitement_id into :ll_traitid from traitements where patient_id = :ll_patid and phase = :li_phase;
			if ld_totfact <> 0 then
				insert into factures_traitements(montant,date_facture,status_id,traitement_id,affect,cache,id_contact)
				values(:ld_totfact,:ldt_date,1,:ll_traitid,1,0,:ll_contid);
				error_type(-1)
			end if
			if ld_totpaie <> 0 then
				insert into paiement(montant_recu,paiement,date_paiement,traitement_patient_id,affect,cache,id_contact)
				values(:ld_totpaie,:ls_mode,:ldt_date,:ll_traitid,1,0,:ll_contid);
				error_type(-1)
			end if
		end if
	else
		select traitement_id into :ll_traitid from traitements where patient_id = :ll_patid and phase = :li_phase;
		if ld_totfact <> 0 then
			insert into factures_traitements(montant,date_facture,status_id,traitement_id,affect,cache,id_contact)
			values(:ld_totfact,:ldt_date,1,:ll_traitid,1,0,:ll_contid);
			error_type(-1)
		end if
		if ld_totpaie <> 0 then
			insert into paiement(montant_recu,paiement,date_paiement,traitement_patient_id,affect,cache,id_contact)
			values(:ld_totpaie,:ls_mode,:ldt_date,:ll_traitid,1,0,:ll_contid);
			error_type(-1)
		end if
	end if
	
	sle_qte.text = string(j) + '/' + string(ll_nbligne)
	j++
	
	FETCH listfact into :ls_doss,
							  :ls_phase,
							  :ldt_date,
							  :ld_totfact,
							  :ld_totpaie,
							  :ls_mode;
LOOP

CLOSE listfact;




end event

type cb_7 from commandbutton within w_migrad2000
integer x = 1998
integer y = 1608
integer width = 608
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Patient"
end type

event clicked;string ls_nodos, ls_nom, ls_prenom, ls_midinit, ls_addr, ls_ville, ls_prov, ls_zip, ls_boite, ls_otel, ls_loc, ls_cell, ls_dent
string ls_htel, ls_sex, ls_alert, ls_drefer, ls_comment1, ls_comment2, ls_recuauto, ls_newdoss
date ldt_birthday
long ll_patid, ll_iddent, ll_count, ll_ortho, ll_contid, ll_idsal

ll_ortho = 1

DECLARE listpat CURSOR FOR
	select 	dossier, lname, fname, maiden, addr, city, pro, zip, boite, otel, loc,
				cell, htel, sex, alert, drefer, comment1, comment2, birthday, recu_auto, refno, dent
	from		general using AD2000;
	
OPEN listpat;

FETCH listpat INTO 	:ls_nodos,
							:ls_nom,
							:ls_prenom,
							:ls_midinit,
							:ls_addr,
							:ls_ville,
							:ls_prov,
							:ls_zip,
							:ls_boite,
							:ls_otel,
							:ls_loc,
							:ls_cell, 
							:ls_htel, 
							:ls_sex, 
							:ls_alert, 
							:ls_drefer, 
							:ls_comment1, 
							:ls_comment2, 
							:ldt_birthday, 
							:ls_recuauto,
							:ls_newdoss,
							:ls_dent;

DO WHILE AD2000.SQLCode = 0
	
	CHOOSE CASE trim(ls_dent)
		CASE '2'
			ll_idsal = 2
		CASE ELSE
			ll_idsal = 1
	END CHOOSE
	
	
	ll_patid = long(ls_nodos)
	ls_nom = trim(ls_nom)
	ls_prenom = trim(ls_prenom)
	ls_midinit = trim(ls_midinit)
	ls_addr = trim(ls_addr)
	ls_ville = trim(ls_ville)
	ls_prov = trim(ls_prov)
	ls_zip = trim(ls_zip)
	ls_boite = trim(ls_boite)
	ls_otel = trim(ls_otel)
	ls_otel = rep(ls_otel,'-','')
	ls_otel = rep(ls_otel,' ','')
	ls_otel = rep(ls_otel,'(','')
	ls_otel = rep(ls_otel,')','')
	ls_loc = trim(ls_loc)
	ls_cell = trim(ls_cell)
	ls_cell = rep(ls_cell,'-','')
	ls_cell = rep(ls_cell,' ','')
	ls_cell = rep(ls_cell,'(','')
	ls_cell = rep(ls_cell,')','')
	ls_htel = trim(ls_htel)
	ls_htel = rep(ls_htel,'-','')
	ls_htel = rep(ls_htel,' ','')
	ls_htel = rep(ls_htel,'(','')
	ls_htel = rep(ls_htel,')','')		
	ls_zip = trim(ls_zip)
	ls_zip = rep(ls_zip,' ','')
	ls_alert = trim(ls_alert)
	ll_iddent = long(ls_drefer)
	if isnull(ls_comment1) then ls_comment1 = ''
	if isnull(ls_comment2) then ls_comment2 = ''
	ls_comment1 = ls_comment1 + ' ' + ls_comment2
	if ls_recuauto = 'N' then
		ls_recuauto = 'No'
	else
		ls_recuauto = 'Yes'
	end if
	
	select count(*) into :ll_count from t_dentists where id_dentist = :ll_iddent;
	if ll_count = 0 then setnull(ll_iddent)
	
	// Patient 
	
	insert into patient(patient_id,new_dossier,patient_nom,patient_prenom,adresse,ville,province,code_postale,no_boite,tel_bureau,
							  text2,telcell,tel_maison,sex,alerte_medical,id_dentist,note,date_naissance,recu_automatique,no_ortho,langue,id_satellite)
	values(:ll_patid,:ls_newdoss,:ls_nom,:ls_prenom,:ls_addr,:ls_ville,:ls_prov,:ls_zip,:ls_boite,:ls_otel,
			:ls_loc,:ls_cell,:ls_htel,:ls_sex,:ls_alert,:ll_iddent,:ls_comment1,:ldt_birthday,:ls_recuauto,:ll_ortho,'F',:ll_idsal);
	error_type(-1)
			
	// Contact
	
	insert into t_contact(nom,prenom,adresse,ville,zip,telres,telbur,province,telcell,note,sex,langue,telext,pat,patient_id,ortho_id,date_naissance)
	values(:ls_nom,:ls_prenom,:ls_addr,:ls_ville,:ls_zip,:ls_htel,:ls_otel,:ls_prov,:ls_cell,:ls_comment1,:ls_sex,'F',:ls_loc,1,:ll_patid,:ll_ortho,:ldt_birthday);
	error_type(-1)
	
	select max(id_contact) into :ll_contid from t_contact;
	update patient set id_contact = :ll_contid where patient_id = :ll_patid;
	error_type(-1)
	
	FETCH listpat INTO 	:ls_nodos,
								:ls_nom,
								:ls_prenom,
								:ls_midinit,
								:ls_addr,
								:ls_ville,
								:ls_prov,
								:ls_zip,
								:ls_boite,
								:ls_otel,
								:ls_loc,
								:ls_cell, 
								:ls_htel, 
								:ls_sex, 
								:ls_alert, 
								:ls_drefer, 
								:ls_comment1, 
								:ls_comment2, 
								:ldt_birthday, 
								:ls_recuauto,
								:ls_newdoss,
								:ls_dent;
	
LOOP

CLOSE listpat;
end event

type cb_6 from commandbutton within w_migrad2000
integer x = 1998
integer y = 1492
integer width = 608
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Dentiste"
end type

event clicked;string ls_no,ls_lname, ls_fname, ls_add, ls_city, ls_pro, ls_zip, ls_tel1, ls_fax
string ls_comment, ls_langue, ls_email,ls_sex
long ll_no

ll_no = 0

// migrer les dentistes
DECLARE dentist CURSOR FOR

	SELECT no,
			 lname,
			 fname,
			 addr,
			 city,
			 pro,
			 zip,
			 tel1,
			 fax,
			 comment1,
			 langue,
			 email,
			 sexe
	FROM 	 reperto using ad2000;
	
OPEN dentist;

FETCH dentist into :ls_no,
						 :ls_lname,
						 :ls_fname,
						 :ls_add,
						 :ls_city,
						 :ls_pro,
						 :ls_zip,
						 :ls_tel1,
						 :ls_fax,
						 :ls_comment,
						 :ls_langue,
						 :ls_email,
						 :ls_sex;
						  
DO WHILE ad2000.SQLCode = 0
	
	ls_lname = trim(ls_lname)
	ls_fname = trim(ls_fname)
	ls_add = trim(ls_add)
	ls_city = trim(ls_city)
	ls_pro = trim(ls_pro)
	ls_zip = trim(rep(ls_zip," ",""))
	ls_tel1 = trim(ls_tel1)
	ls_tel1 = rep(ls_tel1,'-','')
	ls_tel1 = rep(ls_tel1,' ','')
	ls_fax = trim(ls_fax)
	ls_fax = rep(ls_fax,'-','')
	ls_fax = rep(ls_fax,' ','')
	ls_fax = trim(ls_fax)
	ls_comment = trim(ls_comment)
	ls_langue = trim(ls_langue)
	ls_email = trim(ls_email)
	ll_no = long(ls_no)
	
	insert into t_dentists(ortho_id,id_dentist,det_nom,det_prenom,det_add,det_ville,det_prov,det_zip,det_telbur,det_fax,det_note,det_langue,det_email,det_sex) 
	values(1,:ll_no,:ls_lname,:ls_fname,:ls_add,:ls_city,:ls_pro,:ls_zip,:ls_tel1,:ls_fax,:ls_comment,:ls_langue,:ls_email,:ls_sex);
	error_type(-1)

	FETCH dentist into :ls_no,
						 :ls_lname,
						 :ls_fname,
						 :ls_add,
						 :ls_city,
						 :ls_pro,
						 :ls_zip,
						 :ls_tel1,
						 :ls_fax,
						 :ls_comment,
						 :ls_langue,
						 :ls_email,
						 :ls_sex;
LOOP

CLOSE dentist;

//destroy ds_migdent

end event

type cb_4 from commandbutton within w_migrad2000
integer x = 3223
integer y = 1500
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;string ls_boite, ls_dossier
long  ll_patid
transaction ad2003

ad2003 = create transaction

ad2003.DBMS       = 'ODBC'
ad2003.LOCK		  = "0"
ad2003.AutoCommit = True
ad2003.DbParm     = "ConnectString='DSN=ad2003'"
//SQLCA.LOCK = "RC"
connect using ad2003;
if ad2003.sqlcode <> 0 then
	MessageBox ("Cannot Connect to Database", ad2003.sqlerrtext)
	close(w_etat)
	return
else
	MessageBox ("Connecté", "")
end if

DECLARE listpat CURSOR FOR
	select urgence,
			 dossier
			from general USING ad2003;
			
OPEN listpat;

FETCH listpat INTO :ls_boite,
						 :ls_dossier;
						 
DO WHILE ad2003.SQLcode = 0
	
	ll_patid = long(ls_dossier)	
	update patient set no_boite = :ls_boite where patient_id = :ll_patid;
	error_type(-1)
	
	
	
	FETCH listpat INTO :ls_boite,
						 :ls_dossier;
						 
LOOP

CLOSE listpat;


disconnect using ad2003;
end event

type cb_migdentist from commandbutton within w_migrad2000
integer x = 795
integer y = 1472
integer width = 1175
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration des dentistes"
end type

event clicked;long ll_pos
string ls_no,ls_lname,ls_fname,ls_add,ls_city,ls_pro,ls_zip,ls_tel1,ls_fax,ls_comment,ls_langue,ls_email

//datastore ds_migdent
//ds_migdent = create datastore
//ds_migdent.dataobject = "d_migdent"
//ds_migdent.SetTransObject(SQLCA)
//ds_migdent.retrieve()

// migrer les dentistes
DECLARE dentist CURSOR FOR

	SELECT no,
			 lname,
			 fname,
			 add1,
			 city,
			 pro,
			 zip,
			 tel1,
			 fax,
			 comment1,
			 langue,
			 email
	FROM 	 reperto;
	
OPEN dentist;

FETCH dentist into :ls_no,
						 :ls_lname,
						 :ls_fname,
						 :ls_add,
						 :ls_city,
						 :ls_pro,
						 :ls_zip,
						 :ls_tel1,
						 :ls_fax,
						 :ls_comment,
						 :ls_langue,
						 :ls_email;
						  
DO WHILE SQLCA.SQLCode = 0
	
	ls_lname = trim(ls_lname)
	ls_fname = trim(ls_fname)
	ls_add = trim(ls_add)
	ls_city = trim(ls_city)
	ls_pro = trim(ls_pro)
	if ls_pro = 'PQ' then
		ls_pro = 'QC'
	end if
	ls_zip = trim(ls_zip)
	ls_zip = replace(ls_zip,4,1,"")
	ls_tel1 = trim(ls_tel1)
	do while match(ls_tel1,'-')
		ll_pos = pos(ls_tel1,'-')
		ls_tel1 = replace(ls_tel1,ll_pos,1,'')
	loop
	do while match(ls_tel1,' ')
		ll_pos = pos(ls_tel1,' ')
		ls_tel1 = replace(ls_tel1,ll_pos,1,'')
	loop
	ls_fax = trim(ls_fax)
	do while match(ls_fax,'-')
		ll_pos = pos(ls_fax,'-')
		ls_fax = replace(ls_fax,ll_pos,1,'')
	loop
	ls_comment = trim(ls_comment)
	ls_langue = trim(ls_langue)
	ls_email = trim(ls_email)
	
	insert into t_dentists(ortho_id,drefer,det_nom,det_prenom,det_add,det_ville,det_prov,det_zip,det_telbur,det_fax,det_note,det_langue,det_email) 
	values(1,:ls_no,:ls_lname,:ls_fname,:ls_add,:ls_city,:ls_pro,:ls_zip,:ls_tel1,:ls_fax,:ls_comment,:ls_langue,:ls_email);
	error_type(-1)

	FETCH dentist into :ls_no,
							 :ls_lname,
							 :ls_fname,
							 :ls_add,
							 :ls_city,
							 :ls_pro,
							 :ls_zip,
							 :ls_tel1,
							 :ls_fax,
							 :ls_comment,
							 :ls_langue,
							 :ls_email;
LOOP

CLOSE dentist;

//destroy ds_migdent

// associer les dentistes aux patients
update patient set id_dentist = (select first t_dentists.id_dentist from t_dentists where t_dentists.drefer = patient.drefer);
if error_type(-1) = 1 then
	commit using sqlca;
else
	rollback using sqlca;
end if


end event

type st_2 from statictext within w_migrad2000
integer x = 1417
integer y = 1672
integer width = 302
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nb.Facture:"
boolean focusrectangle = false
end type

type sle_qte from singlelineedit within w_migrad2000
integer x = 1358
integer y = 1736
integer width = 393
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "0"
boolean border = false
end type

type cb_2 from commandbutton within w_migrad2000
integer x = 37
integer y = 1472
integer width = 759
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration des postdatés"
end type

event clicked;integer li_phase
string ls_patid, ls_mode, ls_phase, ls_test
long ll_patid, ll_traitid, ll_nbligne, i, ll_patpres
date ldt_date
dec{2} ld_totpost,ld_totfact, ld_totpaie

i = 1
select count(*) into :ll_nbligne from patient;
// Chercher le nombre de ligne total à migrer
DECLARE pat CURSOR FOR

	select patient_id,
			 test
	from patient
	order by test;

OPEN pat;

FETCH pat INTO :ll_patid,:ls_test;

DO WHILE SQLCA.SQLCODE = 0
	// aller chercher facture et paiement
	DECLARE postdate CURSOR FOR
		SELECT rdate,
				 ramtrec,
				 phase
		FROM postdate
		where rpatno = :ls_test
		order by rpatno , rdate;
		
	OPEN postdate;
	
	FETCH postdate into :ldt_date,
							  :ld_totpost,
							  :ls_phase;
							  
	DO WHILE SQLCA.SQLCode = 0
		li_phase = integer(ls_phase)
		// verifier si la phase existe
		select count(*) into :li_phase from traitements where patient_id = :ll_patid and phase = :li_phase;
		if li_phase = 0 then
			error_type(0)
		else
			select traitement_id into :ll_traitid from traitements where patient_id = :ll_patid and phase = :li_phase;
			if ld_totpost <> 0 then
				insert into cheques_postdates(date_cheque,paiement,traitement_patient_id,affect,modalite)
				values(:ldt_date,:ld_totpost,:ll_traitid,1,'P');
				error_type(-1)
			end if
		end if
		
		FETCH postdate into :ldt_date,
							  	  :ld_totpost,
							  	  :ls_phase;
		
	LOOP
	
	CLOSE postdate;
	sle_post.text = string(i) + '/' + string(ll_nbligne)
	i++
	FETCH pat INTO :ll_patid,:ls_test;
LOOP

CLOSE pat;




end event

type st_11 from statictext within w_migrad2000
integer x = 87
integer y = 1668
integer width = 302
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Patients:"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_5 from commandbutton within w_migrad2000
integer x = 3232
integer y = 1912
integer width = 402
integer height = 112
integer taborder = 40
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

type sle_count from singlelineedit within w_migrad2000
integer x = 37
integer y = 1736
integer width = 402
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "0"
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type st_10 from statictext within w_migrad2000
integer x = -265
integer y = 1568
integer width = 219
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Patient"
boolean focusrectangle = false
end type

type sle_facture_id from singlelineedit within w_migrad2000
integer x = 480
integer y = 1736
integer width = 393
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "0"
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type st_9 from statictext within w_migrad2000
integer x = 503
integer y = 1676
integer width = 302
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Factures:"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_post from singlelineedit within w_migrad2000
integer x = 914
integer y = 1736
integer width = 393
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "0"
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type st_8 from statictext within w_migrad2000
integer x = 1006
integer y = 1676
integer width = 302
integer height = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Postdatés:"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_migrad2000
integer x = 795
integer y = 1360
integer width = 1175
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration facture et paiement"
end type

event clicked;integer li_phase,li_count
string ls_patid, ls_mode, ls_test, ls_phase
long ll_patid, ll_traitid, ll_nbligne, i,j, ll_patpres
date ldt_date
dec{2} ld_totfact, ld_totpaie
j = 1
i = 1

datastore ds_migpat
ds_migpat = create datastore
ds_migpat.dataobject = "d_migpat"
ds_migpat.SetTransObject(SQLCA)
ds_migpat.retrieve()
ll_nbligne = ds_migpat.rowcount()
for i = 1 to ll_nbligne
	ll_patid = ds_migpat.getitemnumber(i,'patient_id')
	ls_test = ds_migpat.getitemstring(i,'test')
	// aller chercher facture et paiement
	DECLARE listfact CURSOR FOR
		SELECT rinv,
				 idate,
				 itotal,
				 iamtrec,
				 imode
		FROM medic1
		where dossier = :ls_test
		order by dossier , idate;
		
	OPEN listfact;
	
	FETCH listfact into :ls_phase,
							  :ldt_date,
							  :ld_totfact,
							  :ld_totpaie,
							  :ls_mode;
							  
	DO WHILE SQLCA.SQLCode = 0
		li_phase = integer(ls_phase)
		if li_phase = 0 then li_phase = 1
		// verifier si la phase existe
		select count(*) into :li_count from traitements where patient_id = :ll_patid and phase = :li_phase;
		
		if li_count = 0 then
			// creer la phase
			insert into traitements(phase,patient_id) values(:li_phase,:ll_patid);
			if error_type(-1) = 1 then
				select traitement_id into :ll_traitid from traitements where patient_id = :ll_patid and phase = :li_phase;
				if ld_totfact <> 0 then
					insert into factures_traitements(montant,date_facture,status_id,traitement_id,affect,cache)
					values(:ld_totfact,:ldt_date,1,:ll_traitid,1,0);
					error_type(-1)
				end if
				if ld_totpaie <> 0 then
					insert into paiement(montant_recu,paiement,date_paiement,traitement_patient_id,affect,cache)
					values(:ld_totpaie,:ls_mode,:ldt_date,:ll_traitid,1,0);
					error_type(-1)
				end if
			end if
		else
			select traitement_id into :ll_traitid from traitements where patient_id = :ll_patid and phase = :li_phase;
			if ld_totfact <> 0 then
				insert into factures_traitements(montant,date_facture,status_id,traitement_id,affect,cache)
				values(:ld_totfact,:ldt_date,1,:ll_traitid,1,0);
				error_type(-1)
			end if
			if ld_totpaie <> 0 then
				insert into paiement(montant_recu,paiement,date_paiement,traitement_patient_id,affect,cache)
				values(:ld_totpaie,:ls_mode,:ldt_date,:ll_traitid,1,0);
				error_type(-1)
			end if
		end if
		sle_qte.text = string(j)
		j++
		FETCH listfact into :ls_phase,
								  :ldt_date,
								  :ld_totfact,
								  :ld_totpaie,
								  :ls_mode;
	LOOP
	
	CLOSE listfact;
	sle_facture_id.text = string(i) + '/' + string(ll_nbligne)
next

destroy ds_migpat




end event

type st_1 from statictext within w_migrad2000
integer x = 37
integer y = 28
integer width = 1111
integer height = 124
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Migration de AD 2000"
boolean focusrectangle = false
end type

type dw_general from u_dw within w_migrad2000
integer x = 37
integer y = 184
integer width = 1934
integer height = 1168
integer taborder = 20
string title = "GENERAL"
string dataobject = "d_general"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_general.SetTransObject(SQLCA)
w_migrad2000.sle_count.text = '0'
//w_ad2orthotek.em_traitement_id.text = '0'
w_migrad2000.sle_facture_id.text = '0'
w_migrad2000.sle_post.text = '0'
w_migrad2000.dw_general.retrieve()
end event

type dw_patients from u_dw within w_migrad2000
integer x = 1998
integer y = 180
integer width = 1586
integer height = 1296
integer taborder = 20
string dataobject = "d_migpat"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_patients.SetTransObject(SQLCA)
end event

type cb_1 from commandbutton within w_migrad2000
integer x = 37
integer y = 1360
integer width = 759
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Migration des patients"
end type

event clicked;long enr, i, j, k, nb_row, end_row
string ls_zip, ls_prov, ls_telbur, ls_telres, ls_ramq, ls_ramqexp
string ls_mois, ls_annee, ls_ext, ls_compte
long ll_len, ll_patid, ll_visitid, ll_nce, ll_idspec, ll_numauto, ll_nodos
long ll_dent, ll_mod, ll_count, ll_idresp, ll_maxpat, ll_paieid, ll_pres
string ls_codediag, ls_cs, ls_mod, ls_del, ls_surf,ls_acte
string ls_codtype, ls_ville, ls_adresse, ls_nom, ls_prenom
string ls_resp, ls_refno
date ldt_datevisit, ldt_auto, ldt_cpd
dec{2} ld_mont, ld_iamtrec, ld_prixlab


end_row = dw_general.rowcount()
for i = 1 to end_row
	sle_count.text = string(i)
	enr = dw_patients.insertrow(0)
	ll_patid = long(dw_general.getItemString(i,'dossier'))
	ll_nodos = long(dw_general.getItemString(i,'refno'))
	dw_patients.setItem(enr,'test',dw_general.getItemString(i,'dossier'))
	ls_nom = trim(dw_general.getItemString(i,'Lname'))
	dw_patients.setItem(enr,'patient_nom',ls_nom)
	ls_prenom = trim(dw_general.getItemString(i,'Fname'))
	dw_patients.setItem(enr,'patient_prenom',ls_prenom)
	ls_resp = trim(dw_general.getItemString(i,'resp'))	
	ls_adresse = trim(dw_general.getItemString(i,'add'))
	dw_patients.setItem(enr,'adresse',ls_adresse)
	ls_ville = trim(dw_general.getItemString(i,'city'))
	dw_patients.setItem(enr,'ville',ls_ville)
	ls_zip = dw_general.getItemString(i,'zip')
	ls_zip = replace(ls_zip,4,1,"")
	dw_patients.setItem(enr,'code_postale',ls_zip)	
	ls_prov = dw_general.getItemString(i,'pro')
	if ls_prov = 'PQ' then
		ls_prov = 'QC'
	end if
	dw_patients.setItem(enr,'province',ls_prov)
	ls_telres = dw_general.getItemString(i,'htel')
	ll_len = len(ls_telres)
	ls_telres = mid(ls_telres,2,ll_len - 1)
	ls_telres = replace(ls_telres,4,1,"")
	ls_telres = replace(ls_telres,4,1,"")
	ls_telres = replace(ls_telres,7,1,"")
	ls_ext = mid(ls_telres,4,3)
	if ls_ext = '691' or ls_ext = '692' or ls_ext = '698' or ls_ext = '225' or ls_ext = '427' or ls_ext = '429' or ls_ext = '632' or ls_ext = '635' or ls_ext = '638' then
		ls_telres = replace(ls_telres,1,3,"450")
	end if
	dw_patients.setItem(enr,'tel_maison',ls_telres)
	ls_telbur = dw_general.getItemString(i,'otel')
	ll_len = len(ls_telbur)
	ls_telbur = mid(ls_telbur,2,ll_len - 1)
	ls_telbur = replace(ls_telbur,4,1,"")
	ls_telbur = replace(ls_telbur,4,1,"")
	ls_telbur = replace(ls_telbur,7,1,"")
	ls_ext = mid(ls_telbur,4,3)
	if ls_ext = '691' or ls_ext = '692' or ls_ext = '698' or ls_ext = '225' or ls_ext = '427' or ls_ext = '429' or ls_ext = '632' or ls_ext = '635' or ls_ext = '638' or ls_ext = '699' then
		ls_telbur = replace(ls_telbur,1,3,"450")
	end if 
	dw_patients.setItem(enr,'tel_bureau',ls_telbur)
//	dw_patients.setItem(enr,'nas',trim(dw_general.getItemString(i,'socins')))
//	ls_ramq = dw_general.getItemString(i,'med')
//	ls_ramq = replace(ls_ramq,5,1,"")
//	ls_ramq = replace(ls_ramq,9,1,"")
//	dw_patients.setItem(enr,'ramq',ls_ramq)
	dw_patients.setItem(enr,'date_naissance',dw_general.getItemDate(i,'birthday'))
	dw_patients.setItem(enr,'sex',dw_general.getItemString(i,'sex'))
//	ls_ramqexp = dw_general.getItemString(i,'mexp')
//	ls_ramqexp = mid(ls_ramqexp,4,len(ls_ramqexp))
//	ls_mois = left(ls_ramqexp,2)
//	ls_annee = right(ls_ramqexp,2)
//	ls_ramqexp = '01-' + ls_mois + '-' + ls_annee
//	dw_patients.setItem(enr,'ramqexp',ls_ramqexp)
	dw_patients.setItem(enr,'langue','F')
	if isnull(dw_general.getItemString(i,'alert')) = false then
		dw_patients.setItem(enr,'alerte_medical',trim(left(dw_general.getItemString(i,'alert'),35)))
//		dw_patients.setItem(enr,'alertmed',1)
	end if
//	dw_patients.setItem(enr,'employeur',left(dw_general.getItemString(i,'profes'),30))
	dw_patients.setItem(enr,'new_dossier',ll_nodos)
	dw_patients.setItem(enr,'no_ortho',1)
//	dw_patients.setItem(enr,'compte','cas')
	dw_patients.setItem(enr,'note',trim(left(dw_general.getItemString(i,'comment'),500))+'~r~n'+ls_resp)
	dw_patients.setItem(enr,'drefer',dw_general.getItemString(i,'drefer'))
//	dw_patients.setItem(enr,'midinit',dw_general.getItemString(i,'maiden'))
//	if not isnull(ls_resp) and ls_resp <> "" then
//		ls_nom = ls_resp
//		ls_prenom = ""
//	end if
	if dw_patients.update() = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
next
end event

