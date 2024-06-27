$PBExportHeader$w_patient.srw
forward
global type w_patient from w_child
end type
type ole_1 from olecontrol within w_patient
end type
type sle_dob from singlelineedit within w_patient
end type
type sle_id from singlelineedit within w_patient
end type
type sle_ss from singlelineedit within w_patient
end type
type sle_lastname from singlelineedit within w_patient
end type
type sle_firstname from singlelineedit within w_patient
end type
type cbx_sync from checkbox within w_patient
end type
type cb_rech from commandbutton within w_patient
end type
type p_1 from uo_picture within w_patient
end type
type cb_refresh from commandbutton within w_patient
end type
type cb_etirdv from commandbutton within w_patient
end type
type dw_details_patient from u_dw within w_patient
end type
type st_5 from statictext within w_patient
end type
type em_tot_cpd from editmask within w_patient
end type
type sle_nb_cpd from singlelineedit within w_patient
end type
type em_date_prochain_cpd from editmask within w_patient
end type
type sle_day from singlelineedit within w_patient
end type
type sle_username from singlelineedit within w_patient
end type
type cb_delete from commandbutton within w_patient
end type
type cb_insert from commandbutton within w_patient
end type
type sle_1 from singlelineedit within w_patient
end type
type cb_traitements from commandbutton within w_patient
end type
type cb_rapport_paiement from commandbutton within w_patient
end type
type cb_rendez_vous from commandbutton within w_patient
end type
type cb_xray from commandbutton within w_patient
end type
type st_3 from statictext within w_patient
end type
type st_4 from statictext within w_patient
end type
type dw_patient_master from u_dw within w_patient
end type
type dw_dernier_paiement from u_dw within w_patient
end type
type lb_1 from uo_vistlistbox within w_patient
end type
type p_size from picture within w_patient
end type
type dw_detailsrdv from u_dw within w_patient
end type
type dw_resume_traitements from u_dw within w_patient
end type
end forward

global type w_patient from w_child
integer width = 3648
integer height = 2044
boolean enabled = false
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
event ue_post_open ( )
event ue_dossfin ( long al_patid )
event ue_facturation ( long al_idtrait,  long al_idcont )
event ue_paiement ( long al_idtrait,  long al_idcont )
event ue_cpd ( long al_idtrait,  long al_idcont )
ole_1 ole_1
sle_dob sle_dob
sle_id sle_id
sle_ss sle_ss
sle_lastname sle_lastname
sle_firstname sle_firstname
cbx_sync cbx_sync
cb_rech cb_rech
p_1 p_1
cb_refresh cb_refresh
cb_etirdv cb_etirdv
dw_details_patient dw_details_patient
st_5 st_5
em_tot_cpd em_tot_cpd
sle_nb_cpd sle_nb_cpd
em_date_prochain_cpd em_date_prochain_cpd
sle_day sle_day
sle_username sle_username
cb_delete cb_delete
cb_insert cb_insert
sle_1 sle_1
cb_traitements cb_traitements
cb_rapport_paiement cb_rapport_paiement
cb_rendez_vous cb_rendez_vous
cb_xray cb_xray
st_3 st_3
st_4 st_4
dw_patient_master dw_patient_master
dw_dernier_paiement dw_dernier_paiement
lb_1 lb_1
p_size p_size
dw_detailsrdv dw_detailsrdv
dw_resume_traitements dw_resume_traitements
end type
global w_patient w_patient

type variables
private integer charger = 0
public char vi_langage // Variable qui permet de conserver la langue du patient actuellement sélectionné
public long il_patid
datastore ids_masterrefresh
string 	is_typeetiq
end variables

forward prototypes
public subroutine date_rappel_rv ()
public subroutine date_time ()
public subroutine cbrefresh ()
public subroutine verif_entente ()
public subroutine security ()
public subroutine recherche ()
public subroutine afficher_info ()
public subroutine uf_backcolor ()
public subroutine uf_montantdupos ()
public subroutine uf_insertpicture ()
public subroutine creerresp ()
public subroutine of_appdroits (menu am_menu, string as_nom)
public subroutine of_detailrdv ()
end prototypes

event ue_post_open();integer li_recuauto,li_openhor, li_cnt
string ls_title, ls_cie

// couleur de fond personnalise
uf_backcolor()

select prenom + ' ' + nom into :gs_user from t_personnels where id_personnel = :gl_idpers;
if v_langue = 'an' then
	sle_username.text = 'Welcome ' + gs_user
else
	sle_username.text = 'Bienvenue ' + gs_user
end if
date_time()

// initialisation de la datastore pour la synchronisation
ids_masterrefresh = create datastore
ids_masterrefresh.dataobject = 'd_masterrefresh'
ids_masterrefresh.SetTransObject(SQLCA)
dw_patient_master.event retourner()

// Messagebox si erreur de mise à jour
if not ib_updateok then
	error_type(61)
end if

// afficher le 1er patient
dw_patient_master.event rowfocuschanged(1)

// option a l'ouverture de la fenetre
select recuauto,openhor, modrdv into :li_recuauto,:li_openhor, :is_typeetiq from t_options where ortho_id = :v_no_ortho;
if li_recuauto = 1 then
	w_principal.SetMicroHelp('Reçus automatiques')
	if error_type(204) = 1 then
		open(w_recuautodate)
	end if
end if

if v_langue = 'an' then
	IF is_typeetiq <> "C" and is_typeetiq <> "A" THEN
		cb_etirdv.Text = "Appointment label"
	ELSE
		cb_etirdv.Text = "Appointment card"
	END IF
ELSE
	IF is_typeetiq <> "C" and is_typeetiq <> "A" THEN
		cb_etirdv.Text = "Étiquette rdv"
	ELSE
		cb_etirdv.Text = "Carte de rendez-vous"
	END IF
end if

if li_openhor = 1 then
	opensheetwithparm(w_horaire,string(today()),w_principal,2,layered!)
	w_principal.SetMicroHelp('Grille horaire')
	w_horaire.title = "Horaire des rendez-vous"
end if
select dr_nom_complet, nomcie into :ls_title, :ls_cie from ortho_id where ortho_id = :v_no_ortho;

if not isNull(ls_cie) then
	if ls_cie <> "" then	ls_title = ls_cie
end if

w_principal.title = 'ORTHOTEK - ' + ls_title
w_principal.SetMicroHelp('Application prête pour ' + gs_user + '  avec  ' + string(dw_patient_master.rowcount()) + ' patients')

select count(*)
  into :li_cnt
  from t_persdroits
 where (id_personnel = :gl_idpers
		 or id_personnel in (select id_group
									  from t_groupeusagers
									 where id_user = :gl_idpers))
	and objet = 'm_principal.m_config.m_autoupdate';

if gb_updtsoftware and li_cnt > 0 then
	if v_langue = 'an' then
		m_principal.m_config.m_autoupdate.toolbaritemtext = "Version " + gnv_app.is_versiondispo + " now available !"
	else
		m_principal.m_config.m_autoupdate.toolbaritemtext = "Version " + gnv_app.is_versiondispo + " maintenant disponible !"
	end if
	m_principal.m_config.m_autoupdate.toolbaritemvisible = true
	//Timer(0.5)
end if

Timer(1)


end event

event ue_dossfin(long al_patid);string ls_nom,ls_prenom

if isvalid(w_traitements) = true then
	if error_type(214) = 1 then
		Opensheet(w_traitements,w_principal,2,layered!)
		w_traitements.setfocus()
	else
		w_traitements.if_close()
		select patient_nom, patient_prenom into :ls_nom, :ls_prenom from patient where patient_id = :al_patid;
		Opensheetwithparm(w_traitements,al_patid,w_principal,2,layered!)
		w_traitements.setfocus()
	end if
else
	select patient_nom, patient_prenom into :ls_nom, :ls_prenom from patient where patient_id = :al_patid;
	Opensheetwithparm(w_traitements,al_patid,w_principal,2,layered!)
	w_traitements.setfocus()
end if
end event

event ue_facturation(long al_idtrait, long al_idcont);if al_idtrait > 0 then
	if isvalid(w_factures_traitement) = true then
		if error_type(215) = 1 then
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactfacturation", al_idcont)
			Opensheet(w_factures_traitement,w_principal,2,layered!)
		else
			w_factures_traitement.if_close()
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactfacturation", al_idcont)
			opensheetwithparm(w_factures_traitement,al_idtrait,w_principal,2,layered!)
//			w_factures_traitement.title = 'Facturations (' + sle_pat.text + ')'
		end if
	else
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactfacturation", al_idcont)
		opensheetwithparm(w_factures_traitement,al_idtrait,w_principal,2,layered!)
//		w_factures_traitement.title = 'Facturations (' + sle_pat.text + ')'
	end if
else
	error_type(0)
end if
end event

event ue_paiement(long al_idtrait, long al_idcont);long ll_count

if al_idtrait > 0 then
	select count(*) into :ll_count from t_contact where patient_id = :il_patid;
	if ll_count <= 0 then
		creerResp()
	end if
	if isvalid(w_paiement) = true then
		if error_type(215) = 1 then
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactpaiement", al_idcont)
			Opensheet(w_paiement,w_principal,2,layered!)
		else
			w_factures_traitement.if_close()
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactpaiement", al_idcont)
			opensheetwithparm(w_paiement,al_idtrait,w_principal,2,layered!)
			w_paiement.title = 'Paiement'
		end if
		w_paiement.SetFocus()
	else
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactpaiement", al_idcont)
		opensheetwithparm(w_paiement,al_idtrait,w_principal,2,layered!)
		w_paiement.title = 'Paiement'
		w_paiement.SetFocus()
	end if
else
	error_type(0)
end if
end event

event ue_cpd(long al_idtrait, long al_idcont);if al_idtrait > 0 then
	if isvalid(w_cpd) = true then
		if error_type(217) = 1 then
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactcpd", al_idcont)
			opensheet(w_cpd, w_patient,2,layered!)
		else
			w_cpd.if_close()
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactcpd", al_idcont)
			opensheetwithparm(w_cpd,al_idtrait,w_patient,2,layered!)
			w_cpd.title = 'Chèques postdatés'
		end if
	else
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("contactcpd", al_idcont)
		opensheetwithparm(w_cpd,al_idtrait,w_patient,2,layered!)
		w_cpd.title = 'Chèques postdatés'
	end if
else
	error_type(0)
end if
end event

public subroutine date_rappel_rv ();// Declaration de variables
//date v_date_rv = date("09/09/9999") , v_date_rappel = date("09/09/9999")
//time v_heure_rv = time("00:00")
//SELECT "rendezvous"."prochain_rv" into :v_date_rappel
//   FROM "rendezvous"  
//   WHERE ( "rendezvous"."prochain_rv" > date(string(today()))) AND  
//         ( "rendezvous"."patient_id" = :numero_patient )   
//   ORDER BY "rendezvous"."prochain_rv" ASC ; 
//update patient set prochain_rappel = :v_date_rappel where patient_id = :numero_patient;
//commit;
//SELECT "horaire"."datecal",   
//         "horaire"."heure"  
//	 into :v_date_rv,:v_heure_rv
//    FROM "horaire"  
//    WHERE (("horaire"."patient_id_1" = :numero_patient OR  
//          "horaire"."patient_id_2" = :numero_patient OR  
//          "horaire"."patient_id_3" = :numero_patient OR  
//          "horaire"."patient_id_4" = :numero_patient) AND  
//         ( "horaire"."datecal" > date(string(today()))))   
//    ORDER BY "horaire"."datecal" ASC,
//			    "horaire"."heure" ASC;   
//update patient set rendez_vous = :v_date_rv, heure_du_rendez_vous = :v_heure_rv where patient_id = :numero_patient;
//commit;
end subroutine

public subroutine date_time ();string n,j,m,a
if v_langue = 'fr' then
	choose case DayName(today())
		case "Monday"
			n = "Lundi"
		case "Tuesday"
			n = "Mardi"
		case "Wednesday"
			n = "Mercredi"
		case "Thursday"
			n = "Jeudi"
		case "Friday"
			n = "Vendredi"
		case "Saturday"
			n = "Samedi"
		case "Sunday"
			n = "Dimanche"
	end choose
	
	j = string(Day(today()))
	
	choose case string(Month(today()))
	case "1"
		m = "janvier"
	case "2"
		m = "février"
	case "3"
		m = "mars"
	case "4"
		m = "avril"
	case "5"
		m = "mai"
	case "6"
		m = "juin"
	case "7"
		m = "juillet"
	case "8"
		m = "août"
	case "9"
		m = "septembre"
	case "10"
		m = "octobre"
	case "11"
		m = "novembre"
	case "12"
		m = "décembre"
	end choose
	a = string(year(today()))
	sle_day.text = n+", "+j+" "+m+" "+a
	
else
	sle_day.text = datean(today())
end if
end subroutine

public subroutine cbrefresh ();int nb_trait_actif


if dw_patient_master.rowcount() > 0 then
	cb_delete.enabled = true
	cb_rendez_vous.enabled = true
	cb_xray.enabled = true
	cb_traitements.enabled = true
	SELECT count(*) into :nb_trait_actif from traitements where patient_id = :il_patid;
	if nb_trait_actif > 0 then
		cb_rapport_paiement.enabled = true
	else
		cb_rapport_paiement.enabled = false
	end if
	if dw_detailsrdv.rowcount() > 0 then
		cb_etirdv.enabled = true
	else
		cb_etirdv.enabled = false
	end if
else
	cb_delete.enabled = false
	cb_rendez_vous.enabled = false
	cb_xray.enabled = false
	cb_traitements.enabled = false
	cb_rapport_paiement.enabled = false
	cb_etirdv.enabled = false
end if

end subroutine

public subroutine verif_entente ();//long enr,traitement
//dec{2} fact, eval, meb, total_trait
//// Verification OPTIONS: mes_facture
//int v_option
//select mes_facture into :v_option from t_options where ortho_id = :v_no_ortho;
//if v_option = 1 then
//	enr = dw_resume_traitements.getrow()
//	if enr > 0 then
//		traitement = dw_resume_traitements.getitemnumber(enr,"traitement_id")
//		Select sum(montant) into :fact from factures_traitements where traitement_id = :traitement;
//		if isnull(fact) = true then
//			fact = 0
//		end if
//		total_trait =  dw_resume_traitements.getitemnumber(enr,"montant_original")
//		if total_trait = fact then
//		else
//			messagebox("Avertissement!","Le montant de l'enrente n'est pas égal au montant du traitement",Information!)
//		end if
//	end if
//end if
end subroutine

public subroutine security ();
end subroutine

public subroutine recherche ();//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 29/10/2003
// Demande  : Cadotte
// Version  : 7.6.1
// Modifié par: 
//	Modifié le : 
//////////////////////////////////
integer v_nb
string ls_dnom, ls_nom
dec ld_tel
long no_row

//pour regler le bug des apostrophes
ls_dnom = Trim(sle_1.text)+'%'
ls_nom = Trim(sle_1.text)
if Match(ls_dnom, "'") = true then
	v_nb = Pos (ls_dnom, "'")
	if v_nb > 0 then
		ls_dnom = Replace ( ls_dnom, v_nb, 1, "%" )
	end if
end if

dw_patient_master.setFilter('')

dw_patient_master.event ue_actualiser()


//if cbx_telgroup.checked then
//	ld_tel = dec(sle_1.text)
//	dw_patient_master.setfilter("tel_maison like '" + string(ld_tel)+"'")
//	dw_patient_master.filter()
//else
	if isnumber(left(ls_dnom,1)) then
		no_row = dw_patient_master.Find("new_dossier = '" + ls_nom + "'",0,dw_patient_master.rowcount())
		dw_patient_master.scrolltorow(no_row)
		dw_patient_master.setfocus()
	else
		no_row = dw_patient_master.Find("upper(nom) like '" +upper(ls_dnom)+"'",0,dw_patient_master.rowcount())
		dw_patient_master.scrolltorow(no_row)
		dw_patient_master.setfocus()	
	end if
//end if
end subroutine

public subroutine afficher_info ();int v_option,fh, ret, li_nocpd, li_option, li_liste_trait_par_spec
string v_check_cpd, v_status, txtname,ls_patnom,ls_patprenom,ls_dob, ls_typeimg
long id, enr, enr_master, v_status_id, v_nb_cpd, v_traitement_id
long ll_rdvtoday, li_dolphin, ll_horidspec
decimal{2} v_last, v_tot_cpd, ld_montantdu
date v_prochain_cpd, v_date_last
blob Emp_pic

select isnull(typeimgutil,'o') into :ls_typeimg from t_options where ortho_id = :v_no_ortho;

enr_master = dw_patient_master.getrow()
if enr_master = 0 then
	if dw_patient_master.rowcount() > 0 then
		enr_master = 1
	else
		enr_master = -5
	end if
end if

//p_patient.visible = false
if enr_master > 0 then
	vi_langage = dw_patient_master.getitemstring(enr_master,"langue")
	numero_patient = dw_patient_master.getitemnumber(enr_master,"patient_id")
	il_patid = dw_patient_master.getitemnumber(enr_master,"patient_id")
	// date_rappel_rv()
	
   dw_details_patient.event retourner(il_patid)

	dw_resume_traitements.event retourner(il_patid)
	// dw_resume_traitements.retrieve(numero_patient)
	enr = dw_resume_traitements.getrow()
//	 Vérifie si il y a des traitements
	if enr > 0 then
		id = dw_resume_traitements.getitemnumber(enr,"traitement_id")
		uf_montantdupos()
		// prochain cpd
		SELECT min(date_cheque) into :v_prochain_cpd from cheques_postdates where traitement_patient_id = :id and indicateur <> 1;
		if isnull(v_prochain_cpd) = true or v_prochain_cpd = date("01-01-1900") then
			em_date_prochain_cpd.text = string(v_prochain_cpd)
			em_date_prochain_cpd.visible = false
			sle_nb_cpd.visible = false
			em_tot_cpd.visible = false
			// message si pas de prochain cpd
			select mes_cpd,mes_facture into :v_option,:li_nocpd from t_options where ortho_id = :v_no_ortho;
			if v_option = 1 then
				ld_montantdu = dw_resume_traitements.getitemnumber(dw_resume_traitements.getrow(),"montant_du")
				if ld_montantdu > 0 then
					dw_patient_master.Object.nom.Color = " 16777215 ~t If ( currentrow()=getrow() ,rgb(255,0,0),rgb(0,0,0) ) "
				else
					dw_patient_master.Object.nom.Color = " 16777215 ~t If ( currentrow()=getrow() ,rgb(0,0,155),rgb(0,0,0) ) "
				end if
			end if
			if li_nocpd = 1 then
				ld_montantdu = dw_resume_traitements.getitemnumber(dw_resume_traitements.getrow(),"montant_restant")
				if ld_montantdu > 0 then
					error_type(118)
				end if
			end if
		else
			em_date_prochain_cpd.text = string(v_prochain_cpd)
			em_date_prochain_cpd.visible = true
			// quantite cpd
			select count(*), sum(paiement) into :v_nb_cpd, :v_tot_cpd from cheques_postdates where traitement_patient_id = :id and indicateur <> '1';
			if isnull(v_nb_cpd) = true or v_nb_cpd = 0 then
				v_nb_cpd = 0
			else
				sle_nb_cpd.visible = true
			end if
			sle_nb_cpd.text = string(v_nb_cpd)
			// total cpd
			if isnull(v_tot_cpd) = true then
				v_tot_cpd = 0 
			else
				em_tot_cpd.visible = true
			end if
			em_tot_cpd.text = string(v_tot_cpd)
		end if
		// Vérifie si il y a un dernier paiement 
		dw_dernier_paiement.event retourner(id)
	else
		// Pas de traitements
		dw_patient_master.Object.nom.Color = " 16777215 ~t If ( currentrow()=getrow() ,rgb(0,0,155),rgb(0,0,0) ) "
		em_date_prochain_cpd.visible = false
		sle_nb_cpd.visible = false
		em_tot_cpd.visible = false
		dw_dernier_paiement.reset()
	end if 
	
	of_detailrdv()
	
	if ls_typeimg <> 'd' then
		uf_insertpicture()	
	end if
else
	if enr_master <> -5 then
		error_type(58)
	end if
end if 

//cliniview
select patient_nom,patient_prenom,date_naissance into :ls_patnom,:ls_patprenom,:ls_dob from patient where patient_id = :il_patid;
sle_firstname.text = ls_patprenom
sle_lastname.text = ls_patnom
sle_ss.text = ''
sle_id.text = string(il_patid)
sle_dob.text  = ls_dob

w_principal.SetMicroHelp('Principal (' + string(il_patid) + ')')
end subroutine

public subroutine uf_backcolor ();long ll_color

select color into :ll_color from t_color where wbackcolor1 = 1 and ortho_id = :v_no_ortho;
if isnull(ll_color) = false and ll_color <> 0 then
//	dw_details_patient.Object.DataWindow.Color = rgb(246,246,225)
//	st_6.backcolor = rgb(246,246,225)
//	cbx_telgroup.backcolor = ll_color
	sle_username.backcolor = ll_color
	sle_day.backcolor = ll_color
	dw_patient_master.object.datawindow.color = ll_color
	dw_detailsrdv.object.datawindow.color = ll_color
	dw_resume_traitements.object.datawindow.color = ll_color
	dw_dernier_paiement.object.datawindow.color = ll_color
	st_3.backcolor = ll_color
	st_4.backcolor = ll_color
	st_5.backcolor = ll_color
//	st_product.backcolor = ll_color
	backcolor = ll_color
end if
end subroutine

public subroutine uf_montantdupos ();integer li_option
decimal{2} ld_montantdu
// montant du > 0
select entente into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	ld_montantdu = dw_resume_traitements.getitemnumber(dw_resume_traitements.getrow(),"montant_du")
	if ld_montantdu > 0 then
		dw_patient_master.Object.nom.Color = " 16777215 ~t If ( currentrow()=getrow() ,rgb(255,0,255),rgb(0,0,0) ) "
	end if
end if
end subroutine

public subroutine uf_insertpicture ();int job,result,li_vistadent, li_seq
integer li_photo
string ls_imgtype,ls_imgfolder
ulong lul_width, lul_height, picwidth, picheight
dec {5} var = 1
blob b
string ls_nodos,ls_path,ls_fs,ls_f,ls_lat,ls_ro,ls_anto,ls_lo,ls_upo,ls_lowo
date ldt_montage
OLEObject myImage

select photo,imgfolder,chemphoto into :li_photo,:ls_imgtype,:ls_path from t_options where ortho_id = :v_no_ortho;
choose case ls_imgtype
	case 'p'
		ls_imgfolder = string(il_patid)
	case 'd'
		select new_dossier into :ls_imgfolder from patient where patient_id = :il_patid;
	case 'v'
		select idvistadent into :ls_imgfolder from patient where patient_id = :il_patid;
end choose 

if li_photo = 1 then
	// compatibilité vistadent
	if ls_imgtype = 'v' then
		ls_path = ls_path + '\' + ls_imgfolder + '\'
		if not fileexists(ls_path + "dosspat.jpg") then
			filecopy(ls_path + "1002Frontal Smile-Initial.JPE", ls_path + "dosspat.jpg")
		end if
		ls_path += "dosspat.jpg"
	else
	// indique l'emplacement du frontal smile le plus recent
		select first front_smile, sequence
		into :ls_fs, :li_seq
		from t_imagerie 
		where patient_id = :il_patid and LENGTH(front_smile) > 0
		order by datemont desc;
		ls_path = ls_path + '\' + ls_imgfolder + '\' + string(li_seq) + '\small\' + ls_fs
	end if
	//	messagebox('ls_path',ls_path)
	// affiche le frontal smile
	if FileExists(ls_path) then
		p_size.PictureName = ls_path
		p_size.OriginalSize = True
//		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
//		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
		lul_width = p_size.Width
		lul_height = p_size.Height
		if lul_width > 600 then
			var = lul_width / 600
		end if
		if lul_height / var > 550 then
			var = lul_height / 550
		end if
		picwidth = lul_width / var
		picheight = lul_height / var
		
		p_1.width = picwidth
		p_1.height = picheight
		p_1.PictureName = ls_path
		p_1.visible = true
		dw_details_patient.object.p_1.visible = false
	else
		p_1.visible = false
		dw_details_patient.object.p_1.visible = true
	end if
end if
end subroutine

public subroutine creerresp ();string v_nom, v_prenom, v_tel, ls_patadd, ls_patcity, ls_patzip
string ls_telbur, ls_prov, ls_email, ls_sex, ls_langue, ls_telcell
string ls_telautre

select patient_nom, patient_prenom, tel_maison, adresse, ville, code_postale,
tel_bureau, province, email, sex, langue, telcell, telautre
into :v_nom, :v_prenom, :v_tel, :ls_patadd, :ls_patcity, :ls_patzip,
:ls_telbur, :ls_prov, :ls_email, :ls_sex, :ls_langue, :ls_telcell, :ls_telautre
from patient where patient_id = :il_patid;

insert into t_contact(ortho_id,patient_id,nom,prenom,adresse,ville,zip,telres,telbur,province,email,sex,langue,pat,telcell,telautre)
values(:v_no_ortho,:il_patid,:v_nom,:v_prenom,:ls_patadd,:ls_patcity,:ls_patzip,:v_tel,:ls_telbur,:ls_prov,:ls_email,:ls_sex,:ls_langue,1,:ls_telcell,:ls_telautre);
if error_type(-1) = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

end subroutine

public subroutine of_appdroits (menu am_menu, string as_nom);long ll_cnt, ll_idx
string ls_name
n_cst_string lnv_str

SetPointer ( HourGlass! )

if not isValid(am_menu) then return

if am_menu.tag = "invisible" then return

// get the class it self
ls_name = lower(classname(am_menu))
ls_name = as_nom + ls_name

select count(*)
  into :ll_cnt
  from t_persdroits
 where (id_personnel = :gl_idpers
		 or id_personnel in (select id_group
									  from t_groupeusagers
									 where id_user = :gl_idpers))
	and objet = :ls_name;

if ll_cnt > 0 or lnv_str.of_isFormat(am_menu.text) or am_menu.text = "" then
	am_menu.enabled = true
	am_menu.visible = true
else
	am_menu.enabled = false
	am_menu.visible = false
	am_menu.toolBarItemVisible = false
end if

// see how many objects to be scaned
ll_cnt = UpperBound(am_menu.Item)
// get the controls on the object
For ll_idx = 1 To ll_cnt
	of_appDroits(am_menu.Item[ll_idx], ls_name + ".")
Next

end subroutine

public subroutine of_detailrdv ();long ll_rdvtoday, ll_horidspec, li_liste_trait_par_spec

//detailsrdv
select rdvtoday into :ll_rdvtoday from t_options where ortho_id = :v_no_ortho;
if ll_rdvtoday = 1 then
	dw_detailsrdv.setFilter("daysafter(rdvdate,today()) <= 0")
else
	dw_detailsrdv.setFilter("daysafter(rdvdate,today()) < 0")
end if


select horshareid,liste_trait_par_spec into :ll_horidspec,:li_liste_trait_par_spec from t_options where ortho_id = :v_no_ortho;
if li_liste_trait_par_spec = 1 then
	dw_detailsrdv.retrieve(il_patid,ll_horidspec,v_langue,v_no_ortho)
else
	if isnull(ll_horidspec) then ll_horidspec = v_no_ortho
	dw_detailsrdv.retrieve(il_patid,ll_horidspec,v_langue,ll_horidspec)
end if
end subroutine

on w_patient.create
int iCurrent
call super::create
this.ole_1=create ole_1
this.sle_dob=create sle_dob
this.sle_id=create sle_id
this.sle_ss=create sle_ss
this.sle_lastname=create sle_lastname
this.sle_firstname=create sle_firstname
this.cbx_sync=create cbx_sync
this.cb_rech=create cb_rech
this.p_1=create p_1
this.cb_refresh=create cb_refresh
this.cb_etirdv=create cb_etirdv
this.dw_details_patient=create dw_details_patient
this.st_5=create st_5
this.em_tot_cpd=create em_tot_cpd
this.sle_nb_cpd=create sle_nb_cpd
this.em_date_prochain_cpd=create em_date_prochain_cpd
this.sle_day=create sle_day
this.sle_username=create sle_username
this.cb_delete=create cb_delete
this.cb_insert=create cb_insert
this.sle_1=create sle_1
this.cb_traitements=create cb_traitements
this.cb_rapport_paiement=create cb_rapport_paiement
this.cb_rendez_vous=create cb_rendez_vous
this.cb_xray=create cb_xray
this.st_3=create st_3
this.st_4=create st_4
this.dw_patient_master=create dw_patient_master
this.dw_dernier_paiement=create dw_dernier_paiement
this.lb_1=create lb_1
this.p_size=create p_size
this.dw_detailsrdv=create dw_detailsrdv
this.dw_resume_traitements=create dw_resume_traitements
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_1
this.Control[iCurrent+2]=this.sle_dob
this.Control[iCurrent+3]=this.sle_id
this.Control[iCurrent+4]=this.sle_ss
this.Control[iCurrent+5]=this.sle_lastname
this.Control[iCurrent+6]=this.sle_firstname
this.Control[iCurrent+7]=this.cbx_sync
this.Control[iCurrent+8]=this.cb_rech
this.Control[iCurrent+9]=this.p_1
this.Control[iCurrent+10]=this.cb_refresh
this.Control[iCurrent+11]=this.cb_etirdv
this.Control[iCurrent+12]=this.dw_details_patient
this.Control[iCurrent+13]=this.st_5
this.Control[iCurrent+14]=this.em_tot_cpd
this.Control[iCurrent+15]=this.sle_nb_cpd
this.Control[iCurrent+16]=this.em_date_prochain_cpd
this.Control[iCurrent+17]=this.sle_day
this.Control[iCurrent+18]=this.sle_username
this.Control[iCurrent+19]=this.cb_delete
this.Control[iCurrent+20]=this.cb_insert
this.Control[iCurrent+21]=this.sle_1
this.Control[iCurrent+22]=this.cb_traitements
this.Control[iCurrent+23]=this.cb_rapport_paiement
this.Control[iCurrent+24]=this.cb_rendez_vous
this.Control[iCurrent+25]=this.cb_xray
this.Control[iCurrent+26]=this.st_3
this.Control[iCurrent+27]=this.st_4
this.Control[iCurrent+28]=this.dw_patient_master
this.Control[iCurrent+29]=this.dw_dernier_paiement
this.Control[iCurrent+30]=this.lb_1
this.Control[iCurrent+31]=this.p_size
this.Control[iCurrent+32]=this.dw_detailsrdv
this.Control[iCurrent+33]=this.dw_resume_traitements
end on

on w_patient.destroy
call super::destroy
destroy(this.ole_1)
destroy(this.sle_dob)
destroy(this.sle_id)
destroy(this.sle_ss)
destroy(this.sle_lastname)
destroy(this.sle_firstname)
destroy(this.cbx_sync)
destroy(this.cb_rech)
destroy(this.p_1)
destroy(this.cb_refresh)
destroy(this.cb_etirdv)
destroy(this.dw_details_patient)
destroy(this.st_5)
destroy(this.em_tot_cpd)
destroy(this.sle_nb_cpd)
destroy(this.em_date_prochain_cpd)
destroy(this.sle_day)
destroy(this.sle_username)
destroy(this.cb_delete)
destroy(this.cb_insert)
destroy(this.sle_1)
destroy(this.cb_traitements)
destroy(this.cb_rapport_paiement)
destroy(this.cb_rendez_vous)
destroy(this.cb_xray)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.dw_patient_master)
destroy(this.dw_dernier_paiement)
destroy(this.lb_1)
destroy(this.p_size)
destroy(this.dw_detailsrdv)
destroy(this.dw_resume_traitements)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

w_patient.postevent('ue_post_open')

end event

event close;destroy ids_masterrefresh

end event

event timer;string ls_nommsg, ls_computername
long ll_countmessage, ll_newmsg

//if cbx_sync.checked then
//	dw_patient_master.event ue_actualiser()
//end if
if gb_updtsoftware then m_principal.m_config.m_autoupdate.checked = not m_principal.m_config.m_autoupdate.checked

ls_nommsg = gnv_app.inv_messagerie.of_getnomuser()
ls_computername = gnv_app.of_obtenir_nom_ordinateur( )
ll_newmsg = gnv_app.inv_messagerie.of_getnbnouveaumsg()

//La nouvelle partie des messages
//2008-08-01 - Fonctionner avec statut_affiche
//select count(id_message) into :ll_countmessage from t_message 
//where ( t_message.message_a like :ls_nommsg ) AND  (t_message.statut <> 'd' ) 
//		AND t_message.source = 'i' AND t_message.statut_lu = 'n' ;
select count(id_message) into :ll_countmessage from t_message 
where ( t_message.message_a like :ls_nommsg or t_message.message_a = :ls_computername) AND  (t_message.statut <> 'd' ) 
		AND t_message.source = 'i' AND t_message.statut_affiche = 'n' ;
		
IF ll_countmessage > 0 THEN		
//IF ll_newmsg < ll_countmessage THEN
	//Il y a plus de nouveaux messages qu'avant
	
	//m_appframe.m_util.m_avis.checked = not m_appframe.m_util.m_avis.checked
	
	//Ouvrir le popup 
	Open(w_popup_message)
	
END IF

gnv_app.inv_messagerie.of_setnbnouveaumsg(ll_countmessage)
end event

type ole_1 from olecontrol within w_patient
event click ( )
integer x = 1792
integer y = 16
integer width = 439
integer height = 428
boolean border = false
boolean focusrectangle = false
string binarykey = "w_patient.win"
omdisplaytype displaytype = displayascontent!
omcontentsallowed contentsallowed = containsany!
end type

event constructor;integer li_dolphin, li_test

select isnull(dolphinpic,0) into :li_dolphin from t_options where ortho_id = :v_no_ortho;

if li_dolphin = 1 then
	ole_1.visible = true
	p_1.visible = false
	li_test = ole_1.activate(inplace!)
//	w_principal.menuID.show()
else
	ole_1.visible = false
	p_1.visible = true
end if
end event

event losefocus;//messagebox("", "ole_1 lose focus")
end event

type sle_dob from singlelineedit within w_patient
boolean visible = false
integer y = 272
integer width = 315
integer height = 64
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_id from singlelineedit within w_patient
boolean visible = false
integer y = 204
integer width = 315
integer height = 64
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_ss from singlelineedit within w_patient
boolean visible = false
integer y = 136
integer width = 315
integer height = 64
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_lastname from singlelineedit within w_patient
boolean visible = false
integer y = 68
integer width = 315
integer height = 64
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_firstname from singlelineedit within w_patient
boolean visible = false
integer width = 315
integer height = 64
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cbx_sync from checkbox within w_patient
boolean visible = false
integer x = 3410
integer width = 219
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 79741120
boolean enabled = false
string text = "Sync"
boolean automatic = false
end type

event clicked;//timer(5)
end event

event constructor;//integer li_sync
//
//select wsync into :li_sync from t_options where ortho_id = :v_no_ortho;
//
//if li_sync = 1 then
//	cbx_sync.checked = true
//	timer(5)
//end if
end event

type cb_rech from commandbutton within w_patient
integer x = 3241
integer y = 196
integer width = 366
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Recherche"
end type

event clicked;open(w_rechpat)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Search'
end if
end event

type p_1 from uo_picture within w_patient
boolean visible = false
integer x = 1792
integer y = 16
integer width = 439
integer height = 428
end type

event clicked;call super::clicked;string ls_nodos,ls_path,ls_fs,ls_f,ls_lat,ls_ro,ls_anto,ls_lo,ls_upo,ls_lowo

select chemphoto into :ls_path from t_options where ortho_id = :v_no_ortho;
select new_dossier into :ls_nodos from patient where patient_id = :il_patid;
select front_smile into :ls_fs from t_imaging where patient_id = :il_patid and type = 1;
ls_path = ls_path + '\' + ls_nodos + '\1\'
if isnull(ls_fs) = false then
	p_1.event ue_insertpicture(ls_path + ls_fs)
end if
end event

type cb_refresh from commandbutton within w_patient
integer x = 1824
integer y = 1844
integer width = 576
integer height = 192
integer taborder = 130
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Actualiser"
end type

event clicked;//timer(1)
dw_patient_master.event ue_actualiser()

end event

event constructor;if v_langue = 'an' then
	this.Text = "Update list"
end if
end event

type cb_etirdv from commandbutton within w_patient
integer x = 544
integer y = 1844
integer width = 635
integer height = 96
integer taborder = 140
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

event clicked;string 	ls_langue, ls_jour, ls_logo
long		ll_retour

datastore ds_etiquetterdv
ds_etiquetterdv = create datastore
if is_typeetiq = 'M' then
	gi_imp = 2
	ds_etiquetterdv.dataobject = "d_etiquetterdv2"
elseif is_typeetiq = "S" THEN
	gi_imp = 2
	ds_etiquetterdv.dataobject = "d_etiquetterdv"
elseif is_typeetiq = "B" THEN
	gi_imp = 2
	ds_etiquetterdv.dataobject = "d_etiquetterdv3"
ELSE
	
	gi_imp = 1
	
	if is_typeetiq = 'A' then
		ds_etiquetterdv.dataobject = "d_carterdv2"
		ds_etiquetterdv.Modify("DataWindow.Print.Paper.Size=255")
		ds_etiquetterdv.Modify("DataWindow.Print.CustomPage.Length=5500")
		ds_etiquetterdv.Modify("DataWindow.Print.CustomPage.Width=4250")
	else
		ds_etiquetterdv.dataobject = "d_carterdv"
	end if
	
	//Récupérer le logo
	select chemin_logo
	into :ls_logo
	from t_options
	where ortho_id = :v_no_ortho;	
	
	IF Isnull(ls_logo) = false AND ls_logo <> "" THEN
		ds_etiquetterdv.object.p_logo.filename = ls_logo
	END IF
	
end if
ds_etiquetterdv.SetTransObject(SQLCA)
ll_retour = ds_etiquetterdv.retrieve(v_no_ortho,il_patid)

IF ll_retour = 0 THEN
	error_type(1008)
	If IsValid(ds_etiquetterdv) THEN destroy ds_etiquetterdv
	RETURN 
	
END IF

gb_datawindow = false
openwithparm(w_print_options,ds_etiquetterdv)
destroy ds_etiquetterdv
end event

type dw_details_patient from u_dw within w_patient
event retourner ( long ll_numero_patient )
integer x = 5
integer width = 2286
integer height = 1220
integer taborder = 0
string title = "patient"
string dataobject = "d_patient"
boolean vscrollbar = false
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event retourner(long ll_numero_patient);/* Copyright II4net Inc.
   créer le:
	modifier le: 09-04-2003
	Auteur dernière modif: Dave Tremblay
*/

long ll_row, ll_no_dossier, ll_code_recherche, ll_rvmanque, ll_retards, ll_phase, ll_rvcancel
long ll_caba
string ls_prenom, ls_nom, ls_adresse, ls_ville, ls_province, ls_code_postal, ls_tel_maison, ls_tel_bureau, ls_telcell, ls_telautre, ll_no_boite, ls_note
date ld_date_naissance, ldt_rappel
string ls_sex, ls_langue, ls_text1, ls_text2, ls_text5, ls_text6, ls_new_dossier, ls_statut, ls_refsal, ls_refnom, ls_refprenom, ls_patstatus, ls_detnom, ls_detprenom, ls_detsal, ls_phase
string ls_persnom, ls_persprenom, ls_email, ls_activite, ls_champperso

 // ON nettoie la fenetre details patient
 dw_details_patient.setredraw(false)
 dw_details_patient.RowsDiscard(1, dw_details_patient.Rowcount(), Primary!)
 
 // Déclaration du curseur
 
 Declare pat_det Cursor For
 
 SELECT 	patient.patient_prenom,   
         patient.patient_nom,
			patient.adresse,
			patient.ville,
			patient.province,
			patient.code_postale,
			patient.tel_maison,
			patient.tel_bureau,
			patient.telcell,
			patient.telautre,
			patient.date_naissance,
			patient.sex,
			patient.langue,
			patient.text1,
			patient.text2,
			patient.text5,
			patient.text6,
			patient.new_dossier,
			patient.no_dossier,
			patient.code_recherche,
			patient.no_boite,
			patient.statut,
			patient.rvmanques,
			patient.retards,
			patient.rvcancel,
			patient.note,
			patient.caba,
			(select activites from t_activites where id_activite = patient.id_activite) as activite,
			(select champerso1 from t_options where ortho_id = patient.no_ortho) as champperso,
			t_personnels.nom,
			t_personnels.prenom,
			(select salutation from t_salutation where t_salutation.id_sal = t_referents.id_sal) as refsal,
			t_referents.ref_nom,
			t_referents.ref_prenom,
			t_patstatus.nom,
			t_dentists.det_nom,
			t_dentists.det_prenom,
			(select salutation from t_salutation where t_salutation.id_sal = t_dentists.id_sal) as detsal,
			(select max(id_phase) from traitements where patient_id = patient.patient_id) as idphase,
			(select phase from t_phase where id_phase = idphase) as phase,
			(select min(prochain_rv) from rendezvous where patient_id = patient.patient_id and rendezvous.id_rdv is null) as rappel,
			patient.email
    FROM patient LEFT OUTER JOIN t_referents ON patient.referant_nom = t_referents.id
	 				  LEFT OUTER JOIN t_patstatus ON patient.id_patstatus = t_patstatus.id_patstatus
					  LEFT OUTER JOIN t_dentists ON patient.id_dentist = t_dentists.id_dentist
					  LEFT OUTER JOIN t_personnels ON patient.id_personnel = t_personnels.id_personnel
   WHERE patient.no_ortho = :v_no_ortho and
	      patient.patient_id = :ll_numero_patient;
           			
OPEN pat_det;

Do While SQLCA.SQLCode = 0
   Fetch pat_det Into :ls_prenom,
							 :ls_nom,
							 :ls_adresse,
			             :ls_ville,
			             :ls_province,
			             :ls_code_postal,
			             :ls_tel_maison,
			             :ls_tel_bureau,
							 :ls_telcell,
			             :ls_telautre,
			             :ld_date_naissance,
			             :ls_sex,
			             :ls_langue,
			             :ls_text1,
			             :ls_text2,
							 :ls_text5,
			             :ls_text6,
			             :ls_new_dossier,
			             :ll_no_dossier,
			             :ll_code_recherche,
			             :ll_no_boite,
			             :ls_statut,
			             :ll_rvmanque,
							 :ll_retards,
							 :ll_rvcancel,
							 :ls_note,
							 :ll_caba,
							 :ls_activite,
							 :ls_champperso,
							 :ls_persnom, 
							 :ls_persprenom,
							 :ls_refsal,
							 :ls_refnom,
							 :ls_refprenom,
							 :ls_patstatus,
							 :ls_detnom,
							 :ls_detprenom,
							 :ls_detsal,
							 :ll_phase,
							 :ls_phase,
							 :ldt_rappel,
							 :ls_email;
	
if SQLCA.SQLCode = 0 then
	ll_row = dw_details_patient.insertrow(0)
   dw_details_patient.scrolltorow(ll_row)
	dw_details_patient.setitem(ll_row,'patient_nom',ls_nom)
	dw_details_patient.setitem(ll_row,'patient_prenom',ls_prenom)
	dw_details_patient.setitem(ll_row,'adresse',ls_adresse)
	dw_details_patient.setitem(ll_row,'ville',ls_ville)
	dw_details_patient.setitem(ll_row,'province',ls_province)
	if ls_province <> 'USA' then
		dw_details_patient.modify("code_postale.EditMask.Mask = '!#! #!#'")
	else
		dw_details_patient.modify("code_postale.EditMask.Mask = ''")
	end if
	dw_details_patient.setitem(ll_row,'code_postale',ls_code_postal)
	dw_details_patient.setitem(ll_row,'tel_maison',ls_tel_maison)
	dw_details_patient.setitem(ll_row,'tel_bureau',ls_tel_bureau)
	dw_details_patient.setitem(ll_row,'tel_cell',ls_telcell)
	dw_details_patient.setitem(ll_row,'tel_autre',ls_telautre)
	dw_details_patient.object.t_age.text = calculage(ld_date_naissance)
	dw_details_patient.setitem(ll_row,'date_naissance',ld_date_naissance)
	dw_details_patient.setitem(ll_row,'sex',ls_sex)
	dw_details_patient.setitem(ll_row,'langue',ls_langue)
	dw_details_patient.setitem(ll_row,'text1',ls_text1)
	dw_details_patient.setitem(ll_row,'text2',ls_text2)
	dw_details_patient.setitem(ll_row,'text5',ls_text5)
	dw_details_patient.setitem(ll_row,'text6',ls_text6)
	dw_details_patient.setitem(ll_row,'new_dossier',ls_new_dossier)
	dw_details_patient.setitem(ll_row,'no_dossier',ll_no_dossier)
	dw_details_patient.setitem(ll_row,'code_recherche',ll_code_recherche)
	dw_details_patient.setitem(ll_row,'no_boite',ll_no_boite)
	dw_details_patient.setitem(ll_row,'statut',ls_statut)
	dw_details_patient.setitem(ll_row,'rvmanque',ll_rvmanque)
	dw_details_patient.setitem(ll_row,'retards',ll_retards)
	dw_details_patient.setitem(ll_row,'rvcancel',ll_rvcancel)
	dw_details_patient.setitem(ll_row,'patient_id_activite',ls_activite)
	dw_details_patient.setitem(ll_row,'activite',ls_champperso)
	dw_details_patient.setitem(ll_row,'caba',ll_caba)
	dw_details_patient.setitem(ll_row,'note',ls_note)
	dw_details_patient.setItem(ll_row,'personnel',ls_persnom + ' ' + ls_persprenom)
	if isnull(ls_refsal) then ls_refsal = ''
	if isnull(ls_refprenom) then ls_refprenom = ''
	if isnull(ls_refnom) then ls_refnom = ''
	dw_details_patient.setitem(ll_row,'referant_nom',ls_refsal+' '+ls_refprenom+' '+ls_refnom)
	dw_details_patient.setitem(ll_row,'patstatus',ls_patstatus)
	if isnull(ls_detsal) then ls_detsal = ''
	if isnull(ls_detprenom) then ls_detprenom = ''
	if isnull(ls_detnom) then ls_detnom = ''
	dw_details_patient.setitem(ll_row,'dentist',ls_detsal+' '+ls_detprenom+' '+ls_detnom)
	dw_details_patient.setitem(ll_row,'phase',ls_phase)
	dw_details_patient.setitem(ll_row,'rappel',ldt_rappel)
	dw_details_patient.setitem(ll_row,'courriel',ls_email)
	
	ll_row = dw_patient_master.getRow()
	
	if ll_numero_patient = dw_patient_master.getItemNumber(ll_row, 'patient_id') and &
		(ls_nom <> dw_patient_master.getItemString(ll_row, 'patient_nom') or &
		ls_prenom <> dw_patient_master.getItemString(ll_row, 'patient_prenom') or &
		ls_new_dossier <> dw_patient_master.getItemString(ll_row, 'new_dossier')) then
		// Si le nom ou le numéro de dossier du patiente st différent de la liste, mettre la liste à jour
		
		dw_patient_master.setItem(ll_row, 'patient_prenom', ls_prenom)
		dw_patient_master.setItem(ll_row, 'patient_nom', ls_nom)
		dw_patient_master.setItem(ll_row, 'date_naissance', ld_date_naissance)
		dw_patient_master.setItem(ll_row, 'new_dossier', ls_new_dossier)
		dw_patient_master.setItem(ll_row, 'langue', ls_langue)
		dw_patient_master.setItem(ll_row, 'tel_maison', ls_tel_maison)
		dw_patient_master.setItem(ll_row, 'no_boite', ll_no_boite)
		
	end if
end if
Loop

CLOSE pat_det;

dw_details_patient.setredraw(true)
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	this.object.patient_nom_t.text = 'Last name'
	this.object.patient_prenom_t.text = 'First name'
	this.object.t_1.text = 'Address'
	this.object.t_2.text = 'City'
	this.object.t_4.text = 'Postal code'
	this.object.t_5.text = 'Phone (home)'
	this.object.t_6.text = 'Phone (office)'
	this.object.t_19.text = 'Phone (cell.)'
	this.object.t_20.text = 'Phone (other)'
	this.object.t_7.text = 'Birth date'
	this.object.t_8.text = 'Gender'
	this.object.t_9.text = 'Language'
	this.object.t_10.text = 'File #'
	this.object.t_11.text = 'Patient #'
	this.object.t_12.text = 'Phase'
	this.object.t_13.text = 'Box #'
	this.object.t_14.text = 'Current status'
	this.object.t_15.text = 'Class'
	this.object.t_17.text = 'File status'
	this.object.t_16.text = 'Referral'
	this.object.t_18.text = 'Dentist'
	this.object.t_rappel.text = 'Next recall'
	this.object.langue.values = 'French~tF/English~tA'
	this.object.t_personnel.text = "Staff"
else
	this.object.langue.values = 'Français~tF/Anglais~tA'
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

type st_5 from statictext within w_patient
integer x = 1509
integer y = 1660
integer width = 430
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
string text = "Total"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_tot_cpd from editmask within w_patient
integer x = 1509
integer y = 1732
integer width = 430
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 33225436
string text = "000"
boolean border = false
alignment alignment = center!
boolean displayonly = true
maskdatatype maskdatatype = decimalmask!
string mask = "[currency(7)]"
end type

type sle_nb_cpd from singlelineedit within w_patient
integer x = 1339
integer y = 1732
integer width = 169
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 33225436
string text = "err"
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type em_date_prochain_cpd from editmask within w_patient
integer x = 910
integer y = 1732
integer width = 430
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 33225436
boolean border = false
alignment alignment = center!
boolean displayonly = true
maskdatatype maskdatatype = datemask!
string mask = "[date]"
string displaydata = "~t/"
end type

type sle_day from singlelineedit within w_patient
integer x = 2299
integer width = 1102
integer height = 84
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 79741120
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type sle_username from singlelineedit within w_patient
integer x = 2299
integer y = 120
integer width = 1303
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 79741120
boolean border = false
boolean autohscroll = false
boolean displayonly = true
boolean hideselection = false
end type

type cb_delete from commandbutton within w_patient
integer x = 544
integer y = 1940
integer width = 635
integer height = 96
integer taborder = 200
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Suppression patient"
end type

event clicked;openwithparm(w_password_supp,il_patid)
afficher_info()
verif_entente()
cbrefresh()

end event

event constructor;if v_langue = 'an' then
	cb_delete.Text = "Delete patient"
end if
end event

type cb_insert from commandbutton within w_patient
integer y = 1844
integer width = 544
integer height = 192
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Nouveau patient"
end type

event clicked;setpointer(hourglass!)
Opensheetwithparm(w_dossier_patients,0, w_principal,2,layered!)
w_dossier_patients.title = "Dossier du patient"






end event

event constructor;if v_langue = 'an' then
	cb_insert.Text = "New patient"
end if
end event

type sle_1 from singlelineedit within w_patient
string tag = "sle_1"
integer x = 2299
integer y = 200
integer width = 928
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 16777215
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

event modified;recherche()
end event

event losefocus;recherche()
end event

type cb_traitements from commandbutton within w_patient
integer x = 3072
integer y = 1844
integer width = 539
integer height = 192
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Dossier financier"
end type

event clicked;event ue_dossfin(il_patid)
end event

event constructor;if v_langue = 'an' then
	cb_traitements.Text = "Financial File"
end if
end event

type cb_rapport_paiement from commandbutton within w_patient
integer x = 2405
integer y = 1844
integer width = 667
integer height = 192
integer taborder = 170
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rapport paiement"
end type

event clicked;long ll_traitid
integer li_typerappaie
ll_traitid = dw_resume_traitements.getitemnumber(dw_resume_traitements.getrow(),"traitement_id")
select typerappaie into :li_typerappaie from t_options where ortho_id = :v_no_ortho;
if isnull(li_typerappaie) then li_typerappaie = 1
choose case li_typerappaie
	case 1
		opensheetwithparm(w_rapport_paiement,ll_traitid,w_principal,2,layered!)
		w_rapport_paiement.title = "Rapport paiements"
	case 2
		opensheetwithparm(w_accountsummary,ll_traitid,w_principal,2,layered!)
		w_accountsummary.title = "Rapport paiements"
end choose
end event

event constructor;if v_langue = 'an' then
	this.Text = "Account Summary"
end if
end event

type cb_rendez_vous from commandbutton within w_patient
integer x = 1179
integer y = 1844
integer width = 645
integer height = 96
integer taborder = 150
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rendez-vous"
end type

event clicked;openwithparm(w_info_rendez_vous,il_patid)


end event

event constructor;if v_langue = 'an' then
	cb_rendez_vous.Text = "Next Appointment"
end if
end event

type cb_xray from commandbutton within w_patient
integer x = 1179
integer y = 1940
integer width = 645
integer height = 96
integer taborder = 180
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "X-RAY"
end type

event clicked;gf_captureortho(il_patid)
end event

type st_3 from statictext within w_patient
integer x = 910
integer y = 1660
integer width = 430
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
string text = "Prochain cpd"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_3.Text = "Next PDC"
end if
end event

type st_4 from statictext within w_patient
integer x = 1339
integer y = 1660
integer width = 169
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
string text = "Qté."
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_4.Text = "Qty"
end if
end event

type dw_patient_master from u_dw within w_patient
event retourner ( )
event ue_actualiser ( )
integer x = 2299
integer y = 296
integer width = 1303
integer height = 1200
integer taborder = 80
string title = "patient master"
string dataobject = "d_masterrefresh"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event retourner();Long ll_no_ortho, ll_patient_id, ll_row
Date ld_date_naissance,ldt_archive
String ls_nom, ls_prenom, ls_langue, ls_new_dossier

setpointer(hourglass!)
event ue_actualiser()
charger = 1
this.scrolltorow(1)
w_patient.enabled = true
w_principal.enabled = true
sle_1.enabled = true
sle_1.setfocus( )
dw_patient_master.enabled = true
dw_patient_master.visible = true
setpointer(arrow!)

end event

event ue_actualiser();long ll_actnbrow,ll_dbnbrow,ll_row
integer li_option

dw_patient_master.setredraw(false)
//ll_row = dw_patient_master.getrow()
ll_actnbrow = dw_patient_master.rowcount()

select hidearchive into :li_option from t_options where ortho_id = :v_no_ortho;

if li_option = 1 then
	select count(*) into :ll_dbnbrow from patient 
	where no_ortho = :v_no_ortho and	
	(isnull(patient.archivedate,'3000-12-31') > today(*));
else
	select count(*) into :ll_dbnbrow from patient 
	where no_ortho = :v_no_ortho;
end if

if ll_dbnbrow <> ll_actnbrow then
	//	messagebox('refresh',string(ll_dbnbrow))
	int li_test
	li_test = ids_masterrefresh.retrieve(v_no_ortho)
//	messagebox('aaa',string(li_test))

	ids_masterrefresh.ShareData(dw_patient_master)
//	st_nbpat.text = string(dw_patient_master.rowcount())
//	dw_patient_master.scrolltorow(ll_row)
end if
dw_patient_master.setredraw(true)
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransobject(SQLCA)
end event

event rowfocuschanged;integer li_test
string ls_dolphinpic, ls_typeimg

select isnull(typeimgutil,'o') into :ls_typeimg from t_options where ortho_id = :v_no_ortho;

ls_dolphinpic = gf_orthoini('dolphin','affpicture', '', false)
if ls_dolphinpic = "" then 
	gf_orthoini('dolphin','affpicture', 'no', true)
	ls_dolphinpic = 'no'
end if


if charger <> 0 then
	afficher_info()
	verif_entente()
	cbrefresh()
	if ls_typeimg = 'd' then
		ole_1.visible = true
		if ls_dolphinpic = 'yes' then
			ole_1.object.ID (string(il_patid))
		end if
	else
		ole_1.visible = false
	end if
end if
end event

event retrievestart;int v_max
//pour plus de rapidite
dw_patient_master.visible = false
//p_1.picturename = 'c:\ii4net\orthotek\images\trffc10c.bmp'
w_patient.enabled = false
w_principal.enabled = false
SetPointer(HourGlass!)
end event

event doubleclicked;if isvalid(w_dossier_patients) then
	if error_type(255) = 1 then
		Opensheetwithparm(w_dossier_patients,il_patid,w_principal,2,layered!)
	else
		w_dossier_patients.cb_close.event clicked()
		Opensheetwithparm(w_dossier_patients,il_patid,w_principal,2,layered!)
	end if
else
	Opensheetwithparm(w_dossier_patients,il_patid,w_principal,2,layered!)
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

event rbuttondown;call super::rbuttondown;long ll_patid, ll_cnt

if row > 0 then
	ll_patid = getItemNumber(row,'patient_id')
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("patientidnotesupp", ll_patid)
	open(w_notesupppat)
	select count(1) into :ll_cnt from t_notesupppat where patient_id = :ll_patid and isnull(notesupppat,'') <> '';
	setitem(row,'nbnote',ll_cnt)
end if
end event

type dw_dernier_paiement from u_dw within w_patient
event retourner ( long ll_patient_id )
integer x = 5
integer y = 1652
integer width = 2286
integer height = 180
integer taborder = 10
string title = "none"
string dataobject = "d_dernier_paiement1"
boolean vscrollbar = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event retourner(long ll_patient_id);Long ll_row, ll_traitement_id
dec{2} ld_montant_recu
date ld_date_paiement

// On nettoie la fenetre
dw_dernier_paiement.setredraw(false)
dw_dernier_paiement.RowsDiscard(1, dw_dernier_paiement.Rowcount(), Primary!)
// Déclaration du curseur
Declare dernier Cursor For
   SELECT FIRST paiement.date_paiement,      
         paiement.traitement_patient_id,   
         paiement.montant_recu  
    FROM paiement
   WHERE paiement.traitement_patient_id = :ll_patient_id   
ORDER BY paiement.date_paiement DESC,
			paiement.paiement_id DESC; 
OPEN dernier;
Do While SQLCA.SQLCode = 0
   Fetch dernier Into  :ld_date_paiement,   
                       :ll_traitement_id,   
                       :ld_montant_recu;
if SQLCA.SQLCode = 0 then
	ll_row = dw_dernier_paiement.insertrow(0)
	dw_dernier_paiement.scrolltorow(ll_row)
	dw_dernier_paiement.setitem(ll_row,'date_paiement',ld_date_paiement)
	dw_dernier_paiement.setitem(ll_row,'traitement_patient_id',ll_traitement_id)
	dw_dernier_paiement.setitem(ll_row,'montant_recu',ld_montant_recu)
end if
if isnull(ld_date_paiement) or isnull(ld_montant_recu) then
	dw_dernier_paiement.RowsDiscard(1, dw_dernier_paiement  .Rowcount(), Primary!)
end if
Loop
close dernier;
dw_dernier_paiement.setredraw(true)
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	dw_dernier_paiement.object.t_1.text = 'Last payment received'
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

type lb_1 from uo_vistlistbox within w_patient
boolean visible = false
integer width = 293
integer height = 200
integer taborder = 40
boolean bringtotop = true
end type

type p_size from picture within w_patient
boolean visible = false
integer width = 165
integer height = 144
boolean bringtotop = true
boolean enabled = false
boolean originalsize = true
boolean focusrectangle = false
end type

type dw_detailsrdv from u_dw within w_patient
integer x = 2286
integer y = 1504
integer width = 1321
integer height = 328
integer taborder = 110
boolean bringtotop = true
string title = "detailsrdv"
string dataobject = "d_detailsrdv"
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	this.object.t_rdv.text = 'Appointment'
	this.object.t_heure.text = 'Time'
	this.object.t_trait.text = 'Treatment'
	this.object.t_duree.text = 'Unit'
end if
SetTransObject(SQLCA)

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

event doubleclicked;long ll_row, ll_col
time lt_rdv

lt_rdv = getitemtime(row,'rdvheure')
ll_col = getItemNumber(row, 'colonne')
if isvalid(w_horaire) then
	istr_cal.caldate = getitemdate(getrow(),'rdvdate')
	w_horaire.uo_1.uf_InitCal(istr_cal.caldate)
	w_horaire.uo_1.PostEvent("ue_aff_horaire")
	w_horaire.postevent("ue_post_open")
	w_horaire.SetFocus()
else
	opensheetwithparm(w_horaire,string(getitemdate(getrow(),'rdvdate')),w_principal,2,layered!)
	w_horaire.SetFocus()
end if

w_principal.SetMicroHelp('Grille horaire')
w_horaire.title = "Horaire des rendez-vous"

ll_row = w_horaire.dw_hor.find("heure_2 = time('" + string(lt_rdv, 'hh:mm') + "')", 1, w_horaire.dw_hor.rowCount())

if ll_row <= 0 then
	choose case lt_rdv
		case time(string(w_horaire.ii_startam) + ':00') to time(string(w_horaire.ii_endam) + ':55')
			w_horaire.rb_am.checked = true
			w_horaire.rb_pm.checked = false
		case time(string(w_horaire.ii_startpm) + ':00') to time(string(w_horaire.ii_endpm) + ':55')
			w_horaire.rb_am.checked = false
			w_horaire.rb_pm.checked = true
		case else
			return 0
	end choose

	w_horaire.f_affichage()

	ll_row = w_horaire.dw_hor.find("heure_2 = time('" + string(lt_rdv, 'hh:mm') + "')", 1, w_horaire.dw_hor.rowCount())
end if

w_horaire.dw_hor.post scrollToRow(ll_row)
w_horaire.dw_hor.post setColumn('patient_nom_' + string(ll_col))

end event

type dw_resume_traitements from u_dw within w_patient
event retourner ( long ll_patient_id )
integer x = 5
integer y = 1224
integer width = 2286
integer height = 432
integer taborder = 20
string dataobject = "d_resume_traitement"
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event retourner(long ll_patient_id);Long ll_pourcentage, ll_row, ll_phase, ll_traitement_id, ll_trait
integer li_nbcharge1,li_nbcharge2
dec{2} ld_montant_original, ld_montant_du, ld_montant_paye, ld_frais, ld_montant_total_fact, ld_montant_total_fact1, ld_montant_paye1, ld_frais1, ld_totcpd1, ld_totcpd
date ld_fin_traitement
string ls_nomphase

dw_resume_traitements.setredraw(false)
dw_resume_traitements.RowsDiscard(1, dw_resume_traitements.Rowcount(), Primary!)
// Déclaration du curseur
Declare resume Cursor For
  SELECT (select pourcentage from t_pourcentages where traitement_id = trait and annee = year(today())) as pouract,   
         traitements.montant_original, 
			traitements.traitement_id as trait,
			(select sum(montant) from factures_traitements where traitement_id = trait and date_facture <= today()) as montant_total_fact1,
			(if montant_total_fact1 is null then 0 else montant_total_fact1 endif) as montant_total_fact, 
 			(select sum(montant_recu) from paiement where traitement_patient_id = trait ) as v_montant_paye1,
			(if v_montant_paye1 is null then 0 else v_montant_paye1 endif) as v_montant_paye,
			(montant_total_fact - v_montant_paye) as montantdu, 
         traitements.phase,     
         traitements.fin_traitement,   
         (select sum(montant) from factures_traitements where traitement_id = trait) as frais1,
			(if frais1 is null then 0 else frais1 endif) as frais,
			(select sum(paiement) from cheques_postdates where traitement_patient_id = trait and indicateur <> '1') as totcpd1,
			(if totcpd1 is null then 0 else totcpd1 endif) as totcpd,
			(select phase from t_phase where id_phase = traitements.id_phase) as nomphase,
			(select count(*) from factures_traitements where traitement_id = trait and date_facture <= today()) as nbfact,
			(select count(*) from factures_traitements where traitement_id = trait  and date_facture > today()) as nbpaie
    FROM traitements
   WHERE traitements.patient_id = :ll_patient_id
ORDER BY traitements.phase DESC, traitement_id DESC; 
OPEN resume;
Do While SQLCA.SQLCode = 0
   Fetch resume Into   :ll_pourcentage,   
                       :ld_montant_original,
							  :ll_traitement_id,
							  :ld_montant_total_fact1,
							  :ld_montant_total_fact,
							  :ld_montant_paye1,
							  :ld_montant_paye,
                       :ld_montant_du,    
                       :ll_phase,       
                       :ld_fin_traitement,
							  :ld_frais1,
                       :ld_frais,
							  :ld_totcpd1,
							  :ld_totcpd,
							  :ls_nomphase,
							  :li_nbcharge1,
							  :li_nbcharge2;  
if SQLCA.SQLCode = 0 then
	ll_row = dw_resume_traitements.insertrow(0)
	dw_resume_traitements.scrolltorow(ll_row)
	dw_resume_traitements.setitem(ll_row,'phase',ll_phase)
	dw_resume_traitements.setitem(ll_row,'fin_traitement',ld_fin_traitement)
	dw_resume_traitements.setitem(ll_row,'traitement_id',ll_traitement_id)
	dw_resume_traitements.setitem(ll_row,'pourcentage_actuel',ll_pourcentage)
	dw_resume_traitements.setitem(ll_row,'montant_original',ld_montant_original)
	dw_resume_traitements.setitem(ll_row,'montant_du',ld_montant_du)
	dw_resume_traitements.setitem(ll_row,'montant_paye',ld_montant_paye)
	dw_resume_traitements.setitem(ll_row,'frais',ld_frais)
	dw_resume_traitements.setitem(ll_row,'totcpd',ld_totcpd)
	dw_resume_traitements.setitem(ll_row,'nomphase',ls_nomphase)
	dw_resume_traitements.setitem(ll_row,'nbcharge',string(li_nbcharge1))
	dw_resume_traitements.setitem(ll_row,'nbrestant',string(li_nbcharge2))
end if
Loop
close resume;
dw_resume_traitements.setredraw(true)
dw_resume_traitements.scrolltorow(0)
end event

event constructor;string ls_y

SetRowFocusIndicator(FocusRect!)

pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	dw_resume_traitements.object.frais_t.text = 'Global cost'
	dw_resume_traitements.object.montant_original_t.text = 'Treat. cost'
	dw_resume_traitements.object.montant_paye_t.text = 'Paid amount'
	dw_resume_traitements.object.montant_du_t.text = 'Due Now'
	dw_resume_traitements.object.t_solde.text = 'Balance'
	dw_resume_traitements.object.t_tocollect.text = 'To collect'
	dw_resume_traitements.object.tt_nbcharge.text = 'Qty Charged:'
	dw_resume_traitements.object.tt_nbrestant.text = 'Qty To Charge:'
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

event resize;call super::resize;string ls_y, ls_height, ls_header

ls_y = dw_resume_traitements.object.t_tocollect.y
ls_height = dw_resume_traitements.object.t_tocollect.height
ls_header = string(long(ls_y) + long(ls_height))

dw_resume_traitements.Object.DataWindow.header.Height = ls_header
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
02w_patient.bin 
2200000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000024e67b9c911d247e1a0005b8d297d0cc9000000000000000000000000af2b1c0001cf529000000003000000c000000000004f00010065006c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000001400000000006f00430074006e006e006500730074000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010200120000000100000003ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000010000001a00000000004f00020065006c007200500073006500300030000000300000000000000000000000000000000000000000000000000000000000000000000000000000000000020018ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000020000001c00000000fffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff020000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000400000ee2000011430000000100ffffff000d01000000ffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000001ffffffff00000002494e414e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
12w_patient.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
