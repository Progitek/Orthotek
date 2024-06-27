$PBExportHeader$w_lettername.srw
forward
global type w_lettername from window
end type
type sle_lettername from singlelineedit within w_lettername
end type
type st_1 from statictext within w_lettername
end type
type cb_cancel from commandbutton within w_lettername
end type
type cb_apply from commandbutton within w_lettername
end type
end forward

global type w_lettername from window
integer width = 1701
integer height = 488
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_lettername sle_lettername
st_1 st_1
cb_cancel cb_cancel
cb_apply cb_apply
end type
global w_lettername w_lettername

type variables
private s_corrletter is_corrletter
public string is_wordpath,is_corrpath
end variables

on w_lettername.create
this.sle_lettername=create sle_lettername
this.st_1=create st_1
this.cb_cancel=create cb_cancel
this.cb_apply=create cb_apply
this.Control[]={this.sle_lettername,&
this.st_1,&
this.cb_cancel,&
this.cb_apply}
end on

on w_lettername.destroy
destroy(this.sle_lettername)
destroy(this.st_1)
destroy(this.cb_cancel)
destroy(this.cb_apply)
end on

event open;string ls_word

select corrpath,wordpath into :is_corrpath,:ls_word from t_options where ortho_id = :v_no_ortho;
is_wordpath = ProfileString ("c:\ii4net\orthotek\ortho.ini", "Correspondance", "cheminword", ls_word)

is_corrletter = message.powerobjectparm
sle_lettername.text = is_corrletter.letter
end event

type sle_lettername from singlelineedit within w_lettername
integer x = 123
integer y = 124
integer width = 1426
integer height = 112
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

event modified;is_corrletter.letter = sle_lettername.text + '.doc'
end event

event losefocus;is_corrletter.letter = sle_lettername.text + '.doc'
end event

type st_1 from statictext within w_lettername
integer x = 133
integer y = 20
integer width = 1353
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entrer le nom du document que vous voulez créer :"
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within w_lettername
integer x = 887
integer y = 304
integer width = 571
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

event clicked;close(parent)
end event

type cb_apply from commandbutton within w_lettername
integer x = 187
integer y = 304
integer width = 571
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Appliquer"
boolean default = true
end type

event clicked;//nouveau code
integer li_FileNum


if is_corrletter.mode = 'd' then
	li_FileNum = FileCopy("c:\ii4net\orthotek\tpl",is_corrpath + '\dentistes\' + is_corrletter.letter, FALSE)
else
	li_FileNum = FileCopy("c:\ii4net\orthotek\tpl",is_corrpath + '\' + is_corrletter.letter, FALSE)
end if

choose case li_FileNum
	case -1
		messagebox('Error!','Error opening sourcefile')
	case -2
		messagebox('Error!','Error writing targetfile')
	case else
		if is_corrletter.mode = 'd' then
			Run('"'+is_wordpath + '" "' + is_corrpath + '\dentistes\' + is_corrletter.letter+'"')
		else
			Run('"'+is_wordpath + '" "' + is_corrpath + '\' + is_corrletter.letter+'"')
		end if
		if isvalid(w_corrletters) then
			if is_corrletter.mode = 'd' then
				w_corrletters.lb_files.DirList(w_corrletters.is_corrpath+'\dentistes\*.doc', 0)
			else
				w_corrletters.lb_files.DirList(w_corrletters.is_corrpath+'\*.doc', 0)
			end if
			if v_langue = 'an' then
				w_corrletters.lb_files.AddItem ('NEW')
			else
				w_corrletters.lb_files.AddItem ('NOUVELLE')
			end if
		end if
end choose

//ancien code
//if isvalid(w_word) then
//	w_word.is_corrletter.letter = is_corrletter.letter
//else
//	opensheetwithparm(w_word,is_corrletter,w_principal,2,layered!)
//	w_word.title = "Lettre"
//end if
close(parent)
end event

