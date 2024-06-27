$PBExportHeader$w_choixemail.srw
forward
global type w_choixemail from w_response
end type
type uo_toolbar from u_cst_toolbarstrip within w_choixemail
end type
type st_title from statictext within w_choixemail
end type
type rb_email3 from radiobutton within w_choixemail
end type
type rb_email2 from radiobutton within w_choixemail
end type
type rb_email1 from radiobutton within w_choixemail
end type
type rr_1 from roundrectangle within w_choixemail
end type
type rr_2 from roundrectangle within w_choixemail
end type
end forward

global type w_choixemail from w_response
integer width = 1541
integer height = 908
long backcolor = 15780518
boolean center = true
uo_toolbar uo_toolbar
st_title st_title
rb_email3 rb_email3
rb_email2 rb_email2
rb_email1 rb_email1
rr_1 rr_1
rr_2 rr_2
end type
global w_choixemail w_choixemail

type variables
public long il_patid
end variables

forward prototypes
public subroutine uf_traduction ()
public subroutine of_envoyer ()
end prototypes

public subroutine uf_traduction ();uo_toolbar.of_displayborder(true)
uo_toolbar.of_settheme("classics")
if gnv_app.of_getlangue() = 'an' then
	uo_toolbar.of_additem("Send","Custom002!")
	uo_toolbar.of_additem("Close","exit!")
else	
	uo_toolbar.of_additem("Envoyer","Custom002!")
	uo_toolbar.of_additem("Fermer","exit!")
end if
uo_toolbar.of_displaytext(true)
end subroutine

public subroutine of_envoyer ();str_mail st_mail

if rb_email1.checked then st_mail.as_destinataire =  rb_email1.text
if rb_email2.checked then st_mail.as_destinataire =  rb_email2.text
if rb_email3.checked then st_mail.as_destinataire =  rb_email3.text
gnv_app.inv_entrepotglobal.of_ajoutedonnee("patientpourpiecejointe", il_patid)

openwithparm(w_mail,st_mail)

//mailSession  mSes
//mailReturnCode mRet, mRet2
//mailMessage  mMsg
//mailFileDescription mAttach
//mailRecipient mRecip[]
//long i = 1, ll_patid, ll_pos, j, ll_idcontact
//string ls_recept[], ls_chaine, ls_nom, ls_email, ls_email2, ls_email3, ls_traitement, ls_nomortho, ls_messadultfr, ls_messadulten, ls_messenffr, ls_messenfen, ls_langue
//date ldt_age
//time lt_heure
//n_cst_datetime luo_time
//
//mSes = CREATE mailSession
//
//select	isnull(mailmessrdvadultfr,'Pas de message'),
//			isnull(mailmessrdvadulten,'Pas de message'),
//			isnull(mailmessrdvenffr,'Pas de message'),
//			isnull(mailmessrdvenfen,'Pas de message')
//into	:ls_messadultfr,
//		:ls_messadulten,
//		:ls_messenffr,
//		:ls_messenfen
//from t_options
//where ortho_id = :v_no_ortho;
//
//select isnull(dr_nom_complet,'') into :ls_nomortho from ortho_id where ortho_id = :il_horidspec;
//
//for j = 1 to dw_confemail.rowcount()
//	
//	if dw_confemail.isselected(j) then
//		
//		mRet = mSes.mailLogon(mailNewSession!)
//		IF mRet <> mailReturnSuccess! THEN
//			 MessageBox ("Erreur", 'Il est impossible de se connecter au serveur MAPI')
//			 RETURN
//		END IF
//	
//		mMsg.subject = ls_nomortho // nom du docteur
//	
//		// ON place en ordre les destinataires
//
//		ll_patid = dw_confemail.getItemnumber(j,'t_rdv_patient_id')
//		ls_nom = dw_confemail.getItemString(j,'patnom')
//		ls_email = dw_confemail.getItemString(j,'patient_email')
//		ls_email2 = dw_confemail.getItemString(j,'patient_email2')
//		ls_email3= dw_confemail.getItemString(j,'patient_email3')
//		ldt_age = dw_confemail.getItemdate(j,'patient_date_naissance')
//		ls_langue = dw_confemail.getItemString(j,'patient_langue')
//		// Validation de l'adresse e-mail
//	
//		if isnull(ls_email) then ls_email = ''
//		if match(ls_email,'@') then
//			ll_pos = pos(ls_email,'@')
//			if pos(mid(ls_email,ll_pos),'.') > 0 then
//				select id_contact into :ll_idcontact from patient where patient_id = :ll_patid;
//				if ls_langue = 'A' then
//					if luo_time.of_yearsafter(ldt_age, today()) > 18 then
//						mMsg.notetext = gf_fusion(ls_messadulten,ll_idcontact,0)
//					else
//						mMsg.notetext = gf_fusion(ls_messenfen,ll_idcontact,0)
//					end if
//				else
//					if luo_time.of_yearsafter(ldt_age, today()) > 18 then
//						mMsg.notetext = gf_fusion(ls_messadultfr,ll_idcontact,0)
//					else
//						mMsg.notetext = gf_fusion(ls_messenffr,ll_idcontact,0)
//					end if
//				end if
//				
//				// Vider les recipients
//				mMsg.recipient = mRecip
//				
//				mMsg.recipient[1].name = ls_nom
//				mmsg.recipient[1].address = ls_email
//				mmsg.recipient[1].RecipientType	 = mailTo!
//				if not isnull(ls_email2) and match(ls_email2,'@') and pos(mid(ls_email2,ll_pos),'.') > 0 then
//					mMsg.recipient[2].name = ls_nom
//					mmsg.recipient[2].address = ls_email2
//					mmsg.recipient[2].RecipientType	 = mailTo!
//				end if
//				if not isnull(ls_email3) and match(ls_email3,'@') and pos(mid(ls_email3,ll_pos),'.') > 0 then 
//					mMsg.recipient[3].name = ls_nom
//					mmsg.recipient[3].address = ls_email3
//					mmsg.recipient[3].RecipientType	 = mailTo!
//				end if
//				
//
//			end if
//		end if		
//
//		mRet = mSes.mailSend(mMsg)
//
//		IF mRet <> mailReturnSuccess! THEN
//			choose case mret
//				case mailReturnFailure!
//					 MessageBox ("mailReturnFailure",'')
//				case mailReturnInsufficientMemory!
//					MessageBox ("mailReturnInsufficientMemory",'')
//				case mailReturnUserAbort!
//					MessageBox ("mailReturnUserAbort", '')
//				case mailReturnDiskFull!
//					MessageBox ("mailReturnDiskFull", '')
//				case mailReturnTooManySessions!
//					MessageBox ("mailReturnTooManySessions", '')
//				case mailReturnTooManyFiles!
//					MessageBox ("mailReturnTooManyFiles!", '')
//				case mailReturnTooManyRecipients!
//					MessageBox ("mailReturnTooManyRecipients", '')
//				case mailReturnUnknownRecipient!
//					MessageBox ("mailReturnUnknownRecipient", '')
//				case mailReturnAttachmentNotFound!
//					MessageBox ("mailReturnAttachmentNotFound",'')
//				case else
//					MessageBox ("Mail", '')
//			end choose
//		END IF
//	
//		mSes.mailLogoff()
//		
//	end if
//	
//next
//
//DESTROY mSes
//
end subroutine

on w_choixemail.create
int iCurrent
call super::create
this.uo_toolbar=create uo_toolbar
this.st_title=create st_title
this.rb_email3=create rb_email3
this.rb_email2=create rb_email2
this.rb_email1=create rb_email1
this.rr_1=create rr_1
this.rr_2=create rr_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_toolbar
this.Control[iCurrent+2]=this.st_title
this.Control[iCurrent+3]=this.rb_email3
this.Control[iCurrent+4]=this.rb_email2
this.Control[iCurrent+5]=this.rb_email1
this.Control[iCurrent+6]=this.rr_1
this.Control[iCurrent+7]=this.rr_2
end on

on w_choixemail.destroy
call super::destroy
destroy(this.uo_toolbar)
destroy(this.st_title)
destroy(this.rb_email3)
destroy(this.rb_email2)
destroy(this.rb_email1)
destroy(this.rr_1)
destroy(this.rr_2)
end on

event open;call super::open;string ls_email, ls_email2, ls_email3

il_patid = long(gnv_app.inv_entrepotglobal.of_retournedonnee("patientchoixemail"))

// Ecrire les courriels 

select isnull(email,''), isnull(email2,''), isnull(email3,'') 
into :ls_email, :ls_email2,:ls_email3 
from patient where patient_id = :il_patid;

if ls_email = "" then rb_email1.enabled = false
rb_email1.text = ls_email
if ls_email2 = "" then rb_email2.enabled = false
rb_email2.text = ls_email2
if ls_email3 = "" then rb_email3.enabled = false
rb_email3.text = ls_email3

end event

type uo_toolbar from u_cst_toolbarstrip within w_choixemail
integer x = 23
integer y = 696
integer width = 1486
integer taborder = 10
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;CHOOSE CASE as_button
	CASE "Send","Envoyer"
		of_envoyer()
	CASE "Fermer","Close"
		close(parent)
END CHOOSE
end event

type st_title from statictext within w_choixemail
integer x = 46
integer y = 32
integer width = 1445
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Liste des courriels disponibles"
boolean focusrectangle = false
end type

type rb_email3 from radiobutton within w_choixemail
integer x = 114
integer y = 460
integer width = 1065
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12639424
string text = "Courrier #3"
end type

type rb_email2 from radiobutton within w_choixemail
integer x = 114
integer y = 352
integer width = 1065
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12639424
string text = "Courrier #2"
end type

type rb_email1 from radiobutton within w_choixemail
integer x = 114
integer y = 244
integer width = 1065
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12639424
string text = "Courrier #1"
boolean checked = true
end type

type rr_1 from roundrectangle within w_choixemail
integer linethickness = 4
long fillcolor = 15793151
integer x = 23
integer y = 16
integer width = 1486
integer height = 104
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_choixemail
integer linethickness = 4
long fillcolor = 12639424
integer x = 23
integer y = 144
integer width = 1486
integer height = 516
integer cornerheight = 40
integer cornerwidth = 46
end type

