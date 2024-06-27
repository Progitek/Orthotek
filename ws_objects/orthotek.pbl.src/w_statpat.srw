$PBExportHeader$w_statpat.srw
forward
global type w_statpat from w_child
end type
type cb_print from commandbutton within w_statpat
end type
type cb_excel from commandbutton within w_statpat
end type
type cb_filter from commandbutton within w_statpat
end type
type dw_statpat from u_dw within w_statpat
end type
type cb_close from commandbutton within w_statpat
end type
end forward

global type w_statpat from w_child
integer x = 214
integer y = 221
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
boolean ib_isupdateable = false
event ue_post_open ( )
cb_print cb_print
cb_excel cb_excel
cb_filter cb_filter
dw_statpat dw_statpat
cb_close cb_close
end type
global w_statpat w_statpat

type variables
integer changement=0
end variables

event ue_post_open();dw_statpat.retrieve(v_no_ortho)
end event

on w_statpat.create
int iCurrent
call super::create
this.cb_print=create cb_print
this.cb_excel=create cb_excel
this.cb_filter=create cb_filter
this.dw_statpat=create dw_statpat
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_print
this.Control[iCurrent+2]=this.cb_excel
this.Control[iCurrent+3]=this.cb_filter
this.Control[iCurrent+4]=this.dw_statpat
this.Control[iCurrent+5]=this.cb_close
end on

on w_statpat.destroy
call super::destroy
destroy(this.cb_print)
destroy(this.cb_excel)
destroy(this.cb_filter)
destroy(this.dw_statpat)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
event post ue_post_open()
end event

type cb_print from commandbutton within w_statpat
integer x = 745
integer y = 1928
integer width = 745
integer height = 108
integer taborder = 70
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
openwithparm(w_print_options,dw_statpat)

end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type cb_excel from commandbutton within w_statpat
integer x = 1490
integer y = 1928
integer width = 1362
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Exporter vers Excel"
end type

event clicked;string ls_cheminword

ls_cheminword = ProfileString ("c:\ii4net\orthotek\ortho.ini", "Correspondance", "cheminword", "")
if ls_cheminword = "" then
	select wordpath into :ls_cheminword from t_options;
end if


if dw_statpat.SaveAs("c:\ii4net\orthotek\correspondances\patstats.xls", EXCEL5!,True) = 1 then
	if error_type(228) = 1 then
		run(ls_cheminword + ' c:\ii4net\orthotek\correspondances\patstats.xls',maximized!)
		//run('C:\Program Files\Microsoft Office\Office\Excel.EXE c:\ii4net\orthotek\correspondances\patstats.xls',maximized!)
	end if
else
	error_type(0)
end if
end event

event constructor;if v_langue = 'an' then
	this.text = 'Export to Excel'
end if
end event

type cb_filter from commandbutton within w_statpat
integer y = 1928
integer width = 745
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Filtrer"
end type

event clicked;open(w_statpatfilter)


end event

event constructor;if v_langue = 'an' then
	this.text = 'Filter'
end if
end event

type dw_statpat from u_dw within w_statpat
integer x = 5
integer width = 3616
integer height = 1924
integer taborder = 10
string dataobject = "d_statpat"
boolean hscrollbar = true
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;settransobject(SQLCA)
if v_langue = 'an' then
	this.object.b_date.text = 'File open'
	this.object.b_nom.text = 'Patient name'
	this.object.b_type.text = 'File Status'
	this.object.b_lieu.text = 'Satellite'
	this.object.b_pers.text = 'Attributed to'
	this.object.b_activite.text = 'Activity'
	this.object.b_honoraire.text = 'Fee'
	this.object.b_prem_rdv.text = '1st rdv'
	
	this.object.t_date.text = 'File open'
	this.object.t_nom.text = 'Patient name'
	this.object.t_type.text = 'Type'
	this.object.t_statut.text = 'Bill status'
	this.object.b_statut.text = 'Bill status'
	this.object.t_lieu.text = 'Localisation'
	this.object.t_pers.text = 'Attributed to'
	this.object.t_activite.text = 'Activity'
	this.object.t_honoraire.text = 'Fee'
	this.object.t_qte.text = 'Quantity:'
	this.object.t_prem_rdv.text = '1st rdv'
	
end if

end event

event clicked;choose case string(dwo.name)
	case 'b_date'
		SetSort('patient_opendoss A')
		Sort()
	case 'b_nom'
		SetSort('patient_patient_nom A, patient_patient_prenom A')
		Sort()
	case 'b_type'
		SetSort('t_patstatus_nom A')
		Sort()
	case 'b_phase'
		SetSort('phase A')
		Sort()
	case 'b_statut'
		SetSort('patient_statut A')
		Sort()
	case 'b_lieu'
		SetSort('t_satellites_lieu A')
		Sort()
	case 'b_pers'
		SetSort('t_personnels_prenom A')
		Sort()
	case 'b_activite'
		SetSort('t_activites_activites A')
		Sort()
	case 'b_honoraire'
		SetSort('honoraire A')
		Sort()
	case 'b_prem_rdv'
		SetSort('prem_rdv A')
		Sort()
end choose
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

type cb_close from commandbutton within w_statpat
integer x = 2853
integer y = 1928
integer width = 763
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

event clicked;Close (parent)
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

