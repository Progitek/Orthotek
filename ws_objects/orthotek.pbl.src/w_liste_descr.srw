$PBExportHeader$w_liste_descr.srw
forward
global type w_liste_descr from w_child
end type
type ddlb_sujet from u_ddlb within w_liste_descr
end type
type st_2 from statictext within w_liste_descr
end type
type cb_delete from commandbutton within w_liste_descr
end type
type cb_del from commandbutton within w_liste_descr
end type
type dw_catplan from u_dw within w_liste_descr
end type
type st_1 from statictext within w_liste_descr
end type
type cb_fermer from commandbutton within w_liste_descr
end type
type cb_ajout from commandbutton within w_liste_descr
end type
type dw_plan from u_dw within w_liste_descr
end type
type cb_ins from commandbutton within w_liste_descr
end type
type r_1 from rectangle within w_liste_descr
end type
end forward

global type w_liste_descr from w_child
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
boolean ib_isupdateable = false
ddlb_sujet ddlb_sujet
st_2 st_2
cb_delete cb_delete
cb_del cb_del
dw_catplan dw_catplan
st_1 st_1
cb_fermer cb_fermer
cb_ajout cb_ajout
dw_plan dw_plan
cb_ins cb_ins
r_1 r_1
end type
global w_liste_descr w_liste_descr

type variables
string cat
private int ii_modeajout = 0
public boolean change = false
public boolean change2 = false
private long il_idsujet[]
private long il_indsujet
end variables

forward prototypes
public subroutine ajouter ()
public subroutine sauvegarde ()
public subroutine save ()
end prototypes

public subroutine ajouter ();
end subroutine

public subroutine sauvegarde ();if dw_plan.update() = 1 then
	commit using SQLCA;
	change2 = false
else
	rollback using SQLCA;
	error_type(50)
end if
end subroutine

public subroutine save ();if dw_catplan.update() = 1 then
	commit using SQLCA;
	change = false
else
	rollback using SQLCA;
	error_type(50)
end if
end subroutine

on w_liste_descr.create
int iCurrent
call super::create
this.ddlb_sujet=create ddlb_sujet
this.st_2=create st_2
this.cb_delete=create cb_delete
this.cb_del=create cb_del
this.dw_catplan=create dw_catplan
this.st_1=create st_1
this.cb_fermer=create cb_fermer
this.cb_ajout=create cb_ajout
this.dw_plan=create dw_plan
this.cb_ins=create cb_ins
this.r_1=create r_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_sujet
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.cb_delete
this.Control[iCurrent+4]=this.cb_del
this.Control[iCurrent+5]=this.dw_catplan
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.cb_fermer
this.Control[iCurrent+8]=this.cb_ajout
this.Control[iCurrent+9]=this.dw_plan
this.Control[iCurrent+10]=this.cb_ins
this.Control[iCurrent+11]=this.r_1
end on

on w_liste_descr.destroy
call super::destroy
destroy(this.ddlb_sujet)
destroy(this.st_2)
destroy(this.cb_delete)
destroy(this.cb_del)
destroy(this.dw_catplan)
destroy(this.st_1)
destroy(this.cb_fermer)
destroy(this.cb_ajout)
destroy(this.dw_plan)
destroy(this.cb_ins)
destroy(this.r_1)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

title = "Liste des traitements"

end event

type ddlb_sujet from u_ddlb within w_liste_descr
integer x = 2203
integer width = 1413
integer height = 732
integer taborder = 20
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean allowedit = true
boolean sorted = false
boolean ib_autoselect = true
boolean ib_rmbmenu = false
boolean ib_search = true
end type

event constructor;call super::constructor;setData('dddw_sujet','sujet','id_sujet',il_idsujet,"ortho_id = " + string(v_no_ortho))
selectItem(1)
il_indsujet = 1

dw_catplan.setTransObject(SQLCA)
dw_plan.setTransObject(SQLCA)
dw_catplan.retrieve(il_idsujet[il_indsujet])
if dw_catplan.rowcount() <= 0 then
//	cb_delete.enabled = false
//	cb_ajout.enabled = false
	cb_ins.enabled = true
	cb_del.enabled = true
//	cb_sauve.enabled = true
end if
end event

event selectionchanged;call super::selectionchanged;if change or change2 then
	if error_type(200) = 1 then
		sauvegarde()
		save()
	end if
end if
il_indsujet = index

if dw_catplan.retrieve(il_idsujet[il_indsujet]) > 0 then
	dw_catplan.event rowFocusChanged(1)
	if dw_catplan.rowcount() <= 0 then
//		cb_delete.enabled = false
	//	cb_ajout.enabled = false
		cb_ins.enabled = true
		cb_del.enabled = true
	//	cb_sauve.enabled = true
else
	end if
else
	dw_plan.reset()
end if

end event

type st_2 from statictext within w_liste_descr
integer x = 1381
integer y = 20
integer width = 549
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Sujet"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Subject:'
end if
end event

type cb_delete from commandbutton within w_liste_descr
integer x = 2386
integer y = 1920
integer width = 645
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;dw_plan.deleteRow(dw_plan.getRow())
if dw_plan.update() = 1 then
	commit using SQLCA;
	change = true
else
	rollback using SQLCA;
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete'
end if
end event

type cb_del from commandbutton within w_liste_descr
integer x = 827
integer y = 1920
integer width = 841
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer cat."
end type

event clicked;dw_catplan.deleteRow(dw_catplan.getRow())
if dw_catplan.update() = 1 then
	commit using SQLCA;
	change = true
else
	rollback using SQLCA;
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete cat.'
end if
end event

type dw_catplan from u_dw within w_liste_descr
integer x = 5
integer y = 112
integer width = 1664
integer height = 1792
integer taborder = 20
string title = "none"
string dataobject = "d_catplan"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

setRowFocusIndicator(hand!)
if v_langue = 'an' then
	this.object.t_cat.text = 'Categories'
	this.object.t_order.text = 'Order'
	this.object.t_g.text = 'B'
	this.object.t_s.text = 'U'
	this.object.t_h.text = 'T'
	this.object.t_b.text = 'L'
	this.object.t_an.text = 'En.'
end if
end event

event itemchanged;change = true
end event

event editchanged;change = true
end event

event rowfocuschanged;if change2 then
	sauvegarde()
end if
if rowcount() > 0 then
	dw_plan.event ue_retrieve()
end if
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

event rbuttondown;call super::rbuttondown;//scrolltorow(row)
//if row > 0 then
//	m_insertinfo my_menu
//	my_menu = create m_insertinfo
//	message.powerObjectParm = this
//	m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
//	destroy my_menu
//end if
//
end event

type st_1 from statictext within w_liste_descr
integer width = 1243
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Liste des traitements"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.Text = "Treatment list"
end if

dw_catplan.setTransObject(SQLCA)
end event

type cb_fermer from commandbutton within w_liste_descr
integer x = 3031
integer y = 1920
integer width = 599
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if change or change2 then
	if error_type(200) = 1 then
		sauvegarde()
		save()
	end if
end if
close(parent)
//if isvalid(w_description) then
//	w_description.dddw_plancat.settransobject(sqlca)
////	w_description.dddw_plancat.retrieve(w_description.il_idsujet[w_description.il_indsujet])
////	w_description.dddw_plancat.setFilter("id_sujet = " + string(w_description.il_idsujet[w_description.il_indsujet]))
//	w_description.dddw_plancat.setSort('ordre A')
//	w_description.dddw_plancat.filter()
//end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_ajout from commandbutton within w_liste_descr
integer x = 1705
integer y = 1920
integer width = 677
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter traitement"
end type

event clicked;long ll_row
long ll_idcatplan

// save
if change2 then
	sauvegarde()
//	cb_ins.enabled = true
//	cb_del.enabled = true
//	cb_sauve.enabled = true
//	cb_maj.enabled = true
//	cb_delete.enabled = true
//	cb_ajout.enabled = true
else
	change2 = true
end if

//ll_row = dw_liste_descr.insertrow(0)
//dw_liste_descr.scrolltorow(ll_row)
//dw_liste_descr.setitem(ll_row,"categorie",cat)
//dw_liste_descr.setitem(ll_row,"no_ortho",v_no_ortho)
//dw_liste_descr.setfocus()
//if	cb_maj.enabled = false then cb_maj.enabled = true
//ii_modeajout = 1

ll_idcatplan = dw_catplan.getItemNumber(dw_catplan.getRow(),'id_catplan')
//messagebox('',string(ll_idcatplan))
ll_row = dw_plan.insertRow(0)
dw_plan.scrollToRow(ll_row)
dw_plan.setItem(ll_row,'id_catplan',ll_idcatplan)
dw_plan.setFocus()
dw_plan.setColumn('description')
//cb_ins.enabled = false
//cb_del.enabled = false
//cb_sauve.enabled = false
//cb_maj.enabled = true
//cb_delete.enabled = true
//cb_ajout.enabled = false

end event

event constructor;if v_langue = 'an' then
	this.text = 'Add treatment'
end if
end event

type dw_plan from u_dw within w_liste_descr
event ue_retrieve ( )
integer x = 1701
integer y = 112
integer width = 1929
integer height = 1792
integer taborder = 10
string dataobject = "d_liste_descr"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();retrieve(dw_catplan.getitemnumber(dw_catplan.getrow(),'id_catplan'))
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	this.object.description_t.text = 'Treatments'
	this.object.t_order.text = 'Order'
	
	this.object.t_antech.text = 'EN T.'
	this.object.t_ansimp.text = 'EN S.'
end if
end event

event editchanged;change2 = true
end event

event itemchanged;//if KeyDown(KeyEnter!) = true then
//	long enr
//	enr = dw_liste_descr.insertrow(0)
//	dw_liste_descr.scrolltorow(enr)
//	dw_liste_descr.SetFocus()
//	dw_liste_descr.setitem(enr,"categorie",cat)
//	dw_liste_descr.setitem(enr,"no_ortho",v_no_ortho)
//	if	cb_maj.enabled = false then cb_maj.enabled = true
//	changement = 1
//end if
change2 = true
end event

event updateend;//long ll_row, ll_id
//integer test
//if rowsinserted <> 0 then
//	ll_row = dw_liste_descr.getrow()
//	select max(id) into :ll_id from description;
//	dw_liste_descr.setitem(ll_row,'id',ll_id)
//	if ii_modeajout = 1 then   
//     	test = dw_liste_descr.setitemstatus(ll_row,'id',primary!,notmodified!)
//		test = dw_liste_descr.setitemstatus(ll_row,'description',primary!,notmodified!)
//		test = dw_liste_descr.setitemstatus(ll_row,'categorie',primary!,notmodified!)
//		test = dw_liste_descr.setitemstatus(ll_row,'no_ortho',primary!,notmodified!) 
//	end if
//end if
end event

event dberror;if sqldbcode = -198 then
	error_type(148)
	dw_plan.event ue_retrieve()
else
	str_error  ErrorStr
	//populate the error structure
	ErrorStr.sqldbcode = sqldbcode
	ErrorStr.sqlerrtext = sqlerrtext
	ErrorStr.sqlsyntax = sqlsyntax
	ErrorStr.buffer = buffer
	ErrorStr.row = row
	
	//open the error window
	OpenWithParm ( w_error , ErrorStr )
	//do not display the error message
end if
RETURN 1
end event

event rbuttondown;call super::rbuttondown;scrolltorow(row)
if row > 0 then
	m_insertinfo my_menu
	my_menu = create m_insertinfo
	message.powerObjectParm = this
	m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
	destroy my_menu
end if

end event

type cb_ins from commandbutton within w_liste_descr
integer x = 5
integer y = 1920
integer width = 823
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajout cat."
end type

event clicked;long ll_row,ll_idcatplan

//save
if change then
	save()
else
	change = true
end if

ll_row = dw_catplan.insertRow(0)
dw_catplan.scrollToRow(ll_row)
dw_catplan.setITem(ll_row,'ortho_id',v_no_ortho)
dw_catplan.setItem(ll_row,'id_sujet',il_idsujet[il_indsujet])
dw_catplan.setItem(ll_row,'categorie','')
dw_catplan.setItem(ll_row,'word',1)
save()
dw_catplan.setFocus()
dw_catplan.setColumn('categorie')


end event

event constructor;if v_langue = 'an' then
	this.text = 'Add cat.'
end if
end event

type r_1 from rectangle within w_liste_descr
integer linethickness = 1
long fillcolor = 8388608
integer x = 1673
integer y = 104
integer width = 23
integer height = 1904
end type

