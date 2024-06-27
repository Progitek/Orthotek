$PBExportHeader$w_horaire.srw
forward
global type w_horaire from w_child
end type
type pb_2 from picturebutton within w_horaire
end type
type pb_1 from picturebutton within w_horaire
end type
type st_noteperm from statictext within w_horaire
end type
type st_notejourn from statictext within w_horaire
end type
type mle_noteperm from multilineedit within w_horaire
end type
type mle_notejourn from multilineedit within w_horaire
end type
type st_tooltip from statictext within w_horaire
end type
type dw_xls from datawindow within w_horaire
end type
type lb_trait from u_lb within w_horaire
end type
type cb_dim from commandbutton within w_horaire
end type
type cb_aug from commandbutton within w_horaire
end type
type pb_delete from picturebutton within w_horaire
end type
type tab_view from tab within w_horaire
end type
type tabpage_1 from userobject within tab_view
end type
type dw_hortrans from u_dw within tabpage_1
end type
type tabpage_1 from userobject within tab_view
dw_hortrans dw_hortrans
end type
type tabpage_lock from userobject within tab_view
end type
type cbx_lock from checkbox within tabpage_lock
end type
type tabpage_lock from userobject within tab_view
cbx_lock cbx_lock
end type
type tabpage_note from userobject within tab_view
end type
type p_2 from picture within tabpage_note
end type
type dw_notehor from u_dw within tabpage_note
end type
type dw_hornotedate from datawindow within tabpage_note
end type
type tabpage_note from userobject within tab_view
p_2 p_2
dw_notehor dw_notehor
dw_hornotedate dw_hornotedate
end type
type tab_view from tab within w_horaire
tabpage_1 tabpage_1
tabpage_lock tabpage_lock
tabpage_note tabpage_note
end type
type pb_canceltrans from picturebutton within w_horaire
end type
type tab_1 from tab within w_horaire
end type
type tabpage_jumpweek from userobject within tab_1
end type
type pb_plus from picturebutton within tabpage_jumpweek
end type
type em_liste_nb from editmask within tabpage_jumpweek
end type
type pb_moins from picturebutton within tabpage_jumpweek
end type
type tabpage_jumpweek from userobject within tab_1
pb_plus pb_plus
em_liste_nb em_liste_nb
pb_moins pb_moins
end type
type tabpage_jumpday from userobject within tab_1
end type
type pb_dayr from picturebutton within tabpage_jumpday
end type
type em_day from editmask within tabpage_jumpday
end type
type pb_dayl from picturebutton within tabpage_jumpday
end type
type tabpage_jumpday from userobject within tab_1
pb_dayr pb_dayr
em_day em_day
pb_dayl pb_dayl
end type
type tab_1 from tab within w_horaire
tabpage_jumpweek tabpage_jumpweek
tabpage_jumpday tabpage_jumpday
end type
type pb_horsem from picturebutton within w_horaire
end type
type pb_tpl from picturebutton within w_horaire
end type
type pb_find from picturebutton within w_horaire
end type
type pb_printselection from picturebutton within w_horaire
end type
type pb_print from picturebutton within w_horaire
end type
type sle_day2 from statictext within w_horaire
end type
type sle_day from statictext within w_horaire
end type
type cb_today from commandbutton within w_horaire
end type
type cb_close from commandbutton within w_horaire
end type
type rb_pm from radiobutton within w_horaire
end type
type rb_am from radiobutton within w_horaire
end type
type ddlb_mois from dropdownlistbox within w_horaire
end type
type dw_info_patient_hor from u_dw within w_horaire
end type
type uo_1 from u_calendarhor within w_horaire
end type
type rr_fond from roundrectangle within w_horaire
end type
type dw_hor from u_dw within w_horaire
end type
end forward

global type w_horaire from w_child
string tag = "Horaire"
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string pointer = "Arrow!"
boolean ib_isupdateable = false
event ue_timer ( decimal ai_duree )
pb_2 pb_2
pb_1 pb_1
st_noteperm st_noteperm
st_notejourn st_notejourn
mle_noteperm mle_noteperm
mle_notejourn mle_notejourn
st_tooltip st_tooltip
dw_xls dw_xls
lb_trait lb_trait
cb_dim cb_dim
cb_aug cb_aug
pb_delete pb_delete
tab_view tab_view
pb_canceltrans pb_canceltrans
tab_1 tab_1
pb_horsem pb_horsem
pb_tpl pb_tpl
pb_find pb_find
pb_printselection pb_printselection
pb_print pb_print
sle_day2 sle_day2
sle_day sle_day
cb_today cb_today
cb_close cb_close
rb_pm rb_pm
rb_am rb_am
ddlb_mois ddlb_mois
dw_info_patient_hor dw_info_patient_hor
uo_1 uo_1
rr_fond rr_fond
dw_hor dw_hor
end type
global w_horaire w_horaire

type variables
public integer ic_cour, ii_arrow, ll_cour, ii_hordosspat,v_undo,ii_horlock, ii_chrgarret
public string is_lockuser,is_hormenuchoix1
private long il_scrollp = 0
public long il_patid, il_traitid, l_color, il_horidspec
public integer ii_startam,ii_endam,ii_startpm,ii_endpm,ii_step,ii_horaffpm,ii_nbcol
private integer ii_transdirect
private datetime idtt_horsync
private time v_refresh,it_time1
private decimal{2} id_timer = 1
private integer ii_written = 0 // indicateur d'ecriture ds l'horaire
private boolean ib_uptwrite = false
public long il_patlock = 0
s_pat is_pat
datastore ds_horam,ds_horpm
protected date id_dateold
//private pro_semaphore iuo_sem[10]
end variables

forward prototypes
public subroutine of_touchef1 ()
public subroutine of_touchef11 ()
public subroutine of_touchef2 ()
public subroutine of_touchef3 ()
public subroutine of_touchef4 ()
public subroutine of_touchef5 ()
public subroutine of_touchef6 ()
public subroutine of_touchef7 ()
public subroutine of_touchef9 ()
public subroutine of_touchef8 ()
public subroutine date_time ()
public subroutine del_rap_ret ()
public subroutine find_plage (date date_rv, time heure_rv)
public subroutine imp_couleur_select (long couleur)
public subroutine imphordetail ()
public subroutine affichage_creation ()
public subroutine horcol ()
public subroutine f_insert (datawindow dwo)
public subroutine detailspatient (integer row, string f_name)
public function string uf_insertrow (integer ai_row)
public subroutine doctortime (ref datawindow adw_hor, long al_row1, integer ai_duree, integer ai_col)
public function boolean f_affichage ()
public subroutine of_touchef10 ()
public subroutine of_touchef12 ()
public subroutine uf_refreshpatnom ()
public subroutine uf_affcolqty (long al_spec, date adt_date)
public subroutine uf_col (string as_colname, ref integer ai_col, ref string as_col)
public function s_pat uf_clearpat ()
public subroutine uf_setsync ()
public function boolean uf_validplage (s_pat astr_pat)
public function boolean uf_validtransfert (s_pat astr_pat)
public function boolean uf_isuser (s_pat astr_pat)
public function boolean uf_unlock ()
public function string uf_islock (date adt, integer ai_col)
public subroutine implistlabo (long al_couleur)
public subroutine deleterdv (long al_idpat, date adt, time at, integer ai_col)
public function long rappel (long al_patid)
public subroutine addrdv (long al_patid, long al_traitid, date adt_date, time at_heure, long al_duree, integer ai_colonne, long al_iduser, string as_demo, long al_rv, character ac_td[])
public subroutine f_applytpl ()
public subroutine implistetel (n_listcol auo_listcol)
end prototypes

event ue_timer(decimal ai_duree);timer(ai_duree,w_horaire)
end event

public subroutine of_touchef1 ();m_popup_horaire.m_choix.m_modrdv.event clicked()
	
end subroutine

public subroutine of_touchef11 ();m_popup_horaire.m_choix.m_retard.event clicked()
end subroutine

public subroutine of_touchef2 ();m_popup_horaire.m_choix.m_transfert.event clicked()
end subroutine

public subroutine of_touchef3 ();m_popup_horaire.m_choix.m_conf.event clicked()
end subroutine

public subroutine of_touchef4 ();m_popup_horaire.m_choix.m_memo.event clicked()
end subroutine

public subroutine of_touchef5 ();m_popup_horaire.m_choix.m_cin.event clicked()
end subroutine

public subroutine of_touchef6 ();m_popup_horaire.m_choix.m_cout.event clicked()
end subroutine

public subroutine of_touchef7 ();m_popup_horaire.m_choix.m_dosspat.event clicked()
end subroutine

public subroutine of_touchef9 ();m_popup_horaire.m_choix.m_rvm.event clicked()
end subroutine

public subroutine of_touchef8 ();m_popup_horaire.m_choix.m_rap.event clicked()
end subroutine

public subroutine date_time ();string n,j,m,a, ls_date
long ll_pos

if v_langue = 'fr' then
	choose case DayName(istr_cal.caldate)
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
	
	j = string(Day(istr_cal.caldate))
	
	choose case string(Month(istr_cal.caldate))
	case "1"
		m = "Janvier"
	case "2"
		m = "Février"
	case "3"
		m = "Mars"
	case "4"
		m = "Avril"
	case "5"
		m = "Mai"
	case "6"
		m = "Juin"
	case "7"
		m = "Juillet"
	case "8"
		m = "Août"
	case "9"
		m = "Septembre"
	case "10"
		m = "Octobre"
	case "11"
		m = "Novembre"
	case "12"
		m = "Décembre"
	end choose
	a = string(year(istr_cal.caldate))
	sle_day.text = n 
	sle_day2.text = j+" "+m+" "+a
else
	ls_date = datean(istr_cal.caldate)
	ll_pos = pos(ls_date," ")
	sle_day.text = left(ls_date,ll_pos)
	sle_day2.text = mid(ls_date,ll_pos,len(ls_date))
end if

end subroutine

public subroutine del_rap_ret ();w_liste_des_rappels_retentions.dw_rappel_retention.deleterow(message.doubleparm)
if w_liste_des_rappels_retentions.dw_rappel_retention.update() = 1 then	
	commit using SQLCA;
else
	rollback using SQLCA;
	error_type(50)
end if
end subroutine

public subroutine find_plage (date date_rv, time heure_rv);//string v_fin
//time v_heure_fin_am, v_heure_fin_pm
//int v_hor_fin_am, v_hor_fin_pm, v_hor_depart_pm
//
//SELECT hor_fin_am,hor_fin_pm into :v_hor_fin_am,:v_hor_fin_pm from t_options where ortho_id = :v_no_ortho;
//v_fin = string(v_hor_fin_am) + ':55'
//v_heure_fin_am = time(v_fin)
//v_fin = string(v_hor_depart_pm) + ':00'
//v_heure_fin_pm = time(v_fin)
////Affichage et initialisation de variables
//uo_1.uf_initcal (date_rv)
//istr_cal.caldate = date_rv
//dw_hor.retrieve(istr_cal.caldate,v_no_ortho,v_heure_fin_am)
////dw_pm.retrieve(istr_cal.caldate,v_no_ortho,v_heure_fin_pm)
//ddlb_mois.selectitem(month(istr_cal.caldate))
////Mettre en évidence le rendez-vous
//if heure_rv < time("13:00")  then
//	dw_hor.scrolltorow(dw_am.find("heure="+string(heure_rv),1,dw_am.rowcount()))
//	dw_pm.visible=false
//	dw_am.visible=true
//	rb_am.checked=true
//	dw_am.setfocus()
//else
//	dw_pm.scrolltorow(dw_pm.find("heure="+string(heure_rv),1,dw_pm.rowcount()))
//	dw_pm.visible=true
//	dw_am.visible=false
//	rb_pm.checked=true
//	dw_pm.setfocus()
//end if
//
end subroutine

public subroutine imp_couleur_select (long couleur);long id, nb_row, j, v_id_traitement, v_id_patient, v_check_cpd, v_couleur
long ll_patid[15], ll_coul[15], ll_duree[15], ll_noortho
integer i,li_duree,li_horcolnb
time v_heure_rv,lt_startam,lt_endam,lt_startpm,lt_endpm,lt_null, lt_heure
date v_date_rv, ldt_datecal
dec{2} v_montant_paye, v_montant_original

//********************************************************************
delete from horaire_patient_id;
//********************************************************************

v_date_rv = dw_hor.getitemdate(1,"datecal")
select horcolnb into :li_horcolnb from t_options where ortho_id = :v_no_ortho;
lt_startam = time(string(ii_startam)+':00')
lt_endam = time(string(ii_endam)+':55')
lt_startpm = time(string(ii_startpm)+':00')
lt_endpm = time(string(ii_endpm)+':55')

DECLARE listrdv CURSOR FOR
  SELECT horaire.datecal, 
  			horaire.patient_id_1,   
         horaire.patient_id_2,   
         horaire.patient_id_3,   
         horaire.patient_id_4,
			horaire.patient_id_5,
			horaire.patient_id_6,   
         horaire.patient_id_7,   
         horaire.patient_id_8,   
         horaire.patient_id_9,
			horaire.patient_id_10,
			horaire.patient_id_11,
			horaire.patient_id_12,
			horaire.patient_id_13,
			horaire.patient_id_14,
			horaire.patient_id_15,
			horaire.heure, 
			horaire.no_ortho,   
			horaire.couleur_text_1,   
			horaire.couleur_text_2,   
			horaire.couleur_text_3,   
			horaire.couleur_text_4, 
			horaire.couleur_text_5,
			horaire.couleur_text_6,   
			horaire.couleur_text_7,   
			horaire.couleur_text_8,   
			horaire.couleur_text_9, 
			horaire.couleur_text_10,   
			horaire.couleur_text_11,   
			horaire.couleur_text_12,   
			horaire.couleur_text_13,   
			horaire.couleur_text_14,   
			horaire.couleur_text_15,   
			horaire.duree1,
			horaire.duree2,
			horaire.duree3,
			horaire.duree4,
			horaire.duree5,
			horaire.duree6,
			horaire.duree7,
			horaire.duree8,
			horaire.duree9,
			horaire.duree10,
			horaire.duree11,
			horaire.duree12,
			horaire.duree13,
			horaire.duree14,
			horaire.duree15
	 FROM horaire  
	WHERE horaire.datecal = :v_date_rv AND  
			horaire.no_ortho = :v_no_ortho AND  
			((horaire.heure BETWEEN :lt_startam AND :lt_endam) OR
			(horaire.heure BETWEEN :lt_startpm AND :lt_endpm)) 
ORDER BY horaire.heure ASC;

OPEN listrdv;

FETCH listrdv INTO :ldt_datecal, 
  						 :ll_patid[1],   
         			 :ll_patid[2], 
          			 :ll_patid[3],   
        				 :ll_patid[4],
						 :ll_patid[5],
			          :ll_patid[6],  
                   :ll_patid[7],   
                   :ll_patid[8],   
                   :ll_patid[9],
						 :ll_patid[10],
						 :ll_patid[11],
						 :ll_patid[12],
						 :ll_patid[13],
						 :ll_patid[14],
						 :ll_patid[15],
						 :lt_heure, 
						 :ll_noortho,   
						 :ll_coul[1],   
			          :ll_coul[2],   
						 :ll_coul[3],  
			 			 :ll_coul[4], 
			          :ll_coul[5],
			          :ll_coul[6],  
			          :ll_coul[7],  
			          :ll_coul[8],   
						 :ll_coul[9],
			          :ll_coul[10],    
						 :ll_coul[11], 
						 :ll_coul[12], 
						 :ll_coul[13], 
						 :ll_coul[14], 
						 :ll_coul[15], 
						 :ll_duree[1],
						 :ll_duree[2],
						 :ll_duree[3],
						 :ll_duree[4],
						 :ll_duree[5],
						 :ll_duree[6],
						 :ll_duree[7],
						 :ll_duree[8],
						 :ll_duree[9],
						 :ll_duree[10],
						 :ll_duree[11],
						 :ll_duree[12],
						 :ll_duree[13],
						 :ll_duree[14],
						 :ll_duree[15];
						 
	DO WHILE SQLCA.SQLCode = 0
		
		
	//for j = 1 to nb_row
//	v_heure_rv = dw_hor.getitemtime(j,"heure")
	for i = 1 to li_horcolnb
		if ll_patid[i] > 0  and ll_coul[i] = couleur and ll_duree[i] > 0 then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise) values (:ll_patid[i],:lt_heure,:v_date_rv,:i);
		end if
	next
		
		FETCH listrdv INTO :ldt_datecal, 
  						 :ll_patid[1],   
         			 :ll_patid[2], 
          			 :ll_patid[3],   
        				 :ll_patid[4],
						 :ll_patid[5],
			          :ll_patid[6],  
                   :ll_patid[7],   
                   :ll_patid[8],   
                   :ll_patid[9],
						 :ll_patid[10],
						 :ll_patid[11],
						 :ll_patid[12],
						 :ll_patid[13],
						 :ll_patid[14],
						 :ll_patid[15],
						 :lt_heure, 
						 :ll_noortho,   
						 :ll_coul[1],   
			          :ll_coul[2],   
						 :ll_coul[3],  
			 			 :ll_coul[4], 
			          :ll_coul[5],
			          :ll_coul[6],  
			          :ll_coul[7],  
			          :ll_coul[8],   
						 :ll_coul[9],
			          :ll_coul[10],     
						 :ll_coul[11], 
						 :ll_coul[12], 
						 :ll_coul[13], 
						 :ll_coul[14], 
						 :ll_coul[15], 
						 :ll_duree[1],
						 :ll_duree[2],
						 :ll_duree[3],
						 :ll_duree[4],
						 :ll_duree[5],
						 :ll_duree[6],
						 :ll_duree[7],
						 :ll_duree[8],
						 :ll_duree[9],
						 :ll_duree[10],
						 :ll_duree[11],
						 :ll_duree[12],
						 :ll_duree[13],
						 :ll_duree[14],
						 :ll_duree[15];
		
	LOOP

CLOSE listrdv;




//w_horaire.event ue_timer(0)
//
//lt_startam = time(string(ii_startam)+':00')
//lt_endam = time(string(ii_endam)+':55')
//lt_startpm = time(string(ii_startpm)+':00')
//lt_endpm = time(string(ii_endpm)+':55')
//setnull(lt_null)
//
//dw_hor.retrieve(istr_cal.caldate,il_horidspec,lt_startam,lt_endpm,lt_null,lt_null)
////commit using sqlca;
//nb_row = dw_hor.rowcount()
//v_date_rv = dw_hor.getitemdate(1,"datecal")
//select horcolnb into :li_horcolnb from t_options where ortho_id = :v_no_ortho;
//for j = 1 to nb_row
//	v_heure_rv = dw_hor.getitemtime(j,"heure")
//	for i = 1 to li_horcolnb
//		li_duree = dw_hor.getitemnumber(j,"duree"+string(i))
//		v_id_patient = dw_hor.getitemnumber(j,"patient_id_"+string(i))
//		v_couleur = dw_hor.getitemnumber(j,"couleur_text_"+string(i))
//		if v_id_patient > 0 and v_couleur = couleur and li_duree > 0 then
//			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise) values (:v_id_patient,:v_heure_rv,:v_date_rv,:i);
//		end if
//	next
//next
//f_affichage()
//w_horaire.event ue_timer(id_timer)

//	LISTE TELEPHONIQUE imp selection *************************************************

datastore ds_prochain_cheque
ds_prochain_cheque = create datastore
ds_prochain_cheque.dataobject = 'd_prochain_cheque'
ds_prochain_cheque.SetTransObject(SQLCA)
datastore ds_imp_patient
ds_imp_patient = create datastore
ds_imp_patient.dataobject = "r_imp_patient"
ds_imp_patient.SetTransObject(SQLCA)
ds_imp_patient.retrieve(v_no_ortho)
commit using sqlca;
nb_row = ds_imp_patient.rowcount()
for j = 1 to nb_row
	v_id_patient = ds_imp_patient.getitemnumber(j,"patient_patient_id")
	Select check_cpd into :v_check_cpd from patient where patient_id = :v_id_patient;
	if v_check_cpd = 0 then
		Select distinct traitement_id into :v_id_traitement from traitements where patient_id = :v_id_patient order by traitement_id desc;
		Select montant_paye into :v_montant_paye from traitements where traitement_id = :v_id_traitement;
		Select montant_original into :v_montant_original from traitements where traitement_id = :v_id_traitement;
		ds_prochain_cheque.retrieve(v_id_traitement)
		commit using sqlca;
		if ds_prochain_cheque.getrow() > 0  then
			ds_imp_patient.SetItem(j,"patient_couleur_postdate",rgb(255,255,255))
		elseif v_montant_original - v_montant_paye > 0 then
			ds_imp_patient.SetItem(j,"patient_couleur_postdate",rgb(255,200,200))
		end if
	else
		ds_imp_patient.SetItem(j,"patient_couleur_postdate",rgb(255,255,255))
	end if
next
ds_imp_patient.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
gb_datawindow = false
openwithparm(w_print_options,ds_imp_patient)
destroy ds_imp_patient
destroy ds_prochain_cheque



end subroutine

public subroutine imphordetail ();long j,nb_row,v_id_patient,v_option
date v_date_rv
time v_heure_rv

datastore ds_horimpcond
ds_horimpcond = create datastore
ds_horimpcond.dataobject = "r_horimpcond"
if v_langue = 'an' then
	ds_horimpcond.modify("compute_3.expression =  '~"DETAIL SQUEDULE FOR : ~" +  ortho_id_dr_nom_complet '")
	ds_horimpcond.object.t_heure.text = 'Time'
	ds_horimpcond.object.t_chair.text = 'Chair'
	ds_horimpcond.object.t_patientname.text = 'Patient name'
	ds_horimpcond.object.t_trait.text = 'Treatment'
	ds_horimpcond.object.t_langue.text = 'Language'
	ds_horimpcond.object.t_printedon.text = 'Printed on'
	ds_horimpcond.object.t_age.text = "Age"
	ds_horimpcond.object.t_alerte.text = "Medical alert"
end if
ds_horimpcond.SetTransObject(SQLCA)
ds_horimpcond.retrieve(v_no_ortho)
commit using sqlca;
ds_horimpcond.object.t_date.text = sle_day.text
ds_horimpcond.print()
destroy ds_horimpcond
end subroutine

public subroutine affichage_creation ();long m, h, v, w, ll_horcree
string ls_nom, ls_fin
time lt_heure, lt_heurefinam, lt_heurefinpm
int li_option

//pour obtenir la couleur de fond de base
setnull(w)
// Vérification s'il y a des modifications dans les 2 DW
//if change then
//	sauve()
//end if
// Déterminer la date et ajuster dropdown listbox month
ddlb_mois.selectitem(month(istr_cal.caldate))
ls_fin = string(ii_endam) + ':55'
lt_heurefinam = time(ls_fin)
ls_fin = string(ii_endpm) + ':00'
lt_heurefinpm = time(ls_fin)
// verif option hor_aff_pm
select hor_aff_pm into :li_option from t_options;
// Créer les enregistrements si necessaire
select count(1) into :ll_horcree from horaire where datecal = :istr_cal.caldate and no_ortho = :il_horidspec;
if ll_horcree = 0 then
	CHOOSE CASE ii_step
	CASE 5
		for h=ii_startam to ii_endam
			for m=0 to 55 step 5
				lt_heure=time(string(h)+":"+string(m))
				ls_nom=''
				insert into horaire (datecal,heure,patient_nom_1,patient_nom_2,patient_nom_3,patient_nom_4,patient_nom_5,patient_nom_6,patient_nom_7,patient_nom_8,patient_nom_9,patient_nom_10,patient_nom_11,patient_nom_12,patient_nom_13,patient_nom_14,patient_nom_15, &
				patient_id_1,patient_id_2,patient_id_3,patient_id_4,patient_id_5,patient_id_6,patient_id_7,patient_id_8,patient_id_9,patient_id_10,patient_id_11,patient_id_12,patient_id_13,patient_id_14,patient_id_15,colortemplate1,colortemplate2,colortemplate3, &
				colortemplate4,colortemplate5,colortemplate6,colortemplate7,colortemplate8,colortemplate9,colortemplate10,colortemplate11,colortemplate12,colortemplate13,colortemplate14,colortemplate15,no_ortho)
				values (:istr_cal.caldate,:lt_heure,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:il_horidspec);
			next
		next 
		if li_option = 1 then
			for h=ii_startpm to ii_endpm
				for m=0 to 55 step 5
					lt_heure=time(string(h)+":"+string(m))
					ls_nom=''
					insert into horaire (datecal,heure,patient_nom_1,patient_nom_2,patient_nom_3,patient_nom_4,patient_nom_5,patient_nom_6,patient_nom_7,patient_nom_8,patient_nom_9,patient_nom_10,patient_nom_11,patient_nom_12,patient_nom_13,patient_nom_14,patient_nom_15, &
					patient_id_1,patient_id_2,patient_id_3,patient_id_4,patient_id_5,patient_id_6,patient_id_7,patient_id_8,patient_id_9,patient_id_10,patient_id_11,patient_id_12,patient_id_13,patient_id_14,patient_id_15,colortemplate1,colortemplate2,colortemplate3, &
					colortemplate4,colortemplate5,colortemplate6,colortemplate7,colortemplate8,colortemplate9,colortemplate10,colortemplate11,colortemplate12,colortemplate13,colortemplate14,colortemplate15,no_ortho)
					values (:istr_cal.caldate,:lt_heure,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:il_horidspec);
				next
			next 
		end if
		commit;
	CASE 10
		for h=ii_startam to ii_endam
			for m=0 to 50 step 10
				lt_heure=time(string(h)+":"+string(m))
				ls_nom=''
				insert into horaire (datecal,heure,patient_nom_1,patient_nom_2,patient_nom_3,patient_nom_4,patient_nom_5,patient_nom_6,patient_nom_7,patient_nom_8,patient_nom_9,patient_nom_10,patient_nom_11,patient_nom_12,patient_nom_13,patient_nom_14,patient_nom_15, &
				patient_id_1,patient_id_2,patient_id_3,patient_id_4,patient_id_5,patient_id_6,patient_id_7,patient_id_8,patient_id_9,patient_id_10,patient_id_11,patient_id_12,patient_id_13,patient_id_14,patient_id_15,colortemplate1,colortemplate2,colortemplate3, &
				colortemplate4,colortemplate5,colortemplate6,colortemplate7,colortemplate8,colortemplate9,colortemplate10,colortemplate11,colortemplate12,colortemplate13,colortemplate14,colortemplate15,no_ortho)
				values (:istr_cal.caldate,:lt_heure,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:il_horidspec);
			next
		next 
		if li_option = 1 then
			for h=ii_startpm to ii_endpm
				for m=0 to 50 step 10
					lt_heure=time(string(h)+":"+string(m))
					ls_nom=''
					insert into horaire (datecal,heure,patient_nom_1,patient_nom_2,patient_nom_3,patient_nom_4,patient_nom_5,patient_nom_6,patient_nom_7,patient_nom_8,patient_nom_9,patient_nom_10,patient_nom_11,patient_nom_12,patient_nom_13,patient_nom_14,patient_nom_15, &
					patient_id_1,patient_id_2,patient_id_3,patient_id_4,patient_id_5,patient_id_6,patient_id_7,patient_id_8,patient_id_9,patient_id_10,patient_id_11,patient_id_12,patient_id_13,patient_id_14,patient_id_15,colortemplate1,colortemplate2,colortemplate3, &
					colortemplate4,colortemplate5,colortemplate6,colortemplate7,colortemplate8,colortemplate9,colortemplate10,colortemplate11,colortemplate12,colortemplate13,colortemplate14,colortemplate15,no_ortho)
					values (:istr_cal.caldate,:lt_heure,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:il_horidspec);
				next
			next 
		end if
		commit;
	
	CASE 15
		for h=ii_startam to ii_endam
			for m=0 to 45 step 15
				lt_heure=time(string(h)+":"+string(m))
				ls_nom=''
				insert into horaire (datecal,heure,patient_nom_1,patient_nom_2,patient_nom_3,patient_nom_4,patient_nom_5,patient_nom_6,patient_nom_7,patient_nom_8,patient_nom_9,patient_nom_10,patient_nom_11,patient_nom_12,patient_nom_13,patient_nom_14,patient_nom_15, &
				patient_id_1,patient_id_2,patient_id_3,patient_id_4,patient_id_5,patient_id_6,patient_id_7,patient_id_8,patient_id_9,patient_id_10,patient_id_11,patient_id_12,patient_id_13,patient_id_14,patient_id_15,colortemplate1,colortemplate2,colortemplate3, &
				colortemplate4,colortemplate5,colortemplate6,colortemplate7,colortemplate8,colortemplate9,colortemplate10,colortemplate11,colortemplate12,colortemplate13,colortemplate14,colortemplate15,no_ortho)
				values (:istr_cal.caldate,:lt_heure,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:il_horidspec);
			next
		next 
		if li_option = 1 then
			for h=ii_startpm to ii_endpm
				for m=0 to 45 step 15
					lt_heure=time(string(h)+":"+string(m))
					ls_nom=''
					insert into horaire (datecal,heure,patient_nom_1,patient_nom_2,patient_nom_3,patient_nom_4,patient_nom_5,patient_nom_6,patient_nom_7,patient_nom_8,patient_nom_9,patient_nom_10,patient_nom_11,patient_nom_12,patient_nom_13,patient_nom_14,patient_nom_15, &
					patient_id_1,patient_id_2,patient_id_3,patient_id_4,patient_id_5,patient_id_6,patient_id_7,patient_id_8,patient_id_9,patient_id_10,patient_id_11,patient_id_12,patient_id_13,patient_id_14,patient_id_15,colortemplate1,colortemplate2,colortemplate3, &
					colortemplate4,colortemplate5,colortemplate6,colortemplate7,colortemplate8,colortemplate9,colortemplate10,colortemplate11,colortemplate12,colortemplate13,colortemplate14,colortemplate15,no_ortho)
					values (:istr_cal.caldate,:lt_heure,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,:ls_nom,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:il_horidspec);
				next
			next 
		end if
		commit;
	CASE ELSE
		error_type(60)
	END CHOOSE
end if
// Afficher les informations

f_applytpl()
f_affichage()
dw_hor.SetFocus()
date_time()
end subroutine

public subroutine horcol ();integer li_horpers
string ls_c1,ls_c2,ls_c3,ls_c4,ls_c5,ls_c6,ls_c7,ls_c8,ls_c9,ls_c10,ls_c11,ls_c12,ls_c13,ls_c14,ls_c15

select horcolpers,horcol1,horcol2,horcol3,horcol4,horcol5,horcol6,horcol7,horcol8,horcol9,horcol10,horcol11,horcol12,horcol13,horcol14,horcol15 into 
:li_horpers,:ls_c1,:ls_c2,:ls_c3,:ls_c4,:ls_c5,:ls_c6,:ls_c7,:ls_c8,:ls_c9,:ls_c10,:ls_c11,:ls_c12,:ls_c13,:ls_c14,:ls_c15 from t_options where ortho_id = :il_horidspec;

if isnull(ls_c1) = false then dw_hor.object.t_1.text = ls_c1
if isnull(ls_c2) = false then dw_hor.object.t_2.text = ls_c2
if isnull(ls_c3) = false then dw_hor.object.t_3.text = ls_c3
if isnull(ls_c4) = false then dw_hor.object.t_4.text = ls_c4
if isnull(ls_c5) = false then dw_hor.object.t_5.text = ls_c5
if isnull(ls_c6) = false then dw_hor.object.t_6.text = ls_c6
if isnull(ls_c7) = false then dw_hor.object.t_7.text = ls_c7
if isnull(ls_c8) = false then dw_hor.object.t_8.text = ls_c8
if isnull(ls_c9) = false then dw_hor.object.t_9.text = ls_c9
if isnull(ls_c10) = false then dw_hor.object.t_10.text = ls_c10
if isnull(ls_c11) = false then dw_hor.object.t_11.text = ls_c11
if isnull(ls_c12) = false then dw_hor.object.t_12.text = ls_c12
if isnull(ls_c13) = false then dw_hor.object.t_13.text = ls_c13
if isnull(ls_c14) = false then dw_hor.object.t_14.text = ls_c14
if isnull(ls_c15) = false then dw_hor.object.t_15.text = ls_c15

end subroutine

public subroutine f_insert (datawindow dwo);long row,enr, ll_idhortrans, ll_rv
int li_nbrow, v_incrow, i, li_inc, li_result,li_nbhortrans
string patient, ls_patnom, ls_traitnom, ls_col, ls_ortho, ls_nodoss, ls_dt
int li_trans
s_pat lstr_pat,lstr_empty, lstr_pattrans

//it_time1 = now()

w_horaire.event ue_timer(0)
lstr_empty = uf_clearpat()
row = dwo.getrow()
lstr_pat.datecal = dwo.getitemdate(row,'datecal')
lstr_pat.heure = dwo.getitemtime(row,'heure')
uf_col(dwo.getcolumnname(),lstr_pat.col,ls_col)
lstr_pat.memo = dwo.getItemString(row,'memo' + ls_col)

if ls_col = '' then return

// vérification si il y a des patients a transférer
select count(*) into :li_nbhortrans from t_hortrans where idpers = :gl_idpers;
if li_nbhortrans > 1 then
	if error_type(256) = 1 then li_trans = 1
elseif li_nbhortrans = 1 then
	if ii_transdirect = 1 then
		li_trans = 1
	else
		li_trans = error_type(257)
	end if
else
	li_trans = 2
end if

if li_trans = 1 then
	// vérification si la plage est barré
	if len(uf_islock(lstr_pat.datecal,lstr_pat.col)) > 1 then
		error_type(115)
		w_horaire.event ue_timer(id_timer)
		return
	end if
	if li_nbhortrans > 1 then
		open(w_hortrans)
		ll_idhortrans = message.doubleparm
	else
		select id_hortrans into :ll_idhortrans from t_hortrans where idpers = :gl_idpers;
	end if
	// retrouver les informations et les placer ds la structure
	select patid,id_specialist,idtrait,backcolor,memo,duree,iduser,dt,rv_id
	into :lstr_pat.patid,:lstr_pat.idspec,:lstr_pat.traitid,:lstr_pat.backcolor,:lstr_pat.memo,:lstr_pat.duree,:lstr_pat.idpers,:lstr_pat.dt[1],:ll_rv
	from t_hortrans
	where id_hortrans = :ll_idhortrans;
	i = 1
	declare cur cursor for
		select patnom,dt
		from	 t_hortransrow
		where  id_hortrans = :ll_idhortrans
		order by ligne asc;
	open cur;

	fetch cur into :ls_patnom,:ls_dt;

	do while sqlca.sqlcode = 0
		lstr_pat.l[i] = ls_patnom
		lstr_pat.dt[i + 1] = ls_dt
		i++
		fetch cur into :ls_patnom,:ls_dt;
	loop
	
	close cur;
	//verifier si le rdv est possible avec l'employé désiré
	if not w_horaire.uf_isuser(lstr_pat) then
		error_type(189)
		w_horaire.event ue_timer(id_timer)
		return
	end if
	//balayer la plage pour verification
	if uf_validplage(lstr_pat) then
		//inserer les informations
		if dw_hor.event ue_update(lstr_pat) then
			commit using sqlca;
			addrdv(lstr_pat.patid,lstr_pat.traitid,lstr_pat.datecal,lstr_pat.heure,lstr_pat.duree,lstr_pat.col,lstr_pat.idpers,lstr_pat.memo,ll_rv,lstr_pat.dt)
			//enlever l'ancien rdv de l'horaire
			select datecal,heure,col
			into :lstr_pat.datecal,:lstr_pat.heure,:lstr_pat.col 
			from t_hortrans 
			where id_hortrans = :ll_idhortrans;
			dw_hor.event ue_delete(lstr_pat,true)
			uf_setsync() // hor refresh
			
			delete from t_hortransrow where id_hortrans = :ll_idhortrans;
			delete from t_hortrans where id_hortrans = :ll_idhortrans;
		else
			rollback using sqlca;
			error_type(50)
		end if
	else
		if uf_validtransfert(lstr_pat) then
			lstr_pattrans = lstr_pat
			//enlever l'ancien rdv de l'horaire
			select datecal,heure,col
			into :lstr_pattrans.datecal,:lstr_pattrans.heure,:lstr_pattrans.col 
			from t_hortrans 
			where id_hortrans = :ll_idhortrans;
			dw_hor.event ue_delete(lstr_pattrans,true)
			delete from t_hortransrow where id_hortrans = :ll_idhortrans;
			delete from t_hortrans where id_hortrans = :ll_idhortrans;
			if dw_hor.event ue_update(lstr_pat) then
				commit using sqlca;
				addrdv(lstr_pat.patid,lstr_pat.traitid,lstr_pat.datecal,lstr_pat.heure,lstr_pat.duree,lstr_pat.col,lstr_pat.idpers,lstr_pat.memo,ll_rv,lstr_pat.dt)
				uf_setsync() // hor refresh
			else
				rollback using sqlca;
				error_type(50)
			end if
		else
			error_type(145)
			//debloquer plage
			uf_unlock()
			w_horaire.event ue_timer(id_timer)
			return
		end if
	end if
	tab_view.tabpage_1.dw_hortrans.event ue_retrieve()
elseif li_trans = 3 then
	select id_hortrans into :ll_idhortrans from t_hortrans where idpers = :gl_idpers;
	delete from t_hortransrow where id_hortrans = :ll_idhortrans;
	delete from t_hortrans where id_hortrans = :ll_idhortrans;
	tab_view.tabpage_1.dw_hortrans.event ue_retrieve()
else
 // ajouter rdv
	//vérification si la plage est barré
	if not len(uf_islock(lstr_pat.datecal,lstr_pat.col)) > 1 then
		// barre plage
		INSERT INTO t_horlock(ortho_id,hordate,col,id_personnel) VALUES (:il_horidspec,:lstr_pat.datecal,:lstr_pat.col,:gl_idpers);
		if error_type(-1) = 1 then
			commit using SQLCA;
		else
			rollback using SQLCA;
			error_type(50)
		end if
	else
		error_type(115)
		w_horaire.event ue_timer(id_timer)
		return
	end if
	if dwo.getitemnumber(row,'patient_id_'+ls_col) > 0 then
		il_patid = dwo.getitemnumber(row,'patient_id_'+ls_col)
		Opensheetwithparm(w_dossier_patients,il_patid,w_principal,2,layered!)
		w_dossier_patients.title = 'Dossier patient'
	else
		openwithparm(w_rech_patient,lstr_pat)
		lstr_pat = message.powerobjectparm
		if lstr_pat.duree > 0 then
//			//balayer la plage pour verification
			if not uf_validplage(lstr_pat) then
				error_type(145)
				uf_unlock() //debloquer plage
				w_horaire.event ue_timer(id_timer)
				return
			end if
			//inserer les informations
//			messagebox('lstr_pat.heure',string(lstr_pat.heure))
			if dw_hor.event ue_update(lstr_pat) then
				commit using sqlca;
				uf_setsync() // hor refresh
				il_patid = lstr_pat.patid
				addrdv(lstr_pat.patid,lstr_pat.traitid,lstr_pat.datecal,lstr_pat.heure,lstr_pat.duree,lstr_pat.col,lstr_pat.idpers,lstr_pat.memo,rappel(lstr_pat.patid),lstr_pat.dt)
			else
				rollback using sqlca;
				error_type(50)
			end if
		end if
	end if
end if
if isvalid(w_liste_des_rappels_retentions) then
	w_liste_des_rappels_retentions.dw_rappel_retention.event ue_retrieve()
end if
uf_unlock()
w_horaire.event ue_timer(id_timer)
end subroutine

public subroutine detailspatient (integer row, string f_name);long ll_idpat,ll_idtrait,ll_idcurrent, ll_idrdv, ll_idpers
integer li_col,fh,li_duree,li_qtecpd
dec{2} ld_totfact,ld_totpaye,ld_montantdu,ld_frais,ld_solde,ld_totcpd,ld_lastpaie
string ls_col,v_trait,txtname,ls_nodoss,ls_note, ls_nompers
date ldt_lastpaie
blob emp_pic
time lt_heure
date ldt_date

//p_1.visible = false
if row > 0 then
	uf_col(f_name,li_col,ls_col)
	ll_idpat = dw_hor.getitemnumber(row,'patient_id_'+ls_col)
	if ll_idpat > 0 then
		dw_info_patient_hor.visible = true
		dw_info_patient_hor.retrieve(ll_idpat)
		commit using sqlca;
		ll_idtrait = dw_hor.getitemnumber(row,'traitementid'+ls_col)
		ldt_date = dw_hor.getitemdate(row,'datecal')
		lt_heure = dw_hor.getitemtime(row,'heure')
		
		select max(traitement_id) into :ll_idcurrent from traitements where patient_id = :ll_idpat;
		select sum(montant) into :ld_totfact from factures_traitements where traitement_id = :ll_idcurrent and date_facture <= today();
		if isnull(ld_totfact) then ld_totfact = 0
 		select sum(montant_recu) into :ld_totpaye from paiement where traitement_patient_id = :ll_idcurrent;
		if isnull(ld_totpaye) then ld_totpaye = 0
		ld_montantdu = ld_totfact - ld_totpaye    
      select sum(montant) into :ld_frais from factures_traitements where traitement_id = :ll_idcurrent;
		if isnull(ld_frais) then ld_frais = 0
		ld_solde = ld_frais - ld_totpaye
		
		
		select count(*) into :li_qtecpd from cheques_postdates where traitement_patient_id = :ll_idcurrent and indicateur <> '1';
		if isnull(li_qtecpd) then li_qtecpd = 0
		select sum(paiement) into :ld_totcpd from cheques_postdates where traitement_patient_id = :ll_idcurrent and indicateur <> '1';
		if isnull(ld_totcpd) then ld_totcpd = 0
		select note into :ls_note from patient where patient_id = :ll_idpat;
		ls_note = rep(ls_note,'"','~~~"')
	
		SELECT FIRST paiement.date_paiement,   
         			 paiement.montant_recu
	 			  INTO :ldt_lastpaie,:ld_lastpaie
   			  FROM paiement
  				 WHERE paiement.traitement_patient_id = :ll_idcurrent   
			 ORDER BY paiement.date_paiement DESC,
						 paiement.paiement_id DESC;
						 
		dw_info_patient_hor.object.t_lastpaie.text = string(ld_lastpaie) + ' $'
		dw_info_patient_hor.object.t_lastpaiedate.text = string(ldt_lastpaie)
		dw_info_patient_hor.object.t_frais.text = string(ld_frais) + ' $'
		dw_info_patient_hor.object.t_totfact.text = string(ld_totfact) + ' $'
		dw_info_patient_hor.object.t_totpaie.text = string(ld_totpaye) + ' $'
		if ld_montantdu > 0 then
			dw_info_patient_hor.object.t_montantdu.color = rgb(255,0,0)
		else
			dw_info_patient_hor.object.t_montantdu.color = 0
		end if
		dw_info_patient_hor.object.t_montantdu.text = string(ld_montantdu) + ' $'
		dw_info_patient_hor.object.t_solde.text = string(ld_solde) + ' $'
		dw_info_patient_hor.object.t_qtecpd.text = string(li_qtecpd)
		dw_info_patient_hor.object.t_totcpd.text = string(ld_totcpd) + ' $'
		dw_info_patient_hor.object.t_note.text = ls_note
		dw_info_patient_hor.object.t_age.text = calculage(dw_info_patient_hor.getitemdate(1,'date_naissance'))
			
		
//		messagebox('',ls_note)
		// info pour test
		li_duree = dw_hor.getitemnumber(row,'duree'+ls_col)
		if li_duree > 0 then
			// personnel
			select id_personnel into :ll_idpers 
			from t_rdv 
			where rdvdate = :ldt_date and
					rdvheure = :lt_heure and
					ortho_id = :il_horidspec and
					colonne = :li_col and
					patient_id = :ll_idpat;
			select nom + ' ' + prenom into :ls_nompers from t_personnels where id_personnel = :ll_idpers;
			dw_info_patient_hor.object.t_pers.text = ls_nompers
		else
			dw_info_patient_hor.object.t_pers.text = ""
		end if
//		ll_traitid = dw_hor.getitemnumber(row,'traitementid'+ls_col)
		ls_nodoss = dw_hor.getitemstring(row,'no_dossier'+ls_col)
		dw_info_patient_hor.object.t_duree.text = string(li_duree)
		dw_info_patient_hor.object.t_traitid.text = string(ll_idtrait)
		dw_info_patient_hor.object.t_nodoss.text = ls_nodoss
		dw_info_patient_hor.object.t_patid.text = string(ll_idpat)
//		dw_info_patient_hor.object.t_duree.text = string(li_duree)
		//
		
		select nom_traitement into :v_trait from type_de_traitement where type_traitement_id = :ll_idtrait and ortho_id = :v_no_ortho;
		dw_info_patient_hor.object.t_traitement.text = v_trait
		//photo
		string ls_nodos,ls_path,ls_fs,ls_f,ls_lat,ls_ro,ls_anto,ls_lo,ls_upo,ls_lowo
		select chemphoto into :ls_path from t_options where ortho_id = :v_no_ortho;
		select new_dossier into :ls_nodos from patient where patient_id = :ll_idpat;
		select front_smile into :ls_fs from t_imaging where patient_id = :ll_idpat and type = 1;
		ls_path = ls_path + '\' + ls_nodos + '\1\'
		if DirectoryExists(ls_path) then
			if isnull(ls_fs) = false then
//				p_1.visible = true
//				p_1.event ue_insertpicture(ls_path + ls_fs)
			else
//				p_1.event destructor()
			end if
		else
//			p_1.event destructor()
		end if
	else
		dw_info_patient_hor.visible = false
//		p_1.visible = false
	end if
else
	dw_info_patient_hor.visible = false
end if


end subroutine

public function string uf_insertrow (integer ai_row);//string ls_char = 'X'
//
//choose case ai_row
//	case 2
//		if isnull(is_pat.l2) or is_pat.l2 = '' then is_pat.l2 = ls_char
//		return is_pat.l2
//		SetNull(is_pat.l2)
//	case 3
//		if isnull(is_pat.l3) or is_pat.l3 = '' then is_pat.l3 = ls_char
//		return is_pat.l3
//		SetNull(is_pat.l3)
//	case 4
//		if isnull(is_pat.l4) or is_pat.l4 = '' then is_pat.l4 = ls_char
//		return is_pat.l4
//		SetNull(is_pat.l4)
//	case 5
//		if isnull(is_pat.l5) or is_pat.l5 = '' then is_pat.l5 = ls_char
//		return is_pat.l5
//		SetNull(is_pat.l5)
//	case 6
//		if isnull(is_pat.l6) or is_pat.l6 = '' then is_pat.l6 = ls_char
//		return is_pat.l6
//		SetNull(is_pat.l6)
//	case 7
//		if isnull(is_pat.l7) or is_pat.l7 = '' then is_pat.l7 = ls_char
//		return is_pat.l7
//		SetNull(is_pat.l7)
//	case 8
//		if isnull(is_pat.l8) or is_pat.l8 = '' then is_pat.l8 = ls_char
//		return is_pat.l8
//		SetNull(is_pat.l8)
//	case 9
//		if isnull(is_pat.l9) or is_pat.l9 = '' then is_pat.l9 = ls_char
//		return is_pat.l9
//		SetNull(is_pat.l9)
//	case 10
//		if isnull(is_pat.l10) or is_pat.l10 = '' then is_pat.l10 = ls_char
//		return is_pat.l10
//		SetNull(is_pat.l10)
//	case 11
//		if isnull(is_pat.l11) or is_pat.l11 = '' then is_pat.l11 = ls_char
//		return is_pat.l11
//		SetNull(is_pat.l11)
//	case 12
//		if isnull(is_pat.l12) or is_pat.l12 = '' then is_pat.l12 = ls_char
//		return is_pat.l12
//		SetNull(is_pat.l12)
//	case 13
//		if isnull(is_pat.l13) or is_pat.l13 = '' then is_pat.l13 = ls_char
//		return is_pat.l13
//		SetNull(is_pat.l13)
//	case 14
//		if isnull(is_pat.l14) or is_pat.l14 = '' then is_pat.l14 = ls_char
//		return is_pat.l14
//		SetNull(is_pat.l14)
//	case 15
//		if isnull(is_pat.l15) or is_pat.l15 = '' then is_pat.l15 = ls_char
//		return is_pat.l15
//		SetNull(is_pat.l15)
//	case 16
//		if isnull(is_pat.l16) or is_pat.l16 = '' then is_pat.l16 = ls_char
//		return is_pat.l16
//		SetNull(is_pat.l16)
//	case 17
//		if isnull(is_pat.l17) or is_pat.l17 = '' then is_pat.l17 = ls_char
//		return is_pat.l17
//		SetNull(is_pat.l17)
//	case 18
//		if isnull(is_pat.l18) or is_pat.l18 = '' then is_pat.l18 = ls_char
//		return is_pat.l18
//		SetNull(is_pat.l18)
//	case 19
//		if isnull(is_pat.l19) or is_pat.l19 = '' then is_pat.l19 = ls_char
//		return is_pat.l19
//		SetNull(is_pat.l19)
//	case 20
//		if isnull(is_pat.l20) or is_pat.l20 = '' then is_pat.l20 = ls_char
//		return is_pat.l20
//		SetNull(is_pat.l20)
//	case 21
//		if isnull(is_pat.l21) or is_pat.l21 = '' then is_pat.l21 = ls_char
//		return is_pat.l21
//		SetNull(is_pat.l21)
//	case 22
//		if isnull(is_pat.l22) or is_pat.l22 = '' then is_pat.l22 = ls_char
//		return is_pat.l22
//		SetNull(is_pat.l22)
//	case 23
//		if isnull(is_pat.l23) or is_pat.l23 = '' then is_pat.l23 = ls_char
//		return is_pat.l23
//		SetNull(is_pat.l23)
//	case 24
//		if isnull(is_pat.l24) or is_pat.l24 = '' then is_pat.l24 = ls_char
//		return is_pat.l24
//		SetNull(is_pat.l24)
//	case 25
//		if isnull(is_pat.l25) or is_pat.l25 = '' then is_pat.l25 = ls_char
//		return is_pat.l25
//		SetNull(is_pat.l25)
//	case 26
//		if isnull(is_pat.l26) or is_pat.l26 = '' then is_pat.l26 = ls_char
//		return is_pat.l26
//		SetNull(is_pat.l26)
//	case 27
//		if isnull(is_pat.l27) or is_pat.l27 = '' then is_pat.l27 = ls_char
//		return is_pat.l27
//		SetNull(is_pat.l27)
//	case 28
//		if isnull(is_pat.l28) or is_pat.l28 = '' then is_pat.l28 = ls_char
//		return is_pat.l28
//		SetNull(is_pat.l28)
//	case 29
//		if isnull(is_pat.l29) or is_pat.l29 = '' then is_pat.l29 = ls_char
//		return is_pat.l29
//		SetNull(is_pat.l29)
//	case 30
//		if isnull(is_pat.l30) or is_pat.l30 = '' then is_pat.l30 = ls_char
//		return is_pat.l30
//		SetNull(is_pat.l30)
//end choose
return '1'
end function

public subroutine doctortime (ref datawindow adw_hor, long al_row1, integer ai_duree, integer ai_col);string ls_dt[ ]
integer i,li_h1,li_d,li_h2

//cas dx
if w_horaire.is_pat.dt1 = 'd' then
	if integer(w_horaire.is_pat.dt2) > 0 then
		li_h1 = integer(w_horaire.is_pat.dt2)
		for i = 1 to li_h1
			ls_dt[i] = 'D'
		next
		for i = li_h1 + 1 to ai_duree
			ls_dt[i] = 'H'
		next
	else
		for i = 1 to ai_duree
			ls_dt[i] = 'D'
		next
	end if
//cas xdx
elseif w_horaire.is_pat.dt2 = 'd' and integer(w_horaire.is_pat.dt1) > 0 then
	if integer(w_horaire.is_pat.dt3) > 0 then
		li_h1 = integer(w_horaire.is_pat.dt1)
		li_h2 = integer(w_horaire.is_pat.dt3)
		for i = 1 to li_h1
			ls_dt[i] = 'H'
		next
		for i = li_h1 + 1 to (ai_duree - li_h2)
			ls_dt[i] = 'D'
		next
		for i = i to ai_duree
			ls_dt[i] = 'H'
		next
	else
		li_h1 = integer(w_horaire.is_pat.dt1) + 1
		for i = 1 to li_h1
			ls_dt[i] = 'H'
		next
		for i = li_h1 to ai_duree 
			ls_dt[i] = 'D'
		next
	end if
end if
//appliquer
if upperbound(ls_dt) > 0 then
	for i = 1 to ai_duree
		adw_hor.setitem(al_row1,"dt"+string(ai_col),ls_dt[i])
		al_row1 = al_row1 + 1
	next
end if
end subroutine

public function boolean f_affichage ();time lt_startam,lt_endam,lt_startpm,lt_endpm,lt_nil

idtt_horsync = datetime(today(),now())

lt_startam = time(string(ii_startam)+':00')
lt_endam = time(string(ii_endam)+':55')
lt_startpm = time(string(ii_startpm)+':00')
lt_endpm = time(string(ii_endpm)+':55')
uf_refreshpatnom()

SetNull(lt_nil)
if not ii_horaffpm = 1 then
	if dw_hor.retrieve(istr_cal.caldate,il_horidspec,lt_startam,lt_endam,lt_startpm,lt_endpm) > 0 then
		commit using SQLCA;
		if il_scrollp > 0 then 
			dw_hor.scrollToRow(dw_hor.rowCount())
			dw_hor.scrollToRow(il_scrollp)
			il_scrollp = 0
		end if
		uf_affcolqty(il_horidspec,istr_cal.caldate)
		return true
	else
		return false
	end if
elseif rb_am.checked then
	if dw_hor.retrieve(istr_cal.caldate,il_horidspec,lt_startam,lt_endam,lt_nil,lt_nil) > 0 then
		commit using SQLCA;
		uf_affcolqty(il_horidspec,istr_cal.caldate)
//		messagebox('it_time1',long(right(string(now(),'hh:mmssfff'),7)) - long(right(string(it_time1,'hh:mmssfff'),7)))
//		it_time1 = now()
//		w_principal.SetMicroHelp('PLAN : ' + string(secondsafter(it_time1,)))
		return true
	else
		return false
	end if
elseif rb_pm.checked then
	if dw_hor.retrieve(istr_cal.caldate,il_horidspec,lt_startpm,lt_endpm,lt_nil,lt_nil) > 0 then
		commit using SQLCA;
		uf_affcolqty(il_horidspec,istr_cal.caldate)
		return true
	else
		return false
	end if
end if
end function

public subroutine of_touchef10 ();m_popup_horaire.m_choix.m_rva.event clicked()
end subroutine

public subroutine of_touchef12 ();m_popup_horaire.m_choix.m_labelrdv.event clicked()
end subroutine

public subroutine uf_refreshpatnom ();update horaire set patient_nom_1 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_1 and isnull(colonne,1) = 1),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_1) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_1 > 0 and duree1 > 0;
error_type(-1)
update horaire set patient_nom_2 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_2 and isnull(colonne,2) = 2),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_2) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_2 > 0 and duree2 > 0;
error_type(-1)
update horaire set patient_nom_3 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_3 and isnull(colonne,3) = 3),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_3) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_3 > 0 and duree3 > 0;
error_type(-1)
update horaire set patient_nom_4 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_4 and isnull(colonne,4) = 4),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_4) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_4 > 0 and duree4 > 0;
error_type(-1)
update horaire set patient_nom_5 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_5 and isnull(colonne,5) = 5),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_5) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_5 > 0 and duree5 > 0;
error_type(-1)
update horaire set patient_nom_6 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_6 and isnull(colonne,6) = 6),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_6) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_6 > 0 and duree6 > 0;
error_type(-1)
update horaire set patient_nom_7 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_7 and isnull(colonne,7) = 7),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_7) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_7 > 0 and duree7 > 0;
error_type(-1)
update horaire set patient_nom_8 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_8 and isnull(colonne,8) = 8),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_8) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_8 > 0 and duree8 > 0;
error_type(-1)
update horaire set patient_nom_9 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_9 and isnull(colonne,9) = 9),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_9) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_9 > 0 and duree9 > 0;
error_type(-1)
update horaire set patient_nom_10 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_10 and isnull(colonne,10) = 10),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_10) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_10 > 0 and duree10 > 0;
error_type(-1)
update horaire set patient_nom_11 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_11 and isnull(colonne,11) = 11),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_11) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_11 > 0 and duree11 > 0;
error_type(-1)
update horaire set patient_nom_12 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_12 and isnull(colonne,12) = 12),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_12) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_12 > 0 and duree12 > 0;
error_type(-1)
update horaire set patient_nom_13 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_13 and isnull(colonne,13) = 13),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_13) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_13 > 0 and duree13 > 0;
error_type(-1)
update horaire set patient_nom_14 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_14 and isnull(colonne,14) = 14),0) = 1 then '@' else '' endif || (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_14) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_14 > 0 and duree14 > 0;
error_type(-1)
update horaire set patient_nom_15 = if isnull((select isnull(envoyermail,0) from t_rdv where rdvdate = datecal and rdvheure = heure and patient_id = patient_id_15 and isnull(colonne,15) = 15),0) = 1 then '@' else '' endif ||  (select patient_nom + ', ' + patient_prenom from patient where patient_id = horaire.patient_id_15) where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and patient_id_15 > 0 and duree15 > 0;
error_type(-1)
commit using sqlca;
end subroutine

public subroutine uf_affcolqty (long al_spec, date adt_date);integer li_c1=0,li_c2=0,li_c3=0,li_c4=0,li_c5=0,li_c6=0,li_c7=0,li_c8=0,li_c9=0,li_c10=0,li_c11=0,li_c12=0,li_c13=0,li_c14=0,li_c15=0

select count(*) into :li_c1 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_1 > 0 and duree1 > 0;
select count(*) into :li_c2 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_2 > 0 and duree2 > 0;
select count(*) into :li_c3 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_3 > 0 and duree3 > 0;
select count(*) into :li_c4 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_4 > 0 and duree4 > 0;
select count(*) into :li_c5 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_5 > 0 and duree5 > 0;
select count(*) into :li_c6 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_6 > 0 and duree6 > 0;
select count(*) into :li_c7 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_7 > 0 and duree7 > 0;
select count(*) into :li_c8 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_8 > 0 and duree8 > 0;
select count(*) into :li_c9 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_9 > 0 and duree9 > 0;
select count(*) into :li_c10 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_10 > 0 and duree10 > 0;
select count(*) into :li_c11 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_11 > 0 and duree11 > 0;
select count(*) into :li_c12 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_12 > 0 and duree12 > 0;
select count(*) into :li_c13 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_13 > 0 and duree13 > 0;
select count(*) into :li_c14 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_14 > 0 and duree14 > 0;
select count(*) into :li_c15 from horaire where no_ortho = :al_spec and datecal = :adt_date and patient_id_15 > 0 and duree15 > 0;
w_principal.SetMicroHelp('Horaire nb. rdv total : '+string(li_c1+li_c2+li_c3+li_c4+li_c5+li_c6+li_c7+li_c8+li_c9+li_c10+li_c11+li_c12+li_c13+li_c14+li_c15)+'       C1 = '+string(li_c1)+' , C2 = '+string(li_c2)+' , C3 = '+string(li_c3)+' , C4 = '+string(li_c4)+' , C5 = '+string(li_c5)+' , C6 = '+string(li_c6)+' , C7 = '+string(li_c7)+' , C8 = '+string(li_c8)+' , C9 = '+string(li_c9)+' , C10 = '+string(li_c10)+' , C11 = '+string(li_c11)+' , C12 = '+string(li_c12)+' , C13 = '+string(li_c13)+' , C14 = '+string(li_c14)+' , C15 = '+string(li_c15))
		
end subroutine

public subroutine uf_col (string as_colname, ref integer ai_col, ref string as_col);choose case as_colname
	case 'patient_nom_1', 'dt1'
		as_col = '1'
		ai_col = 1
	case 'patient_nom_2', 'dt2'
		as_col = '2'
		ai_col = 2
	case 'patient_nom_3', 'dt3'
		as_col = '3'
		ai_col = 3 
	case 'patient_nom_4', 'dt4'
		as_col = '4'
		ai_col = 4
	case 'patient_nom_5', 'dt5'
		as_col = '5'
		ai_col = 5
	case 'patient_nom_6', 'dt6'
		as_col = '6'
		ai_col = 6
	case 'patient_nom_7', 'dt7'
		as_col = '7'
		ai_col = 7
	case 'patient_nom_8', 'dt8'
		as_col = '8'
		ai_col = 8
	case 'patient_nom_9', 'dt9'
		as_col = '9'
		ai_col = 9
	case 'patient_nom_10', 'dt10'
		as_col = '10'
		ai_col = 10
	case 'patient_nom_11', 'dt11'
		as_col = '11'
		ai_col = 11
	case 'patient_nom_12', 'dt12'
		as_col = '12'
		ai_col = 12
	case 'patient_nom_13', 'dt13'
		as_col = '13'
		ai_col = 13
	case 'patient_nom_14', 'dt14'
		as_col = '14'
		ai_col = 14
	case 'patient_nom_15', 'dt15'
		as_col = '15'
		ai_col = 15
	case else 
		error_type(0)
end choose
end subroutine

public function s_pat uf_clearpat ();string ls_l[]
s_pat lstr_empty

SetNull(lstr_empty.idspec)
SetNull(lstr_empty.heure)
SetNull(lstr_empty.datecal)
lstr_empty.duree = 0
lstr_empty.patid = 0
lstr_empty.patnom = ''
lstr_empty.patprenom = ''
setNull(lstr_empty.patnodos)
lstr_empty.pattelres = ''
setNull(lstr_empty.patdatenais)
lstr_empty.backcolor = rgb(255,255,255)
setNull(lstr_empty.traitid)
lstr_empty.memo = ''
setNull(lstr_empty.idpers)
//setNull(lstr_empty.iduser)
lstr_empty.l[] = ls_l[]
lstr_empty.dt1 = ''
lstr_empty.dt2 = ''
lstr_empty.dt3 = ''

return lstr_empty
end function

public subroutine uf_setsync ();time lt

lt = dw_hor.getitemtime(dw_hor.getrow(),'heure')

//horsync
//update t_horsync set horsync = :ldtt_horsync;
dw_hor.event ue_refresh()
insert into t_horlogrefresh (rdvdate,rdvheure,updateheure) values(:istr_cal.caldate,:lt,:idtt_horsync);
if error_type(-1) = 1 then
	commit using sqlca;
else
	rollback using sqlca;
	error_type(50)
end if
end subroutine

public function boolean uf_validplage (s_pat astr_pat);long i = 0,ll_patid
integer li_count
string ls_sql,ls_patnom
time lt_end

lt_end = relativetime(astr_pat.heure,(astr_pat.duree - 1) * ii_step * 60)
//messagebox('lt_end',string(lt_end))
ls_sql = "select patient_nom_"+string(astr_pat.col)+",patient_id_"+string(astr_pat.col)+" from horaire where no_ortho = "+string(il_horidspec)+" and datecal = '"+string(astr_pat.datecal,'yyyy-mm-dd')+"' and heure between '"+string(astr_pat.heure)+"' and '"+string(lt_end)+"'"
declare c_valid DYNAMIC CURSOR FOR SQLSA;
prepare sqlsa from :ls_sql;

OPEN c_valid;

FETCH c_valid into :ls_patnom,
					:ll_patid;

DO WHILE SQLCA.SQLCode = 0
	
	i ++
	
	if ls_patnom <> "" or ll_patid <> 0 then
		return false
	end if
	
	FETCH c_valid into :ls_patnom,
						:ll_patid;
LOOP

CLOSE c_valid;

if i < astr_pat.duree then return false

return true
end function

public function boolean uf_validtransfert (s_pat astr_pat);long i = 0, ll_patid
string ls_sql
time lt_end

lt_end = relativetime(astr_pat.heure,(astr_pat.duree - 1) * ii_step * 60)
ls_sql = "select patient_id_"+string(astr_pat.col)+" from horaire where no_ortho = "+string(il_horidspec)+" and datecal = '"+string(astr_pat.datecal,'yyyy-mm-dd')+"' and heure between '"+string(astr_pat.heure)+"' and '"+string(lt_end)+"'"

declare currdv DYNAMIC CURSOR FOR SQLSA;
prepare SQLSA from :ls_sql using SQLCA;
IF sqlca.sqlcode = 0 THEN 
	OPEN DYNAMIC currdv;
	
	FETCH currdv into :ll_patid;
	
	DO WHILE SQLCA.SQLCode = 0
		
		i ++
		
		if ll_patid <> astr_pat.patid and ll_patid <> 0 then
			return false
		end if
		
		FETCH currdv into :ll_patid;
	LOOP
	
	CLOSE currdv;
end if

if i < astr_pat.duree then return false

return true
end function

public function boolean uf_isuser (s_pat astr_pat);//integer i,li_nbcol
//long ll_iduser
//string ls_sql
//time lt_end
//
//if astr_pat.iduser > 0 then
//	select horcolnb into :li_nbcol from t_options where ortho_id = :il_horidspec;
//	lt_end = relativetime(astr_pat.heure,(astr_pat.duree - 1) * ii_step * 60)
//	for i = 1 to li_nbcol
//		if astr_pat.col <> i then
//			ls_sql = "select iduser"+string(i)+" from horaire where no_ortho = "+string(il_horidspec)+" and datecal = '"+string(astr_pat.datecal,'yyyy-mm-dd')+"' and heure between '"+string(astr_pat.heure)+"' and '"+string(lt_end)+"'"
//			declare cur DYNAMIC CURSOR FOR SQLSA;
//			prepare sqlsa from :ls_sql;
//			open cur;
//				fetch cur into :ll_iduser;
//				do while SQLCA.SQLCODE = 0
//					if ll_iduser = astr_pat.iduser then
//						close cur;
//						return false
//					end if
//					fetch cur into :ll_iduser;
//				loop
//			close cur;
//		end if
//	next
//end if
return true
end function

public function boolean uf_unlock ();delete from t_horlock where id_personnel = :gl_idpers;
if error_type(-1) = 1 then
	commit using SQLCA;
	return true
else
	rollback using SQLCA;
	return false
end if
end function

public function string uf_islock (date adt, integer ai_col);long ll_idpers = 0
string ls_horuserlock = ''

select id_personnel into :ll_idpers from t_horlock where ortho_id = :il_horidspec and hordate = :adt and col = :ai_col;
if ll_idpers > 0 then
	select isnull(prenom,'')+ ' ' + isnull(nom,'') into :ls_horuserlock from t_personnels where id_personnel = :ll_idpers;
end if
is_lockuser = ls_horuserlock
return ls_horuserlock
end function

public subroutine implistlabo (long al_couleur);long id, nb_row, j, v_id_traitement, v_id_patient, v_check_cpd, v_couleur
long ll_patid[10], ll_coul[10], ll_duree[10], ll_noortho
integer i,li_duree,li_horcolnb
time v_heure_rv,lt_startam,lt_endam,lt_startpm,lt_endpm,lt_null, lt_heure
date v_date_rv, ldt_datecal
dec{2} v_montant_paye, v_montant_original
string ls_traitnom[10]

//*******************************************************************
delete from horaire_patient_id;
commit using SQLCA;
//********************************************************************

v_date_rv = dw_hor.getitemdate(1,"datecal")
select horcolnb into :li_horcolnb from t_options where ortho_id = :v_no_ortho;
lt_startam = time(string(ii_startam)+':00')
lt_endam = time(string(ii_endam)+':55')
lt_startpm = time(string(ii_startpm)+':00')
lt_endpm = time(string(ii_endpm)+':55')

DECLARE listrdv CURSOR FOR
  SELECT horaire.datecal, 
  			horaire.patient_id_1,   
         horaire.patient_id_2,   
         horaire.patient_id_3,   
         horaire.patient_id_4,
			horaire.patient_id_5,
			horaire.patient_id_6,   
         horaire.patient_id_7,   
         horaire.patient_id_8,   
         horaire.patient_id_9,
			horaire.patient_id_10,
			horaire.patient_id_11,
			horaire.patient_id_12,
			horaire.patient_id_13,
			horaire.patient_id_14,
			horaire.patient_id_15,
			horaire.heure, 
			horaire.no_ortho,   
			horaire.couleur_text_1,   
			horaire.couleur_text_2,   
			horaire.couleur_text_3,   
			horaire.couleur_text_4, 
			horaire.couleur_text_5,
			horaire.couleur_text_6,   
			horaire.couleur_text_7,   
			horaire.couleur_text_8,   
			horaire.couleur_text_9, 
			horaire.couleur_text_10,
			horaire.couleur_text_11,
			horaire.couleur_text_12,
			horaire.couleur_text_13,
			horaire.couleur_text_14,
			horaire.couleur_text_15,
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid1 and ortho_id = :v_no_ortho),   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid2 and ortho_id = :v_no_ortho),   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid3 and ortho_id = :v_no_ortho),   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid4 and ortho_id = :v_no_ortho), 
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid5 and ortho_id = :v_no_ortho),
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid6 and ortho_id = :v_no_ortho),   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid7 and ortho_id = :v_no_ortho),   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid8 and ortho_id = :v_no_ortho),   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid9 and ortho_id = :v_no_ortho), 
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid10 and ortho_id = :v_no_ortho),
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid11 and ortho_id = :v_no_ortho),
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid12 and ortho_id = :v_no_ortho),
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid13 and ortho_id = :v_no_ortho),
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid14 and ortho_id = :v_no_ortho),
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid15 and ortho_id = :v_no_ortho),
			horaire.duree1,
			horaire.duree2,
			horaire.duree3,
			horaire.duree4,
			horaire.duree5,
			horaire.duree6,
			horaire.duree7,
			horaire.duree8,
			horaire.duree9,
			horaire.duree10,
			horaire.duree11,
			horaire.duree12,
			horaire.duree13,
			horaire.duree14,
			horaire.duree15
	 FROM horaire  
	WHERE horaire.datecal = :v_date_rv AND  
			horaire.no_ortho = :v_no_ortho AND  
			((horaire.heure BETWEEN :lt_startam AND :lt_endam) OR
			(horaire.heure BETWEEN :lt_startpm AND :lt_endpm)) 
ORDER BY horaire.heure ASC;

OPEN listrdv;

FETCH listrdv INTO :ldt_datecal, 
  						 :ll_patid[1],   
         			 :ll_patid[2], 
          			 :ll_patid[3],   
        				 :ll_patid[4],
						 :ll_patid[5],
			          :ll_patid[6],  
                   :ll_patid[7],   
                   :ll_patid[8],   
                   :ll_patid[9],
						 :ll_patid[10],
						 :ll_patid[11],
						 :ll_patid[12],
						 :ll_patid[13],
						 :ll_patid[14],
						 :ll_patid[15],
						 :lt_heure, 
						 :ll_noortho,   
						 :ll_coul[1],   
			          :ll_coul[2],   
						 :ll_coul[3],  
			 			 :ll_coul[4], 
			          :ll_coul[5],
			          :ll_coul[6],  
			          :ll_coul[7],  
			          :ll_coul[8],   
						 :ll_coul[9],
			          :ll_coul[10],  
						 :ll_coul[11],  
						 :ll_coul[12],  
						 :ll_coul[13],  
						 :ll_coul[14],  
						 :ll_coul[15],  
						 :ls_traitnom[1],   
			          :ls_traitnom[2],   
						 :ls_traitnom[3],  
			 			 :ls_traitnom[4], 
			          :ls_traitnom[5],
			          :ls_traitnom[6],  
			          :ls_traitnom[7],  
			          :ls_traitnom[8],   
						 :ls_traitnom[9],
			          :ls_traitnom[10], 
						 :ls_traitnom[11], 
						 :ls_traitnom[12], 
						 :ls_traitnom[13], 
						 :ls_traitnom[14], 
						 :ls_traitnom[15], 
						 :ll_duree[1],
						 :ll_duree[2],
						 :ll_duree[3],
						 :ll_duree[4],
						 :ll_duree[5],
						 :ll_duree[6],
						 :ll_duree[7],
						 :ll_duree[8],
						 :ll_duree[9],
						 :ll_duree[10],
						 :ll_duree[11],
						 :ll_duree[12],
						 :ll_duree[13],
						 :ll_duree[14],
						 :ll_duree[15];
						 
	DO WHILE SQLCA.SQLCode = 0
		
		
	//for j = 1 to nb_row
//	v_heure_rv = dw_hor.getitemtime(j,"heure")
	for i = 1 to li_horcolnb
		if ll_patid[i] > 0  and ll_coul[i] = al_couleur and ll_duree[i] > 0 then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise,traitement) values (:ll_patid[i],:lt_heure,:v_date_rv,:i,:ls_traitnom[i]);
		end if
	next
		
	FETCH listrdv INTO :ldt_datecal, 
  						:ll_patid[1],   
         			 :ll_patid[2], 
          			 :ll_patid[3],   
        				 :ll_patid[4],
						 :ll_patid[5],
			          :ll_patid[6],  
                   :ll_patid[7],   
                   :ll_patid[8],   
                   :ll_patid[9],
						 :ll_patid[10],
						 :ll_patid[11],
						 :ll_patid[12],
						 :ll_patid[13],
						 :ll_patid[14],
						 :ll_patid[15],
						 :lt_heure, 
						 :ll_noortho,   
						 :ll_coul[1],   
			          :ll_coul[2],   
						 :ll_coul[3],  
			 			 :ll_coul[4], 
			          :ll_coul[5],
			          :ll_coul[6],  
			          :ll_coul[7],  
			          :ll_coul[8],   
						 :ll_coul[9],
			          :ll_coul[10],  
						 :ll_coul[11],  
						 :ll_coul[12],  
						 :ll_coul[13],  
						 :ll_coul[14],  
						 :ll_coul[15],  
						 :ls_traitnom[1],   
			          :ls_traitnom[2],   
						 :ls_traitnom[3],  
			 			 :ls_traitnom[4], 
			          :ls_traitnom[5],
			          :ls_traitnom[6],  
			          :ls_traitnom[7],  
			          :ls_traitnom[8],   
						 :ls_traitnom[9],
			          :ls_traitnom[10], 
						 :ls_traitnom[11], 
						 :ls_traitnom[12], 
						 :ls_traitnom[13], 
						 :ls_traitnom[14], 
						 :ls_traitnom[15], 
						 :ll_duree[1],
						 :ll_duree[2],
						 :ll_duree[3],
						 :ll_duree[4],
						 :ll_duree[5],
						 :ll_duree[6],
						 :ll_duree[7],
						 :ll_duree[8],
						 :ll_duree[9],
						 :ll_duree[10],
						 :ll_duree[11],
						 :ll_duree[12],
						 :ll_duree[13],
						 :ll_duree[14],
						 :ll_duree[15];
		
	LOOP

CLOSE listrdv;


//	LISTE TELEPHONIQUE imp selection *************************************************

//datastore ds_prochain_cheque
//ds_prochain_cheque = create datastore
//ds_prochain_cheque.dataobject = 'd_prochain_cheque'
//ds_prochain_cheque.SetTransObject(SQLCA)
datastore ds_imp_patient
ds_imp_patient = create datastore
ds_imp_patient.dataobject = "r_imp_couleur_select"
ds_imp_patient.SetTransObject(SQLCA)
ds_imp_patient.retrieve(v_no_ortho)
//commit using sqlca;
//nb_row = ds_imp_patient.rowcount()
//for j = 1 to nb_row
//	v_id_patient = ds_imp_patient.getitemnumber(j,"patient_patient_id")
////	Select check_cpd into :v_check_cpd from patient where patient_id = :v_id_patient;
//	if v_check_cpd = 0 then
//		Select distinct traitement_id into :v_id_traitement from traitements where patient_id = :v_id_patient order by traitement_id desc;
//		Select montant_paye into :v_montant_paye from traitements where traitement_id = :v_id_traitement;
//		Select montant_original into :v_montant_original from traitements where traitement_id = :v_id_traitement;
//		ds_prochain_cheque.retrieve(v_id_traitement)
//		commit using sqlca;
//		if ds_prochain_cheque.getrow() > 0  then
//			ds_imp_patient.SetItem(j,"patient_couleur_postdate",rgb(255,255,255))
//		elseif v_montant_original - v_montant_paye > 0 then
//			ds_imp_patient.SetItem(j,"patient_couleur_postdate",rgb(255,200,200))
//		end if
//	else
//		ds_imp_patient.SetItem(j,"patient_couleur_postdate",rgb(255,255,255))
//	end if
//next
//ds_imp_patient.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
gb_datawindow = false
openwithparm(w_print_options,ds_imp_patient)
destroy ds_imp_patient
//destroy ds_prochain_cheque

end subroutine

public subroutine deleterdv (long al_idpat, date adt, time at, integer ai_col);delete from t_rdv where patient_id = :al_idpat and rdvdate = :adt and rdvheure = :at and colonne = :ai_col;
if error_type(-1) = 1 then
	commit using sqlca;
	f_logs('del',string(adt)+ ', ' +string(at)+ ', 0',0,al_idpat,today(),'0') //log
	if isvalid(w_patient) then
//		w_patient.dw_detailsrdv.retrieve(w_patient.il_patid,v_no_ortho,v_langue)
		w_patient.of_detailrdv()
	end if
else
	rollback using sqlca;
	error_type(50)
end if
end subroutine

public function long rappel (long al_patid);long nb, ll_rv
string ls_trait

if al_patid > 0 then
	Select count(*) into :nb from rendezvous where patient_id = :al_patid and id_rdv is null;
	if nb >= 1 then
		select first rv_id, nom_traitement
		  into :ll_rv,
				 :ls_trait
		  from rendezvous left outer join type_de_traitement on rendezvous.type_traitement_id = type_de_traitement.type_traitement_id and rendezvous.no_ortho = type_de_traitement.ortho_id
		 where patient_id = :al_patid
			and id_rdv is null;
		
		if messagebox("Question!","Voulez-vous effacer le rendez-vous pour " + ls_trait + " de ce patient de la liste des rappels?",Question!,YesNo!,1) = 1 then
			if isvalid(w_liste_des_rappels_retentions) then
				w_liste_des_rappels_retentions.event post ue_post_open()
			end if
			return ll_rv
		else
			setNull(ll_rv)
			return ll_rv
		end if
	end if
end if

setNull(ll_rv)
return ll_rv

end function

public subroutine addrdv (long al_patid, long al_traitid, date adt_date, time at_heure, long al_duree, integer ai_colonne, long al_iduser, string as_demo, long al_rv, character ac_td[]);long ll_rdv, ll_ortho
time lt_debut, lt_fin
integer li_count,li_chrg, li_debut = 0
char lc_tdprec = ''
decimal{2} ld_chrgduree,ld_taux, ld_facttot, ld_totcharge

select count(*) into :li_count from t_rdv where patient_id = :al_patid and rdvdate = :adt_date and rdvheure = :at_heure and colonne = :ai_colonne and rdvetat not in ('c','m');
if li_count = 0 then
	//calcul de la charge
	select addtocharge into :li_chrg from type_de_traitement where ortho_id = :v_no_ortho and type_traitement_id = :al_traitid;
	if li_chrg = 1 then
		select first chargtaux into :ld_taux from t_charges where ortho_id = :v_no_ortho and chargdate <= :adt_date  order by chargdate desc;
		ld_chrgduree = ii_step * al_duree * ld_taux
		if ii_chrgarret = 1 then
			select isnull(sum(isnull(montant,0)),0) into :ld_facttot from factures_traitements INNER JOIN traitements ON traitements.traitement_id = factures_traitements.traitement_id  where traitements.patient_id = :al_patid;
			select isnull(sum(isnull(chrgduree,0)),0) into :ld_totcharge from t_rdv where patient_id = :al_patid;
			if (ld_chrgduree + ld_totcharge) > ld_facttot then
				ld_chrgduree = ld_facttot - ld_totcharge
			end if
		end if
	else
		ld_chrgduree = 0
	end if
//	messagebox('chrgduree',string(ld_chrgduree))
	insert into t_rdv(patient_id,typetraitid,rdvdate,rdvheure,duree,colonne,chrgduree,ortho_id,memo,id_personnel) 
	values (:al_patid,:al_traitid,:adt_date,:at_heure,:al_duree,:ai_colonne,:ld_chrgduree,:il_horidspec,:as_demo,:gl_idpers);
	if error_type(-1) = 1 then
		commit using sqlca;
		f_logs('add',string(adt_date)+ ', ' +string(at_heure)+ ', ' +string(al_duree),0,al_patid,today(),'0') //log
		
		select max(id_rdv) into :ll_rdv from t_rdv;
		
		update rendezvous set id_rdv = :ll_rdv where rv_id = :al_rv;
		error_type(-1)
		
		// Enregistrer le temps docteur dans la BD
		delete from t_hortempsdoc where id_rdv = :ll_rdv;
		error_type(-1)
		
		for li_count = 1 to al_duree
			if upperbound(ac_td) < al_duree then ac_td[li_count] = 'H'
			if isNull(ac_td[li_count]) then ac_td[li_count] = 'H'
			if upper(ac_td[li_count]) <> 'D' then ac_td[li_count] = 'H'
			
			if upper(ac_td[li_count]) <> lc_tdprec then
				if li_debut > 0 then
					if lc_tdprec = 'D' then
						ll_ortho = v_no_ortho
					else
						setNull(ll_ortho)
					end if
					
					lt_debut = relativetime(00:00:00, (li_debut - 1) * ii_step * 60)
					lt_fin = relativetime(00:00:00, (li_count - 1) * ii_step * 60)
					
					insert into t_hortempsdoc (id_rdv, ortho_id, hdeb, hfin)
						  values (:ll_rdv, :ll_ortho, :lt_debut, :lt_fin);
					error_type(-1)
				end if
				
				li_debut = li_count
				lc_tdprec = upper(ac_td[li_count])
			end if
		next
		
		if lc_tdprec = 'D' then
			ll_ortho = v_no_ortho
		else
			setNull(ll_ortho)
		end if
		
		lt_debut = relativetime(00:00:00, (li_debut - 1) * ii_step * 60)
		lt_fin = relativetime(00:00:00, al_duree * ii_step * 60)
		
		insert into t_hortempsdoc (id_rdv, ortho_id, hdeb, hfin)
			  values (:ll_rdv, :ll_ortho, :lt_debut, :lt_fin);
		error_type(-1)
		
		commit;
	else
		rollback using sqlca;
		error_type(50)
	end if
else
	error_type(62)
end if

if isvalid(w_patient) then
	// w_patient.dw_detailsrdv.retrieve(w_patient.il_patid,v_no_ortho,v_langue)
	w_patient.of_detailrdv()
end if
end subroutine

public subroutine f_applytpl ();update horaire set colortemplate1 = tpl.coul
from (select t_templateprog.id_template, heures, c1, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c1 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate2 = tpl.coul
from (select t_templateprog.id_template, heures, c2, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c2 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate3 = tpl.coul
from (select t_templateprog.id_template, heures, c3, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c3 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate4 = tpl.coul
from (select t_templateprog.id_template, heures, c4, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c4 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate5 = tpl.coul
from (select t_templateprog.id_template, heures, c5, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c5 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate6 = tpl.coul
from (select t_templateprog.id_template, heures, c6, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c6 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate7 = tpl.coul
from (select t_templateprog.id_template, heures, c7, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c7 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate8 = tpl.coul
from (select t_templateprog.id_template, heures, c8, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c8 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate9 = tpl.coul
from (select t_templateprog.id_template, heures, c9, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c9 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate10 = tpl.coul
from (select t_templateprog.id_template, heures, c10, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c10 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate11 = tpl.coul
from (select t_templateprog.id_template, heures, c11, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c11 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate12 = tpl.coul
from (select t_templateprog.id_template, heures, c12, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c12 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate13 = tpl.coul
from (select t_templateprog.id_template, heures, c13, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c13 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate14 = tpl.coul
from (select t_templateprog.id_template, heures, c14, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c14 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update horaire set colortemplate15 = tpl.coul
from (select t_templateprog.id_template, heures, c15, t_templates.ortho_id,
					row_number() over (partition by heures order by t_templateprog.id_template desc)
			 from t_templateprog INNER JOIN t_templates ON t_templateprog.id_template = t_templates.id_template
										INNER JOIN t_templatedate as t_tpldate ON t_tpldate.id_template = t_templates.id_template
			where c15 is not null and
						t_templates.ortho_id = :il_horidspec and
						t_tpldate.tpldate = :istr_cal.caldate) tpl(id_tpl, hre, coul, ortho, rang)
inner join t_templatedate on t_templatedate.id_template = tpl.id_tpl
inner join horaire on horaire.no_ortho = t_templatedate.ortho_id and horaire.datecal = t_templatedate.tpldate
						and horaire.heure = tpl.hre
 where isNull(t_templatedate.flagapply, 0) = 0
	and tpl.rang = 1
	and horaire.no_ortho = :il_horidspec
	and horaire.datecal = :istr_cal.caldate
order by t_templatedate.dateapply asc;
error_type(-1)
commit;

update t_templatedate set flagapply = 1 where tpldate = :istr_cal.caldate and ortho_id = :il_horidspec;
error_type(-1)
commit;

/*
long ll_idtpl, ll_c1, ll_c2, ll_c3, ll_c4, ll_c5, ll_c6
long ll_c7, ll_c8, ll_c9, ll_c10, ll_c11, ll_c12, ll_c13, ll_c14, ll_c15
integer li_nbrow
datastore ds_templprog
int j,li_flagapply
time lt_tplheure
boolean lb_err = false

//verifie si la journee existe
select count(*) into :li_nbrow from horaire where no_ortho = :il_horidspec and datecal = :istr_cal.caldate;
if li_nbrow > 0 then
	ds_templprog = create datastore
	ds_templprog.dataobject = "d_templprog"
	ds_templprog.SetTransObject(SQLCA)
	
	declare curtpl cursor for
	
	  select id_template,flagapply
		 from t_templatedate 
		where ortho_id = :il_horidspec and 
				tpldate = :istr_cal.caldate
	order by id_template asc;
	
	OPEN curtpl;
	
	DO WHILE SQLCA.SQLCODE = 0
		FETCH curtpl into :ll_idtpl,:li_flagapply;
		
		IF SQLCA.SQLCODE = 0 and (li_flagapply <> 1 or isnull(li_flagapply)) THEN
			if ds_templprog.retrieve(ll_idtpl) > 0 then
				for j = 1 to ds_templprog.rowcount()
					lt_tplheure = ds_templprog.getitemtime(j,'heures')
					ll_c1 = ds_templprog.getitemnumber(j,'c1')
					ll_c2 = ds_templprog.getitemnumber(j,'c2')
					ll_c3 = ds_templprog.getitemnumber(j,'c3')
					ll_c4 = ds_templprog.getitemnumber(j,'c4')
					ll_c5 = ds_templprog.getitemnumber(j,'c5')
					ll_c6 = ds_templprog.getitemnumber(j,'c6')
					ll_c7 = ds_templprog.getitemnumber(j,'c7')
					ll_c8 = ds_templprog.getitemnumber(j,'c8')
					ll_c9 = ds_templprog.getitemnumber(j,'c9')
					ll_c10 = ds_templprog.getitemnumber(j,'c10')
					ll_c11 = ds_templprog.getitemnumber(j,'c11')
					ll_c12 = ds_templprog.getitemnumber(j,'c12')
					ll_c13 = ds_templprog.getitemnumber(j,'c13')
					ll_c14 = ds_templprog.getitemnumber(j,'c14')
					ll_c15 = ds_templprog.getitemnumber(j,'c15')
					if not isnull(ll_c1) then 
						update horaire set colortemplate1 = :ll_c1 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate  and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c2) then 
						update horaire set colortemplate2 = :ll_c2 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c3) then 
						update horaire set colortemplate3 = :ll_c3 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c4) then 
						update horaire set colortemplate4 = :ll_c4 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c5) then 
						update horaire set colortemplate5 = :ll_c5 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c6) then 
						update horaire set colortemplate6 = :ll_c6 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c7) then 
						update horaire set colortemplate7 = :ll_c7 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c8) then 
						update horaire set colortemplate8 = :ll_c8 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c9) then 
						update horaire set colortemplate9 = :ll_c9 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c10) then 
						update horaire set colortemplate10 = :ll_c10 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c11) then 
						update horaire set colortemplate11 = :ll_c11 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c12) then 
						update horaire set colortemplate12 = :ll_c12 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c13) then 
						update horaire set colortemplate13 = :ll_c13 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c14) then 
						update horaire set colortemplate14 = :ll_c14 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not isnull(ll_c15) then 
						update horaire set colortemplate15 = :ll_c15 where no_ortho = :il_horidspec and datecal = :istr_cal.caldate and heure = :lt_tplheure;
						if (SQLCA.sqlCode <> 0) then
							lb_err = true
						end if
					end if
					if not lb_err then
						update t_templatedate set flagapply = 1 where id_template = :ll_idtpl and tpldate = :istr_cal.caldate;
					else
						error_type(50)
					end if
				next		
			END IF
		END IF
	LOOP
	
	CLOSE curtpl;
	destroy ds_templprog
	commit using sqlca;
end if
*/
end subroutine

public subroutine implistetel (n_listcol auo_listcol);long nb_row,ll_patid,ll_duree[15]
integer i,j,li_conf,li_nbcol
long ll_patidhor[15], ll_noortho, ll_conf[15]
string ls_traitnom[15], ls_memo[15], ls_null
date ldt_date, ldt_datecal
time lt_heure,lt_startam,lt_endam,lt_startpm,lt_endpm,lt_nil
integer ii_listcol[15]

setnull(ls_null)
lt_startam = time(string(ii_startam)+':00')
lt_endam = time(string(ii_endam)+':55')
lt_startpm = time(string(ii_startpm)+':00')
lt_endpm = time(string(ii_endpm)+':55')
SetNull(lt_nil)
ii_listcol = auo_listcol.of_getcol()

ldt_date = dw_hor.getitemdate(1,"datecal")
select horcolnb into :li_nbcol from t_options where ortho_id = :il_horidspec;


DECLARE listrdv CURSOR FOR
  SELECT horaire.datecal, 
  			horaire.patient_id_1,   
         horaire.patient_id_2,   
         horaire.patient_id_3,   
         horaire.patient_id_4,
			horaire.patient_id_5,
			horaire.patient_id_6,   
         horaire.patient_id_7,   
         horaire.patient_id_8,   
         horaire.patient_id_9,
			horaire.patient_id_10,
			horaire.patient_id_11,
			horaire.patient_id_12,
			horaire.patient_id_13,
			horaire.patient_id_14,
			horaire.patient_id_15,
			horaire.heure, 
			horaire.no_ortho,   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid1 and ortho_id = horaire.no_ortho),   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid2 and ortho_id = horaire.no_ortho),   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid3 and ortho_id = horaire.no_ortho),   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid4 and ortho_id = horaire.no_ortho), 
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid5 and ortho_id = horaire.no_ortho),
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid6 and ortho_id = horaire.no_ortho),   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid7 and ortho_id = horaire.no_ortho),   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid8 and ortho_id = horaire.no_ortho),   
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid9 and ortho_id = horaire.no_ortho), 
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid10 and ortho_id = horaire.no_ortho),     
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid11 and ortho_id = horaire.no_ortho), 
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid12 and ortho_id = horaire.no_ortho), 
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid13 and ortho_id = horaire.no_ortho), 
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid14 and ortho_id = horaire.no_ortho), 
			(select nom_traitement from type_de_traitement where type_traitement_id = horaire.traitementid15 and ortho_id = horaire.no_ortho), 
			horaire.duree1,
			horaire.duree2,
			horaire.duree3,
			horaire.duree4,
			horaire.duree5,
			horaire.duree6,
			horaire.duree7,
			horaire.duree8,
			horaire.duree9,
			horaire.duree10,
			horaire.duree11,
			horaire.duree12,
			horaire.duree13,
			horaire.duree14,
			horaire.duree15,
			horaire.conf1,
			horaire.conf2,
			horaire.conf3,
			horaire.conf4,
			horaire.conf5,
			horaire.conf6,
			horaire.conf7,
			horaire.conf8,
			horaire.conf9,
			horaire.conf10,
			horaire.conf11,
			horaire.conf12,
			horaire.conf13,
			horaire.conf14,
			horaire.conf15,
			horaire.memo1,
			horaire.memo2,
			horaire.memo3,
			horaire.memo4,
			horaire.memo5,
			horaire.memo6,
			horaire.memo7,
			horaire.memo8,
			horaire.memo9,
			horaire.memo10,	
			horaire.memo11,
			horaire.memo12,
			horaire.memo13,
			horaire.memo14,	
			horaire.memo15	
	 FROM horaire  
	WHERE horaire.datecal = :ldt_date AND  
			horaire.no_ortho = :il_horidspec AND  
			((horaire.heure BETWEEN :lt_startam AND :lt_endam) OR
			(horaire.heure BETWEEN :lt_startpm AND :lt_endpm)) 
ORDER BY horaire.heure ASC;

OPEN listrdv;

FETCH listrdv INTO :ldt_datecal, 
  						 :ll_patidhor[1],   
         			 :ll_patidhor[2], 
          			 :ll_patidhor[3],   
        				 :ll_patidhor[4],
						 :ll_patidhor[5],
			          :ll_patidhor[6],  
                   :ll_patidhor[7],   
                   :ll_patidhor[8],   
                   :ll_patidhor[9],
						 :ll_patidhor[10],
						 :ll_patidhor[11],
						 :ll_patidhor[12],
						 :ll_patidhor[13],
						 :ll_patidhor[14],
						 :ll_patidhor[15],
						 :lt_heure, 
						 :ll_noortho,   
						 :ls_traitnom[1],   
			          :ls_traitnom[2],   
						 :ls_traitnom[3],  
			 			 :ls_traitnom[4], 
			          :ls_traitnom[5],
			          :ls_traitnom[6],  
			          :ls_traitnom[7],  
			          :ls_traitnom[8],   
						 :ls_traitnom[9],
			          :ls_traitnom[10], 
						 :ls_traitnom[11],
						 :ls_traitnom[12],
						 :ls_traitnom[13],
						 :ls_traitnom[14],
						 :ls_traitnom[15],
						 :ll_duree[1],
						 :ll_duree[2],
						 :ll_duree[3],
						 :ll_duree[4],
						 :ll_duree[5],
						 :ll_duree[6],
						 :ll_duree[7],
						 :ll_duree[8],
						 :ll_duree[9],
						 :ll_duree[10],
						 :ll_duree[11],
						 :ll_duree[12],
						 :ll_duree[13],
						 :ll_duree[14],
						 :ll_duree[15],
						 :ll_conf[1],
						 :ll_conf[2],
						 :ll_conf[3],
						 :ll_conf[4],
						 :ll_conf[5],
						 :ll_conf[6],
						 :ll_conf[7],
						 :ll_conf[8],
						 :ll_conf[9],
						 :ll_conf[10],
						 :ll_conf[11],
						 :ll_conf[12],
						 :ll_conf[13],
						 :ll_conf[14],
						 :ll_conf[15],
						 :ls_memo[1],
						 :ls_memo[2],
						 :ls_memo[3],
						 :ls_memo[4],
						 :ls_memo[5],
						 :ls_memo[6],
						 :ls_memo[7],
						 :ls_memo[8],
						 :ls_memo[9],
						 :ls_memo[10],
						 :ls_memo[11],
						 :ls_memo[12],
						 :ls_memo[13],
						 :ls_memo[14],
						 :ls_memo[15];
						 
	DO WHILE SQLCA.SQLCode = 0
		
		for i = 1 to li_nbcol
			
			if ii_listcol[i] = 1 then
				
		//		ll_patid = dw_hor.getitemnumber(j,"patient_id_"+string(i))
		//		ls_traitnom = dw_hor.getitemstring(j,"traitementnom"+string(i))
		//		ll_duree = dw_hor.getitemnumber(j,"duree"+string(i))
		//		li_conf = dw_hor.getitemnumber(j,"conf"+string(i))
				if isnull(ll_duree[i]) then ll_duree[i] = 0
				if ll_patidhor[i] > 0 and ll_duree[i] > 0 then
					If trim(ls_memo[i]) = "" THEN ls_memo[i] = ls_null
					insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement, duree, conf1, memo) 
					values (:ll_patidhor[i],:lt_heure,:ldt_date,:i,:ls_traitnom[i],:ll_duree[i],:ll_conf[i], :ls_memo[i]);
		//			commit using sqlca;
				end if
				
			end if
		next
	
		
		FETCH listrdv INTO :ldt_datecal, 
  						 :ll_patidhor[1],   
         			 :ll_patidhor[2], 
          			 :ll_patidhor[3],   
        				 :ll_patidhor[4],
						 :ll_patidhor[5],
			          :ll_patidhor[6],  
                   :ll_patidhor[7],   
                   :ll_patidhor[8],   
                   :ll_patidhor[9],
						 :ll_patidhor[10],
						 :ll_patidhor[11],
						 :ll_patidhor[12],
						 :ll_patidhor[13],
						 :ll_patidhor[14],
						 :ll_patidhor[15],
						 :lt_heure, 
						 :ll_noortho,   
						 :ls_traitnom[1],   
			          :ls_traitnom[2],   
						 :ls_traitnom[3],  
			 			 :ls_traitnom[4], 
			          :ls_traitnom[5],
			          :ls_traitnom[6],  
			          :ls_traitnom[7],  
			          :ls_traitnom[8],   
						 :ls_traitnom[9],
			          :ls_traitnom[10],    
						 :ls_traitnom[11],
						 :ls_traitnom[12],
						 :ls_traitnom[13],
						 :ls_traitnom[14],
						 :ls_traitnom[15],
						 :ll_duree[1],
						 :ll_duree[2],
						 :ll_duree[3],
						 :ll_duree[4],
						 :ll_duree[5],
						 :ll_duree[6],
						 :ll_duree[7],
						 :ll_duree[8],
						 :ll_duree[9],
						 :ll_duree[10],
						 :ll_duree[11],
						 :ll_duree[12],
						 :ll_duree[13],
						 :ll_duree[14],
						 :ll_duree[15],
						 :ll_conf[1],
						 :ll_conf[2],
						 :ll_conf[3],
						 :ll_conf[4],
						 :ll_conf[5],
						 :ll_conf[6],
						 :ll_conf[7],
						 :ll_conf[8],
						 :ll_conf[9],
						 :ll_conf[10],
						 :ll_conf[11],
						 :ll_conf[12],
						 :ll_conf[13],
						 :ll_conf[14],
						 :ll_conf[15],
						 :ls_memo[1],
						 :ls_memo[2],
						 :ls_memo[3],
						 :ls_memo[4],
						 :ls_memo[5],
						 :ls_memo[6],
						 :ls_memo[7],
						 :ls_memo[8],
						 :ls_memo[9],
						 :ls_memo[10],
						 :ls_memo[11],
						 :ls_memo[12],
						 :ls_memo[13],
						 :ls_memo[14],
						 :ls_memo[15];
		
	LOOP

CLOSE listrdv;

//dw_hor.retrieve(istr_cal.caldate,il_horidspec,lt_startam,lt_endam,lt_startpm,lt_endpm)
//nb_row = dw_hor.rowcount()
//ldt_date = dw_hor.getitemdate(1,"datecal")
//select horcolnb into :li_nbcol from t_options where ortho_id = :il_horidspec;
//for j = 1 to nb_row
//	lt_heure = dw_hor.getitemtime(j,"heure")
//	for i = 1 to li_nbcol
//		ll_patid = dw_hor.getitemnumber(j,"patient_id_"+string(i))
//		ls_traitnom = dw_hor.getitemstring(j,"traitementnom"+string(i))
//		ll_duree = dw_hor.getitemnumber(j,"duree"+string(i))
//		li_conf = dw_hor.getitemnumber(j,"conf"+string(i))
//		if isnull(ll_duree) then ll_duree = 0
//		if ll_patid > 0 and ll_duree > 0 then
//			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement, duree, conf1) values (:ll_patid,:lt_heure,:ldt_date,:i,:ls_traitnom,:ll_duree,:li_conf);
//			commit using sqlca;
//		end if
//	next
//next
//f_affichage()
end subroutine

on w_horaire.create
int iCurrent
call super::create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_noteperm=create st_noteperm
this.st_notejourn=create st_notejourn
this.mle_noteperm=create mle_noteperm
this.mle_notejourn=create mle_notejourn
this.st_tooltip=create st_tooltip
this.dw_xls=create dw_xls
this.lb_trait=create lb_trait
this.cb_dim=create cb_dim
this.cb_aug=create cb_aug
this.pb_delete=create pb_delete
this.tab_view=create tab_view
this.pb_canceltrans=create pb_canceltrans
this.tab_1=create tab_1
this.pb_horsem=create pb_horsem
this.pb_tpl=create pb_tpl
this.pb_find=create pb_find
this.pb_printselection=create pb_printselection
this.pb_print=create pb_print
this.sle_day2=create sle_day2
this.sle_day=create sle_day
this.cb_today=create cb_today
this.cb_close=create cb_close
this.rb_pm=create rb_pm
this.rb_am=create rb_am
this.ddlb_mois=create ddlb_mois
this.dw_info_patient_hor=create dw_info_patient_hor
this.uo_1=create uo_1
this.rr_fond=create rr_fond
this.dw_hor=create dw_hor
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_2
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.st_noteperm
this.Control[iCurrent+4]=this.st_notejourn
this.Control[iCurrent+5]=this.mle_noteperm
this.Control[iCurrent+6]=this.mle_notejourn
this.Control[iCurrent+7]=this.st_tooltip
this.Control[iCurrent+8]=this.dw_xls
this.Control[iCurrent+9]=this.lb_trait
this.Control[iCurrent+10]=this.cb_dim
this.Control[iCurrent+11]=this.cb_aug
this.Control[iCurrent+12]=this.pb_delete
this.Control[iCurrent+13]=this.tab_view
this.Control[iCurrent+14]=this.pb_canceltrans
this.Control[iCurrent+15]=this.tab_1
this.Control[iCurrent+16]=this.pb_horsem
this.Control[iCurrent+17]=this.pb_tpl
this.Control[iCurrent+18]=this.pb_find
this.Control[iCurrent+19]=this.pb_printselection
this.Control[iCurrent+20]=this.pb_print
this.Control[iCurrent+21]=this.sle_day2
this.Control[iCurrent+22]=this.sle_day
this.Control[iCurrent+23]=this.cb_today
this.Control[iCurrent+24]=this.cb_close
this.Control[iCurrent+25]=this.rb_pm
this.Control[iCurrent+26]=this.rb_am
this.Control[iCurrent+27]=this.ddlb_mois
this.Control[iCurrent+28]=this.dw_info_patient_hor
this.Control[iCurrent+29]=this.uo_1
this.Control[iCurrent+30]=this.rr_fond
this.Control[iCurrent+31]=this.dw_hor
end on

on w_horaire.destroy
call super::destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_noteperm)
destroy(this.st_notejourn)
destroy(this.mle_noteperm)
destroy(this.mle_notejourn)
destroy(this.st_tooltip)
destroy(this.dw_xls)
destroy(this.lb_trait)
destroy(this.cb_dim)
destroy(this.cb_aug)
destroy(this.pb_delete)
destroy(this.tab_view)
destroy(this.pb_canceltrans)
destroy(this.tab_1)
destroy(this.pb_horsem)
destroy(this.pb_tpl)
destroy(this.pb_find)
destroy(this.pb_printselection)
destroy(this.pb_print)
destroy(this.sle_day2)
destroy(this.sle_day)
destroy(this.cb_today)
destroy(this.cb_close)
destroy(this.rb_pm)
destroy(this.rb_am)
destroy(this.ddlb_mois)
destroy(this.dw_info_patient_hor)
destroy(this.uo_1)
destroy(this.rr_fond)
destroy(this.dw_hor)
end on

event open;call super::open;this.inv_resize.of_Register(uo_1.pb_yrnext,inv_resize.SCALE)
this.inv_resize.of_Register(uo_1.pb_yrprev,inv_resize.SCALE)
this.inv_resize.of_Register(uo_1.pb_monnext,inv_resize.SCALE)
this.inv_resize.of_Register(uo_1.pb_monprev,inv_resize.SCALE)
this.inv_resize.of_Register(uo_1.dw_cal,inv_resize.SCALE)

istr_cal.caldate = date(message.stringparm)
uo_1.of_sethorshareid(il_horidspec)
uo_1.uf_InitCal(istr_cal.caldate)
uo_1.PostEvent("ue_aff_horaire")

end event

event timer;long ll_row
integer li_count
//datetime ldtt_horsync
time lt,lt_endam,lt_startpm
window activesheet

activesheet = w_principal.GetActiveSheet()
if activesheet = w_horaire then
	if ii_written <= 0 then
		ii_written = 0
		if ib_uptwrite then
			uf_unlock()
			ib_uptwrite = false
			//horsync
//			messagebox('unlock','log')
			idtt_horsync = datetime(today(),now())
			lt = dw_hor.getitemtime(dw_hor.getrow(),'heure')
			insert into t_horlogrefresh (rdvdate,rdvheure,updateheure) values(:istr_cal.caldate,:lt,:idtt_horsync);
			if error_type(-1) = 1 then
				commit using sqlca;
			else
				rollback using sqlca;
				error_type(50)
			end if
		end if
		if rb_am.checked then
			lt_endam = time(string(ii_endam)+':55')
			select count(*) into :li_count from t_horlogrefresh where rdvdate = :istr_cal.caldate and rdvheure <= :lt_endam and updateheure > :idtt_horsync;
		else
			lt_startpm = time(string(ii_startpm)+':00')
			select count(*) into :li_count from t_horlogrefresh where rdvdate = :istr_cal.caldate and rdvheure >= :lt_startpm and updateheure > :idtt_horsync;
		end if
		if li_count > 0 then
//			messagebox('refresh ','instance: ' + string(idtt_horsync))
			dw_hor.event ue_refresh()
		end if
	else
		ii_written --
	end if
end if
end event

event pfc_postopen;call super::pfc_postopen;int i,v_hor_aff_pm,li_arrow,li_horcolnb
//string ls_col1, ls_col2, ls_col3, ls_col4, ls_col5, ls_col6, ls_col7, ls_col8, ls_col9, ls_col10, ls_request

m_principal.m_couleurs.enabled = true
//verification option
select hor_aff_pm,horarrow,hordosspat,hormenuchoix1,hortransdirect into :v_hor_aff_pm,:li_arrow,:ii_hordosspat,:is_hormenuchoix1,:ii_transdirect from t_options where ortho_id = :il_horidspec;
if not len(is_hormenuchoix1) > 0 then is_hormenuchoix1 = 'CABA'
//place la fleche ou non
if li_arrow = 1 then
	ii_arrow = 1
end if
//affiche pm ou non
if v_hor_aff_pm = 0 then
	rb_am.visible = false
	rb_pm.visible = false
end if
//identifie les colonnes
horcol()

// Affiche les patients en transferts
tab_view.tabpage_1.dw_hortrans.event ue_retrieve()

event ue_timer(id_timer)
end event

type pb_2 from picturebutton within w_horaire
integer x = 5
integer y = 1948
integer width = 105
integer height = 84
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Custom025!"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "Confirmation par courriel"
end type

event clicked;long i, ll_patid[], j, ll_horidspec1, ll_horidspec2, ll_idpatient, li_liste_trait_par_spec
string ls_courriel, ls_cell, ls_courriel2, ls_courriel3
date ldt_date

j = 1
ldt_date = istr_cal.caldate

select horshareid 
into :ll_horidspec1 
from t_options where ortho_id = :v_no_ortho;

DECLARE listmail CURSOR FOR 
	select 	t_rdv.patient_id,
				patient.email, 
				patient.email2,
				patient.email3,
				patient.telcell
	from t_rdv 	INNER JOIN patient ON patient.patient_id = t_rdv.patient_id
	where rdvdate = :ldt_date AND
			t_rdv.ortho_id = :ll_horidspec1 AND
			isnull(rdvetat,'') NOT IN ('m','c') AND
			((isnull(patient.email,'') <> '') OR
			(isnull(patient.email2,'') <> '') OR
			(isnull(patient.email3,'') <> ''));
	
	
OPEN listmail;

FETCH listmail INTO :ll_idpatient, :ls_courriel, :ls_courriel2, :ls_courriel3, :ls_cell;

DO WHILE SQLCA.SQLCode = 0
	
	if len(ls_courriel) > 0 or len(ls_cell) > 0  then
		ll_patid[j] = ll_idpatient
		j++
	end if
	
	FETCH listmail INTO :ll_idpatient, :ls_courriel, :ls_courriel2, :ls_courriel3, :ls_cell;
	
LOOP

CLOSE listmail;

gnv_app.inv_entrepotglobal.of_ajoutedonnee("Liste_patient_courriel",ll_patid)
gnv_app.inv_entrepotglobal.of_ajoutedonnee("type_courriel",2)
gnv_app.inv_entrepotglobal.of_ajoutedonnee("date_courriel",ldt_date)
gnv_app.inv_entrepotglobal.of_ajoutedonnee("specialiste_courriel",ll_horidspec1)

open(w_confrappelmail)

//gnv_app.inv_entrepotglobal.of_ajoutedonnee("datejournee",istr_cal.caldate)
//gnv_app.inv_entrepotglobal.of_ajoutedonnee("spechoraire",il_horidspec)
//open(w_confemail)

end event

event constructor;if v_langue = 'an' then
	this.powertiptext = "Print"
end if
end event

type pb_1 from picturebutton within w_horaire
integer x = 549
integer y = 1948
integer width = 105
integer height = 84
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "DeclareVariable!"
string disabledname = "DeclareVariable!"
alignment htextalign = right!
boolean map3dcolors = true
end type

event clicked;
long ll_nb
string ls_path, ls_docname, ls_date
int li_rc

n_ds lds_export

lds_export = create n_ds
lds_export.DataObject = "d_exportjour"
lds_export.SetTransObject(SQLCA)
ll_nb = lds_export.retrieve(il_horidspec,Date(uo_1.uf_datestring()))
if lds_export.rowcount() > 0 then	
	ls_docname = lds_export.GetItemString(1, "doctor_name")
	ls_path = GetCurrentDirectory()+"\exports\"
	if not DirectoryExists (ls_path) then
		CreateDirectory (ls_path) 
	end if
	ls_path = ls_path+ls_docname
	if not DirectoryExists (ls_path) then
		CreateDirectory (ls_path) 
	end if
	li_rc = GetFolder ( "Save in directory", ls_path)
	IF li_rc = 1 Then
		ls_date = gnv_app.inv_string.of_globalreplace(uo_1.uf_datestring(),"/","")
		li_rc = lds_export.SaveAs(ls_path+"\orthotek_"+ls_date+".xml",Xml!,true)
		IF li_rc = 1 Then
			If v_langue <> 'an' then
				MessageBox("Exportation réussie","Fichier créée dans le répertoire "+ ls_path)
			else
				
			end if
		end if
	end if
else
	
end if
destroy lds_export
end event

type st_noteperm from statictext within w_horaire
boolean visible = false
integer x = 709
integer y = 996
integer width = 1111
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "Note pemanente"
boolean focusrectangle = false
end type

event clicked;if v_langue = 'an' then
	this.text = "Permanent note"
end if
end event

type st_notejourn from statictext within w_horaire
boolean visible = false
integer x = 713
integer y = 24
integer width = 1111
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Note journalière"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Daily note"
end if
end event

type mle_noteperm from multilineedit within w_horaire
boolean visible = false
integer x = 704
integer y = 1080
integer width = 2907
integer height = 936
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event modified;tab_view.tabpage_note.dw_notehor.setItem(tab_view.tabpage_note.dw_notehor.getRow(),'notehor',this.text)
if tab_view.tabpage_note.dw_notehor.update() = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if
end event

type mle_notejourn from multilineedit within w_horaire
boolean visible = false
integer x = 709
integer y = 100
integer width = 2907
integer height = 888
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

event losefocus;tab_view.tabpage_note.dw_hornotedate.setItem(tab_view.tabpage_note.dw_hornotedate.getRow(),'commentaire',this.text)
if tab_view.tabpage_note.dw_hornotedate.update() = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if
end event

type st_tooltip from statictext within w_horaire
boolean visible = false
integer x = 736
integer y = 172
integer width = 55
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
boolean focusrectangle = false
end type

type dw_xls from datawindow within w_horaire
boolean visible = false
integer width = 73
integer height = 72
integer taborder = 190
string title = "none"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type lb_trait from u_lb within w_horaire
boolean visible = false
integer x = 1289
integer y = 68
integer width = 480
integer height = 600
integer taborder = 190
boolean hscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylebox!
end type

event losefocus;call super::losefocus;visible = false

end event

type cb_dim from commandbutton within w_horaire
boolean visible = false
integer x = 448
integer y = 1816
integer width = 96
integer height = 44
integer taborder = 40
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "-"
end type

event clicked;string ls_col, ls_sql
integer li_col
date ldt_datecal
time lt_heure
long ll_idspec
s_pat str_pat

// On va chercher les données nécessaire

uf_col(dw_hor.getColumnName(),li_col,ls_col)
lt_heure = dw_hor.getItemTime(dw_hor.getRow(),'heure')
ll_idspec = dw_hor.getItemNumber(dw_hor.getRow(),'no_ortho')
ldt_datecal = dw_hor.getItemDate(dw_hor.getRow(),'datecal')

// On fait le update
//

str_pat = uf_clearpat()
dw_hor.event ue_update(str_pat)

ls_sql = "update horaire set duree" + ls_col  + " = duree" + ls_col + " - 1 WHERE datecal = '" + string(ldt_datecal,"yyyy-mm-dd") + "' and heure = '" + string(lt_heure) + "' and no_ortho = "  + string(ll_idspec)
execute immediate :ls_sql;
if error_type(-1) = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if
//
uf_setsync()
end event

type cb_aug from commandbutton within w_horaire
boolean visible = false
integer x = 448
integer y = 1768
integer width = 96
integer height = 48
integer taborder = 50
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "+"
end type

event clicked;string ls_col, ls_sql
integer li_col
date ldt_datecal
time lt_heure
long ll_idspec
s_pat str_pat

// On va chercher les données nécessaire

uf_col(dw_hor.getColumnName(),li_col,ls_col)
lt_heure = dw_hor.getItemTime(dw_hor.getRow(),'heure')
ll_idspec = dw_hor.getItemNumber(dw_hor.getRow(),'no_ortho')
ldt_datecal = dw_hor.getItemDate(dw_hor.getRow(),'datecal')

// On fait le update
//

str_pat = uf_clearpat()
dw_hor.event ue_update(str_pat)

ls_sql = "update horaire set duree" + ls_col  + " = duree" + ls_col + " + 1 WHERE datecal = '" + string(ldt_datecal,"yyyy-mm-dd") + "' and heure = '" + string(lt_heure) + "' and no_ortho = "  + string(ll_idspec)
execute immediate :ls_sql;
if error_type(-1) = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if
//
uf_setsync()
end event

type pb_delete from picturebutton within w_horaire
boolean visible = false
integer x = 549
integer y = 1772
integer width = 105
integer height = 84
integer taborder = 40
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Undo!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;string ls_col, ls_sql
integer li_col
date ldt_datecal
time lt_heure
long ll_idspec
s_pat str_pat

// On va chercher les données nécessaire

uf_col(dw_hor.getColumnName(),li_col,ls_col)
lt_heure = dw_hor.getItemTime(dw_hor.getRow(),'heure')
ll_idspec = dw_hor.getItemNumber(dw_hor.getRow(),'no_ortho')
ldt_datecal = dw_hor.getItemDate(dw_hor.getRow(),'datecal')

// On fait le update
//

str_pat = uf_clearpat()
dw_hor.event ue_update(str_pat)

ls_sql = "update horaire set patient_id_" + ls_col + " = 0, patient_nom_" + ls_col + " = '', case_" + ls_col + " = null, couleur_text_" + ls_col + " = 16777215, no_dossier" + ls_col + " = null,  lock" + ls_col + " = null, traitementnom" + ls_col + " = null, traitementid" + ls_col + " = null, duree" + ls_col + " = null, dt" + ls_col + " = null, conf" + ls_col + " = null, traitement_" + ls_col + " = null, memo" + ls_col + " = null WHERE datecal = '" + string(ldt_datecal,"yyyy-mm-dd") + "' and heure = '" + string(lt_heure) + "' and no_ortho = "  + string(ll_idspec)
execute immediate :ls_sql;
if error_type(-1) = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if
//
uf_setsync()
end event

type tab_view from tab within w_horaire
event create ( )
event destroy ( )
integer y = 1340
integer width = 658
integer height = 516
integer taborder = 30
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 79741120
boolean focusonbuttondown = true
boolean showpicture = false
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_lock tabpage_lock
tabpage_note tabpage_note
end type

on tab_view.create
this.tabpage_1=create tabpage_1
this.tabpage_lock=create tabpage_lock
this.tabpage_note=create tabpage_note
this.Control[]={this.tabpage_1,&
this.tabpage_lock,&
this.tabpage_note}
end on

on tab_view.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_lock)
destroy(this.tabpage_note)
end on

type tabpage_1 from userobject within tab_view
event create ( )
event destroy ( )
integer x = 18
integer y = 16
integer width = 622
integer height = 404
long backcolor = 79741120
string text = "Patient en transfert"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
dw_hortrans dw_hortrans
end type

on tabpage_1.create
this.dw_hortrans=create dw_hortrans
this.Control[]={this.dw_hortrans}
end on

on tabpage_1.destroy
destroy(this.dw_hortrans)
end on

type dw_hortrans from u_dw within tabpage_1
event ue_retrieve ( )
integer width = 622
integer height = 396
integer taborder = 220
string title = "none"
string dataobject = "d_hortmp"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();Retrieve(v_no_ortho)
commit using sqlca;
end event

event clicked;//if_clearvariable( )
//is_pat.patid = getitemnumber(row,'patid')
//select patient_nom,patient_prenom,new_dossier,tel_maison
//into :is_pat.patnom,:is_pat.patprenom,:is_pat.patnodos,:is_pat.pattelres
//from patient
//where patient_id = :is_pat.patid;
//is_pat.backcolor = getitemnumber(row,'oldcolor')
//is_pat.traitid = getitemnumber(row,'traitid')
//select nom_traitement into :is_pat.l2 from type_de_traitement where type_traitement_id = :is_pat.traitid;
//is_pat.duree = getitemnumber(row,'duree')
//this.drag(begin!)
end event

event constructor;SetRowFocusIndicator(FocusRect!)
SetTransObject(SQLCA)
//dw_hortrans.event ue_retrieve()
end event

type tabpage_lock from userobject within tab_view
integer x = 18
integer y = 16
integer width = 622
integer height = 404
long backcolor = 79741120
string pointer = "Arrow!"
string text = "Lock"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
cbx_lock cbx_lock
end type

on tabpage_lock.create
this.cbx_lock=create cbx_lock
this.Control[]={this.cbx_lock}
end on

on tabpage_lock.destroy
destroy(this.cbx_lock)
end on

type cbx_lock from checkbox within tabpage_lock
integer y = 332
integer width = 626
integer height = 60
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

event clicked;string ls_col, ls_nom
integer li_col

if not this.checked then
	il_patlock = 0
	cbx_lock.text = ""
	this.checked = false
else
	this.checked = true
	uf_col(dw_hor.getcolumnname(),li_col,ls_col)
	il_patlock = dw_hor.getItemNumber(dw_hor.getrow(),'patient_id_' + ls_col)
	select patient_nom || ' ' || patient_prenom into :ls_nom from patient where patient_id = :il_patlock;
	cbx_lock.text = ls_nom
end if
end event

type tabpage_note from userobject within tab_view
integer x = 18
integer y = 16
integer width = 622
integer height = 404
long backcolor = 79741120
string text = "Note"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
p_2 p_2
dw_notehor dw_notehor
dw_hornotedate dw_hornotedate
end type

on tabpage_note.create
this.p_2=create p_2
this.dw_notehor=create dw_notehor
this.dw_hornotedate=create dw_hornotedate
this.Control[]={this.p_2,&
this.dw_notehor,&
this.dw_hornotedate}
end on

on tabpage_note.destroy
destroy(this.p_2)
destroy(this.dw_notehor)
destroy(this.dw_hornotedate)
end on

type p_2 from picture within tabpage_note
integer x = 549
integer y = 332
integer width = 73
integer height = 64
boolean originalsize = true
string picturename = "VCRNext!"
boolean focusrectangle = false
boolean map3dcolors = true
end type

event clicked;if mle_noteperm.visible then
	mle_noteperm.visible = false
	mle_notejourn.visible = false
	st_noteperm.visible = false
	st_notejourn.visible = false
	dw_hor.visible = true
	rr_fond.visible = false
else
	mle_noteperm.visible = true
	mle_notejourn.visible = true
	st_noteperm.visible = true
	st_notejourn.visible = true
	dw_hor.visible = false
	rr_fond.visible = true
	mle_notejourn.text = tab_view.tabpage_note.dw_hornotedate.getItemString(tab_view.tabpage_note.dw_hornotedate.getRow(),'commentaire')
	mle_noteperm.text = tab_view.tabpage_note.dw_notehor.getItemString(tab_view.tabpage_note.dw_notehor.getRow(),'notehor')
end if
end event

type dw_notehor from u_dw within tabpage_note
integer y = 208
integer width = 622
integer height = 188
integer taborder = 30
string title = "Note permanente"
string dataobject = "d_notehor"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_row
pro_resize luo_size
luo_size.uf_resizedw(this)

setTransObject(SQLCA)
if retrieve(v_no_ortho) = 0 then
	ll_row = insertRow(0)
	setItem(ll_row,'ortho_id',v_no_ortho)
	if update() = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
	retrieve(v_no_ortho)
end if
end event

event losefocus;if update() = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if
end event

type dw_hornotedate from datawindow within tabpage_note
integer width = 622
integer height = 188
integer taborder = 190
string title = "Note journalière"
string dataobject = "d_hornotedate"
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)
end event

event losefocus;if update() = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if
end event

type pb_canceltrans from picturebutton within w_horaire
integer x = 549
integer y = 1864
integer width = 105
integer height = 84
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Undo!"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "Annuler transfert"
end type

event clicked;delete from t_hortransrow;
if error_type(-1)= 1 then
	delete from t_hortrans;
	if error_type(-1)= 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
else
	rollback using SQLCA;
end if

tab_view.tabpage_1.dw_hortrans.retrieve(v_no_ortho)
//uf_setsync()
//openwithparm(w_choixcouleur,4)
end event

type tab_1 from tab within w_horaire
integer y = 944
integer width = 658
integer height = 212
integer taborder = 70
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean focusonbuttondown = true
boolean showpicture = false
boolean boldselectedtext = true
tabposition tabposition = tabsonbottom!
integer selectedtab = 1
tabpage_jumpweek tabpage_jumpweek
tabpage_jumpday tabpage_jumpday
end type

on tab_1.create
this.tabpage_jumpweek=create tabpage_jumpweek
this.tabpage_jumpday=create tabpage_jumpday
this.Control[]={this.tabpage_jumpweek,&
this.tabpage_jumpday}
end on

on tab_1.destroy
destroy(this.tabpage_jumpweek)
destroy(this.tabpage_jumpday)
end on

type tabpage_jumpweek from userobject within tab_1
integer x = 18
integer y = 16
integer width = 622
integer height = 104
long backcolor = 79741120
string text = "Semaine(s)"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
pb_plus pb_plus
em_liste_nb em_liste_nb
pb_moins pb_moins
end type

on tabpage_jumpweek.create
this.pb_plus=create pb_plus
this.em_liste_nb=create em_liste_nb
this.pb_moins=create pb_moins
this.Control[]={this.pb_plus,&
this.em_liste_nb,&
this.pb_moins}
end on

on tabpage_jumpweek.destroy
destroy(this.pb_plus)
destroy(this.em_liste_nb)
destroy(this.pb_moins)
end on

type pb_plus from picturebutton within tabpage_jumpweek
integer x = 425
integer width = 183
integer height = 96
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "C:\ii4net\orthotek\images\Indicatr.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;// Déclaration de variables
date apresdate
apresdate=relativedate(istr_cal.caldate,+7*integer(em_liste_nb.text))
uo_1.uf_initcal (apresdate)
istr_cal.caldate = apresdate
affichage_creation()
end event

type em_liste_nb from editmask within tabpage_jumpweek
integer x = 215
integer width = 187
integer height = 96
integer taborder = 200
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 255
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = styleraised!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "1~~99"
end type

event constructor;em_liste_nb.text = "1"
end event

type pb_moins from picturebutton within tabpage_jumpweek
integer x = 5
integer width = 183
integer height = 96
integer taborder = 190
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "C:\ii4net\orthotek\images\Indicat2.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;// Déclaration de variables
date avantdate
avantdate=relativedate(istr_cal.caldate,-7*integer(em_liste_nb.text))
uo_1.uf_initcal (avantdate)
istr_cal.caldate = avantdate
affichage_creation()
end event

type tabpage_jumpday from userobject within tab_1
integer x = 18
integer y = 16
integer width = 622
integer height = 104
long backcolor = 79741120
string text = "Journée(s)"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
long picturemaskcolor = 536870912
pb_dayr pb_dayr
em_day em_day
pb_dayl pb_dayl
end type

on tabpage_jumpday.create
this.pb_dayr=create pb_dayr
this.em_day=create em_day
this.pb_dayl=create pb_dayl
this.Control[]={this.pb_dayr,&
this.em_day,&
this.pb_dayl}
end on

on tabpage_jumpday.destroy
destroy(this.pb_dayr)
destroy(this.em_day)
destroy(this.pb_dayl)
end on

type pb_dayr from picturebutton within tabpage_jumpday
integer x = 425
integer width = 183
integer height = 96
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "C:\ii4net\orthotek\images\Indicatr.bmp"
end type

event clicked;date apresdate
apresdate=relativedate(istr_cal.caldate,+integer(em_day.text))
uo_1.uf_initcal (apresdate)
istr_cal.caldate = apresdate
affichage_creation()
end event

type em_day from editmask within tabpage_jumpday
integer x = 215
integer width = 187
integer height = 96
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 255
alignment alignment = center!
borderstyle borderstyle = styleraised!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "1~~99"
end type

event constructor;em_day.text = "1"
end event

type pb_dayl from picturebutton within tabpage_jumpday
integer x = 5
integer width = 183
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "C:\ii4net\orthotek\images\Indicat2.bmp"
end type

event clicked;date avantdate
avantdate=relativedate(istr_cal.caldate,-integer(em_day.text))
uo_1.uf_initcal (avantdate)
istr_cal.caldate = avantdate
affichage_creation()
end event

type pb_horsem from picturebutton within w_horaire
integer x = 439
integer y = 1864
integer width = 105
integer height = 84
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "ArrangeTables!"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "Horaire de la semaine"
end type

event clicked;Opensheet(w_horaire_semaine,w_principal,2,layered!)
w_horaire_semaine.title = "Horaire semaine"
end event

event constructor;if v_langue = 'an' then
	this.powertiptext = "Week schedule"
end if
end event

type pb_tpl from picturebutton within w_horaire
integer x = 329
integer y = 1864
integer width = 105
integer height = 84
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "SelectObject!"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "Template"
end type

event clicked;opensheetwithparm(w_horaire_template, string(istr_cal.caldate),w_principal,2,layered!)
w_horaire_template.title = "Template"
end event

type pb_find from picturebutton within w_horaire
integer x = 219
integer y = 1864
integer width = 105
integer height = 84
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Find!"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "Rechercher"
end type

event clicked;string ls_now

ls_now = string(istr_cal.caldate)
opensheetwithparm(w_horaire_find,ls_now,w_principal,2,layered!)
w_horaire_find.title = "Recherche horaire"
end event

event constructor;if v_langue = 'an' then
	this.powertiptext = "Search"
end if
end event

type pb_printselection from picturebutton within w_horaire
integer x = 110
integer y = 1864
integer width = 105
integer height = 84
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Report!"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "Imprimer sélection"
end type

event clicked;openwithparm(w_choixcouleur,2)

end event

event constructor;if v_langue = 'an' then
	this.powertiptext = "Print selection"
end if
end event

type pb_print from picturebutton within w_horaire
integer x = 5
integer y = 1864
integer width = 105
integer height = 84
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Print!"
alignment htextalign = right!
boolean map3dcolors = true
string powertiptext = "Imprimer"
end type

event clicked;open(w_horprint)
end event

event constructor;if v_langue = 'an' then
	this.powertiptext = "Print"
end if
end event

type sle_day2 from statictext within w_horaire
integer y = 68
integer width = 658
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217856
long backcolor = 67108864
string text = "err"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_day from statictext within w_horaire
integer width = 658
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217856
long backcolor = 67108864
string text = "err"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_today from commandbutton within w_horaire
integer y = 872
integer width = 658
integer height = 72
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Aujourd~'hui"
end type

event clicked;istr_cal.caldate = date(string(Today()))
uo_1.uf_InitCal(istr_cal.caldate)
affichage_creation()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Today'
end if
end event

type cb_close from commandbutton within w_horaire
integer x = 110
integer y = 1952
integer width = 439
integer height = 80
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)
m_principal.m_couleurs.enabled = false
end event

event constructor;if v_langue = 'an' then
cb_close.text = "Close"
end if
end event

type rb_pm from radiobutton within w_horaire
integer x = 375
integer y = 1276
integer width = 183
integer height = 64
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 78690504
string text = "PM"
boolean lefttext = true
end type

event clicked;affichage_creation()

end event

type rb_am from radiobutton within w_horaire
integer x = 78
integer y = 1276
integer width = 183
integer height = 64
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "AM"
boolean checked = true
boolean lefttext = true
end type

event clicked;affichage_creation()

end event

type ddlb_mois from dropdownlistbox within w_horaire
integer x = 5
integer y = 1168
integer width = 645
integer height = 788
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean sorted = false
end type

event selectionchanged;// Déclaration de variables
date nouvelledate
integer jour, mois, annee
jour = day(istr_cal.caldate)
annee = year(istr_cal.caldate)
choose case index
	case 1
		mois=1
	case 2
		if day(istr_cal.caldate) > 28 then
			jour=28
		end if
		mois=2
	case 3
		mois=3
	case 4
		if day(istr_cal.caldate) > 30 then
			jour=30
		end if
		mois=4
	case 5
		mois=5
	case 6
		if day(istr_cal.caldate) > 30 then
			jour=30
		end if
		mois=6
	case 7
		mois=7
	case 8
		mois=8
	case 9
		if day(istr_cal.caldate) > 30 then
			jour=30
		end if
		mois=9
	case 10
		mois=10
	case 11
		if day(istr_cal.caldate) > 30 then
			jour=30
		end if
		mois=11
	case 12
		mois=12
end choose
// Initialisation des variables
nouvelledate = date(string(annee)+"/"+string(mois)+"/"+string(jour))
uo_1.uf_initcal (nouvelledate)
istr_cal.caldate = nouvelledate
affichage_creation()

end event

event constructor;if v_langue = 'fr' then
	ddlb_mois.AddItem('Janvier')
	ddlb_mois.AddItem('Février')
	ddlb_mois.AddItem('Mars')
	ddlb_mois.AddItem('Avril')
	ddlb_mois.AddItem('Mai')
	ddlb_mois.AddItem('Juin')
	ddlb_mois.AddItem('Juillet')
	ddlb_mois.AddItem('Août')
	ddlb_mois.AddItem('Septembre')
	ddlb_mois.AddItem('Octobre')
	ddlb_mois.AddItem('Novembre')
	ddlb_mois.AddItem('Décembre')
else
	ddlb_mois.AddItem('January')
	ddlb_mois.AddItem('Febuary')
	ddlb_mois.AddItem('March')
	ddlb_mois.AddItem('April')
	ddlb_mois.AddItem('May')
	ddlb_mois.AddItem('June')
	ddlb_mois.AddItem('July')
	ddlb_mois.AddItem('August')
	ddlb_mois.AddItem('September')
	ddlb_mois.AddItem('October')
	ddlb_mois.AddItem('November')
	ddlb_mois.AddItem('December')
end if
end event

type dw_info_patient_hor from u_dw within w_horaire
boolean visible = false
integer width = 672
integer height = 1524
integer taborder = 30
string title = "Info"
string dataobject = "d_info_patient_hor"
boolean vscrollbar = false
boolean resizable = true
boolean livescroll = false
borderstyle borderstyle = styleraised!
end type

event constructor;dw_info_patient_hor.SetTransObject(SQLCA)

if v_langue = 'an' then
	dw_info_patient_hor.object.t_title.text = "Patient's details"
	dw_info_patient_hor.object.t_telres.text = "Tel.(Home):"
	dw_info_patient_hor.object.t_telbur.text = "Tel.(Office):"
	dw_info_patient_hor.object.t_telcell.text = "Tel.(Cell.):"
	dw_info_patient_hor.object.t_telautre.text = "Tel.(Other):"
	dw_info_patient_hor.object.t_birthdate.text = "Birthdate:"
	dw_info_patient_hor.object.t_2.text = 'Quote:'
	dw_info_patient_hor.object.tt_frais.text = 'Global cost:'
	dw_info_patient_hor.object.tt_totfact.text = 'Charged to date :'
	dw_info_patient_hor.object.tt_totpaie.text = 'Paid amount:'
	dw_info_patient_hor.object.tt_montantdu.text = 'Due amount:'
	dw_info_patient_hor.object.tt_solde.text = 'Balance:'
	dw_info_patient_hor.object.tt_qtecpd.text = 'Qty pdc:'
	dw_info_patient_hor.object.tt_totcpd.text = 'Global pdc:'
	dw_info_patient_hor.object.tt_lastpaie.text = 'Last payment:'
	dw_info_patient_hor.object.tt_lastpaiedate.text = 'Date:'
	dw_info_patient_hor.object.t_pers_t.text = 'Staff:'
end if

end event

event clicked;if not dwo.name = 'b_del' then
//	p_1.visible = false
	dw_info_patient_hor.visible = false
end if
end event

event buttonclicked;long v_fin, ll_patid, ll_row
integer i, li_col, li_duree, li_row,li_nul
string ls_nul,ls_col
date ldt_datecal
time lt_rdv
SetNull(ls_nul)
SetNull(li_nul)

if dwo.name = 'b_del' then
	uf_col(dw_hor.getcolumnname(),li_col,ls_col)
	li_row = w_horaire.dw_hor.getrow()
	li_duree = w_horaire.dw_hor.getitemnumber(li_row,'duree'+ls_col)
	w_horaire.dw_hor.setitem(li_row,"patient_id_"+ls_col,0)
	w_horaire.dw_hor.setitem(li_row,"Patient_nom_"+ls_col,"")
	w_horaire.dw_hor.setitem(li_row,"no_dossier"+ls_col,"")
	w_horaire.dw_hor.setitem(li_row,"traitementid"+ls_col,0)
	w_horaire.dw_hor.setitem(li_row,"traitementnom"+ls_col,ls_nul)
	w_horaire.dw_hor.setitem(li_row,"duree"+ls_col,li_nul)
	w_horaire.dw_hor.setitem(li_row,"couleur_text_"+ls_col,rgb(255,255,255))
	w_horaire.dw_hor.setitem(li_row,"dt"+ls_col,ls_nul)
	w_horaire.dw_hor.setitem(li_row,'conf'+ls_col,0)
	w_horaire.dw_hor.setitem(li_row,'memo'+ls_col,ls_nul)
	li_row = li_row + 1
end if
end event

type uo_1 from u_calendarhor within w_horaire
integer y = 152
integer width = 658
integer height = 720
integer taborder = 180
boolean border = true
long backcolor = 80269524
string pointer = "Arrow!"
borderstyle borderstyle = styleraised!
end type

on uo_1.destroy
call u_calendarhor::destroy
end on

event ue_aff_horaire;long ll_row

istr_cal.caldate = id_date_selected // bug la fenetre principal
if tab_view.tabpage_note.dw_hornotedate.retrieve(istr_cal.caldate) = 0 then
	ll_row = tab_view.tabpage_note.dw_hornotedate.insertRow(0)
	tab_view.tabpage_note.dw_hornotedate.setItem(ll_row,'hornotedate',istr_cal.caldate)
else
	mle_notejourn.text = tab_view.tabpage_note.dw_hornotedate.getItemString(tab_view.tabpage_note.dw_hornotedate.getRow(),'commentaire')
end if

if id_dateold <> id_date_selected then
	id_dateold = id_date_selected
	il_scrollp = long(dw_hor.Object.DataWindow.FirstRowOnPage)
end if

dw_hor.setRedraw(false)
affichage_creation()
dw_hor.setRedraw(true)
end event

type rr_fond from roundrectangle within w_horaire
boolean visible = false
integer linethickness = 4
long fillcolor = 16777215
integer x = 686
integer y = 4
integer width = 2949
integer height = 2032
integer cornerheight = 40
integer cornerwidth = 46
end type

type dw_hor from u_dw within w_horaire
event keypressed pbm_dwnkey
event ue_refresh ( )
event type boolean ue_update ( readonly s_pat astr_pat )
event ue_delete ( s_pat astr_pat,  boolean ab_delrdv )
event ue_setblockcolor ( long al_color )
event undoeditchanged ( long al_row,  string as_col )
event ue_exportexcel ( )
event ue_afftooltip ( integer as_nomcol )
integer x = 681
integer width = 2967
integer height = 2040
integer taborder = 190
string dragicon = "Warning!"
boolean bringtotop = true
string title = "Horaire"
string dataobject = "d_hor"
boolean hscrollbar = true
string icon = "None!"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event keypressed;Choose Case key
	Case keyF1!
		of_toucheF1()
	Case keyF2!
		of_toucheF2()
	Case keyF3!
		of_toucheF3()
	Case keyF4!
		of_toucheF4()
   Case KeyF5!
	   of_toucheF5()
	Case keyF6!
		of_toucheF6()
	Case keyF7!
		of_toucheF7()
	Case keyF8!
		of_toucheF8()
	Case keyF9!
		of_toucheF9()
	Case keyF10!
		of_toucheF10()
	Case keyF11!
	   of_toucheF11()
	Case keyF12!
	   of_toucheF12()
//	Case keyDelete!
//		ii_key = 1
//		event ue_canceldelete()
//	Case keyBack!
//		event ue_canceldelete()
End Choose

end event

event ue_refresh();string ls_y,ls_x
long ll_lgn, ll_selst, ll_sellen, ll_scrollp

dw_hor.setredraw(false)
//memoriser la sélection
ll_selst = dw_hor.selectedStart()
ll_sellen = dw_hor.selectedLength()
//memoriser la position du pointeur
ll_cour = dw_hor.getrow()
ic_cour = dw_hor.GetColumn()
ls_Y = dw_hor.describe("Datawindow.VerticalScrollPosition")
il_scrollp = long(dw_hor.Object.DataWindow.FirstRowOnPage)
ls_X = dw_hor.describe("Datawindow.HorizontalScrollPosition")
f_affichage()
//positionner le pointeur
dw_hor.setcolumn(ic_cour)
dw_hor.scrolltorow(ll_cour)
dw_hor.modify("Datawindow.VerticalScrollPosition = " + ls_Y)
dw_hor.modify("Datawindow.HorizontalScrollPosition = " + ls_X)
//ll_lgn = len(dw_hor.getItemString(ll_cour,ic_cour))
//dw_hor.selectText(ll_lgn + 1, 0)
dw_hor.selectText(ll_selst, ll_sellen)
dw_hor.setfocus()
dw_hor.setredraw(true)
end event

event type boolean ue_update(readonly s_pat astr_pat);integer i,li_h1,li_d,li_h2,li_liste_trait_par_spec
long ll_horshareid
string ls_sql,ls_col,ls_traitnom,ls_ll,ls_l[],ls_doctime
string ls_iduser,ls_nodoss,ls_traitid,ls_duree, ls_memo
time lt_heure


lt_heure = astr_pat.heure
ls_col = string(astr_pat.col)
//ls_iduser = string(astr_pat.iduser)
//if isnull(ls_iduser) then ls_iduser = 'null'
ls_nodoss = string(astr_pat.patnodos)
if isnull(ls_nodoss) then ls_nodoss = 'null'
ls_traitid = string(astr_pat.traitid)
if isnull(ls_traitid) then ls_traitid = 'null'

ls_memo = astr_pat.memo
if isnull(ls_memo) then 
	ls_memo = '' 
else 
	ls_memo = rep(ls_memo,"'","''")
end if
if astr_pat.duree > 0 then
//	// calcul doctor time
//	//cas dx
//	if astr_pat.dt1 = 'd' then
//		if integer(astr_pat.dt2) > 0 then
//			li_h1 = integer(astr_pat.dt2)
//			for i = 1 to li_h1
//				astr_pat.dt[i] = 'D'
//			next
//			for i = li_h1 + 1 to astr_pat.duree
//				astr_pat.dt[i] = 'H'
//			next
//		else
//			for i = 1 to astr_pat.duree
//				astr_pat.dt[i] = 'D'
//			next
//		end if
//	//cas xdx
//	elseif astr_pat.dt2 = 'd' and integer(astr_pat.dt1) > 0 then
//		if integer(astr_pat.dt3) > 0 then
//			li_h1 = integer(astr_pat.dt1)
//			li_h2 = integer(astr_pat.dt3)
//			for i = 1 to li_h1
//				astr_pat.dt[i] = 'H'
//			next
//			for i = li_h1 + 1 to (astr_pat.duree - li_h2)
//				astr_pat.dt[i] = 'D'
//			next
//			for i = i to astr_pat.duree
//				astr_pat.dt[i] = 'H'
//			next
//		else
//			li_h1 = integer(astr_pat.dt1) + 1
//			for i = 1 to li_h1
//				astr_pat.dt[i] = 'H'
//			next
//			for i = li_h1 to astr_pat.duree 
//				astr_pat.dt[i] = 'D'
//			next
//		end if
//	end if
	if upperbound(astr_pat.dt) > 0 then
		ls_doctime = astr_pat.dt[1]
	else
		ls_doctime = ''
	end if
	
	ls_duree = string(astr_pat.duree)
	if isnull(astr_pat.patid) or astr_pat.patid <= 0 then ls_duree = '0' // pour effacer un commentaire
	if isnull(ls_doctime) then ls_doctime = ''
	ls_sql = "update horaire set patient_id_"+ls_col+"="+string(astr_pat.patid)+",patient_nom_"+ls_col+"='"+rep(astr_pat.patnom,"'","''")+"',no_dossier"+ls_col+"='"+ls_nodoss+"',couleur_text_"+ls_col+"="+string(astr_pat.backcolor)+",traitementid"+ls_col+"="+ls_traitid+",duree"+ls_col+"="+ls_duree+",memo"+ls_col+"='"+ ls_memo + "',conf"+ls_col+"= 0,dt"+ls_col+"='"+ls_doctime+"' where no_ortho = "+string(il_horidspec)+" and datecal = '"+string(astr_pat.datecal,"yyyy-mm-dd")+"' and heure = '"+string(astr_pat.heure)+"'"
	execute immediate :ls_sql using sqlca;
	if not error_type(-1) = 1 then
		return false
	end if
	
	for i = 1 to astr_pat.duree - 1
		lt_heure = relativetime(lt_heure,ii_step * 60)
		if isnull(upperbound(astr_pat.l)) or i > upperbound(astr_pat.l) then
			ls_ll = ''
		else
			ls_ll = astr_pat.l[i]
		end if
		// verification de la fleche
		if ls_ll = '' or i = 1 then
			if i = 1 then
				
				select horshareid,liste_trait_par_spec into :ll_horshareid,:li_liste_trait_par_spec from t_options where ortho_id = :v_no_ortho;
				if li_liste_trait_par_spec = 1 then
					ll_horshareid = v_no_ortho
				else
					if isnull(ll_horshareid) then ll_horshareid = v_no_ortho
				end if
				
				select nom_traitement into :ls_traitnom from type_de_traitement where type_traitement_id = :astr_pat.traitid and ortho_id = :ll_horshareid;
				astr_pat.patnom = rep(ls_traitnom,"'","''")
//			elseif i = 2 and len(astr_pat.pattelres) > 1 then
//				astr_pat.patnom = 'X'
//				astr_pat.patnom = string(astr_pat.pattelres,'(@@@) @@@-@@@@')
			elseif i = astr_pat.duree - 1 and astr_pat.patid > 0 then
				astr_pat.patnom = 'XX'
			elseif astr_pat.patid > 0 then
				astr_pat.patnom = 'X'
			else
				astr_pat.patnom = ''
			end if
		else
			astr_pat.patnom = astr_pat.l[i]
		end if
		// doctor time
		if upperbound(astr_pat.dt) >= (i + 1) then
			ls_doctime = astr_pat.dt[i + 1]
		else
			ls_doctime = ''
		end if
		if isnull(ls_doctime) then ls_doctime = ''
		ls_sql = "update horaire set patient_id_"+ls_col+"="+string(astr_pat.patid)+",patient_nom_"+ls_col+"='"+astr_pat.patnom+"',couleur_text_"+ls_col+"="+string(astr_pat.backcolor)+",traitementid"+ls_col+"="+ls_traitid+",duree"+ls_col+"= 0,conf"+ls_col+"= 0,dt"+ls_col+"='"+ls_doctime+"' where no_ortho = "+string(il_horidspec)+" and datecal = '"+string(astr_pat.datecal,"yyyy-mm-dd")+"' and heure = '"+string(lt_heure)+"'"
		execute immediate :ls_sql using sqlca;
		if not error_type(-1) = 1 then
			return false
		end if
	next
end if
uf_clearpat()
return true
end event

event ue_delete(s_pat astr_pat, boolean ab_delrdv);long ll_patid 
string ls_col,ls_sql,ls_patnom
integer li_col,li_nul
s_pat lstr_patdel

lstr_patdel = uf_clearpat()

ll_patid = astr_pat.patid
lstr_patdel.duree = astr_pat.duree
lstr_patdel.heure = astr_pat.heure
lstr_patdel.datecal = astr_pat.datecal
lstr_patdel.col = astr_pat.col
//lstr_patdel.traitid = astr_pat.traitid

if lstr_patdel.col > 0 then
	//detecte si c,est un vrai rdv ou un commentaire ajoute
	if lstr_patdel.duree > 0 and not isnull(lstr_patdel.duree) then
		if dw_hor.event ue_update(lstr_patdel) then
			commit using sqlca;
			if ab_delrdv then
				deleterdv(ll_patid,lstr_patdel.datecal,lstr_patdel.heure,lstr_patdel.col)
				dw_info_patient_hor.visible = false
			end if
	//		rappel(ll_patid) // ajouter pour dr dumoulin
		else
			rollback using sqlca;
			error_type(50)
		end if
	else
		lstr_patdel.duree = 0
		ls_sql = "select patient_nom_"+string(astr_pat.col)+",patient_id_"+string(astr_pat.col)+" from horaire where no_ortho = "+string(il_horidspec)+" and datecal = '"+string(astr_pat.datecal,'yyyy-mm-dd')+"' and heure between '"+string(astr_pat.heure)+"' and '23:59:01'"
		declare listpat DYNAMIC CURSOR FOR SQLSA;
		prepare sqlsa from :ls_sql;
		
		OPEN listpat;
		
		FETCH listpat into :ls_patnom,
							:ll_patid;
		
		DO WHILE SQLCA.SQLCode = 0 and ls_patnom <> '' and ll_patid = 0
			astr_pat.heure = relativetime(astr_pat.heure,ii_step * 60)
			lstr_patdel.duree++
			
			FETCH listpat into :ls_patnom,
								:ll_patid;
		LOOP
		
		CLOSE listpat;
//		messagebox('astr_patdel.duree',string(lstr_patdel.duree))
		if dw_hor.event ue_update(lstr_patdel) then
			commit using sqlca;
			dw_info_patient_hor.visible = false
		else
			rollback using sqlca;
			error_type(50)
		end if
	end if
end if
end event

event ue_setblockcolor(long al_color);long ll_nbrow, ll_currow, i
integer li_col, li_duree
string ls_col, ls_sql
time lt_start, lt_end

ll_currow = getrow()
ll_nbrow = rowcount()
uf_col(getcolumnname(),li_col,ls_col)
lt_start = getitemtime(ll_currow,'heure')
i = 0
if li_col > 0 then
	//detecte si c,est un vrai rdv ou un commentaire ajoute
	li_duree = getitemnumber(ll_currow,'duree'+ls_col)
	if li_duree > 0 and isnull(li_duree) = false then
		lt_end = relativetime(lt_start,(li_duree - 1) * ii_step * 60)
		ls_sql = "update horaire set couleur_text_"+ls_col+"="+string(al_color)+" where no_ortho = "+string(il_horidspec)+" and datecal = '"+string(getitemdate(ll_currow,'datecal'),"yyyy-mm-dd")+"' and heure between '"+string(lt_start)+"' and '"+string(lt_end)+"'"
		execute immediate :ls_sql using sqlca;
		error_type(-1)
	else
		if ll_currow = ll_nbrow then
			lt_end = lt_start
			lt_end = relativetime(lt_start,i * ii_step * 60)
			ls_sql = "update horaire set couleur_text_"+ls_col+"="+string(al_color)+" where no_ortho = "+string(il_horidspec)+" and datecal = '"+string(getitemdate(ll_currow,'datecal'),"yyyy-mm-dd")+"' and heure between '"+string(lt_start)+"' and '"+string(lt_end)+"'"
			execute immediate :ls_sql using sqlca;
			error_type(-1)
		else
			if getitemnumber(ll_currow,"patient_id_"+ls_col) > 0 then
				ll_currow++
				i++
			else
				DO WHILE (getitemstring(ll_currow,"patient_nom_"+ls_col) <> "" and getitemnumber(ll_currow,"patient_id_"+ls_col) = 0) and (ll_currow <> ll_nbrow)
					ll_currow++
					i++
				LOOP
			end if
			lt_end = relativetime(lt_start,(i - 1) * ii_step * 60)
			ls_sql = "update horaire set couleur_text_"+ls_col+"="+string(al_color)+" where no_ortho = "+string(il_horidspec)+" and datecal = '"+string(getitemdate(ll_currow,'datecal'),"yyyy-mm-dd")+"' and heure between '"+string(lt_start)+"' and '"+string(lt_end)+"'"
			execute immediate :ls_sql using sqlca;
			error_type(-1)
		end if
//		row = row + 1
//		scrollTorow(row)
//		li_fin = GetRow()
//		if li_fin = row then
//			DO WHILE getitemstring(row,"patient_nom_"+ls_col) <> "" and getitemnumber(row,"patient_id_"+ls_col) = 0
//				i++
//				row = row + 1
//				scrollTorow(row)
//				li_fin = GetRow()
//				if li_fin <> row then
//					exit
//				end if
//			LOOP
//		end if
//		lt_end = relativetime(lt_start,i * ii_step * 60)
	end if
	uf_setsync()
end if
end event

event undoeditchanged(long al_row, string as_col);string ls_sql, ls_rep
time lt_heure, lt_now
date ldt_datecal

lt_now = now()

do while getItemString(al_row,as_col) <> '' and secondsafter(lt_now,now()) < 1
	yield()
loop

ls_rep = getItemString(al_row,as_col)

lt_heure = getItemTime(al_row,'heure')
ldt_datecal = getItemDate(al_row,'datecal')

if isNull(ls_rep) then ls_rep = 'X'
if ls_rep = '' then ls_rep = 'X'
setItem(al_row,as_col,ls_rep)
ls_sql = "update horaire set " + as_col + " = '" + ls_rep + "' WHERE no_ortho = " + string(il_horidspec) + " and datecal = '" + string(ldt_datecal,'yyyy-mm-dd') + "' and heure = '" + string(lt_heure) + "'"
execute immediate :ls_sql;
commit using SQLCA;

if ls_rep = 'X' then
	scrollToRow(al_row)
	setColumn(as_col)
	selecttext(1, 2)
end if

uf_setsync()

end event

event ue_exportexcel();string ls_sql, ls_newsyntax, ls_errorfromsql, ls_errorcreate

ls_sql = "Select 	t_rdv.rdvheure, &
							t_rdv.rdvdate, &
							patient.patient_nom, &
							patient.patient_prenom, &
							patient.date_naissance &
				from 		t_rdv INNER JOIN patient ON t_rdv.patient_id = patient.patient_id &
				where 	t_rdv.rdvdate = '" + string(istr_cal.caldate,"yyyy-mm-dd") + "'  &
				order by	patient.patient_nom ASC, &
							patient.patient_prenom ASC"
	
	ls_newsyntax = SQLCA.SyntaxFromSQL(ls_sql, "Style(Type=Grid)", ls_errorfromSQL)
	if Len(ls_errorfromSQL) > 0 then
		if (SQLCA.sqlCode <> 0) then
			messagebox("Erreur:",ls_errorfromSQL)
		end if
		return
	else
		dw_xls.create(ls_newsyntax, ls_errorcreate)
		if Len(ls_errorcreate) > 0 then
			messagebox("Erreur","Erreur de création de la datawindow")
			return
		end if
	end if
	dw_xls.SetTransObject(SQLCA)
	dw_xls.Retrieve()
	dw_xls.saveAs("c:\ii4net\orthotek\horaire.xls",Excel5!,True)
	messagebox("Information!","Un fichier xls a été crée")
end event

event ue_afftooltip(integer as_nomcol);//string ls_nomcol
//
//ls_nomcol = dwo.name
//
//if left(dwo.name,11) = 'patient_nom' and row > 0 then
//	st_tooltip.text = "Marche"
////	st_tooltip.text = getItemString(row, 't_patients_alertmednote')
//	if isNull(st_tooltip.text) then st_tooltip.text = ''
//	if st_tooltip.text = '' then
//		st_tooltip.visible = false
//	else
//		st_tooltip.width = len(st_tooltip.text) * 35
//		st_tooltip.x = this.x + long(describe(ls_nomcol + ".x")) + long(describe(ls_nomcol + ".width")) - st_tooltip.width
//		st_tooltip.y = this.y + PixelsToUnits(ypos, YPixelsToUnits!)
//		st_tooltip.visible = true
//	end if
//else
//	st_tooltip.visible = false
//end if
//
end event

event doubleclicked;if row > 0 and (left(dwo.name, 12) = 'patient_nom_' or left(dwo.name, 2) = 'dt') then f_insert(this)

end event

event rbuttondown;integer li_col,li_adjustsector, li_
string ls_col,ls_hormenuchoix1, ls_newsyntax, ls_errorfromSQL
string ls_sql, ls_errorcreate
long ll_activecaba

select isnull(affchoixmenuhor,0) into :ll_activecaba from t_options where ortho_id = :v_no_ortho; 

if dwo.name = 't_xls' then
	m_popup_export my_menuexp
	my_menuexp = create m_popup_export
	m_popup_export.m_choix.popmenu (pointerx()+950, pointery()+225)
end if

if row > 0 and (left(dwo.name, 12) = 'patient_nom_' or left(dwo.name, 2) = 'dt') then
	SetFocus()
	scrolltorow(row)
	setcolumn(string(dwo.name))
	m_popup_horaire my_menu
	my_menu = create m_popup_horaire
	
	m_popup_horaire.m_choix.m_labelrdv.text = w_patient.cb_etirdv.Text + "~tF12"
	
	if v_langue = 'an' then
		m_popup_horaire.m_choix.m_modrdv.text = 'Modify [F1]'
		m_popup_horaire.m_choix.m_transfert.text = 'Transfer [F2]'
		m_popup_horaire.m_choix.m_conf.text = 'Confirm [F3]'
		m_popup_horaire.m_choix.m_memo.text = 'Memo [F4]'
		m_popup_horaire.m_choix.m_cin.text = 'Cin [F5]'
		m_popup_horaire.m_choix.m_cout.text = 'Cout [F6]'
		m_popup_horaire.m_choix.m_dosspat.text = "Patient's file [F7]"
		m_popup_horaire.m_choix.m_rap.text = 'Give a Recall [F8]'
		m_popup_horaire.m_choix.m_rvm.text = 'Missed-Broken appointment [F9]'
		m_popup_horaire.m_choix.m_rva.text = 'Canceled appointment [F10]'
		m_popup_horaire.m_choix.m_retard.text = 'Late appointment [F11]'
		//m_popup_horaire.m_choix.m_labelrdv.text = 'Print appointment label [F12]'
		m_popup_horaire.m_choix.m_delrdv.text = 'Delete'
		m_popup_horaire.m_choix.m_delconf.text = 'Delete confirm'
		m_popup_horaire.m_choix.m_annulercin.text = 'Cancel Cin'
		m_popup_horaire.m_choix.m_delmemo.text = 'Cancel memo'
		m_popup_horaire.m_choix.m_traitdispo.text = 'Available treatments'
		m_popup_horaire.m_choix.m_dossfin.text = 'Financial file'
		m_popup_horaire.m_choix.m_fact.text = 'Billing'
		m_popup_horaire.m_choix.m_paie.text = 'Payment'
		m_popup_horaire.m_choix.m_cpd.text = 'Postdated cheque'
		if ll_activecaba = 1 then
			m_popup_horaire.m_choix.m_caba.visible = true
			if len(is_hormenuchoix1) > 0 then m_popup_horaire.m_choix.m_caba.text = is_hormenuchoix1
		else
			m_popup_horaire.m_choix.m_caba.visible = false
		end if
	else
		if ll_activecaba = 1 then
			m_popup_horaire.m_choix.m_caba.visible = true
			if len(is_hormenuchoix1) > 0 then m_popup_horaire.m_choix.m_caba.text = is_hormenuchoix1
		else
			m_popup_horaire.m_choix.m_caba.visible = false
		end if
	end if
	uf_col(getcolumnname(),li_col,ls_col)
	il_patid = this.getitemnumber(row,'patient_id_'+ls_col)
	
	if getitemnumber(row,'duree'+ls_col) > 0 then
		m_popup_horaire.m_choix.m_modrdv.visible = true
		m_popup_horaire.m_choix.m_transfert.visible = true
		m_popup_horaire.m_choix.m_conf.visible = true
		m_popup_horaire.m_choix.m_delconf.visible = true
		m_popup_horaire.m_choix.m_rap.visible = true
		m_popup_horaire.m_choix.m_rvm.visible = true
		m_popup_horaire.m_choix.m_memo.visible = true
		m_popup_horaire.m_choix.m_delmemo.visible = true
		m_popup_horaire.m_choix.m_rvm.visible = true
		m_popup_horaire.m_choix.m_retard.visible = true
		m_popup_horaire.m_choix.m_rva.visible = true	
		if ll_activecaba = 1 then
			m_popup_horaire.m_choix.m_caba.visible = true
			if len(is_hormenuchoix1) > 0 then m_popup_horaire.m_choix.m_caba.text = is_hormenuchoix1
		else
			m_popup_horaire.m_choix.m_caba.visible = false
		end if
		m_popup_horaire.m_choix.m_cin.visible = true
		m_popup_horaire.m_choix.m_xray.visible = true
	else
		m_popup_horaire.m_choix.m_modrdv.visible = false
		m_popup_horaire.m_choix.m_transfert.visible = false
		m_popup_horaire.m_choix.m_conf.visible = false
		m_popup_horaire.m_choix.m_delconf.visible = false
		m_popup_horaire.m_choix.m_rap.visible = false
		m_popup_horaire.m_choix.m_rvm.visible = false
		m_popup_horaire.m_choix.m_memo.visible = false
		m_popup_horaire.m_choix.m_delmemo.visible = false
		m_popup_horaire.m_choix.m_rvm.visible = false
		m_popup_horaire.m_choix.m_retard.visible = false
		m_popup_horaire.m_choix.m_rva.visible = false
		m_popup_horaire.m_choix.m_caba.visible = false
		m_popup_horaire.m_choix.m_cin.visible = false
		m_popup_horaire.m_choix.m_xray.visible = false
	end if
	
	if not isNull(il_patid) then
		if il_patid > 0 then
			m_popup_horaire.m_choix.m_traitdispo.visible = false
		end if
	end if
	
	m_popup_horaire.m_choix.m_delrdv.visible = true
	
	m_popup_horaire.m_choix.popmenu (pointerx()+950, pointery()+225)
end if

end event

event constructor;integer li_hormodele = 1
boolean lb_resize

select horresize,isnull(hormodele,1) into :lb_resize,:li_hormodele from t_options where ortho_id = :v_no_ortho;
choose case li_hormodele
	case 2
		dw_hor.dataobject = 'd_hor_luigi' // horaire compressé 11
	case 3
		dw_hor.dataobject = 'd_hor_6col' // horaire 6 colonnes
	case 4
		dw_hor.dataobject = 'd_hor_8col' // horaire 8 colonnes
	case 5
		dw_hor.dataobject = 'd_hor_luigi12' // horaire compressé 12
	case 6
		dw_hor.dataobject = 'd_hor_luigi13' // horaire compressé 13
	case 7
		dw_hor.dataobject = 'd_hor_luigi15' // horaire compressé 15
	case else
		dw_hor.dataobject = 'd_hor' // horaire standard
end choose

if isNull(lb_resize) then lb_resize = false
if lb_resize then
	pro_resize luo_size
	luo_size.uf_resizedw(this)
end if

long i,ll_color,ll_posx,ll_pos = 471

settransobject(sqlca)
setrowfocusindicator(FocusRect!)
//semaphore
//for i = 1 to 10
//	iuo_sem[i].init(1)
//next
//set options in instance variable
select horshareid,hor_aff_pm,hor_depart_am,hor_fin_am,hor_depart_pm,hor_fin_pm,hor_step,horcolnb,chrgarret
into :il_horidspec, :ii_horaffpm,:ii_startam,:ii_endam,:ii_startpm,:ii_endpm,:ii_step,:ii_nbcol,:ii_chrgarret from t_options where ortho_id = :v_no_ortho;
//il_horidspec = v_no_ortho
select color into :ll_color from t_color where ortho_id = :v_no_ortho and hor = 1;
object.patient_nom_1.Background.Color = " 16777215 ~t If ( patient_nom_1 = '' , if ( isnull(colortemplate1) ," + string(ll_color) + ", colortemplate1 ) , couleur_text_1 ) "
object.patient_nom_2.Background.Color = " 16777215 ~t If ( patient_nom_2 = '' , if ( isnull(colortemplate2) ," + string(ll_color) + ", colortemplate2 ) , couleur_text_2 ) "
object.patient_nom_3.Background.Color = " 16777215 ~t If ( patient_nom_3 = '' , if ( isnull(colortemplate3) ," + string(ll_color) + ", colortemplate3 ) , couleur_text_3 ) "
object.patient_nom_4.Background.Color = " 16777215 ~t If ( patient_nom_4 = '' , if ( isnull(colortemplate4) ," + string(ll_color) + ", colortemplate4 ) , couleur_text_4 ) "
object.patient_nom_5.Background.Color = " 16777215 ~t If ( patient_nom_5 = '' , if ( isnull(colortemplate5) ," + string(ll_color) + ", colortemplate5 ) , couleur_text_5 ) "
object.patient_nom_6.Background.Color = " 16777215 ~t If ( patient_nom_6 = '' , if ( isnull(colortemplate6) ," + string(ll_color) + ", colortemplate6 ) , couleur_text_6 ) "
object.patient_nom_7.Background.Color = " 16777215 ~t If ( patient_nom_7 = '' , if ( isnull(colortemplate7) ," + string(ll_color) + ", colortemplate7 ) , couleur_text_7 ) "
object.patient_nom_8.Background.Color = " 16777215 ~t If ( patient_nom_8 = '' , if ( isnull(colortemplate8) ," + string(ll_color) + ", colortemplate8 ) , couleur_text_8 ) "
object.patient_nom_9.Background.Color = " 16777215 ~t If ( patient_nom_9 = '' , if ( isnull(colortemplate9) ," + string(ll_color) + ", colortemplate9 ) , couleur_text_9 ) "
object.patient_nom_10.Background.Color = " 16777215 ~t If ( patient_nom_10 = '' , if ( isnull(colortemplate10) ," + string(ll_color) + ", colortemplate10 ) , couleur_text_10 ) "
object.patient_nom_11.Background.Color = " 16777215 ~t If ( patient_nom_11 = '' , if ( isnull(colortemplate11) ," + string(ll_color) + ", colortemplate11 ) , couleur_text_11 ) "
object.patient_nom_12.Background.Color = " 16777215 ~t If ( patient_nom_12 = '' , if ( isnull(colortemplate12) ," + string(ll_color) + ", colortemplate12 ) , couleur_text_12 ) "
object.patient_nom_13.Background.Color = " 16777215 ~t If ( patient_nom_13 = '' , if ( isnull(colortemplate13) ," + string(ll_color) + ", colortemplate13 ) , couleur_text_13 ) "
object.patient_nom_14.Background.Color = " 16777215 ~t If ( patient_nom_14 = '' , if ( isnull(colortemplate14) ," + string(ll_color) + ", colortemplate14 ) , couleur_text_14 ) "
object.patient_nom_15.Background.Color = " 16777215 ~t If ( patient_nom_15 = '' , if ( isnull(colortemplate15) ," + string(ll_color) + ", colortemplate15 ) , couleur_text_15 ) "
////determiner le nb de colonnes
choose case ii_nbcol
	case 5
//		ll_pos = ll_pos * 6.15
		object.heure_3.visible = false
		object.patient_nom_6.visible = false
//		ll_posx = long(object.patient_nom_6.x)
//		object.patient_nom_6.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_6.x)
//		object.compute_6.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_6a.x)
//		object.p_6a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_6a.x2)
//		object.l_6a.x2 = string(ll_posx - ll_pos)
		object.patient_nom_7.visible = false
//		ll_posx = long(object.patient_nom_7.x)
//		object.patient_nom_7.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_7.x)
//		object.compute_7.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_7a.x)
//		object.p_7a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_7a.x2)
//		object.l_7a.x2 = string(ll_posx - ll_pos)
		object.patient_nom_8.visible = false
//		ll_posx = long(object.patient_nom_8.x)
//		object.patient_nom_8.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_8.x)
//		object.compute_8.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_8a.x)
//		object.p_8a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_8a.x2)
//		object.l_8a.x2 = string(ll_posx - ll_pos)
		object.patient_nom_9.visible = false
//		ll_posx = long(object.patient_nom_9.x)
//		object.patient_nom_9.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_9.x)
//		object.compute_9.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_9a.x)
//		object.p_9a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_9a.x2)
//		object.l_9a.x2 = string(ll_posx - ll_pos)
		object.patient_nom_10.visible = false
//		ll_posx = long(object.patient_nom_10.x)
//		object.patient_nom_10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_10.x)
//		object.compute_10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_10a.x)
//		object.p_10a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_10a.x2)
//		object.l_10a.x2 = string(ll_posx - ll_pos)
		object.heure_2.visible = false
//		ll_posx = long(object.heure_2.x)
//		object.heure_2.x = string(ll_posx - ll_pos)
//		object.t_00.visible = false
//		ll_posx = long(object.t_00.x)
//		object.t_00.x = string(ll_posx - ll_pos)
		object.dt6.visible = false
//		ll_posx = long(object.dt6.x)
//		object.dt6.x = string(ll_posx - ll_pos)
		object.dt7.visible = false
//		ll_posx = long(object.dt7.x)
//		object.dt7.x = string(ll_posx - ll_pos)
		object.dt8.visible = false
//		ll_posx = long(object.dt8.x)
//		object.dt8.x = string(ll_posx - ll_pos)
		object.dt9.visible = false
//		ll_posx = long(object.dt9.x)
//		object.dt9.x = string(ll_posx - ll_pos)
		object.dt10.visible = false
//		ll_posx = long(object.dt10.x)
//		object.dt10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_6.x2)
//		object.l_6.x2 = string(ll_posx - ll_pos)
		object.t_6.visible = false
//		ll_posx = long(object.t_6.x)
//		object.t_6.x = string(ll_posx - ll_pos)
		object.t_7.visible = false
//		ll_posx = long(object.t_7.x)
//		object.t_7.x = string(ll_posx - ll_pos)
		object.t_8.visible = false
//		ll_posx = long(object.t_8.x)
//		object.t_8.x = string(ll_posx - ll_pos)
		object.t_9.visible = false
//		ll_posx = long(object.t_9.x)
//		object.t_9.x = string(ll_posx - ll_pos)
		object.t_10.visible = false
//		ll_posx = long(object.t_10.x)
//		object.t_10.x = string(ll_posx - ll_pos)
		this.HScrollBar = false
		object.patient_nom_11.visible = false
		object.t_11.visible = false
		object.patient_nom_12.visible = false
		object.t_12.visible = false
		object.patient_nom_13.visible = false
		object.t_13.visible = false
		object.patient_nom_14.visible = false
		object.t_14.visible = false
		object.patient_nom_15.visible = false
		object.t_15.visible = false
		object.heure_2_1.visible = false
		object.heure_2_2.visible = false
		object.t_d11.visible = false
		object.t_d12.visible = false
		object.t_d13.visible = false
		object.t_d14.visible = false
		object.t_d15.visible = false
		object.dt11.visible = false
		object.dt12.visible = false
		object.dt13.visible = false
		object.dt14.visible = false
		object.dt15.visible = false
	case 6
//		ll_pos = ll_pos * 4
		object.patient_nom_7.visible = false
//		ll_posx = long(object.patient_nom_7.x)
//		object.patient_nom_7.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_7.x)
//		object.compute_7.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_7a.x)
//		object.p_7a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_7a.x2)
//		object.l_7a.x2 = string(ll_posx - ll_pos)
		object.patient_nom_8.visible = false
//		ll_posx = long(object.patient_nom_8.x)
//		object.patient_nom_8.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_8.x)
//		object.compute_8.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_8a.x)
//		object.p_8a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_8a.x2)
//		object.l_8a.x2 = string(ll_posx - ll_pos)
		object.patient_nom_9.visible = false
//		ll_posx = long(object.patient_nom_9.x)
//		object.patient_nom_9.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_9.x)
//		object.compute_9.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_9a.x)
//		object.p_9a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_9a.x2)
//		object.l_9a.x2 = string(ll_posx - ll_pos)
		object.patient_nom_10.visible = false
//		ll_posx = long(object.patient_nom_10.x)
//		object.patient_nom_10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_10.x)
//		object.compute_10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_10a.x)
//		object.p_10a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_10a.x2)
//		object.l_10a.x2 = string(ll_posx - ll_pos)
//		
//		ll_posx = long(object.heure_2.x)
//		object.heure_2.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.t_00.x)
//		object.t_00.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt6.x)
//		object.dt6.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt7.x)
//		object.dt7.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt8.x)
//		object.dt8.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt9.x)
//		object.dt9.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt10.x)
//		object.dt10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_6.x2)
//		object.l_6.x2 = string(ll_posx - ll_pos)
		object.t_7.visible = false
//		ll_posx = long(object.t_7.x)
//		object.t_7.x = string(ll_posx - ll_pos)
		object.t_8.visible = false
//		ll_posx = long(object.t_8.x)
//		object.t_8.x = string(ll_posx - ll_pos)
		object.t_9.visible = false
//		ll_posx = long(object.t_9.x)
//		object.t_9.x = string(ll_posx - ll_pos)
		object.t_10.visible = false
//		ll_posx = long(object.t_10.x)
//		object.t_10.x = string(ll_posx - ll_pos)
		object.patient_nom_11.visible = false
		object.t_11.visible = false
		object.patient_nom_12.visible = false
		object.t_12.visible = false
		object.patient_nom_13.visible = false
		object.t_13.visible = false
		object.patient_nom_14.visible = false
		object.t_14.visible = false
		object.patient_nom_15.visible = false
		object.t_15.visible = false
		object.heure_2_1.visible = false
		object.heure_2_2.visible = false
		object.t_d11.visible = false
		object.t_d12.visible = false
		object.t_d13.visible = false
		object.t_d14.visible = false
		object.t_d15.visible = false
		object.dt11.visible = false
		object.dt12.visible = false
		object.dt13.visible = false
		object.dt14.visible = false
		object.dt15.visible = false
	case 7
//		ll_pos = ll_pos * 3
		object.patient_nom_8.visible = false
//		ll_posx = long(object.patient_nom_8.x)
//		object.patient_nom_8.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_8.x)
//		object.compute_8.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_8a.x)
//		object.p_8a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_8a.x2)
//		object.l_8a.x2 = string(ll_posx - ll_pos)
		object.patient_nom_9.visible = false
//		ll_posx = long(object.patient_nom_9.x)
//		object.patient_nom_9.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_9.x)
//		object.compute_9.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_9a.x)
//		object.p_9a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_9a.x2)
//		object.l_9a.x2 = string(ll_posx - ll_pos)
		object.patient_nom_10.visible = false
//		ll_posx = long(object.patient_nom_10.x)
//		object.patient_nom_10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_10.x)
//		object.compute_10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_10a.x)
//		object.p_10a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_10a.x2)
//		object.l_10a.x2 = string(ll_posx - ll_pos)
//		
//		ll_posx = long(object.heure_2.x)
//		object.heure_2.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.t_00.x)
//		object.t_00.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt6.x)
//		object.dt6.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt7.x)
//		object.dt7.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt8.x)
//		object.dt8.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt9.x)
//		object.dt9.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt10.x)
//		object.dt10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_6.x2)
//		object.l_6.x2 = string(ll_posx - ll_pos)
		object.t_8.visible = false
//		ll_posx = long(object.t_8.x)
//		object.t_8.x = string(ll_posx - ll_pos)
		object.t_9.visible = false
//		ll_posx = long(object.t_9.x)
//		object.t_9.x = string(ll_posx - ll_pos)
		object.t_10.visible = false
//		ll_posx = long(object.t_10.x)
//		object.t_10.x = string(ll_posx - ll_pos)
		object.patient_nom_11.visible = false
		object.t_11.visible = false
		object.patient_nom_12.visible = false
		object.t_12.visible = false
		object.patient_nom_13.visible = false
		object.t_13.visible = false
		object.patient_nom_14.visible = false
		object.t_14.visible = false
		object.patient_nom_15.visible = false
		object.t_15.visible = false
		object.heure_2_1.visible = false
		object.heure_2_2.visible = false
		object.t_d11.visible = false
		object.t_d12.visible = false
		object.t_d13.visible = false
		object.t_d14.visible = false
		object.t_d15.visible = false
		object.dt11.visible = false
		object.dt12.visible = false
		object.dt13.visible = false
		object.dt14.visible = false
		object.dt15.visible = false
	case 8
//		ll_pos = ll_pos * 2
		object.patient_nom_9.visible = false
//		ll_posx = long(object.patient_nom_9.x)
//		object.patient_nom_9.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_9.x)
//		object.compute_9.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_9a.x)
//		object.p_9a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_9a.x2)
//		object.l_9a.x2 = string(ll_posx - ll_pos)
		object.patient_nom_10.visible = false
//		ll_posx = long(object.patient_nom_10.x)
//		object.patient_nom_10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_10.x)
//		object.compute_10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_10a.x)
//		object.p_10a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_10a.x2)
//		object.l_10a.x2 = string(ll_posx - ll_pos)
//		
//		ll_posx = long(object.heure_2.x)
//		object.heure_2.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.t_00.x)
//		object.t_00.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt6.x)
//		object.dt6.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt7.x)
//		object.dt7.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt8.x)
//		object.dt8.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt9.x)
//		object.dt9.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt10.x)
//		object.dt10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_6.x2)
//		object.l_6.x2 = string(ll_posx - ll_pos)
		object.t_9.visible = false
//		ll_posx = long(object.t_9.x)
//		object.t_9.x = string(ll_posx - ll_pos)
		object.t_10.visible = false
//		ll_posx = long(object.t_10.x)
//		object.t_10.x = string(ll_posx - ll_pos)
		object.patient_nom_11.visible = false
		object.t_11.visible = false
		object.patient_nom_12.visible = false
		object.t_12.visible = false
		object.patient_nom_13.visible = false
		object.t_13.visible = false
		object.patient_nom_14.visible = false
		object.t_14.visible = false
		object.patient_nom_15.visible = false
		object.t_15.visible = false
		object.heure_2_1.visible = false
		object.heure_2_2.visible = false
		object.t_d11.visible = false
		object.t_d12.visible = false
		object.t_d13.visible = false
		object.t_d14.visible = false
		object.t_d15.visible = false
		object.dt11.visible = false
		object.dt12.visible = false
		object.dt13.visible = false
		object.dt14.visible = false
		object.dt15.visible = false
	case 9
//		ll_pos = ll_pos * 1
		object.patient_nom_10.visible = false
//		ll_posx = long(object.patient_nom_10.x)
//		object.patient_nom_10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.compute_10.x)
//		object.compute_10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.p_10a.x)
//		object.p_10a.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_10a.x2)
//		object.l_10a.x2 = string(ll_posx - ll_pos)
//		
//		ll_posx = long(object.heure_2.x)
//		object.heure_2.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.t_00.x)
//		object.t_00.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt6.x)
//		object.dt6.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt7.x)
//		object.dt7.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt8.x)
//		object.dt8.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt9.x)
//		object.dt9.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.dt10.x)
//		object.dt10.x = string(ll_posx - ll_pos)
//		ll_posx = long(object.l_6.x2)
//		object.l_6.x2 = string(ll_posx - ll_pos)
		object.t_10.visible = false
//		ll_posx = long(object.t_10.x)
//		object.t_10.x = string(ll_posx - ll_pos)
		object.patient_nom_11.visible = false
		object.t_11.visible = false
		object.patient_nom_12.visible = false
		object.t_12.visible = false
		object.patient_nom_13.visible = false
		object.t_13.visible = false
		object.patient_nom_14.visible = false
		object.t_14.visible = false
		object.patient_nom_15.visible = false
		object.t_15.visible = false
		object.heure_2_1.visible = false
		object.heure_2_2.visible = false
		object.t_d11.visible = false
		object.t_d12.visible = false
		object.t_d13.visible = false
		object.t_d14.visible = false
		object.t_d15.visible = false
		object.dt11.visible = false
		object.dt12.visible = false
		object.dt13.visible = false
		object.dt14.visible = false
		object.dt15.visible = false
	case 10
		object.patient_nom_11.visible = false
		object.t_11.visible = false
		object.patient_nom_12.visible = false
		object.t_12.visible = false
		object.patient_nom_13.visible = false
		object.t_13.visible = false
		object.patient_nom_14.visible = false
		object.t_14.visible = false
		object.patient_nom_15.visible = false
		object.t_15.visible = false
		object.heure_2_1.visible = false
		object.heure_2_2.visible = false
		object.t_d11.visible = false
		object.t_d12.visible = false
		object.t_d13.visible = false
		object.t_d14.visible = false
		object.t_d15.visible = false
		object.dt11.visible = false
		object.dt12.visible = false
		object.dt13.visible = false
		object.dt14.visible = false
		object.dt15.visible = false
	case 11
		object.patient_nom_12.visible = false
		object.t_12.visible = false
		object.patient_nom_13.visible = false
		object.t_13.visible = false
		object.patient_nom_14.visible = false
		object.t_14.visible = false
		object.patient_nom_15.visible = false
		object.t_15.visible = false
	case 12
		object.patient_nom_13.visible = false
		object.t_13.visible = false
		object.patient_nom_14.visible = false
		object.t_14.visible = false
		object.patient_nom_15.visible = false
		object.t_15.visible = false
	case 13
		object.patient_nom_14.visible = false
		object.t_14.visible = false
		object.patient_nom_15.visible = false
		object.t_15.visible = false
	case 14
		object.patient_nom_15.visible = false
		object.t_15.visible = false
		
end choose

end event

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

if sqldbcode = -210 then
	return 1
else
	
	//open the error window
	OpenWithParm ( w_error , ErrorStr )
	//do not display the error message
	RETURN 1
end if

//IF sqldbcode = -3 THEN
//		MessageBox("Avertissement",  "Une autre personne a entrée des données sur cette plage!")
//END IF
//RETURN 1

end event

event clicked;integer li_col,li_aff
string ls_col

if row > 0 and (left(dwo.name, 12) = 'patient_nom_' or left(dwo.name, 2) = 'dt') then
	select horaffdetailpat into :li_aff from t_options where ortho_id = :v_no_ortho;
	if li_aff = 1 then detailspatient(row,dwo.name)
	uf_col(dwo.name,li_col,ls_col)
	if ls_col <> '' then
		il_patid = this.getitemnumber(row,'patient_id_'+ls_col)
		w_principal.SetMicroHelp('Horaire (' + string(il_patid) + ')')
	end if
end if
end event

event dragdrop;//setfocus()
//scrolltorow(row)
//setcolumn(string(dwo.name))
////messagebox(string(row),string(dwo.name))
////openwithparm(w_horbox2hor,dw_hortmp.getitemnumber(dw_hortmp.getrow(),'patid'),w_horaire)
//if is_pat.duree > 0 then
//	f_insert(this)
//	dw_hortmp.event ue_deletecurrentrow()
//end if
end event

event editchanged;integer li_col
long ll_idpat
string ls_col, ls_sql, ls_data
date ldt_datecal
time lt_heure
datetime ldtt_dateheure
boolean lb_del = false

w_horaire.event ue_timer(0)
ii_written = 1

uf_col(dwo.name, li_col, ls_col)
//
	ll_idpat = getitemnumber(row,"patient_id_"+ls_col)
//end if
if isnull(ll_idpat) then ll_idpat = 0
if ll_idpat > 0 and getitemnumber(row,"duree"+ls_col) > 0 then
	messagebox("Avertissement!","Il n'est pas permis de modifier ce champ.",Information!)
	uf_setsync()
else
	if keydown(keyback!) or keydown(keydelete!) then
		if ll_idpat > 0 then
			lb_del = true
		end if
	end if
	if len(data) > 0 or not lb_del then
		ldt_datecal = getitemdate(row,'datecal')
		lt_heure = getitemtime(row,'heure')
		// barre plage
		if not ib_uptwrite then
			INSERT INTO t_horlock(ortho_id,hordate,col,id_personnel) VALUES (:il_horidspec,:istr_cal.caldate,:li_col,:gl_idpers);
			if error_type(-1) = 1 then
				commit using SQLCA;
			else
				rollback using SQLCA;
			end if
			ib_uptwrite = true
		end if
		ls_data = rep(data,"'","''")
		if left(dwo.name,2) = 'pa' then
			ls_sql = "update horaire set patient_nom_" + ls_col + " = '" + ls_data + "' WHERE no_ortho = " + string(il_horidspec) + " and datecal = '" + string(ldt_datecal,'yyyy-mm-dd') + "' and heure = '" + string(lt_heure) + "'"
		else
			ls_sql = "update horaire set dt" + ls_col + " = '" + ls_data + "' WHERE no_ortho = " + string(il_horidspec) + " and datecal = '" + string(ldt_datecal,'yyyy-mm-dd') + "' and heure = '" + string(lt_heure) + "'"
		end if
		execute immediate :ls_sql;
		commit using SQLCA;
//		idtt_horsync = datetime(today(),now())
	else
		event post undoEditChanged(row,"patient_nom_" + ls_col)
	end if
end if
w_horaire.event ue_timer(id_timer)
end event

