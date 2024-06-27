$PBExportHeader$w_status_patients.srw
forward
global type w_status_patients from w_child
end type
type uo_calutil2 from u_calutil within w_status_patients
end type
type uo_calutil1 from u_calutil within w_status_patients
end type
type cb_print from commandbutton within w_status_patients
end type
type em_fin from editmask within w_status_patients
end type
type st_2 from statictext within w_status_patients
end type
type em_debut from editmask within w_status_patients
end type
type st_1 from statictext within w_status_patients
end type
type cb_find from commandbutton within w_status_patients
end type
type dw_status_patients from u_dw within w_status_patients
end type
type cb_close from commandbutton within w_status_patients
end type
end forward

global type w_status_patients from w_child
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
boolean ib_isupdateable = false
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
cb_print cb_print
em_fin em_fin
st_2 st_2
em_debut em_debut
st_1 st_1
cb_find cb_find
dw_status_patients dw_status_patients
cb_close cb_close
end type
global w_status_patients w_status_patients

on w_status_patients.create
int iCurrent
call super::create
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.cb_print=create cb_print
this.em_fin=create em_fin
this.st_2=create st_2
this.em_debut=create em_debut
this.st_1=create st_1
this.cb_find=create cb_find
this.dw_status_patients=create dw_status_patients
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_calutil2
this.Control[iCurrent+2]=this.uo_calutil1
this.Control[iCurrent+3]=this.cb_print
this.Control[iCurrent+4]=this.em_fin
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.em_debut
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.cb_find
this.Control[iCurrent+9]=this.dw_status_patients
this.Control[iCurrent+10]=this.cb_close
end on

on w_status_patients.destroy
call super::destroy
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.cb_print)
destroy(this.em_fin)
destroy(this.st_2)
destroy(this.em_debut)
destroy(this.st_1)
destroy(this.cb_find)
destroy(this.dw_status_patients)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type uo_calutil2 from u_calutil within w_status_patients
boolean visible = false
integer x = 2501
integer y = 1360
integer taborder = 60
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_status_patients
boolean visible = false
integer x = 1595
integer y = 1360
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type cb_print from commandbutton within w_status_patients
integer y = 1912
integer width = 640
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
openwithparm(w_print_options,dw_status_patients)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type em_fin from editmask within w_status_patients
integer x = 2501
integer y = 1920
integer width = 389
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
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean autoskip = true
end type

type st_2 from statictext within w_status_patients
integer x = 2217
integer y = 1932
integer width = 265
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date fin:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'to:'
end if
end event

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type em_debut from editmask within w_status_patients
integer x = 1810
integer y = 1920
integer width = 389
integer height = 100
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
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean autoskip = true
end type

type st_1 from statictext within w_status_patients
integer x = 1335
integer y = 1932
integer width = 466
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date du début:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'From:'
end if
end event

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type cb_find from commandbutton within w_status_patients
integer x = 640
integer y = 1912
integer width = 663
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date debut, fin

debut = date(em_debut.text)
fin = date(em_fin.text)

dw_status_patients.object.date_debut.text = em_debut.text
dw_status_patients.object.date_fin.text = em_fin.text
dw_status_patients.SetFilter('t_status_ordrepaie <> 7')
dw_status_patients.retrieve(v_no_ortho,debut,fin)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Find'
end if
end event

type dw_status_patients from u_dw within w_status_patients
integer x = 14
integer width = 3611
integer height = 1908
integer taborder = 50
string title = "Statuts"
string dataobject = "d_status_patients"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	dw_status_patients.object.t_titre.text = 'Status by patient for:'
	dw_status_patients.object.t_status.text = 'Status'
	dw_status_patients.object.b_status.text = 'Status'
	dw_status_patients.object.t_pat.text = 'Patient name'
	dw_status_patients.object.b_patnom.text = 'Patient name'
	dw_status_patients.object.t_date.text = 'Date'
	dw_status_patients.object.b_date.text = 'Date'
	dw_status_patients.object.t_printedon.text = 'Printed on'
	dw_status_patients.object.t_from.text = 'From:'
	dw_status_patients.object.t_to.text = 'to:'	
end if
dw_status_patients.SetTransObject(sqlca)


end event

event buttonclicked;choose case dwo.name
	case 'b_status'
		this.setsort('t_status_description A')
	case 'b_patnom'
		this.setsort('t_status_description A, nom_patient A')
	case 'b_date'
		this.setsort('t_status_description A, factures_traitements_date_facture A')
end choose
this.sort()
end event

type cb_close from commandbutton within w_status_patients
integer x = 2930
integer y = 1912
integer width = 695
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

