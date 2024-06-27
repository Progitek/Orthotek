$PBExportHeader$w_selectiontype.srw
forward
global type w_selectiontype from window
end type
type uo_calutil2 from u_calutil within w_selectiontype
end type
type uo_calutil1 from u_calutil within w_selectiontype
end type
type cb_today from commandbutton within w_selectiontype
end type
type em_fin from editmask within w_selectiontype
end type
type st_to from statictext within w_selectiontype
end type
type em_debut from editmask within w_selectiontype
end type
type st_from from statictext within w_selectiontype
end type
type dw_horraptrait from u_dw within w_selectiontype
end type
type cb_cancel from commandbutton within w_selectiontype
end type
type cb_apply from commandbutton within w_selectiontype
end type
end forward

global type w_selectiontype from window
integer x = 800
integer y = 600
integer width = 1801
integer height = 1096
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
cb_today cb_today
em_fin em_fin
st_to st_to
em_debut em_debut
st_from st_from
dw_horraptrait dw_horraptrait
cb_cancel cb_cancel
cb_apply cb_apply
end type
global w_selectiontype w_selectiontype

on w_selectiontype.create
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.cb_today=create cb_today
this.em_fin=create em_fin
this.st_to=create st_to
this.em_debut=create em_debut
this.st_from=create st_from
this.dw_horraptrait=create dw_horraptrait
this.cb_cancel=create cb_cancel
this.cb_apply=create cb_apply
this.Control[]={this.uo_calutil2,&
this.uo_calutil1,&
this.cb_today,&
this.em_fin,&
this.st_to,&
this.em_debut,&
this.st_from,&
this.dw_horraptrait,&
this.cb_cancel,&
this.cb_apply}
end on

on w_selectiontype.destroy
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.cb_today)
destroy(this.em_fin)
destroy(this.st_to)
destroy(this.em_debut)
destroy(this.st_from)
destroy(this.dw_horraptrait)
destroy(this.cb_cancel)
destroy(this.cb_apply)
end on

type uo_calutil2 from u_calutil within w_selectiontype
boolean visible = false
integer x = 750
integer y = 320
integer taborder = 60
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_selectiontype
boolean visible = false
integer x = 41
integer y = 320
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type cb_today from commandbutton within w_selectiontype
integer x = 1257
integer y = 872
integer width = 489
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Aujourd~'hui"
end type

event clicked;em_debut.text = string(today())
em_fin.text = string(today())
end event

event constructor;if v_langue = 'an' then
	this.text = 'Today'
end if
end event

type em_fin from editmask within w_selectiontype
integer x = 745
integer y = 872
integer width = 457
integer height = 88
integer taborder = 30
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

event constructor;em_fin.text = string("31-12-2999")
end event

type st_to from statictext within w_selectiontype
integer x = 645
integer y = 876
integer width = 96
integer height = 80
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
string text = "au"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "To"
end if
end event

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type em_debut from editmask within w_selectiontype
integer x = 183
integer y = 872
integer width = 457
integer height = 88
integer taborder = 20
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

event constructor;em_debut.text = string("01-01-1900")

end event

type st_from from statictext within w_selectiontype
integer x = 23
integer y = 876
integer width = 151
integer height = 80
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
string text = "Du:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "From"
end if
end event

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type dw_horraptrait from u_dw within w_selectiontype
integer x = 73
integer y = 32
integer width = 1614
integer height = 820
integer taborder = 10
string title = "horraptrait"
string dataobject = "dddw_horraptrait"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_newrow

SetTransObject(SQLCA)
SetRowFocusIndicator(Hand!)
Retrieve(v_no_ortho)
ll_newrow = InsertRow(1)
if v_langue = 'an' then
	SetItem(ll_newrow,'nom','All')
else
	SetItem(ll_newrow,'nom','Tous')
end if
SetFocus()
end event

type cb_cancel from commandbutton within w_selectiontype
integer x = 891
integer y = 964
integer width = 855
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
boolean cancel = true
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type cb_apply from commandbutton within w_selectiontype
integer x = 23
integer y = 964
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
string text = "Appliquer"
boolean default = true
end type

event clicked;string ls_filtre

w_liste_des_rappels_retentions.il_idraptrait = dw_horraptrait.getitemnumber(dw_horraptrait.getrow(),"id_raptrait")
w_liste_des_rappels_retentions.idt_debut = date(em_debut.text)
w_liste_des_rappels_retentions.idt_fin = date(em_fin.text)
w_liste_des_rappels_retentions.is_raptype = dw_horraptrait.getitemstring(dw_horraptrait.getrow(),'nom')

if w_liste_des_rappels_retentions.is_raptype <> 'Tous' and w_liste_des_rappels_retentions.is_raptype <> 'All' then
	ls_filtre = "rendezvous_prochain_rv >= date('" + string(w_liste_des_rappels_retentions.idt_debut) + "') and rendezvous_prochain_rv <= date('" + string(w_liste_des_rappels_retentions.idt_fin) + "') and rendezvous_id_raptrait = " + string(w_liste_des_rappels_retentions.il_idraptrait)
else
	ls_filtre = "rendezvous_prochain_rv >= date('" + string(w_liste_des_rappels_retentions.idt_debut) + "') and rendezvous_prochain_rv <= date('" + string(w_liste_des_rappels_retentions.idt_fin) + "')"
end if
w_liste_des_rappels_retentions.dw_rappel_retention.setfilter(ls_filtre)
w_liste_des_rappels_retentions.dw_rappel_retention.filter()
w_liste_des_rappels_retentions.dw_rappel_retention.SetSort('rendezvous_prochain_rv A')
w_liste_des_rappels_retentions.dw_rappel_retention.Sort()
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Apply'
end if
end event

