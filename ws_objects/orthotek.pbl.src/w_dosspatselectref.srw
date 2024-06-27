$PBExportHeader$w_dosspatselectref.srw
forward
global type w_dosspatselectref from window
end type
type sle_rech from singlelineedit within w_dosspatselectref
end type
type dw_liste_referents from u_dw within w_dosspatselectref
end type
type cb_cancel from commandbutton within w_dosspatselectref
end type
type cb_insert from commandbutton within w_dosspatselectref
end type
end forward

global type w_dosspatselectref from window
integer width = 1399
integer height = 1772
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
sle_rech sle_rech
dw_liste_referents dw_liste_referents
cb_cancel cb_cancel
cb_insert cb_insert
end type
global w_dosspatselectref w_dosspatselectref

on w_dosspatselectref.create
this.sle_rech=create sle_rech
this.dw_liste_referents=create dw_liste_referents
this.cb_cancel=create cb_cancel
this.cb_insert=create cb_insert
this.Control[]={this.sle_rech,&
this.dw_liste_referents,&
this.cb_cancel,&
this.cb_insert}
end on

on w_dosspatselectref.destroy
destroy(this.sle_rech)
destroy(this.dw_liste_referents)
destroy(this.cb_cancel)
destroy(this.cb_insert)
end on

type sle_rech from singlelineedit within w_dosspatselectref
integer x = 14
integer y = 8
integer width = 1349
integer height = 112
integer taborder = 10
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
no_row = dw_liste_referents.Find("upper(ref_nom) like '" +upper(ls_dnom)+"'",0,dw_liste_referents.rowcount())
if no_row > 0 then
	dw_liste_referents.scrolltorow(no_row)
	sle_rech.setfocus()	
else
	sle_rech.setfocus()	
end if
end event

type dw_liste_referents from u_dw within w_dosspatselectref
integer x = 14
integer y = 136
integer width = 1349
integer height = 1488
integer taborder = 10
string title = "liste_referents"
string dataobject = "d_liste_referents"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetFilter("actif = 1")
Retrieve(v_no_ortho)
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

type cb_cancel from commandbutton within w_dosspatselectref
integer x = 795
integer y = 1636
integer width = 567
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
boolean cancel = true
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type cb_insert from commandbutton within w_dosspatselectref
integer x = 14
integer y = 1636
integer width = 567
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "OK"
end type

event clicked;long ll_id

ll_id = dw_liste_referents.getitemnumber(dw_liste_referents.getrow(),'id')
if ll_id > 0 then
	update patient set referant_nom = :ll_id where patient_id = :message.doubleparm;
	commit;
end if
close(parent)
end event

