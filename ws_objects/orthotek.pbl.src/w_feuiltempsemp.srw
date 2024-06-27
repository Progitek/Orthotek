$PBExportHeader$w_feuiltempsemp.srw
forward
global type w_feuiltempsemp from w_child
end type
type ddlb_pers from u_ddlb within w_feuiltempsemp
end type
type cb_close from commandbutton within w_feuiltempsemp
end type
type em_fin from u_em within w_feuiltempsemp
end type
type st_to from statictext within w_feuiltempsemp
end type
type em_debut from u_em within w_feuiltempsemp
end type
type st_from from statictext within w_feuiltempsemp
end type
type cb_4 from commandbutton within w_feuiltempsemp
end type
type cb_print from commandbutton within w_feuiltempsemp
end type
type cb_search from commandbutton within w_feuiltempsemp
end type
type dw_feuiltempsemp from u_dw within w_feuiltempsemp
end type
end forward

global type w_feuiltempsemp from w_child
integer x = 214
integer y = 221
integer width = 3630
integer height = 1944
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
long backcolor = 15780518
ddlb_pers ddlb_pers
cb_close cb_close
em_fin em_fin
st_to st_to
em_debut em_debut
st_from st_from
cb_4 cb_4
cb_print cb_print
cb_search cb_search
dw_feuiltempsemp dw_feuiltempsemp
end type
global w_feuiltempsemp w_feuiltempsemp

type variables
Long il_iduser
end variables

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();if gs_langue = 'an' then
	title = 'Stats - Employee time sheets'
else
	title = 'Stat. - Feuilles de temps'
end if
end subroutine

on w_feuiltempsemp.create
int iCurrent
call super::create
this.ddlb_pers=create ddlb_pers
this.cb_close=create cb_close
this.em_fin=create em_fin
this.st_to=create st_to
this.em_debut=create em_debut
this.st_from=create st_from
this.cb_4=create cb_4
this.cb_print=create cb_print
this.cb_search=create cb_search
this.dw_feuiltempsemp=create dw_feuiltempsemp
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_pers
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.em_fin
this.Control[iCurrent+4]=this.st_to
this.Control[iCurrent+5]=this.em_debut
this.Control[iCurrent+6]=this.st_from
this.Control[iCurrent+7]=this.cb_4
this.Control[iCurrent+8]=this.cb_print
this.Control[iCurrent+9]=this.cb_search
this.Control[iCurrent+10]=this.dw_feuiltempsemp
end on

on w_feuiltempsemp.destroy
call super::destroy
destroy(this.ddlb_pers)
destroy(this.cb_close)
destroy(this.em_fin)
destroy(this.st_to)
destroy(this.em_debut)
destroy(this.st_from)
destroy(this.cb_4)
destroy(this.cb_print)
destroy(this.cb_search)
destroy(this.dw_feuiltempsemp)
end on

event open;call super::open;em_debut.text = string(today())
em_fin.text = string(today())
end event

type ddlb_pers from u_ddlb within w_feuiltempsemp
integer x = 2574
integer y = 4
integer width = 1047
integer height = 776
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Arial"
end type

event constructor;call super::constructor;long ll_idpers
string ls_nom

if gs_langue = 'an' then
	of_addITem('All',-1)
else
	of_addITem('Tous',-1)
end if

DECLARE listpers CURSOR FOR
	select id_personnel, isnull(nom,'') || ' ' || isnull(prenom,'') as nom 
	FROM t_personnels 
	WHERE t_personnels.ortho_id = :v_no_ortho and
			isnull(t_personnels.actif,0) = 1 and
			isnull(t_personnels.groupe,0) = 0
	order by nom asc;
	
OPEN listpers;

FETCH listpers INTO :ll_idpers, :ls_nom;

DO WHILE SQLCA.SQLCode = 0
	
	of_addItem(ls_nom,ll_idpers)
	
	FETCH listpers INTO :ll_idpers, :ls_nom;

LOOP

CLOSE listpers;

of_selectItem(1)
end event

type cb_close from commandbutton within w_feuiltempsemp
integer x = 2971
integer y = 1824
integer width = 654
integer height = 112
integer taborder = 50
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

type em_fin from u_em within w_feuiltempsemp
integer x = 2560
integer y = 1836
integer width = 402
integer height = 88
integer taborder = 60
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
boolean ib_autoselect = true
boolean ib_rmbmenu = false
end type

type st_to from statictext within w_feuiltempsemp
integer x = 2469
integer y = 1844
integer width = 91
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "AU"
boolean focusrectangle = false
end type

type em_debut from u_em within w_feuiltempsemp
integer x = 2057
integer y = 1836
integer width = 402
integer height = 88
integer taborder = 50
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
boolean ib_autoselect = true
boolean ib_rmbmenu = false
end type

type st_from from statictext within w_feuiltempsemp
integer x = 1897
integer y = 1844
integer width = 151
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "DU"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_feuiltempsemp
integer x = 1198
integer y = 1824
integer width = 677
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

type cb_print from commandbutton within w_feuiltempsemp
integer x = 599
integer y = 1824
integer width = 599
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;dw_feuiltempsemp.print(true,true)
end event

type cb_search from commandbutton within w_feuiltempsemp
integer x = 5
integer y = 1824
integer width = 594
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;datetime ldt_datedeb, ldt_datefin
long ll_iduser


if em_debut.text = '' then
	setnull(ldt_datedeb)
else
	ldt_datedeb = datetime(gf_emtodate(em_debut.text),time('00:00:00.000'))
end if

if em_fin.text = '' then
	setnull(ldt_datefin)
else
	ldt_datefin = datetime(gf_emtodate(em_fin.text),time('23:59:00.000'))
end if

if long(ddlb_pers.of_getselecteddata()) = -1 then
	setnull(ll_iduser)
else
	ll_iduser = long(ddlb_pers.of_getselecteddata())
end if

dw_feuiltempsemp.retrieve(ldt_datedeb,ldt_datefin,ll_iduser)
end event

type dw_feuiltempsemp from u_dw within w_feuiltempsemp
integer y = 104
integer width = 3621
integer height = 1700
integer taborder = 10
string dataobject = "d_feuiltempsemp"
end type

event constructor;call super::constructor;setTransObject(SQLCA)
end event

