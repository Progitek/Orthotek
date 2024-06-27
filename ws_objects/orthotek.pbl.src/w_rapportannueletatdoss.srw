$PBExportHeader$w_rapportannueletatdoss.srw
forward
global type w_rapportannueletatdoss from w_child
end type
type rb_annuel from radiobutton within w_rapportannueletatdoss
end type
type rb_periode from radiobutton within w_rapportannueletatdoss
end type
type st_3 from statictext within w_rapportannueletatdoss
end type
type st_1 from statictext within w_rapportannueletatdoss
end type
type em_fin from editmask within w_rapportannueletatdoss
end type
type em_debut from editmask within w_rapportannueletatdoss
end type
type st_2 from statictext within w_rapportannueletatdoss
end type
type em_year from editmask within w_rapportannueletatdoss
end type
type dw_rapportannueletatdoss from u_dw within w_rapportannueletatdoss
end type
type cb_print from commandbutton within w_rapportannueletatdoss
end type
type cb_search from commandbutton within w_rapportannueletatdoss
end type
type st_title from statictext within w_rapportannueletatdoss
end type
type cb_close from commandbutton within w_rapportannueletatdoss
end type
end forward

global type w_rapportannueletatdoss from w_child
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
rb_annuel rb_annuel
rb_periode rb_periode
st_3 st_3
st_1 st_1
em_fin em_fin
em_debut em_debut
st_2 st_2
em_year em_year
dw_rapportannueletatdoss dw_rapportannueletatdoss
cb_print cb_print
cb_search cb_search
st_title st_title
cb_close cb_close
end type
global w_rapportannueletatdoss w_rapportannueletatdoss

on w_rapportannueletatdoss.create
int iCurrent
call super::create
this.rb_annuel=create rb_annuel
this.rb_periode=create rb_periode
this.st_3=create st_3
this.st_1=create st_1
this.em_fin=create em_fin
this.em_debut=create em_debut
this.st_2=create st_2
this.em_year=create em_year
this.dw_rapportannueletatdoss=create dw_rapportannueletatdoss
this.cb_print=create cb_print
this.cb_search=create cb_search
this.st_title=create st_title
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_annuel
this.Control[iCurrent+2]=this.rb_periode
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.em_fin
this.Control[iCurrent+6]=this.em_debut
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.em_year
this.Control[iCurrent+9]=this.dw_rapportannueletatdoss
this.Control[iCurrent+10]=this.cb_print
this.Control[iCurrent+11]=this.cb_search
this.Control[iCurrent+12]=this.st_title
this.Control[iCurrent+13]=this.cb_close
end on

on w_rapportannueletatdoss.destroy
call super::destroy
destroy(this.rb_annuel)
destroy(this.rb_periode)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.em_fin)
destroy(this.em_debut)
destroy(this.st_2)
destroy(this.em_year)
destroy(this.dw_rapportannueletatdoss)
destroy(this.cb_print)
destroy(this.cb_search)
destroy(this.st_title)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

em_debut.text = string(today()) 
em_fin.text = string(today()) 
em_year.text = string(year(today()))
end event

type rb_annuel from radiobutton within w_rapportannueletatdoss
integer x = 2958
integer y = 8
integer width = 663
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Annuel"
boolean checked = true
end type

event clicked;dw_rapportannueletatdoss.dataobject = 'd_rapportannueletatdoss'
dw_rapportannueletatdoss.setTransObject(SQLCA)
end event

type rb_periode from radiobutton within w_rapportannueletatdoss
integer x = 2281
integer y = 8
integer width = 663
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Par période"
end type

event clicked;dw_rapportannueletatdoss.dataobject = 'd_rappannueletatdossperiod'
dw_rapportannueletatdoss.setTransObject(SQLCA)
end event

type st_3 from statictext within w_rapportannueletatdoss
integer x = 1742
integer y = 1936
integer width = 96
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Au"
boolean focusrectangle = false
end type

type st_1 from statictext within w_rapportannueletatdoss
integer x = 1097
integer y = 1936
integer width = 206
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Du"
boolean focusrectangle = false
end type

type em_fin from editmask within w_rapportannueletatdoss
integer x = 1851
integer y = 1920
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

event modified;em_year.text = string(year(gf_emtodate(this.text)))
end event

type em_debut from editmask within w_rapportannueletatdoss
integer x = 1326
integer y = 1920
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

event modified;em_year.text = string(year(gf_emtodate(this.text)))
end event

type st_2 from statictext within w_rapportannueletatdoss
integer x = 2272
integer y = 1944
integer width = 430
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

type em_year from editmask within w_rapportannueletatdoss
integer x = 2747
integer y = 1924
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

event modified;em_debut.text = string(date(long(this.text),1,1))
em_fin.text = string(date(long(this.text),12,31))
end event

type dw_rapportannueletatdoss from u_dw within w_rapportannueletatdoss
integer y = 100
integer width = 3621
integer height = 1800
integer taborder = 10
string title = "rapport annuel etat dossier"
string dataobject = "d_rapportannueletatdoss"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;SetTransObject(sqlca)
if v_langue = 'an' then
	this.object.t_status.text = 'Status'
	this.object.t_fev.text = 'Feb'
	this.object.t_avr.text = 'Apr'
	this.object.t_mai.text = 'May'
	this.object.t_aou.text = 'Aug'
end if

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

type cb_print from commandbutton within w_rapportannueletatdoss
integer x = 18
integer y = 1920
integer width = 494
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
openwithparm(w_print_options,dw_rapportannueletatdoss)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type cb_search from commandbutton within w_rapportannueletatdoss
integer x = 512
integer y = 1920
integer width = 526
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

if rb_annuel.checked then

	Declare stat Cursor For
	 
	select id_patstatus as idpatstat,
			 ( SELECT count(*) FROM patient
				WHERE patient.no_ortho = :v_no_ortho and year(opendoss) = :em_year.text and month(opendoss) = 1 and
				id_patstatus = idpatstat) as status_jan,
			 ( SELECT count(*) FROM patient
				WHERE patient.no_ortho = :v_no_ortho and year(opendoss) = :em_year.text and month(opendoss) = 2 and
				id_patstatus = idpatstat) as status_fev,
			 ( SELECT count(*) FROM patient
				WHERE patient.no_ortho = :v_no_ortho and year(opendoss) = :em_year.text and month(opendoss) = 3 and
				id_patstatus = idpatstat) as status_mar,
			 ( SELECT count(*) FROM patient 
				WHERE patient.no_ortho = :v_no_ortho and year(opendoss) = :em_year.text and month(opendoss) = 4 and
				id_patstatus = idpatstat) as status_avr,
			 ( SELECT count(*) FROM patient
				WHERE patient.no_ortho = :v_no_ortho and year(opendoss) = :em_year.text and month(opendoss) = 5 and
				id_patstatus = idpatstat) as status_mai,
			 ( SELECT count(*) FROM patient 
				WHERE patient.no_ortho = :v_no_ortho and year(opendoss) = :em_year.text and month(opendoss) = 6 and
				id_patstatus = idpatstat) as status_jun,
			 ( SELECT count(*) FROM patient
				WHERE patient.no_ortho = :v_no_ortho and year(opendoss) = :em_year.text and month(opendoss) = 7 and
				id_patstatus = idpatstat) as status_jui,
			 ( SELECT count(*) FROM patient 
				WHERE patient.no_ortho = :v_no_ortho and year(opendoss) = :em_year.text and month(opendoss) = 8 and
				id_patstatus = idpatstat) as status_aou,
			 ( SELECT count(*) FROM patient 
				WHERE patient.no_ortho = :v_no_ortho and year(opendoss) = :em_year.text and month(opendoss) = 9 and
				id_patstatus = idpatstat) as status_sep,
			 ( SELECT count(*) FROM patient 
				WHERE patient.no_ortho = :v_no_ortho and year(opendoss) = :em_year.text and month(opendoss) = 10 and
				id_patstatus = idpatstat) as status_oct,
			 ( SELECT count(*) FROM patient
				WHERE patient.no_ortho = :v_no_ortho and year(opendoss) = :em_year.text and month(opendoss) = 11 and
				id_patstatus = idpatstat) as status_nov,
			 ( SELECT count(*) FROM patient
				WHERE patient.no_ortho = :v_no_ortho and year(opendoss) = :em_year.text and month(opendoss) = 12 and
				id_patstatus = idpatstat) as status_dec
	FROM  t_patstatus;
				
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
			ll_row = dw_rapportannueletatdoss.insertrow(0)
			dw_rapportannueletatdoss.scrolltorow(ll_row)
			dw_rapportannueletatdoss.setitem(ll_row,'status',ls_code)
			if isnull(ll_jan) then
				dw_rapportannueletatdoss.setitem(ll_row,'status_jan',0)
			else
				dw_rapportannueletatdoss.setitem(ll_row,'status_jan',ll_jan)
			end if
			if isnull(ll_fev) then
				dw_rapportannueletatdoss.setitem(ll_row,'status_fev',0)
			else
				dw_rapportannueletatdoss.setitem(ll_row,'status_fev',ll_fev)
			end if
			if isnull(ll_mar) then
				dw_rapportannueletatdoss.setitem(ll_row,'status_mar',0)
			else
				dw_rapportannueletatdoss.setitem(ll_row,'status_mar',ll_mar)
			end if
			if isnull(ll_avr) then
				dw_rapportannueletatdoss.setitem(ll_row,'status_avr',0)
			else
				dw_rapportannueletatdoss.setitem(ll_row,'status_avr',ll_avr)
			end if
			if isnull(ll_mai) then
				dw_rapportannueletatdoss.setitem(ll_row,'status_mai',0)
			else
				dw_rapportannueletatdoss.setitem(ll_row,'status_mai',ll_mai)
			end if
			if isnull(ll_jun) then
				dw_rapportannueletatdoss.setitem(ll_row,'status_jun',0)
			else
				dw_rapportannueletatdoss.setitem(ll_row,'status_jun',ll_jun)
			end if
			if isnull(ll_jui) then
				dw_rapportannueletatdoss.setitem(ll_row,'status_jui',0)
			else
				dw_rapportannueletatdoss.setitem(ll_row,'status_jui',ll_jui)
			end if
			if isnull(ll_aou) then
				dw_rapportannueletatdoss.setitem(ll_row,'status_aou',0)
			else
				dw_rapportannueletatdoss.setitem(ll_row,'status_aou',ll_aou)
			end if
			if isnull(ll_sep) then
				dw_rapportannueletatdoss.setitem(ll_row,'status_sep',0)
			else
				dw_rapportannueletatdoss.setitem(ll_row,'status_sep',ll_sep)
			end if
			if isnull(ll_oct) then
				dw_rapportannueletatdoss.setitem(ll_row,'status_oct',0)
			else
				dw_rapportannueletatdoss.setitem(ll_row,'status_oct',ll_oct)
			end if
			if isnull(ll_nov) then
				dw_rapportannueletatdoss.setitem(ll_row,'status_nov',0)
			else
				dw_rapportannueletatdoss.setitem(ll_row,'status_nov',ll_nov)
			end if
			if isnull(ll_dec) then
				dw_rapportannueletatdoss.setitem(ll_row,'status_dec',0)
			else
				dw_rapportannueletatdoss.setitem(ll_row,'status_dec',ll_dec)
			end if
		END IF
	Loop
	
	close stat;
	
else
	
	dw_rapportannueletatdoss.retrieve(v_no_ortho,gf_emtodate(em_debut.text),gf_emtodate(em_fin.text))
	
end if

end event

event constructor;if v_langue = 'an' then
	this.text = 'Find'
end if
end event

type st_title from statictext within w_rapportannueletatdoss
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
long textcolor = 8388608
long backcolor = 67108864
string text = "Rapport annuel des statuts"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Monthly report'
end if
end event

type cb_close from commandbutton within w_rapportannueletatdoss
integer x = 3109
integer y = 1920
integer width = 526
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

