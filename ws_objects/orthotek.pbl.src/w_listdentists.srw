$PBExportHeader$w_listdentists.srw
forward
global type w_listdentists from w_child
end type
type ddlb_list from u_ddlb within w_listdentists
end type
type ddlb_actif from u_ddlb within w_listdentists
end type
type cb_search from commandbutton within w_listdentists
end type
type dw_listdentist from u_dw within w_listdentists
end type
type cb_printlabel from commandbutton within w_listdentists
end type
type cb_printlist from commandbutton within w_listdentists
end type
type cb_close from commandbutton within w_listdentists
end type
end forward

global type w_listdentists from w_child
integer x = 214
integer y = 221
integer width = 3648
integer height = 2036
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
ddlb_list ddlb_list
ddlb_actif ddlb_actif
cb_search cb_search
dw_listdentist dw_listdentist
cb_printlabel cb_printlabel
cb_printlist cb_printlist
cb_close cb_close
end type
global w_listdentists w_listdentists

type variables
string is_sort
end variables

on w_listdentists.create
int iCurrent
call super::create
this.ddlb_list=create ddlb_list
this.ddlb_actif=create ddlb_actif
this.cb_search=create cb_search
this.dw_listdentist=create dw_listdentist
this.cb_printlabel=create cb_printlabel
this.cb_printlist=create cb_printlist
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_list
this.Control[iCurrent+2]=this.ddlb_actif
this.Control[iCurrent+3]=this.cb_search
this.Control[iCurrent+4]=this.dw_listdentist
this.Control[iCurrent+5]=this.cb_printlabel
this.Control[iCurrent+6]=this.cb_printlist
this.Control[iCurrent+7]=this.cb_close
end on

on w_listdentists.destroy
call super::destroy
destroy(this.ddlb_list)
destroy(this.ddlb_actif)
destroy(this.cb_search)
destroy(this.dw_listdentist)
destroy(this.cb_printlabel)
destroy(this.cb_printlist)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type ddlb_list from u_ddlb within w_listdentists
integer x = 2318
integer y = 1916
integer width = 859
integer height = 400
integer taborder = 20
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean sorted = false
end type

event constructor;of_additem("Tous",0)
of_additem("Inclus dans la liste",1)
of_additem("Non inclus dans la liste",2)
of_selectitem(1)
end event

type ddlb_actif from u_ddlb within w_listdentists
integer x = 1824
integer y = 1916
integer width = 480
integer height = 400
integer taborder = 20
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean sorted = false
end type

event constructor;of_additem("Tous",0)
of_additem("Actif",1)
of_additem("Inactif",2)
of_selectitem(1)
end event

type cb_search from commandbutton within w_listdentists
integer x = 18
integer y = 1908
integer width = 466
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;long ll_actif
long ll_inclus

choose case ddlb_actif.of_getselecteddata( )
	case 1
		ll_actif = 1
	case 2
		ll_actif = 0
	case else
		setnull(ll_actif)
end choose

choose case ddlb_list.of_getselecteddata( )
	case 1
		ll_inclus = 1
	case 2
		ll_inclus = 0
	case else
		setnull(ll_inclus)
end choose

dw_listdentist.setTransObject(SQLCA)
dw_listdentist.retrieve(v_no_ortho,ll_actif,ll_inclus)
end event

type dw_listdentist from u_dw within w_listdentists
integer x = 14
integer y = 8
integer width = 3616
integer height = 1900
integer taborder = 10
string title = "listdentist"
string dataobject = "d_listdentist2"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	this.object.t_title.text = "Dentist's list for :"
	this.object.t_name.text = 'Name'
	this.object.t_add.text = 'Address'
	this.object.t_zip.text = 'Postal code'
	this.object.t_qty.text = 'Quantity:'
	this.object.t_printedon.text = 'Printed on'
end if

end event

event clicked;call super::clicked;if dwo.name = 't_name' or dwo.name = 't_add' or dwo.name = 't_zip' then
	choose case dwo.name
		case 't_name'
			if is_sort = 'compute_2 A' then
				is_sort = 'compute_2 D'
			else
				is_sort = 'compute_2 A'
			end if
		case 't_add'
			if is_sort = 'det_add A' then
				is_sort = 'det_add D'
			else
				is_sort = 'det_add A'
			end if
		case 't_zip'
			if is_sort = 'det_zip A' then
				is_sort = 'det_zip D'
			else
				is_sort = 'det_zip A'
			end if
	end choose
	
	setSort(is_sort)
	sort()
end if

end event

type cb_printlabel from commandbutton within w_listdentists
integer x = 1106
integer y = 1908
integer width = 713
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer les étiquettes"
end type

event clicked;long i,ll_nbrow,ll_iddent
int v_print

//printsetup()
datastore ds_etiquette_dentist
ds_etiquette_dentist = create datastore
ds_etiquette_dentist.dataobject = "d_etiquettes_dentist"
ds_etiquette_dentist.SetTransObject(SQLCA)
ds_etiquette_dentist.setSort(is_sort)

gb_datawindow = false
gb_imp = false
openWithParm(w_print_options, ds_etiquette_dentist)
ds_etiquette_dentist = message.powerObjectParm

if isNull(ds_etiquette_dentist) then return 0
ll_nbrow = dw_listdentist.rowcount()
for i = 1 to ll_nbrow
	ll_iddent = dw_listdentist.getitemnumber(i,'id_dentist')
	if ds_etiquette_dentist.retrieve(ll_iddent) > 0 then
		if ds_etiquette_dentist.getItemString(ds_etiquette_dentist.getRow(),'det_prov') <> 'USA' then
			ds_etiquette_dentist.modify("det_zip.EditMask.Mask = '!#! #!#'")
		else
			ds_etiquette_dentist.modify("det_zip.EditMask.Mask = ''")
		end if
		ds_etiquette_dentist.print()
	end if
next
destroy ds_etiquette_dentist
end event

type cb_printlist from commandbutton within w_listdentists
integer x = 498
integer y = 1908
integer width = 594
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer la liste"
end type

event clicked;gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_listdentist)
end event

type cb_close from commandbutton within w_listdentists
integer x = 3195
integer y = 1908
integer width = 443
integer height = 112
integer taborder = 10
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

