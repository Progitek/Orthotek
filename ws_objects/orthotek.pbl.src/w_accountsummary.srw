$PBExportHeader$w_accountsummary.srw
forward
global type w_accountsummary from w_child
end type
type ddlb_resp from dropdownlistbox within w_accountsummary
end type
type cb_suiv from commandbutton within w_accountsummary
end type
type cb_prec from commandbutton within w_accountsummary
end type
type cb_close from commandbutton within w_accountsummary
end type
type cb_1 from commandbutton within w_accountsummary
end type
type cb_print from commandbutton within w_accountsummary
end type
type dw_accountsummary from u_dw within w_accountsummary
end type
end forward

global type w_accountsummary from w_child
integer width = 3630
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
boolean ib_isupdateable = false
ddlb_resp ddlb_resp
cb_suiv cb_suiv
cb_prec cb_prec
cb_close cb_close
cb_1 cb_1
cb_print cb_print
dw_accountsummary dw_accountsummary
end type
global w_accountsummary w_accountsummary

type variables
private long il_traitid, il_patid
private integer ii_row
private boolean ib_skipscroll
private long il_indresp
private long il_respid[]
end variables

forward prototypes
public subroutine cbrefresh ()
public subroutine remplirrapppaie ()
public subroutine uf_affinfo ()
end prototypes

public subroutine cbrefresh ();int li_nbphase, li_nophase
select count(*) into :li_nbphase from traitements where patient_id = :il_patid;
if li_nbphase > 0 then
	select phase into :li_nophase from traitements where traitement_id = :il_traitid;
	if li_nbphase - li_nophase >= 1 then 
		cb_suiv.enabled = TRUE
	else
		cb_suiv.enabled = FALSE
	end if
	if	li_nbphase - li_nophase < li_nbphase - 1 then
		cb_prec.enabled = TRUE
	else
		cb_prec.enabled = FALSE
	end if
else
	cb_suiv.enabled = FALSE
	cb_prec.enabled = FALSE
end if
end subroutine

public subroutine remplirrapppaie ();date ldt_paiedate
dec{2} ld_montant
string ls_mod, ls_modal, ls_factnote1, ls_factnote2, ls_resp
long ll_id,ll_row, ll_rapppaie, ll_idcontact, ll_idcont

dw_accountsummary.reset()

if il_indresp = 1 then
	setnull(ll_idcont)
else
	ll_idcont = il_respid[il_indresp]
end if


ls_modal = gf_method(v_langue)
dw_accountsummary.Object.mod.Values = ls_modal
select rapppaie into :ll_rapppaie from t_options where ortho_id = :v_no_ortho;

DECLARE listpaie CURSOR FOR

  SELECT paiement.paiement_id,
  			paiement.date_paiement,   
         paiement.montant_recu,   
         paiement.paiement,
			paiement.id_contact
    FROM paiement  
   WHERE paiement.traitement_patient_id = :il_traitid and 
			paiement.date_paiement <= today(*) and
	      (paiement.id_contact = :ll_idcont or :ll_idcont is null)
	
	UNION
	
  SELECT factures_traitements.facture_id,
  			factures_traitements.date_facture,
  			factures_traitements.montant,
			(select description from t_status where t_status.status_id = factures_traitements.status_id) as status,
			factures_traitements.id_contact
	 FROM factures_traitements  
   WHERE factures_traitements.traitement_id = :il_traitid and
			factures_traitements.date_facture <= today(*) AND
         (factures_traitements.id_contact = :ll_idcont or :ll_idcont is null);
	
OPEN listpaie;
	
FETCH listpaie INTO :ll_id,:ldt_paiedate,:ld_montant,:ls_mod,:ll_idcontact;
							  
DO WHILE SQLCA.SQLCode = 0
	ll_row = dw_accountsummary.insertRow(0)
	dw_accountsummary.setItem(ll_row,'datepaie',ldt_paiedate)
	if gf_invoice_or_payment(ls_mod) = 'p' then
		if ld_montant <> 0.00 then
			dw_accountsummary.setitem(ll_row,'credits',ld_montant)
		end if
	else
		if ld_montant <> 0.00 then
			dw_accountsummary.setitem(ll_row,'charges',ld_montant)
		end if
	end if
	dw_accountsummary.setitem(ll_row,'mod',ls_mod)
	select prenom + ' ' + nom into :ls_resp from t_contact where id_contact = :ll_idcontact;
	dw_accountsummary.setitem(ll_row,'resp',ls_resp)
	dw_accountsummary.setitem(ll_row,'id',ll_id)
	FETCH listpaie INTO :ll_id,:ldt_paiedate,:ld_montant,:ls_mod,:ll_idcontact;
LOOP

CLOSE listpaie;
//ajouter les notes
select factnote1,factnote2 into :ls_factnote1, :ls_factnote2 from t_options where ortho_id = :v_no_ortho;
//dw_accountsummary.object.t_factnote1.text = ls_factnote1
dw_accountsummary.object.t_factnote2.text = ls_factnote2
dw_accountsummary.setSort("datepaie A,charges D")
dw_accountsummary.sort()
end subroutine

public subroutine uf_affinfo ();long row,ll_idphase, ll_idcont
decimal{2} ld_totfact,ld_totpaie
string ls_phase,ls_nom,ls_prenom,ls_add,ls_ville,ls_prov,ls_zip,ls_tel

if il_indresp = 1 then
	setnull(ll_idcont)
else
	ll_idcont = il_respid[il_indresp]
end if

select id_phase into :ll_idphase from traitements where traitement_id = :il_traitid;
select phase into :ls_phase from t_phase where id_phase = :ll_idphase;
dw_accountsummary.object.t_phase.text = ls_phase
select dr_nom_complet,dr_adresse,dr_ville,dr_province,dr_code_postal,dr_tel_bur
into :ls_nom,:ls_add,:ls_ville,:ls_prov,:ls_zip,:ls_tel from ortho_id where ortho_id = :v_no_ortho;
select isnull(sum(isnull(montant,0)),0) into :ld_totfact from factures_traitements where traitement_id = :il_traitid and (id_contact = :ll_idcont or :ll_idcont is null);
dw_accountsummary.object.t_totfact.text = string(ld_totfact) + ' $'
select isnull(sum(isnull(montant_recu,0)),0) into :ld_totpaie from paiement where traitement_patient_id = :il_traitid and (id_contact = :ll_idcont or :ll_idcont is null);
dw_accountsummary.object.t_totpaye.text = string(ld_totpaie) + ' $'
dw_accountsummary.object.t_balance.text = string(ld_totfact - ld_totpaie) + ' $'
dw_accountsummary.object.t_specnom.text = ls_nom
dw_accountsummary.object.t_specadd.text = ls_add
dw_accountsummary.object.t_specville.text = ls_ville + ' (' + ls_prov + ')'
dw_accountsummary.object.t_speczip.text = string(ls_zip,'@@@ @@@')
dw_accountsummary.object.t_spectel.text = string(ls_tel, '(@@@) @@@-@@@@')

select patient_nom,patient_prenom,adresse,ville,province,code_postale
into :ls_nom,:ls_prenom,:ls_add,:ls_ville,:ls_prov,:ls_zip from patient where patient_id = :il_patid;

dw_accountsummary.object.t_patnom.text = ls_prenom + ', ' + ls_nom
dw_accountsummary.object.t_patadd.text = ls_add
dw_accountsummary.object.t_patcity.text = ls_ville + ' (' + ls_prov + ')'
dw_accountsummary.object.t_patzip.text = string(ls_zip,'@@@ @@@')
//dw_accountsummary.object.t_pattel.text = string(ls_tel, '(@@@) @@@-@@@@')
end subroutine

on w_accountsummary.create
int iCurrent
call super::create
this.ddlb_resp=create ddlb_resp
this.cb_suiv=create cb_suiv
this.cb_prec=create cb_prec
this.cb_close=create cb_close
this.cb_1=create cb_1
this.cb_print=create cb_print
this.dw_accountsummary=create dw_accountsummary
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_resp
this.Control[iCurrent+2]=this.cb_suiv
this.Control[iCurrent+3]=this.cb_prec
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.dw_accountsummary
end on

on w_accountsummary.destroy
call super::destroy
destroy(this.ddlb_resp)
destroy(this.cb_suiv)
destroy(this.cb_prec)
destroy(this.cb_close)
destroy(this.cb_1)
destroy(this.cb_print)
destroy(this.dw_accountsummary)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_traitid = message.doubleparm	//parametre externe
select patient_id into :il_patid from traitements where traitement_id = :il_traitid;

ddlb_resp.event ue_remplir()
uf_affinfo()
remplirRappPaie()
cbrefresh()


end event

type ddlb_resp from dropdownlistbox within w_accountsummary
event ue_remplir ( )
integer x = 2363
integer y = 8
integer width = 1257
integer height = 1000
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
end type

event ue_remplir();long i
string ls_contact

// Ajout du choix tous

i = 1
addItem("Tous")
il_respid[i] = 0
i++

// Ajout des responsables

DECLARE listresp CURSOR FOR
	SELECT id_contact, prenom + ' ' + nom from t_contact where patient_id = :il_patid;
	
OPEN listresp;

FETCH listresp INTO :il_respid[i], :ls_contact;

DO WHILE SQLCA.SQLCode = 0
	
	addItem(ls_contact)
	i++
	FETCH listresp INTO :il_respid[i], :ls_contact;
	
LOOP

CLOSE listresp;
 
il_indresp = 1
selectItem(1)
end event

event selectionchanged;long ll_idcont

il_indresp = index
uf_affinfo()
remplirRappPaie()
end event

type cb_suiv from commandbutton within w_accountsummary
integer x = 1467
integer y = 1920
integer width = 677
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Phase suivante"
end type

event clicked;integer li_demandphase,li_nophase
long ll_traitid
select phase into :li_nophase from traitements where traitement_id = :il_traitid;
li_demandphase = li_nophase + 1
if li_demandphase > 0 then
	select traitement_id into :ll_traitid from traitements where patient_id = :il_patid and phase = :li_demandphase;
	if isnull(ll_traitid) = false and ll_traitid > 0 then
		il_traitid = ll_traitid
		remplirrapppaie()
	end if
end if
cbrefresh()
uf_affinfo()
end event

event constructor;if v_langue = 'an' then
	cb_suiv.Text = "Next phase"
end if
end event

type cb_prec from commandbutton within w_accountsummary
integer x = 791
integer y = 1920
integer width = 677
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Phase prédédante"
end type

event clicked;integer li_demandphase,li_nophase
long ll_traitid

select phase into :li_nophase from traitements where traitement_id = :il_traitid;
li_demandphase = li_nophase - 1
if li_demandphase > 0 then
	select traitement_id into :ll_traitid from traitements where patient_id = :il_patid and phase = :li_demandphase;
	if isnull(ll_traitid) = false and ll_traitid > 0 then
		il_traitid = ll_traitid
		remplirrapppaie()
	end if
end if
cbrefresh()
uf_affinfo()
end event

event constructor;if v_langue = 'an' then
	cb_prec.Text = "Previous phase"
end if
end event

type cb_close from commandbutton within w_accountsummary
integer x = 2853
integer y = 1920
integer width = 768
integer height = 112
integer taborder = 30
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

type cb_1 from commandbutton within w_accountsummary
integer x = 2144
integer y = 1920
integer width = 709
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

type cb_print from commandbutton within w_accountsummary
integer x = 9
integer y = 1920
integer width = 782
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

event clicked;string ls_mail[], ls_courriel
long k

dw_accountsummary.modify("datawindow.header.height = 1116")
ib_skipscroll = false

k = 1
DECLARE listemail CURSOR FOR 

	select top 3 courriel from (
		select email as courriel from t_contact where patient_id = :il_patid and isnull(email,'') <> ''
		union
		select email from patient where patient_id = :il_patid and isnull(email,'') <> ''
		union
		select email2 from patient where patient_id = :il_patid and isnull(email2,'') <> ''
		union
		select email3 from patient where patient_id = :il_patid and isnull(email3,'') <> ''
	) as t_courlist;

OPEN listemail;

	FETCH listemail INTO :ls_mail[k];
		
	DO WHILE SQLCA.SQLCODE = 0
		k++
		FETCH listemail INTO :ls_mail[k];
	LOOP
CLOSE listemail;


ls_courriel = unsplit(ls_mail,';')

/*
select isnull(email,''), isnull(email2,''), isnull(email3,'') 
	into :ls_email, :ls_email2,:ls_email3 
from patient where patient_id = :il_patid;

ls_courriel = ls_email
if not isnull(ls_email2) and ls_email2 <> "" then ls_courriel += ";" + ls_email2
if not isnull(ls_email3) and ls_email3 <> "" then ls_courriel +=	';' + ls_email3 
*/

gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)


gi_imp = 1
gb_datawindow = true
openwithparm(w_print_options,dw_accountsummary)

//string ls_langue,ls_ortho,ls_oadd,ls_oville,ls_oprov,ls_ozip,ls_otel
//long ll_rapppaie
//string ls_filter, ls_modal
//datawindowchild dwc_paie
//
//select rapppaie into :ll_rapppaie from t_options where ortho_id = :v_no_ortho;
//select dr_nom_complet,dr_adresse,dr_ville,dr_province,dr_code_postal,dr_tel_bur
//into :ls_ortho,:ls_oadd,:ls_oville,:ls_oprov,:ls_ozip,:ls_otel from ortho_id where ortho_id = :v_no_ortho;
//select langue into :ls_langue from patient where patient_id = :il_patid;
//if ls_langue = 'F' then
//	datastore ds_rapport_paiement_impression0
//	ds_rapport_paiement_impression0 = create datastore
//	ds_rapport_paiement_impression0.dataobject = "d_rapport_paiement_impression0"	
//	ds_rapport_paiement_impression0.SetTransObject(SQLCA)
//	ds_rapport_paiement_impression0.retrieve(il_traitid,v_no_ortho)
//	if ds_rapport_paiement_impression0.getChild('dw_2',dwc_paie) = -1 then
//		error_type(0)
//	end if
//	remplirrapppaieimp(dwc_paie)
//	ls_modal = gf_method(v_langue)
//	ds_rapport_paiement_impression0.object.dw_2.Object.mod.Values = ls_modal
//	ds_rapport_paiement_impression0.object.dw_2.object.t_ortho.text = ls_ortho
//	ds_rapport_paiement_impression0.object.dw_2.object.t_orthoadd.text = ls_oadd
//	ds_rapport_paiement_impression0.object.dw_2.object.t_orthoville.text = ls_oville + ' (' + ls_oprov + ')'
//	ds_rapport_paiement_impression0.object.dw_2.object.t_orthotel.text = string(ls_otel,"(@@@) @@@-@@@@")
//	if v_langue = 'an' then
//		ds_rapport_paiement_impression0.object.dw_2.object.datepaie_t.text = "Date"
//		ds_rapport_paiement_impression0.object.dw_2.object.montant_t.text = "Amount"
//		ds_rapport_paiement_impression0.object.dw_2.object.mod_t.text = "Method"
//	end if
//	gb_datawindow = false
//	openwithparm(w_print_options,ds_rapport_paiement_impression0)
//	destroy ds_rapport_paiement_impression0
//else
//	datastore ds_rapport_paiement_impression0an
//	ds_rapport_paiement_impression0an = create datastore
//	ds_rapport_paiement_impression0an.dataobject = "d_rapport_paiement_impression0an"
//	ds_rapport_paiement_impression0an.SetTransObject(SQLCA)
//	ds_rapport_paiement_impression0an.retrieve(il_traitid,v_no_ortho)
//	if ds_rapport_paiement_impression0an.getChild('dw_2',dwc_paie) = -1 then
//		error_type(0)
//	end if
//	remplirrapppaieimp(dwc_paie)
//	ls_modal = gf_method(v_langue)
//	ds_rapport_paiement_impression0an.object.dw_2.Object.mod.Values = ls_modal
//	ds_rapport_paiement_impression0an.object.dw_2.object.t_ortho.text = ls_ortho
//	ds_rapport_paiement_impression0an.object.dw_2.object.t_orthoadd.text = ls_oadd
//	ds_rapport_paiement_impression0an.object.dw_2.object.t_orthoville.text = ls_oville + ' (' + ls_oprov + ')'
//	ds_rapport_paiement_impression0an.object.dw_2.object.t_orthotel.text = string(ls_otel,"(@@@) @@@-@@@@")
//	if v_langue = 'an' then
//		ds_rapport_paiement_impression0an.object.dw_2.object.datepaie_t.text = "Date"
//		ds_rapport_paiement_impression0an.object.dw_2.object.montant_t.text = "Amount"
//		ds_rapport_paiement_impression0an.object.dw_2.object.mod_t.text = "Method"
//	end if
//	gb_datawindow = false
//	openwithparm(w_print_options,ds_rapport_paiement_impression0an)
//	destroy ds_rapport_paiement_impression0an
//end if
end event

event constructor;if v_langue = 'an' then
	this.Text = "Print"
end if
end event

type dw_accountsummary from u_dw within w_accountsummary
integer y = 112
integer width = 3621
integer height = 1792
integer taborder = 30
string title = "Account Summary"
string dataobject = "d_accountsummary"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;this.Modify("DataWindow.Print.Preview=yes")
if v_langue = 'an' then
	this.object.t_title.text = "ACCOUNT SUMMARY"
	this.object.tt_totfact.text = "Total charged:"
	this.object.tt_totpaie.text = "Total paid:"
	this.object.tt_balance.text = "Balance:"
	this.object.t_cheque.text = "Cheque #"
	this.object.t_fact.text = "Charges"
	this.object.t_paie.text = "Credits"
	this.object.t_montantdu.text = "Due Amount"
	this.object.t_printedon.text = "Printed on"
	this.object.t_date2.text = datean(today())
else
	this.object.t_date2.text = datefr(today())
end if
end event

