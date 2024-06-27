$PBExportHeader$w_principal.srw
forward
global type w_principal from window
end type
type mdi_1 from mdiclient within w_principal
end type
end forward

global type w_principal from window
integer width = 4695
integer height = 3232
boolean titlebar = true
string title = "ORTHOTEK"
string menuname = "m_principal"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 79741120
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
boolean center = true
mdi_1 mdi_1
end type
global w_principal w_principal

forward prototypes
public subroutine security ()
public subroutine of_appdroits (menu am_menu, string as_nom)
end prototypes

public subroutine security ();of_appdroits(this.menuID, "")

/*
integer li_contacts, li_horaire, li_typetrait, li_gestpers, li_expacomba, li_stats, li_listeref, li_statconsult 
integer li_etatdosspat, li_statutpat, li_patstatut, li_prodcomp, li_rapanuelstatut, li_statpat, li_fonctioncomp
integer li_statut, li_jhono, li_cpd, li_jenc, li_jdepot, li_compterecevable, li_jrevenu, li_compteclient  
integer li_entrerpourc, li_pourc, li_paiesouff, li_etatcompte, li_jtrait, li_config, li_lot, li_compterecsoldeant
integer li_jrevenucomb, li_taxform, li_agecompte, li_nzb, li_nza, li_optionsm, li_logsm,li_listecomp
integer li_compaperc,li_depotanc,li_rapdumois,li_rapdesnsf, li_listcompper, li_nonzerodu
integer li_rappcred, li_nonzerobal

SELECT t_personneldroit.contacts,   
		 t_personneldroit.horaire,   
		 t_personneldroit.typetrait,   
		 t_personneldroit.gestpers,   
		 t_personneldroit.expacomba,   
		 t_personneldroit.stats,   
		 t_personneldroit.listeref,   
		 t_personneldroit.statconsult,   
		 t_personneldroit.etatdosspat,   
		 t_personneldroit.statutpat,   
		 t_personneldroit.patstatut,   
		 t_personneldroit.prodcomp,   
		 t_personneldroit.rapanuelstatut,   
		 t_personneldroit.statpat,   
		 t_personneldroit.fonctioncomp,   
		 t_personneldroit.statut,   
		 t_personneldroit.jhono,   
		 t_personneldroit.cpd,   
		 t_personneldroit.jenc,   
		 t_personneldroit.jdepot,   
		 t_personneldroit.compterecevable,   
		 t_personneldroit.jrevenu,   
		 t_personneldroit.compteclient,   
		 t_personneldroit.entrerpourc,   
		 t_personneldroit.pourc,   
		 t_personneldroit.paiesouff,   
		 t_personneldroit.etatcompte,   
		 t_personneldroit.jtrait,   
		 t_personneldroit.config,
		 t_personneldroit.lot,
		 t_personneldroit.compterecevablesoldeant,
		 t_personneldroit.jrevenucomb,
		 t_personneldroit.taxform,
		 t_personneldroit.agecompte,
		 t_personneldroit.nzb,
		 t_personneldroit.nza,
		 t_personneldroit.optionsm,
		 t_personneldroit.logsm,
		 t_personneldroit.listecomparative,
		 t_personneldroit.compteapercevoir,
		 t_personneldroit.depotanc,
		 t_personneldroit.rapdumois,
		 t_personneldroit.rapdesnsf,
		 t_personneldroit.listcompper, 
		 t_personneldroit.nonzerodu, 
		 t_personneldroit.rappcred, 
		 t_personneldroit.nonzerobal,
		 t_personnels.postocc
 INTO  :li_contacts, :li_horaire, :li_typetrait, :li_gestpers, :li_expacomba, :li_stats, :li_listeref, :li_statconsult, 
		 :li_etatdosspat, :li_statutpat, :li_patstatut, :li_prodcomp, :li_rapanuelstatut, :li_statpat, :li_fonctioncomp, 
		 :li_statut, :li_jhono, :li_cpd, :li_jenc, :li_jdepot, :li_compterecevable, :li_jrevenu, :li_compteclient,   
		 :li_entrerpourc, :li_pourc, :li_paiesouff, :li_etatcompte, :li_jtrait, :li_config, :li_lot, :li_compterecsoldeant,
		 :li_jrevenucomb, :li_taxform, :li_agecompte, :li_nzb, :li_nza, :li_optionsm, :li_logsm, :li_listecomp,:li_compaperc,
		 :li_depotanc,:li_rapdumois,:li_rapdesnsf,:li_listcompper,:li_nonzerodu,:li_rappcred, :li_nonzerobal, :gs_postocc
 FROM  t_personneldroit INNER JOIN t_personnels on t_personneldroit.id_personnel = t_personnels.id_personnel
WHERE  t_personnels.id_personnel = :gl_idpers;

if gl_idpers = 0 or gs_postocc = 'O' or gs_postocc = 'A' then
	li_gestpers = 0
else
	li_gestpers = 1
end if

if gl_idpers = 0 then m_principal.m_config.m_promaintenance.visible = true
if gl_idpers = 0 then m_principal.m_config.m_promaintenance.toolbaritemvisible = true

if li_contacts = 1 then m_principal.m_app.m_listecontacts.visible = false
if li_contacts = 1 then m_principal.m_app.m_listecontacts.toolbaritemvisible = false
if li_horaire = 1 then m_principal.m_app.m_horaire.visible = false
if li_horaire = 1 then m_principal.m_app.m_horaire.toolbaritemvisible = false
if li_typetrait = 1 then m_principal.m_parametres.m_comp.m_typestrait.visible = false
//if li_typetrait = 1 then m_principal.m_parametres.m_typestrait.toolbaritemvisible = false
if li_gestpers = 1 then m_principal.m_config.m_edit.m_gestionpers.visible = false
if li_gestpers = 1 then m_principal.m_config.m_edit.m_gestionpers.toolbaritemvisible = false

if li_expacomba = 1 then m_principal.m_util.m_exportacomba.visible = false
if li_expacomba = 1 then m_principal.m_util.m_exportacomba.toolbaritemvisible = false

if li_stats = 1 then m_principal.m_stat.visible = false
if li_stats = 1 then m_principal.m_stat.toolbaritemvisible = false
if li_listeref = 1 then m_principal.m_stat.m_mref.m_listeref.visible = false
if li_listeref = 1 then m_principal.m_stat.m_mref.m_listeref.toolbaritemvisible = false
if li_listeref = 1 then m_principal.m_stat.m_mref.m_listerefopendoss.visible = false
if li_listeref = 1 then m_principal.m_stat.m_mref.m_listerefopendoss.toolbaritemvisible = false
if li_statconsult = 1 then m_principal.m_stat.m_mstatuts.m_statconsulte.visible = false
if li_statconsult = 1 then m_principal.m_stat.m_mstatuts.m_statconsulte.toolbaritemvisible = false
if li_etatdosspat = 1 then m_principal.m_parametres.m_comp.m_etatpat.visible = false
if li_etatdosspat = 1 then m_principal.m_parametres.m_comp.m_etatpat.toolbaritemvisible = false
if li_statutpat = 1 then m_principal.m_stat.m_mstatuts.m_statutpat.visible = false
if li_statutpat = 1 then m_principal.m_stat.m_mstatuts.m_statutpat.toolbaritemvisible = false
if li_patstatut = 1 then m_principal.m_stat.m_mstatuts.m_patstatuts.visible = false
if li_patstatut = 1 then m_principal.m_stat.m_mstatuts.m_patstatuts.toolbaritemvisible = false
if li_prodcomp = 1 then m_principal.m_stat.m_mfinances.m_productivitecomparative.visible = false
if li_prodcomp = 1 then m_principal.m_stat.m_mfinances.m_productivitecomparative.toolbaritemvisible = false
if li_rapanuelstatut = 1 then m_principal.m_stat.m_mstatuts.m_rapporannuelstatuts.visible = false
if li_rapanuelstatut = 1 then m_principal.m_stat.m_mstatuts.m_rapporannuelstatuts.toolbaritemvisible = false
if li_statpat = 1 then m_principal.m_stat.m_statistiquepatient.visible = false
if li_statpat = 1 then m_principal.m_stat.m_statistiquepatient.toolbaritemvisible = false

if li_fonctioncomp = 1 then m_principal.m_fonctionscomptable.visible = false
if li_fonctioncomp = 1 then m_principal.m_fonctionscomptable.toolbaritemvisible = false
if li_statut = 1 then m_principal.m_parametres.m_comp.m_listestatuts.visible = false
//if li_statut = 1 then m_principal.m_fonctionscomptable.m_listestatuts.toolbaritemvisible = false
if li_jhono = 1 then m_principal.m_fonctionscomptable.m_revenus.m_journaldeshonoraires.visible = false
if li_jhono = 1 then m_principal.m_fonctionscomptable.m_revenus.m_journaldeshonoraires.toolbaritemvisible = false
if li_cpd = 1 then m_principal.m_fonctionscomptable.m_revenus.m_chquespostdats.visible = false
if li_cpd = 1 then m_principal.m_fonctionscomptable.m_revenus.m_chquespostdats.toolbaritemvisible = false
if li_jenc = 1 then m_principal.m_fonctionscomptable.m_revenus.m_journaldesencaissements.visible = false
if li_jenc = 1 then m_principal.m_fonctionscomptable.m_revenus.m_journaldesencaissements.toolbaritemvisible = false
if li_listcompper = 1 then m_principal.m_fonctionscomptable.m_revenus.m_listecompper.visible = false
if li_listcompper = 1 then m_principal.m_fonctionscomptable.m_revenus.m_listecompper.toolbaritemvisible = false

if li_jdepot = 1 then m_principal.m_fonctionscomptable.m_depots.m_journaldepot.visible = false
if li_jdepot = 1 then m_principal.m_fonctionscomptable.m_depots.m_journaldepot.toolbaritemvisible = false
if li_jdepot = 1 then m_principal.m_fonctionscomptable.m_depots.m_journaldepotscompact.visible = false
if li_jdepot = 1 then m_principal.m_fonctionscomptable.m_depots.m_journaldepotscompact.toolbaritemvisible = false
if li_jdepot = 1 then m_principal.m_fonctionscomptable.m_depots.m_journaldepotscpd.visible = false
if li_jdepot = 1 then m_principal.m_fonctionscomptable.m_depots.m_journaldepotscpd.toolbaritemvisible = false

if li_compterecevable = 1 then m_principal.m_fonctionscomptable.m_recevables.m_comptesrecevables.visible = false
if li_compterecevable = 1 then m_principal.m_fonctionscomptable.m_recevables.m_comptesrecevables.toolbaritemvisible = false
if li_jrevenu = 1 then m_principal.m_fonctionscomptable.m_revenus.m_journaldesrevenus.visible = false
if li_jrevenu = 1 then m_principal.m_fonctionscomptable.m_revenus.m_journaldesrevenus.toolbaritemvisible = false
if li_compteclient = 1 then m_principal.m_fonctionscomptable.m_recevables.m_comptesclients.visible = false
if li_compteclient = 1 then m_principal.m_fonctionscomptable.m_recevables.m_comptesclients.toolbaritemvisible = false
if li_entrerpourc = 1 then m_principal.m_fonctionscomptable.m_pourc.m_entrer.visible = false
if li_entrerpourc = 1 then m_principal.m_fonctionscomptable.m_pourc.m_entrer.toolbaritemvisible = false
if li_pourc = 1 then m_principal.m_fonctionscomptable.m_pourc.m_pourcentages.visible = false
if li_pourc = 1 then m_principal.m_fonctionscomptable.m_pourc.m_pourcentages.toolbaritemvisible = false
if li_paiesouff = 1 then m_principal.m_fonctionscomptable.m_recevables.m_paiementsouffrance.visible = false
if li_paiesouff = 1 then m_principal.m_fonctionscomptable.m_recevables.m_paiementsouffrance.toolbaritemvisible = false
if li_etatcompte = 1 then m_principal.m_fonctionscomptable.m_recevables.m_etatdecompte.visible = false
if li_etatcompte = 1 then m_principal.m_fonctionscomptable.m_recevables.m_etatdecompte.toolbaritemvisible = false
if li_lot = 1 then m_principal.m_fonctionscomptable.m_depots.m_depotlot.visible = false
if li_lot = 1 then m_principal.m_fonctionscomptable.m_depots.m_depotlot.toolbaritemvisible = false
if li_compterecsoldeant = 1 then m_principal.m_fonctionscomptable.m_recevables.m_comptesrecsoldeant.visible = false
if li_compterecsoldeant = 1 then m_principal.m_fonctionscomptable.m_recevables.m_comptesrecsoldeant.toolbaritemvisible = false
if li_jrevenucomb = 1 then m_principal.m_fonctionscomptable.m_revenus.m_jrevenuscomb.visible = false
if li_jrevenucomb = 1 then m_principal.m_fonctionscomptable.m_revenus.m_jrevenuscomb.toolbaritemvisible = false
if li_listecomp = 1 then m_principal.m_fonctionscomptable.m_revenus.m_listecomparative.visible = false
if li_listecomp = 1 then m_principal.m_fonctionscomptable.m_revenus.m_listecomparative.toolbaritemvisible = false
if li_compaperc = 1 then m_principal.m_fonctionscomptable.m_recevables.m_comptepercevoir.visible = false
if li_compaperc = 1 then m_principal.m_fonctionscomptable.m_recevables.m_comptepercevoir.toolbaritemvisible = false
if li_depotanc = 1 then m_principal.m_fonctionscomptable.m_depots.m_journaldepotanc.visible = false
if li_depotanc = 1 then m_principal.m_fonctionscomptable.m_depots.m_journaldepotanc.toolbaritemvisible = false
if li_rapdumois = 1 then m_principal.m_fonctionscomptable.m_rapports.m_rapportdumois.visible = false
if li_rapdumois = 1 then m_principal.m_fonctionscomptable.m_rapports.m_rapportdumois.toolbaritemvisible = false
if li_rapdesnsf = 1 then m_principal.m_fonctionscomptable.m_rapports.m_rapportnsf.visible = false
if li_rapdesnsf = 1 then m_principal.m_fonctionscomptable.m_rapports.m_rapportnsf.toolbaritemvisible = false
if li_nonzerodu = 1 then m_principal.m_fonctionscomptable.m_rapports.m_nonzerodueamount.visible = false
if li_nonzerodu = 1 then m_principal.m_fonctionscomptable.m_rapports.m_nonzerodueamount.toolbaritemvisible = false
if li_rappcred = 1 then m_principal.m_fonctionscomptable.m_rapports.m_rappcred.visible = false
if li_rappcred = 1 then m_principal.m_fonctionscomptable.m_rapports.m_rappcred.toolbaritemvisible = false
if li_nonzerobal = 1 then m_principal.m_fonctionscomptable.m_rapports.m_nonzerobalance.visible = false
if li_nonzerobal = 1 then m_principal.m_fonctionscomptable.m_rapports.m_nonzerobalance.toolbaritemvisible = false

if li_taxform = 1 then m_principal.m_fonctionscomptable.m_rapports.m_taxform.visible = false
if li_taxform = 1 then m_principal.m_fonctionscomptable.m_rapports.m_taxform.toolbaritemvisible = false
if li_agecompte = 1 then m_principal.m_fonctionscomptable.m_recevables.m_agedescomptes.visible = false
if li_agecompte = 1 then m_principal.m_fonctionscomptable.m_recevables.m_agedescomptes.toolbaritemvisible = false
if li_nzb = 1 then m_principal.m_fonctionscomptable.m_rapports.m_nonzerobalance.visible = false
if li_nzb = 1 then m_principal.m_fonctionscomptable.m_rapports.m_nonzerobalance.toolbaritemvisible = false
if li_nza = 1 then m_principal.m_fonctionscomptable.m_rapports.m_nonzerodueamount.visible = false
if li_nza = 1 then m_principal.m_fonctionscomptable.m_rapports.m_nonzerodueamount.toolbaritemvisible = false
if li_jtrait = 1 then m_principal.m_fonctionscomptable.m_rapports.m_raptrait.visible = false
if li_jtrait = 1 then m_principal.m_fonctionscomptable.m_rapports.m_raptrait.toolbaritemvisible = false
//if li_config = 1 then m_principal.m_config.visible = false
//if li_config = 1 then m_principal.m_config.toolbaritemvisible = false
//if li_optionsm = 1 then m_principal.m_config.m_options.visible = false
//if li_optionsm = 1 then m_principal.m_config.m_options.toolbaritemvisible = false
if li_logsm  = 1 then m_principal.m_util.m_logs.visible = false
if li_logsm  = 1 then m_principal.m_util.m_logs.toolbaritemvisible = false

//	m_principal.m_stat.m_productivitecomparative.enabled = true

//	m_principal.m_config.m_entrerortho.enabled = true
//	m_principal.m_config.m_passsupppat.enabled = true
//	m_principal.m_config.m_passlogon.enabled = true
//	m_principal.m_config.m_passpaie.enabled = true
//	m_principal.m_config.m_cachefactpaie.enabled = true
//	m_principal.m_config.m_routinecachefactpaie.enabled = true
//	m_principal.m_config.m_migration.enabled = true
*/
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

on w_principal.create
if this.MenuName = "m_principal" then this.MenuID = create m_principal
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_principal.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;long nb_recu
string ls_softversion, ls_dbversion

if v_langue = 'an' then
	m_principal.m_app.text = 'General'
	m_principal.m_app.m_listecontacts.text = 'Contact list'
	m_principal.m_app.m_listerappels.text = 'History List'
	m_principal.m_app.m_listerappels.ToolbarItemText = 'History List'
	m_principal.m_app.m_listedossier.text = 'File number list'
	m_principal.m_app.m_listedossier.ToolbarItemText = 'File number list'
	m_principal.m_app.m_listeboite.text = 'Box number list'
	m_principal.m_app.m_listeboite.ToolbarItemText = 'Box number list'
	m_principal.m_app.m_horaire.text = 'Schedule'
	m_principal.m_app.m_horaire.ToolbarItemText = 'Schedule'
	m_principal.m_app.m_listeanniversaires.text = 'Birthday list'
	m_principal.m_app.m_listeanniversaires.ToolbarItemText = 'Birthday list'
	m_principal.m_config.m_edit.m_gestionpers.text = 'Staff management'
	m_principal.m_app.m_listpatsarchive.text = 'Archive list'
	m_principal.m_app.m_journalevents.text = 'Event report'
	m_principal.m_app.m_moniteur.text = 'Monitor'
	m_principal.m_app.m_console.text = 'Console'
	m_principal.m_app.m_console2.text = 'Advanced console'
	m_principal.m_app.m_listenoire.ToolbarItemText = 'Black list'
	m_principal.m_app.m_listenoire.text = 'Black list'
	m_principal.m_app.m_patterm.text = 'Released patient'
	m_principal.m_app.m_imagerie.text = 'Imaging'
	
	m_principal.m_app.m_enremp.text = 'Time Clock'
	m_principal.m_app.m_feuilledemployees.text = 'Time Sheet'
	
	m_principal.m_app.m_backup.text = 'Backup'
	m_principal.m_app.m_backup.ToolbarItemText = 'Backup'
	m_principal.m_app.m_quitter.text = 'Exit'
	m_principal.m_app.m_quitter.ToolbarItemText = 'Exit'
	m_principal.m_affichage.text = 'Windows'
	m_principal.m_affichage.m_-0.text = 'Active windows'
	m_principal.m_correspondance.text = 'Correspondence'
	m_principal.m_correspondance.m_labels.text = 'Labels'
	m_principal.m_correspondance.m_labels.ToolbarItemText = 'Labels'
	m_principal.m_correspondance.m_ententefin.text = 'Financial agreement'
	m_principal.m_correspondance.m_ententefin.ToolbarItemText = 'Financial agreement'
	m_principal.m_correspondance.m_ententefin2.text = 'Financial agreement2'
	m_principal.m_correspondance.m_questmed.text = 'Medical history'
	m_principal.m_correspondance.m_questmed.ToolbarItemText = 'Medical history'
	m_principal.m_correspondance.m_lettrespat.text = 'Correspondence with patient'
	m_principal.m_correspondance.m_lettrespat.ToolbarItemText = 'Correspondence with patient'
	m_principal.m_correspondance.m_lettresref.text = 'Correspondence with referees'
	m_principal.m_correspondance.m_lettresref.ToolbarItemText = 'Correspondence with referrals'
	m_principal.m_correspondance.m_lettresdet.text = 'Correspondence with dentists'
	m_principal.m_correspondance.m_lettresdet.ToolbarItemText = 'Correspondence with dentists'
	m_principal.m_correspondance.m_billetabs.text = 'Absence letter'
	m_principal.m_correspondance.m_billetabs.ToolbarItemText = 'Absence letter'
	m_principal.m_correspondance.m_assurance.text = 'Insurance'
	m_principal.m_correspondance.m_assurance.ToolbarItemText = 'Insurance'
	m_principal.m_correspondance.m_ref.text = 'Referrals'
	m_principal.m_correspondance.m_ref.ToolbarItemText = 'Referrals'
	m_principal.m_correspondance.m_dentistes.text = 'Dentists'
	m_principal.m_correspondance.m_dentistes.ToolbarItemText = 'Dentists'
	m_principal.m_correspondance.m_lettrefusion.text = 'Merging of letters'
	m_principal.m_correspondance.m_formtransfert.text = 'Transfer form'
	m_principal.m_correspondance.m_traiturg.text = 'Emergency treatment'
	m_principal.m_correspondance.m_corrletter.text = 'Create Edit typical letters'
	m_principal.m_correspondance.m_listetraitementrequisnonsigne.text = 'Unsigned required treatments'
//	m_principal.m_correspondance.m_corpsdelettre.text = 'Edit letter'
	m_principal.m_stat.text = 'Stats'
	m_principal.m_stat.m_statistiquepatient.text = "Patient's stats"
	m_principal.m_stat.m_patients.m_listpatage.text = "Patients by age"
	m_principal.m_stat.m_mrdv.text = 'Appointments'
	m_principal.m_stat.m_mrdv.m_listerdvpat.text = 'Appointment list'
	m_principal.m_stat.m_mrdv.m_patsansrdv.text = "No-appointment list"
	m_principal.m_stat.m_mrdv.m_listedespatientsparphase.text = 'Patient list by phase'
	m_principal.m_stat.m_mrdv.m_listedesrdvconsultation.text = 'List of consultation'
	m_principal.m_stat.m_mrdv.m_listedesdiagnostics.text = 'List of diagnosis'
	m_principal.m_stat.m_mrdv.m_listedesmisesenbouches.text = 'List of appliance start date'
	m_principal.m_stat.m_mrdv.m_dureetrait.text = 'Mean treatment time'
	m_principal.m_stat.m_mrdv.m_listepatproc.text = 'List of patient per procedure1'
	m_principal.m_stat.m_mrdv.m_listspatpers.text = 'List of patient per employee'
	m_principal.m_stat.m_mrdv.m_1.text = 'Appointment per chair number'
	m_principal.m_stat.m_mrdv.m_etatdesrendez-vous.text = 'List of patient per procedure2'
//	m_principal.m_stat.m_patients.m_suividespatients.text = ''
	m_principal.m_stat.m_patients.m_listedespatientsparsatellites.text = 'Patient list per satellite'
	m_principal.m_stat.m_patients.m_2.text = 'List of new patient by age'
//	m_principal.m_stat.m_patients.m_listpatage.text = ''
	m_principal.m_stat.m_employees.text = 'Employee'
	m_principal.m_stat.m_etatdossier.text = 'File status'
	m_principal.m_stat.m_etatdossier.m_patientparetatdossier.text = 'Patient by file status'
	
	m_principal.m_stat.m_mref.text = 'Referrals'
	m_principal.m_stat.m_mref.m_rapportdespatientsparréférent.text = 'Referring dentist detail report'
	m_principal.m_stat.m_mref.m_listerefopendoss.text = 'Referral list by opening file date'
	m_principal.m_stat.m_mref.m_listeref.text = 'Referral list by starting treatment date'
	m_principal.m_stat.m_dentist.text = 'Dentists'
	m_principal.m_stat.m_dentist.m_rapportdespatientspardentiste.text = 'Dentist detail report'
	m_principal.m_stat.m_dentist.m_listedentdebtrait.text = 'Dentist list (by treatment start date)'
	m_principal.m_stat.m_dentist.m_listedendateouvdos.text = 'Dentist list (by file opening date)'
	m_principal.m_stat.m_mstatuts.text = 'Status'
	m_principal.m_stat.m_consultation.m_consbaserdv.text = 'Consult based on appointment'
	m_principal.m_stat.m_consultation.m_consbasefact.text = 'Consult based on invoicing'
	m_principal.m_stat.m_mstatuts.m_statutpat.text = 'Status by patient'
	m_principal.m_stat.m_mstatuts.m_patstatuts.text = 'Patient by status'
	m_principal.m_stat.m_mstatuts.m_rapporannuelstatuts.text = 'Annual report status'
	m_principal.m_stat.m_mstatuts.m_rapportannueletatsdoss.text = 'Monthly report'
	m_principal.m_stat.m_mfinances.text = 'Financials'
	m_principal.m_stat.m_mfinances.m_productivitecomparative.text = 'Compared productivity'
	m_principal.m_stat.m_mfinances.m_statprod.text = "Productivity stats"
	m_principal.m_stat.m_mfinances.m_listetraitement.text = "Treatment list"
	m_principal.m_stat.m_mfinances.m_historiquefinancier.text = 'Financial history'
	
	m_principal.m_stat.m_employees.m_feuillesdetemps.text = "Employee time sheets"
	
	m_principal.m_stat.m_corresp.text = "Correspondence"
	m_principal.m_stat.m_corresp.m_listdocnonbarre.text = "Unsigned document list"
	
	m_principal.m_parametres.text = 'Parameters'
	m_principal.m_parametres.m_comp.m_listestatuts.text = 'Billing status'
	m_principal.m_parametres.m_dosspat.m_familles.text = 'Siblings'
	m_principal.m_parametres.m_comp.m_etatpat.text = "Patient's file status"
	m_principal.m_parametres.m_corr.m_plantrait.text = 'Treatment plan'
	m_principal.m_parametres.m_corr.m_sujet.text = 'Subject'
	m_principal.m_parametres.m_corr.m_intro-conc.text = 'Intro-Concl'
	m_principal.m_parametres.m_corr.m_condtrait.text = 'Treatment Condition'
	m_principal.m_parametres.m_dosspat.text = 'Patient file'
	m_principal.m_parametres.m_dosspat.m_activites.text = 'Activity'
	m_principal.m_parametres.m_dosspat.m_satellites.text = 'Satellite'
	m_principal.m_parametres.m_comp.text = 'Accounting'
	m_principal.m_parametres.m_horaire0.text = 'Schedule'
	m_principal.m_parametres.m_horaire0.m_typestrait.text = 'Procedure list for schedule'
	m_principal.m_parametres.m_horaire0.m_typesrappels.text = 'Types of reccals'
	m_principal.m_parametres.m_horaire0.m_procedures.text = 'Grouping of procedures'
	m_principal.m_parametres.m_corr.text = 'Correspondence'
	m_principal.m_parametres.m_corr.m_typecontact.text = 'Contact list'
	m_principal.m_parametres.m_corr.m_contrat.text = 'Contract type'
	m_principal.m_parametres.m_comp.m_typephase.text = 'Phase type'
	m_principal.m_parametres.m_listespeciality.text = 'List of speciality'
	m_principal.m_parametres.m_corr.m_typesal.text = 'Salutation Type'
	m_principal.m_parametres.m_cartedetraitement.text = 'Treatment Chart'
	m_principal.m_parametres.m_cartedetraitement.m_categoriedephrases.text = 'Type of '
	m_principal.m_parametres.m_cartedetraitement.m_typesdappareils.text = 'Type of appliances'
	m_principal.m_parametres.m_cartedetraitement.m_instructiondappareil.text = 'appliances instruction'
	m_principal.m_parametres.m_cartedetraitement.m_typesderadiographies.text = 'Type of X-Rays'
	m_principal.m_parametres.m_cartedetraitement.m_typesdefils.text = 'Type of wires'
	m_principal.m_parametres.m_cartedetraitement.m_typematpourfil.text = 'Type of wires materials'
	m_principal.m_parametres.m_cartedetraitement.m_dureeelastiques.text = 'Type of elastics lenght'
	m_principal.m_parametres.m_cartedetraitement.m_forceselastiques.text = 'Type of forces'
	m_principal.m_parametres.m_cartedetraitement.m_typesdelastiques.text = 'Type of elastics'
	m_principal.m_parametres.m_cartedetraitement.m_typesdempreintes.text = 'Type of impressions'
	
	m_principal.m_fonctionscomptable.text = 'Accounting fonction'
	
	
	m_principal.m_fonctionscomptable.m_dossfin.text = 'Financial file'
	m_principal.m_fonctionscomptable.m_dossfin.ToolbarItemText = 'Financial file'
	m_principal.m_fonctionscomptable.m_revenus.text = 'Revenu'
	m_principal.m_fonctionscomptable.m_revenus.m_journaldeshonoraires.text = 'Fee report'
	m_principal.m_fonctionscomptable.m_revenus.m_journaldeshonoraires.ToolbarItemText = 'Fee report'
	m_principal.m_fonctionscomptable.m_revenus.m_chquespostdats.text = 'Postdated cheques'
	m_principal.m_fonctionscomptable.m_revenus.m_chquespostdats.ToolbarItemText = 'Postdated cheques'
	m_principal.m_fonctionscomptable.m_revenus.m_journaldesencaissements.text = 'Daily register'
	m_principal.m_fonctionscomptable.m_revenus.m_journaldesencaissements.ToolbarItemText = 'Daily register'
	m_principal.m_fonctionscomptable.m_revenus.m_journaldesrevenus.text = 'Revenu report'
	m_principal.m_fonctionscomptable.m_revenus.m_jrevenuscomb.text = 'Combined revenu report'
	m_principal.m_fonctionscomptable.m_revenus.m_journaldesrevenus.ToolbarItemText = 'Revenu report'
	m_principal.m_fonctionscomptable.m_revenus.m_listecomparative.text = 'Compare list'
	m_principal.m_fonctionscomptable.m_revenus.m_listecomparative.ToolbarItemText = 'Compare list'
	m_principal.m_fonctionscomptable.m_revenus.m_listecompper.text = 'Periodic compare list'
	m_principal.m_fonctionscomptable.m_revenus.m_listecompper.ToolbarItemText = 'Periodic compare list'
	
	m_principal.m_fonctionscomptable.m_depots.text = 'Deposit'
	m_principal.m_fonctionscomptable.m_depots.m_depotlot.text = 'Lot'
	m_principal.m_fonctionscomptable.m_depots.m_journaldepot.text = 'Deposit report'
	m_principal.m_fonctionscomptable.m_depots.m_journaldepot.ToolbarItemText = 'Deposit report'
	m_principal.m_fonctionscomptable.m_depots.m_journaldepotscompact.text = 'Compact deposit report'
	m_principal.m_fonctionscomptable.m_depots.m_journaldepotscpd.text = 'Deposit journal for PDC'
	m_principal.m_fonctionscomptable.m_recevables.text = 'Receivale'
	m_principal.m_fonctionscomptable.m_recevables.m_comptesrecevables.text = 'Receivable account'
	m_principal.m_fonctionscomptable.m_recevables.m_comptesrecevables.ToolbarItemText = 'Recevable account'
	m_principal.m_fonctionscomptable.m_recevables.m_comptesrecsoldeant.text = 'Forward balance acc. receivable'
	m_principal.m_fonctionscomptable.m_recevables.m_comptesrecsoldeant.ToolbarItemText = 'Forward balance acc. receivable'
	m_principal.m_fonctionscomptable.m_recevables.m_agedescomptes.Text = 'Aged of accounts'
	m_principal.m_fonctionscomptable.m_recevables.m_etatdecompte.text = 'Account status'
	m_principal.m_fonctionscomptable.m_recevables.m_comptepercevoir.text = 'To collect list'
	m_principal.m_fonctionscomptable.m_recevables.m_comptesclients.text = 'Clients account'
	m_principal.m_fonctionscomptable.m_recevables.m_comptesclients.ToolbarItemText = 'Clients account'
	m_principal.m_fonctionscomptable.m_recevables.m_paiementsouffrance.text = 'Payment due report'
	m_principal.m_fonctionscomptable.m_recevables.m_paiementsouffrance.ToolbarItemText = 'Payment due report'
	
	m_principal.m_fonctionscomptable.m_pourc.m_entrer.text = 'Enter %'
	m_principal.m_fonctionscomptable.m_pourc.m_entrer.ToolbarItemText = 'Enter %'
	m_principal.m_fonctionscomptable.m_pourc.m_pourcentages.text = '%'
	m_principal.m_fonctionscomptable.m_pourc.m_pourcentages.ToolbarItemText = '%'
	m_principal.m_fonctionscomptable.m_rapports.text = 'Report'
	m_principal.m_fonctionscomptable.m_rapports.m_taxform.text = 'Tax form'
	m_principal.m_fonctionscomptable.m_rapports.m_raptrait.text = 'Treatment report'
	m_principal.m_fonctionscomptable.m_rapports.m_nonzerobalance.text = 'Aged accounts receivable report'
	m_principal.m_fonctionscomptable.m_rapports.m_nonzerodueamount.text = 'WEEKLY REPORT'
	m_principal.m_fonctionscomptable.m_rapports.m_rapportdumois.text = 'MONTHLY REPORT'
	m_principal.m_fonctionscomptable.m_rapports.m_rapportnsf.text = 'Payment Report'
	m_principal.m_fonctionscomptable.m_rapports.m_rappcred.text = 'Credit Report'
	
	m_principal.m_couleurs.text = 'Colors'
	m_principal.m_util.text = 'Tools'
	m_principal.m_util.m_imprecusauto.text = 'Automatic printing of receipts'
	m_principal.m_util.m_impformulaires.text = 'Printing of insurance forms'
	m_principal.m_util.m_fournisseurs.text = 'Suppliers'
	
	
	m_principal.m_config.text = 'Configuration'
	m_principal.m_config.m_optionspersonnel.text = "Personnal options"
	m_principal.m_config.m_autoupdate.text = 'Update'
	m_principal.m_config.m_nouveautes.text = 'What~'s New'
	m_principal.m_config.m_edit.text = 'Edit'
	m_principal.m_config.m_edit.m_entrerortho.text = 'Specialist information'
	m_principal.m_config.m_pwd.text = 'Password'
	m_principal.m_config.m_pwd.m_passsupppat.text = 'Password (delete patient)'
	m_principal.m_config.m_pwd.m_passlogon.text = 'Password (logon)'
	m_principal.m_config.m_pwd.m_passpaie.text = 'Password (payment)'
	m_principal.m_config.m_edit.m_couleurs0.text = 'Color management'
	m_principal.m_config.m_gestionimprimantes.text = 'Printer management'
	m_principal.m_config.m_edit.m_labeledit.text = "Label Setup"
	m_principal.m_util.m_exportacomba.text = 'Export'
	m_principal.m_util.m_systemedemessagerie.text = "Messaging System"
	m_principal.m_util.m_systemedemessagerie.m_boîtederéception.text = "Inbox"
	m_principal.m_util.m_exportationversorthocom.text = "Export to orthocom"
	m_principal.m_util.m_systemedemessagerie.m_ecrireunnouveaumessage.text = "New message"
	m_principal.m_apropos.text = 'About'
end if

// 2009-01-29 - Sébastien Tremblay
if gl_idpers = 0 then
	m_principal.m_app.m_cincout.enable()
end if

// gestion de la sécurité
security()

ls_softversion = gnv_app.of_getversion( )
select vertable into :ls_dbversion from t_ver;
w_etat.st_verprog.text = ls_softversion
w_etat.st_verbd.text = ls_dbversion

if v_langue = 'an' then
	w_etat.sle_status.text = 'Postdated cheque verification'
else
	w_etat.sle_status.text = 'Encaissement des chèques posdatés'
end if
OpenSheet(w_ajustement,w_principal,2,original!)

if v_langue = 'an' then
	w_etat.sle_status.text = 'Automatic receipt'
	w_etat.sle_status.text = 'ORTHOTEK is starting'
else
	w_etat.sle_status.text = 'Vérification des recus automatiques'
	w_etat.sle_status.text = 'Démarrage ORTHOTEK'
end if
OpenSheet(w_patient,w_principal,2,layered!)
if v_langue = 'an' then
	w_patient.title = "Opening main window"
else
	w_patient.title = "Ouverture de la fenêtre principale"
end if
close(w_etat)

end event

event close;f_close()
end event

type mdi_1 from mdiclient within w_principal
long BackColor=276856960
end type

