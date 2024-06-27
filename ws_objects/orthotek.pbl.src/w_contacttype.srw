$PBExportHeader$w_contacttype.srw
forward
global type w_contacttype from w_child
end type
type cb_print from commandbutton within w_contacttype
end type
type rb_2 from radiobutton within w_contacttype
end type
type rb_1 from radiobutton within w_contacttype
end type
type cb_printlabel from commandbutton within w_contacttype
end type
type dw_typelist from u_dw within w_contacttype
end type
type st_title from statictext within w_contacttype
end type
type cb_update from commandbutton within w_contacttype
end type
type cb_delete from commandbutton within w_contacttype
end type
type cb_insert from commandbutton within w_contacttype
end type
type dw_contacttype from u_dw within w_contacttype
end type
type cb_close from commandbutton within w_contacttype
end type
end forward

global type w_contacttype from w_child
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
cb_print cb_print
rb_2 rb_2
rb_1 rb_1
cb_printlabel cb_printlabel
dw_typelist dw_typelist
st_title st_title
cb_update cb_update
cb_delete cb_delete
cb_insert cb_insert
dw_contacttype dw_contacttype
cb_close cb_close
end type
global w_contacttype w_contacttype

on w_contacttype.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.rb_2=create rb_2
this.rb_1=create rb_1
this.cb_printlabel=create cb_printlabel
this.dw_typelist=create dw_typelist
this.st_title=create st_title
this.cb_update=create cb_update
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
this.dw_contacttype=create dw_contacttype
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.rb_2
this.Control[iCurrent+3]=this.rb_1
this.Control[iCurrent+4]=this.cb_printlabel
this.Control[iCurrent+5]=this.dw_typelist
this.Control[iCurrent+6]=this.st_title
this.Control[iCurrent+7]=this.cb_update
this.Control[iCurrent+8]=this.cb_delete
this.Control[iCurrent+9]=this.cb_insert
this.Control[iCurrent+10]=this.dw_contacttype
this.Control[iCurrent+11]=this.cb_close
end on

on w_contacttype.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.cb_printlabel)
destroy(this.dw_typelist)
destroy(this.st_title)
destroy(this.cb_update)
destroy(this.cb_delete)
destroy(this.cb_insert)
destroy(this.dw_contacttype)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_print from commandbutton within w_contacttype
integer x = 1189
integer y = 1928
integer width = 594
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

event clicked;gi_imp = 1 // rapport
gb_datawindow = true
openwithparm(w_print_options,dw_typelist)
end event

type rb_2 from radiobutton within w_contacttype
integer x = 2615
integer width = 818
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dentiste"
end type

event clicked;long row,ll_idtype

row = dw_contacttype.getrow()
if row > 0 then
	ll_idtype = dw_contacttype.getitemnumber(row,'id_conttype')
	dw_typelist.dataobject = 'd_dentisttypelist'
	dw_typelist.SetTransObject(SQLCA)
	dw_typelist.retrieve(v_no_ortho,ll_idtype)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Dentist'
end if
end event

type rb_1 from radiobutton within w_contacttype
integer x = 1760
integer width = 818
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contact"
boolean checked = true
end type

event clicked;long row,ll_idtype

row = dw_contacttype.getrow()
if row > 0 then
	ll_idtype = dw_contacttype.getitemnumber(row,'id_conttype')
	dw_typelist.dataobject = 'd_contacttypelist'
	dw_typelist.SetTransObject(SQLCA)
	dw_typelist.retrieve(v_no_ortho,ll_idtype)
end if
end event

type cb_printlabel from commandbutton within w_contacttype
integer x = 1783
integer y = 1928
integer width = 594
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imp. étiquettes"
end type

event clicked;long i,ll_idcontact,ll_iddent
int v_print
printsetup()
if dw_typelist.getrow() > 0 then
	if dw_typelist.dataobject = 'd_contacttypelist' then
		datastore ds_etiqcontact
		ds_etiqcontact = create datastore
		ds_etiqcontact.dataobject = "d_etiqcontact"
		ds_etiqcontact.SetTransObject(SQLCA)
		for i = 1 to dw_typelist.rowcount()
			ll_idcontact = dw_typelist.getitemnumber(i,'id_contact')
			ds_etiqcontact.retrieve(ll_idcontact)
			ds_etiqcontact.print()
		next
		destroy ds_etiqcontact
	elseif dw_typelist.dataobject = 'd_dentisttypelist' then		
		datastore ds_etiquette_dentist
		ds_etiquette_dentist = create datastore
		ds_etiquette_dentist.dataobject = "d_etiquettes_dentist"
		ds_etiquette_dentist.SetTransObject(SQLCA)
		for i = 1 to dw_typelist.rowcount()
			ll_iddent = dw_typelist.getitemnumber(i,'id_dentist')
			if ds_etiquette_dentist.retrieve(ll_iddent) > 0 then
				if ds_etiquette_dentist.getItemString(ds_etiquette_dentist.getRow(),'det_prov') <> 'USA' then
					ds_etiquette_dentist.modify("det_zip.EditMask.Mask = '!#! #!#'")
				else
					ds_etiquette_dentist.modify("det_zip.EditMask.Mask = ''")
				end if
			end if
			ds_etiquette_dentist.print()
		next
		destroy ds_etiquette_dentist
	end if
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print label'
end if
end event

type dw_typelist from u_dw within w_contacttype
integer x = 1339
integer y = 100
integer width = 2286
integer height = 1816
integer taborder = 20
string title = "contacttypelist"
string dataobject = "d_contacttypelist"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
if v_langue = 'an' then
	this.object.t_qty.text = 'Qty:'
end if
end event

event buttonclicked;if dataobject = 'd_dentisttypelist' then
	choose case dwo.name
		case 'b_nomspec'
			SetSort("det_nom A,det_prenom A")
		case 'b_ville'
			SetSort("det_ville A,det_nom A,det_prenom A")
	end choose
elseif dataobject = 'd_contacttypelist' then
	choose case dwo.name
		case 'b_nomspec'
			SetSort("nom A,prenom A")
		case 'b_ville'
			SetSort("ville A,nom A,prenom A")
	end choose
end if
Sort()
end event

type st_title from statictext within w_contacttype
integer width = 1280
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Types de contacts"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Contact types'
end if
end event

type cb_update from commandbutton within w_contacttype
integer x = 2377
integer y = 1928
integer width = 594
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarde"
end type

event clicked;if dw_contacttype.update() = 1 then
	commit using sqlca;
else
	rollback using sqlca;
	error_type(50)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type cb_delete from commandbutton within w_contacttype
integer x = 594
integer y = 1928
integer width = 594
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;dw_contacttype.deleterow(dw_contacttype.getrow())
end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete'
end if
end event

type cb_insert from commandbutton within w_contacttype
integer y = 1928
integer width = 594
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;long ll_newrow

ll_newrow = dw_contacttype.insertrow(0)
dw_contacttype.setitem(ll_newrow,'ortho_id',v_no_ortho)
dw_contacttype.scrolltorow(ll_newrow)
dw_contacttype.SetFocus()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add'
end if
end event

type dw_contacttype from u_dw within w_contacttype
integer y = 100
integer width = 1344
integer height = 1816
integer taborder = 10
string title = "contacttype"
string dataobject = "d_contacttype"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
Retrieve(v_no_ortho)
SetRowFocusIndicator(Hand!)
end event

event rowfocuschanged;long ll_idtype

ll_idtype = dw_contacttype.getitemnumber(currentrow,'id_conttype')
dw_typelist.retrieve(v_no_ortho,ll_idtype)
end event

type cb_close from commandbutton within w_contacttype
integer x = 2971
integer y = 1928
integer width = 658
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

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

