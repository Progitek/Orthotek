$PBExportHeader$w_statprod.srw
forward
global type w_statprod from w_child
end type
type em_year from editmask within w_statprod
end type
type st_1 from statictext within w_statprod
end type
type dw_statprod from u_dw within w_statprod
end type
type cb_1 from commandbutton within w_statprod
end type
type cb_search from commandbutton within w_statprod
end type
type cb_print from commandbutton within w_statprod
end type
type cb_close from commandbutton within w_statprod
end type
end forward

global type w_statprod from w_child
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
em_year em_year
st_1 st_1
dw_statprod dw_statprod
cb_1 cb_1
cb_search cb_search
cb_print cb_print
cb_close cb_close
end type
global w_statprod w_statprod

on w_statprod.create
int iCurrent
call super::create
this.em_year=create em_year
this.st_1=create st_1
this.dw_statprod=create dw_statprod
this.cb_1=create cb_1
this.cb_search=create cb_search
this.cb_print=create cb_print
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_year
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_statprod
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_search
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.cb_close
end on

on w_statprod.destroy
call super::destroy
destroy(this.em_year)
destroy(this.st_1)
destroy(this.dw_statprod)
destroy(this.cb_1)
destroy(this.cb_search)
destroy(this.cb_print)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_year.setFocus()
end event

type em_year from editmask within w_statprod
integer x = 2555
integer y = 1928
integer width = 402
integer height = 108
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
string mask = "yyyy"
end type

type st_1 from statictext within w_statprod
integer width = 1285
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Statistique de productivité"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Productivity Satistic'
end if
end event

type dw_statprod from u_dw within w_statprod
integer x = 14
integer y = 96
integer width = 3602
integer height = 1824
integer taborder = 10
string title = "none"
string dataobject = "d_statprod"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;setTransObject(SQLCA)
if v_langue = 'an' then
	object.t_1.text = 'Month'
	object.t_traitfact.text = 'Total Amount Billed'
	object.t_3.text = 'JANUARY'
	object.t_4.text = 'FEBRUARY'
	object.t_5.text = 'MARCH'
	object.t_6.text = 'APRIL'
	object.t_7.text = 'MAY'
	object.t_8.text = 'JUNE'
	object.t_9.text = 'JULY'
	object.t_10.text = 'AUGUST'
	object.t_11.text = 'SEPTEMBER'
	object.t_12.text = 'OCTOBER'
	object.t_13.text = 'NOVEMBER'
	object.t_14.text = 'DECEMBER'
	object.t_printedon.text = 'Printed on'
end if
end event

type cb_1 from commandbutton within w_statprod
integer x = 521
integer y = 1928
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

type cb_search from commandbutton within w_statprod
integer x = 1957
integer y = 1928
integer width = 581
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

event clicked;dw_statprod.retrieve(long(em_year.text),v_no_ortho)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Search'
end if
end event

type cb_print from commandbutton within w_statprod
integer x = 14
integer y = 1928
integer width = 507
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
openwithparm(w_print_options,dw_statprod)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type cb_close from commandbutton within w_statprod
integer x = 2981
integer y = 1928
integer width = 640
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

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

