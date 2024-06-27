$PBExportHeader$pro_n_cst_appmanager.sru
$PBExportComments$(PRO) Extension Application Manager service
forward
global type pro_n_cst_appmanager from pfc_n_cst_appmanager
end type
end forward

global type pro_n_cst_appmanager from pfc_n_cst_appmanager
end type
global pro_n_cst_appmanager pro_n_cst_appmanager

type variables
n_cst_entrepotglobal    	inv_EntrepotGlobal
end variables

on pro_n_cst_appmanager.create
call super::create
end on

on pro_n_cst_appmanager.destroy
call super::destroy
end on

event constructor;call super::constructor;IF IsNull(inv_EntrepotGlobal) Or Not IsValid (inv_EntrepotGlobal) THEN
	inv_EntrepotGlobal = CREATE n_cst_entrepotglobal
END IF
end event

event destructor;call super::destructor;IF IsValid (inv_EntrepotGlobal) THEN
	DESTROY inv_EntrepotGlobal
END IF
end event

