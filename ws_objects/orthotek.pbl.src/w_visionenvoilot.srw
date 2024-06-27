$PBExportHeader$w_visionenvoilot.srw
forward
global type w_visionenvoilot from w_child
end type
type lb_files from u_lb within w_visionenvoilot
end type
type rb_etat from radiobutton within w_visionenvoilot
end type
type rb_err from radiobutton within w_visionenvoilot
end type
type cb_preview from u_cb within w_visionenvoilot
end type
type cb_close from u_cb within w_visionenvoilot
end type
type dw_visionenvoilot from u_dw within w_visionenvoilot
end type
end forward

global type w_visionenvoilot from w_child
integer x = 214
integer y = 221
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
boolean ib_isupdateable = false
lb_files lb_files
rb_etat rb_etat
rb_err rb_err
cb_preview cb_preview
cb_close cb_close
dw_visionenvoilot dw_visionenvoilot
end type
global w_visionenvoilot w_visionenvoilot

type variables
String is_state
end variables

on w_visionenvoilot.create
int iCurrent
call super::create
this.lb_files=create lb_files
this.rb_etat=create rb_etat
this.rb_err=create rb_err
this.cb_preview=create cb_preview
this.cb_close=create cb_close
this.dw_visionenvoilot=create dw_visionenvoilot
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.lb_files
this.Control[iCurrent+2]=this.rb_etat
this.Control[iCurrent+3]=this.rb_err
this.Control[iCurrent+4]=this.cb_preview
this.Control[iCurrent+5]=this.cb_close
this.Control[iCurrent+6]=this.dw_visionenvoilot
end on

on w_visionenvoilot.destroy
call super::destroy
destroy(this.lb_files)
destroy(this.rb_etat)
destroy(this.rb_err)
destroy(this.cb_preview)
destroy(this.cb_close)
destroy(this.dw_visionenvoilot)
end on

event open;call super::open;lb_files.DirList("C:\ii4net\orthotek\paiementlot\rep\*.*", 0)
dw_visionenvoilot.event ue_retrieve()
rb_etat.checked = true
is_state = 'EC'
end event

type lb_files from u_lb within w_visionenvoilot
boolean visible = false
integer x = 2011
integer y = 40
integer taborder = 10
end type

type rb_etat from radiobutton within w_visionenvoilot
integer x = 2281
integer y = 12
integer width = 594
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "État de compte"
boolean checked = true
end type

event clicked;lb_files.DirList("C:\ii4net\orthotek\paiementlot\rep\*.*", 0)
dw_visionenvoilot.event ue_retrieve()
rb_etat.checked = true
is_state = 'EC'
end event

type rb_err from radiobutton within w_visionenvoilot
integer x = 2971
integer y = 12
integer width = 594
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Erreur"
end type

event clicked;lb_files.DirList("C:\ii4net\orthotek\paiementlot\*.err", 0)
dw_visionenvoilot.event ue_retrieve()
rb_err.checked = true
is_state = 'ER'
end event

type cb_preview from u_cb within w_visionenvoilot
integer x = 9
integer y = 1920
integer width = 1906
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Visionner"
end type

event clicked;call super::clicked;String ls_filename, ls_Emp_Input,ls_textmsg
integer li_FileNum
if dw_visionenvoilot.getRow() > 0 then
	if is_state = 'EC' then
		ls_filename = dw_visionenvoilot.getItemString(dw_visionenvoilot.getRow(),'nom')
		opensheetwithparm(w_visionnerlot,ls_filename,w_principal,2,layered!)
	else
		ls_filename = dw_visionenvoilot.getItemString(dw_visionenvoilot.getRow(),'nom')
		li_FileNum = FileOpen(ls_filename, LineMode!)
		FileRead(li_FileNum,ls_Emp_Input)
		choose case left(ls_Emp_Input,4)
			case '6000'
				ls_textmsg = 'Vérifiez le fichier.'
			case '6001'
				ls_textmsg = 'Le numéro de lot doit être unique. Changez le numéro de lot et renvoyez le fichier.'
			case '6002'
				ls_textmsg = 'Au moins une des transactions du lot ne respecte pas le format spécifié. Vérifiez le fichier.'
			case '6003'
				ls_textmsg = "Le nombre de transactions indiqué dans l'en-tête ne correspond pas au nombre de transactions dans le fichier. Vérifiez le fichier."
			case '6004'
				ls_textmsg = "Le format de l'en-tête du fichier ne respecte pas le format spécifié. Vérifiez le fichier."
			case '6005'
				ls_textmsg = "Le marchand indiqué dans l'en-tête ne correspond pas au marchand pour lequel le lot va être exécuté. Vérifiez le fichier."
			case '6006'
				ls_textmsg = "Vérifiez que le fichier est bien crypté et qu'il a bien été transmis. Si le problème persiste, contactez le service d’assistance."
			case '6007'
				ls_textmsg = ""
			case '6008'
				ls_textmsg = ""
			case '6009'
				ls_textmsg = ""
			case '6010'
				ls_textmsg = "Le déplacement du répertoire « out » vers le répertoire « done » est impossible à cause de la sécurité du serveur FTP. Vérifiez que le nom d’utilisateur FTP que CGI utilise a bien les droits nécessaires pour déplacer les fichiers."
			case '6012'
				ls_textmsg = "Un lot doit compter au moins une transaction."
			case '6020'
				ls_textmsg = "Erreur fatale pendant la transaction. Vérifiez, dans le rapport de transaction, si la transaction a été effectuée."
		end choose
		messagebox(ls_emp_input,ls_textmsg)
		FileClose(li_FileNum)
	end if
end if
end event

type cb_close from u_cb within w_visionenvoilot
integer x = 1920
integer y = 1920
integer width = 1714
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;call super::clicked;close(parent)
end event

type dw_visionenvoilot from u_dw within w_visionenvoilot
event ue_retrieve ( )
integer y = 108
integer width = 3630
integer height = 1792
integer taborder = 10
string dataobject = "d_visionenvoilot"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();long i, ll_row
string ls_file
date ldt_date

setRedraw(false)
reset()

for i = 1 to lb_files.totalitems()
	lb_files.selectitem(i)
	ls_file = lb_files.selecteditem( )
	ldt_date = date(long(mid(ls_file,1,4)),long(mid(ls_file,5,2)),long(mid(ls_file,7,2)))
	ll_row = insertRow(0)
	setItem(ll_row,'nom',ls_file)
	setItem(ll_row,'datetrans',ldt_date)
next

setSort("datetrans D")
sort()

setRedraw(true)
end event

event constructor;call super::constructor;setrowFocusIndicator(hand!)

end event

event clicked;call super::clicked;scrollToRow(getClickedRow())
end event

