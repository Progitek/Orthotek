$PBExportHeader$w_patientage.srw
forward
global type w_patientage from w_child
end type
type em_debut from editmask within w_patientage
end type
type st_to from statictext within w_patientage
end type
type st_from from statictext within w_patientage
end type
type st_intervalle from statictext within w_patientage
end type
type sle_debut from singlelineedit within w_patientage
end type
type ddlb_patstatus from u_ddlb within w_patientage
end type
type cb_search from commandbutton within w_patientage
end type
type cb_close from commandbutton within w_patientage
end type
type cb_print from commandbutton within w_patientage
end type
type dw_patientage from u_dw within w_patientage
end type
type em_fin from editmask within w_patientage
end type
end forward

global type w_patientage from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
em_debut em_debut
st_to st_to
st_from st_from
st_intervalle st_intervalle
sle_debut sle_debut
ddlb_patstatus ddlb_patstatus
cb_search cb_search
cb_close cb_close
cb_print cb_print
dw_patientage dw_patientage
em_fin em_fin
end type
global w_patientage w_patientage

type variables
int arret

end variables

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();if v_langue = 'an' then
	st_intervalle.text = "Range of age"
	st_from.text = "From:"
	st_to.text = "To:"
	dw_patientage.object.patient_patient_nom_t.text = "Name of patient"
	dw_patientage.object.patient_date_naissance_t.text = "Birthdate"
	dw_patientage.object.patient_tel_maison_t.text = "Home tel."
	dw_patientage.object.patient_tel_bureau_t.text = "Office tel."
	dw_patientage.object.patient_new_dossier_t.text = "File number"
	dw_patientage.object.t_printedon.text = "Printed on"
end if
end subroutine

on w_patientage.create
int iCurrent
call super::create
this.em_debut=create em_debut
this.st_to=create st_to
this.st_from=create st_from
this.st_intervalle=create st_intervalle
this.sle_debut=create sle_debut
this.ddlb_patstatus=create ddlb_patstatus
this.cb_search=create cb_search
this.cb_close=create cb_close
this.cb_print=create cb_print
this.dw_patientage=create dw_patientage
this.em_fin=create em_fin
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_debut
this.Control[iCurrent+2]=this.st_to
this.Control[iCurrent+3]=this.st_from
this.Control[iCurrent+4]=this.st_intervalle
this.Control[iCurrent+5]=this.sle_debut
this.Control[iCurrent+6]=this.ddlb_patstatus
this.Control[iCurrent+7]=this.cb_search
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.cb_print
this.Control[iCurrent+10]=this.dw_patientage
this.Control[iCurrent+11]=this.em_fin
end on

on w_patientage.destroy
call super::destroy
destroy(this.em_debut)
destroy(this.st_to)
destroy(this.st_from)
destroy(this.st_intervalle)
destroy(this.sle_debut)
destroy(this.ddlb_patstatus)
destroy(this.cb_search)
destroy(this.cb_close)
destroy(this.cb_print)
destroy(this.dw_patientage)
destroy(this.em_fin)
end on

event open;arret = 0

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

//ajustmontantdu()
end event

type em_debut from editmask within w_patientage
integer x = 1719
integer y = 1936
integer width = 320
integer height = 92
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
string minmax = "0~~150"
end type

type st_to from statictext within w_patientage
integer x = 2094
integer y = 1948
integer width = 119
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "À"
boolean focusrectangle = false
end type

type st_from from statictext within w_patientage
integer x = 1550
integer y = 1948
integer width = 165
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "De"
boolean focusrectangle = false
end type

type st_intervalle from statictext within w_patientage
integer x = 1051
integer y = 1948
integer width = 457
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Intervalle d~'âge"
alignment alignment = center!
boolean focusrectangle = false
end type

type sle_debut from singlelineedit within w_patientage
integer x = 1719
integer y = 1936
integer width = 201
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type ddlb_patstatus from u_ddlb within w_patientage
integer x = 2437
integer y = 8
integer width = 1207
integer height = 692
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event constructor;call super::constructor;long ll_patstatus
string ls_nom

of_additem('Tous',0)

DECLARE liststatus CURSOR FOR
	select id_patstatus, nom from t_patstatus where ortho_id = 1 order by isnull(ordre,10000) asc;
	
OPEN liststatus;

FETCH liststatus INTO :ll_patstatus, :ls_nom;

DO WHILE SQLCA.SQLCode = 0
	
	of_addItem(ls_nom,ll_patstatus)
	
	FETCH liststatus INTO :ll_patstatus, :ls_nom;
	
LOOP

CLOSE liststatus;

of_selectItem(1)
end event

type cb_search from commandbutton within w_patientage
integer x = 507
integer y = 1928
integer width = 503
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Recherche"
end type

event constructor;if v_langue = 'an' then
	this.Text = "Search"
end if
end event

event clicked;string ls_debut, ls_fin
long ll_idpatstatus, ll_debut, ll_fin

ll_idpatstatus = long(ddlb_patstatus.of_getselecteddata())
if ll_idpatstatus = 0 then setnull(ll_idpatstatus)

ll_debut = long(em_debut.text)
ll_fin = long(em_fin.text)

if ll_debut = 0 then setnull(ll_debut)
if ll_fin = 0 then setnull(ll_fin)

dw_patientage.retrieve(ll_idpatstatus,ll_debut,ll_fin)
end event

type cb_close from commandbutton within w_patientage
integer x = 3131
integer y = 1928
integer width = 503
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
	this.Text = "Close"
end if
end event

type cb_print from commandbutton within w_patientage
integer x = 5
integer y = 1928
integer width = 503
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
openwithparm(w_print_options,dw_patientage)
end event

event constructor;if v_langue = 'an' then
	cb_print.Text = "Print"
end if
end event

type dw_patientage from u_dw within w_patientage
integer y = 104
integer width = 3634
integer height = 1816
integer taborder = 30
string title = "compte_recevable"
string dataobject = "d_patientage"
boolean hscrollbar = true
boolean border = false
boolean hsplitscroll = true
end type

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

event constructor;call super::constructor;setTransObject(SQLCA)
end event

type em_fin from editmask within w_patientage
integer x = 2226
integer y = 1936
integer width = 320
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
string minmax = "0~~155"
end type

