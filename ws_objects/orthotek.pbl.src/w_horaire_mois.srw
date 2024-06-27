$PBExportHeader$w_horaire_mois.srw
forward
global type w_horaire_mois from w_child
end type
type cb_pos0 from commandbutton within w_horaire_mois
end type
type cb_pos1 from commandbutton within w_horaire_mois
end type
type cb_pos4 from commandbutton within w_horaire_mois
end type
type cb_pos6 from commandbutton within w_horaire_mois
end type
type cb_neg1 from commandbutton within w_horaire_mois
end type
type cb_neg4 from commandbutton within w_horaire_mois
end type
type cb_neg6 from commandbutton within w_horaire_mois
end type
type uo_calmonth4 from u_calmonth within w_horaire_mois
end type
type uo_calmonth3 from u_calmonth within w_horaire_mois
end type
type uo_calmonth2 from u_calmonth within w_horaire_mois
end type
type uo_calmonth1 from u_calmonth within w_horaire_mois
end type
type rb_dt from radiobutton within w_horaire_mois
end type
type rb_trait from radiobutton within w_horaire_mois
end type
type dw_horsemmois3 from u_dw within w_horaire_mois
end type
type dw_horsemmois4 from u_dw within w_horaire_mois
end type
type dw_horsemmois5 from u_dw within w_horaire_mois
end type
type dw_horsemmois2 from u_dw within w_horaire_mois
end type
type dw_horsemmois1 from u_dw within w_horaire_mois
end type
type cb_close from commandbutton within w_horaire_mois
end type
type gb_date1 from groupbox within w_horaire_mois
end type
type gb_date2 from groupbox within w_horaire_mois
end type
type gb_date3 from groupbox within w_horaire_mois
end type
type gb_date4 from groupbox within w_horaire_mois
end type
type gb_date5 from groupbox within w_horaire_mois
end type
end forward

global type w_horaire_mois from w_child
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
boolean toolbarvisible = false
boolean ib_isupdateable = false
event ue_post_open ( )
cb_pos0 cb_pos0
cb_pos1 cb_pos1
cb_pos4 cb_pos4
cb_pos6 cb_pos6
cb_neg1 cb_neg1
cb_neg4 cb_neg4
cb_neg6 cb_neg6
uo_calmonth4 uo_calmonth4
uo_calmonth3 uo_calmonth3
uo_calmonth2 uo_calmonth2
uo_calmonth1 uo_calmonth1
rb_dt rb_dt
rb_trait rb_trait
dw_horsemmois3 dw_horsemmois3
dw_horsemmois4 dw_horsemmois4
dw_horsemmois5 dw_horsemmois5
dw_horsemmois2 dw_horsemmois2
dw_horsemmois1 dw_horsemmois1
cb_close cb_close
gb_date1 gb_date1
gb_date2 gb_date2
gb_date3 gb_date3
gb_date4 gb_date4
gb_date5 gb_date5
end type
global w_horaire_mois w_horaire_mois

type variables
long enrrech,change_am = 0, change_pm = 0
date il_caldate
s_calendar istr_calmonth1
s_calendar istr_calmonth2
s_calendar istr_calmonth3
s_calendar istr_calmonth4

end variables

forward prototypes
public subroutine jour2 (long couleur)
public subroutine jour3 (long couleur)
public subroutine jour4 (long couleur)
public subroutine jour1 (long couleur)
public subroutine jour5 (long couleur)
public subroutine uf_affcaltoday ()
public subroutine uf_affcalneg (integer ai_jump)
public subroutine uf_affcalpos (integer ai_jump)
public subroutine affhorsem (date adt_firstday)
end prototypes

public subroutine jour2 (long couleur);//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 20/11/2003
// Demande  : 
// Version  : 7.6.6
// Modifié par:
//	Modifié le :
//////////////////////////////////
long nb_row, j, v_id_traitement, v_check_cpd, v_couleur, v_check_i, u, id, v_id_patient
integer li_startam,li_endpm
time v_heure_rv,lt_startam,lt_endpm
date v_date_rv
dec{2} v_montant_paye, v_montant_original
string v_traitement, v_check_s

datastore ds_sem2
ds_sem2 = create datastore
ds_sem2.dataobject = 'd_sem_am_1'
ds_sem2.SetTransObject(SQLCA)

select hor_depart_am,hor_fin_pm into :li_startam,:li_endpm from t_options where ortho_id = :v_no_ortho;
lt_startam = time(string(li_startam) + ':00.000')
lt_endpm = time(string(li_endpm + 1) + ':00.000')
v_date_rv = relativedate(istr_cal2.caldate,+1)
ds_sem2.retrieve(v_no_ortho,v_date_rv,lt_startam,lt_endpm)

nb_row = ds_sem2.rowcount()
if nb_row > 0 then
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = ds_sem2.getitemtime(j,"heure")
		v_id_patient = ds_sem2.getitemnumber(j,"patient_id_1")
		v_couleur = ds_sem2.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem2.getitemstring(u,"patient_nom_1")
			v_check_i = ds_sem2.getitemnumber(u,"patient_id_1")
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
		v_id_patient = ds_sem2.getitemnumber(j,"patient_id_2")
		v_couleur = ds_sem2.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem2.getitemstring(u,"patient_nom_2")
			v_check_i = ds_sem2.getitemnumber(u,"patient_id_2")
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
		v_id_patient = ds_sem2.getitemnumber(j,"patient_id_3")
		v_couleur = ds_sem2.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem2.getitemstring(u,"patient_nom_3")
			v_check_i = ds_sem2.getitemnumber(u,"patient_id_3")
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
		v_id_patient = ds_sem2.getitemnumber(j,"patient_id_4")
		v_couleur = ds_sem2.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem2.getitemstring(u,"patient_nom_4")
			v_check_i = ds_sem2.getitemnumber(u,"patient_id_4")
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
		v_traitement = ""
		v_id_patient = ds_sem2.getitemnumber(j,"horaire_patient_id_5")
		v_couleur = ds_sem2.getitemnumber(j,"horaire_couleur_text_5")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem2.getitemstring(u,"horaire_patient_nom_5")
			v_check_i = ds_sem2.getitemnumber(u,"horaire_patient_id_5")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,5, :v_traitement);
			commit;
		end if
	next
end if
destroy ds_sem2

end subroutine

public subroutine jour3 (long couleur);//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 20/11/2003
// Demande  : 
// Version  : 7.6.6
// Modifié par:
//	Modifié le :
//////////////////////////////////
long nb_row, j, v_id_traitement, v_check_cpd, v_couleur, v_check_i, u, id, v_id_patient
integer li_startam,li_endpm
time v_heure_rv,lt_startam,lt_endpm
date v_date_rv
dec{2} v_montant_paye, v_montant_original
string v_traitement, v_check_s

datastore ds_sem3
ds_sem3 = create datastore
ds_sem3.dataobject = 'd_sem_am_1'
ds_sem3.SetTransObject(SQLCA)

select hor_depart_am,hor_fin_pm into :li_startam,:li_endpm from t_options where ortho_id = :v_no_ortho;
lt_startam = time(string(li_startam) + ':00.000')
lt_endpm = time(string(li_endpm + 1) + ':00.000')
v_date_rv = relativedate(istr_cal2.caldate,+2)
ds_sem3.retrieve(v_no_ortho,v_date_rv,lt_startam,lt_endpm)

nb_row = ds_sem3.rowcount()
if nb_row > 0 then
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = ds_sem3.getitemtime(j,"heure")
		v_id_patient = ds_sem3.getitemnumber(j,"patient_id_1")
		v_couleur = ds_sem3.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem3.getitemstring(u,"patient_nom_1")
			v_check_i = ds_sem3.getitemnumber(u,"patient_id_1")
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
		v_id_patient = ds_sem3.getitemnumber(j,"patient_id_2")
		v_couleur = ds_sem3.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem3.getitemstring(u,"patient_nom_2")
			v_check_i = ds_sem3.getitemnumber(u,"patient_id_2")
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
		v_id_patient = ds_sem3.getitemnumber(j,"patient_id_3")
		v_couleur = ds_sem3.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem3.getitemstring(u,"patient_nom_3")
			v_check_i = ds_sem3.getitemnumber(u,"patient_id_3")
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
		v_id_patient = ds_sem3.getitemnumber(j,"patient_id_4")
		v_couleur = ds_sem3.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem3.getitemstring(u,"patient_nom_4")
			v_check_i = ds_sem3.getitemnumber(u,"patient_id_4")
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
		v_traitement = ""
		v_id_patient = ds_sem3.getitemnumber(j,"horaire_patient_id_5")
		v_couleur = ds_sem3.getitemnumber(j,"horaire_couleur_text_5")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem3.getitemstring(u,"horaire_patient_nom_5")
			v_check_i = ds_sem3.getitemnumber(u,"horaire_patient_id_5")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,5, :v_traitement);
			commit;
		end if
	next
end if
destroy ds_sem3

end subroutine

public subroutine jour4 (long couleur);//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 20/11/2003
// Demande  : 
// Version  : 7.6.6
// Modifié par:
//	Modifié le :
//////////////////////////////////
long nb_row, j, v_id_traitement, v_check_cpd, v_couleur, v_check_i, u, id, v_id_patient
integer li_startam,li_endpm
time v_heure_rv,lt_startam,lt_endpm
date v_date_rv
dec{2} v_montant_paye, v_montant_original
string v_traitement, v_check_s

datastore ds_sem4
ds_sem4 = create datastore
ds_sem4.dataobject = 'd_sem_am_1'
ds_sem4.SetTransObject(SQLCA)

select hor_depart_am,hor_fin_pm into :li_startam,:li_endpm from t_options where ortho_id = :v_no_ortho;
lt_startam = time(string(li_startam) + ':00.000')
lt_endpm = time(string(li_endpm + 1) + ':00.000')
v_date_rv = relativedate(istr_cal2.caldate,+3)
ds_sem4.retrieve(v_no_ortho,v_date_rv,lt_startam,lt_endpm)

nb_row = ds_sem4.rowcount()
if nb_row > 0 then
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = ds_sem4.getitemtime(j,"heure")
		v_id_patient = ds_sem4.getitemnumber(j,"patient_id_1")
		v_couleur = ds_sem4.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem4.getitemstring(u,"patient_nom_1")
			v_check_i = ds_sem4.getitemnumber(u,"patient_id_1")
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
		v_id_patient = ds_sem4.getitemnumber(j,"patient_id_2")
		v_couleur = ds_sem4.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem4.getitemstring(u,"patient_nom_2")
			v_check_i = ds_sem4.getitemnumber(u,"patient_id_2")
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
		v_id_patient = ds_sem4.getitemnumber(j,"patient_id_3")
		v_couleur = ds_sem4.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem4.getitemstring(u,"patient_nom_3")
			v_check_i = ds_sem4.getitemnumber(u,"patient_id_3")
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
		v_id_patient = ds_sem4.getitemnumber(j,"patient_id_4")
		v_couleur = ds_sem4.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem4.getitemstring(u,"patient_nom_4")
			v_check_i = ds_sem4.getitemnumber(u,"patient_id_4")
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
		v_traitement = ""
		v_id_patient = ds_sem4.getitemnumber(j,"horaire_patient_id_5")
		v_couleur = ds_sem4.getitemnumber(j,"horaire_couleur_text_5")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem4.getitemstring(u,"horaire_patient_nom_5")
			v_check_i = ds_sem4.getitemnumber(u,"horaire_patient_id_5")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,5, :v_traitement);
			commit;
		end if
	next
end if
destroy ds_sem4

end subroutine

public subroutine jour1 (long couleur);//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 20/11/2003
// Demande  : 
// Version  : 7.6.6
// Modifié par:
//	Modifié le :
//////////////////////////////////
long nb_row, j, v_id_traitement, v_check_cpd, v_couleur, v_check_i, u, id, v_id_patient
integer li_startam,li_endpm
time v_heure_rv,lt_startam,lt_endpm
date v_date_rv
dec{2} v_montant_paye, v_montant_original
string v_traitement, v_check_s

datastore ds_sem1
ds_sem1 = create datastore
ds_sem1.dataobject = 'd_sem_am_1'
ds_sem1.SetTransObject(SQLCA)

select hor_depart_am,hor_fin_pm into :li_startam,:li_endpm from t_options where ortho_id = :v_no_ortho;
lt_startam = time(string(li_startam) + ':00.000')
lt_endpm = time(string(li_endpm + 1) + ':00.000')
v_date_rv = istr_cal2.caldate
ds_sem1.retrieve(v_no_ortho,v_date_rv,lt_startam,lt_endpm)

nb_row = ds_sem1.rowcount()
if nb_row > 0 then
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = ds_sem1.getitemtime(j,"heure")
		v_id_patient = ds_sem1.getitemnumber(j,"patient_id_1")
		v_couleur = ds_sem1.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem1.getitemstring(u,"patient_nom_1")
			v_check_i = ds_sem1.getitemnumber(u,"patient_id_1")
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
		v_id_patient = ds_sem1.getitemnumber(j,"patient_id_2")
		v_couleur = ds_sem1.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem1.getitemstring(u,"patient_nom_2")
			v_check_i = ds_sem1.getitemnumber(u,"patient_id_2")
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
		v_id_patient = ds_sem1.getitemnumber(j,"patient_id_3")
		v_couleur = ds_sem1.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem1.getitemstring(u,"patient_nom_3")
			v_check_i = ds_sem1.getitemnumber(u,"patient_id_3")
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
		v_id_patient = ds_sem1.getitemnumber(j,"patient_id_4")
		v_couleur = ds_sem1.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem1.getitemstring(u,"patient_nom_4")
			v_check_i = ds_sem1.getitemnumber(u,"patient_id_4")
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
		v_traitement = ""
		v_id_patient = ds_sem1.getitemnumber(j,"horaire_patient_id_5")
		v_couleur = ds_sem1.getitemnumber(j,"horaire_couleur_text_5")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem1.getitemstring(u,"horaire_patient_nom_5")
			v_check_i = ds_sem1.getitemnumber(u,"horaire_patient_id_5")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,5, :v_traitement);
			commit;
		end if
	next
end if
destroy ds_sem1

end subroutine

public subroutine jour5 (long couleur);//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 20/11/2003
// Demande  : 
// Version  : 7.6.6
// Modifié par:
//	Modifié le :
//////////////////////////////////
long nb_row, j, v_id_traitement, v_check_cpd, v_couleur, v_check_i, u, id, v_id_patient
integer li_startam,li_endpm
time v_heure_rv,lt_startam,lt_endpm
date v_date_rv
dec{2} v_montant_paye, v_montant_original
string v_traitement, v_check_s

datastore ds_sem5
ds_sem5 = create datastore
ds_sem5.dataobject = 'd_sem_am_1'
ds_sem5.SetTransObject(SQLCA)

select hor_depart_am,hor_fin_pm into :li_startam,:li_endpm from t_options where ortho_id = :v_no_ortho;
lt_startam = time(string(li_startam) + ':00.000')
lt_endpm = time(string(li_endpm + 1) + ':00.000')
v_date_rv = relativedate(istr_cal2.caldate,+4)
ds_sem5.retrieve(v_no_ortho,v_date_rv,lt_startam,lt_endpm)

nb_row = ds_sem5.rowcount()
if nb_row > 0 then
	for j = 1 to nb_row
		v_traitement = ""
		v_heure_rv = ds_sem5.getitemtime(j,"heure")
		v_id_patient = ds_sem5.getitemnumber(j,"patient_id_1")
		v_couleur = ds_sem5.getitemnumber(j,"horaire_couleur_text_1")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem5.getitemstring(u,"patient_nom_1")
			v_check_i = ds_sem5.getitemnumber(u,"patient_id_1")
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
		v_id_patient = ds_sem5.getitemnumber(j,"patient_id_2")
		v_couleur = ds_sem5.getitemnumber(j,"horaire_couleur_text_2")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem5.getitemstring(u,"patient_nom_2")
			v_check_i = ds_sem5.getitemnumber(u,"patient_id_2")
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
		v_id_patient = ds_sem5.getitemnumber(j,"patient_id_3")
		v_couleur = ds_sem5.getitemnumber(j,"horaire_couleur_text_3")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem5.getitemstring(u,"patient_nom_3")
			v_check_i = ds_sem5.getitemnumber(u,"patient_id_3")
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
		v_id_patient = ds_sem5.getitemnumber(j,"patient_id_4")
		v_couleur = ds_sem5.getitemnumber(j,"horaire_couleur_text_4")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem5.getitemstring(u,"patient_nom_4")
			v_check_i = ds_sem5.getitemnumber(u,"patient_id_4")
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
		v_traitement = ""
		v_id_patient = ds_sem5.getitemnumber(j,"horaire_patient_id_5")
		v_couleur = ds_sem5.getitemnumber(j,"horaire_couleur_text_5")
		u = j
		do while u <> nb_row and u <> j + 4
			u = u + 1
			v_check_s = ds_sem5.getitemstring(u,"horaire_patient_nom_5")
			v_check_i = ds_sem5.getitemnumber(u,"horaire_patient_id_5")
			if upper(v_check_s) <> "X" and v_check_i = 0 and not v_check_s = "" then
				v_traitement = v_traitement + v_check_s
			else
				exit
			end if
		loop
		if v_id_patient > 0 and v_couleur = couleur then
			insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:v_id_patient,:v_heure_rv,:v_date_rv,5, :v_traitement);
			commit;
		end if
	next
end if
destroy ds_sem5

end subroutine

public subroutine uf_affcaltoday ();//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 20/11/2003
// Demande  : 
// Version  : 7.6.6
// Modifié par:
//	Modifié le :
//////////////////////////////////
integer li_month,li_year
date ldt_cal2,ldt_cal3,ldt_cal4

li_year = year(istr_cal.caldate)
li_month = month(istr_cal.caldate)
if li_month = 12 then
	li_month = 01
	li_year++
else
	li_month++
end if
//ldt_cal2 = date('01-'+string(li_month)+'-'+string(li_year))
ldt_cal2 = date(li_year,li_month,1)
if li_month = 12 then
	li_month = 01
	li_year++
else
	li_month++
end if
//ldt_cal3 = date('01-'+string(li_month)+'-'+string(li_year))
ldt_cal3 = date(li_year,li_month,1)
if li_month = 12 then
	li_month = 01
	li_year++
else
	li_month++
end if
//ldt_cal4 = date('01-'+string(li_month)+'-'+string(li_year))
ldt_cal4 = date(li_year,li_month,1)

uo_calmonth1.uf_InitCal(istr_cal.caldate)
uo_calmonth2.uf_InitCal(ldt_cal2)
uo_calmonth3.uf_InitCal(ldt_cal3)
uo_calmonth4.uf_InitCal(ldt_cal4)
//
il_caldate = today()
affhorsem(il_caldate)
end subroutine

public subroutine uf_affcalneg (integer ai_jump);//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 20/11/2003
// Demande  : 
// Version  : 7.6.6
// Modifié par:
//	Modifié le :
//////////////////////////////////
integer li_month,li_year
date ldt_cal1,ldt_cal2,ldt_cal3,ldt_cal4

uo_calmonth1.event ue_aff_horaire()
li_year = year(istr_calmonth1.caldate)
li_month = month(istr_calmonth1.caldate)
li_month = li_month - ai_jump
if li_month < 1 then
	li_month = li_month + 12
	li_year = li_year - 1
end if
ldt_cal1 = date(li_year,li_month,1)
//ldt_cal1 = date('01-'+string(li_month)+'-'+string(li_year))
if li_month = 12 then
	li_month = 01
	li_year++
else
	li_month++
end if
ldt_cal2 = date(li_year,li_month,1)
//ldt_cal2 = date('01-'+string(li_month)+'-'+string(li_year))
if li_month = 12 then
	li_month = 01
	li_year++
else
	li_month++
end if
ldt_cal3 = date(li_year,li_month,1)
//ldt_cal3 = date('01-'+string(li_month)+'-'+string(li_year))
if li_month = 12 then
	li_month = 01
	li_year++
else
	li_month++
end if
//ldt_cal4 = date('01-'+string(li_month)+'-'+string(li_year))
ldt_cal4 = date(li_year,li_month,1)

uo_calmonth1.uf_InitCal(ldt_cal1)
uo_calmonth2.uf_InitCal(ldt_cal2)
uo_calmonth3.uf_InitCal(ldt_cal3)
uo_calmonth4.uf_InitCal(ldt_cal4)
end subroutine

public subroutine uf_affcalpos (integer ai_jump);//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 20/11/2003
// Demande  : 
// Version  : 7.6.6
// Modifié par:
//	Modifié le :
//////////////////////////////////
integer li_month,li_year
date ldt_cal1,ldt_cal2,ldt_cal3,ldt_cal4

uo_calmonth1.event ue_aff_horaire()
li_year = year(istr_calmonth1.caldate)
li_month = month(istr_calmonth1.caldate)
li_month = li_month + ai_jump
if li_month > 12 then
	li_month = li_month - 12
	li_year++
end if
ldt_cal1 = date(li_year,li_month,1)
// ldt_cal1 = date('01-'+string(li_month)+'-'+string(li_year))
if li_month = 12 then
	li_month = 01
	li_year++
else
	li_month++
end if
ldt_cal2 = date(li_year,li_month,1)
//ldt_cal2 = date('01-'+string(li_month)+'-'+string(li_year))
if li_month = 12 then
	li_month = 01
	li_year++
else
	li_month++
end if
ldt_cal3 = date(li_year,li_month,1)
//ldt_cal3 = date('01-'+string(li_month)+'-'+string(li_year))
if li_month = 12 then
	li_month = 01
	li_year++
else
	li_month++
end if
ldt_cal4 = date(li_year,li_month,1)
//ldt_cal4 = date('01-'+string(li_month)+'-'+string(li_year))

uo_calmonth1.uf_InitCal(ldt_cal1)
uo_calmonth2.uf_InitCal(ldt_cal2)
uo_calmonth3.uf_InitCal(ldt_cal3)
uo_calmonth4.uf_InitCal(ldt_cal4)
end subroutine

public subroutine affhorsem (date adt_firstday);//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 20/11/2003
// Demande  : 
// Version  : 7.6.6
// Modifié par:
//	Modifié le :
//////////////////////////////////
long enr, i
integer li_startam,li_startpm,li_endam,li_endpm,li_pm
date jour
string var_nom
time lt_startam,lt_startpm,lt_endam,lt_endpm

select hor_depart_am,hor_depart_pm,hor_fin_am,hor_fin_pm,hor_aff_pm into :li_startam,:li_startpm,:li_endam,:li_endpm,:li_pm from t_options where ortho_id = :v_no_ortho;
jour = adt_firstday
lt_startam = time(string(li_startam) + ':00.000')
lt_startpm = time(string(li_startpm) + ':00.000')
lt_endam = time(string(li_endam + 1) + ':00.000')
lt_endpm = time(string(li_endpm + 1) + ':00.000')

dw_horsemmois1.retrieve(v_no_ortho,adt_firstday,lt_startam,lt_endpm)
gb_date1.text = string(adt_firstday)
jour = relativedate(adt_firstday,+1)
dw_horsemmois2.retrieve(v_no_ortho,jour,lt_startam,lt_endpm)
gb_date2.text = string(jour)
jour = relativedate(adt_firstday,+2)
dw_horsemmois3.retrieve(v_no_ortho,jour,lt_startam,lt_endpm)
gb_date3.text = string(jour)
jour = relativedate(adt_firstday,+3)
dw_horsemmois4.retrieve(v_no_ortho,jour,lt_startam,lt_endpm)
gb_date4.text = string(jour)
jour = relativedate(adt_firstday,+4)
dw_horsemmois5.retrieve(v_no_ortho,jour,lt_startam,lt_endpm)
gb_date5.text = string(jour)


end subroutine

on w_horaire_mois.create
int iCurrent
call super::create
this.cb_pos0=create cb_pos0
this.cb_pos1=create cb_pos1
this.cb_pos4=create cb_pos4
this.cb_pos6=create cb_pos6
this.cb_neg1=create cb_neg1
this.cb_neg4=create cb_neg4
this.cb_neg6=create cb_neg6
this.uo_calmonth4=create uo_calmonth4
this.uo_calmonth3=create uo_calmonth3
this.uo_calmonth2=create uo_calmonth2
this.uo_calmonth1=create uo_calmonth1
this.rb_dt=create rb_dt
this.rb_trait=create rb_trait
this.dw_horsemmois3=create dw_horsemmois3
this.dw_horsemmois4=create dw_horsemmois4
this.dw_horsemmois5=create dw_horsemmois5
this.dw_horsemmois2=create dw_horsemmois2
this.dw_horsemmois1=create dw_horsemmois1
this.cb_close=create cb_close
this.gb_date1=create gb_date1
this.gb_date2=create gb_date2
this.gb_date3=create gb_date3
this.gb_date4=create gb_date4
this.gb_date5=create gb_date5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_pos0
this.Control[iCurrent+2]=this.cb_pos1
this.Control[iCurrent+3]=this.cb_pos4
this.Control[iCurrent+4]=this.cb_pos6
this.Control[iCurrent+5]=this.cb_neg1
this.Control[iCurrent+6]=this.cb_neg4
this.Control[iCurrent+7]=this.cb_neg6
this.Control[iCurrent+8]=this.uo_calmonth4
this.Control[iCurrent+9]=this.uo_calmonth3
this.Control[iCurrent+10]=this.uo_calmonth2
this.Control[iCurrent+11]=this.uo_calmonth1
this.Control[iCurrent+12]=this.rb_dt
this.Control[iCurrent+13]=this.rb_trait
this.Control[iCurrent+14]=this.dw_horsemmois3
this.Control[iCurrent+15]=this.dw_horsemmois4
this.Control[iCurrent+16]=this.dw_horsemmois5
this.Control[iCurrent+17]=this.dw_horsemmois2
this.Control[iCurrent+18]=this.dw_horsemmois1
this.Control[iCurrent+19]=this.cb_close
this.Control[iCurrent+20]=this.gb_date1
this.Control[iCurrent+21]=this.gb_date2
this.Control[iCurrent+22]=this.gb_date3
this.Control[iCurrent+23]=this.gb_date4
this.Control[iCurrent+24]=this.gb_date5
end on

on w_horaire_mois.destroy
call super::destroy
destroy(this.cb_pos0)
destroy(this.cb_pos1)
destroy(this.cb_pos4)
destroy(this.cb_pos6)
destroy(this.cb_neg1)
destroy(this.cb_neg4)
destroy(this.cb_neg6)
destroy(this.uo_calmonth4)
destroy(this.uo_calmonth3)
destroy(this.uo_calmonth2)
destroy(this.uo_calmonth1)
destroy(this.rb_dt)
destroy(this.rb_trait)
destroy(this.dw_horsemmois3)
destroy(this.dw_horsemmois4)
destroy(this.dw_horsemmois5)
destroy(this.dw_horsemmois2)
destroy(this.dw_horsemmois1)
destroy(this.cb_close)
destroy(this.gb_date1)
destroy(this.gb_date2)
destroy(this.gb_date3)
destroy(this.gb_date4)
destroy(this.gb_date5)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

uf_affcaltoday()
end event

type cb_pos0 from commandbutton within w_horaire_mois
integer x = 1381
integer y = 916
integer width = 859
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Aujourd~'hui"
end type

event clicked;uf_affcaltoday()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Today'
end if
end event

type cb_pos1 from commandbutton within w_horaire_mois
integer x = 2368
integer y = 904
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "[ 1 ] >"
end type

event clicked;uf_affcalpos(1)
end event

type cb_pos4 from commandbutton within w_horaire_mois
integer x = 2784
integer y = 904
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "[ 4 ] >>"
end type

event clicked;uf_affcalpos(4)
end event

type cb_pos6 from commandbutton within w_horaire_mois
integer x = 3200
integer y = 904
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "[ 6 ] >>>"
end type

event clicked;uf_affcalpos(6)
end event

type cb_neg1 from commandbutton within w_horaire_mois
integer x = 850
integer y = 904
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "< [ 1 ]"
end type

event clicked;uf_affcalneg(1)
end event

type cb_neg4 from commandbutton within w_horaire_mois
integer x = 434
integer y = 904
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "<< [ 4 ]"
end type

event clicked;uf_affcalneg(4)
end event

type cb_neg6 from commandbutton within w_horaire_mois
integer x = 18
integer y = 904
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "<<< [ 6 ]"
end type

event clicked;uf_affcalneg(6)
end event

type uo_calmonth4 from u_calmonth within w_horaire_mois
event destroy ( )
integer x = 2734
integer width = 878
integer taborder = 60
end type

on uo_calmonth4.destroy
call u_calmonth::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;istr_calmonth4.caldate = id_date_selected
il_caldate = istr_calmonth4.caldate
affhorsem(il_caldate)
end event

type uo_calmonth3 from u_calmonth within w_horaire_mois
event destroy ( )
integer x = 1829
integer width = 878
integer taborder = 60
end type

on uo_calmonth3.destroy
call u_calmonth::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;istr_calmonth3.caldate = id_date_selected
il_caldate = istr_calmonth3.caldate
affhorsem(il_caldate)
end event

type uo_calmonth2 from u_calmonth within w_horaire_mois
event destroy ( )
integer x = 923
integer width = 878
integer taborder = 50
end type

on uo_calmonth2.destroy
call u_calmonth::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;istr_calmonth2.caldate = id_date_selected
il_caldate = istr_calmonth2.caldate
affhorsem(il_caldate)
end event

type uo_calmonth1 from u_calmonth within w_horaire_mois
event destroy ( )
integer x = 18
integer width = 878
integer taborder = 40
end type

on uo_calmonth1.destroy
call u_calmonth::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;istr_calmonth1.caldate = id_date_selected
il_caldate = istr_calmonth1.caldate
affhorsem(il_caldate)
end event

type rb_dt from radiobutton within w_horaire_mois
integer x = 37
integer y = 1480
integer width = 645
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 78690504
string text = "Temps docteur"
boolean lefttext = true
end type

event clicked;dw_horsemmois1.dataobject = 'd_horsemmoisdt'
dw_horsemmois2.dataobject = 'd_horsemmoisdt'
dw_horsemmois3.dataobject = 'd_horsemmoisdt'
dw_horsemmois4.dataobject = 'd_horsemmoisdt'
dw_horsemmois5.dataobject = 'd_horsemmoisdt'
dw_horsemmois1.SetTransObject(SQLCA)
dw_horsemmois2.SetTransObject(SQLCA)
dw_horsemmois3.SetTransObject(SQLCA)
dw_horsemmois4.SetTransObject(SQLCA)
dw_horsemmois5.SetTransObject(SQLCA)
affhorsem(il_caldate)
end event

event constructor;if v_langue = 'an' then
	this.text = "Doctor's time"
end if
end event

type rb_trait from radiobutton within w_horaire_mois
integer x = 37
integer y = 1364
integer width = 645
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 78690504
string text = "Traitements"
boolean checked = true
boolean lefttext = true
end type

event clicked;dw_horsemmois1.dataobject = 'd_horsemmois'
dw_horsemmois2.dataobject = 'd_horsemmois'
dw_horsemmois3.dataobject = 'd_horsemmois'
dw_horsemmois4.dataobject = 'd_horsemmois'
dw_horsemmois5.dataobject = 'd_horsemmois'
dw_horsemmois1.SetTransObject(SQLCA)
dw_horsemmois2.SetTransObject(SQLCA)
dw_horsemmois3.SetTransObject(SQLCA)
dw_horsemmois4.SetTransObject(SQLCA)
dw_horsemmois5.SetTransObject(SQLCA)
affhorsem(il_caldate)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Treatments'
end if
end event

type dw_horsemmois3 from u_dw within w_horaire_mois
integer x = 1897
integer y = 1084
integer width = 535
integer height = 952
integer taborder = 220
string dataobject = "d_horsemmois"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_color

settransobject(sqlca)
select color into :ll_color from t_color where ortho_id = :v_no_ortho and hor = 1;
object.case_1.Background.Color = " 16777215 ~t If ( patient_nom_1 = '' , if ( isnull(horaire_colortemplate1) ," + string(ll_color) + ", horaire_colortemplate1 ) , horaire_couleur_text_1 ) "
object.case_2.Background.Color = " 16777215 ~t If ( patient_nom_2 = '' , if ( isnull(horaire_colortemplate2) ," + string(ll_color) + ", horaire_colortemplate2 ) , horaire_couleur_text_2 ) "
object.case_3.Background.Color = " 16777215 ~t If ( patient_nom_3 = '' , if ( isnull(horaire_colortemplate3) ," + string(ll_color) + ", horaire_colortemplate3 ) , horaire_couleur_text_3 ) "
object.case_4.Background.Color = " 16777215 ~t If ( patient_nom_4 = '' , if ( isnull(horaire_colortemplate4) ," + string(ll_color) + ", horaire_colortemplate4 ) , horaire_couleur_text_4 ) "
object.case_5.Background.Color = " 16777215 ~t If ( horaire_patient_nom_5 = '' , if ( isnull(horaire_colortemplate5) ," + string(ll_color) + ", horaire_colortemplate5 ) , horaire_couleur_text_5 ) "

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

type dw_horsemmois4 from u_dw within w_horaire_mois
integer x = 2469
integer y = 1084
integer width = 535
integer height = 952
integer taborder = 230
string dataobject = "d_horsemmois"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_color

settransobject(sqlca)
select color into :ll_color from t_color where ortho_id = :v_no_ortho and hor = 1;
object.case_1.Background.Color = " 16777215 ~t If ( patient_nom_1 = '' , if ( isnull(horaire_colortemplate1) ," + string(ll_color) + ", horaire_colortemplate1 ) , horaire_couleur_text_1 ) "
object.case_2.Background.Color = " 16777215 ~t If ( patient_nom_2 = '' , if ( isnull(horaire_colortemplate2) ," + string(ll_color) + ", horaire_colortemplate2 ) , horaire_couleur_text_2 ) "
object.case_3.Background.Color = " 16777215 ~t If ( patient_nom_3 = '' , if ( isnull(horaire_colortemplate3) ," + string(ll_color) + ", horaire_colortemplate3 ) , horaire_couleur_text_3 ) "
object.case_4.Background.Color = " 16777215 ~t If ( patient_nom_4 = '' , if ( isnull(horaire_colortemplate4) ," + string(ll_color) + ", horaire_colortemplate4 ) , horaire_couleur_text_4 ) "
object.case_5.Background.Color = " 16777215 ~t If ( horaire_patient_nom_5 = '' , if ( isnull(horaire_colortemplate5) ," + string(ll_color) + ", horaire_colortemplate5 ) , horaire_couleur_text_5 ) "

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

type dw_horsemmois5 from u_dw within w_horaire_mois
integer x = 3040
integer y = 1084
integer width = 535
integer height = 952
integer taborder = 250
string dataobject = "d_horsemmois"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_color

settransobject(sqlca)
select color into :ll_color from t_color where ortho_id = :v_no_ortho and hor = 1;
object.case_1.Background.Color = " 16777215 ~t If ( patient_nom_1 = '' , if ( isnull(horaire_colortemplate1) ," + string(ll_color) + ", horaire_colortemplate1 ) , horaire_couleur_text_1 ) "
object.case_2.Background.Color = " 16777215 ~t If ( patient_nom_2 = '' , if ( isnull(horaire_colortemplate2) ," + string(ll_color) + ", horaire_colortemplate2 ) , horaire_couleur_text_2 ) "
object.case_3.Background.Color = " 16777215 ~t If ( patient_nom_3 = '' , if ( isnull(horaire_colortemplate3) ," + string(ll_color) + ", horaire_colortemplate3 ) , horaire_couleur_text_3 ) "
object.case_4.Background.Color = " 16777215 ~t If ( patient_nom_4 = '' , if ( isnull(horaire_colortemplate4) ," + string(ll_color) + ", horaire_colortemplate4 ) , horaire_couleur_text_4 ) "
object.case_5.Background.Color = " 16777215 ~t If ( horaire_patient_nom_5 = '' , if ( isnull(horaire_colortemplate5) ," + string(ll_color) + ", horaire_colortemplate5 ) , horaire_couleur_text_5 ) "

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

type dw_horsemmois2 from u_dw within w_horaire_mois
integer x = 1326
integer y = 1084
integer width = 535
integer height = 952
integer taborder = 270
string dataobject = "d_horsemmois"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_color

settransobject(sqlca)
select color into :ll_color from t_color where ortho_id = :v_no_ortho and hor = 1;
object.case_1.Background.Color = " 16777215 ~t If ( patient_nom_1 = '' , if ( isnull(horaire_colortemplate1) ," + string(ll_color) + ", horaire_colortemplate1 ) , horaire_couleur_text_1 ) "
object.case_2.Background.Color = " 16777215 ~t If ( patient_nom_2 = '' , if ( isnull(horaire_colortemplate2) ," + string(ll_color) + ", horaire_colortemplate2 ) , horaire_couleur_text_2 ) "
object.case_3.Background.Color = " 16777215 ~t If ( patient_nom_3 = '' , if ( isnull(horaire_colortemplate3) ," + string(ll_color) + ", horaire_colortemplate3 ) , horaire_couleur_text_3 ) "
object.case_4.Background.Color = " 16777215 ~t If ( patient_nom_4 = '' , if ( isnull(horaire_colortemplate4) ," + string(ll_color) + ", horaire_colortemplate4 ) , horaire_couleur_text_4 ) "
object.case_5.Background.Color = " 16777215 ~t If ( horaire_patient_nom_5 = '' , if ( isnull(horaire_colortemplate5) ," + string(ll_color) + ", horaire_colortemplate5 ) , horaire_couleur_text_5 ) "

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

type dw_horsemmois1 from u_dw within w_horaire_mois
integer x = 763
integer y = 1084
integer width = 535
integer height = 952
integer taborder = 280
string dataobject = "d_horsemmois"
boolean border = false
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

event constructor;long ll_color

settransobject(sqlca)
select color into :ll_color from t_color where ortho_id = :v_no_ortho and hor = 1;
object.case_1.Background.Color = " 16777215 ~t If ( patient_nom_1 = '' , if ( isnull(horaire_colortemplate1) ," + string(ll_color) + ", horaire_colortemplate1 ) , horaire_couleur_text_1 ) "
object.case_2.Background.Color = " 16777215 ~t If ( patient_nom_2 = '' , if ( isnull(horaire_colortemplate2) ," + string(ll_color) + ", horaire_colortemplate2 ) , horaire_couleur_text_2 ) "
object.case_3.Background.Color = " 16777215 ~t If ( patient_nom_3 = '' , if ( isnull(horaire_colortemplate3) ," + string(ll_color) + ", horaire_colortemplate3 ) , horaire_couleur_text_3 ) "
object.case_4.Background.Color = " 16777215 ~t If ( patient_nom_4 = '' , if ( isnull(horaire_colortemplate4) ," + string(ll_color) + ", horaire_colortemplate4 ) , horaire_couleur_text_4 ) "
object.case_5.Background.Color = " 16777215 ~t If ( horaire_patient_nom_5 = '' , if ( isnull(horaire_colortemplate5) ," + string(ll_color) + ", horaire_colortemplate5 ) , horaire_couleur_text_5 ) "

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

type cb_close from commandbutton within w_horaire_mois
integer x = 5
integer y = 1864
integer width = 736
integer height = 180
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)


end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type gb_date1 from groupbox within w_horaire_mois
integer x = 750
integer y = 1028
integer width = 562
integer height = 1020
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 78690504
string text = "none"
end type

type gb_date2 from groupbox within w_horaire_mois
integer x = 1317
integer y = 1028
integer width = 562
integer height = 1020
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 78690504
string text = "none"
end type

type gb_date3 from groupbox within w_horaire_mois
integer x = 1883
integer y = 1028
integer width = 562
integer height = 1020
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 78690504
string text = "none"
end type

type gb_date4 from groupbox within w_horaire_mois
integer x = 2459
integer y = 1028
integer width = 562
integer height = 1020
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 78690504
string text = "none"
end type

type gb_date5 from groupbox within w_horaire_mois
integer x = 3031
integer y = 1028
integer width = 562
integer height = 1020
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 78690504
string text = "none"
end type

