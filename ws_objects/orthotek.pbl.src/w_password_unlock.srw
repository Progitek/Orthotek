$PBExportHeader$w_password_unlock.srw
forward
global type w_password_unlock from w_response
end type
type st_1 from statictext within w_password_unlock
end type
type sle_pass from u_sle within w_password_unlock
end type
type cb_annuler from commandbutton within w_password_unlock
end type
type cb_ok from commandbutton within w_password_unlock
end type
end forward

global type w_password_unlock from w_response
integer width = 905
integer height = 448
string title = "Débarrer le dossier"
boolean center = true
st_1 st_1
sle_pass sle_pass
cb_annuler cb_annuler
cb_ok cb_ok
end type
global w_password_unlock w_password_unlock

type variables
string is_type
end variables

on w_password_unlock.create
int iCurrent
call super::create
this.st_1=create st_1
this.sle_pass=create sle_pass
this.cb_annuler=create cb_annuler
this.cb_ok=create cb_ok
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.sle_pass
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.cb_ok
end on

on w_password_unlock.destroy
call super::destroy
destroy(this.st_1)
destroy(this.sle_pass)
destroy(this.cb_annuler)
destroy(this.cb_ok)
end on

event open;call super::open;is_type = string(gnv_app.inv_entrepotglobal.of_retournedonnee("typederapport"))
end event

type st_1 from statictext within w_password_unlock
integer x = 37
integer y = 24
integer width = 837
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Veuillez entrer le mot de passe pour déverrouiller:"
boolean focusrectangle = false
end type

type sle_pass from u_sle within w_password_unlock
integer x = 41
integer y = 152
integer width = 814
integer height = 76
integer taborder = 10
boolean password = true
end type

type cb_annuler from commandbutton within w_password_unlock
integer x = 453
integer y = 264
integer width = 402
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;Close(PARENT)
end event

type cb_ok from commandbutton within w_password_unlock
integer x = 32
integer y = 264
integer width = 402
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
boolean default = true
end type

event clicked;string	ls_password, ls_saisie
long		ll_count, ll_personnel

SELECT password
INTO :ls_password
FROM	t_personnels
WHERE id_personnel = 0
USING SQLCA;


ls_saisie = sle_pass.text

CHOOSE CASE is_type
	CASE 'rappcons'
		select 	count(1) into :ll_count 
		from 		t_personneldroit INNER JOIN t_personnels ON t_personnels.id_personnel = t_personneldroit.id_personnel
		where 	password = :ls_saisie AND
					isnull(rappcons,0) = 1;
	CASE 'traitreq'
		select 	count(1) into :ll_count 
		from 		t_personneldroit INNER JOIN t_personnels ON t_personnels.id_personnel = t_personneldroit.id_personnel
		where 	password = :ls_saisie AND
					isnull(traitreq,0) = 1;
	CASE 'rapppre'
		select 	count(1) into :ll_count 
		from 		t_personneldroit INNER JOIN t_personnels ON t_personnels.id_personnel = t_personneldroit.id_personnel
		where 	password = :ls_saisie AND
					isnull(rapppre,0) = 1;
	CASE 'feuilleanalyse'
		select 	count(1) into :ll_count 
		from 		t_personneldroit INNER JOIN t_personnels ON t_personnels.id_personnel = t_personneldroit.id_personnel
		where 	password = :ls_saisie AND
					isnull(feuilleanalyse,0) = 1;
	CASE 'plantrait'
		select 	count(1) into :ll_count 
		from 		t_personneldroit INNER JOIN t_personnels ON t_personnels.id_personnel = t_personneldroit.id_personnel
		where 	password = :ls_saisie AND
					isnull(plantrait,0) = 1;
	CASE ELSE
		select count(1) into :ll_count from t_personnels where password = :ls_saisie and acces_modif_corr = 'o' ;
END CHOOSE

//Vérifier si l'utilisateur possède les droits
// select count(1) into :ll_count from t_personnels where password = :ls_saisie and acces_modif_corr = 'o' ;

IF ls_password <> ls_saisie AND ll_count = 0 THEN
	Messagebox("Erreur", "Le mot de passe est erroné.")
ELSE
	select id_personnel into :ll_personnel from t_personnels where password = :ls_saisie;
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("personnelauth",ll_personnel)
	CloseWithReturn(parent, "ok")
END IF
end event

