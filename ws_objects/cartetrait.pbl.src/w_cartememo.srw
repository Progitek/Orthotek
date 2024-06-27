$PBExportHeader$w_cartememo.srw
forward
global type w_cartememo from w_response
end type
type mle_memo from multilineedit within w_cartememo
end type
type st_title from statictext within w_cartememo
end type
type cb_memo from commandbutton within w_cartememo
end type
end forward

global type w_cartememo from w_response
integer x = 214
integer y = 221
integer width = 2053
integer height = 988
boolean center = true
mle_memo mle_memo
st_title st_title
cb_memo cb_memo
end type
global w_cartememo w_cartememo

type variables
long il_idcarteentete
end variables

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();if v_langue = 'an' then
	st_title.text = "Treatment card memo"		
else
	st_title.text  = "Memo de la carte de traitement"
end if
end subroutine

on w_cartememo.create
int iCurrent
call super::create
this.mle_memo=create mle_memo
this.st_title=create st_title
this.cb_memo=create cb_memo
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.mle_memo
this.Control[iCurrent+2]=this.st_title
this.Control[iCurrent+3]=this.cb_memo
end on

on w_cartememo.destroy
call super::destroy
destroy(this.mle_memo)
destroy(this.st_title)
destroy(this.cb_memo)
end on

event open;call super::open;string ls_memo

il_idcarteentete = long(gnv_app.inv_entrepotglobal.of_retournedonnee("id_carteentete_memo"))

select isnull(memo1,'') into :ls_memo from t_carteentete where id_carteentete = :il_idcarteentete;
mle_memo.text = ls_memo
end event

type mle_memo from multilineedit within w_cartememo
integer x = 5
integer y = 92
integer width = 2007
integer height = 672
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_title from statictext within w_cartememo
integer width = 2016
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Memo de la carte de traitement"
boolean focusrectangle = false
end type

type cb_memo from commandbutton within w_cartememo
integer x = 9
integer y = 784
integer width = 2016
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;string ls_memo

ls_memo = mle_memo.text
update t_carteentete set memo1 = :ls_memo where id_carteentete = :il_idcarteentete;
if error_type(-1) = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

close(parent)
end event

