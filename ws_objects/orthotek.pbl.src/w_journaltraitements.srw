$PBExportHeader$w_journaltraitements.srw
forward
global type w_journaltraitements from w_child
end type
type em_year from editmask within w_journaltraitements
end type
type st_year from statictext within w_journaltraitements
end type
type cb_find from commandbutton within w_journaltraitements
end type
type dw_journaltraitements from u_dw within w_journaltraitements
end type
type cb_print from commandbutton within w_journaltraitements
end type
type cb_close from commandbutton within w_journaltraitements
end type
end forward

global type w_journaltraitements from w_child
integer x = 5
integer y = 4
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
boolean ib_isupdateable = false
em_year em_year
st_year st_year
cb_find cb_find
dw_journaltraitements dw_journaltraitements
cb_print cb_print
cb_close cb_close
end type
global w_journaltraitements w_journaltraitements

on w_journaltraitements.create
int iCurrent
call super::create
this.em_year=create em_year
this.st_year=create st_year
this.cb_find=create cb_find
this.dw_journaltraitements=create dw_journaltraitements
this.cb_print=create cb_print
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_year
this.Control[iCurrent+2]=this.st_year
this.Control[iCurrent+3]=this.cb_find
this.Control[iCurrent+4]=this.dw_journaltraitements
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.cb_close
end on

on w_journaltraitements.destroy
call super::destroy
destroy(this.em_year)
destroy(this.st_year)
destroy(this.cb_find)
destroy(this.dw_journaltraitements)
destroy(this.cb_print)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type em_year from editmask within w_journaltraitements
integer x = 1623
integer y = 1916
integer width = 407
integer height = 100
integer taborder = 20
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
end type

event constructor;em_year.text = string(year(today()))
end event

type st_year from statictext within w_journaltraitements
integer x = 1088
integer y = 1924
integer width = 507
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Année :"
alignment alignment = right!
boolean focusrectangle = false
end type

event clicked;if v_langue = 'an' then
	st_year.Text = "Starting date:"
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Year:'
end if
end event

type cb_find from commandbutton within w_journaltraitements
integer x = 581
integer y = 1912
integer width = 462
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;integer li_year

li_year = integer(em_year.text)

dw_journaltraitements.SetTransObject(SQLCA)
dw_journaltraitements.retrieve(v_no_ortho,li_year)
end event

event constructor;if v_langue = 'an' then
	cb_find.Text = "Search"
end if
end event

type dw_journaltraitements from u_dw within w_journaltraitements
integer x = 23
integer width = 3566
integer height = 1912
integer taborder = 10
string dataobject = "d_journaltraitements"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	this.object.t_title.text = 'Treatment report for:'
	this.object.t_fact.text = 'Treatment date'
	this.object.b_fact.text = 'Treatment date'
	this.object.t_paie.text = 'Payment date'
	this.object.b_paie.text = 'Payment date'
	this.object.t_pat.text = 'Patient name'
	this.object.b_pat.text = 'Patient name'
	this.object.t_solde.text = 'Balance'
	this.object.b_solde.text = 'Balance'
	this.object.t_printedon.text = 'Printed on'
end if
end event

event clicked;choose case dwo.name
	case 'b_fact'
		dw_journaltraitements.setsort("traitements_debut_traitement A")
		dw_journaltraitements.sort()
	case 'b_paie'
		dw_journaltraitements.setsort("maxdatepaie A")
		dw_journaltraitements.sort()
	case 'b_pat'
		dw_journaltraitements.setsort("compute_pat A")
		dw_journaltraitements.sort()
	case 'b_solde'
		dw_journaltraitements.setsort("compute_solde A")
		dw_journaltraitements.sort()
end choose
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

type cb_print from commandbutton within w_journaltraitements
integer x = 23
integer y = 1912
integer width = 558
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;dw_journaltraitements.Modify("DataWindow.Print.Margin.Top=250")
dw_journaltraitements.Modify("DataWindow.Print.Margin.left=250")
gb_datawindow = true
openwithparm(w_print_options,dw_journaltraitements)

end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

type cb_close from commandbutton within w_journaltraitements
integer x = 3022
integer y = 1912
integer width = 567
integer height = 108
integer taborder = 40
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

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

