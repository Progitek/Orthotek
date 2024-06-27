$PBExportHeader$w_password_supp_paiement.srw
forward
global type w_password_supp_paiement from window
end type
type sle_password from singlelineedit within w_password_supp_paiement
end type
type st_1 from statictext within w_password_supp_paiement
end type
type cb_1 from commandbutton within w_password_supp_paiement
end type
type cb_2 from commandbutton within w_password_supp_paiement
end type
end forward

global type w_password_supp_paiement from window
integer x = 1161
integer y = 904
integer width = 1257
integer height = 508
boolean titlebar = true
string title = "Suppression d~'un paiement"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
string pointer = "Arrow!"
sle_password sle_password
st_1 st_1
cb_1 cb_1
cb_2 cb_2
end type
global w_password_supp_paiement w_password_supp_paiement

on w_password_supp_paiement.create
this.sle_password=create sle_password
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.Control[]={this.sle_password,&
this.st_1,&
this.cb_1,&
this.cb_2}
end on

on w_password_supp_paiement.destroy
destroy(this.sle_password)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;string v_password, code

code = message.stringparm
select password into :v_password from password where typepass = :code;
if v_password = "" then
	insert into password (password, typepass) values ('12345', 'supp');
	commit;
	messagebox("Avertissement!","Le mot de passe est 12345, vous devez le changer!",Information!)
end if
end event

type sle_password from singlelineedit within w_password_supp_paiement
integer x = 462
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

type st_1 from statictext within w_password_supp_paiement
integer x = 64
integer y = 96
integer width = 393
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
string text = "Mot de passe:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_password_supp_paiement
integer x = 59
integer y = 248
integer width = 498
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ok"
end type

event clicked;string v_password, code
code = message.stringparm
if sle_password.text <> "" then
	select password into :v_password from password where typepass = :code;
	if v_password = sle_password.text then
		closewithreturn(w_password_supp_paiement,"ok")
	else
		messagebox("Information","Le mot de passe est éronné",information!)
	end if
else
	messagebox("Information","Veuillez entrer un mot de passe.",information!)
end if
end event

type cb_2 from commandbutton within w_password_supp_paiement
integer x = 649
integer y = 248
integer width = 498
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
end type

event clicked;closewithreturn(w_password_supp_paiement,"non")
end event

