$PBExportHeader$w_journal_depot.srw
forward
global type w_journal_depot from w_child
end type
type dw_journal_depot from u_dw within w_journal_depot
end type
type dw_sat from uo_sat within w_journal_depot
end type
type cb_update from commandbutton within w_journal_depot
end type
type uo_calutil2 from u_calutil within w_journal_depot
end type
type uo_calutil1 from u_calutil within w_journal_depot
end type
type cbx_1 from checkbox within w_journal_depot
end type
type em_fin from editmask within w_journal_depot
end type
type em_debut from editmask within w_journal_depot
end type
type st_2 from statictext within w_journal_depot
end type
type st_1 from statictext within w_journal_depot
end type
type cb_3 from commandbutton within w_journal_depot
end type
type cb_find from commandbutton within w_journal_depot
end type
type cb_print from commandbutton within w_journal_depot
end type
end forward

global type w_journal_depot from w_child
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
dw_journal_depot dw_journal_depot
dw_sat dw_sat
cb_update cb_update
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
cbx_1 cbx_1
em_fin em_fin
em_debut em_debut
st_2 st_2
st_1 st_1
cb_3 cb_3
cb_find cb_find
cb_print cb_print
end type
global w_journal_depot w_journal_depot

type variables
private boolean ib_skipscroll
private integer ii_row
private string is_satfilter = '' , is_sat = ''
end variables

forward prototypes
public subroutine if_p2c ()
end prototypes

public subroutine if_p2c ();integer i,li_option

dw_journal_depot.setredraw(false)
select delpondepot into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	for i = 1 to dw_journal_depot.rowcount()
		if dw_journal_depot.getitemstring(i,'paiement_paiement') = 'P' then
			dw_journal_depot.setitem(i,'paiement_paiement','C')
		end if
	next
end if
dw_journal_depot.setredraw(true)
end subroutine

on w_journal_depot.create
int iCurrent
call super::create
this.dw_journal_depot=create dw_journal_depot
this.dw_sat=create dw_sat
this.cb_update=create cb_update
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.cbx_1=create cbx_1
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_2=create st_2
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_find=create cb_find
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_journal_depot
this.Control[iCurrent+2]=this.dw_sat
this.Control[iCurrent+3]=this.cb_update
this.Control[iCurrent+4]=this.uo_calutil2
this.Control[iCurrent+5]=this.uo_calutil1
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.em_fin
this.Control[iCurrent+8]=this.em_debut
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.cb_3
this.Control[iCurrent+12]=this.cb_find
this.Control[iCurrent+13]=this.cb_print
end on

on w_journal_depot.destroy
call super::destroy
destroy(this.dw_journal_depot)
destroy(this.dw_sat)
destroy(this.cb_update)
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.cbx_1)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_find)
destroy(this.cb_print)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type dw_journal_depot from u_dw within w_journal_depot
integer x = 27
integer y = 64
integer width = 3566
integer height = 1812
integer taborder = 50
string title = "d_journal_depot"
string dataobject = "d_journal_depot"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;integer i,li_option

select delpondepot into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	dw_journal_depot.dataobject = 'd_journaldepot1'
else
	dw_journal_depot.dataobject = 'd_journal_depot'
end if

dw_journal_depot.SetTransObject(SQLCA)
if v_langue = 'an' then
	dw_journal_depot.object.t_bank.text = 'Bank'
	dw_journal_depot.object.t_current.text = 'Current Account'
	dw_journal_depot.object.t_search.text = 'Search parameter'
	dw_journal_depot.object.t_from.text = 'FROM'
	dw_journal_depot.object.t_to.text = 'TO'
	dw_journal_depot.object.t_patnom.text = 'Patient name'
	dw_journal_depot.object.t_nocheque.text = 'Cheque #'
	dw_journal_depot.object.t_montant.text = 'Amount'
	dw_journal_depot.object.t_subtotal.text = 'Sub-total'
	dw_journal_depot.object.t_printedon.text = 'Printed on'
	dw_journal_depot.object.t_qty.text = 'Qty'
end if
dw_journal_depot.object.paiement_paiement.values = gf_method(v_langue)
end event

type dw_sat from uo_sat within w_journal_depot
integer x = 2103
integer taborder = 40
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	is_satfilter = ''
	dw_journal_depot.setFilter(is_satfilter)
	dw_journal_depot.filter()
	is_sat = ''
else
	is_satfilter = "patient_id_satellite = " + string(il_idsat)
	dw_journal_depot.setFilter(is_satfilter)
	dw_journal_depot.filter()
	dw_journal_depot.GroupCalc()
	dw_journal_depot.SetFocus()
	select lieu into :is_sat from t_satellites where id_satellite = :il_idsat;
end if
dw_journal_depot.object.t_sat.text = is_sat
end event

event constructor;call super::constructor;integer li_option

select compsat into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	visible = true 
else
	visible = false
end if
end event

type cb_update from commandbutton within w_journal_depot
integer x = 2391
integer y = 1912
integer width = 594
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarde"
end type

event clicked;dw_journal_depot.accepttext()
if dw_journal_depot.update() = 1 then
	commit using sqlca;
	cb_find.event clicked()
else
	rollback using sqlca;
	error_type(50)
end if
end event

event constructor;string ls_option

select somdepot into :ls_option from t_options where ortho_id = :v_no_ortho;
if ls_option = '1' then
	this.enabled = true
else
	this.enabled = false
end if

if v_langue = 'an' then
	this.Text = "Save"
end if
end event

type uo_calutil2 from u_calutil within w_journal_depot
boolean visible = false
integer x = 1957
integer y = 1360
integer taborder = 80
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_journal_depot
boolean visible = false
integer x = 1216
integer y = 1360
integer taborder = 60
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type cbx_1 from checkbox within w_journal_depot
integer x = 1079
integer y = 1924
integer width = 82
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
end type

type em_fin from editmask within w_journal_depot
integer x = 1957
integer y = 1916
integer width = 402
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

event constructor;em_fin.text = string(today())
end event

type em_debut from editmask within w_journal_depot
integer x = 1422
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

event constructor;em_debut.text = string(today())
end event

type st_2 from statictext within w_journal_depot
integer x = 1819
integer y = 1928
integer width = 123
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
string text = "au:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "To"
end if
end event

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type st_1 from statictext within w_journal_depot
integer x = 1170
integer y = 1928
integer width = 242
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

type cb_3 from commandbutton within w_journal_depot
integer x = 2985
integer y = 1912
integer width = 608
integer height = 108
integer taborder = 90
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

type cb_find from commandbutton within w_journal_depot
integer x = 544
integer y = 1912
integer width = 517
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
string ls_comptant

//dw_journal_depot.SetTransObject(SQLCA)
debut = date(em_debut.text)
fin = date(em_fin.text)
//dw_jour_depot.object.dw_journal_depot_comptant.object.date_debut.text = em_debut.text
//dw_jour_depot.object.dw_journal_depot_comptant.object.date_debut.text = em_fin.text
//dw_jour_depot.setsort("patient_patient_nom A, patient_patient_prenom A")
dw_journal_depot.object.datedepot1.text = string(debut)
dw_journal_depot.object.datedepot2.text = string(fin)
dw_journal_depot.setfilter("paiement_paiement = '$' or paiement_paiement = 'C' or paiement_paiement = 'Visa' or paiement_paiement = 'MC' or paiement_paiement = 'PD' or paiement_paiement = 'P' or paiement_paiement = 'Amex'or paiement_paiement = 'pVisa'or paiement_paiement = 'pMC'or paiement_paiement = 'pAmex' or paiement_paiement = 'trans'" )
dw_journal_depot.retrieve(v_no_ortho,debut,fin)
dw_journal_depot.GroupCalc()
dw_journal_depot.SetFocus()
end event

event constructor;if v_langue = 'an' then
	this.Text = "Search"
end if
end event

type cb_print from commandbutton within w_journal_depot
integer y = 1912
integer width = 539
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

event clicked;string ls_option
date debut, fin

debut = date(em_debut.text)
fin = date(em_fin.text)
if cbx_1.checked = true then
	printsetup()
	dw_journal_depot.SetRedraw(false)
	dw_journal_depot.object.datedepot1.text = string(debut)
	dw_journal_depot.object.datedepot2.text = string(fin)
	dw_journal_depot.setfilter("paiement_paiement = '$' or paiement_paiement = 'C' or paiement_paiement = 'P'" )
	dw_journal_depot.filter()
	dw_journal_depot.print()
	
	datastore ds_journal_depot1
	ds_journal_depot1 = create datastore
	ds_journal_depot1.dataobject = "d_journal_depot_som1"
	ds_journal_depot1.SetTransObject(SQLCA)
	ds_journal_depot1.object.datedepot1.text = string(debut)
	ds_journal_depot1.object.datedepot2.text = string(fin)
	ds_journal_depot1.retrieve(v_no_ortho,debut,fin)
	ds_journal_depot1.print()
	destroy ds_journal_depot1
	
	dw_journal_depot.setfilter("paiement_paiement = 'Visa' or paiement_paiement = 'pVisa' or paiement_paiement = 'MC' or paiement_paiement = 'pMC' or paiement_paiement = 'PD' or paiement_paiement = 'Amex' or paiement_paiement = 'pAmex' or paiement_paiement = 'trans'" )
	dw_journal_depot.filter()
	if dw_journal_depot.rowcount() > 0 then
		dw_journal_depot.print()
	end if
	dw_journal_depot.setfilter("paiement_paiement = '$' or paiement_paiement = 'C' or paiement_paiement = 'Visa' or paiement_paiement = 'pVisa' or paiement_paiement = 'MC' or paiement_paiement = 'pMC' or paiement_paiement = 'PD' or paiement_paiement = 'P' or paiement_paiement = 'Amex' or paiement_paiement = 'pAmex' or paiement_paiement = 'trans'" )
	dw_journal_depot.retrieve(v_no_ortho,debut,fin)
	dw_journal_depot.SetRedraw(true)
else
	printsetup()
	dw_journal_depot.Modify("DataWindow.Print.Margin.Top=200")
	dw_journal_depot.Modify("DataWindow.Print.Margin.left=200")
	dw_journal_depot.print()
end if

datastore ds_journal_depot
ds_journal_depot = create datastore
select somdepot into :ls_option from t_options where ortho_id = :v_no_ortho;
choose case ls_option 
	case '1'
		ds_journal_depot.dataobject = "d_journaldepotsom1"
		if v_langue = 'an' then
			ds_journal_depot.object.t_bank.text = 'Bank'
			ds_journal_depot.object.t_compte.text = 'Currant account'
			ds_journal_depot.object.t_para.text = 'Parameter dates from research'
			ds_journal_depot.object.t_from.text = 'From'
			ds_journal_depot.object.t_to.text = 'to'
			ds_journal_depot.object.t_summary.text = 'Deposit summary'
	//		ds_journal_depot.object.t_soustotcpd.text = 'Sub-total postdated cheques:'
	//		ds_journal_depot.object.t_soustotcheque.text = 'Sub-total cheques:'
			ds_journal_depot.object.t_totcheque.text = 'Total cheques:'
			ds_journal_depot.object.t_totinteract.text = 'Total Interac:'
			ds_journal_depot.object.t_totcash.text = 'Total cash:'
			ds_journal_depot.object.t_soustot.text = 'Sub-total:'
			ds_journal_depot.object.t_tot.text = 'Total of the deposit:'
	//		ds_journal_depot.object.t_soustotdebit.text = 'Sub-total debited:'
			ds_journal_depot.object.t_detail.text = 'Details:'
			ds_journal_depot.object.t_qty.text = 'Quantity:'
		end if
	case '2'
		ds_journal_depot.dataobject = "d_journal_depot_som"
		if v_langue = 'an' then
			ds_journal_depot.object.t_bank.text = 'Bank'
			ds_journal_depot.object.t_compte.text = 'Currant account'
			ds_journal_depot.object.t_para.text = 'Parameter dates from research'
			ds_journal_depot.object.t_from.text = 'From'
			ds_journal_depot.object.t_to.text = 'to'
			ds_journal_depot.object.t_summary.text = 'Deposit summary'
			ds_journal_depot.object.t_soustotcpd.text = 'Sub-total postdated cheques:'
			ds_journal_depot.object.t_soustotcheque.text = 'Sub-total cheques:'
			ds_journal_depot.object.t_totcheque.text = 'Total cheques:'
			ds_journal_depot.object.t_totinteract.text = 'Total Interac:'
			ds_journal_depot.object.t_totcash.text = 'Total cash:'
			ds_journal_depot.object.t_soustot.text = 'Sub-total:'
			ds_journal_depot.object.t_tot.text = 'Total of the deposit:'
			ds_journal_depot.object.t_soustotdebit.text = 'Sub-total debited:'
			ds_journal_depot.object.t_detail.text = 'Details:'
			ds_journal_depot.object.t_qty.text = 'Quantity:'
		end if
	case '3'
		ds_journal_depot.dataobject = "d_journaldepotsom2"
		if v_langue = 'an' then
			ds_journal_depot.object.t_bank.text = 'Bank'
			ds_journal_depot.object.t_compte.text = 'Currant account'
			ds_journal_depot.object.t_para.text = 'Parameter dates from research'
			ds_journal_depot.object.t_from.text = 'From'
			ds_journal_depot.object.t_to.text = 'to'
			ds_journal_depot.object.t_summary.text = 'Deposit summary'
			ds_journal_depot.object.t_soustotcpd.text = 'Total postdated:'
			ds_journal_depot.object.t_soustotcheque.text = 'Total cheques:'
			ds_journal_depot.object.t_visapd.text = 'Total Postdated Visa:'
			ds_journal_depot.object.t_mcpd.text = 'Total Postdated MasterCard:'
			ds_journal_depot.object.t_amexpd.text = 'Total Postdated Amex:'
			ds_journal_depot.object.t_totinteract.text = 'Total Interac:'
			ds_journal_depot.object.t_totcash.text = 'Total cash:'
			ds_journal_depot.object.t_soustot.text = 'Total of Credit Card + Interac:'
			ds_journal_depot.object.t_tot.text = 'Total of the deposit:'
			ds_journal_depot.object.t_montantdepot.text = 'Total to be deposited:'
			ds_journal_depot.object.t_detail.text = 'Details:'
			ds_journal_depot.object.t_qty.text = 'Quantity:'
		end if
end choose
ds_journal_depot.SetTransObject(SQLCA)
ds_journal_depot.object.datedepot1.text = string(debut)
ds_journal_depot.object.datedepot2.text = string(fin)
ds_journal_depot.object.t_sat.text = is_sat
ds_journal_depot.setfilter(is_satfilter)
ds_journal_depot.retrieve(v_no_ortho,debut,fin)
ds_journal_depot.print()
destroy ds_journal_depot
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

