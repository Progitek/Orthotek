$PBExportHeader$w_blacklist.srw
forward
global type w_blacklist from w_child
end type
type cb_4 from commandbutton within w_blacklist
end type
type cb_print from commandbutton within w_blacklist
end type
type cb_search from commandbutton within w_blacklist
end type
type cb_close from commandbutton within w_blacklist
end type
type dw_blacklist from u_dw within w_blacklist
end type
end forward

global type w_blacklist from w_child
integer width = 3630
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
boolean ib_isupdateable = false
cb_4 cb_4
cb_print cb_print
cb_search cb_search
cb_close cb_close
dw_blacklist dw_blacklist
end type
global w_blacklist w_blacklist

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();if v_langue = 'an' then
	cb_search.text = "Search"
	cb_print.text= "Print"
	cb_close.text = "Close"
	dw_blacklist.object.t_title.text = "Patient's black list"
	dw_blacklist.object.t_patnom.text = "Patient's name"
	dw_blacklist.object.t_enterdate.text = "Enter date"
	dw_blacklist.object.t_exitdate.text = "Exit date"
end if
end subroutine

on w_blacklist.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_print=create cb_print
this.cb_search=create cb_search
this.cb_close=create cb_close
this.dw_blacklist=create dw_blacklist
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_print
this.Control[iCurrent+3]=this.cb_search
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.dw_blacklist
end on

on w_blacklist.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.cb_print)
destroy(this.cb_search)
destroy(this.cb_close)
destroy(this.dw_blacklist)
end on

type cb_4 from commandbutton within w_blacklist
integer x = 1449
integer y = 1924
integer width = 1513
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_print from commandbutton within w_blacklist
integer x = 727
integer y = 1924
integer width = 722
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_blacklist)
end event

type cb_search from commandbutton within w_blacklist
integer x = 5
integer y = 1924
integer width = 722
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;dw_blacklist.retrieve()
end event

type cb_close from commandbutton within w_blacklist
integer x = 2962
integer y = 1924
integer width = 663
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

type dw_blacklist from u_dw within w_blacklist
integer width = 3634
integer height = 1920
integer taborder = 10
string dataobject = "d_blacklist"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;setTransObject(SQLCA)
end event

