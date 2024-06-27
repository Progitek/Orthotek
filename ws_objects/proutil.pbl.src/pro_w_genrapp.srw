﻿$PBExportHeader$pro_w_genrapp.srw
forward
global type pro_w_genrapp from w_child
end type
type pb_line from picturebutton within pro_w_genrapp
end type
type pb_oval from picturebutton within pro_w_genrapp
end type
type pb_rect from picturebutton within pro_w_genrapp
end type
type cb_2 from commandbutton within pro_w_genrapp
end type
type dw_rapport from u_dw within pro_w_genrapp
end type
type lb_1 from u_lb within pro_w_genrapp
end type
type ddlb_1 from u_ddlb within pro_w_genrapp
end type
type cb_1 from commandbutton within pro_w_genrapp
end type
type pb_text from picturebutton within pro_w_genrapp
end type
end forward

global type pro_w_genrapp from w_child
integer width = 3630
integer height = 1944
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
pb_line pb_line
pb_oval pb_oval
pb_rect pb_rect
cb_2 cb_2
dw_rapport dw_rapport
lb_1 lb_1
ddlb_1 ddlb_1
cb_1 cb_1
pb_text pb_text
end type
global pro_w_genrapp pro_w_genrapp

on pro_w_genrapp.create
int iCurrent
call super::create
this.pb_line=create pb_line
this.pb_oval=create pb_oval
this.pb_rect=create pb_rect
this.cb_2=create cb_2
this.dw_rapport=create dw_rapport
this.lb_1=create lb_1
this.ddlb_1=create ddlb_1
this.cb_1=create cb_1
this.pb_text=create pb_text
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_line
this.Control[iCurrent+2]=this.pb_oval
this.Control[iCurrent+3]=this.pb_rect
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.dw_rapport
this.Control[iCurrent+6]=this.lb_1
this.Control[iCurrent+7]=this.ddlb_1
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.pb_text
end on

on pro_w_genrapp.destroy
call super::destroy
destroy(this.pb_line)
destroy(this.pb_oval)
destroy(this.pb_rect)
destroy(this.cb_2)
destroy(this.dw_rapport)
destroy(this.lb_1)
destroy(this.ddlb_1)
destroy(this.cb_1)
destroy(this.pb_text)
end on

type pb_line from picturebutton within pro_w_genrapp
integer x = 402
integer y = 1816
integer width = 123
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Line!"
alignment htextalign = left!
end type

event clicked;string ls_syntax, ls_ErrorString

ls_syntax = dw_rapport.describe("datawindow.syntax")
ls_syntax += '~r~nline(band=detail x1="302" y1="192" x2="439" y2="192"  name=l_1 visible="1" resizeable=1  moveable=1 pen.style="0" pen.width="5" pen.color="0"  background.mode="2" background.color="33554432" )'

dw_rapport.create(ls_syntax,ls_ErrorString)

dw_rapport.insertRow(0)
end event

type pb_oval from picturebutton within pro_w_genrapp
integer x = 274
integer y = 1816
integer width = 123
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Oval!"
alignment htextalign = left!
end type

event clicked;string ls_syntax, ls_ErrorString

ls_syntax = dw_rapport.describe("datawindow.syntax")
ls_syntax += '~r~nellipse(band=detail x="338" y="184" height="120" width="137"  name=oval_1 visible="1" resizeable=1  moveable=1 brush.hatch="7" brush.color="570425344" pen.style="0" pen.width="5" pen.color="33554432"  background.mode="2" background.color="33554432" )'

dw_rapport.create(ls_syntax,ls_ErrorString)

dw_rapport.insertRow(0)
end event

type pb_rect from picturebutton within pro_w_genrapp
integer x = 146
integer y = 1816
integer width = 123
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Rectangle!"
alignment htextalign = left!
end type

event clicked;string ls_syntax, ls_ErrorString

ls_syntax = dw_rapport.describe("datawindow.syntax")
ls_syntax += '~r~nrectangle(band=detail x="14" y="24" height="120" width="137"  name=r_1 visible="1" resizeable=1  moveable=1 brush.hatch="7" brush.color="33554432" pen.style="0" pen.width="5" pen.color="0"  background.mode="2" background.color="33554432" )'


dw_rapport.create(ls_syntax,ls_ErrorString)

dw_rapport.insertRow(0)
end event

type cb_2 from commandbutton within pro_w_genrapp
integer x = 1605
integer y = 1812
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;long ll_nbcol, ll_step, i, ll_row
string ls_string, ls_i, ls_columnDef, ls_precol, ls_syntax, ls_modret, ls_ErrorString

ls_syntax = "release 10;"
ls_syntax += "datawindow(units=0 timer_interval=0 color=1073741824 processing=0 HTMLDW=no print.printername=~"~" print.documentname=~"~" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.canusedefaultprinter=yes print.prompt=no print.buttons=no print.preview.buttons=no print.cliptext=no print.overrideprintjob=no print.collate=yes hidegrayline=no grid.lines=0 )"
ls_syntax += "header(height=0 color=~"536870912~" )"
ls_syntax += "summary(height=0 color=~"536870912~" )"
ls_syntax += "footer(height=0 color=~"536870912~" )"
ls_syntax += "detail(height=5000 color=~"536870912~" )"
ls_syntax += "table(column=(type=date updatewhereclause=no name=datecal dbname=~"datecal~" ))"
ls_syntax += 'column(band=detail id=1 alignment="2" tabsequence=30 border="5" color="0" x="2391" y="4" height="64" width="366" format="[general]" html.valueishtml="0"  name=datecal visible="1" resizeable=1  moveable=1 editmask.mask="dd/mm/yyyy" editmask.focusrectangle=no  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215")'
//ls_syntax += 'text(band=detail alignment="1" text="Téléphone:" border="5" color="0" x="250" y="88" height="64" width="288" html.valueishtml="0"  name=t_5 visible="1" resizeable=1  moveable=1 font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="553648127" )'

dw_rapport.create(ls_syntax,ls_ErrorString)
ll_row = dw_rapport.insertRow(0)
end event

type dw_rapport from u_dw within pro_w_genrapp
integer x = 709
integer y = 4
integer width = 2907
integer height = 1800
integer taborder = 30
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

type lb_1 from u_lb within pro_w_genrapp
integer x = 9
integer y = 120
integer width = 677
integer height = 1688
integer taborder = 20
end type

type ddlb_1 from u_ddlb within pro_w_genrapp
integer y = 4
integer width = 699
integer height = 688
integer taborder = 10
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

type cb_1 from commandbutton within pro_w_genrapp
integer x = 3072
integer y = 1820
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

type pb_text from picturebutton within pro_w_genrapp
integer x = 23
integer y = 1816
integer width = 123
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "StaticText!"
alignment htextalign = left!
end type

event clicked;string ls_syntax, ls_ErrorString, ls_test
long ll_test

ls_syntax = dw_rapport.describe("datawindow.syntax")
ls_syntax += '~r~ntext(band=detail alignment="1" text="Téléphone #3:" border="5" color="0" x="500" y="88" height="64" width="288" html.valueishtml="0"  name=t_7 visible="1" resizeable=1  moveable=1 font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="553648127" )'

dw_rapport.create(ls_syntax,ls_ErrorString)

dw_rapport.insertRow(0)
end event

