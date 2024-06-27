$PBExportHeader$w_dosspattransfert.srw
forward
global type w_dosspattransfert from window
end type
type mle_1 from multilineedit within w_dosspattransfert
end type
type dw_ortho from u_dw within w_dosspattransfert
end type
type cb_2 from commandbutton within w_dosspattransfert
end type
type cb_transfert from commandbutton within w_dosspattransfert
end type
end forward

global type w_dosspattransfert from window
integer width = 1408
integer height = 744
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mle_1 mle_1
dw_ortho dw_ortho
cb_2 cb_2
cb_transfert cb_transfert
end type
global w_dosspattransfert w_dosspattransfert

on w_dosspattransfert.create
this.mle_1=create mle_1
this.dw_ortho=create dw_ortho
this.cb_2=create cb_2
this.cb_transfert=create cb_transfert
this.Control[]={this.mle_1,&
this.dw_ortho,&
this.cb_2,&
this.cb_transfert}
end on

on w_dosspattransfert.destroy
destroy(this.mle_1)
destroy(this.dw_ortho)
destroy(this.cb_2)
destroy(this.cb_transfert)
end on

type mle_1 from multilineedit within w_dosspattransfert
integer x = 37
integer width = 1321
integer height = 156
integer taborder = 20
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "Vers quel spécialiste désirez-vous transférer ce patient ?"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

type dw_ortho from u_dw within w_dosspattransfert
integer x = 37
integer y = 160
integer width = 1321
integer height = 388
integer taborder = 10
string title = "none"
string dataobject = "dddw_ortho"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
Retrieve()
SetRowFocusIndicator(FocusRect!)
end event

type cb_2 from commandbutton within w_dosspattransfert
integer x = 791
integer y = 584
integer width = 567
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
end type

event clicked;Close(parent)
end event

type cb_transfert from commandbutton within w_dosspattransfert
integer x = 37
integer y = 584
integer width = 567
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Transférer"
end type

event clicked;long ll_orthoid

ll_orthoid = dw_ortho.getitemnumber(dw_ortho.getrow(),'ortho_id')

// verification si le patient existe déjà
if w_dossier_patients.validernomprenom(ll_orthoid) then
	if isvalid(w_dossier_patients) then
		if error_type(249) = 1 then
			w_dossier_patients.tab_dosspat.tabpage_dosspat.dw_dosspat.event ue_transfert(ll_orthoid)
		end if
	end if
end if

close(parent)
end event

