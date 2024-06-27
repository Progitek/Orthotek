$PBExportHeader$w_phrasegroupe.srw
forward
global type w_phrasegroupe from w_main
end type
type uo_listcode from u_phrasegroup within w_phrasegroupe
end type
type uo_toolbar from u_cst_toolbarstrip within w_phrasegroupe
end type
type st_title from st_uo_transparent within w_phrasegroupe
end type
type p_2 from picture within w_phrasegroupe
end type
type dw_pilotage from datawindow within w_phrasegroupe
end type
type rr_1 from roundrectangle within w_phrasegroupe
end type
type rr_2 from roundrectangle within w_phrasegroupe
end type
type rr_3 from roundrectangle within w_phrasegroupe
end type
end forward

global type w_phrasegroupe from w_main
integer width = 3630
integer height = 1944
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 15780518
string icon = "AppIcon!"
boolean ib_isupdateable = false
uo_listcode uo_listcode
uo_toolbar uo_toolbar
st_title st_title
p_2 p_2
dw_pilotage dw_pilotage
rr_1 rr_1
rr_2 rr_2
rr_3 rr_3
end type
global w_phrasegroupe w_phrasegroupe

type variables
public boolean change = false
protected:

	long il_parent
	string is_type
	long il_handle
	boolean	ib_insertion = FALSE
end variables

forward prototypes
public subroutine uf_traduction ()
public subroutine of_addgroup ()
public subroutine of_delgroup ()
end prototypes

public subroutine uf_traduction ();uo_toolbar.of_settheme("classic")
uo_toolbar.of_DisplayBorder(true)

if gs_langue = 'an' then
	title = "Sentences list"
	st_title.text = "Sentences list"
	dw_pilotage.object.groupe_t.text = "Group"
	uo_toolbar.of_AddItem("Add category", "C:\ii4net\orthotek\images\ajouter.ico")
	uo_toolbar.of_AddItem("Delete category","C:\ii4net\orthotek\images\supprimer.ico")
	uo_toolbar.of_AddItem("Add sub category", "C:\ii4net\orthotek\images\ajouter.ico")
	uo_toolbar.of_AddItem("Delete sub category", "C:\ii4net\orthotek\images\supprimer.ico")
	uo_toolbar.of_AddItem("Save", "Save!")
	uo_toolbar.of_AddItem("Close", "Exit!")
else
	title = "Liste des phrases" 
	uo_toolbar.of_AddItem("Ajouter une catégorie", "C:\ii4net\orthotek\images\ajouter.ico")
	uo_toolbar.of_AddItem("Supprimer une catégorie","C:\ii4net\orthotek\images\supprimer.ico")
	uo_toolbar.of_AddItem("Ajouter une sous-catégorie", "C:\ii4net\orthotek\images\ajout_personne.ico")
	uo_toolbar.of_AddItem("Supprimer une sous-catégorie", "C:\ii4net\orthotek\images\suppr_personne.ico")
	uo_toolbar.of_AddItem("Sauvegarder", "Save!")
	uo_toolbar.of_AddItem("Fermer", "Exit!")
end if

uo_toolbar.of_displaytext(true)
end subroutine

public subroutine of_addgroup ();long		ll_couleur
string 	ls_categoriephrase, ls_sql

gnv_app.inv_entrepotglobal.of_ajoutedonnee("ajouter groupe", "ajouter")
open(w_newphrasegroupe)
ls_categoriephrase = message.stringparm

if ls_categoriephrase <> '' then
	ll_couleur = long(gnv_app.inv_entrepotglobal.of_retournedonnee("couleur groupe phrase"))
	insert into t_categoriephrase(categoriephrase, couleur, ortho_id) values(:ls_categoriephrase, :ll_couleur,:v_no_ortho);
	if gf_sqlerr() then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
	ls_sql = "select categoriephrase, id_categoriephrase from t_categoriephrase where id_categoriephrase > 0 and ortho_Id = " + string(v_no_ortho) + " order by isnull(ordre,10000) asc"
	uo_listcode.of_addsql(ls_sql)
end if
end subroutine

public subroutine of_delgroup ();long ll_count
string ls_sql

if is_type = 'G' then
	
	// Vérifier si le groupe contient des sous-groupe
	
	select count(*) into :ll_count from t_souscategoriephrase where id_categoriephrase = :il_parent;
	if ll_count > 0 then
		error_type(1012)
		return
	else
		if error_type(263) = 1 then
			delete from t_categoriephrase where id_categoriephrase = :il_parent;
			if gF_sqlerr() then
				commit using SQLCA;
				//Rafraichir
				
				ls_sql = "select categoriephrase, id_categoriephrase from t_categoriephrase where id_categoriephrase > 0 and ortho_Id = " + string(v_no_ortho) + " order by isnull(ordre,10000) asc"
				uo_listcode.of_addsql(ls_sql)
				
			else
				rollback using SQLCA;
			end if
		end if
	end if
	
end if
end subroutine

on w_phrasegroupe.create
int iCurrent
call super::create
this.uo_listcode=create uo_listcode
this.uo_toolbar=create uo_toolbar
this.st_title=create st_title
this.p_2=create p_2
this.dw_pilotage=create dw_pilotage
this.rr_1=create rr_1
this.rr_2=create rr_2
this.rr_3=create rr_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_listcode
this.Control[iCurrent+2]=this.uo_toolbar
this.Control[iCurrent+3]=this.st_title
this.Control[iCurrent+4]=this.p_2
this.Control[iCurrent+5]=this.dw_pilotage
this.Control[iCurrent+6]=this.rr_1
this.Control[iCurrent+7]=this.rr_2
this.Control[iCurrent+8]=this.rr_3
end on

on w_phrasegroupe.destroy
call super::destroy
destroy(this.uo_listcode)
destroy(this.uo_toolbar)
destroy(this.st_title)
destroy(this.p_2)
destroy(this.dw_pilotage)
destroy(this.rr_1)
destroy(this.rr_2)
destroy(this.rr_3)
end on

event open;call super::open;string ls_sql

ls_sql = "select categoriephrase, id_categoriephrase from t_categoriephrase where id_categoriephrase > 0 and ortho_Id = " + string(v_no_ortho) + " order by isnull(ordre,10000) asc"
uo_listcode.of_addsql(ls_sql)
end event

event pfc_postopen;call super::pfc_postopen;//S'il y a au moins une rangée, sélectionner la première
LONG	ll_tvi

ll_tvi = uo_listcode.tv_sg.FindItem(FirstVisibleTreeItem!, 0)

IF ll_tvi > 0 THEN
	ll_tvi = uo_listcode.tv_sg.SelectItem ( ll_tvi )
	uo_listcode.tv_sg.event clicked(ll_tvi)
END IF


end event

type uo_listcode from u_phrasegroup within w_phrasegroupe
integer x = 50
integer y = 184
integer width = 1275
integer height = 1592
integer taborder = 20
end type

on uo_listcode.destroy
call u_phrasegroup::destroy
end on

event ue_clicked;call super::ue_clicked;string ls_type
long ll_cle

ls_type = left(as_cle,1)
ll_cle = long(mid(as_cle,2))
il_parent = ll_cle
is_type = ls_type
il_handle = al_handle

dw_pilotage.retrieve(ll_cle,ls_type)
end event

type uo_toolbar from u_cst_toolbarstrip within w_phrasegroupe
integer x = 9
integer y = 1828
integer width = 3607
integer taborder = 20
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;LONG	ll_tvi
ll_tvi = uo_listcode.tv_sg.FindItem(FirstVisibleTreeItem!, 0)
CHOOSE CASE as_button
	CASE 'Add category','Ajouter une catégorie'
		IF dw_pilotage.event ue_update() >= 0 THEN
			of_addgroup()
		END IF
	CASE 'Add sub category','Ajouter une sous-catégorie'
		
		IF ll_tvi > 0 THEN		
			IF dw_pilotage.event ue_update() >= 0 THEN
				ib_insertion = TRUE
				dw_pilotage.event addRow()
			END IF
		END IF
	CASE "Delete category","Supprimer une catégorie"
		IF ll_tvi > 0 THEN	
			IF dw_pilotage.event ue_update() >= 0 THEN
				of_delgroup()
			END IF
		END IF
	CASE 'Delete sub category','Supprimer une sous-catégorie'
		IF dw_pilotage.event ue_update() >= 0 THEN
			dw_pilotage.event delRow(dw_pilotage.getRow())
		END IF
	CASE 'Save','Sauvegarder'
		dw_pilotage.event ue_update()
	CASE 'Close','Fermer'
		if change then
			if error_type(200) = 1 then
				dw_pilotage.event ue_update()
			end if
		end if
		close(parent)
END CHOOSE
end event

type st_title from st_uo_transparent within w_phrasegroupe
integer x = 183
integer y = 28
integer width = 1170
integer height = 80
integer textsize = -12
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 15793151
string text = "Liste des phrases"
end type

type p_2 from picture within w_phrasegroupe
integer x = 69
integer y = 28
integer width = 78
integer height = 80
string picturename = "C:\ii4net\orthotek\images\listview_column.bmp"
boolean focusrectangle = false
end type

type dw_pilotage from datawindow within w_phrasegroupe
event addrow ( )
event delrow ( long row )
event type long ue_update ( )
integer x = 1408
integer y = 188
integer width = 2199
integer height = 1592
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_souscategoriephrase"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event addrow();long ll_row

ll_row = insertRow(0)
IF ll_row > 0 THEN
	scrollToRow(ll_row)
	if is_type = 'G' then
		setItem(ll_row,'id_categoriephrase',il_parent)
	else
		setItem(ll_row,'id_souscategoriephrasefils',il_parent)
	end if
	setFocus()
	setColumn('souscategoriephrase')
	change = true
END IF
end event

event delrow(long row);IF row > 0 THEN
	deleteRow(row)
	change = true
	event ue_update()
END IF

end event

event type long ue_update();long 		ll_handle, ll_cle, ll_row
string 	ls_label, ls_type

if change then
	if update() = 1 then
		commit using SQLCA;
		change = false
		ll_row = dw_pilotage.getRow()
		IF ll_row > 0 AND ib_insertion = TRUE THEN
			ls_label = dw_pilotage.getItemString(ll_row,'souscategoriephrase')
			ll_cle = dw_pilotage.getItemNumber(ll_row,'id_souscategoriephrase')
			ll_handle = uo_listcode.of_ajoutfeuille(ls_label,ll_cle,il_handle,'S')
			uo_listcode.of_expandnode(il_handle)
		END IF
		ib_insertion = FALSE
		RETURN 1
	else
		rollback using SQLCA;
		error_type(50)
		RETURN -1
	end if
ELSE
	RETURN 0
end if
end event

event constructor;setTransObject(SQLCA)
setRowFocusIndicator(hand!)
end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

event clicked;long		ll_color, ll_retour

IF row > 0 THEN

	if dwo.name = "shl_changer" THEN
		ll_color = THIS.Object.couleur[row]
		IF Isnull(ll_color) THEN ll_color = 0
		
		ll_retour = ChooseColor ( ll_color) 
		if ll_retour > 0 then
		
			THIS.Object.couleur[row] = ll_color
			THIS.AcceptText()
			change = true
			THIS.event ue_update()
					
		END IF
	END IF
END IF
end event

type rr_1 from roundrectangle within w_phrasegroupe
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15780518
integer x = 1399
integer y = 172
integer width = 2217
integer height = 1624
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_phrasegroupe
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15793151
integer x = 27
integer y = 172
integer width = 1321
integer height = 1624
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_3 from roundrectangle within w_phrasegroupe
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15793151
integer x = 23
integer y = 8
integer width = 3593
integer height = 120
integer cornerheight = 77
integer cornerwidth = 77
end type

