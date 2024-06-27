$PBExportHeader$w_authdentist.srw
forward
global type w_authdentist from w_response
end type
type cb_ok from commandbutton within w_authdentist
end type
type sle_passwd from singlelineedit within w_authdentist
end type
type uo_toolbar2 from u_cst_toolbarstrip within w_authdentist
end type
type st_titre from u_st within w_authdentist
end type
type p_ico from u_p within w_authdentist
end type
type uo_toolbar from u_cst_toolbarstrip within w_authdentist
end type
type rr_1 from roundrectangle within w_authdentist
end type
end forward

global type w_authdentist from w_response
integer width = 1417
integer height = 624
boolean titlebar = false
boolean controlmenu = false
long backcolor = 15780518
boolean center = true
cb_ok cb_ok
sle_passwd sle_passwd
uo_toolbar2 uo_toolbar2
st_titre st_titre
p_ico p_ico
uo_toolbar uo_toolbar
rr_1 rr_1
end type
global w_authdentist w_authdentist

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();uo_toolbar.of_settheme("classics")
uo_toolbar.of_displayborder(true) 
uo_toolbar2.of_settheme("classics")
uo_toolbar2.of_displayborder(true) 

uo_toolbar.of_additem("Ok", "c:\ii4net\orthotek\images\ok.gif")
if gnv_app.of_getlangue() = 'an' then
	uo_toolbar2.of_addItem("Cancel","c:\ii4net\orthotek\images\annuler.gif")
else
	uo_toolbar2.of_addItem("Annuler","c:\ii4net\orthotek\images\annuler.gif")
end if

uo_toolbar.of_displaytext(true)
uo_toolbar2.of_displaytext(true)
end subroutine

on w_authdentist.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.sle_passwd=create sle_passwd
this.uo_toolbar2=create uo_toolbar2
this.st_titre=create st_titre
this.p_ico=create p_ico
this.uo_toolbar=create uo_toolbar
this.rr_1=create rr_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.sle_passwd
this.Control[iCurrent+3]=this.uo_toolbar2
this.Control[iCurrent+4]=this.st_titre
this.Control[iCurrent+5]=this.p_ico
this.Control[iCurrent+6]=this.uo_toolbar
this.Control[iCurrent+7]=this.rr_1
end on

on w_authdentist.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.sle_passwd)
destroy(this.uo_toolbar2)
destroy(this.st_titre)
destroy(this.p_ico)
destroy(this.uo_toolbar)
destroy(this.rr_1)
end on

type cb_ok from commandbutton within w_authdentist
integer x = 503
integer y = 700
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
end type

event clicked;string ls_password
long ll_iduser


ls_password = sle_passwd.text
setnull(ll_iduser)
select id_personnel into :ll_iduser from t_personnels where password = :ls_password
AND ( postocc = 'O' OR postocc = 'P' OR id_personnel = 0);
if isnull(ll_iduser) then
	error_type(129)
	return
else
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("authendentist",string(ll_iduser))
end if

close(parent)
end event

type sle_passwd from singlelineedit within w_authdentist
integer x = 27
integer y = 252
integer width = 1321
integer height = 100
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type uo_toolbar2 from u_cst_toolbarstrip within w_authdentist
integer x = 727
integer y = 444
integer width = 617
integer taborder = 20
end type

on uo_toolbar2.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;gnv_app.inv_entrepotglobal.of_ajoutedonnee("authendentist","Failed")
close(parent)
end event

type st_titre from u_st within w_authdentist
string tag = "resize=frbsr"
integer x = 242
integer y = 68
integer width = 1088
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 16777215
string text = "Authentification de l~'orthodontiste"
end type

type p_ico from u_p within w_authdentist
string tag = "resize=frb"
integer x = 64
integer y = 40
integer width = 146
integer height = 128
string picturename = "C:\ii4net\orthotek\images\crochetvert.gif"
end type

type uo_toolbar from u_cst_toolbarstrip within w_authdentist
integer x = 32
integer y = 444
integer width = 617
integer taborder = 20
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_ok.event clicked()
end event

type rr_1 from roundrectangle within w_authdentist
string tag = "resize=frbsr"
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 1073741824
integer x = 27
integer y = 16
integer width = 1344
integer height = 176
integer cornerheight = 40
integer cornerwidth = 46
end type

