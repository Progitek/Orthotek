$PBExportHeader$w_dentpatdetail.srw
forward
global type w_dentpatdetail from w_child
end type
type cb_retrieve from commandbutton within w_dentpatdetail
end type
type uo_calutil1 from u_calutil within w_dentpatdetail
end type
type uo_calutil2 from u_calutil within w_dentpatdetail
end type
type em_fin from editmask within w_dentpatdetail
end type
type st_2 from statictext within w_dentpatdetail
end type
type em_debut from editmask within w_dentpatdetail
end type
type st_1 from statictext within w_dentpatdetail
end type
type dw_dentpatdet from u_dw within w_dentpatdetail
end type
type cb_close from commandbutton within w_dentpatdetail
end type
type cb_print from commandbutton within w_dentpatdetail
end type
end forward

global type w_dentpatdetail from w_child
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
boolean ib_isupdateable = false
cb_retrieve cb_retrieve
uo_calutil1 uo_calutil1
uo_calutil2 uo_calutil2
em_fin em_fin
st_2 st_2
em_debut em_debut
st_1 st_1
dw_dentpatdet dw_dentpatdet
cb_close cb_close
cb_print cb_print
end type
global w_dentpatdetail w_dentpatdetail

on w_dentpatdetail.create
int iCurrent
call super::create
this.cb_retrieve=create cb_retrieve
this.uo_calutil1=create uo_calutil1
this.uo_calutil2=create uo_calutil2
this.em_fin=create em_fin
this.st_2=create st_2
this.em_debut=create em_debut
this.st_1=create st_1
this.dw_dentpatdet=create dw_dentpatdet
this.cb_close=create cb_close
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_retrieve
this.Control[iCurrent+2]=this.uo_calutil1
this.Control[iCurrent+3]=this.uo_calutil2
this.Control[iCurrent+4]=this.em_fin
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.em_debut
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.dw_dentpatdet
this.Control[iCurrent+9]=this.cb_close
this.Control[iCurrent+10]=this.cb_print
end on

on w_dentpatdetail.destroy
call super::destroy
destroy(this.cb_retrieve)
destroy(this.uo_calutil1)
destroy(this.uo_calutil2)
destroy(this.em_fin)
destroy(this.st_2)
destroy(this.em_debut)
destroy(this.st_1)
destroy(this.dw_dentpatdet)
destroy(this.cb_close)
destroy(this.cb_print)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_retrieve from commandbutton within w_dentpatdetail
integer x = 672
integer y = 1912
integer width = 667
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;date ldt_start,ldt_end
dw_dentpatdet.object.t_from.text = em_debut.text
dw_dentpatdet.object.t_to.text = em_fin.text
ldt_start = date(em_debut.text)
ldt_end = date(em_fin.text)
dw_dentpatdet.retrieve(v_no_ortho,ldt_start,ldt_end)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Search'
end if
end event

type uo_calutil1 from u_calutil within w_dentpatdetail
boolean visible = false
integer x = 1623
integer y = 1360
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type uo_calutil2 from u_calutil within w_dentpatdetail
boolean visible = false
integer x = 2487
integer y = 1360
integer taborder = 60
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type em_fin from editmask within w_dentpatdetail
integer x = 2487
integer y = 1916
integer width = 389
integer height = 100
integer taborder = 40
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
string mask = "dd/mm/yyyy"
boolean autoskip = true
end type

type st_2 from statictext within w_dentpatdetail
integer x = 2249
integer y = 1928
integer width = 224
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

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

event constructor;if v_langue = 'an' then
	st_2.Text = "to:"
end if
end event

type em_debut from editmask within w_dentpatdetail
integer x = 1833
integer y = 1916
integer width = 393
integer height = 100
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
string mask = "dd/mm/yyyy"
boolean autoskip = true
end type

type st_1 from statictext within w_dentpatdetail
integer x = 1422
integer y = 1928
integer width = 398
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

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

event constructor;if v_langue = 'an' then
	st_1.Text = "From:"
end if
end event

type dw_dentpatdet from u_dw within w_dentpatdetail
integer x = 9
integer width = 3593
integer height = 1900
integer taborder = 10
string title = "Patient par dentiste"
string dataobject = "d_dentpatdet"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	this.object.t_title.text = 'Dentist detail report'
	this.object.tt_from.text = 'From'
	this.object.tt_to.text = 'to'
	this.object.t_dentist.text = 'Dentist Name'
	this.object.t_date.text = 'First App.'
	this.object.t_pat.text = 'Patient Name'
	this.object.t_status.text = 'Status'
	this.object.t_phase.text = 'Phase'
	this.object.t_lastrdv.text = 'Last Appt'
	this.object.t_nextrdv.text = 'Next Appt'
	this.object.t_rap.text = 'Recall'
	this.object.t_total.text = 'Total:'
	this.object.t_printedon.text = 'Printed on'
	this.object.t_totcom.text = 'Total Begun:'
	this.object.t_totvenu.text = 'Total come:'
end if

SetTransObject(SQLCA)
end event

type cb_close from commandbutton within w_dentpatdetail
integer x = 2935
integer y = 1912
integer width = 667
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
	this.text = 'Close'
end if
end event

type cb_print from commandbutton within w_dentpatdetail
integer x = 5
integer y = 1912
integer width = 667
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
openwithparm(w_print_options,dw_dentpatdet)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

