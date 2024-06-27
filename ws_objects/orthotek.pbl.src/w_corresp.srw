$PBExportHeader$w_corresp.srw
forward
global type w_corresp from w_child
end type
type cb_1 from commandbutton within w_corresp
end type
type st_15 from statictext within w_corresp
end type
type dw_lettrepat from u_dw within w_corresp
end type
type mle_texte from multilineedit within w_corresp
end type
type st_14 from statictext within w_corresp
end type
type st_13 from statictext within w_corresp
end type
type dw_lettretype from u_dw within w_corresp
end type
type sle_nom from singlelineedit within w_corresp
end type
type st_12 from statictext within w_corresp
end type
type pb_l1 from picturebutton within w_corresp
end type
type st_11 from statictext within w_corresp
end type
type st_10 from statictext within w_corresp
end type
type st_9 from statictext within w_corresp
end type
type st_8 from statictext within w_corresp
end type
type st_7 from statictext within w_corresp
end type
type st_6 from statictext within w_corresp
end type
type st_5 from statictext within w_corresp
end type
type st_4 from statictext within w_corresp
end type
type st_3 from statictext within w_corresp
end type
type st_2 from statictext within w_corresp
end type
type dw_ligne2 from u_dw within w_corresp
end type
type dw_ligne8 from u_dw within w_corresp
end type
type dw_ligne3 from u_dw within w_corresp
end type
type dw_ligne1 from u_dw within w_corresp
end type
type dw_ligne10 from u_dw within w_corresp
end type
type dw_ligne9 from u_dw within w_corresp
end type
type dw_ligne7 from u_dw within w_corresp
end type
type dw_ligne6 from u_dw within w_corresp
end type
type dw_ligne4 from u_dw within w_corresp
end type
type dw_ligne5 from u_dw within w_corresp
end type
type cb_print from commandbutton within w_corresp
end type
type cb_close from commandbutton within w_corresp
end type
type cb_savetype from commandbutton within w_corresp
end type
type cb_savpat from commandbutton within w_corresp
end type
type st_1 from statictext within w_corresp
end type
type pb_l2 from picturebutton within w_corresp
end type
type pb_l3 from picturebutton within w_corresp
end type
type pb_l4 from picturebutton within w_corresp
end type
type pb_l5 from picturebutton within w_corresp
end type
type pb_l6 from picturebutton within w_corresp
end type
type pb_l7 from picturebutton within w_corresp
end type
type pb_l8 from picturebutton within w_corresp
end type
type pb_l9 from picturebutton within w_corresp
end type
type pb_l10 from picturebutton within w_corresp
end type
end forward

global type w_corresp from w_child
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
boolean center = true
boolean ib_isupdateable = false
cb_1 cb_1
st_15 st_15
dw_lettrepat dw_lettrepat
mle_texte mle_texte
st_14 st_14
st_13 st_13
dw_lettretype dw_lettretype
sle_nom sle_nom
st_12 st_12
pb_l1 pb_l1
st_11 st_11
st_10 st_10
st_9 st_9
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
dw_ligne2 dw_ligne2
dw_ligne8 dw_ligne8
dw_ligne3 dw_ligne3
dw_ligne1 dw_ligne1
dw_ligne10 dw_ligne10
dw_ligne9 dw_ligne9
dw_ligne7 dw_ligne7
dw_ligne6 dw_ligne6
dw_ligne4 dw_ligne4
dw_ligne5 dw_ligne5
cb_print cb_print
cb_close cb_close
cb_savetype cb_savetype
cb_savpat cb_savpat
st_1 st_1
pb_l2 pb_l2
pb_l3 pb_l3
pb_l4 pb_l4
pb_l5 pb_l5
pb_l6 pb_l6
pb_l7 pb_l7
pb_l8 pb_l8
pb_l9 pb_l9
pb_l10 pb_l10
end type
global w_corresp w_corresp

type variables
public DataWindowChild dddw_ligne1
public DataWindowChild dddw_ligne2
public DataWindowChild dddw_ligne3
public DataWindowChild dddw_ligne4
public DataWindowChild dddw_ligne5
public DataWindowChild dddw_ligne6
public DataWindowChild dddw_ligne7
public DataWindowChild dddw_ligne8
public DataWindowChild dddw_ligne9
public DataWindowChild dddw_ligne10
private long il_patid = 0
private long il_lettreid = 0

end variables

forward prototypes
public subroutine f_retrieve (long pl_retrieve)
end prototypes

public subroutine f_retrieve (long pl_retrieve);choose case pl_retrieve
	case 1
		if dw_ligne1.GetChild('id_ligne', dddw_ligne1) = -1 then
			error_type(0)
		end if
		dddw_ligne1.SetTransObject(SQLCA)
		dddw_ligne1.setFilter("pos = 1")
		dddw_ligne1.retrieve()
		dw_ligne1.retrieve()
	case 2
		if dw_ligne2.GetChild('id_ligne', dddw_ligne2) = -1 then
			error_type(0)
		end if
		dddw_ligne2.SetTransObject(SQLCA)
		dddw_ligne2.setFilter("pos = 2")
		dddw_ligne2.retrieve()
		dw_ligne2.retrieve()
	case 3
		if dw_ligne3.GetChild('id_ligne', dddw_ligne3) = -1 then
			error_type(0)
		end if
		dddw_ligne3.SetTransObject(SQLCA)
		dddw_ligne3.setFilter("pos = 3")
		dddw_ligne3.retrieve()
		dw_ligne3.retrieve()
	case 4
		if dw_ligne4.GetChild('id_ligne', dddw_ligne4) = -1 then
			error_type(0)
		end if
		dddw_ligne4.SetTransObject(SQLCA)
		dddw_ligne4.setFilter("pos = 4")
		dddw_ligne4.retrieve()
		dw_ligne4.retrieve()
	case 5
		if dw_ligne5.GetChild('id_ligne', dddw_ligne5) = -1 then
			error_type(0)
		end if
		dddw_ligne5.SetTransObject(SQLCA)
		dddw_ligne5.setFilter("pos = 5")
		dddw_ligne5.retrieve()
		dw_ligne5.retrieve()
	case 6
		if dw_ligne6.GetChild('id_ligne', dddw_ligne6) = -1 then
			error_type(0)
		end if
		dddw_ligne6.SetTransObject(SQLCA)
		dddw_ligne6.setFilter("pos = 6")
		dddw_ligne6.retrieve()
		dw_ligne6.retrieve()
	case 7
		if dw_ligne7.GetChild('id_ligne', dddw_ligne7) = -1 then
			error_type(0)
		end if
		dddw_ligne7.SetTransObject(SQLCA)
		dddw_ligne7.setFilter("pos = 7")
		dddw_ligne7.retrieve()
		dw_ligne7.retrieve()
	case 8
		if dw_ligne8.GetChild('id_ligne', dddw_ligne8) = -1 then
			error_type(0)
		end if
		dddw_ligne8.SetTransObject(SQLCA)
		dddw_ligne8.setFilter("pos = 8")
		dddw_ligne8.retrieve()
		dw_ligne8.retrieve()
	case 9
		if dw_ligne9.GetChild('id_ligne', dddw_ligne9) = -1 then
			error_type(0)
		end if
		dddw_ligne9.SetTransObject(SQLCA)
		dddw_ligne9.setFilter("pos = 9")
		dddw_ligne9.retrieve()
		dw_ligne9.retrieve()
	case 10
		if dw_ligne10.GetChild('id_ligne', dddw_ligne10) = -1 then
			error_type(0)
		end if
		dddw_ligne10.SetTransObject(SQLCA)
		dddw_ligne10.setFilter("pos = 10")
		dddw_ligne10.retrieve()
		dw_ligne10.retrieve()
end choose

end subroutine

on w_corresp.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.st_15=create st_15
this.dw_lettrepat=create dw_lettrepat
this.mle_texte=create mle_texte
this.st_14=create st_14
this.st_13=create st_13
this.dw_lettretype=create dw_lettretype
this.sle_nom=create sle_nom
this.st_12=create st_12
this.pb_l1=create pb_l1
this.st_11=create st_11
this.st_10=create st_10
this.st_9=create st_9
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.dw_ligne2=create dw_ligne2
this.dw_ligne8=create dw_ligne8
this.dw_ligne3=create dw_ligne3
this.dw_ligne1=create dw_ligne1
this.dw_ligne10=create dw_ligne10
this.dw_ligne9=create dw_ligne9
this.dw_ligne7=create dw_ligne7
this.dw_ligne6=create dw_ligne6
this.dw_ligne4=create dw_ligne4
this.dw_ligne5=create dw_ligne5
this.cb_print=create cb_print
this.cb_close=create cb_close
this.cb_savetype=create cb_savetype
this.cb_savpat=create cb_savpat
this.st_1=create st_1
this.pb_l2=create pb_l2
this.pb_l3=create pb_l3
this.pb_l4=create pb_l4
this.pb_l5=create pb_l5
this.pb_l6=create pb_l6
this.pb_l7=create pb_l7
this.pb_l8=create pb_l8
this.pb_l9=create pb_l9
this.pb_l10=create pb_l10
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.st_15
this.Control[iCurrent+3]=this.dw_lettrepat
this.Control[iCurrent+4]=this.mle_texte
this.Control[iCurrent+5]=this.st_14
this.Control[iCurrent+6]=this.st_13
this.Control[iCurrent+7]=this.dw_lettretype
this.Control[iCurrent+8]=this.sle_nom
this.Control[iCurrent+9]=this.st_12
this.Control[iCurrent+10]=this.pb_l1
this.Control[iCurrent+11]=this.st_11
this.Control[iCurrent+12]=this.st_10
this.Control[iCurrent+13]=this.st_9
this.Control[iCurrent+14]=this.st_8
this.Control[iCurrent+15]=this.st_7
this.Control[iCurrent+16]=this.st_6
this.Control[iCurrent+17]=this.st_5
this.Control[iCurrent+18]=this.st_4
this.Control[iCurrent+19]=this.st_3
this.Control[iCurrent+20]=this.st_2
this.Control[iCurrent+21]=this.dw_ligne2
this.Control[iCurrent+22]=this.dw_ligne8
this.Control[iCurrent+23]=this.dw_ligne3
this.Control[iCurrent+24]=this.dw_ligne1
this.Control[iCurrent+25]=this.dw_ligne10
this.Control[iCurrent+26]=this.dw_ligne9
this.Control[iCurrent+27]=this.dw_ligne7
this.Control[iCurrent+28]=this.dw_ligne6
this.Control[iCurrent+29]=this.dw_ligne4
this.Control[iCurrent+30]=this.dw_ligne5
this.Control[iCurrent+31]=this.cb_print
this.Control[iCurrent+32]=this.cb_close
this.Control[iCurrent+33]=this.cb_savetype
this.Control[iCurrent+34]=this.cb_savpat
this.Control[iCurrent+35]=this.st_1
this.Control[iCurrent+36]=this.pb_l2
this.Control[iCurrent+37]=this.pb_l3
this.Control[iCurrent+38]=this.pb_l4
this.Control[iCurrent+39]=this.pb_l5
this.Control[iCurrent+40]=this.pb_l6
this.Control[iCurrent+41]=this.pb_l7
this.Control[iCurrent+42]=this.pb_l8
this.Control[iCurrent+43]=this.pb_l9
this.Control[iCurrent+44]=this.pb_l10
end on

on w_corresp.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.st_15)
destroy(this.dw_lettrepat)
destroy(this.mle_texte)
destroy(this.st_14)
destroy(this.st_13)
destroy(this.dw_lettretype)
destroy(this.sle_nom)
destroy(this.st_12)
destroy(this.pb_l1)
destroy(this.st_11)
destroy(this.st_10)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_ligne2)
destroy(this.dw_ligne8)
destroy(this.dw_ligne3)
destroy(this.dw_ligne1)
destroy(this.dw_ligne10)
destroy(this.dw_ligne9)
destroy(this.dw_ligne7)
destroy(this.dw_ligne6)
destroy(this.dw_ligne4)
destroy(this.dw_ligne5)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.cb_savetype)
destroy(this.cb_savpat)
destroy(this.st_1)
destroy(this.pb_l2)
destroy(this.pb_l3)
destroy(this.pb_l4)
destroy(this.pb_l5)
destroy(this.pb_l6)
destroy(this.pb_l7)
destroy(this.pb_l8)
destroy(this.pb_l9)
destroy(this.pb_l10)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_patid = message.doubleparm

dw_ligne1.retrieve()
dw_ligne2.retrieve()
dw_ligne3.retrieve()
dw_ligne4.retrieve()
dw_ligne5.retrieve()
dw_ligne6.retrieve()
dw_ligne7.retrieve()
dw_ligne8.retrieve()
dw_ligne9.retrieve()
dw_ligne10.retrieve()
dw_lettretype.retrieve()
dw_lettrepat.retrieve(il_patid)
if dw_lettrepat.rowcount() = 0 then
	dw_lettretype.event afficherlettre(1)
end if

end event

type cb_1 from commandbutton within w_corresp
integer x = 1879
integer y = 1928
integer width = 626
integer height = 104
integer taborder = 290
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Aperçu"
end type

type st_15 from statictext within w_corresp
integer x = 2039
integer y = 732
integer width = 494
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lettre du patient"
boolean focusrectangle = false
end type

type dw_lettrepat from u_dw within w_corresp
event afficherlettre ( long row )
integer x = 2043
integer y = 820
integer width = 1527
integer height = 548
integer taborder = 120
string title = "none"
string dataobject = "d_lettrepat"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event afficherlettre(long row);long ll_ligne1, ll_ligne2, ll_ligne3, ll_ligne4, ll_ligne5
long ll_ligne6, ll_ligne7, ll_ligne8, ll_ligne9, ll_ligne10, ll_row
string ls_nomlettre
date ldt_lettre

il_lettreid = dw_lettrepat.getItemNumber(row,'id_lettre')

select nomlettre, ligne1, ligne2, ligne3, ligne4, ligne5, ligne6, ligne7, ligne8, ligne9, ligne10
into   :ls_nomlettre, :ll_ligne1, :ll_ligne2, :ll_ligne3, :ll_ligne4, :ll_ligne5, :ll_ligne6, :ll_ligne7, :ll_ligne8, :ll_ligne9, :ll_ligne10
from t_lettrepat where id_lettre = :il_lettreid;
ll_row = dw_ligne1.find("id_ligne = " + string(ll_ligne1),1,dw_ligne1.rowcount())
sle_nom.text  = ls_nomlettre
dw_ligne1.scrollToRow(ll_row)
ll_row = dw_ligne2.find("id_ligne = " + string(ll_ligne2),1,dw_ligne2.rowcount())
dw_ligne2.scrollToRow(ll_row)
ll_row = dw_ligne3.find("id_ligne = " + string(ll_ligne3),1,dw_ligne3.rowcount())
dw_ligne3.scrollToRow(ll_row)
ll_row = dw_ligne4.find("id_ligne = " + string(ll_ligne4),1,dw_ligne4.rowcount())
dw_ligne4.scrollToRow(ll_row)
ll_row = dw_ligne5.find("id_ligne = " + string(ll_ligne5),1,dw_ligne5.rowcount())
dw_ligne5.scrollToRow(ll_row)
ll_row = dw_ligne6.find("id_ligne = " + string(ll_ligne6),1,dw_ligne6.rowcount())
dw_ligne6.scrollToRow(ll_row)
ll_row = dw_ligne7.find("id_ligne = " + string(ll_ligne7),1,dw_ligne7.rowcount())
dw_ligne7.scrollToRow(ll_row)
ll_row = dw_ligne8.find("id_ligne = " + string(ll_ligne8),1,dw_ligne8.rowcount())
dw_ligne8.scrollToRow(ll_row)
ll_row = dw_ligne9.find("id_ligne = " + string(ll_ligne9),1,dw_ligne9.rowcount())
dw_ligne9.scrollToRow(ll_row)
ll_row = dw_ligne10.find("id_ligne = " + string(ll_ligne10),1,dw_ligne10.rowcount())
dw_ligne10.scrollToRow(ll_row)
end event

event constructor;setRowFocusIndicator(HAND!)
setTransObject(SQLCA)
end event

event rowfocuschanged;if dw_lettrepat.rowcount() > 0 then
	dw_lettrepat.event afficherlettre(currentrow)
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
OpenWithParm (w_error,ErrorStr)
//do not display the error message
RETURN 1
end event

type mle_texte from multilineedit within w_corresp
integer x = 2053
integer y = 1472
integer width = 1527
integer height = 444
integer taborder = 230
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_14 from statictext within w_corresp
integer x = 2048
integer y = 1408
integer width = 187
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Texte"
boolean focusrectangle = false
end type

type st_13 from statictext within w_corresp
integer x = 2034
integer y = 88
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lettre type"
boolean focusrectangle = false
end type

type dw_lettretype from u_dw within w_corresp
event afficherlettre ( long row )
integer x = 2043
integer y = 172
integer width = 1531
integer height = 548
integer taborder = 130
string title = "none"
string dataobject = "d_lettretype"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event afficherlettre(long row);long ll_ligne1, ll_ligne2, ll_ligne3, ll_ligne4, ll_ligne5
long ll_ligne6, ll_ligne7, ll_ligne8, ll_ligne9, ll_ligne10, ll_row
string ls_nomlettre
date ldt_lettre

if dw_lettretype.rowcount() > 0 then
	il_lettreid = dw_lettretype.getItemNumber(row,'id_lettre')
	
	select nomlettre, ligne1, ligne2, ligne3, ligne4, ligne5, ligne6, ligne7, ligne8, ligne9, ligne10
	into   :ls_nomlettre, :ll_ligne1, :ll_ligne2, :ll_ligne3, :ll_ligne4, :ll_ligne5, :ll_ligne6, :ll_ligne7, :ll_ligne8, :ll_ligne9, :ll_ligne10
	from t_lettretype where id_lettre = :il_lettreid;
	ll_row = dw_ligne1.find("id_ligne = " + string(ll_ligne1),1,dw_ligne1.rowcount())
	sle_nom.text  = ls_nomlettre
	dw_ligne1.scrollToRow(ll_row)
	ll_row = dw_ligne2.find("id_ligne = " + string(ll_ligne2),1,dw_ligne2.rowcount())
	dw_ligne2.scrollToRow(ll_row)
	ll_row = dw_ligne3.find("id_ligne = " + string(ll_ligne3),1,dw_ligne3.rowcount())
	dw_ligne3.scrollToRow(ll_row)
	ll_row = dw_ligne4.find("id_ligne = " + string(ll_ligne4),1,dw_ligne4.rowcount())
	dw_ligne4.scrollToRow(ll_row)
	ll_row = dw_ligne5.find("id_ligne = " + string(ll_ligne5),1,dw_ligne5.rowcount())
	dw_ligne5.scrollToRow(ll_row)
	ll_row = dw_ligne6.find("id_ligne = " + string(ll_ligne6),1,dw_ligne6.rowcount())
	dw_ligne6.scrollToRow(ll_row)
	ll_row = dw_ligne7.find("id_ligne = " + string(ll_ligne7),1,dw_ligne7.rowcount())
	dw_ligne7.scrollToRow(ll_row)
	ll_row = dw_ligne8.find("id_ligne = " + string(ll_ligne8),1,dw_ligne8.rowcount())
	dw_ligne8.scrollToRow(ll_row)
	ll_row = dw_ligne9.find("id_ligne = " + string(ll_ligne9),1,dw_ligne9.rowcount())
	dw_ligne9.scrollToRow(ll_row)
	ll_row = dw_ligne10.find("id_ligne = " + string(ll_ligne10),1,dw_ligne10.rowcount())
	dw_ligne10.scrollToRow(ll_row)
end if
end event

event constructor;setRowFocusIndicator(HAND!)
setTransObject(SQLCA)
end event

event rowfocuschanged;if dw_lettretype.rowcount() > 0 then
	dw_lettretype.event afficherlettre(currentrow)
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

type sle_nom from singlelineedit within w_corresp
integer x = 393
integer y = 1804
integer width = 1074
integer height = 92
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_12 from statictext within w_corresp
integer x = 37
integer y = 1816
integer width = 343
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nom lettre"
boolean focusrectangle = false
end type

type pb_l1 from picturebutton within w_corresp
integer x = 1856
integer y = 184
integer width = 165
integer height = 112
integer taborder = 140
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "DosEdit!"
alignment htextalign = left!
end type

event clicked;
openwithparm(w_lettretext,1)
end event

type st_11 from statictext within w_corresp
integer x = 32
integer y = 1684
integer width = 110
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "10."
boolean focusrectangle = false
end type

type st_10 from statictext within w_corresp
integer x = 32
integer y = 1520
integer width = 110
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "9."
boolean focusrectangle = false
end type

type st_9 from statictext within w_corresp
integer x = 32
integer y = 1352
integer width = 110
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "8."
boolean focusrectangle = false
end type

type st_8 from statictext within w_corresp
integer x = 32
integer y = 1184
integer width = 110
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "7."
boolean focusrectangle = false
end type

type st_7 from statictext within w_corresp
integer x = 32
integer y = 1024
integer width = 110
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "6."
boolean focusrectangle = false
end type

type st_6 from statictext within w_corresp
integer x = 32
integer y = 860
integer width = 110
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "5."
boolean focusrectangle = false
end type

type st_5 from statictext within w_corresp
integer x = 32
integer y = 696
integer width = 110
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "4."
boolean focusrectangle = false
end type

type st_4 from statictext within w_corresp
integer x = 32
integer y = 536
integer width = 110
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "3."
boolean focusrectangle = false
end type

type st_3 from statictext within w_corresp
integer x = 32
integer y = 364
integer width = 110
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "2."
boolean focusrectangle = false
end type

type st_2 from statictext within w_corresp
integer x = 32
integer y = 200
integer width = 110
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1."
boolean focusrectangle = false
end type

type dw_ligne2 from u_dw within w_corresp
integer x = 151
integer y = 352
integer width = 1691
integer height = 96
integer taborder = 20
string title = "none"
string dataobject = "d_ligne"
boolean border = false
end type

event constructor;if this.GetChild('id_ligne', dddw_ligne2) = -1 then
	error_type(0)
end if
dddw_ligne2.SetTransObject(SQLCA)
dddw_ligne2.setFilter("pos = 2")
dddw_ligne2.retrieve()
end event

event itemchanged;string ls_text
long ll_idligne

ll_idligne = long(data)
select texte into :ls_text from t_lignes where id_ligne = :ll_idligne;
mle_texte.text = ls_text
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

type dw_ligne8 from u_dw within w_corresp
integer x = 151
integer y = 1336
integer width = 1691
integer height = 96
integer taborder = 80
string title = "none"
string dataobject = "d_ligne"
boolean border = false
end type

event constructor;if this.GetChild('id_ligne', dddw_ligne8) = -1 then
	error_type(0)
end if
dddw_ligne8.SetTransObject(SQLCA)
dddw_ligne8.setFilter("pos = 8")
dddw_ligne8.retrieve()
end event

event itemchanged;string ls_text
long ll_idligne

ll_idligne = long(data)
select texte into :ls_text from t_lignes where id_ligne = :ll_idligne;
mle_texte.text = ls_text
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

type dw_ligne3 from u_dw within w_corresp
integer x = 151
integer y = 516
integer width = 1691
integer height = 96
integer taborder = 30
string title = "none"
string dataobject = "d_ligne"
boolean border = false
end type

event constructor;if this.GetChild('id_ligne', dddw_ligne3) = -1 then
	error_type(0)
end if
dddw_ligne3.SetTransObject(SQLCA)
dddw_ligne3.setFilter("pos = 3")
dddw_ligne3.retrieve()
end event

event itemchanged;string ls_text
long ll_idligne

ll_idligne = long(data)
select texte into :ls_text from t_lignes where id_ligne = :ll_idligne;
mle_texte.text = ls_text
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

type dw_ligne1 from u_dw within w_corresp
integer x = 151
integer y = 188
integer width = 1691
integer height = 108
integer taborder = 10
string title = "none"
string dataobject = "d_ligne"
boolean border = false
end type

event constructor;dw_ligne1.setTransObject(SQLCA)

if this.GetChild('id_ligne', dddw_ligne1) = -1 then
	error_type(0)
end if
dddw_ligne1.SetTransObject(SQLCA)
dddw_ligne1.setFilter("pos = 1")
dddw_ligne1.retrieve()

dw_ligne2.setTransObject(SQLCA)
dw_ligne3.setTransObject(SQLCA)
dw_ligne4.setTransObject(SQLCA)
dw_ligne5.setTransObject(SQLCA)
dw_ligne6.setTransObject(SQLCA)
dw_ligne7.setTransObject(SQLCA)
dw_ligne8.setTransObject(SQLCA)
dw_ligne9.setTransObject(SQLCA)
dw_ligne10.setTransObject(SQLCA)


end event

event itemchanged;string ls_text
long ll_idligne

ll_idligne = long(data)
select texte into :ls_text from t_lignes where id_ligne = :ll_idligne;
mle_texte.text = ls_text
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

type dw_ligne10 from u_dw within w_corresp
integer x = 155
integer y = 1664
integer width = 1691
integer height = 96
integer taborder = 100
string title = "none"
string dataobject = "d_ligne"
boolean border = false
end type

event constructor;if this.GetChild('id_ligne', dddw_ligne10) = -1 then
	error_type(0)
end if
dddw_ligne10.SetTransObject(SQLCA)
dddw_ligne10.setFilter("pos = 10")
dddw_ligne10.retrieve()
end event

event itemchanged;string ls_text
long ll_idligne

ll_idligne = long(data)
select texte into :ls_text from t_lignes where id_ligne = :ll_idligne;
mle_texte.text = ls_text
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

type dw_ligne9 from u_dw within w_corresp
integer x = 155
integer y = 1500
integer width = 1691
integer height = 96
integer taborder = 90
string title = "none"
string dataobject = "d_ligne"
boolean border = false
end type

event constructor;if this.GetChild('id_ligne', dddw_ligne9) = -1 then
	error_type(0)
end if
dddw_ligne9.SetTransObject(SQLCA)
dddw_ligne9.setFilter("pos = 9")
dddw_ligne9.retrieve()
end event

event itemchanged;string ls_text
long ll_idligne

ll_idligne = long(data)
select texte into :ls_text from t_lignes where id_ligne = :ll_idligne;
mle_texte.text = ls_text
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

type dw_ligne7 from u_dw within w_corresp
integer x = 151
integer y = 1172
integer width = 1691
integer height = 96
integer taborder = 70
string title = "none"
string dataobject = "d_ligne"
boolean border = false
end type

event constructor;if this.GetChild('id_ligne', dddw_ligne7) = -1 then
	error_type(0)
end if
dddw_ligne7.SetTransObject(SQLCA)
dddw_ligne7.setFilter("pos = 7")
dddw_ligne7.retrieve()
end event

event itemchanged;string ls_text
long ll_idligne

ll_idligne = long(data)
select texte into :ls_text from t_lignes where id_ligne = :ll_idligne;
mle_texte.text = ls_text
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

type dw_ligne6 from u_dw within w_corresp
integer x = 151
integer y = 1008
integer width = 1691
integer height = 96
integer taborder = 60
string title = "none"
string dataobject = "d_ligne"
boolean border = false
end type

event constructor;if this.GetChild('id_ligne', dddw_ligne6) = -1 then
	error_type(0)
end if
dddw_ligne6.SetTransObject(SQLCA)
dddw_ligne6.setFilter("pos = 6")
dddw_ligne6.retrieve()
end event

event itemchanged;string ls_text
long ll_idligne

ll_idligne = long(data)
select texte into :ls_text from t_lignes where id_ligne = :ll_idligne;
mle_texte.text = ls_text
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

type dw_ligne4 from u_dw within w_corresp
integer x = 151
integer y = 680
integer width = 1691
integer height = 96
integer taborder = 40
string title = "none"
string dataobject = "d_ligne"
boolean border = false
end type

event constructor;if this.GetChild('id_ligne', dddw_ligne4) = -1 then
	error_type(0)
end if
dddw_ligne4.SetTransObject(SQLCA)
dddw_ligne4.setFilter("pos = 4")
dddw_ligne4.retrieve()
end event

event itemchanged;string ls_text
long ll_idligne

ll_idligne = long(data)
select texte into :ls_text from t_lignes where id_ligne = :ll_idligne;
mle_texte.text = ls_text
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

type dw_ligne5 from u_dw within w_corresp
integer x = 151
integer y = 844
integer width = 1691
integer height = 96
integer taborder = 50
string title = "none"
string dataobject = "d_ligne"
boolean border = false
end type

event constructor;if this.GetChild('id_ligne', dddw_ligne5) = -1 then
	error_type(0)
end if
dddw_ligne5.SetTransObject(SQLCA)
dddw_ligne5.setFilter("pos = 5")
dddw_ligne5.retrieve()
end event

event itemchanged;string ls_text
long ll_idligne

ll_idligne = long(data)
select texte into :ls_text from t_lignes where id_ligne = :ll_idligne;
mle_texte.text = ls_text
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

type cb_print from commandbutton within w_corresp
integer x = 2505
integer y = 1928
integer width = 517
integer height = 104
integer taborder = 280
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;datastore ds_lettre

ds_lettre = create datastore
ds_lettre.dataobject = "d_lettrefusimp"
ds_lettre.setTransObject(SQLCA)
ds_lettre.retrieve(il_lettreid)
gb_datawindow = false
openwithparm(w_print_options,ds_lettre)
end event

type cb_close from commandbutton within w_corresp
integer x = 3026
integer y = 1928
integer width = 539
integer height = 104
integer taborder = 260
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

type cb_savetype from commandbutton within w_corresp
integer x = 869
integer y = 1928
integer width = 1010
integer height = 104
integer taborder = 240
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder comme lettre type"
end type

event clicked;long ll_ligne1, ll_ligne2, ll_ligne3, ll_ligne4, ll_ligne5 
long ll_ligne6, ll_ligne7, ll_ligne8, ll_ligne9, ll_ligne10
long ll_presence
date ldt_lettre
string ls_nomlettre

if error_type(229) = 1 then
	ldt_lettre = today()
	ls_nomlettre = sle_nom.text
	if isnull(ls_nomlettre) = false and ls_nomlettre <> "" then
		select count(*) into :ll_presence from t_lettretype where nomlettre = :ls_nomlettre;
		ll_ligne1 = dw_ligne1.getItemNumber(dw_ligne1.getRow(),'id_ligne')
		ll_ligne2 = dw_ligne2.getItemNumber(dw_ligne2.getRow(),'id_ligne')
		ll_ligne3 = dw_ligne3.getItemNumber(dw_ligne3.getRow(),'id_ligne')
		ll_ligne4 = dw_ligne4.getItemNumber(dw_ligne4.getRow(),'id_ligne')
		ll_ligne5 = dw_ligne5.getItemNumber(dw_ligne5.getRow(),'id_ligne')
		ll_ligne6 = dw_ligne6.getItemNumber(dw_ligne6.getRow(),'id_ligne')
		ll_ligne7 = dw_ligne7.getItemNumber(dw_ligne7.getRow(),'id_ligne')
		ll_ligne8 = dw_ligne8.getItemNumber(dw_ligne8.getRow(),'id_ligne')
		ll_ligne9 = dw_ligne9.getItemNumber(dw_ligne9.getRow(),'id_ligne')
		ll_ligne10 = dw_ligne10.getItemNumber(dw_ligne10.getRow(),'id_ligne')		
		
		if ll_presence <= 0 then
         insert into t_lettretype(lettredate,nomlettre,ligne1,ligne2,ligne3,ligne4,ligne5,ligne6,ligne7,ligne8,ligne9,ligne10)
			values(:ldt_lettre,:ls_nomlettre,:ll_ligne1,:ll_ligne2,:ll_ligne3,:ll_ligne4,:ll_ligne5,:ll_ligne6,:ll_ligne7,:ll_ligne8,:ll_ligne9,:ll_ligne10);			
		else
			update t_lettretype set lettredate = :ldt_lettre, 
			nomlettre = :ls_nomlettre, ligne1= :ll_ligne1, ligne2 = :ll_ligne2,
			ligne3 = :ll_ligne3, ligne4 = :ll_ligne4, ligne5 = :ll_ligne5,
			ligne6 = :ll_ligne6, ligne7 = :ll_ligne7, ligne8 = :ll_ligne8,
			ligne9 = :ll_ligne9, ligne10 = :ll_ligne10 
			where nomlettre = :ls_nomlettre;
		end if		
		dw_lettretype.retrieve()
	else
		error_type(144)
	end if
end if
end event

type cb_savpat from commandbutton within w_corresp
integer x = 27
integer y = 1928
integer width = 841
integer height = 104
integer taborder = 150
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder pour patient"
end type

event clicked;long ll_ligne1, ll_ligne2, ll_ligne3, ll_ligne4, ll_ligne5 
long ll_ligne6, ll_ligne7, ll_ligne8, ll_ligne9, ll_ligne10
long ll_presence
date ldt_lettre
string ls_nomlettre

if error_type(229) = 1 then
	ldt_lettre = today()
	ls_nomlettre = sle_nom.text
	if isnull(ls_nomlettre) = false and ls_nomlettre <> "" then
		select count(*) into :ll_presence from t_lettrepat where nomlettre = :ls_nomlettre and patient_id = :il_patid;
		ll_ligne1 = dw_ligne1.getItemNumber(dw_ligne1.getRow(),'id_ligne')
		ll_ligne2 = dw_ligne2.getItemNumber(dw_ligne2.getRow(),'id_ligne')
		ll_ligne3 = dw_ligne3.getItemNumber(dw_ligne3.getRow(),'id_ligne')
		ll_ligne4 = dw_ligne4.getItemNumber(dw_ligne4.getRow(),'id_ligne')
		ll_ligne5 = dw_ligne5.getItemNumber(dw_ligne5.getRow(),'id_ligne')
		ll_ligne6 = dw_ligne6.getItemNumber(dw_ligne6.getRow(),'id_ligne')
		ll_ligne7 = dw_ligne7.getItemNumber(dw_ligne7.getRow(),'id_ligne')
		ll_ligne8 = dw_ligne8.getItemNumber(dw_ligne8.getRow(),'id_ligne')
		ll_ligne9 = dw_ligne9.getItemNumber(dw_ligne9.getRow(),'id_ligne')
		ll_ligne10 = dw_ligne10.getItemNumber(dw_ligne10.getRow(),'id_ligne')
		if ll_presence <= 0 then
         insert into t_lettrepat(lettredate,patient_id,nomlettre,ligne1,ligne2,ligne3,ligne4,ligne5,ligne6,ligne7,ligne8,ligne9,ligne10)
			values(:ldt_lettre,:il_patid,:ls_nomlettre,:ll_ligne1,:ll_ligne2,:ll_ligne3,:ll_ligne4,:ll_ligne5,:ll_ligne6,:ll_ligne7,:ll_ligne8,:ll_ligne9,:ll_ligne10);			
		else
			update t_lettrepat set lettredate = :ldt_lettre, patient_id = :il_patid,
			nomlettre = :ls_nomlettre, ligne1= :ll_ligne1, ligne2 = :ll_ligne2,
			ligne3 = :ll_ligne3, ligne4 = :ll_ligne4, ligne5 = :ll_ligne5,
			ligne6 = :ll_ligne6, ligne7 = :ll_ligne7, ligne8 = :ll_ligne8,
			ligne9 = :ll_ligne9, ligne10 = :ll_ligne10 
			where nomlettre = :ls_nomlettre and patient_id = :il_patid;
		end if
		dw_lettrepat.retrieve(il_patid)		
	else
		error_type(144)
	end if
end if

end event

type st_1 from statictext within w_corresp
integer x = 14
integer y = 12
integer width = 667
integer height = 88
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Correspondance"
boolean focusrectangle = false
end type

type pb_l2 from picturebutton within w_corresp
integer x = 1856
integer y = 348
integer width = 165
integer height = 112
integer taborder = 160
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "DosEdit!"
alignment htextalign = left!
end type

event clicked;openwithparm(w_lettretext,2)
end event

type pb_l3 from picturebutton within w_corresp
integer x = 1856
integer y = 512
integer width = 165
integer height = 112
integer taborder = 170
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "DosEdit!"
alignment htextalign = left!
end type

event clicked;openwithparm(w_lettretext,3)
end event

type pb_l4 from picturebutton within w_corresp
integer x = 1856
integer y = 676
integer width = 165
integer height = 112
integer taborder = 180
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "DosEdit!"
alignment htextalign = left!
end type

event clicked;openwithparm(w_lettretext,4)
end event

type pb_l5 from picturebutton within w_corresp
integer x = 1856
integer y = 844
integer width = 165
integer height = 112
integer taborder = 250
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "DosEdit!"
alignment htextalign = left!
end type

event clicked;openwithparm(w_lettretext,5)
end event

type pb_l6 from picturebutton within w_corresp
integer x = 1856
integer y = 1008
integer width = 165
integer height = 112
integer taborder = 270
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "DosEdit!"
alignment htextalign = left!
end type

event clicked;openwithparm(w_lettretext,6)
end event

type pb_l7 from picturebutton within w_corresp
integer x = 1856
integer y = 1172
integer width = 165
integer height = 112
integer taborder = 190
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "DosEdit!"
alignment htextalign = left!
end type

event clicked;openwithparm(w_lettretext,7)
end event

type pb_l8 from picturebutton within w_corresp
integer x = 1856
integer y = 1332
integer width = 165
integer height = 112
integer taborder = 200
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "DosEdit!"
alignment htextalign = left!
end type

event clicked;openwithparm(w_lettretext,8)
end event

type pb_l9 from picturebutton within w_corresp
integer x = 1856
integer y = 1496
integer width = 165
integer height = 112
integer taborder = 210
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "DosEdit!"
alignment htextalign = left!
end type

event clicked;openwithparm(w_lettretext,9)
end event

type pb_l10 from picturebutton within w_corresp
integer x = 1856
integer y = 1660
integer width = 165
integer height = 112
integer taborder = 220
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "DosEdit!"
alignment htextalign = left!
end type

event clicked;openwithparm(w_lettretext,10)
end event

