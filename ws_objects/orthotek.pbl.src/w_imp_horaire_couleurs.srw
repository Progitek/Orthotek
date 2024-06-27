$PBExportHeader$w_imp_horaire_couleurs.srw
forward
global type w_imp_horaire_couleurs from window
end type
type dw_color_name from u_dw within w_imp_horaire_couleurs
end type
type ddplb_fond from dropdownpicturelistbox within w_imp_horaire_couleurs
end type
type st_1 from statictext within w_imp_horaire_couleurs
end type
type cb_close from commandbutton within w_imp_horaire_couleurs
end type
end forward

global type w_imp_horaire_couleurs from window
integer x = 823
integer y = 360
integer width = 1545
integer height = 788
boolean titlebar = true
string title = "Choix des couleurs et des symboles"
windowtype windowtype = response!
long backcolor = 79741120
string pointer = "Arrow!"
boolean center = true
dw_color_name dw_color_name
ddplb_fond ddplb_fond
st_1 st_1
cb_close cb_close
end type
global w_imp_horaire_couleurs w_imp_horaire_couleurs

type variables
int changement
end variables

on w_imp_horaire_couleurs.create
this.dw_color_name=create dw_color_name
this.ddplb_fond=create ddplb_fond
this.st_1=create st_1
this.cb_close=create cb_close
this.Control[]={this.dw_color_name,&
this.ddplb_fond,&
this.st_1,&
this.cb_close}
end on

on w_imp_horaire_couleurs.destroy
destroy(this.dw_color_name)
destroy(this.ddplb_fond)
destroy(this.st_1)
destroy(this.cb_close)
end on

event open;ddplb_fond.text = "blanc"
end event

type dw_color_name from u_dw within w_imp_horaire_couleurs
integer y = 172
integer width = 1522
integer height = 380
integer taborder = 10
string dataobject = "dddw_color_name"
end type

event constructor;call super::constructor;This.SetTransObject(SQLCA)
This.Retrieve()

THIS.of_SetRowSelect(TRUE)
this.inv_rowselect.of_setstyle(1)
end event

type ddplb_fond from dropdownpicturelistbox within w_imp_horaire_couleurs
boolean visible = false
integer x = 3269
integer y = 472
integer width = 530
integer height = 748
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"bleu","mauve","rouge","blanc","jaune","grisbleu","bleupale","brun","turquoise","gris","vert","orange","rose"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2,3,4,5,6,7,8,9,10,11,12,13}
string picturename[] = {"C:\ii4net\orthotek\images\bleu.bmp","C:\ii4net\orthotek\images\mauve.bmp","C:\ii4net\orthotek\images\rouge.bmp","C:\ii4net\orthotek\images\blanc.bmp","C:\ii4net\orthotek\images\jaune.bmp","C:\ii4net\orthotek\images\grisbleu.bmp","C:\ii4net\orthotek\images\bleupale.bmp","C:\ii4net\orthotek\images\brun.bmp","C:\ii4net\orthotek\images\turquoise.bmp","C:\ii4net\orthotek\images\gris.bmp","C:\ii4net\orthotek\images\vert.bmp","C:\ii4net\orthotek\images\orange.bmp","C:\ii4net\orthotek\images\rose.bmp"}
long picturemaskcolor = 553648127
end type

type st_1 from statictext within w_imp_horaire_couleurs
integer y = 36
integer width = 1536
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Quelle(s) couleur(s) désirez-vous imprimer?"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_1.Text = "Which color(s) do you wish to print?"
end if
end event

type cb_close from commandbutton within w_imp_horaire_couleurs
integer y = 588
integer width = 1522
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer et imprimer"
end type

event clicked;long		ll_cpt, ll_rendu = 1, ll_couleur[]
n_cst_parm_imp_couleur	lnv_parm


FOR ll_cpt = 1 TO dw_color_name.RowCount()
	IF dw_color_name.IsSelected(ll_cpt) = TRUE THEN
		ll_couleur[ll_rendu] = dw_color_name.object.color[ll_cpt]
		ll_rendu++
	END IF
END FOR

lnv_parm.il_couleur = ll_couleur

closewithreturn(parent, lnv_parm)
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close and print"
end if
end event

