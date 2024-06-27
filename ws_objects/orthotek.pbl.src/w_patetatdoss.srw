$PBExportHeader$w_patetatdoss.srw
forward
global type w_patetatdoss from w_child
end type
type cb_close from commandbutton within w_patetatdoss
end type
type dw_patetatdoss from u_dw within w_patetatdoss
end type
end forward

global type w_patetatdoss from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
boolean ib_isupdateable = false
boolean ib_disableclosequery = true
cb_close cb_close
dw_patetatdoss dw_patetatdoss
end type
global w_patetatdoss w_patetatdoss

on w_patetatdoss.create
int iCurrent
call super::create
this.cb_close=create cb_close
this.dw_patetatdoss=create dw_patetatdoss
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
this.Control[iCurrent+2]=this.dw_patetatdoss
end on

on w_patetatdoss.destroy
call super::destroy
destroy(this.cb_close)
destroy(this.dw_patetatdoss)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_close from commandbutton within w_patetatdoss
integer x = 2578
integer y = 1904
integer width = 1051
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;Close(parent)
end event

type dw_patetatdoss from u_dw within w_patetatdoss
integer width = 3634
integer height = 1892
integer taborder = 10
string dataobject = "d_patetatdoss"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;SetTransObject(SQLCA)
Retrieve(v_no_ortho)

pro_resize luo_size
luo_size.uf_resizedw ( this )
end event

