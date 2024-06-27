$PBExportHeader$w_etiqchoix.srw
forward
global type w_etiqchoix from w_child
end type
type pb_7 from picturebutton within w_etiqchoix
end type
type pb_6 from picturebutton within w_etiqchoix
end type
type pb_5 from picturebutton within w_etiqchoix
end type
type pb_4 from picturebutton within w_etiqchoix
end type
type pb_3 from picturebutton within w_etiqchoix
end type
type pb_2 from picturebutton within w_etiqchoix
end type
type pb_1 from picturebutton within w_etiqchoix
end type
type dw_etiq5 from u_dw within w_etiqchoix
end type
type dw_etiq4 from u_dw within w_etiqchoix
end type
type dw_etiq3 from u_dw within w_etiqchoix
end type
type dw_etiq2 from u_dw within w_etiqchoix
end type
type rb_edit from radiobutton within w_etiqchoix
end type
type rb_preview from radiobutton within w_etiqchoix
end type
type cb_delete from commandbutton within w_etiqchoix
end type
type cb_update from commandbutton within w_etiqchoix
end type
type dw_etiq1 from u_dw within w_etiqchoix
end type
type cb_insert from commandbutton within w_etiqchoix
end type
type st_title from statictext within w_etiqchoix
end type
type dw_etiqchoix from u_dw within w_etiqchoix
end type
type cb_close from commandbutton within w_etiqchoix
end type
end forward

global type w_etiqchoix from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean ib_isupdateable = false
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_etiq5 dw_etiq5
dw_etiq4 dw_etiq4
dw_etiq3 dw_etiq3
dw_etiq2 dw_etiq2
rb_edit rb_edit
rb_preview rb_preview
cb_delete cb_delete
cb_update cb_update
dw_etiq1 dw_etiq1
cb_insert cb_insert
st_title st_title
dw_etiqchoix dw_etiqchoix
cb_close cb_close
end type
global w_etiqchoix w_etiqchoix

type variables
private long il_patid,il_idetiq
public boolean change = false, change1 = false
public integer ii_dw
end variables

forward prototypes
public subroutine save ()
end prototypes

public subroutine save ();if change then
	dw_etiqchoix.accepttext()
	if dw_etiqchoix.update() = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
	end if
end if
if change1 then
	dw_etiq1.accepttext()
	dw_etiq2.accepttext()
	dw_etiq3.accepttext()
	dw_etiq4.accepttext()
	dw_etiq5.accepttext()
	if dw_etiq1.update() = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
	end if
	if dw_etiq2.update() = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
	end if
	if dw_etiq3.update() = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
	end if
	if dw_etiq4.update() = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
	end if
	if dw_etiq5.update() = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
	end if
end if
change1 = false
change = false
end subroutine

on w_etiqchoix.create
int iCurrent
call super::create
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_etiq5=create dw_etiq5
this.dw_etiq4=create dw_etiq4
this.dw_etiq3=create dw_etiq3
this.dw_etiq2=create dw_etiq2
this.rb_edit=create rb_edit
this.rb_preview=create rb_preview
this.cb_delete=create cb_delete
this.cb_update=create cb_update
this.dw_etiq1=create dw_etiq1
this.cb_insert=create cb_insert
this.st_title=create st_title
this.dw_etiqchoix=create dw_etiqchoix
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_7
this.Control[iCurrent+2]=this.pb_6
this.Control[iCurrent+3]=this.pb_5
this.Control[iCurrent+4]=this.pb_4
this.Control[iCurrent+5]=this.pb_3
this.Control[iCurrent+6]=this.pb_2
this.Control[iCurrent+7]=this.pb_1
this.Control[iCurrent+8]=this.dw_etiq5
this.Control[iCurrent+9]=this.dw_etiq4
this.Control[iCurrent+10]=this.dw_etiq3
this.Control[iCurrent+11]=this.dw_etiq2
this.Control[iCurrent+12]=this.rb_edit
this.Control[iCurrent+13]=this.rb_preview
this.Control[iCurrent+14]=this.cb_delete
this.Control[iCurrent+15]=this.cb_update
this.Control[iCurrent+16]=this.dw_etiq1
this.Control[iCurrent+17]=this.cb_insert
this.Control[iCurrent+18]=this.st_title
this.Control[iCurrent+19]=this.dw_etiqchoix
this.Control[iCurrent+20]=this.cb_close
end on

on w_etiqchoix.destroy
call super::destroy
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_etiq5)
destroy(this.dw_etiq4)
destroy(this.dw_etiq3)
destroy(this.dw_etiq2)
destroy(this.rb_edit)
destroy(this.rb_preview)
destroy(this.cb_delete)
destroy(this.cb_update)
destroy(this.dw_etiq1)
destroy(this.cb_insert)
destroy(this.st_title)
destroy(this.dw_etiqchoix)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type pb_7 from picturebutton within w_etiqchoix
integer x = 2715
integer y = 1604
integer width = 101
integer height = 88
integer taborder = 110
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Justify!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;integer li_align = 3
string ls_col

choose case ii_dw
	case 1
		ls_col = right(dw_etiq1.getcolumnname(),1)
		dw_etiq1.setitem(1,'align'+ls_col,li_align)
	case 2
		ls_col = right(dw_etiq2.getcolumnname(),1)
		dw_etiq2.setitem(1,'align'+ls_col,li_align)
	case 3
		ls_col = right(dw_etiq3.getcolumnname(),1)
		dw_etiq3.setitem(1,'align'+ls_col,li_align)
	case 4
		ls_col = right(dw_etiq4.getcolumnname(),1)
		dw_etiq4.setitem(1,'align'+ls_col,li_align)
	case 5
		ls_col = right(dw_etiq5.getcolumnname(),1)
		dw_etiq5.setitem(1,'align'+ls_col,li_align)
end choose
dw_etiq1.event ue_align()
change1 = true
end event

type pb_6 from picturebutton within w_etiqchoix
integer x = 2610
integer y = 1604
integer width = 101
integer height = 88
integer taborder = 90
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Right!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;integer li_align = 1
string ls_col

choose case ii_dw
	case 1
		ls_col = right(dw_etiq1.getcolumnname(),1)
		dw_etiq1.setitem(1,'align'+ls_col,li_align)
	case 2
		ls_col = right(dw_etiq2.getcolumnname(),1)
		dw_etiq2.setitem(1,'align'+ls_col,li_align)
	case 3
		ls_col = right(dw_etiq3.getcolumnname(),1)
		dw_etiq3.setitem(1,'align'+ls_col,li_align)
	case 4
		ls_col = right(dw_etiq4.getcolumnname(),1)
		dw_etiq4.setitem(1,'align'+ls_col,li_align)
	case 5
		ls_col = right(dw_etiq5.getcolumnname(),1)
		dw_etiq5.setitem(1,'align'+ls_col,li_align)
end choose
dw_etiq1.event ue_align()
change1 = true
end event

type pb_5 from picturebutton within w_etiqchoix
integer x = 2400
integer y = 1604
integer width = 101
integer height = 88
integer taborder = 100
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Left!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;integer li_align = 0
string ls_col

choose case ii_dw
	case 1
		ls_col = right(dw_etiq1.getcolumnname(),1)
		dw_etiq1.setitem(1,'align'+ls_col,li_align)
	case 2
		ls_col = right(dw_etiq2.getcolumnname(),1)
		dw_etiq2.setitem(1,'align'+ls_col,li_align)
	case 3
		ls_col = right(dw_etiq3.getcolumnname(),1)
		dw_etiq3.setitem(1,'align'+ls_col,li_align)
	case 4
		ls_col = right(dw_etiq4.getcolumnname(),1)
		dw_etiq4.setitem(1,'align'+ls_col,li_align)
	case 5
		ls_col = right(dw_etiq5.getcolumnname(),1)
		dw_etiq5.setitem(1,'align'+ls_col,li_align)
end choose
dw_etiq1.event ue_align()
change1 = true
end event

type pb_4 from picturebutton within w_etiqchoix
integer x = 2505
integer y = 1604
integer width = 101
integer height = 88
integer taborder = 90
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Center!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;integer li_align = 2
string ls_col

choose case ii_dw
	case 1
		ls_col = right(dw_etiq1.getcolumnname(),1)
		dw_etiq1.setitem(1,'align'+ls_col,li_align)
	case 2
		ls_col = right(dw_etiq2.getcolumnname(),1)
		dw_etiq2.setitem(1,'align'+ls_col,li_align)
	case 3
		ls_col = right(dw_etiq3.getcolumnname(),1)
		dw_etiq3.setitem(1,'align'+ls_col,li_align)
	case 4
		ls_col = right(dw_etiq4.getcolumnname(),1)
		dw_etiq4.setitem(1,'align'+ls_col,li_align)
	case 5
		ls_col = right(dw_etiq5.getcolumnname(),1)
		dw_etiq5.setitem(1,'align'+ls_col,li_align)
end choose
dw_etiq1.event ue_align()
change1 = true
end event

type pb_3 from picturebutton within w_etiqchoix
integer x = 2117
integer y = 1604
integer width = 110
integer height = 96
integer taborder = 90
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Italic!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;string ls_col

choose case ii_dw
	case 1
		ls_col = right(dw_etiq1.getcolumnname(),1)
		if dw_etiq1.getitemnumber(1,'italic'+ls_col) = 1 then
			dw_etiq1.setitem(1,'italic'+ls_col,0)
		else
			dw_etiq1.setitem(1,'italic'+ls_col,1)
		end if
	case 2
		ls_col = right(dw_etiq2.getcolumnname(),1)
		if dw_etiq2.getitemnumber(1,'italic'+ls_col) = 1 then
			dw_etiq2.setitem(1,'italic'+ls_col,0)
		else
			dw_etiq2.setitem(1,'italic'+ls_col,1)
		end if
	case 3
		ls_col = right(dw_etiq3.getcolumnname(),1)
		if dw_etiq3.getitemnumber(1,'italic'+ls_col) = 1 then
			dw_etiq3.setitem(1,'italic'+ls_col,0)
		else
			dw_etiq3.setitem(1,'italic'+ls_col,1)
		end if
	case 4
		ls_col = right(dw_etiq4.getcolumnname(),1)
		if dw_etiq4.getitemnumber(1,'italic'+ls_col) = 1 then
			dw_etiq4.setitem(1,'italic'+ls_col,0)
		else
			dw_etiq4.setitem(1,'italic'+ls_col,1)
		end if
	case 5
		ls_col = right(dw_etiq5.getcolumnname(),1)
		if dw_etiq5.getitemnumber(1,'italic'+ls_col) = 1 then
			dw_etiq5.setitem(1,'italic'+ls_col,0)
		else
			dw_etiq5.setitem(1,'italic'+ls_col,1)
		end if
end choose
change1 = true
end event

type pb_2 from picturebutton within w_etiqchoix
integer x = 2011
integer y = 1604
integer width = 101
integer height = 88
integer taborder = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Bold!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;string ls_col

choose case ii_dw
	case 1
		ls_col = right(dw_etiq1.getcolumnname(),1)
		if dw_etiq1.getitemnumber(1,'bold'+ls_col) = 1 then
			dw_etiq1.setitem(1,'bold'+ls_col,0)
		else
			dw_etiq1.setitem(1,'bold'+ls_col,1)
		end if
	case 2
		ls_col = right(dw_etiq2.getcolumnname(),1)
		if dw_etiq2.getitemnumber(1,'bold'+ls_col) = 1 then
			dw_etiq2.setitem(1,'bold'+ls_col,0)
		else
			dw_etiq2.setitem(1,'bold'+ls_col,1)
		end if
	case 3
		ls_col = right(dw_etiq3.getcolumnname(),1)
		if dw_etiq3.getitemnumber(1,'bold'+ls_col) = 1 then
			dw_etiq3.setitem(1,'bold'+ls_col,0)
		else
			dw_etiq3.setitem(1,'bold'+ls_col,1)
		end if
	case 4
		ls_col = right(dw_etiq4.getcolumnname(),1)
		if dw_etiq4.getitemnumber(1,'bold'+ls_col) = 1 then
			dw_etiq4.setitem(1,'bold'+ls_col,0)
		else
			dw_etiq4.setitem(1,'bold'+ls_col,1)
		end if
	case 5
		ls_col = right(dw_etiq5.getcolumnname(),1)
		if dw_etiq5.getitemnumber(1,'bold'+ls_col) = 1 then
			dw_etiq5.setitem(1,'bold'+ls_col,0)
		else
			dw_etiq5.setitem(1,'bold'+ls_col,1)
		end if
end choose
change1 = true
end event

type pb_1 from picturebutton within w_etiqchoix
integer x = 2222
integer y = 1604
integer width = 110
integer height = 96
integer taborder = 70
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Underline!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;string ls_col

choose case ii_dw
	case 1
		ls_col = right(dw_etiq1.getcolumnname(),1)
		if dw_etiq1.getitemnumber(1,'underline'+ls_col) = 1 then
			dw_etiq1.setitem(1,'underline'+ls_col,0)
		else
			dw_etiq1.setitem(1,'underline'+ls_col,1)
		end if
	case 2
		ls_col = right(dw_etiq2.getcolumnname(),1)
		if dw_etiq2.getitemnumber(1,'underline'+ls_col) = 1 then
			dw_etiq2.setitem(1,'underline'+ls_col,0)
		else
			dw_etiq2.setitem(1,'underline'+ls_col,1)
		end if
	case 3
		ls_col = right(dw_etiq3.getcolumnname(),1)
		if dw_etiq3.getitemnumber(1,'underline'+ls_col) = 1 then
			dw_etiq3.setitem(1,'underline'+ls_col,0)
		else
			dw_etiq3.setitem(1,'underline'+ls_col,1)
		end if
	case 4
		ls_col = right(dw_etiq4.getcolumnname(),1)
		if dw_etiq4.getitemnumber(1,'underline'+ls_col) = 1 then
			dw_etiq4.setitem(1,'underline'+ls_col,0)
		else
			dw_etiq4.setitem(1,'underline'+ls_col,1)
		end if
	case 5
		ls_col = right(dw_etiq5.getcolumnname(),1)
		if dw_etiq5.getitemnumber(1,'underline'+ls_col) = 1 then
			dw_etiq5.setitem(1,'underline'+ls_col,0)
		else
			dw_etiq5.setitem(1,'underline'+ls_col,1)
		end if
end choose
change1 = true
end event

type dw_etiq5 from u_dw within w_etiqchoix
event ue_fusion ( )
integer x = 2011
integer y = 1304
integer width = 1362
integer height = 288
integer taborder = 60
string title = "etiq"
string dataobject = "d_etiq5"
boolean vscrollbar = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_fusion();long ll_idcontact
n_cst_fusion luo_fusion

select id_contact into :ll_idcontact from patient where patient_id = :il_patid;
setitem(1,'line17',luo_fusion.of_fusion(getitemstring(1,'line17'),ll_idcontact,0))
setitem(1,'line18',luo_fusion.of_fusion(getitemstring(1,'line18'),ll_idcontact,0))
setitem(1,'line19',luo_fusion.of_fusion(getitemstring(1,'line19'),ll_idcontact,0))
setitem(1,'line20',luo_fusion.of_fusion(getitemstring(1,'line20'),ll_idcontact,0))
end event

event getfocus;ii_dw = 5
end event

event editchanged;if rb_edit.checked then
	change1 = true
end if
end event

event itemchanged;if rb_edit.checked then
	change1 = true
end if
end event

event rbuttondown;scrolltorow(row)
if rb_edit.checked and row > 0 then
	m_insertinfo my_menu
	my_menu = create m_insertinfo
	message.powerObjectParm = this
	m_insertinfo.uf_translate()
	m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
	destroy my_menu
	change1 = true
end if

end event

type dw_etiq4 from u_dw within w_etiqchoix
event ue_fusion ( )
integer x = 2011
integer y = 1000
integer width = 1362
integer height = 288
integer taborder = 50
string title = "etiq"
string dataobject = "d_etiq4"
boolean vscrollbar = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_fusion();long ll_idcontact
n_cst_fusion luo_fusion 

select id_contact into :ll_idcontact from patient where patient_id = :il_patid;
setitem(1,'line13',luo_fusion.of_fusion(getitemstring(1,'line13'),ll_idcontact,0))
setitem(1,'line14',luo_fusion.of_fusion(getitemstring(1,'line14'),ll_idcontact,0))
setitem(1,'line15',luo_fusion.of_fusion(getitemstring(1,'line15'),ll_idcontact,0))
setitem(1,'line16',luo_fusion.of_fusion(getitemstring(1,'line16'),ll_idcontact,0))
end event

event getfocus;ii_dw = 4
end event

event itemchanged;if rb_edit.checked then
	change1 = true
end if
end event

event editchanged;if rb_edit.checked then
	change1 = true
end if
end event

event rbuttondown;scrolltorow(row)
if rb_edit.checked and row > 0 then
	m_insertinfo my_menu
	my_menu = create m_insertinfo
	message.powerObjectParm = this
	m_insertinfo.uf_translate()
	m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
	destroy my_menu
	change1 = true
end if

end event

type dw_etiq3 from u_dw within w_etiqchoix
event ue_fusion ( )
integer x = 2011
integer y = 696
integer width = 1362
integer height = 288
integer taborder = 40
string title = "etiq"
string dataobject = "d_etiq3"
boolean vscrollbar = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_fusion();long ll_idcontact
n_cst_fusion luo_fusion

select id_contact into :ll_idcontact from patient where patient_id = :il_patid;
setitem(1,'line9',luo_fusion.of_fusion(getitemstring(1,'line9'),ll_idcontact,0))
setitem(1,'line10',luo_fusion.of_fusion(getitemstring(1,'line10'),ll_idcontact,0))
setitem(1,'line11',luo_fusion.of_fusion(getitemstring(1,'line11'),ll_idcontact,0))
setitem(1,'line12',luo_fusion.of_fusion(getitemstring(1,'line12'),ll_idcontact,0))
end event

event getfocus;ii_dw = 3
end event

event editchanged;if rb_edit.checked then
	change1 = true
end if
end event

event itemchanged;if rb_edit.checked then
	change1 = true
end if
end event

event rbuttondown;scrolltorow(row)
if rb_edit.checked and row > 0 then
	m_insertinfo my_menu
	my_menu = create m_insertinfo
	message.powerObjectParm = this
	m_insertinfo.uf_translate()
	m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
	destroy my_menu
	change1 = true
end if

end event

type dw_etiq2 from u_dw within w_etiqchoix
event ue_fusion ( )
integer x = 2011
integer y = 392
integer width = 1362
integer height = 288
integer taborder = 30
string title = "etiq"
string dataobject = "d_etiq2"
boolean vscrollbar = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_fusion();long ll_idcontact
n_cst_fusion luo_fusion

select id_contact into :ll_idcontact from patient where patient_id = :il_patid;
setitem(1,'line5',luo_fusion.of_fusion(getitemstring(1,'line5'),ll_idcontact,0))
setitem(1,'line6',luo_fusion.of_fusion(getitemstring(1,'line6'),ll_idcontact,0))
setitem(1,'line7',luo_fusion.of_fusion(getitemstring(1,'line7'),ll_idcontact,0))
setitem(1,'line8',luo_fusion.of_fusion(getitemstring(1,'line8'),ll_idcontact,0))
end event

event getfocus;ii_dw = 2
end event

event itemchanged;if rb_edit.checked then
	change1 = true
end if
end event

event editchanged;if rb_edit.checked then
	change1 = true
end if
end event

event rbuttondown;scrolltorow(row)
if rb_edit.checked and row > 0 then
	m_insertinfo my_menu
	my_menu = create m_insertinfo
	message.powerObjectParm = this
	m_insertinfo.uf_translate()
	m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
	destroy my_menu
	change1 = true
end if

end event

type rb_edit from radiobutton within w_etiqchoix
integer x = 2734
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Édition"
end type

event clicked;dw_etiq1.event ue_insertrow()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Edit'
end if
end event

type rb_preview from radiobutton within w_etiqchoix
integer x = 2016
integer width = 494
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Aperçu"
boolean checked = true
end type

event clicked;if change or change1 then
	save()
end if
dw_etiq1.event ue_fusion()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Preview'
end if
end event

type cb_delete from commandbutton within w_etiqchoix
integer x = 896
integer y = 1900
integer width = 869
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;dw_etiqchoix.deleterow(dw_etiqchoix.getrow())
dw_etiqchoix.event rowfocuschanged(dw_etiqchoix.getrow())
change = true
end event

event constructor;if v_langue = 'an' then
	this.text = 'Delete'
end if
end event

type cb_update from commandbutton within w_etiqchoix
integer x = 1765
integer y = 1900
integer width = 878
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarde"
end type

event clicked;save()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type dw_etiq1 from u_dw within w_etiqchoix
event ue_insertrow ( )
event ue_fusion ( )
event ue_align ( )
integer x = 2011
integer y = 88
integer width = 1362
integer height = 288
integer taborder = 20
string title = "etiq"
string dataobject = "d_etiq1"
boolean vscrollbar = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_insertrow();long ll_newrow

dw_etiq1.reset()
dw_etiq2.reset()
dw_etiq3.reset()
dw_etiq4.reset()
dw_etiq5.reset()

dw_etiq1.dataobject = 'd_etiq1'
dw_etiq2.dataobject = 'd_etiq2'
dw_etiq3.dataobject = 'd_etiq3'
dw_etiq4.dataobject = 'd_etiq4'
dw_etiq5.dataobject = 'd_etiq5'
dw_etiq1.SetTransObject(SQLCA)
dw_etiq2.SetTransObject(SQLCA)
dw_etiq3.SetTransObject(SQLCA)
dw_etiq4.SetTransObject(SQLCA)
dw_etiq5.SetTransObject(SQLCA)
dw_etiq1.retrieve(il_idetiq)
dw_etiq2.retrieve(il_idetiq)
dw_etiq3.retrieve(il_idetiq)
dw_etiq4.retrieve(il_idetiq)
dw_etiq5.retrieve(il_idetiq)
event ue_align()
end event

event ue_fusion();long ll_idcontact
n_cst_fusion luo_fusion

select id_contact into :ll_idcontact from patient where patient_id = :il_patid;
setitem(1,'line1',luo_fusion.of_fusion(getitemstring(1,'line1'),ll_idcontact,0))
setitem(1,'line2',luo_fusion.of_fusion(getitemstring(1,'line2'),ll_idcontact,0))
setitem(1,'line3',luo_fusion.of_fusion(getitemstring(1,'line3'),ll_idcontact,0))
setitem(1,'line4',luo_fusion.of_fusion(getitemstring(1,'line4'),ll_idcontact,0))
dw_etiq2.event ue_fusion()
dw_etiq3.event ue_fusion()
dw_etiq4.event ue_fusion()
dw_etiq5.event ue_fusion()
end event

event ue_align();dw_etiq1.modify("line1.alignment = " + string(dw_etiq1.getitemnumber(1,'align1')))
dw_etiq1.modify("line2.alignment = " + string(dw_etiq1.getitemnumber(1,'align2')))
dw_etiq1.modify("line3.alignment = " + string(dw_etiq1.getitemnumber(1,'align3')))
dw_etiq1.modify("line4.alignment = " + string(dw_etiq1.getitemnumber(1,'align4')))

dw_etiq2.modify("line5.alignment = " + string(dw_etiq2.getitemnumber(1,'align5')))
dw_etiq2.modify("line6.alignment = " + string(dw_etiq2.getitemnumber(1,'align6')))
dw_etiq2.modify("line7.alignment = " + string(dw_etiq2.getitemnumber(1,'align7')))
dw_etiq2.modify("line8.alignment = " + string(dw_etiq2.getitemnumber(1,'align8')))

dw_etiq3.modify("line9.alignment = " + string(dw_etiq3.getitemnumber(1,'align9')))
dw_etiq3.modify("line10.alignment = " + string(dw_etiq3.getitemnumber(1,'align10')))
dw_etiq3.modify("line11.alignment = " + string(dw_etiq3.getitemnumber(1,'align11')))
dw_etiq3.modify("line12.alignment = " + string(dw_etiq3.getitemnumber(1,'align12')))

dw_etiq4.modify("line13.alignment = " + string(dw_etiq4.getitemnumber(1,'align13')))
dw_etiq4.modify("line14.alignment = " + string(dw_etiq4.getitemnumber(1,'align14')))
dw_etiq4.modify("line15.alignment = " + string(dw_etiq4.getitemnumber(1,'align15')))
dw_etiq4.modify("line16.alignment = " + string(dw_etiq4.getitemnumber(1,'align16')))

dw_etiq5.modify("line17.alignment = " + string(dw_etiq5.getitemnumber(1,'align17')))
dw_etiq5.modify("line18.alignment = " + string(dw_etiq5.getitemnumber(1,'align18')))
dw_etiq5.modify("line19.alignment = " + string(dw_etiq5.getitemnumber(1,'align19')))
dw_etiq5.modify("line20.alignment = " + string(dw_etiq5.getitemnumber(1,'align20')))
end event

event constructor;SetTransObject(SQLCA)

end event

event editchanged;if rb_edit.checked then
	change1 = true
end if
end event

event itemchanged;if rb_edit.checked then
	change1 = true
end if
end event

event rbuttondown;scrolltorow(row)
if rb_edit.checked and row > 0 then
	m_insertinfo my_menu
	my_menu = create m_insertinfo
	message.powerObjectParm = this
	m_insertinfo.uf_translate()
	m_insertinfo.popmenu (x+pixelsToUnits(xpos, XPixelsToUnits!), y+pixelsToUnits(ypos, YPixelsToUnits!))
	destroy my_menu
	change1 = true
end if

end event

event getfocus;ii_dw = 1
end event

type cb_insert from commandbutton within w_etiqchoix
integer y = 1900
integer width = 896
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;long ll_newrow

rb_preview.visible = true
rb_edit.visible = true

//if change or change1 then
//	save()
//end if

select max(id_etiq) into :il_idetiq from t_etiqchoix;
il_idetiq++

ll_newrow = dw_etiqchoix.insertrow(0)
dw_etiqchoix.SetItem(ll_newrow,'ortho_id',v_no_ortho)
dw_etiqchoix.SetItem(ll_newrow,'choix',1)
dw_etiqchoix.SetItem(ll_newrow,'etiqnom','Custom')
dw_etiqchoix.scrolltorow(ll_newrow)
change = true
dw_etiqchoix.event rowfocuschanged(ll_newrow)
dw_etiq1.event ue_insertrow()

rb_edit.checked = true
end event

event constructor;if v_langue = 'an' then
	this.text = 'Add'
end if
end event

type st_title from statictext within w_etiqchoix
integer width = 1490
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Édition des étiquettes"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Label Setup'
end if
end event

type dw_etiqchoix from u_dw within w_etiqchoix
event ue_setsysetiq ( long row )
integer y = 88
integer width = 1719
integer height = 1808
integer taborder = 10
string title = "etiqchoix"
string dataobject = "d_etiqchoix"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_setsysetiq(long row);integer v_print, enr = 0, id, v_referents_id
string ls_Item,ls_dw1,ls_dw2,ls_dw3,ls_dw4,ls_dw5
date ldt_datenaiss

ls_dw1 = dw_etiqchoix.getitemstring(row,'refdw1')
ls_dw2 = dw_etiqchoix.getitemstring(row,'refdw2')
ls_dw3 = dw_etiqchoix.getitemstring(row,'refdw3')
ls_dw4 = dw_etiqchoix.getitemstring(row,'refdw4')
ls_dw5 = dw_etiqchoix.getitemstring(row,'refdw5')
CHOOSE CASE dw_etiqchoix.getitemstring(row,'etiqnom')
		
	CASE 'Étiquettes dossier (#pat.)'
		select (new_dossier) into :id from patient where patient_id = :il_patid;
		if isnull(id) = true then
			update patient set new_dossier = '' where patient_id = :il_patid;
			commit;
		end if
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq2.dataobject = ls_dw2
		dw_etiq2.SetTransObject(SQLCA)
		dw_etiq3.dataobject = ls_dw3
		dw_etiq3.SetTransObject(SQLCA)
		dw_etiq4.dataobject = ls_dw4
		dw_etiq4.SetTransObject(SQLCA)
		dw_etiq5.dataobject = ls_dw5
		dw_etiq5.SetTransObject(SQLCA)
		select traitement_id into :id from traitements where patient_id = :il_patid order by traitement_id desc;
		dw_etiq1.retrieve(il_patid, id)
		dw_etiq2.retrieve(il_patid, id)
		dw_etiq3.retrieve(il_patid, id)
		dw_etiq4.retrieve(il_patid, id)
		dw_etiq5.retrieve(il_patid, id)
		ldt_datenaiss = dw_etiq2.getitemdate(dw_etiq2.getrow(),'patient_date_naissance')
		dw_etiq2.object.t_age.text = calculage(ldt_datenaiss)
		dw_etiq3.object.t_age1.text = calculage(ldt_datenaiss)
		dw_etiq3.object.t_age2.text = calculage(ldt_datenaiss)
		enr = dw_etiq1.rowcount()
		if enr = 0 then
			messagebox("Avertissement","Le patient choisi n'a pas de traitement!",Information!)
		end if
		
	CASE 'Consultation'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq2.dataobject = ls_dw2
		dw_etiq2.SetTransObject(SQLCA)
		select traitement_id into :id from traitements where patient_id = :il_patid order by traitement_id desc;
		dw_etiq1.retrieve(il_patid, id)
		dw_etiq2.retrieve(il_patid, id)
		//ldt_datenaiss = dw_etiq2.getitemdate(dw_etiq2.getrow(),'patient_date_naissance')
		dw_etiq2.object.t_age.text = calculage(ldt_datenaiss)
		enr = dw_etiq1.rowcount()
		if enr = 0 then
			messagebox("Avertissement","Le patient choisi n'a pas de traitement!",Information!)
		end if
			
	CASE 'Étiquettes dossier'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq2.dataobject = ls_dw2
		dw_etiq2.SetTransObject(SQLCA)
		dw_etiq3.dataobject = ls_dw3
		dw_etiq3.SetTransObject(SQLCA)
		dw_etiq4.dataobject = ls_dw4
		dw_etiq4.SetTransObject(SQLCA)
		dw_etiq5.dataobject = ls_dw5
		dw_etiq5.SetTransObject(SQLCA)
		select (new_dossier) into :id from patient where patient_id = :il_patid;
		if isnull(id) = true then
			update patient set new_dossier = '' where patient_id = :il_patid;
			commit;
		end if
		select traitement_id into :id from traitements where patient_id = :il_patid order by traitement_id desc;
		dw_etiq1.retrieve(il_patid, id)
		dw_etiq2.retrieve(il_patid, id)
		dw_etiq3.retrieve(il_patid, id)
		dw_etiq4.retrieve(il_patid, id)
		dw_etiq5.retrieve(il_patid, id)
		ldt_datenaiss = dw_etiq2.getitemdate(dw_etiq2.getrow(),'patient_date_naissance')
		dw_etiq2.object.t_age.text = calculage(ldt_datenaiss)
		dw_etiq3.object.t_age1.text = calculage(ldt_datenaiss)
		dw_etiq3.object.t_age2.text = calculage(ldt_datenaiss)
		enr = dw_etiq1.rowcount()
		if enr = 0 then
			messagebox("Avertissement","Le patient choisi n'a pas de traitement!",Information!)
		end if
		
	CASE 'Étiquette patient'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
	//	messagebox(string(il_patid),string(message.doubleparm))
		dw_etiq1.retrieve(il_patid)
		enr = dw_etiq1.rowcount()
		if enr = 0 then
			messagebox("Avertissement","Le patient choisi n'a pas de traitement!",Information!)
		end if
		
	CASE 'Étiquette responsable'
		open(w_etiquettechoixresp)
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
	//	messagebox(string(il_patid),string(message.doubleparm))
		dw_etiq1.retrieve(message.doubleparm)
			
	CASE 'Étiquette référent'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		select referant_nom into :v_referents_id from patient where patient_id = :numero_patient;
		dw_etiq1.retrieve(v_referents_id)
		enr = dw_etiq1.rowcount()
		if enr = 0 then
			messagebox("Avertissement","Le patient choisi n'a pas de référent!",Information!)
		end if
	
	CASE 'Pochette'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		select (new_dossier) into :id from patient where patient_id = :il_patid;
		if isnull(id) = true then
			update patient set new_dossier = '' where patient_id = :il_patid;
			commit;
		end if
		dw_etiq1.retrieve(il_patid)
		enr = dw_etiq1.rowcount()
		
	CASE 'Modèle'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		enr = dw_etiq1.rowcount()
		if enr = 0 then
			messagebox("Avertissement","Le patient choisi n'a pas de traitement!",Information!)
		end if
		
	CASE 'Panorex et ceph'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
	
	CASE 'Étiquettes dossier (1)'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		
	CASE 'Etiquettes dossier (RDV)'	
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
	
	CASE 'Panorex et ceph (1)'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'date_naissance')
		dw_etiq1.object.t_age.text = calculage(ldt_datenaiss)
		
	CASE 'Patient Nom'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		
	CASE 'Patient Rec'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq2.dataobject = ls_dw2
		dw_etiq2.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		dw_etiq2.retrieve(il_patid)
		
	CASE 'Patient Rec (3)'	
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq2.dataobject = ls_dw2
		dw_etiq2.SetTransObject(SQLCA)
		dw_etiq3.dataobject = ls_dw3
		dw_etiq3.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		dw_etiq2.retrieve(il_patid)
		dw_etiq3.retrieve(il_patid)
	
	CASE 'Patient Final Rec'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq2.dataobject = ls_dw2
		dw_etiq2.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		dw_etiq2.retrieve(il_patid)
		
	CASE 'Modèle(1)'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		
	CASE 'Modèle(4)'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		
	CASE 'Étiquette (4)'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		
	CASE 'Modèle(4 courte)'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
	
	CASE 'Modèle patient (4)'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
	
	CASE 'Initial'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'date_naissance')
		dw_etiq1.object.t_age.text = calculage(ldt_datenaiss)
	
	CASE 'Initial (2)'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq2.dataobject = ls_dw2
		dw_etiq2.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		dw_etiq2.retrieve(il_patid)
		ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'date_naissance')
		dw_etiq1.object.t_age.text = calculage(ldt_datenaiss)
		dw_etiq2.object.t_age.text = calculage(ldt_datenaiss)
		
	CASE 'Modèle(2)'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		
	CASE 'Étiq. consultation'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'patient_date_naissance')
		dw_etiq1.object.t_age.text = calculagecomp(ldt_datenaiss)
	
	CASE 'Étiq. contrôle'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'patient_date_naissance')
		dw_etiq1.object.t_age.text = calculagecomp(ldt_datenaiss)
		
	CASE 'Étiq. finals'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'patient_date_naissance')
		dw_etiq1.object.t_age.text = calculagecomp(ldt_datenaiss)
		
	CASE 'Étiq. duplicata'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'patient_date_naissance')
		dw_etiq1.object.t_age.text = calculagecomp(ldt_datenaiss)
	
	CASE 'Étiq. records'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
		ldt_datenaiss = dw_etiq1.getitemdate(dw_etiq1.getrow(),'patient_date_naissance')
		dw_etiq1.object.t_age.text = calculagecomp(ldt_datenaiss)
	
	CASE 'Étiq. patient petit'
		dw_etiq1.dataobject = ls_dw1
		dw_etiq1.SetTransObject(SQLCA)
		dw_etiq1.retrieve(il_patid)
	
	CASE ELSE
		error_type(119)
END CHOOSE
end event

event constructor;if v_langue = 'an' then
	this.object.t_title.text = "Label's name"
end if

SetTransObject(SQLCA)
SetRowFocusIndicator(FocusRect!)
il_patid = w_patient.il_patid
Retrieve(v_no_ortho)

end event

event rowfocuschanged;long ll_newrow
integer v_print, enr = 0, id, v_referents_id
string ls_dw1,ls_dw2,ls_dw3,ls_dw4,ls_dw5
date ldt_datenaiss

if change or change1 then
	save()
end if

dw_etiq1.reset()
dw_etiq2.reset()
dw_etiq3.reset()
dw_etiq4.reset()
dw_etiq5.reset()

il_idetiq = getitemnumber(currentrow,'id_etiq')
if il_idetiq > 0 then
	if isnull(getitemstring(currentrow,'refdw1')) = false then
		cb_delete.enabled = false
		rb_edit.visible = false
		rb_preview.visible = false
		dw_etiqchoix.modify("etiqnom.edit.displayonly = true")
		event ue_setsysetiq(currentrow)
	else
		cb_delete.enabled = true
		rb_edit.visible = true
		rb_preview.visible = true
		dw_etiqchoix.modify("etiqnom.edit.displayonly = false")
		dw_etiq1.event ue_insertrow()
		if rb_preview.checked then
			dw_etiq1.event ue_fusion()
		end if
	end if
end if
end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

type cb_close from commandbutton within w_etiqchoix
integer x = 2642
integer y = 1900
integer width = 955
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;if change or change1 then
	if error_type(200) = 1 then
		save()
	end if
end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

