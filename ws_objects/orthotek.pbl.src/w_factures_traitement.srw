$PBExportHeader$w_factures_traitement.srw
forward
global type w_factures_traitement from w_child
end type
type rr_2 from roundrectangle within w_factures_traitement
end type
type em_totpaie from editmask within w_factures_traitement
end type
type st_totpaie from statictext within w_factures_traitement
end type
type em_totfact from editmask within w_factures_traitement
end type
type st_totfact from statictext within w_factures_traitement
end type
type st_phase from statictext within w_factures_traitement
end type
type cbx_activatemontant from checkbox within w_factures_traitement
end type
type cbx_activateqte from checkbox within w_factures_traitement
end type
type cb_paiement from commandbutton within w_factures_traitement
end type
type em_solde from editmask within w_factures_traitement
end type
type em_montant_du from editmask within w_factures_traitement
end type
type cb_cancel from commandbutton within w_factures_traitement
end type
type st_add from statictext within w_factures_traitement
end type
type cb_insert from commandbutton within w_factures_traitement
end type
type cb_assurance from commandbutton within w_factures_traitement
end type
type cb_update from commandbutton within w_factures_traitement
end type
type cb_cpd from commandbutton within w_factures_traitement
end type
type cb_batch_insert from commandbutton within w_factures_traitement
end type
type st_3 from statictext within w_factures_traitement
end type
type st_7 from statictext within w_factures_traitement
end type
type sle_date_naissance from singlelineedit within w_factures_traitement
end type
type sle_age from singlelineedit within w_factures_traitement
end type
type st_6 from statictext within w_factures_traitement
end type
type st_5 from statictext within w_factures_traitement
end type
type st_2 from statictext within w_factures_traitement
end type
type sle_pat from singlelineedit within w_factures_traitement
end type
type sle_no_dossier from singlelineedit within w_factures_traitement
end type
type st_4 from statictext within w_factures_traitement
end type
type cb_close from commandbutton within w_factures_traitement
end type
type st_title from statictext within w_factures_traitement
end type
type rr_1 from roundrectangle within w_factures_traitement
end type
type rr_4 from roundrectangle within w_factures_traitement
end type
type dw_factures_recents from u_dw within w_factures_traitement
end type
type dw_factures_traitement from u_dw within w_factures_traitement
end type
type dw_factures_mensualite from u_dw within w_factures_traitement
end type
end forward

global type w_factures_traitement from w_child
string tag = "Invoice"
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
long backcolor = 67108864
string pointer = "Arrow!"
boolean ib_isupdateable = false
boolean ib_disableclosequery = true
event ue_post_event ( )
rr_2 rr_2
em_totpaie em_totpaie
st_totpaie st_totpaie
em_totfact em_totfact
st_totfact st_totfact
st_phase st_phase
cbx_activatemontant cbx_activatemontant
cbx_activateqte cbx_activateqte
cb_paiement cb_paiement
em_solde em_solde
em_montant_du em_montant_du
cb_cancel cb_cancel
st_add st_add
cb_insert cb_insert
cb_assurance cb_assurance
cb_update cb_update
cb_cpd cb_cpd
cb_batch_insert cb_batch_insert
st_3 st_3
st_7 st_7
sle_date_naissance sle_date_naissance
sle_age sle_age
st_6 st_6
st_5 st_5
st_2 st_2
sle_pat sle_pat
sle_no_dossier sle_no_dossier
st_4 st_4
cb_close cb_close
st_title st_title
rr_1 rr_1
rr_4 rr_4
dw_factures_recents dw_factures_recents
dw_factures_traitement dw_factures_traitement
dw_factures_mensualite dw_factures_mensualite
end type
global w_factures_traitement w_factures_traitement

type variables
private long il_patid, il_traitid, il_idcontact
private long il_factrecents = 0
public int changement_ajout = 0 
public int changement = 0
private int ii_phase,ii_modeajout = 0
private string is_montant
datawindowchild dddwin,dddwin1,dddw_status,dddwin2
end variables

forward prototypes
public function string trouver_age (date datenaiss)
public subroutine labelpatient ()
public subroutine if_close ()
public subroutine sauve ()
end prototypes

event ue_post_event();gf_uhelp(il_patid)
labelpatient()
select max(facture_id) into :il_factrecents from factures_traitements where traitement_id = :il_traitid;
if isnull(il_factrecents) then il_factrecents = 1
dddwin1.setFilter("patient_id = " + string(il_patid))
dw_factures_recents.retrieve(il_traitid,0)
end event

public function string trouver_age (date datenaiss);int age // Age du patient
int age_mois // Mois du patient
int jour // Le jour de la journée en cours
int mois // Le mois de la journée en cours
int annee // L'année de la journée en cours
int jour_naiss // Jour de la date de naissance
int mois_naiss // Mois de la date de naissance
int annee_naiss // Année de la date de naissance
string ls_age // Retourne l'age et le mois

jour = day(today())
mois = month(today())
annee = year(today())
jour_naiss = day(datenaiss)
mois_naiss = month(datenaiss)
annee_naiss = year(datenaiss)


if mois < mois_naiss then
	age = annee - annee_naiss - 1
	age_mois = 12 - (mois_naiss - mois)
elseif mois = mois_naiss then
	if jour < jour_naiss then
		age = annee - annee_naiss - 1
		age_mois = 11
	else
		age = annee - annee_naiss
		age_mois = 0
	end if
else
	age = annee - annee_naiss
	age_mois = mois - mois_naiss
end if
ls_age = string(age) + " ANS " + string(age_mois) + " MOIS " 

return ls_age
end function

public subroutine labelpatient ();string ls_nom, ls_prenom, ls_age, ls_nodoss, ls_phase
date ldt_naissance
dec{2} ld_frais, ld_frais1, ld_montantpaye, ld_solde, ld_montantdu

select traitements.phase, t_phase.phase 
into :ii_phase, :ls_phase 
from traitements INNER JOIN t_phase ON t_phase.id_phase = traitements.id_phase
where traitement_id = :il_traitid;
st_phase.text = ls_phase
select sum(montant) into :ld_frais from factures_traitements where traitement_id = :il_traitid;
if isnull(ld_frais) then ld_frais = 0  
select sum(montant) into :ld_frais1 from factures_traitements where traitement_id = :il_traitid and date_facture <= today();
if isnull(ld_frais1) then ld_frais1 = 0   
select sum(montant_recu) into :ld_montantpaye from paiement where traitement_patient_id = :il_traitid;
if isnull(ld_montantpaye) then ld_montantpaye = 0
SELECT patient_nom, patient_prenom, date_naissance, new_dossier into :ls_nom,:ls_prenom,:ldt_naissance,:ls_nodoss from patient where patient_id = :il_patid;
sle_pat.text = ls_nom +" "+ ls_prenom
ls_age = calculage(ldt_naissance)
sle_age.text = ls_age
sle_no_dossier.text = ls_nodoss
sle_date_naissance.text = string(ldt_naissance)
ld_solde = ld_frais - ld_montantpaye
em_solde.text = string(ld_solde)
ld_montantdu = ld_frais1 - ld_montantpaye
em_montant_du.text = string(ld_montantdu)
em_totfact.text = string(ld_frais)
em_totpaie.text = string(ld_montantpaye)
end subroutine

public subroutine if_close ();if changement = 1 then
	if error_type(200) = 1 then
		sauve()
	end if
end if
changement_ajout = 0
close(w_factures_traitement)
end subroutine

public subroutine sauve ();long row,enr,ll_idfact, ll_droitmodfactpaie
integer li_nbphase
string v_status,ls_montant
date ldt_datefact

select droitmodfactpaie into :ll_droitmodfactpaie from t_personnels where id_personnel = :gl_idpers;

dw_factures_traitement.accepttext()
dw_factures_recents.accepttext()
row = dw_factures_traitement.getrow()
if row > 0 then
	ldt_datefact = dw_factures_traitement.getitemDate(dw_factures_traitement.getrow(),'date_facture')
else
	ldt_datefact = date('01-01-1900')
end if
// verification de la phase
select count(*) into :li_nbphase from traitements where patient_id = :il_patid;
if li_nbphase > ii_phase then
	if error_type(247) = 1 then
		// log
		if dw_factures_traitement.getrow() > 0 then
			select max(facture_id) into :ll_idfact from factures_traitements;
			ll_idfact++
			ldt_datefact = dw_factures_traitement.getitemDate(dw_factures_traitement.getrow(),'date_facture')
			ls_montant = string(dw_factures_traitement.getitemnumber(dw_factures_traitement.getrow(),'montant'))
			f_logs('add','0',ll_idfact,il_patid,ldt_datefact,ls_montant)
		else
			setnulL(ldt_datefact)
		end if
		if not isnull(ldt_datefact) then
			if isnull(ll_droitmodfactpaie) or daysafter(ldt_datefact,today()) <= ll_droitmodfactpaie then
				if dw_factures_traitement.update(TRUE,FALSE) = 1 then
					if dw_factures_recents.update(TRUE,FALSE) = 1 then
						// Établir le Statut en cour si <> mens
						dw_factures_traitement.resetupdate()	// Both updates are OK
						dw_factures_recents.resetupdate()		// Clear update flags
						commit using sqlca;
						cb_batch_insert.enabled = true
						cb_insert.enabled = true	
						if changement_ajout = 1 then
							dw_factures_recents.retrieve(il_traitid,il_factrecents)
							dw_factures_traitement.reset()
						end if
						enr = dw_factures_recents.getrow()
						if enr > 0 then
//						if dw_factures_recents.getitemnumber(enr,'status_id') <> 1 then 
							v_status = dw_factures_recents.getitemstring(dw_factures_recents.getrow(),'t_status_code')
							UPDATE Patient SET statut = :v_status WHERE patient_id  = :il_patid;
							commit using sqlca;
//						end if
						end if
						labelpatient()
						changement = 0
						ii_modeajout = 0
					else
						error_type(50)
						rollback using sqlca;						// 2nd update failed
					end if
				else
					error_type(50)
					rollback using sqlca;
				end if
			else
				messagebox("Avertissement","Vous ne disposez pas des droits pour ajouter des factures dans le passée")
			end if
		else
			if dw_factures_recents.update() = 1 then
				commit using SQLCA;
				changement = 0
			else
				rollback using SQLCA;
			end if
		end if
	end if
else
	dw_factures_traitement.accepttext()
	dw_factures_recents.accepttext()
	// log
	if dw_factures_traitement.getrow() > 0 then
		select max(facture_id) into :ll_idfact from factures_traitements;
		ll_idfact++
		ldt_datefact = dw_factures_traitement.getitemDate(dw_factures_traitement.getrow(),'date_facture')
		ls_montant = string(dw_factures_traitement.getitemnumber(dw_factures_traitement.getrow(),'montant'))
		f_logs('add','0',ll_idfact,il_patid,ldt_datefact,ls_montant)
	else
		setnull(ldt_datefact)
	end if
	if not isnull(ldt_datefact) then
		if isnull(ll_droitmodfactpaie) or daysafter(ldt_datefact,today()) <= ll_droitmodfactpaie then
			if dw_factures_traitement.update(TRUE,FALSE) = 1 then
				if dw_factures_recents.update(TRUE,FALSE) = 1 then
					// Établir le Statut en cour si <> mens
					dw_factures_traitement.resetupdate()	// Both updates are OK
					dw_factures_recents.resetupdate()		// Clear update flags
					commit using sqlca;
					cb_batch_insert.enabled = true
					cb_insert.enabled = true	
					if changement_ajout = 1 then
						dw_factures_recents.retrieve(il_traitid,il_factrecents)
						dw_factures_traitement.reset()
					end if
					enr = dw_factures_recents.getrow()
					if enr > 0 then
						if dw_factures_recents.getitemnumber(enr,'status_id') <> 1 then 
							v_status = dw_factures_recents.getitemstring(dw_factures_recents.getrow(),'t_status_code')
							UPDATE Patient SET statut = :v_status WHERE patient_id  = :il_patid;
						end if
					end if
					labelpatient()
					changement = 0
					ii_modeajout = 0
				else
					error_type(50)
					rollback using sqlca;						// 2nd update failed
				end if
			else
				error_type(50)
				rollback using sqlca;
			end if
		else
			messagebox("Avertissement","Vous ne disposez pas des droits pour ajouter des factures dans le passée")
		end if
		
	else
		if dw_factures_recents.update() = 1 then
			commit using SQLCA;
			changement = 0
		else
			rollback using SQLCA;
		end if
	end if
end if

end subroutine

on w_factures_traitement.create
int iCurrent
call super::create
this.rr_2=create rr_2
this.em_totpaie=create em_totpaie
this.st_totpaie=create st_totpaie
this.em_totfact=create em_totfact
this.st_totfact=create st_totfact
this.st_phase=create st_phase
this.cbx_activatemontant=create cbx_activatemontant
this.cbx_activateqte=create cbx_activateqte
this.cb_paiement=create cb_paiement
this.em_solde=create em_solde
this.em_montant_du=create em_montant_du
this.cb_cancel=create cb_cancel
this.st_add=create st_add
this.cb_insert=create cb_insert
this.cb_assurance=create cb_assurance
this.cb_update=create cb_update
this.cb_cpd=create cb_cpd
this.cb_batch_insert=create cb_batch_insert
this.st_3=create st_3
this.st_7=create st_7
this.sle_date_naissance=create sle_date_naissance
this.sle_age=create sle_age
this.st_6=create st_6
this.st_5=create st_5
this.st_2=create st_2
this.sle_pat=create sle_pat
this.sle_no_dossier=create sle_no_dossier
this.st_4=create st_4
this.cb_close=create cb_close
this.st_title=create st_title
this.rr_1=create rr_1
this.rr_4=create rr_4
this.dw_factures_recents=create dw_factures_recents
this.dw_factures_traitement=create dw_factures_traitement
this.dw_factures_mensualite=create dw_factures_mensualite
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rr_2
this.Control[iCurrent+2]=this.em_totpaie
this.Control[iCurrent+3]=this.st_totpaie
this.Control[iCurrent+4]=this.em_totfact
this.Control[iCurrent+5]=this.st_totfact
this.Control[iCurrent+6]=this.st_phase
this.Control[iCurrent+7]=this.cbx_activatemontant
this.Control[iCurrent+8]=this.cbx_activateqte
this.Control[iCurrent+9]=this.cb_paiement
this.Control[iCurrent+10]=this.em_solde
this.Control[iCurrent+11]=this.em_montant_du
this.Control[iCurrent+12]=this.cb_cancel
this.Control[iCurrent+13]=this.st_add
this.Control[iCurrent+14]=this.cb_insert
this.Control[iCurrent+15]=this.cb_assurance
this.Control[iCurrent+16]=this.cb_update
this.Control[iCurrent+17]=this.cb_cpd
this.Control[iCurrent+18]=this.cb_batch_insert
this.Control[iCurrent+19]=this.st_3
this.Control[iCurrent+20]=this.st_7
this.Control[iCurrent+21]=this.sle_date_naissance
this.Control[iCurrent+22]=this.sle_age
this.Control[iCurrent+23]=this.st_6
this.Control[iCurrent+24]=this.st_5
this.Control[iCurrent+25]=this.st_2
this.Control[iCurrent+26]=this.sle_pat
this.Control[iCurrent+27]=this.sle_no_dossier
this.Control[iCurrent+28]=this.st_4
this.Control[iCurrent+29]=this.cb_close
this.Control[iCurrent+30]=this.st_title
this.Control[iCurrent+31]=this.rr_1
this.Control[iCurrent+32]=this.rr_4
this.Control[iCurrent+33]=this.dw_factures_recents
this.Control[iCurrent+34]=this.dw_factures_traitement
this.Control[iCurrent+35]=this.dw_factures_mensualite
end on

on w_factures_traitement.destroy
call super::destroy
destroy(this.rr_2)
destroy(this.em_totpaie)
destroy(this.st_totpaie)
destroy(this.em_totfact)
destroy(this.st_totfact)
destroy(this.st_phase)
destroy(this.cbx_activatemontant)
destroy(this.cbx_activateqte)
destroy(this.cb_paiement)
destroy(this.em_solde)
destroy(this.em_montant_du)
destroy(this.cb_cancel)
destroy(this.st_add)
destroy(this.cb_insert)
destroy(this.cb_assurance)
destroy(this.cb_update)
destroy(this.cb_cpd)
destroy(this.cb_batch_insert)
destroy(this.st_3)
destroy(this.st_7)
destroy(this.sle_date_naissance)
destroy(this.sle_age)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_2)
destroy(this.sle_pat)
destroy(this.sle_no_dossier)
destroy(this.st_4)
destroy(this.cb_close)
destroy(this.st_title)
destroy(this.rr_1)
destroy(this.rr_4)
destroy(this.dw_factures_recents)
destroy(this.dw_factures_traitement)
destroy(this.dw_factures_mensualite)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_idcontact = long(gnv_app.inv_entrepotglobal.of_retournedonnee("contactfacturation"))

if message.doubleparm > 0 then
	il_traitid = message.doubleparm //passage du parametre externe
	select patient_id into :il_patid from traitements where traitement_id = :il_traitid;
else
	error_type(0)
	close(w_factures_traitement)
end if
this.postevent('ue_post_event')
end event

type rr_2 from roundrectangle within w_factures_traitement
integer linethickness = 1
long fillcolor = 80269524
integer x = 46
integer y = 640
integer width = 3561
integer height = 296
integer cornerheight = 40
integer cornerwidth = 46
end type

type em_totpaie from editmask within w_factures_traitement
integer x = 1257
integer y = 432
integer width = 421
integer height = 64
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
string text = "0"
boolean border = false
boolean displayonly = true
maskdatatype maskdatatype = decimalmask!
string mask = "[currency(7)]"
end type

type st_totpaie from statictext within w_factures_traitement
integer x = 896
integer y = 432
integer width = 343
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Total payé:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Total paid:"
end if
end event

type em_totfact from editmask within w_factures_traitement
integer x = 526
integer y = 432
integer width = 361
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 80269524
string text = "0"
boolean border = false
boolean displayonly = true
maskdatatype maskdatatype = decimalmask!
string mask = "[currency(7)]"
end type

type st_totfact from statictext within w_factures_traitement
integer x = 78
integer y = 432
integer width = 434
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 80269524
string text = "Total facturé:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Total charged:"
end if
end event

type st_phase from statictext within w_factures_traitement
integer x = 1792
integer y = 80
integer width = 1522
integer height = 124
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "Phase"
boolean focusrectangle = false
end type

type cbx_activatemontant from checkbox within w_factures_traitement
integer x = 1797
integer y = 312
integer width = 1513
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
string text = "Activer le calcul des montants automatique"
boolean checked = true
end type

event constructor;if v_langue = 'an' then
	this.Text = "Activate the automatic amount compute"
end if
end event

type cbx_activateqte from checkbox within w_factures_traitement
integer x = 1797
integer y = 224
integer width = 1509
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
string text = "Activer le calcul des quantités automatique"
boolean checked = true
end type

event constructor;if v_langue = 'an' then
	cbx_activateqte.Text = "Activate the automatic billing compute"
end if
end event

type cb_paiement from commandbutton within w_factures_traitement
integer x = 1838
integer y = 1888
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Paiement"
end type

event clicked;if il_traitid > 0 and isnull(il_traitid) = false then
	if isvalid(w_paiement) = true then
		if error_type(216) = 1 then
			Opensheet(w_paiement,w_traitements,2,layered!)
		else
			w_paiement.if_close()
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactpaiement", il_idcontact)
			opensheetwithparm(w_paiement,il_traitid,w_traitements,2,layered!)
			w_paiement.title = 'Paiements (' + sle_pat.text + ')'
		end if
	else
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactpaiement", il_idcontact)
		opensheetwithparm(w_paiement,il_traitid,w_traitements,2,layered!)
		w_paiement.title = 'Paiements (' + sle_pat.text + ')'
	end if
else
	error_type(0)
end if
end event

event constructor;if v_langue = 'an' then
	this.Text = "Payment"
end if
end event

type em_solde from editmask within w_factures_traitement
integer x = 370
integer y = 356
integer width = 361
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "0"
boolean border = false
boolean displayonly = true
maskdatatype maskdatatype = decimalmask!
string mask = "[currency(7)]"
end type

type em_montant_du from editmask within w_factures_traitement
integer x = 1198
integer y = 356
integer width = 430
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "0"
boolean border = false
boolean displayonly = true
maskdatatype maskdatatype = decimalmask!
string mask = "[currency(7)]"
end type

type cb_cancel from commandbutton within w_factures_traitement
integer x = 1038
integer y = 1888
integer width = 352
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;long row, ll_idfact, ll_droitmodfactpaie
string ls_montant
date ldt_datefact, ldt_date

ldt_date = dw_factures_recents.getItemDate(dw_factures_recents.getRow(),'date_facture')

select isnull(droitmodfactpaie,-1) into :ll_droitmodfactpaie from t_personnels where id_personnel = :gl_idpers;
if ((ll_droitmodfactpaie = 0 and ldt_date <= today()) or daysafter(ldt_date,today()) > ll_droitmodfactpaie) and ll_droitmodfactpaie <> -1 then 
	messagebox("Avertissement","Vous ne disposez pas des droits pour ajouter des factures dans le passée")
	return 
end if

row = dw_factures_recents.getrow()
if row > 0 then
	ll_idfact = dw_factures_recents.getitemnumber(row,'facture_id')
	ldt_datefact = dw_factures_recents.getitemDate(row,'date_facture')
		ls_montant = string(dw_factures_recents.getitemnumber(row,'montant'))
		f_logs('del',ls_montant,ll_idfact,il_patid,ldt_datefact,'0') //log
		dw_factures_recents.deleterow(row)
		changement = 1
		cb_insert.enabled = false
		cb_batch_insert.enabled = false
end if
end event

event constructor;if v_langue = 'an' then
	cb_cancel.Text = "Delete"
end if
end event

type st_add from statictext within w_factures_traitement
integer x = 27
integer y = 532
integer width = 1966
integer height = 92
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Création de nouvelles factures"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Create a new bill"
end if
end event

type cb_insert from commandbutton within w_factures_traitement
integer x = 46
integer y = 1888
integer width = 613
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter une facture"
end type

event clicked;dw_factures_mensualite.reset()
long ll_newrow, v_verif, ll_statusid,ll_idcontact, ll_idsat
dec{2} ln_prixsugg

SELECT count(*) into :v_verif from t_status;
if v_verif > 0 then
	if changement_ajout = 0 then
		dw_factures_recents.reset()
	end if
	dw_factures_mensualite.visible = false
	dw_factures_mensualite.enabled = false
	dw_factures_traitement.visible = true
	dw_factures_traitement.enabled = true
	ll_newrow = dw_factures_traitement.InsertRow(0)
	dw_factures_traitement.ScrollToRow(ll_newrow)
	dddwin.settransobject(sqlca)
	dddwin.setfilter("patient_id = " + string(il_patid))
	dddwin.retrieve()
	select id_contact, id_satellite into :ll_idcontact, :ll_idsat from patient where patient_id = :il_patid;
	dw_factures_traitement.SetItem(ll_newrow,'id_contact',il_idcontact)
	dw_factures_traitement.SetItem(ll_newrow,'date_facture',today())
	dw_factures_traitement.SetItem(ll_newrow,'montant',0)
	dw_factures_traitement.SetItem(ll_newrow,'cache',0)
	dw_factures_traitement.SetItem(ll_newrow,'imp',0)
	dw_factures_traitement.SetItem(ll_newrow,'traitement_id',il_traitid)
	dw_factures_traitement.SetItem(ll_newrow,'id_satellite',ll_idsat)
	dw_factures_traitement.visible = true
	dw_factures_traitement.SetFocus()
	cb_insert.enabled = false
	changement_ajout = 1
	ii_modeajout = 1
else
	error_type(101)
	OpenSheet(w_status,w_principal,2,original!)
	w_status.move(1,1)
end if
end event

event constructor;if v_langue = 'an' then
	cb_insert.Text = "Add bill"
end if
end event

type cb_assurance from commandbutton within w_factures_traitement
integer x = 1390
integer y = 1888
integer width = 448
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Formulaire N"
end type

event clicked;SetPointer(HourGlass!)
OpenWithParm (w_formulaire_normalise,il_traitid, w_factures_traitement)
end event

event constructor;if v_langue = 'an' then
	cb_assurance.Text = "N form"
end if
end event

type cb_update from commandbutton within w_factures_traitement
integer x = 2816
integer y = 1888
integer width = 407
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;sauve()
cb_insert.setfocus()
end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Save"
end if
end event

type cb_cpd from commandbutton within w_factures_traitement
integer x = 2240
integer y = 1888
integer width = 576
integer height = 112
integer taborder = 140
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Chèques postdatés"
end type

event clicked;if il_traitid > 0 and isnull(il_traitid) = false then
	if isvalid(w_cpd) = true then
		if error_type(217) = 1 then
			opensheet(w_cpd, w_traitements,2,layered!)
		else
			w_cpd.if_close()
			opensheetwithparm(w_cpd,il_traitid,w_traitements,2,layered!)
			w_cpd.title = 'Chèques postdatés (' + sle_pat.text + ')'
		end if
	else
		opensheetwithparm(w_cpd,il_traitid,w_traitements,2,layered!)
		w_cpd.title = 'Chèques postdatés (' + sle_pat.text + ')'
	end if
else
	error_type(0)
end if
end event

event constructor;if v_langue = 'an' then
	cb_cpd.Text = "Postdated checks"
end if
end event

type cb_batch_insert from commandbutton within w_factures_traitement
integer x = 658
integer y = 1888
integer width = 379
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Mensualité"
end type

event clicked;long ll_newrow, v_verif, ll_idcontact, ll_idsat
dec{2} v_cout_traitement
w_traitements.tab_dossfin.tabpage_tous.dw_traitements.accepttext()
v_cout_traitement = w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getrow(),'montant_original')
dw_factures_mensualite.object.cout_traitement.text = string(v_cout_traitement)+'$'
if v_cout_traitement = 0 then
	error_type(114)
else
	dw_factures_traitement.reset()
	SELECT count(*) into :v_verif from t_status;
	if v_verif > 0 then
		if changement_ajout = 0 then
			dw_factures_recents.reset()
		end if
		dw_factures_mensualite.visible = true
		dw_factures_mensualite.enabled = true
		dw_factures_traitement.visible = false
		dw_factures_traitement.enabled = false
		ll_newrow = dw_factures_mensualite.InsertRow(0)
		dw_factures_mensualite.ScrollToRow(ll_newrow)
		dddwin2.settransobject(sqlca)
		dddwin2.setfilter("patient_id = " + string(il_patid))
		dddwin2.retrieve()
		select id_contact, id_satellite into :ll_idcontact, :ll_idsat from patient where patient_id = :il_patid;
		dw_factures_mensualite.SetItem(ll_newrow,'id_contact',il_idcontact)
		dw_factures_mensualite.SetItem(ll_newrow,'date_facture',today())
		SELECT status_id into :v_verif from t_status where code = 'mens' or code = 'Monthly ch';
		if isnull(v_verif) = true then
			error_type(0)
		else
			dw_factures_mensualite.SetItem(ll_newrow,'status_id',v_verif)
		end if
		dw_factures_mensualite.SetItem(ll_newrow,'affect',1)
		dw_factures_mensualite.SetItem(ll_newrow,'qte',0)
		dw_factures_mensualite.SetItem(ll_newrow,'montant',0)
		dw_factures_mensualite.SetItem(ll_newrow,'traitement_id',il_traitid)
		dw_factures_mensualite.SetItem(ll_newrow,'id_satellite',ll_idsat)
		dw_factures_mensualite.visible = true
		dw_factures_mensualite.SetFocus()
		ii_modeajout = 1
	else
		error_type(101)
	end if
end if

end event

event constructor;if v_langue = 'an' then
	cb_batch_insert.Text = "Monthly bill"
end if
end event

type st_3 from statictext within w_factures_traitement
integer x = 78
integer y = 128
integer width = 251
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "Patient:"
boolean focusrectangle = false
end type

type st_7 from statictext within w_factures_traitement
integer x = 741
integer y = 356
integer width = 462
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "Montant dû:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_7.Text = "Amount due:"
end if
end event

type sle_date_naissance from singlelineedit within w_factures_traitement
integer x = 713
integer y = 280
integer width = 846
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "date de naissance"
boolean border = false
end type

type sle_age from singlelineedit within w_factures_traitement
integer x = 238
integer y = 204
integer width = 544
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "age"
boolean border = false
end type

type st_6 from statictext within w_factures_traitement
integer x = 78
integer y = 356
integer width = 279
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "Solde:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_6.Text = "Balance:"
end if
end event

type st_5 from statictext within w_factures_traitement
integer x = 78
integer y = 280
integer width = 585
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "Date de naissance:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_5.Text = "Birthdate:"
end if
end event

type st_2 from statictext within w_factures_traitement
integer x = 78
integer y = 204
integer width = 155
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
string text = "Âge:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_2.Text = "Age:"
end if
end event

type sle_pat from singlelineedit within w_factures_traitement
integer x = 343
integer y = 128
integer width = 1307
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "err"
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type sle_no_dossier from singlelineedit within w_factures_traitement
integer x = 1166
integer y = 204
integer width = 416
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "# dossier"
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type st_4 from statictext within w_factures_traitement
integer x = 809
integer y = 204
integer width = 320
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 80269524
boolean enabled = false
string text = "No dossier:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_4.Text = "File #:"
end if
end event

type cb_close from commandbutton within w_factures_traitement
integer x = 3223
integer y = 1888
integer width = 384
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if_close()
if isvalid(w_traitements) then
	w_traitements.tab_dossfin.tabpage_tous.dw_traitements.retrieve(w_traitements.il_traitid)
	w_traitements.tab_sommaires.tabpage_factures.dw_factures_sommaire.retrieve(w_traitements.il_traitid)
	w_traitements.cbrefresh()
end if
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type st_title from statictext within w_factures_traitement
integer width = 850
integer height = 92
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Facturation"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Invoice"
end if
end event

type rr_1 from roundrectangle within w_factures_traitement
integer linethickness = 1
long fillcolor = 80269524
integer x = 41
integer y = 96
integer width = 1655
integer height = 424
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_4 from roundrectangle within w_factures_traitement
integer linethickness = 1
long fillcolor = 16777215
integer x = 46
integer y = 948
integer width = 3561
integer height = 928
integer cornerheight = 40
integer cornerwidth = 46
end type

type dw_factures_recents from u_dw within w_factures_traitement
integer x = 59
integer y = 960
integer width = 3534
integer height = 908
integer taborder = 60
string title = "Factures récentes"
string dataobject = "d_factures_recents"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)

if dw_factures_recents.GetChild('factures_traitements_id_contact', dddwin1) = -1 then
	error_type(0)
end if

if v_langue = 'an' then
	this.object.b_mont.text = 'Amount'
	this.object.b_rp.text = 'Responsible Party'
	this.object.b_affect.text = 'Affects'
	this.object.t_qty.text = 'Qty:'
end if
end event

event itemchanged;date ldt_fact
date ldt_date, ldt_dateavenir

long ll_droitmodfactpaie

ldt_date = dw_factures_recents.getItemDate(row,'date_facture')
if dwo.name = 'date_facture' then
	ldt_dateavenir = date(data)
else
	ldt_dateavenir = ldt_date
end if

select isnull(droitmodfactpaie,-1) into :ll_droitmodfactpaie from t_personnels where id_personnel = :gl_idpers;
if ((ll_droitmodfactpaie = 0 and (ldt_date <= today() or ldt_dateavenir <= today())) or (daysafter(ldt_date,today()) > ll_droitmodfactpaie and daysafter(ldt_dateavenir,today()) > ll_droitmodfactpaie)) and ll_droitmodfactpaie <> -1 then 
	messagebox("Avertissement","Vous ne disposez pas des droits pour ajouter des factures dans le passée")
	return 2
end if

changement = 1
if dwo.name = 'montant' then
	ldt_fact = getItemDate(row,'date_facture')
	
	f_logs('chg',is_montant,il_traitid,il_patid,ldt_fact,data)
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

event clicked;choose case string(dwo.name)
	case 'b_datefact'
		SetSort('date_facture A')
		Sort()
	case 'b_mont'
		SetSort('montant A')
		Sort()
	case 'b_desc'
		SetSort('t_status_description A')
		Sort()
	case 'b_note'
		SetSort('factures_traitements_note A')
		Sort()
	case 'b_rp'
		SetSort('id_contact A')
		Sort()
	case 'b_affect'
		SetSort('affect A')
		Sort()
	case 'b_sat'
		SetSort('t_satellites_lieu A')
		Sort()
	case 'montant'
		is_montant = string(getItemNumber(row,'montant'))
end choose
end event

event updateend;//long ll_row, ll_factid
//integer test
//
//if rowsinserted <> 0 then
//	ll_row = this.getrow()
//	select max(facture_id) into :ll_factid from factures_traitements;
//	if isnull(ll_factid) then ll_factid = 1
//	this.setitem(ll_row,'facture_id',ll_factid)
//	if ii_modeajout = 1 then
//	  test = this.setitemstatus(ll_row,'facture_id',primary!,notmodified!)
//	  test = this.setitemstatus(ll_row,'montant',primary!,notmodified!)	
//	  test = this.setitemstatus(ll_row,'date_facture',primary!,notmodified!)	
//	  test = this.setitemstatus(ll_row,'status_id',primary!,notmodified!)	
//	  test = this.setitemstatus(ll_row,'traitement_id',primary!,notmodified!)	
//	  test = this.setitemstatus(ll_row,'affect',primary!,notmodified!)	
//	  test = this.setitemstatus(ll_row,'imp',primary!,notmodified!)	
//	  test = this.setitemstatus(ll_row,'code',primary!,notmodified!)	
//	  test = this.setitemstatus(ll_row,'cache',primary!,notmodified!)	
//	  test = this.setitemstatus(ll_row,'note',primary!,notmodified!)
//	end if
//end if
end event

event itemfocuschanged;// barrer la transaction si necessaire
//if row > 0 then
//	if getitemdate(row,'date_facture') <= idt_lockdate then
//		modify("date_facture.Edit.displayonly = true")
//		modify("montant.Edit.displayonly = true")
//		modify("factures_traitements_note.Edit.displayonly = true")
////		modify("factures_traitements_id_contact.Edit.displayonly = true")
////		modify("affect.Edit.displayonly = true")
//	else
//		modify("date_facture.Edit.displayonly = false")
//		modify("montant.Edit.displayonly = false")
//		modify("factures_traitements_note.Edit.displayonly = false")
////		modify("factures_traitements_id_contact.Edit.displayonly = false")
////		modify("affect.Edit.displayonly = false")
//	end if
//end if
end event

type dw_factures_traitement from u_dw within w_factures_traitement
integer x = 59
integer y = 652
integer width = 3529
integer height = 276
integer taborder = 20
string title = "factures_traitement"
string dataobject = "d_factures_traitement"
boolean border = false
end type

event constructor;if this.GetChild('id_contact', dddwin) = -1 then
	error_type(0)
end if
if v_langue = 'an' then
	this.object.t_acte.text = 'Act'
	this.object.t_datefact.text = 'Billing date'
	this.object.t_montant.text = 'Amount'
	this.object.t_resp.text = 'Responsible Party'
	this.object.t_affect.text = 'Affects treatment cost'
end if
SetTransObject(SQLCA)
dw_factures_traitement.SetValidate("montant","Number(GetText( )) <= 10000")
dw_factures_traitement.Object.montant.ValidationMsg = "Le montant doit être entre 0 et 10000"
dw_factures_traitement.Object.status_id.ValidationMsg = "Vous devez choisir un statut!"
dw_factures_traitement.visible = false
// Liste des status par specialist
if this.GetChild('status_id', dddw_status) = -1 then
	error_type(0)
end if
dddw_status.SetTransObject(SQLCA)
dddw_status.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
end event

event itemchanged;long ll_statusid
int v_affect
dec{2} ln_prixsugg

if getcolumnname() = "status_id" then
	ll_statusid = integer(data)
	SELECT affect into :v_affect from t_status where status_id = :ll_statusid;
	dw_factures_traitement.SetItem(row,'affect',v_affect)
	select prixsugg into :ln_prixsugg from t_status where status_id = :ll_statusid;
	if isnull(ln_prixsugg) then ln_prixsugg = 0
	dw_factures_traitement.SetItem(row,'montant', ln_prixsugg)
end if
changement_ajout = 1
changement = 1
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

//IF sqldbcode = -195 THEN 
//	error_type(51)
//END IF
//RETURN 1
end event

event itemfocuschanged;long ll_statusid
int v_affect
dec{2} ln_prixsugg

if getcolumnname() = "status_id" then
	ll_statusid = dw_factures_traitement.getitemnumber(row,'status_id')
	SELECT affect into :v_affect from t_status where status_id = :ll_statusid;
	dw_factures_traitement.SetItem(row,'affect',v_affect)
	select prixsugg into :ln_prixsugg from t_status where status_id = :ll_statusid;
	dw_factures_traitement.SetItem(row,'montant', ln_prixsugg)
end if
changement_ajout = 1
changement = 1
end event

type dw_factures_mensualite from u_dw within w_factures_traitement
integer x = 59
integer y = 652
integer width = 3529
integer height = 268
integer taborder = 110
string title = "Factures mensualité"
string dataobject = "d_factures_mensualite"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event editchanged;decimal{2} mens, v_montant_original, v_montant_affect
integer q,li_qte
long enr

// Valide si sur le champs quantite
if getcolumnname() = "qte" and cbx_activatemontant.checked = true then
	q = integer(data)
	if q > 0 then
		enr = w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getrow()
		v_montant_original = w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(enr,'montant_original')
		SELECT sum(montant) into :v_montant_affect from factures_traitements where traitement_id = :il_traitid and affect = 1;
		if isnull(v_montant_affect) = true then
			v_montant_affect = 0
		end if
		mens = (v_montant_original - v_montant_affect) / q
		dw_factures_mensualite.setitem(row, "montant", mens)
	end if
end if
// Avec le montant, calcul la qte
if getcolumnname() = "montant" and cbx_activateqte.checked = true then
	q = integer(data)
	if q > 0 then
		enr = w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getrow()
		v_montant_original = w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(enr,'montant_original')
		SELECT sum(montant) into :v_montant_affect from factures_traitements where traitement_id = :il_traitid and affect = 1;
		if isnull(v_montant_affect) = true then
			v_montant_affect = 0
		end if
		li_qte = (v_montant_original - v_montant_affect) / q
		dw_factures_mensualite.setitem(row, "qte", li_qte)
	end if
end if
//changement = 1
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if this.GetChild('id_contact', dddwin2) = -1 then
	error_type(0)
end if

if v_langue = 'an' then
	this.object.t_datefact.text = 'Billing date'
	this.object.t_qte.text = 'Quantity'
	this.object.t_montant.text = 'Amount'
	this.object.t_couttrait.text = 'Treatment cost'
	this.object.t_resp.text = 'Responsible Party'
	this.object.t_affect.text = 'Affects treatment cost'
	this.object.b_apply.text = 'Apply'
	this.object.affect.values = 'Yes~t1/No~t0'
else
	this.object.affect.values = 'Oui~t1/Non~t0'
end if

SetTransObject(SQLCA)
dw_factures_mensualite.SetValidate("montant","Number(GetText( )) <= 10000")
dw_factures_mensualite.Object.montant.ValidationMsg = "Le montant doit être entre 0 et 10000"
dw_factures_mensualite.Object.status_id.ValidationMsg = "Vous devez choisir un statut!"
dw_factures_mensualite.visible = false


end event

event itemchanged;//changement = 1
end event

event buttonclicked;long  enr, ll_status, ll_newrow, ll_lastid
long ll_idfact, ll_idcontact, ll_idsat
integer q, i, enr_fact, mois, annee, jour, v_jour, v_affect
decimal{2} ld_montant, reste, v_montant_original, v_montant_affect
date v_date_debut,v_date_fact
string ls_montant

dw_factures_mensualite.accepttext()
ll_status = dw_factures_mensualite.getitemnumber(row, 'status_id')
ll_idcontact = dw_factures_mensualite.getItemNumber(row,'id_contact')
ll_idsat = dw_factures_mensualite.getItemNumber(row,'id_satellite')
ld_montant = dw_factures_mensualite.getitemnumber(row, 'montant')
v_affect = dw_factures_mensualite.getitemnumber(row, 'affect')
q = dw_factures_mensualite.getitemnumber(row,'qte') - 1
// La date ne peut pas être null
v_date_debut = dw_factures_mensualite.getitemdate(row, "date_facture")
	if ld_montant > 0 and q >= 0 and isnull(v_date_debut) = false then
		// get last id
		select max(facture_id) into :ll_lastid from factures_traitements where traitement_id = :il_traitid;
		if isnull(ll_lastid) then ll_lastid = 0
		// Chercher les infos
		annee = year(v_date_debut)
		mois = month(v_date_debut)
		jour = day(v_date_debut)
		v_jour = jour
		// Génère les factures
		for i=1 to q
			SetPointer(HourGlass!)
			v_date_fact = date(annee,mois,v_jour)
			INSERT INTO factures_traitements (traitement_id,montant,cache,date_facture,status_id,affect,imp,id_contact,id_satellite) VALUES (:il_traitid, :ld_montant, 0, :v_date_fact, :ll_status, :v_affect, 0, :ll_idcontact,:ll_idsat);
			mois = mois +1
			if mois > 12 then
				mois = 1
				annee = annee + 1
			end if
			v_jour = correction_jour(jour,mois,annee)
		next
		// Génère la dernière facture
		enr = w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getrow()
		v_montant_original = w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(enr, "montant_original")
		SELECT sum(montant) into :v_montant_affect from factures_traitements where traitement_id = :il_traitid and affect = 1;
		if isnull(v_montant_affect) = true then
			v_montant_affect = 0
		end if
		reste = v_montant_original - v_montant_affect
		v_date_fact = date(annee,mois,v_jour)
		INSERT INTO factures_traitements (traitement_id,montant,cache,date_facture, status_id,affect,imp,id_contact,id_satellite) VALUES (:il_traitid, :reste, 0, :v_date_fact,:ll_status, :v_affect, 0, :ll_idcontact,:ll_idsat);
		// log
		select max(facture_id) into :ll_idfact from factures_traitements;
		ll_idfact++
		ls_montant = string(q) + ' * ' + string(ld_montant)
		f_logs('add','0',ll_idfact,il_patid,v_date_debut,ls_montant)
	end if
	dw_factures_recents.retrieve(il_traitid,ll_lastid)
	labelpatient()

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

//IF sqldbcode = -195 THEN 
//	error_type(51)
//END IF
//RETURN 1
end event

