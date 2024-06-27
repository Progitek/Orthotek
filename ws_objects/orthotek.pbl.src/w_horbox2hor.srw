$PBExportHeader$w_horbox2hor.srw
forward
global type w_horbox2hor from window
end type
type st_title from statictext within w_horbox2hor
end type
type em_duree from editmask within w_horbox2hor
end type
type st_1 from statictext within w_horbox2hor
end type
type dw_types_traitements_hor from u_dw within w_horbox2hor
end type
type cb_annuler from commandbutton within w_horbox2hor
end type
type cb_search from commandbutton within w_horbox2hor
end type
end forward

shared variables

end variables

global type w_horbox2hor from window
integer width = 2304
integer height = 1244
windowtype windowtype = response!
long backcolor = 78690504
boolean center = true
st_title st_title
em_duree em_duree
st_1 st_1
dw_types_traitements_hor dw_types_traitements_hor
cb_annuler cb_annuler
cb_search cb_search
end type
global w_horbox2hor w_horbox2hor

type variables
private long il_patid
end variables

forward prototypes
public subroutine delete_rv (long al_row1)
end prototypes

public subroutine delete_rv (long al_row1);
end subroutine

on w_horbox2hor.create
this.st_title=create st_title
this.em_duree=create em_duree
this.st_1=create st_1
this.dw_types_traitements_hor=create dw_types_traitements_hor
this.cb_annuler=create cb_annuler
this.cb_search=create cb_search
this.Control[]={this.st_title,&
this.em_duree,&
this.st_1,&
this.dw_types_traitements_hor,&
this.cb_annuler,&
this.cb_search}
end on

on w_horbox2hor.destroy
destroy(this.st_title)
destroy(this.em_duree)
destroy(this.st_1)
destroy(this.dw_types_traitements_hor)
destroy(this.cb_annuler)
destroy(this.cb_search)
end on

event open;string ls_patprenom,ls_patnom

il_patid = message.doubleparm

select patient_prenom,patient_nom 
into :ls_patprenom,:ls_patnom
from patient 
where patient_id = :il_patid;

w_horaire.is_pat.patprenom = ls_patprenom
w_horaire.is_pat.patnom = ls_patnom
st_title.text = ls_patprenom + ' ' +ls_patnom
end event

type st_title from statictext within w_horbox2hor
integer width = 2281
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "nom du patient"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_duree from editmask within w_horbox2hor
integer x = 1125
integer y = 1112
integer width = 251
integer height = 84
integer taborder = 40
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

event constructor;em_duree.text = '00'
end event

type st_1 from statictext within w_horbox2hor
integer x = 910
integer y = 1120
integer width = 215
integer height = 76
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
boolean focusrectangle = false
end type

type dw_types_traitements_hor from u_dw within w_horbox2hor
integer x = 9
integer y = 96
integer width = 2258
integer height = 984
integer taborder = 30
string title = "types_traitements"
string dataobject = "d_types_traitements_hor"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;//long ll_row1,ll_idpat, ll_row
integer li_col,li_option, ll_duree, ll_traitid
//string ls_col
//
SetTransObject(SQLCA)
setrowfocusindicator(hand!)
select eliminertrait1 into :li_option from t_options where ortho_id = :v_no_ortho;
if isnull(li_option) then li_option = 0
dw_types_traitements_hor.retrieve(v_no_ortho,li_option)
//ll_row1 = w_horaire.dw_hor.getrow()
//choose case w_horaire.dw_hor.getcolumnname()
//	case "patient_nom_1"
//		li_col = 1
//		ls_col = '1'
//	case "patient_nom_2"
//		li_col = 2
//		ls_col = '2'
//	case "patient_nom_3"
//		li_col = 3
//		ls_col = '3'
//	case "patient_nom_4"
//		li_col = 4
//		ls_col = '4'
//	case "patient_nom_5"
//		li_col = 5
//		ls_col = '5'
//	case "patient_nom_6"
//		li_col = 6
//		ls_col = '6'
//	case "patient_nom_7"
//		li_col = 7
//		ls_col = '7'
//	case "patient_nom_8"
//		li_col = 8
//		ls_col = '8'
//	case "patient_nom_9"
//		li_col = 9
//		ls_col = '9'
//	case "patient_nom_10"
//		li_col = 10
//		ls_col = '10'
//end choose
//ll_idpat = w_horaire.dw_hor.getitemnumber(ll_row1,'patient_id_'+ls_col)
//ll_duree = w_horaire.dw_hor.getItemNumber(ll_row1,'duree'+ls_col)
//ll_traitid = w_horaire.dw_hor.getItemNumber(ll_row1,'traitementid'+ls_col)
//ll_row = this.find("type_traitement_id = " + string(ll_traitid),0, this.rowcount())
//this.scrollToRow(ll_row)
//em_duree.text = string(ll_duree)
end event

event rowfocuschanged;em_duree.text = string(getitemnumber(currentrow,'type_de_traitement_duree'))
end event

event clicked;ScrollToRow(GetClickedRow())
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

type cb_annuler from commandbutton within w_horbox2hor
integer x = 1440
integer y = 1108
integer width = 827
integer height = 96
integer taborder = 60
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

type cb_search from commandbutton within w_horbox2hor
integer x = 9
integer y = 1108
integer width = 827
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "OK"
end type

event clicked;long ll_row1, v_id_traitement, v_check_cpd, ll_patid
integer i,li_col
dec{2} v_montant_paye, v_montant_original
string ls_col,ls_traitnom,ls_tel,ls_nodoss

//w_horaire.is_pat.patid = il_patid
//select new_dossier into :ls_nodoss from patient where patient_id = :il_patid;
//w_horaire.is_pat.patnodos = ls_nodoss
//
////acquisition traitement_id
//dw_types_traitements_hor.accepttext()
//w_horaire.is_pat.traitid = dw_types_traitements_hor.getitemnumber(dw_types_traitements_hor.getrow(),'type_traitement_id')
//w_horaire.is_pat.dt1 = dw_types_traitements_hor.getitemstring(dw_types_traitements_hor.getrow(),'type_de_traitement_doctortime1')
//w_horaire.is_pat.dt2 = dw_types_traitements_hor.getitemstring(dw_types_traitements_hor.getrow(),'type_de_traitement_doctortime2')
//w_horaire.is_pat.dt3 = dw_types_traitements_hor.getitemstring(dw_types_traitements_hor.getrow(),'type_de_traitement_doctortime3')
//w_horaire.is_pat.backcolor = dw_types_traitements_hor.getitemnumber(dw_types_traitements_hor.getrow(),'t_color_color')
//setnull(w_horaire.is_pat.memo)
//if integer(em_duree.text) <= 0 then
//	w_horaire.is_pat.duree = 1
//else
//	w_horaire.is_pat.duree = integer(em_duree.text)
//end if
////assignation des autres lignes
//select nom_traitement into :ls_traitnom from type_de_traitement where type_traitement_id = :w_horaire.is_pat.traitid;
//w_horaire.is_pat.l2 = ls_traitnom
//close(parent)

end event

