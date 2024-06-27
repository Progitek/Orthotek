$PBExportHeader$pro_n_ds.sru
$PBExportComments$(PRO) Extension Datastore class
forward
global type pro_n_ds from pfc_n_ds
end type
end forward

global type pro_n_ds from pfc_n_ds
end type
global pro_n_ds pro_n_ds

on pro_n_ds.create
call super::create
end on

on pro_n_ds.destroy
call super::destroy
end on

event printpage;call super::printpage;setPointer(Hourglass!)
end event

