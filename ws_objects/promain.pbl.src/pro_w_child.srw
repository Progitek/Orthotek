$PBExportHeader$pro_w_child.srw
$PBExportComments$(PRO) Extension Child Window class
forward
global type pro_w_child from pfc_w_child
end type
end forward

global type pro_w_child from pfc_w_child
integer x = 214
integer y = 221
integer width = 3685
integer height = 2148
end type
global pro_w_child pro_w_child

on pro_w_child.create
call super::create
end on

on pro_w_child.destroy
call super::destroy
end on

