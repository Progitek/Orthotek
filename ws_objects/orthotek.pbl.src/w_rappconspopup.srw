$PBExportHeader$w_rappconspopup.srw
forward
global type w_rappconspopup from w_popup
end type
type uo_toolbar from u_cst_toolbarstrip within w_rappconspopup
end type
type st_1 from statictext within w_rappconspopup
end type
type dw_rappcons from u_dw within w_rappconspopup
end type
type rr_1 from roundrectangle within w_rappconspopup
end type
type rr_2 from roundrectangle within w_rappconspopup
end type
end forward

global type w_rappconspopup from w_popup
integer x = 214
integer y = 221
integer width = 3657
integer height = 1916
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 15780518
boolean center = true
uo_toolbar uo_toolbar
st_1 st_1
dw_rappcons dw_rappcons
rr_1 rr_1
rr_2 rr_2
end type
global w_rappconspopup w_rappconspopup

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();uo_toolbar.of_displayborder(true)
uo_toolbar.of_settheme("classics")

if v_langue = 'an' then
	uo_toolbar.of_additem( "Close", "Exit!")
else
	uo_toolbar.of_additem( "Fermer", "Exit!")
end if

uo_toolbar.of_displaytext(true)
end subroutine

on w_rappconspopup.create
int iCurrent
call super::create
this.uo_toolbar=create uo_toolbar
this.st_1=create st_1
this.dw_rappcons=create dw_rappcons
this.rr_1=create rr_1
this.rr_2=create rr_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_toolbar
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_rappcons
this.Control[iCurrent+4]=this.rr_1
this.Control[iCurrent+5]=this.rr_2
end on

on w_rappconspopup.destroy
call super::destroy
destroy(this.uo_toolbar)
destroy(this.st_1)
destroy(this.dw_rappcons)
destroy(this.rr_1)
destroy(this.rr_2)
end on

event open;call super::open;long ll_patid, ll_typerapcons, ll_col

ll_patid = long(gnv_app.inv_entrepotglobal.of_retournedonnee("RappConsPatientId") )
select typerapcons into :ll_typerapcons from t_options where ortho_id = :v_no_ortho;
choose case ll_typerapcons 
	case 1
		dw_rappcons.dataobject = 'd_dosspatficheconsult'
	case 2
		dw_rappcons.dataobject = 'd_rapconsultluigi'
	case 3
		dw_rappcons.dataobject = 'd_rapconsultvenneri'
	case 4
		dw_rappcons.dataobject = 'd_rapconsultdrouin'
	case 5
		dw_rappcons.dataobject = 'd_rapconsultberube'
end choose
dw_rappcons.setTransObject(SQLCA)
dw_rappcons.retrieve(ll_patid)

for ll_col = 1 to long(dw_rappcons.object.datawindow.column.count)
	dw_rappcons.setTabOrder(ll_col, 0)
next

end event

type uo_toolbar from u_cst_toolbarstrip within w_rappconspopup
integer x = 5
integer y = 1724
integer width = 3625
integer taborder = 20
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;close(parent)
end event

type st_1 from statictext within w_rappconspopup
integer x = 46
integer y = 32
integer width = 631
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Rapport de consultation"
boolean focusrectangle = false
end type

type dw_rappcons from u_dw within w_rappconspopup
integer x = 32
integer y = 156
integer width = 3570
integer height = 1528
integer taborder = 10
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

type rr_1 from roundrectangle within w_rappconspopup
integer linethickness = 4
long fillcolor = 15793151
integer x = 9
integer y = 4
integer width = 3621
integer height = 120
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_rappconspopup
integer linethickness = 4
long fillcolor = 15793151
integer x = 9
integer y = 136
integer width = 3621
integer height = 1568
integer cornerheight = 40
integer cornerwidth = 46
end type

