$PBExportHeader$w_changermsg.srw
forward
global type w_changermsg from w_child
end type
type cbx_conf from checkbox within w_changermsg
end type
type st_1 from statictext within w_changermsg
end type
type cb_3 from commandbutton within w_changermsg
end type
type cb_save from commandbutton within w_changermsg
end type
type dw_optionsemail from u_dw within w_changermsg
end type
type cb_close from commandbutton within w_changermsg
end type
end forward

global type w_changermsg from w_child
integer x = 214
integer y = 221
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
windowtype windowtype = main!
boolean center = true
cbx_conf cbx_conf
st_1 st_1
cb_3 cb_3
cb_save cb_save
dw_optionsemail dw_optionsemail
cb_close cb_close
end type
global w_changermsg w_changermsg

on w_changermsg.create
int iCurrent
call super::create
this.cbx_conf=create cbx_conf
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_save=create cb_save
this.dw_optionsemail=create dw_optionsemail
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_conf
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_save
this.Control[iCurrent+5]=this.dw_optionsemail
this.Control[iCurrent+6]=this.cb_close
end on

on w_changermsg.destroy
call super::destroy
destroy(this.cbx_conf)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_save)
destroy(this.dw_optionsemail)
destroy(this.cb_close)
end on

event open;call super::open;if ProfileString ("c:\ii4net\orthotek\ortho.ini", "Correspondance", "confirmationcourriel", 'No') = 'Yes' then
	cbx_conf.checked = true
else
	cbx_conf.checked = false
end if
end event

type cbx_conf from checkbox within w_changermsg
integer x = 27
integer y = 1840
integer width = 1861
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Demander une confirmation par courriel de l~'envoi"
end type

type st_1 from statictext within w_changermsg
integer x = 14
integer width = 2830
integer height = 104
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 134217738
string text = "Configuration des messages"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_changermsg
integer x = 562
integer y = 1924
integer width = 2519
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_save from commandbutton within w_changermsg
integer x = 14
integer y = 1924
integer width = 549
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder"
end type

event clicked;if dw_optionsemail.update() = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

// Mettre la valeur de confirmation dans l'envoi

if cbx_conf.checked then
	setProfileString ("c:\ii4net\orthotek\ortho.ini", "Correspondance", "confirmationcourriel", 'Yes')
else
	setProfileString ("c:\ii4net\orthotek\ortho.ini", "Correspondance", "confirmationcourriel", 'No')
end if
end event

type dw_optionsemail from u_dw within w_changermsg
integer x = 14
integer y = 104
integer width = 3621
integer height = 1704
integer taborder = 10
string dataobject = "d_optionsemail"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;retrieve(v_no_ortho)
end event

event rbuttondown;call super::rbuttondown;scrolltorow(row)
if row > 0 then
	m_insertinfo my_menu
	my_menu = create m_insertinfo
	message.powerObjectParm = this
	m_insertinfo.uf_translate()
	m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
	destroy my_menu
end if
end event

type cb_close from commandbutton within w_changermsg
integer x = 3090
integer y = 1924
integer width = 549
integer height = 112
integer taborder = 10
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

