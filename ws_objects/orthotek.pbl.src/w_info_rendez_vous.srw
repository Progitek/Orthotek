$PBExportHeader$w_info_rendez_vous.srw
forward
global type w_info_rendez_vous from window
end type
type cb_prap from commandbutton within w_info_rendez_vous
end type
type cb_drv from commandbutton within w_info_rendez_vous
end type
type st_3 from statictext within w_info_rendez_vous
end type
type st_2 from statictext within w_info_rendez_vous
end type
type st_1 from statictext within w_info_rendez_vous
end type
type dw_info_last_rv from u_dw within w_info_rendez_vous
end type
type dw_info_rappel from u_dw within w_info_rendez_vous
end type
type dw_info_rendez_vous from u_dw within w_info_rendez_vous
end type
type cb_close from commandbutton within w_info_rendez_vous
end type
end forward

global type w_info_rendez_vous from window
integer x = 823
integer y = 360
integer width = 1006
integer height = 1432
windowtype windowtype = response!
long backcolor = 79741120
string pointer = "Arrow!"
boolean center = true
cb_prap cb_prap
cb_drv cb_drv
st_3 st_3
st_2 st_2
st_1 st_1
dw_info_last_rv dw_info_last_rv
dw_info_rappel dw_info_rappel
dw_info_rendez_vous dw_info_rendez_vous
cb_close cb_close
end type
global w_info_rendez_vous w_info_rendez_vous

type variables
private long il_patid
end variables

on w_info_rendez_vous.create
this.cb_prap=create cb_prap
this.cb_drv=create cb_drv
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_info_last_rv=create dw_info_last_rv
this.dw_info_rappel=create dw_info_rappel
this.dw_info_rendez_vous=create dw_info_rendez_vous
this.cb_close=create cb_close
this.Control[]={this.cb_prap,&
this.cb_drv,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_info_last_rv,&
this.dw_info_rappel,&
this.dw_info_rendez_vous,&
this.cb_close}
end on

on w_info_rendez_vous.destroy
destroy(this.cb_prap)
destroy(this.cb_drv)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_info_last_rv)
destroy(this.dw_info_rappel)
destroy(this.dw_info_rendez_vous)
destroy(this.cb_close)
end on

event open;il_patid = message.doubleparm  //parametre externe
dw_info_rendez_vous.retrieve(il_patid)

end event

type cb_prap from commandbutton within w_info_rendez_vous
integer x = 9
integer y = 1160
integer width = 965
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher prochain rappel"
end type

event clicked;dw_info_rappel.retrieve(il_patid)
end event

event constructor;if v_langue = 'an' then
	this.text = "Search next recall."
end if
end event

type cb_drv from commandbutton within w_info_rendez_vous
integer x = 9
integer y = 1048
integer width = 965
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher dernier Rendez-vous"
end type

event clicked;dw_info_last_rv.retrieve(il_patid)
end event

event constructor;if v_langue = 'an' then
	this.text = "Search Last app."
end if
end event

type st_3 from statictext within w_info_rendez_vous
integer x = 14
integer y = 836
integer width = 462
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prochain rappel"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_3.Text = "Next recall"
end if
end event

type st_2 from statictext within w_info_rendez_vous
integer x = 14
integer y = 268
integer width = 690
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prochain(s) rendez-vous"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_2.Text = "Next Appointment"
end if
end event

type st_1 from statictext within w_info_rendez_vous
integer x = 18
integer width = 677
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dernier rendez-vous"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_1.Text = "Last Appointment"
end if
end event

type dw_info_last_rv from u_dw within w_info_rendez_vous
integer x = 9
integer y = 68
integer width = 965
integer height = 192
integer taborder = 10
string title = "none"
string dataobject = "d_info_last_rv"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_info_last_rv.SetTransObject(SQLCA)

if v_langue = 'an' then
	dw_info_last_rv.object.t_2.text = 'Hour'
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

type dw_info_rappel from u_dw within w_info_rendez_vous
integer x = 5
integer y = 912
integer width = 965
integer height = 128
integer taborder = 20
string dataobject = "d_info_rappel"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_info_rappel.SetTransObject(SQLCA)
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

type dw_info_rendez_vous from u_dw within w_info_rendez_vous
integer x = 9
integer y = 344
integer width = 965
integer height = 488
integer taborder = 10
string dataobject = "d_info_rendez_vous"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_info_rendez_vous.SetTransObject(SQLCA)

if v_langue = 'an' then
	this.object.t_time.text = 'Hour'
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

type cb_close from commandbutton within w_info_rendez_vous
integer x = 9
integer y = 1272
integer width = 965
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

