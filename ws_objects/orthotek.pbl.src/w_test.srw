$PBExportHeader$w_test.srw
forward
global type w_test from window
end type
type st_1 from statictext within w_test
end type
type cb_2 from commandbutton within w_test
end type
type cb_1 from commandbutton within w_test
end type
type sle_1 from singlelineedit within w_test
end type
end forward

global type w_test from window
integer width = 1559
integer height = 468
boolean titlebar = true
string title = "Dossier"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_2 cb_2
cb_1 cb_1
sle_1 sle_1
end type
global w_test w_test

on w_test.create
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_1=create sle_1
this.Control[]={this.st_1,&
this.cb_2,&
this.cb_1,&
this.sle_1}
end on

on w_test.destroy
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_1)
end on

type st_1 from statictext within w_test
integer x = 41
integer y = 36
integer width = 1029
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dossier dans lequel le fichier se trouve"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_test
integer x = 1138
integer y = 264
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_test
integer x = 731
integer y = 264
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ok"
boolean default = true
end type

event clicked;if isValid(w_options) then
	w_options.is_test = sle_1.text
end if

close(parent)
end event

type sle_1 from singlelineedit within w_test
integer x = 46
integer y = 156
integer width = 1467
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

