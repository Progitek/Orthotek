$PBExportHeader$w_familleaddmembre.srw
forward
global type w_familleaddmembre from window
end type
type st_1 from statictext within w_familleaddmembre
end type
type dw_familleaddmembre from u_dw within w_familleaddmembre
end type
type cb_2 from commandbutton within w_familleaddmembre
end type
type cb_1 from commandbutton within w_familleaddmembre
end type
end forward

global type w_familleaddmembre from window
integer width = 1769
integer height = 1680
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dw_familleaddmembre dw_familleaddmembre
cb_2 cb_2
cb_1 cb_1
end type
global w_familleaddmembre w_familleaddmembre

type variables
private long il_idpat, il_idfam
end variables

on w_familleaddmembre.create
this.st_1=create st_1
this.dw_familleaddmembre=create dw_familleaddmembre
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.st_1,&
this.dw_familleaddmembre,&
this.cb_2,&
this.cb_1}
end on

on w_familleaddmembre.destroy
destroy(this.st_1)
destroy(this.dw_familleaddmembre)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;il_idfam = message.doubleparm
if il_idfam = -1 then
	select max(id_famille) into :il_idfam from patient;
	il_idfam++
end if
end event

type st_1 from statictext within w_familleaddmembre
integer x = 23
integer width = 1705
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Liste des patients n~'étant pas dans une famille"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Patient list'
end if
end event

type dw_familleaddmembre from u_dw within w_familleaddmembre
integer x = 23
integer y = 92
integer width = 1705
integer height = 1432
integer taborder = 10
string title = "familleaddmembre"
string dataobject = "d_familleaddmembre"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
Retrieve(v_no_ortho)
end event

type cb_2 from commandbutton within w_familleaddmembre
integer x = 1038
integer y = 1536
integer width = 690
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type cb_1 from commandbutton within w_familleaddmembre
integer x = 23
integer y = 1540
integer width = 690
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Appliquer"
boolean default = true
end type

event clicked;il_idpat = dw_familleaddmembre.getitemnumber(dw_familleaddmembre.getrow(),'patient_id')
update patient set id_famille = :il_idfam where patient_id = :il_idpat;
if error_type(-1) = 1 then
	commit using sqlca;
else
	rollback using sqlca;
	error_type(50)
end if
close(parent)

end event

event constructor;if v_langue = 'an' then
	this.text = 'Apply'
end if
end event

