$PBExportHeader$w_optionpers.srw
forward
global type w_optionpers from w_child
end type
type cbx_padsign from checkbox within w_optionpers
end type
type pb_openfile from picturebutton within w_optionpers
end type
type sle_cheminword from singlelineedit within w_optionpers
end type
type st_1 from statictext within w_optionpers
end type
type cb_save from commandbutton within w_optionpers
end type
type cb_close from commandbutton within w_optionpers
end type
end forward

global type w_optionpers from w_child
integer x = 214
integer y = 221
integer width = 4640
integer height = 2600
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
cbx_padsign cbx_padsign
pb_openfile pb_openfile
sle_cheminword sle_cheminword
st_1 st_1
cb_save cb_save
cb_close cb_close
end type
global w_optionpers w_optionpers

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();if v_langue = 'an' then
	cb_close.text = "Close"
	cb_save.text  = "Save"
end if
end subroutine

on w_optionpers.create
int iCurrent
call super::create
this.cbx_padsign=create cbx_padsign
this.pb_openfile=create pb_openfile
this.sle_cheminword=create sle_cheminword
this.st_1=create st_1
this.cb_save=create cb_save
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_padsign
this.Control[iCurrent+2]=this.pb_openfile
this.Control[iCurrent+3]=this.sle_cheminword
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_save
this.Control[iCurrent+6]=this.cb_close
end on

on w_optionpers.destroy
call super::destroy
destroy(this.cbx_padsign)
destroy(this.pb_openfile)
destroy(this.sle_cheminword)
destroy(this.st_1)
destroy(this.cb_save)
destroy(this.cb_close)
end on

event open;call super::open;string ls_cheminword
string ls_valeur_ini

ls_cheminword = ProfileString("c:\ii4net\orthotek\ortho.ini", "Correspondance", "cheminword", "")
if ls_cheminword = "" then
	select wordpath into :ls_cheminword from t_options;
end if
sle_cheminword.text = ls_cheminword

ls_valeur_ini = WordCap(profileString("c:\ii4net\orthotek\ortho.ini","Config", "Padsign", "No"))
cbx_padsign.checked = (ls_valeur_ini = 'Yes')


end event

type cbx_padsign from checkbox within w_optionpers
integer x = 23
integer y = 208
integer width = 919
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Présence du ~"pad~" de signature"
end type

type pb_openfile from picturebutton within w_optionpers
integer x = 1888
integer y = 80
integer width = 114
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\foldopen.bmp"
alignment htextalign = left!
end type

event clicked;int li_rc
string ls_path, ls_file

ls_path = sle_cheminword.text

li_rc = GetFileSaveName ( "Select File", ls_path, ls_file, "DOC", "All Files (*.*),*.*" , ls_path, 32770)

IF li_rc = 1 Then

   sle_cheminword.text = ls_path

End If
end event

type sle_cheminword from singlelineedit within w_optionpers
integer x = 14
integer y = 84
integer width = 1856
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_optionpers
integer x = 9
integer y = 8
integer width = 530
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Chemin de word: "
boolean focusrectangle = false
end type

type cb_save from commandbutton within w_optionpers
integer x = 5
integer y = 2476
integer width = 878
integer height = 116
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder"
end type

event clicked;string ls_valeur

ls_valeur = sle_cheminword.text 
setProfileString (gnv_app.of_getAppIniFile(), "Correspondance", "cheminword", ls_valeur)

if cbx_padsign.checked then ls_valeur = "Yes" else ls_valeur = "No"
SetProfileString(gnv_app.of_getAppIniFile(), "Config", "Padsign", ls_valeur)
end event

type cb_close from commandbutton within w_optionpers
integer x = 3749
integer y = 2476
integer width = 878
integer height = 116
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

