$PBExportHeader$u_cst_boite_receptionbk.sru
forward
global type u_cst_boite_receptionbk from u_cst_tabpage
end type
type shl_refresh from u_sth within u_cst_boite_receptionbk
end type
type shl_print from u_sth within u_cst_boite_receptionbk
end type
type shl_repondre from u_sth within u_cst_boite_receptionbk
end type
type shl_recuperer from u_sth within u_cst_boite_receptionbk
end type
type shl_supprimer from u_sth within u_cst_boite_receptionbk
end type
type shl_ecrire from u_sth within u_cst_boite_receptionbk
end type
type dw_treeview_boite from u_dw within u_cst_boite_receptionbk
end type
type uo_shortcut from u_cst_shortcutbar within u_cst_boite_receptionbk
end type
type uo_header from u_cst_xpheader within u_cst_boite_receptionbk
end type
type dw_apercu_message from u_dw within u_cst_boite_receptionbk
end type
type ole_browser from olecustomcontrol within u_cst_boite_receptionbk
end type
type dw_boite_reception_envoye from u_dw within u_cst_boite_receptionbk
end type
type dw_boite_reception_corbeille from u_dw within u_cst_boite_receptionbk
end type
type dw_boite_reception from u_dw within u_cst_boite_receptionbk
end type
end forward

global type u_cst_boite_receptionbk from u_cst_tabpage
string tag = "resize=ab"
integer width = 4599
integer height = 2512
shl_refresh shl_refresh
shl_print shl_print
shl_repondre shl_repondre
shl_recuperer shl_recuperer
shl_supprimer shl_supprimer
shl_ecrire shl_ecrire
dw_treeview_boite dw_treeview_boite
uo_shortcut uo_shortcut
uo_header uo_header
dw_apercu_message dw_apercu_message
ole_browser ole_browser
dw_boite_reception_envoye dw_boite_reception_envoye
dw_boite_reception_corbeille dw_boite_reception_corbeille
dw_boite_reception dw_boite_reception
end type
global u_cst_boite_receptionbk u_cst_boite_receptionbk

type variables
string	is_nom, is_poste
end variables

forward prototypes
public subroutine of_settheme (string as_color)
public subroutine of_afficherdw (integer al_nombre)
public function integer of_getparentwindow (ref window aw_parent)
end prototypes

public subroutine of_settheme (string as_color);// set the toolbar theme
uo_shortcut.of_SetTheme(as_color)
uo_header.of_SetTheme(as_color)

end subroutine

public subroutine of_afficherdw (integer al_nombre);//long	ll_rowcount
//
//choose case al_nombre
//	case 1
//		dw_boite_reception.visible = TRUE
//		dw_boite_reception_corbeille.visible = FALSE
//		dw_boite_reception_envoye.visible = FALSE
//		shl_recuperer.visible = false
//		ll_rowcount = dw_boite_reception.retrieve(is_nom,is_poste)
//		IF ll_rowcount > 0 THEN
//			dw_boite_reception.SetRow(1)
//			dw_boite_reception.ScrollToRow(1)
//			dw_boite_reception.event RowFocusChanged(1)
//		ELSE
//			dw_boite_reception.event RowFocusChanged(0)
//		END IF
//		dw_boite_reception.SetFocus()
//
//	case 2
//		dw_boite_reception.visible = FALSE
//		dw_boite_reception_corbeille.visible = FALSE
//		shl_recuperer.visible = false
//		dw_boite_reception_envoye.visible = TRUE
//		ll_rowcount = dw_boite_reception_envoye.retrieve(is_nom,is_poste)
//		IF ll_rowcount > 0 THEN
//			dw_boite_reception_envoye.SetRow(1)
//			dw_boite_reception_envoye.ScrollToRow(1)
//			dw_boite_reception_envoye.event RowFocusChanged(1)
//		ELSE
//			dw_boite_reception_envoye.event RowFocusChanged(0)
//		END IF
//		dw_boite_reception_envoye.SetFocus()
//		
//	case 3
//		dw_boite_reception.visible = FALSE
//		dw_boite_reception_corbeille.visible = TRUE
//		dw_boite_reception_envoye.visible = FALSE
//		shl_recuperer.visible = TRUE
//		ll_rowcount = dw_boite_reception_corbeille.retrieve(is_nom,is_poste)
//		IF ll_rowcount > 0 THEN
//			dw_boite_reception_corbeille.SetRow(1)
//			dw_boite_reception_corbeille.ScrollToRow(1)
//			dw_boite_reception_corbeille.event RowFocusChanged(1)
//		ELSE
//			dw_boite_reception_corbeille.event RowFocusChanged(0)
//		END IF
//		dw_boite_reception_corbeille.SetFocus()
//		
//END CHOOSE

long	ll_rowcount, ll_row_avant_ret, ll_row_mes = 0, ll_message = 0, ll_DefilVer
u_dw ldw_refdw
window lw_parent

dw_boite_reception.visible = FALSE
dw_boite_reception_corbeille.visible = FALSE
dw_boite_reception_envoye.visible = FALSE
shl_recuperer.visible = false

choose case al_nombre
	case 1
		ldw_refdw = dw_boite_reception
	case 2
		ldw_refdw = dw_boite_reception_envoye
	case 3
		ldw_refdw = dw_boite_reception_corbeille
		shl_recuperer.visible = TRUE
END CHOOSE

ldw_refdw.visible = TRUE
ll_row_avant_ret = ldw_refdw.getRow()
ll_DefilVer = long(ldw_refdw.object.datawindow.VerticalScrollPosition)
if ll_row_avant_ret > 0 then ll_message = ldw_refdw.object.id_message[ll_row_avant_ret]
ldw_refdw.setRedraw(false)
dw_apercu_message.setRedraw(false)
ll_rowcount = ldw_refdw.retrieve(is_nom,is_poste)
IF ll_rowcount > 0 THEN
	ll_row_mes = ldw_refdw.find("id_message = " + string(ll_message), 1, ll_rowcount)
	if ll_row_mes > 0 then ldw_refdw.scrollToRow(ll_row_mes)
	
	IF ll_row_avant_ret = 1 and ll_row_mes = 1 THEN ldw_refdw.event RowFocusChanged(1)
ELSE
	ldw_refdw.event RowFocusChanged(0)
END IF
ldw_refdw.object.datawindow.VerticalScrollPosition = ll_DefilVer
dw_apercu_message.setRedraw(true)
ldw_refdw.setRedraw(true)

if of_getParentWindow(lw_parent) = 1 then
	if gnv_app.of_getframe().getActiveSheet() = lw_parent then ldw_refdw.SetFocus()
end if



end subroutine

public function integer of_getparentwindow (ref window aw_parent);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetParentWindow
//
//	Access:  		public
//
//	Arguments:
//	aw_parent		The Parent window for this object (passed by reference).
//						If a parent window is not found, variable returns
//						with NULL.
//
//	Returns:  		Integer
//						1 if it succeeds and -1 if an error occurs.
//
//	Description:	Calculates the parent window of a window object.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2005, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the GNU Lesser General
 * Public License Version 2.1, February 1999
 *
 * http://www.gnu.org/copyleft/lesser.html
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see http://pfc.codexchange.sybase.com
*/
//
//////////////////////////////////////////////////////////////////////////////

powerobject	lpo_parent

//Loop getting the parent of the object until it is of type window!
lpo_parent = this.GetParent()
do while IsValid (lpo_parent)
	If lpo_parent.TypeOf() = window! Then Exit
	lpo_parent = lpo_parent.GetParent()
loop

if not IsValid (lpo_parent) then
	setnull(aw_parent)	
	return -1
end If

aw_parent = lpo_parent
return 1

end function

on u_cst_boite_receptionbk.create
int iCurrent
call super::create
this.shl_refresh=create shl_refresh
this.shl_print=create shl_print
this.shl_repondre=create shl_repondre
this.shl_recuperer=create shl_recuperer
this.shl_supprimer=create shl_supprimer
this.shl_ecrire=create shl_ecrire
this.dw_treeview_boite=create dw_treeview_boite
this.uo_shortcut=create uo_shortcut
this.uo_header=create uo_header
this.dw_apercu_message=create dw_apercu_message
this.ole_browser=create ole_browser
this.dw_boite_reception_envoye=create dw_boite_reception_envoye
this.dw_boite_reception_corbeille=create dw_boite_reception_corbeille
this.dw_boite_reception=create dw_boite_reception
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.shl_refresh
this.Control[iCurrent+2]=this.shl_print
this.Control[iCurrent+3]=this.shl_repondre
this.Control[iCurrent+4]=this.shl_recuperer
this.Control[iCurrent+5]=this.shl_supprimer
this.Control[iCurrent+6]=this.shl_ecrire
this.Control[iCurrent+7]=this.dw_treeview_boite
this.Control[iCurrent+8]=this.uo_shortcut
this.Control[iCurrent+9]=this.uo_header
this.Control[iCurrent+10]=this.dw_apercu_message
this.Control[iCurrent+11]=this.ole_browser
this.Control[iCurrent+12]=this.dw_boite_reception_envoye
this.Control[iCurrent+13]=this.dw_boite_reception_corbeille
this.Control[iCurrent+14]=this.dw_boite_reception
end on

on u_cst_boite_receptionbk.destroy
call super::destroy
destroy(this.shl_refresh)
destroy(this.shl_print)
destroy(this.shl_repondre)
destroy(this.shl_recuperer)
destroy(this.shl_supprimer)
destroy(this.shl_ecrire)
destroy(this.dw_treeview_boite)
destroy(this.uo_shortcut)
destroy(this.uo_header)
destroy(this.dw_apercu_message)
destroy(this.ole_browser)
destroy(this.dw_boite_reception_envoye)
destroy(this.dw_boite_reception_corbeille)
destroy(this.dw_boite_reception)
end on

event resize;call super::resize;long	ll_oldwidth, ll_oldheight

ll_oldheight = uo_shortcut.Height
uo_shortcut.Height = height - uo_shortcut.Y - 10
uo_header.Width = Width - uo_header.X - 10

ll_oldwidth = dw_boite_reception.width
dw_boite_reception.width = uo_header.Width - 10
dw_boite_reception_envoye.width = uo_header.Width - 10
dw_boite_reception_corbeille.width = uo_header.Width - 10
dw_apercu_message.width = uo_header.Width - 10
dw_apercu_message.height = dw_apercu_message.height + (uo_shortcut.Height - ll_oldheight)
ole_browser.width = uo_header.Width - 10
ole_browser.height = ole_browser.height + (uo_shortcut.Height - ll_oldheight)

shl_supprimer.x = shl_supprimer.x + (dw_boite_reception.width - ll_oldwidth)
shl_recuperer.x = dw_boite_reception.x + ((dw_boite_reception.width - shl_recuperer.width) / 2)
end event

event ue_postconstructor;call super::ue_postconstructor;long ll_row

if gnv_app.of_getlangue() = 'an' then
	shl_ecrire.text = "Write a new message"
	shl_repondre.text = "Answer"
	shl_refresh.text = "Refresh"
	shl_print.text = "Print"
	shl_recuperer.text = "Retrieve this message"
	shl_supprimer.text = "Delete this message"
	uo_shortcut.of_AddItem(dw_treeview_boite, "Inbox", 'C:\ii4net\orthotek\images\mail.ico')
	uo_shortcut.of_AddItem(dw_treeview_boite, "Sent items", 'c:\ii4net\orthotek\images\sent.ico')
	uo_shortcut.of_AddItem(dw_treeview_boite, "Deleted items", '')
	//uo_shortcut.of_SelectItem("Inbox")
	dw_treeview_boite.insertrow(1)
	dw_treeview_boite.setItem(1,"description","Inbox")
	dw_treeview_boite.setItem(1,"niveau",1)
	dw_treeview_boite.setItem(1,"ordre",1)
	dw_treeview_boite.insertrow(2)
	dw_treeview_boite.setItem(2,"description","Sent items")
	dw_treeview_boite.setItem(2,"niveau",1)
	dw_treeview_boite.setItem(2,"ordre",2)
	dw_treeview_boite.insertrow(3)
	dw_treeview_boite.setItem(3,"description","Deleted items")
	dw_treeview_boite.setItem(3,"niveau",1)
	dw_treeview_boite.setItem(3,"ordre",3)
else
	//Outlook Shortcut Bar
	uo_shortcut.of_AddItem(dw_treeview_boite, "Boîte de réception", 'C:\ii4net\orthotek\images\mail.ico')
	uo_shortcut.of_AddItem(dw_treeview_boite, "Éléments envoyés", 'c:\ii4net\orthotek\images\sent.ico')
	uo_shortcut.of_AddItem(dw_treeview_boite, "Corbeille", '')
   uo_shortcut.of_SelectItem("Boîte de réception")
	ll_row = dw_treeview_boite.insertrow(1)
	dw_treeview_boite.setItem(1,"description","Boîte de réception")
	dw_treeview_boite.setItem(1,"niveau",1)
	dw_treeview_boite.setItem(1,"ordre",1)
	dw_treeview_boite.insertrow(2)
	dw_treeview_boite.setItem(2,"description","Éléments envoyés")
	dw_treeview_boite.setItem(2,"niveau",1)
	dw_treeview_boite.setItem(2,"ordre",2)
	dw_treeview_boite.insertrow(3)
	dw_treeview_boite.setItem(3,"description","Corbeille")
	dw_treeview_boite.setItem(3,"niveau",1)
	dw_treeview_boite.setItem(3,"ordre",3)
end if



//uo_shortcut.of_AddItem(dw_2, "Calendrier", 'calendar.ico')
//uo_shortcut.of_AddItem(dw_3, "Contacts", 'contact.ico')
//uo_shortcut.of_AddItem(dw_4, "Tâches", 'task.ico')
//uo_shortcut.of_AddItem(dw_5, "Notes", 'note.ico')
//uo_shortcut.of_AddItem(dw_6, "Liste de répertoires", 'folder.ico')
//uo_shortcut.of_AddItem(dw_7, "Raccourcis", 'shortcut.ico')

//uo_shortcut.of_SelectItem("Boîte de réception")
//uo_shortcut.of_HideItem("Notes")
//uo_shortcut.of_HideItem("Liste de répertoires")
//uo_shortcut.of_HideItem("Raccourcis")

//Custom Color
uo_header.of_SetTextColor(RGB(255,255,255),uo_header.LEFT)
uo_header.of_SetTextColor(RGB(255,255,255),uo_header.RIGHT)

of_setTheme('BLUE')

of_afficherdw(1)
end event

event constructor;call super::constructor;//string	ls_nom, ls_prenom

//Récupérer le nom de la personne loggué
is_nom = gnv_app.inv_messagerie.of_getnomuser()
is_poste = gnv_app.of_obtenir_nom_ordinateur()

//Faire la MAJ statut_affiche pour l'utilisateur en cours
UPDATE 	t_message
SET		statut_affiche = 'o'
WHERE 	(t_message.message_a like :is_nom or t_message.message_a = :is_poste) AND t_message.statut <> 'd' ;
COMMIT USING SQLCA;

end event

type shl_refresh from u_sth within u_cst_boite_receptionbk
integer x = 2016
integer y = 1240
integer width = 238
integer height = 72
integer textsize = -8
string text = "Rafraîchir"
end type

event clicked;call super::clicked;dw_boite_reception_corbeille.retrieve(is_nom, is_poste)
dw_boite_reception_envoye.retrieve(is_nom, is_poste)
dw_boite_reception.retrieve(is_nom, is_poste)
end event

type shl_print from u_sth within u_cst_boite_receptionbk
integer x = 2254
integer y = 1240
integer width = 197
integer height = 72
integer textsize = -8
string text = "Imprimer"
end type

event clicked;call super::clicked;long ll_messageid

datastore ds_imprimmessage

ll_messageid = gnv_app.inv_entrepotglobal.of_retournedonnee("MessageID",true)

ds_imprimmessage = create datastore
ds_imprimmessage.dataobject = "d_apercu_messageimp"
ds_imprimmessage.setTransObject(SQLCA)
ds_imprimmessage.Retrieve(ll_messageid)
openwithparm(w_print_options,ds_imprimmessage)
end event

type shl_repondre from u_sth within u_cst_boite_receptionbk
integer x = 1774
integer y = 1240
integer width = 247
integer height = 72
integer textsize = -8
string text = "Répondre"
end type

event clicked;call super::clicked;w_envoi_message lw_sheet
long		ll_row
string	ls_a, ls_texte, ls_sujet
window luo_win

luo_win = gnv_app.inv_messagerie.of_getwindow()

//Mettre les valeurs dans l'entrepot
ll_row = dw_apercu_message.GetRow()

IF ll_row = 0 THEN RETURN 

ls_a = dw_apercu_message.object.message_de[ll_row]
ls_texte = dw_apercu_message.object.message_texte[ll_row]
ls_sujet = dw_apercu_message.object.sujet[ll_row]

gnv_app.inv_entrepotglobal.of_ajoutedonnee("Message à",ls_a)
gnv_app.inv_entrepotglobal.of_ajoutedonnee("Message texte",ls_texte)
gnv_app.inv_entrepotglobal.of_ajoutedonnee("Sujet du message",ls_sujet)

opensheet(lw_sheet,luo_win,2,layered!)

end event

type shl_recuperer from u_sth within u_cst_boite_receptionbk
boolean visible = false
integer x = 2469
integer y = 1240
integer width = 544
integer height = 72
integer textsize = -8
string text = "Récupérer ce message"
end type

event clicked;call super::clicked;long	ll_row, ll_cpt

ll_row = dw_boite_reception_corbeille.getrow()

IF ll_row > 0 THEN

	FOR ll_cpt = dw_boite_reception_corbeille.RowCount() TO 1 Step -1
		IF dw_boite_reception_corbeille.IsSelected(ll_cpt) THEN
			dw_boite_reception_corbeille.object.statut[ll_cpt] = 'a'
		END IF
	END FOR
	
	dw_boite_reception_corbeille.update(true,true)
	commit using sqlca;
	
	//rafraichir la dw
	dw_boite_reception_corbeille.Retrieve(is_nom,is_poste)

	IF ll_row > 1 THEN
		ll_row --
		IF dw_boite_reception_corbeille.RowCount() >= ll_row THEN
			dw_boite_reception_corbeille.SetRow(ll_row)
			dw_boite_reception_corbeille.ScrollToRow(ll_row)
		END IF
	END IF			
END IF		

end event

type shl_supprimer from u_sth within u_cst_boite_receptionbk
integer x = 2985
integer y = 1240
integer width = 530
integer height = 72
integer textsize = -8
string text = "Supprimer ce message"
alignment alignment = right!
end type

event clicked;call super::clicked;//Envoyer le message sélectionné dans la corbeille
long	ll_row, ll_idmessage, ll_cpt, ll_rowcount


//Valider quelle dw est visible
IF dw_boite_reception.Visible = TRUE THEN
	ll_row = dw_boite_reception.getrow()
	
	IF ll_row > 0 THEN
		//Faire le tour des rangées sélectionnées
		FOR ll_cpt = dw_boite_reception.RowCount() TO 1 Step -1
			if dw_boite_reception.isSelected(ll_cpt) THEN
				dw_boite_reception.object.statut[ll_cpt] = 'd'
			END IF
		END FOR
		dw_boite_reception.update(true,true)
		commit using sqlca;
		
		//rafraichir la dw
		ll_rowcount = dw_boite_reception.Retrieve(is_nom,is_poste)
		IF ll_rowcount > 0 THEN
			ll_row --
			IF ll_row = 0 THEN ll_row = 1
			IF dw_boite_reception.RowCount() >= ll_row THEN
				dw_boite_reception.SetRow(ll_row)
				dw_boite_reception.ScrollToRow(ll_row)
				dw_boite_reception.SetFocus()
				dw_boite_reception.SelectRow(ll_row, TRUE)
			END IF
		END IF	
		

	END IF
	

	
ELSEIF dw_boite_reception_envoye.visible = true THEN
	
	ll_row = dw_boite_reception_envoye.getrow()
	
	IF ll_row > 0 THEN

		FOR ll_cpt = dw_boite_reception_envoye.RowCount() TO 1 Step -1
			if dw_boite_reception_envoye.isSelected(ll_cpt) THEN
				dw_boite_reception_envoye.object.statut[ll_row] = 'd'
			END IF
		END FOR
		
		dw_boite_reception_envoye.update(true,true)
		commit using sqlca;
		
		//rafraichir la dw
		ll_rowcount =  dw_boite_reception_envoye.Retrieve(is_nom,is_poste)
		IF ll_rowcount > 0 THEN
			ll_row --
			IF ll_row = 0 THEN ll_row = 1
			IF dw_boite_reception_envoye.RowCount() >= ll_row THEN
				dw_boite_reception_envoye.SetRow(ll_row)
				dw_boite_reception_envoye.ScrollToRow(ll_row)
				dw_boite_reception_envoye.SetFocus()
				dw_boite_reception_envoye.SelectRow(ll_row, TRUE)
			END IF
		END IF	
	END IF		
	
ELSEIF dw_boite_reception_corbeille.visible = true THEN

	ll_row = dw_boite_reception_corbeille.getrow()
	
	IF ll_row > 0 THEN

		FOR ll_cpt = dw_boite_reception_corbeille.RowCount() TO 1 Step -1
			if dw_boite_reception_corbeille.isSelected(ll_cpt) THEN
				ll_idmessage = dw_boite_reception_corbeille.object.id_message[ll_cpt]
				//Détruire la rangée
				DELETE FROM t_message where id_message = :ll_idmessage USING SQLCA;
			END IF
		END FOR
		commit using sqlca;
		
		//rafraichir la dw
		ll_rowcount = dw_boite_reception_corbeille.Retrieve(is_nom,is_poste)
		IF ll_rowcount > 0 THEN
			ll_row --
			IF ll_row = 0 THEN ll_row = 1
			IF dw_boite_reception_corbeille.RowCount() >= ll_row THEN
				dw_boite_reception_corbeille.SetRow(ll_row)
				dw_boite_reception_corbeille.ScrollToRow(ll_row)
				dw_boite_reception_corbeille.SetFocus()
				dw_boite_reception_corbeille.SelectRow(ll_row, TRUE)
			END IF
		END IF	
	END IF		
END IF


end event

type shl_ecrire from u_sth within u_cst_boite_receptionbk
integer x = 1138
integer y = 1240
integer width = 626
integer height = 72
integer textsize = -8
string text = "Écrire un nouveau message"
end type

event clicked;call super::clicked;w_envoi_message lw_sheet

window luo_win
luo_win = gnv_app.inv_messagerie.of_getwindow()
opensheet(lw_sheet,luo_win,2,layered!)


end event

type dw_treeview_boite from u_dw within u_cst_boite_receptionbk
integer x = 27
integer y = 900
integer width = 1083
integer height = 1576
integer taborder = 50
string dataobject = "d_treeview_boite"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
end type

event constructor;call super::constructor;SetColumn("description")
end event

event rowfocuschanged;call super::rowfocuschanged;//Faire changer l'affichage dans la partie du bas

IF currentrow > 0 THEN

	CHOOSE CASE currentrow
	
	CASE 1
		if gnv_app.of_getlangue() = 'an' then
			uo_shortcut.event ue_selectionchanged("Inbox", 'C:\ii4net\orthotek\images\mail.ico')
		else
			uo_shortcut.event ue_selectionchanged("Boîte de réception", 'C:\ii4net\orthotek\images\mail.ico')
		end if
	CASE 2
		if gnv_app.of_getlangue() = 'an' then
			uo_shortcut.event ue_selectionchanged("Sent items", 'c:\ii4net\orthotek\images\sent.ico')
		else
			uo_shortcut.event ue_selectionchanged("Éléments envoyés", 'c:\ii4net\orthotek\images\sent.ico')
		end if
	CASE 3
		if gnv_app.of_getlangue() = 'an' then
			uo_shortcut.event ue_selectionchanged("Deleted items", '')
		else
			uo_shortcut.event ue_selectionchanged("Corbeille", '')
		end if
		
	END CHOOSE
	
END IF
end event

type uo_shortcut from u_cst_shortcutbar within u_cst_boite_receptionbk
string tag = "resize=ab"
integer y = 8
integer width = 1129
integer height = 2496
integer taborder = 60
end type

event ue_selectionchanged;call super::ue_selectionchanged;Parent.uo_header.of_SetText(as_text, Parent.uo_header.LEFT)
Parent.uo_header.of_SetImage(as_image, Parent.uo_header.RIGHT)

//dw_apercu.bringtotop = true
//dw_boite_reception.bringtotop = true

CHOOSE CASE as_text
//	CASE 'Calendrier', 'Calendar'
//		Parent.uo_header.of_SetText(String(Today(), 'mmm dd, yyyy'), Parent.uo_header.RIGHT)
	CASE 'Boîte de réception', 'Inbox'
		//Parent.uo_header.of_SetText('(Filter Applied)', Parent.uo_header.RIGHT)
		//Parent.uo_header.of_SetText('Boîte de réception', Parent.uo_header.LEFT)
		//Parent.uo_header.of_SetImage('Custom002!', Parent.uo_header.RIGHT)
		dw_treeview_boite.SetRow(1)
		of_afficherdw(1)
	CASE 'Éléments envoyés', 'Sent items'
		//Parent.uo_header.of_SetText('Éléments envoyés', Parent.uo_header.LEFT)
		//Parent.uo_header.of_SetImage('Custom025!', Parent.uo_header.RIGHT)		
		dw_treeview_boite.SetRow(2)
		of_afficherdw(2)
	CASE 'Corbeille', 'Deleted items'
		//Parent.uo_header.of_SetText('Corbeille', Parent.uo_header.LEFT)
		//Parent.uo_header.of_SetImage('Custom021!', Parent.uo_header.RIGHT)		
		dw_treeview_boite.SetRow(3)
		of_afficherdw(3)

	CASE ELSE
		Parent.uo_header.of_SetText('', Parent.uo_header.RIGHT)
END CHOOSE

dw_treeview_boite.SetColumn("description")
dw_treeview_boite.SetFocus()
end event

on uo_shortcut.destroy
call u_cst_shortcutbar::destroy
end on

type uo_header from u_cst_xpheader within u_cst_boite_receptionbk
integer x = 1129
integer y = 8
integer width = 3433
integer taborder = 70
end type

on uo_header.destroy
call u_cst_xpheader::destroy
end on

type dw_apercu_message from u_dw within u_cst_boite_receptionbk
integer x = 1134
integer y = 1320
integer width = 3438
integer height = 1156
integer taborder = 20
string dataobject = "d_apercu_message"
boolean livescroll = false
boolean ib_isupdateable = false
end type

type ole_browser from olecustomcontrol within u_cst_boite_receptionbk
event statustextchange ( string text )
event progresschange ( long progress,  long progressmax )
event commandstatechange ( long command,  boolean enable )
event downloadbegin ( )
event downloadcomplete ( )
event titlechange ( string text )
event propertychange ( string szproperty )
event beforenavigate2 ( oleobject pdisp,  any url,  any flags,  any targetframename,  any postdata,  any headers,  ref boolean cancel )
event newwindow2 ( ref oleobject ppdisp,  ref boolean cancel )
event navigatecomplete2 ( oleobject pdisp,  any url )
event documentcomplete ( oleobject pdisp,  any url )
event onquit ( )
event onvisible ( boolean ocx_visible )
event ontoolbar ( boolean toolbar )
event onmenubar ( boolean menubar )
event onstatusbar ( boolean statusbar )
event onfullscreen ( boolean fullscreen )
event ontheatermode ( boolean theatermode )
event windowsetresizable ( boolean resizable )
event windowsetleft ( long left )
event windowsettop ( long top )
event windowsetwidth ( long ocx_width )
event windowsetheight ( long ocx_height )
event windowclosing ( boolean ischildwindow,  ref boolean cancel )
event clienttohostwindow ( ref long cx,  ref long cy )
event setsecurelockicon ( long securelockicon )
event filedownload ( boolean activedocument,  ref boolean cancel )
event navigateerror ( oleobject pdisp,  any url,  any frame,  any statuscode,  ref boolean cancel )
event printtemplateinstantiation ( oleobject pdisp )
event printtemplateteardown ( oleobject pdisp )
event updatepagestatus ( oleobject pdisp,  any npage,  any fdone )
event privacyimpactedstatechange ( boolean bimpacted )
event setphishingfilterstatus ( long phishingfilterstatus )
event newprocess ( long lcauseflag,  oleobject pwb2,  ref boolean cancel )
event redirectxdomainblocked ( oleobject pdisp,  any starturl,  any redirecturl,  any frame,  any statuscode )
event beforescriptexecute ( oleobject pdispwindow )
integer x = 1143
integer y = 1328
integer width = 3433
integer height = 1152
integer taborder = 30
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "u_cst_boite_receptionbk.udo"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type dw_boite_reception_envoye from u_dw within u_cst_boite_receptionbk
integer x = 1134
integer y = 120
integer width = 3438
integer height = 1092
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_boite_reception_envoye"
boolean hscrollbar = true
boolean livescroll = false
boolean ib_rmbmenu = false
end type

event constructor;call super::constructor;This.of_SetRowManager(True)
THIS.of_SetRowSelect(TRUE)
inv_rowselect.of_setstyle(2)

This.of_SetSort(True)
inv_sort.of_Setstyle(INV_SORT.SIMPLE)
inv_sort.of_Setcolumndisplaynamestyle(INV_SORT.HEADER)
inv_sort.of_Setcolumnheader(True)

end event

event rowfocuschanged;call super::rowfocuschanged;//Lancer le retrieve de la dw apercu
Long	ll_idmessage, ll_null, ll_email
string ls_body

SetNull(ll_null)

IF currentrow > 0 THEN
	ll_idmessage = THIS.object.id_message[currentrow]
	ll_email = THIS.object.courriel[currentrow]
	if ll_email = 1 then
		dw_apercu_message.visible = false
		ole_browser.visible = true
		select if isnull(failmsg,'') = '' then message_texte else failmsg endif into :ls_body from t_message where id_message = :ll_idmessage;
		gnv_app.inv_filesrv.of_filewrite("c:\ii4net\orthotek\msgprogitek.html", ls_body,false)
		ole_browser.object.navigate("c:\ii4net\orthotek\msgprogitek.html")
	else
		dw_apercu_message.visible = true
		ole_browser.visible = false
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("MessageID", ll_idmessage)
		dw_apercu_message.Retrieve(ll_idmessage)
	end if
ELSE
	dw_apercu_message.visible = true
	ole_browser.visible = false
	dw_apercu_message.Retrieve(ll_null)
END IF

end event

type dw_boite_reception_corbeille from u_dw within u_cst_boite_receptionbk
integer x = 1134
integer y = 120
integer width = 3438
integer height = 1048
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_boite_reception_corbeille"
boolean hscrollbar = true
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
end type

event constructor;call super::constructor;This.of_SetRowManager(True)
THIS.of_SetRowSelect(TRUE)
inv_rowselect.of_setstyle(2)

This.of_SetSort(True)
inv_sort.of_Setstyle(INV_SORT.SIMPLE)
inv_sort.of_Setcolumndisplaynamestyle(INV_SORT.HEADER)
inv_sort.of_Setcolumnheader(True)

end event

event rowfocuschanged;call super::rowfocuschanged;//Lancer le retrieve de la dw apercu
Long	ll_idmessage, ll_null


SetNull(ll_null)

IF currentrow > 0 THEN
	ll_idmessage = THIS.object.id_message[currentrow]
	
	dw_apercu_message.Retrieve(ll_idmessage)
ELSE
	dw_apercu_message.Retrieve(ll_null)
END IF
end event

type dw_boite_reception from u_dw within u_cst_boite_receptionbk
integer x = 1134
integer y = 120
integer width = 3438
integer height = 1096
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_boite_reception"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
end type

event rowfocuschanged;call super::rowfocuschanged;//Lancer le retrieve de la dw apercu
Long	ll_idmessage, ll_null

SetNull(ll_null)

IF currentrow > 0 THEN
	ll_idmessage = THIS.object.id_message[currentrow]
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("MessageID", ll_idmessage)
	dw_apercu_message.Retrieve(ll_idmessage)
ELSE
	dw_apercu_message.Retrieve(ll_null)
END IF
end event

event constructor;call super::constructor;This.of_SetRowManager(True)
THIS.of_SetRowSelect(TRUE)
inv_rowselect.of_setstyle(2)

This.of_SetSort(True)
inv_sort.of_Setstyle(INV_SORT.SIMPLE)
inv_sort.of_Setcolumndisplaynamestyle(INV_SORT.HEADER)
inv_sort.of_Setcolumnheader(True)

end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Cu_cst_boite_receptionbk.bin 
2800000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000e1b2838001cf546000000003000001800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f00000000e1b2838001cf5460e1b2838001cf5460000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000030000009c000000000000000100000002fffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c00004d9e00001dc40000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004c00004d9e00001dc40000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Cu_cst_boite_receptionbk.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
