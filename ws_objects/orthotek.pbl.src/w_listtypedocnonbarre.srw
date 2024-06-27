$PBExportHeader$w_listtypedocnonbarre.srw
forward
global type w_listtypedocnonbarre from w_child
end type
type em_fin from editmask within w_listtypedocnonbarre
end type
type em_debut from editmask within w_listtypedocnonbarre
end type
type st_to from statictext within w_listtypedocnonbarre
end type
type st_from from statictext within w_listtypedocnonbarre
end type
type dw_listtypedocnonbarre from u_dw within w_listtypedocnonbarre
end type
type st_title from statictext within w_listtypedocnonbarre
end type
type uo_toolbar from u_cst_toolbarstrip within w_listtypedocnonbarre
end type
type rr_1 from roundrectangle within w_listtypedocnonbarre
end type
type rr_2 from roundrectangle within w_listtypedocnonbarre
end type
end forward

global type w_listtypedocnonbarre from w_child
integer x = 214
integer y = 221
integer width = 3648
integer height = 1944
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
long backcolor = 15780518
em_fin em_fin
em_debut em_debut
st_to st_to
st_from st_from
dw_listtypedocnonbarre dw_listtypedocnonbarre
st_title st_title
uo_toolbar uo_toolbar
rr_1 rr_1
rr_2 rr_2
end type
global w_listtypedocnonbarre w_listtypedocnonbarre

forward prototypes
public subroutine uf_traduction ()
public subroutine of_imprimer ()
public subroutine of_rechercher ()
end prototypes

public subroutine uf_traduction ();uo_toolbar.of_displayborder(true)
uo_toolbar.of_settheme("classics")

if gnv_app.of_getlangue() = 'an' then
	title = "Not initialized document list"
	st_title.text = "Document type not initialed"
	uo_toolbar.of_additem("Search", "Search!")
	uo_toolbar.of_additem("Print", "Print!")
	uo_toolbar.of_additem("Close", "Exit!")
	st_from.text = "From:"
	st_to.text = "To:"
	dw_listtypedocnonbarre.object.t_patients_nodos_t.text
	dw_listtypedocnonbarre.object.typedocument_t.text = "Document's type"
else
	title = "Liste des documents non initialés"
	st_title.text = "Liste des types des documents non initialés"
	uo_toolbar.of_additem("Rechercher", "Search!")
	uo_toolbar.of_additem("Imprimer", "Print!")
	uo_toolbar.of_additem("Fermer", "Exit!")
end if

uo_toolbar.of_displaytext(true)
end subroutine

public subroutine of_imprimer ();gb_datawindow = true
openwithparm(w_print_options,dw_listtypedocnonbarre)
end subroutine

public subroutine of_rechercher ();date ldt_debut, ldt_fin

em_debut.getData(ldt_debut)
em_fin.getData(ldt_fin)
dw_listtypedocnonbarre.retrieve(ldt_debut,ldt_fin)
end subroutine

on w_listtypedocnonbarre.create
int iCurrent
call super::create
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_to=create st_to
this.st_from=create st_from
this.dw_listtypedocnonbarre=create dw_listtypedocnonbarre
this.st_title=create st_title
this.uo_toolbar=create uo_toolbar
this.rr_1=create rr_1
this.rr_2=create rr_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_fin
this.Control[iCurrent+2]=this.em_debut
this.Control[iCurrent+3]=this.st_to
this.Control[iCurrent+4]=this.st_from
this.Control[iCurrent+5]=this.dw_listtypedocnonbarre
this.Control[iCurrent+6]=this.st_title
this.Control[iCurrent+7]=this.uo_toolbar
this.Control[iCurrent+8]=this.rr_1
this.Control[iCurrent+9]=this.rr_2
end on

on w_listtypedocnonbarre.destroy
call super::destroy
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_to)
destroy(this.st_from)
destroy(this.dw_listtypedocnonbarre)
destroy(this.st_title)
destroy(this.uo_toolbar)
destroy(this.rr_1)
destroy(this.rr_2)
end on

event open;call super::open;em_debut.text = string(today())
em_fin.text = string(today())
end event

type em_fin from editmask within w_listtypedocnonbarre
string tag = "resize=mrb"
integer x = 3209
integer y = 1844
integer width = 421
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type em_debut from editmask within w_listtypedocnonbarre
string tag = "resize=mrb"
integer x = 2661
integer y = 1844
integer width = 411
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_to from statictext within w_listtypedocnonbarre
string tag = "resize=mrb"
integer x = 3081
integer y = 1844
integer width = 119
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "au: "
boolean focusrectangle = false
end type

type st_from from statictext within w_listtypedocnonbarre
string tag = "resize=mrb"
integer x = 2491
integer y = 1844
integer width = 160
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Du: "
boolean focusrectangle = false
end type

type dw_listtypedocnonbarre from u_dw within w_listtypedocnonbarre
string tag = "resize=arb"
integer x = 23
integer y = 152
integer width = 3602
integer height = 1652
integer taborder = 20
string dataobject = "d_listtypedocnonbarre"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event clicked;call super::clicked;selectRow(0,false)
selectRow(row,true)
end event

event doubleclicked;call super::doubleclicked;long ll_patid

if row > 0 then
	
	ll_patid = dw_listtypedocnonbarre.getItemNumber(row,'patient_patient_Id') 
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("lien app dossier patient",string(ll_patid))
	SetPointer(Hourglass!)
	IF IsValid(w_dossier_patients) THEN 
		if error_type(284) = 1 then
			w_dossier_patients.setposition(topmost!)
			CLOSE(w_dossier_patients)
		ELSE
			
			RETURN
		END IF
	END IF
	
	opensheetwithparm(w_dossier_patients,ll_patid,w_principal,2,layered!)
end if

end event

type st_title from statictext within w_listtypedocnonbarre
string tag = "resize=n"
integer x = 37
integer y = 28
integer width = 1472
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Liste des types de documents non initialés"
boolean focusrectangle = false
end type

type uo_toolbar from u_cst_toolbarstrip within w_listtypedocnonbarre
string tag = "resize=mbar"
integer x = 14
integer y = 1828
integer width = 2459
integer taborder = 20
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;CHOOSE CASE as_button
	CASE "Search", "Rechercher"
		of_rechercher()
	CASE "Print", "Imprimer"
		of_imprimer()
	CASE "Close", "Fermer"
		close(parent)
END CHOOSE
end event

type rr_1 from roundrectangle within w_listtypedocnonbarre
string tag = "resize=ar"
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15793151
integer x = 9
integer y = 8
integer width = 3625
integer height = 120
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_listtypedocnonbarre
string tag = "resize=arb"
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 12639424
integer x = 9
integer y = 140
integer width = 3625
integer height = 1676
integer cornerheight = 40
integer cornerwidth = 46
end type

