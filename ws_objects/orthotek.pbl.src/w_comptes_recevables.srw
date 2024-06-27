$PBExportHeader$w_comptes_recevables.srw
forward
global type w_comptes_recevables from w_child
end type
type cb_excel from commandbutton within w_comptes_recevables
end type
type dw_sat from uo_sat within w_comptes_recevables
end type
type cb_1 from commandbutton within w_comptes_recevables
end type
type em_datefin from editmask within w_comptes_recevables
end type
type st_1 from statictext within w_comptes_recevables
end type
type st_2 from statictext within w_comptes_recevables
end type
type sle_2 from singlelineedit within w_comptes_recevables
end type
type sle_1 from singlelineedit within w_comptes_recevables
end type
type cb_close from commandbutton within w_comptes_recevables
end type
type cb_print from commandbutton within w_comptes_recevables
end type
type dw_comptes_recevables from u_dw within w_comptes_recevables
end type
end forward

global type w_comptes_recevables from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_excel cb_excel
dw_sat dw_sat
cb_1 cb_1
em_datefin em_datefin
st_1 st_1
st_2 st_2
sle_2 sle_2
sle_1 sle_1
cb_close cb_close
cb_print cb_print
dw_comptes_recevables dw_comptes_recevables
end type
global w_comptes_recevables w_comptes_recevables

type variables
int arret

end variables

on w_comptes_recevables.create
int iCurrent
call super::create
this.cb_excel=create cb_excel
this.dw_sat=create dw_sat
this.cb_1=create cb_1
this.em_datefin=create em_datefin
this.st_1=create st_1
this.st_2=create st_2
this.sle_2=create sle_2
this.sle_1=create sle_1
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_comptes_recevables=create dw_comptes_recevables
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_excel
this.Control[iCurrent+2]=this.dw_sat
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.em_datefin
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.sle_2
this.Control[iCurrent+8]=this.sle_1
this.Control[iCurrent+9]=this.cb_close
this.Control[iCurrent+10]=this.cb_print
this.Control[iCurrent+11]=this.dw_comptes_recevables
end on

on w_comptes_recevables.destroy
call super::destroy
destroy(this.cb_excel)
destroy(this.dw_sat)
destroy(this.cb_1)
destroy(this.em_datefin)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_comptes_recevables)
end on

event open;arret = 0

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

//ajustmontantdu()
end event

type cb_excel from commandbutton within w_comptes_recevables
integer x = 2505
integer y = 1928
integer width = 613
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exporter vers Excel"
end type

event clicked;if dw_comptes_recevables.SaveAs("c:\ii4net\orthotek\correspondances\recevable.xls", EXCEL5!,True) = 1 then
	if error_type(228) = 1 then
		run('C:\Program Files\Microsoft Office\Office\Excel.EXE c:\ii4net\orthotek\correspondances\recevable.xls',maximized!)
	end if
else
	error_type(0)
end if
end event

type dw_sat from uo_sat within w_comptes_recevables
integer x = 2089
integer taborder = 40
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	dw_comptes_recevables.setFilter("")
	dw_comptes_recevables.filter()
else
	dw_comptes_recevables.setFilter("id_satellite = " + string(il_idsat))
	dw_comptes_recevables.filter()
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

type cb_1 from commandbutton within w_comptes_recevables
integer x = 507
integer y = 1928
integer width = 503
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Recherche"
end type

event clicked;date ldt_datefin

setpointer(hourglass!)
ldt_datefin = date(em_datefin.text)
dw_comptes_recevables.object.tt_date.text = string(ldt_datefin)
dw_comptes_recevables.retrieve(v_no_ortho, ldt_datefin)

end event

event constructor;if v_langue = 'an' then
	this.Text = "Search"
end if
end event

type em_datefin from editmask within w_comptes_recevables
integer x = 1394
integer y = 1936
integer width = 402
integer height = 92
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

event constructor;em_datefin.text = string(today())
end event

type st_1 from statictext within w_comptes_recevables
integer x = 1029
integer y = 1944
integer width = 361
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date de fin :"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "From:"
end if
end event

type st_2 from statictext within w_comptes_recevables
boolean visible = false
integer x = 2107
integer y = 1944
integer width = 96
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "de"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "to"
end if
end event

type sle_2 from singlelineedit within w_comptes_recevables
boolean visible = false
integer x = 2208
integer y = 1944
integer width = 274
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 79741120
boolean border = false
boolean autohscroll = false
end type

type sle_1 from singlelineedit within w_comptes_recevables
boolean visible = false
integer x = 1829
integer y = 1944
integer width = 274
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 79741120
boolean border = false
boolean autohscroll = false
end type

type cb_close from commandbutton within w_comptes_recevables
integer x = 3118
integer y = 1928
integer width = 503
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;Close(parent)
end event

event constructor;if v_langue = 'an' then
	this.Text = "Close"
end if
end event

type cb_print from commandbutton within w_comptes_recevables
integer x = 5
integer y = 1928
integer width = 503
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_comptes_recevables)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

type dw_comptes_recevables from u_dw within w_comptes_recevables
integer width = 3634
integer height = 1920
integer taborder = 30
string title = "compte_recevable"
string dataobject = "d_compte_recevable"
boolean hscrollbar = true
boolean border = false
boolean hsplitscroll = true
end type

event buttonclicked;choose case dwo.name
	case 'b_nom'
		dw_comptes_recevables.setsort("patient_nom A, patient_prenom A")
		dw_comptes_recevables.sort()
	case 'b_cout'
		dw_comptes_recevables.setsort("frais A")
		dw_comptes_recevables.sort()
	case 'b_montantpaye'
		dw_comptes_recevables.setsort("montantpaye A")
		dw_comptes_recevables.sort()
	case 'b_date'
		dw_comptes_recevables.setsort("prochain_paiement_date A")
		dw_comptes_recevables.sort()
	case 'b_solde'
		dw_comptes_recevables.setsort("solde A")
		dw_comptes_recevables.sort()
	case 'b_datecpd'
		dw_comptes_recevables.setsort("cpd_venir_date A")
		dw_comptes_recevables.sort()
	case 'b_montantcpd'
		dw_comptes_recevables.setsort("cpd_venir A")
		dw_comptes_recevables.sort()
	case 'b_totalcpd'
		dw_comptes_recevables.setsort("total_cpd A")
		dw_comptes_recevables.sort()
	case 'b_cpdvenir'
		dw_comptes_recevables.setsort("compute_2 A")
		dw_comptes_recevables.sort()
	case 'b_montantdu'
		//dw_comptes_recevables.setsort("montant_du A")
		dw_comptes_recevables.setsort("cc_montantdu A")
		dw_comptes_recevables.sort()
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

event constructor;setTransObject(SQLCA)

if v_langue = 'an' then
	this.object.t_titre.text = "Receivable account for "
	this.object.b_nom.text = "Patient's name"
	this.object.t_couttot.text = 'Sum Phase'
	this.object.b_couttot.text = 'Sum Phase'
	this.object.b_cout.text = "Total cost"
	this.object.b_montantpaye.text = "Paid amount"
	this.object.b_date.text = "Date"
	this.object.b_solde.text = "Balance"
	this.object.b_datecpd.text = "PDC Date"
	this.object.b_totalcpd.text = "PDC Total"
	this.object.b_montantcpd.text = "PDC's to come"
	this.object.b_montantdu.text = 'Due'
	this.object.t_nom.text = "Patient's name"
	this.object.t_cout.text = "Total cost"
	this.object.t_montantpaye.text = "Paid amount"
	this.object.t_date.text = "Date"
	this.object.t_solde.text = "Balance"
	this.object.t_datecpd.text = "PDC Date"
	this.object.t_totalcpd.text = "PDC Total"
	this.object.b_montantcpd.text = "PDC's to come"
	this.object.t_montantdu.text = 'Due'
	this.object.t_totneg.text = 'Negative total'
	this.object.t_totpos.text = 'Positive total'
	this.object.t_printedon.text = 'Printed on'
end if
end event

