$PBExportHeader$w_choixcaptsoft.srw
forward
global type w_choixcaptsoft from w_response
end type
type cb_cancel from u_cb within w_choixcaptsoft
end type
type cb_ok from u_cb within w_choixcaptsoft
end type
type dw_capt from u_dw within w_choixcaptsoft
end type
end forward

global type w_choixcaptsoft from w_response
integer x = 214
integer y = 221
integer width = 1243
integer height = 504
boolean center = true
boolean ib_isupdateable = false
cb_cancel cb_cancel
cb_ok cb_ok
dw_capt dw_capt
end type
global w_choixcaptsoft w_choixcaptsoft

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();if gs_langue = 'an' then
	cb_cancel.text = 'Cancel'
end if

end subroutine

on w_choixcaptsoft.create
int iCurrent
call super::create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_capt=create dw_capt
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancel
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.dw_capt
end on

on w_choixcaptsoft.destroy
call super::destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_capt)
end on

type cb_cancel from u_cb within w_choixcaptsoft
integer x = 878
integer y = 328
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;call super::clicked;closeWithReturn(parent, 0)

end event

type cb_ok from u_cb within w_choixcaptsoft
integer x = 526
integer y = 328
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Ok"
boolean default = true
end type

event clicked;call super::clicked;integer li_soft

if dw_capt.getRow() > 0 then
	li_soft = dw_capt.getItemNumber(dw_capt.getRow(), 'id_cptrconf')
	
	update t_optiongen set captsoft = :li_soft;
	
	closeWithReturn(parent, li_soft)
else
	closeWithReturn(parent, 0)
end if

end event

type dw_capt from u_dw within w_choixcaptsoft
integer x = 9
integer y = 4
integer width = 1216
integer height = 312
integer taborder = 10
string title = "Logiciel de capture"
string dataobject = "d_captsoft"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;integer i, li_rowCnt, li_defaut, li_soft
pro_resize luo_rs

luo_rs.uf_resizedw(this)

setRowFocusIndicator(Hand!)
li_rowCnt = retrieve()

if li_rowCnt = 0 then
	error_type(1115)
	post close(parent)
end if

select captsoft into :li_defaut from t_optiongen;

i = li_rowCnt + 1
do while i > 1 and li_soft <> li_defaut
	i --
	
	li_soft = getItemNumber(i, 'id_cptrconf')
loop

if i > 0 then scrollToRow(i)

end event

event doubleclicked;call super::doubleclicked;integer li_soft

if row > 0 then
	li_soft = getItemNumber(row, 'id_cptrconf')
	
	update t_optiongen set captsoft = :li_soft;
	
	closeWithReturn(parent, li_soft)
else
	closeWithReturn(parent, 0)
end if

end event

