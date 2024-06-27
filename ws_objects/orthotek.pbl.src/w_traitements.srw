$PBExportHeader$w_traitements.srw
forward
global type w_traitements from w_child
end type
type tab_dossfin from tab within w_traitements
end type
type tabpage_tous from userobject within tab_dossfin
end type
type dw_traitements from u_dw within tabpage_tous
end type
type tabpage_tous from userobject within tab_dossfin
dw_traitements dw_traitements
end type
type tab_dossfin from tab within w_traitements
tabpage_tous tabpage_tous
end type
type cb_contrat from commandbutton within w_traitements
end type
type sle_pat from statictext within w_traitements
end type
type st_soldephase from statictext within w_traitements
end type
type cb_impfact from commandbutton within w_traitements
end type
type cb_cancel from commandbutton within w_traitements
end type
type cb_formulaire from commandbutton within w_traitements
end type
type cb_suiv from commandbutton within w_traitements
end type
type cb_prec from commandbutton within w_traitements
end type
type tab_sommaires from tab within w_traitements
end type
type tabpage_factures from userobject within tab_sommaires
end type
type dw_factures_sommaire from u_dw within tabpage_factures
end type
type tabpage_factures from userobject within tab_sommaires
dw_factures_sommaire dw_factures_sommaire
end type
type tabpage_paiements from userobject within tab_sommaires
end type
type dw_sommaire_paiement from u_dw within tabpage_paiements
end type
type tabpage_paiements from userobject within tab_sommaires
dw_sommaire_paiement dw_sommaire_paiement
end type
type tabpage_cpd from userobject within tab_sommaires
end type
type dw_cpd_sommaire from u_dw within tabpage_cpd
end type
type tabpage_cpd from userobject within tab_sommaires
dw_cpd_sommaire dw_cpd_sommaire
end type
type tabpage_pour from userobject within tab_sommaires
end type
type cb_insertpourc from commandbutton within tabpage_pour
end type
type cb_updatepour from commandbutton within tabpage_pour
end type
type dw_pourcentages from u_dw within tabpage_pour
end type
type tabpage_pour from userobject within tab_sommaires
cb_insertpourc cb_insertpourc
cb_updatepour cb_updatepour
dw_pourcentages dw_pourcentages
end type
type tabpage_charges from userobject within tab_sommaires
end type
type cb_recalc from commandbutton within tabpage_charges
end type
type cb_delete from commandbutton within tabpage_charges
end type
type cb_insert from commandbutton within tabpage_charges
end type
type dw_dossfincharges from u_dw within tabpage_charges
end type
type tabpage_charges from userobject within tab_sommaires
cb_recalc cb_recalc
cb_delete cb_delete
cb_insert cb_insert
dw_dossfincharges dw_dossfincharges
end type
type tab_sommaires from tab within w_traitements
tabpage_factures tabpage_factures
tabpage_paiements tabpage_paiements
tabpage_cpd tabpage_cpd
tabpage_pour tabpage_pour
tabpage_charges tabpage_charges
end type
type cb_recuu from commandbutton within w_traitements
end type
type cb_postdate from commandbutton within w_traitements
end type
type cb_update from commandbutton within w_traitements
end type
type cb_phase from commandbutton within w_traitements
end type
type cb_paiement from commandbutton within w_traitements
end type
type cb_facture from commandbutton within w_traitements
end type
type st_3 from statictext within w_traitements
end type
type st_4 from statictext within w_traitements
end type
type sle_date from singlelineedit within w_traitements
end type
type sle_no_dossier from singlelineedit within w_traitements
end type
type st_traitements from statictext within w_traitements
end type
type cb_close from commandbutton within w_traitements
end type
end forward

global type w_traitements from w_child
string tag = "dossfin"
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
tab_dossfin tab_dossfin
cb_contrat cb_contrat
sle_pat sle_pat
st_soldephase st_soldephase
cb_impfact cb_impfact
cb_cancel cb_cancel
cb_formulaire cb_formulaire
cb_suiv cb_suiv
cb_prec cb_prec
tab_sommaires tab_sommaires
cb_recuu cb_recuu
cb_postdate cb_postdate
cb_update cb_update
cb_phase cb_phase
cb_paiement cb_paiement
cb_facture cb_facture
st_3 st_3
st_4 st_4
sle_date sle_date
sle_no_dossier sle_no_dossier
st_traitements st_traitements
cb_close cb_close
end type
global w_traitements w_traitements

type variables
public int tab_selected
public long il_traitid
public long il_patid
public boolean IB_PERIODIC = false
public int changement, ii_changpourc
private boolean gb_phase = false
private string is_montant
public DataWindowChild dddw_phase
u_tabpdossfin iuo_tabpdossfin[]
public long il_idcont[]
end variables

forward prototypes
public subroutine labelpatient ()
public subroutine setuppourcentage ()
public subroutine findcurrentphase ()
public subroutine if_close ()
public subroutine findphase ()
public subroutine checksolde ()
public subroutine cbrefresh ()
public subroutine addphase ()
public subroutine tabrefresh ()
public subroutine sauve ()
public function long getidphase (long al_phase)
public subroutine uf_setcontratfact (long al_idphase, long al_idcontact)
end prototypes

event ue_post_event();int nb_phase, i

labelpatient()
findphase()

//datastore ds_dossier_patient
//ds_dossier_patient = create datastore
//ds_dossier_patient.dataobject = "d_dossier_patient"
//ds_dossier_patient.SetTransObject(SQLCA)
//ds_dossier_patient.retrieve(message.doubleparm)
//sle_nom.text = w_patient.dw_details_patient.getitemstring(enr,"patient_nom")
//destroy ds_dossier_patient

end event

public subroutine labelpatient ();long enr
date ldt_date
string ls_nom,ls_prenom,ls_nodoss

Select patient_nom,patient_prenom,date_naissance,new_dossier into :ls_nom,:ls_prenom,:ldt_date,:ls_nodoss from patient where patient_id = :il_patid;
enr  = w_patient.dw_details_patient.getrow()
sle_pat.text = ls_nom + ' ' + ls_prenom
sle_date.text = string(ldt_date)
sle_no_dossier.text = ls_nodoss
end subroutine

public subroutine setuppourcentage ();int li_year, li_check = 0

li_year = year(today())
select count(*) into :li_check from t_pourcentages where traitement_id = :il_traitid and annee = :li_year;
if li_check = 0 then
	li_check = 0
	select count(*) into :li_check from t_pourcentages where traitement_id = :il_traitid and pourcentage = 100;
	if li_check = 0 then
		insert into t_pourcentages(annee,pourcentage,traitement_id) values(:li_year,0,:il_traitid);
	end if
end if
end subroutine

public subroutine findcurrentphase ();long ll_traitid

ll_traitid = tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(tab_dossfin.tabpage_tous.dw_traitements.getrow(),'traitement_id')
if ll_traitid > 0 and isnull(ll_traitid) = false then
	il_traitid = ll_traitid
	tab_dossfin.tabpage_tous.dw_traitements.Retrieve(il_traitid)
else	
	findphase()
end if

end subroutine

public subroutine if_close ();if changement = 1 then
	if error_type(200) = 1 then
		sauve()
	end if
end if
if isvalid(w_cpd) then
	if w_cpd.changement = 1 then
		if error_type(200) = 1 then
			w_cpd.maj()
		end if
	end if
	close(w_cpd)
	close(w_traitements)
else
	close(w_traitements)
end if
end subroutine

public subroutine findphase ();//u_tabpdossfin luo_tabpdossfin
//pro_resize luo_size
string ls_nom
long ll_idcont, i = 1

select max(traitement_id) into :il_traitid from traitements where patient_id = :il_patid;
if il_traitid > 0 then
	tab_dossfin.tabpage_tous.dw_traitements.Retrieve(il_traitid)
	
	// Création des tabs necessaire

	DECLARE listresp CURSOR FOR 
		select isnull(nom,'') || ' ' || isnull(prenom,''), id_contact
		from t_contact 
		where patient_id = :il_patid and
				isnull(payeur,0) = 1;
	 
	OPEN listresp;
	 
	FETCH listresp INTO :ls_nom, :ll_idcont;
	 
	DO WHILE SQLCA.SQLCode = 0
		
		tab_dossfin.OpenTab(iuo_tabpdossfin[i], 0)
		iuo_tabpdossfin[i].text = ls_nom
		iuo_tabpdossfin[i].dw_traitements.retrieve(il_traitid,ll_idcont)
		il_idcont[i] = ll_idcont
		i++
		
		FETCH listresp INTO :ls_nom, :ll_idcont;
	
	LOOP
	 
	CLOSE listresp;
	
	checksolde()
end if
//luo_size.uf_resizetab(this,tab_dossfin)
tabrefresh()
cbrefresh()
end subroutine

public subroutine checksolde ();long ll_testtraitid
integer li_phase
dec{2} ld_totfact, ld_totpaie
string ls_phase

// verifie les soldes des autres phases et avertie
li_phase = tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(1,'phase')
if li_phase > 1 then
	li_phase -= 1
	do until li_phase = 0
		select traitement_id, t_phase.phase into :ll_testtraitid, :ls_phase 
		from traitements INNER JOIN t_phase ON t_phase.id_phase = traitements.id_phase 
		where patient_id = :il_patid and traitements.phase = :li_phase;
		select isnull(sum(isnull(montant,0)),0) into :ld_totfact from factures_traitements where traitement_id = :ll_testtraitid;
		if isnull(ld_totfact) then ld_totfact = 0       
		select isnull(sum(isnull(montant_recu,0)),0) into :ld_totpaie from paiement where traitement_patient_id = :ll_testtraitid;
		if isnull(ld_totpaie) then ld_totpaie = 0
		if ld_totfact - ld_totpaie > 0 then
			st_soldephase.visible = true
			if v_langue = 'an' then
				st_soldephase.text = 'WARNING ! : There is an unpaid balance in previous phase :  ' + ls_phase
			else
				st_soldephase.text = 'ATTENTION ! : Il reste un solde impayé à la phase :  ' + ls_phase
			end if
			return
		elseif ld_totfact - ld_totpaie < 0 then
			st_soldephase.visible = true
			if v_langue = 'an' then
				st_soldephase.text = 'WARNING ! : There is an unused payment in previous phase :  ' + ls_phase
			else
				st_soldephase.text = 'ATTENTION ! : Il y a un paiement inutilisé à la phase :  ' + ls_phase
			end if
			return
		else
			st_soldephase.visible = false
		end if
		li_phase -= 1
	loop
elseif li_phase = 1 then
	st_soldephase.visible = false
end if

// Regarde s'il y a un trop payé dans les phases antérieurs
end subroutine

public subroutine cbrefresh ();int v_no_phase, v_nb_phase

select count(*) into :v_nb_phase from traitements where patient_id = :w_traitements.il_patid;
if v_nb_phase > 0 then
	if w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getrow(),'traitement_id') > 0 then
		cb_cancel.enabled = TRUE
		cb_facture.enabled = TRUE
		cb_paiement.enabled = TRUE
		cb_postdate.enabled = TRUE
		cb_impfact.enabled = TRUE
		cb_update.enabled = TRUE
	else
		cb_cancel.enabled = FALSE
		cb_facture.enabled = FALSE
		cb_paiement.enabled = FALSE
		cb_postdate.enabled = FALSE
		cb_impfact.enabled = FALSE
		if tab_dossfin.tabpage_tous.dw_traitements.getrow() > 0 then
			cb_update.enabled = TRUE
		else
			cb_update.enabled = FALSE
		end if
	end if
	v_no_phase = w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getrow(),'phase')
	if v_nb_phase - v_no_phase >= 1 then 
		cb_suiv.enabled = TRUE
	else
		cb_suiv.enabled = FALSE
	end if
	if	v_nb_phase - v_no_phase < v_nb_phase - 1 then
		cb_prec.enabled = TRUE
	else
		cb_prec.enabled = FALSE
	end if
	if tab_sommaires.tabpage_paiements.dw_sommaire_paiement.getrow() > 0 then
		cb_recuu.enabled = TRUE
	else
		cb_recuu.enabled = FALSE
	end if
//	if tab_sommaires.tabpage_factures.dw_factures_sommaire.getrow() > 0 then
//		cb_formulaire.enabled = TRUE
//	else
//		cb_formulaire.enabled = FALSE
//	end if
else
	cb_cancel.enabled = FALSE
	cb_suiv.enabled = FALSE
	cb_prec.enabled = FALSE
	cb_facture.enabled = FALSE
	cb_paiement.enabled = FALSE
	cb_postdate.enabled = FALSE
	cb_recuu.enabled = FALSE
//	cb_formulaire.enabled = FALSE
	cb_impfact.enabled = FALSE
	if tab_dossfin.tabpage_tous.dw_traitements.getrow() > 0 then
		cb_update.enabled = TRUE
	else
		cb_update.enabled = FALSE
	end if
end if
end subroutine

public subroutine addphase ();int li_nbphase 
long enr,ll_idphase, numero_phase

if changement = 1 then
	sauve()
end if

// Génère le numéro de la phase
select isnull(max(isnull(phase,0)),0) + 1 into :numero_phase from traitements where patient_id = :il_patid;
ll_idphase = GetIdPhase(numero_phase)
enr = tab_dossfin.tabpage_tous.dw_traitements.InsertRow(0)
tab_dossfin.tabpage_tous.dw_traitements.scrolltorow(enr)
tab_dossfin.tabpage_tous.dw_traitements.setfocus()
// Ajuste les champs de la DataWindow
//dw_traitements.setitem(enr,"montantduaff",0)
tab_dossfin.tabpage_tous.dw_traitements.setitem(enr,"montantpaye",0) 
//dw_traitements.setitem(enr,"montant_original",0) 
tab_dossfin.tabpage_tous.dw_traitements.setitem(enr,"frais",0) 
tab_dossfin.tabpage_tous.dw_traitements.setitem(enr,"phase", numero_phase)
tab_dossfin.tabpage_tous.dw_traitements.setitem(enr,"patient_id", il_patid)
tab_dossfin.tabpage_tous.dw_traitements.setitem(enr,"debut_traitement",today())
tab_dossfin.tabpage_tous.dw_traitements.setitem(enr,"id_phase",ll_idphase)
tab_dossfin.tabpage_tous.dw_traitements.setitem(enr,"phasetype",'f')
tab_dossfin.tabpage_tous.dw_traitements.setitem(enr,"etatcompte",1)
gb_phase = true
tabrefresh()
cbrefresh()
changement = 1

f_logs('add','',numero_phase,il_patid,today(),'') //log

end subroutine

public subroutine tabrefresh ();long row

row = w_traitements.tab_dossfin.tabpage_tous.dw_traitements.getrow()
if isnull(il_traitid) = false and il_traitid > 0 then
	tab_sommaires.visible = true
	if gb_phase = true then
		tab_sommaires.tabpage_factures.dw_factures_sommaire.Reset()
		tab_sommaires.tabpage_paiements.dw_sommaire_paiement.Reset()
		tab_sommaires.tabpage_cpd.dw_cpd_sommaire.Reset()
		tab_sommaires.tabpage_pour.dw_pourcentages.Reset()
	else
		// Retrouver les factures
		
		tab_sommaires.tabpage_factures.dw_factures_sommaire.setRedraw(false)
		if tab_dossfin.selectedtab = 1 then
			tab_sommaires.tabpage_factures.dw_factures_sommaire.setFilter("")
		else
			tab_sommaires.tabpage_factures.dw_factures_sommaire.setFilter("id_contact = " + string(il_idcont[tab_dossfin.selectedtab - 1]))
		end if
		tab_sommaires.tabpage_factures.dw_factures_sommaire.Retrieve(il_traitid)
		tab_sommaires.tabpage_factures.dw_factures_sommaire.setRedraw(true)
		
		// Retrouver les paiements
		
		tab_sommaires.tabpage_paiements.dw_sommaire_paiement.setRedraw(false)
		if tab_dossfin.selectedtab = 1 then
			tab_sommaires.tabpage_paiements.dw_sommaire_paiement.setFilter("")
		else
			tab_sommaires.tabpage_paiements.dw_sommaire_paiement.setFilter("id_contact = " + string(il_idcont[tab_dossfin.selectedtab - 1]))
		end if
		tab_sommaires.tabpage_paiements.dw_sommaire_paiement.Retrieve(il_traitid)
		tab_sommaires.tabpage_paiements.dw_sommaire_paiement.setRedraw(true)
		
		// Retrouver les CPDS
		
		tab_sommaires.tabpage_cpd.dw_cpd_sommaire.setRedraw(false)
		if tab_dossfin.selectedtab = 1 then
			tab_sommaires.tabpage_cpd.dw_cpd_sommaire.setFilter("")
		else
			tab_sommaires.tabpage_cpd.dw_cpd_sommaire.setFilter("id_contact = " + string(il_idcont[tab_dossfin.selectedtab - 1]))
		end if
		tab_sommaires.tabpage_cpd.dw_cpd_sommaire.Retrieve(il_traitid)
		tab_sommaires.tabpage_cpd.dw_cpd_sommaire.setRedraw(true)
		
		tab_sommaires.tabpage_pour.dw_pourcentages.Retrieve(il_traitid)
		tab_sommaires.tabpage_charges.dw_dossfincharges.Retrieve(il_patid)
	end if
else
	tab_sommaires.visible = false
end if


end subroutine

public subroutine sauve ();tab_dossfin.tabpage_tous.dw_traitements.accepttext()
tab_dossfin.tabpage_tous.dw_traitements.event updatetrait()
if tab_dossfin.tabpage_tous.dw_traitements.update() = 1 then
	commit using sqlca;
	findcurrentphase()
	setuppourcentage()
	gb_phase = false
	cbrefresh()
	tabrefresh()
	changement = 0
else
	error_type(50)
	rollback;
end if
end subroutine

public function long getidphase (long al_phase);long ll_id,ll_idphase, i = 1

// Interrogation

Declare idphase Cursor For
	select id_phase from t_phase where ortho_id = :v_no_ortho order by id_phase asc;
Open idphase;
	Fetch idphase Into :ll_idphase;
	Do While SQLCA.sqlcode = 0 and i <= al_phase
		ll_id = ll_idphase
		i++
		Fetch idphase Into :ll_idphase;
	Loop
Close idphase;

return ll_id
end function

public subroutine uf_setcontratfact (long al_idphase, long al_idcontact);long ll_statusid = 1
integer j,i,li_nb,li_qty,li_annee,li_mois,li_jour,li_jourcorr,li_periode,li_affect,li_pourc,li_count,li_mens,li_inc,li_jump
decimal{2} ld_couttrait,ld_initial,ld_mens,ld_final,ld_cons,ld_cons2,ld_diag,ld_retfee,ld_meb
date ldt_trait,ldt_startmens,ldt_mens,ldt_diag,ldt_meb,ldt_fintrait
string ls_periode
setnull(ldt_mens)
// determiner le status_id de la mensualite
select status_id into :li_mens from t_status where ordrepaie = 7;
if not li_mens > 0 then 
	li_mens = 1
end if

Declare resp Cursor For
 	select pourcentage,date1,couttrait,cons,cons2,diag,datediag,retfee,meb,datemeb,initial,mdate1,mqty,mmontant,paiefinal,periode
	from t_contrats
	where patient_id = :il_patid and id_phase = :al_idphase and id_contact = :al_idcontact;
OPEN resp;

	Fetch resp Into :li_pourc,:ldt_trait,:ld_couttrait,:ld_cons,:ld_cons2,:ld_diag,:ldt_diag,:ld_retfee,:ld_meb,:ldt_meb,:ld_initial,:ldt_startmens,:li_qty,:ld_mens,:ld_final,:ls_periode;

Do While SQLCA.SQLCode = 0
	choose case ls_periode
		case 'm'
			li_periode = 1
		case 'b'
			li_periode = 2
		case 'q'
			li_periode = 4
		case 's'
			li_periode = 6
		case 'a'
			li_periode = 12
	end choose
	// Facture cons,diag,ret,meb
/*	if ld_cons > 0 then
		// utilise le premier status_id consultation rencontre
		select status_id,affect into :ll_statusid,:li_affect from t_status where ordrepaie = 1;
		if not ll_statusid > 0 then 
			ll_statusid = li_mens
			li_affect = 1
		end if
		// verifie si il y a deja une conultation qui a ete donnee
		select count(*) into :li_count from factures_traitements inner join t_status on factures_traitements.status_id = t_status.status_id 
		where factures_traitements.traitement_id = :il_traitid and 
				t_status.ordrepaie = 1 and
				factures_traitements.id_contact = :al_idcontact;
		if li_count = 0 then
			INSERT INTO factures_traitements(traitement_id,montant,cache,date_facture,status_id,affect,imp,id_contact) 
			VALUES (:il_traitid,:ld_cons,0,:ldt_trait,:ll_statusid,:li_affect,0,:al_idcontact);
			if (SQLCA.sqlCode <> 0) then
				messagebox(string(today()) + ',' + string(now()),SQLCA.SQLErrText)
			end if
		end if
		ll_statusid = 0
		li_count = 0
	end if
	// Consultation 2
	if ld_cons2 > 0 then
		// utilise le premier status_id consultation rencontre
		select status_id,affect into :ll_statusid,:li_affect from t_status where ordrepaie = 8;
		if not ll_statusid > 0 then 
			ll_statusid = li_mens
			li_affect = 1
		end if
		// verifie si il y a deja une conultation qui a ete donnee
		select count(*) into :li_count from factures_traitements inner join t_status on factures_traitements.status_id = t_status.status_id 
		where factures_traitements.traitement_id = :il_traitid and 
				t_status.ordrepaie = 8 and
				factures_traitements.id_contact = :al_idcontact;
		if li_count = 0 then
			INSERT INTO factures_traitements(traitement_id,montant,cache,date_facture,status_id,affect,imp,id_contact) 
			VALUES (:il_traitid,:ld_cons2,0,:ldt_trait,:ll_statusid,:li_affect,0,:al_idcontact);
			if (SQLCA.sqlCode <> 0) then
				messagebox(string(today()) + ',' + string(now()),SQLCA.SQLErrText)
			end if
		end if
		ll_statusid = 0
		li_count = 0
	end if */
	
	
	if ld_diag > 0 then
		// utilise le premier status_id diagnostic rencontre
		select status_id,affect into :ll_statusid,:li_affect from t_status where ordrepaie = 2;
		if not ll_statusid > 0 then 
			ll_statusid = li_mens
			li_affect = 1
		end if
		// verifie si il y a deja un diagnostic qui a ete donnee
		select count(*) into :li_count 
		from factures_traitements inner join t_status on factures_traitements.status_id = t_status.status_id 
		where factures_traitements.traitement_id = :il_traitid and 
				t_status.ordrepaie = 2 and
				factures_traitements.id_contact = :al_idcontact;
		if li_count = 0 then
	//		ld_diag = ld_diag * li_pourc / 100
			if isnull(ldt_diag) then ldt_diag = ldt_trait
			INSERT INTO factures_traitements(traitement_id,montant,cache,date_facture,status_id,affect,imp,id_contact) 
			VALUES (:il_traitid,:ld_diag,0,:ldt_diag,:ll_statusid,:li_affect,0,:al_idcontact);
			if (SQLCA.sqlCode <> 0) then
				messagebox(string(today()) + ',' + string(now()),SQLCA.SQLErrText)
			end if
		end if
		ll_statusid = 0
		li_count = 0
	end if
	if ld_meb > 0 then
		// utilise le premier status_id meb rencontre
		select status_id,affect into :ll_statusid,:li_affect from t_status where ordrepaie = 3;
		if not ll_statusid > 0 then 
			ll_statusid = li_mens
			li_affect = 1
		end if
		// verifie si il y a deja une meb qui a ete donnee
		select count(*) into :li_count from factures_traitements inner join t_status on factures_traitements.status_id = t_status.status_id  
		where factures_traitements.traitement_id = :il_traitid and 
				t_status.ordrepaie = 3 and
				factures_traitements.id_contact = :al_idcontact;
		if li_count = 0 then
//			ld_meb = ld_meb * li_pourc / 100
			if isnull(ldt_meb) then ldt_meb = ldt_trait
			INSERT INTO factures_traitements(traitement_id,montant,cache,date_facture,status_id,affect,imp,id_contact) 
			VALUES (:il_traitid,:ld_meb,0,:ldt_meb,:ll_statusid,:li_affect,0,:al_idcontact);
			if (SQLCA.sqlCode <> 0) then
				messagebox(string(today()) + ',' + string(now()),SQLCA.SQLErrText)
			end if
		end if
		ll_statusid = 0
		li_count = 0
	end if
	// Facture initial
	if ld_initial > 0 then
		select status_id,affect into :ll_statusid,:li_affect from t_status where ordrepaie = 5;
		if not ll_statusid > 0 then 
			ll_statusid = li_mens
			li_affect = 1
		end if
//		ld_initial = ld_initial * li_pourc / 100
		if isnull(ldt_meb) then ldt_meb = ldt_trait
		INSERT INTO factures_traitements(traitement_id,montant,cache,date_facture,status_id,affect,imp,id_contact) 
		VALUES (:il_traitid,:ld_initial,0,:ldt_meb,:ll_statusid,:li_affect,0,:al_idcontact);
		if (SQLCA.sqlCode <> 0) then
			messagebox(string(today()) + ',' + string(now()),SQLCA.SQLErrText)
		end if
	end if
	// Génère les factures
	for i = 1 to li_qty
		li_affect = 1
		if isnull(ldt_mens) then ldt_mens = ldt_startmens
		INSERT INTO factures_traitements (traitement_id,montant,cache,date_facture,status_id,affect,imp,id_contact) 
		VALUES (:il_traitid,:ld_mens,0,:ldt_mens,:li_mens,:li_affect,0,:al_idcontact);
		if (SQLCA.sqlCode <> 0) then
			messagebox(string(today()) + ',' + string(now()),SQLCA.SQLErrText)
		end if
		if isnull(li_inc) then li_inc = li_periode
		li_jump += li_inc + li_periode
		ldt_mens = gf_monthjump(ldt_startmens,li_jump)
	next
	// Génère la dernière facture
	INSERT INTO factures_traitements(traitement_id,montant,cache,date_facture,status_id,affect,imp,id_contact) 
	VALUES (:il_traitid,:ld_final,0,:ldt_mens,:li_mens,:li_affect,0,:al_idcontact);
	if (SQLCA.sqlCode <> 0) then
		messagebox(string(today()) + ',' + string(now()),SQLCA.SQLErrText)
	end if
	// Retention
	li_jump += li_inc + li_periode
	ldt_mens = gf_monthjump(ldt_startmens,li_jump)
	if ld_retfee > 0 then
		select status_id,affect into :ll_statusid,:li_affect from t_status where ordrepaie = 4;
		if not ll_statusid > 0 then 
			ll_statusid = 1
			li_affect = 1
		end if
//		ld_retfee = ld_retfee * li_pourc / 100
		INSERT INTO factures_traitements(traitement_id,montant,cache,date_facture,status_id,affect,imp,id_contact) 
		VALUES (:il_traitid,:ld_retfee,0,:ldt_mens,:ll_statusid,:li_affect,0,:al_idcontact);
		if (SQLCA.sqlCode <> 0) then
			messagebox(string(today()) + ',' + string(now()),SQLCA.SQLErrText)
		end if
		ll_statusid = 0
	end if
	Fetch resp Into :li_pourc,:ldt_trait,:ld_couttrait,:ld_cons,:ld_diag,:ld_retfee,:ld_meb,:ld_initial,:ldt_startmens,:li_qty,:ld_mens,:ld_final,:ls_periode;
Loop
// date de fin de traitement
select max(date_facture) into :ldt_fintrait from factures_traitements where factures_traitements.traitement_id = :il_traitid;
update traitements set fin_traitement = :ldt_fintrait where traitements.traitement_id = :il_traitid;
update t_contrats set inuse = 1 where id_contact = :al_idcontact and patient_id = :il_patid and id_phase = :al_idphase;
CLOSE resp;
end subroutine

on w_traitements.create
int iCurrent
call super::create
this.tab_dossfin=create tab_dossfin
this.cb_contrat=create cb_contrat
this.sle_pat=create sle_pat
this.st_soldephase=create st_soldephase
this.cb_impfact=create cb_impfact
this.cb_cancel=create cb_cancel
this.cb_formulaire=create cb_formulaire
this.cb_suiv=create cb_suiv
this.cb_prec=create cb_prec
this.tab_sommaires=create tab_sommaires
this.cb_recuu=create cb_recuu
this.cb_postdate=create cb_postdate
this.cb_update=create cb_update
this.cb_phase=create cb_phase
this.cb_paiement=create cb_paiement
this.cb_facture=create cb_facture
this.st_3=create st_3
this.st_4=create st_4
this.sle_date=create sle_date
this.sle_no_dossier=create sle_no_dossier
this.st_traitements=create st_traitements
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_dossfin
this.Control[iCurrent+2]=this.cb_contrat
this.Control[iCurrent+3]=this.sle_pat
this.Control[iCurrent+4]=this.st_soldephase
this.Control[iCurrent+5]=this.cb_impfact
this.Control[iCurrent+6]=this.cb_cancel
this.Control[iCurrent+7]=this.cb_formulaire
this.Control[iCurrent+8]=this.cb_suiv
this.Control[iCurrent+9]=this.cb_prec
this.Control[iCurrent+10]=this.tab_sommaires
this.Control[iCurrent+11]=this.cb_recuu
this.Control[iCurrent+12]=this.cb_postdate
this.Control[iCurrent+13]=this.cb_update
this.Control[iCurrent+14]=this.cb_phase
this.Control[iCurrent+15]=this.cb_paiement
this.Control[iCurrent+16]=this.cb_facture
this.Control[iCurrent+17]=this.st_3
this.Control[iCurrent+18]=this.st_4
this.Control[iCurrent+19]=this.sle_date
this.Control[iCurrent+20]=this.sle_no_dossier
this.Control[iCurrent+21]=this.st_traitements
this.Control[iCurrent+22]=this.cb_close
end on

on w_traitements.destroy
call super::destroy
destroy(this.tab_dossfin)
destroy(this.cb_contrat)
destroy(this.sle_pat)
destroy(this.st_soldephase)
destroy(this.cb_impfact)
destroy(this.cb_cancel)
destroy(this.cb_formulaire)
destroy(this.cb_suiv)
destroy(this.cb_prec)
destroy(this.tab_sommaires)
destroy(this.cb_recuu)
destroy(this.cb_postdate)
destroy(this.cb_update)
destroy(this.cb_phase)
destroy(this.cb_paiement)
destroy(this.cb_facture)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.sle_date)
destroy(this.sle_no_dossier)
destroy(this.st_traitements)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_patid = message.doubleparm  //parametre externe
 
w_traitements.postevent('ue_post_event')
end event

event activate;gf_uhelp(il_patid)
end event

type tab_dossfin from tab within w_traitements
integer y = 336
integer width = 1870
integer height = 1332
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_tous tabpage_tous
end type

on tab_dossfin.create
this.tabpage_tous=create tabpage_tous
this.Control[]={this.tabpage_tous}
end on

on tab_dossfin.destroy
destroy(this.tabpage_tous)
end on

event selectionchanged;tabrefresh()
end event

type tabpage_tous from userobject within tab_dossfin
integer x = 18
integer y = 112
integer width = 1833
integer height = 1204
long backcolor = 67108864
string text = "Tous"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_traitements dw_traitements
end type

on tabpage_tous.create
this.dw_traitements=create dw_traitements
this.Control[]={this.dw_traitements}
end on

on tabpage_tous.destroy
destroy(this.dw_traitements)
end on

type dw_traitements from u_dw within tabpage_tous
event updatetrait ( )
event type boolean ue_setcontrat ( long al_contid,  long al_phase )
integer width = 1906
integer height = 1196
integer taborder = 20
string dataobject = "d_traitements"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event updatetrait();long row
dec{2} ld_frais, ld_montantpaye, ld_montantdu
row = this.getrow()
ld_frais = this.getitemnumber(row,'v_frais')
ld_montantpaye = this.getitemnumber(row,'montantpaye')
ld_montantdu = this.getitemnumber(row,'c_montantdu')
if isnull(ld_frais) then ld_frais = 0
if isnull(ld_montantpaye) then ld_montantpaye = 0
if isnull(ld_montantdu) then ld_montantdu = 0
this.setitem(row,'frais',ld_frais)
this.setitem(row,'montant_paye',ld_montantpaye)
this.setitem(row,'montant_du',ld_montantdu)
end event

event type boolean ue_setcontrat(long al_contid, long al_phase);//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 07/08/2004
// Demande  : Dr. Sydney Konigsberg
// Version  : 7.8.4
//
// Cette fonction génère les contrats automatiquements qui ont
// été créé dans le dossier du patient.
//	
//////////////////////////////////

long ll_newrow,ll_phase
integer li_phase,li_nbcontrat
decimal{2} ld_couttrait
date ld_debut, ldt_datemens
string ls_note, ls_note2

//verifier si il y a des contrats non créé
//select count(*) into :li_nbcontrat from t_contrats where patient_id = :il_patid and inuse = 0;

//if li_nbcontrat >= 1 then
	// generation du contrat automatique
	if error_type(242) = 1 then
//		Declare contrat Cursor For
//		 
//			select id_contact,id_phase
//			from t_contrats 
//			where patient_id = :il_patid and inuse = 0;
//								
//		OPEN contrat;
//		
//		Fetch contrat Into :ll_idcontact,:ll_idphase;
//		
//		Do While SQLCA.SQLCode = 0
			
			select sum(couttrait),description,date1, mdate1 
			into :ld_couttrait,:ls_note,:ld_debut, :ldt_datemens
			from t_contrats 
			where patient_id = :il_patid and id_phase = :al_phase
			group by id_phase,description,date1,mdate1;
			
			// Vérifier si les dates sont présentes
			
			if isnull(ld_debut) or isnull(ldt_datemens) or ld_debut = date(1900,1,1) or ldt_datemens = date(1900,1,1) then
				error_type(1007)
			else				
				//verification si la phase existe deja
				select count(*) into :li_nbcontrat from traitements where patient_id = :il_patid and id_phase = :al_phase;
				if li_nbcontrat >= 1 then
	//				select traitement_id into :il_traitid from traitements where patient_id = :il_patid and id_phase = :ll_idphase;
					ll_newrow = dw_traitements.find("id_phase = " + string(al_phase),1,dw_traitements.rowcount())
					if ll_newrow > 0 THEN
						dw_traitements.setitem(ll_newrow,"montant_original",ld_couttrait)
						dw_traitements.setitem(ll_newrow,"debut_traitement",ld_debut)
						ls_note2 = dw_traitements.getitemstring(ll_newrow,"note")
						if isnull(ls_note2) then ls_note2 = ""
						if isnull(ls_note) then ls_note = ""
						ls_note2 += '~r~n' + ls_note
						dw_traitements.setitem(ll_newrow,"note",ls_note2)
						dw_traitements.setitem(ll_newrow,"phasetype",'f')
					END IF
				else
					ll_newrow = dw_traitements.InsertRow(0)
					dw_traitements.scrolltorow(ll_newrow)
					dw_traitements.setfocus()
					// Ajuste les champs de la DataWindow
					dw_traitements.setitem(ll_newrow,"montantpaye",0)
					dw_traitements.setitem(ll_newrow,"montant_original",ld_couttrait)
					dw_traitements.setitem(ll_newrow,"frais",0)
					select max(isnull(phase,0)) + 1 into :ll_phase from traitements where patient_id = :il_patid;
					dw_traitements.setitem(ll_newrow,"phase", ll_phase)
					dw_traitements.setitem(ll_newrow,"id_phase",al_phase)
					dw_traitements.setitem(ll_newrow,"patient_id", il_patid)
					dw_traitements.setitem(ll_newrow,"debut_traitement",ld_debut)
					dw_traitements.setitem(ll_newrow,"note",ls_note)
					dw_traitements.setitem(ll_newrow,"phasetype",'f')
					gb_phase = true
					sauve()
					select max(traitement_id) into :il_traitid from traitements;
				end if
				// Generation factures
				uf_setcontratfact(al_phase,al_contid)
			end if
			
//			Fetch contrat Into :ll_idcontact,:ll_idphase;
		
//		Loop
//		CLOSE contrat;
		sauve()
		f_logs('add','contrat',ll_phase,il_patid,today(),string(ld_couttrait)) //log
		return false
	else
		return true
	end if
//else
//	return true
//end if
end event

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

tab_dossfin.tabpage_tous.dw_traitements.SetTransObject(SQLCA)
changement = 0
if v_langue = 'an' then
	this.object.montant_paye_t.text = 'Paid amount:'
	this.object.t_2.text = 'Global cost:'
	this.object.montant_original_t.text = 'Treatment cost:'
	this.object.t_ctd.text = 'Charged to date:'
	this.object.montant_du_t.text = 'Due amount:'
	this.object.t_1.text = 'Balance:'
	this.object.debut_traitement_t.text = 'Treatment start:'
	this.object.fin_traitement_t.text = 'Treatment end:'
	this.object.t_pdconhand.text = 'PDC on hand:'
	this.object.t_tocollect.text = 'To collect:'
	this.object.etatcompte.CheckBox.Text = 'Statement'
	this.object.phasetype.values = 'Fonctional~tf/Esthetics~te'
else
	this.object.phasetype.values = 'Fonctionnel~tf/Esthétique~te'
end if

if this.GetChild('id_phase', dddw_phase) = -1 then
	error_type(0)
end if
dddw_phase.SetTransObject(SQLCA)
dddw_phase.setfilter("string(ortho_id) = '" + string(v_no_ortho) + "'")
dddw_phase.retrieve()
end event

event dberror;call super::dberror;str_error  ErrorStr
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

event editchanged;call super::editchanged;changement = 1
end event

event itemchanged;call super::itemchanged;changement = 1
if dwo.name = 'montant_original' then
	f_logs('chg',is_montant,il_traitid,il_patid,today(),data)
end if
end event

type cb_contrat from commandbutton within w_traitements
integer x = 1317
integer y = 1772
integer width = 265
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Contrat"
end type

event clicked;long ll_patid, ll_contid, ll_phaseid

gnv_app.inv_entrepotglobal.of_ajoutedonnee("patientchoixcontrat", il_patid)
open(w_choixcontrat)
ll_patid = long(gnv_app.inv_entrepotglobal.of_retournedonnee("patientcontrat"))
ll_contid = long(gnv_app.inv_entrepotglobal.of_retournedonnee("contactcontrat"))
ll_phaseid = long(gnv_app.inv_entrepotglobal.of_retournedonnee("phasecontrat"))
if ll_patid > 0 then
	tab_dossfin.tabpage_tous.dw_traitements.event ue_setcontrat(ll_contid,ll_phaseid)
end if
end event

type sle_pat from statictext within w_traitements
integer y = 128
integer width = 1861
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 8388608
long backcolor = 67108864
string text = "err"
boolean focusrectangle = false
end type

event clicked;Opensheetwithparm(w_dossier_patients,w_patient.il_patid,w_principal,2,layered!)
end event

type st_soldephase from statictext within w_traitements
boolean visible = false
integer x = 37
integer y = 1680
integer width = 1824
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 67108864
string text = "err"
boolean focusrectangle = false
end type

type cb_impfact from commandbutton within w_traitements
integer x = 453
integer y = 1888
integer width = 448
integer height = 136
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imp.fact."
end type

event clicked;integer li_option
long ll_modfact

select norminvoice, isnull(modelefacture,1) into :li_option, :ll_modfact from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	OpenSheetwithparm(w_factures_imp,tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(tab_dossfin.tabpage_tous.dw_traitements.getrow(),'traitement_id'), w_principal, 2, layered!)
else
	CHOOSE CASE ll_modfact
		CASE 1
			Opensheetwithparm(w_invoice,tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(tab_dossfin.tabpage_tous.dw_traitements.getrow(),'traitement_id'),w_principal,2,layered!)
		CASE 2
			Opensheetwithparm(w_invoice2,tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(tab_dossfin.tabpage_tous.dw_traitements.getrow(),'traitement_id'),w_principal,2,layered!)
	END CHOOSE
end if

end event

event constructor;if v_langue = 'an' then
	this.text = "Print Rec."
end if
end event

type cb_cancel from commandbutton within w_traitements
integer x = 1586
integer y = 1772
integer width = 279
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "- Phase"
end type

event clicked;open(w_passwordsupphase,w_traitements)
findphase()
changement = 0
end event

event constructor;if v_langue = 'an' then
	this.text = "Del phase"
end if
end event

type cb_formulaire from commandbutton within w_traitements
integer x = 2254
integer y = 1888
integer width = 448
integer height = 136
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Formulaire"
end type

event clicked;/* Copyright II4net Inc.
   créer le: 09-04-2003
	modifier le: 09-04-2003
	Auteur dernière modif: Dave Tremblay
*/

int li_typeform

select typeform into :li_typeform from t_options where ortho_id = :v_no_ortho;
if isnull(li_typeform) or li_typeform = 0 then
	if il_traitid > 0 then
		SetPointer(HourGlass!)
		OpenSheetWithParm (w_formulaire_normalise,il_traitid, w_traitements,2, layered!)
	else
		error_type(0)
	end if
else
	OpenSheetWithParm (w_estime, il_patid, w_principal,2, layered!)
end if



end event

event constructor;if v_langue = 'an' then
cb_formulaire.text = "N form"
end if
end event

type cb_suiv from commandbutton within w_traitements
integer x = 567
integer y = 1772
integer width = 466
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Phase suivante"
end type

event clicked;integer li_currentphase, li_demandphase
long ll_traitid, i, ll_idcont
boolean lb_next = true

if changement = 1 then
	sauve()
end if
li_currentphase = tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(tab_dossfin.tabpage_tous.dw_traitements.getrow(),'phase')
do while lb_next
	li_demandphase = li_currentphase + 1
	if li_demandphase > 0 then
		select traitement_id into :ll_traitid from traitements where patient_id = :il_patid and phase = :li_demandphase;
		if isnull(ll_traitid) = false and ll_traitid > 0 then
			il_traitid = ll_traitid
			tab_dossfin.tabpage_tous.dw_traitements.retrieve(il_traitid)
			
			for i = 1 to upperbound(iuo_tabpdossfin)
				ll_idcont = iuo_tabpdossfin[i].dw_traitements.getItemNumber(1,'idcont')
//				ll_idcont = il_idcont[i]
				iuo_tabpdossfin[i].dw_traitements.retrieve(il_traitid,ll_idcont)
			next
			
			lb_next = false
		else
			li_currentphase = li_currentphase + 1
		end if
	else
		lb_next = false
	end if
loop
tabrefresh()
cbrefresh()
checksolde()
end event

event constructor;if v_langue = 'an' then
	this.text = "Next"
end if
end event

type cb_prec from commandbutton within w_traitements
integer x = 5
integer y = 1772
integer width = 562
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Phase précédente"
end type

event clicked;boolean lb_prev = true
integer li_currentphase, li_demandphase
long ll_traitid, i, ll_idcont

if changement = 1 then
	sauve()
end if
li_currentphase = tab_dossfin.tabpage_tous.dw_traitements.getitemnumber(tab_dossfin.tabpage_tous.dw_traitements.getrow(),'phase')
do while lb_prev
	li_demandphase = li_currentphase - 1
	if li_demandphase > 0 then
		select traitement_id into :ll_traitid from traitements where patient_id = :il_patid and phase = :li_demandphase;
		if isnull(ll_traitid) = false and ll_traitid > 0 then
			il_traitid = ll_traitid
			tab_dossfin.tabpage_tous.dw_traitements.retrieve(il_traitid)
			
			for i = 1 to upperbound(iuo_tabpdossfin)
				ll_idcont = iuo_tabpdossfin[i].dw_traitements.getItemNumber(1,'idcont')
	//			ll_idcont = il_idcont[i]
				iuo_tabpdossfin[i].dw_traitements.retrieve(il_traitid,ll_idcont)
			next
			
			lb_prev = false
		else
			li_currentphase = li_currentphase - 1
		end if
	else
		lb_prev = false
	end if
LOOP
tabrefresh()
cbrefresh()
checksolde()
end event

event constructor;if v_langue = 'an' then
	this.text = "Previous"
end if
end event

type tab_sommaires from tab within w_traitements
integer x = 1870
integer y = 12
integer width = 1742
integer height = 1872
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 67108864
boolean focusonbuttondown = true
boolean showpicture = false
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_factures tabpage_factures
tabpage_paiements tabpage_paiements
tabpage_cpd tabpage_cpd
tabpage_pour tabpage_pour
tabpage_charges tabpage_charges
end type

on tab_sommaires.create
this.tabpage_factures=create tabpage_factures
this.tabpage_paiements=create tabpage_paiements
this.tabpage_cpd=create tabpage_cpd
this.tabpage_pour=create tabpage_pour
this.tabpage_charges=create tabpage_charges
this.Control[]={this.tabpage_factures,&
this.tabpage_paiements,&
this.tabpage_cpd,&
this.tabpage_pour,&
this.tabpage_charges}
end on

on tab_sommaires.destroy
destroy(this.tabpage_factures)
destroy(this.tabpage_paiements)
destroy(this.tabpage_cpd)
destroy(this.tabpage_pour)
destroy(this.tabpage_charges)
end on

event clicked;tab_selected = index
end event

event constructor;if v_langue = 'an' then
w_traitements.tab_sommaires.tabpage_factures.text = 'Billing'
w_traitements.tab_sommaires.tabpage_paiements.text = 'Payment'
w_traitements.tab_sommaires.tabpage_cpd.text = 'Postdated'
w_traitements.tab_sommaires.tabpage_pour.text = 'Percentage'
end if
end event

type tabpage_factures from userobject within tab_sommaires
integer x = 18
integer y = 108
integer width = 1705
integer height = 1748
long backcolor = 67108864
string text = "Factures"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_factures_sommaire dw_factures_sommaire
end type

on tabpage_factures.create
this.dw_factures_sommaire=create dw_factures_sommaire
this.Control[]={this.dw_factures_sommaire}
end on

on tabpage_factures.destroy
destroy(this.dw_factures_sommaire)
end on

type dw_factures_sommaire from u_dw within tabpage_factures
integer width = 1664
integer height = 1724
integer taborder = 20
string title = "factures sommaire"
string dataobject = "d_factures_sommaire"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

dw_factures_sommaire.SetTransObject(SQLCA)
dw_factures_sommaire.SetRowFocusIndicator(FocusRect!)
dw_factures_sommaire.Retrieve(il_traitid)

if v_langue = 'an' then
	dw_factures_sommaire.object.montant_t.text = 'Amount'
	dw_factures_sommaire.object.status_id_t.text = 'Status'
end if




end event

event clicked;tab_selected = 1

CHOOSE CASE dwo.name 
	CASE 'date_facture_t'
		setRedraw(false)
		setsort("date_facture A")
		sort()
		setRedraw(true)
	CASE 'montant_t'
		setRedraw(false)
		setsort("montant A")
		sort()
		setRedraw(true)
	CASE 'status_id_t'
		setRedraw(false)
		setsort("status_id A")
		sort()
		setRedraw(true)
	CASE 't_resp'
		setRedraw(false)
		setsort("id_contact A")
		sort()
		setRedraw(true)
END CHOOSE



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

type tabpage_paiements from userobject within tab_sommaires
integer x = 18
integer y = 108
integer width = 1705
integer height = 1748
long backcolor = 67108864
string text = "Paiements"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
string powertiptext = "Paiements"
dw_sommaire_paiement dw_sommaire_paiement
end type

on tabpage_paiements.create
this.dw_sommaire_paiement=create dw_sommaire_paiement
this.Control[]={this.dw_sommaire_paiement}
end on

on tabpage_paiements.destroy
destroy(this.dw_sommaire_paiement)
end on

type dw_sommaire_paiement from u_dw within tabpage_paiements
integer width = 1664
integer height = 1740
integer taborder = 20
string title = "sommaire paiement"
string dataobject = "d_sommaire_paiement"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

dw_sommaire_paiement.SetTransObject(SQLCA)
dw_sommaire_paiement.SetRowFocusIndicator(FocusRect!)

if v_langue = 'an' then
	this.object.t_montant.text = 'Amount'
	this.object.t_receipt.text = 'Receipt'
end if
this.object.paiement.values = gf_method(v_langue)
end event

event clicked;tab_selected = 2

CHOOSE CASE dwo.name 
	CASE 't_date'
		setRedraw(false)
		setsort("date_paiement A")
		sort()
		setRedraw(true)
	CASE 't_montant'
		setRedraw(false)
		setsort("montant_recu A")
		sort()
		setRedraw(true)
	CASE 't_2'
		setRedraw(false)
		setsort("id_contact A")
		sort()
		setRedraw(true)
	CASE 't_receipt'
		setRedraw(false)
		setsort("recu A")
		sort()
		setRedraw(true)
END CHOOSE



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

type tabpage_cpd from userobject within tab_sommaires
integer x = 18
integer y = 108
integer width = 1705
integer height = 1748
long backcolor = 67108864
string pointer = "Arrow!"
string text = "Postdatés"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
string powertiptext = "Chèques postdatés"
dw_cpd_sommaire dw_cpd_sommaire
end type

on tabpage_cpd.create
this.dw_cpd_sommaire=create dw_cpd_sommaire
this.Control[]={this.dw_cpd_sommaire}
end on

on tabpage_cpd.destroy
destroy(this.dw_cpd_sommaire)
end on

type dw_cpd_sommaire from u_dw within tabpage_cpd
integer width = 1696
integer height = 1744
integer taborder = 20
string title = "cpd_sommaire"
string dataobject = "d_cpd_sommaire"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;tab_selected = 3
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

dw_cpd_sommaire.SetTransObject(SQLCA)
dw_cpd_sommaire.SetRowFocusIndicator(FocusRect!)

if v_langue = 'an' then
	this.object.montant_t.text = "Amount"
	this.object.t_2.text = "Rcvd"
	this.object.t_qte.text = "Qty"
end if
this.object.modalite.values = gf_method(v_langue)
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

type tabpage_pour from userobject within tab_sommaires
integer x = 18
integer y = 108
integer width = 1705
integer height = 1748
long backcolor = 67108864
string text = "Pourcentages"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_insertpourc cb_insertpourc
cb_updatepour cb_updatepour
dw_pourcentages dw_pourcentages
end type

on tabpage_pour.create
this.cb_insertpourc=create cb_insertpourc
this.cb_updatepour=create cb_updatepour
this.dw_pourcentages=create dw_pourcentages
this.Control[]={this.cb_insertpourc,&
this.cb_updatepour,&
this.dw_pourcentages}
end on

on tabpage_pour.destroy
destroy(this.cb_insertpourc)
destroy(this.cb_updatepour)
destroy(this.dw_pourcentages)
end on

type cb_insertpourc from commandbutton within tabpage_pour
integer x = 9
integer y = 1632
integer width = 498
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;setuppourcentage()
tabrefresh()
end event

event constructor;if v_langue = 'an' then
	cb_insertpourc.text = "Add"
end if
end event

type cb_updatepour from commandbutton within tabpage_pour
integer x = 507
integer y = 1632
integer width = 1193
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder les pourcentages"
end type

event clicked;if dw_pourcentages.update() = 1 then
	commit using sqlca;
	ii_changpourc = 0
else
	rollback;
end if
end event

event constructor;if v_langue = 'an' then
	this.text = "Save percentages"
end if
end event

type dw_pourcentages from u_dw within tabpage_pour
integer width = 1664
integer height = 1624
integer taborder = 20
string title = "pourcentages"
string dataobject = "d_pourcentages"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

this.SetTransObject(SQLCA)
ii_changpourc = 0

if v_langue = 'an' then
	this.object.annee_t.text = "Year"
	this.object.pourcentage_t.text = "Percentage"	
end if
end event

event editchanged;ii_changpourc = 1
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

event clicked;call super::clicked;if dwo.name = 'p_1' then
	if error_type(240) = 1 then
		deleterow(row)
		ii_changpourc = 1
	end if
end if
end event

type tabpage_charges from userobject within tab_sommaires
integer x = 18
integer y = 108
integer width = 1705
integer height = 1748
long backcolor = 67108864
string text = "Charges"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_recalc cb_recalc
cb_delete cb_delete
cb_insert cb_insert
dw_dossfincharges dw_dossfincharges
end type

on tabpage_charges.create
this.cb_recalc=create cb_recalc
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
this.dw_dossfincharges=create dw_dossfincharges
this.Control[]={this.cb_recalc,&
this.cb_delete,&
this.cb_insert,&
this.dw_dossfincharges}
end on

on tabpage_charges.destroy
destroy(this.cb_recalc)
destroy(this.cb_delete)
destroy(this.cb_insert)
destroy(this.dw_dossfincharges)
end on

type cb_recalc from commandbutton within tabpage_charges
integer x = 571
integer y = 1684
integer width = 567
integer height = 64
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Recalculer"
end type

event clicked;integer li_chrg,li_horstep
long i,ll_traitid
decimal{2} ld_chrgduree,ld_taux,ld_duree,ld_chrgarrdep,ld_chrgasslib
date ldt_rdv

select hor_step into :li_horstep from t_options where ortho_id = :v_no_ortho;
for i = 1 to dw_dossfincharges.rowcount()
	ll_traitid = dw_dossfincharges.getitemnumber(i,'typetraitid')
	select addtocharge into :li_chrg from type_de_traitement where ortho_id = :v_no_ortho and type_traitement_id = :ll_traitid;
	if li_chrg = 1 then
		ldt_rdv = dw_dossfincharges.getitemdate(i,'rdvdate')
		select first chargtaux into :ld_taux from t_charges where ortho_id = :v_no_ortho and chargdate <= :ldt_rdv  order by chargdate desc;
		ld_duree = dw_dossfincharges.getitemnumber(i,'duree')
		ld_chrgduree = ld_duree * li_horstep * ld_taux
		ld_chrgarrdep = (SecondsAfter(dw_dossfincharges.getitemtime(i,'heurearr'),dw_dossfincharges.getitemtime(i,'heuredep')) / 60) * ld_taux
		ld_chrgasslib = (SecondsAfter(dw_dossfincharges.getitemtime(i,'seated'),dw_dossfincharges.getitemtime(i,'released')) / 60) * ld_taux
		dw_dossfincharges.SetItem(i,'chrgduree',ld_chrgduree)
		dw_dossfincharges.SetItem(i,'chrgarrdep',ld_chrgarrdep)
		dw_dossfincharges.SetItem(i,'chrgasslib',ld_chrgasslib)
	else
		dw_dossfincharges.SetItem(i,'chrgduree',0)
		dw_dossfincharges.SetItem(i,'chrgarrdep',0)
		dw_dossfincharges.SetItem(i,'chrgasslib',0)
	end if
next
dw_dossfincharges.setfocus()
end event

type cb_delete from commandbutton within tabpage_charges
integer x = 1138
integer y = 1684
integer width = 567
integer height = 64
integer taborder = 30
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;dw_dossfincharges.event ue_delete()
dw_dossfincharges.event ue_update()
end event

type cb_insert from commandbutton within tabpage_charges
integer y = 1684
integer width = 571
integer height = 64
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;dw_dossfincharges.event ue_insert()
dw_dossfincharges.event ue_update()
end event

type dw_dossfincharges from u_dw within tabpage_charges
event ue_insert ( )
event ue_delete ( )
event ue_update ( )
integer width = 1705
integer height = 1684
integer taborder = 20
string title = "Charges"
string dataobject = "d_dossfincharges"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_insert();long ll_newrow

ll_newrow = insertrow(0)
setitem(ll_newrow,'rdvdate',today())
setitem(ll_newrow,'rdvheure',now())
setitem(ll_newrow,'typetraitid',0)
setitem(ll_newrow,'patient_id',il_patid)
setitem(ll_newrow,'duree',1)
setitem(ll_newrow,'addTocharge',1)
//setitem(ll_newrow,'rdvetat','')
setitem(ll_newrow,'colonne',0)
scrolltorow(ll_newrow)
SetFocus()
end event

event ue_delete();deleterow(getrow())
event ue_update()
end event

event ue_update();if update() = 1 then
	commit using sqlca;
else
	rollback using sqlca;
	error_type(50)
end if
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject(SQLCA)

end event

event itemfocuschanged;event ue_update( )
end event

event losefocus;event ue_update( )
end event

event resize;call super::resize;string ls_y
long ll_temp

ls_y = object.l_1.y2
ls_y = string(long(ls_y) + 10)
Object.DataWindow.header.Height = ls_y
end event

type cb_recuu from commandbutton within w_traitements
integer x = 1806
integer y = 1888
integer width = 448
integer height = 136
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Reçu"
end type

event clicked;long ll_paiementid

if il_traitid > 0 and il_patid > 0 then
	ll_paiementid = tab_sommaires.tabpage_paiements.dw_sommaire_paiement.getitemnumber(tab_sommaires.tabpage_paiements.dw_sommaire_paiement.getrow(),'paiement_id')
	IB_PERIODIC = false
	opensheetwithparm(w_recu,ll_paiementid,w_traitements,2,layered!)
else
	error_type(0)
end if
end event

event constructor;if v_langue = 'an' then
	cb_recuu.text = "U Receipt"
end if
end event

type cb_postdate from commandbutton within w_traitements
integer x = 1353
integer y = 1888
integer width = 448
integer height = 136
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Postdatés"
end type

event clicked;long ll_idcont

if tab_dossfin.selectedtab = 1 then
	select id_contact into :ll_idcont from patient where patient_id = :il_patid;
else
	ll_idcont = il_idcont[tab_dossfin.selectedtab - 1]
end if

w_patient.event ue_cpd(il_traitid,ll_idcont)

end event

event constructor;if v_langue = 'an' then
cb_postdate.text = "Postdated"
end if
end event

type cb_update from commandbutton within w_traitements
integer x = 2706
integer y = 1888
integer width = 448
integer height = 136
integer taborder = 80
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
end event

event constructor;if v_langue = 'an' then
cb_update.text = "Save"
end if
end event

type cb_phase from commandbutton within w_traitements
integer x = 1038
integer y = 1772
integer width = 279
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "+ Phase"
end type

event clicked;long enr, mois, annee, jour, v_jour
integer li_nbphase, numero_phase

if tab_dossfin.tabpage_tous.dw_traitements.getrow() > 0 then
	if error_type(222) = 1 then
		addphase()
	end if
else
	addphase()
end if
end event

event constructor;if v_langue = 'an' then
cb_phase.text = "Add phase"
end if
end event

type cb_paiement from commandbutton within w_traitements
integer x = 905
integer y = 1888
integer width = 448
integer height = 136
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Paiement"
end type

event clicked;long ll_idcont

if tab_dossfin.selectedtab = 1 then
	select id_contact into :ll_idcont from patient where patient_id = :il_patid;
else
	ll_idcont = il_idcont[tab_dossfin.selectedtab - 1]
end if

w_patient.event ue_paiement(il_traitid,ll_idcont)
end event

event constructor;if v_langue = 'an' then
cb_paiement.text = "Payment"
end if
end event

type cb_facture from commandbutton within w_traitements
integer x = 5
integer y = 1888
integer width = 448
integer height = 136
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Facturation"
end type

event clicked;long ll_idcont

if tab_dossfin.selectedtab = 1 then
	select id_contact into :ll_idcont from patient where patient_id = :il_patid;
else
	ll_idcont = il_idcont[tab_dossfin.selectedtab - 1]
end if

w_patient.event ue_facturation(il_traitid,ll_idcont)
end event

event constructor;if v_langue = 'an' then
cb_facture.text = "Billing"
end if
end event

type st_3 from statictext within w_traitements
integer y = 244
integer width = 558
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Date de naissance:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_3.Text = "Date of birth:"
end if
end event

type st_4 from statictext within w_traitements
integer x = 1056
integer y = 244
integer width = 343
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "No dossier:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_4.Text = "File number:"
end if
end event

type sle_date from singlelineedit within w_traitements
integer x = 571
integer y = 244
integer width = 434
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type sle_no_dossier from singlelineedit within w_traitements
integer x = 1403
integer y = 244
integer width = 448
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type st_traitements from statictext within w_traitements
integer width = 1861
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 80269524
string text = "Dossier financier pour le patient"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_traitements.Text = "Financial record of patient:"
end if
end event

type cb_close from commandbutton within w_traitements
integer x = 3163
integer y = 1888
integer width = 448
integer height = 136
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

event clicked;long ll_traitementid
dec{2} montantpaye, montantfacture, montantdu
if ii_changpourc = 1 then
	if error_type(212) = 1 then
		if tab_sommaires.tabpage_pour.dw_pourcentages.update() = 1 then
			commit using sqlca;
		else
			rollback using sqlca;
			error_type(50)
		end if
	end if
	if_close()
else
	if_close()
end if
w_patient.afficher_info()
end event

event constructor;if v_langue = 'an' then
cb_close.text = "Close"
end if
end event

