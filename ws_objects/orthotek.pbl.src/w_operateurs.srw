$PBExportHeader$w_operateurs.srw
forward
global type w_operateurs from w_response
end type
type dw_operateurs from datawindow within w_operateurs
end type
type st_1 from statictext within w_operateurs
end type
end forward

global type w_operateurs from w_response
integer width = 1911
integer height = 1848
boolean center = true
dw_operateurs dw_operateurs
st_1 st_1
end type
global w_operateurs w_operateurs

event open;call super::open;dw_operateurs.setTransObject(SQLCA)
dw_operateurs.retrieve(v_no_ortho)
end event

on w_operateurs.create
int iCurrent
call super::create
this.dw_operateurs=create dw_operateurs
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_operateurs
this.Control[iCurrent+2]=this.st_1
end on

on w_operateurs.destroy
call super::destroy
destroy(this.dw_operateurs)
destroy(this.st_1)
end on

type dw_operateurs from datawindow within w_operateurs
integer x = 23
integer y = 116
integer width = 1842
integer height = 1608
integer taborder = 10
string title = "none"
string dataobject = "d_operateurs"
boolean border = false
boolean livescroll = true
end type

event clicked;long ll_idpers

selectRow(row,true)
ll_idpers = dw_operateurs.getItemNumber(row,'id_personnel')
closewithreturn(parent,ll_idpers)
end event

type st_1 from statictext within w_operateurs
integer x = 5
integer y = 28
integer width = 503
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Personnels"
boolean focusrectangle = false
end type

