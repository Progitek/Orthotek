$PBExportHeader$w_migrate_eval_meb.srw
forward
global type w_migrate_eval_meb from w_child
end type
type cb_4 from commandbutton within w_migrate_eval_meb
end type
type cb_3 from commandbutton within w_migrate_eval_meb
end type
type cb_ajustresp from commandbutton within w_migrate_eval_meb
end type
type hpb_mig1 from hprogressbar within w_migrate_eval_meb
end type
type st_2 from statictext within w_migrate_eval_meb
end type
type st_migresp2contact from statictext within w_migrate_eval_meb
end type
type cb_migresp2contact from commandbutton within w_migrate_eval_meb
end type
type cb_2 from commandbutton within w_migrate_eval_meb
end type
type dw_pourc from u_dw within w_migrate_eval_meb
end type
type cb_1 from commandbutton within w_migrate_eval_meb
end type
type cb_update from commandbutton within w_migrate_eval_meb
end type
type dw_ref from u_dw within w_migrate_eval_meb
end type
type cb_migrate from commandbutton within w_migrate_eval_meb
end type
type cb_close from commandbutton within w_migrate_eval_meb
end type
end forward

global type w_migrate_eval_meb from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_4 cb_4
cb_3 cb_3
cb_ajustresp cb_ajustresp
hpb_mig1 hpb_mig1
st_2 st_2
st_migresp2contact st_migresp2contact
cb_migresp2contact cb_migresp2contact
cb_2 cb_2
dw_pourc dw_pourc
cb_1 cb_1
cb_update cb_update
dw_ref dw_ref
cb_migrate cb_migrate
cb_close cb_close
end type
global w_migrate_eval_meb w_migrate_eval_meb

type variables
//
end variables

forward prototypes
public function integer chechkref (string fs_refnomcomp)
end prototypes

public function integer chechkref (string fs_refnomcomp);long ll_refid
//pour vérifier si le référent existe déja retourne son id
if isnull(fs_refnomcomp) = false and fs_refnomcomp <> '' then
	select id into :ll_refid from t_referents where ref_nom_complet = :fs_refnomcomp;
	if ll_refid > 0 then
		return ll_refid
	else
		return -1
	end if
else
	return 0
end if
end function

on w_migrate_eval_meb.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_ajustresp=create cb_ajustresp
this.hpb_mig1=create hpb_mig1
this.st_2=create st_2
this.st_migresp2contact=create st_migresp2contact
this.cb_migresp2contact=create cb_migresp2contact
this.cb_2=create cb_2
this.dw_pourc=create dw_pourc
this.cb_1=create cb_1
this.cb_update=create cb_update
this.dw_ref=create dw_ref
this.cb_migrate=create cb_migrate
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_ajustresp
this.Control[iCurrent+4]=this.hpb_mig1
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_migresp2contact
this.Control[iCurrent+7]=this.cb_migresp2contact
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.dw_pourc
this.Control[iCurrent+10]=this.cb_1
this.Control[iCurrent+11]=this.cb_update
this.Control[iCurrent+12]=this.dw_ref
this.Control[iCurrent+13]=this.cb_migrate
this.Control[iCurrent+14]=this.cb_close
end on

on w_migrate_eval_meb.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_ajustresp)
destroy(this.hpb_mig1)
destroy(this.st_2)
destroy(this.st_migresp2contact)
destroy(this.cb_migresp2contact)
destroy(this.cb_2)
destroy(this.dw_pourc)
destroy(this.cb_1)
destroy(this.cb_update)
destroy(this.dw_ref)
destroy(this.cb_migrate)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_4 from commandbutton within w_migrate_eval_meb
integer x = 37
integer y = 628
integer width = 850
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Migration patient Simple"
end type

event clicked;string ls_nom, ls_prenom, ls_nomcomp, ls_ville, ls_prov
long ll_pos, ll_long, ll_dim, ll_idcontgroup, ll_idcontact

//insert into t_contgroup(nomgroup,ortho_id) values('patient',:v_no_ortho);
select id_contgroup into :ll_idcontgroup from t_contgroup where nomgroup = 'patient';
insert into patient(patient_id,patient_nom,patient_prenom,no_ortho) values(0,'0','0',1);

DECLARE listpat CURSOR FOR

	SELECT Sname, Scity, Sprovstate from tcustomr;
	
OPEN listpat;

	DO WHILE SQLCA.SQLCODE = 0 
		
		Fetch listpat Into :ls_nomcomp, :ls_ville, :ls_prov;
		
		if SQLCA.SQLCode = 0 then
			ls_nomcomp = UPPER(ls_nomcomp)
			ll_pos = pos(ls_nomcomp," ",1)
			ll_long = len(ls_nomcomp)
			ll_dim = ll_long - ll_pos
			ls_prenom = right(ls_nomcomp,ll_dim)
			ls_nom = left(ls_nomcomp,ll_pos)
			insert into t_contact(nom,prenom,ville,province,ortho_id,pat,id_contgroup,patient_id)
			values(:ls_nom,:ls_prenom,:ls_ville,:ls_prov,:v_no_ortho,1,:ll_idcontgroup,0);
			select max(id_contact) into :ll_idcontact from t_contact; 
			insert into patient(patient_nom,patient_prenom,ville,province,no_ortho,id_contact) 
			values(:ls_nom,:ls_prenom,:ls_ville,:ls_prov,:v_no_ortho,:ll_idcontact);
		end if
	Loop
messagebox('Modification terminé!','Les patients sont importé avec succès')
CLOSE listpat;
end event

type cb_3 from commandbutton within w_migrate_eval_meb
integer x = 32
integer y = 500
integer width = 859
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Zip dentists"
end type

event clicked;long ll_iddent
integer li_pos
string ls_zip
  
 Declare ajustzipdentists Cursor For
 
  SELECT t_dentists.id_dentist,
  			t_dentists.det_zip
    FROM t_dentists; 			
OPEN ajustzipdentists;

Do While SQLCA.SQLCode = 0
	
   Fetch ajustzipdentists Into :ll_iddent, :ls_zip;
	
	if SQLCA.SQLCode = 0 then
		if match(ls_zip,' ') then
			li_pos = pos(ls_zip,' ')
			ls_zip = replace(ls_zip,li_pos,1,'')
			update t_dentists set det_zip = :ls_zip where id_dentist = :ll_iddent;
		end if
	end if
Loop
messagebox('Modification terminé!','Les codes postaux dentistes ont été corrigés avec succès')
CLOSE ajustzipdentists;
end event

type cb_ajustresp from commandbutton within w_migrate_eval_meb
integer x = 32
integer y = 372
integer width = 859
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Attribution des contacts"
end type

event clicked;/* Copyright II4net Inc.
   créer le: 23-09-2003
	modifier le: 
	Auteur dernière modif: Dave Tremblay & Eric Vezina
*/

long ll_patid,ll_idcontact,ll_paieid,ll_nbrow,ll_cpdid
double i
string ls_nomresp
SetPointer(HourGlass!)
i = 1
select count(*) into :ll_nbrow from paiement INNER JOIN traitements ON paiement.traitement_patient_id = traitements.traitement_id where id_contact is null;
hpb_mig1.SetRange ( 1, ll_nbrow / 4 + 1 )
  
 Declare paiement Cursor For
 
  SELECT traitements.patient_id, 
  			paiement.nomresp,
			paiement.paiement_id
    FROM paiement INNER JOIN traitements ON paiement.traitement_patient_id = traitements.traitement_id
   WHERE id_contact is null;     			
OPEN paiement;

Do While SQLCA.SQLCode = 0 and i <= ll_nbrow
	
   Fetch paiement Into :ll_patid,:ls_nomresp,:ll_paieid;
	
	if SQLCA.SQLCode = 0 and isnull(ls_nomresp) = false then
		select id_contact into :ll_idcontact from t_contact where patient_id = :ll_patid and nom = :ls_nomresp;
	else
		select id_contact into :ll_idcontact from t_contact where patient_id = :ll_patid and pat = 1;
	end if
	update paiement set id_contact = :ll_idcontact where paiement_id = :ll_paieid;
	i = i + 0.25
	hpb_mig1.position = i
Loop
CLOSE paiement;
///////////////////////
i = 1
select count(*) into :ll_nbrow from cheques_postdates INNER JOIN traitements ON cheques_postdates.traitement_patient_id = traitements.traitement_id WHERE id_contact is null;
hpb_mig1.SetRange ( 1, ll_nbrow / 4 )
  
 Declare cpd Cursor For
 
  SELECT traitements.patient_id, 
  			cheques_postdates.nomresp,
			cheques_postdates.cheques_postdates_id
    FROM cheques_postdates INNER JOIN traitements ON cheques_postdates.traitement_patient_id = traitements.traitement_id
   WHERE id_contact is null; 			
OPEN cpd;

Do While SQLCA.SQLCode = 0 and i <= ll_nbrow
	
   Fetch cpd Into :ll_patid,:ls_nomresp,:ll_cpdid;
	
	if SQLCA.SQLCode = 0 and isnull(ls_nomresp) = false then
		select id_contact into :ll_idcontact from t_contact where patient_id = :ll_patid and nom = :ls_nomresp;
	else
		select id_contact into :ll_idcontact from t_contact where patient_id = :ll_patid and pat = 1;
	end if
	update cheques_postdates set id_contact = :ll_idcontact where cheques_postdates_id = :ll_cpdid;
	i = i + 0.25
	hpb_mig1.position = i
Loop
messagebox('Modification terminé','Les contacts ont été attribués avec succès')
CLOSE cpd;
end event

type hpb_mig1 from hprogressbar within w_migrate_eval_meb
integer x = 32
integer y = 276
integer width = 3552
integer height = 64
string pointer = "Arrow!"
unsignedinteger maxposition = 61498
integer setstep = 1
end type

type st_2 from statictext within w_migrate_eval_meb
integer x = 32
integer width = 1490
integer height = 100
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Outil de migration de données"
boolean focusrectangle = false
end type

type st_migresp2contact from statictext within w_migrate_eval_meb
integer x = 923
integer y = 160
integer width = 2400
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Exporte les responsable de la tables patient vers t_contact. Ajuste la province QC et USA."
boolean focusrectangle = false
end type

type cb_migresp2contact from commandbutton within w_migrate_eval_meb
integer x = 32
integer y = 140
integer width = 859
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Migration des responsables"
end type

event clicked;long i,ll_nbrow,ll_patid
string ls_patnom,ls_nomresp1,ls_nomresp2,ls_nomresp3
string ls_patprenom
string ls_patadd,ls_addresp1,ls_addresp2,ls_addresp3
string ls_patcity,ls_cityresp1,ls_cityresp2,ls_cityresp3
string ls_patzip,ls_zipresp1,ls_zipresp2,ls_zipresp3
string ls_pattel,ls_telresp1,ls_telresp2,ls_telresp3
string ls_prov

delete from t_contact;

datastore ds_migresp2contact
ds_migresp2contact = create datastore
ds_migresp2contact.dataobject = 'd_migresp2contact'
ds_migresp2contact.SetTransObject(SQLCA)
ll_nbrow = ds_migresp2contact.Retrieve()
hpb_mig1.SetRange ( 1, ll_nbrow )
for i = 1 to ll_nbrow
	hpb_mig1.position = i
	ll_patid = ds_migresp2contact.getitemnumber(i,'patient_id')
	select patient_nom,patient_prenom,adresse,ville,province,code_postale,tel_maison &
	into :ls_patnom, :ls_patprenom, :ls_patadd, :ls_patcity, :ls_prov, :ls_patzip, :ls_pattel &
	from patient where patient_id = :ll_patid;
	ls_nomresp1 = trim(ds_migresp2contact.getitemstring(i,'nomresp1'))
	ls_nomresp2 = trim(ds_migresp2contact.getitemstring(i,'nomresp2'))
	ls_nomresp3 = trim(ds_migresp2contact.getitemstring(i,'nomresp3'))
	ls_addresp1 = ds_migresp2contact.getitemstring(i,'addresp1')
	ls_addresp2 = ds_migresp2contact.getitemstring(i,'addresp2')
	ls_addresp3 = ds_migresp2contact.getitemstring(i,'addresp3')
	ls_cityresp1 = ds_migresp2contact.getitemstring(i,'cityresp1')
	ls_cityresp2 = ds_migresp2contact.getitemstring(i,'cityresp2')
	ls_cityresp3 = ds_migresp2contact.getitemstring(i,'cityresp3')
	ls_zipresp1 = ds_migresp2contact.getitemstring(i,'zipresp1')
	ls_zipresp2 = ds_migresp2contact.getitemstring(i,'zipresp2')
	ls_zipresp3 = ds_migresp2contact.getitemstring(i,'zipresp3')
	ls_telresp1 = ds_migresp2contact.getitemstring(i,'telresp1')
	ls_telresp2 = ds_migresp2contact.getitemstring(i,'telresp2')
	ls_telresp3 = ds_migresp2contact.getitemstring(i,'telresp3')
	if isnull(ls_patnom) = false and isnull(ls_patprenom) = false then
		insert into t_contact(ortho_id,patient_id,nom,prenom,adresse,ville,zip,telres,province,pat)
		values(:v_no_ortho,:ll_patid,:ls_patnom,:ls_patprenom,:ls_patadd,:ls_patcity,:ls_patzip,:ls_pattel,:ls_prov,1);
	end if
	if isnull(ls_nomresp1) = false and ls_nomresp1 <> '' then
		insert into t_contact(ortho_id,patient_id,nom,prenom,adresse,ville,zip,telres,province,pat)
		values(:v_no_ortho,:ll_patid,:ls_nomresp1,'',:ls_addresp1,:ls_cityresp1,:ls_zipresp1,:ls_telresp1,'QC',0);
	end if
	if isnull(ls_nomresp2) = false and ls_nomresp2 <> '' then
		insert into t_contact(ortho_id,patient_id,nom,prenom,adresse,ville,zip,telres,province,pat) &
		values(:v_no_ortho,:ll_patid,:ls_nomresp2,'',:ls_addresp2,:ls_cityresp2,:ls_zipresp2,:ls_telresp2,'QC',0);
	end if
	if isnull(ls_nomresp3) = false and ls_nomresp3 <> '' then
		insert into t_contact(ortho_id,patient_id,nom,prenom,adresse,ville,zip,telres,province,pat) &
		values(:v_no_ortho,:ll_patid,:ls_nomresp3,'',:ls_addresp3,:ls_cityresp3,:ls_zipresp3,:ls_telresp3,'QC',0);
	end if
	//PQ2QC et usa2USA
	ls_prov = ds_migresp2contact.getitemstring(i,'province')
	if ls_prov = 'PQ' then
		ds_migresp2contact.setitem(i,'province','QC')
	end if
	if ls_prov = 'usa' then
		ds_migresp2contact.setitem(i,'province','USA')
	end if
next
ds_migresp2contact.update()
commit;
messagebox('TERMINÉ!','migresp2contact, pq2QC et usa2USA terminé avec succès')
destroy ds_migresp2contact
end event

event constructor;long ll_nb
select count(*) into :ll_nb from t_contact;
if ll_nb > 0 then
	enabled = false
end if
end event

type cb_2 from commandbutton within w_migrate_eval_meb
integer x = 1605
integer y = 1912
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Recu resp."
end type

event clicked;long i
string ls_nomresp, ls_nom, ls_prenom, ls_nomcomplet

datastore ds_migraterecuresp
ds_migraterecuresp = create datastore
ds_migraterecuresp.dataobject = "d_migraterecuresp"
ds_migraterecuresp.SetTransObject(SQLCA)
ds_migraterecuresp.retrieve()
for i = 1 to ds_migraterecuresp.rowcount()
	ls_nomresp = ds_migraterecuresp.getitemstring(i,'paiement_nomresp')
	if ls_nomresp = '' or isnull(ls_nomresp) then
		ls_nom = ds_migraterecuresp.getitemstring(i,'patient_patient_nom')
		ls_prenom = ds_migraterecuresp.getitemstring(i,'patient_patient_prenom')
		ls_nomcomplet = ls_nom + ' ' + ls_prenom
		ds_migraterecuresp.setitem(i,'paiement_nomresp',ls_nomcomplet)
	end if
next
ds_migraterecuresp.update()
commit;
destroy ds_migraterecuresp


end event

type dw_pourc from u_dw within w_migrate_eval_meb
boolean visible = false
integer x = 3063
integer y = 1408
integer width = 558
integer height = 484
integer taborder = 20
string title = "dw_pourc"
string dataobject = "d_11"
end type

event constructor;this.SetTransObject(SQLCA)
this.Retrieve()
end event

type cb_1 from commandbutton within w_migrate_eval_meb
integer x = 2386
integer y = 1908
integer width = 571
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Migrate %"
end type

event clicked;long ll_nbrow,i,ll_traitid
int li_poucact
dw_pourc.visible = true
ll_nbrow = dw_pourc.rowcount()
for i = 1 to ll_nbrow
	li_poucact = dw_pourc.getitemnumber(i,'pourcentage_actuel')
	ll_traitid = dw_pourc.getitemnumber(i,'traitement_id')
	if ll_traitid > 0 and isnull(ll_traitid) = false then
		insert into t_pourcentages(pourcentage,annee,traitement_id) values (:li_poucact,2002,:ll_traitid);
	end if
next
commit;
end event

type cb_update from commandbutton within w_migrate_eval_meb
integer x = 667
integer y = 1908
integer width = 590
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Update"
end type

event clicked;dw_ref.update()
commit;
end event

type dw_ref from u_dw within w_migrate_eval_meb
boolean visible = false
integer x = 3086
integer y = 1412
integer width = 498
integer height = 488
integer taborder = 10
string title = "none"
string dataobject = "d_migrate_eval_meb"
boolean border = false
end type

type cb_migrate from commandbutton within w_migrate_eval_meb
integer x = 14
integer y = 1908
integer width = 654
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Migrate"
end type

event clicked;long ll_nbrow, ll_refid, ll_patorthoid, i
string ls_suf
dw_ref.visible = true
dw_ref.SetTransObject(SQLCA)
dw_ref.retrieve()
ll_nbrow = dw_ref.rowcount()
for i = 1 to ll_nbrow
	ll_refid = dw_ref.getitemnumber(i,'id')
	select no_ortho into :ll_patorthoid from patient where referant_nom = :ll_refid;
	if isnull(ll_patorthoid) then
		messagebox('introuvable',string(ll_refid))
	else
		dw_ref.setitem(i,'ortho_id',ll_patorthoid)
	end if
	//changement des suffix
	ls_suf = dw_ref.getitemstring(i,'ref_suffix')
	choose case ls_suf
		case 'Dr.'
			dw_ref.setitem(i,'ref_suffix','Dr')
		case 'Dr..'
			dw_ref.setitem(i,'ref_suffix','Dr')
		case 'Dre.'
			dw_ref.setitem(i,'ref_suffix','Dre')
		case 'Dre..'
			dw_ref.setitem(i,'ref_suffix','Dre')
	end choose
next

end event

type cb_close from commandbutton within w_migrate_eval_meb
integer x = 2958
integer y = 1908
integer width = 672
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Close"
end type

event clicked;close(parent)
end event

