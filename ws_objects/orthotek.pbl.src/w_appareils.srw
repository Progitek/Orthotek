$PBExportHeader$w_appareils.srw
forward
global type w_appareils from w_child
end type
type cb_1 from commandbutton within w_appareils
end type
type cb_close from commandbutton within w_appareils
end type
type cb_delete from commandbutton within w_appareils
end type
type cb_insert from commandbutton within w_appareils
end type
type dw_1 from datawindow within w_appareils
end type
type st_title from statictext within w_appareils
end type
end forward

global type w_appareils from w_child
integer x = 214
integer y = 221
integer width = 2848
integer height = 2184
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
cb_1 cb_1
cb_close cb_close
cb_delete cb_delete
cb_insert cb_insert
dw_1 dw_1
st_title st_title
end type
global w_appareils w_appareils

on w_appareils.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_close=create cb_close
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
this.dw_1=create dw_1
this.st_title=create st_title
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_delete
this.Control[iCurrent+4]=this.cb_insert
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.st_title
end on

on w_appareils.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.cb_delete)
destroy(this.cb_insert)
destroy(this.dw_1)
destroy(this.st_title)
end on

type cb_1 from commandbutton within w_appareils
integer x = 1207
integer y = 1872
integer width = 1001
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_close from commandbutton within w_appareils
integer x = 2213
integer y = 1872
integer width = 613
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type cb_delete from commandbutton within w_appareils
integer x = 594
integer y = 1872
integer width = 613
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

type cb_insert from commandbutton within w_appareils
integer y = 1872
integer width = 590
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

type dw_1 from datawindow within w_appareils
event ue_update ( )
event ue_insert ( )
integer y = 160
integer width = 2821
integer height = 1692
integer taborder = 10
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_update();// update
end event

event ue_insert();// insert
end event

type st_title from statictext within w_appareils
integer width = 2286
integer height = 108
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Appareils"
boolean focusrectangle = false
end type

