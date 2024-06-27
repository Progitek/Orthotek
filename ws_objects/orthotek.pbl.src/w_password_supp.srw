$PBExportHeader$w_password_supp.srw
forward
global type w_password_supp from window
end type
type st_pat from statictext within w_password_supp
end type
type sle_password from singlelineedit within w_password_supp
end type
type st_1 from statictext within w_password_supp
end type
type cb_1 from commandbutton within w_password_supp
end type
type cb_2 from commandbutton within w_password_supp
end type
end forward

global type w_password_supp from window
integer x = 1161
integer y = 904
integer width = 1257
integer height = 508
boolean titlebar = true
string title = "Suppression d~'un patient"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
string pointer = "Arrow!"
st_pat st_pat
sle_password sle_password
st_1 st_1
cb_1 cb_1
cb_2 cb_2
end type
global w_password_supp w_password_supp

type variables
private long il_patid
end variables

on w_password_supp.create
this.st_pat=create st_pat
this.sle_password=create sle_password
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.Control[]={this.st_pat,&
this.sle_password,&
this.st_1,&
this.cb_1,&
this.cb_2}
end on

on w_password_supp.destroy
destroy(this.st_pat)
destroy(this.sle_password)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_2)
end on

event open;string v_password, code, ls_nom, ls_prenom
il_patid = message.doubleparm  //ext
select patient_nom,patient_prenom into :ls_nom,:ls_prenom from patient where patient_id = :il_patid;
st_pat.text = ls_nom + ' ' + ls_prenom
code = "supp"
select password into :v_password from password where typepass = :code;
if v_password = "" then
	insert into password (password, typepass) values ('12345', 'supp');
	commit;
	messagebox("Avertissement!","Le mot de passe est 12345, vous devez le changer!",Information!)
end if
end event

type st_pat from statictext within w_password_supp
integer x = 64
integer y = 20
integer width = 1161
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type sle_password from singlelineedit within w_password_supp
integer x = 462
integer y = 112
integer width = 686
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean autohscroll = false
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_password_supp
integer x = 64
integer y = 120
integer width = 393
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Mot de passe:"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_password_supp
integer x = 59
integer y = 260
integer width = 498
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ok"
end type

event clicked;string v_password,nul
long nb_row, i, t_id, ll_idcontact
SetPointer(HourGlass!)
if sle_password.text <> "" then
	select password into :v_password from password where typepass = 'supp';
	if v_password = sle_password.text then
		//debut algo
		select count(*) into :nb_row from traitements where patient_id = :il_patid;
		if nb_row = 0 then
			delete from t_cincout where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_cincout', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			delete from t_factest where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_factest', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			delete from t_lettrepat where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_lettrepat', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			delete from t_plantrait where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_plantrait', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			///
//			SetNull(nul)
//			long ll_color = rgb(255,255,255)
//			update horaire set patient_id_1 = 0,patient_nom_1 = '',no_dossier1='',traitementid1=0,
//			traitementnom1=:nul,duree1=:nul,couleur_text_1=:ll_color,dt1=:nul where patient_id_1 = :il_patid;
//			if (SQLCA.sqlCode <> 0) then
//				messagebox('horaire1', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
//			end if
//			update horaire set patient_id_2 = 0,patient_nom_2 = '',no_dossier2='',traitementid2=0,
//			traitementnom2=:nul,duree2=:nul,couleur_text_2=:ll_color,dt2=:nul where patient_id_2 = :il_patid;
//			if (SQLCA.sqlCode <> 0) then
//				messagebox('horaire2', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
//			end if
//			update horaire set patient_id_3 = 0,patient_nom_3 = '',no_dossier3='',traitementid3=0,
//			traitementnom3=:nul,duree3=:nul,couleur_text_3=:ll_color,dt3=:nul where patient_id_3 = :il_patid;
//			if (SQLCA.sqlCode <> 0) then
//				messagebox('horaire3', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
//			end if
//			update horaire set patient_id_4 = 0,patient_nom_4 = '',no_dossier4='',traitementid4=0,
//			traitementnom4=:nul,duree4=:nul,couleur_text_4=:ll_color,dt4=:nul where patient_id_4 = :il_patid;
//			if (SQLCA.sqlCode <> 0) then
//				messagebox('horaire4', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
//			end if
//			update horaire set patient_id_5 = 0,patient_nom_5 = '',no_dossier5='',traitementid5=0,
//			traitementnom5=:nul,duree5=:nul,couleur_text_5=:ll_color,dt5=:nul where patient_id_5 = :il_patid;
//			if (SQLCA.sqlCode <> 0) then
//				messagebox('horaire5', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
//			end if
//			update horaire set patient_id_6 = 0,patient_nom_6 = '',no_dossier6='',traitementid6=0,
//			traitementnom6=:nul,duree6=:nul,couleur_text_6=:ll_color,dt6=:nul where patient_id_6 = :il_patid;
//			if (SQLCA.sqlCode <> 0) then
//				messagebox('horaire6', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
//			end if
//			update horaire set patient_id_7 = 0,patient_nom_7 = '',no_dossier7='',traitementid7=0,
//			traitementnom7=:nul,duree7=:nul,couleur_text_7=:ll_color,dt7=:nul where patient_id_7 = :il_patid;
//			if (SQLCA.sqlCode <> 0) then
//				messagebox('horaire7', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
//			end if
//			update horaire set patient_id_8 = 0,patient_nom_8 = '',no_dossier8='',traitementid8=0,
//			traitementnom8=:nul,duree8=:nul,couleur_text_8=:ll_color,dt8=:nul where patient_id_8 = :il_patid;
//			if (SQLCA.sqlCode <> 0) then
//				messagebox('horaire8', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
//			end if
//			update horaire set patient_id_9 = 0,patient_nom_9 = '',no_dossier9='',traitementid9=0,
//			traitementnom9=:nul,duree9=:nul,couleur_text_9=:ll_color,dt9=:nul where patient_id_9 = :il_patid;
//			if (SQLCA.sqlCode <> 0) then
//				messagebox('horaire9', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
//			end if
//			update horaire set patient_id_10 = 0,patient_nom_10 = '',no_dossier10='',traitementid10=0,
//			traitementnom10=:nul,duree10=:nul,couleur_text_10=:ll_color,dt10=:nul where patient_id_10 = :il_patid;
//			if (SQLCA.sqlCode <> 0) then
//				messagebox('horaire10', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
//			end if
//			commit using sqlca;
			///
			delete from t_rdv where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_rdv', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			delete from t_transfert where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_transfert', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			delete from absence where patient = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('absence', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			delete from assurance_formulaire where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('assurance_formulaire', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			delete from description_patient where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('description_patient', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			delete from rendezvous where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('rendezvous', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			delete from t_assurance where id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_assurance', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			delete from t_entente where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_entente', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			delete from t_consultations where patient_id = :il_patid;	
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_consultations', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			select id_contact into :ll_idcontact from t_contact where patient_id = :il_patid and pat = 1;
			update t_contact set patient_id = null where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_contact', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			update patient set id_contact = null where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_contact', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			update patient set referant_nom = null where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_contact', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			update patient set id_dentist = null where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_contact', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			delete from t_contact where patient_id = :il_patid and pat = 1;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_contact', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			// t_cartetrait
			delete from t_cartetrait where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_contact', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			// t_contrats
			delete from t_contrats where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_contact', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			// t_histolettre
			delete from t_histolettre where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_contact', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			// t_imagerie
			delete from t_imagerie where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_contact', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			// t_procpat
			delete from t_procpat where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_contact', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			// t_blacklist
			delete from t_blacklist where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('t_contact', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			// patient
			delete from patient where patient_id = :il_patid;
			if (SQLCA.sqlCode <> 0) then
				messagebox('patient', string(today()) + ',' + string(now()) + ',' + SQLCA.SQLErrText) 
			end if
			w_patient.dw_patient_master.deleterow(w_patient.dw_patient_master.getrow())
			numero_patient = w_patient.dw_patient_master.getitemnumber(w_patient.dw_patient_master.getrow(),'patient_id')
			w_patient.il_patid = w_patient.dw_patient_master.getitemnumber(w_patient.dw_patient_master.getrow(),'patient_id')
		else
			error_type(128)
		end if
	else
		error_type(129)
	end if
else
	error_type(130)
end if
close(parent)
w_patient.dw_patient_master.SetFocus()
end event

type cb_2 from commandbutton within w_password_supp
integer x = 649
integer y = 260
integer width = 498
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
end type

event clicked;close(parent)
end event

