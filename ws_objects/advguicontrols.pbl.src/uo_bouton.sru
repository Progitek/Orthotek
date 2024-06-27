﻿$PBExportHeader$uo_bouton.sru
forward
global type uo_bouton from userobject
end type
type uo_1 from u_cst_toolbarstrip within uo_bouton
end type
end forward

global type uo_bouton from userobject
integer width = 571
integer height = 100
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_1 uo_1
end type
global uo_bouton uo_bouton

type variables
string is_libelle
string is_image
end variables

on uo_bouton.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on uo_bouton.destroy
destroy(this.uo_1)
end on

event constructor;uo_1.of_AddItem(is_Libelle, is_image)
uo_1.of_DisplayText(true)
uo_1.of_DisplayBorder(false)


long ll_width

choose case len(is_libelle)
	case 1 to 10
		ll_width = 320
	case 11 to 25
		ll_width = 500
	case 26 to 40
		ll_width = 10000
	case else
		ll_width = 10000
end choose
uo_1.width = 25 * len(is_libelle)
this.width =  25 * len(is_libelle)

end event

type uo_1 from u_cst_toolbarstrip within uo_bouton
integer width = 585
integer height = 100
integer taborder = 10
end type

on uo_1.destroy
call u_cst_toolbarstrip::destroy
end on

