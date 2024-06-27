$PBExportHeader$w_choix_phrase_type.srw
forward
global type w_choix_phrase_type from w_response
end type
type cb_suivante from commandbutton within w_choix_phrase_type
end type
type cb_precedente from commandbutton within w_choix_phrase_type
end type
type mle_infocopy from multilineedit within w_choix_phrase_type
end type
type dw_liste_phrase_external from u_dw within w_choix_phrase_type
end type
type cb_quitter from u_cb within w_choix_phrase_type
end type
type cb_niveau from u_cb within w_choix_phrase_type
end type
end forward

global type w_choix_phrase_type from w_response
integer width = 4498
integer height = 2124
boolean controlmenu = false
long backcolor = 15793151
boolean center = true
cb_suivante cb_suivante
cb_precedente cb_precedente
mle_infocopy mle_infocopy
dw_liste_phrase_external dw_liste_phrase_external
cb_quitter cb_quitter
cb_niveau cb_niveau
end type
global w_choix_phrase_type w_choix_phrase_type

type variables
string	is_datastoreSg, is_datastoreG, is_new_type = "", is_old_type[], is_texte[]
n_ds		ids_datastoreSg, ids_datastoreG
long		il_niveau = 0, il_id[], il_old_id[], il_new_id = 0, il_page = 1, il_nbelement
boolean	ib_argument[]


end variables

forward prototypes
public subroutine of_vidertexte ()
public function long of_retrieve (long al_cle, string as_type)
end prototypes

public subroutine of_vidertexte ();//of_vidertexte

long		ll_cpt, ll_vide[]
boolean	lb_vide[]
string	ls_vide[]

FOR ll_cpt = 1 TO 36
	dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + ".Text=''")
	dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + ".background.color='67108864'")
END FOR

il_id = ll_vide
ib_argument = lb_vide
is_texte = ls_vide
end subroutine

public function long of_retrieve (long al_cle, string as_type);//of_retrieve

long		ll_retour, ll_cpt, ll_couleur
string	ls_texte = ""


dw_liste_phrase_external.setredraw(false)
THIS.of_vidertexte( )

//Garder l'historique de la navigation
il_new_id = al_cle
il_old_id[il_niveau] = il_new_id

is_new_type = as_type
is_old_type[il_niveau] = is_new_type

IF il_niveau > 0 AND al_cle > 0 THEN
	il_nbelement = ids_datastoreSg.Retrieve(al_cle,as_type)
	il_page = 1
	FOR ll_cpt = 1 TO il_nbelement
		ls_texte = ids_datastoreSg.object.souscategoriephrase[ll_cpt]
		ls_texte = gnv_app.inv_string.of_globalreplace( ls_texte, '"', "''")
		dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + '.Text="' + ls_texte + '"')
		dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + '.tooltip.tip="' + ls_texte + '"')
		is_texte[ll_cpt] = ls_texte
		il_id[ll_cpt] = ids_datastoreSg.object.id_souscategoriephrase[ll_cpt]
		if ids_datastoreSg.object.toucheraccourci[ll_cpt] = 'o' THEN
			ib_argument[ll_cpt] = TRUE
		ELSE
			ib_argument[ll_cpt] = False
		END IF
		ll_couleur = ids_datastoreSg.object.couleur[ll_cpt]
		dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + '.background.color="' + string(ll_couleur) + '"')
	END FOR	
ELSE
	il_nbelement = ids_datastoreG.Retrieve(v_no_ortho)
	il_page = 1
	FOR ll_cpt = 1 TO il_nbelement
		ls_texte = ids_datastoreG.object.categoriephrase[ll_cpt]
		ls_texte = gnv_app.inv_string.of_globalreplace( ls_texte, '"', "''")
		dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + '.Text="' + ls_texte + '"')
		dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + '.tooltip.tip="' + ls_texte + '"')
		il_id[ll_cpt] = ids_datastoreG.object.id_categoriephrase[ll_cpt]
		ib_argument[ll_cpt] = False
		ll_couleur = ids_datastoreG.object.couleur[ll_cpt]
		dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + '.background.color="' + string(ll_couleur) + '"')
	END FOR
	
END IF

dw_liste_phrase_external.setredraw(true)

RETURN il_nbelement
end function

on w_choix_phrase_type.create
int iCurrent
call super::create
this.cb_suivante=create cb_suivante
this.cb_precedente=create cb_precedente
this.mle_infocopy=create mle_infocopy
this.dw_liste_phrase_external=create dw_liste_phrase_external
this.cb_quitter=create cb_quitter
this.cb_niveau=create cb_niveau
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_suivante
this.Control[iCurrent+2]=this.cb_precedente
this.Control[iCurrent+3]=this.mle_infocopy
this.Control[iCurrent+4]=this.dw_liste_phrase_external
this.Control[iCurrent+5]=this.cb_quitter
this.Control[iCurrent+6]=this.cb_niveau
end on

on w_choix_phrase_type.destroy
call super::destroy
destroy(this.cb_suivante)
destroy(this.cb_precedente)
destroy(this.mle_infocopy)
destroy(this.dw_liste_phrase_external)
destroy(this.cb_quitter)
destroy(this.cb_niveau)
end on

event open;call super::open;is_datastoreG = gnv_app.inv_entrepotglobal.of_retournedonnee("lien tableau datastore g")
ids_datastoreG = CREATE n_ds
ids_datastoreG.dataobject = is_datastoreG
ids_datastoreG.SetTransObject(SQLCA)

is_datastoreSg = gnv_app.inv_entrepotglobal.of_retournedonnee("lien tableau datastore sg")
ids_datastoreSg = CREATE n_ds
ids_datastoreSg.dataobject = is_datastoreSg
ids_datastoreSg.SetTransObject(SQLCA)

il_niveau++

THIS.of_retrieve(0, "G")

end event

event close;call super::close;IF IsValid(ids_datastoreSg) THEN Destroy(ids_datastoreSg)
IF IsValid(ids_datastoreG) THEN Destroy(ids_datastoreG)
end event

type cb_suivante from commandbutton within w_choix_phrase_type
integer x = 1819
integer y = 1880
integer width = 613
integer height = 144
integer taborder = 20
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Suivante"
end type

event clicked;long ll_cpt, ll_couleur, i
string ls_texte

if il_page + 36 < il_nbelement then 
	
	il_page = il_page + 36
	ll_cpt = il_page

	IF il_niveau > 0 THEN
		
		FOR i = 1 TO 36
			if ll_cpt <= il_nbelement then
				ls_texte = ids_datastoreSg.object.souscategoriephrase[ll_cpt]
				ls_texte = gnv_app.inv_string.of_globalreplace( ls_texte, '"', "''")
				is_texte[ll_cpt] = ls_texte
				il_id[ll_cpt] = ids_datastoreSg.object.id_souscategoriephrase[ll_cpt]
				if ids_datastoreSg.object.toucheraccourci[ll_cpt] = 'o' THEN
					ib_argument[ll_cpt] = TRUE
				ELSE
					ib_argument[ll_cpt] = False
				END IF
				ll_couleur = ids_datastoreSg.object.couleur[ll_cpt]
			else
				ls_texte = ""
				setnull(ll_couleur)
			end if
			
			dw_liste_phrase_external.Modify("b_" + string(i) + '.Text="' + ls_texte + '"')
			dw_liste_phrase_external.Modify("b_" + string(i) + '.tooltip.tip="' + ls_texte + '"')
			dw_liste_phrase_external.Modify("b_" + string(i) + '.background.color="' + string(ll_couleur) + '"')
			ll_cpt++
		END FOR
		
	ELSE
		
		FOR ll_cpt = 1 TO 36
			
			if ll_cpt <= il_nbelement then
				ls_texte = ids_datastoreG.object.categoriephrase[ll_cpt]
				ls_texte = gnv_app.inv_string.of_globalreplace( ls_texte, '"', "''")
			
				il_id[ll_cpt] = ids_datastoreG.object.id_categoriephrase[ll_cpt]
				ib_argument[ll_cpt] = False
				ll_couleur = ids_datastoreG.object.couleur[ll_cpt]
			else
				ls_texte = ""
				setnull(ll_couleur)
			end if
			
			dw_liste_phrase_external.Modify("b_" + string(i) + '.Text="' + ls_texte + '"')
			dw_liste_phrase_external.Modify("b_" + string(i) + '.tooltip.tip="' + ls_texte + '"')
			dw_liste_phrase_external.Modify("b_" + string(i) + '.background.color="' + string(ll_couleur) + '"')
		END FOR
		
	END IF
end if
end event

type cb_precedente from commandbutton within w_choix_phrase_type
integer x = 1202
integer y = 1880
integer width = 613
integer height = 144
integer taborder = 20
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Précédente"
end type

event clicked;long ll_cpt, ll_couleur, i
string ls_texte

if il_page > 1 then 
	
	il_page = il_page - 36

	IF il_niveau > 0 THEN
		
		i = 1
		FOR ll_cpt = il_page TO il_page + 36
			ls_texte = ids_datastoreSg.object.souscategoriephrase[ll_cpt]
			ls_texte = gnv_app.inv_string.of_globalreplace( ls_texte, '"', "''")
			is_texte[ll_cpt] = ls_texte
			il_id[ll_cpt] = ids_datastoreSg.object.id_souscategoriephrase[ll_cpt]
			if ids_datastoreSg.object.toucheraccourci[ll_cpt] = 'o' THEN
				ib_argument[ll_cpt] = TRUE
			ELSE
				ib_argument[ll_cpt] = False
			END IF
			ll_couleur = ids_datastoreSg.object.couleur[ll_cpt]
			dw_liste_phrase_external.Modify("b_" + string(i) + '.Text="' + ls_texte + '"')
			dw_liste_phrase_external.Modify("b_" + string(i) + '.tooltip.tip="' + ls_texte + '"')
			dw_liste_phrase_external.Modify("b_" + string(i) + '.background.color="' + string(ll_couleur) + '"')
			i++
		END FOR
		
	ELSE
		
		i = 1 
		FOR ll_cpt = il_page TO il_page + 36
			ls_texte = ids_datastoreG.object.categoriephrase[ll_cpt]
			ls_texte = gnv_app.inv_string.of_globalreplace( ls_texte, '"', "''")
			il_id[ll_cpt] = ids_datastoreG.object.id_categoriephrase[ll_cpt]
			ib_argument[ll_cpt] = False
			ll_couleur = ids_datastoreG.object.couleur[ll_cpt]
			dw_liste_phrase_external.Modify("b_" + string(i) + '.Text="' + ls_texte + '"')
			dw_liste_phrase_external.Modify("b_" + string(i) + '.tooltip.tip="' + ls_texte + '"')
			dw_liste_phrase_external.Modify("b_" + string(i) + '.background.color="' + string(ll_couleur) + '"')
			i++
		END FOR
				
	END IF
	
end if
end event

type mle_infocopy from multilineedit within w_choix_phrase_type
integer x = 3643
integer y = 36
integer width = 832
integer height = 1756
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
end type

type dw_liste_phrase_external from u_dw within w_choix_phrase_type
integer x = 14
integer y = 24
integer width = 3625
integer height = 1836
integer taborder = 10
string dataobject = "d_liste_phrase_external"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event buttonclicked;call super::buttonclicked;string	ls_name, ls_texte, ls_retour
long		ll_id, ll_retour, ll_id_envoi
boolean	lb_arg = FALSE

ls_name = dwo.name
IF row > 0 THEN
	ls_texte = THIS.describe(ls_name + ".text")
	IF ls_texte = "" OR IsNull(ls_texte) THEN RETURN
	
	ll_id = long(MID(ls_name, 3))
	ll_id_envoi = il_id[ll_id]
	lb_arg = ib_argument[ll_id]
//	il_oldcle = al_cle
//	is_oldtype = as_type
	IF il_niveau = 1 THEN
		il_niveau++

		ll_retour = PARENT.of_retrieve( ll_id_envoi, "G")
	ELSE
		il_niveau++

		ll_retour = PARENT.of_retrieve( ll_id_envoi, "S")
	END IF
	
	//Si le retour est vide, on retourne le texte
	IF IsNull(ll_retour) OR ll_retour = 0 THEN
		//Vérifier les arguments
		
		IF lb_arg = true then
			//Poper la fenêtre des arguments
			ls_retour = inputbox("Arguments", "Quel texte doit être ajouté à la phrase?", "")
			IF IsNull(ls_retour) THEN ls_retour = ""
			
			ls_texte = ls_texte + " " + ls_retour
		END IF
		IF LEFT(ls_texte, 1) = '"' THEN 
			ls_texte = MID(ls_texte, 2)
		END IF
		IF RIGHT(ls_texte, 1) = '"' THEN 
			ls_texte = LEFT(ls_texte, LEN(ls_texte) - 1)
		END IF
		
		if mle_infocopy.text <> "" then mle_infocopy.text += "~r~n"
		mle_infocopy.text += ls_texte
		
		cb_niveau.event clicked()
		
//		gnv_app.inv_entrepotglobal.of_ajoutedonnee("lien tableau phrase",ls_texte)
//		Close(Parent)
//	ELSE
//		il_niveau ++
	END IF
	
END IF
	
end event

type cb_quitter from u_cb within w_choix_phrase_type
integer x = 2437
integer y = 1880
integer width = 1198
integer height = 144
integer taborder = 10
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Quitter"
end type

event clicked;call super::clicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("lien tableau phrase",mle_infocopy.text)
Close(parent)
end event

type cb_niveau from u_cb within w_choix_phrase_type
integer y = 1880
integer width = 1198
integer height = 144
integer taborder = 10
integer textsize = -14
fontcharset fontcharset = ansi!
string text = "Catégorie précédente"
end type

event clicked;call super::clicked;IF il_niveau > 1 THEN
	il_niveau --
END IF

IF il_niveau >= 1 THEN
//	long		ll_null, ll_upperbound
//	string	ls_null
//	
//	SetNull(ll_null)
//	SetNull(ls_null)
//	ll_upperbound = upperbound(il_old_id)
//	il_old_id[ll_upperbound] = ll_null
//	is_old_type[ll_upperbound] = ls_null

	PARENT.of_retrieve(il_old_id[il_niveau], is_old_type[il_niveau])
END IF
end event

