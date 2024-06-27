$PBExportHeader$u_rech_patient.sru
forward
global type u_rech_patient from datastore
end type
end forward

global type u_rech_patient from datastore
string DataObject="dw_rech_patient"
end type
global u_rech_patient u_rech_patient

on u_rech_patient.create
call datastore::create
TriggerEvent( this, "constructor" )
end on

on u_rech_patient.destroy
call datastore::destroy
TriggerEvent( this, "destructor" )
end on

