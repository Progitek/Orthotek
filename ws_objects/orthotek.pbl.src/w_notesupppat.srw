$PBExportHeader$w_notesupppat.srw
forward
global type w_notesupppat from w_response
end type
type st_nompat from statictext within w_notesupppat
end type
type st_title from statictext within w_notesupppat
end type
type cb_close from commandbutton within w_notesupppat
end type
type cb_update from commandbutton within w_notesupppat
end type
type dw_notesupppat from u_dw within w_notesupppat
end type
end forward

global type w_notesupppat from w_response
integer x = 214
integer y = 221
integer height = 1420
boolean titlebar = false
boolean controlmenu = false
boolean center = true
boolean ib_isupdateable = false
boolean ib_disableclosequery = true
st_nompat st_nompat
st_title st_title
cb_close cb_close
cb_update cb_update
dw_notesupppat dw_notesupppat
end type
global w_notesupppat w_notesupppat

type variables
boolean change = false
end variables

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();if v_langue = 'an' then
	st_title.text = "Complementary notes for patient"
	cb_close.text = "Close"
	cb_update.text = "Update"
end if
end subroutine

on w_notesupppat.create
int iCurrent
call super::create
this.st_nompat=create st_nompat
this.st_title=create st_title
this.cb_close=create cb_close
this.cb_update=create cb_update
this.dw_notesupppat=create dw_notesupppat
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_nompat
this.Control[iCurrent+2]=this.st_title
this.Control[iCurrent+3]=this.cb_close
this.Control[iCurrent+4]=this.cb_update
this.Control[iCurrent+5]=this.dw_notesupppat
end on

on w_notesupppat.destroy
call super::destroy
destroy(this.st_nompat)
destroy(this.st_title)
destroy(this.cb_close)
destroy(this.cb_update)
destroy(this.dw_notesupppat)
end on

event open;call super::open;long ll_patid, ll_row
string ls_pat

ll_patid = long(gnv_app.inv_entrepotglobal.of_retournedonnee("patientidnotesupp"))
select patient_nom || ' ' || patient_prenom into :ls_pat from patient where patient_id = :ll_patid;
st_nompat.text = ls_pat

if dw_notesupppat.retrieve(ll_patid) = 0 then
	ll_row = dw_notesupppat.insertRow(0)
	dw_notesupppat.setItem(ll_row,'patient_id',ll_patid)
end if

end event

type st_nompat from statictext within w_notesupppat
integer x = 1143
integer y = 20
integer width = 1298
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_title from statictext within w_notesupppat
integer x = 37
integer y = 20
integer width = 1047
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Notes supplémentaires au patient"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_notesupppat
integer x = 1906
integer y = 1300
integer width = 567
integer height = 108
integer taborder = 20
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

type cb_update from commandbutton within w_notesupppat
integer y = 1300
integer width = 567
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder"
end type

event clicked;if change then
	if dw_notesupppat.update() = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
end if
end event

type dw_notesupppat from u_dw within w_notesupppat
integer x = 14
integer y = 104
integer width = 2441
integer height = 1184
integer taborder = 10
string dataobject = "d_notesupppat"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;call super::itemchanged;change = true
end event

event editchanged;call super::editchanged;change = true
end event

