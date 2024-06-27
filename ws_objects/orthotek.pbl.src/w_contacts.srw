$PBExportHeader$w_contacts.srw
forward
global type w_contacts from w_child
end type
type cb_enveloppe from commandbutton within w_contacts
end type
type cb_etiq from commandbutton within w_contacts
end type
type cb_delete from commandbutton within w_contacts
end type
type cb_print from commandbutton within w_contacts
end type
type st_2 from statictext within w_contacts
end type
type dw_contactmaster from u_dw within w_contacts
end type
type sle_rech from singlelineedit within w_contacts
end type
type st_title from statictext within w_contacts
end type
type cb_insert from commandbutton within w_contacts
end type
type cb_update from commandbutton within w_contacts
end type
type cb_close from commandbutton within w_contacts
end type
type dw_contact from u_dw within w_contacts
end type
end forward

global type w_contacts from w_child
integer width = 3630
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_enveloppe cb_enveloppe
cb_etiq cb_etiq
cb_delete cb_delete
cb_print cb_print
st_2 st_2
dw_contactmaster dw_contactmaster
sle_rech sle_rech
st_title st_title
cb_insert cb_insert
cb_update cb_update
cb_close cb_close
dw_contact dw_contact
end type
global w_contacts w_contacts

type variables
public boolean change = false
public boolean ib_ajout = false
end variables

forward prototypes
public function integer save ()
end prototypes

public function integer save ();string v_suffix, v_nom, v_prenom, v_nom_complet
long row,ll_idcontact, no_row

dw_contact.AcceptText()
row = dw_contactmaster.getrow()
if dw_contact.update() = 1 then
	commit using SQLCA;
	dw_contactmaster.retrieve(v_no_ortho)
	if ib_ajout then
		//selectionner le referent cree
		Select max(id_contact) into :ll_idcontact from t_contact;
		no_row = dw_contactmaster.Find("string(id_contact) = '" +string(ll_idcontact)+"'",0,dw_contactmaster.rowcount())
		dw_contactmaster.scrolltorow(no_row)
		dw_contactmaster.setfocus()
		ib_ajout = false
	else
		dw_contactmaster.scrolltorow(row)
		dw_contactmaster.setfocus()
	end if
	change = false
else
	rollback using SQLCA;
	error_type(50)
end if
return 1

end function

on w_contacts.create
int iCurrent
call super::create
this.cb_enveloppe=create cb_enveloppe
this.cb_etiq=create cb_etiq
this.cb_delete=create cb_delete
this.cb_print=create cb_print
this.st_2=create st_2
this.dw_contactmaster=create dw_contactmaster
this.sle_rech=create sle_rech
this.st_title=create st_title
this.cb_insert=create cb_insert
this.cb_update=create cb_update
this.cb_close=create cb_close
this.dw_contact=create dw_contact
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enveloppe
this.Control[iCurrent+2]=this.cb_etiq
this.Control[iCurrent+3]=this.cb_delete
this.Control[iCurrent+4]=this.cb_print
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.dw_contactmaster
this.Control[iCurrent+7]=this.sle_rech
this.Control[iCurrent+8]=this.st_title
this.Control[iCurrent+9]=this.cb_insert
this.Control[iCurrent+10]=this.cb_update
this.Control[iCurrent+11]=this.cb_close
this.Control[iCurrent+12]=this.dw_contact
end on

on w_contacts.destroy
call super::destroy
destroy(this.cb_enveloppe)
destroy(this.cb_etiq)
destroy(this.cb_delete)
destroy(this.cb_print)
destroy(this.st_2)
destroy(this.dw_contactmaster)
destroy(this.sle_rech)
destroy(this.st_title)
destroy(this.cb_insert)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.dw_contact)
end on

event open;sle_rech.SetFocus()

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

end event

type cb_enveloppe from commandbutton within w_contacts
integer x = 1957
integer y = 1932
integer width = 498
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Enveloppe"
end type

event clicked;if dw_contact.getrow() > 0 then
	
	string		ls_logo
	datastore 	ds_envresp
	
	ds_envresp = create datastore
	ds_envresp.dataobject = "d_enveloppe_contact"
	ds_envresp.SetTransObject(SQLCA)
	ds_envresp.retrieve(dw_contact.getitemnumber(dw_contact.getrow(),'id_contact'))
	
	if ds_envresp.getItemString(ds_envresp.getRow(),'province') <> 'USA' then
		ds_envresp.modify("zip.EditMask.Mask = '!#! #!#'")
	else
		ds_envresp.modify("zip.EditMask.Mask = ''")
	end if
	
	//Récupérer le logo
	select chemin_logo
	into :ls_logo
	from t_options
	where ortho_id = :v_no_ortho;	
	
	IF Isnull(ls_logo) = false AND ls_logo <> "" THEN
		ds_envresp.object.p_logo.filename = ls_logo
	END IF
	
	gb_datawindow = false
	openwithparm(w_print_options,ds_envresp)
	destroy ds_envresp
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Envelope'
end if
end event

type cb_etiq from commandbutton within w_contacts
integer x = 1458
integer y = 1932
integer width = 498
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Étiquette"
end type

event clicked;if dw_contact.getrow() > 0 then
	datastore ds_etiqcontact
	ds_etiqcontact = create datastore
	ds_etiqcontact.dataobject = "d_etiqcontact"
	ds_etiqcontact.SetTransObject(SQLCA)
	ds_etiqcontact.retrieve(dw_contact.getitemnumber(dw_contact.getrow(),'id_contact'))
	gi_imp = 2 // etiquette
	gb_datawindow = false
	openwithparm(w_print_options,ds_etiqcontact)
	destroy ds_etiqcontact
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Label'
end if
end event

type cb_delete from commandbutton within w_contacts
integer x = 498
integer y = 1932
integer width = 480
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;dw_contact.deleterow(dw_contact.getrow())
dw_contact.update()
commit;
dw_contactmaster.retrieve(v_no_ortho)
end event

event constructor;if v_langue = "an" then
	this.text = "Delete"
end if
end event

type cb_print from commandbutton within w_contacts
integer x = 978
integer y = 1932
integer width = 480
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Groupe"
end type

event clicked;open(w_contgroup)


end event

event constructor;if v_langue = "an" then
	this.text = "Group"
end if
end event

type st_2 from statictext within w_contacts
integer x = 2299
integer y = 8
integer width = 1289
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entrez le nom du contact à rechercher :"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = "an" then
	this.text = "Enter name of contact to search"
end if
end event

type dw_contactmaster from u_dw within w_contacts
integer x = 2272
integer y = 200
integer width = 1326
integer height = 1724
integer taborder = 30
string title = "contactmaster"
string dataobject = "d_contactmaster"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
dw_contact.SetTransObject(SQLCA)
SetRowFocusIndicator(Hand!)
retrieve(v_no_ortho)
end event

event rowfocuschanged;long ll_idcontact

if currentrow > 0 then
	ll_idcontact = dw_contactmaster.getitemnumber(currentrow,"id_contact")
	dw_contact.retrieve(ll_idcontact)
	if dw_contact.getItemString(dw_contact.getRow(),'province') <> 'USA' then
		dw_contact.modify("zip.EditMask.Mask = '!#! #!#'")
	else
		dw_contact.modify("zip.EditMask.Mask = ''")
	end if
end if

end event

type sle_rech from singlelineedit within w_contacts
integer x = 2272
integer y = 88
integer width = 1321
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

event modified;string ls_dnom
long no_row
integer v_nb

//pour regler le bug des apostrophes
ls_dnom = Trim(sle_rech.text)+'%'
if Match(ls_dnom, "'") = true then
	v_nb = Pos (ls_dnom, "'")
	if v_nb > 0 then
		ls_dnom = Replace ( ls_dnom, v_nb, 1, "%" )
	end if
end if
//**********************************
no_row = dw_contactmaster.Find("upper(nom) like '" +upper(ls_dnom)+"'",0,dw_contactmaster.rowcount())
if no_row > 0 then
	dw_contactmaster.scrolltorow(no_row)
	dw_contact.setfocus()	
else
	sle_rech.setfocus()	
end if
end event

type st_title from statictext within w_contacts
integer width = 754
integer height = 76
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Liste des contacts"
boolean focusrectangle = false
end type

event constructor;if v_langue = "an" then
	this.text = "Contact list"
end if
end event

type cb_insert from commandbutton within w_contacts
integer x = 14
integer y = 1932
integer width = 480
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event clicked;long ll_newrow

ll_newrow = dw_contact.InsertRow(0)
dw_contact.ScrollToRow(ll_newrow)
dw_contact.setitem(ll_newrow,'ortho_id',v_no_ortho)
dw_contact.setitem(ll_newrow,'province','QC')
dw_contact.setitem(ll_newrow,'langue','F')
dw_contact.SetFocus()
change = true
ib_ajout = true
end event

event constructor;if v_langue = "an" then
	this.text = "Add"
end if
end event

type cb_update from commandbutton within w_contacts
integer x = 2459
integer y = 1932
integer width = 521
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;save()
end event

event constructor;if v_langue = "an" then
	this.text = "Update"
end if
end event

type cb_close from commandbutton within w_contacts
integer x = 3077
integer y = 1932
integer width = 521
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;dw_contact.AcceptText()
if change then
	if error_type(200) = 1 then
		if save() = 0 then
			goto g_exit
		end if
	end if
end if
close(parent)
g_exit:
end event

event constructor;if v_langue = "an" then
	this.text = "Close"
end if
end event

type dw_contact from u_dw within w_contacts
integer x = 14
integer y = 88
integer width = 2245
integer height = 1836
integer taborder = 10
string title = "contact"
string dataobject = "d_contact"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event editchanged;integer li_pat
li_pat = getitemnumber(row,'pat')
if li_pat = 1 and dwo.name <> 'note' then
	messagebox('Avertissement!','Passez par le dossier du patient pour changer cette information.',Information!)
	modify('id_contact.update = no')   
	modify('nom.update = no') 
	modify('adresse.update = no') 
	modify('ville.update = no') 
	modify('prenom.update = no') 
	modify('zip.update = no') 
	modify('telres.update = no') 
	modify('telbur.update = no') 
	modify('telautre.update = no')
	modify('patient_id.update = no') 
	modify('province.update = no')
	modify('email.update = no')
	modify('telcell.update = no')
	modify('sex.update = no')
	modify('langue.update = no')
	modify('ortho_id.update = no')
	modify('pat.update = no')
	modify('id_conttype.update = no')
	modify('id_conttype2.update = no')
	modify('id_conttype3.update = no')
	modify('id_conttype4.update = no')
	modify('id_conttype5.update = no')
	modify('id_conttype6.update = no')
	cb_delete.enabled = false
else
	modify('id_contact.update = yes')   
	modify('nom.update = yes') 
	modify('adresse.update = yes') 
	modify('ville.update = yes') 
	modify('prenom.update = yes') 
	modify('zip.update = yes') 
	modify('telres.update = yes') 
	modify('telbur.update = yes') 
	modify('telautre.update = yes') 
	modify('patient_id.update = yes') 
	modify('province.update = yes')
	modify('email.update = yes')
	modify('telcell.update = yes')
	modify('sex.update = yes')
	modify('langue.update = yes')
	modify('ortho_id.update = yes')
	modify('pat.update = yes')
	modify('id_conttype.update = yes')
	modify('id_conttype2.update = yes')
	modify('id_conttype3.update = yes')
	modify('id_conttype4.update = yes')
	modify('id_conttype5.update = yes')
	modify('id_conttype6.update = yes')
	cb_delete.enabled = true
	change = true
end if
end event

event itemchanged;if dwo.name = 'province' then
	if data = 'USA' then
		dw_contact.modify("zip.EditMask.Mask = ''")
	else
		dw_contact.modify("zip.EditMask.Mask = '!#! #!#'")
	end if
end if
change = true
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = "an" then
	this.object.nom_t.text = "Last Name:"
	this.object.t_1.text = "First Name:"
	this.object.adresse_t.text = "Address:"
	this.object.ville_t.text = "City:"
	this.object.code_postal_t.text = "Postal Code:"
	this.object.langue_t.text = "Language:"
	this.object.telbur_t.text = "Tel. (office):"
	this.object.t_3.text = "Tel. (other):"
	this.object.t_sex.text = "Sex:"
	this.object.t_group.text = "Group:"
	this.object.t_clee1.text = "Sort key 1 :"
	this.object.t_clee2.text = "Sort key 2 :"
	this.object.t_clee3.text = "Sort key 3 :"
	this.object.t_clee4.text = "Sort key 4 :"
	this.object.t_clee5.text = "Sort key 5 :"
	this.object.t_clee6.text = "Sort key 6 :"
	object.province.values = 'Quebec~tQC/USA~tUSA/Ontario~tON/Manitoba~tMB/Saskatchewan~tSK/Alberta~tAB/British Columbia~tBC/Newfoundland and Labrador~tNF/New Brunswick~tNB/Nova Scotia~tNS/Price Edward Island~tPE/Yukon~tYukon/North West Territories~tNT/Nunavut~tNU'
else
	object.province.values = 'Québec~tQC/USA~tUSA/Ontario~tON/Manitoba~tMB/Saskatchewan~tSK/Alberta~tAB/Colombie-Britannique~tBC/Terre-Neuve-et-Labrador~tNF/Nouveau-Brunswick~tNB/Nouvelle-Écosse~tNS/Île-du-Prince-Edouard~tPE/Yukon~tYK/Territoires du Nord-Ouest~tNT/Nunavut~tNU'
end if
end event

