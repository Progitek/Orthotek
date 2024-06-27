$PBExportHeader$w_patparphase.srw
forward
global type w_patparphase from w_child
end type
type dw_patparphase from u_dw within w_patparphase
end type
type cb_3 from commandbutton within w_patparphase
end type
type cb_find from commandbutton within w_patparphase
end type
type cb_print from commandbutton within w_patparphase
end type
end forward

global type w_patparphase from w_child
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
dw_patparphase dw_patparphase
cb_3 cb_3
cb_find cb_find
cb_print cb_print
end type
global w_patparphase w_patparphase

on w_patparphase.create
int iCurrent
call super::create
this.dw_patparphase=create dw_patparphase
this.cb_3=create cb_3
this.cb_find=create cb_find
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_patparphase
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_find
this.Control[iCurrent+4]=this.cb_print
end on

on w_patparphase.destroy
call super::destroy
destroy(this.dw_patparphase)
destroy(this.cb_3)
destroy(this.cb_find)
destroy(this.cb_print)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type dw_patparphase from u_dw within w_patparphase
integer width = 3634
integer height = 1904
integer taborder = 60
string title = "patparphase"
string dataobject = "d_patparphase"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
retrieve(v_no_ortho)
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
	case 't_numphase'
		SetSort('phase A')
		Sort()
	case 't_nomphase'
		SetSort('nomphase A')
		Sort()
	case 't_debuttrait'
		SetSort('debut_traitement A')
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

type cb_3 from commandbutton within w_patparphase
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

type cb_find from commandbutton within w_patparphase
boolean visible = false
integer x = 539
integer y = 1912
integer width = 512
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

event clicked;//date debut, fin
//
//debut = date(string(em_debut.text))
//fin = date(string(em_fin.text))
//
////dw_patarchiver.object.date_debut.text = em_debut.text
////dw_patarchiver.object.date_fin.text = em_fin.text
//dw_patarchiver.retrieve(v_no_ortho,debut,fin)
end event

event constructor;if v_langue = 'an' then
	cb_find.Text = "Search"
end if
end event

type cb_print from commandbutton within w_patparphase
integer x = 9
integer y = 1912
integer width = 530
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

event clicked;dw_patparphase.object.t_patnom.border = 0
dw_patparphase.object.t_numphase.border = 0
dw_patparphase.object.t_nomphase.border = 0
dw_patparphase.object.t_debuttrait.border = 0

gb_datawindow = true
openwithparm(w_print_options,dw_patparphase)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

