$PBExportHeader$w_feuilletempsreg.srw
forward
global type w_feuilletempsreg from window
end type
type cb_print from commandbutton within w_feuilletempsreg
end type
type cb_close from commandbutton within w_feuilletempsreg
end type
end forward

global type w_feuilletempsreg from window
integer width = 3648
integer height = 2044
windowtype windowtype = response!
long backcolor = 67108864
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
cb_print cb_print
cb_close cb_close
end type
global w_feuilletempsreg w_feuilletempsreg

type variables
public int changement = 0
end variables

on w_feuilletempsreg.create
this.cb_print=create cb_print
this.cb_close=create cb_close
this.Control[]={this.cb_print,&
this.cb_close}
end on

on w_feuilletempsreg.destroy
destroy(this.cb_print)
destroy(this.cb_close)
end on

type cb_print from commandbutton within w_feuilletempsreg
integer x = 5
integer y = 1908
integer width = 521
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;//gb_datawindow = true
//openwithparm(w_print_options,dw_logs)
end event

type cb_close from commandbutton within w_feuilletempsreg
integer x = 3026
integer y = 1908
integer width = 590
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)
end event

