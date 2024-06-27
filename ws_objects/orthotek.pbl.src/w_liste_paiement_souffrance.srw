$PBExportHeader$w_liste_paiement_souffrance.srw
forward
global type w_liste_paiement_souffrance from w_child
end type
type rb_sansresp from radiobutton within w_liste_paiement_souffrance
end type
type rb_avecresp from radiobutton within w_liste_paiement_souffrance
end type
type em_date from editmask within w_liste_paiement_souffrance
end type
type st_date from statictext within w_liste_paiement_souffrance
end type
type cb_2 from commandbutton within w_liste_paiement_souffrance
end type
type dw_sat from uo_sat within w_liste_paiement_souffrance
end type
type cb_1 from commandbutton within w_liste_paiement_souffrance
end type
type cb_close from commandbutton within w_liste_paiement_souffrance
end type
type cb_print from commandbutton within w_liste_paiement_souffrance
end type
type dw_paiement_souffrance from u_dw within w_liste_paiement_souffrance
end type
end forward

global type w_liste_paiement_souffrance from w_child
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
event ue_post_open ( )
rb_sansresp rb_sansresp
rb_avecresp rb_avecresp
em_date em_date
st_date st_date
cb_2 cb_2
dw_sat dw_sat
cb_1 cb_1
cb_close cb_close
cb_print cb_print
dw_paiement_souffrance dw_paiement_souffrance
end type
global w_liste_paiement_souffrance w_liste_paiement_souffrance

forward prototypes
public subroutine impetatcompte (ref datastore dsstore, long al_idtrait, string as_langue, long al_patid, long al_idcont)
end prototypes

event ue_post_open();dw_paiement_souffrance.event ue_retrieve()
end event

public subroutine impetatcompte (ref datastore dsstore, long al_idtrait, string as_langue, long al_patid, long al_idcont);long row,ll_idphase,ll_phase,ll_idcontact,ll_cpdonhand, ll_idtrait, ll_row, ll_month
long ll_rapppaie, ll_id, ll_idnextfact,ll_mois,ll_year
decimal{2} ld_totfact,ld_totpaie,ld_couttrait,ld_charge,ld_paie,ld_balreporte,ld_totcpd
string ls_phase,ls_nom,ls_prenom,ls_add,ls_ville,ls_prov,ls_zip,ls_tel,ls_resp, ls_modnextdate
string ls_day, ls_mod, ls_modal, ls_factnote1, ls_factnote2,ls_ty, ls_villepat, ls_addpat, ls_provpat, ls_zippat
date ldt_rdv, ldt_paiedate, ldt_datecour,ldt_nextdate
time lt_rdv
decimal{2} ld_facttot,ld_paietot,ld_factc,ld_paiec,ld_fact30,ld_paie30,ld_fact60,ld_paie60,ld_sumfact,ld_sumpaie
decimal{2} ld_recu,ld_solde,ld_montantdu,ld_current,ld_jour30,ld_jour60,ld_jour90
dec{2} ld_montant,ld_balcharge,ld_balpaie, ld_totpaieant, ld_totfactant, ld_nextdate


dsstore.reset()

if as_langue = 'A' then
	dsstore.object.t_title.text = "INVOICE"
	dsstore.object.tt_mrecu.text = "Amount Received:"
	dsstore.object.tt_solde.text = "Contract Balance:"
	dsstore.object.tt_current.text = "Current"
	dsstore.object.t_30.text = "31-60 Days"
	dsstore.object.t_60.text = "61-90 Days"
	dsstore.object.t_90.text = "Over 90"
	dsstore.object.tt_mdu.text = "Amount now due"
	
	dsstore.object.tt_couttrait.text = "Treatment cost:"
	dsstore.object.tt_charge.text = "Total charged:"
	dsstore.object.tt_totpaie.text = "Total paid:"
	dsstore.object.tt_balance.text = "Contract balance:"
	dsstore.object.tt_balreporte.text = "Balance forward:"
	
	dsstore.object.tt_mdu1.text = "Amount now due:"
	dsstore.object.t_fact.text = "Charges"
	dsstore.object.t_paie.text = "Credits"
	dsstore.object.t_montantdu.text = "Amount due"
	dsstore.object.t_printedon.text = "Printed on"
	dsstore.object.tt_cpd.text = "Checks on hand"
	dsstore.object.t_date2.text = datean(today())
else
	dsstore.object.t_title.text = "FACTURE"
	dsstore.object.tt_mrecu.text = "Montant reçu:"
	dsstore.object.tt_solde.text = "Solde restant:"
	dsstore.object.tt_current.text = "Courant"
	dsstore.object.t_30.text = "31-60 Jours"
	dsstore.object.t_60.text = "61-90 Jours"
	dsstore.object.t_90.text = "90 +"
	dsstore.object.tt_mdu.text = "Montant dû:"
	
	dsstore.object.tt_couttrait.text = "Coût traitement:"
	dsstore.object.tt_charge.text = "Total facturé:"
	dsstore.object.tt_totpaie.text = "Montant payé:"
	dsstore.object.tt_balance.text = "Solde:"
	dsstore.object.tt_balreporte.text = "Balance reporté:"
	
	dsstore.object.tt_mdu1.text = "Montant dû:"
	dsstore.object.t_fact.text = "Débit"
	dsstore.object.t_paie.text = "Crédit"
	dsstore.object.t_montantdu.text = "Montant dû"
	dsstore.object.t_printedon.text = "Imprimé le"
	dsstore.object.tt_cpd.text = "Chèques en main:"
	dsstore.object.t_date2.text = datefr(today())
end if

select id_phase,phase into :ll_idphase,:ll_phase from traitements where traitement_id = :al_idtrait;
select phase into :ls_phase from t_phase where id_phase = :ll_idphase;
dsstore.object.t_phase.text = ls_phase

select dr_nom_complet,dr_adresse,dr_ville,dr_province,dr_code_postal,dr_tel_bur
into :ls_nom,:ls_add,:ls_ville,:ls_prov,:ls_zip,:ls_tel 
from ortho_id where ortho_id = :v_no_ortho;

select isnull(sum(isnull(montant,0)),0) into :ld_totfact from factures_traitements where traitement_id = :al_idtrait;
//charged to date
select isnull(sum(isnull(montant,0)),0) into :ld_charge from factures_traitements where date_facture <= today() and traitement_id = :al_idtrait;
dsstore.object.t_totcharge.text = string(ld_charge) + '$'
//paid to date
select isnull(sum(isnull(montant_recu,0)),0) into :ld_paie from paiement where date_paiement <= today() and traitement_patient_id = :al_idtrait;
dsstore.object.t_totpaie.text = string(ld_paie) + '$'
//balance forward
//select isnull(sum(isnull(montant,0)),0) into :ld_charge from factures_traitements where date_facture < :ldt_start and traitement_id = :al_idtrait;
//select isnull(sum(isnull(montant_recu,0)),0) into :ld_paie from paiement where date_paiement < :ldt_start and traitement_patient_id = :al_idtrait;
//cpd on hand
select isnull(sum(isnull(paiement,0)),0),count(*) into :ld_totcpd,:ll_cpdonhand from cheques_postdates where isnull(indicateur,'0') <> '1' and traitement_patient_id = :al_idtrait;
if as_langue = 'A' then
	dsstore.object.tt_cpd.text = 'Postdated checks:'
	dsstore.object.t_cpd.text = string(ll_cpdonhand) + ' Checks ' + string(ld_totcpd) + ' $'
else
	dsstore.object.t_cpd.text = string(ll_cpdonhand) + ' Chèques ' + string(ld_totcpd) + ' $'
end if

//ld_balreporte = ld_charge - ld_paie
//dsstore.object.t_balreporte.text = string(0.00) + ' $'

select montant_original into :ld_couttrait from traitements where traitement_id = :al_idtrait;
dsstore.object.t_couttrait.text = string(ld_couttrait) + ' $'

select isnull(sum(isnull(montant_recu,0)),0) into :ld_totpaie from paiement where traitement_patient_id = :al_idtrait;

//dw_invoice.object.t_totpaye.text = string(ld_totpaie) + ' $'
dsstore.object.t_balance.text = string(ld_totfact - ld_totpaie) + ' $'

boolean lb_hideinvoiceheader

select hideinvoiceheader 
into :lb_hideinvoiceheader 
from t_options
where ortho_id = :v_no_ortho;

if not lb_hideinvoiceheader then
	dsstore.object.t_specnom.text = ls_nom
	dsstore.object.t_specadd.text = ls_add
	dsstore.object.t_specville.text = ls_ville + ' (' + ls_prov + ')'
	dsstore.object.t_speczip.text = string(ls_zip,'@@@ @@@')
	dsstore.object.t_spectel.text = string(ls_tel, '(@@@) @@@-@@@@')
end if


select patient_nom,patient_prenom,id_contact,adresse,ville,province,code_postale
into :ls_nom,:ls_prenom,:ll_idcontact,:ls_addpat,:ls_villepat,:ls_provpat,:ls_zippat 
from patient where patient_id = :al_patid;

if not isnull(al_idcont) then
	ll_idcontact = al_idcont
end if

select prenom + ' ' + nom,adresse,ville,province,zip
into :ls_resp,:ls_add,:ls_ville,:ls_prov,:ls_zip 
from t_contact where id_contact = :ll_idcontact;

if isnull(ls_add) then ls_add = ls_addpat
if isnull(ls_ville) then ls_ville = ls_villepat
if isnull(ls_prov) then ls_prov = ls_provpat
if isnull(ls_zip) then ls_zip = ls_zippat

dsstore.object.t_resp.text = ls_resp
dsstore.object.t_patnom.text = 'Re : ' + ls_prenom + ', ' + ls_nom
dsstore.object.t_patadd.text = ls_add
dsstore.object.t_patcity.text = ls_ville + ' (' + ls_prov + ')'
dsstore.object.t_patzip.text = string(ls_zip,'@@@ @@@')

//next appointment
  SELECT FIRST t_rdv.rdvdate ,
		   t_rdv.rdvheure
	 INTO :ldt_rdv,:lt_rdv
    FROM	t_rdv
   WHERE t_rdv.rdvdate > today() AND
			t_rdv.patient_id = :al_patid AND
			(t_rdv.rdvetat is null or t_rdv.rdvetat <> 'c')
ORDER BY t_rdv.rdvdate ASC;

if ldt_rdv = date('1900-01-01') or isnull(ldt_rdv) then
	if as_langue = 'A' then
		dsstore.object.t_nextapp.text = 'You do not have a future appointment'
	else
		dsstore.object.t_nextapp.text = "Vous n'avez pas de prochain rendez-vous"
	end if
else
	if as_langue = 'A' then
		dsstore.object.t_nextapp.text = 'Your next appointment is : ' + dayname(ldt_rdv) + ', ' + string(ldt_rdv) + ' ' + string(lt_rdv)
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
		dsstore.object.t_nextapp.text = 'Prochain rendez-vous : ' + ls_day + ', ' + string(ldt_rdv) + ' ' + string(lt_rdv)
	end if
end if

if as_langue = 'A' then
	ls_ty = 'Payment - Thank you'
else
	ls_ty = 'Paiement - Merci'
end if

//insert balance forward
//select isnull(sum(isnull(montant,0)),0) into :ld_balcharge from factures_traitements where traitement_id = :al_idtrait;
//select isnull(sum(isnull(montant_recu,0)),0) into :ld_balpaie from paiement where traitement_patient_id = :al_idtrait;
//ld_balreporte = ld_balcharge - ld_balpaie
//
//ll_row = dsstore.insertRow(0)
//dsstore.setItem(ll_row,'datepaie',today())
//dsstore.setitem(ll_row,'charges',ld_balreporte)
//dsstore.setitem(ll_row,'charges',0)
//if v_langue = 'an' then
//	dsstore.setitem(ll_row,'mod','Balance forward')
//else
//	dsstore.setitem(ll_row,'mod','montant restant')
//end if
//dsstore.setitem(ll_row,'id',0)
//
select rapppaie into :ll_rapppaie from t_options where ortho_id = :v_no_ortho;


// Calculer le balance forward de la date demandée

ldt_datecour = gf_emtodate(em_date.text)
ll_mois = month(ldt_datecour)
ll_year = year(ldt_datecour)
ldt_datecour = date(year(ldt_datecour),month(ldt_datecour),1)

select isnull(sum(isnull(montant_recu,0)),0) into :ld_totpaieant 
from paiement 
where traitement_patient_id = :al_idtrait and
		date_paiement < :ldt_datecour and
		id_contact = :ll_idcontact;

SELECT isnull(sum(isnull(factures_traitements.montant,0)),0) into :ld_totfactant
FROM factures_traitements  
WHERE factures_traitements.traitement_id = :al_idtrait and
		date_facture < :ldt_datecour and
		id_contact = :ll_idcontact;

if isnull(ld_totpaieant) then ld_totpaieant = 0
if isnull(ld_totfactant) then ld_totfactant = 0
		
ll_row = dsstore.insertRow(0)
dsstore.setItem(ll_row,'datepaie',ldt_datecour)
dsstore.setItem(ll_row,'invoiceorpayment','i')
dsstore.setitem(ll_row,'charges',ld_totfactant - ld_totpaieant)
if as_langue = 'A' then
	dsstore.setitem(ll_row,'mod','Balance forward')
else
	dsstore.setitem(ll_row,'mod','montant restant')
end if
dsstore.setitem(ll_row,'id',0)
		
// Prendre les information de la prochaine facture

DECLARE listfact CURSOR FOR
	SELECT  	isnull(factures_traitements.montant,0),
				factures_traitements.date_facture
		 FROM factures_traitements  
		WHERE factures_traitements.traitement_id = :al_idtrait and
				month(factures_traitements.date_facture) = :ll_mois and 
				year(factures_traitements.date_facture) = :ll_year and
				id_contact = :ll_idcontact;
				
OPEN listfact;

FETCH listfact INTO  :ld_nextdate, :ldt_nextdate;

DO WHILE SQLCA.SQLCode = 0 
			
	if ld_nextdate > 0 then
		ll_row = dsstore.insertRow(0)
		dsstore.setItem(ll_row,'datepaie',ldt_nextdate)
		dsstore.setItem(ll_row,'invoiceorpayment','i')
		dsstore.setitem(ll_row,'charges',ld_nextdate)
		if as_langue = 'A' then
			dsstore.setitem(ll_row,'mod','Monthly charge')
		else
			dsstore.setitem(ll_row,'mod','Mensualité')
		end if
		dsstore.setitem(ll_row,'id',ll_row)
	end if

	FETCH listfact INTO  :ld_nextdate, :ldt_nextdate;

LOOP

CLOSE listfact;

//DECLARE listpaie CURSOR FOR
//
//  SELECT paiement.paiement_id,
//  			paiement.date_paiement,   
//         paiement.montant_recu,   
//         paiement.paiement
//    FROM paiement  
//   WHERE paiement.traitement_patient_id = :al_idtrait
//	
//	UNION
//	
//  SELECT factures_traitements.facture_id,
//  			factures_traitements.date_facture,
//  			factures_traitements.montant,
//			(select description from t_status where t_status.status_id = factures_traitements.status_id) as status
//	 FROM factures_traitements  
//   WHERE factures_traitements.traitement_id = :al_idtrait
//			
//	UNION
//	
//  SELECT cheques_postdates.cheques_postdates_id,
//  			cheques_postdates.date_cheque,
//  			cheques_postdates.paiement,
//			cheques_postdates.modalite
//	 FROM cheques_postdates
//   WHERE cheques_postdates.traitement_patient_id = :al_idtrait and
//			cheques_postdates.indicateur <> '1';
//	
//OPEN listpaie;
//
//FETCH listpaie INTO :ll_id,:ldt_paiedate,:ld_montant,:ls_mod;
//							  
//DO WHILE SQLCA.SQLCode = 0
//	ll_row = dsstore.insertRow(0)
//	dsstore.setItem(ll_row,'datepaie',ldt_paiedate)
//	dsstore.setItem(ll_row,'invoiceorpayment',gf_invoice_or_payment(ls_mod))
//	if gf_invoice_or_payment(ls_mod) = 'p' then
//		if ld_montant <> 0.00 then
//			dsstore.setitem(ll_row,'credits',ld_montant)
//		end if
//		if ls_mod = 'NSF' or ls_mod = 'credit' or ls_mod = 'trans' or ls_mod = 'perte' or ls_mod = 'A' or ls_mod = 'mod' then
//			dsstore.setitem(ll_row,'mod',gf_method1(v_langue,ls_mod))
//		else
//			dsstore.setitem(ll_row,'mod',gf_method1(v_langue,ls_mod) + ', ' + ls_ty)
//		end if
//	else
//		if ld_montant <> 0.00 then
//			dsstore.setitem(ll_row,'charges',ld_montant)
//		end if
//		dsstore.setitem(ll_row,'mod',gf_method1(v_langue,ls_mod))
//	end if
//	dsstore.setitem(ll_row,'id',ll_id)
//	FETCH listpaie INTO :ll_id,:ldt_paiedate,:ld_montant,:ls_mod;
//LOOP
//
//CLOSE listpaie;

//ajouter les notes
select factnote1,factnote2 into :ls_factnote1, :ls_factnote2 from t_options where ortho_id = :v_no_ortho;
dsstore.object.t_factnote1.text = ls_factnote1
dsstore.object.t_factnote2.text = ls_factnote2
dsstore.setSort("id A")
dsstore.sort()

SELECT   (select isnull(sum(isnull(montant,0)),0) from factures_traitements where traitement_id = :al_idtrait and days(date_facture,today()) >= 0) as facttot,
			(select isnull(sum(isnull(montant_recu,0)),0) from paiement where traitement_patient_id = :al_idtrait and days(date_paiement,today()) >= 0) as paietot,
	      (select isnull(sum(isnull(montant,0)),0) from factures_traitements where traitement_id = :al_idtrait and days(date_facture, today()) > 0) as factc,
			(select isnull(sum(isnull(montant_recu,0)),0) from paiement where traitement_patient_id = :al_idtrait and days(date_paiement, today()) > 0) as paiec
	INTO	:ld_facttot,:ld_paietot,:ld_factc,:ld_paiec
	FROM 	traitements
  WHERE  traitements.traitement_id = :al_idtrait;
  
select isnull(sum(isnull(montant,0)),0) into :ld_sumfact from factures_traitements where traitement_id = :al_idtrait;
select isnull(sum(isnull(montant_recu,0)),0) into :ld_sumpaie from paiement where traitement_patient_id = :al_idtrait;
select isnull(sum(isnull(montant_recu,0)),0) into :ld_recu from paiement where traitement_patient_id = :al_idtrait;
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

dsstore.object.t_solde.text = string(ld_solde) + ' $'
dsstore.object.t_mrecu.text = string(ld_recu) + ' $'
dsstore.object.t_mdu.text = string(ld_montantdu) + ' $'
dsstore.object.t_mdu1.text = string(ld_montantdu) + ' $'
dsstore.object.t_current.text = string(ld_current) + ' $'
dsstore.object.t_day30.text = string(ld_jour30) + ' $'
dsstore.object.t_day60.text = string(ld_jour60) + ' $'
dsstore.object.t_day90.text = string(ld_jour90) + ' $'
end subroutine

on w_liste_paiement_souffrance.create
int iCurrent
call super::create
this.rb_sansresp=create rb_sansresp
this.rb_avecresp=create rb_avecresp
this.em_date=create em_date
this.st_date=create st_date
this.cb_2=create cb_2
this.dw_sat=create dw_sat
this.cb_1=create cb_1
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_paiement_souffrance=create dw_paiement_souffrance
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_sansresp
this.Control[iCurrent+2]=this.rb_avecresp
this.Control[iCurrent+3]=this.em_date
this.Control[iCurrent+4]=this.st_date
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.dw_sat
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.cb_print
this.Control[iCurrent+10]=this.dw_paiement_souffrance
end on

on w_liste_paiement_souffrance.destroy
call super::destroy
destroy(this.rb_sansresp)
destroy(this.rb_avecresp)
destroy(this.em_date)
destroy(this.st_date)
destroy(this.cb_2)
destroy(this.dw_sat)
destroy(this.cb_1)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_paiement_souffrance)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
em_date.text = string(today())

event ue_post_open()
end event

type rb_sansresp from radiobutton within w_liste_paiement_souffrance
integer x = 645
integer width = 649
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Sans responsable"
end type

event clicked;dw_paiement_souffrance.dataobject = 'd_paiement_souffrance'
dw_paiement_souffrance.event ue_retrieve()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Without Responsible'
end if
end event

type rb_avecresp from radiobutton within w_liste_paiement_souffrance
integer width = 640
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Avec responsable"
boolean checked = true
end type

event clicked;dw_paiement_souffrance.dataobject = 'd_paiement_souffrance1'
dw_paiement_souffrance.event ue_retrieve()
end event

event constructor;if v_langue = 'an' then
	this.text = 'With Responsible'
end if
end event

type em_date from editmask within w_liste_paiement_souffrance
integer x = 1518
integer y = 1932
integer width = 402
integer height = 92
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_date from statictext within w_liste_paiement_souffrance
integer x = 1271
integer y = 1944
integer width = 192
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date:"
boolean focusrectangle = false
end type

type cb_2 from commandbutton within w_liste_paiement_souffrance
integer x = 654
integer y = 1916
integer width = 594
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Etat de compte"
end type

event clicked;long i, ll_traitid, ll_patid, ll_idcont, ll_job
string ls_langue
n_ds ds_invoice

ds_invoice = create n_ds
ds_invoice.dataobject = 'd_invoice'
ds_invoice.setTransObject(SQLCA)

gb_imp = false
gb_datawindow = false
openwithparm(w_print_options,ds_invoice)
if isvalid(ds_invoice) then
	ll_job = PrintOpen("Etat de compte")
	
	for i = 1 to dw_paiement_souffrance.rowcount()
		if dw_paiement_souffrance.getItemNumber(i,'etat') = 1 then
			ll_traitid = dw_paiement_souffrance.getItemNumber(i,'traitements_traitement_id')
			ls_langue = dw_paiement_souffrance.getItemString(i,'patient_langue')
			ll_patid = dw_paiement_souffrance.getItemNumber(i,'patient_patient_id')
			ll_idcont = dw_paiement_souffrance.getItemNumber(i,'t_contact_id_contact')
			impetatcompte(ds_invoice,ll_traitid,ls_langue,ll_patid,ll_idcont)
			Printdatawindow(ll_job,ds_invoice)
		end if
	next
	
	PrintClose(ll_job)
end if

destroy ds_invoice
end event

event constructor;if v_langue = 'an' then
	this.text = 'Statement'
end if
end event

type dw_sat from uo_sat within w_liste_paiement_souffrance
integer x = 2117
integer height = 88
integer taborder = 10
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	dw_paiement_souffrance.setFilter("")
	dw_paiement_souffrance.filter()
else
	dw_paiement_souffrance.setFilter("id_satellite = " + string(il_idsat))
	dw_paiement_souffrance.filter()
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

type cb_1 from commandbutton within w_liste_paiement_souffrance
integer x = 2002
integer y = 1916
integer width = 960
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

type cb_close from commandbutton within w_liste_paiement_souffrance
integer x = 2962
integer y = 1916
integer width = 658
integer height = 108
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

event clicked;Close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_print from commandbutton within w_liste_paiement_souffrance
integer y = 1916
integer width = 654
integer height = 108
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

event clicked;boolean lb_hideinvoiceheader

SELECT hideinvoiceheader INTO :lb_hideinvoiceheader 
FROM t_options
WHERE ortho_id = :v_no_ortho;

IF lb_hideinvoiceheader THEN
	dw_paiement_souffrance.object.dr_nom_complet.visible = FALSE
	dw_paiement_souffrance.object.t_titre.visible = FALSE
END IF

gb_datawindow = true
openwithparm(w_print_options,dw_paiement_souffrance)

dw_paiement_souffrance.object.dr_nom_complet.visible = TRUE
dw_paiement_souffrance.object.t_titre.visible = TRUE
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type dw_paiement_souffrance from u_dw within w_liste_paiement_souffrance
event retourner ( long ortho_id )
event ue_retrieve ( )
integer x = 18
integer y = 76
integer width = 3602
integer height = 1840
integer taborder = 50
string dataobject = "d_paiement_souffrance1"
boolean hscrollbar = true
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event retourner(long ortho_id);Long ll_traitement_id, ll_row, ll_nbrow, ll_trait, i, ll_idsat
String ls_nom_complet, ls_patient_nom, ls_patient_prenom
dec{2} montant_paye, montant_facture, montant_original, montant_affect, ld_montantfact1, ld_montantpaye1 , ld_montantfact, ld_totfact1, ld_totfact, ld_sumfact1, ld_sumfact
date dernpaiement, ldt_paiement
int li_nbcpd
setpointer(hourglass!)
// Déclaration du curseur
 
//Declare souffrance Cursor For
// 
//SELECT  patient.patient_nom ,
//        patient.patient_prenom ,
//		  patient.id_satellite,
//        ortho_id.dr_nom_complet ,
//        traitements.traitement_id as trait ,
//		  traitements.montant_original ,
//        (select sum(montant_recu) FROM paiement WHERE traitement_patient_id = trait) as totpaie1,
//		  (if totpaie1 is null then 0 else totpaie1 endif) as totpaie,
//		  (select sum(montant) FROM factures_traitements WHERE traitement_id = trait) as totfact1,
//		  (if totfact1 is null then 0 else totfact1 endif) as totfact,
//		  (select sum(montant) FROM factures_traitements WHERE traitement_id = trait and date_facture <= today()) as sumfact1,
//		  (if sumfact1 is null then 0 else sumfact1 endif) as sumfact
//FROM    patient INNER JOIN ortho_id ON ortho_id.ortho_id = patient.no_ortho
//	      		 INNER JOIN traitements ON patient.patient_id = traitements.patient_id
//WHERE   ortho_id.ortho_id = :ortho_id AND
//	     (sumfact - totpaie) > 0
//ORDER BY patient.patient_nom          ASC,
//	      patient.patient_prenom       ASC;
//			
//OPEN souffrance;
//
//Do While SQLCA.SQLCode = 0
//   Fetch souffrance Into    :ls_patient_nom,
//	                         :ls_patient_prenom,
//									 :ll_idsat,
//	                         :ls_nom_complet,
//									 :ll_traitement_id,
//									 :montant_original,
//									 :ld_montantpaye1,
//							       :montant_paye,
//									 :ld_totfact1,
//									 :ld_totfact,
//									 :ld_sumfact1,
//									 :ld_sumfact;
//						 
//if SQLCA.SQLCode = 0 then
//	ll_row = dw_paiement_souffrance.insertrow(0)
//	dw_paiement_souffrance.scrolltorow(ll_row)
//	dw_paiement_souffrance.setitem(ll_row,'patient_nom',ls_patient_nom)
//	dw_paiement_souffrance.setitem(ll_row,'patient_prenom',ls_patient_prenom)
//	dw_paiement_souffrance.setitem(ll_row,'dr_nom_complet',ls_nom_complet)
//	dw_paiement_souffrance.setitem(ll_row,'traitement_id',ll_traitement_id)
//	dw_paiement_souffrance.setitem(ll_row,'cout_traitement',montant_original)
//	dw_paiement_souffrance.setitem(ll_row,'montant_paye',montant_paye)
//	dw_paiement_souffrance.setitem(ll_row,'montant_facture',ld_totfact)
//	dw_paiement_souffrance.setitem(ll_row,'sumfact',ld_sumfact)
//	dw_paiement_souffrance.setitem(ll_row,'id_satellite',ll_idsat)
// end if
//Loop
//
//close souffrance;
//
//ll_nbrow = this.rowcount()
//for i = 1 to ll_nbrow
//	ll_trait = this.getitemnumber(i,'traitement_id')
//	select max(date_paiement) into :ldt_paiement from paiement where traitement_patient_id = :ll_trait;
////	select count(*) into :li_nbcpd from cheques_postdates where traitement_patient_id = :ll_trait and indicateur <> 1;
////	if isnull(li_nbcpd) = true  then
////		li_nbcpd = 0
////	end if
//	this.setitem(i,'dernier_paiement',ldt_paiement)
//next

retrieve(ortho_id)
//
end event

event ue_retrieve();if v_langue = 'an' and dataobject = 'd_paiement_souffrance1' then
	dw_paiement_souffrance.object.t_titre.text = 'PAYMENT DUE REPORT'
	dw_paiement_souffrance.object.t_nom.text = 'Name'
	dw_paiement_souffrance.object.t_1.text = 'Patient name'
	dw_paiement_souffrance.object.t_couttot.text = 'Total cost'
	dw_paiement_souffrance.object.t_montantfact.text = 'Billed amount'
	dw_paiement_souffrance.object.t_montantpaye.text = 'Paid amount'
	dw_paiement_souffrance.object.t_montantdu.text = 'Due amount'
	dw_paiement_souffrance.object.t_balance.text = 'Balance'
	dw_paiement_souffrance.object.t_dernpaiement.text = 'Last payment'
	dw_paiement_souffrance.object.t_printedon.text = 'Printed on'
	dw_paiement_souffrance.object.t_etat.text = "State"
end if

if v_langue = 'an' and dataobject = 'd_paiement_souffrance' then
	dw_paiement_souffrance.object.t_titre.text = 'PAYMENT DUE REPORT'
	dw_paiement_souffrance.object.t_nom.text = 'Name'
	dw_paiement_souffrance.object.t_montantfact.text = 'Billed amount'
	dw_paiement_souffrance.object.t_montantpaye.text = 'Paid amount'
	dw_paiement_souffrance.object.t_montantdu.text = 'Due amount'
	dw_paiement_souffrance.object.t_printedon.text = 'Printed on'
end if

dw_paiement_souffrance.settransobject(SQLCA)
dw_paiement_souffrance.event retourner(v_no_ortho)
end event

event constructor;setRowFocusIndicator(focusrect!)


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

event doubleclicked;call super::doubleclicked;long ll_patid

if row > 0 then
	
	ll_patid = getItemNumber(row,'patient_patient_id')

	if isvalid(w_traitements) = true then
		if error_type(214) = 1 then
			Opensheet(w_traitements,w_principal,2,layered!)
			w_traitements.setfocus()
		else
			w_traitements.if_close()
			Opensheetwithparm(w_traitements,ll_patid,w_principal,2,layered!)
			w_traitements.setfocus()
		end if
	else
		Opensheetwithparm(w_traitements,ll_patid,w_principal,2,layered!)
		w_traitements.setfocus()
	end if
	
end if
end event

event clicked;call super::clicked;scrolltorow(row)
end event

