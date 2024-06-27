﻿$PBExportHeader$pro_mail.srw
forward
global type pro_mail from pfc_w_response
end type
type ddlb_dest from pfc_u_ddlb within pro_mail
end type
type sle_attachment from pfc_u_sle within pro_mail
end type
type pb_1 from pfc_u_pb within pro_mail
end type
type mle_message from pfc_u_mle within pro_mail
end type
type sle_subject from pfc_u_sle within pro_mail
end type
type st_subject from pfc_u_st within pro_mail
end type
type st_dest from pfc_u_st within pro_mail
end type
type cb_3 from pfc_u_cb within pro_mail
end type
type cb_2 from pfc_u_cb within pro_mail
end type
type cb_1 from pfc_u_cb within pro_mail
end type
end forward

global type pro_mail from pfc_w_response
integer x = 214
integer y = 221
integer width = 2789
integer height = 1816
string title = "Contacter le support technique"
boolean center = true
event type integer ue_sendmail ( )
ddlb_dest ddlb_dest
sle_attachment sle_attachment
pb_1 pb_1
mle_message mle_message
sle_subject sle_subject
st_subject st_subject
st_dest st_dest
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global pro_mail pro_mail

type variables
private long il_idcont[]
private long il_indcont
private boolean change = false
end variables

event type integer ue_sendmail();mailSession  mSes
mailReturnCode mRet
mailMessage  mMsg
mailFileDescription mAttach
long i = 1
string ls_recept[], ls_chaine

mSes = CREATE mailSession

mRet = mSes.mailLogon(mailNewSession!)
IF mRet <> mailReturnSuccess! THEN
	 MessageBox ("Erreur", 'Il est impossible de se connecter au serveur MAPI')
	 RETURN -1
END IF

mattach.filetype = mailAttach!
mattach.Filename = sle_attachment.text
mattach.Pathname = sle_attachment.text
mMsg.AttachmentFile[1] = mAttach
mMsg.subject = sle_subject.text
mMsg.notetext = mle_message.text

// ON place en ordre les destinataires

//if il_indcont <> 0 then
//
//	select adresse into :ls_chaine from t_contactmail where id_contact = :il_idcont[il_indcont];

ls_chaine = ddlb_dest.text
ls_recept = split(ls_chaine,';')
	
for i = 1 to upperbound(ls_recept)
	mMsg.recipient[i].name = ls_recept[i]
	mmsg.recipient[i].address = ls_recept[i]
next
//	
//else
	
//	mMsg.recipient[1].name = ddlb_dest.text
//	mmsg.recipient[1].address = ddlb_dest.text
	
//end if
// On envoie le courrier

IF mRet <> mailReturnSuccess! THEN
	RETURN -1
END IF

mRet = mSes.mailSend(mMsg)

IF mRet <> mailReturnSuccess! THEN
	choose case mret
		case mailReturnFailure!
				  MessageBox ("mailReturnFailure",'')
		case mailReturnInsufficientMemory!
				  MessageBox ("mailReturnInsufficientMemory",'')
		case mailReturnUserAbort!
				  MessageBox ("mailReturnUserAbort", '')
		case mailReturnDiskFull!
				  MessageBox ("mailReturnDiskFull", '')
		case mailReturnTooManySessions!
				  MessageBox ("mailReturnTooManySessions", '')
		case mailReturnTooManyFiles!
				  MessageBox ("mailReturnTooManyFiles!", '')
		case mailReturnTooManyRecipients!
				  MessageBox ("mailReturnTooManyRecipients", '')
		case mailReturnUnknownRecipient!
				  MessageBox ("mailReturnUnknownRecipient", '')
		case mailReturnAttachmentNotFound!
				  MessageBox ("mailReturnAttachmentNotFound",'')
		case    else
				  MessageBox ("Mail", '')
 	end choose
	RETURN -1
END IF
mSes.mailLogoff()
DESTROY mSes
return 0

end event

on pro_mail.create
int iCurrent
call super::create
this.ddlb_dest=create ddlb_dest
this.sle_attachment=create sle_attachment
this.pb_1=create pb_1
this.mle_message=create mle_message
this.sle_subject=create sle_subject
this.st_subject=create st_subject
this.st_dest=create st_dest
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_dest
this.Control[iCurrent+2]=this.sle_attachment
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.mle_message
this.Control[iCurrent+5]=this.sle_subject
this.Control[iCurrent+6]=this.st_subject
this.Control[iCurrent+7]=this.st_dest
this.Control[iCurrent+8]=this.cb_3
this.Control[iCurrent+9]=this.cb_2
this.Control[iCurrent+10]=this.cb_1
end on

on pro_mail.destroy
call super::destroy
destroy(this.ddlb_dest)
destroy(this.sle_attachment)
destroy(this.pb_1)
destroy(this.mle_message)
destroy(this.sle_subject)
destroy(this.st_subject)
destroy(this.st_dest)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;call super::open;str_mail st_mail

st_mail = message.powerobjectparm
ddlb_dest.text = st_mail.as_destinataire
sle_subject.text = st_mail.as_sujet
sle_attachment.text = st_mail.as_attachment
mle_message.text  = st_mail.as_message
end event

type ddlb_dest from pfc_u_ddlb within pro_mail
integer x = 402
integer y = 52
integer width = 2359
integer height = 764
integer taborder = 10
integer textsize = -10
fontcharset fontcharset = ansi!
boolean allowedit = true
boolean border = false
boolean sorted = false
boolean ib_rmbmenu = false
end type

event constructor;call super::constructor;long ll_idcontact, i = 1
string ls_nom

DECLARE listmail CURSOR FOR
	SELECT id_contact, nom from t_contactmail;

OPEN listmail;

FETCH listmail INTO :ll_idcontact, :ls_nom;

DO WHILE SQLCA.SQLCode = 0
	
	addItem(ls_nom)
	il_idcont[i] = ll_idcontact
	i++
	
	FETCH listmail INTO :ll_idcontact, :ls_nom;
	
LOOP

CLOSE listmail;

selectITem(1)
il_indcont = 1
end event

event selectionchanged;call super::selectionchanged;il_indcont = index
change = true
end event

event modified;call super::modified;if change = false then
	il_indcont = 0
else 
	change = true
end if
end event

type sle_attachment from pfc_u_sle within pro_mail
integer x = 402
integer y = 284
integer width = 2354
integer height = 108
integer taborder = 20
integer textsize = -10
fontcharset fontcharset = ansi!
boolean ib_rmbmenu = false
end type

type pb_1 from pfc_u_pb within pro_mail
integer x = 261
integer y = 292
integer width = 119
integer height = 96
integer taborder = 20
string text = ""
boolean originalsize = false
string picturename = "Custom014!"
end type

event clicked;call super::clicked;string ls_path, ls_name[]

getFileOpenName("Fichier en attachement",ls_path,ls_name[], getCurrentDirectory())
sle_attachment.text = ls_path
end event

type mle_message from pfc_u_mle within pro_mail
integer x = 32
integer y = 388
integer width = 2734
integer height = 1192
integer taborder = 20
integer textsize = -10
fontcharset fontcharset = ansi!
end type

type sle_subject from pfc_u_sle within pro_mail
integer x = 402
integer y = 156
integer width = 2350
integer height = 108
integer taborder = 10
integer textsize = -10
fontcharset fontcharset = ansi!
boolean ib_rmbmenu = false
end type

type st_subject from pfc_u_st within pro_mail
integer x = 32
integer y = 180
integer width = 343
integer textsize = -10
fontcharset fontcharset = ansi!
string text = "Sujet: "
end type

type st_dest from pfc_u_st within pro_mail
integer x = 32
integer y = 60
integer width = 370
integer textsize = -10
fontcharset fontcharset = ansi!
string text = "Destinataire: "
end type

type cb_3 from pfc_u_cb within pro_mail
integer x = 571
integer y = 1608
integer width = 1627
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string text = ""
end type

type cb_2 from pfc_u_cb within pro_mail
integer x = 9
integer y = 1608
integer width = 562
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Annuler"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_1 from pfc_u_cb within pro_mail
integer x = 2203
integer y = 1608
integer width = 562
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Envoyer"
end type

event clicked;call super::clicked;if parent.event ue_sendmail() = 0 then
	close(parent)
end if
end event

