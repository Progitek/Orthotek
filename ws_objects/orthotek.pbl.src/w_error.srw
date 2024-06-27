$PBExportHeader$w_error.srw
forward
global type w_error from window
end type
type sle_activesheet from singlelineedit within w_error
end type
type st_8 from statictext within w_error
end type
type pb_print from picturebutton within w_error
end type
type st_7 from statictext within w_error
end type
type st_6 from statictext within w_error
end type
type st_3 from statictext within w_error
end type
type sle_code from singlelineedit within w_error
end type
type sle_row from singlelineedit within w_error
end type
type sle_buffer from singlelineedit within w_error
end type
type st_5 from statictext within w_error
end type
type st_4 from statictext within w_error
end type
type st_2 from statictext within w_error
end type
type st_1 from statictext within w_error
end type
type cb_ok from commandbutton within w_error
end type
type gb_2 from groupbox within w_error
end type
type gb_1 from groupbox within w_error
end type
type gb_3 from groupbox within w_error
end type
type mle_sqlsyntax from multilineedit within w_error
end type
type mle_errtext from multilineedit within w_error
end type
end forward

global type w_error from window
integer x = 1358
integer y = 852
integer width = 2327
integer height = 1756
boolean titlebar = true
string title = "Error Window"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
string pointer = "Arrow!"
boolean center = true
sle_activesheet sle_activesheet
st_8 st_8
pb_print pb_print
st_7 st_7
st_6 st_6
st_3 st_3
sle_code sle_code
sle_row sle_row
sle_buffer sle_buffer
st_5 st_5
st_4 st_4
st_2 st_2
st_1 st_1
cb_ok cb_ok
gb_2 gb_2
gb_1 gb_1
gb_3 gb_3
mle_sqlsyntax mle_sqlsyntax
mle_errtext mle_errtext
end type
global w_error w_error

on w_error.create
this.sle_activesheet=create sle_activesheet
this.st_8=create st_8
this.pb_print=create pb_print
this.st_7=create st_7
this.st_6=create st_6
this.st_3=create st_3
this.sle_code=create sle_code
this.sle_row=create sle_row
this.sle_buffer=create sle_buffer
this.st_5=create st_5
this.st_4=create st_4
this.st_2=create st_2
this.st_1=create st_1
this.cb_ok=create cb_ok
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_3=create gb_3
this.mle_sqlsyntax=create mle_sqlsyntax
this.mle_errtext=create mle_errtext
this.Control[]={this.sle_activesheet,&
this.st_8,&
this.pb_print,&
this.st_7,&
this.st_6,&
this.st_3,&
this.sle_code,&
this.sle_row,&
this.sle_buffer,&
this.st_5,&
this.st_4,&
this.st_2,&
this.st_1,&
this.cb_ok,&
this.gb_2,&
this.gb_1,&
this.gb_3,&
this.mle_sqlsyntax,&
this.mle_errtext}
end on

on w_error.destroy
destroy(this.sle_activesheet)
destroy(this.st_8)
destroy(this.pb_print)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_3)
destroy(this.sle_code)
destroy(this.sle_row)
destroy(this.sle_buffer)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_ok)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.mle_sqlsyntax)
destroy(this.mle_errtext)
end on

event open;/*****
* Title  :   Advanced PowerBuilder 6.0, The Definitive Guide
* Author :   Kouros Gorgani
* Chapter:   8, User Objects
* Date   :   July 10, 1997
*****/
string ls_windows, ls_now = string(now())
date ldt_today = today()
window activesheet
str_error ErrorStr

//Display active sheet
activesheet = w_principal.GetActiveSheet()
IF IsValid(activesheet) THEN
   ls_windows = activesheet.Title
	sle_activesheet.text = ls_windows
ELSE
	ls_windows = 'Inconnue'
	sle_activesheet.text = ls_windows
END IF
// structure passed, in the Message object
ErrorStr = Message.PowerObjectParm

//display error message in a user-defind response window
sle_buffer.text = String( ErrorStr.buffer )
sle_row.text    = String( ErrorStr.row ) 
sle_code.text   = String( ErrorStr.sqldbcode )
//CHOOSE CASE sle_code.text

//CASE '-195' // Required value is NULL.
//		mle_sqlsyntax.text = "Ce traitement est associé à un patient."
	
//CASE ...
		// Code to handle other errors
//CASE ELSE
	mle_errtext.text = ErrorStr.sqlerrtext	
//END CHOOSE
mle_sqlsyntax.text = ErrorStr.sqlsyntax

//store into db
//insert into t_error(memoire,ligne,code,errtext,sqlsyntax,fenetre,errdate,errtime) 
//values(:sle_buffer.text,:ErrorStr.row,:ErrorStr.sqldbcode,:ErrorStr.sqlerrtext,:ErrorStr.sqlsyntax,:ls_windows,today(),now());
insert into t_error(memoire,ligne,code,errtext,sqlsyntax,fenetre,errdate) values(:sle_buffer.text,:ErrorStr.row,:ErrorStr.sqldbcode,:ErrorStr.sqlerrtext,:ErrorStr.sqlsyntax,:ls_windows,:ldt_today);
commit;
RETURN 1 // Do not display system error message

end event

type sle_activesheet from singlelineedit within w_error
integer x = 398
integer y = 348
integer width = 567
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_8 from statictext within w_error
integer x = 59
integer y = 364
integer width = 302
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Active sheet:"
boolean focusrectangle = false
end type

type pb_print from picturebutton within w_error
integer x = 1943
integer y = 300
integer width = 265
integer height = 216
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string picturename = "Custom074!"
alignment htextalign = left!
end type

event clicked;long ll_iderr
string ls_nom,ls_add,ls_ville,ls_tel
select dr_nom_complet,dr_adresse,dr_ville,dr_tel_bur into :ls_nom,:ls_add,:ls_ville,:ls_tel from ortho_id where ortho_id = :v_no_ortho;
select max(id_err) into :ll_iderr from t_error;
datastore ds_errorimp
ds_errorimp = create datastore
ds_errorimp.dataobject = 'd_errorimp'
ds_errorimp.SetTransObject(SQLCA)
ds_errorimp.retrieve(ll_iderr)
ds_errorimp.object.t_nom.text = ls_nom
ds_errorimp.object.t_add.text = ls_add
ds_errorimp.object.t_ville.text = ls_ville
ds_errorimp.object.t_tel.text = ls_tel
openwithparm(w_print_options,ds_errorimp)
destroy ds_errorimp
Close ( parent )
end event

type st_7 from statictext within w_error
integer y = 132
integer width = 2039
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "par télécopieur au (418) 780-2190 ou par courriel si vous avez Internet."
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = ''
end if
end event

type st_6 from statictext within w_error
integer y = 64
integer width = 2318
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "soutien technique en imprimant une copie de ce rapport d~'erreur puis l~'envoyer"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Internal error please print and fax the output at (418) 872-6011 .'
end if
end event

type st_3 from statictext within w_error
integer width = 2779
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Un erreur interne vient de se produire, il est fortement conseillé d~'avertir le"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = ''
end if
end event

type sle_code from singlelineedit within w_error
integer x = 398
integer y = 792
integer width = 567
integer height = 92
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_row from singlelineedit within w_error
integer x = 398
integer y = 584
integer width = 567
integer height = 92
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_buffer from singlelineedit within w_error
integer x = 398
integer y = 468
integer width = 567
integer height = 92
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within w_error
integer x = 59
integer y = 996
integer width = 274
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Message:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_error
integer x = 59
integer y = 808
integer width = 206
integer height = 64
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Code:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_error
integer x = 59
integer y = 596
integer width = 146
integer height = 92
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Enr:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_error
integer x = 59
integer y = 480
integer width = 178
integer height = 92
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Buffer:"
boolean focusrectangle = false
end type

type cb_ok from commandbutton within w_error
integer x = 1819
integer y = 1476
integer width = 471
integer height = 104
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Cancel"
boolean cancel = true
boolean default = true
end type

event clicked;Close ( parent )
end event

type gb_2 from groupbox within w_error
integer y = 736
integer width = 1797
integer height = 480
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Erreur de Base de données"
end type

type gb_1 from groupbox within w_error
integer y = 268
integer width = 1797
integer height = 448
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "DataWindow:"
end type

type gb_3 from groupbox within w_error
integer y = 1224
integer width = 1797
integer height = 432
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Syntax Sql:"
end type

type mle_sqlsyntax from multilineedit within w_error
integer x = 55
integer y = 1292
integer width = 1710
integer height = 340
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type mle_errtext from multilineedit within w_error
integer x = 398
integer y = 904
integer width = 1362
integer height = 288
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

