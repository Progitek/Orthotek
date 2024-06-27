$PBExportHeader$w_assstand.srw
forward
global type w_assstand from w_child
end type
type cb_3 from commandbutton within w_assstand
end type
type cb_2 from commandbutton within w_assstand
end type
type cb_1 from commandbutton within w_assstand
end type
type dw_assstandfr from u_dw within w_assstand
end type
type dw_assstandan from u_dw within w_assstand
end type
end forward

global type w_assstand from w_child
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
boolean ib_isupdateable = false
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_assstandfr dw_assstandfr
dw_assstandan dw_assstandan
end type
global w_assstand w_assstand

type variables
public long il_patid = 0
public long il_idestime = 0
DataWindowChild dw_factfr
DataWindowChild dw_factan

end variables

on w_assstand.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_assstandfr=create dw_assstandfr
this.dw_assstandan=create dw_assstandan
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_assstandfr
this.Control[iCurrent+5]=this.dw_assstandan
end on

on w_assstand.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_assstandfr)
destroy(this.dw_assstandan)
end on

event open;string ls_langue
string ls_type

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

il_idestime = message.doubleparm
select typetrait into :ls_type from t_estime where id_estime = :il_idestime;

if w_estime.rb_fran.checked then
	dw_assstandfr.visible = true
	dw_assstandan.visible = false
	dw_assstandfr.retrieve(il_idestime,ls_type)
else
	if w_estime.rb_ang.checked then
		dw_assstandfr.visible = false
		dw_assstandan.visible = true
		dw_assstandan.retrieve(il_idestime,ls_type)
	end if
end if
end event

type cb_3 from commandbutton within w_assstand
integer x = 539
integer y = 1908
integer width = 2656
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
end type

type cb_2 from commandbutton within w_assstand
integer x = 27
integer y = 1908
integer width = 512
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;//int li_count, i, li_min, li_max, li_next = 8, ret

if dw_assstandfr.visible = true then
	gb_datawindow = true
	openwithparm(w_print_options,dw_assstandfr)
else
	gb_datawindow = true
	openwithparm(w_print_options,dw_assstandan)
end if

//dw_factfr.Modify( "DataWindow.processing = 5" )
//ret = dw_factfr.GetChild('dw_factlist', dw_factfr)
//dw_factfr.Modify( "DataWindow.processing = 0" )
//
//if ret = -1 then
//	error_type(0)
//end if
//if dw_assstandan.GetChild('d_factlist', dw_factan) = -1 then
//	error_type(0)
//end if

//printsetup()
//SetPointer(HourGlass!)
//if dw_assstandfr.visible = true then
//	li_count = dw_factfr.rowcount()
//	if li_count > 36 then
//		error_type(110)
//	else
//		if li_count > 12 then
//			dw_factfr.setsort('factures_traitements_facture_id A')
//			dw_factfr.sort()
//			for i = 1 to li_count
//				if i = 1 then
//					li_min = dw_factfr.getitemnumber(1,'factures_traitements_facture_id')
//				end if
//				if i = li_next then
//					li_max = dw_factfr.getitemnumber(i,'factures_traitements_facture_id')
//					dw_assstandfr.retrieve(il_traitid,li_min,li_max)
//					dw_assstandfr.print()
//					if li_count > i + 8 then
//						li_next = i + 8
//					else
//						li_next = li_count
//					end if
//					if i <> li_count then
//						li_min = dw_factfr.getitemnumber(i + 1,'factures_traitements_facture_id')
//					end if
//				end if
//			next
//		else
//			dw_assstandfr.print()
//		end if
//	end if
//else
//	if li_count > 36 then
//		error_type(110)
//	else
//		li_count = dw_factan.rowcount()
//		if li_count > 12 then
//			dw_factan.setsort('factures_traitements_facture_id A')
//			dw_factan.sort()
//			for i = 1 to li_count
//				if i = 1 then
//					li_min = dw_factan.getitemnumber(1,'factures_traitements_facture_id')
//				end if
//				if i = li_next then
//					li_max = dw_factan.getitemnumber(i,'factures_traitements_facture_id')
//					dw_assstandan.retrieve(il_traitid,li_min,li_max)
//					dw_assstandan.print()
//					if li_count > i + 8 then
//						li_next = i + 8
//					else
//						li_next = li_count
//					end if
//					if i <> li_count then
//						li_min = dw_factan.getitemnumber(i + 1,'factures_traitements_facture_id')
//					end if
//				end if
//			next
//		else
//			dw_assstandan.print()
//		end if
//	end if
//end if


end event

type cb_1 from commandbutton within w_assstand
integer x = 3200
integer y = 1908
integer width = 402
integer height = 112
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

type dw_assstandfr from u_dw within w_assstand
integer x = 18
integer y = 20
integer width = 3598
integer height = 1872
integer taborder = 10
string title = "none"
string dataobject = "d_assstandfr"
boolean hscrollbar = true
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;settransobject(SQLCA)
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

type dw_assstandan from u_dw within w_assstand
integer x = 18
integer y = 20
integer width = 3593
integer height = 1876
integer taborder = 20
string title = "none"
string dataobject = "d_assstandan"
boolean hscrollbar = true
boolean border = false
end type

event constructor;setTransobject(SQLCA)
end event

