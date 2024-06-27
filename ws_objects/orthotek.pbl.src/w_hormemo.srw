$PBExportHeader$w_hormemo.srw
forward
global type w_hormemo from window
end type
type cb_cancel from commandbutton within w_hormemo
end type
type cb_update from commandbutton within w_hormemo
end type
type dw_hormemo from u_dw within w_hormemo
end type
end forward

global type w_hormemo from window
integer width = 1655
integer height = 788
boolean titlebar = true
string title = "Mémo"
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
cb_cancel cb_cancel
cb_update cb_update
dw_hormemo dw_hormemo
end type
global w_hormemo w_hormemo

type variables
boolean change = false
end variables

forward prototypes
public subroutine sauve ()
end prototypes

public subroutine sauve ();if change then
	if dw_hormemo.update() = 1 then
		commit;
		change = false
	else
		rollback;
		error_type(50)
	end if
end if
end subroutine

on w_hormemo.create
this.cb_cancel=create cb_cancel
this.cb_update=create cb_update
this.dw_hormemo=create dw_hormemo
this.Control[]={this.cb_cancel,&
this.cb_update,&
this.dw_hormemo}
end on

on w_hormemo.destroy
destroy(this.cb_cancel)
destroy(this.cb_update)
destroy(this.dw_hormemo)
end on

event open;long ll_row
integer li_col
string ls_col
date ldt_hor
time lt_hor

ll_row = w_horaire.dw_hor.getrow()
ldt_hor = w_horaire.dw_hor.getitemdate(ll_row,'datecal')
lt_hor = w_horaire.dw_hor.getitemtime(ll_row,'heure')
w_horaire.uf_col(w_horaire.dw_hor.getcolumnname(),li_col,ls_col)
dw_hormemo.dataobject = 'd_hormemo'+ls_col
dw_hormemo.setTransObject(SQLCA)
dw_hormemo.retrieve(w_horaire.il_horidspec,lt_hor,ldt_hor)
dw_hormemo.SetFocus()

end event

type cb_cancel from commandbutton within w_hormemo
integer x = 823
integer y = 584
integer width = 782
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
boolean cancel = true
end type

event clicked;if  change then
	if error_type(200) = 1 then
		sauve()
	end if
end if
w_horaire.uf_setSync()
close(parent)
end event

type cb_update from commandbutton within w_hormemo
integer x = 5
integer y = 584
integer width = 814
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "OK"
end type

event clicked;date ldt_hor
time lt_hor
integer li_col
string ls_col, ls_memo
long ll_row, ll_patid

ll_row = w_horaire.dw_hor.getRow()
ldt_hor = w_horaire.dw_hor.getitemdate(ll_row,'datecal')
lt_hor = w_horaire.dw_hor.getitemtime(ll_row,'heure')
w_horaire.uf_col(w_horaire.dw_hor.getcolumnname(),li_col,ls_col)
ll_patid = w_horaire.dw_hor.getItemNumber(ll_row,'patient_id_' + ls_col)
dw_hormemo.accepttext()
ls_memo = dw_hormemo.getItemString(dw_hormemo.getRow(),'memo' +ls_col )
update t_rdv set memo = :ls_memo
where patient_id = :ll_patid and rdvheure = :lt_hor and rdvdate = :ldt_hor;
commit using SQLCA;
sauve()
w_horaire.affichage_creation()
close(parent)
end event

type dw_hormemo from u_dw within w_hormemo
integer width = 1609
integer height = 572
integer taborder = 30
string title = "hormemo8"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;change = true
end event

event editchanged;change = true
end event

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the eror message
RETURN 1

end event

