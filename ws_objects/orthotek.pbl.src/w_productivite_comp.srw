$PBExportHeader$w_productivite_comp.srw
forward
global type w_productivite_comp from w_child
end type
type cb_print from commandbutton within w_productivite_comp
end type
type cb_search from commandbutton within w_productivite_comp
end type
type st_2 from statictext within w_productivite_comp
end type
type em_year from editmask within w_productivite_comp
end type
type dw_productivite_comp from u_dw within w_productivite_comp
end type
type cb_close from commandbutton within w_productivite_comp
end type
end forward

global type w_productivite_comp from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_print cb_print
cb_search cb_search
st_2 st_2
em_year em_year
dw_productivite_comp dw_productivite_comp
cb_close cb_close
end type
global w_productivite_comp w_productivite_comp

on w_productivite_comp.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.cb_search=create cb_search
this.st_2=create st_2
this.em_year=create em_year
this.dw_productivite_comp=create dw_productivite_comp
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.cb_search
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.em_year
this.Control[iCurrent+5]=this.dw_productivite_comp
this.Control[iCurrent+6]=this.cb_close
end on

on w_productivite_comp.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.cb_search)
destroy(this.st_2)
destroy(this.em_year)
destroy(this.dw_productivite_comp)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_print from commandbutton within w_productivite_comp
integer y = 1912
integer width = 1019
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_productivite_comp)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type cb_search from commandbutton within w_productivite_comp
integer x = 1019
integer y = 1912
integer width = 878
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;int v_year,v_year_1,v_year_2

v_year = integer(em_year.text)
v_year_1 = v_year - 1
v_year_2 = v_year - 2

dw_productivite_comp.retrieve(v_no_ortho,v_year_2,v_year_1,v_year)
dw_productivite_comp.object.t_year_2.text = string(v_year_2)
dw_productivite_comp.object.t_year_1.text = string(v_year_1)
dw_productivite_comp.object.t_year.text = string(v_year)
dw_productivite_comp.Width = 3621
dw_productivite_comp.Height = 1892
end event

event constructor;if v_langue = 'an' then
	this.text = 'Find'
end if
end event

type st_2 from statictext within w_productivite_comp
integer x = 1902
integer y = 1936
integer width = 453
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pour l~'année:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'For the year:'
end if
end event

type em_year from editmask within w_productivite_comp
integer x = 2359
integer y = 1920
integer width = 402
integer height = 96
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
string mask = "####"
boolean autoskip = true
end type

type dw_productivite_comp from u_dw within w_productivite_comp
integer width = 3625
integer height = 1908
integer taborder = 30
string title = "productivite_comp"
string dataobject = "d_productivite_comp"
boolean border = false
boolean hsplitscroll = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	this.object.t_titre.text = 'Comparative productivity'
	this.object.t_hono1.text = 'Charges'
	this.object.t_enc1.text = 'Deposits'
	this.object.t_hono2.text = 'Charges'
	this.object.t_enc2.text = 'Deposits'
	this.object.t_hono3.text = 'Charges'
	this.object.t_enc3.text = 'Deposits'
end if
SetTransObject(sqlca)

end event

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the error message
RETURN 1
end event

type cb_close from commandbutton within w_productivite_comp
integer x = 2784
integer y = 1912
integer width = 841
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

