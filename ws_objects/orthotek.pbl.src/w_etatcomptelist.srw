$PBExportHeader$w_etatcomptelist.srw
forward
global type w_etatcomptelist from w_child
end type
type cb_impsouf from commandbutton within w_etatcomptelist
end type
type cb_90 from commandbutton within w_etatcomptelist
end type
type cb_60 from commandbutton within w_etatcomptelist
end type
type cb_30 from commandbutton within w_etatcomptelist
end type
type cb_tous from commandbutton within w_etatcomptelist
end type
type dw_etatcomptelist from u_dw within w_etatcomptelist
end type
type cb_3 from commandbutton within w_etatcomptelist
end type
type cb_2 from commandbutton within w_etatcomptelist
end type
type cb_1 from commandbutton within w_etatcomptelist
end type
end forward

global type w_etatcomptelist from w_child
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
boolean ib_isupdateable = false
cb_impsouf cb_impsouf
cb_90 cb_90
cb_60 cb_60
cb_30 cb_30
cb_tous cb_tous
dw_etatcomptelist dw_etatcomptelist
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_etatcomptelist w_etatcomptelist

type variables
datastore ds_impsom, ds_implist, ds_impsom1

end variables

on w_etatcomptelist.create
int iCurrent
call super::create
this.cb_impsouf=create cb_impsouf
this.cb_90=create cb_90
this.cb_60=create cb_60
this.cb_30=create cb_30
this.cb_tous=create cb_tous
this.dw_etatcomptelist=create dw_etatcomptelist
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_impsouf
this.Control[iCurrent+2]=this.cb_90
this.Control[iCurrent+3]=this.cb_60
this.Control[iCurrent+4]=this.cb_30
this.Control[iCurrent+5]=this.cb_tous
this.Control[iCurrent+6]=this.dw_etatcomptelist
this.Control[iCurrent+7]=this.cb_3
this.Control[iCurrent+8]=this.cb_2
this.Control[iCurrent+9]=this.cb_1
end on

on w_etatcomptelist.destroy
call super::destroy
destroy(this.cb_impsouf)
destroy(this.cb_90)
destroy(this.cb_60)
destroy(this.cb_30)
destroy(this.cb_tous)
destroy(this.dw_etatcomptelist)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

ds_impsom = create datastore
ds_impsom.dataobject = "d_etatcomptelistimpdet"
ds_impsom.SetTransObject(SQLCA)
ds_implist = create datastore
ds_implist.dataobject = "d_etatcomptelistimpsom"
ds_implist.SetTransObject(SQLCA)
ds_impsom1 = create datastore
ds_impsom1.dataobject = "d_etatcomptelistimpsom1"
ds_impsom1.SetTransObject(SQLCA)
end event

type cb_impsouf from commandbutton within w_etatcomptelist
integer x = 1216
integer y = 1908
integer width = 617
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imp dû 90+ / patient"
end type

event clicked;ds_impsom1.retrieve()
gb_datawindow = false
openwithparm(w_print_options,ds_impsom1)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print 90+ / patient'
end if
end event

type cb_90 from commandbutton within w_etatcomptelist
integer x = 2697
integer y = 1908
integer width = 288
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "90 et +"
end type

event clicked;dw_etatcomptelist.setfilter('c_90 > 0')
ds_impsom.setfilter('c_90 > 0')
dw_etatcomptelist.filter()
end event

event constructor;if v_langue = 'an' then
	this.text = '90 +'
end if
end event

type cb_60 from commandbutton within w_etatcomptelist
integer x = 2409
integer y = 1908
integer width = 288
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "60 et +"
end type

event clicked;dw_etatcomptelist.setfilter('c_60 > 0 or c_90 > 0')
ds_impsom.setfilter('c_60 > 0 or c_90 > 0')
dw_etatcomptelist.filter()
end event

event constructor;if v_langue = 'an' then
	this.text = '60 +'
end if
end event

type cb_30 from commandbutton within w_etatcomptelist
integer x = 2121
integer y = 1908
integer width = 288
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "30 et +"
end type

event clicked;dw_etatcomptelist.setfilter('c_30 > 0 or c_60 > 0 or c_90 > 0')
ds_impsom.setfilter('c_30 > 0 or c_60 > 0 or c_90 > 0')
dw_etatcomptelist.filter()
end event

event constructor;if v_langue = 'an' then
	this.text = '30 +'
end if
end event

type cb_tous from commandbutton within w_etatcomptelist
integer x = 1833
integer y = 1908
integer width = 288
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Tous"
end type

event clicked;dw_etatcomptelist.setfilter('')
ds_impsom.setfilter('')
dw_etatcomptelist.filter()

end event

event constructor;if v_langue = 'an' then
	this.text = 'All'
end if
end event

type dw_etatcomptelist from u_dw within w_etatcomptelist
integer x = 23
integer width = 3584
integer height = 1904
integer taborder = 10
string title = "etatcomptelist"
string dataobject = "d_etatcomptelist"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;settransobject(SQLCA)
//SetRowFocusIndicator(Hand!)
if v_langue = 'an' then
	this.object.t_title.text = 'Account status'
	this.object.t_pat.text = 'Patients name'
	this.object.t_tot.text = 'Total'
	this.object.t_factc.text = 'Current'
	this.object.t_fact30.text = '30 days'
	this.object.t_fact60.text = '60 days'
	this.object.t_fact90.text = '90 days'
	this.object.t_printedon.text = 'Printed on'
end if
retrieve(v_no_ortho)
end event

event doubleclicked;Opensheetwithparm(w_dossier_patients,getitemnumber(row,'patient_patient_id'),w_principal,2,layered!)
end event

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the error message
RETURN 1
end event

type cb_3 from commandbutton within w_etatcomptelist
integer x = 2985
integer y = 1908
integer width = 640
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;destroy ds_impsom
destroy ds_implist
destroy ds_impsom1
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_2 from commandbutton within w_etatcomptelist
integer x = 613
integer y = 1908
integer width = 603
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imp / patient"
end type

event clicked;ds_impsom.retrieve()
gb_datawindow = false
openwithparm(w_print_options,ds_impsom)

end event

event constructor;if v_langue = 'an' then
	this.text = 'Print / patient'
end if
end event

type cb_1 from commandbutton within w_etatcomptelist
integer x = 5
integer y = 1908
integer width = 608
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imp liste"
end type

event clicked;ds_implist.retrieve(v_no_ortho)
gb_datawindow = false
openwithparm(w_print_options,ds_implist)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print list'
end if
end event

