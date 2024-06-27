$PBExportHeader$w_horaire_couleurs.srw
forward
global type w_horaire_couleurs from window
end type
type ddplb_fond from dropdownpicturelistbox within w_horaire_couleurs
end type
type dw_nom_ortho from u_dw within w_horaire_couleurs
end type
type st_2 from statictext within w_horaire_couleurs
end type
type st_1 from statictext within w_horaire_couleurs
end type
type cb_update from commandbutton within w_horaire_couleurs
end type
type cb_close from commandbutton within w_horaire_couleurs
end type
type rb_vert3 from radiobutton within w_horaire_couleurs
end type
type rb_vert2 from radiobutton within w_horaire_couleurs
end type
type rb_vert1 from radiobutton within w_horaire_couleurs
end type
type rb_bleu3 from radiobutton within w_horaire_couleurs
end type
type rb_bleu2 from radiobutton within w_horaire_couleurs
end type
type rb_bleu1 from radiobutton within w_horaire_couleurs
end type
type rb_rouge3 from radiobutton within w_horaire_couleurs
end type
type rb_rouge2 from radiobutton within w_horaire_couleurs
end type
type rb_rouge1 from radiobutton within w_horaire_couleurs
end type
type gb_symbole_2 from groupbox within w_horaire_couleurs
end type
type gb_symbole_3 from groupbox within w_horaire_couleurs
end type
type gb_symbole_1 from groupbox within w_horaire_couleurs
end type
type dw_horaire_couleurs from u_dw within w_horaire_couleurs
end type
end forward

global type w_horaire_couleurs from window
integer x = 823
integer y = 360
integer width = 2135
integer height = 900
boolean titlebar = true
string title = "Choix des couleurs et des symboles"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
ddplb_fond ddplb_fond
dw_nom_ortho dw_nom_ortho
st_2 st_2
st_1 st_1
cb_update cb_update
cb_close cb_close
rb_vert3 rb_vert3
rb_vert2 rb_vert2
rb_vert1 rb_vert1
rb_bleu3 rb_bleu3
rb_bleu2 rb_bleu2
rb_bleu1 rb_bleu1
rb_rouge3 rb_rouge3
rb_rouge2 rb_rouge2
rb_rouge1 rb_rouge1
gb_symbole_2 gb_symbole_2
gb_symbole_3 gb_symbole_3
gb_symbole_1 gb_symbole_1
dw_horaire_couleurs dw_horaire_couleurs
end type
global w_horaire_couleurs w_horaire_couleurs

type variables
int changement
end variables

forward prototypes
public subroutine couleur_fond (string fond)
public subroutine couleurs ()
public subroutine select_fond ()
public subroutine coche ()
public subroutine sauve ()
end prototypes

public subroutine couleur_fond (string fond);choose case fond
	case "bleu"
		dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleurs_fond_horaire",rgb(10,146,245))
	case "mauve"
		dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleurs_fond_horaire",rgb(255,13,255))
	case "rouge"
		dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleurs_fond_horaire",rgb(255,0,0))
	case "blanc"
		dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleurs_fond_horaire",rgb(255,255,255))
	case "jaune"
		dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleurs_fond_horaire",rgb(255,255,0))
	case "grisbleu"
		dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleurs_fond_horaire",rgb(152,169,168))
	case "orange"
		dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleurs_fond_horaire",rgb(255,128,64))
	case "vert"
		dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleurs_fond_horaire",rgb(0,255,0))
end choose
end subroutine

public subroutine couleurs ();dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleur_1","255, 0, 128")




end subroutine

public subroutine select_fond ();choose case dw_horaire_couleurs.GetItemNumber(dw_horaire_couleurs.GetRow(),"couleurs_fond_horaire")
	case rgb(10,146,245)
		ddplb_fond.text = "bleu"
	case rgb(255,13,255)
		ddplb_fond.text = "mauve"
	case rgb(255,0,0)
		ddplb_fond.text = "rouge"
	case rgb(255,255,255)
		ddplb_fond.text = "blanc"
	case rgb(255,255,0)
		ddplb_fond.text = "jaune"
	case rgb(152,169,168)
		ddplb_fond.text = "grisbleu"
	case rgb(255,128,64)
		ddplb_fond.text = "orange"
	case rgb(0,255,0)
		ddplb_fond.text = "vert"
end choose
end subroutine

public subroutine coche ();long enr
enr = dw_horaire_couleurs.getrow()
if enr > 0 then
	if dw_horaire_couleurs.getitemnumber(enr,"couleur_1") = RGB(0,0,255) then
		rb_bleu1.checked = true
	end if
	if dw_horaire_couleurs.getitemnumber(enr,"couleur_2") = RGB(0,0,255) then
		rb_bleu2.checked = true
	end if
	if dw_horaire_couleurs.getitemnumber(enr,"couleur_3") = RGB(0,0,255) then
		rb_bleu3.checked = true
	end if
	if dw_horaire_couleurs.getitemnumber(enr,"couleur_1") = RGB(255,0,0) then
		rb_rouge1.checked = true
	end if
	if dw_horaire_couleurs.getitemnumber(enr,"couleur_2") = RGB(255,0,0) then
		rb_rouge2.checked = true
	end if
	if dw_horaire_couleurs.getitemnumber(enr,"couleur_3") = RGB(255,0,0) then
		rb_rouge3.checked = true
	end if
	if dw_horaire_couleurs.getitemnumber(enr,"couleur_1") = RGB(255,255,0) then
		rb_vert1.checked = true
	end if
	if dw_horaire_couleurs.getitemnumber(enr,"couleur_2") = RGB(255,255,0) then
		rb_vert2.checked = true
	end if
	if dw_horaire_couleurs.getitemnumber(enr,"couleur_3") = RGB(255,255,0) then
		rb_vert3.checked = true
	end if
end if
end subroutine

public subroutine sauve ();couleur_fond(ddplb_fond.text)
if dw_horaire_couleurs.Update() = 1 then
	commit using SQLCA;
	if IsValid(w_horaire_semaine) then
		w_horaire_semaine.affichage_creation()
	end if
	if IsValid(w_horaire) then
		w_horaire.affichage_creation()
	end if
	
	changement=0
else
	rollback using SQLCA;
	messagebox("Information","Aucune modification n'a été enregistrée!",information!)
end if
end subroutine

on w_horaire_couleurs.create
this.ddplb_fond=create ddplb_fond
this.dw_nom_ortho=create dw_nom_ortho
this.st_2=create st_2
this.st_1=create st_1
this.cb_update=create cb_update
this.cb_close=create cb_close
this.rb_vert3=create rb_vert3
this.rb_vert2=create rb_vert2
this.rb_vert1=create rb_vert1
this.rb_bleu3=create rb_bleu3
this.rb_bleu2=create rb_bleu2
this.rb_bleu1=create rb_bleu1
this.rb_rouge3=create rb_rouge3
this.rb_rouge2=create rb_rouge2
this.rb_rouge1=create rb_rouge1
this.gb_symbole_2=create gb_symbole_2
this.gb_symbole_3=create gb_symbole_3
this.gb_symbole_1=create gb_symbole_1
this.dw_horaire_couleurs=create dw_horaire_couleurs
this.Control[]={this.ddplb_fond,&
this.dw_nom_ortho,&
this.st_2,&
this.st_1,&
this.cb_update,&
this.cb_close,&
this.rb_vert3,&
this.rb_vert2,&
this.rb_vert1,&
this.rb_bleu3,&
this.rb_bleu2,&
this.rb_bleu1,&
this.rb_rouge3,&
this.rb_rouge2,&
this.rb_rouge1,&
this.gb_symbole_2,&
this.gb_symbole_3,&
this.gb_symbole_1,&
this.dw_horaire_couleurs}
end on

on w_horaire_couleurs.destroy
destroy(this.ddplb_fond)
destroy(this.dw_nom_ortho)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_update)
destroy(this.cb_close)
destroy(this.rb_vert3)
destroy(this.rb_vert2)
destroy(this.rb_vert1)
destroy(this.rb_bleu3)
destroy(this.rb_bleu2)
destroy(this.rb_bleu1)
destroy(this.rb_rouge3)
destroy(this.rb_rouge2)
destroy(this.rb_rouge1)
destroy(this.gb_symbole_2)
destroy(this.gb_symbole_3)
destroy(this.gb_symbole_1)
destroy(this.dw_horaire_couleurs)
end on

event open;int watch, enr
dw_nom_ortho.retrieve(v_no_ortho)
dw_horaire_couleurs.retrieve(v_no_ortho)
watch = dw_horaire_couleurs.rowcount()
if watch = 0 then
	enr = dw_horaire_couleurs.insertrow(0)
	dw_horaire_couleurs.setitem(enr,"ortho_id",v_no_ortho)
	dw_horaire_couleurs.setitem(enr,"blanc",65536*255+256*255+255)
	dw_horaire_couleurs.setitem(enr,"couleurs_fond_horaire",rgb(0,255,0))
	ddplb_fond.text = "vert"
end if
select_fond()
coche()
dw_horaire_couleurs.setfocus()
end event

type ddplb_fond from dropdownpicturelistbox within w_horaire_couleurs
integer x = 1746
integer y = 28
integer width = 375
integer height = 660
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"bleu","mauve","rouge","blanc","jaune","grisbleu","orange","vert"}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {1,2,3,4,5,6,7,8}
string picturename[] = {"C:\ii4net\orthotek\images\bleu.bmp","C:\ii4net\orthotek\images\mauve.bmp","C:\ii4net\orthotek\images\rouge.bmp","C:\ii4net\orthotek\images\blanc.bmp","C:\ii4net\orthotek\images\jaune.bmp","C:\ii4net\orthotek\images\grisbleu.bmp","C:\ii4net\orthotek\images\orange.bmp","C:\ii4net\orthotek\images\vert.bmp"}
long picturemaskcolor = 553648127
end type

event selectionchanged;changement = 1
end event

type dw_nom_ortho from u_dw within w_horaire_couleurs
integer x = 654
integer y = 28
integer width = 658
integer height = 80
integer taborder = 10
string dataobject = "d_nom_ortho"
boolean border = false
end type

event constructor;dw_nom_ortho.SetTransObject(SQLCA)
end event

type st_2 from statictext within w_horaire_couleurs
integer x = 14
integer y = 36
integer width = 645
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Palette de couleur pour:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_2.Text = "Color box"
end if
end event

type st_1 from statictext within w_horaire_couleurs
integer x = 1317
integer y = 32
integer width = 430
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Couleur de fond:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_1.Text = "Base color"
end if
end event

type cb_update from commandbutton within w_horaire_couleurs
integer x = 14
integer y = 692
integer width = 1038
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarde"
end type

event clicked;sauve()
end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Save"
end if
end event

type cb_close from commandbutton within w_horaire_couleurs
integer x = 1051
integer y = 692
integer width = 1061
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;if changement =1 then 
	if messagebox("Mise-à-jour","Voulez-vous enregistrer les modifications?",Question!,YesNo!) =1 then
		sauve()
	end if
end if
close (parent)


end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type rb_vert3 from radiobutton within w_horaire_couleurs
integer x = 1696
integer y = 552
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Jaune"
boolean lefttext = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleur_3",rgb(255,255,0))
changement = 1
end event

event constructor;if v_langue = 'an' then
	rb_vert3.Text = "Yellow"
end if
end event

type rb_vert2 from radiobutton within w_horaire_couleurs
integer x = 1696
integer y = 376
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Jaune"
boolean lefttext = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleur_2",rgb(255,255,0))
changement = 1
end event

event constructor;if v_langue = 'an' then
	rb_vert2.Text = "Yellow"
end if
end event

type rb_vert1 from radiobutton within w_horaire_couleurs
integer x = 1696
integer y = 188
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Jaune"
boolean lefttext = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleur_1",rgb(255,255,0))
changement = 1
end event

event constructor;if v_langue = 'an' then
	rb_vert1.Text = "Yellow"
end if
end event

type rb_bleu3 from radiobutton within w_horaire_couleurs
integer x = 754
integer y = 552
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bleu"
boolean lefttext = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleur_3",RGB(0,0,255))
changement = 1
end event

event constructor;if v_langue = 'an' then
	rb_bleu3.Text = "Blue"
end if
end event

type rb_bleu2 from radiobutton within w_horaire_couleurs
integer x = 754
integer y = 376
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bleu"
boolean lefttext = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleur_2",RGB(0,0,255))
changement = 1
end event

event constructor;if v_langue = 'an' then
	rb_bleu2.Text = "Blue"
end if
end event

type rb_bleu1 from radiobutton within w_horaire_couleurs
string tag = "Bleu"
integer x = 754
integer y = 188
integer width = 247
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bleu"
boolean lefttext = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleur_1",RGB(0,0,255))
changement = 1
end event

event constructor;if v_langue = 'an' then
	rb_bleu1.Text = "Blue"
end if
end event

type rb_rouge3 from radiobutton within w_horaire_couleurs
integer x = 1225
integer y = 552
integer width = 251
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rouge"
boolean lefttext = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleur_3",rgb(255,0,0))
changement = 1
end event

event constructor;if v_langue = 'an' then
	rb_rouge3.Text = "Blue"
end if
end event

type rb_rouge2 from radiobutton within w_horaire_couleurs
integer x = 1225
integer y = 380
integer width = 251
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rouge"
boolean lefttext = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleur_2",rgb(255,0,0))
changement = 1
end event

event constructor;if v_langue = 'an' then
	rb_rouge2.Text = "Red"
end if
end event

type rb_rouge1 from radiobutton within w_horaire_couleurs
integer x = 1225
integer y = 188
integer width = 251
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rouge"
boolean lefttext = true
borderstyle borderstyle = stylelowered!
end type

event clicked;dw_horaire_couleurs.setitem(dw_horaire_couleurs.getrow(),"couleur_1",rgb(255,0,0))
changement = 1
end event

event constructor;if v_langue = 'an' then
	rb_rouge1.Text = "Red"
end if
end event

type gb_symbole_2 from groupbox within w_horaire_couleurs
integer x = 709
integer y = 304
integer width = 1403
integer height = 172
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " "
borderstyle borderstyle = stylelowered!
end type

type gb_symbole_3 from groupbox within w_horaire_couleurs
integer x = 709
integer y = 488
integer width = 1403
integer height = 172
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = " "
borderstyle borderstyle = stylelowered!
end type

type gb_symbole_1 from groupbox within w_horaire_couleurs
integer x = 709
integer y = 120
integer width = 1403
integer height = 172
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = stylelowered!
end type

type dw_horaire_couleurs from u_dw within w_horaire_couleurs
integer x = 96
integer y = 188
integer width = 544
integer height = 452
integer taborder = 20
string dataobject = "d_horaire_couleurs"
boolean border = false
boolean livescroll = true
end type

event constructor;dw_horaire_couleurs.SetTransObject(SQLCA)
if v_langue = 'an' then
	dw_horaire_couleurs.object.symbole_1_t.Text = "Symbol 1"
	dw_horaire_couleurs.object.symbole_2_t.Text = "Symbol 2"
	dw_horaire_couleurs.object.symbole_3_t.Text = "Symbol 3"
end if
end event

event editchanged;changement = 1
end event

event itemchanged;changement = 1
end event

