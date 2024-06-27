$PBExportHeader$u_calendarhor.sru
$PBExportComments$Drop-down calendar
forward
global type u_calendarhor from userobject
end type
type pb_monprev from picturebutton within u_calendarhor
end type
type pb_monnext from picturebutton within u_calendarhor
end type
type pb_yrprev from picturebutton within u_calendarhor
end type
type pb_yrnext from picturebutton within u_calendarhor
end type
type dw_cal from u_dw within u_calendarhor
end type
end forward

global type u_calendarhor from userobject
integer width = 654
integer height = 780
long backcolor = 12632256
long tabtextcolor = 33554432
event ue_close pbm_custom01
event ue_aff_horaire ( )
pb_monprev pb_monprev
pb_monnext pb_monnext
pb_yrprev pb_yrprev
pb_yrnext pb_yrnext
dw_cal dw_cal
end type
global u_calendarhor u_calendarhor

type variables
Protected:
   Integer   	ii_old_column, ii_Day, ii_Month, ii_Year
	long			il_horshareid
   String     	ls_DateFormat
   Date       	id_date_selected, idt_datecal[]
end variables

forward prototypes
public subroutine uf_setdate ()
public function string uf_datestring ()
public subroutine uf_drawmonth (integer vi_year, integer vi_month)
public function integer uf_daysinmonth (integer vi_month, integer vi_year)
public function integer uf_getmonthnumber (string vs_month)
public function string uf_getmonthstring (integer vs_month)
public subroutine uf_initcal (date vd_start_date)
public function integer of_sethorshareid (long al_horshareid)
public function long of_gethorshareid ()
public subroutine uf_enterdaynumbers (integer ai_start_day_num, integer ai_days_in_month, date adt_date)
end prototypes

public subroutine uf_setdate ();dw_cal.Reset()

If ii_day = 0 Then ii_day = 1
uf_InitCal(date(ii_year, ii_month, ii_day))

dw_cal.SetFocus()
end subroutine

public function string uf_datestring ();Return String(ii_year) + "/" + String(ii_month) + "/"+ String(ii_day)
end function

public subroutine uf_drawmonth (integer vi_year, integer vi_month);Integer	li_FirstDayNum, li_cell, li_daysinmonth
Date 		ld_firstday
String	ls_modify, ls_return

dw_cal.SetRedraw(FALSE)

ii_month = vi_month
ii_year  = vi_year

/*********************************************************************/
/* Check if the instance day is valid for month/year.						*/
/* Back the day down one if invalid for month ie 31 will become 30	*/
/*********************************************************************/
Do While Date(ii_year,ii_month,ii_day) = Date(00,1,1)
	ii_day --
Loop

/* Work out how many days in the month */
li_daysinmonth = uf_DaysInMonth(ii_month,ii_year)

/* Find the date of the first day in the month */
ld_firstday = Date(ii_year,ii_month,1)

/* Find what day of the week this is */
li_FirstDayNum = DayNumber(ld_firstday)

/* Set the first cell */
li_cell = li_FirstDayNum + ii_day - 1

/* If there was an old column turn off the highlight */
If ii_old_column <> 0 then
	ls_modify = "#" + string(ii_old_Column) + ".border=0"
	ls_return = dw_cal.Modify(ls_modify)
	If ls_return <> "" then MessageBox("Modify",ls_return)
End If

/* Set the Title */
dw_cal.Modify("st_year.text=~"" + string(ii_year) + "~"")
dw_cal.Modify("st_month.text=~"" + uf_GetMonthString(ii_month) + "~"")

uf_EnterDayNumbers(li_FirstDayNum,li_daysinmonth,ld_firstday)

dw_cal.SetItem(1, li_cell, String(ii_day))

/* Highlight the current date */
ls_modify = "#" + string(li_cell) + ".border=5"
ls_return = dw_cal.Modify(ls_modify)
If ls_return <> "" then MessageBox("Modify",ls_return)

/* Set the old column for next time */
ii_old_column = li_cell

/* Reset the pointer and Redraw */
SetPointer(Arrow!)
dw_cal.SetRedraw(TRUE)

end subroutine

public function integer uf_daysinmonth (integer vi_month, integer vi_year);Integer	ln_days_in_month
Boolean	lb_leap_year

/************************************************************************/
/* Most cases are straight forward in that there are a fixed number of 	*/
/* days in 11 of the 12 vi_months.  February is, of course, the problem.	*/
/* In a leap year February has 29 days, otherwise 28.							*/
/************************************************************************/

CHOOSE CASE vi_month
	CASE 1, 3, 5, 7, 8, 10, 12
		ln_days_in_month = 31
	CASE 4, 6, 9, 11
		ln_days_in_month = 30
	CASE 2
		/***********************/
		/* Check for leap year */
		/***********************/
		If IsDate(string(vi_year) + "/2/29") Then
			ln_days_in_month = 29
		Else
   		ln_days_in_month = 28
		End If
END CHOOSE

Return ln_days_in_month
end function

public function integer uf_getmonthnumber (string vs_month);Integer li_month_number

CHOOSE CASE vs_month
	CASE "Jan"
		li_month_number = 1
	CASE "Feb"
		li_month_number = 2
	CASE "Mar"
		li_month_number = 3
	CASE "Apr"
		li_month_number = 4
	CASE "May"
		li_month_number = 5
	CASE "Jun"
		li_month_number = 6
	CASE "Jul"
		li_month_number = 7
	CASE "Aug"
		li_month_number = 8
	CASE "Sep"
		li_month_number = 9
	CASE "Oct"
		li_month_number = 10
	CASE "Nov"
		li_month_number = 11
	CASE "Dec"
		li_month_number = 12
END CHOOSE

Return li_month_number
end function

public function string uf_getmonthstring (integer vs_month);String ls_month
if v_langue = 'fr' then
	CHOOSE CASE vs_month
		CASE 1
			ls_month = "Janvier"
		CASE 2
			ls_month = "Février"
		CASE 3
			ls_month = "Mars"
		CASE 4
			ls_month = "Avril"
		CASE 5
			ls_month = "Mai"
		CASE 6
			ls_month = "Juin"
		CASE 7
			ls_month = "Juillet"
		CASE 8
			ls_month = "Aout"
		CASE 9
			ls_month = "Septembre"
		CASE 10
			ls_month = "Octobre"
		CASE 11
			ls_month = "Novembre"
		CASE 12
			ls_month = "Décembre"
	END CHOOSE
else
	CHOOSE CASE vs_month
		CASE 1
			ls_month = "January"
		CASE 2
			ls_month = "Febuary"
		CASE 3
			ls_month = "Mars"
		CASE 4
			ls_month = "April"
		CASE 5
			ls_month = "May"
		CASE 6
			ls_month = "June"
		CASE 7
			ls_month = "July"
		CASE 8
			ls_month = "August"
		CASE 9
			ls_month = "September"
		CASE 10
			ls_month = "October"
		CASE 11
			ls_month = "November"
		CASE 12
			ls_month = "December"
	END CHOOSE
end if
Return ls_month
end function

public subroutine uf_initcal (date vd_start_date);Integer	li_FirstDayNum, li_Cell, li_DaysInMonth
String 	ls_Year, ls_Modify, ls_Return
Date 		ld_FirstDay

/* Insert a row into the script datawindow */
dw_cal.InsertRow(0)

/*********************************************************************/
/* Set the variables for Day, Month and Year from the date passed to */
/* the function																		*/
/*********************************************************************/
ii_Month = Month(vd_start_date)
ii_Year  = Year(vd_start_date)
ii_Day   = Day(vd_start_date)

/* Find how many days in the relevant month */
li_daysinmonth = uf_DaysInMonth(ii_month,ii_year)

/* Find the date of the first day of this month */
ld_FirstDay = Date(ii_Year,ii_month,1)

/* What day of the week is the first day of the month */
li_FirstDayNum = DayNumber(ld_FirstDay)

// Retourner la date du premier jour du calendrier

//for i = 1 to li_FirstDayNum
//	
//	
//	
//next


/*********************************************************************/
/* Set the starting "cell" in the datawindow. i.e the column in which*/
/* the first day of the month will be displayed								*/
/*********************************************************************/
li_Cell = li_FirstDayNum + ii_Day - 1

/* Set the Title of the calendar with the Month and Year */
dw_cal.Modify("st_year.text=~"" + string(ii_Year) + "~"")
dw_cal.Modify("st_month.text=~"" + uf_GetMonthString(ii_Month) + "~"")

/* Enter the numbers of the days */
uf_EnterDayNumbers(li_FirstDayNum, li_DaysInMonth,ld_FirstDay)

dw_cal.SetItem(1,li_cell,String(Day(vd_start_date)))

/* Display the first day in bold (or 3D) */
ls_modify = "#" + string(li_cell) + ".border=5"
ls_return = dw_cal.Modify(ls_Modify)
If ls_return <> "" then MessageBox("Modify",ls_return)

/*********************************************************************/
/* Set the instance variable i_old_column to hold the current cell,	*/
/* so when we change it, we know the old setting							*/
/*********************************************************************/
ii_old_column = li_Cell
// bug date w_patient
id_date_selected = vd_start_date
end subroutine

public function integer of_sethorshareid (long al_horshareid);if isnull(al_horshareid) then
	return -1 
else
	il_horshareid = al_horshareid
	return 1
end if
end function

public function long of_gethorshareid ();return il_horshareid
end function

public subroutine uf_enterdaynumbers (integer ai_start_day_num, integer ai_days_in_month, date adt_date);Long ll_color
Integer	li_count, li_daycount, k
string	ls_modify, ls_return
date ld_date
date ld_dateav[], ld_dateapres
/* Blank the columns before the first day of the month */

for k = 1 to ai_start_day_num - 1
	ld_dateav[k] = relativedate(adt_date, -1 * (ai_start_day_num - k))
next
ld_dateav[k] = adt_date

For li_count = 1 to ai_start_day_num
	dw_cal.SetItem(1,li_count, string(day(ld_dateav[li_count])))
	dw_cal.modify("cell"+string(li_count)+".background.color = 78682240")
	dw_cal.modify("cell"+string(li_count)+".color = 12632256")
	idt_datecal[li_count] = ld_dateav[li_count]
Next

/* Set the columns for the days to the String of their Day number */
For li_count = 1 to ai_days_in_month
	/* Use li_daycount to find which column needs to be set */
	li_daycount = ai_start_day_num + li_count - 1
	dw_cal.SetItem(1,li_daycount,String(li_count))
	ld_date = date(ii_year, ii_month, li_count)
	idt_datecal[li_daycount] = ld_date
	select first tplcolor into :ll_color 
	from t_templatedate inner join t_templates on t_templatedate.id_template = t_templates.id_template 
	where t_templatedate.ortho_id = :il_horshareid and 
			tpldate = :ld_date and 
			tplcolor is not null
	order by dateapply asc;
	if ll_color > 0 then
		dw_cal.modify("cell"+string(li_daycount)+".background.color = "+string(ll_color))
	else
		dw_cal.modify("cell"+string(li_daycount)+".background.color = 78682240")
	end if
	dw_cal.modify("cell"+string(li_daycount)+".color = 0")
	setnull(ll_color)
Next

/* Move to next column */
li_daycount = li_daycount + 1

ld_dateapres = date(year(adt_date),month(adt_date),ai_days_in_month)

/* Blank remainder of columns */
For li_count = li_daycount to 42
	ld_dateapres = relativedate(ld_dateapres,1)
	dw_cal.SetItem(1,li_count,string(day(ld_dateapres)))
	idt_datecal[li_count] = ld_dateapres
	dw_cal.modify("cell"+string(li_count)+".background.color = 78682240")
	dw_cal.modify("cell"+string(li_count)+".color = 12632256")
Next


/* If there was an old column turn off the highlight */
If ii_old_column <> 0 then
	ls_modify = "#" + string(ii_old_Column) + ".border=0"
	ls_return = dw_cal.Modify(ls_modify)
	If ls_return <> "" then MessageBox("Modify",ls_return)
End If


ii_old_column = 0


end subroutine

on u_calendarhor.create
this.pb_monprev=create pb_monprev
this.pb_monnext=create pb_monnext
this.pb_yrprev=create pb_yrprev
this.pb_yrnext=create pb_yrnext
this.dw_cal=create dw_cal
this.Control[]={this.pb_monprev,&
this.pb_monnext,&
this.pb_yrprev,&
this.pb_yrnext,&
this.dw_cal}
end on

on u_calendarhor.destroy
destroy(this.pb_monprev)
destroy(this.pb_monnext)
destroy(this.pb_yrprev)
destroy(this.pb_yrnext)
destroy(this.dw_cal)
end on

event constructor;id_date_selected = date(string(Today()))

end event

type pb_monprev from picturebutton within u_calendarhor
integer y = 100
integer width = 110
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean originalsize = true
string picturename = "c:\ii4net\orthotek\images\prior.bmp"
boolean map3dcolors = true
end type

event clicked;/* Decrement the month, if 0, set to 12 (December) */
ii_month = ii_month - 1
If ii_month = 0 then
	ii_month = 12
	ii_year = ii_year - 1
End If

/* check if selected day is no longer valid for new month */
do while not(isdate(uf_datestring()))
	ii_day --
loop

/* Darw the month */
uf_DrawMonth ( ii_year, ii_month )

id_date_selected = date(ii_year,ii_month,ii_Day)
parent.PostEvent("ue_aff_horaire")
end event

type pb_monnext from picturebutton within u_calendarhor
integer x = 553
integer y = 100
integer width = 110
integer height = 92
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean originalsize = true
string picturename = "c:\ii4net\orthotek\images\next.bmp"
boolean map3dcolors = true
end type

event clicked;/* Increment the month number, but if its 13, set back to 1 (January) */
ii_month = ii_month + 1
If ii_month = 13 then
	ii_month = 1
	ii_year = ii_year + 1
End If

/* check if selected day is no longer valid for new month */
do while not(isdate(uf_datestring()))
	ii_day --
loop
	
/* Draw the month */
uf_DrawMonth ( ii_year, ii_month )

id_date_selected = date(ii_year,ii_month,ii_Day)
parent.PostEvent("ue_aff_horaire")
end event

type pb_yrprev from picturebutton within u_calendarhor
integer y = 16
integer width = 110
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean originalsize = true
string picturename = "c:\ii4net\orthotek\images\prior.bmp"
boolean map3dcolors = true
end type

event clicked;ii_year --

/* check if selected day is no longer valid */
do while not(isdate(uf_datestring()))
	ii_day --
loop
	
/* Draw the month */
uf_DrawMonth ( ii_year, ii_month )

id_date_selected = date(ii_year,ii_month,ii_Day)
parent.PostEvent("ue_aff_horaire")
end event

type pb_yrnext from picturebutton within u_calendarhor
integer x = 553
integer y = 16
integer width = 110
integer height = 92
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean originalsize = true
string picturename = "c:\ii4net\orthotek\images\next.bmp"
boolean map3dcolors = true
end type

event clicked;ii_year ++

/* check if selected day is no longer valid */
do while not(isdate(uf_datestring()))
	ii_day --
loop
	
/* Draw the month */
uf_DrawMonth ( ii_year, ii_month )

id_date_selected = date(ii_year,ii_month,ii_Day)
parent.PostEvent("ue_aff_horaire")
end event

type dw_cal from u_dw within u_calendarhor
event ue_dwnkey pbm_dwnkey
integer width = 663
integer height = 780
integer taborder = 10
string dataobject = "d_calendarii4"
boolean vscrollbar = false
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;Integer	li_clickedcolumn
String 	ls_day, ls_modify, ls_return
date ldt_date

if NOT dwo.Type = "column" then Return

//Find which column was clicked on and return if it is not valid
li_clickedcolumn = Integer(dwo.ID)
If li_clickedcolumn < 0 then Return

// Set Day to the text of the clicked column. Return if it is an
// empty column
ls_day = dw_cal.GetItemString(1,li_clickedcolumn)
If ls_day = "" then Return

// Convert to a number and place in Instance variable
ii_day = Integer(ls_day)

dw_cal.SetItem(1,li_clickedcolumn,ls_day)

// If the highlight was on a previous column (i_old_column = 0)
// set the border of the old column back to normal
If ii_old_column <> 0 then
	ls_modify = "#" + String(ii_old_Column) + ".border=0"
	ls_return = dw_cal.Modify(ls_modify)
	If ls_return <> "" then MessageBox("Modify",ls_return)
End If

// Highlight chosen day
ls_modify = "#" + String(li_clickedcolumn) + ".border=5"
ls_return = dw_cal.Modify(ls_modify)
If ls_return <> "" then MessageBox("Modify",ls_return)

// Set the old column for next time
ii_old_column = li_clickedcolumn

// Return the chosen date
// id_date_selected = Date(ii_year,ii_month,ii_Day)

ldt_date = idt_datecal[long(mid(dwo.name,5))]
if month(ldt_date) <> ii_Month then
	uf_drawmonth(integer(year(ldt_date)),integer(month(ldt_date)))
end if

id_date_selected = ldt_date

parent.PostEvent("ue_aff_horaire")
end event

event constructor;if v_langue = 'an' then
	this.object.t_mo.text = "Mo"
	this.object.t_tu.text = "Tu"
	this.object.t_we.text = "We"
	this.object.t_th.text = "Th"
	this.object.t_fr.text = "Fr"
	this.object.t_su.text = "Su"	
end if

pro_resize luo_size
luo_size.uf_resizedw(this)
end event

