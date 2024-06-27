$PBExportHeader$w_groupes.srw
forward
global type w_groupes from w_child
end type
type cb_enr from commandbutton within w_groupes
end type
type cb_droit from commandbutton within w_groupes
end type
type cb_suppr from commandbutton within w_groupes
end type
type st_users from statictext within w_groupes
end type
type st_gr from statictext within w_groupes
end type
type cb_ajout from commandbutton within w_groupes
end type
type tv_groupes from u_tv within w_groupes
end type
type st_titre from statictext within w_groupes
end type
type tv_users from u_tv within w_groupes
end type
type cb_fermer from commandbutton within w_groupes
end type
end forward

global type w_groupes from w_child
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
boolean ib_isupdateable = false
cb_enr cb_enr
cb_droit cb_droit
cb_suppr cb_suppr
st_users st_users
st_gr st_gr
cb_ajout cb_ajout
tv_groupes tv_groupes
st_titre st_titre
tv_users tv_users
cb_fermer cb_fermer
end type
global w_groupes w_groupes

type variables
Private:

long il_persid
long il_currhandle = 0
long il_type = 0
boolean ib_change = false
end variables

event open;call super::open;pro_resize luo_rs
luo_rs.uf_resizew(this, 0, 0)

title = "Groupes"
end event

on w_groupes.create
int iCurrent
call super::create
this.cb_enr=create cb_enr
this.cb_droit=create cb_droit
this.cb_suppr=create cb_suppr
this.st_users=create st_users
this.st_gr=create st_gr
this.cb_ajout=create cb_ajout
this.tv_groupes=create tv_groupes
this.st_titre=create st_titre
this.tv_users=create tv_users
this.cb_fermer=create cb_fermer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enr
this.Control[iCurrent+2]=this.cb_droit
this.Control[iCurrent+3]=this.cb_suppr
this.Control[iCurrent+4]=this.st_users
this.Control[iCurrent+5]=this.st_gr
this.Control[iCurrent+6]=this.cb_ajout
this.Control[iCurrent+7]=this.tv_groupes
this.Control[iCurrent+8]=this.st_titre
this.Control[iCurrent+9]=this.tv_users
this.Control[iCurrent+10]=this.cb_fermer
end on

on w_groupes.destroy
call super::destroy
destroy(this.cb_enr)
destroy(this.cb_droit)
destroy(this.cb_suppr)
destroy(this.st_users)
destroy(this.st_gr)
destroy(this.cb_ajout)
destroy(this.tv_groupes)
destroy(this.st_titre)
destroy(this.tv_users)
destroy(this.cb_fermer)
end on

event closequery;call super::closequery;if ib_change then
	choose case error_type(259)
		case 1
			tv_groupes.of_update(1)
			tv_users.of_update(2)
			
			commit;
			ib_change = false
		case 3
			rollback;
			return 1
	end choose
end if

end event

type cb_enr from commandbutton within w_groupes
integer x = 1527
integer y = 1924
integer width = 507
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarder"
end type

event clicked;tv_groupes.of_update(1)
tv_users.of_update(2)

commit;

ib_change = false

end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type cb_droit from commandbutton within w_groupes
integer x = 1019
integer y = 1924
integer width = 507
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Droits"
end type

event clicked;if il_persid > 0 then
	opensheetwithparm(w_personneldroits,il_persid,w_principal,2,layered!)
end if

end event

event constructor;if v_langue = 'an' then
	this.text = 'Right Policies'
end if
end event

type cb_suppr from commandbutton within w_groupes
integer x = 512
integer y = 1924
integer width = 507
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;long ll_hdl, ll_row, ll_id
n_ds l_ds

if il_currhandle = 0 then
	error_type(1001)
	return 0
end if

choose case il_type
	case 1 // Groupe dans tv_groupes
		tv_groupes.of_getDataRow(il_currhandle, l_ds, ll_row)
		
		if messagebox("Question!","Voulez-vous vraiment supprimer le groupe " + string(l_ds.object.nom[ll_row]) + " ?",question!,YesNo!,2) = 2 then return 0
		
		tv_groupes.of_update(1)
		tv_users.of_update(2)
		
		ll_id = l_ds.object.id_personnel[ll_row]
		delete from t_personneldroit where id_personnel = :ll_id;

		tv_groupes.of_deleteItem(il_currhandle)
		
		tv_groupes.of_update(1)
		tv_users.of_update(2)
		
		tv_users.of_refreshLevel(1)
	case 2 // Usager dans tv_groupes
		tv_groupes.of_update()

		tv_groupes.of_deleteItem(il_currhandle)
		
		tv_groupes.of_update()

		tv_users.of_refreshLevel(1)
	case 3 // Usager dans tv_users
		error_type(1002)
	case 4 // Groupe dans tv_users
		tv_groupes.of_update(1)
		tv_users.of_update(2)

		tv_users.of_deleteItem(il_currhandle)
		
		tv_groupes.of_update(1)
		tv_users.of_update(2)
		
		tv_groupes.of_refreshLevel(1)
end choose

ib_change = true

end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete'
end if
end event

type st_users from statictext within w_groupes
integer x = 1856
integer y = 104
integer width = 311
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Utilisateurs"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Users'
end if
end event

type st_gr from statictext within w_groupes
integer x = 9
integer y = 104
integer width = 251
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Groupes"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Groups'
end if
end event

type cb_ajout from commandbutton within w_groupes
integer x = 5
integer y = 1924
integer width = 507
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event constructor;if v_langue = 'an' then
	this.text = 'Add'
end if
end event

event clicked;n_ds l_ds
long ll_row, ll_new, ll_cnt
string ls_nom

if v_langue = 'an' then
	ls_nom = inputbox("New user group", "Enter a name for the new group","")
else
	ls_nom = inputbox("Nouveau groupe utilisateur", "Entrez le nom du nouveau groupe","")
end if

if isNull(ls_nom) or ls_nom = "" then return 0
select count(*) into :ll_cnt from t_personnels where groupe = 1 and nom = :ls_nom;
if ll_cnt > 0 then
	error_type(1004)
	return 0
end if

tv_groupes.of_GetDatastore(1,l_ds)

// copy the data to the datastore
ll_row = l_ds.insertrow(0)
l_ds.object.nom[ll_row] = ls_nom
l_ds.object.groupe[ll_row] = 1

insert into t_personnels(nom, groupe) values (:ls_nom, 1);
if error_type(-1) = 0 then return 0
commit;
select max(id_personnel) into :ll_new from t_personnels;
l_ds.object.id_personnel[ll_row] = ll_new

tv_groupes.of_insertItem(0, l_ds, ll_row, 'Sort')

l_ds.setItemStatus(ll_row, 0, Primary!, DataModified!)

ib_change = true

end event

type tv_groupes from u_tv within w_groupes
integer x = 32
integer y = 176
integer width = 1765
integer height = 1740
integer taborder = 10
string dragicon = "UserObject5!"
boolean dragauto = true
boolean linesatroot = true
boolean disabledragdrop = false
boolean hideselection = false
end type

event constructor;call super::constructor;integer li_rc

li_rc = AddPicture("userobject5!")
li_rc = of_SetDatasource(1, "d_groupes", SQLCA, "nom", "", False, li_rc, li_rc)
li_rc = AddPicture("custom076!")
li_rc = of_SetDatasource(2, "d_personnelgroupe", SQLCA, "cp_desc", ":level.1.id_personnel", False, li_rc, li_rc)

of_InitialRetrieve()

end event

event selectionchanged;call super::selectionchanged;TreeViewItem ltvi_This
n_ds l_ds
long ll_row, ll_handle

this.GetItem(newhandle, ltvi_This)

il_currhandle = newhandle

if ltvi_this.level = 2 then
	ll_handle = this.findItem(ParentTreeItem!, newhandle)
	il_type = 2
else
	ll_handle = newhandle
	il_type = 1
end if

if ll_handle > 0 then
	this.of_GetDataRow(ll_handle,l_ds,ll_row)
	il_persid = l_ds.object.id_personnel[ll_row]
end if

end event

event getfocus;call super::getfocus;TreeViewItem ltvi_This
n_ds l_ds
long ll_row, ll_handle

ll_handle = this.findItem(CurrentTreeItem!, 0)

if this.GetItem(ll_handle, ltvi_This) = -1 then return 0

il_currhandle = ll_handle

if ltvi_this.level = 2 then
	ll_handle = this.findItem(ParentTreeItem!, ll_handle)
	il_type = 2
else
	il_type = 1
end if

if ll_handle > 0 then
	this.of_GetDataRow(ll_handle,l_ds,ll_row)
	il_persid = l_ds.object.id_personnel[ll_row]
end if

end event

event begindrag;call super::begindrag;TreeViewItem	ltvi_This

this.GetItem(handle, ltvi_This)
if ltvi_this.level <> 1 then 
	this.drag(cancel!)
else
	this.selectitem(handle)
end if

end event

event dragwithin;call super::dragwithin;u_tv ltv_source

ltv_source = source
if ltv_source <> tv_users then return
selectitem(handle)

end event

event dragdrop;call super::dragdrop;TreeViewItem	ltvi_This
n_ds l_ds
long ll_row, il_handle, ll_persid, ll_grpid
string ls_group, ls_user, ls_nom, ls_prenom
u_tv ltv_source

ltv_source = source
if ltv_source <> tv_users then return

il_handle = tv_users.finditem ( currenttreeitem!, 0 )

tv_users.of_GetDataRow(il_handle,l_ds,ll_row)
ls_user = l_ds.object.cp_desc[ll_row]
ll_persid = l_ds.object.id_personnel[ll_row]
ls_nom = l_ds.object.nom[ll_row]
ls_prenom = l_ds.object.prenom[ll_row]

this.GetItem(handle, ltvi_This)
if ltvi_this.level <> 1 then return
this.of_GetDataRow(handle,l_ds,ll_row)
ls_group = l_ds.object.nom[ll_row]
ll_grpid = l_ds.object.id_personnel[ll_row]

this.of_GetDatastore(2,l_ds)

this.expanditem(handle)
ll_row = l_ds.find('t_groupeusagers_id_user = '+string(ll_persid)+' and t_groupeusagers_id_group = '+string(ll_grpid),1,l_ds.rowcount())
if ll_row > 0 then
	if v_langue = 'an' then
		messagebox(parent.title,"The user "+ls_user+" is already a member of the group "+ls_group+".",information!)
	else
		messagebox(parent.title,"L'utilisateur "+ls_user+" est déjà membre du groupe "+ls_group+".",information!)
	end if
	return
end if

// Users dans groupes
ll_row = l_ds.insertrow(0)
l_ds.object.id_personnel[ll_row] = ll_persid
l_ds.object.t_groupeusagers_id_user[ll_row] = ll_persid
l_ds.object.t_groupeusagers_id_group[ll_row] = ll_grpid
l_ds.object.nom[ll_row] = ls_nom
l_ds.object.prenom[ll_row] = ls_prenom
il_handle = this.of_InsertItem(handle,l_ds,ll_row,'Sort')
this.selectitem(il_handle)

// Groupes dans Users
il_handle = tv_users.finditem ( currenttreeitem!, 0 )
tv_users.of_GetDatastore(2,l_ds)
ll_row = l_ds.insertrow(0)
l_ds.object.id_personnel[ll_row] = ll_grpid
l_ds.object.t_groupeusagers_id_user[ll_row] = ll_persid
l_ds.object.t_groupeusagers_id_group[ll_row] = ll_grpid
l_ds.object.nom[ll_row] = ls_group
tv_users.of_InsertItem(il_handle,l_ds,ll_row,'Sort')

ib_change = true

end event

event doubleclicked;call super::doubleclicked;TreeViewItem ltvi_This
n_ds l_ds
long ll_row, ll_handle

this.GetItem(handle, ltvi_This)

if ltvi_this.level = 1 then
	this.of_GetDataRow(handle,l_ds,ll_row)
	il_persid = l_ds.object.id_personnel[ll_row]
	
	opensheetwithparm(w_personneldroits,il_persid,w_principal,2,layered!)
end if

end event

type st_titre from statictext within w_groupes
integer x = 14
integer y = 4
integer width = 786
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Groupes utilisateurs"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'User groups'
end if
end event

type tv_users from u_tv within w_groupes
integer x = 1851
integer y = 176
integer width = 1765
integer height = 1740
integer taborder = 10
string dragicon = "C:\ii4net\orthotekdev\images\user.ico"
boolean dragauto = true
boolean bringtotop = true
boolean linesatroot = true
boolean disabledragdrop = false
boolean hideselection = false
end type

event constructor;call super::constructor;integer li_rc

li_rc = AddPicture("custom076!")
li_rc = of_SetDatasource(1, "d_perslistgr", SQLCA, "cp_desc", "", False, li_rc, li_rc)
li_rc = AddPicture("userobject5!")
li_rc = of_SetDatasource(2, "d_groupespers", SQLCA, "nom", ":level.1.id_personnel", False, li_rc, li_rc)

of_InitialRetrieve()

end event

event selectionchanged;call super::selectionchanged;TreeViewItem ltvi_This
n_ds l_ds
long ll_row, ll_handle

this.GetItem(newhandle, ltvi_This)

il_currhandle = newhandle

if ltvi_this.level = 2 then
	ll_handle = this.findItem(ParentTreeItem!, newhandle)
	il_type = 4
else
	ll_handle = newhandle
	il_type = 3
end if

if ll_handle > 0 then
	this.of_GetDataRow(ll_handle,l_ds,ll_row)
	il_persid = l_ds.object.id_personnel[ll_row]
end if

end event

event getfocus;call super::getfocus;TreeViewItem ltvi_This
n_ds l_ds
long ll_row, ll_handle

ll_handle = this.findItem(CurrentTreeItem!, 0)

if this.GetItem(ll_handle, ltvi_This) = -1 then return 0

il_currhandle = ll_handle

if ltvi_this.level = 2 then
	ll_handle = this.findItem(ParentTreeItem!, ll_handle)
	il_type = 4
else
	il_type = 3
end if

if ll_handle > 0 then
	this.of_GetDataRow(ll_handle,l_ds,ll_row)
	il_persid = l_ds.object.id_personnel[ll_row]
end if

end event

event begindrag;call super::begindrag;TreeViewItem	ltvi_This

this.GetItem(handle, ltvi_This)
if ltvi_this.level <> 1 then 
	this.drag(cancel!)
else
	this.selectitem(handle)
end if

end event

event dragwithin;call super::dragwithin;u_tv ltv_source

ltv_source = source
if ltv_source <> tv_groupes then return
selectitem(handle)

end event

event dragdrop;call super::dragdrop;TreeViewItem	ltvi_This
n_ds l_ds
long ll_row, il_handle, ll_persid, ll_grpid
string ls_group, ls_user, ls_nom, ls_prenom
u_tv ltv_source

ltv_source = source
if ltv_source <> tv_groupes then return

il_handle = tv_groupes.finditem ( currenttreeitem!, 0 )

tv_groupes.of_GetDataRow(il_handle,l_ds,ll_row)
ls_group = l_ds.object.nom[ll_row]
ll_grpid = l_ds.object.id_personnel[ll_row]

this.GetItem(handle, ltvi_This)
if ltvi_this.level <> 1 then return
this.of_GetDataRow(handle,l_ds,ll_row)
ls_user = l_ds.object.cp_desc[ll_row]
ll_persid = l_ds.object.id_personnel[ll_row]
ls_nom = l_ds.object.nom[ll_row]
ls_prenom = l_ds.object.prenom[ll_row]

this.of_GetDatastore(2,l_ds)

this.expanditem(handle)
ll_row = l_ds.find('t_groupeusagers_id_user = '+string(ll_persid)+' and t_groupeusagers_id_group = '+string(ll_grpid),1,l_ds.rowcount())
if ll_row > 0 then
	if v_langue = 'an' then
		messagebox(parent.title,"The user "+ls_user+" is already a member of the group "+ls_group+".",information!)
	else
		messagebox(parent.title,"L'utilisateur "+ls_user+" est déjà membre du groupe "+ls_group+".",information!)
	end if
	return
end if

// Groupes dans Users
ll_row = l_ds.insertrow(0)
l_ds.object.id_personnel[ll_row] = ll_grpid
l_ds.object.t_groupeusagers_id_user[ll_row] = ll_persid
l_ds.object.t_groupeusagers_id_group[ll_row] = ll_grpid
l_ds.object.nom[ll_row] = ls_group
il_handle = this.of_InsertItem(handle,l_ds,ll_row,'Sort')
this.selectitem(il_handle)

// Users dans groupes
il_handle = tv_groupes.finditem ( currenttreeitem!, 0 )
tv_groupes.of_GetDatastore(2,l_ds)
ll_row = l_ds.insertrow(0)
l_ds.object.id_personnel[ll_row] = ll_persid
l_ds.object.t_groupeusagers_id_user[ll_row] = ll_persid
l_ds.object.t_groupeusagers_id_group[ll_row] = ll_grpid
l_ds.object.nom[ll_row] = ls_nom
l_ds.object.prenom[ll_row] = ls_prenom
tv_groupes.of_InsertItem(il_handle,l_ds,ll_row,'Sort')

ib_change = true

end event

event doubleclicked;call super::doubleclicked;TreeViewItem ltvi_This
n_ds l_ds
long ll_row, ll_handle

this.GetItem(handle, ltvi_This)

if ltvi_this.level = 1 then
	this.of_GetDataRow(handle,l_ds,ll_row)
	il_persid = l_ds.object.id_personnel[ll_row]
	
	opensheetwithparm(w_personneldroits,il_persid,w_principal,2,layered!)
end if

end event

type cb_fermer from commandbutton within w_groupes
integer x = 3113
integer y = 1924
integer width = 507
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
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

