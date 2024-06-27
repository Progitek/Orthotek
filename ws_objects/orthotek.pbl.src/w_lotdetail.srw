$PBExportHeader$w_lotdetail.srw
forward
global type w_lotdetail from w_child
end type
type cb_delete from commandbutton within w_lotdetail
end type
type dw_sat from uo_sat within w_lotdetail
end type
type cb_3 from commandbutton within w_lotdetail
end type
type cb_find from commandbutton within w_lotdetail
end type
type cb_print from commandbutton within w_lotdetail
end type
type dw_lotdetail from u_dw within w_lotdetail
end type
end forward

global type w_lotdetail from w_child
string tag = "Depot"
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
cb_delete cb_delete
dw_sat dw_sat
cb_3 cb_3
cb_find cb_find
cb_print cb_print
dw_lotdetail dw_lotdetail
end type
global w_lotdetail w_lotdetail

type variables
public long il_idlot
private boolean ib_skipscroll
private integer ii_row
private string is_satfilter = '' , is_sat = ''
private date idt_start,idt_end
public boolean change = false
end variables

forward prototypes
public subroutine if_p2c ()
public subroutine uf_setidt ()
public subroutine uf_setlot ()
public subroutine uf_remplirdepot (datastore dso)
end prototypes

public subroutine if_p2c ();integer i,li_option

dw_lotdetail.setredraw(false)
select delpondepot into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	for i = 1 to dw_lotdetail.rowcount()
		if dw_lotdetail.getitemstring(i,'paiement_paiement') = 'P' then
			dw_lotdetail.setitem(i,'paiement_paiement','C')
		end if
	next
end if
dw_lotdetail.setredraw(true)
end subroutine

public subroutine uf_setidt ();//date minimum
select min(date_paiement) 
into :idt_start 
from traitements inner join paiement on paiement.traitement_patient_id = traitements.traitement_id
				    inner join patient on traitements.patient_id = patient.patient_id
where patient.no_ortho = :v_no_ortho and id_lot = :il_idlot;
//date maximum
select max(date_paiement) 
into :idt_end 
from traitements inner join paiement on paiement.traitement_patient_id = traitements.traitement_id
				    inner join patient on traitements.patient_id = patient.patient_id
where patient.no_ortho = :v_no_ortho and id_lot = :il_idlot;
end subroutine

public subroutine uf_setlot ();string ls_type
long i,nil, ll_idpaie
setnull(nil)

for i = 1 to dw_lotdetail.rowcount()
	if dw_lotdetail.getitemnumber(i,'ind') = 0 then
		ls_type = dw_lotdetail.getItemString(i,'type')
		ll_idpaie = dw_lotdetail.getItemNumber(i,'id_paiement')
		if ls_type = 'P' then
			update paiement set id_lot = null, ind = 0 where paiement_id = :ll_idpaie;
			error_type(-1)
			commit using SQLCA;
		else
			update cheques_postdates set id_lot = null, ind = 0 where cheques_postdates_id = :ll_idpaie;
		end if
		//dw_lotdetail.setitem(i,'id_lot',nil)
	end if
next
end subroutine

public subroutine uf_remplirdepot (datastore dso);/****************************************************
Créé le: 13-08-2004
Par: Dave Tremblay
Modifié le: 13-08-2004
Par: Dave Tremblay
Ver: 7.8.4

Cette from fonction permet d'entrer le journal de dépôt
*****************************************************/

long ll_paieid, ll_cheque, ll_ind, ll_ortho, ll_sat, ll_row, ll_idlot, ll_cpd
long ll_cpdid
date ldt_datepaie, ldt_datepaie1
string ls_drnom, ls_modpaie, ls_prenom, ls_nom, ls_newdoss, ls_compte
string ls_banque
dec{2} ld_montant
 
//ldt_datepaie = date(em_datedepot.text) 
select delpondepot into :ll_cpd from t_options where ortho_id = :v_no_ortho;
 
// On ajoute les paiements normaux
DECLARE journal CURSOR FOR
  SELECT DISTINCT ortho_id.dr_nom_complet,
			paiement.paiement_id,  
         paiement.date_paiement,   
         paiement.montant_recu,
         paiement.paiement,
			paiement.nocheque,
			paiement.ind,
			paiement.id_lot,
         patient.no_ortho,
         patient.patient_prenom,
         patient.patient_nom,
			patient.new_dossier,
			patient.id_satellite,
         ortho_id.dr_compte,
         ortho_id.dr_banque
    FROM traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
							INNER JOIN paiement ON  traitements.traitement_id = paiement.traitement_patient_id,
			patient		INNER JOIN ortho_id ON patient.no_ortho = ortho_id.ortho_id
   WHERE paiement.id_lot = :il_idlot AND
			patient.no_ortho = :v_no_ortho;

OPEN journal;

FETCH journal INTO :ls_drnom,
						 :ll_paieid,
						 :ldt_datepaie1,
						 :ld_montant,
						 :ls_modpaie,
						 :ll_cheque,
						 :ll_ind,
						 :ll_idlot,
						 :ll_ortho,
						 :ls_prenom,
						 :ls_nom,
						 :ls_newdoss,
						 :ll_sat,
						 :ls_compte,
						 :ls_banque;					 
DO WHILE SQLCA.SQLCode = 0
	ll_row = dso.insertRow(0)
	if ll_cpd = 1 then
		choose case ls_modpaie
			case 'P'
				ls_modpaie = 'C'
			case 'pVisa'
				ls_modpaie = 'Visa'
			case 'pMC'
				ls_modpaie = 'MC'
			case 'pAmex'
				ls_modpaie = 'AmEx'
		end choose
	end if
	dso.setItem(ll_row,"paiement",ls_modpaie)
	dso.setItem(ll_row,"nom", ls_nom)
	dso.setItem(ll_row,"prenom", ls_prenom)
	dso.setItem(ll_row,"nocheque",ll_cheque)
	dso.setItem(ll_row,"datepaie",ldt_datepaie1)
	dso.setItem(ll_row,"ind",ll_ind)
	dso.setItem(ll_row,"montant",ld_montant)
	dso.setItem(ll_row,"id_lot",ll_idlot)
	dso.setItem(ll_row,"id_paiement",ll_paieid)
	dso.setItem(ll_row,'type',"P")
	dso.setItem(ll_row,'compte',ls_compte)
	dso.setItem(ll_row,'banque',ls_banque)
	dso.setItem(ll_row,'orthonom',ls_drnom)
	FETCH journal INTO :ls_drnom,
						 :ll_paieid,
						 :ldt_datepaie1,
						 :ld_montant,
						 :ls_modpaie,
						 :ll_cheque,
						 :ll_ind,
						 :ll_idlot,
						 :ll_ortho,
						 :ls_prenom,
						 :ls_nom,
						 :ls_newdoss,
						 :ll_sat,
						 :ls_compte,
						 :ls_banque;
LOOP

CLOSE journal;

// On ajoute les cheques postdates si l'option est coché
DECLARE CPD CURSOR FOR
	  SELECT ortho_id.dr_nom_complet,
			cheques_postdates.cheques_postdates_id,
			cheques_postdates.date_cheque, 
			cheques_postdates.paiement, 
			cheques_postdates.modalite,
			cheques_postdates.nocheque,
			cheques_postdates.id_lot,
			patient.no_ortho,   
			patient.patient_prenom,   
			patient.patient_nom,
			patient.id_satellite,
			patient.new_dossier,  
			ortho_id.dr_compte,   
			ortho_id.dr_banque  
	 FROM traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
							INNER JOIN cheques_postdates ON  traitements.traitement_id = cheques_postdates.traitement_patient_id,
			patient		INNER JOIN ortho_id ON patient.no_ortho = ortho_id.ortho_id
	WHERE cheques_postdates.id_lot = :il_idlot AND
			cheques_postdates.indicateur <> '1' AND
			patient.no_ortho = :v_no_ortho;

OPEN CPD;

FETCH CPD INTO :ls_drnom,
					:ll_cpdid,
					:ldt_datepaie1,
					:ld_montant,
					:ls_modpaie,
					:ll_cheque,
					:ll_idlot,
					:ll_ortho,
					:ls_prenom,
					:ls_nom,
					:ll_sat,
					:ls_newdoss,
					:ls_compte,
					:ls_banque;
					
DO WHILE SQLCA.SQLCode = 0 
	
	ll_row = dso.insertRow(0)
	if ll_cpd = 1 then
		choose case ls_modpaie
			case 'P'
				ls_modpaie = 'C'
			case 'pVisa'
				ls_modpaie = 'Visa'
			case 'pMC'
				ls_modpaie = 'MC'
			case 'pAmex'
				ls_modpaie = 'AmEx'
		end choose
	end if
	dso.setItem(ll_row,"paiement",ls_modpaie)
	dso.setItem(ll_row,"nom", ls_nom)
	dso.setItem(ll_row,"prenom", ls_prenom)
	dso.setItem(ll_row,"nocheque",ll_cheque)
	dso.setItem(ll_row,"datepaie",ldt_datepaie1)
	dso.setItem(ll_row,"ind",0)
	dso.setItem(ll_row,"montant",ld_montant)
	dso.setItem(ll_row,"id_lot",ll_idlot)
	dso.setItem(ll_row,"id_paiement",ll_cpdid)
	dso.setItem(ll_row,'type',"C")
	dso.setItem(ll_row,'compte',ls_compte)
	dso.setItem(ll_row,'banque',ls_banque)
	dso.setItem(ll_row,'orthonom',ls_drnom)
	FETCH CPD INTO :ls_drnom,
					:ll_cpdid, 
					:ldt_datepaie1,
					:ld_montant,
					:ls_modpaie,
					:ll_cheque,
					:ll_idlot,
					:ll_ortho,
					:ls_prenom,
					:ls_nom,
					:ll_sat,
					:ls_newdoss,
					:ls_compte,
					:ls_banque;
LOOP

CLOSE CPD;

dso.setfilter("paiement = '$' or paiement = 'C' or paiement = 'Visa' or paiement = 'MC' or paiement = 'PD' or paiement = 'P' or paiement = 'AmEx'or paiement = 'pVisa'or paiement = 'pMC'or paiement = 'pAmex' or paiement = 'trans'" )
dso.filter()
dso.setsort('paiement A,nom A,prenom A')
dso.sort() 
dso.groupcalc()
end subroutine

on w_lotdetail.create
int iCurrent
call super::create
this.cb_delete=create cb_delete
this.dw_sat=create dw_sat
this.cb_3=create cb_3
this.cb_find=create cb_find
this.cb_print=create cb_print
this.dw_lotdetail=create dw_lotdetail
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_delete
this.Control[iCurrent+2]=this.dw_sat
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_find
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.dw_lotdetail
end on

on w_lotdetail.destroy
call super::destroy
destroy(this.cb_delete)
destroy(this.dw_sat)
destroy(this.cb_3)
destroy(this.cb_find)
destroy(this.cb_print)
destroy(this.dw_lotdetail)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_delete from commandbutton within w_lotdetail
integer x = 887
integer y = 1928
integer width = 887
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer le lot"
end type

event clicked;long ll_cpd
string ls_statut

//messagebox('il_idlot',string(il_idlot))
if v_langue = 'an' then
	ls_statut = 'Deleted'
else
	ls_statut = 'Supprimer'
end if

select isnull(delpondepot,0) into :ll_cpd from t_options where ortho_id = :v_no_ortho;

update t_lot set description = :ls_statut where id_lot = :il_idlot and t_lot.ortho_id = :v_no_ortho;
commit using sqlca;
error_type(-1)
update paiement set paiement.id_lot = null, paiement.ind = 0
from paiement inner join traitements on traitements.traitement_id = paiement.traitement_patient_id
inner join patient on patient.patient_id = traitements.patient_id
where paiement.id_lot = :il_idlot and patient.no_ortho = :v_no_ortho;
commit using sqlca;
error_type(-1)
update cheques_postdates set cheques_postdates.id_lot = null, cheques_postdates.ind = 0
from cheques_postdates inner join traitements on traitements.traitement_id = cheques_postdates.traitement_patient_id
inner join patient on patient.patient_id = traitements.patient_id
where id_lot = :il_idlot and patient.no_ortho = :v_no_ortho;
commit using sqlca;
error_type(-1)
dw_lotdetail.reset()
end event

event constructor;if v_langue = 'an' then
	this.Text = "Delete"
end if
end event

type dw_sat from uo_sat within w_lotdetail
integer x = 2103
integer taborder = 40
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	is_satfilter = ''
	dw_lotdetail.setFilter(is_satfilter)
	dw_lotdetail.filter()
	is_sat = ''
else
	is_satfilter = "patient_id_satellite = " + string(il_idsat)
	dw_lotdetail.setFilter(is_satfilter)
	dw_lotdetail.filter()
	dw_lotdetail.GroupCalc()
	dw_lotdetail.SetFocus()
	select lieu into :is_sat from t_satellites where id_satellite = :il_idsat;
end if
dw_lotdetail.object.t_sat.text = is_sat
end event

event constructor;call super::constructor;integer li_option

select compsat into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	visible = true 
else
	visible = false
end if
end event

type cb_3 from commandbutton within w_lotdetail
integer x = 2702
integer y = 1928
integer width = 887
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if change then
	uf_setlot()
//	dw_lotdetail.update()
//	commit using sqlca;
end if
Close(parent)
end event

event constructor;if v_langue = 'an' then
	cb_3.Text = "Close"
end if
end event

type cb_find from commandbutton within w_lotdetail
integer x = 1774
integer y = 1928
integer width = 928
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Selectionner un lot"
end type

event clicked;long z
integer li_option

open(w_lot)

//dw_lotdetail.setfilter("paiement_paiement = '$' or paiement_paiement = 'C' or paiement_paiement = 'Visa' or paiement_paiement = 'MC' or paiement_paiement = 'PD' or paiement_paiement = 'P' or paiement_paiement = 'Amex'or paiement_paiement = 'pVisa'or paiement_paiement = 'pMC'or paiement_paiement = 'pAmex'" )
//dw_lotdetail.retrieve(v_no_ortho,il_idlot)

dw_lotdetail.event ue_remplir(il_idlot)

//si cheque et postdate se retrouvent ensemble

//select delpondepot into :li_option from t_options where ortho_id = :v_no_ortho;
//if li_option = 1 then
//	SetRedraw(false)
//	for z = 1 to dw_lotdetail.rowcount()
//		if dw_lotdetail.getitemstring(z,'paiement_paiement') = 'P' then
//			dw_lotdetail.setitem(z,'paiement_paiement','C')
//		end if
//	next
//	SetRedraw(true)
//end if
//dw_lotdetail.setsort('paiement.paiement A,patient.patient_nom A,patient.patient_prenom A')
//dw_lotdetail.sort() 
//dw_lotdetail.GroupCalc()
//dw_lotdetail.SetFocus()
//uf_setidt()
select lotdate into :idt_end from t_lot where id_lot = :il_idlot and ortho_id = :v_no_ortho;
dw_lotdetail.object.datedepot.text = string(idt_end)
end event

event constructor;if v_langue = 'an' then
	this.Text = "Lot selection"
end if
end event

type cb_print from commandbutton within w_lotdetail
integer y = 1928
integer width = 887
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer le lot"
end type

event clicked;string ls_option
boolean lb_hidedepositsheader

//if change then
//	uf_setlot()
//	dw_lotdetail.update()
//	commit using sqlca;
//end if

//impression du lot
select somdepot into :ls_option from t_options where ortho_id = :v_no_ortho;

select hidedepositsheader into :lb_hidedepositsheader from t_options where ortho_id = :v_no_ortho;

datastore ds_journaldepot
ds_journaldepot = create datastore
ds_journaldepot.dataobject = "d_journdepotimp"
ds_journaldepot.SetTransObject(SQLCA)

ds_journaldepot.object.datedepot.text = string(idt_end)

if lb_hidedepositsheader then
	ds_journaldepot.object.orthonom.visible = 0
	ds_journaldepot.object.t_bank.visible = 0
	ds_journaldepot.object.banque.visible = 0
	ds_journaldepot.object.t_current.visible = 0
	ds_journaldepot.object.compte.visible = 0
	ds_journaldepot.object.rr_1.visible = 0
end if

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
ds_journaldepot.object.paiement.values = gf_method(v_langue)
//ds_journaldepot.retrieve(v_no_ortho,il_idlot)
if ls_option = '3' then
	uf_remplirdepot(ds_journaldepot)
	ds_journaldepot.setFilter("paiement = 'C' or paiement = 'P'")
	ds_journaldepot.filter()
	gb_datawindow = false
	openwithparm(w_print_options,ds_journaldepot)
	uf_remplirdepot(ds_journaldepot)
	ds_journaldepot.setFilter("paiement <> 'C' and paiement <> 'P'")
	ds_journaldepot.filter()
	ds_journaldepot.print()

else
	uf_remplirdepot(ds_journaldepot)
	gb_datawindow = false
	openwithparm(w_print_options,ds_journaldepot)
end if
ds_journaldepot = message.powerobjectparm
destroy ds_journaldepot

//impression du type de sommaire desire
datastore ds_journal_depot
ds_journal_depot = create datastore

choose case ls_option 
	case '1','3'
		ds_journal_depot.dataobject = "d_journsom1"
		
		if lb_hidedepositsheader then
			ds_journal_depot.object.orthonom.visible = 0
			ds_journal_depot.object.t_bank.visible = 0
			ds_journal_depot.object.banque.visible = 0
			ds_journal_depot.object.t_current.visible = 0
			ds_journal_depot.object.compte.visible = 0
			ds_journal_depot.object.rr_1.visible = 0
		end if
		
		if v_langue = 'an' then
			ds_journal_depot.object.t_bank.text = 'Bank'
			ds_journal_depot.object.t_current.text = 'Currant account'
			ds_journal_depot.object.t_search.text = 'Parameter dates from research'
			ds_journal_depot.object.t_datedepot.text = 'DEPOSIT DATE:'
//			ds_journal_depot.object.t_to.text = 'to'
//			ds_journal_depot.object.t_summary.text = 'Deposit summary'
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
	case '2'
		ds_journal_depot.dataobject = "d_journsom2"
		
		if lb_hidedepositsheader then
			ds_journal_depot.object.orthonom.visible = 0
			ds_journal_depot.object.adresse.visible = 0
			ds_journal_depot.object.t_bank.visible = 0
			ds_journal_depot.object.banque.visible = 0
			ds_journal_depot.object.t_current.visible = 0
			ds_journal_depot.object.compte.visible = 0
			ds_journal_depot.object.rr_1.visible = 0
			ds_journal_depot.object.compute_6.visible = 0
			ds_journal_depot.object.telbur.visible = 0
		end if
		
		if v_langue = 'an' then
			ds_journal_depot.object.t_bank.text = 'Bank'
			ds_journal_depot.object.t_current.text = 'Currant account'
			ds_journal_depot.object.t_search.text = 'Parameter dates from research'
			ds_journal_depot.object.t_datedepot.text = 'DEPOSIT DATE:'
//			ds_journal_depot.object.t_to.text = 'to'
	//		ds_journal_depot.object.t_summary.text = 'Deposit summary'
//			ds_journal_depot.object.t_soustotcpd.text = 'Sub-total postdated cheques:'
			ds_journal_depot.object.t_soustotcheque.text = 'Sub-total cheques:'
	//		ds_journal_depot.object.t_totcheque.text = 'Total cheques:'
			ds_journal_depot.object.t_totinteract.text = 'Total Interac:'
			ds_journal_depot.object.t_totcash.text = 'Total cash:'
			ds_journal_depot.object.t_soustot.text = 'Sub-total:'
			ds_journal_depot.object.t_tot.text = 'Total of the deposit:'
	//		ds_journal_depot.object.t_soustotdebit.text = 'Sub-total debited:'
			ds_journal_depot.object.t_detail.text = 'Details:'
			ds_journal_depot.object.t_qty.text = 'Quantity:'
		end if
case '4'
		ds_journal_depot.dataobject = "d_journsom4"
		
		if lb_hidedepositsheader then
			ds_journal_depot.object.orthonom.visible = 0
			ds_journal_depot.object.adresse.visible = 0
			ds_journal_depot.object.t_bank.visible = 0
			ds_journal_depot.object.banque.visible = 0
			ds_journal_depot.object.t_current.visible = 0
			ds_journal_depot.object.compte.visible = 0
			ds_journal_depot.object.rr_1.visible = 0
			ds_journal_depot.object.compute_6.visible = 0
			ds_journal_depot.object.telbur.visible = 0
		end if
		
		if v_langue = 'an' then
			ds_journal_depot.object.t_bank.text = 'Bank'
			ds_journal_depot.object.t_current.text = 'Currant account'
			ds_journal_depot.object.t_search.text = 'Parameter dates from research'
			ds_journal_depot.object.datedepot.text = 'DEPOSIT DATE:'
			ds_journal_depot.object.t_soustotcheque.text = 'Total cheques:'
			ds_journal_depot.object.t_totinteract.text = 'Total Interac:'
			ds_journal_depot.object.t_totcash.text = 'Total cash:'
			ds_journal_depot.object.t_soustot.text = 'Sub-total:'
			ds_journal_depot.object.t_tot.text = 'Total of the deposit:'
			ds_journal_depot.object.t_detail.text = 'Details:'
			ds_journal_depot.object.t_qty.text = 'Quantity:'
		end if
end choose



ds_journal_depot.SetTransObject(SQLCA)
ds_journal_depot.object.datedepot.text = string(idt_end)
//ds_journal_depot.object.t_sat.text = is_sat
//ds_journal_depot.setfilter(is_satfilter)
uf_remplirdepot(ds_journal_depot)
//ds_journal_depot.retrieve(v_no_ortho,il_idlot)
ds_journal_depot.print()
destroy ds_journal_depot
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.Text = "Print"
end if
end event

type dw_lotdetail from u_dw within w_lotdetail
event ue_remplir ( long al_lot )
integer x = 14
integer width = 3575
integer height = 1924
integer taborder = 50
string title = "lotdetail"
string dataobject = "d_lotdet"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_remplir(long al_lot);/****************************************************
Créé le: 13-08-2004
Par: Dave Tremblay
Modifié le: 13-08-2004
Par: Dave Tremblay
Ver: 7.8.4

Cette from fonction permet d'entrer le journal de dépôt
*****************************************************/

long ll_paieid, ll_cheque, ll_ind, ll_ortho, ll_sat, ll_row, ll_idlot, ll_cpd
long ll_cpdid
date ldt_datepaie, ldt_datepaie1
string ls_drnom, ls_modpaie, ls_prenom, ls_nom, ls_newdoss, ls_compte
string ls_banque
dec{2} ld_montant
 
dw_lotdetail.setRedraw(false)
dw_lotdetail.reset()
select delpondepot into :ll_cpd from t_options where ortho_id = :v_no_ortho;

// On ajoute les paiements normaux
DECLARE journal CURSOR FOR
  SELECT DISTINCT ortho_id.dr_nom_complet,
			paiement.paiement_id,  
         paiement.date_paiement,   
         paiement.montant_recu,
         paiement.paiement,
			paiement.nocheque,
			paiement.ind,
			paiement.id_lot,
         patient.no_ortho,
         patient.patient_prenom,
         patient.patient_nom,
			patient.new_dossier,
			patient.id_satellite,
         ortho_id.dr_compte,
         ortho_id.dr_banque
    FROM traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
							INNER JOIN paiement ON  traitements.traitement_id = paiement.traitement_patient_id,
			patient		INNER JOIN ortho_id ON patient.no_ortho = ortho_id.ortho_id
   WHERE paiement.id_lot = :al_lot and
			patient.no_ortho = :v_no_ortho;

OPEN journal;

FETCH journal INTO :ls_drnom,
						 :ll_paieid,
						 :ldt_datepaie1,
						 :ld_montant,
						 :ls_modpaie,
						 :ll_cheque,
						 :ll_ind,
						 :ll_idlot,
						 :ll_ortho,
						 :ls_prenom,
						 :ls_nom,
						 :ls_newdoss,
						 :ll_sat,
						 :ls_compte,
						 :ls_banque;					 
DO WHILE SQLCA.SQLCode = 0
	ll_row = dw_lotdetail.insertRow(0)
	if ll_cpd = 1 then
		choose case ls_modpaie
			case 'P'
				ls_modpaie = 'C'
			case 'pVisa'
				ls_modpaie = 'Visa'
			case 'pMC'
				ls_modpaie = 'MC'
			case 'pAmex'
				ls_modpaie = 'AmEx'
		end choose
	end if
	dw_lotdetail.setItem(ll_row,"paiement",ls_modpaie)
	dw_lotdetail.setItem(ll_row,"nom", ls_nom)
	dw_lotdetail.setItem(ll_row,"prenom", ls_prenom)
	dw_lotdetail.setItem(ll_row,"nocheque",ll_cheque)
	dw_lotdetail.setItem(ll_row,"datepaie",ldt_datepaie1)
	dw_lotdetail.setItem(ll_row,"ind",ll_ind)
	dw_lotdetail.setItem(ll_row,"montant",ld_montant)
	dw_lotdetail.setItem(ll_row,"id_lot",ll_idlot)
	dw_lotdetail.setItem(ll_row,"id_paiement",ll_paieid)
	dw_lotdetail.setItem(ll_row,'type',"P")
	dw_lotdetail.setItem(ll_row,'orthoid',ll_ortho)
	FETCH journal INTO :ls_drnom,
						 :ll_paieid,
						 :ldt_datepaie1,
						 :ld_montant,
						 :ls_modpaie,
						 :ll_cheque,
						 :ll_ind,
						 :ll_idlot,
						 :ll_ortho,
						 :ls_prenom,
						 :ls_nom,
						 :ls_newdoss,
						 :ll_sat,
						 :ls_compte,
						 :ls_banque;
LOOP

CLOSE journal;

// On ajoute les cheques postdates avec le lot

DECLARE CPD CURSOR FOR
	  SELECT ortho_id.dr_nom_complet,
			cheques_postdates.cheques_postdates_id,
			cheques_postdates.date_cheque, 
			cheques_postdates.paiement, 
			cheques_postdates.modalite,
			cheques_postdates.nocheque,
			cheques_postdates.id_lot,
			cheques_postdates.ind,
			patient.no_ortho,   
			patient.patient_prenom,   
			patient.patient_nom,
			patient.id_satellite,
			patient.new_dossier,  
			ortho_id.dr_compte,   
			ortho_id.dr_banque  
	 FROM traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
							INNER JOIN cheques_postdates ON  traitements.traitement_id = cheques_postdates.traitement_patient_id,
			patient		INNER JOIN ortho_id ON patient.no_ortho = ortho_id.ortho_id
	WHERE cheques_postdates.id_lot = :al_lot and
			cheques_postdates.indicateur <> '1' and
			patient.no_ortho = :v_no_ortho;

OPEN CPD;

FETCH CPD INTO :ls_drnom,
					:ll_cpdid,
					:ldt_datepaie1,
					:ld_montant,
					:ls_modpaie,
					:ll_cheque,
					:ll_idlot,
					:ll_ind,
					:ll_ortho,
					:ls_prenom,
					:ls_nom,
					:ll_sat,
					:ls_newdoss,
					:ls_compte,
					:ls_banque;
					
DO WHILE SQLCA.SQLCode = 0 
	
	ll_row = dw_lotdetail.insertRow(0)
	if ll_cpd = 1 then
		choose case ls_modpaie
			case 'P'
				ls_modpaie = 'C'
			case 'pVisa'
				ls_modpaie = 'Visa'
			case 'pMC'
				ls_modpaie = 'MC'
			case 'pAmex'
				ls_modpaie = 'AmEx'
		end choose
	end if
	dw_lotdetail.setItem(ll_row,"paiement",ls_modpaie)
	dw_lotdetail.setItem(ll_row,"nom", ls_nom)
	dw_lotdetail.setItem(ll_row,"prenom", ls_prenom)
	dw_lotdetail.setItem(ll_row,"nocheque",ll_cheque)
	dw_lotdetail.setItem(ll_row,"datepaie",ldt_datepaie1)
	dw_lotdetail.setItem(ll_row,"ind",ll_ind)
	dw_lotdetail.setItem(ll_row,"montant",ld_montant)
	dw_lotdetail.setItem(ll_row,"id_lot",ll_idlot)
	dw_lotdetail.setItem(ll_row,"id_paiement",ll_cpdid)
	dw_lotdetail.setItem(ll_row,'type',"C")
	dw_lotdetail.setItem(ll_row,'orthoid',ll_ortho)
	FETCH CPD INTO :ls_drnom,
					:ll_cpdid, 
					:ldt_datepaie1,
					:ld_montant,
					:ls_modpaie,
					:ll_cheque,
					:ll_idlot,
					:ll_ind,
					:ll_ortho,
					:ls_prenom,
					:ls_nom,
					:ll_sat,
					:ls_newdoss,
					:ls_compte,
					:ls_banque;
LOOP

CLOSE CPD;

setfilter("paiement = '$' or paiement = 'C' or paiement = 'Visa' or paiement = 'MC' or paiement = 'PD' or paiement = 'P' or paiement = 'AmEx'or paiement = 'pVisa'or paiement = 'pMC'or paiement = 'pAmex' or paiement = 'trans'" )
filter()
setsort('paiement A,nom A,prenom A')
sort()
groupcalc()
dw_lotdetail.setRedraw(true)
end event

event constructor;SetTransObject(SQLCA)
//dw_lotdetail.object.datawindow.print.preview = 'yes'
if v_langue = 'an' then
	dw_lotdetail.object.t_title.text = 'DEPOSIT REPORT'
	dw_lotdetail.object.t_search.text = 'Search parameter'
	dw_lotdetail.object.b_patnom.text = 'Patient name'
	dw_lotdetail.object.b_nocheque.text = 'Cheque #'
	dw_lotdetail.object.b_montant.text = 'Amount'
	dw_lotdetail.object.t_subtotal.text = 'Sub-total'
	dw_lotdetail.object.t_printedon.text = 'Printed on'
	dw_lotdetail.object.t_qty.text = 'Qty'
end if
dw_lotdetail.object.paiement.values = gf_method(v_langue)
end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

event buttonclicked;setRedraw(false)
CHOOSE CASE dwo.name 
	CASE 'b_patnom'
		setsort('paiement A,nom A,prenom A')
		sort()		
	CASE 'b_nocheque'
		setsort('paiement A,nocheque A,nom A,prenom A')
		sort()
	CASE 'b_date'
		setsort('paiement A,datepaie A,nom A,prenom A')
		sort()
	CASE 'b_montant'
		setsort('paiement A,montant A,nom A,prenom A')
		sort()
END CHOOSE
groupcalc()
setRedraw(true)
end event

