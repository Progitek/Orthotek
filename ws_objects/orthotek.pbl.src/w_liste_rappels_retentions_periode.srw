$PBExportHeader$w_liste_rappels_retentions_periode.srw
forward
global type w_liste_rappels_retentions_periode from window
end type
type st_3 from statictext within w_liste_rappels_retentions_periode
end type
type st_2 from statictext within w_liste_rappels_retentions_periode
end type
type em_date_fin from editmask within w_liste_rappels_retentions_periode
end type
type em_date_debut from editmask within w_liste_rappels_retentions_periode
end type
type st_1 from statictext within w_liste_rappels_retentions_periode
end type
type cb_close from commandbutton within w_liste_rappels_retentions_periode
end type
type cb_apply from commandbutton within w_liste_rappels_retentions_periode
end type
end forward

global type w_liste_rappels_retentions_periode from window
integer x = 823
integer y = 360
integer width = 1463
integer height = 652
boolean titlebar = true
string title = "Période"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
string pointer = "Arrow!"
st_3 st_3
st_2 st_2
em_date_fin em_date_fin
em_date_debut em_date_debut
st_1 st_1
cb_close cb_close
cb_apply cb_apply
end type
global w_liste_rappels_retentions_periode w_liste_rappels_retentions_periode

on w_liste_rappels_retentions_periode.create
this.st_3=create st_3
this.st_2=create st_2
this.em_date_fin=create em_date_fin
this.em_date_debut=create em_date_debut
this.st_1=create st_1
this.cb_close=create cb_close
this.cb_apply=create cb_apply
this.Control[]={this.st_3,&
this.st_2,&
this.em_date_fin,&
this.em_date_debut,&
this.st_1,&
this.cb_close,&
this.cb_apply}
end on

on w_liste_rappels_retentions_periode.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.em_date_fin)
destroy(this.em_date_debut)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.cb_apply)
end on

type st_3 from statictext within w_liste_rappels_retentions_periode
integer x = 699
integer y = 208
integer width = 165
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
string text = "À :"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_rappels_retentions_periode
integer x = 27
integer y = 208
integer width = 165
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
string text = "De :"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_date_fin from editmask within w_liste_rappels_retentions_periode
integer x = 864
integer y = 196
integer width = 389
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
string mask = "[date]"
end type

type em_date_debut from editmask within w_liste_rappels_retentions_periode
integer x = 206
integer y = 196
integer width = 389
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
string mask = "[date]"
end type

type st_1 from statictext within w_liste_rappels_retentions_periode
integer x = 14
integer y = 40
integer width = 1426
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
string text = "Sélectionnez la période que vous désirez visualiser :"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_liste_rappels_retentions_periode
integer x = 722
integer y = 400
integer width = 686
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;Close(parent)
end event

type cb_apply from commandbutton within w_liste_rappels_retentions_periode
integer x = 37
integer y = 400
integer width = 686
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Appliquer"
end type

event clicked;//CloseWithReturn(Parent, Integer(em_nb_mois.Text))
end event

