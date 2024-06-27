$PBExportHeader$w_plantraitdesc.srw
forward
global type w_plantraitdesc from w_child
end type
type st_title from statictext within w_plantraitdesc
end type
type dw_plantraitdesc from u_dw within w_plantraitdesc
end type
type cb_update from commandbutton within w_plantraitdesc
end type
type cb_delete from commandbutton within w_plantraitdesc
end type
type cb_add from commandbutton within w_plantraitdesc
end type
type cb_close from commandbutton within w_plantraitdesc
end type
end forward

global type w_plantraitdesc from w_child
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
st_title st_title
dw_plantraitdesc dw_plantraitdesc
cb_update cb_update
cb_delete cb_delete
cb_add cb_add
cb_close cb_close
end type
global w_plantraitdesc w_plantraitdesc

type variables
private string is_type
end variables

on w_plantraitdesc.create
int iCurrent
call super::create
this.st_title=create st_title
this.dw_plantraitdesc=create dw_plantraitdesc
this.cb_update=create cb_update
this.cb_delete=create cb_delete
this.cb_add=create cb_add
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_title
this.Control[iCurrent+2]=this.dw_plantraitdesc
this.Control[iCurrent+3]=this.cb_update
this.Control[iCurrent+4]=this.cb_delete
this.Control[iCurrent+5]=this.cb_add
this.Control[iCurrent+6]=this.cb_close
end on

on w_plantraitdesc.destroy
call super::destroy
destroy(this.st_title)
destroy(this.dw_plantraitdesc)
destroy(this.cb_update)
destroy(this.cb_delete)
destroy(this.cb_add)
destroy(this.cb_close)
end on

event open;if v_langue = 'an' then
	st_title.text = 'Category : ' + is_type
else
	st_title.text = 'Catégorie : ' + is_type
end if
end event

type st_title from statictext within w_plantraitdesc
integer x = 5
integer width = 3579
integer height = 104
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Catégorie"
boolean focusrectangle = false
end type

type dw_plantraitdesc from u_dw within w_plantraitdesc
integer x = 5
integer y = 100
integer width = 3579
integer height = 1800
integer taborder = 10
string title = "plantraitdesc"
string dataobject = "d_plantraitdesc"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;is_type = message.stringparm

SetTransObject(SQLCA)
Retrieve(is_type)
end event

event doubleclicked;long ll_row
string ls_desciption
string ls_ligne

if isvalid(w_description) then
	ll_row = w_description.dw_plantrait.getRow()
	ls_desciption = w_description.dw_plantrait.getItemString(ll_row,'description')
	ls_ligne = getItemString(row,'descrip')
	if isnull(ls_desciption) then ls_desciption = ""
	ls_desciption += ' ' + ls_ligne
	w_description.dw_plantrait.setItem(ll_row,'description',ls_desciption)
end if
close(parent)
end event

type cb_update from commandbutton within w_plantraitdesc
integer x = 1737
integer y = 1920
integer width = 869
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarde"
end type

event clicked;if dw_plantraitdesc.update() = 1 then
	commit using sqlca;
else
	rollback using sqlca;
	error_type(50)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Update'
end if
end event

type cb_delete from commandbutton within w_plantraitdesc
integer x = 869
integer y = 1920
integer width = 869
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;dw_plantraitdesc.deleterow(dw_plantraitdesc.getrow())
dw_plantraitdesc.SetFocus()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete'
end if
end event

type cb_add from commandbutton within w_plantraitdesc
integer y = 1920
integer width = 869
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;long ll_newrow

ll_newrow = dw_plantraitdesc.insertrow(0)
dw_plantraitdesc.scrolltorow(ll_newrow)
dw_plantraitdesc.setItem(ll_newrow,'typedesc',is_type)
dw_plantraitdesc.SetFocus()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add'
end if
end event

type cb_close from commandbutton within w_plantraitdesc
integer x = 2606
integer y = 1920
integer width = 978
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

