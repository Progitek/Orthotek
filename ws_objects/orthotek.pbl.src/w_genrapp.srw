$PBExportHeader$w_genrapp.srw
forward
global type w_genrapp from w_child
end type
type pb_save from picturebutton within w_genrapp
end type
type st_name from statictext within w_genrapp
end type
type pb_1 from picturebutton within w_genrapp
end type
type ddlb_fontsize from u_ddlb within w_genrapp
end type
type ddlb_fontname from u_ddlb within w_genrapp
end type
type pb_right from picturebutton within w_genrapp
end type
type pb_center from picturebutton within w_genrapp
end type
type pb_left from picturebutton within w_genrapp
end type
type pb_underline from picturebutton within w_genrapp
end type
type pb_italic from picturebutton within w_genrapp
end type
type pb_bold from picturebutton within w_genrapp
end type
type sle_text from singlelineedit within w_genrapp
end type
type pb_4 from picturebutton within w_genrapp
end type
type pb_oval from picturebutton within w_genrapp
end type
type pb_rect from picturebutton within w_genrapp
end type
type pb_text from picturebutton within w_genrapp
end type
type cb_2 from commandbutton within w_genrapp
end type
type dw_rapport from u_dw within w_genrapp
end type
type cb_1 from commandbutton within w_genrapp
end type
end forward

global type w_genrapp from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
boolean ib_isupdateable = false
pb_save pb_save
st_name st_name
pb_1 pb_1
ddlb_fontsize ddlb_fontsize
ddlb_fontname ddlb_fontname
pb_right pb_right
pb_center pb_center
pb_left pb_left
pb_underline pb_underline
pb_italic pb_italic
pb_bold pb_bold
sle_text sle_text
pb_4 pb_4
pb_oval pb_oval
pb_rect pb_rect
pb_text pb_text
cb_2 cb_2
dw_rapport dw_rapport
cb_1 cb_1
end type
global w_genrapp w_genrapp

type variables
s_gentext st_gentext
private long il_rapport
boolean change = false
end variables

forward prototypes
public subroutine uf_settext (string as_name)
public function long uf_getcurrentline (string as_name)
public subroutine updatechange (string as_syntax, string as_linemod, long al_line)
public subroutine uf_addnewcol (string as_colname)
public function string uf_gettext (string as_type)
end prototypes

public subroutine uf_settext (string as_name);st_gentext.as_band = dw_rapport.describe(as_name + ".band")
st_gentext.as_alignment = dw_rapport.describe(as_name + ".alignment")
st_gentext.as_text = dw_rapport.describe(as_name + ".text")
st_gentext.as_border = dw_rapport.describe(as_name + ".border")
st_gentext.as_color = dw_rapport.describe(as_name + ".color")
st_gentext.as_x = dw_rapport.describe(as_name + ".x")
st_gentext.as_y = dw_rapport.describe(as_name + ".y")
st_gentext.as_height = dw_rapport.describe(as_name + ".height")
st_gentext.as_width = dw_rapport.describe(as_name + ".width")
st_gentext.as_html= "0"
st_gentext.as_name = as_name
st_gentext.as_visible = dw_rapport.describe(as_name+ ".visible")
st_gentext.as_resizeable = dw_rapport.describe(as_name + ".resizeable")
st_gentext.as_moveable = dw_rapport.describe(as_name + ".moveable")
st_gentext.as_fontface = dw_rapport.describe(as_name + ".font.face")
st_gentext.as_fontheight = dw_rapport.describe(as_name + ".font.height")
st_gentext.as_fontweight = dw_rapport.describe(as_name + ".font.weight")
st_gentext.as_fontfamily = dw_rapport.describe(as_name + ".font.family")
st_gentext.as_fontpitch = dw_rapport.describe(as_name + ".font.pitch")
st_gentext.as_fontcharset = dw_rapport.describe(as_name + ".font.charset")
st_gentext.as_fontitalic = dw_rapport.describe(as_name + ".font.italic")
st_gentext.as_fontunderline = dw_rapport.describe(as_name + ".font.underline")
st_gentext.as_backmode = dw_rapport.describe(as_name + ".background.mode")
st_gentext.as_backcolor = dw_rapport.describe(as_name + ".background.color")
st_gentext.as_id = dw_rapport.describe(as_name + ".ID")
st_gentext.as_tabsequence = dw_rapport.describe(as_name + ".tabsequence")
st_gentext.as_format = dw_rapport.describe(as_name + ".format")
sle_text.text = dw_rapport.describe(as_name + ".text")
st_name.text = as_name
ddlb_fontname.text = dw_rapport.describe(as_name + ".font.face")
ddlb_fontsize.text = string(long(dw_rapport.describe(as_name + ".font.height")) * -1)
end subroutine

public function long uf_getcurrentline (string as_name);string ls_syntax, ls_temp, ls_text[], ls_name
long ll_oldpos, ll_newpos, ll_ligne

ll_oldpos = 1
ll_ligne = 1
ls_syntax = dw_rapport.object.datawindow.syntax
ls_temp = " "

DO WHILE ls_temp <> ""

	ll_newpos = pos(ls_syntax,'~r~n',ll_oldpos)
	ls_temp = mid(ls_syntax,ll_oldpos,ll_newpos - ll_oldpos)
	ll_oldpos = ll_newpos + 2
	if left(ls_temp,4) = 'text' then
		ls_temp = mid(ls_temp,6,len(ls_temp))
		ls_text = split(ls_temp,' ')
		ls_name = right(ls_text[1],len(ls_text[1]) - pos(ls_text[1],'='))
		if as_name = ls_name then
			return ll_ligne
		end if
	else
		if left(ls_temp,6) = 'column' then
			ls_temp = mid(ls_temp,8,len(ls_temp))
			ls_text = split(ls_temp,' ')
			ls_name = right(ls_text[1],len(ls_text[1]) - pos(ls_text[1],'='))
			if as_name = ls_name then
				return ll_ligne
			end if
		end if
	end if
	ll_ligne++

loop

return 0
end function

public subroutine updatechange (string as_syntax, string as_linemod, long al_line);string ls_newsyntax = "", ls_temp, ls_ErrorString
long ll_oldpos, ll_newpos, ll_ligne

ll_oldpos = 1
ll_ligne = 1
ls_temp = " "

DO WHILE ls_temp <> ""

	ll_newpos = pos(as_syntax,'~r~n',ll_oldpos)
	ls_temp = mid(as_syntax,ll_oldpos,ll_newpos - ll_oldpos)
	ll_oldpos = ll_newpos + 2
	if ll_ligne = al_line then
		ls_newsyntax += as_linemod
	else
		ls_newsyntax += ls_temp
	end if
	ll_ligne++

loop

dw_rapport.create(ls_newsyntax,ls_ErrorString)
dw_rapport.insertRow(0)
end subroutine

public subroutine uf_addnewcol (string as_colname);string ls_syntax, ls_ErrorString
long ll_colid

select colid into :ll_colid from t_rapport where id_rapport = :il_rapport;

ls_syntax = dw_rapport.describe("datawindow.syntax")
ls_syntax += 'column(band=detail id=' + string(ll_colid) + ' alignment="1" tabsequence=' + string(ll_colid * 10) + ' border="5" color="0" x="1" y="1" height="64" width="366" format="[general]" html.valueishtml="0"  name=' + as_colname + ' visible="1" resizeable=1  moveable=1 font.face="Arial" font.height="-10" font.weight="400" font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215")~r~n'

update t_rapport set colid = colid + 1 where id_rapport = :il_rapport;
if error_type(-1) = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

dw_rapport.create(ls_syntax,ls_ErrorString)
dw_rapport.insertRow(0)
change = true
end subroutine

public function string uf_gettext (string as_type);string ls_syntax

if as_type = 'text' then
	
	ls_syntax =  'text(name=' + st_gentext.as_name + ' '
	ls_syntax += 'visible="' + st_gentext.as_visible + '" '
	ls_syntax += 'moveable='+ st_gentext.as_moveable + ' '
	ls_syntax += 'resizeable=' + st_gentext.as_resizeable + ' '
	ls_syntax += 'band='+ st_gentext.as_band + ' '
	ls_syntax += 'font.charset="' + st_gentext.as_fontcharset + '" '
	ls_syntax += 'font.face="' + st_gentext.as_fontface + '" '
	ls_syntax += 'font.family="' + st_gentext.as_fontfamily + '" '
	ls_syntax += 'font.height="' + st_gentext.as_fontheight + '" '
	ls_syntax += 'font.pitch="' + st_gentext.as_fontpitch + '" '
	ls_syntax += 'font.weight="' + st_gentext.as_fontweight + '" '
	ls_syntax += 'font.italic="' + st_gentext.as_fontitalic + '" '
	ls_syntax += 'font.underline="' + st_gentext.as_fontunderline + '" '
	ls_syntax += 'background.mode="' + st_gentext.as_backmode + '" '
	ls_syntax += 'background.color="' + st_gentext.as_backcolor + '" '
	ls_syntax += 'color="' + st_gentext.as_color + '" '
	ls_syntax += 'alignment="' + st_gentext.as_alignment + '" '
	ls_syntax += 'border="' + st_gentext.as_border + '" '
	ls_syntax += 'x="' + st_gentext.as_x + '" '
	ls_syntax += 'y="' + st_gentext.as_y + '" '
	ls_syntax += 'height="' + st_gentext.as_height + '" '
	ls_syntax += 'width="' + st_gentext.as_width + '" '
	ls_syntax += 'text="' + st_gentext.as_text + '")'
	
elseif as_type = 'column' then
	
	ls_syntax = 'column(name=' + st_gentext.as_name + ' '
	ls_syntax += 'visible="' + st_gentext.as_visible + '" '
	ls_syntax += 'moveable=' + st_gentext.as_moveable + ' ' 
	ls_syntax += 'resizeable=' + st_gentext.as_resizeable + '" ' 
	ls_syntax += 'band=' + st_gentext.as_band + ' '
	ls_syntax += 'id=' + st_gentext.as_id + ' '
	ls_syntax += 'x="' + st_gentext.as_x + '" '
	ls_syntax += 'y="' + st_gentext.as_y + '" ' 
	ls_syntax += 'height="' + st_gentext.as_height + '" '
	ls_syntax += 'width="' + st_gentext.as_width + '" ' 
	ls_syntax += 'color="' + st_gentext.as_color + '" ' 
	ls_syntax += 'border="' + st_gentext.as_border + '" ' 
	ls_syntax += 'alignment="' + st_gentext.as_alignment + '" ' 
	ls_syntax += 'format="' + st_gentext.as_format + '" ' 
	ls_syntax += 'background.mode="' + st_gentext.as_backmode + '" ' 
	ls_syntax += 'background.color="' + st_gentext.as_backcolor + '" ' 
	ls_syntax += 'font.charset="' + st_gentext.as_fontcharset + '" ' 
	ls_syntax += 'font.face="' + st_gentext.as_fontface + '" ' 
	ls_syntax += 'font.family="' + st_gentext.as_fontface + '" ' 
	ls_syntax += 'font.height="' + st_gentext.as_fontheight + '" ' 
	ls_syntax += 'font.pitch="' + st_gentext.as_fontpitch + '" ' 
	ls_syntax += 'font.weight="' + st_gentext.as_fontweight + '" ' 
	ls_syntax += 'tabsequence=' + st_gentext.as_tabsequence + ")"
	
end if

return ls_syntax
end function

on w_genrapp.create
int iCurrent
call super::create
this.pb_save=create pb_save
this.st_name=create st_name
this.pb_1=create pb_1
this.ddlb_fontsize=create ddlb_fontsize
this.ddlb_fontname=create ddlb_fontname
this.pb_right=create pb_right
this.pb_center=create pb_center
this.pb_left=create pb_left
this.pb_underline=create pb_underline
this.pb_italic=create pb_italic
this.pb_bold=create pb_bold
this.sle_text=create sle_text
this.pb_4=create pb_4
this.pb_oval=create pb_oval
this.pb_rect=create pb_rect
this.pb_text=create pb_text
this.cb_2=create cb_2
this.dw_rapport=create dw_rapport
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_save
this.Control[iCurrent+2]=this.st_name
this.Control[iCurrent+3]=this.pb_1
this.Control[iCurrent+4]=this.ddlb_fontsize
this.Control[iCurrent+5]=this.ddlb_fontname
this.Control[iCurrent+6]=this.pb_right
this.Control[iCurrent+7]=this.pb_center
this.Control[iCurrent+8]=this.pb_left
this.Control[iCurrent+9]=this.pb_underline
this.Control[iCurrent+10]=this.pb_italic
this.Control[iCurrent+11]=this.pb_bold
this.Control[iCurrent+12]=this.sle_text
this.Control[iCurrent+13]=this.pb_4
this.Control[iCurrent+14]=this.pb_oval
this.Control[iCurrent+15]=this.pb_rect
this.Control[iCurrent+16]=this.pb_text
this.Control[iCurrent+17]=this.cb_2
this.Control[iCurrent+18]=this.dw_rapport
this.Control[iCurrent+19]=this.cb_1
end on

on w_genrapp.destroy
call super::destroy
destroy(this.pb_save)
destroy(this.st_name)
destroy(this.pb_1)
destroy(this.ddlb_fontsize)
destroy(this.ddlb_fontname)
destroy(this.pb_right)
destroy(this.pb_center)
destroy(this.pb_left)
destroy(this.pb_underline)
destroy(this.pb_italic)
destroy(this.pb_bold)
destroy(this.sle_text)
destroy(this.pb_4)
destroy(this.pb_oval)
destroy(this.pb_rect)
destroy(this.pb_text)
destroy(this.cb_2)
destroy(this.dw_rapport)
destroy(this.cb_1)
end on

event open;call super::open;string ls_syntax, ls_ErrorString

il_rapport = message.doubleparm

select donnee into :ls_syntax from t_rapport where id_rapport = :il_rapport;

dw_rapport.create(ls_syntax,ls_ErrorString)
dw_rapport.insertRow(0)
end event

type pb_save from picturebutton within w_genrapp
integer x = 5
integer y = 448
integer width = 101
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean originalsize = true
string picturename = "Save!"
alignment htextalign = left!
end type

event clicked;string ls_syntax

ls_syntax = dw_rapport.object.datawindow.syntax

update t_rapport set donnee = :ls_syntax where id_rapport = :il_rapport;
if error_type(-1) = 1 then
	commit using SQLCA;
	change = false
else
	rollback using SQLCA;
end if
end event

type st_name from statictext within w_genrapp
integer x = 2853
integer y = 1944
integer width = 370
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type pb_1 from picturebutton within w_genrapp
integer x = 5
integer y = 8
integer width = 101
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "PlaceColumn5!"
alignment htextalign = left!
end type

event clicked;openwithparm(w_choixcol,il_rapport)
change = true
end event

type ddlb_fontsize from u_ddlb within w_genrapp
integer x = 1577
integer y = 1932
integer width = 233
integer taborder = 100
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean sorted = false
string item[] = {"8","10","12","14","18"}
end type

event selectionchanged;call super::selectionchanged;string ls_linemod, ls_syntax
long ll_line

st_gentext.as_fontheight = string(long(this.text) * -1)
ls_syntax =  dw_rapport.object.datawindow.syntax
ls_linemod = uf_getText('text')
ll_line = uf_getCurrentLine(st_name.text)

updatechange(ls_syntax,ls_linemod,ll_line)
change = true
end event

type ddlb_fontname from u_ddlb within w_genrapp
integer x = 736
integer y = 1932
integer width = 832
integer taborder = 90
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
string item[] = {"Arial"}
end type

event selectionchanged;call super::selectionchanged;change = true
end event

type pb_right from picturebutton within w_genrapp
integer x = 622
integer y = 1936
integer width = 101
integer height = 88
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean originalsize = true
string picturename = "Right!"
alignment htextalign = left!
end type

event clicked;string ls_linemod, ls_syntax
long ll_line

st_gentext.as_alignment = "1"
ls_syntax =  dw_rapport.object.datawindow.syntax
ls_linemod = uf_getText('text')
ll_line = uf_getCurrentLine(st_name.text)

updatechange(ls_syntax,ls_linemod,ll_line)
change = true
end event

type pb_center from picturebutton within w_genrapp
integer x = 521
integer y = 1936
integer width = 101
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean originalsize = true
string picturename = "Center!"
alignment htextalign = left!
end type

event clicked;string ls_linemod, ls_syntax
long ll_line

st_gentext.as_alignment = "2"
ls_syntax =  dw_rapport.object.datawindow.syntax
ls_linemod = uf_getText('text')
ll_line = uf_getCurrentLine(st_name.text)

updatechange(ls_syntax,ls_linemod,ll_line)
change = true
end event

type pb_left from picturebutton within w_genrapp
integer x = 421
integer y = 1936
integer width = 101
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean originalsize = true
string picturename = "Left!"
alignment htextalign = left!
end type

event clicked;string ls_linemod, ls_syntax
long ll_line

st_gentext.as_alignment = "0"
ls_syntax =  dw_rapport.object.datawindow.syntax
ls_linemod = uf_getText('text')
ll_line = uf_getCurrentLine(st_name.text)

updatechange(ls_syntax,ls_linemod,ll_line)
change = true
end event

type pb_underline from picturebutton within w_genrapp
integer x = 320
integer y = 1936
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "Underline!"
alignment htextalign = left!
end type

event clicked;string ls_linemod, ls_syntax
long ll_line

if st_gentext.as_fontunderline = "1" then
	st_gentext.as_fontunderline = "0"
else
	st_gentext.as_fontunderline = "1"
end if

ls_syntax =  dw_rapport.object.datawindow.syntax
ls_linemod = uf_getText('text')
ll_line = uf_getCurrentLine(st_name.text)

updatechange(ls_syntax,ls_linemod,ll_line)
change = true
end event

type pb_italic from picturebutton within w_genrapp
integer x = 219
integer y = 1936
integer width = 101
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean originalsize = true
string picturename = "Italic!"
alignment htextalign = left!
end type

event clicked;string ls_linemod, ls_syntax
long ll_line

if st_gentext.as_fontitalic = "1" then
	st_gentext.as_fontitalic = "0"
else
	st_gentext.as_fontitalic = "1"
end if

ls_syntax =  dw_rapport.object.datawindow.syntax
ls_linemod = uf_getText('text')
ll_line = uf_getCurrentLine(st_name.text)

updatechange(ls_syntax,ls_linemod,ll_line)
change = true
end event

type pb_bold from picturebutton within w_genrapp
integer x = 119
integer y = 1936
integer width = 101
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean originalsize = true
string picturename = "Bold!"
alignment htextalign = left!
end type

event clicked;string ls_linemod, ls_syntax
long ll_line

if st_gentext.as_fontweight = "400" then
	st_gentext.as_fontweight = "700"
else
	st_gentext.as_fontweight = "400"
end if

ls_syntax =  dw_rapport.object.datawindow.syntax
ls_linemod = uf_getText('text')
ll_line = uf_getCurrentLine(st_name.text)

updatechange(ls_syntax,ls_linemod,ll_line)
change = true
end event

type sle_text from singlelineedit within w_genrapp
integer x = 1824
integer y = 1932
integer width = 1015
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 1090519039
borderstyle borderstyle = stylelowered!
end type

event modified;string ls_linemod, ls_syntax
long ll_line

st_gentext.as_text = this.text
ls_syntax =  dw_rapport.object.datawindow.syntax
ls_linemod = uf_getText('text')
ll_line = uf_getCurrentLine(st_name.text)

updatechange(ls_syntax,ls_linemod,ll_line)
end event

type pb_4 from picturebutton within w_genrapp
integer x = 5
integer y = 360
integer width = 101
integer height = 88
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "Line!"
alignment htextalign = left!
end type

event clicked;string ls_syntax, ls_ErrorString
long ll_lineid

select lineid into :ll_lineid from t_rapport where id_rapport = :il_rapport;

ls_syntax = dw_rapport.describe("datawindow.syntax")
ls_syntax += '~r~nline(band=detail x1="1" y1="1" x2="439" y2="192"  name=l_' + string(ll_lineid) + ' visible="1" resizeable=1  moveable=1 pen.style="0" pen.width="5" pen.color="0"  background.mode="2" background.color="33554432" )'

update t_rapport set lineid = lineid + 1 where id_rapport = :il_rapport;
if error_type(-1) = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

dw_rapport.create(ls_syntax,ls_ErrorString)
dw_rapport.insertRow(0)
change = true




end event

type pb_oval from picturebutton within w_genrapp
integer x = 5
integer y = 272
integer width = 101
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "Oval!"
alignment htextalign = left!
end type

event clicked;string ls_syntax, ls_ErrorString
long ll_ovalid

select ovalid into :ll_ovalid from t_rapport where id_rapport = :il_rapport;

ls_syntax = dw_rapport.describe("datawindow.syntax")
ls_syntax += '~r~nellipse(band=detail x="1" y="1" height="120" width="137"  name=oval_' + string(ll_ovalid) + ' visible="1" resizeable=1  moveable=1 brush.hatch="7" brush.color="570425344" pen.style="0" pen.width="5" pen.color="33554432"  background.mode="2" background.color="33554432" )'

update t_rapport set ovalid = ovalid + 1 where id_rapport = :il_rapport;
if error_type(-1) = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

dw_rapport.create(ls_syntax,ls_ErrorString)
dw_rapport.insertRow(0)
change = true


end event

type pb_rect from picturebutton within w_genrapp
integer x = 5
integer y = 184
integer width = 101
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "Rectangle!"
alignment htextalign = left!
end type

event clicked;string ls_syntax, ls_ErrorString
long ll_rectid

select rectid into :ll_rectid from t_rapport where id_rapport = :il_rapport;

ls_syntax = dw_rapport.describe("datawindow.syntax")
ls_syntax += '~r~nrectangle(band=detail x="1" y="1" height="120" width="137"  name=r_' + string(ll_rectid) + ' visible="1" resizeable=1  moveable=1 brush.hatch="7" brush.color="33554432" pen.style="0" pen.width="5" pen.color="0"  background.mode="2" background.color="33554432" )'

update t_rapport set rectid = rectid + 1 where id_rapport = :il_rapport;
if error_type(-1) = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

dw_rapport.create(ls_syntax,ls_ErrorString)
dw_rapport.insertRow(0)
change = true








end event

type pb_text from picturebutton within w_genrapp
integer x = 5
integer y = 96
integer width = 101
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "StaticText!"
alignment htextalign = left!
end type

event clicked;string ls_syntax, ls_ErrorString
long ll_textid

select textid into :ll_textid from t_rapport where id_rapport = :il_rapport;

ls_syntax = dw_rapport.describe("datawindow.syntax")
ls_syntax += 'text( band=detail alignment="0" text="none" border="0" color="0" x="1" y="1" height="64" width="288" html.valueishtml="0" name=t_' + string(ll_textid) + ' visible="1" resizeable=1 moveable=1 font.face="Arial" font.height="-10" font.weight="400" font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="553648127")~r~n'

update t_rapport set textid = textid + 1 where id_rapport = :il_rapport;
if error_type(-1) = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

dw_rapport.create(ls_syntax,ls_ErrorString)
dw_rapport.insertRow(0)
change = true
end event

type cb_2 from commandbutton within w_genrapp
integer y = 1652
integer width = 123
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Init"
end type

event clicked;string ls_syntax, ls_ErrorString, ls_nomcol, ls_domname
long ll_idtable, ll_idcol, ll_width, ll_scale

ls_syntax = 'release 9;~r~n'
ls_syntax += 'datawindow(units=0 timer_interval=0 color=1073741824 processing=0 HTMLDW=no print.printername="" print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.canusedefaultprinter=yes print.prompt=no print.buttons=no print.preview.buttons=no print.cliptext=no print.overrideprintjob=no print.collate=yes hidegrayline=no grid.lines=0 )~r~n'
ls_syntax += 'header(height=0 color="536870912" )~r~n'
ls_syntax += 'summary(height=0 color="536870912" )~r~n'
ls_syntax += 'footer(height=0 color="536870912" )~r~n'
ls_syntax += 'detail(height=5000 color="536870912" )~r~n'
ls_syntax += 'table('

DECLARE listchamp CURSOR FOR
	SELECT id_table, id_column FROM t_rappchamps where id_rapport = :il_rapport;
	
OPEN listchamp;

FETCH listchamp INTO :ll_idtable, :ll_idcol;

DO WHILE SQLCA.SQLCode = 0

	select column_name, domain_name, width, scale into :ls_nomcol, :ls_domname, :ll_width, :ll_scale from syscolumn INNER JOIN sysdomain ON syscolumn.domain_id =  sysdomain.domain_id
	where table_id = :ll_idtable and column_id = :ll_idcol;
	
	CHOOSE CASE ls_domname
		
		CASE "integer","smallint","tinyint","bigint"
			ls_syntax += 'column=(type=long updatewhereclause=no name=' + ls_nomcol + ' dbname="' + ls_nomcol + '")'
		CASE "numeric","decimal"
			ls_syntax += 'column=(type=decimal(' + string(ll_scale) + ') updatewhereclause=no name=' + ls_nomcol + ' dbname="' + ls_nomcol + '")'
		CASE "float", "double","bit"
			ls_syntax += 'column=(type=number updatewhereclause=no name=' + ls_nomcol + ' dbname="' + ls_nomcol + '")'
		CASE "date"
			ls_syntax += 'column=(type=date updatewhereclause=no name=' + ls_nomcol + ' dbname="' + ls_nomcol + '")'
		CASE "char","varchar"
			ls_syntax += 'column=(type=char(' + string(ll_width) + ') updatewhereclause=no name=' + ls_nomcol + ' dbname="' + ls_nomcol + '")'
		CASE "long varchar"
			ls_syntax += 'column=(type=char(255) updatewhereclause=no name=' + ls_nomcol + ' dbname="' + ls_nomcol + '")'
		CASE "timestamp"
			ls_syntax += 'column=(type=datetime updatewhereclause=no name=' + ls_nomcol + ' dbname="' + ls_nomcol + '")'
		CASE "time"
			ls_syntax += 'column=(type=time updatewhereclause=no name=' + ls_nomcol + ' dbname="' + ls_nomcol + '")'
		CASE "unsigned int","unsigned smallint","unsigned bigint"
			ls_syntax += 'column=(type=ulong updatewhereclause=no name=' + ls_nomcol + ' dbname="' + ls_nomcol + '")'
	END CHOOSE
	
	FETCH listchamp INTO :ll_idtable, :ll_idcol;
	
LOOP

CLOSE listchamp;

ls_syntax += ')~r~n'

dw_rapport.create(ls_syntax,ls_ErrorString)
dw_rapport.insertRow(0)

update t_rapport set donnee = :ls_syntax where id_rapport = :il_rapport;
if error_type(-1) = 1 then
	commit using SQLCA;
else
	rollback using SQLCA;
end if
end event

type dw_rapport from u_dw within w_genrapp
integer x = 123
integer y = 4
integer width = 3511
integer height = 1908
integer taborder = 10
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;call super::clicked;string ls_text

CHOOSE CASE dwo.Type
	CASE "text"
		uf_settext(string(dwo.name))
//		uf_getCurrentLine(string(dwo.name))
		change = true
	CASE "column"
		uf_settext(string(dwo.name))
		change = true
//		uf_getCurrentLine(string(dwo.name))
END CHOOSE
end event

type cb_1 from commandbutton within w_genrapp
integer x = 3232
integer y = 1924
integer width = 402
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

event clicked;if change then
	if error_type(200) = 1 then
		pb_save.event clicked()
	end if
end if
close(parent)
end event

