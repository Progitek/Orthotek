$PBExportHeader$w_refpatdet.srw
forward
global type w_refpatdet from w_child
end type
type uo_calutil2 from u_calutil within w_refpatdet
end type
type uo_calutil1 from u_calutil within w_refpatdet
end type
type cb_find from commandbutton within w_refpatdet
end type
type st_1 from statictext within w_refpatdet
end type
type em_debut from editmask within w_refpatdet
end type
type em_fin from editmask within w_refpatdet
end type
type st_2 from statictext within w_refpatdet
end type
type dw_patrefdet from u_dw within w_refpatdet
end type
type cb_close from commandbutton within w_refpatdet
end type
type cb_print from commandbutton within w_refpatdet
end type
end forward

global type w_refpatdet from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
boolean ib_isupdateable = false
uo_calutil2 uo_calutil2
uo_calutil1 uo_calutil1
cb_find cb_find
st_1 st_1
em_debut em_debut
em_fin em_fin
st_2 st_2
dw_patrefdet dw_patrefdet
cb_close cb_close
cb_print cb_print
end type
global w_refpatdet w_refpatdet

type variables
private long il_refid
int arret

end variables

on w_refpatdet.create
int iCurrent
call super::create
this.uo_calutil2=create uo_calutil2
this.uo_calutil1=create uo_calutil1
this.cb_find=create cb_find
this.st_1=create st_1
this.em_debut=create em_debut
this.em_fin=create em_fin
this.st_2=create st_2
this.dw_patrefdet=create dw_patrefdet
this.cb_close=create cb_close
this.cb_print=create cb_print
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_calutil2
this.Control[iCurrent+2]=this.uo_calutil1
this.Control[iCurrent+3]=this.cb_find
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.em_debut
this.Control[iCurrent+6]=this.em_fin
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.dw_patrefdet
this.Control[iCurrent+9]=this.cb_close
this.Control[iCurrent+10]=this.cb_print
end on

on w_refpatdet.destroy
call super::destroy
destroy(this.uo_calutil2)
destroy(this.uo_calutil1)
destroy(this.cb_find)
destroy(this.st_1)
destroy(this.em_debut)
destroy(this.em_fin)
destroy(this.st_2)
destroy(this.dw_patrefdet)
destroy(this.cb_close)
destroy(this.cb_print)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

date ldt_start, ldt_end
ldt_start = date(em_debut.text)
ldt_end = date(em_fin.text)
il_refid = message.doubleparm //parmetre externe
dw_patrefdet.retrieve(il_refid,ldt_start,ldt_end)
arret = 0
end event

type uo_calutil2 from u_calutil within w_refpatdet
boolean visible = false
integer x = 2258
integer y = 1360
integer taborder = 60
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_fin.text = string(istr_calutil.caldate)
end event

on uo_calutil2.destroy
call u_calutil::destroy
end on

type uo_calutil1 from u_calutil within w_refpatdet
boolean visible = false
integer x = 1527
integer y = 1360
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_debut.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type cb_find from commandbutton within w_refpatdet
integer x = 622
integer y = 1904
integer width = 608
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;dw_patrefdet.retrieve(il_refid,date(em_debut.text),date(em_fin.text))

end event

event constructor;if v_langue = 'an' then
	cb_find.Text = "Search"
end if
end event

type st_1 from statictext within w_refpatdet
integer x = 1248
integer y = 1920
integer width = 434
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date du début:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_1.Text = "Starting date"
end if
end event

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type em_debut from editmask within w_refpatdet
integer x = 1687
integer y = 1908
integer width = 443
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
end type

event constructor;em_debut.text = '01-01-1900'
end event

type em_fin from editmask within w_refpatdet
integer x = 2418
integer y = 1908
integer width = 443
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
end type

event constructor;em_fin.text = string(today())
end event

type st_2 from statictext within w_refpatdet
integer x = 2135
integer y = 1920
integer width = 274
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date fin:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_2.Text = "Ending date"
end if
end event

event clicked;if uo_calutil2.visible then
	uo_calutil2.visible = false
else
	uo_calutil2.visible = true
end if
end event

type dw_patrefdet from u_dw within w_refpatdet
integer width = 3634
integer height = 1892
integer taborder = 60
string title = "patrefdet"
string dataobject = "d_patrefdet"
boolean hscrollbar = true
boolean border = false
boolean hsplitscroll = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;string ls_spec

SetTransObject(SQLCA)
select det_suf + ' ' + det_prenom + ' ' + det_prenom into :ls_spec from t_dentists where id_dentist = :message.doubleparm;
object.t_spec.text = ls_spec

if v_langue = 'an' then
	this.object.t_title.text = 'List of patients referred by:'
	this.object.t_patnom.text = 'Patient Name'
	this.object.t_date.text = 'Treatment Date'
	this.object.t_doss.text = 'File #'
	this.object.t_printedon.text = 'Printed on'
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

type cb_close from commandbutton within w_refpatdet
integer x = 2885
integer y = 1904
integer width = 741
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;Close(parent)
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

type cb_print from commandbutton within w_refpatdet
integer x = 5
integer y = 1904
integer width = 617
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_patrefdet)


end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

