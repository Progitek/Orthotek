$PBExportHeader$pro_w_mail1.srw
forward
global type pro_w_mail1 from w_response
end type
type pb_del from u_pb within pro_w_mail1
end type
type st_1 from u_st within pro_w_mail1
end type
type sle_from from u_sle within pro_w_mail1
end type
type cbx_sendhtml from checkbox within pro_w_mail1
end type
type cbx_receipt from checkbox within pro_w_mail1
end type
type sle_to from u_sle within pro_w_mail1
end type
type uo_toolbar from u_cst_toolbarstrip within pro_w_mail1
end type
type uo_toolbar2 from u_cst_toolbarstrip within pro_w_mail1
end type
type st_attachement from u_st within pro_w_mail1
end type
type pb_add from u_pb within pro_w_mail1
end type
type mle_message from u_mle within pro_w_mail1
end type
type sle_subject from u_sle within pro_w_mail1
end type
type st_subject from u_st within pro_w_mail1
end type
type st_dest from u_st within pro_w_mail1
end type
type cb_annuler from u_cb within pro_w_mail1
end type
type cb_envoyer from u_cb within pro_w_mail1
end type
type lb_attachements from u_lb within pro_w_mail1
end type
end forward

global type pro_w_mail1 from w_response
integer x = 214
integer y = 221
integer width = 2789
integer height = 2012
string title = "Contacter le support technique"
long backcolor = 15780518
boolean center = true
event type integer ue_sendmail ( )
pb_del pb_del
st_1 st_1
sle_from sle_from
cbx_sendhtml cbx_sendhtml
cbx_receipt cbx_receipt
sle_to sle_to
uo_toolbar uo_toolbar
uo_toolbar2 uo_toolbar2
st_attachement st_attachement
pb_add pb_add
mle_message mle_message
sle_subject sle_subject
st_subject st_subject
st_dest st_dest
cb_annuler cb_annuler
cb_envoyer cb_envoyer
lb_attachements lb_attachements
end type
global pro_w_mail1 pro_w_mail1

type variables
private long il_idcont[]
private long il_indcont
private boolean change = false
private int ii_typeimp

str_mail ist_mail
end variables

forward prototypes
public subroutine uf_traduction ()
public subroutine of_addattachement (string as_filename)
end prototypes

event type integer ue_sendmail();String ls_body, ls_smtpserver, ls_smtpuserid, ls_smtppassword, ls_addto, ls_sento[]
String ls_filename
Integer li_idx, li_max
Boolean lb_html
long ll_logfile, ll_smtpauth, ll_smtpport, i, ll_envoiconf
n_smtp luo_smtp

SetPointer(HourGlass!)

// Aller chercher les informations dans les options

select 	isnull(smtpserver,''), isnull(smtpport,25), isnull(smtpuserid,''), isnull(smtppassword,''),
			isnull(smtpauth,0), isnull(logfile,0), isnull(confirmenvoi,0)
into		:ls_smtpserver, :ll_smtpport, :ls_smtpuserid, :ls_smtppassword, :ll_smtpauth, :ll_logfile, :ll_envoiconf
from t_options where ortho_id = :v_no_ortho;
 
If ls_smtpserver = "" Then
	MessageBox("Avertissement", "Vous devez configurer les informations du SMTP avant de procéder")
	Return -1
End If

If sle_to.text = "" Then
	MessageBox("Avertissement", "Un destinataire est nécessaire pour envoyer un courriel")
	Return -2
End If

If sle_from.text = "" Then
	MessageBox("Avertissement", "Un expéditeur est nécessaire pour envoyer un courriel")
	Return -3
End If

If sle_subject.text = "" Then
	MessageBox("Avertissement", "Un sujet est nécessaire pour envoyer un courriel")
	Return -4
End If

If mle_message.text = "" Then
	MessageBox("Avertissement", "Un message est nécessaire pour envoyer un courriel")
	Return -5
End If

If cbx_sendhtml.checked Then
	ls_body  = "<html><body bgcolor='#F5F5DC' topmargin=8 leftmargin=8><h2>"
//	ls_body += of_replaceall(mle_message.text, "~r~n", "<br>") + "</h2>"
	If lb_attachements.TotalItems() > 0 Then
		ls_body += "<img src='cid:attach.1'>"
	End If
	ls_body += "</body></html>"
	lb_html = True
Else
	ls_body = mle_message.text
	lb_html = False
End If

If ll_logfile = 1 Then
	luo_smtp.of_SetLogfile(True)
Else
	luo_smtp.of_SetLogfile(False)
End If
luo_smtp.of_DeleteLogfile()

// set properties
If ll_smtpauth = 1 Then
	luo_smtp.of_SetLogin(ls_smtpuserid, ls_smtppassword)
End If
luo_smtp.of_SetPort(ll_smtpport)
luo_smtp.of_SetServer(ls_smtpserver)
luo_smtp.of_SetReceipt(cbx_receipt.checked)
luo_smtp.of_SetFrom(sle_from.text, "")
luo_smtp.of_SetSubject(sle_subject.text)
luo_smtp.of_SetBody(ls_body, lb_html)

luo_smtp.of_Reset()


ls_addto = rep(sle_to.text,",",";")
ls_sento = split(ls_addto,";")
for i = 1 to upperbound(ls_sento)
	luo_smtp.of_AddTo(ls_sento[i], "")
next

if ll_envoiconf = 0 then
	luo_smtp.of_Addbcc(sle_from.text, "")
end if

// add any attachments
li_max = lb_attachements.TotalItems()
For li_idx = 1 To li_max
	ls_filename = lb_attachements.Text(li_idx)
	luo_smtp.of_AddFile(ls_filename)
Next

// send the message
If luo_smtp.of_SendMail() Then
	MessageBox("Information", "Courriel envoyé avec succès")
Else
	MessageBox("Erreur d'envoi", luo_smtp.is_msgtext)
End If

return 0


/*

mailSession  mSes
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

if ii_typeimp = 1 then
	
	mMsg.recipient[1].name = sle_to.text
	mmsg.recipient[1].address = sle_to.text
	
//else
//
//	if il_indcont <> 0 then
//	
//		select adresse into :ls_chaine from t_contactmail where id_contact = :il_idcont[il_indcont];
//		
//		ls_recept[] = split(ls_chaine,';')
//		
//		for i = 1 to upperbound(ls_recept)
//			mMsg.recipient[i].name = ddlb_dest.text
//			mmsg.recipient[i].address = ls_recept[i]
//		next
//		
//	else
//		
//		mMsg.recipient[1].name = ddlb_dest.text
//		mmsg.recipient[1].address = ddlb_dest.text
//		
//	end if
end if
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
				  //MessageBox ("mailReturnUserAbort", '')
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
*/


end event

public subroutine uf_traduction ();uo_toolbar.of_settheme("classic")
uo_toolbar.of_DisplayBorder(true)
uo_toolbar2.of_settheme("classic")
uo_toolbar2.of_DisplayBorder(true)
uo_toolbar.of_AddItem("OK", "C:\ii4net\orthotek\images\ok.gif")

if gnv_app.of_getlangue() = 'an' then
	st_dest.text = "To:"
	st_subject.text = "Subject:"
	st_attachement.text = "Attachment:"
	uo_toolbar2.of_AddItem("Cancel", "C:\ii4net\orthotek\images\annuler.gif")
	THIS.title = "Technical support"
ELSE
	uo_toolbar2.of_AddItem("Annuler", "C:\ii4net\orthotek\images\annuler.gif")
END IF

uo_toolbar.of_displaytext(true)
uo_toolbar2.of_displaytext(true)

end subroutine

public subroutine of_addattachement (string as_filename);String ls_pathname, ls_filename, ls_filter
Integer li_rc

if as_filename = "" then
	ls_filter = "All files,*.*"
	
	li_rc = GetFileOpenName("Select File to Attach", ls_pathname, ls_filename, "", ls_filter)

	If li_rc = 1 Then
		lb_attachements.AddItem(ls_pathname)
	End If

else
	lb_attachements.AddItem(as_filename)
end if




end subroutine

on pro_w_mail1.create
int iCurrent
call super::create
this.pb_del=create pb_del
this.st_1=create st_1
this.sle_from=create sle_from
this.cbx_sendhtml=create cbx_sendhtml
this.cbx_receipt=create cbx_receipt
this.sle_to=create sle_to
this.uo_toolbar=create uo_toolbar
this.uo_toolbar2=create uo_toolbar2
this.st_attachement=create st_attachement
this.pb_add=create pb_add
this.mle_message=create mle_message
this.sle_subject=create sle_subject
this.st_subject=create st_subject
this.st_dest=create st_dest
this.cb_annuler=create cb_annuler
this.cb_envoyer=create cb_envoyer
this.lb_attachements=create lb_attachements
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_del
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.sle_from
this.Control[iCurrent+4]=this.cbx_sendhtml
this.Control[iCurrent+5]=this.cbx_receipt
this.Control[iCurrent+6]=this.sle_to
this.Control[iCurrent+7]=this.uo_toolbar
this.Control[iCurrent+8]=this.uo_toolbar2
this.Control[iCurrent+9]=this.st_attachement
this.Control[iCurrent+10]=this.pb_add
this.Control[iCurrent+11]=this.mle_message
this.Control[iCurrent+12]=this.sle_subject
this.Control[iCurrent+13]=this.st_subject
this.Control[iCurrent+14]=this.st_dest
this.Control[iCurrent+15]=this.cb_annuler
this.Control[iCurrent+16]=this.cb_envoyer
this.Control[iCurrent+17]=this.lb_attachements
end on

on pro_w_mail1.destroy
call super::destroy
destroy(this.pb_del)
destroy(this.st_1)
destroy(this.sle_from)
destroy(this.cbx_sendhtml)
destroy(this.cbx_receipt)
destroy(this.sle_to)
destroy(this.uo_toolbar)
destroy(this.uo_toolbar2)
destroy(this.st_attachement)
destroy(this.pb_add)
destroy(this.mle_message)
destroy(this.sle_subject)
destroy(this.st_subject)
destroy(this.st_dest)
destroy(this.cb_annuler)
destroy(this.cb_envoyer)
destroy(this.lb_attachements)
end on

event open;call super::open;long ll_idpers
string ls_courriel

sle_to.text = ist_mail.as_destinataire
sle_subject.text = ist_mail.as_sujet
sle_from.text = ist_mail.as_expediteur
//sle_attachment.text = ist_mail.as_attachment
if ist_mail.as_attachment <> "" then of_addattachement(ist_mail.as_attachment)
mle_message.text  = ist_mail.as_message
ii_typeimp = ist_mail.ai_typeimp


// On place les informations de supplémentaire

ll_idpers = gl_idpers
select isnull(courriel,'') into :ls_courriel from t_personnels where id_personnel = :ll_idpers;
sle_from.text = ls_courriel


end event

event pfc_preopen;call super::pfc_preopen;ist_mail = message.powerobjectparm
end event

type pb_del from u_pb within pro_w_mail1
integer x = 2638
integer y = 432
integer width = 119
integer height = 96
integer taborder = 40
string text = ""
boolean originalsize = false
string picturename = "C:\ii4net\orthotek\images\stop.gif"
end type

event clicked;call super::clicked;Integer li_row

li_row = lb_attachements.SelectedIndex()
If li_row > 0 Then
	lb_attachements.DeleteItem(li_row)
End If

end event

type st_1 from u_st within pro_w_mail1
integer x = 32
integer y = 124
integer width = 370
integer height = 84
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 15780518
string text = "Expéditeur: "
end type

type sle_from from u_sle within pro_w_mail1
integer x = 402
integer y = 124
integer width = 2354
integer height = 84
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean ib_rmbmenu = false
end type

type cbx_sendhtml from checkbox within pro_w_mail1
integer x = 1445
integer y = 1824
integer width = 791
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "Envoyé message comme HTML"
end type

type cbx_receipt from checkbox within pro_w_mail1
integer x = 549
integer y = 1824
integer width = 878
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Demande confirmation de reception"
end type

type sle_to from u_sle within pro_w_mail1
integer x = 402
integer y = 40
integer width = 2354
integer height = 84
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean ib_rmbmenu = false
end type

type uo_toolbar from u_cst_toolbarstrip within pro_w_mail1
integer x = 27
integer y = 1816
integer width = 507
integer taborder = 60
end type

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_envoyer.event clicked( )
end event

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

type uo_toolbar2 from u_cst_toolbarstrip within pro_w_mail1
integer x = 2249
integer y = 1816
integer width = 507
integer taborder = 60
end type

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_annuler.event clicked( )
end event

on uo_toolbar2.destroy
call u_cst_toolbarstrip::destroy
end on

type st_attachement from u_st within pro_w_mail1
integer x = 32
integer y = 328
integer width = 361
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 15780518
string text = "Pièce jointe: "
end type

type pb_add from u_pb within pro_w_mail1
integer x = 2638
integer y = 328
integer width = 119
integer height = 104
integer taborder = 40
string text = ""
string picturename = "C:\ii4net\orthotek\images\ajout.jpg"
end type

event clicked;call super::clicked;of_addattachement("")
//string ls_path, ls_name[]
//
//getFileOpenName("Fichier en attachement",ls_path,ls_name[], getCurrentDirectory())
//sle_attachment.text = ls_path
end event

type mle_message from u_mle within pro_w_mail1
integer x = 27
integer y = 616
integer width = 2729
integer height = 1184
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "Tahoma"
end type

type sle_subject from u_sle within pro_w_mail1
integer x = 402
integer y = 236
integer width = 2354
integer height = 84
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Tahoma"
boolean ib_rmbmenu = false
end type

type st_subject from u_st within pro_w_mail1
integer x = 32
integer y = 236
integer width = 343
integer height = 84
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 15780518
string text = "Sujet: "
end type

type st_dest from u_st within pro_w_mail1
integer x = 32
integer y = 40
integer width = 370
integer height = 84
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 15780518
string text = "Destinataire: "
end type

type cb_annuler from u_cb within pro_w_mail1
boolean visible = false
integer x = 27
integer y = 1972
integer width = 562
integer height = 112
integer taborder = 0
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Annuler"
boolean cancel = true
end type

event clicked;call super::clicked;close(parent)
end event

type cb_envoyer from u_cb within pro_w_mail1
boolean visible = false
integer x = 2185
integer y = 1976
integer width = 562
integer height = 112
integer taborder = 0
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string text = "Envoyer"
end type

event clicked;call super::clicked;if parent.event ue_sendmail() = 0 then
	close(parent)
end if
end event

type lb_attachements from u_lb within pro_w_mail1
integer x = 402
integer y = 328
integer width = 2226
integer height = 264
integer taborder = 50
end type

