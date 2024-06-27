$PBExportHeader$w_courriel.srw
forward
global type w_courriel from w_response
end type
type cb_2 from commandbutton within w_courriel
end type
type cb_1 from commandbutton within w_courriel
end type
type st_4 from statictext within w_courriel
end type
type st_3 from statictext within w_courriel
end type
type st_2 from statictext within w_courriel
end type
type st_1 from statictext within w_courriel
end type
type mle_messagean from multilineedit within w_courriel
end type
type mle_messagefr from multilineedit within w_courriel
end type
type sle_sujetan from singlelineedit within w_courriel
end type
type sle_sujetfr from singlelineedit within w_courriel
end type
end forward

global type w_courriel from w_response
integer x = 214
integer y = 221
integer width = 3579
integer height = 2144
long backcolor = 12639424
boolean center = true
cb_2 cb_2
cb_1 cb_1
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
mle_messagean mle_messagean
mle_messagefr mle_messagefr
sle_sujetan sle_sujetan
sle_sujetfr sle_sujetfr
end type
global w_courriel w_courriel

type variables
long il_typemessage
end variables

on w_courriel.create
int iCurrent
call super::create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_messagean=create mle_messagean
this.mle_messagefr=create mle_messagefr
this.sle_sujetan=create sle_sujetan
this.sle_sujetfr=create sle_sujetfr
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_2
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.mle_messagean
this.Control[iCurrent+8]=this.mle_messagefr
this.Control[iCurrent+9]=this.sle_sujetan
this.Control[iCurrent+10]=this.sle_sujetfr
end on

on w_courriel.destroy
call super::destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_messagean)
destroy(this.mle_messagefr)
destroy(this.sle_sujetan)
destroy(this.sle_sujetfr)
end on

event open;call super::open;string ls_msgfr, ls_sujetfr, ls_msgan, ls_sujetan, ls_titre
long ll_cnt

select count(1) into :ll_cnt from t_messagecourriel where t_messagecourriel.typemessage = :il_typemessage and ortho_id = :v_no_ortho;
if ll_cnt = 0 then
	CHOOSE CASE il_typemessage
		CASE 3
			ls_titre = 'Message recu automatique'
		CASE 4
			ls_titre = 'Message recu automatique'
	END CHOOSE
	insert into t_messagecourriel(typemessage,titrecourriel,messagecourriel,messagecourrielan,sujetcourriel,sujetcourrielan,ortho_id)
	values(:il_typemessage,:ls_titre,'Pas de message', 'No message', 'Pas de sujet', 'No subject',:v_no_ortho);
	error_type(-1)
end if

select 	isnull(messagecourriel,'Pas de message'),
			isnull(sujetcourriel,'Pas de sujet'),
			isnull(messagecourrielan,'Pas de message'),
			isnull(sujetcourrielan,'Pas de sujet')
into     :ls_msgfr, :ls_sujetfr, :ls_msgan, :ls_sujetan
from		t_messagecourriel
where		t_messagecourriel.typemessage = :il_typemessage and ortho_id = :v_no_ortho;

	
	
sle_sujetfr.text = ls_sujetfr
mle_messagefr.text = ls_msgfr
sle_sujetan.text = ls_sujetan
mle_messagean.text = ls_msgan


	


end event

event pfc_preopen;call super::pfc_preopen;il_typemessage = gnv_app.inv_entrepotglobal.of_retournedonnee("typecourrielaafficher")
end event

type cb_2 from commandbutton within w_courriel
integer x = 5
integer y = 1944
integer width = 686
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder"
end type

event clicked;string ls_sujetfr, ls_sujetan, ls_messagecourrielan, ls_messagecourrielfr

ls_sujetfr = sle_sujetfr.text
ls_sujetan = sle_sujetan.text
ls_messagecourrielfr = mle_messagefr.text
ls_messagecourrielan = mle_messagean.text

update t_messagecourriel set 	messagecourriel = :ls_messagecourrielfr,
										sujetcourriel = :ls_sujetfr,
										messagecourrielan = :ls_messagecourrielan,
										sujetcourrielan = :ls_sujetan
where	t_messagecourriel.typemessage = :il_typemessage and ortho_id = :v_no_ortho;


//messagecourriel,'Pas de message'),
//				isnull(sujetcourriel,'Pas de sujet'),
//				isnull(messagecourrielan,'Pas de message'),
//				isnull(sujetcourrielan,'Pas de sujet')
//	into     :ls_msgfr, :ls_sujetfr, :ls_msgan, :ls_sujetan
//	from		t_messagecourriel
//	where		t_messagecourriel.typemessage = 3;
end event

type cb_1 from commandbutton within w_courriel
integer x = 2871
integer y = 1944
integer width = 686
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("sujetfrcourriel", sle_sujetfr.text)
gnv_app.inv_entrepotglobal.of_ajoutedonnee("sujetancourriel", sle_sujetan.text)
gnv_app.inv_entrepotglobal.of_ajoutedonnee("messagefrcourriel", mle_messagefr.text)
gnv_app.inv_entrepotglobal.of_ajoutedonnee("messageancourriel", mle_messagean.text)
close(parent)
end event

type st_4 from statictext within w_courriel
integer x = 59
integer y = 1104
integer width = 389
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Message (FR)"
boolean focusrectangle = false
end type

type st_3 from statictext within w_courriel
integer x = 69
integer y = 984
integer width = 297
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Sujet (AN)"
boolean focusrectangle = false
end type

type st_2 from statictext within w_courriel
integer x = 69
integer y = 160
integer width = 389
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Message (FR)"
boolean focusrectangle = false
end type

type st_1 from statictext within w_courriel
integer x = 69
integer y = 40
integer width = 297
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Sujet (FR)"
boolean focusrectangle = false
end type

type mle_messagean from multilineedit within w_courriel
integer x = 475
integer y = 1104
integer width = 3072
integer height = 792
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type mle_messagefr from multilineedit within w_courriel
integer x = 475
integer y = 160
integer width = 3072
integer height = 792
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_sujetan from singlelineedit within w_courriel
integer x = 475
integer y = 984
integer width = 3072
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type sle_sujetfr from singlelineedit within w_courriel
integer x = 475
integer y = 40
integer width = 3072
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

