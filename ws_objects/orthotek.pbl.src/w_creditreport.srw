$PBExportHeader$w_creditreport.srw
forward
global type w_creditreport from w_child
end type
type cb_retrieve from commandbutton within w_creditreport
end type
type uo_calutil1 from u_calutil within w_creditreport
end type
type uo_calutil2 from u_calutil within w_creditreport
end type
type em_fin from editmask within w_creditreport
end type
type st_to from statictext within w_creditreport
end type
type em_debut from editmask within w_creditreport
end type
type st_from from statictext within w_creditreport
end type
type cb_print from commandbutton within w_creditreport
end type
type dw_creditreport from u_dw within w_creditreport
end type
type cb_close from commandbutton within w_creditreport
end type
end forward

global type w_creditreport from w_child
integer width = 3630
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
st_to st_to
em_debut em_debut
st_from st_from
cb_print cb_print
dw_creditreport dw_creditreport
cb_close cb_close
end type
global w_creditreport w_creditreport

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();if v_langue = 'an' then
	cb_print.text = 'Print'
	cb_retrieve.text = 'Search'
	cb_close.text = 'Close'
	st_to.Text = "to:"
	st_from.Text = "From:"

	dw_creditreport.object.t_du.text = 'From:'
	dw_creditreport.object.t_au.text = 'to:'
	dw_creditreport.object.t_title.text = 'Credit Report'
	dw_creditreport.object.montant_recu_t.text = 'Amount'
	dw_creditreport.object.id_contact_t.text = 'Financial responsible'
	dw_creditreport.object.t_printedon.text = 'Printed on'
	
	title = "Credit repport"
else
	title = "Rapport des crédits"
end if

end subroutine

on w_creditreport.create
int iCurrent
call super::create
this.cb_retrieve=create cb_retrieve
this.uo_calutil1=create uo_calutil1
this.uo_calutil2=create uo_calutil2
this.em_fin=create em_fin
this.st_to=create st_to
this.em_debut=create em_debut
this.st_from=create st_from
this.cb_print=create cb_print
this.dw_creditreport=create dw_creditreport
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_retrieve
this.Control[iCurrent+2]=this.uo_calutil1
this.Control[iCurrent+3]=this.uo_calutil2
this.Control[iCurrent+4]=this.em_fin
this.Control[iCurrent+5]=this.st_to
this.Control[iCurrent+6]=this.em_debut
this.Control[iCurrent+7]=this.st_from
this.Control[iCurrent+8]=this.cb_print
this.Control[iCurrent+9]=this.dw_creditreport
this.Control[iCurrent+10]=this.cb_close
end on

on w_creditreport.destroy
call super::destroy
destroy(this.cb_retrieve)
destroy(this.uo_calutil1)
destroy(this.uo_calutil2)
destroy(this.em_fin)
destroy(this.st_to)
destroy(this.em_debut)
destroy(this.st_from)
destroy(this.cb_print)
destroy(this.dw_creditreport)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

end event

type cb_retrieve from commandbutton within w_creditreport
integer x = 699
integer y = 1920
integer width = 699
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;date debut, fin

debut = date(em_debut.text)
fin = date(em_fin.text)

dw_creditreport.object.t_from.text = em_debut.text
dw_creditreport.object.t_to.text = em_fin.text
dw_creditreport.retrieve(v_no_ortho,debut,fin)
end event

type uo_calutil1 from u_calutil within w_creditreport
event destroy ( )
boolean visible = false
integer x = 1627
integer y = 1364
integer taborder = 70
boolean border = true
end type

on uo_calutil1.destroy
call u_calutil::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

type uo_calutil2 from u_calutil within w_creditreport
event destroy ( )
boolean visible = false
integer x = 2491
integer y = 1364
integer taborder = 80
boolean border = true
end type

on uo_calutil2.destroy
call u_calutil::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

type em_fin from editmask within w_creditreport
integer x = 2491
integer y = 1920
integer width = 389
integer height = 100
integer taborder = 50
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

type st_to from statictext within w_creditreport
integer x = 2254
integer y = 1932
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

type em_debut from editmask within w_creditreport
integer x = 1838
integer y = 1920
integer width = 393
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
string mask = "[date]"
boolean autoskip = true
end type

type st_from from statictext within w_creditreport
integer x = 1426
integer y = 1932
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

type cb_print from commandbutton within w_creditreport
integer y = 1920
integer width = 699
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_creditreport)
end event

type dw_creditreport from u_dw within w_creditreport
integer width = 3611
integer height = 1912
integer taborder = 10
string title = "creditreport"
string dataobject = "d_creditreport"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
this.object.t_from.text = string(today())
this.object.t_to.text = string(today())
this.retrieve(v_no_ortho,today(),today())
end event

type cb_close from commandbutton within w_creditreport
integer x = 2912
integer y = 1920
integer width = 699
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

event clicked;close(parent)
end event

