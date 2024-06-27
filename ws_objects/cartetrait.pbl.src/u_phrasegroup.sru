$PBExportHeader$u_phrasegroup.sru
forward
global type u_phrasegroup from u_base
end type
type tv_sg from u_tv within u_phrasegroup
end type
end forward

global type u_phrasegroup from u_base
integer width = 1358
integer height = 1680
long backcolor = 15793151
string text = "none"
long picturemaskcolor = 536870912
event ue_clicked ( string as_cle,  integer al_handle )
tv_sg tv_sg
end type
global u_phrasegroup u_phrasegroup

type variables
constant string icons_sql = "select categoriephrase, id_categoriephrase from t_categoriephrase where id_categoriephrase > 0 order by isnull(ordre,10000) asc"

protected:
	
	any ia_data[]
end variables

forward prototypes
public subroutine of_addsql (string as_sql)
public subroutine of_addsousgroupe (long al_cle, long al_handlepere)
public subroutine of_addsgr (long al_cle, long al_handlepere)
public function long of_ajoutfeuille (string as_label, long al_cle, long al_parent, string as_type)
public function long of_trouvercle (long al_cle)
public subroutine of_expandnode (long al_handle)
public subroutine of_changercouleur (long handle)
public subroutine of_changernom (long handle)
public subroutine of_changerordre (long handle)
end prototypes

public subroutine of_addsql (string as_sql);string ls_label
long ll_cle, ll_handle, ll_roothandle
treeviewitem ltv
long tvi_hdl = 0

DO UNTIL tv_sg.FindItem(RootTreeItem!, 0) = -1
    tv_sg.DeleteItem(tvi_hdl)
LOOP

DECLARE listsql DYNAMIC CURSOR FOR SQLSA;
prepare sqlsa from :as_sql;

OPEN listsql;

FETCH listsql INTO :ls_label,:ll_cle;

DO WHILE SQLCA.SQLCode = 0
	
	ltv.label = ls_label
	ltv.data = 'G'+string(ll_cle)
	ll_roothandle = tv_sg.InsertItemLast(0,ltv)
	of_addsousgroupe(ll_cle,ll_roothandle)
	
	FETCH listsql INTO :ls_label,:ll_cle;
LOOP

CLOSE listsql;

end subroutine

public subroutine of_addsousgroupe (long al_cle, long al_handlepere);string ls_label
long ll_cle, ll_rootpere, i
treeviewitem ltv
datastore ds_treeview

ds_treeview = create datastore
ds_treeview.dataobject = 'd_souscategoriephrase'
ds_treeview.setTransObject(SQLCA)
ds_treeview.retrieve(al_cle,'G')

for i = 1 to ds_treeview.rowcount()
	ll_cle = ds_treeview.getItemNumber(i,'id_souscategoriephrase')
	ls_label = ds_treeview.getItemString(i,'souscategoriephrase')
	ltv.label = ls_label
	ltv.data = 'S'+string(ll_cle)
	ll_rootpere = tv_sg.InsertItemLast(al_handlepere,ltv)
	of_addsgr(ll_cle,ll_rootpere)
next

destroy ds_treeview
end subroutine

public subroutine of_addsgr (long al_cle, long al_handlepere);string ls_label
long ll_cle, ll_rootpere, i
treeviewitem ltv
datastore ds_treeview

ds_treeview = create datastore
ds_treeview.dataobject = 'd_souscategoriephrase'
ds_treeview.setTransObject(SQLCA)
ds_treeview.retrieve(al_cle,'S')

for i = 1 to ds_treeview.rowcount()
	ll_cle = ds_treeview.getItemNumber(i,'id_souscategoriephrase')
	ls_label = ds_treeview.getItemString(i,'souscategoriephrase')
	ltv.label = ls_label
	ltv.data = 'S'+string(ll_cle)
	ll_rootpere = tv_sg.InsertItemLast(al_handlepere,ltv)
	of_addsgr(ll_cle,ll_rootpere)
next

destroy ds_treeview
end subroutine

public function long of_ajoutfeuille (string as_label, long al_cle, long al_parent, string as_type);long ll_tvi, ll_tvparent, ll_handle
treeviewitem  l_tvi

ll_tvi = tv_sg.FindItem(currenttreeitem!, 0)
l_tvi.label = as_label
l_tvi.data = as_type + string(al_cle)
ll_handle = tv_sg.InsertItem(al_parent,ll_tvi, l_tvi)
return ll_handle
end function

public function long of_trouvercle (long al_cle);//tv_sg.finditem( CurrentTreeItem!	 c*/, /*long h */)
return 0 
end function

public subroutine of_expandnode (long al_handle);tv_sg.ExpandAll(al_handle)
end subroutine

public subroutine of_changercouleur (long handle);//Sélectionner la couleur
long		ll_retour, ll_color = 0
string 	ls_cle
treeviewitem l_tvi

tv_sg.GetItem(handle, l_tvi)
ls_cle = string(l_tvi.data)
IF Left (ls_cle, 1) = "G" THEN
	ls_cle = MID(ls_cle,2)
	
	SELECT couleur INTO :ll_color FROM t_categoriephrase WHERE id_categoriephrase = :ls_cle ;
	IF IsNull(ll_color) THEN ll_color = 0
	
	ll_retour = ChooseColor ( ll_color) 
	if ll_retour > 0 then
		//Lancer le update
	
		UPDATE t_categoriephrase SET couleur = :ll_color WHERE id_categoriephrase = :ls_cle ;
		COMMIT USING SQLCA;
	
	END IF
END IF
end subroutine

public subroutine of_changernom (long handle);//Sélectionner la couleur
long		ll_retour, ll_color = 0
string 	ls_cle, ls_categorie
treeviewitem l_tvi

tv_sg.GetItem(handle, l_tvi)
ls_cle = string(l_tvi.data)
IF Left (ls_cle, 1) = "G" THEN
	
	ls_cle = MID(ls_cle,2)	
	
	select categoriephrase into :ls_categorie from t_categoriephrase WHERE id_categoriephrase = :ls_cle;
	ls_categorie = inputbox("Changement de nom", "Quel est le nouveau nom que vous désirez?", ls_categorie)
	
	if not isnull(ls_categorie) then
		UPDATE t_categoriephrase SET categoriephrase = :ls_categorie WHERE id_categoriephrase = :ls_cle;
		COMMIT USING SQLCA;
		
		of_addsql(icons_sql)
	end if
	

END IF
end subroutine

public subroutine of_changerordre (long handle);//Sélectionner la couleur
long		ll_retour, ll_ordre = 0
string 	ls_cle, ls_rep
treeviewitem l_tvi

tv_sg.GetItem(handle, l_tvi)
ls_cle = string(l_tvi.data)
IF Left (ls_cle, 1) = "G" THEN
	
	ls_cle = MID(ls_cle,2)	
	
	select ordre into :ll_ordre from t_categoriephrase WHERE id_categoriephrase = :ls_cle;
	ls_rep = inputbox("Changement de l'ordre", "Quel est sera sa nouvelle ordre?", string(ll_ordre))
	if not isnull(ls_rep) then
	
	
		ll_ordre = long(ls_rep)
		
		UPDATE t_categoriephrase SET ordre = :ll_ordre WHERE id_categoriephrase = :ls_cle;
		COMMIT USING SQLCA;
		
		of_addsql(icons_sql)
	
	end if
	

END IF
end subroutine

on u_phrasegroup.create
int iCurrent
call super::create
this.tv_sg=create tv_sg
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_sg
end on

on u_phrasegroup.destroy
call super::destroy
destroy(this.tv_sg)
end on

event resize;call super::resize;tv_sg.height = this.height
tv_sg.width = this.width
end event

type tv_sg from u_tv within u_phrasegroup
integer width = 1353
integer height = 1672
integer taborder = 10
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 15793151
boolean border = false
boolean linesatroot = true
long picturemaskcolor = 536870912
end type

event clicked;string ls_cle
treeviewitem l_tvi

tv_sg.GetItem(handle, l_tvi)
ls_cle = string(l_tvi.data)

parent.event ue_clicked(ls_cle,handle)
end event

event rightclicked;call super::rightclicked;m_phrase my_menu
my_menu = create m_phrase
m_phrase.of_translate()
m_phrase.il_handle = handle
m_phrase.popmenu (pointerx()+200, pointery()+600)
end event

