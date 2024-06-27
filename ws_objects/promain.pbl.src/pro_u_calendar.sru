$PBExportHeader$pro_u_calendar.sru
$PBExportComments$(PRO) Extension Calendar class
forward
global type pro_u_calendar from pfc_u_calendar
end type
end forward

global type pro_u_calendar from pfc_u_calendar
end type
global pro_u_calendar pro_u_calendar

type variables
Protected:
// Internal attibutes.
string is_language = 'a'

end variables

forward prototypes
public function string of_getlanguage ()
public function integer of_setlanguage (string as_language)
protected function integer of_drawmonth (date ad_date)
end prototypes

public function string of_getlanguage ();return is_language

end function

public function integer of_setlanguage (string as_language);// Check the argument.
IF IsNull(as_language) THEN 
	Return -1
End If

If lower(as_language) <> 'a' and lower(as_language) <> 'f' Then Return -1

is_language = lower(as_language)

if is_language = 'a' then
	dw_cal.object.t_sunday.text = 'Su'
	dw_cal.object.t_monday.text = 'Mo'
	dw_cal.object.t_tuesday.text = 'Tu'
	dw_cal.object.t_wednesday.text = 'We'
	dw_cal.object.t_thursday.text = 'Th'
	dw_cal.object.t_friday.text = 'Fr'
	dw_cal.object.t_saturday.text = 'Sa'
elseif is_language = 'f' then
	dw_cal.object.t_sunday.text = 'Di'
	dw_cal.object.t_monday.text = 'Lu'
	dw_cal.object.t_tuesday.text = 'Ma'
	dw_cal.object.t_wednesday.text = 'Me'
	dw_cal.object.t_thursday.text = 'Je'
	dw_cal.object.t_friday.text = 'Ve'
	dw_cal.object.t_saturday.text = 'Sa'
end if

of_DrawMonth(id_date)

Return 1

end function

protected function integer of_drawmonth (date ad_date);Integer 	li_month
Integer 	li_year
String	ls_monthname

if Super::of_drawmonth(ad_date) = 1 then
	if is_language = 'f' then
		//Initialize local values.
		li_year = Year(ad_date)
		li_month = Month(ad_date)
		
		choose case li_month
			case 1
				ls_monthname = "Janvier"
			case 2
				ls_monthname = "Février"
			case 3
				ls_monthname = "Mars"
			case 4
				ls_monthname = "Avril"
			case 5
				ls_monthname = "Mai"
			case 6
				ls_monthname = "Juin"
			case 7
				ls_monthname = "Juillet"
			case 8
				ls_monthname = "Août"
			case 9
				ls_monthname = "Septembre"
			case 10
				ls_monthname = "Octobre"
			case 11
				ls_monthname = "Novembre"
			case 12
				ls_monthname = "Décembre"
		end choose
		
		//Set the Title.
		dw_cal.Object.st_month.text = ls_monthname + " " + string(li_year)
	end if
	return 1
else
	return -1
end if

end function

on pro_u_calendar.create
call super::create
end on

on pro_u_calendar.destroy
call super::destroy
end on

type dw_cal from pfc_u_calendar`dw_cal within pro_u_calendar
end type

