$PBExportHeader$w_envoi_message.srw
forward
global type w_envoi_message from w_sheet
end type
type pb_carnet from picturebutton within w_envoi_message
end type
type uo_header from u_cst_xpheader within w_envoi_message
end type
type dw_envoi_message from u_dw within w_envoi_message
end type
type cb_envoyer from commandbutton within w_envoi_message
end type
type cb_annuler from commandbutton within w_envoi_message
end type
end forward

global type w_envoi_message from w_sheet
integer width = 3534
integer height = 1824
string title = "Envoi d~'un nouveau message"
boolean ib_isupdateable = false
pb_carnet pb_carnet
uo_header uo_header
dw_envoi_message dw_envoi_message
cb_envoyer cb_envoyer
cb_annuler cb_annuler
end type
global w_envoi_message w_envoi_message

type variables
string	is_nom = ""
boolean	ib_change
end variables

forward prototypes
public subroutine of_settheme (string as_color)
end prototypes

public subroutine of_settheme (string as_color);uo_header.of_SetTheme(as_color)
end subroutine

on w_envoi_message.create
int iCurrent
call super::create
this.pb_carnet=create pb_carnet
this.uo_header=create uo_header
this.dw_envoi_message=create dw_envoi_message
this.cb_envoyer=create cb_envoyer
this.cb_annuler=create cb_annuler
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_carnet
this.Control[iCurrent+2]=this.uo_header
this.Control[iCurrent+3]=this.dw_envoi_message
this.Control[iCurrent+4]=this.cb_envoyer
this.Control[iCurrent+5]=this.cb_annuler
end on

on w_envoi_message.destroy
call super::destroy
destroy(this.pb_carnet)
destroy(this.uo_header)
destroy(this.dw_envoi_message)
destroy(this.cb_envoyer)
destroy(this.cb_annuler)
end on

event open;//Override: le resize suce
string ls_a, ls_texte, ls_sujet
long ll_row, id_patient, ll_setitem
string ls_prenom, ls_nom
date ldt_birthdate

ls_a = gnv_app.inv_entrepotglobal.of_retournedonnee("Message à", FALSE)
ls_texte = gnv_app.inv_entrepotglobal.of_retournedonnee("Message texte", FALSE)
ls_sujet = gnv_app.inv_entrepotglobal.of_retournedonnee("Sujet du message",FALSE)

IF ls_a <> "" AND isnull(ls_a) = FALSE THEN
	dw_envoi_message.object.message_a[1] = ls_a
	if isnull(ls_sujet) then
		dw_envoi_message.object.sujet[1] = "Re:"
	else
		dw_envoi_message.object.sujet[1] = "Re: " + ls_sujet
	end if
	ls_texte = "~r~n~r~n__________________________________________________________________________________~r~n~r~n" + ls_texte
	dw_envoi_message.object.message_texte[1] = ls_texte
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("Message à","")
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("Message texte","")	
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("Sujet du message","")
	dw_envoi_message.object.typemessagerie[1] = 'U'
	dw_envoi_message.POST SetColumn("message_texte")
	dw_envoi_message.Post SelectText(1,0)
ELSE
	dw_envoi_message.POST SetColumn("message_a")
END IF

dw_envoi_message.object.couleur[1] = 15780518

uo_header.of_SetTextColor(RGB(255,255,255),uo_header.LEFT)
uo_header.of_SetTextColor(RGB(255,255,255),uo_header.RIGHT)

of_setTheme('BLUE')

uo_header.of_SetText("Envoi d'un nouveau message", uo_header.LEFT)
uo_header.of_SetImage('Custom002!', uo_header.RIGHT)

if gnv_app.inv_entrepotglobal.of_retournedonnee("caller") = "cartetx" then
	id_patient = long(gnv_app.inv_entrepotglobal.of_retournedonnee("idpat_cartetx"))
	
	if not isnull(id_patient) then
		select patient_nom, patient_prenom, date_naissance
		into :ls_nom, :ls_prenom, :ldt_birthdate
		from patient where patient_id = :id_patient;
		
		// integer dwcontrol.SetItem ( long row, integer column, any value )

		ll_setitem = dw_envoi_message.setitem(1, "sujet", ls_prenom + " " + ls_nom + " " + string(ldt_birthdate))
	end if
end if

//ll_row = dw_envoi_message.InsertRow(0)
//dw_envoi_message.setItem(ll_row,'couleur',15780518)


is_nom = mid(gnv_app.inv_messagerie.of_getnomuser(),2,len(gnv_app.inv_messagerie.of_getnomuser()) - 2)

end event

event resize;call super::resize;uo_header.Width = Width - uo_header.X - 30
end event

event closequery;call super::closequery;//IF ib_change = TRUE THEN
//	if error_type(280) = 1 then
//		Return 0
//	ELSE 
//		RETURN 1
//	END IF
//ELSE
//	Return 0
//END IF
//

end event

event activate;call super::activate;//THIS.WindowState = Maximized!
end event

type pb_carnet from picturebutton within w_envoi_message
integer x = 101
integer y = 244
integer width = 119
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\dentitek\images\carnet.bmp"
alignment htextalign = left!
end type

event clicked;w_choix_destinataire	lw_resp
string	ls_message, ls_typemessagerie
OpenWithParm(lw_resp, "")

ls_message = Message.StringParm
IF ls_message <> "" AND NOT IsNull(ls_message) THEN
	dw_envoi_message.object.message_a[dw_envoi_message.GetRow()] = ls_message
	ls_typemessagerie = gnv_app.inv_entrepotglobal.of_retournedonnee("type_de_messagerie")
	if isnull(ls_typemessagerie) then ls_typemessagerie = ""
	if ls_typemessagerie <> 'P' then ls_typemessagerie = 'U'
	dw_envoi_message.object.typemessagerie[dw_envoi_message.GetRow()] = ls_typemessagerie
	dw_envoi_message.SetColumn("sujet")
	ib_change = true
END IF
end event

type uo_header from u_cst_xpheader within w_envoi_message
integer y = 16
integer width = 3493
end type

on uo_header.destroy
call u_cst_xpheader::destroy
end on

type dw_envoi_message from u_dw within w_envoi_message
integer x = 5
integer y = 140
integer width = 3483
integer height = 1420
integer taborder = 10
string dataobject = "d_envoi_message"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;call super::itemchanged;ib_change = true
end event

event editchanged;call super::editchanged;ib_change = true
end event

event clicked;call super::clicked;long ll_color
n_cst_color lnv_coulsrv

if dwo.name = 't_chcoul' then
	
		ll_color = THIS.object.couleur[row]
		
		//Faire le choix de couleur
//		ll_color = lnv_coulsrv.of_choixcouleur(ll_color)
		ChooseColor(ll_color)
		if ll_color >= 0 then
			THIS.object.couleur[row] = ll_color
		END IF
end if
end event

type cb_envoyer from commandbutton within w_envoi_message
integer x = 18
integer y = 1584
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Envoyer"
boolean cancel = true
end type

event clicked;long 		ll_row, ll_couleur, i
datetime	ldt_now
string	ls_a, ls_texte, ls_sujet, ls_repertoire, ls_fichier_attache, ls_source, ls_statut, ls_statut_lu, ls_priorite
string ls_typemessagerie, ls_nom, ls_dest[]

//Mettre les valeurs
ll_row = dw_envoi_message.GetRow()
IF ll_row > 0 THEN
	
	dw_envoi_message.AcceptText()
	
	dw_envoi_message.object.message_de[ll_row] = is_nom
	ldt_now = DateTime(Today(),now())
	dw_envoi_message.object.dateenvoye[ll_row] = ldt_now
	
	ls_priorite = dw_envoi_message.object.priorite[ll_row]
	ls_a = dw_envoi_message.object.message_a[ll_row]
	ls_dest = split(ls_a,';')
	ls_texte = dw_envoi_message.object.message_texte[ll_row]
	ls_sujet = dw_envoi_message.object.sujet[ll_row]
	ls_repertoire = dw_envoi_message.object.repertoire[ll_row]
	ls_fichier_attache = dw_envoi_message.object.fichier_attache[ll_row]
	ls_source = dw_envoi_message.object.source[ll_row]
	ls_statut = dw_envoi_message.object.statut[ll_row]
	ls_statut_lu = dw_envoi_message.object.statut_lu[ll_row]
	ls_typemessagerie  = dw_envoi_message.object.typemessagerie[ll_row]
	ll_couleur = dw_envoi_message.object.couleur[ll_row]
	if ls_typemessagerie = 'P' then	
		ls_nom = gnv_app.of_obtenir_nom_ordinateur()
	else
		ls_nom = is_nom
	end if
	
	//Sauvegarder le tout et fermer
	
//	if dw_envoi_message.update() = 1 then
//		commit using SQLCA;
		
	for i = 1 to upperbound(ls_dest)
		
		// envoyer le message
		
		INSERT INTO t_message (
			dateenvoye,   
			priorite,   
			message_de,   
			message_a,   
			message_texte,   
			sujet,   
			repertoire,   
			fichier_attache,   
			source,   
			statut,   
			statut_lu,
			typemessagerie,
			couleur,
			messagecc)
		VALUES (
		:ldt_now,
		:ls_priorite,
		:is_nom,
		trim(:ls_dest[i]),
		:ls_texte,
		:ls_sujet,
		:ls_repertoire,
		:ls_fichier_attache,
		'i',
		:ls_statut,
		:ls_statut_lu,
		:ls_typemessagerie,
		:ll_couleur,
		:ls_a);
		
		//Insérer une copie en envoi
		INSERT INTO t_message (
			dateenvoye,   
			priorite,   
			message_de,   
			message_a,   
			message_texte,   
			sujet,   
			repertoire,   
			fichier_attache,   
			source,   
			statut,   
			statut_lu,
			typemessagerie,
			couleur,
			messagecc)
		VALUES (
		:ldt_now,
		:ls_priorite,
		:is_nom,
		trim(:ls_dest[i]),
		:ls_texte,
		:ls_sujet,
		:ls_repertoire,
		:ls_fichier_attache,
		'e',
		:ls_statut,
		:ls_statut_lu,
		:ls_typemessagerie,
		:ll_couleur,
		:ls_a);
	next
			
else

	ib_change = FALSE

END IF

Close(PARENT)
end event

type cb_annuler from commandbutton within w_envoi_message
integer x = 3049
integer y = 1584
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
end type

event clicked;close(parent)
end event

