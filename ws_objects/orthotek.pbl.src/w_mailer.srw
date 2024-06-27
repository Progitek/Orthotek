$PBExportHeader$w_mailer.srw
forward
global type w_mailer from window
end type
type cb_close from commandbutton within w_mailer
end type
type st_eric from statictext within w_mailer
end type
type sle_message from singlelineedit within w_mailer
end type
type cb_send from commandbutton within w_mailer
end type
end forward

global type w_mailer from window
integer width = 1326
integer height = 960
boolean titlebar = true
string title = "Courriel"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
cb_close cb_close
st_eric st_eric
sle_message sle_message
cb_send cb_send
end type
global w_mailer w_mailer

on w_mailer.create
this.cb_close=create cb_close
this.st_eric=create st_eric
this.sle_message=create sle_message
this.cb_send=create cb_send
this.Control[]={this.cb_close,&
this.st_eric,&
this.sle_message,&
this.cb_send}
end on

on w_mailer.destroy
destroy(this.cb_close)
destroy(this.st_eric)
destroy(this.sle_message)
destroy(this.cb_send)
end on

type cb_close from commandbutton within w_mailer
integer x = 741
integer y = 704
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type st_eric from statictext within w_mailer
integer x = 73
integer y = 52
integer width = 512
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Message pour Eric"
boolean focusrectangle = false
end type

type sle_message from singlelineedit within w_mailer
integer x = 64
integer y = 188
integer width = 1161
integer height = 356
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_send from commandbutton within w_mailer
integer x = 69
integer y = 696
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Send"
end type

event clicked;mailSession mSes
mailReturnCode mRet
mailMessage mMsg
string mAttach


mAttach = sle_message.text
// Create a mail session
mSes = CREATE mailSession

// Log on to the session
mRet = mSes.mailLogon(mailNewSession!)

IF mRet <> mailReturnSuccess! THEN
		MessageBox("Mail", 'Logon failed.')
		RETURN
END IF
	mMsg.NoteText = mAttach
	mMsg.Subject = "URGENT"
	mMsg.Recipient[1].Address = 'evezina@proclinique.com'

IF mRet <> mailReturnSuccess! THEN
		mRet = mSes.mailAddress(mMsg)
		IF mRet <> mailReturnSuccess! THEN
			MessageBox("Mail", 'Addressing failed.')
			RETURN
		END IF
END IF

// Send the mail
mRet = mSes.mailSend(mMsg)

IF mRet <> mailReturnSuccess! THEN
		MessageBox("Mail", 'Sending mail failed.')
		RETURN
END IF

mSes.mailLogoff()
DESTROY mSes
end event

