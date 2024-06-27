$PBExportHeader$w_pourcprotect.srw
forward
global type w_pourcprotect from window
end type
type st_1 from statictext within w_pourcprotect
end type
type em_1 from editmask within w_pourcprotect
end type
type cb_1 from commandbutton within w_pourcprotect
end type
end forward

global type w_pourcprotect from window
integer x = 1120
integer y = 828
integer width = 1019
integer height = 544
boolean titlebar = true
string title = "Pourcentage"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
string pointer = "Arrow!"
st_1 st_1
em_1 em_1
cb_1 cb_1
end type
global w_pourcprotect w_pourcprotect

on w_pourcprotect.create
this.st_1=create st_1
this.em_1=create em_1
this.cb_1=create cb_1
this.Control[]={this.st_1,&
this.em_1,&
this.cb_1}
end on

on w_pourcprotect.destroy
destroy(this.st_1)
destroy(this.em_1)
destroy(this.cb_1)
end on

event open;em_1.text = string(w_pourcentage_entrer.dw_pourcentage_entrer.getitemdate(w_pourcentage_entrer.dw_pourcentage_entrer.getrow(),"fin_traitement"))
end event

type st_1 from statictext within w_pourcprotect
integer x = 155
integer y = 4
integer width = 741
integer height = 144
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
string text = "Veuillez vérifier la date de fin de traitement"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_1 from editmask within w_pourcprotect
integer x = 251
integer y = 160
integer width = 507
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
end type

type cb_1 from commandbutton within w_pourcprotect
integer x = 251
integer y = 296
integer width = 507
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "OK"
end type

event clicked;closewithreturn(parent,em_1.text)
end event

