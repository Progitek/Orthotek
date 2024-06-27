$PBExportHeader$w_corrletters.srw
forward
global type w_corrletters from w_child
end type
type cb_1 from commandbutton within w_corrletters
end type
type lb_filesdent from listbox within w_corrletters
end type
type cb_delmod from commandbutton within w_corrletters
end type
type cb_addmoddent from commandbutton within w_corrletters
end type
type cb_arrlettre from commandbutton within w_corrletters
end type
type cb_suppr from commandbutton within w_corrletters
end type
type st_6 from statictext within w_corrletters
end type
type cb_open from commandbutton within w_corrletters
end type
type st_2 from statictext within w_corrletters
end type
type st_title from statictext within w_corrletters
end type
type lb_files from listbox within w_corrletters
end type
type cb_close from commandbutton within w_corrletters
end type
end forward

global type w_corrletters from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_1 cb_1
lb_filesdent lb_filesdent
cb_delmod cb_delmod
cb_addmoddent cb_addmoddent
cb_arrlettre cb_arrlettre
cb_suppr cb_suppr
st_6 st_6
cb_open cb_open
st_2 st_2
st_title st_title
lb_files lb_files
cb_close cb_close
end type
global w_corrletters w_corrletters

type prototypes


end prototypes

type variables
private long il_patid
int indice = 0
string vfocus, filtre = "patient_patient_id = 0", is_wordpath
public string is_corrpath
end variables

forward prototypes
public function string of_killfilter (integer patient_id)
public function string of_madefilter (integer patient_id)
end prototypes

public function string of_killfilter (integer patient_id);string is_filter = ''
int i
//
////pat_id[indice] = patient_id
//
//for i = 1 to indice
//	if pat_id[i] <> patient_id then
//	   if is_filter = '' then
//	      is_filter = "patient_patient_id = " + string(pat_id[i])
//      else
//		   is_filter += " or "
//		   is_filter += "patient_patient_id = " + string(pat_id[i])
//      end if
//	else
//		pat_id[i] = 0
//	end if
//next

return is_filter

end function

public function string of_madefilter (integer patient_id);string is_filter = ''
int i

//indice = indice + 1
//pat_id[indice] = patient_id
//
//for i = 1 to indice
//   if is_filter = '' then
//	   is_filter = "patient_patient_id = " + string(pat_id[i])
//   else
//		is_filter += " or "
//		is_filter += "patient_patient_id = " + string(pat_id[i])
//   end if
//next

return is_filter

end function

on w_corrletters.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.lb_filesdent=create lb_filesdent
this.cb_delmod=create cb_delmod
this.cb_addmoddent=create cb_addmoddent
this.cb_arrlettre=create cb_arrlettre
this.cb_suppr=create cb_suppr
this.st_6=create st_6
this.cb_open=create cb_open
this.st_2=create st_2
this.st_title=create st_title
this.lb_files=create lb_files
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.lb_filesdent
this.Control[iCurrent+3]=this.cb_delmod
this.Control[iCurrent+4]=this.cb_addmoddent
this.Control[iCurrent+5]=this.cb_arrlettre
this.Control[iCurrent+6]=this.cb_suppr
this.Control[iCurrent+7]=this.st_6
this.Control[iCurrent+8]=this.cb_open
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_title
this.Control[iCurrent+11]=this.lb_files
this.Control[iCurrent+12]=this.cb_close
end on

on w_corrletters.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.lb_filesdent)
destroy(this.cb_delmod)
destroy(this.cb_addmoddent)
destroy(this.cb_arrlettre)
destroy(this.cb_suppr)
destroy(this.st_6)
destroy(this.cb_open)
destroy(this.st_2)
destroy(this.st_title)
destroy(this.lb_files)
destroy(this.cb_close)
end on

event open;call super::open;long ll_newrow,ll_idcontact
string ls_word

//il_patid = message.doubleparm

//dirlist
select corrpath, wordpath into :is_corrpath, :ls_word from t_options where ortho_id = :v_no_ortho;
is_wordpath = ProfileString ("c:\ii4net\orthotek\ortho.ini", "Correspondance", "cheminword", ls_word)

lb_files.DirList(is_corrpath+'\*.doc', 0)
if v_langue = 'an' then
	lb_files.AddItem ('NEW')
else
	lb_files.AddItem ('NOUVELLE')
end if


// Correspondances pour dentiste
//select corrpath,wordpath into :is_corrpath,:is_wordpath from t_options where ortho_id = :v_no_ortho;
lb_filesdent.DirList(is_corrpath+'\dentistes\*.doc', 0)
if v_langue = 'an' then
	lb_filesdent.AddItem ('NEW')
else
	lb_filesdent.AddItem ('NOUVELLE')
end if



end event

event activate;setredraw(true)
end event

type cb_1 from commandbutton within w_corrletters
integer x = 1189
integer y = 1912
integer width = 613
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Importer"
end type

event clicked;string ls_docpath, ls_docname
integer li_rtn
oleobject lole_word

lole_word = create oleobject
if lole_word.connecttonewobject('word.application') <> 0 then return 0

li_rtn = GetFileOpenName("Choisir le fichier", ls_docpath, ls_docname, "DOC", "Doc Files (*.DOC),*.DOC", "c:\ii4net\orthotek", 18)
IF li_rtn < 1 THEN return
lole_word.documents.open(ls_docpath)
lole_word.activedocument.range.copy()
lole_word.activedocument.close(0)
lole_word.documents.open('c:\ii4net\orthotek\tpl')
lole_word.activedocument.range.paste()
lole_word.activedocument.saveas(is_corrpath + '\' + ls_docname)
lole_word.activedocument.close(0)
Run('"' + is_wordpath + '" "' + is_corrpath + '\' + ls_docname + '"')
end event

type lb_filesdent from listbox within w_corrletters
integer x = 1801
integer y = 224
integer width = 1806
integer height = 1676
integer taborder = 10
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

event doubleclicked;cb_addmoddent.event clicked()

/////////////////////////////////////////////////////
////
//// Par			: Eric Vezina ing.
//// Date			:
//// Description	: Une structure contenant les informations suivantes
////					  est passé à la fenêtre w_word.
////
////	PatId : patient_id
//// Flag	: r (mode lecture seulement)
////			  w (mode lecture et écriture)
//// Mode	: t (mode edition du template)
////			: l (mode création de lettre patient)
////
/////////////////////////////////////////////////////
//
//long ll_contactid[]
//long ll_patid[]
//long ll_phase[]
//oleObject lole_word
//s_corrletter s_corr
//s_corr.patid = il_patid
//s_corr.letter = lb_files.selecteditem()
//s_corr.flag = 'w'
//s_corr.mode = 't'
//boolean lb_2k3
//
//select id_contact into :ll_contactid[1] from patient where patient_id = :il_patid;
//ll_patid[1] = il_patid
//ll_phase[1] = 1
//
//if s_corr.letter = '' then
//   error_type(125)
//elseif s_corr.letter = 'NEW' or s_corr.letter = 'NOUVELLE' then
////	lole_word = create oleobject
////	
////	if lole_word.connecttonewobject('word.application') <> 0 then return 0
////	lb_2k3 = (left(lole_word.version, 2) = '11')
////	lole_word.disconnectobject()
////	destroy lole_word
//	gf_pat2excel(ll_phase,ll_contactid,ll_phase)
//	openwithparm(w_lettername,s_corr,w_principal)
////	w_word.title = "Corps de la lettre"
//else
//	// Copie de la macro de TPL vers lettre type, pour éviter les erreurs de versions de macro //
////	lole_word = create oleobject
////	if lole_word.connecttonewobject('word.application') <> 0 then return 0
////	lb_2k3 = (left(lole_word.version, 2) = '11')
////	lole_word.documents.open(is_corrpath + '\' + s_corr.letter)
////	lole_word.activedocument.range.copy()
////	lole_word.activedocument.close(0)
////	lole_word.documents.open('c:\ii4net\orthotek\tpl')
////	lole_word.activedocument.range.paste()
////	lole_word.activedocument.saveas(is_corrpath + '\' + s_corr.letter)
////	lole_word.activedocument.close(0)
////	lole_word.quit()
////	lole_word.disconnectobject()	
////	destroy lole_word
//	gf_pat2excel(ll_patid,ll_contactid,ll_phase)
//	Run('"' + is_wordpath + '" "' + s_corr.letter + '"')
////	ancien code
////	opensheetwithparm(w_word,s_corr,w_principal,2,layered!)
////	w_word.title = "Corps de la lettre"
//end if
end event

type cb_delmod from commandbutton within w_corrletters
integer x = 2441
integer y = 1912
integer width = 512
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Suppr TPL (Dent)"
end type

event clicked;///////////////////////////////////////////////////
//
// Par			: Sébastien Tremblay
// Date			: 2006-10-06
// Description	: Suppression d'une lettre type.
//
///////////////////////////////////////////////////

string ls_lettre

ls_lettre = lb_filesdent.selecteditem()

if ls_lettre = '' then
   error_type(125)
elseif ls_lettre <> 'NEW' and ls_lettre <> 'NOUVELLE' then
	if error_type(240) = 1 then
		fileDelete(is_corrpath + '\dentistes\' + ls_lettre)
		
		lb_filesdent.DirList(is_corrpath+'\dentistes\*.doc', 0)
		if v_langue = 'an' then
			lb_filesdent.AddItem ('NEW')
		else
			lb_filesdent.AddItem ('NOUVELLE')
		end if
	end if
end if

end event

type cb_addmoddent from commandbutton within w_corrletters
integer x = 1806
integer y = 1912
integer width = 631
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Add / Mod TPL (Dent)"
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

long i
long ll_detid[]
oleObject lole_word
s_corrletter s_corr
s_corr.patid = il_patid
s_corr.letter = lb_filesdent.selecteditem()
s_corr.flag = 'w'
s_corr.mode = 'd'
boolean lb_2k3

select first id_dentist into :ll_detid[1] from t_dentists;

if s_corr.letter = '' then
   error_type(125)
elseif s_corr.letter = 'NEW' or s_corr.letter = 'NOUVELLE' then	
	gf_det2excel(ll_detid)
	openwithparm(w_lettername,s_corr,w_principal)
else	
	gf_det2excel(ll_detid)
	Run('"' + is_wordpath + '" "' + is_corrpath+'\dentistes\' + s_corr.letter + '"')
end if
end event

type cb_arrlettre from commandbutton within w_corrletters
boolean visible = false
integer x = 2322
integer y = 12
integer width = 1312
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Arranger lettre avec nouveau TPL"
end type

event constructor;if gl_idpers = 0 then this.visible = true
end event

event clicked;long i
oleobject lole_word
string ls_lettre

lole_word = create oleobject

if lole_word.connecttonewobject('word.application') <> 0 then return 0

for i = 1 to lb_files.totalitems()

	lb_files.selectItem(i)
	ls_lettre = lb_files.selecteditem()
	
	if ls_lettre <> 'NOUVELLE' then
	
		lole_word.documents.open(is_corrpath + '\' + ls_lettre)
				
		lole_word.activedocument.range.copy()
		
		lole_word.activedocument.close(0)
		
		lole_word.documents.open('c:\ii4net\orthotek\tpl')
		
		lole_word.activedocument.range.paste()

		lole_word.activedocument.saveas(is_corrpath + '\' + ls_lettre)
		
		lole_word.activedocument.close(0)
		
		do while yield()
		loop
		
	end if
	
next

lole_word.quit()
lole_word.disconnectobject()
destroy lole_word
end event

type cb_suppr from commandbutton within w_corrletters
integer x = 594
integer y = 1912
integer width = 594
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Suppr TPL"
end type

event clicked;///////////////////////////////////////////////////
//
// Par			: Sébastien Tremblay
// Date			: 2006-10-06
// Description	: Suppression d'une lettre type.
//
///////////////////////////////////////////////////

string ls_lettre

ls_lettre = lb_files.selecteditem()

if ls_lettre = '' then
   error_type(125)
elseif ls_lettre <> 'NEW' and ls_lettre <> 'NOUVELLE' then
	if error_type(240) = 1 then
		fileDelete(is_corrpath + '\' + ls_lettre)
		
		lb_files.DirList(is_corrpath+'\*.doc', 0)
		if v_langue = 'an' then
			lb_files.AddItem ('NEW')
		else
			lb_files.AddItem ('NOUVELLE')
		end if
	end if
end if

end event

type st_6 from statictext within w_corrletters
integer x = 1801
integer y = 148
integer width = 1184
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
string text = "Correspondance avec les dentistes"
boolean focusrectangle = false
end type

type cb_open from commandbutton within w_corrletters
integer y = 1912
integer width = 594
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Add / Mod TPL"
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

long i,ll_contactid[]
long ll_patid[]
long ll_phase[]
oleObject lole_word
s_corrletter s_corr
s_corr.patid = il_patid
s_corr.letter = lb_files.selecteditem()
s_corr.flag = 'w'
s_corr.mode = 't'
boolean lb_2k3

select id_contact into :ll_contactid[1] from patient where patient_id = :il_patid;
ll_phase[1] = 1
ll_patid[1] = il_patid

if s_corr.letter = '' then
   error_type(125)
elseif s_corr.letter = 'NEW' or s_corr.letter = 'NOUVELLE' then
//	lole_word = create oleobject
	
//	if lole_word.connecttonewobject('word.application') <> 0 then return 0
//	lb_2k3 = (left(lole_word.version, 2) = '11')
//	lole_word.disconnectobject()
//	destroy lole_word
	
	gf_pat2excel(ll_patid,ll_contactid,ll_phase)
	openwithparm(w_lettername,s_corr,w_principal)
//	w_word.title = "Corps de la lettre"
else
	// Copie de la macro de TPL vers lettre type, pour éviter les erreurs de versions de macro //
//	lole_word = create oleobject
//	
//	if lole_word.connecttonewobject('word.application') <> 0 then return 0
	
//	lb_2k3 = (left(lole_word.version, 2) = '11')
//	lole_word.documents.open(is_corrpath + '\' + s_corr.letter)
//	lole_word.activedocument.range.copy()
//	lole_word.activedocument.close(0)
//	lole_word.documents.open('c:\ii4net\orthotek\tpl')
//	lole_word.activedocument.range.paste()
//	lole_word.activedocument.saveas(is_corrpath + '\' + s_corr.letter)
//	lole_word.activedocument.close(0)
//	lole_word.quit()
//	lole_word.disconnectobject()
//	destroy lole_word
	
	gf_pat2excel(ll_patid,ll_contactid,ll_phase)
	
	messagebox("wordpath",is_wordpath)
	messagebox("corrpath",is_corrpath)
	messagebox("letter",s_corr.letter)
	messagebox("wordpath",'"' + is_wordpath + '" "' + is_corrpath + '\' + s_corr.letter + '"')
	
	Run('"' + is_wordpath + '" "' + is_corrpath + '\' + s_corr.letter + '"')
//	ancien code
//	opensheetwithparm(w_word,s_corr,w_principal,2,layered!)
//	w_word.title = "Corps de la lettre"
end if
end event

type st_2 from statictext within w_corrletters
integer y = 148
integer width = 1211
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
string text = "Correspondance avec les patients"
boolean focusrectangle = false
end type

type st_title from statictext within w_corrletters
integer x = 9
integer width = 1518
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
string text = "Créer / Éditer des lettres types"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Correspondences"
end if
end event

type lb_files from listbox within w_corrletters
integer y = 224
integer width = 1806
integer height = 1676
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

event doubleclicked;cb_open.event clicked()

/////////////////////////////////////////////////////
////
//// Par			: Eric Vezina ing.
//// Date			:
//// Description	: Une structure contenant les informations suivantes
////					  est passé à la fenêtre w_word.
////
////	PatId : patient_id
//// Flag	: r (mode lecture seulement)
////			  w (mode lecture et écriture)
//// Mode	: t (mode edition du template)
////			: l (mode création de lettre patient)
////
/////////////////////////////////////////////////////
//
//long ll_contactid[]
//long ll_patid[]
//long ll_phase[]
//oleObject lole_word
//s_corrletter s_corr
//s_corr.patid = il_patid
//s_corr.letter = lb_files.selecteditem()
//s_corr.flag = 'w'
//s_corr.mode = 't'
//boolean lb_2k3
//
//select id_contact into :ll_contactid[1] from patient where patient_id = :il_patid;
//ll_patid[1] = il_patid
//ll_phase[1] = 1
//
//if s_corr.letter = '' then
//   error_type(125)
//elseif s_corr.letter = 'NEW' or s_corr.letter = 'NOUVELLE' then
////	lole_word = create oleobject
////	
////	if lole_word.connecttonewobject('word.application') <> 0 then return 0
////	lb_2k3 = (left(lole_word.version, 2) = '11')
////	lole_word.disconnectobject()
////	destroy lole_word
//	gf_pat2excel(ll_phase,ll_contactid,ll_phase)
//	openwithparm(w_lettername,s_corr,w_principal)
////	w_word.title = "Corps de la lettre"
//else
//	// Copie de la macro de TPL vers lettre type, pour éviter les erreurs de versions de macro //
////	lole_word = create oleobject
////	if lole_word.connecttonewobject('word.application') <> 0 then return 0
////	lb_2k3 = (left(lole_word.version, 2) = '11')
////	lole_word.documents.open(is_corrpath + '\' + s_corr.letter)
////	lole_word.activedocument.range.copy()
////	lole_word.activedocument.close(0)
////	lole_word.documents.open('c:\ii4net\orthotek\tpl')
////	lole_word.activedocument.range.paste()
////	lole_word.activedocument.saveas(is_corrpath + '\' + s_corr.letter)
////	lole_word.activedocument.close(0)
////	lole_word.quit()
////	lole_word.disconnectobject()	
////	destroy lole_word
//	gf_pat2excel(ll_patid,ll_contactid,ll_phase)
//	Run('"' + is_wordpath + '" "' + s_corr.letter + '"')
////	ancien code
////	opensheetwithparm(w_word,s_corr,w_principal,2,layered!)
////	w_word.title = "Corps de la lettre"
//end if
end event

type cb_close from commandbutton within w_corrletters
integer x = 2958
integer y = 1912
integer width = 654
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

