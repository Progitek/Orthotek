$PBExportHeader$w_rech_patient_rappels.srw
forward
global type w_rech_patient_rappels from window
end type
type cb_annuler from commandbutton within w_rech_patient_rappels
end type
type cb_fermer from commandbutton within w_rech_patient_rappels
end type
type sle_rech from singlelineedit within w_rech_patient_rappels
end type
type dw_rech from u_dw within w_rech_patient_rappels
end type
end forward

global type w_rech_patient_rappels from window
integer x = 832
integer y = 360
integer width = 2533
integer height = 1288
boolean titlebar = true
string title = "Recherche d~'un patient"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 78690504
boolean center = true
cb_annuler cb_annuler
cb_fermer cb_fermer
sle_rech sle_rech
dw_rech dw_rech
end type
global w_rech_patient_rappels w_rech_patient_rappels

on w_rech_patient_rappels.create
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.sle_rech=create sle_rech
this.dw_rech=create dw_rech
this.Control[]={this.cb_annuler,&
this.cb_fermer,&
this.sle_rech,&
this.dw_rech}
end on

on w_rech_patient_rappels.destroy
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.sle_rech)
destroy(this.dw_rech)
end on

event open;sle_rech.setfocus()
end event

type cb_annuler from commandbutton within w_rech_patient_rappels
integer x = 27
integer y = 1096
integer width = 1029
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
end type

event clicked;patientrech=-1
close(w_rech_patient_rappels)


end event

type cb_fermer from commandbutton within w_rech_patient_rappels
integer x = 1472
integer y = 1096
integer width = 1029
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "OK"
end type

event clicked;patientrech=dw_rech.getitemnumber(dw_rech.getrow(),"patient_id")
close(w_rech_patient_rappels)


end event

type sle_rech from singlelineedit within w_rech_patient_rappels
integer x = 27
integer y = 32
integer width = 2395
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long backcolor = 16777215
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;int v_nb, li_archive
string ls_dnom
//pour regler le bug des apostrophes
ls_dnom = Trim(sle_rech.text)
if Match(ls_dnom, "'") = true then
	v_nb = Pos (ls_dnom, "'")
	if v_nb > 0 then
		ls_dnom = Replace ( ls_dnom, v_nb, 1, "%" )
	end if
end if
//**********************************

select archive into :li_archive from t_options;
if li_archive = 1 then
	//archiver
	dw_rech.SetFilter("isnull(archivedate) or archivedate > today() and upper(patient_nom) like '"+upper(ls_dnom)+"%'")
	dw_rech.filter()
else
	dw_rech.setfilter("upper(patient_nom) like '"+upper(ls_dnom)+"%'")
end if

if dw_rech.retrieve(v_no_ortho) > 0 then
	cb_fermer.enabled=true
else
	cb_fermer.enabled=false
end if


end event

type dw_rech from u_dw within w_rech_patient_rappels
integer x = 27
integer y = 148
integer width = 2469
integer height = 928
integer taborder = 20
string dataobject = "dw_rech_patient"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;dw_rech.settransobject(sqlca)
dw_rech.setrowfocusindicator(hand!)
dw_rech.setfocus()
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

