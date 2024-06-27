$PBExportHeader$w_rdvsequence.srw
forward
global type w_rdvsequence from w_child
end type
type cb_save from u_cb within w_rdvsequence
end type
type cb_close from u_cb within w_rdvsequence
end type
type cb_del from u_cb within w_rdvsequence
end type
type cb_add from u_cb within w_rdvsequence
end type
type dw_rdvsequence from u_dw within w_rdvsequence
end type
end forward

global type w_rdvsequence from w_child
integer x = 214
integer y = 221
integer width = 2583
integer height = 1848
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean center = true
boolean ib_isupdateable = false
cb_save cb_save
cb_close cb_close
cb_del cb_del
cb_add cb_add
dw_rdvsequence dw_rdvsequence
end type
global w_rdvsequence w_rdvsequence

type variables
private long il_patid
public boolean change = false
end variables

on w_rdvsequence.create
int iCurrent
call super::create
this.cb_save=create cb_save
this.cb_close=create cb_close
this.cb_del=create cb_del
this.cb_add=create cb_add
this.dw_rdvsequence=create dw_rdvsequence
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_save
this.Control[iCurrent+2]=this.cb_close
this.Control[iCurrent+3]=this.cb_del
this.Control[iCurrent+4]=this.cb_add
this.Control[iCurrent+5]=this.dw_rdvsequence
end on

on w_rdvsequence.destroy
call super::destroy
destroy(this.cb_save)
destroy(this.cb_close)
destroy(this.cb_del)
destroy(this.cb_add)
destroy(this.dw_rdvsequence)
end on

event open;call super::open;datawindowchild ddwc_mod

il_patid = message.doubleparm
dw_rdvsequence.retrieve(il_patid,v_no_ortho)
dw_rdvsequence.getchild( "t_rdvsequence_type_traitement_id", ddwc_mod)
ddwc_mod.setTransObject(SQLCA)
ddwc_mod.SetFilter("ortho_id = "+string(v_no_ortho))
ddwc_mod.Retrieve()
end event

type cb_save from u_cb within w_rdvsequence
integer x = 1568
integer y = 1692
integer width = 489
integer height = 128
integer taborder = 50
integer textsize = -10
string text = "Sauvegarder"
end type

event clicked;call super::clicked;dw_rdvsequence.event ue_update()
end event

type cb_close from u_cb within w_rdvsequence
integer x = 2062
integer y = 1692
integer width = 489
integer height = 128
integer taborder = 40
integer textsize = -10
string text = "Fermer"
end type

event clicked;call super::clicked;if change then
	if error_type(200) = 1 then
		dw_rdvsequence.event ue_update()
	end if
end if

close(parent)
end event

type cb_del from u_cb within w_rdvsequence
integer x = 517
integer y = 1692
integer width = 489
integer height = 128
integer taborder = 30
integer textsize = -10
string text = "Supprimer"
end type

type cb_add from u_cb within w_rdvsequence
integer x = 27
integer y = 1692
integer width = 489
integer height = 128
integer taborder = 20
integer textsize = -10
string text = "Ajouter"
end type

event clicked;call super::clicked;dw_rdvsequence.event addRow()
end event

type dw_rdvsequence from u_dw within w_rdvsequence
event addrow ( )
event delrow ( integer row )
event ue_update ( )
integer x = 18
integer y = 16
integer width = 2533
integer height = 1664
integer taborder = 10
string dataobject = "d_rdvsequence"
end type

event addrow();Long ll_newrow

ll_newrow = insertRow(0)
scrollToRow(ll_newrow)
setitem(ll_newrow,'t_rdvsequence_ortho_id',v_no_ortho)
setitem(ll_newrow,'t_rdvsequence_patient_id',il_patid)
setFocus()
change = true
end event

event delrow(integer row);deleteRow(row)
change = true
event ue_update()
end event

event ue_update();if change then
	if update() = 1 then
		commit using SQLCA;
		change = false
	else
		rollback using SQLCA;
	end if
end if
end event

event constructor;call super::constructor;settransobject(SQLCA)
end event

event itemchanged;call super::itemchanged;change = true
end event

event editchanged;call super::editchanged;change = true
end event

