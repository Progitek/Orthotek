$PBExportHeader$pro_w_sheet.srw
$PBExportComments$(PRO) Extension Sheet Window class
forward
global type pro_w_sheet from pfc_w_sheet
end type
end forward

global type pro_w_sheet from pfc_w_sheet
end type
global pro_w_sheet pro_w_sheet

on pro_w_sheet.create
call pfc_w_sheet::create
end on

on pro_w_sheet.destroy
call pfc_w_sheet::destroy
if IsValid(MenuID) then destroy(MenuID)
end on

