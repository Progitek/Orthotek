$PBExportHeader$u_tabpdossfin.sru
forward
global type u_tabpdossfin from u_tabpg
end type
type dw_traitements from u_dw within u_tabpdossfin
end type
end forward

global type u_tabpdossfin from u_tabpg
integer width = 1861
integer height = 1308
dw_traitements dw_traitements
end type
global u_tabpdossfin u_tabpdossfin

on u_tabpdossfin.create
int iCurrent
call super::create
this.dw_traitements=create dw_traitements
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_traitements
end on

on u_tabpdossfin.destroy
call super::destroy
destroy(this.dw_traitements)
end on

type dw_traitements from u_dw within u_tabpdossfin
integer width = 1861
integer height = 1296
integer taborder = 10
string dataobject = "d_traitementstabdossfin"
boolean vscrollbar = false
boolean border = false
end type

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)
end event

