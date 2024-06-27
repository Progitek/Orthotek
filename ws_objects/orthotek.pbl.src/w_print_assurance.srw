$PBExportHeader$w_print_assurance.srw
forward
global type w_print_assurance from window
end type
type dw_assurance from datawindow within w_print_assurance
end type
type dw_assurance_entete from datawindow within w_print_assurance
end type
end forward

global type w_print_assurance from window
integer x = 832
integer y = 360
integer width = 3470
integer height = 3252
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
dw_assurance dw_assurance
dw_assurance_entete dw_assurance_entete
end type
global w_print_assurance w_print_assurance

on w_print_assurance.create
this.dw_assurance=create dw_assurance
this.dw_assurance_entete=create dw_assurance_entete
this.Control[]={this.dw_assurance,&
this.dw_assurance_entete}
end on

on w_print_assurance.destroy
destroy(this.dw_assurance)
destroy(this.dw_assurance_entete)
end on

type dw_assurance from datawindow within w_print_assurance
integer y = 1268
integer width = 3433
integer height = 1880
integer taborder = 2
string dataobject = "d_assurance"
boolean livescroll = true
end type

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the error message
RETURN 1
end event

type dw_assurance_entete from datawindow within w_print_assurance
integer width = 3433
integer height = 1272
integer taborder = 1
string dataobject = "d_assurance_entete"
boolean livescroll = true
end type

event dberror;str_error  ErrorStr
//populate the error structure
ErrorStr.sqldbcode = sqldbcode
ErrorStr.sqlerrtext = sqlerrtext
ErrorStr.sqlsyntax = sqlsyntax
ErrorStr.buffer = buffer
ErrorStr.row = row

//open the error window
OpenWithParm ( w_error , ErrorStr )
//do not display the error message
RETURN 1
end event

