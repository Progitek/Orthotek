$PBExportHeader$w_liste_des_rv_manqués.srw
forward
global type w_liste_des_rv_manqués from window
end type
type cb_maj from commandbutton within w_liste_des_rv_manqués
end type
type cb_delete from commandbutton within w_liste_des_rv_manqués
end type
type dw_liste_des_rappels from datawindow within w_liste_des_rv_manqués
end type
type cb_fermer from commandbutton within w_liste_des_rv_manqués
end type
end forward

global type w_liste_des_rv_manqués from window
integer width = 3648
integer height = 2044
boolean titlebar = true
string title = "Liste des rendez-vous manqués"
long backcolor = 79741120
event ue_post_open ( )
cb_maj cb_maj
cb_delete cb_delete
dw_liste_des_rappels dw_liste_des_rappels
cb_fermer cb_fermer
end type
global w_liste_des_rv_manqués w_liste_des_rv_manqués

type variables
integer changement=0
end variables

forward prototypes
public subroutine sauvegarde ()
end prototypes

event ue_post_open;dw_liste_des_rappels.setrowfocusindicator(hand!)
dw_liste_des_rappels.Retrieve(v_no_ortho)
dw_liste_des_rappels.SetFocus()
// Ajuste la disponibilite des boutons
if dw_liste_des_rappels.rowcount() = 0 then
	cb_delete.enabled = false
	cb_maj.enabled = false
end if

end event

public subroutine sauvegarde ();if messagebox("Mise-à-jour","Voulez-vous enregistrer les modifications?",Question!,YesNo!) =1 then
	if dw_liste_des_rappels.update() = 1 then	
		commit using SQLCA;
		// Ajuste la disponibilite des boutons
		if dw_liste_des_rappels.rowcount() = 0 then
			cb_delete.enabled = false
			cb_maj.enabled = false
		end if
	else
		rollback using SQLCA;
		messagebox("Information","Aucune modification n'a été enregistrée!",information!)
	end if
end if
changement=0

end subroutine

on w_liste_des_rv_manqués.create
this.cb_maj=create cb_maj
this.cb_delete=create cb_delete
this.dw_liste_des_rappels=create dw_liste_des_rappels
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_maj,&
this.cb_delete,&
this.dw_liste_des_rappels,&
this.cb_fermer}
end on

on w_liste_des_rv_manqués.destroy
destroy(this.cb_maj)
destroy(this.cb_delete)
destroy(this.dw_liste_des_rappels)
destroy(this.cb_fermer)
end on

event open;w_liste_des_rv_manqués.postevent('ue_post_open')
end event

type cb_maj from commandbutton within w_liste_des_rv_manqués
integer x = 5
integer y = 1832
integer width = 1275
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;sauvegarde()

end event

type cb_delete from commandbutton within w_liste_des_rv_manqués
integer x = 1280
integer y = 1832
integer width = 1189
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Canceller"
end type

event clicked;if messagebox("Cancellation","Voulez-vous canceler ce rendez-vous?",Question!,YesNo!) =1 then
	dw_liste_des_rappels.deleterow(dw_liste_des_rappels.getrow())
	changement = 1
end if

end event

type dw_liste_des_rappels from datawindow within w_liste_des_rv_manqués
integer x = 5
integer width = 3616
integer height = 1820
integer taborder = 10
string dataobject = "d_rendez_vous"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;changement = 1
end event

event editchanged;changement = 1
end event

event constructor;dw_liste_des_rappels.SetTransObject(SQLCA)

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

type cb_fermer from commandbutton within w_liste_des_rv_manqués
integer x = 2469
integer y = 1832
integer width = 1152
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if changement=1 then
	sauvegarde()
end if
Close (parent);
end event

