$PBExportHeader$w_histofin.srw
forward
global type w_histofin from w_child
end type
type dw_histo from u_dw within w_histofin
end type
type cb_close from commandbutton within w_histofin
end type
type cb_print from commandbutton within w_histofin
end type
type cb_search from commandbutton within w_histofin
end type
type st_1 from statictext within w_histofin
end type
type em_debut from editmask within w_histofin
end type
type st_2 from statictext within w_histofin
end type
type em_fin from editmask within w_histofin
end type
end forward

global type w_histofin from w_child
integer width = 3630
integer height = 2052
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
boolean ib_isupdateable = false
dw_histo dw_histo
cb_close cb_close
cb_print cb_print
cb_search cb_search
st_1 st_1
em_debut em_debut
st_2 st_2
em_fin em_fin
end type
global w_histofin w_histofin

on w_histofin.create
int iCurrent
call super::create
this.dw_histo=create dw_histo
this.cb_close=create cb_close
this.cb_print=create cb_print
this.cb_search=create cb_search
this.st_1=create st_1
this.em_debut=create em_debut
this.st_2=create st_2
this.em_fin=create em_fin
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_histo
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_print
this.Control[iCurrent+4]=this.cb_search
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.em_debut
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.em_fin
end on

on w_histofin.destroy
call super::destroy
destroy(this.dw_histo)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.cb_search)
destroy(this.st_1)
destroy(this.em_debut)
destroy(this.st_2)
destroy(this.em_fin)
end on

event open;call super::open;pro_resize luo_rs
luo_rs.uf_resizew(this, 1, 1)

if v_langue = 'an' then
	title = "Financial history"
else
	title = "Historique financier"
end if

end event

type dw_histo from u_dw within w_histofin
integer x = 9
integer y = 12
integer width = 3598
integer height = 1908
integer taborder = 10
string dataobject = "d_histofin"
boolean hscrollbar = true
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;setTransObject(SQLCA)
end event

type cb_close from commandbutton within w_histofin
integer x = 2848
integer y = 1928
integer width = 763
integer height = 112
integer taborder = 20
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

type cb_print from commandbutton within w_histofin
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
openwithparm(w_print_options,dw_histo)
end event

type cb_search from commandbutton within w_histofin
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

event clicked;setPointer(hourGlass!)
dw_histo.retrieve(v_no_ortho,date(em_debut.text),date(em_fin.text))
end event

type st_1 from statictext within w_histofin
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

type em_debut from editmask within w_histofin
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

type st_2 from statictext within w_histofin
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

type em_fin from editmask within w_histofin
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

