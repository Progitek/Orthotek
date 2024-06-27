$PBExportHeader$uo_sat.sru
forward
global type uo_sat from datawindow
end type
end forward

global type uo_sat from datawindow
integer width = 1527
integer height = 92
string title = "Satellite"
string dataobject = "dddw_satellite"
event ue_mouseenter pbm_mousemove
end type
global uo_sat uo_sat

type variables
private boolean actif = false
public long il_idsat
end variables

forward prototypes
public subroutine of_actif ()
end prototypes

event ue_mouseenter;of_actif()
end event

public subroutine of_actif ();integer li_nbrow

if actif then
	li_nbrow = rowcount()
	SetFilter('')
	Filter()
	height = 80 * li_nbrow
end if
end subroutine

on uo_sat.create
end on

on uo_sat.destroy
end on

event constructor;long ll_nbrow,ll_row,ll_newrow

//il_idsat = gl_idspecial
SetTransObject(SQLCA)
ll_nbrow = Retrieve()
ll_newrow = insertrow(0)
setitem(ll_newrow,'lieu','Tous')
setitem(ll_newrow,'id_satellite',0)
//ll_row = find('id_specialist = '+string(il_idspeclist),0,ll_nbrow)
Scrolltorow(ll_newrow)
SetRowFocusIndicator(FocusRect!)
end event

event clicked;IF row> 0 THEN
	Scrolltorow(GetClickedRow())
	il_idsat = getitemnumber(row,'id_satellite')
	SetFilter('id_satellite = ' + string(il_idsat))
	Filter()
	Height = 85
	actif = not actif
	of_actif()
END IF
end event

