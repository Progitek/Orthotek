$PBExportHeader$w_entrer_ortho.srw
forward
global type w_entrer_ortho from w_child
end type
type cb_suivant from commandbutton within w_entrer_ortho
end type
type cb_precedant from commandbutton within w_entrer_ortho
end type
type cb_update from commandbutton within w_entrer_ortho
end type
type dw_entrer_ortho from u_dw within w_entrer_ortho
end type
type cb_insert from commandbutton within w_entrer_ortho
end type
type cb_close from commandbutton within w_entrer_ortho
end type
end forward

global type w_entrer_ortho from w_child
integer x = 832
integer y = 360
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 8388608
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_suivant cb_suivant
cb_precedant cb_precedant
cb_update cb_update
dw_entrer_ortho dw_entrer_ortho
cb_insert cb_insert
cb_close cb_close
end type
global w_entrer_ortho w_entrer_ortho

type variables
int changement = 0
end variables

forward prototypes
public subroutine maj ()
end prototypes

public subroutine maj ();long ortho
string ls_spec

if dw_entrer_ortho.update() = 1 Then
	commit using sqlca;
else
	rollback using sqlca;
	changement = 0
end if


end subroutine

on w_entrer_ortho.create
int iCurrent
call super::create
this.cb_suivant=create cb_suivant
this.cb_precedant=create cb_precedant
this.cb_update=create cb_update
this.dw_entrer_ortho=create dw_entrer_ortho
this.cb_insert=create cb_insert
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_suivant
this.Control[iCurrent+2]=this.cb_precedant
this.Control[iCurrent+3]=this.cb_update
this.Control[iCurrent+4]=this.dw_entrer_ortho
this.Control[iCurrent+5]=this.cb_insert
this.Control[iCurrent+6]=this.cb_close
end on

on w_entrer_ortho.destroy
call super::destroy
destroy(this.cb_suivant)
destroy(this.cb_precedant)
destroy(this.cb_update)
destroy(this.dw_entrer_ortho)
destroy(this.cb_insert)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

dw_entrer_ortho.settransobject(sqlca)
dw_entrer_ortho.retrieve()
end event

type cb_suivant from commandbutton within w_entrer_ortho
integer x = 1422
integer y = 1924
integer width = 631
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "suivant"
end type

event clicked;dw_entrer_ortho.scrollnextrow()

end event

event constructor;if v_langue = 'an' then
	this.text = 'Next'
end if
end event

type cb_precedant from commandbutton within w_entrer_ortho
integer x = 791
integer y = 1924
integer width = 631
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Précédant"
end type

event clicked;dw_entrer_ortho.scrollpriorrow()

end event

event constructor;if v_langue = 'an' then
	this.text = 'Previous'
end if
end event

type cb_update from commandbutton within w_entrer_ortho
integer x = 2053
integer y = 1924
integer width = 782
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;maj()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type dw_entrer_ortho from u_dw within w_entrer_ortho
integer width = 3621
integer height = 1916
integer taborder = 10
string dataobject = "dw_entrer_ortho"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;changement = 1
end event

event editchanged;changement = 1
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	dw_entrer_ortho.object.nom_complet_t.text = 'Complete name'
	dw_entrer_ortho.object.adresse_t.text = 'Address'
	dw_entrer_ortho.object.ville_province_code_postale_t.text = 'City Province Area code'
	dw_entrer_ortho.object.telephone_t.text = 'Phone'
	dw_entrer_ortho.object.t_5.text = 'City'
	dw_entrer_ortho.object.t_6.text = 'Province'
	dw_entrer_ortho.object.t_4.text = "Postal Code"
	dw_entrer_ortho.object.t_2.text = "Bank name"
	dw_entrer_ortho.object.t_3.text = "Bank account"
	dw_entrer_ortho.object.t_7.text = "Association number"
	dw_entrer_ortho.object.t_8.text = "Title"
	dw_entrer_ortho.object.t_1.text = "Warning"
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

type cb_insert from commandbutton within w_entrer_ortho
integer x = 5
integer y = 1924
integer width = 786
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajouter"
end type

event clicked;long	new_row

new_row = dw_entrer_ortho.insertrow(0)

dw_entrer_ortho.scrolltorow(new_row)
dw_entrer_ortho.setcolumn(0)
dw_entrer_ortho.setfocus()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add'
end if
end event

type cb_close from commandbutton within w_entrer_ortho
integer x = 2834
integer y = 1924
integer width = 791
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if changement=1 then
	if error_type(200) = 1 then	
		maj()
	end if
end if
Close (parent)

end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

