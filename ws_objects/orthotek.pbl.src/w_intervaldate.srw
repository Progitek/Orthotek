$PBExportHeader$w_intervaldate.srw
forward
global type w_intervaldate from window
end type
type em_fin from editmask within w_intervaldate
end type
type em_debut from editmask within w_intervaldate
end type
type st_3 from statictext within w_intervaldate
end type
type st_2 from statictext within w_intervaldate
end type
type cb_ok from commandbutton within w_intervaldate
end type
type st_1 from statictext within w_intervaldate
end type
end forward

global type w_intervaldate from window
integer width = 1906
integer height = 676
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
em_fin em_fin
em_debut em_debut
st_3 st_3
st_2 st_2
cb_ok cb_ok
st_1 st_1
end type
global w_intervaldate w_intervaldate

event open;em_debut.text = string(today())
em_fin.text = string(today())
end event

on w_intervaldate.create
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_3=create st_3
this.st_2=create st_2
this.cb_ok=create cb_ok
this.st_1=create st_1
this.Control[]={this.em_fin,&
this.em_debut,&
this.st_3,&
this.st_2,&
this.cb_ok,&
this.st_1}
end on

on w_intervaldate.destroy
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_ok)
destroy(this.st_1)
end on

type em_fin from editmask within w_intervaldate
integer x = 882
integer y = 236
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_debut from editmask within w_intervaldate
integer x = 279
integer y = 236
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
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_3 from statictext within w_intervaldate
integer x = 736
integer y = 252
integer width = 119
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
string text = "Fin"
boolean focusrectangle = false
end type

type st_2 from statictext within w_intervaldate
integer x = 96
integer y = 252
integer width = 201
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
string text = "Début"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_intervaldate
integer x = 1536
integer y = 436
integer width = 297
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "OK"
end type

event clicked;datastore ds_event
date ldt_debut
date ldt_fin

ldt_debut = date(em_debut.text)
ldt_fin = date(em_fin.text)
ds_event = create datastore
ds_event.dataobject = "d_eventsimp"
ds_event.setTransObject(SQLCA)
ds_event.retrieve(v_no_ortho,ldt_debut,ldt_fin)
gb_datawindow = false
openwithparm(w_print_options,ds_event)
destroy ds_event
close(parent)
end event

type st_1 from statictext within w_intervaldate
integer x = 37
integer y = 32
integer width = 1783
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Veillez inscrire l~'intervalle des dates que vous désirez ?"
boolean focusrectangle = false
end type

