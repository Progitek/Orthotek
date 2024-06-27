$PBExportHeader$w_choix_consult.srw
forward
global type w_choix_consult from w_response
end type
type cb_raz from u_cb within w_choix_consult
end type
type dw_consult_preview from u_dw within w_choix_consult
end type
type dw_liste_phrase_external from u_dw within w_choix_consult
end type
type cb_quitter from u_cb within w_choix_consult
end type
type cb_niveau from u_cb within w_choix_consult
end type
type st_cartetraitement from statictext within w_choix_consult
end type
type cb_suiv from commandbutton within w_choix_consult
end type
type cb_prec from commandbutton within w_choix_consult
end type
type cb_rempl from commandbutton within w_choix_consult
end type
end forward

global type w_choix_consult from w_response
integer x = 214
integer y = 221
integer width = 4795
integer height = 2320
boolean titlebar = false
boolean controlmenu = false
long backcolor = 15793151
boolean center = true
cb_raz cb_raz
dw_consult_preview dw_consult_preview
dw_liste_phrase_external dw_liste_phrase_external
cb_quitter cb_quitter
cb_niveau cb_niveau
st_cartetraitement st_cartetraitement
cb_suiv cb_suiv
cb_prec cb_prec
cb_rempl cb_rempl
end type
global w_choix_consult w_choix_consult

type variables
string	is_datastoreSg, is_datastoreG, is_new_type = "", is_old_type[], is_texte[]
n_ds		ids_datastoreSg, ids_datastoreG
long		il_patid, il_id[], il_old_id[], il_new_id = 0, il_idcat, il_idsujet
boolean	ib_argument[], ib_dentogramme = false, ib_top = true
long il_curpage = 1, il_totpage


end variables

forward prototypes
public subroutine of_vidertexte ()
public function long of_retrieve (long al_sujet)
public subroutine of_retrievecat (long al_idcat)
public subroutine of_raz ()
end prototypes

public subroutine of_vidertexte ();//of_vidertexte

long		ll_cpt, ll_vide[]
boolean	lb_vide[]
string	ls_vide[]

FOR ll_cpt = 1 TO 42
	dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + ".Text=''")
	dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + ".background.color='67108864'")
END FOR

il_id = ll_vide
ib_argument = lb_vide
is_texte = ls_vide
end subroutine

public function long of_retrieve (long al_sujet);//of_retrieve

long		ll_retour, ll_cpt, ll_couleur, ll_idcatplan, ll_present, ll_qtes, ll_cnt
string	ls_catplan = "", ls_sql

setnull(il_idcat)
ll_cpt = 0

select 	count(1) into :ll_cnt 
from		t_catplans 
where 	ortho_id = :v_no_ortho and
			id_sujet = :al_sujet;
			
if ll_cnt > 42 then
	cb_prec.visible = true
	cb_suiv.visible = true
	cb_rempl.visible = false
else
	cb_prec.visible = false
	cb_suiv.visible = false
	cb_rempl.visible = true
end if

il_totpage = ceiling(ll_cnt / 42.0)


THIS.of_vidertexte( )
ll_qtes = 42 * (il_curpage - 1) + 1

ls_sql = "	select 	TOP 42 START AT " + string(ll_qtes) + "~r~n &
						 	id_catplan, ~r~n &
						 	categorie ~r~n &
				from 		t_catplans ~r~n &
	where 	ortho_id = " + string(v_no_ortho) + " and ~r~n  &
				id_sujet = " + string(al_sujet) + " ~r~n &
	ORDER BY t_catplans.ordre ASC"
	
declare catplan DYNAMIC CURSOR FOR SQLSA;
prepare sqlsa from :ls_sql;

OPEN catplan;

FETCH catplan INTO :ll_idcatplan,:ls_catplan;

DO WHILE SQLCA.SQLCode = 0

	ll_cpt ++
	il_id[ll_cpt] = ll_idcatplan
	ll_present = 0
		
	select isnull(sum(isnull(present,0)),0)
	into :ll_present 
	from t_plans inner join t_plantrait on t_plans.id_plan = t_plantrait.id_plan
	where t_plans.id_catplan = :ll_idcatplan and t_plantrait.patient_id = :il_patid;
	
	if ll_present > 0 then
		dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + ".background.color='16748574'")
	end if
	dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + '.Text="' + ls_catplan + '"')
	
	FETCH catplan INTO :ll_idcatplan,:ls_catplan;

LOOP

CLOSE catplan;

RETURN ll_retour
end function

public subroutine of_retrievecat (long al_idcat);long		ll_retour, ll_cpt, ll_couleur, ll_idplan, ll_present, ll_cnt, ll_qtes
string	ls_plan = "", ls_sql

ll_cpt = 0

select 	count(1) into :ll_cnt 
from		 t_plans 
where 	id_catplan = :al_idcat;
			
if ll_cnt > 42 then
	cb_prec.visible = true
	cb_suiv.visible = true
	cb_rempl.visible = false
else
	cb_prec.visible = false
	cb_suiv.visible = false
	cb_rempl.visible = true
end if

il_totpage = ceiling(ll_cnt / 42.0)
THIS.of_vidertexte( )
ll_qtes = 42 * (il_curpage - 1) + 1
	
ls_sql = "	select 	TOP 42 START AT " + string(ll_qtes) + "~r~n &
						 	id_plan, ~r~n &
						 	description ~r~n &
				from 		t_plans ~r~n &
	where 	id_catplan = " + string(al_idcat) + " ~r~n &
	ORDER BY t_plans.ordre ASC"
	
declare plan DYNAMIC CURSOR FOR SQLSA;
prepare sqlsa from :ls_sql;	

OPEN plan;

FETCH plan INTO :ll_idplan,:ls_plan;

do while SQLCA.SQLCode = 0
	ll_cpt ++
	il_id[ll_cpt] = ll_idplan
//	ddlb_cat.additem(gf_fusion(ls_texte, ll_idcontact, 0))
	ll_present = 0
	
	select isnull(t_plantrait.present,0)
	into :ll_present 
	from t_plantrait
	where t_plantrait.id_plan = :ll_idplan and t_plantrait.patient_id = :il_patid;
	
	if ll_present > 0 then
		dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + ".background.color='16748574'")
	end if
	if ll_cpt <= 42 then
		dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + '.Text="' + ls_plan + '"')
	else
		exit
	end if
	
	FETCH plan INTO :ll_idplan,:ls_plan;
loop

CLOSE plan;


end subroutine

public subroutine of_raz ();long ll_cpt

FOR ll_cpt = 1 TO 42
	dw_liste_phrase_external.Modify("b_" + string(ll_cpt) + ".background.color='67108864'")
END FOR

update t_plantrait set present = 0 where patient_id = :il_patid;

dw_consult_preview.retrieve(il_patid,il_idsujet)
end subroutine

on w_choix_consult.create
int iCurrent
call super::create
this.cb_raz=create cb_raz
this.dw_consult_preview=create dw_consult_preview
this.dw_liste_phrase_external=create dw_liste_phrase_external
this.cb_quitter=create cb_quitter
this.cb_niveau=create cb_niveau
this.st_cartetraitement=create st_cartetraitement
this.cb_suiv=create cb_suiv
this.cb_prec=create cb_prec
this.cb_rempl=create cb_rempl
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_raz
this.Control[iCurrent+2]=this.dw_consult_preview
this.Control[iCurrent+3]=this.dw_liste_phrase_external
this.Control[iCurrent+4]=this.cb_quitter
this.Control[iCurrent+5]=this.cb_niveau
this.Control[iCurrent+6]=this.st_cartetraitement
this.Control[iCurrent+7]=this.cb_suiv
this.Control[iCurrent+8]=this.cb_prec
this.Control[iCurrent+9]=this.cb_rempl
end on

on w_choix_consult.destroy
call super::destroy
destroy(this.cb_raz)
destroy(this.dw_consult_preview)
destroy(this.dw_liste_phrase_external)
destroy(this.cb_quitter)
destroy(this.cb_niveau)
destroy(this.st_cartetraitement)
destroy(this.cb_suiv)
destroy(this.cb_prec)
destroy(this.cb_rempl)
end on

event open;call super::open;il_patid = w_dossier_patients.il_patid
il_idsujet = message.doubleparm

THIS.of_retrieve(il_idsujet)
dw_consult_preview.retrieve(il_patid,il_idsujet)
end event

event close;call super::close;IF IsValid(ids_datastoreSg) THEN Destroy(ids_datastoreSg)
IF IsValid(ids_datastoreG) THEN Destroy(ids_datastoreG)
end event

type cb_raz from u_cb within w_choix_consult
integer x = 805
integer y = 2204
integer width = 805
integer height = 100
integer taborder = 20
integer textsize = -12
fontcharset fontcharset = ansi!
string text = "Décocher"
end type

event clicked;call super::clicked;of_raz()

end event

type dw_consult_preview from u_dw within w_choix_consult
integer x = 3625
integer y = 8
integer width = 1152
integer height = 2284
integer taborder = 20
string title = "Consult preview"
string dataobject = "d_consult_preview"
boolean hscrollbar = true
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;call super::clicked;long ll_idplan, ll_id
string ls_retour, ls_texte, ls_name

if row > 0 then
	
	CHOOSE CASE dwo.name 
		
		CASE 'b_del'
	
			ll_idplan = dw_consult_preview.getItemNumber(row,'t_plantrait_id_plan')
			if error_type(240) = 1 then
				update t_plantrait set present = 0 where id_plan = :ll_idplan;
				if gf_sqlerr() then
					commit using SQLCA;
				else
					rollback using SQLCA;
				end if		
				dw_consult_preview.retrieve(il_patid,il_idsujet)
			end if
		
			if ib_top then 
				of_retrieve(il_idsujet)
			else
				of_retrievecat(il_idcat)
			end if
			
		CASE 'b_add'
			
			if ib_dentogramme = true then	
				openwithparm(w_odonto,'d_odontomixte')
				ls_retour = message.stringparm
			else
				ls_retour = inputbox("Arguments", "Quel texte doit être ajouté au traitement?", dw_consult_preview.getItemString(row,'description'))
			end if
			IF IsNull(ls_retour) THEN ls_retour = ""
		
			ls_texte = ls_retour
			ll_idplan = dw_consult_preview.getItemNumber(row,'t_plantrait_id_plan')
		
			update t_plantrait set present = 1, description = :ls_texte, dateplan = today(), heureplan = now() where t_plantrait.id_plan = :ll_idplan and t_plantrait.patient_id = :il_patid;
			error_type(-1)
			commit using sqlca;
			
			dw_consult_preview.retrieve(il_patid,il_idsujet) 
			
			// Mettre le button en bleu
			
			dw_liste_phrase_external.Modify(ls_name + ".background.color='16748574'")
			
	END CHOOSE


end if


end event

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)
end event

type dw_liste_phrase_external from u_dw within w_choix_consult
integer x = 5
integer y = 8
integer width = 3625
integer height = 2092
integer taborder = 10
string dataobject = "d_consult_panneau"
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event buttonclicked;call super::buttonclicked;string	ls_name, ls_texte, ls_retour
long		ll_id, ll_idplan, ll_count
boolean	lb_arg = FALSE

ls_name = dwo.name

IF row > 0 THEN
	ls_texte = THIS.describe(ls_name + ".text")
	IF ls_texte = "" OR IsNull(ls_texte) THEN RETURN
	IF ls_texte = "DENTS PRESENTES EN BOUCHE:" then ib_dentogramme = true
	if isnull(il_idcat) then
		ll_id = long(MID(ls_name, 3))
		il_idcat = il_id[ll_id]
	
		of_retrievecat(il_idcat)
		ib_top = false
		
		// Afficher aperçu
	else
		// Demander commentaire et retourner traitement
		if ib_dentogramme = true then	
			openwithparm(w_odonto,'d_odontomixte')
			ls_retour = message.stringparm
		else
			ls_retour = ""
		end if
		IF IsNull(ls_retour) THEN ls_retour = ""
		
		ls_texte = ls_retour
		
		ll_id = long(MID(ls_name, 3))
		ll_idplan = il_id[ll_id]
		
		select count(*) into :ll_count from t_plantrait
		where t_plantrait.id_plan = :ll_idplan and t_plantrait.patient_id = :il_patid;
		
		if ll_count >= 1 then
		
			update t_plantrait set present = 1, description = :ls_texte, dateplan = today(), heureplan = now() where t_plantrait.id_plan = :ll_idplan and t_plantrait.patient_id = :il_patid;
		
		else
			
			insert into t_plantrait(present,description,id_plan,patient_id)
			values(1,:ls_texte,:ll_idplan,:il_patid);
		
		end if
		
		error_type(-1)
		commit using sqlca;
		
		dw_consult_preview.retrieve(il_patid,il_idsujet) 
		
		// Mettre le button en bleu
		
		dw_liste_phrase_external.Modify(ls_name + ".background.color='16748574'")
		
	end if

end if



//string	ls_name, ls_texte, ls_retour
//long		ll_id, ll_retour, ll_id_envoi
//boolean	lb_arg = FALSE
//
//ls_name = dwo.name
//IF row > 0 THEN
//	ls_texte = THIS.describe(ls_name + ".text")
//	IF ls_texte = "" OR IsNull(ls_texte) THEN RETURN
//	
//	ll_id = long(MID(ls_name, 3))
//	ll_id_envoi = il_id[ll_id]
//	lb_arg = ib_argument[ll_id]
//	IF il_niveau = 1 THEN
//		ll_retour = PARENT.of_retrieve( ll_id_envoi, "G")
//	ELSE
//		ll_retour = PARENT.of_retrieve( ll_id_envoi, "S")
//	END IF
//	il_niveau ++
//	
//	//Si le retour est vide, on retourne le texte
//	IF IsNull(ll_retour) OR ll_retour = 0 THEN
//		//Vérifier les arguments
//		
//		IF lb_arg = true then
//			//Poper la fenêtre des arguments
//			ls_retour = inputbox("Arguments", "Quel texte doit être ajouté à la phrase?", "")
//			IF IsNull(ls_retour) THEN ls_retour = ""
//			
//			ls_texte = ls_texte + " " + ls_retour
//		END IF
//		IF LEFT(ls_texte, 1) = '"' THEN 
//			ls_texte = MID(ls_texte, 2)
//		END IF
//		IF RIGHT(ls_texte, 1) = '"' THEN 
//			ls_texte = LEFT(ls_texte, LEN(ls_texte) - 1)
//		END IF
//
//		gnv_app.inv_entrepotglobal.of_ajoutedonnee("lien tableau phrase",ls_texte)
//		Close(Parent)
//	END IF
//END IF
//	
//	
end event

type cb_quitter from u_cb within w_choix_consult
integer x = 2816
integer y = 2204
integer width = 805
integer height = 100
integer taborder = 10
integer textsize = -12
fontcharset fontcharset = ansi!
string text = "Quitter"
end type

event clicked;call super::clicked;w_description.uf_setTrait(long(w_description.ddlb_cat.of_getselecteddata()))
Close(parent)
end event

type cb_niveau from u_cb within w_choix_consult
integer y = 2204
integer width = 805
integer height = 100
integer taborder = 10
integer textsize = -12
fontcharset fontcharset = ansi!
string text = "Liste des catégories"
end type

event clicked;call super::clicked;//IF il_niveau > 1 THEN
//	il_niveau --
//END IF
//
//IF il_niveau >= 1 THEN
//	PARENT.of_retrieve(il_old_id[il_niveau], is_old_type[il_niveau])
//END IF

il_curpage = 1
ib_top = true
of_retrieve(il_idsujet)

dw_consult_preview.retrieve(il_patid,il_idsujet)
ib_dentogramme = false
end event

type st_cartetraitement from statictext within w_choix_consult
integer x = 18
integer y = 2112
integer width = 1125
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 134217856
long backcolor = 15793151
string text = "Carte de traitement"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;Opensheetwithparm(w_dossier_patients,il_patid,w_principal,2,layered!)
w_dossier_patients.tab_dosspat.SelectTab("tabpage_cartetrait")
end event

type cb_suiv from commandbutton within w_choix_consult
integer x = 2208
integer y = 2204
integer width = 603
integer height = 100
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Suivante"
end type

event clicked;il_curpage++
if il_curpage = il_totpage then
	cb_suiv.enabled = false
end if
cb_prec.enabled = true

if ib_top then 
	of_retrieve(il_idsujet)
else
	of_retrievecat(il_idcat)
end if
end event

type cb_prec from commandbutton within w_choix_consult
integer x = 1609
integer y = 2204
integer width = 599
integer height = 100
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Précédente"
end type

event clicked;il_curpage --
if il_curpage = 1 then
	cb_prec.enabled = false
end if
cb_suiv.enabled = true

if ib_top then 
	of_retrieve(il_idsujet)
else
	of_retrievecat(il_idcat)
end if
end event

type cb_rempl from commandbutton within w_choix_consult
integer x = 1609
integer y = 2204
integer width = 1202
integer height = 100
integer taborder = 30
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
end type

