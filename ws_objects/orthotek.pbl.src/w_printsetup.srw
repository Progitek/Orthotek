$PBExportHeader$w_printsetup.srw
forward
global type w_printsetup from window
end type
type st_3 from statictext within w_printsetup
end type
type cb_3 from commandbutton within w_printsetup
end type
type cb_2 from commandbutton within w_printsetup
end type
type cb_1 from commandbutton within w_printsetup
end type
type sle_copies from singlelineedit within w_printsetup
end type
type sle_printer from singlelineedit within w_printsetup
end type
type st_2 from statictext within w_printsetup
end type
type st_1 from statictext within w_printsetup
end type
end forward

global type w_printsetup from window
integer width = 1637
integer height = 640
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
st_3 st_3
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
sle_copies sle_copies
sle_printer sle_printer
st_2 st_2
st_1 st_1
end type
global w_printsetup w_printsetup

on w_printsetup.create
this.st_3=create st_3
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.sle_copies=create sle_copies
this.sle_printer=create sle_printer
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.st_3,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.sle_copies,&
this.sle_printer,&
this.st_2,&
this.st_1}
end on

on w_printsetup.destroy
destroy(this.st_3)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.sle_copies)
destroy(this.sle_printer)
destroy(this.st_2)
destroy(this.st_1)
end on

type st_3 from statictext within w_printsetup
integer x = 23
integer y = 24
integer width = 969
integer height = 88
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Configuration d~'impression"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_printsetup
integer x = 613
integer y = 424
integer width = 553
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
end type

event clicked;closewithreturn(parent,0)
end event

type cb_2 from commandbutton within w_printsetup
integer x = 27
integer y = 424
integer width = 585
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Changer Imprimante"
end type

event clicked;printsetup()
end event

type cb_1 from commandbutton within w_printsetup
integer x = 1166
integer y = 424
integer width = 439
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

event clicked;closewithreturn(parent,1)
end event

type sle_copies from singlelineedit within w_printsetup
integer x = 1189
integer y = 168
integer width = 293
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_printer from singlelineedit within w_printsetup
integer x = 384
integer y = 304
integer width = 1093
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_printsetup
integer x = 37
integer y = 312
integer width = 347
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
string text = "IImprimante"
boolean focusrectangle = false
end type

type st_1 from statictext within w_printsetup
integer x = 37
integer y = 168
integer width = 1138
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
string text = "Combien voulez-vous imprimer de copies? "
boolean focusrectangle = false
end type

