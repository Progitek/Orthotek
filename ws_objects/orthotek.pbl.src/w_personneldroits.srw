$PBExportHeader$w_personneldroits.srw
forward
global type w_personneldroits from w_child
end type
type tab_droit from tab within w_personneldroits
end type
type tabpage_menu from userobject within tab_droit
end type
type tv_droits from u_tv within tabpage_menu
end type
type tabpage_menu from userobject within tab_droit
tv_droits tv_droits
end type
type tabpage_droits from userobject within tab_droit
end type
type dw_droitpersonnel from u_dw within tabpage_droits
end type
type tabpage_droits from userobject within tab_droit
dw_droitpersonnel dw_droitpersonnel
end type
type tab_droit from tab within w_personneldroits
tabpage_menu tabpage_menu
tabpage_droits tabpage_droits
end type
type st_titre from statictext within w_personneldroits
end type
type cb_close from commandbutton within w_personneldroits
end type
type cb_enr from commandbutton within w_personneldroits
end type
end forward

global type w_personneldroits from w_child
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
long backcolor = 67108864
string icon = "AppIcon!"
boolean ib_isupdateable = false
tab_droit tab_droit
st_titre st_titre
cb_close cb_close
cb_enr cb_enr
end type
global w_personneldroits w_personneldroits

type variables
long il_persid
end variables

forward prototypes
public function integer of_addobject (long al_parent, string as_object, string as_desc)
public function integer of_updatetree (long al_hndl)
public function integer of_explodeobject (menu am_item, string as_name, long al_hndl)
public function string of_getdesc (string as_text)
end prototypes

public function integer of_addobject (long al_parent, string as_object, string as_desc);//////////////////////////////////////////////////////////////////////////////
//	Function:	of_addobject
//////////////////////////////////////////////////////////////////////////////
long ll_cnt
treeViewItem ltvi_object
n_cst_string lnv_str

SetPointer ( HourGlass! )

if as_desc = "" and al_parent <> 0 then return -1
if lnv_str.of_isFormat(as_desc) then return -1

ltvi_object.Label = as_desc
ltvi_object.Data = as_object

select count(*) into :ll_cnt from t_persdroits where id_personnel = :il_persid and objet = :as_object;

if ll_cnt > 0 then
	ltvi_object.statePictureIndex = 2
else
	ltvi_object.statePictureIndex = 1
end if

Return tab_droit.tabpage_menu.tv_droits.insertItemLast(al_parent, ltvi_object)

end function

public function integer of_updatetree (long al_hndl);TreeViewItem ltvi_item
string ls_controle
long ll_child

if tab_droit.tabpage_menu.tv_droits.getItem(al_hndl, ltvi_item) <= 0 then return -1

if ltvi_item.statePictureIndex = 2 then
	ls_controle = string(ltvi_item.data)
	
	insert into t_persdroits (id_personnel, objet) values (:il_persid, :ls_controle);
	error_type(-1)
	
	ll_child = tab_droit.tabpage_menu.tv_droits.findItem(ChildTreeItem!, al_hndl)

	do while ll_child > 0
		of_updateTree(ll_child)
		ll_child = tab_droit.tabpage_menu.tv_droits.findItem(NextTreeItem!, ll_child)
	loop
end if

return 1

end function

public function integer of_explodeobject (menu am_item, string as_name, long al_hndl);//////////////////////////////////////////////////////////////////////////////
//	Function:			of_ExplodeObject
//	Description:  	Recursively scan an object.
//////////////////////////////////////////////////////////////////////////////
long ll_cnt, ll_idx, ll_hndl
string ls_name

SetPointer ( HourGlass! )

if not isValid(am_item) then return -1
if am_item.tag = "invisible" then return -1

// get the class it self
ls_name = lower(className(am_item))
ls_name = as_name + ls_name

select count(*)
  into :ll_cnt
  from t_persdroits
 where (id_personnel = :gl_idpers
		 or id_personnel in (select id_group
									  from t_groupeusagers
									 where id_user = :gl_idpers))
	and objet = :ls_name;

if ll_cnt = 0 then return -1

ll_hndl = of_AddObject(al_hndl, ls_name, of_getDesc(am_item.text))

if ll_hndl > 0 then
	// see how many objects to be scaned
	ll_cnt = UpperBound(am_item.item)
	// get the controls on the object
	For ll_idx = 1 To ll_cnt
		of_explodeObject(am_item.item[ll_idx], ls_name + ".", ll_hndl)
	Next
end if

Return 1

end function

public function string of_getdesc (string as_text);//////////////////////////////////////////////////////////////////////////////
//	Function:				of_GetMenuDesc
//	Description:  		Return the text of an object.
//////////////////////////////////////////////////////////////////////////////
long ll_idx, ll_cnt, ll_pos
string ls_desc, ls_piece1, ls_piece2

SetPointer ( HourGlass! )

ls_desc = trim(as_text)

If ls_desc <> "" Then
	ls_desc = rep(ls_desc, "~"", "")
	ll_pos = Pos ( ls_desc, "&&" ) 
	If ll_pos > 0 Then
		ls_piece1 = Mid(ls_desc, 1, ll_pos - 1)
		ls_piece2 = Mid(ls_desc, ll_pos)
		ls_piece1 = rep(ls_piece1, "&", "")
		ls_piece2 = rep(ls_piece2, "&", "")
		ls_desc = ls_piece1 + "&" + ls_piece2
	Else
		ls_desc = rep(ls_desc, "&", "")
	End If
	ll_pos = Pos ( ls_desc, "~t" ) 
	If ll_pos > 0 Then
		ls_desc = Mid(ls_desc, 1, ll_pos - 1)
	End If
End If

Return ls_desc
end function

on w_personneldroits.create
int iCurrent
call super::create
this.tab_droit=create tab_droit
this.st_titre=create st_titre
this.cb_close=create cb_close
this.cb_enr=create cb_enr
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_droit
this.Control[iCurrent+2]=this.st_titre
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.cb_enr
end on

on w_personneldroits.destroy
call super::destroy
destroy(this.tab_droit)
destroy(this.st_titre)
destroy(this.cb_close)
destroy(this.cb_enr)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

string ls_nom

il_persid = message.doubleparm //ext

select nom || (if prenom is null then '' else ', ' || prenom endif) into :ls_nom from t_personnels where id_personnel = :il_persid;

st_titre.text = "Gestion des droits : " + ls_nom
title = "Gestion des droits : " + ls_nom

tab_droit.tabpage_menu.tv_droits.event post ue_refresh()

if tab_droit.tabpage_droits.dw_droitpersonnel.retrieve(il_persid) = 0 then
	tab_droit.tabpage_droits.dw_droitpersonnel.insertRow(0)
	tab_droit.tabpage_droits.dw_droitpersonnel.setItem(1,'id_personnel',il_persid)
end if


end event

type tab_droit from tab within w_personneldroits
event create ( )
event destroy ( )
integer x = 14
integer y = 116
integer width = 3607
integer height = 1784
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_menu tabpage_menu
tabpage_droits tabpage_droits
end type

on tab_droit.create
this.tabpage_menu=create tabpage_menu
this.tabpage_droits=create tabpage_droits
this.Control[]={this.tabpage_menu,&
this.tabpage_droits}
end on

on tab_droit.destroy
destroy(this.tabpage_menu)
destroy(this.tabpage_droits)
end on

type tabpage_menu from userobject within tab_droit
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3570
integer height = 1656
long backcolor = 67108864
string text = "Droit accordé pour le menu"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
tv_droits tv_droits
end type

on tabpage_menu.create
this.tv_droits=create tv_droits
this.Control[]={this.tv_droits}
end on

on tabpage_menu.destroy
destroy(this.tv_droits)
end on

type tv_droits from u_tv within tabpage_menu
event ue_check ( long al_hndl,  integer ai_value )
event ue_checked ( long al_handle,  integer ai_statepictureindex )
event ue_refresh ( )
event type integer ue_update ( )
integer width = 3570
integer height = 1652
integer taborder = 20
boolean linesatroot = true
boolean checkboxes = true
end type

event ue_check(long al_hndl, integer ai_value);treeViewItem ltvi_item
long ll_child

if getItem(al_hndl, ltvi_item) < 0 then return

ltvi_item.statePictureIndex = ai_value

setItem(al_hndl, ltvi_item)

ll_child = findItem(ChildTreeItem!, al_hndl)

do while ll_child > 0
	event ue_check(ll_child, ai_value)
	ll_child = findItem(NextTreeItem!, ll_child)
loop

end event

event ue_checked(long al_handle, integer ai_statepictureindex);treeViewItem ltvi_item

if al_handle > 0 then
	if getItem(al_handle, ltvi_item) = -1 then return
	
	if ltvi_item.statePictureIndex = ai_StatePictureIndex then return
	
	event ue_check(al_handle, ltvi_item.statePictureIndex)
end if

end event

event ue_refresh();// Si la page principale n'est pas chargée (techniquement impossible)
if not isValid(w_principal) then return

of_explodeObject(w_principal.menuID, "", 0)

end event

event type integer ue_update();delete from t_persdroits where id_personnel = :il_persid;

return of_updateTree(findItem(RootTreeItem!, 0))

end event

event clicked;call super::clicked;treeViewItem ltvi_item

if handle > 0 then
	if getItem(handle, ltvi_item) = -1 then return 0
	
//	event post ue_checked(handle, ltvi_item.statePictureIndex)
end if

end event

type tabpage_droits from userobject within tab_droit
integer x = 18
integer y = 112
integer width = 3570
integer height = 1656
long backcolor = 67108864
string text = "Droit de l~'utilisateur"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_droitpersonnel dw_droitpersonnel
end type

on tabpage_droits.create
this.dw_droitpersonnel=create dw_droitpersonnel
this.Control[]={this.dw_droitpersonnel}
end on

on tabpage_droits.destroy
destroy(this.dw_droitpersonnel)
end on

type dw_droitpersonnel from u_dw within tabpage_droits
integer width = 3570
integer height = 1656
integer taborder = 11
string dataobject = "d_droitpersonnel"
boolean border = false
borderstyle borderstyle = stylebox!
end type

type st_titre from statictext within w_personneldroits
integer width = 1554
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Gestion des droits"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Right Policies'
end if
end event

type cb_close from commandbutton within w_personneldroits
integer x = 1819
integer y = 1912
integer width = 1801
integer height = 120
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type cb_enr from commandbutton within w_personneldroits
integer x = 18
integer y = 1912
integer width = 1801
integer height = 120
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Enregistrer et quitter"
end type

event clicked;if tab_droit.tabpage_menu.tv_droits.event ue_update() = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
	error_type(50)
end if

if tab_droit.tabpage_droits.dw_droitpersonnel.update() = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

close(parent)

end event

event constructor;if v_langue = 'an' then
	this.text = 'Save and close'
end if
end event

