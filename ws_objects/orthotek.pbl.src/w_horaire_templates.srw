$PBExportHeader$w_horaire_templates.srw
forward
global type w_horaire_templates from w_child
end type
type dw_templates from u_dw within w_horaire_templates
end type
type dw_color_traitements from u_dw within w_horaire_templates
end type
type dw_template_ajout from u_dw within w_horaire_templates
end type
type cb_insert from commandbutton within w_horaire_templates
end type
type cb_delete from commandbutton within w_horaire_templates
end type
type cb_close from commandbutton within w_horaire_templates
end type
type cb_update from commandbutton within w_horaire_templates
end type
type cb_1 from commandbutton within w_horaire_templates
end type
end forward

global type w_horaire_templates from w_child
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
boolean ib_isupdateable = false
dw_templates dw_templates
dw_color_traitements dw_color_traitements
dw_template_ajout dw_template_ajout
cb_insert cb_insert
cb_delete cb_delete
cb_close cb_close
cb_update cb_update
cb_1 cb_1
end type
global w_horaire_templates w_horaire_templates

type variables
int changement = 0
end variables

forward prototypes
public subroutine sauve ()
end prototypes

public subroutine sauve ();if dw_template_ajout.update() = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if
end subroutine

on w_horaire_templates.create
int iCurrent
call super::create
this.dw_templates=create dw_templates
this.dw_color_traitements=create dw_color_traitements
this.dw_template_ajout=create dw_template_ajout
this.cb_insert=create cb_insert
this.cb_delete=create cb_delete
this.cb_close=create cb_close
this.cb_update=create cb_update
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_templates
this.Control[iCurrent+2]=this.dw_color_traitements
this.Control[iCurrent+3]=this.dw_template_ajout
this.Control[iCurrent+4]=this.cb_insert
this.Control[iCurrent+5]=this.cb_delete
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.cb_update
this.Control[iCurrent+8]=this.cb_1
end on

on w_horaire_templates.destroy
call super::destroy
destroy(this.dw_templates)
destroy(this.dw_color_traitements)
destroy(this.dw_template_ajout)
destroy(this.cb_insert)
destroy(this.cb_delete)
destroy(this.cb_close)
destroy(this.cb_update)
destroy(this.cb_1)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type dw_templates from u_dw within w_horaire_templates
integer x = 32
integer y = 1292
integer width = 3561
integer height = 624
integer taborder = 30
string title = "none"
string dataobject = "d_templates"
boolean border = false
boolean hsplitscroll = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;setrowfocusindicator(hand!)
settransobject(SQLCA)
retrieve()
end event

type dw_color_traitements from u_dw within w_horaire_templates
integer x = 1774
integer y = 28
integer width = 1801
integer height = 1244
integer taborder = 20
string title = "none"
string dataobject = "d_color_traitements"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;setrowfocusindicator(hand!)
settransobject(SQLCA)
retrieve()
end event

type dw_template_ajout from u_dw within w_horaire_templates
integer x = 37
integer y = 28
integer width = 1733
integer height = 1240
integer taborder = 10
string title = "none"
string dataobject = "d_template_ajout"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;settransobject(SQLCA)
end event

type cb_insert from commandbutton within w_horaire_templates
integer x = 32
integer y = 1932
integer width = 699
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;long ll_row

ll_row = dw_template_ajout.insertrow(0)
dw_template_ajout.scrolltorow(ll_row)
dw_template_ajout.setfocus()
changement = 1
end event

type cb_delete from commandbutton within w_horaire_templates
integer x = 736
integer y = 1932
integer width = 699
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;if error_type(208)  =  1 then
   dw_templates.deleterow(dw_templates.getrow())
	if dw_templates.update() = 1 then
	   commit using SQLCA;
   else
	   rollback using SQLCA;
   end if
end if
end event

type cb_close from commandbutton within w_horaire_templates
integer x = 2848
integer y = 1932
integer width = 699
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;if changement = 1 then
   if error_type(200) = 1 then
	   sauve()
   end if
end if
close(parent)
end event

type cb_update from commandbutton within w_horaire_templates
integer x = 2144
integer y = 1932
integer width = 699
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder"
end type

event clicked;int li_typetraitement 

li_typetraitement  = dw_color_traitements.getitemnumber(dw_color_traitements.getrow(),'type_traitement_id')
dw_template_ajout.setitem(dw_template_ajout.getrow(),'type_traitement_id',li_typetraitement)
sauve()
changement = 0
end event

type cb_1 from commandbutton within w_horaire_templates
integer x = 1440
integer y = 1932
integer width = 699
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

