$PBExportHeader$w_agedescompteslist.srw
forward
global type w_agedescompteslist from w_child
end type
type cb_print from commandbutton within w_agedescompteslist
end type
type em_date from editmask within w_agedescompteslist
end type
type st_date from statictext within w_agedescompteslist
end type
type cb_90 from commandbutton within w_agedescompteslist
end type
type cb_60 from commandbutton within w_agedescompteslist
end type
type cb_30 from commandbutton within w_agedescompteslist
end type
type cb_tous from commandbutton within w_agedescompteslist
end type
type dw_agedescompteslist from u_dw within w_agedescompteslist
end type
type cb_3 from commandbutton within w_agedescompteslist
end type
type cb_search from commandbutton within w_agedescompteslist
end type
end forward

global type w_agedescompteslist from w_child
integer x = 214
integer y = 221
integer width = 3611
integer height = 2036
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
boolean ib_isupdateable = false
cb_print cb_print
em_date em_date
st_date st_date
cb_90 cb_90
cb_60 cb_60
cb_30 cb_30
cb_tous cb_tous
dw_agedescompteslist dw_agedescompteslist
cb_3 cb_3
cb_search cb_search
end type
global w_agedescompteslist w_agedescompteslist

type variables
//datastore ds_impsom, ds_implist, ds_impsom1

end variables

on w_agedescompteslist.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.em_date=create em_date
this.st_date=create st_date
this.cb_90=create cb_90
this.cb_60=create cb_60
this.cb_30=create cb_30
this.cb_tous=create cb_tous
this.dw_agedescompteslist=create dw_agedescompteslist
this.cb_3=create cb_3
this.cb_search=create cb_search
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.em_date
this.Control[iCurrent+3]=this.st_date
this.Control[iCurrent+4]=this.cb_90
this.Control[iCurrent+5]=this.cb_60
this.Control[iCurrent+6]=this.cb_30
this.Control[iCurrent+7]=this.cb_tous
this.Control[iCurrent+8]=this.dw_agedescompteslist
this.Control[iCurrent+9]=this.cb_3
this.Control[iCurrent+10]=this.cb_search
end on

on w_agedescompteslist.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.em_date)
destroy(this.st_date)
destroy(this.cb_90)
destroy(this.cb_60)
destroy(this.cb_30)
destroy(this.cb_tous)
destroy(this.dw_agedescompteslist)
destroy(this.cb_3)
destroy(this.cb_search)
end on

event open;date ldt_date

pro_resize luo_size
luo_size.uf_resizew(this,1,1)
em_date.text = string(today())

em_date.getData(ldt_date) 
dw_agedescompteslist.retrieve(v_no_ortho, ldt_date)
end event

type cb_print from commandbutton within w_agedescompteslist
integer x = 407
integer y = 1908
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imp liste"
end type

event clicked;gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_agedescompteslist)

end event

event constructor;if v_langue = 'an' then
	this.text = 'Print list'
end if
end event

type em_date from editmask within w_agedescompteslist
integer x = 2834
integer y = 1928
integer width = 402
integer height = 68
integer taborder = 40
integer textsize = -10
integer weight = 700
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

type st_date from statictext within w_agedescompteslist
integer x = 2345
integer y = 1928
integer width = 439
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date paiement"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_date.text = "Payment date"
end if
end event

type cb_90 from commandbutton within w_agedescompteslist
integer x = 1938
integer y = 1908
integer width = 379
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

event clicked;dw_agedescompteslist.setfilter('compute_90 > 0')
//ds_impsom.setfilter('compute_90 > 0')
dw_agedescompteslist.filter()
end event

event constructor;if v_langue = 'an' then
	this.text = '90 +'
end if
end event

type cb_60 from commandbutton within w_agedescompteslist
integer x = 1559
integer y = 1908
integer width = 379
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

event clicked;dw_agedescompteslist.setfilter('compute_60 > 0 or compute_90 > 0')
//ds_impsom.setfilter('compute_60 > 0 or compute_90 > 0')
dw_agedescompteslist.filter()
end event

event constructor;if v_langue = 'an' then
	this.text = '60 +'
end if
end event

type cb_30 from commandbutton within w_agedescompteslist
integer x = 1179
integer y = 1908
integer width = 379
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

event clicked;dw_agedescompteslist.setfilter('compute_30 > 0 or compute_60 > 0 or compute_90 > 0')
//ds_impsom.setfilter('compute_30 > 0 or compute_60 > 0 or compute_90 > 0')
dw_agedescompteslist.filter()
end event

event constructor;if v_langue = 'an' then
	this.text = '30 +'
end if
end event

type cb_tous from commandbutton within w_agedescompteslist
integer x = 809
integer y = 1908
integer width = 370
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

event clicked;dw_agedescompteslist.setfilter('')
//ds_impsom.setfilter('')
dw_agedescompteslist.filter()

end event

event constructor;if v_langue = 'an' then
	this.text = 'All'
end if
end event

type dw_agedescompteslist from u_dw within w_agedescompteslist
integer width = 3607
integer height = 1904
integer taborder = 10
string title = "agedescompteslist"
string dataobject = "d_agedescompteslist"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;string ls_ortho

settransobject(SQLCA)
select dr_nom_complet into :ls_ortho from ortho_id where ortho_id = :v_no_ortho;
this.object.t_ortho.text = ls_ortho
if v_langue = 'an' then
	this.object.t_title.text = 'AGED OF ACCOUNT'
	this.object.t_pat.text = 'Patients name'
	this.object.t_lastpaie.text = 'Last payment'
	this.object.t_factc.text = 'Current'
	this.object.t_fact30.text = '30 days'
	this.object.t_fact60.text = '60 days'
	this.object.t_fact90.text = '90 days'
	this.object.t_printedon.text = 'Printed on'
end if
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

type cb_3 from commandbutton within w_agedescompteslist
integer x = 3246
integer y = 1908
integer width = 347
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

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_search from commandbutton within w_agedescompteslist
integer x = 5
integer y = 1908
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date ldt_date

em_date.getData(ldt_date) 
dw_agedescompteslist.retrieve(v_no_ortho, ldt_date)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Search'
end if
end event

