$PBExportHeader$n_cst_parm_imp_couleur.sru
forward
global type n_cst_parm_imp_couleur from n_base
end type
end forward

global type n_cst_parm_imp_couleur from n_base autoinstantiate
end type

type variables
long	il_couleur[]
end variables

on n_cst_parm_imp_couleur.create
call super::create
end on

on n_cst_parm_imp_couleur.destroy
call super::destroy
end on

