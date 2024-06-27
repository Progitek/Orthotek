$PBExportHeader$w_invoice2.srw
forward
global type w_invoice2 from w_child
end type
type cb_email from commandbutton within w_invoice2
end type
type uo_calutil2 from u_calutil within w_invoice2
end type
type uo_calutil1 from u_calutil within w_invoice2
end type
type p_end from picture within w_invoice2
end type
type p_start from picture within w_invoice2
end type
type em_end from editmask within w_invoice2
end type
type em_start from editmask within w_invoice2
end type
type cb_search from commandbutton within w_invoice2
end type
type cb_printrecu from commandbutton within w_invoice2
end type
type cb_close from commandbutton within w_invoice2
end type
type cb_printfact from commandbutton within w_invoice2
end type
type dw_invoice from u_dw within w_invoice2
end type
end forward

global type w_invoice2 from w_child
integer x = 214
integer y = 221
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
boolean ib_isupdateable = false
cb_email cb_email
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
p_end p_end
p_start p_start
em_end em_end
em_start em_start
cb_search cb_search
cb_printrecu cb_printrecu
cb_close cb_close
cb_printfact cb_printfact
dw_invoice dw_invoice
end type
global w_invoice2 w_invoice2

type variables
private long il_traitid, il_patid
private integer ii_row
private boolean ib_skipscroll
private string is_langue
end variables

forward prototypes
public subroutine cbrefresh ()
public subroutine uf_affinfo ()
public subroutine remplirrapppaie (date adt_start, date adt_end)
end prototypes

public subroutine cbrefresh ();//int li_nbphase, li_nophase
//select count(*) into :li_nbphase from traitements where patient_id = :il_patid;
//if li_nbphase > 0 then
//	select phase into :li_nophase from traitements where traitement_id = :il_traitid;
//	if li_nbphase - li_nophase >= 1 then 
//		cb_suiv.enabled = TRUE
//	else
//		cb_suiv.enabled = FALSE
//	end if
//	if	li_nbphase - li_nophase < li_nbphase - 1 then
//		cb_prec.enabled = TRUE
//	else
//		cb_prec.enabled = FALSE
//	end if
//else
////	cb_suiv.enabled = FALSE
////	cb_prec.enabled = FALSE
//end if
end subroutine

public subroutine uf_affinfo ();long row,ll_idphase,ll_phase,ll_idcontact,ll_cpdonhand
decimal{2} ld_totfact,ld_totpaie,ld_couttrait,ld_charge,ld_paie,ld_balreporte,ld_totcpd, ld_paieperiod
string ls_phase,ls_nom,ls_prenom,ls_add,ls_ville,ls_prov,ls_zip,ls_tel,ls_resp,ls_newdoss
string ls_day
date ldt_rdv,ldt_start, ldt_end
time lt_rdv

ldt_start = date(em_start.text)
ldt_end = date(em_end.text)
dw_invoice.reset()

select id_phase,phase into :ll_idphase,:ll_phase from traitements where traitement_id = :il_traitid;
if isnull(ll_idphase) then ll_idphase = ll_phase
select phase into :ls_phase from t_phase 
where id_phase = :ll_idphase;
dw_invoice.object.t_phase.text = ls_phase
select dr_nom_complet,dr_adresse,dr_ville,dr_province,dr_code_postal,dr_tel_bur
into :ls_nom,:ls_add,:ls_ville,:ls_prov,:ls_zip,:ls_tel from ortho_id 
where ortho_id = :v_no_ortho;

select isnull(sum(isnull(montant,0)),0) into :ld_totfact from factures_traitements where traitement_id = :il_traitid;
//charged to date
select isnull(sum(isnull(montant,0)),0) into :ld_charge from factures_traitements where date_facture <= today() and traitement_id = :il_traitid;
//paid to date
select isnull(sum(isnull(montant_recu,0)),0) into :ld_paie from paiement where date_paiement <= today() and traitement_patient_id = :il_traitid;
// Paie during the period
select isnull(sum(isnull(montant_recu,0)),0) into :ld_paieperiod from paiement where date_paiement between :ldt_start and :ldt_end and traitement_patient_id = :il_traitid;

dw_invoice.object.t_totcharge.text = string(ld_charge) + ' $'
dw_invoice.object.t_totpaie.text = string(ld_paie) + ' $'
dw_invoice.object.t_payeperiode.text = string(ld_paieperiod) + ' $'

//balance forward
select sum(montant) into :ld_charge from factures_traitements where date_facture < :ldt_end and traitement_id = :il_traitid;
if isnull(ld_charge) then ld_charge = 0
select sum(montant_recu) into :ld_paie from paiement where date_paiement < :ldt_end and traitement_patient_id = :il_traitid;
if isnull(ld_paie) then ld_paie = 0

//cpd on hand
select isnull(sum(isnull(paiement,0)),0),count(*) into :ld_totcpd,:ll_cpdonhand from cheques_postdates where isnull(indicateur,'0') <> '1' and traitement_patient_id = :il_traitid;
if is_langue = 'A' then
	dw_invoice.object.tt_cpd.text = 'Postdated checks:'
	dw_invoice.object.t_cpd.text = string(ll_cpdonhand) + ' Checks ' + string(ld_totcpd) + ' $'
else
	dw_invoice.object.t_cpd.text = string(ll_cpdonhand) + ' Chèques ' + string(ld_totcpd) + ' $'
end if

ld_balreporte = ld_charge - ld_paie

//if ld_balreporte < 0 then
//	dw_invoice.object.t_balreporte.text = '('+string(ld_balreporte) + '$)'
//else
	dw_invoice.object.t_balreporte.text = string(ld_balreporte) + ' $'
//end if

select montant_original into :ld_couttrait from traitements where traitement_id = :il_traitid;
dw_invoice.object.t_couttrait.text = string(ld_couttrait) + ' $'

select sum(montant_recu) into :ld_totpaie from paiement where traitement_patient_id = :il_traitid;
if isnull(ld_totpaie) then ld_totpaie = 0

//dw_invoice.object.t_totpaye.text = string(ld_totpaie) + ' $'
//dw_invoice.object.t_balance.text = string(ld_totfact - ld_totpaie) + ' $'
//dw_invoice.object.t_specnom.text = ls_nom
//dw_invoice.object.t_specadd.text = ls_add
//dw_invoice.object.t_specville.text = ls_ville + ' (' + ls_prov + ')'
//dw_invoice.object.t_speczip.text = string(ls_zip,'@@@ @@@')
//dw_invoice.object.t_spectel.text = string(ls_tel, '(@@@) @@@-@@@@')

boolean lb_hideinvoiceheader

select hideinvoiceheader 
into :lb_hideinvoiceheader 
from t_options
where ortho_id = :v_no_ortho;

if not lb_hideinvoiceheader then
	dw_invoice.object.t_specnom.text = ls_nom
	dw_invoice.object.t_specadd.text = ls_add
	dw_invoice.object.t_specville.text = ls_ville + ' (' + ls_prov + ')'
	dw_invoice.object.t_speczip.text = string(ls_zip,'@@@ @@@')
	dw_invoice.object.t_spectel.text = string(ls_tel, '(@@@) @@@-@@@@')
end if

select patient_nom,patient_prenom,id_contact,adresse,ville,province,code_postale,isnull(new_dossier,'')
into :ls_nom,:ls_prenom,:ll_idcontact,:ls_add,:ls_ville,:ls_prov,:ls_zip,:ls_newdoss
from patient where patient_id = :il_patid;

select prenom + ' ' + nom,adresse,ville,province,zip
into :ls_resp,:ls_add,:ls_ville,:ls_prov,:ls_zip 
from t_contact where id_contact = :ll_idcontact;

dw_invoice.object.t_resp.text = ls_resp
dw_invoice.object.t_patnom.text = 'Re : ' + ls_prenom + ', ' + ls_nom + ' ( ' + ls_newdoss + ' )'
dw_invoice.object.t_patadd.text = ls_add
dw_invoice.object.t_patcity.text = ls_ville + ' (' + ls_prov + ')'
dw_invoice.object.t_patzip.text = string(ls_zip,'@@@ @@@')
//dw_accountsummary.object.t_pattel.text = string(ls_tel, '(@@@) @@@-@@@@')

//next appointment
  SELECT FIRST t_rdv.rdvdate ,
		   t_rdv.rdvheure
	 INTO :ldt_rdv,:lt_rdv
    FROM	t_rdv
   WHERE t_rdv.rdvdate > today() AND
			t_rdv.patient_id = :il_patid AND
			(t_rdv.rdvetat is null or t_rdv.rdvetat <> 'c')
ORDER BY t_rdv.rdvdate ASC;

if ldt_rdv = date('1900-01-01') or isnull(ldt_rdv) then
	if is_langue = 'A' then
		dw_invoice.object.t_nextapp.text = 'You do not have a future appointment'
	else
		dw_invoice.object.t_nextapp.text = "Vous n'avez pas de prochain rendez-vous"
	end if
else
	if is_langue = 'A' then
		dw_invoice.object.t_nextapp.text = 'Your next appointment is : ' + dayname(ldt_rdv) + ', ' + string(ldt_rdv) + ' ' + string(lt_rdv)
	else
		choose case DayName(ldt_rdv)
			case "Monday"
				ls_day = "Lundi"
			case "Tuesday"
				ls_day = "Mardi"
			case "Wednesday"
				ls_day = "Mercredi"
			case "Thursday"
				ls_day = "Jeudi"
			case "Friday"
				ls_day = "Vendredi"
			case "Saturday"
				ls_day = "Samedi"
			case "Sunday"
				ls_day = "Dimanche"
			end choose
		dw_invoice.object.t_nextapp.text = 'Prochain rendez-vous : ' + ls_day + ', ' + string(ldt_rdv) + ' ' + string(lt_rdv)
	end if
end if
end subroutine

public subroutine remplirrapppaie (date adt_start, date adt_end);date ldt_paiedate
dec{2} ld_montant,ld_balcharge,ld_balpaie,ld_balreporte
string ls_mod, ls_modal, ls_factnote1, ls_factnote2,ls_ty
long ll_row, ll_rapppaie, ll_id

if is_langue = 'A' then
	ls_ty = 'Payment - Thank you'
else
	ls_ty = 'Paiement - Merci'
end if

//insert balance forward
select sum(montant) into :ld_balcharge from factures_traitements where date_facture < :adt_start and traitement_id = :il_traitid;
if isnull(ld_balcharge) then ld_balcharge = 0
select sum(montant_recu) into :ld_balpaie from paiement where date_paiement < :adt_start and traitement_patient_id = :il_traitid;
if isnull(ld_balpaie) then ld_balpaie = 0
ld_balreporte = ld_balcharge - ld_balpaie

ll_row = dw_invoice.insertRow(0)
dw_invoice.setItem(ll_row,'datepaie',adt_start)
dw_invoice.setitem(ll_row,'charges',ld_balreporte)
if is_langue = 'A' then
	dw_invoice.setitem(ll_row,'mod','Balance forward')
else
	dw_invoice.setitem(ll_row,'mod','montant restant')
end if
dw_invoice.setitem(ll_row,'id',0)

select rapppaie into :ll_rapppaie from t_options where ortho_id = :v_no_ortho;

DECLARE listpaie CURSOR FOR

  SELECT paiement.paiement_id,
  			paiement.date_paiement,   
         paiement.montant_recu,   
         paiement.paiement
    FROM paiement  
   WHERE paiement.traitement_patient_id = :il_traitid AND
			paiement.date_paiement BETWEEN :adt_start AND :adt_end
	
	UNION
	
  SELECT factures_traitements.facture_id,
  			factures_traitements.date_facture,
  			factures_traitements.montant,
			(select description from t_status where t_status.status_id = factures_traitements.status_id) as status
	 FROM factures_traitements  
   WHERE factures_traitements.traitement_id = :il_traitid AND
			factures_traitements.date_facture BETWEEN :adt_start AND :adt_end
			
	UNION
	
  SELECT cheques_postdates.cheques_postdates_id,
  			cheques_postdates.date_cheque,
  			cheques_postdates.paiement,
			cheques_postdates.modalite
	 FROM cheques_postdates
   WHERE cheques_postdates.traitement_patient_id = :il_traitid AND
			cheques_postdates.date_cheque BETWEEN :adt_start AND :adt_end AND
			cheques_postdates.indicateur <> '1';
	
OPEN listpaie;

FETCH listpaie INTO :ll_id,:ldt_paiedate,:ld_montant,:ls_mod;
							  
DO WHILE SQLCA.SQLCode = 0
	ll_row = dw_invoice.insertRow(0)
	dw_invoice.setItem(ll_row,'datepaie',ldt_paiedate)
	dw_invoice.setItem(ll_row,'invoiceorpayment',gf_invoice_or_payment(ls_mod))
	if gf_invoice_or_payment(ls_mod) = 'p' then
		if ld_montant <> 0.00 then
			dw_invoice.setitem(ll_row,'credits',ld_montant)
		end if
		if ls_mod = 'NSF' or ls_mod = 'credit' or ls_mod = 'trans' or ls_mod = 'perte' or ls_mod = 'A' or ls_mod = 'mod' then
			dw_invoice.setitem(ll_row,'mod',gf_method1(is_langue,ls_mod))
		else
			dw_invoice.setitem(ll_row,'mod',gf_method1(is_langue,ls_mod) + ', ' + ls_ty)
		end if
	else
		if ld_montant <> 0.00 then
			dw_invoice.setitem(ll_row,'charges',ld_montant)
		end if
		dw_invoice.setitem(ll_row,'mod',gf_method1(is_langue,ls_mod))
	end if
	dw_invoice.setitem(ll_row,'id',ll_id)
	FETCH listpaie INTO :ll_id,:ldt_paiedate,:ld_montant,:ls_mod;
LOOP

CLOSE listpaie;

//ajouter les notes
select factnote1,factnote2 into :ls_factnote1, :ls_factnote2 from t_options where ortho_id = :v_no_ortho;
dw_invoice.object.t_factnote1.text = ls_factnote1
dw_invoice.object.t_factnote2.text = ls_factnote2
dw_invoice.setSort("datepaie A, invoiceorpayment A")
dw_invoice.sort()
end subroutine

on w_invoice2.create
int iCurrent
call super::create
this.cb_email=create cb_email
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.p_end=create p_end
this.p_start=create p_start
this.em_end=create em_end
this.em_start=create em_start
this.cb_search=create cb_search
this.cb_printrecu=create cb_printrecu
this.cb_close=create cb_close
this.cb_printfact=create cb_printfact
this.dw_invoice=create dw_invoice
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_email
this.Control[iCurrent+2]=this.uo_calutil2
this.Control[iCurrent+3]=this.uo_calutil1
this.Control[iCurrent+4]=this.p_end
this.Control[iCurrent+5]=this.p_start
this.Control[iCurrent+6]=this.em_end
this.Control[iCurrent+7]=this.em_start
this.Control[iCurrent+8]=this.cb_search
this.Control[iCurrent+9]=this.cb_printrecu
this.Control[iCurrent+10]=this.cb_close
this.Control[iCurrent+11]=this.cb_printfact
this.Control[iCurrent+12]=this.dw_invoice
end on

on w_invoice2.destroy
call super::destroy
destroy(this.cb_email)
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.p_end)
destroy(this.p_start)
destroy(this.em_end)
destroy(this.em_start)
destroy(this.cb_search)
destroy(this.cb_printrecu)
destroy(this.cb_close)
destroy(this.cb_printfact)
destroy(this.dw_invoice)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

cbrefresh()


end event

type cb_email from commandbutton within w_invoice2
integer x = 841
integer y = 1920
integer width = 562
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Impr. avec entete"
end type

event clicked;boolean lb_hideinvoiceheader
string ls_nom, ls_add, ls_ville, ls_prov, ls_zip, ls_tel, ls_email, ls_email2, ls_email3, ls_courriel

select dr_nom_complet,dr_adresse,dr_ville,dr_province,dr_code_postal,dr_tel_bur
into :ls_nom,:ls_add,:ls_ville,:ls_prov,:ls_zip,:ls_tel from ortho_id 
where ortho_id = :v_no_ortho;

select hideinvoiceheader 
into :lb_hideinvoiceheader 
from t_options
where ortho_id = :v_no_ortho;

dw_invoice.object.t_specnom.text = ls_nom
dw_invoice.object.t_specadd.text = ls_add
dw_invoice.object.t_specville.text = ls_ville + ' (' + ls_prov + ')'
dw_invoice.object.t_speczip.text = string(ls_zip,'@@@ @@@')
dw_invoice.object.t_spectel.text = string(ls_tel, '(@@@) @@@-@@@@')

select isnull(email,''), isnull(email2,''), isnull(email3,'') 
into :ls_email, :ls_email2,:ls_email3 
from patient where patient_id = :il_patid;

ls_courriel = ls_email
if not isnull(ls_email2) and ls_email2 <> "" then ls_courriel += ";" + ls_email2
if not isnull(ls_email3) and ls_email3 <> "" then ls_courriel +=	';' + ls_email3 
gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)

gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_invoice)

select hideinvoiceheader 
into :lb_hideinvoiceheader 
from t_options
where ortho_id = :v_no_ortho;

if lb_hideinvoiceheader then
	dw_invoice.object.t_specnom.text = ""
	dw_invoice.object.t_specadd.text = ""
	dw_invoice.object.t_specville.text = ""
	dw_invoice.object.t_speczip.text = ""
	dw_invoice.object.t_spectel.text = ""
end if
end event

event constructor;if v_langue = 'an' then
	this.Text = "Print with header"
end if
end event

type uo_calutil2 from u_calutil within w_invoice2
boolean visible = false
integer x = 2395
integer y = 1380
integer taborder = 60
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_end.text = string(istr_calutil.caldate)
end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_invoice2
boolean visible = false
integer x = 1783
integer y = 1380
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_start.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type p_end from picture within w_invoice2
integer x = 2935
integer y = 1928
integer width = 59
integer height = 88
string picturename = "C:\ii4net\orthotek\images\ddarrow.bmp"
boolean focusrectangle = false
boolean map3dcolors = true
end type

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type p_start from picture within w_invoice2
integer x = 2322
integer y = 1928
integer width = 59
integer height = 88
string picturename = "C:\ii4net\orthotek\images\ddarrow.bmp"
boolean focusrectangle = false
boolean map3dcolors = true
end type

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type em_end from editmask within w_invoice2
integer x = 2418
integer y = 1928
integer width = 517
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
end type

event constructor;this.text = string(today())
end event

type em_start from editmask within w_invoice2
integer x = 1806
integer y = 1928
integer width = 517
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
end type

event constructor;this.text = '01-01-1900'
end event

type cb_search from commandbutton within w_invoice2
integer x = 1394
integer y = 1920
integer width = 393
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;date ldt_start, ldt_end

ldt_start = date(em_start.text)
ldt_end = date(em_end.text)

uf_affinfo()
remplirRappPaie(ldt_start, ldt_end)
dw_invoice.event ue_agecompte()
cbrefresh()
end event

event constructor;if v_langue = 'an' then
	this.Text = "Search"
end if
end event

type cb_printrecu from commandbutton within w_invoice2
integer x = 421
integer y = 1920
integer width = 425
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imp. reçu"
end type

event constructor;if v_langue = 'an' then
	this.Text = "Print receipt"
end if
end event

event clicked;string ls_email, ls_email2, ls_email3, ls_courriel

if is_langue = 'A' then
	dw_invoice.object.t_title.text = 'RECEIPT'
else
	dw_invoice.object.t_title.text = 'REÇU'
end if
dw_invoice.modify("datawindow.header.height = 1352")
ib_skipscroll = false

select isnull(email,''), isnull(email2,''), isnull(email3,'') 
into :ls_email, :ls_email2,:ls_email3 
from patient where patient_id = :il_patid;

ls_courriel = ls_email
if not isnull(ls_email2) and ls_email2 <> "" then ls_courriel += ";" + ls_email2
if not isnull(ls_email3) and ls_email3 <> "" then ls_courriel +=	';' + ls_email3 
gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)

gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_invoice)
end event

type cb_close from commandbutton within w_invoice2
integer x = 3035
integer y = 1920
integer width = 585
integer height = 112
integer taborder = 40
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
	cb_close.Text = "Close"
end if
end event

type cb_printfact from commandbutton within w_invoice2
integer y = 1920
integer width = 425
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imp. facture"
end type

event clicked;string ls_email, ls_email2, ls_courriel, ls_email3

if is_langue = 'A' then
	dw_invoice.object.t_title.text = 'INVOICE'
else
	dw_invoice.object.t_title.text = 'FACTURE'
end if
dw_invoice.modify("datawindow.header.height = 1352")
ib_skipscroll = false

select isnull(email,''), isnull(email2,''), isnull(email3,'') 
into :ls_email, :ls_email2,:ls_email3 
from patient where patient_id = :il_patid;

ls_courriel = ls_email
if not isnull(ls_email2) and ls_email2 <> "" then ls_courriel += ";" + ls_email2
if not isnull(ls_email3) and ls_email3 <> "" then ls_courriel +=	';' + ls_email3 
gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)

gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_invoice)
end event

event constructor;if v_langue = 'an' then
	this.Text = "Print invoice"
end if
end event

type dw_invoice from u_dw within w_invoice2
event ue_agecompte ( )
integer width = 3621
integer height = 1904
integer taborder = 50
string title = "Invoice"
string dataobject = "d_invoice"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_agecompte();long ll_idtrait
decimal{2} ld_facttot,ld_paietot,ld_factc,ld_paiec,ld_fact30,ld_paie30,ld_fact60,ld_paie60,ld_sumfact,ld_sumpaie
decimal{2} ld_recu,ld_solde,ld_montantdu,ld_current,ld_jour30,ld_jour60,ld_jour90
date ldt_start,ldt_end

ldt_start = date(em_start.text)
ldt_end = date(em_end.text)

SELECT   (select sum(montant) from factures_traitements where traitement_id = :il_traitid and days(date_facture,today()) >= 0) as facttot,
			(select sum(montant_recu) from paiement where traitement_patient_id = :il_traitid and days(date_paiement,today()) >= 0) as paietot,
	      (select sum(montant) from factures_traitements where traitement_id = :il_traitid and days(date_facture, today()) > 0) as factc,
			(select sum(montant_recu) from paiement where traitement_patient_id = :il_traitid and days(date_paiement, today()) > 0) as paiec
//			(select sum(montant) from factures_traitements where traitement_id = :il_traitid and date_facture <= today() - 60) as fact30, 
//			(select sum(montant_recu) from paiement where traitement_patient_id = :il_traitid and date_paiement <= today()) as paie30,
//			(select sum(montant) from factures_traitements where traitement_id = :il_traitid and date_facture <= today() -90) as fact60,
//			(select sum(montant_recu) from paiement where traitement_patient_id = :il_traitid and date_paiement <= today()) as paie60
	INTO	:ld_facttot,:ld_paietot,:ld_factc,:ld_paiec
	FROM 	traitements
  WHERE  traitements.traitement_id = :il_traitid;
  
select sum(montant) into :ld_sumfact from factures_traitements where traitement_id = :il_traitid;
select sum(montant_recu) into :ld_sumpaie from paiement where traitement_patient_id = :il_traitid;
select sum(montant_recu) into :ld_recu from paiement where traitement_patient_id = :il_traitid and date_paiement between :ldt_start and :ldt_end;
if isnull(ld_recu) then ld_recu = 0
if isnull(ld_sumfact) then ld_sumfact = 0
if isnull(ld_sumpaie) then ld_sumpaie = 0
if isnull(ld_facttot) then ld_facttot = 0
if isnull(ld_paietot) then ld_paietot = 0
if isnull(ld_factc) then ld_factc = 0
if isnull(ld_paiec) then ld_paiec = 0
if isnull(ld_fact30) then ld_fact30 = 0
if isnull(ld_paie30) then ld_paie30 = 0
if isnull(ld_fact60) then ld_fact60 = 0
if isnull(ld_paie60) then ld_paie60 = 0
ld_solde = ld_sumfact - ld_sumpaie
ld_montantdu = ld_facttot - ld_paietot
ld_jour90 = ld_fact60 - ld_paie60
ld_jour60 = ld_fact60 - ld_paie60 - ld_jour90
ld_jour30 = ld_factc - ld_paiec - ld_jour60 - ld_jour90
ld_current = ld_montantdu - ld_jour30 - ld_jour60 - ld_jour90

dw_invoice.object.t_solde.text = string(ld_solde) + ' $'
dw_invoice.object.t_mrecu.text = string(ld_recu) + ' $'
dw_invoice.object.t_mdu.text = string(ld_montantdu) + ' $'
dw_invoice.object.t_mdu1.text = string(ld_montantdu) + ' $'
dw_invoice.object.t_current.text = string(ld_current) + ' $'
dw_invoice.object.t_day30.text = string(ld_jour30) + ' $'
dw_invoice.object.t_day60.text = string(ld_jour60) + ' $'
dw_invoice.object.t_day90.text = string(ld_jour90) + ' $'
end event

event constructor;il_traitid = message.doubleparm	//parametre externe
select patient_id into :il_patid from traitements where traitement_id = :il_traitid;
select langue into :is_langue from patient where patient_id = :il_patid;

this.Modify("DataWindow.Print.Preview=yes")
if is_langue = 'A' then
	this.object.t_title.text = "INVOICE"
	this.object.tt_mrecu.text = "Amount Received:"
	this.object.tt_solde.text = "Contract Balance:"
	this.object.tt_current.text = "Current"
	this.object.t_30.text = "31-60 Days"
	this.object.t_60.text = "61-90 Days"
	this.object.t_90.text = "Over 90"
	this.object.tt_mdu.text = "Amount now due"
	
	this.object.tt_couttrait.text = "Treatment cost:"
	this.object.tt_charge.text = "Total charged:"
	this.object.tt_totpaie.text = "Total paid:"
	this.object.t_totpayperiode.text = "Total paid during period:"
	this.object.tt_balance.text = "Contract balance:"
	this.object.tt_balreporte.text = "Balance forward:"
	
	this.object.tt_mdu1.text = "Amount now due:"
	this.object.t_fact.text = "Charges"
	this.object.t_paie.text = "Credits"
	this.object.t_montantdu.text = "Amount due"
	this.object.t_printedon.text = "Printed on"
	this.object.t_date2.text = datean(today())
else
	this.object.t_date2.text = datefr(today())
end if
end event

