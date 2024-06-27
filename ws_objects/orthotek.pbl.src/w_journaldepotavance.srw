$PBExportHeader$w_journaldepotavance.srw
forward
global type w_journaldepotavance from w_child
end type
type dw_sat from uo_sat within w_journaldepotavance
end type
type uo_calutil1 from u_calutil within w_journaldepotavance
end type
type em_datedepot from editmask within w_journaldepotavance
end type
type st_1 from statictext within w_journaldepotavance
end type
type cb_3 from commandbutton within w_journaldepotavance
end type
type cb_find from commandbutton within w_journaldepotavance
end type
type cb_print from commandbutton within w_journaldepotavance
end type
type dw_journaldepotavance from u_dw within w_journaldepotavance
end type
end forward

global type w_journaldepotavance from w_child
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
uo_calutil1 uo_calutil1
em_datedepot em_datedepot
st_1 st_1
cb_3 cb_3
cb_find cb_find
cb_print cb_print
dw_journaldepotavance dw_journaldepotavance
end type
global w_journaldepotavance w_journaldepotavance

type variables
private long il_idlot
private boolean ib_skipscroll
private integer ii_row
private string is_satfilter = '' , is_sat = ''
end variables

forward prototypes
public subroutine if_p2c ()
public subroutine uf_checkallbox ()
public subroutine uf_setlot ()
end prototypes

public subroutine if_p2c ();integer i,li_option

dw_journaldepotavance.setredraw(false)
select delpondepot into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	for i = 1 to dw_journaldepotavance.rowcount()
		if dw_journaldepotavance.getitemstring(i,'paiement_paiement') = 'P' then
			dw_journaldepotavance.setitem(i,'paiement_paiement','C')
		end if
	next
end if
dw_journaldepotavance.setredraw(true)
end subroutine

public subroutine uf_checkallbox ();long z

for z = 1 to dw_journaldepotavance.rowcount()
	dw_journaldepotavance.setitem(z,'cheques_postdates_ind',1)
next
end subroutine

public subroutine uf_setlot ();integer i,li_nbrow

dw_journaldepotavance.accepttext()
for i = 1 to dw_journaldepotavance.rowcount()
	if dw_journaldepotavance.getitemnumber(i,'cheques_postdates_ind') = 1 then
		dw_journaldepotavance.setitem(i,'cheques_postdates_id_lot',il_idlot)
	end if
next
insert into t_lot(id_lot,ortho_id,lotdate,lotheure) values(:il_idlot,:v_no_ortho,today(*),Now());
if dw_journaldepotavance.update() = 1 then
	commit using sqlca;
else
	rollback using sqlca;
	error_type(50)
end if
end subroutine

on w_journaldepotavance.create
int iCurrent
call super::create
this.dw_sat=create dw_sat
this.uo_calutil1=create uo_calutil1
this.em_datedepot=create em_datedepot
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_find=create cb_find
this.cb_print=create cb_print
this.dw_journaldepotavance=create dw_journaldepotavance
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_sat
this.Control[iCurrent+2]=this.uo_calutil1
this.Control[iCurrent+3]=this.em_datedepot
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.cb_find
this.Control[iCurrent+7]=this.cb_print
this.Control[iCurrent+8]=this.dw_journaldepotavance
end on

on w_journaldepotavance.destroy
call super::destroy
destroy(this.dw_sat)
destroy(this.uo_calutil1)
destroy(this.em_datedepot)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_find)
destroy(this.cb_print)
destroy(this.dw_journaldepotavance)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

select max(id_lot) into :il_idlot from t_lot where ortho_id = :v_no_ortho;
if isnull(il_idlot) then 
	il_idlot = 1
else
	il_idlot++
end if
end event

type dw_sat from uo_sat within w_journaldepotavance
integer x = 2103
integer taborder = 40
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	is_satfilter = ''
	dw_journaldepotavance.setFilter(is_satfilter)
	dw_journaldepotavance.filter()
	is_sat = ''
else
	is_satfilter = "patient_id_satellite = " + string(il_idsat)
	dw_journaldepotavance.setFilter(is_satfilter)
	dw_journaldepotavance.filter()
	dw_journaldepotavance.GroupCalc()
	dw_journaldepotavance.SetFocus()
	select lieu into :is_sat from t_satellites where id_satellite = :il_idsat;
end if
dw_journaldepotavance.object.t_sat.text = is_sat
end event

event constructor;call super::constructor;integer li_option

select compsat into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	visible = true 
else
	visible = false
end if
end event

type uo_calutil1 from u_calutil within w_journaldepotavance
boolean visible = false
integer x = 2327
integer y = 1372
integer taborder = 60
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_datedepot.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type em_datedepot from editmask within w_journaldepotavance
integer x = 2537
integer y = 1932
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

event constructor;em_datedepot.text = string(today())
end event

type st_1 from statictext within w_journaldepotavance
integer x = 1842
integer y = 1944
integer width = 686
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
string text = "Date du dépôt:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Deposit date:"
end if
end event

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type cb_3 from commandbutton within w_journaldepotavance
integer x = 2985
integer y = 1928
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

type cb_find from commandbutton within w_journaldepotavance
integer x = 1106
integer y = 1928
integer width = 722
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

event clicked;date datedepot
string ls_comptant

//dw_journal_depot.SetTransObject(SQLCA)
datedepot = date(em_datedepot.text)
//dw_jour_depot.object.dw_journal_depot_comptant.object.date_debut.text = em_debut.text
//dw_jour_depot.object.dw_journal_depot_comptant.object.date_debut.text = em_fin.text
//dw_jour_depot.setsort("patient_patient_nom A, patient_patient_prenom A")
dw_journaldepotavance.object.datedepot.text = string(datedepot)
dw_journaldepotavance.setfilter("cheques_postdates_modalite = '$' or cheques_postdates_modalite = 'C' or cheques_postdates_modalite = 'Visa' or cheques_postdates_modalite = 'MC' or cheques_postdates_modalite = 'PD' or cheques_postdates_modalite = 'P' or cheques_postdates_modalite = 'Amex'or cheques_postdates_modalite = 'pVisa'or cheques_postdates_modalite = 'pMC'or cheques_postdates_modalite = 'pAmex'" )

dw_journaldepotavance.retrieve(v_no_ortho,datedepot)
uf_checkallbox()
//dw_journaldepot.GroupCalc()
//dw_journaldepot.SetFocus()
end event

event constructor;if v_langue = 'an' then
	this.Text = "Search"
end if
end event

type cb_print from commandbutton within w_journaldepotavance
integer y = 1928
integer width = 1106
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer le lot"
end type

event clicked;string ls_option
date datedepot
boolean lb_hidedepositsheader

datedepot = date(em_datedepot.text)

select hidedepositsheader into :lb_hidedepositsheader from t_options where ortho_id = :v_no_ortho;

//creation du lot
uf_setlot()
//impression du lot
datastore ds_journaldepot
ds_journaldepot = create datastore
ds_journaldepot.dataobject = "d_journaldepotimpavance"
ds_journaldepot.SetTransObject(SQLCA)

datedepot = date(em_datedepot.text)
ds_journaldepot.object.datedepot.text = string(datedepot)

if v_langue = 'an' then
	ds_journaldepot.object.t_bank.text = 'Bank'
	ds_journaldepot.object.t_current.text = 'Current Account'
	ds_journaldepot.object.t_search.text = 'Search parameter'
	ds_journaldepot.object.t_datedepot.text = 'DEPOSIT DATE:'
	ds_journaldepot.object.t_lot.text = 'LOT #:'
	ds_journaldepot.object.t_patnom.text = 'Patient name'
	ds_journaldepot.object.t_nocheque.text = 'Cheque #'
	ds_journaldepot.object.t_montant.text = 'Amount'
	ds_journaldepot.object.t_subtotal.text = 'Sub-total'
	ds_journaldepot.object.t_printedon.text = 'Printed on'
	ds_journaldepot.object.t_qty.text = 'Qty'
end if

if lb_hidedepositsheader then
	ds_journaldepot.object.t_bank.visible = 0
	ds_journaldepot.object.t_current.visible = 0
	ds_journaldepot.object.ortho_id_dr_nom_complet.visible = 0
	ds_journaldepot.object.ortho_id_dr_banque.visible = 0
	ds_journaldepot.object.ortho_id_dr_compte.visible = 0
	ds_journaldepot.object.rr_1.visible = 0

end if

ds_journaldepot.object.cheques_postdates_modalite.values = gf_method(v_langue)

ds_journaldepot.retrieve(v_no_ortho,il_idlot)
gb_datawindow = false
openwithparm(w_print_options,ds_journaldepot)
destroy ds_journaldepot
//impression du sommaire
//datastore ds_journal_depot
//ds_journal_depot = create datastore
//ds_journal_depot.dataobject = "d_journaldepotsom1"
//		if v_langue = 'an' then
//			ds_journal_depot.object.t_bank.text = 'Bank'
//			ds_journal_depot.object.t_compte.text = 'Currant account'
//			ds_journal_depot.object.t_para.text = 'Parameter dates from research'
//			ds_journal_depot.object.t_from.text = 'From'
//			ds_journal_depot.object.t_to.text = 'to'
//			ds_journal_depot.object.t_summary.text = 'Deposit summary'
//	//		ds_journal_depot.object.t_soustotcpd.text = 'Sub-total postdated cheques:'
//	//		ds_journal_depot.object.t_soustotcheque.text = 'Sub-total cheques:'
//			ds_journal_depot.object.t_totcheque.text = 'Total cheques:'
//			ds_journal_depot.object.t_totinteract.text = 'Total Interac:'
//			ds_journal_depot.object.t_totcash.text = 'Total cash:'
//			ds_journal_depot.object.t_soustot.text = 'Sub-total:'
//			ds_journal_depot.object.t_tot.text = 'Total of the deposit:'
//	//		ds_journal_depot.object.t_soustotdebit.text = 'Sub-total debited:'
//			ds_journal_depot.object.t_detail.text = 'Details:'
//			ds_journal_depot.object.t_qty.text = 'Quantity:'
//		end if
//ds_journal_depot.SetTransObject(SQLCA)
//ds_journal_depot.object.datedepot.text = string(datedepot)
//ds_journal_depot.object.t_sat.text = is_sat
//ds_journal_depot.setfilter(is_satfilter)
//ds_journal_depot.retrieve(v_no_ortho,il_idlot)
//ds_journal_depot.print()
//destroy ds_journal_depot
close(parent)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

type dw_journaldepotavance from u_dw within w_journaldepotavance
integer x = 14
integer width = 3575
integer height = 1924
integer taborder = 50
string title = "Journal depot avance"
string dataobject = "d_journaldepotavance"
boolean hscrollbar = true
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;integer i,li_option

//select delpondepot into :li_option from t_options where ortho_id = :v_no_ortho;
//if li_option = 1 then
//	dw_journaldepot.dataobject = 'd_journaldepot1'
//else
//	dw_journaldepot.dataobject = 'd_journal_depot'
//end if

dw_journaldepotavance.SetTransObject(SQLCA)
if v_langue = 'an' then
	dw_journaldepotavance.object.t_bank.text = 'Bank'
	dw_journaldepotavance.object.t_current.text = 'Current Account'
	dw_journaldepotavance.object.t_search.text = 'Search parameter'
	dw_journaldepotavance.object.t_datedepot.text = 'DEPOSIT DATE:'
	dw_journaldepotavance.object.t_lot.text = 'LOT #:'
	dw_journaldepotavance.object.t_patnom.text = 'Patient name'
	dw_journaldepotavance.object.t_nocheque.text = 'Cheque #'
	dw_journaldepotavance.object.t_montant.text = 'Amount'
	dw_journaldepotavance.object.t_subtotal.text = 'Sub-total'
	dw_journaldepotavance.object.t_printedon.text = 'Printed on'
	dw_journaldepotavance.object.t_qty.text = 'Qty'
end if
dw_journaldepotavance.object.cheques_postdates_modalite.values = gf_method(v_langue)
end event

