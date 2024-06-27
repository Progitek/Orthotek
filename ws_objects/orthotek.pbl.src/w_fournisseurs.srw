$PBExportHeader$w_fournisseurs.srw
forward
global type w_fournisseurs from w_child
end type
type pb_del from picturebutton within w_fournisseurs
end type
type pb_add from picturebutton within w_fournisseurs
end type
type dw_fourncontact from u_dw within w_fournisseurs
end type
type dw_listefournisseurs from u_dw within w_fournisseurs
end type
type sle_rech from singlelineedit within w_fournisseurs
end type
type st_2 from statictext within w_fournisseurs
end type
type cb_print from commandbutton within w_fournisseurs
end type
type st_fournisseur from statictext within w_fournisseurs
end type
type cb_delete from commandbutton within w_fournisseurs
end type
type cb_update from commandbutton within w_fournisseurs
end type
type dw_fournisseurs from u_dw within w_fournisseurs
end type
type cb_close from commandbutton within w_fournisseurs
end type
type cb_insert from commandbutton within w_fournisseurs
end type
type pb_save from picturebutton within w_fournisseurs
end type
end forward

global type w_fournisseurs from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
boolean ib_isupdateable = false
boolean ib_disableclosequery = true
event ue_post_open ( )
pb_del pb_del
pb_add pb_add
dw_fourncontact dw_fourncontact
dw_listefournisseurs dw_listefournisseurs
sle_rech sle_rech
st_2 st_2
cb_print cb_print
st_fournisseur st_fournisseur
cb_delete cb_delete
cb_update cb_update
dw_fournisseurs dw_fournisseurs
cb_close cb_close
cb_insert cb_insert
pb_save pb_save
end type
global w_fournisseurs w_fournisseurs

type variables
integer changement=0
public boolean changecont = false
end variables

forward prototypes
public subroutine maj ()
end prototypes

event ue_post_open();// Ajuste la disponibilité des boutons
//if dw_enregistrement_traitements.rowcount() = 0 then
//	cb_update.enabled = false
//	cb_delete.enabled = false
//end if
end event

public subroutine maj ();long ll_idfourn

if dw_fournisseurs.Update() = 1 then
	commit using SQLCA;
	select max(id_fournisseur) into :ll_idfourn from t_fournisseurs;
	if dw_listefournisseurs.retrieve(v_no_ortho) > 0 then
		dw_listefournisseurs.scrollToRow(dw_listefournisseurs.find("id_fournisseur = " + string(ll_idfourn),0,dw_listefournisseurs.rowcount()))
	end if
	changement = 0
	if dw_listefournisseurs.rowcount() = 0 then
		cb_update.enabled = false
		cb_delete.enabled = false
	end if
else
	rollback using SQLCA;
	error_type(50)
end if

end subroutine

on w_fournisseurs.create
int iCurrent
call super::create
this.pb_del=create pb_del
this.pb_add=create pb_add
this.dw_fourncontact=create dw_fourncontact
this.dw_listefournisseurs=create dw_listefournisseurs
this.sle_rech=create sle_rech
this.st_2=create st_2
this.cb_print=create cb_print
this.st_fournisseur=create st_fournisseur
this.cb_delete=create cb_delete
this.cb_update=create cb_update
this.dw_fournisseurs=create dw_fournisseurs
this.cb_close=create cb_close
this.cb_insert=create cb_insert
this.pb_save=create pb_save
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_del
this.Control[iCurrent+2]=this.pb_add
this.Control[iCurrent+3]=this.dw_fourncontact
this.Control[iCurrent+4]=this.dw_listefournisseurs
this.Control[iCurrent+5]=this.sle_rech
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.cb_print
this.Control[iCurrent+8]=this.st_fournisseur
this.Control[iCurrent+9]=this.cb_delete
this.Control[iCurrent+10]=this.cb_update
this.Control[iCurrent+11]=this.dw_fournisseurs
this.Control[iCurrent+12]=this.cb_close
this.Control[iCurrent+13]=this.cb_insert
this.Control[iCurrent+14]=this.pb_save
end on

on w_fournisseurs.destroy
call super::destroy
destroy(this.pb_del)
destroy(this.pb_add)
destroy(this.dw_fourncontact)
destroy(this.dw_listefournisseurs)
destroy(this.sle_rech)
destroy(this.st_2)
destroy(this.cb_print)
destroy(this.st_fournisseur)
destroy(this.cb_delete)
destroy(this.cb_update)
destroy(this.dw_fournisseurs)
destroy(this.cb_close)
destroy(this.cb_insert)
destroy(this.pb_save)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

w_fournisseurs.postevent('ue_post_open')
end event

event closequery;call super::closequery;if changement = 1 then
	if error_type(200) = 1 then
		maj()
	end if
end if

end event

type pb_del from picturebutton within w_fournisseurs
integer x = 2167
integer y = 1640
integer width = 123
integer height = 116
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Custom080!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Supprimer"
end type

event clicked;dw_fourncontact.event ue_delete()
end event

type pb_add from picturebutton within w_fournisseurs
integer x = 2167
integer y = 1408
integer width = 123
integer height = 116
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Custom038!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Ajouter"
end type

event clicked;dw_fourncontact.event ue_insert()
end event

type dw_fourncontact from u_dw within w_fournisseurs
event ue_insert ( )
event ue_delete ( )
event ue_update ( )
integer y = 1404
integer width = 2158
integer height = 496
integer taborder = 30
string dataobject = "d_fourncontact"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_insert();long ll_row

ll_row = insertRow(0)
setItem(ll_row,'id_fournisseur',dw_fournisseurs.getItemNumber(dw_fournisseurs.getRow(),'id_fournisseur'))
scrollToRow(ll_row)
changecont = true
setFocus()
setcolumn('nom')
end event

event ue_delete();deleteRow(getRow())
changecont = true
event ue_update()
end event

event ue_update();if changecont then
	if update() = 1 then
		commit using SQLCA;
		changecont = false
	else
		rollback using SQLCA;
		error_type(50)
	end if
end if
end event

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)
setTransObject(SQLCA)
setRowFocusIndicator(focusrect!)
end event

event itemchanged;call super::itemchanged;changecont = true
end event

event editchanged;call super::editchanged;changecont = true
end event

type dw_listefournisseurs from u_dw within w_fournisseurs
integer x = 2299
integer y = 192
integer width = 1326
integer height = 1700
integer taborder = 20
string title = "liste des fournisseurs"
string dataobject = "d_listefournisseurs"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
dw_fournisseurs.settransobject(SQLCA)
SetRowFocusIndicator(Hand!)
Retrieve(v_no_ortho)
end event

event rowfocuschanged;if currentrow > 0 then
	if dw_fournisseurs.retrieve(getitemnumber(currentrow,'id_fournisseur')) > 0 then
		dw_fourncontact.retrieve(getitemnumber(currentrow,'id_fournisseur'))
	end if
end if
end event

type sle_rech from singlelineedit within w_fournisseurs
integer x = 2299
integer y = 80
integer width = 1326
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
ls_dnom = Trim(sle_rech.text)+'%'
if Match(ls_dnom, "'") = true then
	v_nb = Pos (ls_dnom, "'")
	if v_nb > 0 then
		ls_dnom = Replace ( ls_dnom, v_nb, 1, "%" )
	end if
end if
//**********************************
no_row = dw_listefournisseurs.Find("upper(compagnie) like '" +upper(ls_dnom)+"'",0,dw_listefournisseurs.rowcount())
if no_row > 0 then
	dw_listefournisseurs.scrolltorow(no_row)
	dw_listefournisseurs.setfocus()	
else
	sle_rech.setfocus()	
end if
end event

type st_2 from statictext within w_fournisseurs
integer x = 2331
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
string text = "Entrez le nom du référent à rechercher :"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_print from commandbutton within w_fournisseurs
integer x = 1422
integer y = 1908
integer width = 718
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer étiquette"
end type

event clicked;long ll_idfourn

if dw_fournisseurs.getRow() > 0 then
	
	ll_idfourn = dw_fournisseurs.getItemNumber(dw_fournisseurs.getRow(),'id_fournisseur')

	datastore ds_etiqfourn
	ds_etiqfourn = create datastore
	ds_etiqfourn.dataobject = "d_etiqfourn"
	ds_etiqfourn.SetTransObject(SQLCA)
	ds_etiqfourn.retrieve(ll_idfourn)
	gi_imp = 10
	gb_datawindow = false
	openwithparm(w_print_options,ds_etiqfourn)
	destroy ds_etiqfourn
	
end if
end event

type st_fournisseur from statictext within w_fournisseurs
integer width = 1271
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Fournisseurs"
boolean focusrectangle = false
end type

event constructor;//if v_langue = 'an' then
//	st_1.Text = "Treatment type"
//end if
end event

type cb_delete from commandbutton within w_fournisseurs
integer x = 727
integer y = 1908
integer width = 695
integer height = 108
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

event clicked;if dw_fournisseurs.getRow() > 0 then
	if error_type(240) = 1 then
		dw_fournisseurs.deleterow(dw_fournisseurs.getrow())
		changement = 1
	end if
end if

end event

event constructor;if v_langue = 'an' then
	cb_delete.Text = "Delete treatment"
end if
end event

type cb_update from commandbutton within w_fournisseurs
integer x = 2139
integer y = 1908
integer width = 736
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;maj()

end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Save"
end if
end event

type dw_fournisseurs from u_dw within w_fournisseurs
integer x = 5
integer y = 92
integer width = 2281
integer height = 1304
integer taborder = 10
string dataobject = "d_fournisseurs"
boolean vscrollbar = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
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

event editchanged;changement = 1
end event

event itemchanged;changement = 1
end event

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)
end event

type cb_close from commandbutton within w_fournisseurs
integer x = 2875
integer y = 1908
integer width = 745
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;Close (parent)
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type cb_insert from commandbutton within w_fournisseurs
integer x = 5
integer y = 1908
integer width = 722
integer height = 108
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

ll_newrow = dw_fournisseurs.InsertRow(0)
dw_fournisseurs.ScrollToRow(ll_newrow)
dw_fournisseurs.setitem(ll_newrow,'ortho_id',v_no_ortho)
dw_fournisseurs.setFocus()
dw_fournisseurs.setcolumn('compagnie')
end event

event constructor;if v_langue = 'an' then
	cb_insert.Text = "New treatment"
end if
end event

type pb_save from picturebutton within w_fournisseurs
integer x = 2167
integer y = 1524
integer width = 123
integer height = 116
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Custom064!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Sauvegarder"
end type

event clicked;dw_fourncontact.event ue_update()
end event

