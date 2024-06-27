$PBExportHeader$w_choosefile.srw
forward
global type w_choosefile from window
end type
type sle_nom from singlelineedit within w_choosefile
end type
type st_2 from statictext within w_choosefile
end type
type st_1 from statictext within w_choosefile
end type
type cb_close from commandbutton within w_choosefile
end type
end forward

global type w_choosefile from window
integer width = 1696
integer height = 728
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_nom sle_nom
st_2 st_2
st_1 st_1
cb_close cb_close
end type
global w_choosefile w_choosefile

event open;if v_langue = 'an' then
	st_1.text = 'Please, give us the name that you want for '
	st_2.text = 'the contract type'
end if
end event

on w_choosefile.create
this.sle_nom=create sle_nom
this.st_2=create st_2
this.st_1=create st_1
this.cb_close=create cb_close
this.Control[]={this.sle_nom,&
this.st_2,&
this.st_1,&
this.cb_close}
end on

on w_choosefile.destroy
destroy(this.sle_nom)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_close)
end on

type sle_nom from singlelineedit within w_choosefile
integer x = 59
integer y = 288
integer width = 1289
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_choosefile
integer x = 23
integer y = 96
integer width = 1527
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "au type de contrat"
boolean focusrectangle = false
end type

type st_1 from statictext within w_choosefile
integer x = 23
integer y = 24
integer width = 1527
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Veuillez indiquer le nom que vous aimeriez donner "
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_choosefile
integer x = 1253
integer y = 572
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;closewithreturn(parent,sle_nom.text + ".rtf")
end event

