$PBExportHeader$w_choix_destinataire.srw
forward
global type w_choix_destinataire from w_response
end type
type rb_user from radiobutton within w_choix_destinataire
end type
type rb_poste from radiobutton within w_choix_destinataire
end type
type dw_userlist_carnet from u_dw within w_choix_destinataire
end type
type cb_annuler from commandbutton within w_choix_destinataire
end type
type cb_ajouter from commandbutton within w_choix_destinataire
end type
end forward

global type w_choix_destinataire from w_response
integer x = 214
integer y = 221
integer width = 1317
integer height = 1320
string title = "Choix du destinataire"
long backcolor = 15780518
boolean center = true
boolean ib_isupdateable = false
boolean ib_disableclosequery = true
rb_user rb_user
rb_poste rb_poste
dw_userlist_carnet dw_userlist_carnet
cb_annuler cb_annuler
cb_ajouter cb_ajouter
end type
global w_choix_destinataire w_choix_destinataire

on w_choix_destinataire.create
int iCurrent
call super::create
this.rb_user=create rb_user
this.rb_poste=create rb_poste
this.dw_userlist_carnet=create dw_userlist_carnet
this.cb_annuler=create cb_annuler
this.cb_ajouter=create cb_ajouter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_user
this.Control[iCurrent+2]=this.rb_poste
this.Control[iCurrent+3]=this.dw_userlist_carnet
this.Control[iCurrent+4]=this.cb_annuler
this.Control[iCurrent+5]=this.cb_ajouter
end on

on w_choix_destinataire.destroy
call super::destroy
destroy(this.rb_user)
destroy(this.rb_poste)
destroy(this.dw_userlist_carnet)
destroy(this.cb_annuler)
destroy(this.cb_ajouter)
end on

event open;call super::open;dw_userlist_carnet.Retrieve()
dw_userlist_carnet.insertrow(1)
if gnv_app.of_getlangue( ) = 'an' then
	dw_userlist_carnet.setItem(1,'nom','All')
else
	dw_userlist_carnet.setItem(1,'nom','Tous')
end if

end event

type rb_user from radiobutton within w_choix_destinataire
integer x = 59
integer y = 56
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Utilisateur"
boolean checked = true
end type

event clicked;dw_userlist_carnet.dataobject = 'd_userlist_carnet'
dw_userlist_carnet.setTransObject(SQLCA)
dw_userlist_carnet.retrieve()
dw_userlist_carnet.insertrow(1)
if gnv_app.of_getlangue( ) = 'an' then
	dw_userlist_carnet.setItem(1,'nom','All')
else
	dw_userlist_carnet.setItem(1,'nom','Tous')
end if
dw_userlist_carnet.setItem(1,'prenom','')

end event

type rb_poste from radiobutton within w_choix_destinataire
integer x = 480
integer y = 56
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Poste"
end type

event clicked;dw_userlist_carnet.dataobject = 'd_computerlist'
dw_userlist_carnet.setTransObject(SQLCA)
dw_userlist_carnet.retrieve()
dw_userlist_carnet.insertrow(1)
if gnv_app.of_getlangue( ) = 'an' then
	dw_userlist_carnet.setItem(1,'ordinateur','All')
else
	dw_userlist_carnet.setItem(1,'ordinateur','Tous')
end if
end event

type dw_userlist_carnet from u_dw within w_choix_destinataire
integer x = 23
integer y = 156
integer width = 1257
integer height = 928
integer taborder = 10
string dataobject = "d_userlist_carnet"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;This.of_SetRowManager(True)
THIS.of_SetRowSelect(TRUE)
inv_rowselect.of_setstyle(2)
end event

event dragdrop;call super::dragdrop;cb_ajouter.event Clicked()
end event

event doubleclicked;call super::doubleclicked;cb_ajouter.Event Clicked()
end event

type cb_annuler from commandbutton within w_choix_destinataire
integer x = 882
integer y = 1104
integer width = 402
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

event clicked;Close(Parent)
end event

type cb_ajouter from commandbutton within w_choix_destinataire
integer x = 23
integer y = 1104
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
boolean default = true
end type

event clicked;long 		ll_cpt, ll_rendu = 1
string	ls_retour = ""
boolean lb_tous

if rb_user.checked then
	if dw_userlist_carnet.getItemString(dw_userlist_carnet.getRow() ,'nom') = "Tous" or &
		dw_userlist_carnet.getItemString(dw_userlist_carnet.getRow() ,'nom') = "All" then lb_tous = true
else
	if dw_userlist_carnet.getItemString(dw_userlist_carnet.getRow() ,'ordinateur') = "Tous" or &
		dw_userlist_carnet.getItemString(dw_userlist_carnet.getRow() ,'ordinateur') = "All" then lb_tous = true
end if

if lb_tous then
	
	FOR ll_cpt = 2 TO dw_userlist_carnet.RowCount()
		IF ll_rendu = 1 THEN
			ls_retour = dw_userlist_carnet.object.cf_affichage[ll_cpt]
		ELSE
			ls_retour = ls_retour + "; " + dw_userlist_carnet.object.cf_affichage[ll_cpt]
		END IF
		
		ll_rendu++
	
	END FOR
	
else
	//Faire le tour des rangées sélectionnées
	FOR ll_cpt = 1 TO dw_userlist_carnet.RowCount()
		IF dw_userlist_carnet.IsSelected(ll_cpt) THEN
			IF ll_rendu = 1 THEN
				ls_retour = dw_userlist_carnet.object.cf_affichage[ll_cpt]
			ELSE
				ls_retour = ls_retour + "; " + dw_userlist_carnet.object.cf_affichage[ll_cpt]
			END IF
			
			ll_rendu++
		END IF
		
	END FOR
end if

if rb_user.checked then
	gnv_app.inv_entrepotglobal.of_ajoutedonnee( "type_de_messagerie", 'U')
else
	gnv_app.inv_entrepotglobal.of_ajoutedonnee( "type_de_messagerie", 'P')
end if

IF ll_rendu > 1 THEN
	CloseWithReturn(Parent, ls_retour)
ELSE
	error_type(1116)
END IF
end event

