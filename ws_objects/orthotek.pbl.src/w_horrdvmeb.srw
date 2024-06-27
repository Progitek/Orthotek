$PBExportHeader$w_horrdvmeb.srw
forward
global type w_horrdvmeb from w_child
end type
type st_au from statictext within w_horrdvmeb
end type
type st_du from statictext within w_horrdvmeb
end type
type em_end from editmask within w_horrdvmeb
end type
type em_start from editmask within w_horrdvmeb
end type
type dw_horrdvmeb from u_dw within w_horrdvmeb
end type
type cb_3 from commandbutton within w_horrdvmeb
end type
type cb_find from commandbutton within w_horrdvmeb
end type
type cb_print from commandbutton within w_horrdvmeb
end type
end forward

global type w_horrdvmeb from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
st_au st_au
st_du st_du
em_end em_end
em_start em_start
dw_horrdvmeb dw_horrdvmeb
cb_3 cb_3
cb_find cb_find
cb_print cb_print
end type
global w_horrdvmeb w_horrdvmeb

on w_horrdvmeb.create
int iCurrent
call super::create
this.st_au=create st_au
this.st_du=create st_du
this.em_end=create em_end
this.em_start=create em_start
this.dw_horrdvmeb=create dw_horrdvmeb
this.cb_3=create cb_3
this.cb_find=create cb_find
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_au
this.Control[iCurrent+2]=this.st_du
this.Control[iCurrent+3]=this.em_end
this.Control[iCurrent+4]=this.em_start
this.Control[iCurrent+5]=this.dw_horrdvmeb
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.cb_find
this.Control[iCurrent+8]=this.cb_print
end on

on w_horrdvmeb.destroy
call super::destroy
destroy(this.st_au)
destroy(this.st_du)
destroy(this.em_end)
destroy(this.em_start)
destroy(this.dw_horrdvmeb)
destroy(this.cb_3)
destroy(this.cb_find)
destroy(this.cb_print)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type st_au from statictext within w_horrdvmeb
integer x = 1979
integer y = 1932
integer width = 151
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "au"
boolean focusrectangle = false
end type

type st_du from statictext within w_horrdvmeb
integer x = 1353
integer y = 1932
integer width = 151
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Du"
boolean focusrectangle = false
end type

type em_end from editmask within w_horrdvmeb
integer x = 2162
integer y = 1920
integer width = 402
integer height = 92
integer taborder = 20
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
string mask = "[date]"
end type

event constructor;em_end.text = string(today())
end event

type em_start from editmask within w_horrdvmeb
integer x = 1509
integer y = 1920
integer width = 402
integer height = 92
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
string mask = "[date]"
end type

event constructor;em_start.text = string(today())
end event

type dw_horrdvmeb from u_dw within w_horrdvmeb
integer width = 3634
integer height = 1904
integer taborder = 60
string title = "horrdvmeb"
string dataobject = "d_horrdvmeb"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)

//
//if v_langue = 'an' then
//	this.object.t_1.text = 'Birth date'
//	this.object.patient_prenom_t.text = 'Name'
//	this.object.b_nom.text = 'Name'
//	this.object.b_telmais.text = 'Tel. home'
//	this.object.b_datenais.text = 'Birth date'
//end if
end event

event clicked;choose case string(dwo.name)
	case 't_patnom'
		SetSort('patnom A')
		Sort()
	case 't_rdvdate'
		SetSort('rdvdate A')
		Sort()
	case 't_telres'
		SetSort('telres A')
		Sort()
	case "nom_traitement_t"
		SetSort('nom_traitement A')
		Sort()
	case "t_date_naissance"
		SetSort('date_naissance A')
		Sort()		
		
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

type cb_3 from commandbutton within w_horrdvmeb
integer x = 2853
integer y = 1912
integer width = 768
integer height = 108
integer taborder = 50
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
	cb_3.Text = "Close"
end if
end event

type cb_find from commandbutton within w_horrdvmeb
integer x = 603
integer y = 1912
integer width = 571
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date debut, fin

debut = date(string(em_start.text))
fin = date(string(em_end.text))

dw_horrdvmeb.object.t_date.text = 'Du  ' + em_start.text + '  au  ' + em_end.text
dw_horrdvmeb.retrieve(v_no_ortho,debut,fin)
end event

event constructor;if v_langue = 'an' then
	cb_find.Text = "Search"
end if
end event

type cb_print from commandbutton within w_horrdvmeb
integer x = 9
integer y = 1912
integer width = 594
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;dw_horrdvmeb.object.t_patnom.border = 0
dw_horrdvmeb.object.nom_traitement_t.border = 0
dw_horrdvmeb.object.t_rdvdate.border = 0
dw_horrdvmeb.object.t_rdvheure.border = 0
dw_horrdvmeb.object.t_telres.border = 0
dw_horrdvmeb.object.t_telbur.border = 0
dw_horrdvmeb.object.t_date_naissance.border = 0

gb_datawindow = true
openwithparm(w_print_options,dw_horrdvmeb)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

