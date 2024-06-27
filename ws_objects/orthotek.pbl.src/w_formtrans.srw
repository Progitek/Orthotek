$PBExportHeader$w_formtrans.srw
forward
global type w_formtrans from w_child
end type
type p_lock from picture within w_formtrans
end type
type pb_supprimer from picturebutton within w_formtrans
end type
type pb_ajouter from picturebutton within w_formtrans
end type
type pb_fin from picturebutton within w_formtrans
end type
type pb_suuivant from picturebutton within w_formtrans
end type
type pb_precedent from picturebutton within w_formtrans
end type
type pb_debut from picturebutton within w_formtrans
end type
type st_title from statictext within w_formtrans
end type
type cb_update from commandbutton within w_formtrans
end type
type cb_print from commandbutton within w_formtrans
end type
type cb_close from commandbutton within w_formtrans
end type
type p_unlock from picture within w_formtrans
end type
type dw_formtrans from u_dw within w_formtrans
end type
end forward

global type w_formtrans from w_child
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
p_lock p_lock
pb_supprimer pb_supprimer
pb_ajouter pb_ajouter
pb_fin pb_fin
pb_suuivant pb_suuivant
pb_precedent pb_precedent
pb_debut pb_debut
st_title st_title
cb_update cb_update
cb_print cb_print
cb_close cb_close
p_unlock p_unlock
dw_formtrans dw_formtrans
end type
global w_formtrans w_formtrans

type variables
boolean change = false
long il_patid,il_trid
integer ii_modeajout
long il_curindex = 1
end variables

forward prototypes
public subroutine sauve ()
public subroutine uf_traduction ()
end prototypes

public subroutine sauve ();if dw_formtrans.update() = 1 then
	commit using SQLCA;
	change = false
else
	rollback using SQLCA;
	error_type(50)
end if

dw_formtrans.retrieve(il_patid)
st_title.event ue_title()
end subroutine

public subroutine uf_traduction (); /*************************************************************
 Créé par: Sébastien Tremblay
 Créé le: 
 Modifié par: Dave Tremblay
 Modifié le: 01-09-2004
 
 Ouverture du formulaire de transfert. Remplir ce qui est nécessaire

 **************************************************************/

//long ll_row, ll_idcont, ll_idtrans
//string ls_nomcomplet, ls_adresse, ls_ville, ls_province, ls_zip, ls_telbur
//string ls_nomcont, ls_prenomcont, ls_nom, ls_prenom, ls_nompat, ls_prenompat
//string ls_adressepat, ls_villepat, ls_provpat
//date ldt_datenais
//string ls_langue
//
//il_patid = message.doubleparm


string ls_langue

select langue into :ls_langue from patient where patient_id = :il_patid;

if ls_langue = 'A' then
	dw_formtrans.object.t_to.text = "TO:"
	dw_formtrans.object.t_from.text = "FROM:"
	dw_formtrans.object.t_title.text = "CANADIAN ASSOCIATION OF ORTHODONTISTS"
	dw_formtrans.object.t_formtrans.text = "PATIENT TRANSFER FORM"
	dw_formtrans.object.t_nompat.text = "Name:"
	dw_formtrans.object.t_addrpat.text = "Address:"
	dw_formtrans.object.t_zippat.text = "Postal Code:"
	dw_formtrans.object.t_tel.text = "Telephone:"
	dw_formtrans.object.t_nomortho.text = "Name:"
	dw_formtrans.object.t_addrortho.text = "Address:"
	dw_formtrans.object.t_ziportho.text = "Postal Code:"
	dw_formtrans.object.t_telortho.text = "Telephone:"
	dw_formtrans.object.t_age.text = "Age:"
	dw_formtrans.object.t_resp.text = "Responsible Party:"
	dw_formtrans.object.t_addrresp.text = "Address:"
	dw_formtrans.object.t_analcas.text = "Case Analysis:"
	dw_formtrans.object.t_plantrait.text = "Treatment Plan:"
	dw_formtrans.object.t_tempsest.text = "Estimated treatment time:"
	dw_formtrans.object.t_active.text = "Active:"
	dw_formtrans.object.t_ret.text = "Retention:"
	dw_formtrans.object.t_sorte.text = "Appliance:"
	dw_formtrans.object.t_dim.text = "Bracket Slot Sizes:"
	dw_formtrans.object.t_datepose.text = "Date Bands and/or brackets cemented:"
	dw_formtrans.object.t_diam.text = "Current Archwire Sizes:"
	dw_formtrans.object.t_upper.text = "Upper:"
	dw_formtrans.object.t_lower.text = "Lower:"
	dw_formtrans.object.t_app.text = "Headgear:"
	dw_formtrans.object.t_hour1.text = "Hours requested:"
	dw_formtrans.object.t_elas.text = "Intraoral elastics:"
	dw_formtrans.object.t_force.text = "force direction and"
	dw_formtrans.object.t_grandeur.text = "size:"
	dw_formtrans.object.t_hour2.text = "Hours requested:"
	dw_formtrans.object.t_amov.text = "Removable appliance:"
	dw_formtrans.object.t_hour3.text = "Hours requested:"
	dw_formtrans.object.t_reteneur.text = "Retainers:"
	dw_formtrans.object.t_hour4.text = "Hours requested:"
	dw_formtrans.object.t_instruct.text = "Retention Instructions:"
	dw_formtrans.object.t_coop.text = "Patient Co-operation:"
	dw_formtrans.object.t_hygiene.text = "Oral Hygiene:"
	dw_formtrans.object.t_headgear.text = "Headgear:"
	dw_formtrans.object.t_elastic.text = "Elastics:"
	dw_formtrans.object.t_rdv.text = "Appointments:"
	dw_formtrans.object.t_comment.text = "COMMENTS:"
	dw_formtrans.object.t_progress.text = "Progress to date:"
	dw_formtrans.object.t_obj.text = "Future treatment objectives:"
	dw_formtrans.object.gb_1.text = "Financial Arrangements:"
	dw_formtrans.object.t_estfee.text = "Estimated Fee:"
	dw_formtrans.object.t_modpaie.text = "How arranged:"
	dw_formtrans.object.t_montpaye.text = "Total amount paid before transfer:"
	dw_formtrans.object.t_unpaid.text = "Unpaid amount:"
	dw_formtrans.object.gb_1.text = "Transfer Records:"
	dw_formtrans.object.t_phrase1.text = "Contact our office, we will"
	dw_formtrans.object.t_phrase2.text = "forward records."
	dw_formtrans.object.t_phrase3.text = "Records being forwarded under separate cover."
	dw_formtrans.object.t_phrase4.text = "Our records include:"
	dw_formtrans.object.t_model.text = "Models"
	dw_formtrans.object.t_panorex.text = "Panorex"
	dw_formtrans.object.t_ceph.text = "Ceph"
	dw_formtrans.object.t_photo.text = "Photos"
	dw_formtrans.object.t_trace.text = "Tracings"
	dw_formtrans.object.t_autre.text = "Other"
	dw_formtrans.object.t_desc1.text = "Patient has been advised that office policies for treatment"
	dw_formtrans.object.t_desc2.text = "procedures and fees may vary."
end if
end subroutine

on w_formtrans.create
int iCurrent
call super::create
this.p_lock=create p_lock
this.pb_supprimer=create pb_supprimer
this.pb_ajouter=create pb_ajouter
this.pb_fin=create pb_fin
this.pb_suuivant=create pb_suuivant
this.pb_precedent=create pb_precedent
this.pb_debut=create pb_debut
this.st_title=create st_title
this.cb_update=create cb_update
this.cb_print=create cb_print
this.cb_close=create cb_close
this.p_unlock=create p_unlock
this.dw_formtrans=create dw_formtrans
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_lock
this.Control[iCurrent+2]=this.pb_supprimer
this.Control[iCurrent+3]=this.pb_ajouter
this.Control[iCurrent+4]=this.pb_fin
this.Control[iCurrent+5]=this.pb_suuivant
this.Control[iCurrent+6]=this.pb_precedent
this.Control[iCurrent+7]=this.pb_debut
this.Control[iCurrent+8]=this.st_title
this.Control[iCurrent+9]=this.cb_update
this.Control[iCurrent+10]=this.cb_print
this.Control[iCurrent+11]=this.cb_close
this.Control[iCurrent+12]=this.p_unlock
this.Control[iCurrent+13]=this.dw_formtrans
end on

on w_formtrans.destroy
call super::destroy
destroy(this.p_lock)
destroy(this.pb_supprimer)
destroy(this.pb_ajouter)
destroy(this.pb_fin)
destroy(this.pb_suuivant)
destroy(this.pb_precedent)
destroy(this.pb_debut)
destroy(this.st_title)
destroy(this.cb_update)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.p_unlock)
destroy(this.dw_formtrans)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

event pfc_preopen;call super::pfc_preopen; /*************************************************************
 Créé par: Sébastien Tremblay
 Créé le: 
 Modifié par: Dave Tremblay
 Modifié le: 01-09-2004
 
 Ouverture du formulaire de transfert. Remplir ce qui est nécessaire

 **************************************************************/
il_patid = message.doubleparm

end event

event pfc_postopen;call super::pfc_postopen; /*************************************************************
 Créé par: Sébastien Tremblay
 Créé le: 
 Modifié par: Dave Tremblay
 Modifié le: 01-09-2004
 
 Ouverture du formulaire de transfert. Remplir ce qui est nécessaire

 **************************************************************/

//long ll_row, ll_idcont, ll_idtrans
//string ls_nomcomplet, ls_adresse, ls_ville, ls_province, ls_zip, ls_telbur
//string ls_nomcont, ls_prenomcont, ls_nom, ls_prenom, ls_nompat, ls_prenompat
//string ls_adressepat, ls_villepat, ls_provpat
//date ldt_datenais
//string ls_langue


dw_formtrans.retrieve(il_patid)
st_title.event ue_title()

//SetTransObject(SQLCA)
//if retrieve(il_patid) > 0 then
//	setnull(ll_idtrans)
//	ll_idtrans = getItemNumber(1,'t_transfert_transfert_id')
//	if isnull(ll_idtrans) then SetItemStatus(1, 0, Primary!, New!)
//	ii_modeajout = 1
//	sauve()
//end if
//if retrieve(il_patid) = 0 then
//	ii_modeajout = 1
//	ll_row = insertRow(0)
//	this.SetItem(ll_row, "t_transfert_patient_id", il_patid)
//	this.SetItem(ll_row, "t_transfert_datetr", today())
//	SELECT dr_nom_complet, dr_adresse, dr_ville, dr_province, dr_code_postal, dr_tel_bur 
//	into :ls_nomcomplet, :ls_adresse, :ls_ville, :ls_province, :ls_zip, :ls_telbur
//	from ortho_id
//	where ortho_id = :v_no_ortho;
//	this.setItem(ll_row,"ortho_id_dr_nom_complet",ls_nomcomplet)
//	this.setItem(ll_row,"ortho_id_dr_adresse",ls_adresse)
//	this.setItem(ll_row,"ortho_id_dr_ville",ls_ville)
//	this.setItem(ll_row,"ortho_id_dr_province",ls_province)
//	this.setItem(ll_row,"ortho_id_dr_code_postal",ls_zip)
//	this.setItem(ll_row,"ortho_id_dr_tel_bur",ls_telbur)
//	select id_contact into :ll_idcont from patient where patient_id = :il_patid;
//	select nom, prenom into :ls_nomcont, :ls_prenomcont from t_contact where id_contact = :ll_idcont;
//	this.setItem(ll_row,"t_contact_prenom",ls_prenomcont)
//	this.setItem(ll_row,"t_contact_nom",ls_nomcont)
//	select patient_nom, patient_prenom, date_naissance, adresse, ville, province, code_postale, 
//	into :ls_nompat, :ls_prenompat, :ldt_datenais, :ls_adressepat, :ls_villepat, :ls_provpat
//	from patient where patient_id = :il_patid;
//	this.setItem(ll_row,"t_transfert_tr_nom",ls_nompat + ' ' + ls_prenompat)
//	this.setItem(ll_row,"t_transfert_tr_adresse",ls_adressepat + "~r~n" + ls_villepat + "(" + ls_provpat + ")")
//	this.setITem(ll_row,"t_transfert_tr_cp",
//	this.setItem(ll_row,"patient_date_naissance",ldt_datenais)
//	sauve()
//end if


end event

type p_lock from picture within w_formtrans
string tag = "resize=mr"
integer x = 2537
integer y = 8
integer width = 91
integer height = 80
string picturename = "C:\ii4net\orthotek\images\lock.jpg"
boolean focusrectangle = false
end type

event clicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("typederapport","feuilleanalyse")

// Demander le mot de passe
w_password_unlock lw_win
OpenWithParm(lw_win, "")
IF MEssage.StringParm = "ok" THEN
	p_unlock.visible = TRUE
	p_lock.visible = FALSE
	dw_formtrans.setItem(dw_formtrans.getRow(),'locked',0)
END IF
end event

type pb_supprimer from picturebutton within w_formtrans
string tag = "resize=mr"
integer x = 2743
integer y = 8
integer width = 91
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\annuler.gif"
boolean map3dcolors = true
end type

event clicked;dw_formtrans.deleteRow(dw_formtrans.rowcount())
il_curindex --
if  il_curindex < 1 then
	il_curindex =  1
end if
dw_formtrans.scrollToRow(il_curindex)
st_title.event ue_title()
change = true
end event

type pb_ajouter from picturebutton within w_formtrans
string tag = "resize=mr"
integer x = 2651
integer y = 8
integer width = 91
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\ajout.jpg"
boolean map3dcolors = true
end type

event clicked; il_curindex = dw_formtrans.rowcount() + 1
dw_formtrans.insertRow(il_curindex)
dw_formtrans.scrollToRow(il_curindex)
dw_formtrans.setItem(il_curindex,'t_transfert_patient_Id',il_patid)
dw_formtrans.setItem(il_curindex,'t_transfert_datetr',today())
change = true
st_title.event ue_title()
end event

type pb_fin from picturebutton within w_formtrans
string tag = "resize=mr"
integer x = 3543
integer y = 8
integer width = 91
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRLast!"
boolean map3dcolors = true
end type

event clicked;il_curindex = dw_formtrans.rowcount()
dw_formtrans.scrollToRow (il_curindex)
st_title.event ue_title()
end event

type pb_suuivant from picturebutton within w_formtrans
string tag = "resize=mr"
integer x = 3451
integer y = 8
integer width = 91
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRNext!"
boolean map3dcolors = true
end type

event clicked;il_curindex++
if  il_curindex > dw_formtrans.rowcount() then
	il_curindex =  dw_formtrans.rowcount()
end if
dw_formtrans.scrollnextrow( )
st_title.event ue_title()

end event

type pb_precedent from picturebutton within w_formtrans
string tag = "resize=mr"
integer x = 2926
integer y = 8
integer width = 91
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRPrior!"
boolean map3dcolors = true
end type

event clicked;il_curindex --
if  il_curindex < 1 then
	il_curindex =  1
end if
dw_formtrans.scrollpriorrow( )
st_title.event ue_title()

end event

type pb_debut from picturebutton within w_formtrans
string tag = "resize=mr"
integer x = 2834
integer y = 8
integer width = 91
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "VCRFirst!"
boolean map3dcolors = true
end type

event clicked;il_curindex = dw_formtrans.rowcount()
dw_formtrans.scrollToRow (1)
st_title.event ue_title()
end event

type st_title from statictext within w_formtrans
event ue_title ( )
string tag = "resize=mr"
integer x = 3031
integer y = 12
integer width = 407
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event ue_title();date ldt_datebarre
long ll_debarretrans

st_title.text = string(il_curindex) + ' / ' + string(dw_formtrans.rowcount())
ldt_datebarre = dw_formtrans.getItemdate( dw_formtrans.getRow(), 't_transfert_datebarre')
select debarrer_trans into :ll_debarretrans from t_options where ortho_id = :v_no_ortho;


// Regarder si l'on barre ou non le cadenas

if isnull(ll_debarretrans) then
	dw_formtrans.setItem(dw_formtrans.getRow(),'locked',0)
	p_unlock.visible = true
	p_lock.visible = false
else
	if daysafter(ldt_datebarre,today()) >= ll_debarretrans then
		dw_formtrans.setItem(dw_formtrans.getRow(),'locked',1)
		p_unlock.visible = false
		p_lock.visible = true
	else
		dw_formtrans.setItem(dw_formtrans.getRow(),'locked',0)
		p_unlock.visible = true
		p_lock.visible = false
	end if
end if
end event

type cb_update from commandbutton within w_formtrans
integer x = 2007
integer y = 1932
integer width = 805
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarde"
end type

event constructor;if v_langue = 'an' then
	this.text = "Save"
end if
end event

event clicked;sauve()
end event

type cb_print from commandbutton within w_formtrans
integer y = 1932
integer width = 805
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if
end event

event clicked;datastore ds_formtrans
string ls_langue

ds_formtrans = create datastore
ds_formtrans.dataobject = 'd_formtrans'
ds_formtrans.setTransObject(SQLCA)
ds_formtrans.retrieve(w_patient.il_patid)

select langue into :ls_langue from patient where patient_id = :il_patid;

if ls_langue = 'A' then
	ds_formtrans.object.t_to.text = "TO:"
	ds_formtrans.object.t_from.text = "FROM:"
	ds_formtrans.object.t_title.text = "CANADIAN ASSOCIATION OF ORTHODONTISTS"
	ds_formtrans.object.t_formtrans.text = "PATIENT TRANSFER FORM"
	ds_formtrans.object.t_nompat.text = "Name:"
	ds_formtrans.object.t_addrpat.text = "Address:"
	ds_formtrans.object.t_zippat.text = "Postal Code:"
	ds_formtrans.object.t_tel.text = "Telephone:"
	ds_formtrans.object.t_nomortho.text = "Name:"
	ds_formtrans.object.t_addrortho.text = "Address:"
	ds_formtrans.object.t_ziportho.text = "Postal Code:"
	ds_formtrans.object.t_telortho.text = "Telephone:"
	ds_formtrans.object.t_age.text = "Age:"
	ds_formtrans.object.t_resp.text = "Responsible Party:"
	ds_formtrans.object.t_addrresp.text = "Address:"
	ds_formtrans.object.t_analcas.text = "Case Analysis:"
	ds_formtrans.object.t_plantrait.text = "Treatment Plan:"
	ds_formtrans.object.t_tempsest.text = "Estimated treatment time:"
	ds_formtrans.object.t_active.text = "Active:"
	ds_formtrans.object.t_ret.text = "Retention:"
	ds_formtrans.object.t_sorte.text = "Appliance:"
	ds_formtrans.object.t_dim.text = "Bracket Slot Sizes:"
	ds_formtrans.object.t_datepose.text = "Date Bands and/or brackets cemented:"
	ds_formtrans.object.t_diam.text = "Current Archwize Sizes:"
	ds_formtrans.object.t_upper.text = "Upper:"
	ds_formtrans.object.t_lower.text = "Lower:"
	ds_formtrans.object.t_app.text = "Headgear:"
	ds_formtrans.object.t_hour1.text = "Hours requested:"
	ds_formtrans.object.t_elas.text = "Intraoral elastics:"
	ds_formtrans.object.t_force.text = "force direction and"
	ds_formtrans.object.t_grandeur.text = "size:"
	ds_formtrans.object.t_hour2.text = "Hours requested:"
	ds_formtrans.object.t_amov.text = "Removable appliance:"
	ds_formtrans.object.t_hour3.text = "Hours requested:"
	ds_formtrans.object.t_reteneur.text = "Retainers:"
	ds_formtrans.object.t_hour4.text = "Hours requested:"
	ds_formtrans.object.t_instruct.text = "Retention Instructions:"
	ds_formtrans.object.t_coop.text = "Patient Co-operation:"
	ds_formtrans.object.t_hygiene.text = "Oral Hygiene:"
	ds_formtrans.object.t_headgear.text = "Headgear:"
	ds_formtrans.object.t_elastic.text = "Elastics:"
	ds_formtrans.object.t_rdv.text = "Appointments:"
	ds_formtrans.object.t_comment.text = "COMMENTS:"
	ds_formtrans.object.t_progress.text = "Progress to date:"
	ds_formtrans.object.t_obj.text = "Future treatment objectives:"
	ds_formtrans.object.gb_1.text = "Financial Arrangements:"
	ds_formtrans.object.t_estfee.text = "Estimated Fee:"
	ds_formtrans.object.t_modpaie.text = "How arranged:"
	ds_formtrans.object.t_montpaye.text = "Total amount paid before transfer:"
	ds_formtrans.object.t_unpaid.text = "Unpaid amount:"
	ds_formtrans.object.gb_1.text = "Transfer Records:"
	ds_formtrans.object.t_phrase1.text = "Contact our office, we will"
	ds_formtrans.object.t_phrase2.text = "forward record."
	ds_formtrans.object.t_phrase3.text = "Records being forwarded under "
	ds_formtrans.object.t_phrase4.text = "speparate cover. Our records include:"
	ds_formtrans.object.t_model.text = "Models"
	ds_formtrans.object.t_panorex.text = "Panorex"
	ds_formtrans.object.t_ceph.text = "Ceph"
	ds_formtrans.object.t_photo.text = "Photos"
	ds_formtrans.object.t_trace.text = "Tracings"
	ds_formtrans.object.t_autre.text = "Other"
	ds_formtrans.object.t_desc1.text = "Patient has been that office policies treatment"
	ds_formtrans.object.t_desc2.text = "procedures and fees may vary."
	
end if

gi_imp = 1
gb_datawindow = false
openwithparm(w_print_options,ds_formtrans)

end event

type cb_close from commandbutton within w_formtrans
integer x = 2811
integer y = 1932
integer width = 805
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

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

event clicked;if change then
	if error_type(200) = 1 then
		sauve()
	end if
end if
Close(parent)
end event

type p_unlock from picture within w_formtrans
string tag = "resize=mr"
integer x = 2537
integer y = 8
integer width = 91
integer height = 80
string picturename = "C:\ii4net\orthotek\images\unlock.jpg"
boolean focusrectangle = false
end type

type dw_formtrans from u_dw within w_formtrans
integer y = 100
integer width = 3625
integer height = 1828
integer taborder = 10
string title = "none"
string dataobject = "d_formtrans"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;change = true
end event

event editchanged;change = true
end event

event updateend;//long ll_row
//integer test
//
//if rowsinserted <> 0 then
//	ll_row = this.getrow()
//	select max(transfert_id) into :il_trid from t_transfert;
//	if isnull(il_trid) then il_trid = 1
//	this.setitem(ll_row,'transfert_id',il_trid)
//	if ii_modeajout = 1 then
//	  test = this.setitemstatus(ll_row,'transfert_id',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'patient_id',primary!,notmodified!)	
//	  test = this.setitemstatus(ll_row,'patient_prenom',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'patient_nom',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'date_naissance',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'adresse',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'ville',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dr_nom_complet',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dr_adresse',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dr_tel_bur',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dr_code_postal',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dr_ville',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dr_province',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'nom',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'prenom',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'datetr',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'tr_nom',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'tr_adresse',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'tr_cp',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'tr_tel',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'analysecas',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'plantrait',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'tpsesttraitact',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'tpsesttraitret',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'srttech',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dimouv',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dtposapfixe',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'diamfilsht',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'diamfilsbs',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'apptrctyp',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'apptrchrreq',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'elastintdirgr',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'elastinthrreq',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'appamovtyp',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'appamovhrreq',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'retentyp',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'retenhrreq',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'instphreten',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'hygbucc',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'apptrc',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'elast',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'rdv',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'remgen',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'prgr',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'objconttr',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'honest',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'modpaie',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'mntpayavtrs',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'mntrstdu',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'ctctenvdos',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dosenvsep',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dosmod',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dosceph',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dostra',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dospan',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dospho',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'dosaut',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'respnom',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'t_transfert_respadd',primary!,notmodified!)
//	end if
//end if
end event

