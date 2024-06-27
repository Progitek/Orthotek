$PBExportHeader$w_journal_encaissements.srw
forward
global type w_journal_encaissements from w_child
end type
type dw_sat from uo_sat within w_journal_encaissements
end type
type uo_calutil2 from u_calutil within w_journal_encaissements
end type
type uo_calutil1 from u_calutil within w_journal_encaissements
end type
type cb_export from commandbutton within w_journal_encaissements
end type
type dw_journal_encaissements from u_dw within w_journal_encaissements
end type
type em_fin from editmask within w_journal_encaissements
end type
type em_debut from editmask within w_journal_encaissements
end type
type st_2 from statictext within w_journal_encaissements
end type
type st_1 from statictext within w_journal_encaissements
end type
type cb_3 from commandbutton within w_journal_encaissements
end type
type cb_find from commandbutton within w_journal_encaissements
end type
type cb_print from commandbutton within w_journal_encaissements
end type
end forward

global type w_journal_encaissements from w_child
integer x = 5
integer y = 4
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
dw_sat dw_sat
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
cb_export cb_export
dw_journal_encaissements dw_journal_encaissements
em_fin em_fin
em_debut em_debut
st_2 st_2
st_1 st_1
cb_3 cb_3
cb_find cb_find
cb_print cb_print
end type
global w_journal_encaissements w_journal_encaissements

type variables
public long il_idsat = 0
string 	is_satellite
end variables

on w_journal_encaissements.create
int iCurrent
call super::create
this.dw_sat=create dw_sat
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.cb_export=create cb_export
this.dw_journal_encaissements=create dw_journal_encaissements
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_2=create st_2
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_find=create cb_find
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_sat
this.Control[iCurrent+2]=this.uo_calutil2
this.Control[iCurrent+3]=this.uo_calutil1
this.Control[iCurrent+4]=this.cb_export
this.Control[iCurrent+5]=this.dw_journal_encaissements
this.Control[iCurrent+6]=this.em_fin
this.Control[iCurrent+7]=this.em_debut
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_1
this.Control[iCurrent+10]=this.cb_3
this.Control[iCurrent+11]=this.cb_find
this.Control[iCurrent+12]=this.cb_print
end on

on w_journal_encaissements.destroy
call super::destroy
destroy(this.dw_sat)
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.cb_export)
destroy(this.dw_journal_encaissements)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_find)
destroy(this.cb_print)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

dw_journal_encaissements.SetTransObject(SQLCA)
end event

type dw_sat from uo_sat within w_journal_encaissements
integer x = 2103
integer height = 88
integer taborder = 40
end type

event clicked;call super::clicked;long ll_idsat
date debut, fin
integer li_option
string	ls_sat

debut = date(em_debut.text)
fin = date(em_fin.text)
il_idsat = this.il_idsat


if il_idsat = 0 then
	dw_journal_encaissements.object.t_sat.text = ""
	SetNull(is_satellite)
	setNull(ll_idsat)
else
	ls_sat = getitemstring(getrow(),'lieu')
	dw_journal_encaissements.object.t_sat.text = "Satellite: "+ ls_sat
	ll_idsat = il_idsat
	is_satellite = ls_sat
end if

select eliminernsfcred into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	dw_journal_encaissements.SetFilter("paiement_paiement = '$' or paiement_paiement = 'C' or &
	paiement_paiement = 'Visa' or paiement_paiement = 'pVisa' or paiement_paiement = 'MC' or paiement_paiement = 'pMC' or paiement_paiement = 'PD' or paiement_paiement = 'P' or paiement_paiement = 'credit'")
end if
dw_journal_encaissements.retrieve(v_no_ortho,debut,fin,ll_idsat)
end event

event constructor;call super::constructor;integer li_option

select compsat into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	visible = true 
else
	visible = false
end if
end event

type uo_calutil2 from u_calutil within w_journal_encaissements
boolean visible = false
integer x = 2053
integer y = 1360
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_journal_encaissements
boolean visible = false
integer x = 1189
integer y = 1360
integer taborder = 40
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type cb_export from commandbutton within w_journal_encaissements
integer x = 2510
integer y = 1912
integer width = 571
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Exporter vers Excel"
end type

event clicked;if dw_journal_encaissements.SaveAs("c:\ii4net\orthotek\correspondances\enc.xls", EXCEL5!,True) = 1 then
	if error_type(228) = 1 then
		run('C:\Program Files\Microsoft Office\Office\Excel.EXE c:\ii4net\orthotek\correspondances\enc.xls',maximized!)
	end if
else
	error_type(0)
end if
end event

event constructor;if v_langue = 'an' then
	this.Text = "Export to excel"
end if
end event

type dw_journal_encaissements from u_dw within w_journal_encaissements
integer x = 46
integer y = 76
integer width = 3589
integer height = 1836
integer taborder = 70
string dataobject = "d_journal_encaissements"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	this.object.t_titre.text = 'Daily register for:'
	this.object.t_from.text = 'From'
	this.object.t_to.text = 'to'
	this.object.t_date.text = 'Payment date'
	this.object.t_patient.text = 'Patient name'
	this.object.t_montant.text = 'Amount recieved'
	this.object.t_modalite.text = 'Payment'
	this.object.b_date.text = 'Payment date'
	this.object.b_patient.text = 'Patient name'
	this.object.b_montant.text = 'Amount recieved'
	this.object.b_modalite.text = 'Payment'
	this.object.t_periode.text = 'Period:'
	this.object.t_cheque.text = 'Check:'
	this.object.t_comptant.text = 'Cash:'
	this.object.t_credit.text = 'Credit:'
	this.object.t_cartedeb.text = 'Interact:'
	this.object.t_perte.text = 'Loss:'
	this.object.t_printedon.text = 'Printed on'
	this.object.t_autre.text = 'Other:'
end if
this.object.paiement_paiement.values = gf_method(v_langue)

end event

event buttonclicked;choose case dwo.name
	case 'b_date'
		dw_journal_encaissements.setsort("paiement_date_paiement A")
		dw_journal_encaissements.sort()
	case 'b_patient'
		dw_journal_encaissements.setsort("patient_patient_nom A, patient_patient_prenom A")
		dw_journal_encaissements.sort()
	case 'b_montant'
		dw_journal_encaissements.setsort("paiement_montant_recu A")
		dw_journal_encaissements.sort()
	case 'b_modalite'
		dw_journal_encaissements.setsort("paiement_paiement A")
		dw_journal_encaissements.sort()
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

type em_fin from editmask within w_journal_encaissements
integer x = 2053
integer y = 1916
integer width = 389
integer height = 100
integer taborder = 20
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

type em_debut from editmask within w_journal_encaissements
integer x = 1399
integer y = 1916
integer width = 393
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

type st_2 from statictext within w_journal_encaissements
integer x = 1815
integer y = 1928
integer width = 224
integer height = 76
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
string text = "Date fin:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_2.Text = "to:"
end if
end event

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type st_1 from statictext within w_journal_encaissements
integer x = 987
integer y = 1928
integer width = 398
integer height = 76
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
string text = "Date du début:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_1.Text = "From:"
end if
end event

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type cb_3 from commandbutton within w_journal_encaissements
integer x = 3086
integer y = 1912
integer width = 544
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
	cb_3.Text = "Close"
end if
end event

type cb_find from commandbutton within w_journal_encaissements
integer x = 485
integer y = 1912
integer width = 462
integer height = 108
integer taborder = 30
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
int li_option
long ll_idsat, ll_row
string	ls_lieu

debut = date(em_debut.text)
fin = date(em_fin.text)

dw_journal_encaissements.object.date_debut.text = em_debut.text
dw_journal_encaissements.object.date_fin.text = em_fin.text

//il_idsat = dw_sat.getitemnumber(dw_sat.getrow(),'id_satellite')
il_idsat =  dw_sat.il_idsat

if il_idsat = 0 then
	dw_journal_encaissements.object.t_sat.text = ""
	setNull(ll_idsat)
else
	ll_row = dw_sat.getrow()
	IF ll_row > 0 THEN
		dw_journal_encaissements.object.t_sat.text = "Satellite: "+ is_satellite
	END IF
	ll_idsat = il_idsat
end if

select eliminernsfcred into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	dw_journal_encaissements.SetFilter("paiement_paiement = '$' or paiement_paiement = 'C' or &
	paiement_paiement = 'Visa' or paiement_paiement = 'pVisa' or paiement_paiement = 'MC' or paiement_paiement = 'pMC' or paiement_paiement = 'PD' or paiement_paiement = 'P' or paiement_paiement = 'credit'")
end if
dw_journal_encaissements.retrieve(v_no_ortho,debut,fin,ll_idsat)
end event

event constructor;if v_langue = 'an' then
	cb_find.Text = "Search"
end if
end event

type cb_print from commandbutton within w_journal_encaissements
integer y = 1912
integer width = 485
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_journal_encaissements)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

