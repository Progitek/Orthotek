$PBExportHeader$w_listmsgemail.srw
forward
global type w_listmsgemail from w_child
end type
type uo_toolbar from u_cst_toolbarstrip within w_listmsgemail
end type
type dw_listmsgemail from u_dw within w_listmsgemail
end type
type st_title from statictext within w_listmsgemail
end type
type rr_1 from roundrectangle within w_listmsgemail
end type
type rr_2 from roundrectangle within w_listmsgemail
end type
end forward

global type w_listmsgemail from w_child
integer x = 214
integer y = 221
integer width = 4640
integer height = 2620
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
long backcolor = 15780518
boolean ib_isupdateable = false
uo_toolbar uo_toolbar
dw_listmsgemail dw_listmsgemail
st_title st_title
rr_1 rr_1
rr_2 rr_2
end type
global w_listmsgemail w_listmsgemail

type variables
boolean change = false
long il_typecourriel
end variables

forward prototypes
public subroutine uf_traduction ()
public subroutine of_fermer ()
public subroutine of_sauvegarder ()
public subroutine of_supprimer ()
public subroutine of_ajouter ()
end prototypes

public subroutine uf_traduction ();uo_toolbar.of_displayborder(true)
uo_toolbar.of_settheme("classics")

if gnv_app.of_getlangue() = 'an' then
	st_title.text = "Predefined email list"
	title = "Predefined email list"
	uo_toolbar.of_addItem("Add","c:\ii4net\dentitek\images\ajouter.ico")
	uo_toolbar.of_addItem("Delete","c:\ii4net\dentitek\images\supprimer.ico")
	uo_toolbar.of_addItem("Save","Save!")
	uo_toolbar.of_addItem("Close","Exit!")
else
	st_title.text = "Liste de courriels prédéfinis"
	title = "Liste de courriels prédéfinis"
	uo_toolbar.of_addItem("Ajouter","c:\ii4net\dentitek\images\ajouter.ico")
	uo_toolbar.of_addItem("Supprimer","c:\ii4net\dentitek\images\supprimer.ico")
	uo_toolbar.of_addItem("Sauvegarder","Save!")
	uo_toolbar.of_addItem("Fermer","Exit!")
end if

uo_toolbar.of_displaytext(true)
end subroutine

public subroutine of_fermer ();close(this)
end subroutine

public subroutine of_sauvegarder ();if change then
	if dw_listmsgemail.update() = 1 then
		commit using SQLCA;
		change = false
	else
		rollback using SQLCA;
	end if
end if
end subroutine

public subroutine of_supprimer ();if error_type(218) = 1 then
	dw_listmsgemail.deleteRow(dw_listmsgemail.getRow())
	change = true
	of_sauvegarder()
end if
end subroutine

public subroutine of_ajouter ();long ll_row

ll_row = dw_listmsgemail.insertRow(0)
dw_listmsgemail.setItem(ll_row,'typemessage',0)
dw_listmsgemail.scrollToRow(ll_row)
change = true
end subroutine

on w_listmsgemail.create
int iCurrent
call super::create
this.uo_toolbar=create uo_toolbar
this.dw_listmsgemail=create dw_listmsgemail
this.st_title=create st_title
this.rr_1=create rr_1
this.rr_2=create rr_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_toolbar
this.Control[iCurrent+2]=this.dw_listmsgemail
this.Control[iCurrent+3]=this.st_title
this.Control[iCurrent+4]=this.rr_1
this.Control[iCurrent+5]=this.rr_2
end on

on w_listmsgemail.destroy
call super::destroy
destroy(this.uo_toolbar)
destroy(this.dw_listmsgemail)
destroy(this.st_title)
destroy(this.rr_1)
destroy(this.rr_2)
end on

event open;call super::open;//il_typecourriel = gnv_app.inv_entrepotglobal.of_retournedonnee("typecourriel" )
//if il_typecourriel > 0 and not isnull(il_typecourriel) then
//	dw_listmsgemail.setFilter("typemessage = " + string(il_typecourriel))
//end if
dw_listmsgemail.retrieve()

end event

type uo_toolbar from u_cst_toolbarstrip within w_listmsgemail
integer x = 23
integer y = 2500
integer width = 4603
integer taborder = 30
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;CHOOSE CASE as_button
	CASE "Add","Ajouter"
		of_ajouter()
	CASE "Delete","Supprimer"
		of_supprimer()
	CASE "Save","Sauvegarder"
		of_sauvegarder()
	CASE "Close","Fermer"
		of_fermer()
END CHOOSE
end event

type dw_listmsgemail from u_dw within w_listmsgemail
integer x = 32
integer y = 204
integer width = 4553
integer height = 2252
integer taborder = 20
string dataobject = "d_listmsgemail"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;call super::itemchanged;change = true
end event

event editchanged;call super::editchanged;change = true
end event

event rbuttondown;call super::rbuttondown;string ls_champfusion, ls_col
integer li_pos

li_pos = position()
m_insertinfo my_menu
my_menu = create m_insertinfo
m_insertinfo.uf_translate()
m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
selecttext(li_pos,0)
paste() 
destroy my_menu

end event

type st_title from statictext within w_listmsgemail
integer x = 55
integer y = 52
integer width = 2181
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12639424
string text = "Liste des courriels prédéfinis"
boolean focusrectangle = false
end type

type rr_1 from roundrectangle within w_listmsgemail
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 12639424
integer x = 14
integer y = 16
integer width = 4613
integer height = 152
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_listmsgemail
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15793151
integer x = 14
integer y = 192
integer width = 4613
integer height = 2284
integer cornerheight = 40
integer cornerwidth = 46
end type

