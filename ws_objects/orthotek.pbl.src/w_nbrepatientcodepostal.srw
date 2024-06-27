$PBExportHeader$w_nbrepatientcodepostal.srw
forward
global type w_nbrepatientcodepostal from w_child
end type
type dw_nbrepatientcodepostal from u_dw within w_nbrepatientcodepostal
end type
type cb_search from commandbutton within w_nbrepatientcodepostal
end type
type cb_print from commandbutton within w_nbrepatientcodepostal
end type
type cb_2 from commandbutton within w_nbrepatientcodepostal
end type
type cb_close from commandbutton within w_nbrepatientcodepostal
end type
end forward

global type w_nbrepatientcodepostal from w_child
integer height = 2076
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
dw_nbrepatientcodepostal dw_nbrepatientcodepostal
cb_search cb_search
cb_print cb_print
cb_2 cb_2
cb_close cb_close
end type
global w_nbrepatientcodepostal w_nbrepatientcodepostal

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();if v_langue = 'an' then
	cb_print.text = "Print"
	cb_search.text = "Search"
	cb_close.text = "Close"
	dw_nbrepatientcodepostal.object.t_titre.text = "Patient by postal code"
end if
end subroutine

on w_nbrepatientcodepostal.create
int iCurrent
call super::create
this.dw_nbrepatientcodepostal=create dw_nbrepatientcodepostal
this.cb_search=create cb_search
this.cb_print=create cb_print
this.cb_2=create cb_2
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_nbrepatientcodepostal
this.Control[iCurrent+2]=this.cb_search
this.Control[iCurrent+3]=this.cb_print
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cb_close
end on

on w_nbrepatientcodepostal.destroy
call super::destroy
destroy(this.dw_nbrepatientcodepostal)
destroy(this.cb_search)
destroy(this.cb_print)
destroy(this.cb_2)
destroy(this.cb_close)
end on

type dw_nbrepatientcodepostal from u_dw within w_nbrepatientcodepostal
integer x = 9
integer width = 3639
integer height = 1912
integer taborder = 10
string dataobject = "d_nbrepatientcodepostal"
end type

type cb_search from commandbutton within w_nbrepatientcodepostal
integer x = 507
integer y = 1924
integer width = 494
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rehercher"
end type

event clicked;dw_nbrepatientcodepostal.retrieve()
end event

type cb_print from commandbutton within w_nbrepatientcodepostal
integer x = 9
integer y = 1924
integer width = 494
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_nbrepatientcodepostal)
end event

type cb_2 from commandbutton within w_nbrepatientcodepostal
integer x = 1006
integer y = 1924
integer width = 2126
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_close from commandbutton within w_nbrepatientcodepostal
integer x = 3136
integer y = 1924
integer width = 494
integer height = 112
integer taborder = 10
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

