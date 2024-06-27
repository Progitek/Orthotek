$PBExportHeader$w_viewelast.srw
forward
global type w_viewelast from w_response
end type
type dw_cartetraitelast from u_dw within w_viewelast
end type
end forward

global type w_viewelast from w_response
integer x = 214
integer y = 221
integer width = 2085
integer height = 1212
boolean center = true
dw_cartetraitelast dw_cartetraitelast
end type
global w_viewelast w_viewelast

type variables
long il_idcartetrait
end variables

on w_viewelast.create
int iCurrent
call super::create
this.dw_cartetraitelast=create dw_cartetraitelast
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_cartetraitelast
end on

on w_viewelast.destroy
call super::destroy
destroy(this.dw_cartetraitelast)
end on

event pfc_preopen;call super::pfc_preopen;long i
string ls_objects, ls_objet[]
n_cst_string luo_string

il_idcartetrait = long(gnv_app.inv_entrepotglobal.of_retournedonnee("cartetraitelast") )
dw_cartetraitelast.retrieve(il_idcartetrait)

ls_objects = dw_cartetraitelast.object.datawindow.objects 
luo_string.of_parsetoarray(ls_objects, "~t",ls_objet)
for i = 1 to upperbound(ls_objet)
	if dw_cartetraitelast.describe(ls_objet[i] + ".type") = 'column' then
		dw_cartetraitelast.settaborder(ls_objet[i],0)
	end if
next

end event

type dw_cartetraitelast from u_dw within w_viewelast
integer y = 8
integer width = 2057
integer height = 1100
integer taborder = 10
string dataobject = "d_cartetraitelast"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

