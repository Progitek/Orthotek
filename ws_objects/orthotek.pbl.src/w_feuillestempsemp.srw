$PBExportHeader$w_feuillestempsemp.srw
forward
global type w_feuillestempsemp from w_child
end type
type em_fin from editmask within w_feuillestempsemp
end type
type st_3 from statictext within w_feuillestempsemp
end type
type em_debut from editmask within w_feuillestempsemp
end type
type st_2 from statictext within w_feuillestempsemp
end type
type st_user from statictext within w_feuillestempsemp
end type
type st_1 from statictext within w_feuillestempsemp
end type
type dw_feuiltemps from u_dw within w_feuillestempsemp
end type
type cb_search from commandbutton within w_feuillestempsemp
end type
type cb_print from commandbutton within w_feuillestempsemp
end type
type cb_fermer from commandbutton within w_feuillestempsemp
end type
end forward

global type w_feuillestempsemp from w_child
integer x = 214
integer y = 221
long backcolor = 15780518
em_fin em_fin
st_3 st_3
em_debut em_debut
st_2 st_2
st_user st_user
st_1 st_1
dw_feuiltemps dw_feuiltemps
cb_search cb_search
cb_print cb_print
cb_fermer cb_fermer
end type
global w_feuillestempsemp w_feuillestempsemp

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();if v_langue = 'an' then
	title = "Time sheet"
else
	title = "Feuille de temps"
end if
end subroutine

on w_feuillestempsemp.create
int iCurrent
call super::create
this.em_fin=create em_fin
this.st_3=create st_3
this.em_debut=create em_debut
this.st_2=create st_2
this.st_user=create st_user
this.st_1=create st_1
this.dw_feuiltemps=create dw_feuiltemps
this.cb_search=create cb_search
this.cb_print=create cb_print
this.cb_fermer=create cb_fermer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_fin
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.em_debut
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_user
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.dw_feuiltemps
this.Control[iCurrent+8]=this.cb_search
this.Control[iCurrent+9]=this.cb_print
this.Control[iCurrent+10]=this.cb_fermer
end on

on w_feuillestempsemp.destroy
call super::destroy
destroy(this.em_fin)
destroy(this.st_3)
destroy(this.em_debut)
destroy(this.st_2)
destroy(this.st_user)
destroy(this.st_1)
destroy(this.dw_feuiltemps)
destroy(this.cb_search)
destroy(this.cb_print)
destroy(this.cb_fermer)
end on

event open;call super::open;st_user.text = gs_user
em_debut.text = string(today())
em_fin.text = string(today())
end event

type em_fin from editmask within w_feuillestempsemp
integer x = 2441
integer y = 1924
integer width = 393
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_3 from statictext within w_feuillestempsemp
integer x = 2309
integer y = 1940
integer width = 119
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Au"
boolean focusrectangle = false
end type

type em_debut from editmask within w_feuillestempsemp
integer x = 1870
integer y = 1924
integer width = 393
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_2 from statictext within w_feuillestempsemp
integer x = 1728
integer y = 1940
integer width = 119
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Du"
boolean focusrectangle = false
end type

type st_user from statictext within w_feuillestempsemp
integer x = 960
integer y = 8
integer width = 1550
integer height = 92
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean focusrectangle = false
end type

type st_1 from statictext within w_feuillestempsemp
integer x = 18
integer y = 8
integer width = 928
integer height = 92
integer textsize = -16
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Feuille de temps de : "
boolean focusrectangle = false
end type

type dw_feuiltemps from u_dw within w_feuillestempsemp
integer x = 14
integer y = 120
integer width = 3621
integer height = 1788
integer taborder = 10
string dataobject = "d_feuiltemps"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

type cb_search from commandbutton within w_feuillestempsemp
integer x = 878
integer y = 1920
integer width = 832
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;date ldt_debut, ldt_fin

if em_debut.getdata(ldt_debut) <> 1 then return
if em_fin.getData(ldt_fin) <> 1 then return

dw_feuiltemps.retrieve(gl_idpers,ldt_debut, ldt_fin)
end event

type cb_print from commandbutton within w_feuillestempsemp
integer x = 9
integer y = 1920
integer width = 864
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options, dw_feuiltemps)
end event

type cb_fermer from commandbutton within w_feuillestempsemp
integer x = 2866
integer y = 1920
integer width = 768
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

