$PBExportHeader$w_horaire_semaine.srw
forward
global type w_horaire_semaine from w_child
end type
type rb_trait from radiobutton within w_horaire_semaine
end type
type cb_hormonth from commandbutton within w_horaire_semaine
end type
type em_date_5 from editmask within w_horaire_semaine
end type
type em_date_4 from editmask within w_horaire_semaine
end type
type em_date_3 from editmask within w_horaire_semaine
end type
type em_date_2 from editmask within w_horaire_semaine
end type
type em_date_1 from editmask within w_horaire_semaine
end type
type uo_2 from u_calendarhor within w_horaire_semaine
end type
type cb_print from commandbutton within w_horaire_semaine
end type
type em_liste_nb from editmask within w_horaire_semaine
end type
type pb_moins from picturebutton within w_horaire_semaine
end type
type pb_plus from picturebutton within w_horaire_semaine
end type
type ddlb_mois from dropdownlistbox within w_horaire_semaine
end type
type rb_pm from radiobutton within w_horaire_semaine
end type
type rb_am from radiobutton within w_horaire_semaine
end type
type cb_close from commandbutton within w_horaire_semaine
end type
type gb_semaine from groupbox within w_horaire_semaine
end type
type dw_list from u_dw within w_horaire_semaine
end type
type dw_impression from u_dw within w_horaire_semaine
end type
type dw_impression_patient from u_dw within w_horaire_semaine
end type
type dw_imp_couleur_select from u_dw within w_horaire_semaine
end type
type dw_sem_am_3 from u_dw within w_horaire_semaine
end type
type dw_sem_am_4 from u_dw within w_horaire_semaine
end type
type dw_sem_am_5 from u_dw within w_horaire_semaine
end type
type dw_sem_am_2 from u_dw within w_horaire_semaine
end type
type dw_sem_am_1 from u_dw within w_horaire_semaine
end type
type gb_ampm from groupbox within w_horaire_semaine
end type
type rb_doc from radiobutton within w_horaire_semaine
end type
end forward

global type w_horaire_semaine from w_child
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
string pointer = "Arrow!"
boolean toolbarvisible = false
boolean ib_isupdateable = false
event ue_post_open ( )
rb_trait rb_trait
cb_hormonth cb_hormonth
em_date_5 em_date_5
em_date_4 em_date_4
em_date_3 em_date_3
em_date_2 em_date_2
em_date_1 em_date_1
uo_2 uo_2
cb_print cb_print
em_liste_nb em_liste_nb
pb_moins pb_moins
pb_plus pb_plus
ddlb_mois ddlb_mois
rb_pm rb_pm
rb_am rb_am
cb_close cb_close
gb_semaine gb_semaine
dw_list dw_list
dw_impression dw_impression
dw_impression_patient dw_impression_patient
dw_imp_couleur_select dw_imp_couleur_select
dw_sem_am_3 dw_sem_am_3
dw_sem_am_4 dw_sem_am_4
dw_sem_am_5 dw_sem_am_5
dw_sem_am_2 dw_sem_am_2
dw_sem_am_1 dw_sem_am_1
gb_ampm gb_ampm
rb_doc rb_doc
end type
global w_horaire_semaine w_horaire_semaine

type variables
long enrrech,change_am = 0, change_pm = 0
integer ii_startam, ii_endam, ii_startpm, ii_endpm



end variables

forward prototypes
public subroutine affichage_creation ()
public subroutine createlablist (long al_color, date adt)
public subroutine if_gotohor (string as_date)
public subroutine implistlabo (long al_couleur[], date adt_date)
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
	close(w_horaire_semaine)
END CHOOSE

//verification option
select hor_aff_pm into :v_hor_aff_pm from t_options;
if v_hor_aff_pm = 0 then
	rb_am.visible = false
	rb_pm.visible = false
end if
	

end event

public subroutine affichage_creation ();// Déclaration de variables
long enr, i
integer li_startam,li_startpm,li_endam,li_endpm,li_pm
date jour
string var_nom
time lt_startam,lt_startpm,lt_endam,lt_endpm

select hor_depart_am,hor_depart_pm,hor_fin_am,hor_fin_pm,hor_aff_pm into :li_startam,:li_startpm,:li_endam,:li_endpm,:li_pm from t_options where ortho_id = :v_no_ortho;
jour = istr_cal2.caldate 
lt_startam = time(string(li_startam) + ':00.000')
lt_startpm = time(string(li_startpm) + ':00.000')
lt_endam = time(string(li_endam + 1) + ':00.000')
lt_endpm = time(string(li_endpm + 1) + ':00.000')

// Déterminer la date et ajuster dropdown listbox month
ddlb_mois.selectitem(month(istr_cal2.caldate))

// Retrouve les enregistrements et inscrire les dates ds les masks
if rb_pm.checked = true then
	dw_sem_am_1.retrieve(v_no_ortho,istr_cal2.caldate,lt_startpm,lt_endpm)
	em_date_1.text = string(istr_cal2.caldate)
	jour = relativedate(istr_cal2.caldate,+1)
	dw_sem_am_2.retrieve(v_no_ortho,jour,lt_startpm,lt_endpm)
	em_date_2.text = string(jour)
	jour = relativedate(istr_cal2.caldate,+2)
	dw_sem_am_3.retrieve(v_no_ortho,jour,lt_startpm,lt_endpm)
	em_date_3.text = string(jour)
	jour = relativedate(istr_cal2.caldate,+3)
	dw_sem_am_4.retrieve(v_no_ortho,jour,lt_startpm,lt_endpm)
	em_date_4.text = string(jour)
	jour = relativedate(istr_cal2.caldate,+4)
	dw_sem_am_5.retrieve(v_no_ortho,jour,lt_startpm,lt_endpm)
	em_date_5.text = string(jour)
else
	dw_sem_am_1.retrieve(v_no_ortho,istr_cal2.caldate,lt_startam,lt_endam)
	em_date_1.text = string(istr_cal2.caldate)
	jour = relativedate(istr_cal2.caldate,+1)
	dw_sem_am_2.retrieve(v_no_ortho,jour,lt_startam,lt_endam)
	em_date_2.text = string(jour)
	jour = relativedate(istr_cal2.caldate,+2)
	dw_sem_am_3.retrieve(v_no_ortho,jour,lt_startam,lt_endam)
	em_date_3.text = string(jour)
	jour = relativedate(istr_cal2.caldate,+3)
	dw_sem_am_4.retrieve(v_no_ortho,jour,lt_startam,lt_endam)
	em_date_4.text = string(jour)
	jour = relativedate(istr_cal2.caldate,+4)
	dw_sem_am_5.retrieve(v_no_ortho,jour,lt_startam,lt_endam)
	em_date_5.text = string(jour)
end if


end subroutine

public subroutine createlablist (long al_color, date adt);//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 19/11/2003
// Demande  : CGariepy
// Version  : 7.6.6
// Modifié par:
//	Modifié le :
//////////////////////////////////
long ll_color, ll_patid
integer i,j,z,li_startam,li_endpm,li_duree,li_hornbcol,li_nbrow
time lt_heure,lt_startam,lt_endpm
string ls_trait

select hor_depart_am,hor_fin_pm,horcolnb into :li_startam,:li_endpm,:li_hornbcol from t_options where ortho_id = :v_no_ortho;
lt_startam = time(string(li_startam) + ':00.000')
lt_endpm = time(string(li_endpm + 1) + ':00.000')

datastore ds_sem1
ds_sem1 = create datastore
ds_sem1.dataobject = 'd_sem_am'
ds_sem1.SetTransObject(SQLCA)
for z = 0 to 4
	adt = relativedate(istr_cal2.caldate,+z)
	li_nbrow = ds_sem1.retrieve(v_no_ortho,adt,lt_startam,lt_endpm)
	if li_nbrow > 0 then
		for j = 1 to li_nbrow
			for i = 1 to li_hornbcol
				ls_trait = ""
				setnull(ll_patid)
				lt_heure = ds_sem1.getitemtime(j,"heure")
				ll_patid = ds_sem1.getitemnumber(j,"patient_id_"+string(i))
				ll_color = ds_sem1.getitemnumber(j,"horaire_couleur_text_"+string(i))
				li_duree = ds_sem1.getitemnumber(j,"duree"+string(i))
				ls_trait = ds_sem1.getitemstring(j,"horaire_traitementnom"+string(i))
				if ll_patid > 0 and ll_color = al_color and li_duree > 0 then
					insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise, traitement) values (:ll_patid,:lt_heure,:adt,:i, :ls_trait);
					commit;
				end if
			next
		next
	end if
next
destroy ds_sem1

end subroutine

public subroutine if_gotohor (string as_date);date ldt_1

ldt_1 = date(as_date)
if isvalid(w_horaire) then
	w_horaire.uo_1.uf_InitCal(date(ldt_1))
	istr_cal.caldate = date(ldt_1)
	w_horaire.affichage_creation()
	w_horaire.SetFocus()
end if
close(w_horaire_semaine)
end subroutine

public subroutine implistlabo (long al_couleur[], date adt_date);long id, nb_row, j, v_id_traitement, v_id_patient, v_check_cpd, v_couleur, ll_cpt
long ll_patid[10], ll_coul[10], ll_duree[10], ll_noortho
integer i,li_duree,li_horcolnb
time v_heure_rv,lt_startam,lt_endam,lt_startpm,lt_endpm,lt_null, lt_heure
date ldt_datecal
dec{2} v_montant_paye, v_montant_original
string ls_traitnom[10]
boolean	lb_ajout = false
select hor_depart_am,hor_fin_am,hor_depart_pm,hor_fin_pm into :ii_startam,:ii_endam,:ii_startpm,:ii_endpm from t_options where ortho_id = :v_no_ortho;


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
			horaire.duree1,
			horaire.duree2,
			horaire.duree3,
			horaire.duree4,
			horaire.duree5,
			horaire.duree6,
			horaire.duree7,
			horaire.duree8,
			horaire.duree9,
			horaire.duree10
	 FROM horaire  
	WHERE horaire.datecal = :adt_date AND  
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
						 :ll_duree[1],
						 :ll_duree[2],
						 :ll_duree[3],
						 :ll_duree[4],
						 :ll_duree[5],
						 :ll_duree[6],
						 :ll_duree[7],
						 :ll_duree[8],
						 :ll_duree[9],
						 :ll_duree[10];
						 
	DO WHILE SQLCA.SQLCode = 0
		
		
	//for j = 1 to nb_row
//	v_heure_rv = dw_hor.getitemtime(j,"heure")
	for i = 1 to li_horcolnb
		//if ll_patid[i] > 0  and ll_coul[i] = al_couleur and ll_duree[i] > 0 then
		if ll_patid[i] > 0  and ll_duree[i] > 0 then
			//Ensuite, vérifier si la couleur est présente dans le array de celles qu'on veut afficher
			FOR ll_cpt = 1 TO UpperBound(al_couleur)
				
				IF ll_coul[i] = al_couleur[ll_cpt] THEN
					lb_ajout = TRUE
					EXIT
				END IF
				
			END FOR
			
			IF lb_ajout = TRUE THEN
				insert into horaire_patient_id (patient_id,heure_rv,date_rv, no_chaise,traitement) values (:ll_patid[i],:lt_heure,:adt_date,:i,:ls_traitnom[i]);
				lb_ajout = false
			END IF
		end if
		lb_ajout = FALSE
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
						 :ll_duree[1],
						 :ll_duree[2],
						 :ll_duree[3],
						 :ll_duree[4],
						 :ll_duree[5],
						 :ll_duree[6],
						 :ll_duree[7],
						 :ll_duree[8],
						 :ll_duree[9],
						 :ll_duree[10];
		
	LOOP

CLOSE listrdv;

end subroutine

on w_horaire_semaine.create
int iCurrent
call super::create
this.rb_trait=create rb_trait
this.cb_hormonth=create cb_hormonth
this.em_date_5=create em_date_5
this.em_date_4=create em_date_4
this.em_date_3=create em_date_3
this.em_date_2=create em_date_2
this.em_date_1=create em_date_1
this.uo_2=create uo_2
this.cb_print=create cb_print
this.em_liste_nb=create em_liste_nb
this.pb_moins=create pb_moins
this.pb_plus=create pb_plus
this.ddlb_mois=create ddlb_mois
this.rb_pm=create rb_pm
this.rb_am=create rb_am
this.cb_close=create cb_close
this.gb_semaine=create gb_semaine
this.dw_list=create dw_list
this.dw_impression=create dw_impression
this.dw_impression_patient=create dw_impression_patient
this.dw_imp_couleur_select=create dw_imp_couleur_select
this.dw_sem_am_3=create dw_sem_am_3
this.dw_sem_am_4=create dw_sem_am_4
this.dw_sem_am_5=create dw_sem_am_5
this.dw_sem_am_2=create dw_sem_am_2
this.dw_sem_am_1=create dw_sem_am_1
this.gb_ampm=create gb_ampm
this.rb_doc=create rb_doc
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_trait
this.Control[iCurrent+2]=this.cb_hormonth
this.Control[iCurrent+3]=this.em_date_5
this.Control[iCurrent+4]=this.em_date_4
this.Control[iCurrent+5]=this.em_date_3
this.Control[iCurrent+6]=this.em_date_2
this.Control[iCurrent+7]=this.em_date_1
this.Control[iCurrent+8]=this.uo_2
this.Control[iCurrent+9]=this.cb_print
this.Control[iCurrent+10]=this.em_liste_nb
this.Control[iCurrent+11]=this.pb_moins
this.Control[iCurrent+12]=this.pb_plus
this.Control[iCurrent+13]=this.ddlb_mois
this.Control[iCurrent+14]=this.rb_pm
this.Control[iCurrent+15]=this.rb_am
this.Control[iCurrent+16]=this.cb_close
this.Control[iCurrent+17]=this.gb_semaine
this.Control[iCurrent+18]=this.dw_list
this.Control[iCurrent+19]=this.dw_impression
this.Control[iCurrent+20]=this.dw_impression_patient
this.Control[iCurrent+21]=this.dw_imp_couleur_select
this.Control[iCurrent+22]=this.dw_sem_am_3
this.Control[iCurrent+23]=this.dw_sem_am_4
this.Control[iCurrent+24]=this.dw_sem_am_5
this.Control[iCurrent+25]=this.dw_sem_am_2
this.Control[iCurrent+26]=this.dw_sem_am_1
this.Control[iCurrent+27]=this.gb_ampm
this.Control[iCurrent+28]=this.rb_doc
end on

on w_horaire_semaine.destroy
call super::destroy
destroy(this.rb_trait)
destroy(this.cb_hormonth)
destroy(this.em_date_5)
destroy(this.em_date_4)
destroy(this.em_date_3)
destroy(this.em_date_2)
destroy(this.em_date_1)
destroy(this.uo_2)
destroy(this.cb_print)
destroy(this.em_liste_nb)
destroy(this.pb_moins)
destroy(this.pb_plus)
destroy(this.ddlb_mois)
destroy(this.rb_pm)
destroy(this.rb_am)
destroy(this.cb_close)
destroy(this.gb_semaine)
destroy(this.dw_list)
destroy(this.dw_impression)
destroy(this.dw_impression_patient)
destroy(this.dw_imp_couleur_select)
destroy(this.dw_sem_am_3)
destroy(this.dw_sem_am_4)
destroy(this.dw_sem_am_5)
destroy(this.dw_sem_am_2)
destroy(this.dw_sem_am_1)
destroy(this.gb_ampm)
destroy(this.rb_doc)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

w_horaire_semaine.postevent('ue_post_open')
end event

type rb_trait from radiobutton within w_horaire_semaine
integer y = 1308
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

event clicked;dw_sem_am_1.dataobject = 'd_sem_am_1'
dw_sem_am_2.dataobject = 'd_sem_am_1'
dw_sem_am_3.dataobject = 'd_sem_am_1'
dw_sem_am_4.dataobject = 'd_sem_am_1'
dw_sem_am_5.dataobject = 'd_sem_am_1'
dw_sem_am_1.SetTransObject(SQLCA)
dw_sem_am_2.SetTransObject(SQLCA)
dw_sem_am_3.SetTransObject(SQLCA)
dw_sem_am_4.SetTransObject(SQLCA)
dw_sem_am_5.SetTransObject(SQLCA)
affichage_creation()
end event

event constructor;if v_langue = 'an' then
	this.text = "Treatments"
end if
end event

type cb_hormonth from commandbutton within w_horaire_semaine
integer x = 9
integer y = 1500
integer width = 677
integer height = 180
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Horaire du mois"
end type

event clicked;opensheetwithparm(w_horaire_mois,string(today()),w_principal,2,layered!)
w_principal.SetMicroHelp('Grille horaire pour le mois')
w_horaire.title = "Grille horaire pour le mois"
end event

event constructor;if v_langue = 'an' then
	this.text = "Monthly schedule"
end if
end event

type em_date_5 from editmask within w_horaire_semaine
integer x = 3045
integer y = 4
integer width = 590
integer height = 84
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 16777215
long backcolor = 276856960
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
end type

event getfocus;if_gotohor(this.text)
end event

type em_date_4 from editmask within w_horaire_semaine
integer x = 2455
integer y = 4
integer width = 594
integer height = 84
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 16777215
long backcolor = 276856960
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
end type

event getfocus;if_gotohor(this.text)
end event

type em_date_3 from editmask within w_horaire_semaine
integer x = 1865
integer y = 4
integer width = 594
integer height = 84
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 16777215
long backcolor = 276856960
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
end type

event getfocus;if_gotohor(this.text)
end event

type em_date_2 from editmask within w_horaire_semaine
integer x = 1275
integer y = 4
integer width = 594
integer height = 84
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 16777215
long backcolor = 276856960
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
end type

event getfocus;if_gotohor(this.text)
end event

type em_date_1 from editmask within w_horaire_semaine
integer x = 686
integer y = 4
integer width = 594
integer height = 84
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 16777215
long backcolor = 276856960
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
end type

event getfocus;if_gotohor(this.text)
end event

type uo_2 from u_calendarhor within w_horaire_semaine
integer width = 677
integer height = 752
integer taborder = 130
boolean border = true
borderstyle borderstyle = styleraised!
end type

event ue_aff_horaire;istr_cal2.caldate = id_date_selected
affichage_creation()
end event

on uo_2.destroy
call u_calendarhor::destroy
end on

type cb_print from commandbutton within w_horaire_semaine
integer x = 5
integer y = 1684
integer width = 677
integer height = 180
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Impression selection"
end type

event clicked;long ll_couleur[]
integer i
date ldt
n_cst_parm_imp_couleur	lnv_parm
open(w_imp_horaire_couleurs)

//Récupérer les couleurs sélectionnées
lnv_parm = message.powerobjectparm
ll_couleur = lnv_parm.il_couleur

delete from horaire_patient_id;
commit using SQLCA;

ldt = gf_emtodate(em_date_1.text)

for i = 1 to 5
	implistlabo(ll_couleur,ldt)
	ldt = relativeDate(ldt,1)
next

datastore ds_imp_patient
ds_imp_patient = create datastore
ds_imp_patient.dataobject = "r_imp_couleur_select"
ds_imp_patient.SetTransObject(SQLCA)
ds_imp_patient.retrieve(v_no_ortho)
gb_datawindow = false
openwithparm(w_print_options,ds_imp_patient)
destroy ds_imp_patient

end event

event constructor;if v_langue = 'an' then
	this.text = "Print selection"
end if
end event

type em_liste_nb from editmask within w_horaire_semaine
integer x = 224
integer y = 864
integer width = 219
integer height = 112
integer taborder = 50
integer textsize = -16
integer weight = 700
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
string displaydata = ""
double increment = 1
string minmax = "1~~99"
end type

event constructor;em_liste_nb.text = "1"
end event

type pb_moins from picturebutton within w_horaire_semaine
integer x = 23
integer y = 864
integer width = 187
integer height = 112
integer taborder = 40
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
avantdate=relativedate(istr_cal2.caldate,-7*integer(em_liste_nb.text))
uo_2.uf_initcal (avantdate)
istr_cal2.caldate = avantdate
affichage_creation()
end event

type pb_plus from picturebutton within w_horaire_semaine
integer x = 457
integer y = 864
integer width = 187
integer height = 112
integer taborder = 60
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
apresdate=relativedate(istr_cal2.caldate,+7*integer(em_liste_nb.text))
uo_2.uf_initcal (apresdate)
istr_cal2.caldate = apresdate
affichage_creation()
end event

type ddlb_mois from dropdownlistbox within w_horaire_semaine
integer x = 5
integer y = 1188
integer width = 667
integer height = 820
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean sorted = false
boolean vscrollbar = true
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
	ddlb_mois.AddItem('Mars')
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

type rb_pm from radiobutton within w_horaire_semaine
integer x = 434
integer y = 1080
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

type rb_am from radiobutton within w_horaire_semaine
integer x = 41
integer y = 1080
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

type cb_close from commandbutton within w_horaire_semaine
integer x = 5
integer y = 1868
integer width = 677
integer height = 180
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
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

event constructor;if v_langue = 'an' then
	this.text = "Return to schedule"
end if
end event

type gb_semaine from groupbox within w_horaire_semaine
integer y = 780
integer width = 677
integer height = 232
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 78690504
string text = "Semaine"
end type

event constructor;if v_langue = 'an' then
	this.text = "Week"
end if
end event

type dw_list from u_dw within w_horaire_semaine
boolean visible = false
integer x = 864
integer y = 964
integer width = 2638
integer height = 292
integer taborder = 120
boolean bringtotop = true
string dataobject = "dw_chaise_rech"
end type

event constructor;dw_list.SetTransObject(SQLCA)
end event

type dw_impression from u_dw within w_horaire_semaine
boolean visible = false
integer x = 864
integer y = 1264
integer width = 2633
integer height = 404
integer taborder = 100
boolean bringtotop = true
string dataobject = "r_horaire"
end type

type dw_impression_patient from u_dw within w_horaire_semaine
boolean visible = false
integer x = 864
integer y = 1592
integer width = 2619
integer height = 284
integer taborder = 110
boolean bringtotop = true
string dataobject = "r_imp_patient"
end type

type dw_imp_couleur_select from u_dw within w_horaire_semaine
boolean visible = false
integer x = 805
integer y = 1532
integer width = 2811
integer height = 516
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string dataobject = "r_imp_couleur_select"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_imp_couleur_select.SetTransObject(SQLCA)
end event

type dw_sem_am_3 from u_dw within w_horaire_semaine
integer x = 1865
integer y = 84
integer width = 594
integer height = 1968
integer taborder = 220
string dataobject = "d_sem_am_1"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_color

settransobject(sqlca)
//select color into :ll_color from t_color where ortho_id = :v_no_ortho and hor = 1;
//object.case_1.Background.Color = " 16777215 ~t If ( patient_nom_1 = '' , if ( isnull(horaire_colortemplate1) ," + string(ll_color) + ", horaire_colortemplate1 ) , horaire_couleur_text_1 ) "
//object.case_2.Background.Color = " 16777215 ~t If ( patient_nom_2 = '' , if ( isnull(horaire_colortemplate2) ," + string(ll_color) + ", horaire_colortemplate2 ) , horaire_couleur_text_2 ) "
//object.case_3.Background.Color = " 16777215 ~t If ( patient_nom_3 = '' , if ( isnull(horaire_colortemplate3) ," + string(ll_color) + ", horaire_colortemplate3 ) , horaire_couleur_text_3 ) "
//object.case_4.Background.Color = " 16777215 ~t If ( patient_nom_4 = '' , if ( isnull(horaire_colortemplate4) ," + string(ll_color) + ", horaire_colortemplate4 ) , horaire_couleur_text_4 ) "
//object.horaire_case_5.Background.Color = " 16777215 ~t If ( horaire_patient_nom_5 = '' , if ( isnull(horaire_colortemplate5) ," + string(ll_color) + ", horaire_colortemplate5 ) , horaire_couleur_text_5 ) "

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

type dw_sem_am_4 from u_dw within w_horaire_semaine
integer x = 2455
integer y = 84
integer width = 594
integer height = 1968
integer taborder = 230
string dataobject = "d_sem_am_1"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_color

settransobject(sqlca)
//select color into :ll_color from t_color where ortho_id = :v_no_ortho and hor = 1;
//object.case_1.Background.Color = " 16777215 ~t If ( patient_nom_1 = '' , if ( isnull(horaire_colortemplate1) ," + string(ll_color) + ", horaire_colortemplate1 ) , horaire_couleur_text_1 ) "
//object.case_2.Background.Color = " 16777215 ~t If ( patient_nom_2 = '' , if ( isnull(horaire_colortemplate2) ," + string(ll_color) + ", horaire_colortemplate2 ) , horaire_couleur_text_2 ) "
//object.case_3.Background.Color = " 16777215 ~t If ( patient_nom_3 = '' , if ( isnull(horaire_colortemplate3) ," + string(ll_color) + ", horaire_colortemplate3 ) , horaire_couleur_text_3 ) "
//object.case_4.Background.Color = " 16777215 ~t If ( patient_nom_4 = '' , if ( isnull(horaire_colortemplate4) ," + string(ll_color) + ", horaire_colortemplate4 ) , horaire_couleur_text_4 ) "
//object.horaire_case_5.Background.Color = " 16777215 ~t If ( horaire_patient_nom_5 = '' , if ( isnull(horaire_colortemplate5) ," + string(ll_color) + ", horaire_colortemplate5 ) , horaire_couleur_text_5 ) "

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

type dw_sem_am_5 from u_dw within w_horaire_semaine
integer x = 3045
integer y = 84
integer width = 590
integer height = 1968
integer taborder = 250
string dataobject = "d_sem_am_1"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_color

settransobject(sqlca)
//select color into :ll_color from t_color where ortho_id = :v_no_ortho and hor = 1;
//object.case_1.Background.Color = " 16777215 ~t If ( patient_nom_1 = '' , if ( isnull(horaire_colortemplate1) ," + string(ll_color) + ", horaire_colortemplate1 ) , horaire_couleur_text_1 ) "
//object.case_2.Background.Color = " 16777215 ~t If ( patient_nom_2 = '' , if ( isnull(horaire_colortemplate2) ," + string(ll_color) + ", horaire_colortemplate2 ) , horaire_couleur_text_2 ) "
//object.case_3.Background.Color = " 16777215 ~t If ( patient_nom_3 = '' , if ( isnull(horaire_colortemplate3) ," + string(ll_color) + ", horaire_colortemplate3 ) , horaire_couleur_text_3 ) "
//object.case_4.Background.Color = " 16777215 ~t If ( patient_nom_4 = '' , if ( isnull(horaire_colortemplate4) ," + string(ll_color) + ", horaire_colortemplate4 ) , horaire_couleur_text_4 ) "
//object.horaire_case_5.Background.Color = " 16777215 ~t If ( horaire_patient_nom_5 = '' , if ( isnull(horaire_colortemplate5) ," + string(ll_color) + ", horaire_colortemplate5 ) , horaire_couleur_text_5 ) "

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

type dw_sem_am_2 from u_dw within w_horaire_semaine
integer x = 1275
integer y = 84
integer width = 594
integer height = 1968
integer taborder = 270
string dataobject = "d_sem_am_1"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_color

settransobject(sqlca)
//select color into :ll_color from t_color where ortho_id = :v_no_ortho and hor = 1;
//object.case_1.Background.Color = " 16777215 ~t If ( patient_nom_1 = '' , if ( isnull(horaire_colortemplate1) ," + string(ll_color) + ", horaire_colortemplate1 ) , horaire_couleur_text_1 ) "
//object.case_2.Background.Color = " 16777215 ~t If ( patient_nom_2 = '' , if ( isnull(horaire_colortemplate2) ," + string(ll_color) + ", horaire_colortemplate2 ) , horaire_couleur_text_2 ) "
//object.case_3.Background.Color = " 16777215 ~t If ( patient_nom_3 = '' , if ( isnull(horaire_colortemplate3) ," + string(ll_color) + ", horaire_colortemplate3 ) , horaire_couleur_text_3 ) "
//object.case_4.Background.Color = " 16777215 ~t If ( patient_nom_4 = '' , if ( isnull(horaire_colortemplate4) ," + string(ll_color) + ", horaire_colortemplate4 ) , horaire_couleur_text_4 ) "
//object.horaire_case_5.Background.Color = " 16777215 ~t If ( horaire_patient_nom_5 = '' , if ( isnull(horaire_colortemplate5) ," + string(ll_color) + ", horaire_colortemplate5 ) , horaire_couleur_text_5 ) "

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

type dw_sem_am_1 from u_dw within w_horaire_semaine
integer x = 686
integer y = 84
integer width = 594
integer height = 1968
integer taborder = 280
string dataobject = "d_sem_am_1"
boolean hscrollbar = true
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
//select color into :ll_color from t_color where ortho_id = :v_no_ortho and hor = 1;
//object.case_1.Background.Color = " 16777215 ~t If ( patient_nom_1 = '' , if ( isnull(horaire_colortemplate1) ," + string(ll_color) + ", horaire_colortemplate1 ) , horaire_couleur_text_1 ) "
//object.case_2.Background.Color = " 16777215 ~t If ( patient_nom_2 = '' , if ( isnull(horaire_colortemplate2) ," + string(ll_color) + ", horaire_colortemplate2 ) , horaire_couleur_text_2 ) "
//object.case_3.Background.Color = " 16777215 ~t If ( patient_nom_3 = '' , if ( isnull(horaire_colortemplate3) ," + string(ll_color) + ", horaire_colortemplate3 ) , horaire_couleur_text_3 ) "
//object.case_4.Background.Color = " 16777215 ~t If ( patient_nom_4 = '' , if ( isnull(horaire_colortemplate4) ," + string(ll_color) + ", horaire_colortemplate4 ) , horaire_couleur_text_4 ) "
//object.horaire_case_5.Background.Color = " 16777215 ~t If ( horaire_patient_nom_5 = '' , if ( isnull(horaire_colortemplate5) ," + string(ll_color) + ", horaire_colortemplate5 ) , horaire_couleur_text_5 ) "

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

type gb_ampm from groupbox within w_horaire_semaine
integer y = 1012
integer width = 677
integer height = 160
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 78690504
end type

type rb_doc from radiobutton within w_horaire_semaine
integer y = 1396
integer width = 645
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 78690504
string text = " Temps docteur"
boolean lefttext = true
end type

event clicked;dw_sem_am_1.dataobject = 'd_semdt'
dw_sem_am_2.dataobject = 'd_semdt'
dw_sem_am_3.dataobject = 'd_semdt'
dw_sem_am_4.dataobject = 'd_semdt'
dw_sem_am_5.dataobject = 'd_semdt'
dw_sem_am_1.SetTransObject(SQLCA)
dw_sem_am_2.SetTransObject(SQLCA)
dw_sem_am_3.SetTransObject(SQLCA)
dw_sem_am_4.SetTransObject(SQLCA)
dw_sem_am_5.SetTransObject(SQLCA)
affichage_creation()
end event

event constructor;if v_langue = 'an' then
	this.text = "Doctor's time"
end if
end event

