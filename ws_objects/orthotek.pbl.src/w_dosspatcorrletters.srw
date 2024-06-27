$PBExportHeader$w_dosspatcorrletters.srw
forward
global type w_dosspatcorrletters from window
end type
type rb_2 from radiobutton within w_dosspatcorrletters
end type
type rb_1 from radiobutton within w_dosspatcorrletters
end type
type rb_sag from radiobutton within w_dosspatcorrletters
end type
type rb_ret from radiobutton within w_dosspatcorrletters
end type
type rb_exp from radiobutton within w_dosspatcorrletters
end type
type rb_all from radiobutton within w_dosspatcorrletters
end type
type cb_open from commandbutton within w_dosspatcorrletters
end type
type st_2 from statictext within w_dosspatcorrletters
end type
type st_title from statictext within w_dosspatcorrletters
end type
type lb_files from listbox within w_dosspatcorrletters
end type
type cb_cancel from commandbutton within w_dosspatcorrletters
end type
type gb_1 from groupbox within w_dosspatcorrletters
end type
type gb_2 from groupbox within w_dosspatcorrletters
end type
end forward

global type w_dosspatcorrletters from window
integer width = 1870
integer height = 1824
windowtype windowtype = response!
long backcolor = 67108864
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
boolean center = true
rb_2 rb_2
rb_1 rb_1
rb_sag rb_sag
rb_ret rb_ret
rb_exp rb_exp
rb_all rb_all
cb_open cb_open
st_2 st_2
st_title st_title
lb_files lb_files
cb_cancel cb_cancel
gb_1 gb_1
gb_2 gb_2
end type
global w_dosspatcorrletters w_dosspatcorrletters

type prototypes


end prototypes

type variables
private s_corrletter is_corrletter
private string is_corrpath, is_letterpath, is_wordpath, is_corrpathfus
private long il_corrprescrip = 0
end variables

on w_dosspatcorrletters.create
this.rb_2=create rb_2
this.rb_1=create rb_1
this.rb_sag=create rb_sag
this.rb_ret=create rb_ret
this.rb_exp=create rb_exp
this.rb_all=create rb_all
this.cb_open=create cb_open
this.st_2=create st_2
this.st_title=create st_title
this.lb_files=create lb_files
this.cb_cancel=create cb_cancel
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.rb_2,&
this.rb_1,&
this.rb_sag,&
this.rb_ret,&
this.rb_exp,&
this.rb_all,&
this.cb_open,&
this.st_2,&
this.st_title,&
this.lb_files,&
this.cb_cancel,&
this.gb_1,&
this.gb_2}
end on

on w_dosspatcorrletters.destroy
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.rb_sag)
destroy(this.rb_ret)
destroy(this.rb_exp)
destroy(this.rb_all)
destroy(this.cb_open)
destroy(this.st_2)
destroy(this.st_title)
destroy(this.lb_files)
destroy(this.cb_cancel)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;string ls_patnom, ls_word
is_corrletter = message.powerobjectparm
il_corrprescrip = long(gnv_app.inv_entrepotglobal.of_retournedonnee( 'Correspondanceprescription'))

if is_corrletter.mode = 'd' then
	if is_corrletter.patid = 0 then
		ls_patnom = "tous les dentistes"
	else
		select det_prenom + ' ' + det_nom into :ls_patnom from t_dentists where id_dentist = :is_corrletter.patid;
	end if
else
	if is_corrletter.patid = -1 then
		ls_patnom = "tous les patients"
	else
		select patient_prenom + ' ' + patient_nom into :ls_patnom from patient where patient_id = :is_corrletter.patid;
	end if
end if

st_title.text = 'Correspondre avec ' + ls_patnom
//dirlist
if il_corrprescrip = 1 then
	select corrpathsys,wordpath, corrpath into :is_corrpath,:ls_word,:is_corrpathfus from t_options where ortho_id = :v_no_ortho;
else
	select corrpath,wordpath,corrpath into :is_corrpath,:ls_word,:is_corrpathfus from t_options where ortho_id = :v_no_ortho;
end if
is_wordpath = ProfileString ("c:\ii4net\orthotek\ortho.ini", "Correspondance", "cheminword", ls_word)

is_letterpath = is_corrpath
if is_corrletter.mode = 'd' then is_letterpath += '\dentistes'
if not DirectoryExists(is_letterpath) then CreateDirectory(is_letterpath)
lb_files.DirList(is_letterpath+'\*.doc',0)
rb_all.checked = true


end event

type rb_2 from radiobutton within w_dosspatcorrletters
integer x = 887
integer y = 336
integer width = 681
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Fichier de type ( *.XLS) "
end type

event clicked;lb_files.DirList(is_letterpath+'\*.xls',0)
end event

type rb_1 from radiobutton within w_dosspatcorrletters
integer x = 87
integer y = 336
integer width = 681
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Fichier de type ( *.DOC) "
boolean checked = true
end type

event clicked;lb_files.DirList(is_letterpath+'\*.doc',0)
end event

type rb_sag from radiobutton within w_dosspatcorrletters
integer x = 1289
integer y = 172
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Sag"
end type

event clicked;lb_files.DirList(is_letterpath+'\sag*.doc', 0)	
end event

type rb_ret from radiobutton within w_dosspatcorrletters
integer x = 887
integer y = 172
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Ret"
end type

event clicked;lb_files.DirList(is_letterpath+'\ret*.doc', 0)	
end event

type rb_exp from radiobutton within w_dosspatcorrletters
integer x = 485
integer y = 172
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Exp"
end type

event clicked;lb_files.DirList(is_letterpath+'\exp*.doc', 0)	
end event

type rb_all from radiobutton within w_dosspatcorrletters
integer x = 87
integer y = 172
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Tous"
end type

event clicked;lb_files.DirList(is_letterpath+'\*.doc', 0)	
end event

type cb_open from commandbutton within w_dosspatcorrletters
integer y = 1688
integer width = 914
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Correspondre"
end type

event clicked;///////////////////////////////////////////////////
//
// Par			: Eric Vezina ing.
// Date			:
// Description	: Une structure contenant les informations suivantes
//					  est passé à la fenêtre w_word.
//
//	PatId : patient_id
// Flag	: r (mode lecture seulement)
//			  w (mode lecture et écriture)
// Mode	: t (mode edition du template)
//			: l (mode création de lettre patient)
//
///////////////////////////////////////////////////

n_cst_syncproc luo_sync
integer i = 1,li_FileNum
string ls_letter, ls_chemin, ls_prefix
//oleObject lole_word

is_corrletter.letter = lb_files.selecteditem()

if is_corrletter.letter = '' then
   error_type(125)
else
	// Copie de la macro de TPL vers lettre type, pour éviter les erreurs de versions de macro //

// ***** ouvrerture trop lent du document *****
//	lole_word = create oleobject
//	
//	if lole_word.connecttonewobject('word.application') <> 0 then return 0
//
//	lole_word.documents.open(is_corrpath + '\' + is_corrletter.letter)
//	lole_word.activedocument.range.copy()
//	lole_word.activedocument.close(0)
//	lole_word.documents.open('c:\ii4net\orthotek\tpl')
//	lole_word.activedocument.range.paste()
//	lole_word.activedocument.saveas(is_corrpath + '\' + is_corrletter.letter)
//	lole_word.activedocument.close(0)
//	lole_word.quit()
//	
//	lole_word.disconnectobject()	
//	destroy lole_word
	
	/////////////////////////////////////////////////////////////////////////////////////////////
	//nouveau code
	ls_letter = is_corrletter.letter
	if is_corrletter.patid > 0 then
		if is_corrletter.mode = 'd' then
			ls_chemin = is_corrpathfus + '\dentistes\' + string(is_corrletter.patid)
		else
			ls_chemin = is_corrpathfus + '\' + string(is_corrletter.patid)
		end if
		if not DirectoryExists(ls_chemin) then CreateDirectory(ls_chemin)
	elseif is_corrletter.patid = -1 then
		ls_chemin = "c:\ii4net\orthotek"
	else
		ls_chemin = is_corrpathfus
	end if
	if is_corrletter.mode = 'd' then
		ls_prefix = '\dentistes\'
	else
		ls_prefix = '\'
	end if
	
	do while FileExists(ls_chemin + '\' + ls_letter) or FileExists(ls_chemin + '\' + '.' + ls_letter)
		ls_letter = left(is_corrletter.letter, lastpos(is_corrletter.letter, '.') - 1) + string(i) + mid(is_corrletter.letter, lastpos(is_corrletter.letter, '.'))
		i++
	loop
		
	if upper(right(ls_letter,3)) = 'DOC' then
		li_FileNum = FileCopy(is_corrpath + ls_prefix + is_corrletter.letter,ls_chemin + '\' + '.' + ls_letter, FALSE) // add .
	else
		li_FileNum = FileCopy(is_corrpath + ls_prefix + is_corrletter.letter,ls_chemin + '\' + ls_letter, FALSE)
	end if
	
	choose case li_FileNum
		case -1
			messagebox('Error!',"Error opening sourcefile '" + is_corrpath + ls_prefix + is_corrletter.letter + "'")
		case -2
			messagebox('Error!',"Error writing targetfile '" + ls_chemin + '\' + '.' + ls_letter + "'")
		case else
			if upper(right(ls_letter,3)) = 'DOC' then
				Run('"'+is_wordpath + '"' + '"' + ls_chemin + '\' + '.' + ls_letter+'"')
			else
				luo_sync = CREATE n_cst_syncproc
			
				luo_sync.of_setwindow('normal')
				luo_sync.of_RunAndWait('"' + ls_chemin + '\' + ls_letter + '"')
				
				IF IsValid(luo_sync) THEN destroy luo_sync
			end if
			if isvalid(w_dossier_patients) then
				w_dossier_patients.tab_dosspat.tabpage_histocorr.dw_histocorr.event ue_retrieve()
			end if
	end choose
	
	if isvalid(w_dossier_patients) then
		if w_dossier_patients.tab_dosspat.selectedTab = 7 then
		//	w_dossier_patients.event ue_timer(1)
			timer(1,w_dossier_patients)
		end if
	end if
		
	close(parent)
end if
end event

type st_2 from statictext within w_dosspatcorrletters
integer y = 452
integer width = 1838
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Sélectionnez un document de votre choix :"
boolean focusrectangle = false
end type

type st_title from statictext within w_dosspatcorrletters
integer width = 1838
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Correspondre avec"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Correspondences"
end if
end event

type lb_files from listbox within w_dosspatcorrletters
integer x = 5
integer y = 548
integer width = 1838
integer height = 1124
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 79741120
boolean vscrollbar = true
string item[] = {""}
end type

type cb_cancel from commandbutton within w_dosspatcorrletters
integer x = 923
integer y = 1688
integer width = 914
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

type gb_1 from groupbox within w_dosspatcorrletters
integer y = 276
integer width = 1842
integer height = 168
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
end type

type gb_2 from groupbox within w_dosspatcorrletters
integer y = 112
integer width = 1842
integer height = 168
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
end type

