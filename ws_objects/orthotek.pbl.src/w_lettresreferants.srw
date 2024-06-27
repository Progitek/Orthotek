$PBExportHeader$w_lettresreferants.srw
forward
global type w_lettresreferants from w_child
end type
type dw_lettresreferants_sel from u_dw within w_lettresreferants
end type
type st_refsel from statictext within w_lettresreferants
end type
type st_3 from statictext within w_lettresreferants
end type
type st_doc from statictext within w_lettresreferants
end type
type sle_recherche from singlelineedit within w_lettresreferants
end type
type st_corr from statictext within w_lettresreferants
end type
type lb_files from listbox within w_lettresreferants
end type
type sle_word from singlelineedit within w_lettresreferants
end type
type cb_open_word from commandbutton within w_lettresreferants
end type
type dw_lettresreferants from u_dw within w_lettresreferants
end type
type st_status from statictext within w_lettresreferants
end type
type cb_close from commandbutton within w_lettresreferants
end type
end forward

global type w_lettresreferants from w_child
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
dw_lettresreferants_sel dw_lettresreferants_sel
st_refsel st_refsel
st_3 st_3
st_doc st_doc
sle_recherche sle_recherche
st_corr st_corr
lb_files lb_files
sle_word sle_word
cb_open_word cb_open_word
dw_lettresreferants dw_lettresreferants
st_status st_status
cb_close cb_close
end type
global w_lettresreferants w_lettresreferants

type prototypes


end prototypes

type variables
integer pat_id[]
int indice = 0
string vfocus
private string is_corrpath
end variables

forward prototypes
public function string of_killfilter (integer patient_id)
public function string of_madefilter (integer patient_id)
public subroutine sup_ligne ()
public subroutine ajout_ligne ()
end prototypes

public function string of_killfilter (integer patient_id);string is_filter = ''
int i

//pat_id[indice] = patient_id

for i = 1 to indice
	if pat_id[i] <> patient_id then
	   if is_filter = '' then
	      is_filter = "patient_patient_id = " + string(pat_id[i])
      else
		   is_filter += " or "
		   is_filter += "patient_patient_id = " + string(pat_id[i])
      end if
	else
		pat_id[i] = 0
	end if
next

return is_filter

end function

public function string of_madefilter (integer patient_id);string is_filter = ''
int i

indice = indice + 1
pat_id[indice] = patient_id

for i = 1 to indice
   if is_filter = '' then
	   is_filter = "patient_patient_id = " + string(pat_id[i])
   else
		is_filter += " or "
		is_filter += "patient_patient_id = " + string(pat_id[i])
   end if
next

return is_filter

end function

public subroutine sup_ligne ();dw_lettresreferants_sel.deleterow(dw_lettresreferants_sel.getrow())
end subroutine

public subroutine ajout_ligne ();long ll_id, ll_row, ll_newrow
int i
boolean lb_presence = false

ll_row = dw_lettresreferants.getrow()
ll_id = dw_lettresreferants.getitemnumber(ll_row,'t_referents_id')

FOR i = 1 TO dw_lettresreferants_sel.rowcount()
   if ll_id = dw_lettresreferants_sel.getitemnumber(i,'ref_id') then
		lb_presence = true
		exit
	end if
NEXT

if lb_presence = false then
   ll_newrow = dw_lettresreferants_sel.insertrow(0)
   dw_lettresreferants_sel.scrolltorow(ll_newrow)
	dw_lettresreferants_sel.setitem(ll_newrow,'ref_id',ll_id)
	dw_lettresreferants_sel.setitem(ll_newrow,'ref_adresse',dw_lettresreferants.getitemstring(ll_row,'t_referents_ref_adresse'))
	dw_lettresreferants_sel.setitem(ll_newrow,'ref_ville',dw_lettresreferants.getitemstring(ll_row,'t_referents_ref_ville'))
	dw_lettresreferants_sel.setitem(ll_newrow,'ref_sexe' ,dw_lettresreferants.getitemstring(ll_row,'t_referents_ref_sexe'))
	dw_lettresreferants_sel.setitem(ll_newrow,'ref_province' ,dw_lettresreferants.getitemstring(ll_row,'t_referents_ref_province'))
	dw_lettresreferants_sel.setitem(ll_newrow,'ref_zip' ,dw_lettresreferants.getitemstring(ll_row,'t_referents_ref_zip'))
	dw_lettresreferants_sel.setitem(ll_newrow,'ref_tel_bur' ,dw_lettresreferants.getitemstring(ll_row,'t_referents_ref_tel_bur'))
	dw_lettresreferants_sel.setitem(ll_newrow,'ref_tel_fax' ,dw_lettresreferants.getitemstring(ll_row,'t_referents_ref_tel_fax'))
	dw_lettresreferants_sel.setitem(ll_newrow,'ref_email' ,dw_lettresreferants.getitemstring(ll_row,'t_referents_ref_email'))
	dw_lettresreferants_sel.setitem(ll_newrow,'ref_nom_complet' ,dw_lettresreferants.getitemstring(ll_row,'t_referents_ref_nom_complet'))
	dw_lettresreferants_sel.setitem(ll_newrow,'dr_nom_complet' ,dw_lettresreferants.getitemstring(ll_row,'ortho_id_dr_nom_complet'))
	dw_lettresreferants_sel.setitem(ll_newrow,'dr_ville_province_code_postale' ,dw_lettresreferants.getitemstring(ll_row,'ortho_id_dr_ville_province_code_postale'))
	dw_lettresreferants_sel.setitem(ll_newrow,'dr_tel_bur' ,dw_lettresreferants.getitemstring(ll_row,'ortho_id_dr_tel_bur'))
	dw_lettresreferants_sel.setitem(ll_newrow,'dr_adresse' ,dw_lettresreferants.getitemstring(ll_row,'ortho_id_dr_adresse'))
end if
end subroutine

on w_lettresreferants.create
int iCurrent
call super::create
this.dw_lettresreferants_sel=create dw_lettresreferants_sel
this.st_refsel=create st_refsel
this.st_3=create st_3
this.st_doc=create st_doc
this.sle_recherche=create sle_recherche
this.st_corr=create st_corr
this.lb_files=create lb_files
this.sle_word=create sle_word
this.cb_open_word=create cb_open_word
this.dw_lettresreferants=create dw_lettresreferants
this.st_status=create st_status
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_lettresreferants_sel
this.Control[iCurrent+2]=this.st_refsel
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_doc
this.Control[iCurrent+5]=this.sle_recherche
this.Control[iCurrent+6]=this.st_corr
this.Control[iCurrent+7]=this.lb_files
this.Control[iCurrent+8]=this.sle_word
this.Control[iCurrent+9]=this.cb_open_word
this.Control[iCurrent+10]=this.dw_lettresreferants
this.Control[iCurrent+11]=this.st_status
this.Control[iCurrent+12]=this.cb_close
end on

on w_lettresreferants.destroy
call super::destroy
destroy(this.dw_lettresreferants_sel)
destroy(this.st_refsel)
destroy(this.st_3)
destroy(this.st_doc)
destroy(this.sle_recherche)
destroy(this.st_corr)
destroy(this.lb_files)
destroy(this.sle_word)
destroy(this.cb_open_word)
destroy(this.dw_lettresreferants)
destroy(this.st_status)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

select corrpath into :is_corrpath from t_options where ortho_id = :v_no_ortho;
lb_files.DirList(is_corrpath, 0, st_status)
if v_langue = 'an' then
	lb_files.AddItem ('NEW')
else
	lb_files.AddItem ('NOUVELLE')
end if
end event

type dw_lettresreferants_sel from u_dw within w_lettresreferants
integer x = 1344
integer y = 108
integer width = 1243
integer height = 1788
integer taborder = 70
string dragicon = "C:\ii4net\orthotek\images\Distlstl.ico"
string title = "lettresreferantsel1"
string dataobject = "d_lettresreferantsel1"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event getfocus;vfocus = 'patient_sel'
end event

event losefocus;vfocus = 'none'
end event

event constructor;settransobject(SQLCA)
SetRowFocusIndicator(Hand!)

end event

event dragdrop;String is_filter
long patient_id

if vfocus = 'recherche_patient' then
	ajout_ligne()
end if


end event

event clicked;this.drag(begin!)
end event

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the error message
RETURN 1
end event

type st_refsel from statictext within w_lettresreferants
integer x = 1344
integer width = 987
integer height = 108
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Référents sélectionnés"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Selected patients"
end if
end event

type st_3 from statictext within w_lettresreferants
integer x = 2606
integer y = 1716
integer width = 928
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Emplacement des documents: "
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Directory of documents"
end if
end event

type st_doc from statictext within w_lettresreferants
integer x = 2610
integer width = 571
integer height = 108
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Documents"
boolean focusrectangle = false
end type

type sle_recherche from singlelineedit within w_lettresreferants
integer x = 32
integer y = 108
integer width = 1289
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 1090519039
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_dnom
int v_nb

ls_dnom = Trim(sle_recherche.text)+'%'
if Match(ls_dnom, "'") = true then
	v_nb = Pos (ls_dnom, "'")
	if v_nb > 0 then
		ls_dnom = Replace ( ls_dnom, v_nb, 1, "%" )
	end if
end if

dw_lettresreferants.setfilter("patient_nom like '"+upper(ls_dnom)+"'")
dw_lettresreferants.filter()


end event

type st_corr from statictext within w_lettresreferants
integer x = 32
integer width = 786
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
string text = "Correspondances"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Correspondences"
end if
end event

type lb_files from listbox within w_lettresreferants
integer x = 2610
integer y = 108
integer width = 992
integer height = 1588
integer taborder = 50
integer textsize = -10
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

type sle_word from singlelineedit within w_lettresreferants
boolean visible = false
integer x = 18
integer y = 1912
integer width = 1856
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_open_word from commandbutton within w_lettresreferants
integer x = 1897
integer y = 1912
integer width = 750
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "WORD"
end type

event clicked;string v_word,v_lettre,v_doc
int li_id, flag

if lb_files.selecteditem() = "" then
   error_type(125)
	flag = 0
else
	if dw_lettresreferants_sel.rowcount() = 0 then
	   if error_type(207) = 1 then
         flag = 1
		else
			flag = 0
		end if
	else
		flag = 1
   end if
end if
	
if flag = 1 then
   sle_word.visible = false
   select max(id) into :li_id from t_lettres;
   if sle_word.text <> '' then
	   if li_id > 0 then
		   update t_lettres set word = :sle_word.text where id = :li_id;
		   commit;
	   else
		   insert into t_lettres (word) values (:sle_word.text);
	   end if
   end if
   select word into :v_word from t_lettres where id = :li_id;
   if v_word = '' or isnull(v_word) = true then
	   sle_word.visible = true
	   sle_word.text = v_word
	   messagebox("Avertissement!","Donnez l'emplacement de word!")
	   sle_word.text = 'EXEMPLE: C:\Program Files\Microsoft Office\Office\WINWORD.EXE'
	   sle_word.SetFocus()
   else
	   if dw_lettresreferants_sel.SaveAs("c:\ii4net\orthotek\correspondances\patients.xls", EXCEL5!,True) <> 1 then
		   messagebox('Error répertoire introuvable!','c:\ii4net\orthotek\correspondances\...',stopsign!)
	   else
		   v_lettre = lb_files.SelectedItem()
		   if v_lettre <> '' and isnull(v_lettre) = false and v_lettre <> 'NOUVELLE' then
			   v_doc = v_word + ' ' + v_lettre
		   else
			   v_doc = v_word
		   end if
		   if run(v_doc,maximized!) <> 1 then
			   sle_word.visible = true
			   sle_word.text = v_word
			   error_type(56)
			   messagebox("Avertissement!","Donnez l'emplacement de word!")
			   sle_word.text = 'EXEMPLE: C:\Program Files\Microsoft Office\Office\WINWORD.EXE'
			   sle_word.SetFocus()
		   end if
	   end if
   end if
end if
end event

type dw_lettresreferants from u_dw within w_lettresreferants
integer x = 32
integer y = 232
integer width = 1289
integer height = 1664
integer taborder = 20
string dragicon = "C:\ii4net\orthotek\images\Distlstl.ico"
string title = "Lettre référant"
string dataobject = "d_lettresreferants"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
retrieve(v_no_ortho)
SetRowFocusIndicator(Hand!)

if v_langue = 'an' then
	this.object.t_1.text = "Nb. of patients:"
end if
end event

event clicked;drag(begin!)
end event

event getfocus;vfocus = 'recherche_patient'
end event

event losefocus;vfocus = 'none'
end event

event dragdrop;String is_filter
int patient_id

if vfocus = 'patient_sel' then
	dw_lettresreferants_sel.deleterow(dw_lettresreferants_sel.getrow())
end if
end event

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the error message
RETURN 1
end event

type st_status from statictext within w_lettresreferants
integer x = 2610
integer y = 1784
integer width = 992
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_lettresreferants
integer x = 2647
integer y = 1912
integer width = 955
integer height = 112
integer taborder = 30
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

