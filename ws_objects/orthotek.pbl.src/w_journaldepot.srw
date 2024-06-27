$PBExportHeader$w_journaldepot.srw
forward
global type w_journaldepot from w_child
end type
type st_deselect from statictext within w_journaldepot
end type
type st_select from statictext within w_journaldepot
end type
type cbx_bordereau from checkbox within w_journaldepot
end type
type cb_print from commandbutton within w_journaldepot
end type
type dw_sat from uo_sat within w_journaldepot
end type
type em_datedepot from editmask within w_journaldepot
end type
type st_1 from statictext within w_journaldepot
end type
type cb_3 from commandbutton within w_journaldepot
end type
type cb_find from commandbutton within w_journaldepot
end type
type cb_printsave from commandbutton within w_journaldepot
end type
type dw_journaldepot from u_dw within w_journaldepot
end type
end forward

global type w_journaldepot from w_child
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
st_deselect st_deselect
st_select st_select
cbx_bordereau cbx_bordereau
cb_print cb_print
dw_sat dw_sat
em_datedepot em_datedepot
st_1 st_1
cb_3 cb_3
cb_find cb_find
cb_printsave cb_printsave
dw_journaldepot dw_journaldepot
end type
global w_journaldepot w_journaldepot

type variables
private long il_idlot
private boolean ib_skipscroll
private integer ii_row
private string is_satfilter = '' , is_sat = ''
private boolean change = false
end variables

forward prototypes
public subroutine if_p2c ()
public subroutine uf_checkallbox ()
public subroutine uf_setlot ()
public subroutine uf_printlot ()
public subroutine uf_remplirdepot (datastore dso)
public subroutine uf_traduction ()
end prototypes

public subroutine if_p2c ();integer i,li_option

dw_journaldepot.setredraw(false)
select delpondepot into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	for i = 1 to dw_journaldepot.rowcount()
		if dw_journaldepot.getitemstring(i,'paiement_paiement') = 'P' then
			dw_journaldepot.setitem(i,'paiement_paiement','C')
		end if
	next
end if
dw_journaldepot.setredraw(true)
end subroutine

public subroutine uf_checkallbox ();long z
integer li_option
select isnull(cochedepot,0) into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	SetRedraw(false)
//	select delpondepot into :li_option from t_options where ortho_id = :v_no_ortho;
	for z = 1 to dw_journaldepot.rowcount()
		dw_journaldepot.setitem(z,'ind',1)
	next
	SetRedraw(true)
end if
end subroutine

public subroutine uf_setlot ();long i,li_nbrow
long ll_paieid, ll_id
string ls_type
date ldt_depot

ldt_depot = date(em_datedepot.text)
dw_journaldepot.accepttext()
insert into t_lot(id_lot,ortho_id,lotdate,lotheure) values(:il_idlot,:v_no_ortho,:ldt_depot,Now());
if error_type(-1) = 1 then
	for i = 1 to dw_journaldepot.rowcount() 
		if dw_journaldepot.getitemnumber(i,'ind') = 1 then
			ll_id = dw_journaldepot.getItemNumber(i,'paiement_id')
			if dw_journaldepot.getitemString(i,'flag') = 'P' then
				update paiement set id_lot = :il_idlot where paiement_id = :ll_id;
			else
				update cheques_postdates set id_lot = :il_idlot where cheques_postdates_id = :ll_id;
			end if
			error_type(-1)
		end if
	next
end if
end subroutine

public subroutine uf_printlot ();integer li_bac,li_copies
string ls_option,ls_collate
date ldt_datedepot
datastore ds_journaldepot, ds_impdata
boolean lb_hidedepositheader

select somdepot into :ls_option from t_options where ortho_id = :v_no_ortho;

// Initialisation de la datastore
ds_journaldepot = create datastore
ds_journaldepot.dataobject = "d_journdepotimp"
ds_journaldepot.SetTransObject(SQLCA)

// Récupération des informations d'impression
gb_datawindow = false
gi_imp = 1
gb_imp = false
openwithparm(w_print_options,ds_journaldepot)
ds_impdata = message.powerobjectparm

if isNull(ds_impdata) then return

//impression du lot

ldt_datedepot = date(em_datedepot.text)
ds_journaldepot.object.datedepot.text = string(ldt_datedepot)

if not cbx_bordereau.checked then
	if v_langue = 'an' then
		ds_journaldepot.object.t_bank.text = 'Bank'
		ds_journaldepot.object.t_current.text = 'Current account'
		ds_journaldepot.object.t_search.text = 'Search parameter'
		ds_journaldepot.object.t_datedepot.text = 'DEPOSIT DATE:'
		ds_journaldepot.object.t_lot.text = 'LOT #:'
		ds_journaldepot.object.t_patnom.text = 'Patient name'
		ds_journaldepot.object.t_dossier.text = "Patient's file"
		ds_journaldepot.object.t_nocheque.text = 'Cheque #'
		ds_journaldepot.object.t_montant.text = 'Amount'
		ds_journaldepot.object.t_subtotal.text = 'Sub-total'
		ds_journaldepot.object.t_printedon.text = 'Printed on'
		ds_journaldepot.object.t_qty.text = 'Qty'
	end if
	
	if lb_hidedepositheader then
		ds_journaldepot.object.orthonom.visible = 0
		ds_journaldepot.object.t_bank.visible = 0
		ds_journaldepot.object.banque.visible = 0
		ds_journaldepot.object.t_current.visible = 0
		ds_journaldepot.object.compte.visible = 0
		ds_journaldepot.object.rr_1.visible = 0
	end if
	
	ds_journaldepot.object.paiement.values = gf_method(v_langue)
	ds_journaldepot.object.paiement_paiement_1.values = gf_method(v_langue)
	
	ds_journaldepot.object.datawindow.print.PrinterName = ds_impdata.object.datawindow.print.PrinterName
	ds_journaldepot.object.datawindow.print.Paper.Source = ds_impdata.object.datawindow.print.Paper.Source
	ds_journaldepot.object.datawindow.print.collate = ds_impdata.object.datawindow.print.collate
	ds_journaldepot.object.datawindow.print.copies = ds_impdata.object.datawindow.print.copies
	ds_journaldepot.object.datawindow.print.margin.top = ds_impdata.object.datawindow.print.margin.top
	ds_journaldepot.object.datawindow.print.margin.left = ds_impdata.object.datawindow.print.margin.left
	ds_journaldepot.object.datawindow.print.page.range = ds_impdata.object.datawindow.print.page.range
	
	if ls_option = '3' then
		uf_remplirdepot(ds_journaldepot)
		ds_journaldepot.setFilter("paiement = 'C' or paiement = 'P'")
		ds_journaldepot.filter()
		ds_journaldepot.print()
//		uf_remplirdepot(ds_journaldepot)
		ds_journaldepot.setFilter("paiement <> 'C' and paiement <> 'P'")
		ds_journaldepot.filter()
		ds_journaldepot.print()
	else
		uf_remplirdepot(ds_journaldepot)
		ds_journaldepot.print()
	end if
end if

//impression du type de sommaire desire
choose case ls_option 
	case '1', '3'
		ds_journaldepot.dataobject = "d_journsom1"
		if v_langue = 'an' then
			ds_journaldepot.object.t_bank.text = 'Bank'
			ds_journaldepot.object.t_current.text = 'Current account'
			ds_journaldepot.object.t_search.text = 'Search parameter'
			ds_journaldepot.object.t_datedepot.text = 'DEPOSIT DATE:'
			ds_journaldepot.object.t_lot.text = 'LOT #:'
			ds_journaldepot.object.t_soustotcpd.text = 'Sub-total postdated cheques:'
			ds_journaldepot.object.t_soustotcheque.text = 'Sub-total cheques:'
			ds_journaldepot.object.t_totcheque.text = 'Total cheques:'
			ds_journaldepot.object.t_totinteract.text = 'Total Interac:'
			ds_journaldepot.object.t_totcash.text = 'Total cash:'
			ds_journaldepot.object.t_soustot.text = 'Sub-total:'
			ds_journaldepot.object.t_tot.text = 'Total of the deposit:'
			ds_journaldepot.object.t_soustotdebit.text = 'Sub-total debited:'
			ds_journaldepot.object.t_detail.text = 'Details:'
			ds_journaldepot.object.t_qty.text = 'Quantity:'
			ds_journaldepot.object.t_printedon.text = 'Printed on'
		end if
		
		if lb_hidedepositheader then
			ds_journaldepot.object.orthonom.visible = 0
			ds_journaldepot.object.t_bank.visible = 0
			ds_journaldepot.object.banque.visible = 0
			ds_journaldepot.object.t_current.visible = 0
			ds_journaldepot.object.compte.visible = 0
			ds_journaldepot.object.rr_1.visible = 0
		end if
		
	case '2'
		ds_journaldepot.dataobject = "d_journsom2"
		if v_langue = 'an' then
			ds_journaldepot.object.t_bank.text = 'Bank'
			ds_journaldepot.object.t_current.text = 'Current account'
			ds_journaldepot.object.t_search.text = 'Search parameter'
			ds_journaldepot.object.t_datedepot.text = 'DEPOSIT DATE:'
			ds_journaldepot.object.t_lot.text = 'LOT #:'
			ds_journaldepot.object.t_soustotcheque.text = 'Total cheques:'
			ds_journaldepot.object.t_totinteract.text = 'Total Interac:'
			ds_journaldepot.object.t_totcash.text = 'Total cash:'
			ds_journaldepot.object.t_soustot.text = 'Sub-total:'
			ds_journaldepot.object.t_tot.text = 'Total of the deposit:'
			ds_journaldepot.object.t_detail.text = 'Details:'
			ds_journaldepot.object.t_qty.text = 'Quantity:'
			ds_journaldepot.object.t_printedon.text = 'Printed on'
		end if
		
		if lb_hidedepositheader then
			ds_journaldepot.object.orthonom.visible = 0
			ds_journaldepot.object.t_bank.visible = 0
			ds_journaldepot.object.banque.visible = 0
			ds_journaldepot.object.t_current.visible = 0
			ds_journaldepot.object.compte.visible = 0
			ds_journaldepot.object.rr_1.visible = 0
		end if
	
	case '4'
		ds_journaldepot.dataobject = "d_journsom4"
		if v_langue = 'an' then
			ds_journaldepot.object.t_bank.text = 'Bank'
			ds_journaldepot.object.t_current.text = 'Current account'
			ds_journaldepot.object.t_search.text = 'Search parameter'
			ds_journaldepot.object.t_datedepot.text = 'DEPOSIT DATE:'
			ds_journaldepot.object.t_lot.text = 'LOT #:'
			ds_journaldepot.object.t_soustotcheque.text = 'Total cheques:'
			ds_journaldepot.object.t_totinteract.text = 'Total Interac:'
			ds_journaldepot.object.t_totcash.text = 'Total cash:'
			ds_journaldepot.object.t_soustot.text = 'Sub-total:'
			ds_journaldepot.object.t_tot.text = 'Total of the deposit:'
			ds_journaldepot.object.t_detail.text = 'Details:'
			ds_journaldepot.object.t_qty.text = 'Quantity:'
			ds_journaldepot.object.t_printedon.text = 'Printed on'
		end if
		
			if lb_hidedepositheader then
				ds_journaldepot.object.orthonom.visible = 0
				ds_journaldepot.object.t_bank.visible = 0
				ds_journaldepot.object.banque.visible = 0
				ds_journaldepot.object.t_current.visible = 0
				ds_journaldepot.object.compte.visible = 0
				ds_journaldepot.object.rr_1.visible = 0
			end if
			
	case '5'
		ds_journaldepot.dataobject = "d_journsom3"
		if v_langue = 'an' then
			ds_journaldepot.object.t_bank.text = 'Bank'
			ds_journaldepot.object.t_current.text = 'Current account'
			ds_journaldepot.object.t_search.text = 'Search parameter'
			ds_journaldepot.object.t_datedepot.text = 'DEPOSIT DATE:'
			ds_journaldepot.object.t_lot.text = 'LOT #:'
			ds_journaldepot.object.t_soustotcpd.text = 'Sub-total postdated cheques:'
			ds_journaldepot.object.t_soustotcheque.text = 'Sub-total cheques:'
			ds_journaldepot.object.t_totcheque.text = 'Total cheques:'
			ds_journaldepot.object.t_totinteract.text = 'Total Interac:'
			ds_journaldepot.object.t_totcash.text = 'Total cash:'
			ds_journaldepot.object.t_soustot.text = 'Sub-total:'
			ds_journaldepot.object.t_tot.text = 'Total of the deposit:'
			ds_journaldepot.object.t_soustotdebit.text = 'Sub-total debited:'
			ds_journaldepot.object.t_detail.text = 'Details:'
			ds_journaldepot.object.t_qty.text = 'Quantity:'
			ds_journaldepot.object.t_printedon.text = 'Printed on'
		end if
		
		if lb_hidedepositheader then
			ds_journaldepot.object.orthonom.visible = 0
			ds_journaldepot.object.t_bank.visible = 0
			ds_journaldepot.object.banque.visible = 0
			ds_journaldepot.object.t_current.visible = 0
			ds_journaldepot.object.compte.visible = 0
			ds_journaldepot.object.rr_1.visible = 0
		end if
end choose

ds_journaldepot.object.datedepot.text = string(ldt_datedepot)
uf_remplirdepot(ds_journaldepot)

ds_journaldepot.object.datawindow.print.PrinterName = ds_impdata.object.datawindow.print.PrinterName
ds_journaldepot.object.datawindow.print.Paper.Source = ds_impdata.object.datawindow.print.Paper.Source
ds_journaldepot.object.datawindow.print.collate = ds_impdata.object.datawindow.print.collate
ds_journaldepot.object.datawindow.print.copies = ds_impdata.object.datawindow.print.copies
ds_journaldepot.object.datawindow.print.margin.top = ds_impdata.object.datawindow.print.margin.top
ds_journaldepot.object.datawindow.print.margin.left = ds_impdata.object.datawindow.print.margin.left
ds_journaldepot.object.datawindow.print.page.range = ds_impdata.object.datawindow.print.page.range
ds_journaldepot.print()

destroy ds_journaldepot
destroy ds_impdata

end subroutine

public subroutine uf_remplirdepot (datastore dso);/****************************************************
Créé le: 13-08-2004
Par: Dave Tremblay
Modifié le: 13-08-2004
Par: Dave Tremblay
Ver: 7.8.4

Cette fonction permet d'entrer le journal de dépôt
*****************************************************/

long ll_paieid, ll_cheque, ll_ind, ll_ortho, ll_sat, ll_row, ll_idlot, ll_cpd
long ll_cpdid
date ldt_datepaie, ldt_datepaie1
string ls_drnom, ls_modpaie, ls_prenom, ls_nom, ls_newdoss, ls_compte
string ls_banque
dec{2} ld_montant

dso.reset()
 
ldt_datepaie = date(em_datedepot.text) 
select delpondepot into :ll_cpd from t_options where ortho_id = :v_no_ortho;

dso.object.t_sat.text = dw_journaldepot.object.t_sat.text

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
	dso.setItem(ll_row,"new_dossier", ls_newdoss)
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
	dso.setItem(ll_row,"paiement",'C')
	dso.setItem(ll_row,"nom", ls_nom)
	dso.setItem(ll_row,"prenom", ls_prenom)
	dso.setItem(ll_row,"new_dossier", ls_newdoss)
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

dso.setfilter("paiement = '$' or paiement = 'C' or paiement = 'Visa' or paiement = 'MC' or paiement = 'PD' or paiement = 'P' or paiement = 'AmEx' or paiement = 'pVisa' or paiement = 'pMC' or paiement = 'pAmex' or paiement = 'trans'" )
dso.filter()
dso.setsort('paiement A, datepaie A, nom A, prenom A')
dso.sort() 
dso.groupcalc()
end subroutine

public subroutine uf_traduction ();if v_langue = 'an' then
	cb_3.Text = "Close"
	cb_find.Text = "Search"
	cb_print.text = "Print"
	cb_printsave.Text = "Print and save"
	cbx_bordereau.text = "Print only the slip"
	st_1.Text = "Deposit date:"
	st_deselect.text = 'Unselect All'
	st_select.text = 'Select All'
	
	dw_journaldepot.object.t_title.text = 'DEPOSIT REPORT'
	dw_journaldepot.object.t_search.text = 'Search parameter'
	dw_journaldepot.object.t_datedepot.text = 'DEPOSIT DATE:'
	dw_journaldepot.object.t_lot.text = 'LOT #:'
	dw_journaldepot.object.b_patnom.text = 'Patient name'
	dw_journaldepot.object.b_nocheque.text = 'Cheque #'
	dw_journaldepot.object.b_dossier.text = 'File #'
	dw_journaldepot.object.b_montant.text = 'Amount'
	dw_journaldepot.object.t_subtotal.text = 'Sub-total'
	dw_journaldepot.object.t_printedon.text = 'Printed on'
	dw_journaldepot.object.t_qty.text = 'Qty'
	dw_journaldepot.object.t_qty2.text = "Qty"
end if

end subroutine

on w_journaldepot.create
int iCurrent
call super::create
this.st_deselect=create st_deselect
this.st_select=create st_select
this.cbx_bordereau=create cbx_bordereau
this.cb_print=create cb_print
this.dw_sat=create dw_sat
this.em_datedepot=create em_datedepot
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_find=create cb_find
this.cb_printsave=create cb_printsave
this.dw_journaldepot=create dw_journaldepot
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_deselect
this.Control[iCurrent+2]=this.st_select
this.Control[iCurrent+3]=this.cbx_bordereau
this.Control[iCurrent+4]=this.cb_print
this.Control[iCurrent+5]=this.dw_sat
this.Control[iCurrent+6]=this.em_datedepot
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_find
this.Control[iCurrent+10]=this.cb_printsave
this.Control[iCurrent+11]=this.dw_journaldepot
end on

on w_journaldepot.destroy
call super::destroy
destroy(this.st_deselect)
destroy(this.st_select)
destroy(this.cbx_bordereau)
destroy(this.cb_print)
destroy(this.dw_sat)
destroy(this.em_datedepot)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_find)
destroy(this.cb_printsave)
destroy(this.dw_journaldepot)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

select max(id_lot) into :il_idlot from t_lot where ortho_id = :v_no_ortho;
if isnull(il_idlot) then 
	il_idlot = 1
else
	il_idlot = il_idlot + 1
end if
end event

type st_deselect from statictext within w_journaldepot
integer x = 507
integer y = 1856
integer width = 553
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 134217739
string text = "Desélectionner tout "
boolean focusrectangle = false
end type

event clicked;long i

for i = 1 to dw_journaldepot.rowcount()
	dw_journaldepot.setItem(i,'ind',0)
next
change = true
end event

type st_select from statictext within w_journaldepot
integer y = 1856
integer width = 480
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 134217739
string text = "Sélectionner tout "
boolean focusrectangle = false
end type

event clicked;long i

for i = 1 to dw_journaldepot.rowcount()
	dw_journaldepot.setItem(i,'ind',1)
next
change = true
end event

type cbx_bordereau from checkbox within w_journaldepot
integer x = 2601
integer y = 1852
integer width = 992
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imprimer seulement le bordereau"
end type

type cb_print from commandbutton within w_journaldepot
integer x = 1042
integer y = 1928
integer width = 521
integer height = 108
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_journaldepot)
end event

type dw_sat from uo_sat within w_journaldepot
integer x = 2103
integer taborder = 40
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	is_satfilter = ''
	dw_journaldepot.setFilter(is_satfilter)
	dw_journaldepot.filter()
	is_sat = ''
else
	is_satfilter = "id_satellite = " + string(il_idsat)
	dw_journaldepot.setFilter(is_satfilter)
	dw_journaldepot.filter()
	dw_journaldepot.GroupCalc()
	dw_journaldepot.SetFocus()
	select lieu into :is_sat from t_satellites where id_satellite = :il_idsat;
end if
dw_journaldepot.object.t_sat.text = is_sat
end event

event constructor;call super::constructor;integer li_option

select compsat into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	visible = true 
else
	visible = false
end if
end event

type em_datedepot from editmask within w_journaldepot
integer x = 2546
integer y = 1932
integer width = 425
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
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean autoskip = true
boolean dropdowncalendar = true
end type

event constructor;em_datedepot.text = string(today())
end event

type st_1 from statictext within w_journaldepot
integer x = 2094
integer y = 1944
integer width = 421
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

type cb_3 from commandbutton within w_journaldepot
integer x = 2985
integer y = 1928
integer width = 608
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
	dw_journaldepot.event ue_update()
end if
Close(parent)
end event

type cb_find from commandbutton within w_journaldepot
integer x = 1568
integer y = 1928
integer width = 521
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;date datedepot
string ls_comptant

SetPointer(HourGlass!)
dw_journaldepot.setTransObject(SQLCA)
datedepot = date(em_datedepot.text)
dw_journaldepot.retrieve(v_no_ortho,datedepot)
dw_journaldepot.object.datedepot.text = string(datedepot)
uf_checkallbox()
SetPointer(Arrow!)
end event

type cb_printsave from commandbutton within w_journaldepot
integer y = 1928
integer width = 1038
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer le lot et sauvegarder"
end type

event clicked;//creation du lot
uf_setlot()
//impression du lot
uf_printlot()
close(parent)
end event

type dw_journaldepot from u_dw within w_journaldepot
event ue_remplir ( )
event ue_update ( )
integer x = 14
integer y = 104
integer width = 3575
integer height = 1732
integer taborder = 50
string title = "d_journaldepot"
string dataobject = "d_journdepot"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_remplir();/****************************************************
Créé le: 13-08-2004
Par: Dave Tremblay
Modifié le: 13-08-2004
Par: Dave Tremblay
Ver: 7.8.4

Cette from fonction permet d'entrer le journal de dépôt
*****************************************************/

long ll_paieid, ll_cheque, ll_ind, ll_ortho, ll_sat, ll_row, ll_idlot, ll_cpd
long ll_cpdid,li_ortho
date ldt_datepaie, ldt_datepaie1
string ls_drnom, ls_modpaie, ls_prenom, ls_nom, ls_newdoss, ls_compte
string ls_banque
dec{2} ld_montant
 
ldt_datepaie = date(em_datedepot.text) 
dw_journaldepot.reset()
dw_journaldepot.setRedraw(false)
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
			paiement.id_satellite,
         ortho_id.dr_compte,
         ortho_id.dr_banque,
			patient.no_ortho
    FROM traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
							INNER JOIN paiement ON  traitements.traitement_id = paiement.traitement_patient_id,
			patient		INNER JOIN ortho_id ON patient.no_ortho = ortho_id.ortho_id
   WHERE patient.no_ortho = :v_no_ortho AND
         paiement.date_paiement <= :ldt_datepaie AND
			isnull(paiement.id_lot,0) <= 0 AND
			paiement.cache <> 1;

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
						 :ls_banque,
						 :li_ortho;					 
DO WHILE SQLCA.SQLCode = 0
	ll_row = dw_journaldepot.insertRow(0)
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
	dw_journaldepot.setItem(ll_row,"paiement",ls_modpaie)
	dw_journaldepot.setItem(ll_row,"nom", ls_nom)
	dw_journaldepot.setItem(ll_row,"prenom", ls_prenom)
	dw_journaldepot.setItem(ll_row,"nocheque",ll_cheque)
	dw_journaldepot.setItem(ll_row,"datepaie",ldt_datepaie1)
	dw_journaldepot.setItem(ll_row,"ind",ll_ind)
	dw_journaldepot.setItem(ll_row,"montant",ld_montant)
	dw_journaldepot.setItem(ll_row,"id_lot",ll_idlot)
	dw_journaldepot.setItem(ll_row,"id_paiement",ll_paieid)
	dw_journaldepot.setItem(ll_row,'type',"P")
	dw_journaldepot.setItem(ll_row,'id_satellite', ll_sat)
	dw_journaldepot.setItem(ll_row,'orthoid',li_ortho)
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
						 :ls_banque,
						 :li_ortho;
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
			cheques_postdates.id_satellite,
			patient.new_dossier,
			ortho_id.dr_compte,
			ortho_id.dr_banque,
			patient.no_ortho
	 FROM traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
							INNER JOIN cheques_postdates ON  traitements.traitement_id = cheques_postdates.traitement_patient_id,
			patient		INNER JOIN ortho_id ON patient.no_ortho = ortho_id.ortho_id
	WHERE patient.no_ortho = :v_no_ortho AND
			cheques_postdates.date_cheque <= :ldt_datepaie AND
			(cheques_postdates.indicateur <> '1' or cheques_postdates.indicateur is null) AND
			isnull(cheques_postdates.id_lot,0) <= 0;
			
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
					:ls_banque,
					:li_ortho;
					
DO WHILE SQLCA.SQLCode = 0 
	
	ll_row = dw_journaldepot.insertRow(0)
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
	dw_journaldepot.setItem(ll_row,"paiement",ls_modpaie)
	dw_journaldepot.setItem(ll_row,"nom", ls_nom)
	dw_journaldepot.setItem(ll_row,"prenom", ls_prenom)
	dw_journaldepot.setItem(ll_row,"nocheque",ll_cheque)
	dw_journaldepot.setItem(ll_row,"datepaie",ldt_datepaie1)
	dw_journaldepot.setItem(ll_row,"ind",0)
	dw_journaldepot.setItem(ll_row,"montant",ld_montant)
	dw_journaldepot.setItem(ll_row,"id_lot",ll_idlot)
	dw_journaldepot.setItem(ll_row,"id_paiement",ll_cpdid)
	dw_journaldepot.setItem(ll_row,'type',"C")
	dw_journaldepot.setItem(ll_row,'id_satellite', ll_sat)
	dw_journaldepot.setItem(ll_row,'orthoid',li_ortho)
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
					:ls_banque,
					:li_ortho;
LOOP

CLOSE CPD;

setfilter("paiement = '$' or paiement = 'C' or paiement = 'Visa' or paiement = 'MC' or paiement = 'PD' or paiement = 'P' or paiement = 'AmEx' or paiement = 'pVisa' or paiement = 'pMC'or paiement = 'pAmex'" )
filter()
setsort('paiement A,nom A,prenom A')
sort() 
groupcalc()
dw_journaldepot.setRedraw(true)
end event

event ue_update();int i
long ll_id, ll_ind

for i = 1 to dw_journaldepot.rowcount()
	
	ll_id = getItemNumber(i,'paiement_id')
	ll_ind = getItemNumber(i,'ind')
	
	if getItemString(i,'flag') = 'P' then
		update paiement set ind = :ll_ind where paiement_id = :ll_id;
		error_type(-1)
	else
		update cheques_postdates set ind = :ll_ind where cheques_postdates_id = :ll_id;
		error_type(-1)
	end if
	
next

commit using SQLCA;
end event

event constructor;dw_journaldepot.object.paiement.values = gf_method(v_langue)

end event

event buttonclicked;setRedraw(false)
CHOOSE CASE dwo.name 
	CASE 'b_patnom'
		setsort('paiement A, patient_nom A, patient_prenom A')
		sort()		
	CASE 'b_nocheque'
		setsort('paiement A,nocheque A,patient_nom A,patient_prenom A')
		sort()
	CASE 'b_date'
		setsort('paiement A,date_paiement A,patient_nom A,patient_prenom A')
		sort()
	CASE 'b_montant'
		setsort('paiement A,montant A,patient_nom A,patient_prenom A')
		sort()
	CASE 'b_dossier'
		setsort('paiement A,new_dossier A,patient_nom A,patient_prenom A')
		sort()
END CHOOSE
groupcalc()
setRedraw(true)
end event

event itemchanged;call super::itemchanged;change = true
end event

