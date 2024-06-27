$PBExportHeader$w_choixform.srw
forward
global type w_choixform from window
end type
type rb_stand from radiobutton within w_choixform
end type
type rb_norm from radiobutton within w_choixform
end type
type st_1 from statictext within w_choixform
end type
type cb_1 from commandbutton within w_choixform
end type
end forward

global type w_choixform from window
integer x = 599
integer y = 400
integer width = 1431
integer height = 740
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string pointer = "Arrow!"
rb_stand rb_stand
rb_norm rb_norm
st_1 st_1
cb_1 cb_1
end type
global w_choixform w_choixform

type variables
public long il_traitid = 0
end variables

on w_choixform.create
this.rb_stand=create rb_stand
this.rb_norm=create rb_norm
this.st_1=create st_1
this.cb_1=create cb_1
this.Control[]={this.rb_stand,&
this.rb_norm,&
this.st_1,&
this.cb_1}
end on

on w_choixform.destroy
destroy(this.rb_stand)
destroy(this.rb_norm)
destroy(this.st_1)
destroy(this.cb_1)
end on

event open;il_traitid = message.doubleparm
end event

type rb_stand from radiobutton within w_choixform
integer x = 55
integer y = 276
integer width = 608
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Formulaire standard"
end type

type rb_norm from radiobutton within w_choixform
integer x = 55
integer y = 192
integer width = 617
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Formulaire nomalisé"
boolean checked = true
end type

type st_1 from statictext within w_choixform
integer x = 37
integer y = 32
integer width = 983
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
string text = "Quel formulaire désirez-vous utiliser?"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_choixform
integer x = 997
integer y = 516
integer width = 402
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

event clicked;if rb_norm.checked then
	if il_traitid > 0 then
		SetPointer(HourGlass!)
		OpenWithParm (w_formulaire_normalise,il_traitid, w_traitements)
	else
		error_type(0)
	end if
else
	if rb_stand.checked then
		OpenSheetWithParm (w_assstand, il_traitid, w_principal,2, layered!)
	end if
end if
close(parent)
end event

