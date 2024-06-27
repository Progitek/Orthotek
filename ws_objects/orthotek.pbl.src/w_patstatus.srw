$PBExportHeader$w_patstatus.srw
forward
global type w_patstatus from w_child
end type
type st_statutpat from statictext within w_patstatus
end type
type cb_close from commandbutton within w_patstatus
end type
type cb_insert from commandbutton within w_patstatus
end type
type cb_update from commandbutton within w_patstatus
end type
type cb_supprimer from commandbutton within w_patstatus
end type
type dw_patstatus from u_dw within w_patstatus
end type
end forward

global type w_patstatus from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
string pointer = "Arrow!"
boolean toolbarvisible = false
boolean ib_isupdateable = false
event ue_post_open ( )
st_statutpat st_statutpat
cb_close cb_close
cb_insert cb_insert
cb_update cb_update
cb_supprimer cb_supprimer
dw_patstatus dw_patstatus
end type
global w_patstatus w_patstatus

type variables
public boolean change = false
private long il_traitid
private long il_patid

end variables

forward prototypes
public subroutine if_close ()
public subroutine sauve ()
end prototypes

public subroutine if_close ();if change then
	if error_type(200) = 1 then
		sauve()
	end if
end if
close(w_patstatus)
end subroutine

public subroutine sauve ();decimal{2} v_paiement
date v_date_cheque
long row

row = dw_patstatus.getrow()
if row > 0 then
	if dw_patstatus.update() = 1 then
		commit using SQLCA;
		change = false
	else
		rollback using SQLCA;
		error_type(50)
	end if
end if


end subroutine

on w_patstatus.create
int iCurrent
call super::create
this.st_statutpat=create st_statutpat
this.cb_close=create cb_close
this.cb_insert=create cb_insert
this.cb_update=create cb_update
this.cb_supprimer=create cb_supprimer
this.dw_patstatus=create dw_patstatus
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_statutpat
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_insert
this.Control[iCurrent+4]=this.cb_update
this.Control[iCurrent+5]=this.cb_supprimer
this.Control[iCurrent+6]=this.dw_patstatus
end on

on w_patstatus.destroy
call super::destroy
destroy(this.st_statutpat)
destroy(this.cb_close)
destroy(this.cb_insert)
destroy(this.cb_update)
destroy(this.cb_supprimer)
destroy(this.dw_patstatus)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

this.postevent('ue_post_open')
end event

type st_statutpat from statictext within w_patstatus
integer x = 9
integer y = 4
integer width = 1641
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "État dossier patient"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Patient file status'
end if
end event

type cb_close from commandbutton within w_patstatus
event clicked pbm_bnclicked
integer x = 2702
integer y = 1912
integer width = 919
integer height = 120
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if_close()
if isvalid(w_dossier_patients) then
	w_dossier_patients.dddw_patstatus.SetTransObject(SQLCA)
	w_dossier_patients.dddw_patstatus.retrieve()
end if
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type cb_insert from commandbutton within w_patstatus
event clicked pbm_bnclicked
integer x = 14
integer y = 1912
integer width = 919
integer height = 120
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajout"
end type

event clicked;long ll_newrow

ll_newrow = dw_patstatus.InsertRow(0)
dw_patstatus.scrolltorow(ll_newrow)
dw_patstatus.setitem(ll_newrow,"ortho_id",v_no_ortho) 
dw_patstatus.SetFocus()
change = true

end event

event constructor;if v_langue = 'an' then
	cb_insert.Text = "Add"
end if
end event

type cb_update from commandbutton within w_patstatus
event clicked pbm_bnclicked
integer x = 1783
integer y = 1912
integer width = 919
integer height = 120
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;sauve()
end event

event constructor;if v_langue = 'an' then
	cb_update.Text = "Save"
end if
end event

type cb_supprimer from commandbutton within w_patstatus
event clicked pbm_bnclicked
integer x = 933
integer y = 1912
integer width = 850
integer height = 120
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;if change then
	error_type(127)
else
	dw_patstatus.deleterow(dw_patstatus.getrow())
	sauve()
end if

end event

event constructor;if v_langue = 'an' then
	cb_supprimer.Text = "Delete"
end if
end event

type dw_patstatus from u_dw within w_patstatus
integer x = 14
integer y = 96
integer width = 3602
integer height = 1808
integer taborder = 10
string dataobject = "d_patstatus"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event editchanged;change = true
end event

event itemchanged;change = true
end event

event constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetTransObject (SQLCA)
setrowfocusindicator(hand!)
Retrieve(v_no_ortho)

end event

event rbuttondown;long i

if dwo.name = 'nom' then
	if messagebox('Question','Voulez-vous définir ce choix par défaut?',Question!,OkCancel!,2) = 1 then
		change = true
		for i = 1 to dw_patstatus.rowcount()
			if i = row then
				dw_patstatus.setitem(i,'defo',1)
			else
				dw_patstatus.setitem(i,'defo',0)
			end if
		next
	end if
end if
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
//do not display the error message
RETURN 1
end event

