$PBExportHeader$w_lot.srw
forward
global type w_lot from window
end type
type em_fin from editmask within w_lot
end type
type em_debut from editmask within w_lot
end type
type st_2 from statictext within w_lot
end type
type st_1 from statictext within w_lot
end type
type cb_1 from commandbutton within w_lot
end type
type dw_lot from u_dw within w_lot
end type
type cb_cancel from commandbutton within w_lot
end type
type cb_apply from commandbutton within w_lot
end type
end forward

global type w_lot from window
integer width = 2478
integer height = 1292
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
em_fin em_fin
em_debut em_debut
st_2 st_2
st_1 st_1
cb_1 cb_1
dw_lot dw_lot
cb_cancel cb_cancel
cb_apply cb_apply
end type
global w_lot w_lot

on w_lot.create
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_lot=create dw_lot
this.cb_cancel=create cb_cancel
this.cb_apply=create cb_apply
this.Control[]={this.em_fin,&
this.em_debut,&
this.st_2,&
this.st_1,&
this.cb_1,&
this.dw_lot,&
this.cb_cancel,&
this.cb_apply}
end on

on w_lot.destroy
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_lot)
destroy(this.cb_cancel)
destroy(this.cb_apply)
end on

event open;em_debut.text = string(today(),'dd-mm-yyyy')
em_fin.text = string(today(),'dd-mm-yyyy')
end event

type em_fin from editmask within w_lot
integer x = 1591
integer y = 1172
integer width = 402
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type em_debut from editmask within w_lot
integer x = 997
integer y = 1172
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
boolean border = false
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_2 from statictext within w_lot
integer x = 1486
integer y = 1180
integer width = 114
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Au"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'To'
end if
end event

type st_1 from statictext within w_lot
integer x = 882
integer y = 1180
integer width = 119
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

event constructor;if v_langue = 'an' then
	this.text = 'From'
end if
end event

type cb_1 from commandbutton within w_lot
integer x = 439
integer y = 1160
integer width = 425
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;datastore ds_lotimp

ds_lotimp = create datastore
ds_lotimp.dataobject = 'd_lotimp'
ds_lotimp.setTransObject(SQLCA)
ds_lotimp.retrieve(v_no_ortho,gf_emtodate(em_debut.text),gf_emtodate(em_fin.text))
gb_datawindow = false
openwithparm(w_print_options,ds_lotimp)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type dw_lot from u_dw within w_lot
integer width = 2450
integer height = 1136
integer taborder = 10
string title = "lot"
string dataobject = "d_lot"
boolean border = false
end type

event constructor;if v_langue = 'an' then
	this.object.t_heure.text = 'Time'
end if

SetTransObject(SQLCA)
Retrieve(v_no_ortho)
SetRowFocusIndicator(FocusRect!)
end event

type cb_cancel from commandbutton within w_lot
integer x = 2025
integer y = 1160
integer width = 425
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type cb_apply from commandbutton within w_lot
integer x = 18
integer y = 1156
integer width = 425
integer height = 116
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Selectionner"
boolean default = true
end type

event clicked;w_lotdetail.il_idlot = dw_lot.getitemnumber(dw_lot.getrow(),'id_lot')
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Select'
end if
end event

