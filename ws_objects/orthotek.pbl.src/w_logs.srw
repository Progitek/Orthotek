$PBExportHeader$w_logs.srw
forward
global type w_logs from w_child
end type
type cb_1 from commandbutton within w_logs
end type
type cb_search from commandbutton within w_logs
end type
type st_to from statictext within w_logs
end type
type st_date from statictext within w_logs
end type
type em_end from editmask within w_logs
end type
type em_start from editmask within w_logs
end type
type cb_print from commandbutton within w_logs
end type
type cb_close from commandbutton within w_logs
end type
type gb_1 from groupbox within w_logs
end type
type tab_logs from tab within w_logs
end type
type tp_horaire from userobject within tab_logs
end type
type dw_loghor from u_dw within tp_horaire
end type
type tp_horaire from userobject within tab_logs
dw_loghor dw_loghor
end type
type tp_facture from userobject within tab_logs
end type
type dw_logfact from u_dw within tp_facture
end type
type tp_facture from userobject within tab_logs
dw_logfact dw_logfact
end type
type tp_paiement from userobject within tab_logs
end type
type dw_logpaie from u_dw within tp_paiement
end type
type tp_paiement from userobject within tab_logs
dw_logpaie dw_logpaie
end type
type tp_dossfin from userobject within tab_logs
end type
type dw_logdossfin from u_dw within tp_dossfin
end type
type tp_dossfin from userobject within tab_logs
dw_logdossfin dw_logdossfin
end type
type tabpage_dentiste from userobject within tab_logs
end type
type dw_logdentist from u_dw within tabpage_dentiste
end type
type tabpage_dentiste from userobject within tab_logs
dw_logdentist dw_logdentist
end type
type tabpage_correspondance from userobject within tab_logs
end type
type dw_logscorr from u_dw within tabpage_correspondance
end type
type tabpage_correspondance from userobject within tab_logs
dw_logscorr dw_logscorr
end type
type tab_logs from tab within w_logs
tp_horaire tp_horaire
tp_facture tp_facture
tp_paiement tp_paiement
tp_dossfin tp_dossfin
tabpage_dentiste tabpage_dentiste
tabpage_correspondance tabpage_correspondance
end type
end forward

global type w_logs from w_child
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
cb_1 cb_1
cb_search cb_search
st_to st_to
st_date st_date
em_end em_end
em_start em_start
cb_print cb_print
cb_close cb_close
gb_1 gb_1
tab_logs tab_logs
end type
global w_logs w_logs

type variables
public int changement = 0
end variables

forward prototypes
public subroutine uf_setsort (string ls_butname)
end prototypes

public subroutine uf_setsort (string ls_butname);
end subroutine

on w_logs.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_search=create cb_search
this.st_to=create st_to
this.st_date=create st_date
this.em_end=create em_end
this.em_start=create em_start
this.cb_print=create cb_print
this.cb_close=create cb_close
this.gb_1=create gb_1
this.tab_logs=create tab_logs
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_search
this.Control[iCurrent+3]=this.st_to
this.Control[iCurrent+4]=this.st_date
this.Control[iCurrent+5]=this.em_end
this.Control[iCurrent+6]=this.em_start
this.Control[iCurrent+7]=this.cb_print
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.tab_logs
end on

on w_logs.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_search)
destroy(this.st_to)
destroy(this.st_date)
destroy(this.em_end)
destroy(this.em_start)
destroy(this.cb_print)
destroy(this.cb_close)
destroy(this.gb_1)
destroy(this.tab_logs)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_1 from commandbutton within w_logs
integer x = 530
integer y = 1928
integer width = 2491
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_search from commandbutton within w_logs
integer x = 1513
integer y = 84
integer width = 631
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Search"
end type

event clicked;//dw_logs.setfilter("logdate >= date('" + em_start.text + "') and logdate <= date('" + em_end.text + "')")
//dw_logs.filter()
tab_logs.tp_horaire.dw_loghor.retrieve('Horaire',date(em_start.text),date(em_end.text))
tab_logs.tp_facture.dw_logfact.retrieve('Invoice',date(em_start.text),date(em_end.text))
tab_logs.tp_paiement.dw_logpaie.retrieve('Payment',date(em_start.text),date(em_end.text))
tab_logs.tp_dossfin.dw_logdossfin.retrieve('dossfin',date(em_start.text),date(em_end.text))
tab_logs.tabpage_correspondance.dw_logscorr.retrieve('corr',date(em_start.text),date(em_end.text))
end event

type st_to from statictext within w_logs
integer x = 786
integer y = 108
integer width = 128
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "to"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_date from statictext within w_logs
integer x = 23
integer y = 108
integer width = 297
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_end from editmask within w_logs
integer x = 914
integer y = 108
integer width = 443
integer height = 64
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean dropdowncalendar = true
end type

event constructor;em_end.text = string(today())
end event

type em_start from editmask within w_logs
integer x = 334
integer y = 108
integer width = 443
integer height = 64
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "[date]"
boolean dropdowncalendar = true
end type

event constructor;em_start.text = string(today())
end event

type cb_print from commandbutton within w_logs
integer x = 5
integer y = 1928
integer width = 521
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Print"
end type

event clicked;gb_datawindow = true
CHOOSE CASE tab_logs.SelectedTab
	CASE 1
		openwithparm(w_print_options,tab_logs.tp_horaire.dw_loghor)
	CASE 2
		openwithparm(w_print_options,tab_logs.tp_facture.dw_logfact)
	CASE 3
		openwithparm(w_print_options,tab_logs.tp_paiement.dw_logpaie)
	CASE 4
		openwithparm(w_print_options,tab_logs.tp_dossfin.dw_logdossfin)
END CHOOSE
end event

type cb_close from commandbutton within w_logs
integer x = 3026
integer y = 1928
integer width = 590
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Close"
end type

event clicked;close(parent)
end event

type gb_1 from groupbox within w_logs
integer width = 3621
integer height = 264
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Search parameter"
end type

type tab_logs from tab within w_logs
event create ( )
event destroy ( )
integer x = 5
integer y = 268
integer width = 3611
integer height = 1660
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp_horaire tp_horaire
tp_facture tp_facture
tp_paiement tp_paiement
tp_dossfin tp_dossfin
tabpage_dentiste tabpage_dentiste
tabpage_correspondance tabpage_correspondance
end type

on tab_logs.create
this.tp_horaire=create tp_horaire
this.tp_facture=create tp_facture
this.tp_paiement=create tp_paiement
this.tp_dossfin=create tp_dossfin
this.tabpage_dentiste=create tabpage_dentiste
this.tabpage_correspondance=create tabpage_correspondance
this.Control[]={this.tp_horaire,&
this.tp_facture,&
this.tp_paiement,&
this.tp_dossfin,&
this.tabpage_dentiste,&
this.tabpage_correspondance}
end on

on tab_logs.destroy
destroy(this.tp_horaire)
destroy(this.tp_facture)
destroy(this.tp_paiement)
destroy(this.tp_dossfin)
destroy(this.tabpage_dentiste)
destroy(this.tabpage_correspondance)
end on

type tp_horaire from userobject within tab_logs
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3575
integer height = 1532
long backcolor = 67108864
string text = "Horaire"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_loghor dw_loghor
end type

on tp_horaire.create
this.dw_loghor=create dw_loghor
this.Control[]={this.dw_loghor}
end on

on tp_horaire.destroy
destroy(this.dw_loghor)
end on

type dw_loghor from u_dw within tp_horaire
integer width = 3579
integer height = 1532
integer taborder = 40
string title = "none"
string dataobject = "d_logs"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;setTransObject(SQLCA)
retrieve('Horaire',date(em_start.text),date(em_end.text))
object.b_loginfo.text = 'Log info'
object.b_final.text = ''
end event

event buttonclicked;CHOOSE CASE dwo.name
	CASE 'b_idlog'
		setSort('id_log A')
		sort()
	CASE 'b_logdate'
		setSort('logdate A')
		sort()
	CASE 'b_time'
		setSort('heure A')
		sort()
	CASE 'b_action'
		setSort('actions A')
		sort()
	CASE 'b_user'
		setSort('pers A')
		sort()
	CASE 'b_loginfo'
		setSort('montant A')
		sort()
	CASE 'b_trans'
		setSort('datetrans A')
		sort()
	CASE 'b_final'
		setSort('montantfin A')
		sort()
	CASE 'b_name'
		setSort('compute_1 A')
		sort()
END CHOOSE
end event

event clicked;//if isselected(row) then
//	selectRow(row,false)
//else
//	selectRow(row,true)
//end if
end event

type tp_facture from userobject within tab_logs
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3575
integer height = 1532
long backcolor = 67108864
string text = "Facture"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_logfact dw_logfact
end type

on tp_facture.create
this.dw_logfact=create dw_logfact
this.Control[]={this.dw_logfact}
end on

on tp_facture.destroy
destroy(this.dw_logfact)
end on

type dw_logfact from u_dw within tp_facture
integer width = 3566
integer height = 1532
integer taborder = 40
string title = "none"
string dataobject = "d_logs"
boolean border = false
end type

event constructor;setTransObject(SQLCA)
retrieve('Invoice',date(em_start.text),date(em_end.text))
end event

event buttonclicked;CHOOSE CASE dwo.name
	CASE 'b_idlog'
		setSort('id_log A')
		sort()
	CASE 'b_logdate'
		setSort('logdate A')
		sort()
	CASE 'b_time'
		setSort('heure A')
		sort()
	CASE 'b_action'
		setSort('actions A')
		sort()
	CASE 'b_user'
		setSort('pers A')
		sort()
	CASE 'b_loginfo'
		setSort('montant A')
		sort()
	CASE 'b_trans'
		setSort('datetrans A')
		sort()
	CASE 'b_final'
		setSort('montantfin A')
		sort()
	CASE 'b_name'
		setSort('compute_1 A')
		sort()
END CHOOSE
end event

type tp_paiement from userobject within tab_logs
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3575
integer height = 1532
long backcolor = 67108864
string text = "Paiement"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_logpaie dw_logpaie
end type

on tp_paiement.create
this.dw_logpaie=create dw_logpaie
this.Control[]={this.dw_logpaie}
end on

on tp_paiement.destroy
destroy(this.dw_logpaie)
end on

type dw_logpaie from u_dw within tp_paiement
integer width = 3575
integer height = 1528
integer taborder = 40
string title = "none"
string dataobject = "d_logs"
boolean border = false
end type

event constructor;setTransObject(SQLCA)
retrieve('Payment',date(em_start.text),date(em_end.text))
end event

event buttonclicked;CHOOSE CASE dwo.name
	CASE 'b_idlog'
		setSort('id_log A')
		sort()
	CASE 'b_logdate'
		setSort('logdate A')
		sort()
	CASE 'b_time'
		setSort('heure A')
		sort()
	CASE 'b_action'
		setSort('actions A')
		sort()
	CASE 'b_user'
		setSort('pers A')
		sort()
	CASE 'b_loginfo'
		setSort('montant A')
		sort()
	CASE 'b_trans'
		setSort('datetrans A')
		sort()
	CASE 'b_final'
		setSort('montantfin A')
		sort()
	CASE 'b_name'
		setSort('compute_1 A')
		sort()
END CHOOSE
end event

type tp_dossfin from userobject within tab_logs
integer x = 18
integer y = 112
integer width = 3575
integer height = 1532
long backcolor = 67108864
string text = "Dossier financier"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_logdossfin dw_logdossfin
end type

on tp_dossfin.create
this.dw_logdossfin=create dw_logdossfin
this.Control[]={this.dw_logdossfin}
end on

on tp_dossfin.destroy
destroy(this.dw_logdossfin)
end on

type dw_logdossfin from u_dw within tp_dossfin
integer width = 3570
integer height = 1532
integer taborder = 40
string title = "none"
string dataobject = "d_logs"
boolean border = false
end type

event constructor;setTransObject(SQLCA)
retrieve('dossfin',date(em_start.text),date(em_end.text))
end event

event buttonclicked;CHOOSE CASE dwo.name
	CASE 'b_idlog'
		setSort('id_log A')
		sort()
	CASE 'b_logdate'
		setSort('logdate A')
		sort()
	CASE 'b_time'
		setSort('heure A')
		sort()
	CASE 'b_action'
		setSort('actions A')
		sort()
	CASE 'b_user'
		setSort('pers A')
		sort()
	CASE 'b_loginfo'
		setSort('montant A')
		sort()
	CASE 'b_trans'
		setSort('datetrans A')
		sort()
	CASE 'b_final'
		setSort('montantfin A')
		sort()
	CASE 'b_name'
		setSort('compute_1 A')
		sort()
END CHOOSE
	
end event

type tabpage_dentiste from userobject within tab_logs
integer x = 18
integer y = 112
integer width = 3575
integer height = 1532
long backcolor = 67108864
string text = "Dentistes"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_logdentist dw_logdentist
end type

on tabpage_dentiste.create
this.dw_logdentist=create dw_logdentist
this.Control[]={this.dw_logdentist}
end on

on tabpage_dentiste.destroy
destroy(this.dw_logdentist)
end on

type dw_logdentist from u_dw within tabpage_dentiste
integer width = 3579
integer height = 1532
integer taborder = 70
string title = "logdentist"
string dataobject = "d_logs"
boolean border = false
end type

event constructor;setTransObject(SQLCA)
retrieve('dentist',date(em_start.text),date(em_end.text))
end event

event buttonclicked;CHOOSE CASE dwo.name
	CASE 'b_idlog'
		setSort('id_log A')
		sort()
	CASE 'b_logdate'
		setSort('logdate A')
		sort()
	CASE 'b_time'
		setSort('heure A')
		sort()
	CASE 'b_action'
		setSort('actions A')
		sort()
	CASE 'b_user'
		setSort('pers A')
		sort()
	CASE 'b_loginfo'
		setSort('montant A')
		sort()
	CASE 'b_trans'
		setSort('datetrans A')
		sort()
	CASE 'b_final'
		setSort('montantfin A')
		sort()
	CASE 'b_name'
		setSort('compute_1 A')
		sort()
END CHOOSE
	
end event

type tabpage_correspondance from userobject within tab_logs
integer x = 18
integer y = 112
integer width = 3575
integer height = 1532
long backcolor = 67108864
string text = "Correspondance"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_logscorr dw_logscorr
end type

on tabpage_correspondance.create
this.dw_logscorr=create dw_logscorr
this.Control[]={this.dw_logscorr}
end on

on tabpage_correspondance.destroy
destroy(this.dw_logscorr)
end on

type dw_logscorr from u_dw within tabpage_correspondance
integer width = 3575
integer height = 1524
integer taborder = 30
string dataobject = "d_logs"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;setTransObject(SQLCA)
retrieve('corr',date(em_start.text),date(em_end.text))
object.b_loginfo.text = 'Log info'
object.b_final.text = ''
end event

event buttonclicked;call super::buttonclicked;CHOOSE CASE dwo.name
	CASE 'b_idlog'
		setSort('id_log A')
		sort()
	CASE 'b_logdate'
		setSort('logdate A')
		sort()
	CASE 'b_time'
		setSort('heure A')
		sort()
	CASE 'b_action'
		setSort('actions A')
		sort()
	CASE 'b_user'
		setSort('pers A')
		sort()
	CASE 'b_loginfo'
		setSort('montant A')
		sort()
	CASE 'b_trans'
		setSort('datetrans A')
		sort()
	CASE 'b_final'
		setSort('montantfin A')
		sort()
	CASE 'b_name'
		setSort('compute_1 A')
		sort()
END CHOOSE
end event

