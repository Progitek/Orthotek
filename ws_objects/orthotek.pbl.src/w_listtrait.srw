$PBExportHeader$w_listtrait.srw
forward
global type w_listtrait from w_child
end type
type dw_listtrait from u_dw within w_listtrait
end type
type em_fin from editmask within w_listtrait
end type
type st_2 from statictext within w_listtrait
end type
type em_debut from editmask within w_listtrait
end type
type st_1 from statictext within w_listtrait
end type
type cb_search from commandbutton within w_listtrait
end type
type cb_print from commandbutton within w_listtrait
end type
type cb_close from commandbutton within w_listtrait
end type
end forward

global type w_listtrait from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean ib_isupdateable = false
dw_listtrait dw_listtrait
em_fin em_fin
st_2 st_2
em_debut em_debut
st_1 st_1
cb_search cb_search
cb_print cb_print
cb_close cb_close
end type
global w_listtrait w_listtrait

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_debut.text = string(today())
em_fin.text = string(today())
end event

on w_listtrait.create
int iCurrent
call super::create
this.dw_listtrait=create dw_listtrait
this.em_fin=create em_fin
this.st_2=create st_2
this.em_debut=create em_debut
this.st_1=create st_1
this.cb_search=create cb_search
this.cb_print=create cb_print
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_listtrait
this.Control[iCurrent+2]=this.em_fin
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.em_debut
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_search
this.Control[iCurrent+7]=this.cb_print
this.Control[iCurrent+8]=this.cb_close
end on

on w_listtrait.destroy
call super::destroy
destroy(this.dw_listtrait)
destroy(this.em_fin)
destroy(this.st_2)
destroy(this.em_debut)
destroy(this.st_1)
destroy(this.cb_search)
destroy(this.cb_print)
destroy(this.cb_close)
end on

type dw_listtrait from u_dw within w_listtrait
integer x = 9
integer y = 12
integer width = 3598
integer height = 1908
integer taborder = 10
string title = "none"
string dataobject = "d_listtrait"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;setTransObject(SQLCA)
end event

type em_fin from editmask within w_listtrait
integer x = 2423
integer y = 1936
integer width = 343
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_2 from statictext within w_listtrait
integer x = 2272
integer y = 1948
integer width = 137
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "au"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_debut from editmask within w_listtrait
integer x = 1911
integer y = 1936
integer width = 343
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type st_1 from statictext within w_listtrait
integer x = 1742
integer y = 1948
integer width = 151
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Du:"
boolean focusrectangle = false
end type

type cb_search from commandbutton within w_listtrait
integer x = 777
integer y = 1928
integer width = 763
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Recherche"
end type

event clicked;dw_listtrait.retrieve(v_no_ortho,date(em_debut.text),date(em_fin.text))
end event

type cb_print from commandbutton within w_listtrait
integer x = 9
integer y = 1928
integer width = 763
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_listtrait)
end event

type cb_close from commandbutton within w_listtrait
integer x = 2848
integer y = 1928
integer width = 763
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

