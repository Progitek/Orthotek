$PBExportHeader$w_horaire_template1.srw
forward
global type w_horaire_template1 from w_child
end type
type em_datefin from editmask within w_horaire_template1
end type
type dw_color_traitements from u_dw within w_horaire_template1
end type
type rb_standard from radiobutton within w_horaire_template1
end type
type rb_futur from radiobutton within w_horaire_template1
end type
type st_1 from statictext within w_horaire_template1
end type
type em_date_5 from editmask within w_horaire_template1
end type
type em_date_4 from editmask within w_horaire_template1
end type
type em_date_3 from editmask within w_horaire_template1
end type
type em_date_2 from editmask within w_horaire_template1
end type
type em_date_1 from editmask within w_horaire_template1
end type
type uo_2 from u_calendarhor within w_horaire_template1
end type
type em_liste_nb from editmask within w_horaire_template1
end type
type pb_moins from picturebutton within w_horaire_template1
end type
type pb_plus from picturebutton within w_horaire_template1
end type
type ddlb_mois from dropdownlistbox within w_horaire_template1
end type
type rb_pm from radiobutton within w_horaire_template1
end type
type rb_am from radiobutton within w_horaire_template1
end type
type cb_close from commandbutton within w_horaire_template1
end type
type gb_semaine from groupbox within w_horaire_template1
end type
type gb_1 from groupbox within w_horaire_template1
end type
type gb_2 from groupbox within w_horaire_template1
end type
type dw_sem_pm_5 from u_dw within w_horaire_template1
end type
type dw_sem_pm_4 from u_dw within w_horaire_template1
end type
type dw_sem_pm_3 from u_dw within w_horaire_template1
end type
type dw_sem_pm_2 from u_dw within w_horaire_template1
end type
type dw_sem_am_5 from u_dw within w_horaire_template1
end type
type dw_sem_am_4 from u_dw within w_horaire_template1
end type
type dw_sem_am_3 from u_dw within w_horaire_template1
end type
type dw_sem_am_2 from u_dw within w_horaire_template1
end type
type dw_sem_am_1 from u_dw within w_horaire_template1
end type
type dw_sem_pm_1 from u_dw within w_horaire_template1
end type
end forward

global type w_horaire_template1 from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
boolean toolbarvisible = false
boolean ib_isupdateable = false
event ue_post_open ( )
em_datefin em_datefin
dw_color_traitements dw_color_traitements
rb_standard rb_standard
rb_futur rb_futur
st_1 st_1
em_date_5 em_date_5
em_date_4 em_date_4
em_date_3 em_date_3
em_date_2 em_date_2
em_date_1 em_date_1
uo_2 uo_2
em_liste_nb em_liste_nb
pb_moins pb_moins
pb_plus pb_plus
ddlb_mois ddlb_mois
rb_pm rb_pm
rb_am rb_am
cb_close cb_close
gb_semaine gb_semaine
gb_1 gb_1
gb_2 gb_2
dw_sem_pm_5 dw_sem_pm_5
dw_sem_pm_4 dw_sem_pm_4
dw_sem_pm_3 dw_sem_pm_3
dw_sem_pm_2 dw_sem_pm_2
dw_sem_am_5 dw_sem_am_5
dw_sem_am_4 dw_sem_am_4
dw_sem_am_3 dw_sem_am_3
dw_sem_am_2 dw_sem_am_2
dw_sem_am_1 dw_sem_am_1
dw_sem_pm_1 dw_sem_pm_1
end type
global w_horaire_template1 w_horaire_template1

type variables
long enrrech,change_am = 0, change_pm = 0
string vi_refresh



end variables

forward prototypes
public subroutine jour2 (long couleur)
public subroutine jour3 (long couleur)
public subroutine jour4 (long couleur)
public subroutine jour1 (long couleur)
public subroutine jour5 (long couleur)
public subroutine refresh (string win)
public function long type_couleur (long row, string colonne, datawindow win)
public subroutine unselecteddata (string colonne, long row, datawindow win)
public subroutine selectedfutur (time lt_heure, long orthoid, date ld_datecal, string colonne, long row)
public subroutine affichage_creation ()
public subroutine selecteddata (string colonne, long row, datawindow win)
end prototypes

event ue_post_open();date sem
int v_hor_aff_pm
istr_cal2.caldate = istr_cal.caldate
sem = istr_cal2.caldate

CHOOSE CASE DayNumber(sem)

CASE 1
	istr_cal2.caldate = relativedate(sem,+1)
	uo_2.uf_InitCal(istr_cal2.caldate)
	uo_2.PostEvent("ue_aff_horaire")

CASE 2
	uo_2.uf_InitCal(istr_cal2.caldate)
	uo_2.PostEvent("ue_aff_horaire")
	
CASE 3
	istr_cal2.caldate = relativedate(sem,-1)
	uo_2.uf_InitCal(istr_cal2.caldate)
	uo_2.PostEvent("ue_aff_horaire")

CASE 4
	istr_cal2.caldate = relativedate(sem,-2)
	uo_2.uf_InitCal(istr_cal2.caldate)
	uo_2.PostEvent("ue_aff_horaire")
	
CASE 5
	istr_cal2.caldate = relativedate(sem,-3)
	uo_2.uf_InitCal(istr_cal2.caldate)
	uo_2.PostEvent("ue_aff_horaire")
	
CASE 6
	istr_cal2.caldate = relativedate(sem,-4)
	uo_2.uf_InitCal(istr_cal2.caldate)
	uo_2.PostEvent("ue_aff_horaire")
	
CASE 7
	istr_cal2.caldate = relativedate(sem,-5)
	uo_2.uf_InitCal(istr_cal2.caldate)
	uo_2.PostEvent("ue_aff_horaire")
	
CASE ELSE
	Messagebox("ERREUR", "Incapable de choisir un lundi!",StopSign!)
	close(w_horaire_template1)

END CHOOSE

dw_sem_pm_1.visible=false
dw_sem_pm_2.visible=false
dw_sem_pm_3.visible=false
dw_sem_pm_4.visible=false
dw_sem_pm_5.visible=false
//verification option
select hor_aff_pm into :v_hor_aff_pm from t_options;
if v_hor_aff_pm = 0 then
	rb_am.visible = false
	rb_pm.visible = false
end if
	

end event

public subroutine jour2 (long couleur);long nb_row, j, v_id_traitement, v_check_cpd, v_couleur, v_check_i, u, id, v_id_patient
time v_heure_rv
date v_date_rv
dec{2} v_montant_paye, v_montant_original
string v_traitement, v_check_s

dw_sem_am_2.scrolltorow(0)
nb_row = dw_sem_am_2.rowcount()
if nb_row > 0 then
	v_date_rv = dw_sem_am_2.getitemdate(1,"datecal")
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = dw_sem_am_2.getitemtime(j,"heure")
		v_id_patient = dw_sem_am_2.getitemnumber(j,"patient_id_1")
		v_couleur = dw_sem_am_2.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_2.getitemstring(u,"patient_nom_1")
			v_check_i = dw_sem_am_2.getitemnumber(u,"patient_id_1")
			if upper(v_check_s) <> "X" and not v_check_s = "" and v_check_i = 0 then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,1, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_2.getitemnumber(j,"patient_id_2")
		v_couleur = dw_sem_am_2.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_2.getitemstring(u,"patient_nom_2")
			v_check_i = dw_sem_am_2.getitemnumber(u,"patient_id_2")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,2, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_2.getitemnumber(j,"patient_id_3")
		v_couleur = dw_sem_am_2.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_2.getitemstring(u,"patient_nom_3")
			v_check_i = dw_sem_am_2.getitemnumber(u,"patient_id_3")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,3, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_2.getitemnumber(j,"patient_id_4")
		v_couleur = dw_sem_am_2.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_2.getitemstring(u,"patient_nom_4")
			v_check_i = dw_sem_am_2.getitemnumber(u,"patient_id_4")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,4, :v_traitement);
			commit;
		end if
	next
	dw_sem_pm_2.scrolltorow(0)
	nb_row = dw_sem_pm_2.rowcount()
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = dw_sem_pm_2.getitemtime(j,"heure")	
		v_id_patient = dw_sem_pm_2.getitemnumber(j,"patient_id_1")
		v_couleur = dw_sem_pm_2.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_2.getitemstring(u,"patient_nom_1")
			v_check_i = dw_sem_pm_2.getitemnumber(u,"patient_id_1")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,1, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_2.getitemnumber(j,"patient_id_2")
		v_couleur = dw_sem_pm_2.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_2.getitemstring(u,"patient_nom_2")
			v_check_i = dw_sem_pm_2.getitemnumber(u,"patient_id_2")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,2, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_2.getitemnumber(j,"patient_id_3")
		v_couleur = dw_sem_pm_2.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_2.getitemstring(u,"patient_nom_3")
			v_check_i = dw_sem_pm_2.getitemnumber(u,"patient_id_3")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,3, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_2.getitemnumber(j,"patient_id_4")
		v_couleur = dw_sem_pm_2.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_2.getitemstring(u,"patient_nom_4")
			v_check_i = dw_sem_pm_2.getitemnumber(u,"patient_id_4")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,4, :v_traitement);
			commit;
		end if
	next
end if

end subroutine

public subroutine jour3 (long couleur);long nb_row, j, v_id_traitement, v_check_cpd, v_couleur, v_check_i, u, id, v_id_patient
time v_heure_rv
date v_date_rv
dec{2} v_montant_paye, v_montant_original
string v_traitement, v_check_s

dw_sem_am_3.scrolltorow(0)
nb_row = dw_sem_am_3.rowcount()
if nb_row > 0 then
	v_date_rv = dw_sem_am_3.getitemdate(1,"datecal")
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = dw_sem_am_3.getitemtime(j,"heure")
		v_id_patient = dw_sem_am_3.getitemnumber(j,"patient_id_1")
		v_couleur = dw_sem_am_3.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_3.getitemstring(u,"patient_nom_1")
			v_check_i = dw_sem_am_3.getitemnumber(u,"patient_id_1")
			if upper(v_check_s) <> "X" and not v_check_s = "" and v_check_i = 0 then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,1, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_3.getitemnumber(j,"patient_id_2")
		v_couleur = dw_sem_am_3.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_3.getitemstring(u,"patient_nom_2")
			v_check_i = dw_sem_am_3.getitemnumber(u,"patient_id_2")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,2, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_3.getitemnumber(j,"patient_id_3")
		v_couleur = dw_sem_am_3.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_3.getitemstring(u,"patient_nom_3")
			v_check_i = dw_sem_am_3.getitemnumber(u,"patient_id_3")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,3, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_3.getitemnumber(j,"patient_id_4")
		v_couleur = dw_sem_am_3.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_3.getitemstring(u,"patient_nom_4")
			v_check_i = dw_sem_am_3.getitemnumber(u,"patient_id_4")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,4, :v_traitement);
			commit;
		end if
	next
	dw_sem_pm_3.scrolltorow(0)
	nb_row = dw_sem_pm_3.rowcount()
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = dw_sem_pm_3.getitemtime(j,"heure")	
		v_id_patient = dw_sem_pm_3.getitemnumber(j,"patient_id_1")
		v_couleur = dw_sem_pm_3.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_3.getitemstring(u,"patient_nom_1")
			v_check_i = dw_sem_pm_3.getitemnumber(u,"patient_id_1")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,1, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_3.getitemnumber(j,"patient_id_2")
		v_couleur = dw_sem_pm_3.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_3.getitemstring(u,"patient_nom_2")
			v_check_i = dw_sem_pm_3.getitemnumber(u,"patient_id_2")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,2, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_3.getitemnumber(j,"patient_id_3")
		v_couleur = dw_sem_pm_3.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_3.getitemstring(u,"patient_nom_3")
			v_check_i = dw_sem_pm_3.getitemnumber(u,"patient_id_3")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,3, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_3.getitemnumber(j,"patient_id_4")
		v_couleur = dw_sem_pm_3.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_3.getitemstring(u,"patient_nom_4")
			v_check_i = dw_sem_pm_3.getitemnumber(u,"patient_id_4")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,4, :v_traitement);
			commit;
		end if
	next
end if

end subroutine

public subroutine jour4 (long couleur);long nb_row, j, v_id_traitement, v_check_cpd, v_couleur, v_check_i, u, id, v_id_patient
time v_heure_rv
date v_date_rv
dec{2} v_montant_paye, v_montant_original
string v_traitement, v_check_s

dw_sem_am_4.scrolltorow(0)
nb_row = dw_sem_am_4.rowcount()
if nb_row > 0 then
	v_date_rv = dw_sem_am_4.getitemdate(1,"datecal")
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = dw_sem_am_4.getitemtime(j,"heure")
		v_id_patient = dw_sem_am_4.getitemnumber(j,"patient_id_1")
		v_couleur = dw_sem_am_4.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_4.getitemstring(u,"patient_nom_1")
			v_check_i = dw_sem_am_4.getitemnumber(u,"patient_id_1")
			if upper(v_check_s) <> "X" and not v_check_s = "" and v_check_i = 0 then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,1, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_4.getitemnumber(j,"patient_id_2")
		v_couleur = dw_sem_am_4.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_4.getitemstring(u,"patient_nom_2")
			v_check_i = dw_sem_am_4.getitemnumber(u,"patient_id_2")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,2, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_4.getitemnumber(j,"patient_id_3")
		v_couleur = dw_sem_am_4.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_4.getitemstring(u,"patient_nom_3")
			v_check_i = dw_sem_am_4.getitemnumber(u,"patient_id_3")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,3, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_4.getitemnumber(j,"patient_id_4")
		v_couleur = dw_sem_am_4.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_4.getitemstring(u,"patient_nom_4")
			v_check_i = dw_sem_am_4.getitemnumber(u,"patient_id_4")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,4, :v_traitement);
			commit;
		end if
	next
	dw_sem_pm_4.scrolltorow(0)
	nb_row = dw_sem_pm_4.rowcount()
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = dw_sem_pm_4.getitemtime(j,"heure")	
		v_id_patient = dw_sem_pm_4.getitemnumber(j,"patient_id_1")
		v_couleur = dw_sem_pm_4.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_4.getitemstring(u,"patient_nom_1")
			v_check_i = dw_sem_pm_4.getitemnumber(u,"patient_id_1")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,1, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_4.getitemnumber(j,"patient_id_2")
		v_couleur = dw_sem_pm_4.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_4.getitemstring(u,"patient_nom_2")
			v_check_i = dw_sem_pm_4.getitemnumber(u,"patient_id_2")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,2, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_4.getitemnumber(j,"patient_id_3")
		v_couleur = dw_sem_pm_4.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_4.getitemstring(u,"patient_nom_3")
			v_check_i = dw_sem_pm_4.getitemnumber(u,"patient_id_3")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,3, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_4.getitemnumber(j,"patient_id_4")
		v_couleur = dw_sem_pm_4.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_4.getitemstring(u,"patient_nom_4")
			v_check_i = dw_sem_pm_4.getitemnumber(u,"patient_id_4")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,4, :v_traitement);
			commit;
		end if
	next
end if

end subroutine

public subroutine jour1 (long couleur);long nb_row, j, v_id_traitement, v_check_cpd, v_couleur, v_check_i, u, id, v_id_patient
time v_heure_rv
date v_date_rv
dec{2} v_montant_paye, v_montant_original
string v_traitement, v_check_s

dw_sem_am_1.scrolltorow(0)
nb_row = dw_sem_am_1.rowcount()
if nb_row > 0 then
	v_date_rv = dw_sem_am_1.getitemdate(1,"datecal")
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = dw_sem_am_1.getitemtime(j,"heure")
		v_id_patient = dw_sem_am_1.getitemnumber(j,"patient_id_1")
		v_couleur = dw_sem_am_1.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_1.getitemstring(u,"patient_nom_1")
			v_check_i = dw_sem_am_1.getitemnumber(u,"patient_id_1")
			if upper(v_check_s) <> "X" and not v_check_s = "" and v_check_i = 0 then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,1, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_1.getitemnumber(j,"patient_id_2")
		v_couleur = dw_sem_am_1.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_1.getitemstring(u,"patient_nom_2")
			v_check_i = dw_sem_am_1.getitemnumber(u,"patient_id_2")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,2, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_1.getitemnumber(j,"patient_id_3")
		v_couleur = dw_sem_am_1.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_1.getitemstring(u,"patient_nom_3")
			v_check_i = dw_sem_am_1.getitemnumber(u,"patient_id_3")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,3, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_1.getitemnumber(j,"patient_id_4")
		v_couleur = dw_sem_am_1.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_1.getitemstring(u,"patient_nom_4")
			v_check_i = dw_sem_am_1.getitemnumber(u,"patient_id_4")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,4, :v_traitement);
			commit;
		end if
	next
end if
	dw_sem_pm_1.scrolltorow(0)
	nb_row = dw_sem_pm_1.rowcount()
	if nb_row > 0 then
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = dw_sem_pm_1.getitemtime(j,"heure")	
		v_id_patient = dw_sem_pm_1.getitemnumber(j,"patient_id_1")
		v_couleur = dw_sem_pm_1.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_1.getitemstring(u,"patient_nom_1")
			v_check_i = dw_sem_pm_1.getitemnumber(u,"patient_id_1")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,1, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_1.getitemnumber(j,"patient_id_2")
		v_couleur = dw_sem_pm_1.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_1.getitemstring(u,"patient_nom_2")
			v_check_i = dw_sem_pm_1.getitemnumber(u,"patient_id_2")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,2, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_1.getitemnumber(j,"patient_id_3")
		v_couleur = dw_sem_pm_1.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_1.getitemstring(u,"patient_nom_3")
			v_check_i = dw_sem_pm_1.getitemnumber(u,"patient_id_3")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,3, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_1.getitemnumber(j,"patient_id_4")
		v_couleur = dw_sem_pm_1.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_1.getitemstring(u,"patient_nom_4")
			v_check_i = dw_sem_pm_1.getitemnumber(u,"patient_id_4")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,4, :v_traitement);
			commit;
		end if
	next
end if

end subroutine

public subroutine jour5 (long couleur);long nb_row, j, v_id_traitement, v_check_cpd, v_couleur, v_check_i, u, id, v_id_patient
time v_heure_rv
date v_date_rv
dec{2} v_montant_paye, v_montant_original
string v_traitement, v_check_s

dw_sem_am_5.scrolltorow(0)
nb_row = dw_sem_am_5.rowcount()
if nb_row > 0 then
	v_date_rv = dw_sem_am_5.getitemdate(1,"datecal")
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = dw_sem_am_5.getitemtime(j,"heure")
		v_id_patient = dw_sem_am_5.getitemnumber(j,"patient_id_1")
		v_couleur = dw_sem_am_5.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_5.getitemstring(u,"patient_nom_1")
			v_check_i = dw_sem_am_5.getitemnumber(u,"patient_id_1")
			if upper(v_check_s) <> "X" and not v_check_s = "" and v_check_i = 0 then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,1, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_5.getitemnumber(j,"patient_id_2")
		v_couleur = dw_sem_am_5.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_5.getitemstring(u,"patient_nom_2")
			v_check_i = dw_sem_am_5.getitemnumber(u,"patient_id_2")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,2, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_5.getitemnumber(j,"patient_id_3")
		v_couleur = dw_sem_am_5.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_5.getitemstring(u,"patient_nom_3")
			v_check_i = dw_sem_am_5.getitemnumber(u,"patient_id_3")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,3, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_am_5.getitemnumber(j,"patient_id_4")
		v_couleur = dw_sem_am_5.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_am_5.getitemstring(u,"patient_nom_4")
			v_check_i = dw_sem_am_5.getitemnumber(u,"patient_id_4")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,4, :v_traitement);
			commit;
		end if
	next
	dw_sem_pm_5.scrolltorow(0)
	nb_row = dw_sem_pm_5.rowcount()
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = dw_sem_pm_5.getitemtime(j,"heure")	
		v_id_patient = dw_sem_pm_5.getitemnumber(j,"patient_id_1")
		v_couleur = dw_sem_pm_5.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_5.getitemstring(u,"patient_nom_1")
			v_check_i = dw_sem_pm_5.getitemnumber(u,"patient_id_1")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,1, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_5.getitemnumber(j,"patient_id_2")
		v_couleur = dw_sem_pm_5.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_5.getitemstring(u,"patient_nom_2")
			v_check_i = dw_sem_pm_5.getitemnumber(u,"patient_id_2")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,2, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_5.getitemnumber(j,"patient_id_3")
		v_couleur = dw_sem_pm_5.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_5.getitemstring(u,"patient_nom_3")
			v_check_i = dw_sem_pm_5.getitemnumber(u,"patient_id_3")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,3, :v_traitement);
			commit;
		end if
		v_traitement = ""
		v_id_patient = dw_sem_pm_5.getitemnumber(j,"patient_id_4")
		v_couleur = dw_sem_pm_5.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = dw_sem_pm_5.getitemstring(u,"patient_nom_4")
			v_check_i = dw_sem_pm_5.getitemnumber(u,"patient_id_4")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,4, :v_traitement);
			commit;
		end if
	next
end if

end subroutine

public subroutine refresh (string win);// Déclaration de variables
long enr, i
date jour
string var_nom
time var_heure
 
jour = istr_cal2.caldate 
// Déterminer la date et ajuster dropdown listbox month
ddlb_mois.selectitem(month(istr_cal2.caldate))

// Retrouve les enregistrements et inscrire les dates ds les masks

CHOOSE CASE win
   CASE "dw_sem_am_1"
		dw_sem_am_1.retrieve(istr_cal2.caldate,v_no_ortho)
	CASE "dw_sem_am_2"
		jour = relativedate(istr_cal2.caldate, +1)
		dw_sem_am_2.retrieve(jour,v_no_ortho)
	CASE "dw_sem_am_3"
		jour = relativedate(istr_cal2.caldate, +2)
		dw_sem_am_3.retrieve(jour,v_no_ortho)
	CASE "dw_sem_am_4"
		jour = relativedate(istr_cal2.caldate, +3)
		dw_sem_am_4.retrieve(jour,v_no_ortho)
	CASE "dw_sem_am_5"
		jour = relativedate(istr_cal2.caldate, +4)
		dw_sem_am_5.retrieve(jour,v_no_ortho)
	CASE "dw_sem_pm_1"
		dw_sem_pm_1.retrieve(istr_cal2.caldate,v_no_ortho)
	CASE "dw_sem_pm_2"
		jour = relativedate(istr_cal2.caldate, +1)
		dw_sem_pm_2.retrieve(jour,v_no_ortho)
	CASE "dw_sem_pm_3"
		jour = relativedate(istr_cal2.caldate, +2)
		dw_sem_pm_3.retrieve(jour,v_no_ortho)
	CASE "dw_sem_pm_4"
		jour = relativedate(istr_cal2.caldate, +3)
		dw_sem_pm_4.retrieve(jour,v_no_ortho)
	CASE "dw_sem_pm_5"
		jour = relativedate(istr_cal2.caldate, +4)
		dw_sem_pm_5.retrieve(jour,v_no_ortho)
END CHOOSE
end subroutine

public function long type_couleur (long row, string colonne, datawindow win);// Extrait la couleur pour savoir si un template est présent ou non

long ll_color // Variable ou est stocké la couleur


CHOOSE CASE colonne
   CASE "patient_nom_1"
		ll_color = win.getitemnumber(row,"horaire_colortemplate1")
	CASE "patient_nom_2"
		ll_color = win.getitemnumber(row,"horaire_colortemplate2")
	CASE "patient_nom_3"
		ll_color = win.getitemnumber(row,"horaire_colortemplate3")
	CASE "patient_nom_4"
		ll_color = win.getitemnumber(row,"horaire_colortemplate4")
	CASE "horaire_patient_nom_5"
		ll_color = win.getitemnumber(row,"horaire_colortemplate5")
END CHOOSE
return ll_color
end function

public subroutine unselecteddata (string colonne, long row, datawindow win);/* Cette fonction est exécutée pour faire la desélection et appliquer un template à la
   case désirée
	Auteur: Dave Tremblay
	Compagnie: II4NET Inc.
	DATE: 22 mars 2002
	MODIFIER: 25 mars 2002
*/

string ls_nom // Stocké la valeur de la colonne patient_nom
string ls_datecal // Stocké la date de la journée à déselectionnée en string
string ls_heure  // Stocké l'heure de la journée à déselectionné en string
long ll_color // Conserve la couleur de la couleur du traitement
long ll_orthoid // Conserver le numéro de l'orthodontiste
date ld_datecal // Stocké la valeur de la date à sélectionner
time lt_heure // Stocké la valeur de l'heure à sélectionner

ll_orthoid = win.getitemnumber(row,'no_ortho')
ld_datecal = win.getitemdate(row,'datecal')
lt_heure = win.getitemtime(row,'heure')

CHOOSE CASE colonne
	CASE "patient_nom_1"  
		 ls_nom = win.getitemstring(row,"patient_nom_1")
		 if ls_nom = '' then
          update horaire set colortemplate1 = null where no_ortho = :ll_orthoid and datecal = :ld_datecal and heure = :lt_heure;
			 commit using SQLCA;
		else
			 error_type(126)
		end if
		refresh(vi_refresh)
CASE "patient_nom_2"
		 ls_nom = win.getitemstring(row,"patient_nom_2")
		 if ls_nom = '' then
		    update horaire set colortemplate2 = null where no_ortho = :ll_orthoid and datecal = :ld_datecal and heure = :lt_heure;
			 commit using SQLCA;
	    else
			error_type(126)
		end if
		refresh(vi_refresh)
	CASE "patient_nom_3"
		 ls_nom = win.getitemstring(row,"patient_nom_3")
		 if ls_nom = '' then
		    update horaire set colortemplate3 = null where no_ortho = :ll_orthoid and datecal = :ld_datecal and heure = :lt_heure;
			 commit using SQLCA;
	    else
			 error_type(126)
		 end if
		 refresh(vi_refresh)
	CASE "patient_nom_4"
		 ls_nom = win.getitemstring(row,"patient_nom_4")
		 if ls_nom = '' then
		    update horaire set colortemplate4 = null where no_ortho = :ll_orthoid and datecal = :ld_datecal and heure = :lt_heure;
			 commit using SQLCA;
	    else
			 error_type(126)
		 end if
		 refresh(vi_refresh)
	CASE "horaire_patient_nom_5"
		  ls_nom = win.getitemstring(row,"horaire_patient_nom_5")
		 if ls_nom = '' then
		    update horaire set colortemplate5 = null where no_ortho = :ll_orthoid and datecal = :ld_datecal and heure = :lt_heure;
			 commit using SQLCA;
	    else
			 error_type(126)
		 end if
		 refresh(vi_refresh)
END CHOOSE

end subroutine

public subroutine selectedfutur (time lt_heure, long orthoid, date ld_datecal, string colonne, long row);/* Cette fonction permet d'appliquer le template de la date sélectionné jusqu'à
   la date de fin écrite présentement.
	Auteur: Dave Tremblay
	Date: 25 mars 2002
	Modifie le 25 mars 2002
*/

string ls_datecal // La date de la journée du début en string
string ls_heure   // L'heure de la journée du début en string
string ls_datefin // La date de la dernière journée en string
long ll_color     // Couleur importer du type de traitement
date date_fin     // Date de fin de la derniere journée


date_fin = date(w_horaire_template1.em_datefin.text)
ls_datefin = string(date_fin)
ls_datecal = string(ld_datecal)
ls_heure = string(lt_heure)

CHOOSE CASE colonne
	CASE "patient_nom_1"
      ll_color = dw_color_traitements.getitemnumber(dw_color_traitements.getrow(),'t_color_color')   
		UPDATE horaire SET colortemplate1 = :ll_color WHERE no_ortho = :orthoid AND datecal BETWEEN :ld_datecal AND :date_fin AND heure = :lt_heure;
		COMMIT USING SQLCA;
   CASE "patient_nom_2"
		ll_color = dw_color_traitements.getitemnumber(dw_color_traitements.getrow(),'t_color_color')   
		UPDATE horaire SET colortemplate2 = :ll_color WHERE no_ortho = :orthoid AND datecal BETWEEN :ld_datecal AND :date_fin AND heure = :lt_heure;
	   COMMIT USING SQLCA;
	CASE "patient_nom_3"
		ll_color = dw_color_traitements.getitemnumber(dw_color_traitements.getrow(),'t_color_color')   
		UPDATE horaire SET colortemplate3 = :ll_color WHERE no_ortho = :orthoid AND datecal BETWEEN :ld_datecal AND :date_fin AND heure = :lt_heure;
	   COMMIT USING SQLCA;
	CASE "patient_nom_4"
		ll_color = dw_color_traitements.getitemnumber(dw_color_traitements.getrow(),'t_color_color')   
		UPDATE horaire SET colortemplate4 = :ll_color WHERE no_ortho = :orthoid AND datecal BETWEEN :ld_datecal AND :date_fin AND heure = :lt_heure;
	   COMMIT USING SQLCA;
	CASE "horaire_patient_nom_5"
		ll_color = dw_color_traitements.getitemnumber(dw_color_traitements.getrow(),'t_color_color')   
		UPDATE horaire SET colortemplate5 = :ll_color WHERE no_ortho = :orthoid AND datecal BETWEEN :ld_datecal and :date_fin AND heure = :lt_heure;
	   COMMIT USING SQLCA;
END CHOOSE
affichage_creation()


end subroutine

public subroutine affichage_creation ();// Déclaration de variables
long enr, i
date jour
string var_nom
time var_heure

jour = istr_cal2.caldate 
// Déterminer la date et ajuster dropdown listbox month
ddlb_mois.selectitem(month(istr_cal2.caldate))

// Retrouve les enregistrements et inscrire les dates ds les masks
dw_sem_am_1.retrieve(istr_cal2.caldate,v_no_ortho)
em_date_1.text = string(istr_cal2.caldate)
jour = relativedate(istr_cal2.caldate,+1)
dw_sem_am_2.retrieve(jour,v_no_ortho)
em_date_2.text = string(jour)
jour = relativedate(istr_cal2.caldate,+2)
dw_sem_am_3.retrieve(jour,v_no_ortho)
em_date_3.text = string(jour)
jour = relativedate(istr_cal2.caldate,+3)
dw_sem_am_4.retrieve(jour,v_no_ortho)
em_date_4.text = string(jour)
jour = relativedate(istr_cal2.caldate,+4)
dw_sem_am_5.retrieve(jour,v_no_ortho)
em_date_5.text = string(jour)

dw_sem_pm_1.retrieve(istr_cal2.caldate,v_no_ortho)
jour = relativedate(istr_cal2.caldate,+1)
dw_sem_pm_2.retrieve(jour,v_no_ortho)
jour = relativedate(istr_cal2.caldate,+2)
dw_sem_pm_3.retrieve(jour,v_no_ortho)
jour = relativedate(istr_cal2.caldate,+3)
dw_sem_pm_4.retrieve(jour,v_no_ortho)
jour = relativedate(istr_cal2.caldate,+4)
dw_sem_pm_5.retrieve(jour,v_no_ortho)


end subroutine

public subroutine selecteddata (string colonne, long row, datawindow win);/* Cette fonction est exécutée pour faire la sélection et appliquer un template à la
   case désirée
	Auteur: Dave Tremblay
	Compagnie: II4NET Inc.
	DATE: 22 mars 2002
	MODIFIER: 25 mars 2002
*/

string ls_nom // Stocké la valeur de la colonne patient_nom 
string ls_datecal // Stocké la valeur de la date en string
string ls_heure // Stocké la valeur de l'eure en string
long ll_color // Conservé la valeur de la couleur qui est sélectionné dans couleur_traitment
long ll_orthoid // Stocké le numéro de l'orthodontiste
date ld_datecal // Stocké la date de la journée à sélectionnée
time lt_heure // Stocké l'heure de la journée à sélectionné

ll_orthoid = win.getitemnumber(row,'no_ortho')
ld_datecal = win.getitemdate(row,'datecal')
lt_heure = win.getitemtime(row,'heure')

CHOOSE CASE colonne
	CASE "patient_nom_1"  
		 ls_nom = win.getitemstring(row,"patient_nom_1")
		 if ls_nom = '' then
          ll_color = dw_color_traitements.getitemnumber(dw_color_traitements.getrow(),'t_color_color')   
			 update horaire set colortemplate1 = :ll_color where no_ortho = :ll_orthoid and datecal = :ld_datecal and heure = :lt_heure;
			 commit using SQLCA;
		else
			 error_type(126)
		end if
	   refresh(vi_refresh)
CASE "patient_nom_2"
		 ls_nom = win.getitemstring(row,"patient_nom_2")
		 if ls_nom = '' then
		    ll_color = dw_color_traitements.getitemnumber(dw_color_traitements.getrow(),'t_color_color')   
		    update horaire set colortemplate2 = :ll_color where no_ortho = :ll_orthoid and datecal = :ld_datecal and heure = :lt_heure;
			 commit using SQLCA;
	    else
			error_type(126)
		end if
		refresh(vi_refresh)
	CASE "patient_nom_3"
		 ls_nom = win.getitemstring(row,"patient_nom_3")
		 if ls_nom = '' then
		    ll_color = dw_color_traitements.getitemnumber(dw_color_traitements.getrow(),'t_color_color')   
		    update horaire set colortemplate3 = :ll_color where no_ortho = :ll_orthoid and datecal = :ld_datecal and heure = :lt_heure;
			 commit using SQLCA;
	    else
			 error_type(126)
		 end if
		 refresh(vi_refresh)
	CASE "patient_nom_4"
		 ls_nom = win.getitemstring(row,"patient_nom_4")
		 if ls_nom = '' then
		    ll_color = dw_color_traitements.getitemnumber(dw_color_traitements.getrow(),'t_color_color')   
		    update horaire set colortemplate4 = :ll_color where no_ortho = :ll_orthoid and datecal = :ld_datecal and heure = :lt_heure;
			 commit using SQLCA;
	    else
			 error_type(126)
		 end if
		 refresh(vi_refresh)
	CASE "horaire_patient_nom_5"
		  ls_nom = win.getitemstring(row,"horaire_patient_nom_5")
		 if ls_nom = '' then
		    ll_color = dw_color_traitements.getitemnumber(dw_color_traitements.getrow(),'t_color_color')   
		    update horaire set colortemplate5 = :ll_color where no_ortho = :ll_orthoid and datecal = :ld_datecal and heure = :lt_heure;
			 commit using SQLCA;
	    else
			 error_type(126)
		 end if
		 refresh(vi_refresh)
END CHOOSE


end subroutine

on w_horaire_template1.create
int iCurrent
call super::create
this.em_datefin=create em_datefin
this.dw_color_traitements=create dw_color_traitements
this.rb_standard=create rb_standard
this.rb_futur=create rb_futur
this.st_1=create st_1
this.em_date_5=create em_date_5
this.em_date_4=create em_date_4
this.em_date_3=create em_date_3
this.em_date_2=create em_date_2
this.em_date_1=create em_date_1
this.uo_2=create uo_2
this.em_liste_nb=create em_liste_nb
this.pb_moins=create pb_moins
this.pb_plus=create pb_plus
this.ddlb_mois=create ddlb_mois
this.rb_pm=create rb_pm
this.rb_am=create rb_am
this.cb_close=create cb_close
this.gb_semaine=create gb_semaine
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_sem_pm_5=create dw_sem_pm_5
this.dw_sem_pm_4=create dw_sem_pm_4
this.dw_sem_pm_3=create dw_sem_pm_3
this.dw_sem_pm_2=create dw_sem_pm_2
this.dw_sem_am_5=create dw_sem_am_5
this.dw_sem_am_4=create dw_sem_am_4
this.dw_sem_am_3=create dw_sem_am_3
this.dw_sem_am_2=create dw_sem_am_2
this.dw_sem_am_1=create dw_sem_am_1
this.dw_sem_pm_1=create dw_sem_pm_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_datefin
this.Control[iCurrent+2]=this.dw_color_traitements
this.Control[iCurrent+3]=this.rb_standard
this.Control[iCurrent+4]=this.rb_futur
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.em_date_5
this.Control[iCurrent+7]=this.em_date_4
this.Control[iCurrent+8]=this.em_date_3
this.Control[iCurrent+9]=this.em_date_2
this.Control[iCurrent+10]=this.em_date_1
this.Control[iCurrent+11]=this.uo_2
this.Control[iCurrent+12]=this.em_liste_nb
this.Control[iCurrent+13]=this.pb_moins
this.Control[iCurrent+14]=this.pb_plus
this.Control[iCurrent+15]=this.ddlb_mois
this.Control[iCurrent+16]=this.rb_pm
this.Control[iCurrent+17]=this.rb_am
this.Control[iCurrent+18]=this.cb_close
this.Control[iCurrent+19]=this.gb_semaine
this.Control[iCurrent+20]=this.gb_1
this.Control[iCurrent+21]=this.gb_2
this.Control[iCurrent+22]=this.dw_sem_pm_5
this.Control[iCurrent+23]=this.dw_sem_pm_4
this.Control[iCurrent+24]=this.dw_sem_pm_3
this.Control[iCurrent+25]=this.dw_sem_pm_2
this.Control[iCurrent+26]=this.dw_sem_am_5
this.Control[iCurrent+27]=this.dw_sem_am_4
this.Control[iCurrent+28]=this.dw_sem_am_3
this.Control[iCurrent+29]=this.dw_sem_am_2
this.Control[iCurrent+30]=this.dw_sem_am_1
this.Control[iCurrent+31]=this.dw_sem_pm_1
end on

on w_horaire_template1.destroy
call super::destroy
destroy(this.em_datefin)
destroy(this.dw_color_traitements)
destroy(this.rb_standard)
destroy(this.rb_futur)
destroy(this.st_1)
destroy(this.em_date_5)
destroy(this.em_date_4)
destroy(this.em_date_3)
destroy(this.em_date_2)
destroy(this.em_date_1)
destroy(this.uo_2)
destroy(this.em_liste_nb)
destroy(this.pb_moins)
destroy(this.pb_plus)
destroy(this.ddlb_mois)
destroy(this.rb_pm)
destroy(this.rb_am)
destroy(this.cb_close)
destroy(this.gb_semaine)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_sem_pm_5)
destroy(this.dw_sem_pm_4)
destroy(this.dw_sem_pm_3)
destroy(this.dw_sem_pm_2)
destroy(this.dw_sem_am_5)
destroy(this.dw_sem_am_4)
destroy(this.dw_sem_am_3)
destroy(this.dw_sem_am_2)
destroy(this.dw_sem_am_1)
destroy(this.dw_sem_pm_1)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

w_horaire_template1.postevent('ue_post_open')
em_datefin.visible = false
st_1.visible = false
end event

type em_datefin from editmask within w_horaire_template1
integer x = 23
integer y = 1496
integer width = 741
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type dw_color_traitements from u_dw within w_horaire_template1
integer x = 18
integer y = 1636
integer width = 741
integer height = 280
integer taborder = 60
string title = "none"
string dataobject = "d_color_traitements"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;this.setrowfocusindicator(hand!)
this.settransobject(SQLCA)
this.retrieve(v_no_ortho)

end event

type rb_standard from radiobutton within w_horaire_template1
integer x = 37
integer y = 1252
integer width = 485
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mode Standard"
boolean checked = true
end type

event clicked;if rb_standard.checked then
	em_datefin.visible = false
	st_1.visible = false
end if
end event

type rb_futur from radiobutton within w_horaire_template1
integer x = 41
integer y = 1320
integer width = 457
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mode futuriste"
end type

event clicked;if rb_futur.checked then
	em_datefin.visible = true
	st_1.visible = true
end if
end event

type st_1 from statictext within w_horaire_template1
integer x = 9
integer y = 1424
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date de fin"
boolean focusrectangle = false
end type

type em_date_5 from editmask within w_horaire_template1
integer x = 3077
integer y = 4
integer width = 567
integer height = 84
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 276856960
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_date_4 from editmask within w_horaire_template1
integer x = 2510
integer y = 4
integer width = 567
integer height = 84
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 276856960
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_date_3 from editmask within w_horaire_template1
integer x = 1934
integer y = 4
integer width = 567
integer height = 84
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 276856960
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_date_2 from editmask within w_horaire_template1
integer x = 1362
integer y = 4
integer width = 567
integer height = 84
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 276856960
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_date_1 from editmask within w_horaire_template1
integer x = 782
integer width = 567
integer height = 84
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 276856960
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type uo_2 from u_calendarhor within w_horaire_template1
integer x = 46
integer y = 8
integer width = 677
integer height = 752
integer taborder = 130
boolean enabled = false
boolean border = true
borderstyle borderstyle = styleraised!
end type

event ue_aff_horaire;//istr_cal2.caldate = id_date_selected
affichage_creation()
end event

on uo_2.destroy
call u_calendarhor::destroy
end on

type em_liste_nb from editmask within w_horaire_template1
integer x = 325
integer y = 864
integer width = 169
integer height = 112
integer taborder = 50
integer textsize = -16
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 16777215
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = styleraised!
string mask = "#"
boolean spin = true
string displaydata = ""
double increment = 1
string minmax = "1~~9"
end type

event constructor;em_liste_nb.text = "1"
end event

type pb_moins from picturebutton within w_horaire_template1
integer x = 55
integer y = 864
integer width = 251
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\Indicat2.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;// Déclaration de variables
date avantdate
avantdate=relativedate(istr_cal2.caldate,-7*integer(em_liste_nb.text))
uo_2.uf_initcal (avantdate)
istr_cal2.caldate = avantdate
affichage_creation()
end event

type pb_plus from picturebutton within w_horaire_template1
integer x = 507
integer y = 864
integer width = 251
integer height = 112
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\Indicatr.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;// Déclaration de variables
date apresdate
apresdate=relativedate(istr_cal2.caldate,+7*integer(em_liste_nb.text))
uo_2.uf_initcal (apresdate)
istr_cal2.caldate = apresdate
affichage_creation()
end event

type ddlb_mois from dropdownlistbox within w_horaire_template1
integer x = 247
integer y = 1032
integer width = 526
integer height = 820
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre","Octobre","Novembre","Décembre"}
end type

event selectionchanged;// Déclaration de variables
date nouvelledate
integer jour, mois, annee
jour = day(istr_cal2.caldate)
annee = year(istr_cal2.caldate)
choose case ddlb_mois.text
	case "Janvier"
		mois=1
	case 'Février'
		if day(istr_cal2.caldate) > 28 then
			jour=28
		end if
		mois=2
	case 'Mars'
		mois=3
	case 'Avril'
		if day(istr_cal2.caldate) > 30 then
			jour=30
		end if
		mois=4
	case 'Mai'
		mois=5
	case 'Juin'
		if day(istr_cal2.caldate) > 30 then
			jour=30
		end if
		mois=6
	case 'Juillet'
		mois=7
	case 'Aout'
		mois=8
	case 'Septembre'
		if day(istr_cal2.caldate) > 30 then
			jour=30
		end if
		mois=9
	case 'Octobre'
		mois=10
	case 'Novembre'
		if day(istr_cal2.caldate) > 30 then
			jour=30
		end if
		mois=11
	case 'Décembre'
		mois=12
end choose
// Initialisation des variables
nouvelledate = date(string(annee)+"/"+string(mois)+"/"+string(jour))
uo_2.uf_initcal (nouvelledate)
istr_cal2.caldate = nouvelledate
affichage_creation()

end event

type rb_pm from radiobutton within w_horaire_template1
integer x = 27
integer y = 1120
integer width = 183
integer height = 64
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 78690504
string text = "PM"
boolean lefttext = true
end type

event clicked;dw_sem_am_1.visible=false
dw_sem_am_2.visible=false
dw_sem_am_3.visible=false
dw_sem_am_4.visible=false
dw_sem_am_5.visible=false
dw_sem_pm_1.visible=true
dw_sem_pm_2.visible=true
dw_sem_pm_3.visible=true
dw_sem_pm_4.visible=true
dw_sem_pm_5.visible=true

end event

type rb_am from radiobutton within w_horaire_template1
integer x = 27
integer y = 1056
integer width = 183
integer height = 64
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "AM"
boolean checked = true
boolean lefttext = true
end type

event clicked;dw_sem_pm_1.visible=false
dw_sem_pm_2.visible=false
dw_sem_pm_3.visible=false
dw_sem_pm_4.visible=false
dw_sem_pm_5.visible=false
dw_sem_am_1.visible=true
dw_sem_am_2.visible=true
dw_sem_am_3.visible=true
dw_sem_am_4.visible=true
dw_sem_am_5.visible=true
end event

type cb_close from commandbutton within w_horaire_template1
integer y = 1944
integer width = 773
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Retour à l~'horaire"
end type

event clicked;//if change_am = 1 or change_pm = 1 then
//	if messagebox("Mise-à-jour","Voulez-vous enregistrer les modifications?",Question!,YesNo!) =1 then
//		if change_am = 1 then
//			sauve_am()
//		end if
//		if change_pm = 1 then
//			sauve_pm()
//		end if
//	end if
//end if
close(parent)


end event

type gb_semaine from groupbox within w_horaire_template1
integer y = 780
integer width = 777
integer height = 232
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 78690504
string text = "Semaine"
end type

type gb_1 from groupbox within w_horaire_template1
integer x = 23
integer y = 1016
integer width = 197
integer height = 176
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_horaire_template1
integer x = 23
integer y = 1200
integer width = 544
integer height = 216
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_sem_pm_5 from u_dw within w_horaire_template1
integer x = 3077
integer y = 92
integer width = 567
integer height = 1960
integer taborder = 260
string dataobject = "d_sem_pm"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_sem_pm_5.settransobject(sqlca)
end event

event clicked;// Cet événement est exécuté lorsque une case de la datawindow est cliqué 

long ll_color   // Vérifie la couleur de la case pour savoir si elle a été cochée
time lt_time    // Heure qui vient d'être cliqué
date ld_datecal // Affiche la date de la journée qui vient d'être cliqué


vi_refresh = "dw_sem_pm_5"

// Code exécuté si nous sommes en mode standard

if rb_standard.checked then
   ll_color = type_couleur(row,dwo.name,this)
   if isnull(ll_color) then
      selecteddata(dwo.name,row,this)
   else
	   unselecteddata(dwo.name,row,this)
   end if
end if

// Code à exécuter si nous sommes dans en mode futur

if rb_futur.checked then
   if em_datefin.text <> "" then
		selectedfutur(this.getitemtime(row,'heure'),this.getitemnumber(row,'no_ortho'),this.getitemdate(row,'datecal'),dwo.name,row)
	else
		messagebox('Avertissement','Vous devez entrer une date de fin')
	end if
end if
end event

type dw_sem_pm_4 from u_dw within w_horaire_template1
integer x = 2510
integer y = 92
integer width = 567
integer height = 1960
integer taborder = 240
string dataobject = "d_sem_pm"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;// Cet événement est exécuté lorsque une case de la datawindow est cliqué 

long ll_color   // Vérifie la couleur de la case pour savoir si elle a été cochée
time lt_time    // Heure qui vient d'être cliqué
date ld_datecal // Affiche la date de la journée qui vient d'être cliqué


vi_refresh = "dw_sem_pm_4"

// Code exécuté si nous sommes en mode standard

if rb_standard.checked then
   ll_color = type_couleur(row,dwo.name,this)
   if isnull(ll_color) then
      selecteddata(dwo.name,row,this)
   else
	   unselecteddata(dwo.name,row,this)
   end if
end if

// Code à exécuter si nous sommes dans en mode futur

if rb_futur.checked then
   if em_datefin.text <> "" then
		selectedfutur(this.getitemtime(row,'heure'),this.getitemnumber(row,'no_ortho'),this.getitemdate(row,'datecal'),dwo.name,row)
	else
		messagebox('Avertissement','Vous devez entrer une date de fin')
	end if
end if
end event

event constructor;dw_sem_pm_4.settransobject(sqlca)
end event

type dw_sem_pm_3 from u_dw within w_horaire_template1
integer x = 1934
integer y = 92
integer width = 567
integer height = 1960
integer taborder = 210
string dataobject = "d_sem_pm"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_sem_pm_3.settransobject(sqlca)
end event

event clicked;// Cet événement est exécuté lorsque une case de la datawindow est cliqué 

long ll_color   // Vérifie la couleur de la case pour savoir si elle a été cochée
time lt_time    // Heure qui vient d'être cliqué
date ld_datecal // Affiche la date de la journée qui vient d'être cliqué

vi_refresh = "dw_sem_pm_3"

// Code exécuté si nous sommes en mode standard

if rb_standard.checked then
   ll_color = type_couleur(row,dwo.name,this)
   if isnull(ll_color) then
      selecteddata(dwo.name,row,this)
   else
	   unselecteddata(dwo.name,row,this)
   end if
end if

// Code à exécuter si nous sommes dans en mode futur

if rb_futur.checked then
   if em_datefin.text <> "" then
		selectedfutur(this.getitemtime(row,'heure'),this.getitemnumber(row,'no_ortho'),this.getitemdate(row,'datecal'),dwo.name,row)
	else
		messagebox('Avertissement','Vous devez entrer une date de fin')
	end if
end if
end event

type dw_sem_pm_2 from u_dw within w_horaire_template1
integer x = 1358
integer y = 92
integer width = 567
integer height = 1960
integer taborder = 200
string dataobject = "d_sem_pm"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_sem_pm_2.settransobject(sqlca)
end event

event clicked;// Cet événement est exécuté lorsque une case de la datawindow est cliqué 

long ll_color   // Vérifie la couleur de la case pour savoir si elle a été cochée
time lt_time    // Heure qui vient d'être cliqué
date ld_datecal // Affiche la date de la journée qui vient d'être cliqué

vi_refresh = "dw_sem_pm_2"

// Code exécuté si nous sommes en mode standard

if rb_standard.checked then
   ll_color = type_couleur(row,dwo.name,this)
   if isnull(ll_color) then
      selecteddata(dwo.name,row,this)
   else
	   unselecteddata(dwo.name,row,this)
   end if
end if

// Code à exécuter si nous sommes dans en mode futur

if rb_futur.checked then
   if em_datefin.text <> "" then
		selectedfutur(this.getitemtime(row,'heure'),this.getitemnumber(row,'no_ortho'),this.getitemdate(row,'datecal'),dwo.name,row)
	else
		messagebox('Avertissement','Vous devez entrer une date de fin')
	end if
end if
end event

type dw_sem_am_5 from u_dw within w_horaire_template1
integer x = 3077
integer y = 92
integer width = 567
integer height = 1960
integer taborder = 250
string dataobject = "d_sem_am"
end type

event constructor;dw_sem_am_5.settransobject(sqlca)
end event

event clicked;// Cet événement est exécuté lorsque une case de la datawindow est cliqué 

long ll_color   // Vérifie la couleur de la case pour savoir si elle a été cochée
time lt_time    // Heure qui vient d'être cliqué
date ld_datecal // Affiche la date de la journée qui vient d'être cliqué


vi_refresh = "dw_sem_am_5"

// Code exécuté si nous sommes en mode standard

if rb_standard.checked then
   ll_color = type_couleur(row,dwo.name,this)
   if isnull(ll_color) then
      selecteddata(dwo.name,row,this)
   else
	   unselecteddata(dwo.name,row,this)
   end if
end if

// Code à exécuter si nous sommes dans en mode futur

if rb_futur.checked then
   if em_datefin.text <> "" then
		selectedfutur(this.getitemtime(row,'heure'),this.getitemnumber(row,'no_ortho'),this.getitemdate(row,'datecal'),dwo.name,row)
	else
		messagebox('Avertissement','Vous devez entrer une date de fin')
	end if
end if

end event

type dw_sem_am_4 from u_dw within w_horaire_template1
integer x = 2510
integer y = 92
integer width = 567
integer height = 1960
integer taborder = 230
string dataobject = "d_sem_am"
end type

event constructor;dw_sem_am_4.settransobject(sqlca)
end event

event clicked;// Cet événement est exécuté lorsque une case de la datawindow est cliqué 

long ll_color   // Vérifie la couleur de la case pour savoir si elle a été cochée
time lt_time    // Heure qui vient d'être cliqué
date ld_datecal // Affiche la date de la journée qui vient d'être cliqué

vi_refresh = "dw_sem_am_4"

// Code exécuté si nous sommes en mode standard

if rb_standard.checked then
   ll_color = type_couleur(row,dwo.name,this)
   if isnull(ll_color) then
      selecteddata(dwo.name,row,this)
   else
	   unselecteddata(dwo.name,row,this)
   end if
end if

// Code à exécuter si nous sommes dans en mode futur

if rb_futur.checked then
   if em_datefin.text <> "" then
		selectedfutur(this.getitemtime(row,'heure'),this.getitemnumber(row,'no_ortho'),this.getitemdate(row,'datecal'),dwo.name,row)
	else
		messagebox('Avertissement','Vous devez entrer une date de fin')
	end if
end if

end event

type dw_sem_am_3 from u_dw within w_horaire_template1
integer x = 1934
integer y = 92
integer width = 567
integer height = 1960
integer taborder = 220
string dataobject = "d_sem_am"
end type

event constructor;dw_sem_am_3.settransobject(sqlca)
end event

event clicked;// Cet événement est exécuté lorsque une case de la datawindow est cliqué 

long ll_color   // Vérifie la couleur de la case pour savoir si elle a été cochée
time lt_time    // Heure qui vient d'être cliqué
date ld_datecal // Affiche la date de la journée qui vient d'être cliqué

vi_refresh = "dw_sem_am_3"

// Code exécuté si nous sommes en mode standard

if rb_standard.checked then
   ll_color = type_couleur(row,dwo.name,this)
   if isnull(ll_color) then
      selecteddata(dwo.name,row,this)
   else
	   unselecteddata(dwo.name,row,this)
   end if
end if

// Code à exécuter si nous sommes dans en mode futur

if rb_futur.checked then
   if em_datefin.text <> "" then
		selectedfutur(this.getitemtime(row,'heure'),this.getitemnumber(row,'no_ortho'),this.getitemdate(row,'datecal'),dwo.name,row)
	else
		messagebox('Avertissement','Vous devez entrer une date de fin')
	end if
end if

end event

type dw_sem_am_2 from u_dw within w_horaire_template1
integer x = 1358
integer y = 92
integer width = 567
integer height = 1960
integer taborder = 270
string dataobject = "d_sem_am"
end type

event constructor;dw_sem_am_2.settransobject(sqlca)
end event

event clicked;// Cet événement est exécuté lorsque une case de la datawindow est cliqué 

long ll_color   // Vérifie la couleur de la case pour savoir si elle a été cochée
time lt_time    // Heure qui vient d'être cliqué
date ld_datecal // Affiche la date de la journée qui vient d'être cliqué

vi_refresh = "dw_sem_am_2"

// Code exécuté si nous sommes en mode standard

if rb_standard.checked then
   ll_color = type_couleur(row,dwo.name,this)
   if isnull(ll_color) then
      selecteddata(dwo.name,row,this)
   else
	   unselecteddata(dwo.name,row,this)
   end if
end if

// Code à exécuter si nous sommes dans en mode futur

if rb_futur.checked then
   if em_datefin.text <> "" then
		selectedfutur(this.getitemtime(row,'heure'),this.getitemnumber(row,'no_ortho'),this.getitemdate(row,'datecal'),dwo.name,row)
	else
		messagebox('Avertissement','Vous devez entrer une date de fin')
	end if
end if

end event

type dw_sem_am_1 from u_dw within w_horaire_template1
integer x = 782
integer y = 92
integer width = 567
integer height = 1960
integer taborder = 280
string dataobject = "d_sem_am"
string icon = "None!"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event doubleclicked;//// Ceci sert à copier le nom et le id du patient dans l'horaire
//integer enr
//choose case getcolumnname()
//	case "patient_nom_1"
//		open(w_rech_patient)
//		if patientrech >0 then
//			enr = dw_am.getrow()
//			dw_am.setitem(enr,"patient_id_1",patientrech)
//			dw_am.setitem(enr,"patient_nom_1",patientnom)
//			change_am = 1
//		end if
//	case "patient_nom_2"
//		open(w_rech_patient)
//		if patientrech >0 then
//			enr = dw_am.getrow()
//			dw_am.setitem(enr,"patient_id_2",patientrech)
//			dw_am.setitem(enr,"patient_nom_2",patientnom)
//			change_am = 1
//		end if
//	case "patient_nom_3"
//		open(w_rech_patient)
//		if patientrech >0 then
//			enr = dw_am.getrow()
//			dw_am.setitem(enr,"patient_id_3",patientrech)
//			dw_am.setitem(enr,"patient_nom_3",patientnom)
//			change_am = 1
//		end if
//	case "patient_nom_4"
//		open(w_rech_patient)
//		if patientrech >0 then
//			enr = dw_am.getrow()
//			dw_am.setitem(enr,"patient_id_4",patientrech)
//			dw_am.setitem(enr,"patient_nom_4",patientnom)
//			change_am = 1
//		end if
//end choose
//
//
//
end event

event rbuttondown;//m_popup_horaire my_menu
//my_menu = create m_popup_horaire
//m_popup_horaire.m_choix.popmenu (pointerx()+665, pointery()+225)
end event

event editchanged;change_am = 1
end event

event itemchanged;change_am = 1
end event

event constructor;dw_sem_am_1.settransobject(sqlca)
end event

event clicked;// Cet événement est exécuté lorsque une case de la datawindow est cliqué 

long ll_color   // Vérifie la couleur de la case pour savoir si elle a été cochée
time lt_time    // Heure qui vient d'être cliqué
date ld_datecal // Affiche la date de la journée qui vient d'être cliqué


vi_refresh = "dw_sem_am_1"

// Code exécuté si nous sommes en mode standard

if rb_standard.checked then
   ll_color = type_couleur(row,dwo.name,this)
   if isnull(ll_color) then
      selecteddata(dwo.name,row,this)
   else
	   unselecteddata(dwo.name,row,this)
   end if
end if

// Code à exécuter si nous sommes dans en mode futur

if rb_futur.checked then
   if em_datefin.text <> "" then
		selectedfutur(this.getitemtime(row,'heure'),this.getitemnumber(row,'no_ortho'),this.getitemdate(row,'datecal'),dwo.name,row)
	else
		messagebox('Avertissement','Vous devez entrer une date de fin')
	end if
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

type dw_sem_pm_1 from u_dw within w_horaire_template1
integer x = 782
integer y = 92
integer width = 567
integer height = 1960
integer taborder = 190
string dataobject = "d_sem_pm"
string icon = "None!"
end type

event doubleclicked;//// Ceci sert à copier le nom et le id du patient dans l'horaire
//integer enr
//choose case getcolumnname()
//	case "patient_nom_1"
//		open(w_rech_patient)
//		if patientrech >0 then
//			enr = dw_pm.getrow()
//			dw_pm.setitem(enr,"patient_id_1",patientrech)
//			dw_pm.setitem(enr,"patient_nom_1",patientnom)
//			change_pm=1
//		end if
//	case "patient_nom_2"
//		open(w_rech_patient)
//		if patientrech >0 then
//			enr = dw_pm.getrow()
//			dw_pm.setitem(enr,"patient_id_2",patientrech)
//			dw_pm.setitem(enr,"patient_nom_2",patientnom)
//			change_pm=1
//		end if
//	case "patient_nom_3"
//		open(w_rech_patient)
//		if patientrech >0 then
//			enr = dw_pm.getrow()
//			dw_pm.setitem(enr,"patient_id_3",patientrech)
//			dw_pm.setitem(enr,"patient_nom_3",patientnom)
//			change_pm=1
//		end if
//	case "patient_nom_4"
//		open(w_rech_patient)
//		if patientrech >0 then
//			enr = dw_pm.getrow()
//			dw_pm.setitem(enr,"patient_id_4",patientrech)
//			dw_pm.setitem(enr,"patient_nom_4",patientnom)
//			change_pm=1
//		end if
//end choose
end event

event rbuttondown;//m_popup_horaire my_menu
//my_menu = create m_popup_horaire
//m_popup_horaire.m_choix.popmenu (pointerx()+665, pointery()+225)
end event

event editchanged;change_pm = 1
end event

event itemchanged;change_pm = 1
end event

event constructor;dw_sem_pm_1.settransobject(sqlca)

end event

event clicked;// Cet événement est exécuté lorsque une case de la datawindow est cliqué 

long ll_color   // Vérifie la couleur de la case pour savoir si elle a été cochée
time lt_time    // Heure qui vient d'être cliqué
date ld_datecal // Affiche la date de la journée qui vient d'être cliqué

vi_refresh = "dw_sem_pm_1"

// Code exécuté si nous sommes en mode standard

if rb_standard.checked then
   ll_color = type_couleur(row,dwo.name,this)
   if isnull(ll_color) then
      selecteddata(dwo.name,row,this)
   else
	   unselecteddata(dwo.name,row,this)
   end if
end if

// Code à exécuter si nous sommes dans en mode futur

if rb_futur.checked then
   if em_datefin.text <> "" then
		selectedfutur(this.getitemtime(row,'heure'),this.getitemnumber(row,'no_ortho'),this.getitemdate(row,'datecal'),dwo.name,row)
	else
		messagebox('Avertissement','Vous devez entrer une date de fin')
	end if
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

