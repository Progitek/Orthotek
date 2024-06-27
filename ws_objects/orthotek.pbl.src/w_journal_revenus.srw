$PBExportHeader$w_journal_revenus.srw
forward
global type w_journal_revenus from w_child
end type
type uo_calutil2 from u_calutil within w_journal_revenus
end type
type uo_calutil1 from u_calutil within w_journal_revenus
end type
type st_1 from statictext within w_journal_revenus
end type
type em_date_fin from editmask within w_journal_revenus
end type
type st_date from statictext within w_journal_revenus
end type
type em_date_debut from editmask within w_journal_revenus
end type
type cb_retrieve from commandbutton within w_journal_revenus
end type
type cb_print from commandbutton within w_journal_revenus
end type
type dw_journal_revenus from u_dw within w_journal_revenus
end type
type cb_close from commandbutton within w_journal_revenus
end type
end forward

global type w_journal_revenus from w_child
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
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
st_1 st_1
em_date_fin em_date_fin
st_date st_date
em_date_debut em_date_debut
cb_retrieve cb_retrieve
cb_print cb_print
dw_journal_revenus dw_journal_revenus
cb_close cb_close
end type
global w_journal_revenus w_journal_revenus

on w_journal_revenus.create
int iCurrent
call super::create
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.st_1=create st_1
this.em_date_fin=create em_date_fin
this.st_date=create st_date
this.em_date_debut=create em_date_debut
this.cb_retrieve=create cb_retrieve
this.cb_print=create cb_print
this.dw_journal_revenus=create dw_journal_revenus
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_calutil2
this.Control[iCurrent+2]=this.uo_calutil1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.em_date_fin
this.Control[iCurrent+5]=this.st_date
this.Control[iCurrent+6]=this.em_date_debut
this.Control[iCurrent+7]=this.cb_retrieve
this.Control[iCurrent+8]=this.cb_print
this.Control[iCurrent+9]=this.dw_journal_revenus
this.Control[iCurrent+10]=this.cb_close
end on

on w_journal_revenus.destroy
call super::destroy
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.st_1)
destroy(this.em_date_fin)
destroy(this.st_date)
destroy(this.em_date_debut)
destroy(this.cb_retrieve)
destroy(this.cb_print)
destroy(this.dw_journal_revenus)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_date_debut.text = string(today())
end event

type uo_calutil2 from u_calutil within w_journal_revenus
boolean visible = false
integer x = 2126
integer y = 1348
integer taborder = 60
boolean border = true
end type

on uo_calutil2.destroy
call u_calutil::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;em_date_fin.text = string(istr_calutil.caldate)
end event

type uo_calutil1 from u_calutil within w_journal_revenus
boolean visible = false
integer x = 1344
integer y = 1348
integer taborder = 50
boolean border = true
end type

on uo_calutil1.destroy
call u_calutil::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;em_date_debut.text = string(istr_calutil.caldate)
end event

type st_1 from statictext within w_journal_revenus
integer x = 2094
integer y = 1924
integer width = 160
integer height = 64
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
string text = "Au:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "to:"
end if
end event

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type em_date_fin from editmask within w_journal_revenus
integer x = 2272
integer y = 1908
integer width = 402
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

type st_date from statictext within w_journal_revenus
integer x = 1463
integer y = 1924
integer width = 197
integer height = 64
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
string text = "Du:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "From:"
end if
end event

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type em_date_debut from editmask within w_journal_revenus
integer x = 1678
integer y = 1908
integer width = 402
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

type cb_retrieve from commandbutton within w_journal_revenus
integer x = 704
integer y = 1904
integer width = 635
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

event clicked;date v_debut, v_fin

v_debut = date(em_date_debut.text)
v_fin = date(em_date_fin.text)
SetPointer(HourGlass!)
dw_journal_revenus.retrieve(v_no_ortho,v_debut,v_fin)
dw_journal_revenus.object.t_date_debut.text = em_date_debut.text
dw_journal_revenus.object.t_date_fin.text = em_date_fin.text

end event

event constructor;if v_langue = 'an' then
	this.Text = "Search"
end if
end event

type cb_print from commandbutton within w_journal_revenus
integer x = 14
integer y = 1904
integer width = 690
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
openwithparm(w_print_options,dw_journal_revenus)
end event

event constructor;if v_langue = 'an' then
	this.Text = "Print"
end if
end event

type dw_journal_revenus from u_dw within w_journal_revenus
integer width = 3621
integer height = 1896
integer taborder = 40
string title = "journal_revenus"
string dataobject = "d_journal_revenus"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
if v_langue = 'an' then
	this.object.t_from.Text = 'From:'
	this.object.t_to.Text = 'to:'
	this.object.t_printedon.Text = 'Printed on'
end if

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

event retrieveend;if v_langue = 'an' then
	datawindowchild dwc_header
	datawindowchild dwc_1
	datawindowchild dwc_2
	this.GetChild('dw_header', dwc_header)
	this.GetChild('dw_1',dwc_1)
	this.GetChild('dw_2',dwc_2)
	dwc_header.modify("t_title.text = 'Revenu report for:'")
	dwc_1.modify("t_date.text = 'Invoice date'")
	dwc_1.modify("t_hono.text = 'Amount'")
	dwc_2.modify("t_date.text = 'Payment date'")
	dwc_2.modify("t_enc.text = 'Amount'")
end if
end event

type cb_close from commandbutton within w_journal_revenus
integer x = 2880
integer y = 1904
integer width = 741
integer height = 112
integer taborder = 50
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
	this.Text = "Close"
end if
end event

