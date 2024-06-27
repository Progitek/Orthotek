$PBExportHeader$w_modfeuiltemps.srw
forward
global type w_modfeuiltemps from w_child
end type
type st_title from st_uo_transparent within w_modfeuiltemps
end type
type p_8 from picture within w_modfeuiltemps
end type
type dw_modfeuiltemps from u_dw within w_modfeuiltemps
end type
type uo_toolbar from u_cst_toolbarstrip within w_modfeuiltemps
end type
type rr_infopat from roundrectangle within w_modfeuiltemps
end type
type rr_1 from roundrectangle within w_modfeuiltemps
end type
end forward

global type w_modfeuiltemps from w_child
integer width = 3648
integer height = 1944
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 15780518
st_title st_title
p_8 p_8
dw_modfeuiltemps dw_modfeuiltemps
uo_toolbar uo_toolbar
rr_infopat rr_infopat
rr_1 rr_1
end type
global w_modfeuiltemps w_modfeuiltemps

type variables
public long il_iduser

boolean	change = FALSE
end variables

forward prototypes
public subroutine uf_traduction ()
public function boolean of_save ()
end prototypes

public subroutine uf_traduction ();uo_toolbar.of_displayborder(true)
uo_toolbar.of_settheme("classics")

if gnv_app.of_getlangue() = 'an' then
	st_title.text = "Employee(s) time sheets"
	uo_toolbar.of_addItem("Add","C:\ii4net\orthotek\images\ajouter.ico")
	uo_toolbar.of_addItem("Save","Save!")
	uo_toolbar.of_addItem("Close","Exit!")
else
	uo_toolbar.of_addItem("Ajouter","C:\ii4net\orthotek\images\ajouter.ico")
	uo_toolbar.of_addItem("Sauvegarde","Save!")
	uo_toolbar.of_addItem("Fermer","Exit!")
end if

uo_toolbar.of_displaytext(true)
end subroutine

public function boolean of_save ();
if dw_modfeuiltemps.update() = 1 then
	change = FALSE
	commit using SQLCA;
	RETURN TRUE
else
	rollback using SQLCA;	
	RETURN FALSE
end if
end function

on w_modfeuiltemps.create
int iCurrent
call super::create
this.st_title=create st_title
this.p_8=create p_8
this.dw_modfeuiltemps=create dw_modfeuiltemps
this.uo_toolbar=create uo_toolbar
this.rr_infopat=create rr_infopat
this.rr_1=create rr_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_title
this.Control[iCurrent+2]=this.p_8
this.Control[iCurrent+3]=this.dw_modfeuiltemps
this.Control[iCurrent+4]=this.uo_toolbar
this.Control[iCurrent+5]=this.rr_infopat
this.Control[iCurrent+6]=this.rr_1
end on

on w_modfeuiltemps.destroy
call super::destroy
destroy(this.st_title)
destroy(this.p_8)
destroy(this.dw_modfeuiltemps)
destroy(this.uo_toolbar)
destroy(this.rr_infopat)
destroy(this.rr_1)
end on

event open;call super::open;dw_modfeuiltemps.retrieve(il_iduser)
end event

event pfc_preopen;call super::pfc_preopen;il_iduser = long(gnv_app.inv_entrepotglobal.of_retournedonnee("idusermodfeuiltemps"))
end event

event closequery;call super::closequery;boolean	lb_retour

if change then
	if error_type(200) = 1 then
		lb_retour = of_save()
		IF lb_retour = FALSE THEN RETURN 1
	end if
end if
end event

type st_title from st_uo_transparent within w_modfeuiltemps
string tag = "resize=frbsr"
integer x = 169
integer y = 32
integer width = 1161
integer height = 64
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string text = "Feuilles de temps"
end type

type p_8 from picture within w_modfeuiltemps
string tag = "resize=frb"
integer x = 64
integer y = 32
integer width = 82
integer height = 64
string picturename = "C:\ii4net\orthotek\images\autreinfo.jpg"
boolean focusrectangle = false
end type

type dw_modfeuiltemps from u_dw within w_modfeuiltemps
integer x = 96
integer y = 176
integer width = 3470
integer height = 1600
integer taborder = 10
string dataobject = "d_modfeuiltemps"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event editchanged;call super::editchanged;change = true
end event

type uo_toolbar from u_cst_toolbarstrip within w_modfeuiltemps
integer x = 23
integer y = 1836
integer width = 3602
integer taborder = 10
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;CHOOSE CASE as_button
	CASE "Save","Sauvegarde"
		of_save()
	CASE "Close","Fermer"
		close(parent)
	CASE "Ajouter", "Add"
		long ll_row

		ll_row = dw_modfeuiltemps.insertRow(1)
		dw_modfeuiltemps.scrollToRow(ll_row)
		dw_modfeuiltemps.SetRow(ll_row)
		dw_modfeuiltemps.object.id_personnel[ll_row] = il_iduser
		dw_modfeuiltemps.setFocus()
		dw_modfeuiltemps.setColumn('heureentree')
		change = true
		
END CHOOSE
end event

type rr_infopat from roundrectangle within w_modfeuiltemps
string tag = "resize=frbsr"
long linecolor = 8421504
integer linethickness = 4
long fillcolor = 15793151
integer x = 14
integer y = 12
integer width = 3611
integer height = 108
integer cornerheight = 75
integer cornerwidth = 75
end type

type rr_1 from roundrectangle within w_modfeuiltemps
long linecolor = 8421504
integer linethickness = 4
long fillcolor = 15793151
integer x = 18
integer y = 144
integer width = 3607
integer height = 1668
integer cornerheight = 40
integer cornerwidth = 46
end type

