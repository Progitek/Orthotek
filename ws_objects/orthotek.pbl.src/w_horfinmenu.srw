$PBExportHeader$w_horfinmenu.srw
forward
global type w_horfinmenu from window
end type
type st_1 from statictext within w_horfinmenu
end type
type dw_horfinmenu from u_dw within w_horfinmenu
end type
type cb_cancel from commandbutton within w_horfinmenu
end type
type cb_apply from commandbutton within w_horfinmenu
end type
end forward

global type w_horfinmenu from window
integer width = 1413
integer height = 632
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dw_horfinmenu dw_horfinmenu
cb_cancel cb_cancel
cb_apply cb_apply
end type
global w_horfinmenu w_horfinmenu

type variables
private string is_type
end variables

on w_horfinmenu.create
this.st_1=create st_1
this.dw_horfinmenu=create dw_horfinmenu
this.cb_cancel=create cb_cancel
this.cb_apply=create cb_apply
this.Control[]={this.st_1,&
this.dw_horfinmenu,&
this.cb_cancel,&
this.cb_apply}
end on

on w_horfinmenu.destroy
destroy(this.st_1)
destroy(this.dw_horfinmenu)
destroy(this.cb_cancel)
destroy(this.cb_apply)
end on

event open;is_type = message.stringparm
end event

type st_1 from statictext within w_horfinmenu
integer x = 18
integer width = 686
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Choisir la phase:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Choice of phase:'
end if
end event

type dw_horfinmenu from u_dw within w_horfinmenu
integer x = 18
integer y = 68
integer width = 1326
integer height = 400
integer taborder = 10
string title = "horfinmenu"
string dataobject = "d_horfinmenu"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
Retrieve(w_horaire.il_patid)
end event

event clicked;ScrollToRow(GetClickedRow())
end event

type cb_cancel from commandbutton within w_horfinmenu
integer x = 699
integer y = 476
integer width = 640
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;close(Parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type cb_apply from commandbutton within w_horfinmenu
integer x = 27
integer y = 476
integer width = 658
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
boolean default = true
end type

event clicked;long ll_idtrait, ll_idcont

ll_idtrait = dw_horfinmenu.getitemnumber(dw_horfinmenu.getrow(),'traitement_id')
select patient.id_contact into :ll_idcont 
from patient INNER JOIN traitements ON traitements.patient_id = patient.patient_id
where traitement_id = :ll_idtrait;
choose case is_type
	case 'F'
		w_patient.event ue_facturation(ll_idtrait,ll_idcont)
	case 'P'
		w_patient.event ue_dossfin(w_horaire.il_patid)
		w_patient.event ue_paiement(ll_idtrait,ll_idcont)
	case 'C'
		w_patient.event ue_cpd(ll_idtrait,ll_idcont)
end choose
close(parent)
end event

