$PBExportHeader$w_journalrevenus.srw
forward
global type w_journalrevenus from w_child
end type
type uo_calutil2 from u_calutil within w_journalrevenus
end type
type uo_calutil1 from u_calutil within w_journalrevenus
end type
type cb_export from commandbutton within w_journalrevenus
end type
type em_fin from editmask within w_journalrevenus
end type
type em_debut from editmask within w_journalrevenus
end type
type st_to from statictext within w_journalrevenus
end type
type st_from from statictext within w_journalrevenus
end type
type cb_find from commandbutton within w_journalrevenus
end type
type cb_print from commandbutton within w_journalrevenus
end type
type cb_close from commandbutton within w_journalrevenus
end type
type dw_journalrevenuscombines from u_dw within w_journalrevenus
end type
end forward

global type w_journalrevenus from w_child
integer x = 5
integer y = 4
integer width = 3621
integer height = 2092
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
event ue_export ( datawindow f_dwo )
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
cb_export cb_export
em_fin em_fin
em_debut em_debut
st_to st_to
st_from st_from
cb_find cb_find
cb_print cb_print
cb_close cb_close
dw_journalrevenuscombines dw_journalrevenuscombines
end type
global w_journalrevenus w_journalrevenus

on w_journalrevenus.create
int iCurrent
call super::create
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.cb_export=create cb_export
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_to=create st_to
this.st_from=create st_from
this.cb_find=create cb_find
this.cb_print=create cb_print
this.cb_close=create cb_close
this.dw_journalrevenuscombines=create dw_journalrevenuscombines
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_calutil2
this.Control[iCurrent+2]=this.uo_calutil1
this.Control[iCurrent+3]=this.cb_export
this.Control[iCurrent+4]=this.em_fin
this.Control[iCurrent+5]=this.em_debut
this.Control[iCurrent+6]=this.st_to
this.Control[iCurrent+7]=this.st_from
this.Control[iCurrent+8]=this.cb_find
this.Control[iCurrent+9]=this.cb_print
this.Control[iCurrent+10]=this.cb_close
this.Control[iCurrent+11]=this.dw_journalrevenuscombines
end on

on w_journalrevenus.destroy
call super::destroy
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.cb_export)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_to)
destroy(this.st_from)
destroy(this.cb_find)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.dw_journalrevenuscombines)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_debut.text = string(today())
em_fin.text = string(today())
end event

type uo_calutil2 from u_calutil within w_journalrevenus
boolean visible = false
integer x = 1792
integer y = 1360
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)

end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_journalrevenus
boolean visible = false
integer x = 1079
integer y = 1360
integer taborder = 40
boolean border = true
end type

event constructor;call super::constructor;istr_calutil.caldate = date(today())
uf_InitCal(istr_calutil.caldate)
PostEvent("ue_aff_horaire")
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)

end event

type cb_export from commandbutton within w_journalrevenus
integer x = 2231
integer y = 1912
integer width = 649
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Exporter vers Excel"
end type

event clicked;if dw_journalrevenuscombines.SaveAs("c:\ii4net\orthotek\correspondances\revenuscombine.xls", EXCEL5!,True) = 1 then
	if error_type(228) = 1 then
		run('C:\Program Files\Microsoft Office\Office\Excel.EXE c:\ii4net\orthotek\correspondances\revenuscombine.xls',maximized!)
	end if
else
	error_type(0)
end if
end event

event constructor;if v_langue = 'an' then
	this.Text = "Export to Excel"
end if
end event

type em_fin from editmask within w_journalrevenus
integer x = 1792
integer y = 1920
integer width = 402
integer height = 96
integer taborder = 50
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
end type

type em_debut from editmask within w_journalrevenus
integer x = 1280
integer y = 1920
integer width = 402
integer height = 96
integer taborder = 30
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
end type

type st_to from statictext within w_journalrevenus
integer x = 1701
integer y = 1932
integer width = 78
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "au"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "to"
end if
end event

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type st_from from statictext within w_journalrevenus
integer x = 1079
integer y = 1932
integer width = 187
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Du:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "From"
end if
end event

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type cb_find from commandbutton within w_journalrevenus
integer x = 526
integer y = 1912
integer width = 549
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date debut, fin

debut = date(em_debut.text)
fin = date(em_fin.text)
dw_journalrevenuscombines.object.t_from.text = string(debut)
dw_journalrevenuscombines.object.t_to.text = string(fin)
dw_journalrevenuscombines.retrieve(v_no_ortho,debut,fin)
end event

event constructor;if v_langue = 'an' then
	cb_find.Text = "Search"
end if
end event

type cb_print from commandbutton within w_journalrevenus
integer y = 1912
integer width = 526
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;dw_journalrevenuscombines.SetRedraw(false)
dw_journalrevenuscombines.Modify("DataWindow.Print.Margin.Top=250")
dw_journalrevenuscombines.Modify("DataWindow.Print.Margin.left=250")
gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_journalrevenuscombines)
dw_journalrevenuscombines.Modify("DataWindow.Print.Margin.Top=0")
dw_journalrevenuscombines.Modify("DataWindow.Print.Margin.left=0")
dw_journalrevenuscombines.SetRedraw(true)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

type cb_close from commandbutton within w_journalrevenus
integer x = 2880
integer y = 1912
integer width = 704
integer height = 108
integer taborder = 60
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

type dw_journalrevenuscombines from u_dw within w_journalrevenus
integer width = 3589
integer height = 1912
integer taborder = 10
string title = "Journal revenus combinés"
string dataobject = "d_journalrevenuscombines"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;string ls_ortho,ls_mod

SetTransObject(Sqlca)
select dr_nom_complet into :ls_ortho from ortho_id where ortho_id = :v_no_ortho;
if v_langue = 'an' then
	this.object.t_title.text = 'Fees report for: '+ ls_ortho
	this.object.t_du.text = 'From:'
	this.object.t_au.text = 'to'
//	this.object.patient_patient_nom_t.text = 'Name'
//	this.object.patient_patient_prenom_t.text = 'First name'
//	this.object.t_2.text = 'Balance'
//	this.object.b_date.text = 'Billing date'
//	this.object.b_montant.text = 'Amount'
//	this.object.b_nom.text = "Patient's name"
//	this.object.b_prenom.text = "Patient's first name"
//	this.object.b_solde.text = "Balance"
	this.object.t_printedon.text = "Printed on"
else
	this.object.t_title.text = 'Journal des revenus combinés pour : ' + ls_ortho
end if
end event

event buttonclicked;choose case dwo.name
	case 'b_date'
		this.setsort("factures_traitements_date_facture A")
		this.sort()
	case 'b_montant'
		this.setsort("factures_traitements_montant A")
		this.sort()
	case 'b_nom'
		this.setsort("patient_patient_nom A")
		this.sort()
	case 'b_prenom'
		this.setsort("patient_patient_prenom A")
		this.sort()
	case 'b_solde'
		this.setsort("solde A")
		this.sort()
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

event retrieveend;string ls_mod
datawindowchild dwc_method

SetTransObject(Sqlca)
if v_langue = 'an' then
	this.object.dw_revenus.object.t_pat.text = 'Name'
	this.object.dw_revenus.object.t_hono.text = 'Fees'
	this.object.dw_revenus.object.t_enc.text = 'Cashing'
	this.object.dw_revenus.object.t_montant.text = 'Due amount'
	this.object.dw_revenus.object.t_tot.text = 'Totals:'
	this.object.dw_status.object.t_montant.text = "Amount"
	this.object.dw_paie.object.t_mod.text = "Method"
	this.object.dw_paie.object.t_montant.text = "Amount"
end if

if this.getchild("dw_paie",dwc_method) = -1 then
	error_type(0)
end if
dwc_method.modify("paiement.values = '" + gf_method(v_langue) + "'")


end event

