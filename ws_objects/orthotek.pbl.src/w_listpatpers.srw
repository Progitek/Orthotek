$PBExportHeader$w_listpatpers.srw
forward
global type w_listpatpers from w_child
end type
type em_date from editmask within w_listpatpers
end type
type st_1 from statictext within w_listpatpers
end type
type dw_listpatpers from u_dw within w_listpatpers
end type
type cb_4 from commandbutton within w_listpatpers
end type
type cb_close from commandbutton within w_listpatpers
end type
type cb_print from commandbutton within w_listpatpers
end type
type cb_search from commandbutton within w_listpatpers
end type
end forward

global type w_listpatpers from w_child
integer x = 214
integer y = 221
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
em_date em_date
st_1 st_1
dw_listpatpers dw_listpatpers
cb_4 cb_4
cb_close cb_close
cb_print cb_print
cb_search cb_search
end type
global w_listpatpers w_listpatpers

on w_listpatpers.create
int iCurrent
call super::create
this.em_date=create em_date
this.st_1=create st_1
this.dw_listpatpers=create dw_listpatpers
this.cb_4=create cb_4
this.cb_close=create cb_close
this.cb_print=create cb_print
this.cb_search=create cb_search
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_listpatpers
this.Control[iCurrent+4]=this.cb_4
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.cb_search
end on

on w_listpatpers.destroy
call super::destroy
destroy(this.em_date)
destroy(this.st_1)
destroy(this.dw_listpatpers)
destroy(this.cb_4)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.cb_search)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type em_date from editmask within w_listpatpers
integer x = 2633
integer y = 1928
integer width = 402
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
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

event constructor;this.text = string(today())
end event

type st_1 from statictext within w_listpatpers
integer y = 4
integer width = 1275
integer height = 92
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Liste des patients par employé"
boolean focusrectangle = false
end type

type dw_listpatpers from u_dw within w_listpatpers
integer y = 116
integer width = 3634
integer height = 1804
integer taborder = 10
string dataobject = "d_listpatpers"
boolean border = false
end type

event constructor;call super::constructor;setTransObject(SQLCA)
end event

type cb_4 from commandbutton within w_listpatpers
integer x = 1184
integer y = 1924
integer width = 1435
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_close from commandbutton within w_listpatpers
integer x = 3049
integer y = 1924
integer width = 590
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

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

type cb_print from commandbutton within w_listpatpers
integer x = 594
integer y = 1924
integer width = 590
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

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if
end event

event clicked;gi_imp = 1
dw_listpatpers.print(true,true)
end event

type cb_search from commandbutton within w_listpatpers
integer x = 5
integer y = 1924
integer width = 590
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event constructor;if v_langue = 'an' then
	this.text = "Search"
end if
end event

event clicked;dw_listpatpers.retrieve(gf_emtodate(em_date.text),v_no_ortho)
end event

