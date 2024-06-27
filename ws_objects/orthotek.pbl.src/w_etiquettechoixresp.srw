$PBExportHeader$w_etiquettechoixresp.srw
forward
global type w_etiquettechoixresp from window
end type
type st_patnom from statictext within w_etiquettechoixresp
end type
type st_title from statictext within w_etiquettechoixresp
end type
type dw_etiquettechoixresp from u_dw within w_etiquettechoixresp
end type
type cb_cancel from commandbutton within w_etiquettechoixresp
end type
type cb_ok from commandbutton within w_etiquettechoixresp
end type
end forward

global type w_etiquettechoixresp from window
integer width = 1641
integer height = 1376
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
st_patnom st_patnom
st_title st_title
dw_etiquettechoixresp dw_etiquettechoixresp
cb_cancel cb_cancel
cb_ok cb_ok
end type
global w_etiquettechoixresp w_etiquettechoixresp

on w_etiquettechoixresp.create
this.st_patnom=create st_patnom
this.st_title=create st_title
this.dw_etiquettechoixresp=create dw_etiquettechoixresp
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.Control[]={this.st_patnom,&
this.st_title,&
this.dw_etiquettechoixresp,&
this.cb_cancel,&
this.cb_ok}
end on

on w_etiquettechoixresp.destroy
destroy(this.st_patnom)
destroy(this.st_title)
destroy(this.dw_etiquettechoixresp)
destroy(this.cb_cancel)
destroy(this.cb_ok)
end on

event open;string ls_nom,ls_prenom

select patient_nom,patient_prenom into :ls_nom,:ls_prenom from patient where patient_id = :w_etiquettes.il_patid;
st_patnom.text = ls_prenom + ' ' + ls_nom
end event

type st_patnom from statictext within w_etiquettechoixresp
integer x = 14
integer y = 100
integer width = 1586
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_title from statictext within w_etiquettechoixresp
integer x = 14
integer width = 1586
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
string text = "Choisir le responsable financier"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Choice the financial reponsible'
end if
end event

type dw_etiquettechoixresp from u_dw within w_etiquettechoixresp
integer x = 14
integer y = 196
integer width = 1591
integer height = 1016
integer taborder = 10
string title = "etiquettechoixresp"
string dataobject = "d_etiquettechoixresp"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetRowFocusIndicator(Hand!)
Retrieve(w_etiquettes.il_patid)
end event

type cb_cancel from commandbutton within w_etiquettechoixresp
integer x = 855
integer y = 1228
integer width = 750
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
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

type cb_ok from commandbutton within w_etiquettechoixresp
integer x = 14
integer y = 1228
integer width = 754
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ok"
boolean default = true
end type

event clicked;long ll_contactid

ll_contactid = dw_etiquettechoixresp.getitemnumber(dw_etiquettechoixresp.getrow(),'id_contact')


closewithreturn(parent,ll_contactid)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Ok'
end if
end event

