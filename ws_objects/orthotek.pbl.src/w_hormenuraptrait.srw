$PBExportHeader$w_hormenuraptrait.srw
forward
global type w_hormenuraptrait from window
end type
type uo_calutil1 from u_calutil within w_hormenuraptrait
end type
type em_duree from editmask within w_hormenuraptrait
end type
type st_3 from statictext within w_hormenuraptrait
end type
type dw_types_traitements_hor from u_dw within w_hormenuraptrait
end type
type st_2 from statictext within w_hormenuraptrait
end type
type st_1 from statictext within w_hormenuraptrait
end type
type em_daterap from editmask within w_hormenuraptrait
end type
type dw_raptrait from u_dw within w_hormenuraptrait
end type
type cb_cancel from commandbutton within w_hormenuraptrait
end type
type cb_ok from commandbutton within w_hormenuraptrait
end type
type st_4 from statictext within w_hormenuraptrait
end type
end forward

global type w_hormenuraptrait from window
integer width = 2258
integer height = 1764
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
uo_calutil1 uo_calutil1
em_duree em_duree
st_3 st_3
dw_types_traitements_hor dw_types_traitements_hor
st_2 st_2
st_1 st_1
em_daterap em_daterap
dw_raptrait dw_raptrait
cb_cancel cb_cancel
cb_ok cb_ok
st_4 st_4
end type
global w_hormenuraptrait w_hormenuraptrait

type variables
long il_traitid
integer ii_duree
end variables

forward prototypes
public subroutine f_getinfo (long fl_nbrow)
end prototypes

public subroutine f_getinfo (long fl_nbrow);long row,ll_row
string ls_col

row = w_horaire.dw_hor.getrow()
choose case w_horaire.dw_hor.getcolumnname()
	case "patient_nom_1"
		ls_col = '1'
	case "patient_nom_2"
		ls_col = '2'
	case "patient_nom_3"
		ls_col = '3'
	case "patient_nom_4"
		ls_col = '4'
	case "patient_nom_5"
		ls_col = '5'
	case "patient_nom_6"
		ls_col = '6'
	case "patient_nom_7"
		ls_col = '7'
	case "patient_nom_8"
		ls_col = '8'
	case "patient_nom_9"
		ls_col = '9'
	case "patient_nom_10"
		ls_col = '10'
	case "patient_nom_11"
		ls_col = '11'
	case "patient_nom_12"
		ls_col = '12'
	case "patient_nom_13"
		ls_col = '13'
	case "patient_nom_14"
		ls_col = '14'
	case "patient_nom_15"
		ls_col = '15'
end choose
il_traitid = w_horaire.dw_hor.getitemnumber(row,"traitementid" + ls_col)
ii_duree = w_horaire.dw_hor.getitemnumber(row,"duree" + ls_col)
// afficher info
ll_row = dw_types_traitements_hor.find("type_traitement_id = " + string(il_traitid),0,fl_nbrow)
dw_types_traitements_hor.Scrolltorow(ll_row)
em_duree.text = string(ii_duree)
end subroutine

on w_hormenuraptrait.create
this.uo_calutil1=create uo_calutil1
this.em_duree=create em_duree
this.st_3=create st_3
this.dw_types_traitements_hor=create dw_types_traitements_hor
this.st_2=create st_2
this.st_1=create st_1
this.em_daterap=create em_daterap
this.dw_raptrait=create dw_raptrait
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.st_4=create st_4
this.Control[]={this.uo_calutil1,&
this.em_duree,&
this.st_3,&
this.dw_types_traitements_hor,&
this.st_2,&
this.st_1,&
this.em_daterap,&
this.dw_raptrait,&
this.cb_cancel,&
this.cb_ok,&
this.st_4}
end on

on w_hormenuraptrait.destroy
destroy(this.uo_calutil1)
destroy(this.em_duree)
destroy(this.st_3)
destroy(this.dw_types_traitements_hor)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_daterap)
destroy(this.dw_raptrait)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.st_4)
end on

type uo_calutil1 from u_calutil within w_hormenuraptrait
boolean visible = false
integer x = 942
integer y = 608
integer taborder = 50
boolean border = true
end type

event ue_aff_horaire;call super::ue_aff_horaire;em_daterap.text = string(istr_calutil.caldate)
end event

on uo_calutil1.destroy
call u_calutil::destroy
end on

type em_duree from editmask within w_hormenuraptrait
integer x = 1961
integer y = 516
integer width = 251
integer height = 84
integer taborder = 30
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
string mask = "##"
boolean autoskip = true
boolean spin = true
double increment = 1
string minmax = "1~~50"
end type

type st_3 from statictext within w_hormenuraptrait
integer x = 1568
integer y = 524
integer width = 375
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Durée:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Duration:'
end if
end event

type dw_types_traitements_hor from u_dw within w_hormenuraptrait
integer x = 46
integer y = 696
integer width = 2185
integer height = 896
integer taborder = 30
string title = "types_traitements_hor"
string dataobject = "d_types_traitements_hor"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_nbtrait
integer li_option

SetRowFocusIndicator(Hand!)
SetTransObject(SQLCA)
select eliminertrait1 into :li_option from t_options where ortho_id = :v_no_ortho;
if isnull(li_option) then li_option = 0
ll_nbtrait = dw_types_traitements_hor.retrieve(v_no_ortho,li_option)
f_getinfo(ll_nbtrait)

end event

event clicked;ScrollToRow(GetClickedRow())
end event

event rowfocuschanged;em_duree.text = string(getitemnumber(currentrow,'type_de_traitement_duree'))
end event

type st_2 from statictext within w_hormenuraptrait
integer x = 9
integer y = 524
integer width = 1061
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Choisir la date du prochain rappel:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Next recall date:'
end if
end event

event clicked;if uo_calutil1.visible then
	uo_calutil1.visible = false
else
	uo_calutil1.visible = true
end if
end event

type st_1 from statictext within w_hormenuraptrait
integer x = 9
integer width = 1061
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Choisir le type de rappel:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'To choose the type of recall:'
end if
end event

event clicked;OpenSheet(w_liste_des_rappels_retentions,w_principal,2,layered!)
close(parent)
end event

type em_daterap from editmask within w_hormenuraptrait
integer x = 1079
integer y = 516
integer width = 466
integer height = 84
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
string mask = "[date]"
boolean autoskip = true
end type

event constructor;em_daterap.text = string(today())
end event

type dw_raptrait from u_dw within w_hormenuraptrait
integer x = 46
integer y = 68
integer width = 1513
integer height = 444
integer taborder = 10
string title = "raptrait"
string dataobject = "dddw_horraptrait"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(SQLCA)
SetRowFocusIndicator(Hand!)
//SetFilter("ortho_id = " + string(v_no_ortho))
Retrieve(v_no_ortho)
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

type cb_cancel from commandbutton within w_hormenuraptrait
integer x = 1321
integer y = 1600
integer width = 910
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Annuler"
boolean cancel = true
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type cb_ok from commandbutton within w_hormenuraptrait
integer x = 46
integer y = 1600
integer width = 910
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "OK"
boolean default = true
end type

event clicked;long ll_patid, row, ll_idraptrait
string ls_col
date ldt_daterap
time lt_heure

row = w_horaire.dw_hor.getrow()
lt_heure = w_horaire.dw_hor.getitemtime(row,"heure")
choose case w_horaire.dw_hor.getcolumnname()
	case "patient_nom_1"
		ls_col = '1'
	case "patient_nom_2"
		ls_col = '2'
	case "patient_nom_3"
		ls_col = '3'
	case "patient_nom_4"
		ls_col = '4'
	case "patient_nom_5"
		ls_col = '5'
	case "patient_nom_6"
		ls_col = '6'
	case "patient_nom_7"
		ls_col = '7'
	case "patient_nom_8"
		ls_col = '8'
	case "patient_nom_9"
		ls_col = '9'
	case "patient_nom_10"
		ls_col = '10'
	case "patient_nom_11"
		ls_col = '11'
	case "patient_nom_12"
		ls_col = '12'
	case "patient_nom_13"
		ls_col = '13'
	case "patient_nom_14"
		ls_col = '14'
	case "patient_nom_15"
		ls_col = '15'
end choose
ll_patid = w_horaire.dw_hor.getitemnumber(row,"patient_id_" + ls_col)
il_traitid = dw_types_traitements_hor.getitemnumber(dw_types_traitements_hor.getrow(),"type_traitement_id")
ii_duree = integer(em_duree.text)
ll_idraptrait = dw_raptrait.getitemnumber(dw_raptrait.getrow(),'id_raptrait')
ldt_daterap = date(em_daterap.text)
insert into rendezvous (date_vue,prochain_rv,patient_id,no_ortho,duree,type_traitement_id,id_raptrait)
values (:istr_cal.caldate,:ldt_daterap,:ll_patid,:v_no_ortho,:ii_duree,:il_traitid,:ll_idraptrait);
if isvalid(w_liste_des_rappels_retentions) then
	w_liste_des_rappels_retentions.event ue_post_open()
end if
close(parent)

end event

type st_4 from statictext within w_hormenuraptrait
integer x = 9
integer y = 620
integer width = 1061
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Type de traitement:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Traitment type:'
end if
end event

event clicked;OpenSheet(w_type_traitements,w_principal,2,layered!)
close(parent)
end event

