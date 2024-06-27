$PBExportHeader$w_rapport_paiement.srw
forward
global type w_rapport_paiement from w_child
end type
type ddlb_resp from dropdownlistbox within w_rapport_paiement
end type
type cb_suiv from commandbutton within w_rapport_paiement
end type
type cb_prec from commandbutton within w_rapport_paiement
end type
type cb_close from commandbutton within w_rapport_paiement
end type
type cb_1 from commandbutton within w_rapport_paiement
end type
type cb_print from commandbutton within w_rapport_paiement
end type
type st_2 from statictext within w_rapport_paiement
end type
type st_1 from statictext within w_rapport_paiement
end type
type dw_rapport_factures from u_dw within w_rapport_paiement
end type
type dw_rappaie from u_dw within w_rapport_paiement
end type
end forward

global type w_rapport_paiement from w_child
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
ddlb_resp ddlb_resp
cb_suiv cb_suiv
cb_prec cb_prec
cb_close cb_close
cb_1 cb_1
cb_print cb_print
st_2 st_2
st_1 st_1
dw_rapport_factures dw_rapport_factures
dw_rappaie dw_rappaie
end type
global w_rapport_paiement w_rapport_paiement

type variables
private long il_traitid, il_patid, il_respid[], il_indresp
end variables

forward prototypes
public subroutine cbrefresh ()
public subroutine remplirrapppaie ()
public subroutine remplirrapppaieimp (ref datastore dw_paie)
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
string ls_mod, ls_modal
long ll_row, ll_rapppaie, ll_idcont

dw_rappaie.reset()

if il_indresp = 1 then
	setnull(ll_idcont)
else
	ll_idcont = il_respid[il_indresp]
end if

ls_modal = gf_method(v_langue)
dw_rappaie.Object.mod.Values = ls_modal
select isnull(rapppaie, 0) into :ll_rapppaie from t_options where ortho_id = :v_no_ortho;

DECLARE listpaie CURSOR FOR

  SELECT paiement.date_paiement,   
         paiement.montant_recu,   
         paiement.paiement  
    FROM paiement  
   WHERE paiement.traitement_patient_id = :il_traitid and
	      (paiement.id_contact = :ll_idcont or :ll_idcont is null);
	
OPEN listpaie;
	
FETCH listpaie INTO :ldt_paiedate,:ld_montant,:ls_mod;
							  
DO WHILE SQLCA.SQLCode = 0
	ll_row = dw_rappaie.insertRow(0)
	dw_rappaie.setItem(ll_row,'datepaie',ldt_paiedate)
	dw_rappaie.setItem(ll_row,'montant',ld_montant)
	dw_rappaie.setItem(ll_row,'mod',ls_mod)
	FETCH listpaie INTO :ldt_paiedate,:ld_montant,:ls_mod;
LOOP
							  
CLOSE listpaie;

IF ll_rapppaie = 1 THEN

	DECLARE listcpd CURSOR FOR
		
	  SELECT cheques_postdates.date_cheque,   
				cheques_postdates.paiement,   
				cheques_postdates.modalite
		 FROM cheques_postdates
		WHERE cheques_postdates.traitement_patient_id = :il_traitid  and
				cheques_postdates.indicateur <> '1' and
				(cheques_postdates.id_contact = :ll_idcont or :ll_idcont is null);
				
	OPEN listcpd;
	
	FETCH listcpd INTO :ldt_paiedate, :ld_montant, :ls_mod;
							  
	DO WHILE SQLCA.SQLCode = 0
		ll_row = dw_rappaie.insertRow(0)
		dw_rappaie.setItem(ll_row,'datepaie',ldt_paiedate)
		dw_rappaie.setItem(ll_row,'montant',ld_montant)
		dw_rappaie.setItem(ll_row,'mod',ls_mod)
		FETCH listcpd INTO :ldt_paiedate, :ld_montant, :ls_mod;
	LOOP
		
	CLOSE listcpd;
END IF

dw_rappaie.setSort("datepaie A")
dw_rappaie.sort()
end subroutine

public subroutine remplirrapppaieimp (ref datastore dw_paie);date ldt_paiedate
dec{2} ld_montant
string ls_mod, ls_modal
long ll_row = 0, ll_rapppaie, ll_idcont

dw_paie.reset()

if il_indresp = 1 then
	setnull(ll_idcont)
else
	ll_idcont = il_respid[il_indresp]
end if

select rapppaie into :ll_rapppaie from t_options where ortho_id = :v_no_ortho;

DECLARE listpaie CURSOR FOR

  SELECT paiement.date_paiement,
         paiement.montant_recu,   
         paiement.paiement			
    FROM paiement
   WHERE paiement.traitement_patient_id = :il_traitid and
	      (paiement.id_contact = :ll_idcont or :ll_idcont is null);
	
OPEN listpaie;
	
FETCH listpaie INTO :ldt_paiedate,:ld_montant,:ls_mod;
							  
DO WHILE SQLCA.SQLCode = 0
	ll_row ++
	dw_paie.object.dw_2[1].object.datepaie[ll_row] = ldt_paiedate
	dw_paie.object.dw_2[1].object.montant[ll_row] = ld_montant
	dw_paie.object.dw_2[1].object.mod[ll_row] = ls_mod
	FETCH listpaie INTO :ldt_paiedate,:ld_montant,:ls_mod;
LOOP
							  
CLOSE listpaie;

IF ll_rapppaie = 1 THEN

	DECLARE listcpd CURSOR FOR
		
	  SELECT cheques_postdates.date_cheque,   
				cheques_postdates.paiement,   
				cheques_postdates.modalite
		 FROM cheques_postdates
		WHERE cheques_postdates.traitement_patient_id = :il_traitid  and
				cheques_postdates.indicateur <> '1' and
				(cheques_postdates.id_contact = :ll_idcont or :ll_idcont is null);
				
	OPEN listcpd;
	
	FETCH listcpd INTO :ldt_paiedate, :ld_montant, :ls_mod;
							  
	DO WHILE SQLCA.SQLCode = 0
		ll_row ++
		dw_paie.object.dw_2[1].object.datepaie[ll_row] = ldt_paiedate
		dw_paie.object.dw_2[1].object.montant[ll_row] = ld_montant
		dw_paie.object.dw_2[1].object.mod[ll_row] = ls_mod
		FETCH listcpd INTO :ldt_paiedate, :ld_montant, :ls_mod;
	LOOP
		
	CLOSE listcpd;
END IF

dw_paie.setSort("datepaie A")
dw_paie.sort()
end subroutine

on w_rapport_paiement.create
int iCurrent
call super::create
this.ddlb_resp=create ddlb_resp
this.cb_suiv=create cb_suiv
this.cb_prec=create cb_prec
this.cb_close=create cb_close
this.cb_1=create cb_1
this.cb_print=create cb_print
this.st_2=create st_2
this.st_1=create st_1
this.dw_rapport_factures=create dw_rapport_factures
this.dw_rappaie=create dw_rappaie
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_resp
this.Control[iCurrent+2]=this.cb_suiv
this.Control[iCurrent+3]=this.cb_prec
this.Control[iCurrent+4]=this.cb_close
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.dw_rapport_factures
this.Control[iCurrent+10]=this.dw_rappaie
end on

on w_rapport_paiement.destroy
call super::destroy
destroy(this.ddlb_resp)
destroy(this.cb_suiv)
destroy(this.cb_prec)
destroy(this.cb_close)
destroy(this.cb_1)
destroy(this.cb_print)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_rapport_factures)
destroy(this.dw_rappaie)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_traitid = message.doubleparm	//parametre externe
long ll_idcont

select patient_id into :il_patid from traitements where traitement_id = :il_traitid;

ddlb_resp.event ue_remplir()

if il_indresp = 1 then
	setnull(ll_idcont)
else
	ll_idcont = il_respid[il_indresp]
end if
dw_rapport_factures.Retrieve(il_traitid,ll_idcont)
remplirRappPaie()
cbrefresh()


end event

type ddlb_resp from dropdownlistbox within w_rapport_paiement
event ue_remplir ( )
integer x = 2190
integer y = 28
integer width = 1257
integer height = 1000
integer taborder = 10
integer textsize = -10
integer weight = 700
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

if il_indresp = 1 then
	setnull(ll_idcont)
else
	ll_idcont = il_respid[il_indresp]
end if

dw_rapport_factures.Retrieve(il_traitid,ll_idcont)
remplirRappPaie()
end event

type cb_suiv from commandbutton within w_rapport_paiement
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
long ll_traitid, ll_idcont

if il_indresp = 1 then
	setnull(ll_idcont)
else
	ll_idcont = il_respid[il_indresp]
end if

select phase into :li_nophase from traitements where traitement_id = :il_traitid;
li_demandphase = li_nophase + 1
if li_demandphase > 0 then
	select traitement_id into :ll_traitid from traitements where patient_id = :il_patid and phase = :li_demandphase;
	if isnull(ll_traitid) = false and ll_traitid > 0 then
		il_traitid = ll_traitid
		dw_rapport_factures.Retrieve(il_traitid,ll_idcont)
		dw_rappaie.reset()
		remplirrapppaie()
	//	dw_rapport_paiements.Retrieve(il_traitid)
	end if
end if
cbrefresh()
end event

event constructor;if v_langue = 'an' then
	cb_suiv.Text = "Next phase"
end if
end event

type cb_prec from commandbutton within w_rapport_paiement
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
long ll_traitid, ll_idcont

if il_indresp = 1 then
	setnull(ll_idcont)
else
	ll_idcont = il_respid[il_indresp]
end if

select phase into :li_nophase from traitements where traitement_id = :il_traitid;
li_demandphase = li_nophase - 1
if li_demandphase > 0 then
	select traitement_id into :ll_traitid from traitements where patient_id = :il_patid and phase = :li_demandphase;
	if isnull(ll_traitid) = false and ll_traitid > 0 then
		il_traitid = ll_traitid
		dw_rapport_factures.Retrieve(il_traitid,ll_idcont)
		dw_rappaie.reset()
		remplirrapppaie()
	//	dw_rapport_paiements.Retrieve(il_traitid)
	end if
end if
cbrefresh()
end event

event constructor;if v_langue = 'an' then
	cb_prec.Text = "Previous phase"
end if
end event

type cb_close from commandbutton within w_rapport_paiement
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

type cb_1 from commandbutton within w_rapport_paiement
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
end type

type cb_print from commandbutton within w_rapport_paiement
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

event clicked;long ll_idcont, k
boolean lb_hideaccountsummaryheader
string ls_contact, ls_mail[], ls_courriel
datastore ds_accountsummary

if il_indresp = 1 then
	setnull(ll_idcont)
else
	ll_idcont = il_respid[il_indresp]
end if

SetPointer(HourGlass!)

//////////////////////////////////////////
//
// Nouveau Code
// Christian Rivard
// 2011-08-02
//
//	Le formulaire a été refait pour pouvoir permettre de cacher l'entête si l'option est cochée dans 'Correspondance'.
// L'ancien ne le permettait pas aisément.
//
//////////////////////////////////////////

ds_accountsummary = create datastore
ds_accountsummary.dataobject = 'd_rapport_paiement_remixed'
ds_accountsummary.settransobject(sqlca)
ds_accountsummary.retrieve(il_traitid,ll_idcont)

select hideaccountsummaryheader into :lb_hideaccountsummaryheader
from t_options where t_options.ortho_id = :v_no_ortho;

if lb_hideaccountsummaryheader then
	ds_accountsummary.object.ortho_id_dr_nom_complet.visible = 0
	ds_accountsummary.object.ortho_id_dr_adresse.visible = 0
	ds_accountsummary.object.compute_3.visible = 0
	ds_accountsummary.object.ortho_id_dr_code_postal.visible = 0
end if

if il_indresp = 1 then
	ds_accountsummary.object.t_resp.visible = false
	ds_accountsummary.object.t_re.visible = false
else
	ll_idcont = il_respid[il_indresp]
	select t_contact.nom || ', ' || t_contact.prenom into :ls_contact from t_contact where id_contact = :ll_idcont;
	ds_accountsummary.object.t_resp.text = ls_contact
end if

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

gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)

gb_datawindow = false
openwithparm(w_print_options, ds_accountsummary)
destroy ds_accountsummary

////////////////////
// Ancien Code
////////////////////

// string ls_langue,ls_ortho,ls_oadd,ls_oville,ls_oprov,ls_ozip,ls_otel
// string ls_filter, ls_modal
// datawindowchild dwc_paie
// long ll_rapppaie

//select isnull(rapppaie, 0) into :ll_rapppaie from t_options where ortho_id = :v_no_ortho;
//select dr_nom_complet,dr_adresse,dr_ville,dr_province,dr_code_postal,dr_tel_bur
//into :ls_ortho,:ls_oadd,:ls_oville,:ls_oprov,:ls_ozip,:ls_otel from ortho_id where ortho_id = :v_no_ortho;
//select langue into :ls_langue from patient where patient_id = :il_patid;
//if ls_langue = 'F' then
//	datastore ds_rapport_paiement_impression0
//	ds_rapport_paiement_impression0 = create datastore
//	ds_rapport_paiement_impression0.dataobject = "d_rapport_paiement_impression0"	
//	ds_rapport_paiement_impression0.SetTransObject(SQLCA)
//	ds_rapport_paiement_impression0.retrieve(il_traitid,v_no_ortho,ll_idcont,ll_rapppaie)
////	if ds_rapport_paiement_impression0.getChild('dw_2',dwc_paie) = -1 then
////		error_type(0)
////	end if
//	//fonction lente
////	ds_rapport_paiement_impression0
////	remplirrapppaieimp(ds_rapport_paiement_impression0)
//	ls_modal = gf_method('fr')
//	ds_rapport_paiement_impression0.object.dw_2.Object.paiement.Values = ls_modal
//	ds_rapport_paiement_impression0.object.dw_2.object.t_ortho.text = ls_ortho
//	ds_rapport_paiement_impression0.object.dw_2.object.t_orthoadd.text = ls_oadd
//	ds_rapport_paiement_impression0.object.dw_2.object.t_orthoville.text = ls_oville + ' (' + ls_oprov + ')'
//	ds_rapport_paiement_impression0.object.dw_2.object.t_orthozip.text = string(ls_ozip,"@@@ @@@")
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
//	ds_rapport_paiement_impression0an.retrieve(il_traitid,v_no_ortho,ll_idcont,ll_rapppaie)
//	if ds_rapport_paiement_impression0an.getChild('dw_2',dwc_paie) = -1 then
//		error_type(0)
//	end if
////	remplirrapppaieimp(dwc_paie)
//	ls_modal = gf_method('an')
//	ds_rapport_paiement_impression0an.object.dw_2.Object.mod.Values = ls_modal
//	ds_rapport_paiement_impression0an.object.dw_2.object.t_ortho.text = ls_ortho
//	ds_rapport_paiement_impression0an.object.dw_2.object.t_orthoadd.text = ls_oadd
//	ds_rapport_paiement_impression0an.object.dw_2.object.t_orthoville.text = ls_oville + ' (' + ls_oprov + ')'
//	ds_rapport_paiement_impression0an.object.dw_2.object.t_orthozip.text = string(ls_ozip,"@@@ @@@")
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

type st_2 from statictext within w_rapport_paiement
integer x = 1760
integer y = 168
integer width = 1682
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "Paiements"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Payments"
end if
end event

type st_1 from statictext within w_rapport_paiement
integer x = 229
integer y = 156
integer width = 1536
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "Factures"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Invoices"
end if
end event

type dw_rapport_factures from u_dw within w_rapport_paiement
integer x = 229
integer y = 240
integer width = 1536
integer height = 1664
integer taborder = 10
string dataobject = "d_rapport_factures"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)

if v_langue = 'an' then
	this.object.montant.text = "Amount"
	this.object.t_2.text = "Treatment"
end if



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

type dw_rappaie from u_dw within w_rapport_paiement
integer x = 1760
integer y = 240
integer width = 1682
integer height = 1664
integer taborder = 30
string title = "none"
string dataobject = "d_rapppaie"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	this.object.montant_t.text = "Amount"
	this.object.t_datepaie.text = "Date"
	this.object.mod_t.text = "Method"
end if
end event

