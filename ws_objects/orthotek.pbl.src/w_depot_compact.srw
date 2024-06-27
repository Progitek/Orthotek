$PBExportHeader$w_depot_compact.srw
forward
global type w_depot_compact from w_child
end type
type cb_3 from commandbutton within w_depot_compact
end type
type st_title from statictext within w_depot_compact
end type
type dw_depot from u_dw within w_depot_compact
end type
type em_date from editmask within w_depot_compact
end type
type st_1 from statictext within w_depot_compact
end type
type cb_1 from commandbutton within w_depot_compact
end type
type cb_close from commandbutton within w_depot_compact
end type
end forward

global type w_depot_compact from w_child
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
cb_3 cb_3
st_title st_title
dw_depot dw_depot
em_date em_date
st_1 st_1
cb_1 cb_1
cb_close cb_close
end type
global w_depot_compact w_depot_compact

on w_depot_compact.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.st_title=create st_title
this.dw_depot=create dw_depot
this.em_date=create em_date
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.st_title
this.Control[iCurrent+3]=this.dw_depot
this.Control[iCurrent+4]=this.em_date
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.cb_1
this.Control[iCurrent+7]=this.cb_close
end on

on w_depot_compact.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.st_title)
destroy(this.dw_depot)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_date.text = string(today())
end event

type cb_3 from commandbutton within w_depot_compact
integer x = 9
integer y = 1920
integer width = 658
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;dw_depot.retrieve(v_no_ortho,date(em_date.text))
dw_depot.object.dw_depot_compact.object.t_date.text = em_date.text
end event

type st_title from statictext within w_depot_compact
integer width = 1349
integer height = 92
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Journal des dépôts compact"
boolean focusrectangle = false
end type

type dw_depot from u_dw within w_depot_compact
integer y = 96
integer width = 3616
integer height = 1816
integer taborder = 10
string title = "depot"
string dataobject = "dc_depot"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;setTransObject(SQLCA)
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

type em_date from editmask within w_depot_compact
integer x = 2103
integer y = 1932
integer width = 507
integer height = 92
integer taborder = 30
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

type st_1 from statictext within w_depot_compact
integer x = 1659
integer y = 1944
integer width = 421
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
string text = "Date du dépôt :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_depot_compact
integer x = 667
integer y = 1920
integer width = 654
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_depot)
end event

type cb_close from commandbutton within w_depot_compact
integer x = 2976
integer y = 1920
integer width = 649
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)
end event

