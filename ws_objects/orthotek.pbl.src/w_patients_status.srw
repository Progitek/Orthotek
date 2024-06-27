$PBExportHeader$w_patients_status.srw
forward
global type w_patients_status from w_child
end type
type ddlb_phase from u_ddlb within w_patients_status
end type
type rr_1 from roundrectangle within w_patients_status
end type
type st_au from statictext within w_patients_status
end type
type st_du from statictext within w_patients_status
end type
type em_fin from editmask within w_patients_status
end type
type em_debut from editmask within w_patients_status
end type
type st_patstatus from statictext within w_patients_status
end type
type ddlb_status from u_ddlb within w_patients_status
end type
type ddlb_sat from u_ddlb within w_patients_status
end type
type cb_print from commandbutton within w_patients_status
end type
type cb_find from commandbutton within w_patients_status
end type
type dw_status_patients from u_dw within w_patients_status
end type
type cb_close from commandbutton within w_patients_status
end type
type gb_1 from groupbox within w_patients_status
end type
type gb_2 from groupbox within w_patients_status
end type
type gb_3 from groupbox within w_patients_status
end type
type gb_4 from groupbox within w_patients_status
end type
type r_1 from rectangle within w_patients_status
end type
type r_2 from rectangle within w_patients_status
end type
type r_3 from rectangle within w_patients_status
end type
type rr_2 from roundrectangle within w_patients_status
end type
end forward

global type w_patients_status from w_child
integer x = 214
integer y = 221
integer width = 3648
integer height = 2036
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
string pointer = "Arrow!"
boolean ib_isupdateable = false
ddlb_phase ddlb_phase
rr_1 rr_1
st_au st_au
st_du st_du
em_fin em_fin
em_debut em_debut
st_patstatus st_patstatus
ddlb_status ddlb_status
ddlb_sat ddlb_sat
cb_print cb_print
cb_find cb_find
dw_status_patients dw_status_patients
cb_close cb_close
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
r_1 r_1
r_2 r_2
r_3 r_3
rr_2 rr_2
end type
global w_patients_status w_patients_status

type variables
DataWindowChild dddwin
end variables

on w_patients_status.create
int iCurrent
call super::create
this.ddlb_phase=create ddlb_phase
this.rr_1=create rr_1
this.st_au=create st_au
this.st_du=create st_du
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_patstatus=create st_patstatus
this.ddlb_status=create ddlb_status
this.ddlb_sat=create ddlb_sat
this.cb_print=create cb_print
this.cb_find=create cb_find
this.dw_status_patients=create dw_status_patients
this.cb_close=create cb_close
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.r_1=create r_1
this.r_2=create r_2
this.r_3=create r_3
this.rr_2=create rr_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+2]=this.ddlb_phase
this.Control[iCurrent+3]=this.rr_1
this.Control[iCurrent+4]=this.st_au
this.Control[iCurrent+5]=this.st_du
this.Control[iCurrent+6]=this.em_fin
this.Control[iCurrent+7]=this.em_debut
this.Control[iCurrent+8]=this.st_patstatus
this.Control[iCurrent+9]=this.ddlb_status
this.Control[iCurrent+10]=this.ddlb_sat
this.Control[iCurrent+11]=this.cb_print
this.Control[iCurrent+12]=this.cb_find
this.Control[iCurrent+13]=this.dw_status_patients
this.Control[iCurrent+14]=this.cb_close
this.Control[iCurrent+15]=this.gb_1
this.Control[iCurrent+16]=this.gb_2
this.Control[iCurrent+17]=this.gb_3
this.Control[iCurrent+18]=this.gb_4
this.Control[iCurrent+19]=this.r_1
this.Control[iCurrent+20]=this.r_2
this.Control[iCurrent+21]=this.r_3
this.Control[iCurrent+22]=this.rr_2
end on

on w_patients_status.destroy
call super::destroy
destroy(this.ddlb_phase)
destroy(this.rr_1)
destroy(this.st_au)
destroy(this.st_du)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_patstatus)
destroy(this.ddlb_status)
destroy(this.ddlb_sat)
destroy(this.cb_print)
destroy(this.cb_find)
destroy(this.dw_status_patients)
destroy(this.cb_close)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.r_1)
destroy(this.r_2)
destroy(this.r_3)
destroy(this.rr_2)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

event constructor;call super::constructor;
//long ll_statusid
//string ls_code
//
//
//IF v_langue = 'an' THEN
//	lb_status. of_addItem("All",-1)
//ELSE
//	of_addItem("Tous",-1)
//END IF
//
//DECLARE liststatus CURSOR FOR
//  SELECT t_status.status_id,
//         t_status.code  
//    FROM t_status  
//	WHERE t_status.ortho_id = :v_no_ortho
//ORDER BY t_status.code ASC;
//
//OPEN liststatus;
//
//FETCH liststatus INTO :ll_statusid, :ls_code;
//
//DO WHILE SQLCA.SQLCOde = 0
//	
//	of_addItem(ls_code,ll_statusid)
//	
//	FETCH liststatus INTO :ll_statusid, :ls_code;
//	
//LOOP
//
//CLOSE liststatus;
//
//of_selectITem(1)
end event

type ddlb_phase from u_ddlb within w_patients_status
string tag = "resize=n"
integer x = 105
integer y = 1300
integer width = 1061
integer height = 680
integer taborder = 60
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event constructor;call super::constructor;long ll_idphase
string ls_phase

IF v_langue = 'an' THEN
	of_addItem("All",-1)
ELSE
	of_addItem("Tous",-1)
END IF

DECLARE listphase CURSOR FOR
  SELECT t_phase.id_phase,
         t_phase.phase 
    FROM t_phase  
	WHERE t_phase.ortho_id = :v_no_ortho
ORDER BY t_phase.id_phase ASC;

OPEN listphase;

FETCH listphase INTO :ll_idphase, :ls_phase;

DO WHILE SQLCA.SQLCOde = 0
	
	of_addItem(ls_phase,ll_idphase)
	
	FETCH listphase INTO :ll_idphase, :ls_phase;
	
LOOP

CLOSE listphase;

of_selectITem(1)
end event

type rr_1 from roundrectangle within w_patients_status
string tag = "resize=aba"
long linecolor = 10789024
integer linethickness = 4
long fillcolor = 15780518
integer x = 37
integer y = 32
integer width = 1216
integer height = 1860
integer cornerheight = 40
integer cornerwidth = 46
end type

type st_au from statictext within w_patients_status
string tag = "resize=n"
integer x = 658
integer y = 428
integer width = 101
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "Au"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;IF v_langue = 'an' THEN
	This.text = 'To'
END IF
end event

type st_du from statictext within w_patients_status
string tag = "resize=n"
integer x = 87
integer y = 428
integer width = 146
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "Du"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;IF v_langue = 'an' THEN
	This.text = 'From'
END IF
end event

type em_fin from editmask within w_patients_status
string tag = "resize=n"
integer x = 773
integer y = 404
integer width = 393
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type em_debut from editmask within w_patients_status
string tag = "resize=n"
integer x = 247
integer y = 408
integer width = 393
integer height = 92
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_patstatus from statictext within w_patients_status
string tag = "resize=n"
integer x = 46
integer y = 132
integer width = 1202
integer height = 116
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217747
long backcolor = 15793151
string text = "Patient par status"
alignment alignment = center!
boolean focusrectangle = false
end type

event constructor;IF v_langue = 'an' THEN
	This.text = 'Patient by status'
END IF
end event

type ddlb_status from u_ddlb within w_patients_status
string tag = "resize=n"
integer x = 101
integer y = 636
integer width = 1061
integer height = 680
integer taborder = 40
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event constructor;call super::constructor;long ll_statusid
string ls_code

IF v_langue = 'an' THEN
	of_addItem("All",-1)
ELSE
	of_addItem("Tous",-1)
END IF

DECLARE liststatus CURSOR FOR
  SELECT t_status.status_id,
         t_status.code  
    FROM t_status  
	WHERE t_status.ortho_id = :v_no_ortho
ORDER BY t_status.code ASC;

OPEN liststatus;

FETCH liststatus INTO :ll_statusid, :ls_code;

DO WHILE SQLCA.SQLCOde = 0
	
	of_addItem(ls_code,ll_statusid)
	
	FETCH liststatus INTO :ll_statusid, :ls_code;
	
LOOP

CLOSE liststatus;

of_selectITem(1)
end event

type ddlb_sat from u_ddlb within w_patients_status
string tag = "resize=n"
integer x = 101
integer y = 1540
integer width = 1061
integer height = 928
integer taborder = 30
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event constructor;call super::constructor;long ll_idsat
string ls_lieu
integer li_option

select isnull(compsat,0) into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	this.visible = true 
else
	this.visible = false
end if

IF v_langue = 'an' THEN
	of_addItem("All",-1)
ELSE
	of_addItem("Tous",-1)
END IF

DECLARE listsat CURSOR FOR
	 SELECT t_satellites.id_satellite, t_satellites.lieu FROM t_satellites;
	 
OPEN listsat;

FETCH listsat INTO :ll_idsat, :ls_lieu;

DO WHILE SQLCA.SQLCode = 0
	
	of_addItem(ls_lieu,ll_idsat)
	
	FETCH listsat INTO :ll_idsat, :ls_lieu;
	
LOOP

CLOSE listsat;

of_selectITem(1)

end event

event selectionchanged;call super::selectionchanged;//long ll_idsat
//
//ll_idsat = long(ddlb_sat.of_getselecteddata())
//if ll_idsat = 0 then setnull(ll_idsat)
//dw_status_patients.event ue_retrieve(ll_idsat)
end event

type cb_print from commandbutton within w_patients_status
string tag = "resize=mbl"
integer x = 1307
integer y = 1716
integer width = 603
integer height = 116
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_status_patients)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type cb_find from commandbutton within w_patients_status
string tag = "resize=n"
integer x = 599
integer y = 1696
integer width = 603
integer height = 116
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;long ll_idsat, ll_status

ll_idsat = long(ddlb_sat.of_getselecteddata())
IF ll_idsat = -1 THEN setnull(ll_idsat)

dw_status_patients.event ue_retrieve(ll_idsat)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Find'
end if
end event

type dw_status_patients from u_dw within w_patients_status
event ue_retrieve ( long al_sat )
string tag = "resize=abar"
integer x = 1307
integer y = 148
integer width = 2281
integer height = 1500
integer taborder = 70
string title = "Patients par statuts"
string dataobject = "d_patients_status"
boolean border = false
borderstyle borderstyle = styleraised!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve(long al_sat);date debut, fin
long ll_status, ll_phase

debut = gf_emtodate(em_debut.text)
fin = gf_emtodate(em_fin.text)

dw_status_patients.object.date_debut.text = em_debut.text
dw_status_patients.object.date_fin.text = em_fin.text

ll_status = long(ddlb_status.of_getselecteddata())
IF ll_status = -1 THEN setnull(ll_status)

ll_phase = long(ddlb_phase.of_getselecteddata())
IF ll_phase = -1 THEN setnull(ll_phase)

dw_status_patients.retrieve(v_no_ortho,debut,fin,ll_status,al_sat,ll_phase)
end event

event constructor;if v_langue = 'an' then
	dw_status_patients.object.t_titre.text = 'Patient by status for:'
	dw_status_patients.object.t_status.text = 'Status'
	dw_status_patients.object.b_status.text = 'Status'
	dw_status_patients.object.t_pat.text = 'Patient name'
	dw_status_patients.object.b_patnom.text = 'Patient name'
	dw_status_patients.object.t_datefact.text = 'Date'
	dw_status_patients.object.b_date.text = 'Date'
	dw_status_patients.object.t_printedon.text = 'Printed on'
	dw_status_patients.object.t_from.text = 'From:'
	dw_status_patients.object.t_to.text = 'to:'	
end if
SetTransObject(sqlca)

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

event clicked;choose case dwo.name
	case 'b_status'
		this.setsort('t_status_code A')
	case 'b_patnom'
		this.setsort('compute_1 A')
	case 'b_date'
		this.setsort('t_status_code A, date_facture A')
end choose
this.sort()
end event

type cb_close from commandbutton within w_patients_status
string tag = "resize=mrbr"
integer x = 2971
integer y = 1720
integer width = 603
integer height = 116
integer taborder = 60
integer textsize = -8
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

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type gb_1 from groupbox within w_patients_status
string tag = "resize=n"
integer x = 69
integer y = 316
integer width = 1134
integer height = 228
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217747
long backcolor = 15780518
string text = "Date"
end type

type gb_2 from groupbox within w_patients_status
string tag = "resize=n"
integer x = 73
integer y = 560
integer width = 1129
integer height = 636
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217747
long backcolor = 15780518
string text = "Status"
end type

type gb_3 from groupbox within w_patients_status
string tag = "resize=n"
integer x = 69
integer y = 1456
integer width = 1129
integer height = 212
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217747
long backcolor = 15780518
string text = "Satellite"
end type

type gb_4 from groupbox within w_patients_status
string tag = "resize=n"
integer x = 69
integer y = 1224
integer width = 1129
integer height = 212
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 134217747
long backcolor = 15780518
string text = "Phase"
end type

type r_1 from rectangle within w_patients_status
string tag = "resize=n"
long linecolor = 10789024
integer linethickness = 4
long fillcolor = 15793151
integer x = 37
integer y = 100
integer width = 1216
integer height = 168
end type

type r_2 from rectangle within w_patients_status
string tag = "resize=mbar"
long linecolor = 10789024
integer linethickness = 4
long fillcolor = 15793151
integer x = 1248
integer y = 1696
integer width = 2386
integer height = 168
end type

type r_3 from rectangle within w_patients_status
string tag = "resize=abar"
long linecolor = 10789024
integer linethickness = 4
long fillcolor = 134217728
integer x = 1248
integer y = 104
integer width = 2382
integer height = 1600
end type

type rr_2 from roundrectangle within w_patients_status
string tag = "resize=abar"
long linecolor = 10789024
integer linethickness = 4
long fillcolor = 15793151
integer x = 1289
integer y = 136
integer width = 2309
integer height = 1532
integer cornerheight = 40
integer cornerwidth = 46
end type

