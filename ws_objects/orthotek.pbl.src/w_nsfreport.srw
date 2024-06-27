$PBExportHeader$w_nsfreport.srw
forward
global type w_nsfreport from w_child
end type
type ddlb_listpaie from u_ddlb within w_nsfreport
end type
type cb_retrieve from commandbutton within w_nsfreport
end type
type uo_calutil1 from u_calutil within w_nsfreport
end type
type uo_calutil2 from u_calutil within w_nsfreport
end type
type em_fin from editmask within w_nsfreport
end type
type st_to from statictext within w_nsfreport
end type
type em_debut from editmask within w_nsfreport
end type
type st_from from statictext within w_nsfreport
end type
type cb_print from commandbutton within w_nsfreport
end type
type dw_nsfreport from u_dw within w_nsfreport
end type
type cb_close from commandbutton within w_nsfreport
end type
end forward

global type w_nsfreport from w_child
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
ddlb_listpaie ddlb_listpaie
cb_retrieve cb_retrieve
uo_calutil1 uo_calutil1
uo_calutil2 uo_calutil2
em_fin em_fin
st_to st_to
em_debut em_debut
st_from st_from
cb_print cb_print
dw_nsfreport dw_nsfreport
cb_close cb_close
end type
global w_nsfreport w_nsfreport

type variables
private string is_mod[]
private long il_indmod
end variables

on w_nsfreport.create
int iCurrent
call super::create
this.ddlb_listpaie=create ddlb_listpaie
this.cb_retrieve=create cb_retrieve
this.uo_calutil1=create uo_calutil1
this.uo_calutil2=create uo_calutil2
this.em_fin=create em_fin
this.st_to=create st_to
this.em_debut=create em_debut
this.st_from=create st_from
this.cb_print=create cb_print
this.dw_nsfreport=create dw_nsfreport
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_listpaie
this.Control[iCurrent+2]=this.cb_retrieve
this.Control[iCurrent+3]=this.uo_calutil1
this.Control[iCurrent+4]=this.uo_calutil2
this.Control[iCurrent+5]=this.em_fin
this.Control[iCurrent+6]=this.st_to
this.Control[iCurrent+7]=this.em_debut
this.Control[iCurrent+8]=this.st_from
this.Control[iCurrent+9]=this.cb_print
this.Control[iCurrent+10]=this.dw_nsfreport
this.Control[iCurrent+11]=this.cb_close
end on

on w_nsfreport.destroy
call super::destroy
destroy(this.ddlb_listpaie)
destroy(this.cb_retrieve)
destroy(this.uo_calutil1)
destroy(this.uo_calutil2)
destroy(this.em_fin)
destroy(this.st_to)
destroy(this.em_debut)
destroy(this.st_from)
destroy(this.cb_print)
destroy(this.dw_nsfreport)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type ddlb_listpaie from u_ddlb within w_nsfreport
integer x = 1015
integer y = 1924
integer width = 617
integer taborder = 70
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
string pointer = "Arrow!"
boolean sorted = false
end type

event constructor;call super::constructor;string ls_method, ls_champ[], ls_champ2[]
long i, ll_count

ll_count = 1

if v_langue = 'an' then
	addItem('All')
else
	addItem('Tous')
end if
is_mod[1] = 'TOUS'
ll_count++

ls_method = gf_method(v_langue)
ls_champ = split(ls_method,'/')
for i = 1 to upperbound(ls_champ)
	ls_champ2 = split(ls_champ[i],'~t')
	addItem(ls_champ2[1])
	is_mod[ll_count] = ls_champ2[2]
	ll_count++
next

selectItem(1)
il_indmod = 1
end event

event selectionchanged;call super::selectionchanged;il_indmod = index
end event

type cb_retrieve from commandbutton within w_nsfreport
integer x = 503
integer y = 1920
integer width = 498
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

event clicked;date debut, fin
int li_option
string ls_mod

debut = date(em_debut.text)
fin = date(em_fin.text)

dw_nsfreport.object.t_from.text = em_debut.text
dw_nsfreport.object.t_to.text = em_fin.text

if il_indmod = 1 then
	setnull(ls_mod)
else
	ls_mod = is_mod[il_indmod]
end if
dw_nsfreport.retrieve(v_no_ortho,debut,fin,ls_mod)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Search'
end if
end event

type uo_calutil1 from u_calutil within w_nsfreport
event destroy ( )
boolean visible = false
integer x = 1842
integer y = 1364
integer taborder = 70
boolean border = true
end type

on uo_calutil1.destroy
call u_calutil::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

type uo_calutil2 from u_calutil within w_nsfreport
event destroy ( )
boolean visible = false
integer x = 2514
integer y = 1364
integer taborder = 80
boolean border = true
end type

on uo_calutil2.destroy
call u_calutil::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

type em_fin from editmask within w_nsfreport
integer x = 2725
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

type st_to from statictext within w_nsfreport
integer x = 2473
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

event constructor;if v_langue = 'an' then
	this.Text = "to:"
end if
end event

type em_debut from editmask within w_nsfreport
integer x = 2053
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

type st_from from statictext within w_nsfreport
integer x = 1641
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

event constructor;if v_langue = 'an' then
	this.Text = "From:"
end if
end event

type cb_print from commandbutton within w_nsfreport
integer y = 1920
integer width = 498
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

event clicked;gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_nsfreport)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type dw_nsfreport from u_dw within w_nsfreport
integer y = 8
integer width = 3611
integer height = 1904
integer taborder = 10
string title = "nsfreport"
string dataobject = "d_nsfreport"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;string ls_null

setnull(ls_null)

if v_langue = 'an' then
	this.object.t_du.text = 'From:'
	this.object.t_au.text = 'to:'
	this.object.t_title.text = "Payment report"
	this.object.montant_recu_t.text = 'Amount'
	this.object.id_contact_t.text = 'Financial responsible'
	this.object.t_printedon.text = 'Printed on'
	this.object.t_modalite.text  = "Method"
	this.object.t_qte.text = "Quantity"
end if
this.object.paiement_paiement.values = gf_method(v_langue)

SetTransObject(SQLCA)
dw_nsfreport.object.t_from.text = string(today())
dw_nsfreport.object.t_to.text = string(today())
dw_nsfreport.retrieve(v_no_ortho,today(),today(),ls_null)
end event

type cb_close from commandbutton within w_nsfreport
integer x = 3131
integer y = 1920
integer width = 498
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

