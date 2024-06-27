$PBExportHeader$w_choixcouleur.srw
forward
global type w_choixcouleur from window
end type
type st_c1 from statictext within w_choixcouleur
end type
type st_c2 from statictext within w_choixcouleur
end type
type st_c3 from statictext within w_choixcouleur
end type
type st_c4 from statictext within w_choixcouleur
end type
type st_c5 from statictext within w_choixcouleur
end type
type st_c6 from statictext within w_choixcouleur
end type
type st_c7 from statictext within w_choixcouleur
end type
type st_c8 from statictext within w_choixcouleur
end type
type st_c9 from statictext within w_choixcouleur
end type
type st_c10 from statictext within w_choixcouleur
end type
type st_c11 from statictext within w_choixcouleur
end type
type st_c12 from statictext within w_choixcouleur
end type
type st_c13 from statictext within w_choixcouleur
end type
type st_c14 from statictext within w_choixcouleur
end type
type st_c15 from statictext within w_choixcouleur
end type
type st_c16 from statictext within w_choixcouleur
end type
type st_c17 from statictext within w_choixcouleur
end type
type st_c18 from statictext within w_choixcouleur
end type
type st_c19 from statictext within w_choixcouleur
end type
type st_c20 from statictext within w_choixcouleur
end type
type st_c21 from statictext within w_choixcouleur
end type
type st_c22 from statictext within w_choixcouleur
end type
type st_c23 from statictext within w_choixcouleur
end type
type st_c24 from statictext within w_choixcouleur
end type
type st_c25 from statictext within w_choixcouleur
end type
type st_c26 from statictext within w_choixcouleur
end type
type st_c27 from statictext within w_choixcouleur
end type
type st_c28 from statictext within w_choixcouleur
end type
type st_c29 from statictext within w_choixcouleur
end type
type st_c30 from statictext within w_choixcouleur
end type
type st_c31 from statictext within w_choixcouleur
end type
type st_c32 from statictext within w_choixcouleur
end type
type st_c33 from statictext within w_choixcouleur
end type
type st_c34 from statictext within w_choixcouleur
end type
type st_c35 from statictext within w_choixcouleur
end type
type st_c36 from statictext within w_choixcouleur
end type
type st_c37 from statictext within w_choixcouleur
end type
type st_c38 from statictext within w_choixcouleur
end type
type st_c39 from statictext within w_choixcouleur
end type
type st_c40 from statictext within w_choixcouleur
end type
type st_1 from statictext within w_choixcouleur
end type
type gb_color from groupbox within w_choixcouleur
end type
end forward

global type w_choixcouleur from window
integer width = 969
integer height = 1428
boolean titlebar = true
string title = "Choix de couleurs"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
st_c1 st_c1
st_c2 st_c2
st_c3 st_c3
st_c4 st_c4
st_c5 st_c5
st_c6 st_c6
st_c7 st_c7
st_c8 st_c8
st_c9 st_c9
st_c10 st_c10
st_c11 st_c11
st_c12 st_c12
st_c13 st_c13
st_c14 st_c14
st_c15 st_c15
st_c16 st_c16
st_c17 st_c17
st_c18 st_c18
st_c19 st_c19
st_c20 st_c20
st_c21 st_c21
st_c22 st_c22
st_c23 st_c23
st_c24 st_c24
st_c25 st_c25
st_c26 st_c26
st_c27 st_c27
st_c28 st_c28
st_c29 st_c29
st_c30 st_c30
st_c31 st_c31
st_c32 st_c32
st_c33 st_c33
st_c34 st_c34
st_c35 st_c35
st_c36 st_c36
st_c37 st_c37
st_c38 st_c38
st_c39 st_c39
st_c40 st_c40
st_1 st_1
gb_color gb_color
end type
global w_choixcouleur w_choixcouleur

type variables
private integer il_typeouv = 0
end variables

forward prototypes
public subroutine uf_setcolorpalette ()
public subroutine uf_traitcolor (long al_couleur)
end prototypes

public subroutine uf_setcolorpalette ();long ll_color,ll_col = 0

Declare colorpalette Cursor For

	select color from t_color where ortho_id = :v_no_ortho;

OPEN colorpalette;

Do While SQLCA.SQLCode = 0
	ll_col++
   Fetch colorpalette Into :ll_color;
	if SQLCA.SQLCode = 0 then
		choose case ll_col
			case 1
				st_c1.backcolor = ll_color
			case 2
				st_c2.backcolor = ll_color
			case 3
				st_c3.backcolor = ll_color
			case 4
				st_c4.backcolor = ll_color
			case 5
				st_c5.backcolor = ll_color
			case 6
				st_c6.backcolor = ll_color
			case 7
				st_c7.backcolor = ll_color
			case 8
				st_c8.backcolor = ll_color
			case 9
				st_c9.backcolor = ll_color
			case 10
				st_c10.backcolor = ll_color
			case 11
				st_c11.backcolor = ll_color
			case 12
				st_c12.backcolor = ll_color
			case 13
				st_c13.backcolor = ll_color
			case 14
				st_c14.backcolor = ll_color
			case 15
				st_c15.backcolor = ll_color
			case 16
				st_c16.backcolor = ll_color
			case 17
				st_c17.backcolor = ll_color
			case 18
				st_c18.backcolor = ll_color
			case 19
				st_c19.backcolor = ll_color
			case 20
				st_c20.backcolor = ll_color
			case 21
				st_c21.backcolor = ll_color
			case 22
				st_c22.backcolor = ll_color
			case 23
				st_c23.backcolor = ll_color
			case 24
				st_c24.backcolor = ll_color
			case 25
				st_c25.backcolor = ll_color
			case 26
				st_c26.backcolor = ll_color
			case 27
				st_c27.backcolor = ll_color
			case 28
				st_c28.backcolor = ll_color
			case 29
				st_c29.backcolor = ll_color
			case 30
				st_c30.backcolor = ll_color
			case 31
				st_c31.backcolor = ll_color
			case 32
				st_c32.backcolor = ll_color
			case 33
				st_c33.backcolor = ll_color
			case 34
				st_c34.backcolor = ll_color
			case 35
				st_c35.backcolor = ll_color
			case 36
				st_c36.backcolor = ll_color
			case 37
				st_c37.backcolor = ll_color
			case 38
				st_c38.backcolor = ll_color
			case 39
				st_c39.backcolor = ll_color
			case 40
				st_c40.backcolor = ll_color
		end choose
	end if
Loop

CLOSE colorpalette;
end subroutine

public subroutine uf_traitcolor (long al_couleur);CHOOSE CASE il_typeouv 
	CASE 1
		w_horaire.dw_hor.event ue_setblockcolor(al_couleur)
	CASE 2
		w_horaire.imp_couleur_select(al_couleur)
	CASE 3
		w_horairetemplateprog.il_tplcolor = al_couleur
	CASE 4
		w_horaire.implistlabo(al_couleur)
END CHOOSE
close(w_choixcouleur)
end subroutine

on w_choixcouleur.create
this.st_c1=create st_c1
this.st_c2=create st_c2
this.st_c3=create st_c3
this.st_c4=create st_c4
this.st_c5=create st_c5
this.st_c6=create st_c6
this.st_c7=create st_c7
this.st_c8=create st_c8
this.st_c9=create st_c9
this.st_c10=create st_c10
this.st_c11=create st_c11
this.st_c12=create st_c12
this.st_c13=create st_c13
this.st_c14=create st_c14
this.st_c15=create st_c15
this.st_c16=create st_c16
this.st_c17=create st_c17
this.st_c18=create st_c18
this.st_c19=create st_c19
this.st_c20=create st_c20
this.st_c21=create st_c21
this.st_c22=create st_c22
this.st_c23=create st_c23
this.st_c24=create st_c24
this.st_c25=create st_c25
this.st_c26=create st_c26
this.st_c27=create st_c27
this.st_c28=create st_c28
this.st_c29=create st_c29
this.st_c30=create st_c30
this.st_c31=create st_c31
this.st_c32=create st_c32
this.st_c33=create st_c33
this.st_c34=create st_c34
this.st_c35=create st_c35
this.st_c36=create st_c36
this.st_c37=create st_c37
this.st_c38=create st_c38
this.st_c39=create st_c39
this.st_c40=create st_c40
this.st_1=create st_1
this.gb_color=create gb_color
this.Control[]={this.st_c1,&
this.st_c2,&
this.st_c3,&
this.st_c4,&
this.st_c5,&
this.st_c6,&
this.st_c7,&
this.st_c8,&
this.st_c9,&
this.st_c10,&
this.st_c11,&
this.st_c12,&
this.st_c13,&
this.st_c14,&
this.st_c15,&
this.st_c16,&
this.st_c17,&
this.st_c18,&
this.st_c19,&
this.st_c20,&
this.st_c21,&
this.st_c22,&
this.st_c23,&
this.st_c24,&
this.st_c25,&
this.st_c26,&
this.st_c27,&
this.st_c28,&
this.st_c29,&
this.st_c30,&
this.st_c31,&
this.st_c32,&
this.st_c33,&
this.st_c34,&
this.st_c35,&
this.st_c36,&
this.st_c37,&
this.st_c38,&
this.st_c39,&
this.st_c40,&
this.st_1,&
this.gb_color}
end on

on w_choixcouleur.destroy
destroy(this.st_c1)
destroy(this.st_c2)
destroy(this.st_c3)
destroy(this.st_c4)
destroy(this.st_c5)
destroy(this.st_c6)
destroy(this.st_c7)
destroy(this.st_c8)
destroy(this.st_c9)
destroy(this.st_c10)
destroy(this.st_c11)
destroy(this.st_c12)
destroy(this.st_c13)
destroy(this.st_c14)
destroy(this.st_c15)
destroy(this.st_c16)
destroy(this.st_c17)
destroy(this.st_c18)
destroy(this.st_c19)
destroy(this.st_c20)
destroy(this.st_c21)
destroy(this.st_c22)
destroy(this.st_c23)
destroy(this.st_c24)
destroy(this.st_c25)
destroy(this.st_c26)
destroy(this.st_c27)
destroy(this.st_c28)
destroy(this.st_c29)
destroy(this.st_c30)
destroy(this.st_c31)
destroy(this.st_c32)
destroy(this.st_c33)
destroy(this.st_c34)
destroy(this.st_c35)
destroy(this.st_c36)
destroy(this.st_c37)
destroy(this.st_c38)
destroy(this.st_c39)
destroy(this.st_c40)
destroy(this.st_1)
destroy(this.gb_color)
end on

event open;il_typeouv = message.doubleparm
uf_setColorPalette()
end event

type st_c1 from statictext within w_choixcouleur
integer x = 110
integer y = 224
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c2 from statictext within w_choixcouleur
integer x = 110
integer y = 328
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c3 from statictext within w_choixcouleur
integer x = 110
integer y = 432
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c4 from statictext within w_choixcouleur
integer x = 110
integer y = 536
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c5 from statictext within w_choixcouleur
integer x = 110
integer y = 640
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c6 from statictext within w_choixcouleur
integer x = 110
integer y = 744
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c7 from statictext within w_choixcouleur
integer x = 110
integer y = 848
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c8 from statictext within w_choixcouleur
integer x = 110
integer y = 952
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c9 from statictext within w_choixcouleur
integer x = 110
integer y = 1056
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c10 from statictext within w_choixcouleur
integer x = 110
integer y = 1160
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c11 from statictext within w_choixcouleur
integer x = 311
integer y = 224
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c12 from statictext within w_choixcouleur
integer x = 311
integer y = 328
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c13 from statictext within w_choixcouleur
integer x = 311
integer y = 432
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c14 from statictext within w_choixcouleur
integer x = 311
integer y = 536
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c15 from statictext within w_choixcouleur
integer x = 311
integer y = 640
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c16 from statictext within w_choixcouleur
integer x = 311
integer y = 744
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c17 from statictext within w_choixcouleur
integer x = 311
integer y = 848
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c18 from statictext within w_choixcouleur
integer x = 311
integer y = 952
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c19 from statictext within w_choixcouleur
integer x = 311
integer y = 1056
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c20 from statictext within w_choixcouleur
integer x = 311
integer y = 1160
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c21 from statictext within w_choixcouleur
integer x = 517
integer y = 224
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c22 from statictext within w_choixcouleur
integer x = 517
integer y = 328
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c23 from statictext within w_choixcouleur
integer x = 517
integer y = 432
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c24 from statictext within w_choixcouleur
integer x = 517
integer y = 536
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c25 from statictext within w_choixcouleur
integer x = 517
integer y = 640
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c26 from statictext within w_choixcouleur
integer x = 517
integer y = 744
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c27 from statictext within w_choixcouleur
integer x = 517
integer y = 848
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c28 from statictext within w_choixcouleur
integer x = 517
integer y = 952
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c29 from statictext within w_choixcouleur
integer x = 517
integer y = 1056
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c30 from statictext within w_choixcouleur
integer x = 517
integer y = 1160
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c31 from statictext within w_choixcouleur
integer x = 709
integer y = 224
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c32 from statictext within w_choixcouleur
integer x = 709
integer y = 328
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c33 from statictext within w_choixcouleur
integer x = 709
integer y = 432
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c34 from statictext within w_choixcouleur
integer x = 709
integer y = 536
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c35 from statictext within w_choixcouleur
integer x = 709
integer y = 640
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c36 from statictext within w_choixcouleur
integer x = 709
integer y = 744
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c37 from statictext within w_choixcouleur
integer x = 709
integer y = 848
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c38 from statictext within w_choixcouleur
integer x = 709
integer y = 952
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c39 from statictext within w_choixcouleur
integer x = 709
integer y = 1056
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_c40 from statictext within w_choixcouleur
integer x = 709
integer y = 1160
integer width = 110
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

event clicked;uf_traitcolor(this.backcolor)
end event

type st_1 from statictext within w_choixcouleur
integer x = 87
integer width = 750
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
string text = "Gestion de couleur"
boolean focusrectangle = false
end type

type gb_color from groupbox within w_choixcouleur
integer x = 27
integer y = 124
integer width = 882
integer height = 1176
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Couleurs existantes"
end type

event constructor;if v_langue = 'an' then
	this.text = 'Existing colors'
end if
end event

