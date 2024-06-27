$PBExportHeader$w_listenoboite.srw
forward
global type w_listenoboite from w_child
end type
type cb_search from commandbutton within w_listenoboite
end type
type st_2 from statictext within w_listenoboite
end type
type st_1 from statictext within w_listenoboite
end type
type em_end from editmask within w_listenoboite
end type
type em_start from editmask within w_listenoboite
end type
type cb_close from commandbutton within w_listenoboite
end type
type cb_print from commandbutton within w_listenoboite
end type
type dw_listenoboite from u_dw within w_listenoboite
end type
end forward

global type w_listenoboite from w_child
integer x = 5
integer y = 4
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
boolean ib_isupdateable = false
event ue_post_open ( )
cb_search cb_search
st_2 st_2
st_1 st_1
em_end em_end
em_start em_start
cb_close cb_close
cb_print cb_print
dw_listenoboite dw_listenoboite
end type
global w_listenoboite w_listenoboite

type variables

end variables

event ue_post_open();dw_listenoboite.retrieve(v_no_ortho)
end event

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

postevent('ue_post_open')



end event

on w_listenoboite.create
int iCurrent
call super::create
this.cb_search=create cb_search
this.st_2=create st_2
this.st_1=create st_1
this.em_end=create em_end
this.em_start=create em_start
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_listenoboite=create dw_listenoboite
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_search
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.em_end
this.Control[iCurrent+5]=this.em_start
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.cb_print
this.Control[iCurrent+8]=this.dw_listenoboite
end on

on w_listenoboite.destroy
call super::destroy
destroy(this.cb_search)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_end)
destroy(this.em_start)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_listenoboite)
end on

type cb_search from commandbutton within w_listenoboite
integer x = 782
integer y = 1932
integer width = 782
integer height = 108
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;//string ls_new_dossier, ls_dosmodif
//long ll_patid
//
// // Déclaration du curseur
// 
// Declare noboite Cursor For
// 
// SELECT 	patient.no_boite,
//         patient.patient_id
// FROM    patient;
//           			
//OPEN noboite;
//
//Do While SQLCA.SQLCode = 0
//   Fetch noboite Into :ls_noboite,
//	                 	 :ll_patid;
//	
//	if SQLCA.SQLCode = 0 then
//		if isnumber(ls_noboite) then
//			ls_dosmodif = remplir_zerosign(5,long(ls_noboite))
//			update patient set new_dossier = :ls_dosmodif where patient_id = :ll_patid; 
//		end if
//	end if
//Loop
//
//CLOSE noboite;
//dw_listenoboite.retrieve(v_no_ortho,0,99999999)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Search'
end if
end event

type st_2 from statictext within w_listenoboite
integer x = 2226
integer y = 1952
integer width = 73
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "à"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_2.Text = "to"
end if
end event

type st_1 from statictext within w_listenoboite
integer x = 1701
integer y = 1952
integer width = 169
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "De:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	st_1.Text = "From"
end if
end event

type em_end from editmask within w_listenoboite
integer x = 2304
integer y = 1940
integer width = 366
integer height = 92
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = stringmask!
boolean autoskip = true
end type

event constructor;em_end.text = string(999999999)
end event

event modified;dw_listenoboite.setredraw(false)
dw_listenoboite.setfilter("nodos >= '" + em_start.text + "' and nodos <= '" + em_end.text + "'") 
dw_listenoboite.filter()
dw_listenoboite.setredraw(true)
end event

type em_start from editmask within w_listenoboite
integer x = 1870
integer y = 1940
integer width = 357
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
maskdatatype maskdatatype = stringmask!
boolean autoskip = true
end type

event constructor;em_start.text = string(000000000)
end event

event modified;dw_listenoboite.setredraw(false)
dw_listenoboite.setfilter("nodos >= '" + em_start.text + "' and nodos <= '" + em_end.text + "'") 
dw_listenoboite.filter()
dw_listenoboite.setredraw(true)
end event

type cb_close from commandbutton within w_listenoboite
integer x = 2843
integer y = 1932
integer width = 782
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
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

type cb_print from commandbutton within w_listenoboite
integer y = 1932
integer width = 782
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;//dw_listenoboite.Modify("DataWindow.Print.Margin.Top=200")
//dw_listenoboite.Modify("DataWindow.Print.Margin.left=200")
gb_datawindow = true
openwithparm(w_print_options,dw_listenoboite)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

type dw_listenoboite from u_dw within w_listenoboite
integer x = 55
integer width = 3570
integer height = 1924
integer taborder = 10
string dataobject = "d_listenoboite"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)

if v_langue = 'an' then
	this.object.t_title.text = 'Box number list for:'
	this.object.t_noboite.text = 'Box number'
	this.object.t_patnom.text = "Patient's name"
	this.object.b_noboite.text = 'Box number'
	this.object.b_patnom.text = "Patient's name"
	this.object.t_printedon.text = "Printed on"
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

event clicked;Choose case dwo.name
	case 'b_patnom'
		SetSort('compute_2 A')
		Sort()
	case 'b_noboite'
		SetSort('noboite A')
		Sort()
	case 'b_numret'
		SetSort('patient_numret A')
		Sort()		
end choose
//if row > 0 then
//	if IsSelected(row) then
//		SelectRow(row,false)
//	else
//		SelectRow(row,true)
//	end if
//end if
end event

