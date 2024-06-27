$PBExportHeader$w_patetatdos.srw
forward
global type w_patetatdos from w_child
end type
type cb_search from commandbutton within w_patetatdos
end type
type cb_print from commandbutton within w_patetatdos
end type
type cb_close from commandbutton within w_patetatdos
end type
type dw_patetatdos from u_dw within w_patetatdos
end type
end forward

global type w_patetatdos from w_child
integer x = 214
integer y = 221
cb_search cb_search
cb_print cb_print
cb_close cb_close
dw_patetatdos dw_patetatdos
end type
global w_patetatdos w_patetatdos

on w_patetatdos.create
int iCurrent
call super::create
this.cb_search=create cb_search
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_patetatdos=create dw_patetatdos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_search
this.Control[iCurrent+2]=this.cb_print
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.dw_patetatdos
end on

on w_patetatdos.destroy
call super::destroy
destroy(this.cb_search)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_patetatdos)
end on

type cb_search from commandbutton within w_patetatdos
integer x = 850
integer y = 1920
integer width = 864
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event constructor;if v_langue = 'an' then
	this.text = 'Find'
end if
end event

type cb_print from commandbutton within w_patetatdos
integer x = 18
integer y = 1920
integer width = 832
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
openwithparm(w_print_options,dw_patetatdos)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type cb_close from commandbutton within w_patetatdos
integer x = 2578
integer y = 1920
integer width = 1051
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

event clicked;Close(parent)
end event

type dw_patetatdos from u_dw within w_patetatdos
integer width = 3634
integer height = 1892
integer taborder = 10
string dataobject = "d_patetatdos"
end type

