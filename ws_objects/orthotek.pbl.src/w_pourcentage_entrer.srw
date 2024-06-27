$PBExportHeader$w_pourcentage_entrer.srw
forward
global type w_pourcentage_entrer from w_child
end type
type cb_del from commandbutton within w_pourcentage_entrer
end type
type cb_2 from commandbutton within w_pourcentage_entrer
end type
type dw_sat from uo_sat within w_pourcentage_entrer
end type
type cb_inityear from commandbutton within w_pourcentage_entrer
end type
type cb_1 from commandbutton within w_pourcentage_entrer
end type
type cb_update from commandbutton within w_pourcentage_entrer
end type
type cb_print from commandbutton within w_pourcentage_entrer
end type
type em_year from editmask within w_pourcentage_entrer
end type
type cb_retrieve from commandbutton within w_pourcentage_entrer
end type
type dw_pourcentage_entrer from u_dw within w_pourcentage_entrer
end type
type cb_close from commandbutton within w_pourcentage_entrer
end type
end forward

global type w_pourcentage_entrer from w_child
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_del cb_del
cb_2 cb_2
dw_sat dw_sat
cb_inityear cb_inityear
cb_1 cb_1
cb_update cb_update
cb_print cb_print
em_year em_year
cb_retrieve cb_retrieve
dw_pourcentage_entrer dw_pourcentage_entrer
cb_close cb_close
end type
global w_pourcentage_entrer w_pourcentage_entrer

type variables
int ii_change = 0
end variables

forward prototypes
public subroutine sauve ()
public subroutine initnextyear ()
end prototypes

public subroutine sauve ();if dw_pourcentage_entrer.update() = 1 then
	commit;
	ii_change = 0
else
	error_type(50)
	rollback;
end if
end subroutine

public subroutine initnextyear ();int  li_pourc, li_year
long i = 0, ll_nbrow, ll_pourc, ll_traitid
date ldt_traitend, ldt_finDAnnee
decimal ld_totfact
w_progressbar iw_progressbar

if error_type(224) = 1 then
	SetPointer(HourGlass!)
	
	if em_year.getData(ldt_finDAnnee) < 1 then
		error_type(1020)
		return
	end if
	
	open(iw_progressbar)
	iw_progressbar.of_tache("Pourcentage pour l'année "+string(ldt_finDAnnee, 'yyyy'))
	select count(*) into :ll_pourc 
	from traitements inner join patient on traitements.patient_id = patient.patient_id
	where patient.no_ortho = :v_no_ortho;
	iw_progressbar.of_max(ll_pourc)
	iw_progressbar.of_position(i)

	li_year = year(ldt_finDAnnee)
	DECLARE cur CURSOR FOR

		select traitements.traitement_id as traitid,
				 (select sum(montant) from factures_traitements inner join t_status on factures_traitements.status_id = t_status.status_id where factures_traitements.traitement_id = traitid and factures_traitements.date_facture <= :ldt_finDAnnee ) as totfact
		from traitements inner join patient on traitements.patient_id = patient.patient_id
		where patient.no_ortho = :v_no_ortho and
				totfact > 0;
	
	OPEN cur;
	
	FETCH cur INTO :ll_traitid,
						:ld_totfact;
	
	DO WHILE SQLCA.SQLCODE = 0
		setnull(li_pourc)
		select pourcentage into :li_pourc from t_pourcentages where annee = :li_year and traitement_id = :ll_traitid;
		if isnull(li_pourc) then
			select max(pourcentage) into :li_pourc from t_pourcentages where traitement_id = :ll_traitid;
			if isnull(li_pourc) then
				insert into t_pourcentages(annee,traitement_id,pourcentage) values(:li_year,:ll_traitid,0);
//				error_type(-1)
			elseif li_pourc < 100 then
				insert into t_pourcentages(annee,traitement_id,pourcentage) values(:li_year,:ll_traitid,:li_pourc);
//				error_type(-1)
			end if
		else
			
		end if
		i++
		iw_progressbar.of_position(i)
			FETCH cur INTO :ll_traitid,
								:ld_totfact;
	LOOP
	
	CLOSE cur;
	close(iw_progressbar)
end if
end subroutine

on w_pourcentage_entrer.create
int iCurrent
call super::create
this.cb_del=create cb_del
this.cb_2=create cb_2
this.dw_sat=create dw_sat
this.cb_inityear=create cb_inityear
this.cb_1=create cb_1
this.cb_update=create cb_update
this.cb_print=create cb_print
this.em_year=create em_year
this.cb_retrieve=create cb_retrieve
this.dw_pourcentage_entrer=create dw_pourcentage_entrer
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_del
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.dw_sat
this.Control[iCurrent+4]=this.cb_inityear
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.cb_update
this.Control[iCurrent+7]=this.cb_print
this.Control[iCurrent+8]=this.em_year
this.Control[iCurrent+9]=this.cb_retrieve
this.Control[iCurrent+10]=this.dw_pourcentage_entrer
this.Control[iCurrent+11]=this.cb_close
end on

on w_pourcentage_entrer.destroy
call super::destroy
destroy(this.cb_del)
destroy(this.cb_2)
destroy(this.dw_sat)
destroy(this.cb_inityear)
destroy(this.cb_1)
destroy(this.cb_update)
destroy(this.cb_print)
destroy(this.em_year)
destroy(this.cb_retrieve)
destroy(this.dw_pourcentage_entrer)
destroy(this.cb_close)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type cb_del from commandbutton within w_pourcentage_entrer
boolean visible = false
integer width = 462
integer height = 64
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Delete"
end type

event clicked;long row,ll_traitid
integer li_year

row = dw_pourcentage_entrer.getrow()
li_year = 2004//dw_pourcentage_entrer.getitemnumber(row,'annee')
ll_traitid = dw_pourcentage_entrer.getitemnumber(row,'t_pourcentages_traitement_id')
delete from t_pourcentages where annee = :li_year and traitement_id = :ll_traitid;
end event

type cb_2 from commandbutton within w_pourcentage_entrer
integer x = 2235
integer y = 1916
integer width = 453
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Del. Year"
end type

event clicked;integer li_year
long ll_traitid
date ldt_fin

if em_year.getData(ldt_fin) < 1 then
	// Erreur
	error_type(1020)
	return 0
end if

li_year = year(ldt_fin)

DECLARE cur CURSOR FOR

	select traitements.traitement_id
	from traitements inner join t_pourcentages on traitements.traitement_id = t_pourcentages.traitement_id
						  inner join patient on traitements.patient_id = patient.patient_id
	where t_pourcentages.annee = :li_year and patient.no_ortho = :v_no_ortho;

OPEN cur;

FETCH cur INTO :ll_traitid;

DO WHILE SQLCA.SQLCODE = 0
	delete from t_pourcentages where traitement_id = :ll_traitid and annee = :li_year;
	error_type(-1)
	FETCH cur INTO :ll_traitid;
LOOP

CLOSE cur;
end event

type dw_sat from uo_sat within w_pourcentage_entrer
integer x = 2094
integer taborder = 10
end type

event clicked;call super::clicked;this.il_idsat = il_idsat

if il_idsat = 0 then
	dw_pourcentage_entrer.setFilter("")
	dw_pourcentage_entrer.filter()
else
	dw_pourcentage_entrer.setFilter("patient_id_satellite = " + string(il_idsat))
	dw_pourcentage_entrer.filter()
end if
end event

event constructor;call super::constructor;integer li_option

select compsat into :li_option from t_options where ortho_id = :v_no_ortho;
if li_option = 1 then
	visible = true 
else
	visible = false
end if
end event

type cb_inityear from commandbutton within w_pourcentage_entrer
integer x = 891
integer y = 1916
integer width = 302
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Init. Year"
end type

event clicked;initnextyear()
end event

type cb_1 from commandbutton within w_pourcentage_entrer
integer x = 361
integer y = 1916
integer width = 530
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Pourcentage auto."
end type

event clicked;long jour_total   // Mois total du traitement
long jour_restant // Mois restant avant la fin de traitement
int i            // Variable itérateur pour la boucle FOR..NEXT
date date_fin 
date date_debut
date ldt_compare

if em_year.getData(ldt_compare) < 1 then
	error_type(1020)
	return 0
end if

//messagebox('',string(ldt_compare))
setpointer(hourglass!)
if error_type(210) = 1 then
   FOR i = 1 TO dw_pourcentage_entrer.rowcount()
	   date_fin = dw_pourcentage_entrer.getitemdate(i,'fin_traitement')
	   date_debut = dw_pourcentage_entrer.getitemdate(i,'debut_traitement')
	   jour_total = DaysAfter(date_debut, date_fin)
		if isnull(jour_total) = false then
			if date_fin <= ldt_compare then
				jour_restant = 0
			else
				jour_restant = DaysAfter(ldt_compare, date_fin)
				if isnull(jour_restant) then
					jour_restant = 0
				end if
			end if
			if jour_total = 0 then
				jour_total = 1
			end if
			dw_pourcentage_entrer.object.pourcentage[i] = ((jour_total - jour_restant) / jour_total) * 100
  		end if
	NEXT
   ii_change = 1
END IF
end event

event constructor;if v_langue = 'an' then
	this.text = '% auto'
end if
end event

type cb_update from commandbutton within w_pourcentage_entrer
integer x = 2693
integer y = 1916
integer width = 457
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;sauve()
//initnextyear(integer(em_year.text))
end event

event constructor;if v_langue = 'an' then
	this.text = 'Save'
end if
end event

type cb_print from commandbutton within w_pourcentage_entrer
integer x = 5
integer y = 1916
integer width = 357
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimer"
end type

event clicked;integer li_year
date ldt_fin

if em_year.getData(ldt_fin) < 1 then
	// Erreur
	error_type(1020)
	return 0
end if

li_year = year(ldt_fin)

datastore ds_pourcentageentrerimp
ds_pourcentageentrerimp = create datastore
ds_pourcentageentrerimp.dataobject = "d_pourcentageentrerimp"
ds_pourcentageentrerimp.SetTransObject(SQLCA)
ds_pourcentageentrerimp.Retrieve(v_no_ortho,li_year)
ds_pourcentageentrerimp.object.t_year1.text = string(li_year - 2)
ds_pourcentageentrerimp.object.t_year2.text = string(li_year - 1)
ds_pourcentageentrerimp.object.t_year3.text = string(li_year)
gb_datawindow = false
openwithparm(w_print_options,ds_pourcentageentrerimp)
destroy ds_pourcentageentrerimp





end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type em_year from editmask within w_pourcentage_entrer
integer x = 1728
integer y = 1928
integer width = 434
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd-mm-yyyy"
boolean autoskip = true
boolean dropdowncalendar = true
end type

event constructor;em_year.text = string(date(year(today()), 12, 31))
end event

type cb_retrieve from commandbutton within w_pourcentage_entrer
integer x = 1193
integer y = 1916
integer width = 453
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Rechercher"
end type

event clicked;int li_year
date ldt_fin

if em_year.getData(ldt_fin) < 1 then
	// Erreur
	error_type(1020)
	return 0
end if

li_year = year(ldt_fin)

dw_pourcentage_entrer.Retrieve(v_no_ortho,li_year)
dw_pourcentage_entrer.object.t_year1.text = string(li_year - 2)
dw_pourcentage_entrer.object.t_year2.text = string(li_year - 1)
dw_pourcentage_entrer.object.t_year3.text = string(li_year)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Find'
end if
end event

type dw_pourcentage_entrer from u_dw within w_pourcentage_entrer
integer x = 5
integer y = 88
integer width = 3598
integer height = 1820
integer taborder = 40
string title = "pourcentage_entrer"
string dataobject = "d_pourcentage_entrer1"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;if v_langue = 'an' then
	this.object.t_titre.text = 'MODIFY POURCENTAGE LIST'
	this.object.t_pat.text = "Patient's name"
	this.object.t_start.text = 'Start'
	this.object.t_end.text = 'End'
	this.object.t_qty.text = 'Qty:'
end if
SetTransObject(SQLCA)

end event

event itemchanged;ii_change = 1
end event

event editchanged;date ldt_fin
long ll_traitid
if this.getcolumnname() = 'pourcentage' then
	if data = '100' then
		open(w_pourcprotect)
		ldt_fin = date(Message.Stringparm)
		ll_traitid = this.getitemnumber(row,'traitements_traitement_id')
		UPDATE traitements SET fin_traitement = :ldt_fin WHERE traitement_id = :ll_traitid;
		commit;
	end if
end if
ii_change = 1
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

event doubleclicked;w_patient.event ue_dossfin(getitemnumber(row,'patient_id'))
end event

type cb_close from commandbutton within w_pourcentage_entrer
integer x = 3154
integer y = 1916
integer width = 448
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if ii_change = 1 then
	if error_type(200) = 1 then
		sauve()
	end if
end if
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

