$PBExportHeader$w_dureemoytrait.srw
forward
global type w_dureemoytrait from w_child
end type
type dw_dureemoytrait from u_dw within w_dureemoytrait
end type
type em_fin from editmask within w_dureemoytrait
end type
type st_2 from statictext within w_dureemoytrait
end type
type cb_search from commandbutton within w_dureemoytrait
end type
type cb_close from commandbutton within w_dureemoytrait
end type
type cb_print from commandbutton within w_dureemoytrait
end type
type em_debut from editmask within w_dureemoytrait
end type
type st_1 from statictext within w_dureemoytrait
end type
end forward

global type w_dureemoytrait from w_child
integer width = 3685
integer height = 2076
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean ib_isupdateable = false
dw_dureemoytrait dw_dureemoytrait
em_fin em_fin
st_2 st_2
cb_search cb_search
cb_close cb_close
cb_print cb_print
em_debut em_debut
st_1 st_1
end type
global w_dureemoytrait w_dureemoytrait

on w_dureemoytrait.create
int iCurrent
call super::create
this.dw_dureemoytrait=create dw_dureemoytrait
this.em_fin=create em_fin
this.st_2=create st_2
this.cb_search=create cb_search
this.cb_close=create cb_close
this.cb_print=create cb_print
this.em_debut=create em_debut
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_dureemoytrait
this.Control[iCurrent+2]=this.em_fin
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.cb_search
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.em_debut
this.Control[iCurrent+8]=this.st_1
end on

on w_dureemoytrait.destroy
call super::destroy
destroy(this.dw_dureemoytrait)
destroy(this.em_fin)
destroy(this.st_2)
destroy(this.cb_search)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.em_debut)
destroy(this.st_1)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type dw_dureemoytrait from u_dw within w_dureemoytrait
integer width = 3616
integer height = 1920
integer taborder = 10
string title = "none"
string dataobject = "d_dureemoytrait"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;setTransObject(SQLCA)
end event

type em_fin from editmask within w_dureemoytrait
integer x = 2309
integer y = 1928
integer width = 462
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event constructor;this.text = string(today(),"dd-mm-yyyy")
end event

type st_2 from statictext within w_dureemoytrait
integer x = 2167
integer y = 1944
integer width = 169
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "AU"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "To:"
end if
end event

type cb_search from commandbutton within w_dureemoytrait
integer x = 731
integer y = 1924
integer width = 727
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event constructor;if v_langue = 'an' then
	this.text = "Search"
end if
end event

event clicked;dw_dureemoytrait.retrieve(gf_emtodate(em_debut.text),gf_emtodate(em_fin.text),v_no_ortho)
end event

type cb_close from commandbutton within w_dureemoytrait
integer x = 2894
integer y = 1924
integer width = 727
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

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

event clicked;close(parent)
end event

type cb_print from commandbutton within w_dureemoytrait
integer x = 5
integer y = 1924
integer width = 727
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

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if
end event

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_dureemoytrait)

end event

type em_debut from editmask within w_dureemoytrait
integer x = 1673
integer y = 1928
integer width = 462
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event constructor;this.text = string(today(),"dd-mm-yyyy")
end event

type st_1 from statictext within w_dureemoytrait
integer x = 1481
integer y = 1944
integer width = 146
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DU"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "From:"
end if
end event

