$PBExportHeader$w_hortrans.srw
forward
global type w_hortrans from window
end type
type cb_transfert from commandbutton within w_hortrans
end type
type pb_1 from picturebutton within w_hortrans
end type
type dw_hortrans from u_dw within w_hortrans
end type
end forward

global type w_hortrans from window
integer width = 1335
integer height = 852
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
cb_transfert cb_transfert
pb_1 pb_1
dw_hortrans dw_hortrans
end type
global w_hortrans w_hortrans

on w_hortrans.create
this.cb_transfert=create cb_transfert
this.pb_1=create pb_1
this.dw_hortrans=create dw_hortrans
this.Control[]={this.cb_transfert,&
this.pb_1,&
this.dw_hortrans}
end on

on w_hortrans.destroy
destroy(this.cb_transfert)
destroy(this.pb_1)
destroy(this.dw_hortrans)
end on

type cb_transfert from commandbutton within w_hortrans
integer y = 568
integer width = 1202
integer height = 88
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Transférer"
end type

event clicked;long ll_idhortrans

ll_idhortrans = dw_hortrans.getitemnumber(dw_hortrans.getrow(),'id_hortrans')
closewithreturn(w_hortrans,ll_idhortrans)
end event

type pb_1 from picturebutton within w_hortrans
integer x = 1207
integer y = 568
integer width = 101
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Close!"
alignment htextalign = left!
boolean map3dcolors = true
string powertiptext = "Annuler le transfer"
end type

event clicked;long row,ll_idhortrans

row = dw_hortrans.getrow()
if row > 0 then
	ll_idhortrans = dw_hortrans.getitemnumber(row,'id_hortrans')
	delete from t_hortransrow where id_hortrans = :ll_idhortrans;
	delete from t_hortrans where id_hortrans = :ll_idhortrans;
	dw_hortrans.Retrieve(w_horaire.il_horidspec)
end if
end event

type dw_hortrans from u_dw within w_hortrans
integer width = 1307
integer height = 560
integer taborder = 10
string title = "hortrans"
string dataobject = "d_hortrans"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
Retrieve(gl_idpers)
SetRowFocusIndicator(FocusRect!)
end event

