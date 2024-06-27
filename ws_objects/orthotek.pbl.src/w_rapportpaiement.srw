$PBExportHeader$w_rapportpaiement.srw
forward
global type w_rapportpaiement from w_child
end type
type cb_suiv from commandbutton within w_rapportpaiement
end type
type cb_prec from commandbutton within w_rapportpaiement
end type
type cb_close from commandbutton within w_rapportpaiement
end type
type cb_1 from commandbutton within w_rapportpaiement
end type
type cb_print from commandbutton within w_rapportpaiement
end type
type dw_rapport from u_dw within w_rapportpaiement
end type
end forward

global type w_rapportpaiement from w_child
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
cb_suiv cb_suiv
cb_prec cb_prec
cb_close cb_close
cb_1 cb_1
cb_print cb_print
dw_rapport dw_rapport
end type
global w_rapportpaiement w_rapportpaiement

type variables
private long il_traitid, il_patid
end variables

forward prototypes
public subroutine cbrefresh ()
public subroutine remplirrapppaie ()
public subroutine remplirrapppaieimp (datawindowchild dw_paie)
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

public subroutine remplirrapppaie ();//date ldt_paiedate
//dec{2} ld_montant
//string ls_mod, ls_modal
//long ll_row, ll_rapppaie
//
//ls_modal = gf_method(v_langue)
//dw_rappaie.Object.mod.Values = ls_modal
//select rapppaie into :ll_rapppaie from t_options where ortho_id = :v_no_ortho;
//
//DECLARE listpaie CURSOR FOR
//
//  SELECT paiement.date_paiement,   
//         paiement.montant_recu,   
//         paiement.paiement  
//    FROM paiement  
//   WHERE paiement.traitement_patient_id = :il_traitid;
//	
//OPEN listpaie;
//	
//FETCH listpaie INTO :ldt_paiedate,:ld_montant,:ls_mod;
//							  
//DO WHILE SQLCA.SQLCode = 0
//	ll_row = dw_rappaie.insertRow(0)
//	dw_rappaie.setItem(ll_row,'datepaie',ldt_paiedate)
//	dw_rappaie.setItem(ll_row,'montant',ld_montant)
//	dw_rappaie.setItem(ll_row,'mod',ls_mod)
//	FETCH listpaie INTO :ldt_paiedate,:ld_montant,:ls_mod;
//LOOP
//							  
//CLOSE listpaie;
//
//IF ll_rapppaie = 1 THEN
//
//	DECLARE listcpd CURSOR FOR
//		
//	  SELECT cheques_postdates.date_cheque,   
//				cheques_postdates.paiement,   
//				cheques_postdates.modalite
//		 FROM cheques_postdates
//		WHERE cheques_postdates.traitement_patient_id = :il_traitid  and
//				cheques_postdates.indicateur <> 1;
//				
//	OPEN listcpd;
//	
//	FETCH listcpd INTO :ldt_paiedate, :ld_montant, :ls_mod;
//							  
//	DO WHILE SQLCA.SQLCode = 0
//		ll_row = dw_rappaie.insertRow(0)
//		dw_rappaie.setItem(ll_row,'datepaie',ldt_paiedate)
//		dw_rappaie.setItem(ll_row,'montant',ld_montant)
//		dw_rappaie.setItem(ll_row,'mod',ls_mod)
//		FETCH listcpd INTO :ldt_paiedate, :ld_montant, :ls_mod;
//	LOOP
//		
//	CLOSE listcpd;
//END IF
//
//dw_rappaie.setSort("datepaie A")
//dw_rappaie.sort()
end subroutine

public subroutine remplirrapppaieimp (datawindowchild dw_paie);date ldt_paiedate
dec{2} ld_montant
string ls_mod, ls_modal
long ll_row, ll_rapppaie

select rapppaie into :ll_rapppaie from t_options where ortho_id = :v_no_ortho;

DECLARE listpaie CURSOR FOR

  SELECT paiement.date_paiement,   
         paiement.montant_recu,   
         paiement.paiement
			
    FROM paiement
   WHERE paiement.traitement_patient_id = :il_traitid;
	
OPEN listpaie;
	
FETCH listpaie INTO :ldt_paiedate,:ld_montant,:ls_mod;
							  
DO WHILE SQLCA.SQLCode = 0
	ll_row = dw_paie.insertRow(0)
	dw_paie.setItem(ll_row,'datepaie',ldt_paiedate)
	dw_paie.setItem(ll_row,'montant',ld_montant)
	dw_paie.setItem(ll_row,'mod',ls_mod)
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
				cheques_postdates.indicateur <> 1;
				
	OPEN listcpd;
	
	FETCH listcpd INTO :ldt_paiedate, :ld_montant, :ls_mod;
							  
	DO WHILE SQLCA.SQLCode = 0
		ll_row = dw_paie.insertRow(0)
		dw_paie.setItem(ll_row,'datepaie',ldt_paiedate)
		dw_paie.setItem(ll_row,'montant',ld_montant)
		dw_paie.setItem(ll_row,'mod',ls_mod)
		FETCH listcpd INTO :ldt_paiedate, :ld_montant, :ls_mod;
	LOOP
		
	CLOSE listcpd;
END IF

dw_paie.setSort("datepaie A")
dw_paie.sort()
end subroutine

on w_rapportpaiement.create
int iCurrent
call super::create
this.cb_suiv=create cb_suiv
this.cb_prec=create cb_prec
this.cb_close=create cb_close
this.cb_1=create cb_1
this.cb_print=create cb_print
this.dw_rapport=create dw_rapport
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_suiv
this.Control[iCurrent+2]=this.cb_prec
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_print
this.Control[iCurrent+6]=this.dw_rapport
end on

on w_rapportpaiement.destroy
call super::destroy
destroy(this.cb_suiv)
destroy(this.cb_prec)
destroy(this.cb_close)
destroy(this.cb_1)
destroy(this.cb_print)
destroy(this.dw_rapport)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_suiv from commandbutton within w_rapportpaiement
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

event clicked;//integer li_demandphase,li_nophase
//long ll_traitid
//select phase into :li_nophase from traitements where traitement_id = :il_traitid;
//li_demandphase = li_nophase + 1
//if li_demandphase > 0 then
//	select traitement_id into :ll_traitid from traitements where patient_id = :il_patid and phase = :li_demandphase;
//	if isnull(ll_traitid) = false and ll_traitid > 0 then
//		il_traitid = ll_traitid
//		dw_rapport_factures.Retrieve(il_traitid)
//		dw_rappaie.reset()
//		remplirrapppaie()
//	//	dw_rapport_paiements.Retrieve(il_traitid)
//	end if
//end if
//cbrefresh()
end event

event constructor;if v_langue = 'an' then
	cb_suiv.Text = "Next phase"
end if
end event

type cb_prec from commandbutton within w_rapportpaiement
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

event clicked;//integer li_demandphase,li_nophase
//long ll_traitid
//
//select phase into :li_nophase from traitements where traitement_id = :il_traitid;
//li_demandphase = li_nophase - 1
//if li_demandphase > 0 then
//	select traitement_id into :ll_traitid from traitements where patient_id = :il_patid and phase = :li_demandphase;
//	if isnull(ll_traitid) = false and ll_traitid > 0 then
//		il_traitid = ll_traitid
//		dw_rapport_factures.Retrieve(il_traitid)
//		dw_rappaie.reset()
//		remplirrapppaie()
//	//	dw_rapport_paiements.Retrieve(il_traitid)
//	end if
//end if
//cbrefresh()
end event

event constructor;if v_langue = 'an' then
	cb_prec.Text = "Previous phase"
end if
end event

type cb_close from commandbutton within w_rapportpaiement
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

type cb_1 from commandbutton within w_rapportpaiement
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

type cb_print from commandbutton within w_rapportpaiement
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

event clicked;//string ls_langue,ls_ortho,ls_oadd,ls_oville,ls_oprov,ls_ozip,ls_otel
//long ll_rapppaie
//string ls_filter, ls_modal
//datawindowchild dwc_paie
//
//SetPointer(HourGlass!)
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
//	//fonction lente
//	remplirrapppaieimp(dwc_paie)
//	ls_modal = gf_method('fr')
//	ds_rapport_paiement_impression0.object.dw_2.Object.mod.Values = ls_modal
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
//	ds_rapport_paiement_impression0an.retrieve(il_traitid,v_no_ortho)
//	if ds_rapport_paiement_impression0an.getChild('dw_2',dwc_paie) = -1 then
//		error_type(0)
//	end if
//	remplirrapppaieimp(dwc_paie)
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

type dw_rapport from u_dw within w_rapportpaiement
integer width = 3621
integer height = 1904
integer taborder = 10
string dataobject = "d_rapport_paiement_impression0"
boolean border = false
end type

event constructor;//SetTransObject(SQLCA)
//
//if v_langue = 'an' then
//	this.object.montant.text = "Amount"
//	this.object.t_2.text = "Treatment"
//end if

string ls_langue,ls_ortho,ls_oadd,ls_oville,ls_oprov,ls_ozip,ls_otel
long ll_rapppaie
string ls_filter, ls_modal
datawindowchild dwc_paie

SetPointer(HourGlass!)
select rapppaie into :ll_rapppaie from t_options where ortho_id = :v_no_ortho;
select dr_nom_complet,dr_adresse,dr_ville,dr_province,dr_code_postal,dr_tel_bur
into :ls_ortho,:ls_oadd,:ls_oville,:ls_oprov,:ls_ozip,:ls_otel from ortho_id where ortho_id = :v_no_ortho;
select langue into :ls_langue from patient where patient_id = :il_patid;
if ls_langue = 'F' then
	this.dataobject = "d_rapport_paiement_impression0"	
	this.SetTransObject(SQLCA)
	this.retrieve(il_traitid,v_no_ortho)
	if this.getChild('dw_2',dwc_paie) = -1 then
		error_type(0)
	end if
	//fonction lente
	remplirrapppaieimp(dwc_paie)
	ls_modal = gf_method('fr')
	this.object.dw_2.Object.mod.Values = ls_modal
	this.object.dw_2.object.t_ortho.text = ls_ortho
	this.object.dw_2.object.t_orthoadd.text = ls_oadd
	this.object.dw_2.object.t_orthoville.text = ls_oville + ' (' + ls_oprov + ')'
	this.object.dw_2.object.t_orthozip.text = string(ls_ozip,"@@@ @@@")
	this.object.dw_2.object.t_orthotel.text = string(ls_otel,"(@@@) @@@-@@@@")
	if v_langue = 'an' then
		this.object.dw_2.object.datepaie_t.text = "Date"
		this.object.dw_2.object.montant_t.text = "Amount"
		this.object.dw_2.object.mod_t.text = "Method"
	end if
	gb_datawindow = false
	openwithparm(w_print_options,this)
else
	this.dataobject = "d_rapport_paiement_impression0an"
	this.SetTransObject(SQLCA)
	this.retrieve(il_traitid,v_no_ortho)
	if this.getChild('dw_2',dwc_paie) = -1 then
		error_type(0)
	end if
	remplirrapppaieimp(dwc_paie)
	ls_modal = gf_method('an')
	this.object.dw_2.Object.mod.Values = ls_modal
	this.object.dw_2.object.t_ortho.text = ls_ortho
	this.object.dw_2.object.t_orthoadd.text = ls_oadd
	this.object.dw_2.object.t_orthoville.text = ls_oville + ' (' + ls_oprov + ')'
	this.object.dw_2.object.t_orthozip.text = string(ls_ozip,"@@@ @@@")
	this.object.dw_2.object.t_orthotel.text = string(ls_otel,"(@@@) @@@-@@@@")
	if v_langue = 'an' then
		this.object.dw_2.object.datepaie_t.text = "Date"
		this.object.dw_2.object.montant_t.text = "Amount"
		this.object.dw_2.object.mod_t.text = "Method"
	end if
	gb_datawindow = false
	openwithparm(w_print_options,this)
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

