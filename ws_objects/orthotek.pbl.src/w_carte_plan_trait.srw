$PBExportHeader$w_carte_plan_trait.srw
forward
global type w_carte_plan_trait from w_child
end type
type cb_1 from commandbutton within w_carte_plan_trait
end type
type dw_carte_plan_trait from u_dw within w_carte_plan_trait
end type
type st_title from statictext within w_carte_plan_trait
end type
type cb_fermer from commandbutton within w_carte_plan_trait
end type
type cb_save from commandbutton within w_carte_plan_trait
end type
type cb_print from commandbutton within w_carte_plan_trait
end type
type rr_1 from roundrectangle within w_carte_plan_trait
end type
type p_unlock from picture within w_carte_plan_trait
end type
type p_lock from picture within w_carte_plan_trait
end type
end forward

global type w_carte_plan_trait from w_child
integer x = 5
integer y = 4
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
boolean ib_isupdateable = false
cb_1 cb_1
dw_carte_plan_trait dw_carte_plan_trait
st_title st_title
cb_fermer cb_fermer
cb_save cb_save
cb_print cb_print
rr_1 rr_1
p_unlock p_unlock
p_lock p_lock
end type
global w_carte_plan_trait w_carte_plan_trait

type variables
boolean ib_change = false
end variables

forward prototypes
public subroutine uf_traduction ()
public subroutine of_sauvegarde ()
end prototypes

public subroutine uf_traduction ();if v_langue = 'an' then
	title = 'Treatment plan linked with card'
else
	title = 'Plan de traitement lier de la carte'
end if
end subroutine

public subroutine of_sauvegarde ();if ib_change then
	if dw_carte_plan_trait.update() = 1 then
		commit using SQLCA;
		ib_change = false
	else
		rollback using SQLCA;
	end if
end if
end subroutine

on w_carte_plan_trait.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_carte_plan_trait=create dw_carte_plan_trait
this.st_title=create st_title
this.cb_fermer=create cb_fermer
this.cb_save=create cb_save
this.cb_print=create cb_print
this.rr_1=create rr_1
this.p_unlock=create p_unlock
this.p_lock=create p_lock
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_carte_plan_trait
this.Control[iCurrent+3]=this.st_title
this.Control[iCurrent+4]=this.cb_fermer
this.Control[iCurrent+5]=this.cb_save
this.Control[iCurrent+6]=this.cb_print
this.Control[iCurrent+7]=this.rr_1
this.Control[iCurrent+8]=this.p_unlock
this.Control[iCurrent+9]=this.p_lock
end on

on w_carte_plan_trait.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_carte_plan_trait)
destroy(this.st_title)
destroy(this.cb_fermer)
destroy(this.cb_save)
destroy(this.cb_print)
destroy(this.rr_1)
destroy(this.p_unlock)
destroy(this.p_lock)
end on

event pfc_preopen;call super::pfc_preopen;long ll_patid, ll_newrow, ll_debarreanal
date ldt_datebarre

select debarrer_anal into :ll_debarreanal from t_options where ortho_id = :v_no_ortho;

ll_patid = long(gnv_app.inv_entrepotglobal.of_retournedonnee("id_cartetraitplantrait"))
if dw_carte_plan_trait.retrieve(ll_patid) = 0 then
	ll_newrow = dw_carte_plan_trait.insertRow(0)
	dw_carte_plan_trait.setItem(ll_newrow,'t_carte_plan_trait_patient_Id',ll_patid)
	ldt_datebarre = today()
	ib_change = true
else
	
end if

// Regarder si l'on barre ou non le cadenas

if isnull(ll_debarreanal) then
	dw_carte_plan_trait.setItem(dw_carte_plan_trait.getRow(),'locked',0)
	p_unlock.visible = true
else
	if daysafter(ldt_datebarre,today()) >= ll_debarreanal then
		dw_carte_plan_trait.setItem(dw_carte_plan_trait.getRow(),'locked',1)
		p_unlock.visible = false
	else
		dw_carte_plan_trait.setItem(dw_carte_plan_trait.getRow(),'locked',0)
		p_unlock.visible = true
	end if
end if
end event

type cb_1 from commandbutton within w_carte_plan_trait
integer x = 695
integer y = 1896
integer width = 1573
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type dw_carte_plan_trait from u_dw within w_carte_plan_trait
integer x = 18
integer y = 184
integer width = 3611
integer height = 1684
integer taborder = 10
string dataobject = "d_carte_plan_trait"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;call super::itemchanged;ib_change = true
end event

event editchanged;call super::editchanged;ib_change = true
end event

type st_title from statictext within w_carte_plan_trait
integer x = 50
integer y = 36
integer width = 3415
integer height = 80
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Rapport d~'analyse"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_fermer from commandbutton within w_carte_plan_trait
integer x = 2953
integer y = 1896
integer width = 677
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;if ib_change then
	if error_type(200) = 1 then
		of_sauvegarde()
	end if
end if
close(parent)
end event

type cb_save from commandbutton within w_carte_plan_trait
integer x = 2272
integer y = 1896
integer width = 677
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Enregistrer"
end type

event clicked;of_sauvegarde()
end event

type cb_print from commandbutton within w_carte_plan_trait
integer x = 18
integer y = 1896
integer width = 677
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;of_sauvegarde()

gb_datawindow = true
openwithparm(w_print_options,dw_carte_plan_trait)
end event

type rr_1 from roundrectangle within w_carte_plan_trait
integer linethickness = 4
long fillcolor = 15793151
integer x = 18
integer y = 20
integer width = 3611
integer height = 120
integer cornerheight = 40
integer cornerwidth = 46
end type

type p_unlock from picture within w_carte_plan_trait
integer x = 3502
integer y = 32
integer width = 110
integer height = 96
string picturename = "C:\ii4net\orthotek\images\unlock.jpg"
boolean focusrectangle = false
end type

type p_lock from picture within w_carte_plan_trait
integer x = 3502
integer y = 32
integer width = 110
integer height = 96
string picturename = "C:\ii4net\orthotek\images\lock.jpg"
boolean focusrectangle = false
end type

event clicked;gnv_app.inv_entrepotglobal.of_ajoutedonnee("typederapport","feuilleanalyse")

// Demander le mot de passe
w_password_unlock lw_win
OpenWithParm(lw_win, "")
IF MEssage.StringParm = "ok" THEN
//	ib_admin_cons = TRUE
	p_unlock.visible = TRUE
	p_lock.visible = FALSE
	dw_carte_plan_trait.setItem(dw_carte_plan_trait.getRow(),'locked',0)
END IF
end event

