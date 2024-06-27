$PBExportHeader$u_ddlb.sru
$PBExportComments$Extension DropDownListBox class
forward
global type u_ddlb from pro_u_ddlb
end type
end forward

global type u_ddlb from pro_u_ddlb
end type
global u_ddlb u_ddlb

forward prototypes
public subroutine setdata (string as_dataobject, string as_nom, string as_cle, ref long al_cle[], string as_filtre)
end prototypes

public subroutine setdata (string as_dataobject, string as_nom, string as_cle, ref long al_cle[], string as_filtre);/****************************************************************************
* Fonction setData
*
*
*
*****************************************************************************
* Programmé par : Dave Tremblay
* Date : mars 2006
*****************************************************************************/


datastore ds_fill
long i, ll_id
string ls_nom

ds_fill = create datastore

// On détermine le dataobject à utiliser

ds_fill.dataobject = as_dataobject
ds_fill.setTransObject(SQLCA)

// ON applique le filtre
// Éventuellement on devrait valider le filtre

ds_fill.setFilter(as_filtre)
ds_fill.retrieve()

// On parcours la liste et on les ajoute à la ddlb

for i = 1 to ds_fill.rowcount()
	ls_nom = ds_fill.getItemString(i,as_nom)
	ll_id = ds_fill.getItemNumber(i,as_cle)
	addItem(ls_nom)
	al_cle[i] = ll_id
next

destroy ds_fill


end subroutine

on u_ddlb.create
call super::create
end on

on u_ddlb.destroy
call super::destroy
end on

