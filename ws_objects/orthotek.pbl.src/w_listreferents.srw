$PBExportHeader$w_listreferents.srw
forward
global type w_listreferents from w_child
end type
type dw_listreferents from u_dw within w_listreferents
end type
type cb_1 from commandbutton within w_listreferents
end type
type cb_printlabel from commandbutton within w_listreferents
end type
type cb_printlist from commandbutton within w_listreferents
end type
type cb_close from commandbutton within w_listreferents
end type
end forward

global type w_listreferents from w_child
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
dw_listreferents dw_listreferents
cb_1 cb_1
cb_printlabel cb_printlabel
cb_printlist cb_printlist
cb_close cb_close
end type
global w_listreferents w_listreferents

type variables
string is_sort
end variables

on w_listreferents.create
int iCurrent
call super::create
this.dw_listreferents=create dw_listreferents
this.cb_1=create cb_1
this.cb_printlabel=create cb_printlabel
this.cb_printlist=create cb_printlist
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_listreferents
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_printlabel
this.Control[iCurrent+4]=this.cb_printlist
this.Control[iCurrent+5]=this.cb_close
end on

on w_listreferents.destroy
call super::destroy
destroy(this.dw_listreferents)
destroy(this.cb_1)
destroy(this.cb_printlabel)
destroy(this.cb_printlist)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type dw_listreferents from u_dw within w_listreferents
integer width = 3584
integer height = 1900
integer taborder = 10
string title = "listdentist"
string dataobject = "d_listreferents"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;setTransObject(SQLCA)
retrieve(v_no_ortho)

if v_langue = 'an' then
	this.object.t_title.text = "Refferal list for :"
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

type cb_1 from commandbutton within w_listreferents
integer x = 1691
integer y = 1908
integer width = 1051
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_printlabel from commandbutton within w_listreferents
integer x = 846
integer y = 1908
integer width = 846
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
datastore ds_etiquette_referent
ds_etiquette_referent = create datastore
ds_etiquette_referent.dataobject = "d_etiquettes_referents1"
ds_etiquette_referent.SetTransObject(SQLCA)
ds_etiquette_referent.setSort(is_sort)

gb_datawindow = false
gb_imp = false
openWithParm(w_print_options, ds_etiquette_referent)
ds_etiquette_referent = message.powerObjectParm

if isNull(ds_etiquette_referent) then return 0
ll_nbrow = dw_listreferents.rowcount()
for i = 1 to ll_nbrow
	ll_iddent = dw_listreferents.getitemnumber(i,'t_referents_id')
	if ds_etiquette_referent.retrieve(ll_iddent) > 0 then
		if ds_etiquette_referent.getItemString(ds_etiquette_referent.getRow(),'ref_province') <> 'USA' then
			ds_etiquette_referent.modify("ref_zip.EditMask.Mask = '!#! #!#'")
		else
			ds_etiquette_referent.modify("ref_zip.EditMask.Mask = ''")
		end if
		ds_etiquette_referent.print()
	end if
next
destroy ds_etiquette_referent
end event

type cb_printlist from commandbutton within w_listreferents
integer y = 1908
integer width = 846
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
openwithparm(w_print_options,dw_listreferents)
end event

type cb_close from commandbutton within w_listreferents
integer x = 2743
integer y = 1908
integer width = 846
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

