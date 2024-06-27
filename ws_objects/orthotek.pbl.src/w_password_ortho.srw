$PBExportHeader$w_password_ortho.srw
forward
global type w_password_ortho from window
end type
type cb_2 from commandbutton within w_password_ortho
end type
type cb_1 from commandbutton within w_password_ortho
end type
type st_3 from statictext within w_password_ortho
end type
type st_2 from statictext within w_password_ortho
end type
type st_1 from statictext within w_password_ortho
end type
type sle_anc from singlelineedit within w_password_ortho
end type
type sle_nouveau from singlelineedit within w_password_ortho
end type
type sle_verif from singlelineedit within w_password_ortho
end type
end forward

global type w_password_ortho from window
integer x = 1047
integer y = 612
integer width = 1257
integer height = 824
boolean titlebar = true
string title = "Mot de passe (Logon)"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
string pointer = "Arrow!"
cb_2 cb_2
cb_1 cb_1
st_3 st_3
st_2 st_2
st_1 st_1
sle_anc sle_anc
sle_nouveau sle_nouveau
sle_verif sle_verif
end type
global w_password_ortho w_password_ortho

on w_password_ortho.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_anc=create sle_anc
this.sle_nouveau=create sle_nouveau
this.sle_verif=create sle_verif
this.Control[]={this.cb_2,&
this.cb_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_anc,&
this.sle_nouveau,&
this.sle_verif}
end on

on w_password_ortho.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_anc)
destroy(this.sle_nouveau)
destroy(this.sle_verif)
end on

type cb_2 from commandbutton within w_password_ortho
integer x = 631
integer y = 568
integer width = 498
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_password_ortho
integer x = 82
integer y = 568
integer width = 498
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ok"
end type

event clicked;string v_password
if sle_anc.text <> "" and sle_nouveau.text <> "" and sle_verif.text = sle_nouveau.text then
	select password into :v_password from password where ortho_id = :v_no_ortho;
	if v_password = sle_anc.text then
		v_password = sle_nouveau.text
		update password set password = :v_password where ortho_id = :v_no_ortho;
		commit;
		close(parent)
	else
		messagebox("Information","L'ancien mot de passe est éronné",information!)
	end if
else
	messagebox("Information","Veuillez recommencer.",information!)
end if
end event

type st_3 from statictext within w_password_ortho
integer x = 91
integer y = 416
integer width = 325
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Vérification:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_password_ortho
integer x = 160
integer y = 260
integer width = 256
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Nouveau:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_password_ortho
integer x = 215
integer y = 104
integer width = 201
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Ancien:"
boolean focusrectangle = false
end type

type sle_anc from singlelineedit within w_password_ortho
integer x = 439
integer y = 88
integer width = 686
integer height = 92
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
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_nouveau from singlelineedit within w_password_ortho
integer x = 439
integer y = 244
integer width = 686
integer height = 92
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
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_verif from singlelineedit within w_password_ortho
integer x = 439
integer y = 400
integer width = 686
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean autohscroll = false
boolean password = true
borderstyle borderstyle = stylelowered!
end type

