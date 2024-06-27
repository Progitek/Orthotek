$PBExportHeader$w_lettretext.srw
forward
global type w_lettretext from window
end type
type sle_titre from singlelineedit within w_lettretext
end type
type st_1 from statictext within w_lettretext
end type
type mle_text from multilineedit within w_lettretext
end type
type cb_3 from commandbutton within w_lettretext
end type
type cb_2 from commandbutton within w_lettretext
end type
type cb_1 from commandbutton within w_lettretext
end type
end forward

global type w_lettretext from window
integer x = 402
integer y = 500
integer width = 2496
integer height = 1212
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
sle_titre sle_titre
st_1 st_1
mle_text mle_text
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
end type
global w_lettretext w_lettretext

type variables
private integer ii_pos = 0
end variables

forward prototypes
public subroutine save ()
end prototypes

public subroutine save ();string ls_text

ls_text = mle_text.text

insert into t_lignes(texte,pos) values(:ls_text,:ii_pos);
end subroutine

on w_lettretext.create
this.sle_titre=create sle_titre
this.st_1=create st_1
this.mle_text=create mle_text
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.Control[]={this.sle_titre,&
this.st_1,&
this.mle_text,&
this.cb_3,&
this.cb_2,&
this.cb_1}
end on

on w_lettretext.destroy
destroy(this.sle_titre)
destroy(this.st_1)
destroy(this.mle_text)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event open;ii_pos = message.doubleparm
end event

type sle_titre from singlelineedit within w_lettretext
integer x = 174
integer y = 8
integer width = 1701
integer height = 104
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_lettretext
integer x = 32
integer y = 28
integer width = 142
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Titre"
boolean focusrectangle = false
end type

type mle_text from multilineedit within w_lettretext
integer x = 23
integer y = 124
integer width = 2441
integer height = 940
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
integer limit = 1000
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_lettretext
integer x = 686
integer y = 1080
integer width = 1161
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
end type

type cb_2 from commandbutton within w_lettretext
integer x = 23
integer y = 1080
integer width = 663
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarder"
end type

event clicked;string ls_text, ls_titre
long ll_ligneid, ll_row

ls_text = mle_text.text
ls_titre = sle_titre.text

insert into t_lignes(texte,pos,titre) values(:ls_text,:ii_pos,:ls_titre);
w_corresp.f_retrieve(ii_pos)
select max(id_ligne) into :ll_ligneid from t_lignes;
choose case ii_pos
	case 1
		ll_row = w_corresp.dw_ligne1.find("id_ligne = " + string(ll_ligneid),1,w_corresp.dw_ligne1.rowcount())
		w_corresp.dw_ligne1.scrollToRow(ll_row)
	case 2
		ll_row = w_corresp.dw_ligne2.find("id_ligne = " + string(ll_ligneid),1,w_corresp.dw_ligne2.rowcount())
		w_corresp.dw_ligne2.scrollToRow(ll_row)
	case 3
		ll_row = w_corresp.dw_ligne3.find("id_ligne = " + string(ll_ligneid),1,w_corresp.dw_ligne3.rowcount())
		w_corresp.dw_ligne3.scrollToRow(ll_row)
	case 4
		ll_row = w_corresp.dw_ligne4.find("id_ligne = " + string(ll_ligneid),1,w_corresp.dw_ligne4.rowcount())
		w_corresp.dw_ligne4.scrollToRow(ll_row)
	case 5
		ll_row = w_corresp.dw_ligne5.find("id_ligne = " + string(ll_ligneid),1,w_corresp.dw_ligne5.rowcount())
		w_corresp.dw_ligne5.scrollToRow(ll_row)
	case 6
		ll_row = w_corresp.dw_ligne6.find("id_ligne = " + string(ll_ligneid),1,w_corresp.dw_ligne6.rowcount())
		w_corresp.dw_ligne6.scrollToRow(ll_row)
	case 7
		ll_row = w_corresp.dw_ligne7.find("id_ligne = " + string(ll_ligneid),1,w_corresp.dw_ligne7.rowcount())
		w_corresp.dw_ligne7.scrollToRow(ll_row)
	case 8
		ll_row = w_corresp.dw_ligne8.find("id_ligne = " + string(ll_ligneid),1,w_corresp.dw_ligne8.rowcount())
		w_corresp.dw_ligne8.scrollToRow(ll_row)
	case 9
		ll_row = w_corresp.dw_ligne9.find("id_ligne = " + string(ll_ligneid),1,w_corresp.dw_ligne9.rowcount())
		w_corresp.dw_ligne9.scrollToRow(ll_row)
	case 10
		ll_row = w_corresp.dw_ligne10.find("id_ligne = " + string(ll_ligneid),1,w_corresp.dw_ligne10.rowcount())
		w_corresp.dw_ligne10.scrollToRow(ll_row)
end choose		
end event

type cb_1 from commandbutton within w_lettretext
integer x = 1851
integer y = 1080
integer width = 622
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)

end event

