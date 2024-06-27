$PBExportHeader$w_newphrasegroupe.srw
forward
global type w_newphrasegroupe from w_response
end type
type st_changer from statictext within w_newphrasegroupe
end type
type st_display from statictext within w_newphrasegroupe
end type
type st_couleur from statictext within w_newphrasegroupe
end type
type uo_toolbar2 from u_cst_toolbarstrip within w_newphrasegroupe
end type
type uo_toolbar1 from u_cst_toolbarstrip within w_newphrasegroupe
end type
type st_title from statictext within w_newphrasegroupe
end type
type sle_groupe from singlelineedit within w_newphrasegroupe
end type
type rr_1 from roundrectangle within w_newphrasegroupe
end type
end forward

global type w_newphrasegroupe from w_response
integer width = 1554
integer height = 608
boolean titlebar = false
boolean controlmenu = false
boolean center = true
st_changer st_changer
st_display st_display
st_couleur st_couleur
uo_toolbar2 uo_toolbar2
uo_toolbar1 uo_toolbar1
st_title st_title
sle_groupe sle_groupe
rr_1 rr_1
end type
global w_newphrasegroupe w_newphrasegroupe

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();uo_toolbar1.of_settheme("classic")
uo_toolbar1.of_DisplayBorder(true)
uo_toolbar2.of_settheme("classic")
uo_toolbar2.of_DisplayBorder(true)

if gs_langue = 'an' then
	st_title.text = "Specify the title of the new sentences category"
	st_changer.text = "Choose..."
	st_couleur.text = "Choose an associated color:"
	uo_toolbar1.of_AddItem("Apply", "C:\ii4net\orthotek\images\ok.gif")
	uo_toolbar2.of_AddItem("Cancel", "C:\ii4net\orthotek\images\annuler.gif")
else
	uo_toolbar1.of_AddItem("Appliquer", "C:\ii4net\orthotek\images\ok.gif")
	uo_toolbar2.of_AddItem("Annuler", "C:\ii4net\orthotek\images\annuler.gif")
end if

uo_toolbar1.of_displaytext(true)
uo_toolbar2.of_displaytext(true)
end subroutine

on w_newphrasegroupe.create
int iCurrent
call super::create
this.st_changer=create st_changer
this.st_display=create st_display
this.st_couleur=create st_couleur
this.uo_toolbar2=create uo_toolbar2
this.uo_toolbar1=create uo_toolbar1
this.st_title=create st_title
this.sle_groupe=create sle_groupe
this.rr_1=create rr_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_changer
this.Control[iCurrent+2]=this.st_display
this.Control[iCurrent+3]=this.st_couleur
this.Control[iCurrent+4]=this.uo_toolbar2
this.Control[iCurrent+5]=this.uo_toolbar1
this.Control[iCurrent+6]=this.st_title
this.Control[iCurrent+7]=this.sle_groupe
this.Control[iCurrent+8]=this.rr_1
end on

on w_newphrasegroupe.destroy
call super::destroy
destroy(this.st_changer)
destroy(this.st_display)
destroy(this.st_couleur)
destroy(this.uo_toolbar2)
destroy(this.uo_toolbar1)
destroy(this.st_title)
destroy(this.sle_groupe)
destroy(this.rr_1)
end on

type st_changer from statictext within w_newphrasegroupe
integer x = 1221
integer y = 324
integer width = 265
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 15780518
string text = "Choisir..."
boolean focusrectangle = false
end type

event clicked;long		ll_color, ll_retour
ll_color = st_display.backcolor
IF Isnull(ll_color) THEN ll_color = 0

ll_retour = ChooseColor ( ll_color) 
if ll_retour > 0 then
	st_display.backcolor = ll_color
END IF
end event

type st_display from statictext within w_newphrasegroupe
integer x = 923
integer y = 300
integer width = 274
integer height = 116
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
boolean focusrectangle = false
end type

type st_couleur from statictext within w_newphrasegroupe
integer x = 37
integer y = 324
integer width = 1362
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Choisissez une couleur associée:"
boolean focusrectangle = false
end type

type uo_toolbar2 from u_cst_toolbarstrip within w_newphrasegroupe
integer x = 823
integer y = 484
integer width = 709
integer taborder = 20
end type

on uo_toolbar2.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("couleur groupe phrase", "")
closewithreturn(parent,"")
end event

type uo_toolbar1 from u_cst_toolbarstrip within w_newphrasegroupe
integer x = 14
integer y = 484
integer width = 709
integer taborder = 20
end type

on uo_toolbar1.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("couleur groupe phrase", string(st_display.backcolor))
closewithreturn(parent,sle_groupe.text)
end event

type st_title from statictext within w_newphrasegroupe
integer x = 37
integer y = 56
integer width = 1367
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Donnez un titre à la nouvelle catégorie de phrases :"
boolean focusrectangle = false
end type

type sle_groupe from singlelineedit within w_newphrasegroupe
integer x = 32
integer y = 148
integer width = 1449
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

type rr_1 from roundrectangle within w_newphrasegroupe
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15780518
integer x = 9
integer y = 20
integer width = 1522
integer height = 436
integer cornerheight = 40
integer cornerwidth = 46
end type

