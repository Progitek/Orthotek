$PBExportHeader$w_comptes_clients.srw
forward
global type w_comptes_clients from w_child
end type
type dw_sat from uo_sat within w_comptes_clients
end type
type cb_export from commandbutton within w_comptes_clients
end type
type st_date from statictext within w_comptes_clients
end type
type em_date from editmask within w_comptes_clients
end type
type cb_retrieve from commandbutton within w_comptes_clients
end type
type cb_print from commandbutton within w_comptes_clients
end type
type dw_comptes_clients from u_dw within w_comptes_clients
end type
type cb_close from commandbutton within w_comptes_clients
end type
end forward

global type w_comptes_clients from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
dw_sat dw_sat
cb_export cb_export
st_date st_date
em_date em_date
cb_retrieve cb_retrieve
cb_print cb_print
dw_comptes_clients dw_comptes_clients
cb_close cb_close
end type
global w_comptes_clients w_comptes_clients

on w_comptes_clients.create
int iCurrent
call super::create
this.dw_sat=create dw_sat
this.cb_export=create cb_export
this.st_date=create st_date
this.em_date=create em_date
this.cb_retrieve=create cb_retrieve
this.cb_print=create cb_print
this.dw_comptes_clients=create dw_comptes_clients
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_sat
this.Control[iCurrent+2]=this.cb_export
this.Control[iCurrent+3]=this.st_date
this.Control[iCurrent+4]=this.em_date
this.Control[iCurrent+5]=this.cb_retrieve
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.dw_comptes_clients
this.Control[iCurrent+8]=this.cb_close
end on

on w_comptes_clients.destroy
call super::destroy
destroy(this.dw_sat)
destroy(this.cb_export)
destroy(this.st_date)
destroy(this.em_date)
destroy(this.cb_retrieve)
destroy(this.cb_print)
destroy(this.dw_comptes_clients)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_date.text = string(today())
end event

type dw_sat from uo_sat within w_comptes_clients
integer x = 2071
integer taborder = 10
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	dw_comptes_clients.setFilter("")
	dw_comptes_clients.filter()
else
	dw_comptes_clients.setFilter("patient_id_satellite = " + string(il_idsat))
	dw_comptes_clients.filter()
end if
end event

event constructor;call super::constructor;integer li_option

select compsat into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	visible = true 
else
	visible = false
end if
end event

type cb_export from commandbutton within w_comptes_clients
integer x = 2089
integer y = 1924
integer width = 741
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Exporter vers Excel"
end type

event clicked;if dw_comptes_clients.SaveAs("c:\ii4net\orthotek\correspondances\cclient.xls", EXCEL5!,True) = 1 then
	if error_type(228) = 1 then
		run('C:\Program Files\Microsoft Office\Office\Excel.EXE c:\ii4net\orthotek\correspondances\cclient.xls',maximized!)
	end if
else
	error_type(0)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Export to Excel'
end if
end event

type st_date from statictext within w_comptes_clients
integer x = 1394
integer y = 1944
integer width = 155
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date:"
boolean focusrectangle = false
end type

type em_date from editmask within w_comptes_clients
integer x = 1554
integer y = 1928
integer width = 489
integer height = 100
integer taborder = 10
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

type cb_retrieve from commandbutton within w_comptes_clients
integer x = 699
integer y = 1924
integer width = 654
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date v_date
SetPointer(HourGlass!)
//dw_comptes_clients.object.t_date.text = em_date.text
v_date = date(em_date.text)
dw_comptes_clients.retrieve(v_no_ortho,v_date)

end event

event constructor;if v_langue = 'an' then
	cb_retrieve.text = 'Search'
end if
end event

type cb_print from commandbutton within w_comptes_clients
integer x = 9
integer y = 1924
integer width = 690
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_comptes_clients)
end event

event constructor;if v_langue = 'an' then
	cb_print.text = 'Print'
end if
end event

type dw_comptes_clients from u_dw within w_comptes_clients
integer x = 14
integer y = 120
integer width = 3621
integer height = 1796
integer taborder = 50
string title = "compte_clients"
string dataobject = "d_comptes_clients"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	dw_comptes_clients.object.t_titre.text = 'Clients account'
	dw_comptes_clients.object.t_printedon.text = 'Printed on'
	dw_comptes_clients.object.t_3.text = 'For the'
	dw_comptes_clients.object.b_nom.text = 'Name'
	dw_comptes_clients.object.t_nom.text = 'Name'
	dw_comptes_clients.object.b_montant.text = 'Due amount'
	dw_comptes_clients.object.t_montant.text = 'Due amount'
	dw_comptes_clients.object.t_totneg.text = 'Negative total:'
	dw_comptes_clients.object.t_totpos.text = 'Positive total:'
	dw_comptes_clients.object.t_1.text = 'For the'
end if
SetTransObject(SQLCA) 
end event

event buttonclicked;choose case dwo.name
	case 'b_nom'
		dw_comptes_clients.setsort("nom A")
		dw_comptes_clients.sort()
	case 'b_montant'
		dw_comptes_clients.setsort("montantdu A")
		dw_comptes_clients.sort()
end choose
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

type cb_close from commandbutton within w_comptes_clients
integer x = 2830
integer y = 1924
integer width = 786
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(w_comptes_clients)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

