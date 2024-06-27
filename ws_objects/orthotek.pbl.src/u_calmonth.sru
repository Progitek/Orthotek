$PBExportHeader$u_calmonth.sru
$PBExportComments$Drop-down calendar
forward
global type u_calmonth from userobject
end type
type dw_calmonth from datawindow within u_calmonth
end type
end forward

global type u_calmonth from userobject
integer width = 864
integer height = 908
long backcolor = 67108864
long tabtextcolor = 33554432
event ue_close pbm_custom01
event ue_aff_horaire ( )
dw_calmonth dw_calmonth
end type
global u_calmonth u_calmonth

type variables
Protected:
   Integer   ii_old_column, ii_Day, ii_Month, ii_Year
   String     ls_DateFormat
   Date       id_date_selected
end variables

forward prototypes
public subroutine uf_setdate ()
public function string uf_datestring ()
public subroutine uf_enterdaynumbers (integer ai_start_day_num, integer ai_days_in_month)
public subroutine uf_drawmonth (integer vi_year, integer vi_month)
public function integer uf_daysinmonth (integer vi_month, integer vi_year)
public function integer uf_getmonthnumber (string vs_month)
public function string uf_getmonthstring (integer vs_month)
public subroutine uf_initcal (date vd_start_date)
end prototypes

public subroutine uf_setdate ();dw_calmonth.Reset()

If ii_day = 0 Then ii_day = 1
uf_InitCal(date(ii_year, ii_month, ii_day))

dw_calmonth.SetFocus()
end subroutine

public function string uf_datestring ();Return String(ii_year) + "/" + String(ii_month) + "/"+ String(ii_day)
end function

public subroutine uf_enterdaynumbers (integer ai_start_day_num, integer ai_days_in_month);Integer	li_count, li_daycount, li_nbrowmax, li_nbrowocc, li_pourocc
string	ls_modify, ls_return
date ld_celldate

/* Blank the columns before the first day of the month */
For li_count = 1 to ai_start_day_num
	dw_calmonth.SetItem(1,li_count,"")
	dw_calmonth.modify("r_"+string(li_count)+".height = 100")
Next

/* Calcul du nb de colonne qui peux y avoir ds l'horaire au maximum */
select count(*) into :li_nbrowmax from horaire where datecal = today(*);

/* Set the columns for the days to the String of their Day number */
For li_count = 1 to ai_days_in_month
	/* Use li_daycount to find which column needs to be set */
	li_daycount = ai_start_day_num + li_count - 1
	dw_calmonth.SetItem(1,li_daycount,String(li_count))
	/* Afficher le % du taux d'occupation */
	ld_celldate = date(string(li_count)+'-'+string(ii_month)+'-'+string(ii_year))
	select count(*) into :li_nbrowocc from horaire where datecal = :ld_celldate and (patient_id_1 > 0 or patient_id_2 > 0 or patient_id_3 > 0 or patient_id_4 > 0 or patient_id_5 > 0);
	li_pourocc = ((li_nbrowmax - li_nbrowocc) * 100) / li_nbrowmax
	dw_calmonth.modify("r_"+string(li_daycount)+".height = "+string(li_pourocc))
Next

/* Move to next column */
li_daycount = li_daycount + 1

/* Blank remainder of columns */
For li_count = li_daycount to 42
	dw_calmonth.SetItem(1,li_count,"")
	dw_calmonth.modify("r_"+string(li_count)+".height = 100")
Next

/* If there was an old column turn off the highlight */
If ii_old_column <> 0 then
	ls_modify = "#" + string(ii_old_Column) + ".border=0"
	ls_return = dw_calmonth.Modify(ls_modify)
	If ls_return <> "" then MessageBox("Modify",ls_return)
End If

ii_old_column = 0


end subroutine

public subroutine uf_drawmonth (integer vi_year, integer vi_month);Integer	li_FirstDayNum, li_cell, li_daysinmonth
Date 		ld_firstday
String	ls_modify, ls_return

dw_calmonth.SetRedraw(FALSE)

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
	ls_return = dw_calmonth.Modify(ls_modify)
	If ls_return <> "" then MessageBox("Modify",ls_return)
End If

/* Set the Title */
dw_calmonth.Modify("st_year.text=~"" + string(ii_year) + "~"")
dw_calmonth.Modify("st_month.text=~"" + uf_GetMonthString(ii_month) + "~"")

uf_EnterDayNumbers(li_FirstDayNum,li_daysinmonth)

dw_calmonth.SetItem(1, li_cell, String(ii_day))

/* Highlight the current date */
ls_modify = "#" + string(li_cell) + ".border=5"
ls_return = dw_calmonth.Modify(ls_modify)
If ls_return <> "" then MessageBox("Modify",ls_return)

/* Set the old column for next time */
ii_old_column = li_cell

/* Reset the pointer and Redraw */
SetPointer(Arrow!)
dw_calmonth.SetRedraw(TRUE)

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

if v_langue = 'an' then
	CHOOSE CASE vs_month
		CASE 1
			ls_month = "January"
		CASE 2
			ls_month = "Febuary"
		CASE 3
			ls_month = "March"
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
else
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
end if
Return ls_month
end function

public subroutine uf_initcal (date vd_start_date);Integer	li_FirstDayNum, li_Cell, li_DaysInMonth
String 	ls_Year, ls_Modify, ls_Return
Date 		ld_FirstDay

/* Insert a row into the script datawindow */
dw_calmonth.InsertRow(0)

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

/*********************************************************************/
/* Set the starting "cell" in the datawindow. i.e the column in which*/
/* the first day of the month will be displayed								*/
/*********************************************************************/
li_Cell = li_FirstDayNum + ii_Day - 1

/* Set the Title of the calendar with the Month and Year */
dw_calmonth.Modify("st_year.text=~"" + string(ii_Year) + "~"")
dw_calmonth.Modify("st_month.text=~"" + uf_GetMonthString(ii_Month) + "~"")

/* Enter the numbers of the days */
uf_EnterDayNumbers(li_FirstDayNum, li_DaysInMonth)

dw_calmonth.SetItem(1,li_cell,String(Day(vd_start_date)))

/* Display the first day in bold (or 3D) */
//if month(today()) = ii_month then
//	ls_modify = "#" + string(li_cell) + ".border=5"
//	ls_return = dw_calmonth.Modify(ls_Modify)
//	If ls_return <> "" then MessageBox("Modify",ls_return)
//end if

/*********************************************************************/
/* Set the instance variable i_old_column to hold the current cell,	*/
/* so when we change it, we know the old setting							*/
/*********************************************************************/
ii_old_column = li_Cell

/* Reinitialiser la variable */
id_date_selected = Date(ii_year,ii_month,ii_Day)

end subroutine

on u_calmonth.create
this.dw_calmonth=create dw_calmonth
this.Control[]={this.dw_calmonth}
end on

on u_calmonth.destroy
destroy(this.dw_calmonth)
end on

event constructor;id_date_selected = date(string(Today()))

end event

type dw_calmonth from datawindow within u_calmonth
event ue_dwnkey pbm_dwnkey
integer width = 864
integer height = 924
integer taborder = 10
string dataobject = "d_calmonth"
boolean border = false
end type

event clicked;Integer	li_clickedcolumn
String 	ls_day, ls_modify, ls_return

if NOT dwo.Type = "column" then Return

//Find which column was clicked on and return if it is not valid
li_clickedcolumn = Integer(dwo.ID)
If li_clickedcolumn < 0 then Return

// Set Day to the text of the clicked column. Return if it is an
// empty column
ls_day = dw_calmonth.GetItemString(1,li_clickedcolumn)
If ls_day = "" then Return

// Convert to a number and place in Instance variable
ii_day = Integer(ls_day)

dw_calmonth.SetItem(1,li_clickedcolumn,ls_day)

// If the highlight was on a previous column (i_old_column = 0)
// set the border of the old column back to normal
If ii_old_column <> 0 then
	ls_modify = "#" + String(ii_old_Column) + ".border=2"
	ls_return = dw_calmonth.Modify(ls_modify)
	If ls_return <> "" then MessageBox("Modify",ls_return)
End If

// Highlight chosen day
ls_modify = "#" + String(li_clickedcolumn) + ".border=5"
ls_return = dw_calmonth.Modify(ls_modify)
If ls_return <> "" then MessageBox("Modify",ls_return)


// Set the old column for next time
ii_old_column = li_clickedcolumn


// Return the chosen date
id_date_selected = Date(ii_year,ii_month,ii_Day)
parent.PostEvent("ue_aff_horaire")
end event

event constructor;if v_langue = 'an' then
	this.object.t_1.text = "Mo"
	this.object.t_2.text = "Tu"
	this.object.t_3.text = "We"
	this.object.t_4.text = "Th"
	this.object.t_5.text = "Fr"
	this.object.t_7.text = "Su"	
end if
end event

