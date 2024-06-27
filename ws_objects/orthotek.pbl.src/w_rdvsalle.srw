$PBExportHeader$w_rdvsalle.srw
forward
global type w_rdvsalle from w_child
end type
type em_fin from editmask within w_rdvsalle
end type
type em_debut from editmask within w_rdvsalle
end type
type st_2 from statictext within w_rdvsalle
end type
type st_du from statictext within w_rdvsalle
end type
type cb_3 from commandbutton within w_rdvsalle
end type
type cb_2 from commandbutton within w_rdvsalle
end type
type cb_print from commandbutton within w_rdvsalle
end type
type dw_rdvsalle from u_dw within w_rdvsalle
end type
end forward

global type w_rdvsalle from w_child
integer x = 214
integer y = 221
integer height = 2076
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean ib_isupdateable = false
boolean ib_disableclosequery = true
em_fin em_fin
em_debut em_debut
st_2 st_2
st_du st_du
cb_3 cb_3
cb_2 cb_2
cb_print cb_print
dw_rdvsalle dw_rdvsalle
end type
global w_rdvsalle w_rdvsalle

on w_rdvsalle.create
int iCurrent
call super::create
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_2=create st_2
this.st_du=create st_du
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_print=create cb_print
this.dw_rdvsalle=create dw_rdvsalle
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_fin
this.Control[iCurrent+2]=this.em_debut
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_du
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_print
this.Control[iCurrent+8]=this.dw_rdvsalle
end on

on w_rdvsalle.destroy
call super::destroy
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_2)
destroy(this.st_du)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_print)
destroy(this.dw_rdvsalle)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_debut.text = string(today())
em_fin.text = string(today())
end event

type em_fin from editmask within w_rdvsalle
integer x = 2359
integer y = 1940
integer width = 402
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type em_debut from editmask within w_rdvsalle
integer x = 1765
integer y = 1940
integer width = 402
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_2 from statictext within w_rdvsalle
integer x = 2231
integer y = 1948
integer width = 110
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Au"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_du.text = "To"
end if
end event

type st_du from statictext within w_rdvsalle
integer x = 1573
integer y = 1948
integer width = 160
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Du"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_du.text = "From"
end if
end event

type cb_3 from commandbutton within w_rdvsalle
integer x = 754
integer y = 1924
integer width = 745
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

event clicked;date ldt_debut, ldt_fin
long ll_orthoid

select horshareid into :ll_orthoid from t_options;
ldt_debut = gf_emtodate(em_debut.text)
ldt_fin = gf_emtodate(em_fin.text)
dw_rdvsalle.retrieve(ldt_debut,ldt_fin,ll_orthoid)
end event

event constructor;if v_langue = 'an' then
	this.text = "Search"
end if
end event

type cb_2 from commandbutton within w_rdvsalle
integer x = 2894
integer y = 1924
integer width = 745
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
	this.text = "Search"
end if
end event

type cb_print from commandbutton within w_rdvsalle
integer x = 5
integer y = 1924
integer width = 745
integer height = 112
integer taborder = 20
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
openwithparm(w_print_options,dw_rdvsalle)
end event

event constructor;if v_langue = 'an' then
	this.text = "Print"
end if
end event

type dw_rdvsalle from u_dw within w_rdvsalle
integer y = 4
integer width = 3634
integer height = 1908
integer taborder = 10
string dataobject = "d_rdvsalle"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;setTransObject(SQLCA)

if v_langue = 'an' then
	object.t_title.text = 'Appointment by station'
	object.nomcol_t.text = 'Station'
	object.nom_traitement_t.text = "name of treatment"
	object.cnt_t.text = "Quantity"
	object.tempmoy_t.text = "Average (min)"
	object.t_printedon.text = "Printed On"
end if
end event

