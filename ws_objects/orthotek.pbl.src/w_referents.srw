$PBExportHeader$w_referents.srw
forward
global type w_referents from w_child
end type
type cb_3 from commandbutton within w_referents
end type
type cb_2 from commandbutton within w_referents
end type
type cb_1 from commandbutton within w_referents
end type
type st_5 from statictext within w_referents
end type
type st_4 from statictext within w_referents
end type
type st_3 from statictext within w_referents
end type
type sle_3 from singlelineedit within w_referents
end type
type sle_2 from singlelineedit within w_referents
end type
type sle_1 from singlelineedit within w_referents
end type
type cb_delete from commandbutton within w_referents
end type
type ds_etiquette_referents1 from u_dw within w_referents
end type
type cb_print from commandbutton within w_referents
end type
type st_2 from statictext within w_referents
end type
type dw_liste_referents from u_dw within w_referents
end type
type sle_nom_referent from singlelineedit within w_referents
end type
type st_1 from statictext within w_referents
end type
type cb_insert from commandbutton within w_referents
end type
type dw_referents from u_dw within w_referents
end type
type cb_update from commandbutton within w_referents
end type
type cb_close from commandbutton within w_referents
end type
type gb_nbref from groupbox within w_referents
end type
end forward

global type w_referents from w_child
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
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
boolean ib_isupdateable = false
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
st_5 st_5
st_4 st_4
st_3 st_3
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
cb_delete cb_delete
ds_etiquette_referents1 ds_etiquette_referents1
cb_print cb_print
st_2 st_2
dw_liste_referents dw_liste_referents
sle_nom_referent sle_nom_referent
st_1 st_1
cb_insert cb_insert
dw_referents dw_referents
cb_update cb_update
cb_close cb_close
gb_nbref gb_nbref
end type
global w_referents w_referents

type variables
int changement = 0
private boolean gb_addmode = false 
end variables

forward prototypes
public function integer save ()
end prototypes

public function integer save ();//////////////////////////////
//
// Créé par: Eric Vézina
// Créé le : 24-10-2003
// Demande : 
// Version : 7.6.2
// Modifié par: Dave Tremblay
// Modifié le: 30-10-2003
// 
////////////////////////////////

int enr
long v_referent_id, no_row

dw_referents.AcceptText()
enr = dw_referents.getrow()
if dw_referents.update() = 1 then
	commit using SQLCA;
	changement = 0
	
	//selectionner le referent cree
	if gb_addmode then
		dw_liste_referents.retrieve(v_no_ortho)
		Select max(id) into :v_referent_id from t_referents;
		no_row = dw_liste_referents.Find("id = " + string(v_referent_id),0,dw_liste_referents.rowcount())
		dw_liste_referents.scrolltorow(no_row)
	end if
	dw_liste_referents.setfocus()
	if isvalid(w_dossier_patients) then
		w_dossier_patients.dddwin.setfilter("ortho_id = " + string(v_no_ortho))
		w_dossier_patients.dddwin.retrieve()
	end if
else
	rollback using SQLCA;
	error_type(50)
end if
return 1

if isvalid(w_dossier_patients) then
	w_dossier_patients.dddwin.retrieve()
end if
gb_addmode = false
end function

on w_referents.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.cb_delete=create cb_delete
this.ds_etiquette_referents1=create ds_etiquette_referents1
this.cb_print=create cb_print
this.st_2=create st_2
this.dw_liste_referents=create dw_liste_referents
this.sle_nom_referent=create sle_nom_referent
this.st_1=create st_1
this.cb_insert=create cb_insert
this.dw_referents=create dw_referents
this.cb_update=create cb_update
this.cb_close=create cb_close
this.gb_nbref=create gb_nbref
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.st_5
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.st_3
this.Control[iCurrent+7]=this.sle_3
this.Control[iCurrent+8]=this.sle_2
this.Control[iCurrent+9]=this.sle_1
this.Control[iCurrent+10]=this.cb_delete
this.Control[iCurrent+11]=this.ds_etiquette_referents1
this.Control[iCurrent+12]=this.cb_print
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.dw_liste_referents
this.Control[iCurrent+15]=this.sle_nom_referent
this.Control[iCurrent+16]=this.st_1
this.Control[iCurrent+17]=this.cb_insert
this.Control[iCurrent+18]=this.dw_referents
this.Control[iCurrent+19]=this.cb_update
this.Control[iCurrent+20]=this.cb_close
this.Control[iCurrent+21]=this.gb_nbref
end on

on w_referents.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.cb_delete)
destroy(this.ds_etiquette_referents1)
destroy(this.cb_print)
destroy(this.st_2)
destroy(this.dw_liste_referents)
destroy(this.sle_nom_referent)
destroy(this.st_1)
destroy(this.cb_insert)
destroy(this.dw_referents)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.gb_nbref)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

sle_nom_referent.SetFocus()
st_5.text = string(year(today())-2)
st_4.text = string(year(today())-1)
st_3.text = string(year(today()))
end event

event closequery;call super::closequery;dw_referents.AcceptText()
if changement=1 then
	choose case error_type(259)
		case 1
			if save() = 0 then return 1
		case 3
			return 1
	end choose
end if

end event

type cb_3 from commandbutton within w_referents
integer x = 9
integer y = 1744
integer width = 576
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Liste"
end type

event clicked;opensheet(w_listreferents,w_principal,2,layered!)
end event

type cb_2 from commandbutton within w_referents
integer x = 9
integer y = 1840
integer width = 576
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Passer dentiste"
end type

event clicked;long ll_id,ll_row,ll_ortho,ll_count,ll_idsal
string ls_add,ls_ville,ls_sex,ls_prov,ls_zip,ls_langue,ls_telbur
string ls_telfax,ls_note,ls_email,ls_nomcompl,ls_nom,ls_prenom
    
ll_row = dw_referents.getrow()
ll_id = dw_referents.getitemnumber(ll_row,'id')
ls_add = dw_referents.getitemstring(ll_row,'ref_adresse')
ls_ville = dw_referents.getitemstring(ll_row,'ref_ville')
ls_sex = dw_referents.getitemstring(ll_row,'ref_sexe')
if ls_sex = 'f' then
	ls_sex = 'F'
else
	ls_sex = 'M'
end if
ls_prov = dw_referents.getitemstring(ll_row,'ref_province')
ls_zip = dw_referents.getitemstring(ll_row,'ref_zip')
ls_langue = dw_referents.getitemstring(ll_row,'ref_langue')
ls_telbur = dw_referents.getitemstring(ll_row,'ref_tel_bur')
ls_telfax = dw_referents.getitemstring(ll_row,'ref_tel_fax')
ls_note = dw_referents.getitemstring(ll_row,'ref_note')
ls_email = dw_referents.getitemstring(ll_row,'ref_email')
ls_nomcompl = dw_referents.getitemstring(ll_row,'ref_nom_complet')
ll_idsal = dw_referents.getitemnumber(ll_row,'id_sal')
ls_nom = dw_referents.getitemstring(ll_row,'ref_nom')
ls_prenom = dw_referents.getitemstring(ll_row,'ref_prenom')
ll_ortho = dw_referents.getitemnumber(ll_row,'ortho_id')
select count(*) into :ll_count from t_dentists where det_nom = :ls_nom and det_prenom = :ls_prenom and ortho_id = :ll_ortho;
if ll_count > 0 then
	if error_type(225) = 1 then
		insert into t_dentists(det_add,det_ville,det_prov,det_zip,det_langue,det_telbur,det_fax,det_note,det_email,det_nom,det_prenom,ortho_id,id_sal,det_sex) 
		values(:ls_add,:ls_ville,:ls_prov,:ls_zip,:ls_langue,:ls_telbur,:ls_telfax,:ls_note,:ls_email,:ls_nom,:ls_prenom,:ll_ortho,:ll_idsal,:ls_sex);
	end if
else
	insert into t_dentists(det_add,det_ville,det_prov,det_zip,det_langue,det_telbur,det_fax,det_note,det_email,det_nom,det_prenom,ortho_id,id_sal,det_sex) 
	values(:ls_add,:ls_ville,:ls_prov,:ls_zip,:ls_langue,:ls_telbur,:ls_telfax,:ls_note,:ls_email,:ls_nom,:ls_prenom,:ll_ortho,:ll_idsal,:ls_sex);
end if
end event

event constructor;if v_langue = 'an' then
	this.text = "Pass as dentist"
end if
end event

type cb_1 from commandbutton within w_referents
integer x = 1161
integer y = 1932
integer width = 576
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Patient référé"
end type

event clicked;opensheetwithparm(w_referents_patient,dw_liste_referents.getitemnumber(dw_liste_referents.getrow(),'id'),w_principal,2,layered!)
w_referents.title = "Liste des patients par référents"
end event

event constructor;if v_langue = 'an' then
	this.text = "Patient refered"
end if
end event

type st_5 from statictext within w_referents
integer x = 654
integer y = 1816
integer width = 233
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_referents
integer x = 1166
integer y = 1816
integer width = 233
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_referents
integer x = 1678
integer y = 1816
integer width = 233
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_3 from singlelineedit within w_referents
integer x = 1925
integer y = 1816
integer width = 251
integer height = 84
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
end type

type sle_2 from singlelineedit within w_referents
integer x = 1413
integer y = 1816
integer width = 251
integer height = 84
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
end type

type sle_1 from singlelineedit within w_referents
integer x = 901
integer y = 1816
integer width = 251
integer height = 84
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean border = false
end type

type cb_delete from commandbutton within w_referents
integer x = 585
integer y = 1932
integer width = 576
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

event clicked;//////////////////////////////
//
// Créé par: Dave Tremblay
// Créé le : 14-11-2003
// Demande : 
// Version : 7.6.4
// Modifié par: Dave Tremblay
// Modifié le: 14-11-2003
// 
////////////////////////////////

long ll_idref, ll_count, ll_row, ll_cursor

ll_idref = dw_referents.getItemNumber(dw_referents.getRow(),'id')
select count(*) into :ll_count from patient where referant_nom = :ll_idref;
if ll_count > 0 then
	if error_type(237) = 1 then
		update patient set referant_nom = null where referant_nom = :ll_idref;
		commit using SQLCA;
		ll_row = dw_referents.getrow()
		dw_referents.deleterow(ll_row)
		if dw_referents.update() = 1 then
			commit using SQLCA;
		else
			rollback using SQLCA;
		end if
		dw_liste_referents.retrieve(v_no_ortho)
		if ll_row = 1 then
			dw_liste_referents.event rowfocuschanged(1)
		end if
	else
		return
	end if
else
	ll_row = dw_referents.getrow()
	dw_referents.deleterow(ll_row)
	if dw_referents.update() = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
	ll_cursor = dw_liste_referents.getrow()
	dw_liste_referents.setredraw(false)
	dw_liste_referents.retrieve(v_no_ortho)
	if ll_row = 1 then
		dw_liste_referents.event rowfocuschanged(1)
	end if
	dw_liste_referents.scrolltorow(ll_cursor - 1)
	dw_liste_referents.setredraw(true)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = "Delete"
end if
end event

type ds_etiquette_referents1 from u_dw within w_referents
boolean visible = false
integer x = 750
integer y = 1172
integer width = 1175
integer height = 432
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "d_etiquettes_referents1"
end type

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the error message
RETURN 1
end event

type cb_print from commandbutton within w_referents
integer x = 1737
integer y = 1932
integer width = 576
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imp. étiquette"
end type

event clicked;int v_referents_id

datastore ds_etiqref
ds_etiqref = create datastore
ds_etiqref.dataobject = "d_etiquettes_referents1"
ds_etiqref.SetTransObject(SQLCA)
v_referents_id = dw_liste_referents.getitemnumber(dw_liste_referents.getrow(),'id')
ds_etiqref.retrieve(v_referents_id)
gi_imp = 2
gb_datawindow = false
gb_imp = true
openwithparm(w_print_options,ds_etiqref)
destroy ds_etiqref

end event

event constructor;if v_langue = 'an' then
	this.text = "Print label"
end if
end event

type st_2 from statictext within w_referents
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
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entrez le nom du référent à rechercher :"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Enter the name of the referal to search :"
end if
end event

type dw_liste_referents from u_dw within w_referents
integer x = 2272
integer y = 200
integer width = 1326
integer height = 1700
integer taborder = 30
string title = "liste des référents"
string dataobject = "d_liste_referents"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
dw_referents.SetTransObject(SQLCA)
SetRowFocusIndicator(Hand!)
retrieve(v_no_ortho)
end event

event rowfocuschanged;long v_referent, enr, ll_un, ll_deux, ll_trois

enr = dw_liste_referents.getrow()
if enr > 0 then
	v_referent = dw_liste_referents.getitemnumber(enr,"id")
	dw_referents.retrieve(v_referent)
	select count(*) into :ll_un from patient where  referant_nom = :v_referent and years(opendoss) = years(today())-2;
	sle_1.text = string(ll_un)
	select count(*) into :ll_deux from patient where referant_nom = :v_referent and years(opendoss) = years(today())-1;
	sle_2.text = string(ll_deux)
	select count(*) into :ll_trois from patient where  referant_nom = :v_referent and years(opendoss) = years(today());
	sle_3.text = string(ll_trois)
end if
end event

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the error message
RETURN 1
end event

event rowfocuschanging;call super::rowfocuschanging;dw_referents.AcceptText()
if changement = 1 then
	CHOOSE CASE error_type(259) 
		CASE 1
			if save() = 0 then
				return 1
			end if
		CASE 2 
			changement = 0
		CASE 3
			return 1
	END CHOOSE
end if
end event

type sle_nom_referent from singlelineedit within w_referents
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
integer no_row, v_nb

//pour regler le bug des apostrophes
ls_dnom = Trim(sle_nom_referent.text)+'%'
if Match(ls_dnom, "'") = true then
	v_nb = Pos (ls_dnom, "'")
	if v_nb > 0 then
		ls_dnom = Replace ( ls_dnom, v_nb, 1, "%" )
	end if
end if
//**********************************
no_row = dw_liste_referents.Find("upper(ref_nom) like '" +upper(ls_dnom)+"'",0,dw_liste_referents.rowcount())
if no_row > 0 then
	dw_liste_referents.scrolltorow(no_row)
	dw_referents.setfocus()	
else
	sle_nom_referent.setfocus()	
end if
end event

type st_1 from statictext within w_referents
integer width = 654
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "RÉFÉRENTS"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "REFERRAL"
end if

end event

type cb_insert from commandbutton within w_referents
integer x = 9
integer y = 1932
integer width = 576
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

event clicked;dw_referents.event ue_insert()
end event

event constructor;if v_langue = 'an' then
	this.text = "Insert"
end if
end event

type dw_referents from u_dw within w_referents
event ue_insert ( )
integer x = 14
integer y = 88
integer width = 2245
integer height = 1628
integer taborder = 10
string title = "referents"
string dataobject = "d_referents"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_insert();long ll_newrow
dw_referents.SetFocus()
ll_newrow = dw_referents.InsertRow(0)
dw_referents.ScrollToRow(ll_newrow)
dw_referents.setitem(ll_newrow,'ortho_id',v_no_ortho)
dw_referents.setitem(ll_newrow,'actif',1)
gb_addmode = true
changement=1
end event

event editchanged;changement = 1
end event

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the error message
RETURN 1
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	this.object.t_sal.text = "Greetings:"
	this.object.nom_t.text = "Last Name:"
	this.object.t_1.text = "First name:"
	this.object.adresse_t.text = "Address:"
	this.object.ville_t.text = "City:"
	this.object.sexe_t.text = "Sex:"
	this.object.t_2.text = "Title:"
	this.object.zip_t.text = "Postal code:"
	this.object.langue_t.text = "Language:"
	this.object.tel_bur_t.text = "Tel office:"
	this.object.telfax_t.text = "Fax:"
//	this.object.ref_suffix.values = 'Dr~tDr/Dre~tDre/Mr~tMonsieur/Miss~tMadame/Dentist~tDentiste/Pub~tPub'
	this.object.ref_sexe.values = 'Male~th/Female~tf'
	this.object.ref_langue.values = 'French~tfr/English~tan/Spanish~tes'
	this.object.ref_province.values = 'Quebec~tQC/USA~tUSA/Ontario~tOntario/Manitoba~tManitoba/Saskatchewan~tSaskatchewan/Alberta~tAlberta/British Columbia~tBritish Colombia/NewFoundland~tNewFoundland/New Brunswick~tNew Brunswick/Nova Scotia~tNova Scotia/Price Edward island~tPrice Edward island/Yukon~tYukon/North West Territory~tNorthwest Territories'
else
//	this.object.ref_suffix.values = 'Dr~tDr/Dre~tDre/Monsieur~tMonsieur/Madame~tMadame/Dentiste~tDentiste/Pub~tPub'
	this.object.ref_sexe.values = 'Homme~th/Femme~tf'
	this.object.ref_langue.values = 'Français~tfr/Anglais~tan/Espagnol~tes'
	this.object.ref_province.values = 'Quebec~tQC/USA~tUSA/Ontario~tOntario/Manitoba~tManitoba/Saskatchewan~tSaskatchewan/Alberta~tAlberta/Colombie Britanique~tColombie Britanique/Terre neuve~tTerre Neuve/Nouveau Brunswick~tNouveau Brunswick/Nouvelle Écosse~tNouvelle Écosse/Île-du-Price-Edward~tÎle-du-Price-Edward/Yukon~tYukon/Territoires du Nord-Ouest~tTerritoire du Nord-Ouest'
end if

	

end event

event itemchanged;changement = 1
end event

type cb_update from commandbutton within w_referents
integer x = 2313
integer y = 1932
integer width = 635
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

event constructor;if v_langue = 'an' then
	this.text = "Save"
end if
end event

type cb_close from commandbutton within w_referents
integer x = 2949
integer y = 1932
integer width = 667
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

event clicked;close(parent)
if isvalid(w_dossier_patients) then
	w_dossier_patients.dddw_ref.SetTransObject(SQLCA)
	w_dossier_patients.dddw_ref.retrieve()
	w_dossier_patients.dddw_ref2.SetTransObject(SQLCA)
	w_dossier_patients.dddw_ref2.retrieve()
	
end if

end event

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

type gb_nbref from groupbox within w_referents
integer x = 631
integer y = 1744
integer width = 1573
integer height = 180
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre de référence(s) par année"
borderstyle borderstyle = stylebox!
end type

event constructor;if v_langue = 'an' then
	this.text = 'Number of reference per year'
end if
end event

