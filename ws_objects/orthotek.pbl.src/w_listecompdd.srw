$PBExportHeader$w_listecompdd.srw
forward
global type w_listecompdd from w_main
end type
type ddlb_satellite from dropdownlistbox within w_listecompdd
end type
type cb_1 from commandbutton within w_listecompdd
end type
type cb_2 from commandbutton within w_listecompdd
end type
type st_au from statictext within w_listecompdd
end type
type st_du from statictext within w_listecompdd
end type
type em_fin from editmask within w_listecompdd
end type
type em_debut from editmask within w_listecompdd
end type
type dw_listcompdd from u_dw within w_listecompdd
end type
type cb_close from commandbutton within w_listecompdd
end type
type cb_print from commandbutton within w_listecompdd
end type
type cb_search from commandbutton within w_listecompdd
end type
end forward

global type w_listecompdd from w_main
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean ib_isupdateable = false
ddlb_satellite ddlb_satellite
cb_1 cb_1
cb_2 cb_2
st_au st_au
st_du st_du
em_fin em_fin
em_debut em_debut
dw_listcompdd dw_listcompdd
cb_close cb_close
cb_print cb_print
cb_search cb_search
end type
global w_listecompdd w_listecompdd

type variables
long il_idendroit[]
long il_indendoit
end variables

on w_listecompdd.create
int iCurrent
call super::create
this.ddlb_satellite=create ddlb_satellite
this.cb_1=create cb_1
this.cb_2=create cb_2
this.st_au=create st_au
this.st_du=create st_du
this.em_fin=create em_fin
this.em_debut=create em_debut
this.dw_listcompdd=create dw_listcompdd
this.cb_close=create cb_close
this.cb_print=create cb_print
this.cb_search=create cb_search
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_satellite
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.st_au
this.Control[iCurrent+5]=this.st_du
this.Control[iCurrent+6]=this.em_fin
this.Control[iCurrent+7]=this.em_debut
this.Control[iCurrent+8]=this.dw_listcompdd
this.Control[iCurrent+9]=this.cb_close
this.Control[iCurrent+10]=this.cb_print
this.Control[iCurrent+11]=this.cb_search
end on

on w_listecompdd.destroy
call super::destroy
destroy(this.ddlb_satellite)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.st_au)
destroy(this.st_du)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.dw_listcompdd)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.cb_search)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_debut.text = string(today(), "dd/mm/yyyy")
em_fin.text = string(today(), "dd/mm/yyyy")

end event

type ddlb_satellite from dropdownlistbox within w_listecompdd
integer x = 2478
integer y = 40
integer width = 1147
integer height = 676
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;long i, ll_idendroit
string ls_endroit
integer li_option

select compsat into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	visible = true 
else
	visible = false
end if


i = 1
addItem('Tous')
i++

DECLARE listendroit CURSOR FOR
  SELECT t_satellites.lieu, t_satellites.id_satellite FROM t_satellites ORDER by lieu;

OPEN listendroit;

FETCH listendroit INTO :ls_endroit, :ll_idendroit;

DO WHILE SQLCA.SQLCode = 0
	
	addItem(ls_endroit)
	il_idendroit[i] = ll_idendroit
	
	i++
	
	FETCH listendroit INTO :ls_endroit, :ll_idendroit;
	
LOOP

CLOSE listendroit;

selectItem(1)
il_indendoit = 1
end event

event selectionchanged;il_indendoit = index
end event

type cb_1 from commandbutton within w_listecompdd
integer x = 5
integer y = 1936
integer width = 311
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_2 from commandbutton within w_listecompdd
integer x = 2313
integer y = 1936
integer width = 809
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type st_au from statictext within w_listecompdd
integer x = 1838
integer y = 1956
integer width = 96
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Au"
boolean focusrectangle = false
end type

type st_du from statictext within w_listecompdd
integer x = 1339
integer y = 1956
integer width = 87
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Du"
boolean focusrectangle = false
end type

type em_fin from editmask within w_listecompdd
integer x = 1957
integer y = 1944
integer width = 343
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_debut from editmask within w_listecompdd
integer x = 1445
integer y = 1944
integer width = 343
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type dw_listcompdd from u_dw within w_listecompdd
event ue_retrieve ( )
integer x = 5
integer y = 204
integer width = 3621
integer height = 1724
integer taborder = 10
string title = "none"
string dataobject = "d_listecompdd"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();date ldt_debut, ldt_fin
long	ll_satellite


if il_indendoit = 1 then
	setnull(ll_satellite)
else
	ll_satellite = il_idendroit[il_indendoit]
end if

ldt_debut = date(integer(right(em_debut.text, 4)), integer(mid(em_debut.text, 4, 2)), integer(left(em_debut.text, 2)))
ldt_fin = date(integer(right(em_fin.text, 4)), integer(mid(em_fin.text, 4, 2)), integer(left(em_fin.text, 2)))

Retrieve(v_no_ortho, ldt_debut, ldt_fin, ll_satellite)

end event

event constructor;modify("DataWindow.Print.Preview=Yes")

setTransObject(SQLCA)


end event

type cb_close from commandbutton within w_listecompdd
integer x = 3122
integer y = 1936
integer width = 503
integer height = 112
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
boolean cancel = true
end type

event clicked;close(parent)
end event

type cb_print from commandbutton within w_listecompdd
integer x = 315
integer y = 1936
integer width = 549
integer height = 112
integer taborder = 60
boolean bringtotop = true
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
openwithparm(w_print_options,dw_listcompdd)
end event

type cb_search from commandbutton within w_listecompdd
integer x = 859
integer y = 1936
integer width = 457
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
boolean default = true
end type

event clicked;dw_listcompdd.event ue_retrieve()
end event

