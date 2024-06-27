$PBExportHeader$w_choixcol.srw
forward
global type w_choixcol from w_response
end type
type lb_champs from u_lb within w_choixcol
end type
type st_1 from statictext within w_choixcol
end type
type cb_ok from commandbutton within w_choixcol
end type
type cb_close from commandbutton within w_choixcol
end type
end forward

global type w_choixcol from w_response
integer width = 1285
integer height = 1880
boolean titlebar = false
boolean controlmenu = false
boolean center = true
boolean ib_isupdateable = false
lb_champs lb_champs
st_1 st_1
cb_ok cb_ok
cb_close cb_close
end type
global w_choixcol w_choixcol

type variables
private long il_rapport = 0
private long il_index
end variables

on w_choixcol.create
int iCurrent
call super::create
this.lb_champs=create lb_champs
this.st_1=create st_1
this.cb_ok=create cb_ok
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_champs
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.cb_close
end on

on w_choixcol.destroy
call super::destroy
destroy(this.lb_champs)
destroy(this.st_1)
destroy(this.cb_ok)
destroy(this.cb_close)
end on

type lb_champs from u_lb within w_choixcol
integer x = 14
integer y = 104
integer width = 1234
integer height = 1632
integer taborder = 10
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event constructor;call super::constructor;string ls_colname

il_rapport = message.doubleparm

DECLARE listchamp CURSOR FOR
	SELECT column_name FROM t_rappchamps WHERE id_rapport = :il_rapport;
	
OPEN listchamp;

FETCH listchamp INTO :ls_colname;

DO WHILE SQLCA.SQLCode = 0
	
	addItem(ls_colname)
	
	FETCH listchamp INTO :ls_colname;
	
LOOP

CLOSE listchamp;
end event

event selectionchanged;call super::selectionchanged;il_index = index
end event

type st_1 from statictext within w_choixcol
integer x = 18
integer y = 16
integer width = 713
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Veuiller choisir un champs"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_choixcol
integer x = 635
integer y = 1748
integer width = 622
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ok"
end type

event clicked;if il_index <> 0 then
	w_genrapp.uf_addNewCol(lb_champs.text(il_index))
end if
close(parent)
end event

type cb_close from commandbutton within w_choixcol
integer x = 9
integer y = 1748
integer width = 622
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
end type

event clicked;close(parent)
end event

