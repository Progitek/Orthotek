$PBExportHeader$w_listpatientoperateur.srw
forward
global type w_listpatientoperateur from w_child
end type
type em_fin from editmask within w_listpatientoperateur
end type
type st_2 from statictext within w_listpatientoperateur
end type
type em_debut from editmask within w_listpatientoperateur
end type
type st_1 from statictext within w_listpatientoperateur
end type
type cb_3 from commandbutton within w_listpatientoperateur
end type
type cb_2 from commandbutton within w_listpatientoperateur
end type
type cb_1 from commandbutton within w_listpatientoperateur
end type
type dw_listpatientoperateur from u_dw within w_listpatientoperateur
end type
end forward

global type w_listpatientoperateur from w_child
integer width = 4677
integer height = 2652
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
windowstate windowstate = maximized!
em_fin em_fin
st_2 st_2
em_debut em_debut
st_1 st_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_listpatientoperateur dw_listpatientoperateur
end type
global w_listpatientoperateur w_listpatientoperateur

on w_listpatientoperateur.create
int iCurrent
call super::create
this.em_fin=create em_fin
this.st_2=create st_2
this.em_debut=create em_debut
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_listpatientoperateur=create dw_listpatientoperateur
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_fin
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.em_debut
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.dw_listpatientoperateur
end on

on w_listpatientoperateur.destroy
call super::destroy
destroy(this.em_fin)
destroy(this.st_2)
destroy(this.em_debut)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_listpatientoperateur)
end on

event open;call super::open;em_debut.text = string(today())
em_fin.text = string(today())
end event

type em_fin from editmask within w_listpatientoperateur
integer x = 2011
integer y = 2528
integer width = 402
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_2 from statictext within w_listpatientoperateur
integer x = 1883
integer y = 2528
integer width = 119
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "au "
boolean focusrectangle = false
end type

type em_debut from editmask within w_listpatientoperateur
integer x = 1454
integer y = 2528
integer width = 402
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_1 from statictext within w_listpatientoperateur
integer x = 1326
integer y = 2528
integer width = 119
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Du "
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_listpatientoperateur
integer x = 658
integer y = 2500
integer width = 649
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;date ldt_debut, ldt_fin

em_debut.getdata(ldt_debut)
em_fin.getData(ldt_fin)

dw_listpatientoperateur.retrieve(v_no_ortho,ldt_debut,ldt_fin)
end event

type cb_2 from commandbutton within w_listpatientoperateur
integer x = 3977
integer y = 2484
integer width = 649
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type cb_1 from commandbutton within w_listpatientoperateur
integer x = 9
integer y = 2496
integer width = 649
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_listpatientoperateur)
end event

type dw_listpatientoperateur from u_dw within w_listpatientoperateur
integer x = 18
integer y = 12
integer width = 4594
integer height = 2460
integer taborder = 10
string dataobject = "d_listpatientoperateur"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

