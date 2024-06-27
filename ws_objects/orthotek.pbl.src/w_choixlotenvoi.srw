$PBExportHeader$w_choixlotenvoi.srw
forward
global type w_choixlotenvoi from w_response
end type
type cb_cancel from commandbutton within w_choixlotenvoi
end type
type cb_select from commandbutton within w_choixlotenvoi
end type
type dw_choixlotenvoi from u_dw within w_choixlotenvoi
end type
type st_1 from statictext within w_choixlotenvoi
end type
type rr_1 from roundrectangle within w_choixlotenvoi
end type
end forward

global type w_choixlotenvoi from w_response
integer x = 214
integer y = 221
integer width = 1339
integer height = 1312
boolean titlebar = false
boolean controlmenu = false
boolean center = true
cb_cancel cb_cancel
cb_select cb_select
dw_choixlotenvoi dw_choixlotenvoi
st_1 st_1
rr_1 rr_1
end type
global w_choixlotenvoi w_choixlotenvoi

on w_choixlotenvoi.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.cb_select=create cb_select
this.dw_choixlotenvoi=create dw_choixlotenvoi
this.st_1=create st_1
this.rr_1=create rr_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.cb_select
this.Control[iCurrent+3]=this.dw_choixlotenvoi
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.rr_1
end on

on w_choixlotenvoi.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.cb_select)
destroy(this.dw_choixlotenvoi)
destroy(this.st_1)
destroy(this.rr_1)
end on

event open;call super::open;dw_choixlotenvoi.retrieve()
end event

type cb_cancel from commandbutton within w_choixlotenvoi
integer x = 905
integer y = 1164
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
end type

event clicked;close(parent)
end event

type cb_select from commandbutton within w_choixlotenvoi
integer x = 14
integer y = 1164
integer width = 430
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sélectionner"
end type

event clicked;String ls_idlot
ls_idlot = string(dw_choixlotenvoi.getitemnumber(dw_choixlotenvoi.getrow( ),'id_lot' ))
CloseWithReturn(Parent, ls_idlot)
end event

type dw_choixlotenvoi from u_dw within w_choixlotenvoi
integer x = 18
integer y = 120
integer width = 1285
integer height = 1024
integer taborder = 10
string dataobject = "d_choixlotenvoi"
end type

event clicked;call super::clicked;If row > 0 then	
	scrollToRow(getClickedRow())
	selectRow(0,false)
	selectRow(row,true)
end if
end event

type st_1 from statictext within w_choixlotenvoi
integer x = 439
integer y = 28
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Liste des lots"
boolean focusrectangle = false
end type

type rr_1 from roundrectangle within w_choixlotenvoi
integer linethickness = 4
long fillcolor = 67108864
integer x = 9
integer y = 12
integer width = 1298
integer height = 88
integer cornerheight = 40
integer cornerwidth = 46
end type

