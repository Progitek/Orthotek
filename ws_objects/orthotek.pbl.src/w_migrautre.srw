$PBExportHeader$w_migrautre.srw
forward
global type w_migrautre from w_main
end type
type cb_migdentist from commandbutton within w_migrautre
end type
type st_2 from statictext within w_migrautre
end type
type sle_qte from singlelineedit within w_migrautre
end type
type cb_2 from commandbutton within w_migrautre
end type
type st_11 from statictext within w_migrautre
end type
type cb_5 from commandbutton within w_migrautre
end type
type sle_count from singlelineedit within w_migrautre
end type
type st_10 from statictext within w_migrautre
end type
type sle_factpaiecpd from singlelineedit within w_migrautre
end type
type st_9 from statictext within w_migrautre
end type
type sle_charge from singlelineedit within w_migrautre
end type
type st_charges from statictext within w_migrautre
end type
type cb_3 from commandbutton within w_migrautre
end type
type st_1 from statictext within w_migrautre
end type
type dw_migdossier from u_dw within w_migrautre
end type
type dw_patients from u_dw within w_migrautre
end type
type cb_1 from commandbutton within w_migrautre
end type
end forward

global type w_migrautre from w_main
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
cb_migdentist cb_migdentist
st_2 st_2
sle_qte sle_qte
cb_2 cb_2
st_11 st_11
cb_5 cb_5
sle_count sle_count
st_10 st_10
sle_factpaiecpd sle_factpaiecpd
st_9 st_9
sle_charge sle_charge
st_charges st_charges
cb_3 cb_3
st_1 st_1
dw_migdossier dw_migdossier
dw_patients dw_patients
cb_1 cb_1
end type
global w_migrautre w_migrautre

on w_migrautre.create
int iCurrent
call super::create
this.cb_migdentist=create cb_migdentist
this.st_2=create st_2
this.sle_qte=create sle_qte
this.cb_2=create cb_2
this.st_11=create st_11
this.cb_5=create cb_5
this.sle_count=create sle_count
this.st_10=create st_10
this.sle_factpaiecpd=create sle_factpaiecpd
this.st_9=create st_9
this.sle_charge=create sle_charge
this.st_charges=create st_charges
this.cb_3=create cb_3
this.st_1=create st_1
this.dw_migdossier=create dw_migdossier
this.dw_patients=create dw_patients
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_migdentist
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.sle_qte
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.st_11
this.Control[iCurrent+6]=this.cb_5
this.Control[iCurrent+7]=this.sle_count
this.Control[iCurrent+8]=this.st_10
this.Control[iCurrent+9]=this.sle_factpaiecpd
this.Control[iCurrent+10]=this.st_9
this.Control[iCurrent+11]=this.sle_charge
this.Control[iCurrent+12]=this.st_charges
this.Control[iCurrent+13]=this.cb_3
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.dw_migdossier
this.Control[iCurrent+16]=this.dw_patients
this.Control[iCurrent+17]=this.cb_1
end on

on w_migrautre.destroy
call super::destroy
destroy(this.cb_migdentist)
destroy(this.st_2)
destroy(this.sle_qte)
destroy(this.cb_2)
destroy(this.st_11)
destroy(this.cb_5)
destroy(this.sle_count)
destroy(this.st_10)
destroy(this.sle_factpaiecpd)
destroy(this.st_9)
destroy(this.sle_charge)
destroy(this.st_charges)
destroy(this.cb_3)
destroy(this.st_1)
destroy(this.dw_migdossier)
destroy(this.dw_patients)
destroy(this.cb_1)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_migdentist from commandbutton within w_migrautre
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
boolean enabled = false
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

type st_2 from statictext within w_migrautre
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

type sle_qte from singlelineedit within w_migrautre
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

type cb_2 from commandbutton within w_migrautre
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
string text = "Migration les charges"
end type

event clicked;long j,ll_numero,ll_nbligne,ll_count,ll_traitid,ll_patid
string ls_type,ls_ref
date ldt_date
datetime ldtt_date
dec{2} ld_montant

//delete from t_rdv;

select count(*) into :ll_nbligne from transactionstecs;
// aller chercher les charges
DECLARE transac CURSOR FOR

	select numero,
			 datetr,
			 ttr,
			 total
	from 	 transactionstecs
	order by numero asc;
	
OPEN transac;

FETCH transac into :ll_numero,
						 :ldtt_date,
						 :ls_type,
						 :ld_montant;
						  
DO WHILE SQLCA.SQLCode = 0
	ld_montant = abs(ld_montant)
	select patient_id into :ll_patid from patient where test = :ll_numero;
	ldt_date = date(ldtt_date)
	insert into t_rdv(rdvdate,rdvheure,typetraitid,patient_id,duree,colonne)
	values(:ldt_date,now(),0,:ll_patid,:ld_montant,0);
	error_type(-1)
	
	sle_charge.text = string(j) + '/' + string(ll_nbligne)
	j++
	FETCH transac into :ll_numero,
							 :ldtt_date,
							 :ls_type,
							 :ld_montant;
LOOP

CLOSE transac;




end event

type st_11 from statictext within w_migrautre
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

type cb_5 from commandbutton within w_migrautre
integer x = 3177
integer y = 1716
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "CLOSE"
end type

event clicked;close(parent)
end event

type sle_count from singlelineedit within w_migrautre
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

type st_10 from statictext within w_migrautre
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

type sle_factpaiecpd from singlelineedit within w_migrautre
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

type st_9 from statictext within w_migrautre
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

type sle_charge from singlelineedit within w_migrautre
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

type st_charges from statictext within w_migrautre
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
string text = "Charges:"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_migrautre
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
string text = "Migration facture, paiement et cpd"
end type

event clicked;long j,ll_numero,ll_nbligne,ll_count,ll_traitid,ll_patid
string ls_type,ls_ref
date ldt_date
dec{2} ld_montant

//delete from t_pourcentages;
//delete from factures_traitements;
//delete from paiement;
//delete from cheques_postdates;
//delete from traitements;
select count(*) into :ll_nbligne from transactionsrecs;
// aller chercher facture, paiement et postdate
DECLARE transac CURSOR FOR

	select numero,
			 datetr,
			 typetr,
			 montant
	from 	 transactionsrecs
	order by numero asc;
	
OPEN transac;

FETCH transac into :ll_numero,
						 :ldt_date,
						 :ls_type,
						 :ld_montant;
						  
DO WHILE SQLCA.SQLCode = 0
	ld_montant = abs(ld_montant)
	select patient_id into :ll_patid from patient where test = :ll_numero;
	// verification si il y a une phase
	setnull(ll_traitid)
	select count(*) into :ll_count from traitements where patient_id = :ll_patid;
	if ll_count = 0 then
		insert into traitements(phase,debut_traitement,patient_id)
		values(1,today(),:ll_patid);
		error_type(-1)
	end if
	select traitement_id into :ll_traitid from traitements where patient_id = :ll_patid;
	// insertion fact, paie, cpd
	choose case ls_type
		case 'FACTURE'
			insert into factures_traitements(date_facture,montant,status_id,traitement_id,affect,cache)
			values(:ldt_date,:ld_montant,1,:ll_traitid,1,0);
			error_type(-1)
		case 'PAIEMENT'
			insert into paiement(date_paiement,montant_recu,paiement,traitement_patient_id,affect,cache)
			values(:ldt_date,:ld_montant,'mod',:ll_traitid,1,0);
			error_type(-1)
		case 'POSTDATE'
			insert into cheques_postdates(date_cheque,paiement,modalite,traitement_patient_id,indicateur,affect)
			values(:ldt_date,:ld_montant,'c',:ll_traitid,'0',1);
			error_type(-1)
	end choose
	
	sle_factpaiecpd.text = string(j) + '/' + string(ll_nbligne)
	j++
	FETCH transac into :ll_numero,
							 :ldt_date,
							 :ls_type,
							 :ld_montant;
LOOP

CLOSE transac;




end event

type st_1 from statictext within w_migrautre
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
string text = "Migration de AUTRE"
boolean focusrectangle = false
end type

type dw_migdossier from u_dw within w_migrautre
integer x = 37
integer y = 184
integer width = 1934
integer height = 1168
integer taborder = 20
string title = "migdossier"
string dataobject = "d_migdossier"
boolean hscrollbar = true
end type

event constructor;SetTransObject(SQLCA)
sle_count.text = '0'
//w_ad2orthotek.em_traitement_id.text = '0'
sle_factpaiecpd.text = '0'
sle_charge.text = '0'
retrieve()
end event

type dw_patients from u_dw within w_migrautre
integer x = 1998
integer y = 180
integer width = 1586
integer height = 1296
integer taborder = 20
string dataobject = "d_migpat"
boolean hscrollbar = true
end type

event constructor;dw_patients.SetTransObject(SQLCA)
end event

type cb_1 from commandbutton within w_migrautre
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

event clicked;long enr, i, j = 1, k, nb_row, end_row,ll_orthoid,ll_idcontact,ll_iddentist
integer li_pos
string ls_zip, ls_prov, ls_telbur, ls_telres, ls_ramq, ls_ramqexp,ls_pro
string ls_mois, ls_annee, ls_ext, ls_compte, ls_statut
long ll_len, ll_numero, ll_visitid, ll_nce, ll_idspec, ll_numauto, ll_nodos
long ll_dent, ll_mod, ll_count, ll_idresp, ll_maxpat, ll_paieid, ll_pres,ll_idpatstatus
string ls_codediag, ls_cs, ls_mod, ls_del, ls_surf,ls_acte
string ls_codtype, ls_ville, ls_adresse, ls_nom, ls_prenom
string ls_resp, ls_refno,ls_detnom,ls_detprenom
string ls_cnom,ls_cprenom,ls_cadr1,ls_cadr2,ls_cadr3,ls_cpostal,ls_ctelep1,ls_ctelep2
date ldt_datevisit, ldt_auto, ldt_cpd
dec{2} ld_mont, ld_iamtrec, ld_prixlab
long ll_patid = 0

end_row = dw_migdossier.rowcount()
for i = 1 to end_row
	select max(patient_id) into :ll_patid from patient;
	ll_patid++
	sle_count.text = string(i)
	enr = dw_patients.insertrow(0)
	ll_numero = dw_migdossier.getItemnumber(i,'numero')
//	ll_nodos = long(dw_migdossier.getItemString(i,'refno'))
	dw_patients.setItem(enr,'patient_id',ll_patid)
	dw_patients.setItem(enr,'test',ll_numero)
	ls_nom = trim(dw_migdossier.getItemString(i,'nom'))
	dw_patients.setItem(enr,'patient_nom',ls_nom)
	ls_prenom = trim(dw_migdossier.getItemString(i,'prenom'))
	dw_patients.setItem(enr,'patient_prenom',ls_prenom)
//	ls_resp = trim(dw_migdossier.getItemString(i,'resp'))	
	ls_adresse = trim(dw_migdossier.getItemString(i,'adr1'))
	dw_patients.setItem(enr,'adresse',ls_adresse)
	ls_ville = trim(dw_migdossier.getItemString(i,'adr2'))
	dw_patients.setItem(enr,'ville',ls_ville)
	ls_zip = dw_migdossier.getItemString(i,'postal')
//	ls_zip = replace(ls_zip,4,1,"")
	dw_patients.setItem(enr,'code_postale',ls_zip)	
//	ls_prov = dw_migdossier.getItemString(i,'adr3')
//	if ls_prov = 'PQ' then
//		ls_prov = 'QC'
//	end if
	dw_patients.setItem(enr,'province','QC')	
	ls_telres = dw_migdossier.getItemString(i,'telep1')
	do while match(ls_telres,'-')
		li_pos = pos(ls_telres,'-')
		ls_telres = replace(ls_telres,li_pos,1,"")
	loop
	ls_telres = '418'+left(ls_telres,7)
	dw_patients.setItem(enr,'tel_maison',ls_telres)
	ls_telbur = dw_migdossier.getItemString(i,'telep2')
	do while match(ls_telbur,'-')
		li_pos = pos(ls_telbur,'-')
		ls_telbur = replace(ls_telbur,li_pos,1,"")
	loop
	ls_telbur = '418'+left(ls_telbur,7)
	dw_patients.setItem(enr,'tel_bureau',ls_telbur)
	dw_patients.setItem(enr,'date_naissance',date(dw_migdossier.getItemDateTime(i,'naissance')))
	if dw_migdossier.getItemString(i,'sexe') = '1' then
		dw_patients.setItem(enr,'sex','M')
	else
		dw_patients.setItem(enr,'sex','F')
	end if
	ls_ramq = dw_migdossier.getItemString(i,'assmaladie')
	dw_patients.setItem(enr,'nas',ls_ramq)
	dw_patients.setItem(enr,'langue','F')
	
//		dw_patients.setItem(enr,'alerte_medical',trim(left(dw_migdossier.getItemString(i,'alert'),35)))
////		dw_patients.setItem(enr,'alertmed',1)
//	end if
	
	dw_patients.setItem(enr,'new_dossier',ll_numero)
	ls_pro = dw_migdossier.getItemString(i,'pro')
	choose case ls_pro
		case 'CLOUTIER'
			ll_orthoid = 1
		case 'BEAULIEU'
			ll_orthoid = 2
	end choose
	dw_patients.setItem(enr,'no_ortho',ll_orthoid)
	dw_patients.setItem(enr,'note',trim(left(dw_migdossier.getItemString(i,'comment'),500)))
	// statut
	ls_statut = dw_migdossier.getItemString(i,'statut')
	if ls_statut <> '' and isnull(ls_statut) = false then
		setnull(ll_idpatstatus)
		select id_patstatus into :ll_idpatstatus from t_patstatus where nom = :ls_statut;
		if isnull(ll_idpatstatus) then
			insert into t_patstatus(nom,ortho_id) values(:ls_statut,:ll_orthoid);
			error_type(-1)
			select max(id_patstatus) into :ll_idpatstatus from t_patstatus;
		end if
		dw_patients.setItem(enr,'id_patstatus',ll_idpatstatus)
		dw_patients.setItem(enr,'opendoss',date(dw_migdossier.getItemdatetime(i,'statut_depuis_le')))
	end if
	// creation du responsable financier
	ls_cnom = dw_migdossier.getItemString(i,'cnom')
	ls_cprenom = dw_migdossier.getItemString(i,'cprenom')
	ls_cadr1 = dw_migdossier.getItemString(i,'cadr1')
	ls_cadr2 = dw_migdossier.getItemString(i,'cadr2')
	ls_cadr3 = dw_migdossier.getItemString(i,'cadr3')
	ls_cpostal = dw_migdossier.getItemString(i,'cpostal')
	ls_ctelep1 = dw_migdossier.getItemString(i,'ctelep1')
	do while match(ls_ctelep1,'-')
		li_pos = pos(ls_ctelep1,'-')
		ls_ctelep1 = replace(ls_ctelep1,li_pos,1,"")
	loop
	ls_ctelep1 = '418'+left(ls_ctelep1,7)
	ls_ctelep2 = dw_migdossier.getItemString(i,'ctelep2')
	do while match(ls_ctelep2,'-')
		li_pos = pos(ls_ctelep2,'-')
		ls_ctelep2 = replace(ls_ctelep2,li_pos,1,"")
	loop
	ls_ctelep2 = '418'+left(ls_ctelep2,7)
	if ls_cnom <> '' and isnull(ls_cnom) = false then
		insert into t_contact(ortho_id,patient_id,nom,prenom,adresse,ville,province,zip,telres,telbur)
		values(:ll_orthoid,:ll_patid,:ls_cnom,:ls_cprenom,:ls_cadr1,:ls_cadr2,'QC',:ls_cpostal,:ls_ctelep1,:ls_ctelep2);
		error_type(-1)
		select max(id_contact) into :ll_idcontact from t_contact;
		dw_patients.setItem(enr,'id_contact',ll_idcontact)
	end if
	// creation du dentist
	ls_detnom = dw_migdossier.getItemString(i,'nom_dentiste')
	ls_detprenom = dw_migdossier.getItemString(i,'prenom_dentiste')
	if ls_detnom <> '' and isnull(ls_detnom) = false then
		setnull(ll_iddentist)
		select id_dentist into :ll_iddentist from t_dentists where det_nom = :ls_detnom;
		if isnull(ll_iddentist) then
			insert into t_dentists(det_nom,det_prenom,ortho_id) values(:ls_detnom,:ls_detprenom,:ll_orthoid);
			error_type(-1)
			select max(id_dentist) into :ll_iddentist from t_dentists;
		end if
		dw_patients.setItem(enr,'id_dentist',ll_iddentist)
	end if
	// update
	if dw_patients.update() = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
next
end event

