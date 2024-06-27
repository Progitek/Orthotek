$PBExportHeader$w_liste_comp.srw
forward
global type w_liste_comp from w_main
end type
type ddlb_satellite from dropdownlistbox within w_liste_comp
end type
type st_a from statictext within w_liste_comp
end type
type st_de from statictext within w_liste_comp
end type
type em_fin from editmask within w_liste_comp
end type
type cb_1 from commandbutton within w_liste_comp
end type
type cb_2 from commandbutton within w_liste_comp
end type
type em_debut from editmask within w_liste_comp
end type
type dw_listcomp from u_dw within w_liste_comp
end type
type cb_close from commandbutton within w_liste_comp
end type
type cb_print from commandbutton within w_liste_comp
end type
type cb_search from commandbutton within w_liste_comp
end type
end forward

global type w_liste_comp from w_main
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
st_a st_a
st_de st_de
em_fin em_fin
cb_1 cb_1
cb_2 cb_2
em_debut em_debut
dw_listcomp dw_listcomp
cb_close cb_close
cb_print cb_print
cb_search cb_search
end type
global w_liste_comp w_liste_comp

type variables
long il_idendroit[]
long il_indendoit
end variables

on w_liste_comp.create
int iCurrent
call super::create
this.ddlb_satellite=create ddlb_satellite
this.st_a=create st_a
this.st_de=create st_de
this.em_fin=create em_fin
this.cb_1=create cb_1
this.cb_2=create cb_2
this.em_debut=create em_debut
this.dw_listcomp=create dw_listcomp
this.cb_close=create cb_close
this.cb_print=create cb_print
this.cb_search=create cb_search
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_satellite
this.Control[iCurrent+2]=this.st_a
this.Control[iCurrent+3]=this.st_de
this.Control[iCurrent+4]=this.em_fin
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.em_debut
this.Control[iCurrent+8]=this.dw_listcomp
this.Control[iCurrent+9]=this.cb_close
this.Control[iCurrent+10]=this.cb_print
this.Control[iCurrent+11]=this.cb_search
end on

on w_liste_comp.destroy
call super::destroy
destroy(this.ddlb_satellite)
destroy(this.st_a)
destroy(this.st_de)
destroy(this.em_fin)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.em_debut)
destroy(this.dw_listcomp)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.cb_search)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_debut.text = string(today(), "dd/mm/yyyy")
em_fin.text = string(today(), "dd/mm/yyyy")
end event

type ddlb_satellite from dropdownlistbox within w_liste_comp
integer x = 2459
integer y = 28
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

type st_a from statictext within w_liste_comp
integer x = 1755
integer y = 1956
integer width = 87
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "À"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_de from statictext within w_liste_comp
integer x = 1326
integer y = 1956
integer width = 87
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "De"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_fin from editmask within w_liste_comp
integer x = 1847
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

type cb_1 from commandbutton within w_liste_comp
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

type cb_2 from commandbutton within w_liste_comp
integer x = 2194
integer y = 1936
integer width = 928
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

type em_debut from editmask within w_liste_comp
integer x = 1413
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

type dw_listcomp from u_dw within w_liste_comp
event ue_retrieve ( )
integer x = 5
integer y = 172
integer width = 3621
integer height = 1724
integer taborder = 10
string title = "none"
string dataobject = "d_liste_comp"
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

ldt_debut = gf_emtodate(em_debut.text)
ldt_fin = gf_emtodate(em_fin.text)

Retrieve(v_no_ortho, ldt_debut, ldt_fin, ll_satellite)
end event

event constructor;

modify("DataWindow.Print.Preview=Yes")

setTransObject(SQLCA)


end event

type cb_close from commandbutton within w_liste_comp
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

type cb_print from commandbutton within w_liste_comp
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
openwithparm(w_print_options,dw_listcomp)
end event

type cb_search from commandbutton within w_liste_comp
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

event clicked;dw_listcomp.event ue_retrieve()
end event

