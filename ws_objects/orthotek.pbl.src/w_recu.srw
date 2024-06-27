$PBExportHeader$w_recu.srw
forward
global type w_recu from w_child
end type
type rb_standard2 from radiobutton within w_recu
end type
type rb_format2 from radiobutton within w_recu
end type
type rb_deuxsec from radiobutton within w_recu
end type
type rb_vierge from radiobutton within w_recu
end type
type rb_standard from radiobutton within w_recu
end type
type cb_3 from commandbutton within w_recu
end type
type st_recu from statictext within w_recu
end type
type ddlb_resp from u_ddlb within w_recu
end type
type cb_1 from commandbutton within w_recu
end type
type em_year from editmask within w_recu
end type
type cb_check from commandbutton within w_recu
end type
type st_4 from statictext within w_recu
end type
type sle_no_dossier from singlelineedit within w_recu
end type
type sle_prenom_nom from singlelineedit within w_recu
end type
type st_2 from statictext within w_recu
end type
type st_5 from statictext within w_recu
end type
type st_6 from statictext within w_recu
end type
type sle_age from singlelineedit within w_recu
end type
type sle_date_naissance from singlelineedit within w_recu
end type
type st_7 from statictext within w_recu
end type
type st_3 from statictext within w_recu
end type
type em_montant_du from editmask within w_recu
end type
type em_solde from editmask within w_recu
end type
type st_title from statictext within w_recu
end type
type dw_sommaire_paiement from u_dw within w_recu
end type
type cb_close from commandbutton within w_recu
end type
type cb_print from commandbutton within w_recu
end type
type rr_1 from roundrectangle within w_recu
end type
type dw_recu from u_dw within w_recu
end type
end forward

global type w_recu from w_child
string tag = "Reçu"
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
boolean ib_isupdateable = false
event ue_post_event ( )
rb_standard2 rb_standard2
rb_format2 rb_format2
rb_deuxsec rb_deuxsec
rb_vierge rb_vierge
rb_standard rb_standard
cb_3 cb_3
st_recu st_recu
ddlb_resp ddlb_resp
cb_1 cb_1
em_year em_year
cb_check cb_check
st_4 st_4
sle_no_dossier sle_no_dossier
sle_prenom_nom sle_prenom_nom
st_2 st_2
st_5 st_5
st_6 st_6
sle_age sle_age
sle_date_naissance sle_date_naissance
st_7 st_7
st_3 st_3
em_montant_du em_montant_du
em_solde em_solde
st_title st_title
dw_sommaire_paiement dw_sommaire_paiement
cb_close cb_close
cb_print cb_print
rr_1 rr_1
dw_recu dw_recu
end type
global w_recu w_recu

type variables
private long il_paiementid
private long il_patid
private long il_traitid
private datawindowchild dddwin
boolean ib_modifmontant = false
end variables

forward prototypes
public subroutine labelpatient ()
public subroutine sauve ()
public subroutine cocherecu ()
public subroutine uf_checkreceipt ()
public function boolean uf_receiptchecked ()
end prototypes

event ue_post_event();long ll_typerecu, ll_contid

labelpatient()

/*
dw_sommaire_paiement.Retrieve(il_traitid)
dw_sommaire_paiement.setRedraw(true)
dw_sommaire_paiement.selectRow(0,false)
dw_sommaire_paiement.selectRow(dw_sommaire_paiement.rowcount(),true)

dw_recu.insertRow(0)
dw_recu.event ue_filltab()
ddlb_resp.event ue_remplirresp()
*/


ddlb_resp.event ue_remplirresp()

dw_sommaire_paiement.setRedraw(false)
dw_sommaire_paiement.Retrieve(il_traitid)

ll_contid = long(ddlb_resp.of_getselecteddata())
if ll_contid = 0 then
	dw_sommaire_paiement.setFilter("")
else
	dw_sommaire_paiement.setFilter("id_contact = " + string(ll_contid))
end if
dw_sommaire_paiement.filter()

dw_sommaire_paiement.setRedraw(true)
dw_sommaire_paiement.selectRow(0,false)
dw_sommaire_paiement.selectRow(dw_sommaire_paiement.rowcount(),true)

dw_recu.insertRow(0)
dw_recu.event ue_filltab()





// Choisir la bonne option

select typerecu into :ll_typerecu from t_options where ortho_id = :v_no_ortho;
CHOOSE CASE ll_typerecu
	CASE 1, 3
		rb_standard.checked = true
	CASE 2
		rb_vierge.checked = true
	CASE 4
		rb_deuxsec.checked = true
	CASE 5
		rb_format2.checked = true
	CASE 6
		rb_standard2.checked = true
END CHOOSE


//if w_traitements.IB_PERIODIC then
//	if dw_recup.GetChild('paiement_id_contact', dddwin) = -1 then
//		error_type(0)
//	end if
//	dw_recup.SetFocus()
//	cb_check.enabled = true
//else
//	if dw_recu.GetChild('paiement_id_contact', dddwin) = -1 then
//		error_type(0)
//	end if
//	dw_recu.SetFocus()
//	cb_check.enabled = false
//end if
//dddwin.setTransObject(SQLCA)
//dddwin.setFilter("patient_id = " + string(il_patid)) 
//dddwin.retrieve()
//
end event

public subroutine labelpatient ();//long enr, v_patient_id, v_dossier
//string v_nom, v_prenom
//date v_naissance
//dec{2} v_montant_original, v_montant_paye, v_solde, v_montant_du
//enr = w_traitements.dw_traitements.getrow()
//v_patient_id = w_traitements.dw_traitements.getitemnumber(enr,'patient_id')
//v_montant_original = w_traitements.dw_traitements.getitemnumber(enr,'montant_original')
//v_montant_paye = w_traitements.dw_traitements.getitemnumber(enr,'montant_paye')
//v_montant_du = w_traitements.dw_traitements.getitemnumber(enr,'montant_du')
//SELECT patient_nom, patient_prenom, date_naissance, no_dossier into :v_nom,:v_prenom,:v_naissance,:v_dossier from patient where patient_id = :v_patient_id;
//sle_prenom_nom.text = v_nom +" "+ v_prenom
//sle_age.text = calculage(v_naissance)
//sle_no_dossier.text = string(v_dossier)
//sle_date_naissance.text = string(v_naissance)
//v_solde = v_montant_original - v_montant_paye
//em_solde.text = string(v_solde)
//em_montant_du.text = string(v_montant_du)
//
string ls_nom, ls_prenom, ls_age, ls_nodoss
date ldt_naissance
dec{2} ld_frais, ld_frais1, ld_montantpaye, ld_solde, ld_montantdu

select sum(montant) into :ld_frais from factures_traitements where traitement_id = :il_traitid;
if isnull(ld_frais) then ld_frais = 0  
select sum(montant) into :ld_frais1 from factures_traitements where traitement_id = :il_traitid and date_facture <= today();
if isnull(ld_frais1) then ld_frais1 = 0 
select sum(montant_recu) into :ld_montantpaye from paiement where traitement_patient_id = :il_traitid;
if isnull(ld_montantpaye) then ld_montantpaye = 0
SELECT patient_nom, patient_prenom, date_naissance, new_dossier into :ls_nom,:ls_prenom,:ldt_naissance,:ls_nodoss from patient where patient_id = :il_patid;
sle_prenom_nom.text = ls_nom +" "+ ls_prenom
ls_age = calculage(ldt_naissance)
sle_age.text = ls_age
sle_no_dossier.text = ls_nodoss
sle_date_naissance.text = string(ldt_naissance)
ld_solde = ld_frais - ld_montantpaye
em_solde.text = string(ld_solde)
ld_montantdu = ld_frais1 - ld_montantpaye
em_montant_du.text = string(ld_montantdu)
//em_totfact.text = string(ld_frais)
//em_totpaie.text = string(ld_montantpaye)
end subroutine

public subroutine sauve ();if dw_sommaire_paiement.update() = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
	error_type(50)
end if




end subroutine

public subroutine cocherecu ();long ll_paiementid, ll_row, ll_nbrow, i, ll_idcont, ll_idcontpaiement
date ldt_datepaiement, ldt_begin, ldt_end


for i = 1 to dw_sommaire_paiement.rowcount()
	
	if dw_sommaire_paiement.isselected(i) then
		dw_sommaire_paiement.setitem(i,'recu','1')
	end if
	
next








//if w_traitements.IB_PERIODIC then
//	ll_nbrow = dw_sommaire_paiement.rowcount()
//	ll_idcont = dw_recup.getitemnumber(dw_recup.getrow(),'paiement_id_contact')
//	ldt_begin = dw_recup.getitemdate(dw_recup.getrow(),'paiement_date_debut_recu')
//	ldt_end = dw_recup.getitemdate(dw_recup.getrow(),'paiement_date_fin_recu')
//	for i = 1 to ll_nbrow
//		ldt_datepaiement = dw_sommaire_paiement.getitemdate(i,'date_paiement')
//		ll_idcontpaiement = dw_sommaire_paiement.getitemnumber(i,'id_contact')
//		if ldt_datepaiement >= ldt_begin and ldt_datepaiement <= ldt_end and ll_idcont = ll_idcontpaiement then
//			dw_sommaire_paiement.setitem(i,'recu','1')
//		end if
//	next
//else
//	ll_paiementid = dw_recu.getitemnumber(dw_recu.getrow(),'paiement_paiement_id')
//	ll_row = dw_sommaire_paiement.find("paiement_id = " + string(ll_paiementid),0,dw_sommaire_paiement.rowcount())
//	dw_sommaire_paiement.setitem(ll_row,'recu','1')
//end if
//
//
end subroutine

public subroutine uf_checkreceipt ();//date ldt_start,ldt_end
//
////cocher les recus
//ldt_start = dw_recup.getitemdate(1,'paiement_date_debut_recu')
//ldt_end = dw_recup.getitemdate(1,'paiement_date_fin_recu')
//update paiement set recu = '1' where date_paiement between :ldt_start and :ldt_end and traitement_patient_id = :il_traitid;
//commit using sqlca;
end subroutine

public function boolean uf_receiptchecked ();//integer li_receipt
//date ldt_start,ldt_end
//
////cocher les recus
//ldt_start = dw_recup.getitemdate(1,'paiement_date_debut_recu')
//ldt_end = dw_recup.getitemdate(1,'paiement_date_fin_recu')
//select count(*) into :li_receipt from paiement where recu = '0' and date_paiement between :ldt_start and :ldt_end and traitement_patient_id = :il_traitid;
//if li_receipt > 0 then
//	return false
//else
	return true
//end if
end function

on w_recu.create
int iCurrent
call super::create
this.rb_standard2=create rb_standard2
this.rb_format2=create rb_format2
this.rb_deuxsec=create rb_deuxsec
this.rb_vierge=create rb_vierge
this.rb_standard=create rb_standard
this.cb_3=create cb_3
this.st_recu=create st_recu
this.ddlb_resp=create ddlb_resp
this.cb_1=create cb_1
this.em_year=create em_year
this.cb_check=create cb_check
this.st_4=create st_4
this.sle_no_dossier=create sle_no_dossier
this.sle_prenom_nom=create sle_prenom_nom
this.st_2=create st_2
this.st_5=create st_5
this.st_6=create st_6
this.sle_age=create sle_age
this.sle_date_naissance=create sle_date_naissance
this.st_7=create st_7
this.st_3=create st_3
this.em_montant_du=create em_montant_du
this.em_solde=create em_solde
this.st_title=create st_title
this.dw_sommaire_paiement=create dw_sommaire_paiement
this.cb_close=create cb_close
this.cb_print=create cb_print
this.rr_1=create rr_1
this.dw_recu=create dw_recu
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_standard2
this.Control[iCurrent+2]=this.rb_format2
this.Control[iCurrent+3]=this.rb_deuxsec
this.Control[iCurrent+4]=this.rb_vierge
this.Control[iCurrent+5]=this.rb_standard
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.st_recu
this.Control[iCurrent+8]=this.ddlb_resp
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.em_year
this.Control[iCurrent+11]=this.cb_check
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.sle_no_dossier
this.Control[iCurrent+14]=this.sle_prenom_nom
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.st_5
this.Control[iCurrent+17]=this.st_6
this.Control[iCurrent+18]=this.sle_age
this.Control[iCurrent+19]=this.sle_date_naissance
this.Control[iCurrent+20]=this.st_7
this.Control[iCurrent+21]=this.st_3
this.Control[iCurrent+22]=this.em_montant_du
this.Control[iCurrent+23]=this.em_solde
this.Control[iCurrent+24]=this.st_title
this.Control[iCurrent+25]=this.dw_sommaire_paiement
this.Control[iCurrent+26]=this.cb_close
this.Control[iCurrent+27]=this.cb_print
this.Control[iCurrent+28]=this.rr_1
this.Control[iCurrent+29]=this.dw_recu
end on

on w_recu.destroy
call super::destroy
destroy(this.rb_standard2)
destroy(this.rb_format2)
destroy(this.rb_deuxsec)
destroy(this.rb_vierge)
destroy(this.rb_standard)
destroy(this.cb_3)
destroy(this.st_recu)
destroy(this.ddlb_resp)
destroy(this.cb_1)
destroy(this.em_year)
destroy(this.cb_check)
destroy(this.st_4)
destroy(this.sle_no_dossier)
destroy(this.sle_prenom_nom)
destroy(this.st_2)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.sle_age)
destroy(this.sle_date_naissance)
destroy(this.st_7)
destroy(this.st_3)
destroy(this.em_montant_du)
destroy(this.em_solde)
destroy(this.st_title)
destroy(this.dw_sommaire_paiement)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.rr_1)
destroy(this.dw_recu)
end on

event open;call super::open;this.postevent('ue_post_event')



end event

event activate;if message.doubleparm > 0 then
	il_paiementid = message.doubleparm  //para ext
end if
select traitement_patient_id into :il_traitid from paiement where paiement_id = :il_paiementid;
select patient_id into :il_patid from traitements where traitement_id = :il_traitid;
gf_uhelp(il_patid)

end event

type rb_standard2 from radiobutton within w_recu
integer x = 357
integer y = 4
integer width = 334
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Standard 2"
end type

event clicked;dw_recu.setTabOrder("paiement_somme_recu",30)
end event

type rb_format2 from radiobutton within w_recu
integer x = 1760
integer width = 334
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Format 2"
end type

event clicked;dw_recu.setTabOrder("paiement_somme_recu",0)
end event

type rb_deuxsec from radiobutton within w_recu
integer x = 1408
integer width = 334
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "2 sections"
end type

event clicked;dw_recu.setTabOrder("paiement_somme_recu",0)
end event

type rb_vierge from radiobutton within w_recu
integer x = 1056
integer width = 334
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vierge"
end type

event clicked;dw_recu.setTabOrder("paiement_somme_recu",30)
end event

type rb_standard from radiobutton within w_recu
integer x = 704
integer width = 334
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Standard"
end type

event clicked;dw_recu.setTabOrder("paiement_somme_recu",30)
end event

type cb_3 from commandbutton within w_recu
integer x = 786
integer y = 1920
integer width = 2021
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

type st_recu from statictext within w_recu
integer x = 50
integer y = 592
integer width = 251
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Recu de: "
boolean focusrectangle = false
end type

type ddlb_resp from u_ddlb within w_recu
event ue_remplirresp ( )
integer x = 366
integer y = 580
integer width = 1714
integer height = 780
integer taborder = 70
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event ue_remplirresp();long ll_contid, ll_pat, i = 1, ll_index, ll_idcont, ll_index2, ll_idcont2, ll_payeur
string ls_nom
date ldt_debut, ldt_fin
dec{2} ld_montpaie

of_addItem('Tous',0)
ll_index2 = 0

DECLARE listresp CURSOR FOR
	select id_contact, prenom || ' ' || nom, pat, isnull(payeur,0) from t_contact where patient_id = :il_patid;
	
OPEN listresp;

FETCH listresp INTO :ll_contid, :ls_nom, :ll_pat, :ll_payeur;

DO WHILE SQLCA.SQLCode = 0
	
	of_addItem(ls_nom,ll_contid)
	i++
	if ll_payeur = 1 then
		ll_index2 = i
		ll_idcont2 = ll_contid
	end if
	if ll_pat = 1 then 
		ll_index = i
		ll_idcont = ll_contid
	end if

	FETCH listresp INTO :ll_contid, :ls_nom, :ll_pat, :ll_payeur;
	
LOOP

CLOSE listresp;

if ll_index2 > 0 then
	ll_index = ll_index2
	ll_idcont = ll_idcont2
end if

of_selectItem(ll_index)

dw_sommaire_paiement.setRedraw(false)
if ll_index = 0 then
	dw_sommaire_paiement.setFilter("")
else
	dw_sommaire_paiement.setFilter("id_contact = " + string(ll_idcont))
end if
dw_sommaire_paiement.filter()
dw_sommaire_paiement.setRedraw(true)
//if w_traitements.IB_PERIODIC then
//	ll_idcont = long(of_getselecteddata())
//	if ll_idcont = 0 then setnull(ll_idcont)
//	ldt_debut = dw_recup.getItemDate(dw_recup.getRow(),'paiement_date_debut_recu')
//	ldt_fin = dw_recup.getItemDate(dw_recup.getRow(),'paiement_date_fin_recu')
//	select isnull(sum(isnull(montant_recu,0)),0) into :ld_montpaie 
//	from paiement
//	where date_paiement between :ldt_debut AND :ldt_fin 
//	and (id_contact = :ll_idcont or :ll_idcont is null) 
//	and paiement.traitement_patient_id = :il_traitid;
//	dw_recup.setItem(dw_recup.getRow(),'paiement_somme_recu',ld_montpaie)
//end if
end event

event selectionchanged;call super::selectionchanged;long ll_contid

dw_sommaire_paiement.setRedraw(false)
ll_contid = long(of_getselecteddata())
if ll_contid = 0 then
	dw_sommaire_paiement.setFilter("")
else
	dw_sommaire_paiement.setFilter("id_contact = " + string(ll_contid))
end if
dw_sommaire_paiement.filter()

dw_sommaire_paiement.SetSort('date_paiement A')
dw_sommaire_paiement.Sort()

dw_sommaire_paiement.setRedraw(true)
dw_sommaire_paiement.selectRow(0,false)
dw_sommaire_paiement.selectRow(dw_sommaire_paiement.rowcount(),true)
dw_recu.event ue_filltab()

//long ll_idcont,ll_norecu
//date ldt_debut, ldt_fin
//dec{2} ld_montpaie
// 
//if w_traitements.IB_PERIODIC then
//	ll_idcont = long(of_getselecteddata())
//	if ll_idcont = 0 then setnull(ll_idcont)
//	ldt_debut = dw_recup.getItemDate(dw_recup.getRow(),'paiement_date_debut_recu')
//	ldt_fin = dw_recup.getItemDate(dw_recup.getRow(),'paiement_date_fin_recu')
//	select isnull(sum(isnull(montant_recu,0)),0),isnull(sum(isnull(paiement_id,0)),0) into :ld_montpaie, :ll_norecu
//	from paiement
//	where date_paiement between :ldt_debut AND :ldt_fin 
//	and (id_contact = :ll_idcont or :ll_idcont is null) 
//	and paiement.traitement_patient_id = :il_traitid;
//	dw_recup.setItem(dw_recup.getRow(),'paiement_somme_recu',ld_montpaie)
//	dw_recup.object.t_norecu.text = string(ll_norecu)
//	dw_recup.accepttext()
//	if dw_recup.update() = 1 then
//		commit using SQLCA;
//	else
//		rollback using SQLCA;
//	end if
//end if
end event

type cb_1 from commandbutton within w_recu
boolean visible = false
integer x = 782
integer y = 1920
integer width = 293
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer duplicata"
end type

event constructor;if v_langue = 'an' then
	this.text = 'Print Copy'
end if
end event

event clicked;//string ls_langue
//int li_recunue,li_typerecu
//dec {2} somme
//date ldt_paiement, ldt_date1, ldt_date2
//datastore ds_recuimp2sec
//
//cocherecu()
//sauve()
//
//select isnull(langue, '') into :ls_langue from patient where patient_id = :il_patid;
//
//if ls_langue <> 'F' and ls_langue <> 'A' then
//	open(w_choixlangue)
//	ls_langue = w_patient.vi_langage
//	
//	if ls_langue <> 'F' and ls_langue <> 'A' then
//		error_type(0)
//		return 0
//	end if
//end if
//
//select recuimpnue,typerecu into :li_recunue,:li_typerecu from t_options where ortho_id = :v_no_ortho;
//choose case li_recunue
//	case 1
//		if not w_traitements.ib_periodic then
////			if ls_langue = 'F' then
//				imprecunue()
////			elseif ls_langue = 'A' then
////				imprecunuean()
////			end if
//		else
//			if ls_langue = 'F' then
//				imprecunuepfr()
//			elseif ls_langue = 'A' then
//				imprecunuepan()
//			end if
//		end if
//	case 2
//		if not w_traitements.ib_periodic then
//			ds_recuimp2sec = create datastore
//			ds_recuimp2sec.dataobject = "d_recu2sec"
//			ds_recuimp2sec.SetTransObject(SQLCA)
//			ds_recuimp2sec.retrieve(il_paiementid)
//			select date_paiement,montant_recu into :ldt_paiement,:somme from paiement where paiement_id = :il_paiementid;
//			ds_recuimp2sec.setitem(ds_recuimp2sec.getrow(),"paiement_somme_recu",somme)
//			
//			gb_datawindow = false
//			openwithparm(w_print_options,ds_recuimp2sec)
//			if error_type(205) = 1 then
//				cocherecu()
//	//			sauve()
//			end if
//			destroy ds_recuimp2sec
//		else
//			ds_recuimp2sec = create datastore
//			ds_recuimp2sec.dataobject = "d_recu2secp"
//			ds_recuimp2sec.SetTransObject(SQLCA)
//			ldt_date1 = dw_recup.getitemdate(1,'paiement_date_debut_recu')
//			ldt_date2 = dw_recup.getitemdate(1,'paiement_date_fin_recu')
//			ds_recuimp2sec.retrieve(ldt_date1,ldt_date2,v_no_ortho,il_patid)
//			if ls_langue = 'F' then
//				ds_recuimp2sec.object.t_intdate1.text = "Du " + string(ldt_date1,"dd/mm/yyyy") + " au " + string(ldt_date2,"dd/mm/yyyy")
//				ds_recuimp2sec.object.t_intdate2.text = "Du " + string(ldt_date1,"dd/mm/yyyy") + " au " + string(ldt_date2,"dd/mm/yyyy")
//			elseif ls_langue = 'A' then
//				ds_recuimp2sec.object.t_intdate1.text = "From " + string(ldt_date1,"dd/mm/yyyy") + " to " + string(ldt_date2,"dd/mm/yyyy")
//				ds_recuimp2sec.object.t_intdate2.text = "From " + string(ldt_date1,"dd/mm/yyyy") + " to " + string(ldt_date2,"dd/mm/yyyy")
//			end if
//			ds_recuimp2sec.setItem(ds_recuimp2sec.getRow(),'montrecu',dw_recup.getItemNumber(1,'paiement_somme_recu'))
////			select date_paiement,montant_recu into :ldt_paiement,:somme from paiement where paiement_id = :il_paiementid;
////			ds_recuimp2sec.setitem(ds_recuimp2sec.getrow(),"paiement_somme_recu",somme)
////			
//			gb_datawindow = false
//			openwithparm(w_print_options,ds_recuimp2sec)
//			if error_type(205) = 1 then
//				cocherecu()
//	//			sauve()
//			end if
//			destroy ds_recuimp2sec
//		end if
//	case else
//		if not w_traitements.ib_periodic then
////			if ls_langue = 'F' then
//				imprecu()
////			elseif ls_langue = 'A' then
////				imprecu()
////			end if
//		else
//			if ls_langue = 'F' then
//				imprecup('d_recupimpfr',true)
//			elseif ls_langue = 'A' then
//				imprecup('d_recupimpan',true)
//			end if
//		end if
//end choose
//
end event

type em_year from editmask within w_recu
boolean visible = false
integer x = 2377
integer y = 1928
integer width = 375
integer height = 96
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "yyyy"
boolean spin = true
double increment = 1
string minmax = " ~~"
end type

event constructor;this.text = string(today())
end event

type cb_check from commandbutton within w_recu
boolean visible = false
integer x = 1573
integer y = 1920
integer width = 293
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer reçu annuel"
end type

event clicked;////////////////////////////////////////////
////
//// Par: Eric Vezina ing.
//// Date: 27 novembre 2004
//// Description: Imprime un recu annuel pour l'année demandé
////
////////////////////////////////////////////
//
//integer li_recunue
//string ls_langue
//
//select langue into :ls_langue from patient where patient_id = :il_patid;
//select recuimpnue into :li_recunue from t_options where ortho_id = :v_no_ortho;
//if li_recunue = 1 then
//	if ls_langue = 'F' then
////		imprecunueannuelfr()
//	elseif ls_langue = 'A' then
////		imprecunueannuelan()
//	else
//		open(w_choixlangue)
//		if w_patient.vi_langage = 'F' then
////			imprecunueannuelfr()
//		elseif w_patient.vi_langage = 'A' then
////			imprecunueannuelan()
//		else
//			error_type(0)
//		end if
//	end if
//else
//	if ls_langue = 'F' then
//		imprecuannuelfr()
//	elseif ls_langue = 'A' then
//		imprecuannuelan()
//	else
//		open(w_choixlangue)
//		if w_patient.vi_langage = 'F' then
//			imprecuannuelfr()
//		elseif w_patient.vi_langage = 'A' then
//			imprecuannuelan()
//		else
//			error_type(0)
//		end if
//	end if
//end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print annual receipt'
end if
end event

type st_4 from statictext within w_recu
integer x = 882
integer y = 256
integer width = 393
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
boolean enabled = false
string text = "No dossier:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_4.text = 'File #:'
end if
end event

type sle_no_dossier from singlelineedit within w_recu
integer x = 1307
integer y = 256
integer width = 590
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 80269524
string text = "# dossier"
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type sle_prenom_nom from singlelineedit within w_recu
integer x = 357
integer y = 140
integer width = 1682
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 80269524
string text = "nom prenom"
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type st_2 from statictext within w_recu
integer x = 50
integer y = 256
integer width = 178
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "Âge:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Age:'
end if
end event

type st_5 from statictext within w_recu
integer x = 50
integer y = 364
integer width = 786
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "Date de naissance:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_5.text = 'Birthdate:'
end if
end event

type st_6 from statictext within w_recu
integer x = 50
integer y = 468
integer width = 297
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "Solde:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_6.text = 'Balance:'
end if
end event

type sle_age from singlelineedit within w_recu
integer x = 283
integer y = 256
integer width = 448
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "age"
boolean border = false
boolean displayonly = true
end type

type sle_date_naissance from singlelineedit within w_recu
integer x = 832
integer y = 364
integer width = 846
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "date de naissance"
boolean border = false
boolean displayonly = true
end type

type st_7 from statictext within w_recu
integer x = 882
integer y = 468
integer width = 425
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "Montant dû:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_7.text = 'Due amount:'
end if
end event

type st_3 from statictext within w_recu
integer x = 50
integer y = 140
integer width = 297
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "Patient:"
boolean focusrectangle = false
end type

type em_montant_du from editmask within w_recu
integer x = 1330
integer y = 468
integer width = 466
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "0"
boolean border = false
boolean displayonly = true
maskdatatype maskdatatype = decimalmask!
string mask = "[currency(7)]"
end type

type em_solde from editmask within w_recu
integer x = 384
integer y = 468
integer width = 453
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "0"
boolean border = false
boolean displayonly = true
maskdatatype maskdatatype = decimalmask!
string mask = "[currency(7)]"
end type

type st_title from statictext within w_recu
integer x = 14
integer width = 654
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Reçus"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Receipts'
end if
end event

type dw_sommaire_paiement from u_dw within w_recu
event ue_fillrecu ( date adt_datemin,  date adt_datemax )
integer x = 2094
integer y = 4
integer width = 1531
integer height = 1900
string title = "Sommaire paiements"
string dataobject = "d_sommaire_paiement"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_fillrecu(date adt_datemin, date adt_datemax);long i
date ldt_date
dec{2} ld_montant = 0

selectRow(0,false)
for i = 1 to rowcount()
	
	ldt_date = getItemDate(i,'date_paiement')
	if ldt_date >= adt_datemin and ldt_date <= adt_datemax then
		selectRow(i,true)
		ld_montant += getItemNumber(i,'montant_recu')
	end if
	
next

dw_recu.setItem(dw_recu.getRow(),'paiement_somme_recu',ld_montant)
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
if v_langue = 'an' then
	this.object.t_montant.text = 'Amount'
	this.object.t_receipt.text = 'Receipt'
end if
this.object.paiement.values = gf_method(v_langue)

end event

event retrieveend;setRedraw(false)
this.scrolltorow(this.Find("string(paiement_id) = '" + string(message.doubleparm) + "'",1, rowcount))
setRedraw(true)
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

event rowfocuschanged;///**************************************************
//Créé par: Dave Tremblay
//Créé le: 31-08-2004
//Modifié par: Dave Tremblay
//Modifié le: 31-08-2004
//
//Cette fonction permet de changer les reçus
//
//***************************************************/
//
//long ll_idcont
//date ldt_debut, ldt_fin
//dec{2} ld_montpaie
//
//if rowcount() > 0 then
//	il_paiementid = getItemNumber(currentRow,'paiement_id')
//	if w_traitements.IB_PERIODIC then
//		dw_recup.retrieve(il_paiementid)
//		ll_idcont = getItemNumber(currentRow,'id_contact')
//		if ll_idcont = 0 then setnull(ll_idcont)
//		ldt_debut = getItemDate(currentRow,'date_paiement')
//		ldt_fin = getItemDate(currentRow,'date_paiement')
//		select isnull(sum(isnull(montant_recu,0)),0) into :ld_montpaie 
//		from paiement
//		where date_paiement between :ldt_debut AND :ldt_fin 
//		and (id_contact = :ll_idcont or :ll_idcont is null) 
//		and paiement.traitement_patient_id = :il_traitid;
//		dw_recup.setItem(dw_recup.getRow(),'paiement_somme_recu',ld_montpaie)
//		dw_recup.setItem(dw_recup.getRow(),'paiement_date_debut_recu',ldt_debut)
//		dw_recup.setItem(dw_recup.getRow(),'paiement_date_fin_recu',ldt_fin)
//	else
//		dw_recu.retrieve(il_paiementid)
//		ll_idcont = getItemNumber(currentRow,'id_contact')
//	end if
//	ddlb_resp.of_selectitem(ll_idcont,0, false)
//end if
end event

event clicked;call super::clicked;long i, j = 1, ll_tab[]

if row > 0 then
	if isselected(row) then
		selectRow(row,false)
	else
		selectRow(row,true)
	end if
	
	dw_recu.event ue_filltab()
	
end if
end event

type cb_close from commandbutton within w_recu
integer x = 2811
integer y = 1920
integer width = 814
integer height = 108
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

event clicked;//refresh
w_traitements.tab_sommaires.tabpage_paiements.dw_sommaire_paiement.retrieve(w_traitements.il_traitid)
if isvalid(w_paiement) then
	w_paiement.dw_paiements_traitement.retrieve(w_paiement.il_traitid)
end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_print from commandbutton within w_recu
integer y = 1920
integer width = 782
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer reçu"
end type

event clicked;long ll_tab[], ll_idcont, i, j = 1, k = 1
string ls_email, ls_email2, ls_email3, ls_courriel, ls_note,ls_mail[]
date ldt_debut, ldt_fin
dec{2} ld_montant
datastore ds_recuimp
n_ds ds_recustd

ds_recuimp = create datastore

dw_recu.acceptText()
if rb_standard.checked then
	ds_recuimp.dataobject = "d_recuimp"
elseif rb_vierge.checked then
	ds_recuimp.dataobject = "d_recunueimp"
	ds_recuSTD = create n_ds
	ds_recuSTD.dataobject = "d_recuparemail"
	ds_recuSTD.setTransObject(SQLCA)
elseif rb_deuxsec.checked then
	ds_recuimp.dataobject = "d_recu2sec"
elseif rb_format2.checked then
	ds_recuimp.dataobject = "d_recumodel2"
elseif rb_standard2.checked then
	ds_recuimp.dataobject= "d_recuimp2"
	
end if

ds_recuimp.SetTransObject(SQLCA)

// Aller chercher les IDs

for i = 1 to dw_sommaire_paiement.rowcount()
	
	if dw_sommaire_paiement.isselected(i) then
		ll_tab[j] = dw_sommaire_paiement.getItemNumber(i,'paiement_id')
		j++
	end if
	
next

ll_idcont = long(ddlb_resp.of_getSelecteddata( ))
if ll_idcont = 0 then setnull(ll_idcont)
ls_note = dw_recu.getItemstring(dw_recu.getRow(),'paiement_recunote')

for j = 1 to upperbound(ll_tab)
	update  paiement set recunote = :ls_note where paiement_id = :ll_tab[j];
	error_type(-1)
next

ds_recuimp.retrieve('P',ll_tab,ll_idcont)

if rb_vierge.checked then
	ds_recuSTD.retrieve('P', ll_tab, ll_idcont)
end if

// Modifier l'intervalle de date sur le recu

ldt_debut =  dw_recu.getItemDate(dw_recu.getRow(),'paiement_date_debut_recu')
ldt_fin = dw_recu.getItemDate(dw_recu.getRow(),'paiement_date_fin_recu')

ds_recuimp.setItem(ds_recuimp.getRow(),'mindaterecu',ldt_debut)
ds_recuimp.setItem(ds_recuimp.getRow(),'maxdaterecu',ldt_fin)

if rb_vierge.checked then
	ds_recuSTD.setItem(ds_recuSTD.getRow(),'mindaterecu',ldt_debut)
	ds_recuSTD.setItem(ds_recuSTD.getRow(),'mindaterecu',ldt_fin)
end if

if ib_modifmontant then
	
	ld_montant = dw_recu.getItemNumber(dw_recu.getRow(),'paiement_somme_recu')
	ds_recuimp.setItem(ds_recuimp.getRow(),'montantrecu',ld_montant)

	if rb_vierge.checked then
		ds_recuSTD.setItem(ds_recuSTD.getRow(),'montantrecu',ld_montant)
	end if

end if

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
gnv_app.inv_entrepotglobal.of_ajoutedonnee("recu standard pour impression courriel",ds_recuSTD)
gb_datawindow = false
openwithparm(w_print_options,ds_recuimp)
if error_type(205) = 1 then
	cocherecu()
	sauve()
end if

destroy ds_recuimp

////				imprecu()
////			end if
//		else
//			end if
//		end if
//			if ls_langue = 'F' then
//				imprecup('d_recupimpfr',false)
//			elseif ls_langue = 'A' then
//				imprecup('d_recupimpan',false)
//end choose
//
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print Receipt'
end if
end event

type rr_1 from roundrectangle within w_recu
integer linethickness = 1
long fillcolor = 80269524
integer y = 88
integer width = 2080
integer height = 480
integer cornerheight = 40
integer cornerwidth = 46
end type

type dw_recu from u_dw within w_recu
event ue_filltab ( )
integer x = 9
integer y = 700
integer width = 2075
integer height = 1204
integer taborder = 20
string title = "recup"
string dataobject = "d_recup"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_filltab();long i
date ldt_datemin, ldt_datemax, ldt_date
dec{2} ld_montrecu = 0
boolean ib_first = true
string ls_recnunote

for i = 1 to dw_sommaire_paiement.rowcount()
	
	if dw_sommaire_paiement.isselected(i) then
		
		if ib_first then 
			ldt_datemin = dw_sommaire_paiement.getItemDate(i,'date_paiement')
			ldt_datemax = ldt_datemin
			ib_first = false
		end if

		ld_montrecu += dw_sommaire_paiement.getItemNumber(i,'montant_recu')
		ldt_date = dw_sommaire_paiement.getItemDate(i,'date_paiement')
		ls_recnunote = dw_sommaire_paiement.getItemString(i,'recunote')
		if ldt_date < ldt_datemin then ldt_datemin = ldt_date
		if ldt_date > ldt_datemax then ldt_datemax = ldt_date
		
	end if
	
next

dw_recu.setItem(dw_recu.getRow(),'paiement_date_debut_recu',ldt_datemin)
dw_recu.setItem(dw_recu.getRow(),'paiement_date_fin_recu',ldt_datemax)
dw_recu.setItem(dw_recu.getRow(),'paiement_somme_recu',ld_montrecu)
dw_recu.setItem(dw_recu.getRow(),'paiement_recunote',ls_recnunote)

end event

event constructor;call super::constructor;if v_langue = 'an' then
	st_recu.text = 'Receipt of:'
	this.object.t_from.text = 'From:'
	this.object.t_to.text = 'to'
	this.object.t_amount.text = 'Amount:'
end if

end event

event itemfocuschanged;//long ll_idcont
//dec{2} v_paiement
//date v_date1, v_date2
//if w_traitements.IB_PERIODIC then
//	if this.getcolumnname() = 'paiement_somme_recu' then
//		ll_idcont = (ddlb_resp.of_getselecteddata( ))
//		if ll_idcont = 0 then setnull(ll_idcont)
//		v_date1 = this.getitemdate(this.getrow(),'paiement_date_debut_recu')
//		v_date2 = this.getitemdate(this.getrow(),'paiement_date_fin_recu')
//		select isnull(sum(isnull(montant_recu,0)),0) into :v_paiement 
//		from paiement
//		where date_paiement between :v_date1 AND :v_date2 
//		and (id_contact = :ll_idcont or :ll_idcont is null) 
//		and paiement.traitement_patient_id = :il_traitid;
//		this.setitem(this.getrow(),'paiement_somme_recu',v_paiement)
//	end if
//end if
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

event itemchanged;call super::itemchanged;date ldt_debut, ldt_fin
long ll_idcont,ll_norecu
dec{2} ld_montpaie

if row > 0 then
	
//	if dwo.name = 'paiement_id_contact' then
//		ll_idcont = long(data)
//		ldt_debut = getItemDate(row,'paiement_date_debut_recu')
//		ldt_fin = getItemDate(row,'paiement_date_fin_recu')
//		select isnull(sum(isnull(montant_recu,0)),0) into :ld_montpaie 
//		from paiement 
//		where date_paiement between :ldt_debut AND :ldt_fin and id_contact = :ll_idcont;
//		setItem(row,'paiement_somme_recu',ld_montpaie)
//	end if
	
	if  dwo.name = 'paiement_date_debut_recu'  then
		ldt_debut = date(data)
		ldt_fin = getItemDate(row,'paiement_date_fin_recu')
		dw_sommaire_paiement.event ue_fillrecu(ldt_debut,ldt_fin)
		
	elseif dwo.name = 'paiement_date_fin_recu' then
		
		ldt_debut = getItemDate(row,'paiement_date_debut_recu')
		ldt_fin = date(data)
		dw_sommaire_paiement.event ue_fillrecu(ldt_debut,ldt_fin)
		
	elseif dwo.name = 'paiement_somme_recu' then
		
		ib_modifmontant = true
		
	end if
	
	
	
/*	if  dwo.name = 'paiement_date_debut_recu' then
		ll_idcont = long(ddlb_resp.of_getselecteddata())
		if ll_idcont = 0 then setnull(ll_idcont)
		ldt_debut = date(data)
		ldt_fin = getItemDate(row,'paiement_date_fin_recu')
		select isnull(sum(isnull(montant_recu,0)),0),isnull(sum(isnull(paiement_id,0)),0) into :ld_montpaie, :ll_norecu
		from paiement
		where date_paiement between :ldt_debut AND :ldt_fin 
		and (id_contact = :ll_idcont or :ll_idcont is null) 
		and paiement.traitement_patient_id = :il_traitid;
		setItem(row,'paiement_somme_recu',ld_montpaie)
		object.t_norecu.text = string(ll_norecu)
	end if
	
	if  dwo.name = 'paiement_date_fin_recu' then
		ll_idcont = long(ddlb_resp.of_getselecteddata())
		if ll_idcont = 0 then setnull(ll_idcont)
		ldt_debut = getItemDate(row,'paiement_date_debut_recu')
		ldt_fin = date(data)
		select isnull(sum(isnull(montant_recu,0)),0),isnull(sum(isnull(paiement_id,0)),0) into :ld_montpaie, :ll_norecu
		from paiement
		where date_paiement between :ldt_debut AND :ldt_fin 
		and (id_contact = :ll_idcont or :ll_idcont is null) 
		and paiement.traitement_patient_id = :il_traitid;
		setItem(row,'paiement_somme_recu',ld_montpaie)
		object.t_norecu.text = string(ll_norecu)
	end if
	
	*/
		
end if


end event

event rbuttondown;call super::rbuttondown;SetColumn('paiement_recunote')
open(w_statuslist)
paste()
end event

