$PBExportHeader$w_rapport_annuel_statuts.srw
forward
global type w_rapport_annuel_statuts from w_child
end type
type st_2 from statictext within w_rapport_annuel_statuts
end type
type em_year from editmask within w_rapport_annuel_statuts
end type
type dw_rapport_annuel_statuts from u_dw within w_rapport_annuel_statuts
end type
type cb_print from commandbutton within w_rapport_annuel_statuts
end type
type cb_search from commandbutton within w_rapport_annuel_statuts
end type
type st_1 from statictext within w_rapport_annuel_statuts
end type
type cb_close from commandbutton within w_rapport_annuel_statuts
end type
end forward

global type w_rapport_annuel_statuts from w_child
integer x = 214
integer y = 221
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
boolean ib_isupdateable = false
st_2 st_2
em_year em_year
dw_rapport_annuel_statuts dw_rapport_annuel_statuts
cb_print cb_print
cb_search cb_search
st_1 st_1
cb_close cb_close
end type
global w_rapport_annuel_statuts w_rapport_annuel_statuts

forward prototypes
public subroutine check_today ()
end prototypes

public subroutine check_today ();//int mois
//
//mois = month(today())
//
//CHOOSE CASE mois
//	CASE 1
//		cbx_jan.checked = true 
//	CASE 2  
//		cbx_fev.checked = true
//	CASE 3
//		cbx_mar.checked = true
//	CASE 4
//		cbx_avr.checked = true
//	case 5
//		cbx_mai.checked = true
//	case 6
//		cbx_jun.checked = true
//	case 7
//		cbx_jui.checked = true
//	case 8
//		cbx_aout.checked = true
//	case 9
//		cbx_sep.checked = true
//	case 10
//		cbx_oct.checked = true
//	case 11
//		cbx_nov.checked = true
//	case 12
//		cbx_dec.checked = true
//END CHOOSE


end subroutine

on w_rapport_annuel_statuts.create
int iCurrent
call super::create
this.st_2=create st_2
this.em_year=create em_year
this.dw_rapport_annuel_statuts=create dw_rapport_annuel_statuts
this.cb_print=create cb_print
this.cb_search=create cb_search
this.st_1=create st_1
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.em_year
this.Control[iCurrent+3]=this.dw_rapport_annuel_statuts
this.Control[iCurrent+4]=this.cb_print
this.Control[iCurrent+5]=this.cb_search
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.cb_close
end on

on w_rapport_annuel_statuts.destroy
call super::destroy
destroy(this.st_2)
destroy(this.em_year)
destroy(this.dw_rapport_annuel_statuts)
destroy(this.cb_print)
destroy(this.cb_search)
destroy(this.st_1)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

check_today()
end event

type st_2 from statictext within w_rapport_annuel_statuts
integer x = 1829
integer y = 1948
integer width = 521
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pour l~'année:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'For the year:'
end if
end event

type em_year from editmask within w_rapport_annuel_statuts
integer x = 2395
integer y = 1928
integer width = 343
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
string text = "0000"
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean autoskip = true
end type

type dw_rapport_annuel_statuts from u_dw within w_rapport_annuel_statuts
integer y = 100
integer width = 3621
integer height = 1800
integer taborder = 10
string title = "rapport_annuel_statuts"
string dataobject = "d_rapport_statut_annuel"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	this.object.t_status.text = 'Status'
	this.object.t_fev.text = 'Feb'
	this.object.t_avr.text = 'Apr'
	this.object.t_mai.text = 'May'
	this.object.t_aou.text = 'Aug'
end if
SetTransObject(sqlca)
end event

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

type cb_print from commandbutton within w_rapport_annuel_statuts
integer x = 18
integer y = 1920
integer width = 832
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_rapport_annuel_statuts)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type cb_search from commandbutton within w_rapport_annuel_statuts
integer x = 850
integer y = 1920
integer width = 864
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;Long ll_row, ll_jan, ll_fev, ll_mar, ll_avr, ll_mai, ll_jun, ll_jui, ll_aou, ll_sep, ll_oct, ll_nov, ll_dec 
string ls_code  

setpointer(hourglass!)

dw_rapport_annuel_statuts.reset()

// Déclaration du curseur
 
Declare stat Cursor For
 
select code as stat,
       ( SELECT count(*)
         FROM factures_traitements INNER JOIN t_status ON t_status.status_id = factures_traitements.status_id 
                                   INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
                       traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
         WHERE patient.no_ortho = :v_no_ortho and year(date_facture) = :em_year.text and month(date_facture) = 1
         GROUP BY  code HAVING code like stat) as status_jan,
       ( SELECT count(*)
         FROM factures_traitements INNER JOIN t_status ON t_status.status_id = factures_traitements.status_id 
                                   INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
                       traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
         WHERE patient.no_ortho = :v_no_ortho and year(date_facture) = :em_year.text and month(date_facture) = 2
         GROUP BY  code HAVING code like stat) as status_fev,
       ( SELECT count(*)
         FROM factures_traitements INNER JOIN t_status ON t_status.status_id = factures_traitements.status_id 
                                   INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
                       traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
         WHERE patient.no_ortho = :v_no_ortho and year(date_facture) = :em_year.text and month(date_facture) = 3
         GROUP BY  code HAVING code like stat) as status_mar,
       ( SELECT count(*)
         FROM factures_traitements INNER JOIN t_status ON t_status.status_id = factures_traitements.status_id 
                                   INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
                       traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
         WHERE patient.no_ortho = :v_no_ortho and year(date_facture) = :em_year.text and month(date_facture) = 4
         GROUP BY  code HAVING code like stat) as status_avr,
       ( SELECT count(*)
         FROM factures_traitements INNER JOIN t_status ON t_status.status_id = factures_traitements.status_id 
                                   INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
                       traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
         WHERE patient.no_ortho = :v_no_ortho and year(date_facture) = :em_year.text and month(date_facture) = 5
         GROUP BY  code HAVING code like stat) as status_mai,
       ( SELECT count(*)
         FROM factures_traitements INNER JOIN t_status ON t_status.status_id = factures_traitements.status_id 
                                   INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
                       traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
         WHERE patient.no_ortho = :v_no_ortho and year(date_facture) = :em_year.text and month(date_facture) = 6
         GROUP BY  code HAVING code like stat) as status_jun,
       ( SELECT count(*)
         FROM factures_traitements INNER JOIN t_status ON t_status.status_id = factures_traitements.status_id 
                                   INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
                       traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
         WHERE patient.no_ortho = :v_no_ortho and year(date_facture) = :em_year.text and month(date_facture) = 7
         GROUP BY  code HAVING code like stat) as status_jui,
       ( SELECT count(*)
         FROM factures_traitements INNER JOIN t_status ON t_status.status_id = factures_traitements.status_id 
                                   INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
                       traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
         WHERE patient.no_ortho = :v_no_ortho and year(date_facture) = :em_year.text and month(date_facture) = 8
         GROUP BY  code HAVING code like stat) as status_aou,
       ( SELECT count(*)
         FROM factures_traitements INNER JOIN t_status ON t_status.status_id = factures_traitements.status_id 
                                   INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
                       traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
         WHERE patient.no_ortho = :v_no_ortho and year(date_facture) = :em_year.text and month(date_facture) = 9
         GROUP BY  code HAVING code like stat) as status_sep,
       ( SELECT count(*)
         FROM factures_traitements INNER JOIN t_status ON t_status.status_id = factures_traitements.status_id 
                                   INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
                       traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
         WHERE patient.no_ortho = :v_no_ortho and year(date_facture) = :em_year.text and month(date_facture) = 10
         GROUP BY  code HAVING code like stat) as status_oct,
       ( SELECT count(*)
         FROM factures_traitements INNER JOIN t_status ON t_status.status_id = factures_traitements.status_id 
                                   INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
                       traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
         WHERE patient.no_ortho = :v_no_ortho and year(date_facture) = :em_year.text and month(date_facture) = 11
         GROUP BY  code HAVING code like stat) as status_nov,
       ( SELECT count(*)
         FROM factures_traitements INNER JOIN t_status ON t_status.status_id = factures_traitements.status_id 
                                   INNER JOIN traitements ON factures_traitements.traitement_id = traitements.traitement_id,
                       traitements INNER JOIN patient ON traitements.patient_id = patient.patient_id
         WHERE patient.no_ortho = :v_no_ortho and year(date_facture) = :em_year.text and month(date_facture) = 12
         GROUP BY  code HAVING code like stat) as status_dec
FROM  t_status
WHERE	ortho_id = :v_no_ortho
ORDER BY code ASC;
			
OPEN stat;

Do While SQLCA.SQLCode = 0
   Fetch stat Into  :ls_code,   
                       :ll_jan,
							  :ll_fev, 
							  :ll_mar, 
							  :ll_avr, 
							  :ll_mai, 
							  :ll_jun, 
							  :ll_jui, 
							  :ll_aou, 
							  :ll_sep, 
							  :ll_oct, 
							  :ll_nov, 
							  :ll_dec;
    
   if SQLCA.SQLCode = 0 then          
		ll_row = dw_rapport_annuel_statuts.insertrow(0)
		dw_rapport_annuel_statuts.scrolltorow(ll_row)
		dw_rapport_annuel_statuts.setitem(ll_row,'status',ls_code)
		if isnull(ll_jan) then
		   dw_rapport_annuel_statuts.setitem(ll_row,'status_jan',0)
		else
			dw_rapport_annuel_statuts.setitem(ll_row,'status_jan',ll_jan)
		end if
		if isnull(ll_fev) then
		   dw_rapport_annuel_statuts.setitem(ll_row,'status_fev',0)
		else
			dw_rapport_annuel_statuts.setitem(ll_row,'status_fev',ll_fev)
		end if
		if isnull(ll_mar) then
		   dw_rapport_annuel_statuts.setitem(ll_row,'status_mar',0)
		else
			dw_rapport_annuel_statuts.setitem(ll_row,'status_mar',ll_mar)
		end if
	   if isnull(ll_avr) then
		   dw_rapport_annuel_statuts.setitem(ll_row,'status_avr',0)
		else
			dw_rapport_annuel_statuts.setitem(ll_row,'status_avr',ll_avr)
		end if
		if isnull(ll_mai) then
			dw_rapport_annuel_statuts.setitem(ll_row,'status_mai',0)
		else
			dw_rapport_annuel_statuts.setitem(ll_row,'status_mai',ll_mai)
		end if
		if isnull(ll_jun) then
			dw_rapport_annuel_statuts.setitem(ll_row,'status_jun',0)
		else
		   dw_rapport_annuel_statuts.setitem(ll_row,'status_jun',ll_jun)
		end if
		if isnull(ll_jui) then
			dw_rapport_annuel_statuts.setitem(ll_row,'status_jui',0)
		else
			dw_rapport_annuel_statuts.setitem(ll_row,'status_jui',ll_jui)
		end if
		if isnull(ll_aou) then
			dw_rapport_annuel_statuts.setitem(ll_row,'status_aou',0)
		else
			dw_rapport_annuel_statuts.setitem(ll_row,'status_aou',ll_aou)
		end if
		if isnull(ll_sep) then
		   dw_rapport_annuel_statuts.setitem(ll_row,'status_sep',0)
		else
		   dw_rapport_annuel_statuts.setitem(ll_row,'status_sep',ll_sep)
		end if
		if isnull(ll_oct) then
		   dw_rapport_annuel_statuts.setitem(ll_row,'status_oct',0)
		else
			dw_rapport_annuel_statuts.setitem(ll_row,'status_oct',ll_oct)
		end if
		if isnull(ll_nov) then
			dw_rapport_annuel_statuts.setitem(ll_row,'status_nov',0)
		else
			dw_rapport_annuel_statuts.setitem(ll_row,'status_nov',ll_nov)
		end if
		if isnull(ll_dec) then
		   dw_rapport_annuel_statuts.setitem(ll_row,'status_dec',0)
		else
			dw_rapport_annuel_statuts.setitem(ll_row,'status_dec',ll_dec)
		end if
	END IF
Loop

close stat;

//int v_year, nb_row,i,v_status_id,v_stat,n
//
//v_year = integer(em_year.text)
//dw_rapport_annuel_statuts.retrieve(v_no_ortho,v_year)
//dw_rapport_annuel_statuts.object.t_year.text = string(v_year)
//
//nb_row = dw_rapport_annuel_statuts.rowcount()
//setpointer(hourglass!)
//for i = 1 to nb_row
//	v_status_id = dw_rapport_annuel_statuts.getitemnumber(i,'t_status_status_id')
//	if cbx_jan.checked then  
//	   select count(*) into :v_stat from factures_traitements where status_id = :v_status_id and year(date_facture) = :v_year and month(date_facture) = 1;
//	   dw_rapport_annuel_statuts.setitem(i,'t_status_jan',v_stat)
//	end if
//	if cbx_fev.checked then   
//		select count(*) into :v_stat from factures_traitements where status_id = :v_status_id and year(date_facture) = :v_year and month(date_facture) = 2;
//	   dw_rapport_annuel_statuts.setitem(i,'t_status_fev',v_stat)
//	end if
//	if cbx_mar.checked then
//	   select count(*) into :v_stat from factures_traitements where status_id = :v_status_id and year(date_facture) = :v_year and month(date_facture) = 3;
//	   dw_rapport_annuel_statuts.setitem(i,'t_status_mars',v_stat)
//	end if
//	if cbx_avr.checked then
//	   select count(*) into :v_stat from factures_traitements where status_id = :v_status_id and year(date_facture) = :v_year and month(date_facture) = 4;
//	   dw_rapport_annuel_statuts.setitem(i,'t_status_avr',v_stat)
//	end if
//	if cbx_mai.checked then
//	   select count(*) into :v_stat from factures_traitements where status_id = :v_status_id and year(date_facture) = :v_year and month(date_facture) = 5;
//	   dw_rapport_annuel_statuts.setitem(i,'t_status_mai',v_stat)
//	end if
//	if cbx_jun.checked then
//	   select count(*) into :v_stat from factures_traitements where status_id = :v_status_id and year(date_facture) = :v_year and month(date_facture) = 6;
//	   dw_rapport_annuel_statuts.setitem(i,'t_status_juin',v_stat)
//	end if
//	if cbx_jui.checked then
//	   select count(*) into :v_stat from factures_traitements where status_id = :v_status_id and year(date_facture) = :v_year and month(date_facture) = 7;
//	   dw_rapport_annuel_statuts.setitem(i,'t_status_juil',v_stat)
//	end if
//	if cbx_aout.checked then
//	   select count(*) into :v_stat from factures_traitements where status_id = :v_status_id and year(date_facture) = :v_year and month(date_facture) = 8;
//	   dw_rapport_annuel_statuts.setitem(i,'t_status_aout',v_stat)
//	end if
//	if cbx_sep.checked then
//	   select count(*) into :v_stat from factures_traitements where status_id = :v_status_id and year(date_facture) = :v_year and month(date_facture) = 9;
//	   dw_rapport_annuel_statuts.setitem(i,'t_status_sept',v_stat)
//	end if
//	if cbx_oct.checked then
//	   select count(*) into :v_stat from factures_traitements where status_id = :v_status_id and year(date_facture) = :v_year and month(date_facture) = 10;
//	   dw_rapport_annuel_statuts.setitem(i,'t_status_oct',v_stat)
//	end if
//	if cbx_nov.checked then
//	   select count(*) into :v_stat from factures_traitements where status_id = :v_status_id and year(date_facture) = :v_year and month(date_facture) = 11;
//	   dw_rapport_annuel_statuts.setitem(i,'t_status_nov',v_stat)
//	end if
//	if cbx_dec.checked then
//	   select count(*) into :v_stat from factures_traitements where status_id = :v_status_id and year(date_facture) = :v_year and month(date_facture) = 12;
//	   dw_rapport_annuel_statuts.setitem(i,'t_status_dec',v_stat)
//   end if
//next
end event

event constructor;if v_langue = 'an' then
	this.text = 'Find'
end if
end event

type st_1 from statictext within w_rapport_annuel_statuts
integer x = 23
integer width = 1289
integer height = 88
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Rapport annuel des statuts"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = ' Annual status report'
end if
end event

type cb_close from commandbutton within w_rapport_annuel_statuts
integer x = 2821
integer y = 1920
integer width = 805
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

