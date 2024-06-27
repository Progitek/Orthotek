$PBExportHeader$w_hortplperiod.srw
forward
global type w_hortplperiod from w_child
end type
type rb_del from radiobutton within w_hortplperiod
end type
type rb_add from radiobutton within w_hortplperiod
end type
type cb_3 from commandbutton within w_hortplperiod
end type
type cb_apply from commandbutton within w_hortplperiod
end type
type ddlb_fin from dropdownlistbox within w_hortplperiod
end type
type ddlb_debut from dropdownlistbox within w_hortplperiod
end type
type rb_findate from radiobutton within w_hortplperiod
end type
type sle_nboccur from singlelineedit within w_hortplperiod
end type
type rb_occur from radiobutton within w_hortplperiod
end type
type rb_pasfin from radiobutton within w_hortplperiod
end type
type rb_ann from radiobutton within w_hortplperiod
end type
type rb_mens from radiobutton within w_hortplperiod
end type
type rb_hebdo from radiobutton within w_hortplperiod
end type
type rb_quot from radiobutton within w_hortplperiod
end type
type dw_tpl from u_dw within w_hortplperiod
end type
type cb_close from commandbutton within w_hortplperiod
end type
type gb_1 from groupbox within w_hortplperiod
end type
type gb_2 from groupbox within w_hortplperiod
end type
type dw_periode from u_dw within w_hortplperiod
end type
type gb_3 from groupbox within w_hortplperiod
end type
type gb_4 from groupbox within w_hortplperiod
end type
end forward

global type w_hortplperiod from w_child
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
string icon = "AppIcon!"
boolean ib_isupdateable = false
rb_del rb_del
rb_add rb_add
cb_3 cb_3
cb_apply cb_apply
ddlb_fin ddlb_fin
ddlb_debut ddlb_debut
rb_findate rb_findate
sle_nboccur sle_nboccur
rb_occur rb_occur
rb_pasfin rb_pasfin
rb_ann rb_ann
rb_mens rb_mens
rb_hebdo rb_hebdo
rb_quot rb_quot
dw_tpl dw_tpl
cb_close cb_close
gb_1 gb_1
gb_2 gb_2
dw_periode dw_periode
gb_3 gb_3
gb_4 gb_4
end type
global w_hortplperiod w_hortplperiod

type variables
public boolean change = false
end variables

forward prototypes
public subroutine f_applytpl ()
public subroutine applyday (date pdt_debut, date pdt_fin, long pl_idtpl, long pl_nbjour)
public subroutine applymonth (integer pi_mdatechiffre, integer pi_nbmois, date pdt_debut, date pdt_fin, long pl_idtpl)
public subroutine applyjourouv (date pdt_debut, date pdt_fin, long pl_idtpl, integer pl_nbjour)
public function boolean uf_workday (date adt)
protected subroutine applyhebdo (long al_hnbsem, date adt_debut, date adt_fin, integer al_idtpl)
end prototypes

public subroutine f_applytpl ();//////////////////////////////
//
// Créé par: Dave Tremblay
// Créé le : 20-11-2003
// Demande : 
// Version : 1.4.6
// Modifié par: Dave Tremblay
// Modifié le: 20-11-2003
// 
////////////////////////////////

long ll_idtplperiode, ll_idtpl 
integer li_qnbjour, li_qjourouv, li_hnbsem, li_hdim 
integer li_hlun, li_hmar, li_hmer, li_hjeu, li_hven 
integer li_hsam, li_mnbmois1, li_mnbmois2, li_mdatechiffre
integer li_mdatelettre, li_mjoursem, li_mchoix, li_achoix
integer li_anbjour, li_ajourlettre, li_adatelettre
integer li_amoislettre1, li_amoislettre2, li_ajoursem
integer li_typeperiod 
date ldt_debut, ldt_fin

ldt_debut = date(ddlb_debut.text)
ldt_fin = date(ddlb_fin.text)

if rb_quot.checked then
	li_qnbjour = dw_periode.getItemNumber(1,'qnbjour')
	li_qjourouv = dw_periode.getItemNumber(1,'qjourouv')
	ll_idtpl = dw_periode.getItemNumber(1,'id_template')
	if li_qjourouv = 0 then
		applyjourouv(ldt_debut, ldt_fin, ll_idtpl, li_qnbjour)
	else
		applyday(ldt_debut, ldt_fin, ll_idtpl,li_qnbjour)
	end if
else
	if rb_hebdo.checked then
		li_hnbsem = dw_periode.getItemNumber(1,'hnbsem')
		ll_idtpl = dw_periode.getItemNumber(1,'id_template')
		applyhebdo(li_hnbsem,ldt_debut,ldt_fin,ll_idtpl)
	else
		if rb_mens.checked then
			li_mnbmois1 = dw_periode.getItemNumber(1,'mnbmois1')
			li_mnbmois2 = dw_periode.getItemNumber(1,'mnbmois2')
			li_mdatechiffre = dw_periode.getItemNumber(1,'mdatechiffre')
			li_mdatelettre = dw_periode.getItemNumber(1,'mdatelettre')
			li_mjoursem = dw_periode.getItemNumber(1,'mjoursem')
			li_mchoix = dw_periode.getItemNumber(1,'mchoix')
			ll_idtpl = dw_periode.getItemNumber(1,'id_template')
			if li_mchoix = 1 then
				applymonth(li_mdatechiffre,li_mnbmois1,ldt_debut,ldt_fin,ll_idtpl)
			else
				if li_mchoix = 2 then
//					applymonthday()
				end if
			end if
			if rb_ann.checked then
				li_anbjour = dw_periode.getItemNumber(1,'anbjour')
				li_ajourlettre = dw_periode.getItemNumber(1,'ajourlettre')
				li_adatelettre = dw_periode.getItemNumber(1,'adatelettre')
				li_amoislettre1 = dw_periode.getItemNumber(1,'amoislettre1')
				li_amoislettre2 = dw_periode.getItemNumber(1,'amoislettre2')
				li_ajoursem = dw_periode.getItemNumber(1,'ajoursem')
			end if
		end if
	end if
end if
end subroutine

public subroutine applyday (date pdt_debut, date pdt_fin, long pl_idtpl, long pl_nbjour);integer i, li_counter = 0,li_occur
date ldt_courant

if rb_add.checked then
	if rb_pasfin.checked then
		li_occur = 365
		ldt_courant = pdt_debut
		for i = 1 to li_occur
			insert into t_templatedate(ortho_id,id_template,tpldate) 
			values(:v_no_ortho,:pl_idtpl,:ldt_courant);
			commit using SQLCA;
			ldt_courant = relativeDate(pdt_debut,i * pl_nbjour)
		next
	elseif rb_occur.checked then
		li_occur = integer(sle_nboccur.text)
		ldt_courant = pdt_debut
		for i = 1 to li_occur
			insert into t_templatedate(ortho_id,id_template,tpldate) 
			values(:v_no_ortho,:pl_idtpl,:ldt_courant);
			commit using SQLCA;
			ldt_courant = relativeDate(pdt_debut,i * pl_nbjour)
		next
	else
		li_counter = pl_nbjour - 1
		for i = 1 to daysafter(pdt_debut,pdt_fin) + 1
			li_counter = li_counter + 1
			ldt_courant = relativeDate(pdt_debut, (i - 1))
			if li_counter = pl_nbjour then
				insert into t_templatedate(ortho_id,id_template,tpldate) 
				values(:v_no_ortho,:pl_idtpl,:ldt_courant);
				commit using SQLCA;
				li_counter = 0
			end if
		next
	end if
elseif rb_del.checked then
	if rb_pasfin.checked then
		li_occur = 365
		ldt_courant = pdt_debut
		for i = 1 to li_occur
			delete from t_templatedate where ortho_id = :v_no_ortho and id_template = :pl_idtpl and tpldate = :ldt_courant;
			// Éliminer le template de l'horaire
			w_horaire_template.if_destroytpl(ldt_courant)
			ldt_courant = relativeDate(pdt_debut,i * pl_nbjour)
		next
	elseif rb_occur.checked then
		li_occur = integer(sle_nboccur.text)
		ldt_courant = pdt_debut
		for i = 1 to li_occur
			delete from t_templatedate where ortho_id = :v_no_ortho and id_template = :pl_idtpl and tpldate = :ldt_courant;
			// Éliminer le template de l'horaire
			w_horaire_template.if_destroytpl(ldt_courant)
			ldt_courant = relativeDate(pdt_debut,i * pl_nbjour)
		next
	else
		li_counter = pl_nbjour - 1
		for i = 1 to daysafter(pdt_debut,pdt_fin) + 1
			li_counter = li_counter + 1
			ldt_courant = relativeDate(pdt_debut, (i - 1))
			if li_counter = pl_nbjour then
				delete from t_templatedate where ortho_id = :v_no_ortho and id_template = :pl_idtpl and tpldate = :ldt_courant;
				// Éliminer le template de l'horaire
				w_horaire_template.if_destroytpl(ldt_courant)
				li_counter = 0
			end if
		next
	end if
end if
end subroutine

public subroutine applymonth (integer pi_mdatechiffre, integer pi_nbmois, date pdt_debut, date pdt_fin, long pl_idtpl);integer i, li_counter = 0, inc = 1, li_nbjour
date ldt_courant, ldt_debut, ldt_dateapply
//boolean lb_sem = true
string ls_month, ls_year
int ltab_nbjour[12] = {31,28,31,30,31,30,31,31,30,31,30,31}

// Ramener la date au début du mois
ls_month = string(month(pdt_debut))
ls_year = string(year(pdt_debut))
ldt_debut = date(string('01-' + ls_month + '-' + ls_year))

ldt_courant = ldt_debut

DO WHILE inc <= daysafter(ldt_debut,pdt_fin)
	ls_month = string(month(ldt_courant))
	ls_year = string(year(ldt_courant))
	if mod(li_counter, pi_nbmois) = 0 then
		ldt_dateapply = date(string(pi_mdatechiffre) + '-' + ls_month + '-' + ls_year)
		if ldt_dateapply > pdt_debut and ldt_dateapply < pdt_fin then
			insert into t_templatedate(ortho_id,id_template,tpldate) 
			values(:v_no_ortho,:pl_idtpl,:ldt_dateapply);
			commit using SQLCA;
		end if
	end if
	li_nbjour = ltab_nbjour[long(ls_month)]
	if long(ls_month) = 2 and mod(long(ls_year),4) = 0 then
		li_nbjour = li_nbjour + 1
	end if
	inc = inc + li_nbjour
	ldt_courant = relativeDate(ldt_debut, (inc - 1))
	li_counter = li_counter + 1
LOOP
end subroutine

public subroutine applyjourouv (date pdt_debut, date pdt_fin, long pl_idtpl, integer pl_nbjour);integer i,li_occur
date ldt_courant

if rb_add.checked then
	if rb_pasfin.checked then
		li_occur = 365
		ldt_courant = pdt_debut
		for i = 1 to li_occur
			if uf_workday(ldt_courant) then
				insert into t_templatedate(ortho_id,id_template,tpldate) 
				values(:v_no_ortho,:pl_idtpl,:ldt_courant);
				commit using SQLCA;
			end if
			ldt_courant = relativeDate(pdt_debut,i * pl_nbjour)
		next
	elseif rb_occur.checked then
		li_occur = integer(sle_nboccur.text)
		i = 1
		ldt_courant = pdt_debut
		do while i <= li_occur
			if uf_workday(ldt_courant) then
				insert into t_templatedate(ortho_id,id_template,tpldate) 
				values(:v_no_ortho,:pl_idtpl,:ldt_courant);
				commit using SQLCA;
				i++
			end if
			ldt_courant = relativeDate(ldt_courant,1 * pl_nbjour)
		loop
	else
		for i = 1 to daysafter(pdt_debut,pdt_fin) + 1
			ldt_courant = relativeDate(pdt_debut, (i - 1))
			if left(DayName(ldt_courant),1) <> 'S' then
				insert into t_templatedate(ortho_id,id_template,tpldate) 
				values(:v_no_ortho,:pl_idtpl,:ldt_courant);
				commit using SQLCA;
			end if
		next
	end if
else
	if rb_pasfin.checked then
		li_occur = 365
		ldt_courant = pdt_debut
		for i = 1 to li_occur
			delete from t_templatedate where ortho_id = :v_no_ortho and id_template = :pl_idtpl and tpldate = :ldt_courant;
			// Éliminer le template de l'horaire
			w_horaire_template.if_destroytpl(ldt_courant)
			ldt_courant = relativeDate(pdt_debut,i * pl_nbjour)
		next
	elseif rb_occur.checked then
		li_occur = integer(sle_nboccur.text)
		i = 1
		ldt_courant = pdt_debut
		do while i <= li_occur
			if uf_workday(ldt_courant) then
				delete from t_templatedate where ortho_id = :v_no_ortho and id_template = :pl_idtpl and tpldate = :ldt_courant;
				// Éliminer le template de l'horaire
				w_horaire_template.if_destroytpl(ldt_courant)
				i++
			end if
			ldt_courant = relativeDate(ldt_courant,1 * pl_nbjour)
		loop
	else
		for i = 1 to daysafter(pdt_debut,pdt_fin) + 1
			ldt_courant = relativeDate(pdt_debut, (i - 1))
			if left(DayName(ldt_courant),1) <> 'S' then
				delete from t_templatedate where ortho_id = :v_no_ortho and id_template = :pl_idtpl and tpldate = :ldt_courant;
				// Éliminer le template de l'horaire
				w_horaire_template.if_destroytpl(ldt_courant)
			end if
		next
	end if
end if
end subroutine

public function boolean uf_workday (date adt);choose case dayname(adt)
	case 'Sunday' 
		return false
	case 'Monday'
		return true
	case 'Tuesday'
		return true
	case 'Wednesday'
		return true
	case 'Thursday'
		return true
	case 'Friday'
		return true
	case 'Saturday'
		return false
end choose
end function

protected subroutine applyhebdo (long al_hnbsem, date adt_debut, date adt_fin, integer al_idtpl);integer i, li_occur
integer li_jour[7]
date ldt_courant

li_jour = {dw_periode.getItemNumber(1,'hdim'), &
			  dw_periode.getItemNumber(1,'hlun'), &
			  dw_periode.getItemNumber(1,'hmar'), &
			  dw_periode.getItemNumber(1,'hmer'), &
			  dw_periode.getItemNumber(1,'hjeu'), &
			  dw_periode.getItemNumber(1,'hven'), &
			  dw_periode.getItemNumber(1,'hsam')}

for i = 1 to 7
	if isNull(li_jour[i]) then li_jour[i] = 0
next

if rb_add.checked then
	if rb_pasfin.checked then
		li_occur = 365
		ldt_courant = adt_debut
		for i = 1 to li_occur
			if li_jour[daynumber(ldt_courant)] = 1 then
				insert into t_templatedate(ortho_id,id_template,tpldate) 
				values(:v_no_ortho,:al_idtpl,:ldt_courant);
				commit using SQLCA;
			end if
			
			if daynumber(ldt_courant) = 7 then
				ldt_courant = relativeDate(ldt_courant,7 * (al_hnbsem - 1) + 1)
			else
				ldt_courant = relativeDate(ldt_courant,1)
			end if
		next
	elseif rb_occur.checked then
		i = 0
		li_occur = integer(sle_nboccur.text)
		ldt_courant = adt_debut
		do while i < li_occur
			if li_jour[daynumber(ldt_courant)] = 1 then
				insert into t_templatedate(ortho_id,id_template,tpldate) 
				values(:v_no_ortho,:al_idtpl,:ldt_courant);
				commit using SQLCA;
				i++
			end if
			
			if daynumber(ldt_courant) = 7 then
				ldt_courant = relativeDate(ldt_courant,7 * (al_hnbsem - 1) + 1)
			else
				ldt_courant = relativeDate(ldt_courant,1)
			end if
		loop
	elseif rb_findate.checked then
		ldt_courant = adt_debut
		do while ldt_courant <= adt_fin
			if li_jour[daynumber(ldt_courant)] = 1 then
				insert into t_templatedate(ortho_id,id_template,tpldate) 
				values(:v_no_ortho,:al_idtpl,:ldt_courant);
				commit using SQLCA;
			end if
			if daynumber(ldt_courant) = 7 then
				ldt_courant = relativeDate(ldt_courant, 1 + (7 * (al_hnbsem - 1)))
			else
				ldt_courant = relativeDate(ldt_courant, 1)
			end if
		loop
	end if
elseif rb_del.checked then
	if rb_pasfin.checked then
		li_occur = 365
		ldt_courant = adt_debut
		for i = 1 to li_occur
			if li_jour[daynumber(ldt_courant)] = 1 then
				delete from t_templatedate where ortho_id = :v_no_ortho and id_template = :al_idtpl and tpldate = :ldt_courant;
				// Éliminer le template de l'horaire
				w_horaire_template.if_destroytpl(ldt_courant)
			end if
			
			if daynumber(ldt_courant) = 7 then
				ldt_courant = relativeDate(ldt_courant,7 * (al_hnbsem - 1) + 1)
			else
				ldt_courant = relativeDate(ldt_courant,1)
			end if
		next
	elseif rb_occur.checked then
		i = 0
		li_occur = integer(sle_nboccur.text)
		ldt_courant = adt_debut
		do while i < li_occur
			if li_jour[daynumber(ldt_courant)] = 1 then
				delete from t_templatedate where ortho_id = :v_no_ortho and id_template = :al_idtpl and tpldate = :ldt_courant;
				// Éliminer le template de l'horaire
				w_horaire_template.if_destroytpl(ldt_courant)
				i++
			end if
			
			if daynumber(ldt_courant) = 7 then
				ldt_courant = relativeDate(ldt_courant,7 * (al_hnbsem - 1) + 1)
			else
				ldt_courant = relativeDate(ldt_courant,1)
			end if
		loop
	elseif rb_findate.checked then
		ldt_courant = adt_debut
		do while ldt_courant <= adt_fin
			if li_jour[daynumber(ldt_courant)] = 1 then
				delete from t_templatedate where ortho_id = :v_no_ortho and id_template = :al_idtpl and tpldate = :ldt_courant;
				
				// Éliminer le template de l'horaire
				w_horaire_template.if_destroytpl(ldt_courant)
			end if
			if daynumber(ldt_courant) = 7 then
				ldt_courant = relativeDate(ldt_courant, 1 + (7 * (al_hnbsem - 1)))
			else
				ldt_courant = relativeDate(ldt_courant, 1)
			end if
		loop
	end if
end if
end subroutine

on w_hortplperiod.create
int iCurrent
call super::create
this.rb_del=create rb_del
this.rb_add=create rb_add
this.cb_3=create cb_3
this.cb_apply=create cb_apply
this.ddlb_fin=create ddlb_fin
this.ddlb_debut=create ddlb_debut
this.rb_findate=create rb_findate
this.sle_nboccur=create sle_nboccur
this.rb_occur=create rb_occur
this.rb_pasfin=create rb_pasfin
this.rb_ann=create rb_ann
this.rb_mens=create rb_mens
this.rb_hebdo=create rb_hebdo
this.rb_quot=create rb_quot
this.dw_tpl=create dw_tpl
this.cb_close=create cb_close
this.gb_1=create gb_1
this.gb_2=create gb_2
this.dw_periode=create dw_periode
this.gb_3=create gb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_del
this.Control[iCurrent+2]=this.rb_add
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_apply
this.Control[iCurrent+5]=this.ddlb_fin
this.Control[iCurrent+6]=this.ddlb_debut
this.Control[iCurrent+7]=this.rb_findate
this.Control[iCurrent+8]=this.sle_nboccur
this.Control[iCurrent+9]=this.rb_occur
this.Control[iCurrent+10]=this.rb_pasfin
this.Control[iCurrent+11]=this.rb_ann
this.Control[iCurrent+12]=this.rb_mens
this.Control[iCurrent+13]=this.rb_hebdo
this.Control[iCurrent+14]=this.rb_quot
this.Control[iCurrent+15]=this.dw_tpl
this.Control[iCurrent+16]=this.cb_close
this.Control[iCurrent+17]=this.gb_1
this.Control[iCurrent+18]=this.gb_2
this.Control[iCurrent+19]=this.dw_periode
this.Control[iCurrent+20]=this.gb_3
this.Control[iCurrent+21]=this.gb_4
end on

on w_hortplperiod.destroy
call super::destroy
destroy(this.rb_del)
destroy(this.rb_add)
destroy(this.cb_3)
destroy(this.cb_apply)
destroy(this.ddlb_fin)
destroy(this.ddlb_debut)
destroy(this.rb_findate)
destroy(this.sle_nboccur)
destroy(this.rb_occur)
destroy(this.rb_pasfin)
destroy(this.rb_ann)
destroy(this.rb_mens)
destroy(this.rb_hebdo)
destroy(this.rb_quot)
destroy(this.dw_tpl)
destroy(this.cb_close)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.dw_periode)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

type rb_del from radiobutton within w_hortplperiod
integer x = 558
integer y = 72
integer width = 475
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Effacer TPL"
end type

type rb_add from radiobutton within w_hortplperiod
integer x = 55
integer y = 72
integer width = 475
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ajouter TPL"
boolean checked = true
end type

type cb_3 from commandbutton within w_hortplperiod
integer x = 1472
integer y = 1916
integer width = 1413
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_apply from commandbutton within w_hortplperiod
integer x = 9
integer y = 1916
integer width = 1463
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Appliquer"
end type

event clicked;setPointer(hourglass!)
dw_periode.event ue_update()
f_applytpl()
end event

type ddlb_fin from dropdownlistbox within w_hortplperiod
integer x = 1509
integer y = 1708
integer width = 837
integer height = 304
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean allowedit = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.addItem(string(today()))
this.selectitem(1)
end event

type ddlb_debut from dropdownlistbox within w_hortplperiod
integer x = 1248
integer y = 1324
integer width = 791
integer height = 400
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean allowedit = true
borderstyle borderstyle = stylelowered!
end type

event constructor;ddlb_debut.additem(string(today()))
ddlb_debut.selectItem(1)

end event

type rb_findate from radiobutton within w_hortplperiod
integer x = 1248
integer y = 1720
integer width = 297
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fin le: "
boolean checked = true
end type

type sle_nboccur from singlelineedit within w_hortplperiod
integer x = 1595
integer y = 1580
integer width = 123
integer height = 92
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type rb_occur from radiobutton within w_hortplperiod
integer x = 1248
integer y = 1588
integer width = 800
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fin après         occurences"
end type

type rb_pasfin from radiobutton within w_hortplperiod
integer x = 1248
integer y = 1472
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pas de fin"
end type

type rb_ann from radiobutton within w_hortplperiod
integer x = 2990
integer y = 52
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Annuelle"
end type

event clicked;long ll_row

dw_periode.dataobject = 'd_tplpera'
dw_periode.setTransObject(SQLCA)
if dw_periode.retrieve(dw_tpl.getItemNumber(dw_tpl.getRow(),'id_template')) <= 0 then
	ll_row = dw_periode.insertRow(0)
	dw_periode.scrollToRow(ll_row)
	dw_periode.setItem(ll_row,'id_template',dw_tpl.getItemNumber(dw_tpl.getRow(),'id_template'))
else
	ll_row = dw_periode.getRow()
end if
dw_periode.setItem(ll_row,'typeperiod',4)
change = true
end event

type rb_mens from radiobutton within w_hortplperiod
integer x = 2455
integer y = 52
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mensuelle"
end type

event clicked;long ll_row

dw_periode.dataobject = 'd_tplperm'
dw_periode.setTransObject(SQLCA)
if dw_periode.retrieve(dw_tpl.getItemNumber(dw_tpl.getRow(),'id_template')) <= 0 then
	ll_row = dw_periode.insertRow(0)
	dw_periode.scrollToRow(ll_row)
	dw_periode.setItem(ll_row,'id_template',dw_tpl.getItemNumber(dw_tpl.getRow(),'id_template'))
else
	ll_row = dw_periode.getRow()
end if
dw_periode.setItem(ll_row,'typeperiod',3)
change = true
end event

type rb_hebdo from radiobutton within w_hortplperiod
integer x = 1842
integer y = 52
integer width = 462
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hebdomadaire"
end type

event clicked;long ll_row

dw_periode.dataobject = 'd_tplperh'
dw_periode.setTransObject(SQLCA)
if dw_periode.retrieve(dw_tpl.getItemNumber(dw_tpl.getRow(),'id_template')) = 0 then
	ll_row = dw_periode.insertRow(0)
	dw_periode.scrollToRow(ll_row)
	dw_periode.setItem(ll_row,'id_template',dw_tpl.getItemNumber(dw_tpl.getRow(),'id_template'))
else
	ll_row = dw_periode.getRow()
end if
dw_periode.setItem(ll_row,'typeperiod',2)
change = true
end event

type rb_quot from radiobutton within w_hortplperiod
integer x = 1294
integer y = 52
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Quotidienne"
boolean checked = true
end type

event clicked;long ll_row

dw_periode.dataobject = 'd_tplperq'
dw_periode.setTransObject(SQLCA)
if dw_periode.retrieve(dw_tpl.getItemNumber(dw_tpl.getRow(),'id_template')) <= 0 then
	ll_row = dw_periode.insertRow(0)
	dw_periode.scrollToRow(ll_row)
	dw_periode.setItem(ll_row,'id_template',dw_tpl.getItemNumber(dw_tpl.getRow(),'id_template'))
	dw_periode.setItem(ll_row,'typeperiod',1)
else
	ll_row = dw_periode.getRow()
end if
change = true
dw_periode.setItem(ll_row,'typeperiod',1)
end event

type dw_tpl from u_dw within w_hortplperiod
integer y = 196
integer width = 1184
integer height = 1712
integer taborder = 10
string title = "none"
string dataobject = "d_templliste"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;//setRowFocusIndicator(FocusRect!)
setTransObject(SQLCA)
retrieve(v_no_ortho)
setTabOrder("nomtpl", 0)
end event

event rowfocuschanged;long ll_typeperiod, ll_idtpl, ll_count

ll_idtpl = getItemNumber(currentrow,'id_template')
select count(*) into :ll_count from t_tplperiode where id_template = :ll_idtpl;
commit using SQLCA;
if ll_count > 0 then
	select typeperiod into :ll_typeperiod from t_tplperiode where id_template = :ll_idtpl;
	choose case ll_typeperiod
		CASE 1
			rb_quot.checked = true
			rb_quot.event clicked()
		CASE 2
			rb_hebdo.checked = true
			rb_hebdo.event clicked()
		CASE 3
			rb_mens.checked = true
			rb_mens.event clicked()
		CASE 4
			rb_ann.checked = true
			rb_ann.event clicked()
	end choose 
else
	rb_quot.checked = true
	rb_quot.event clicked()
end if
end event

type cb_close from commandbutton within w_hortplperiod
integer x = 2885
integer y = 1916
integer width = 731
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
if isvalid(w_horaire_template) then
	w_horaire_template.dw_templliste.event constructor()
	w_horaire_template.uo_caltpl.uf_InitCal(w_horaire_template.uo_caltpl.id_datetpl_selected)
	w_horaire_template.f_initrefresh()
end if
end event

type gb_1 from groupbox within w_hortplperiod
integer x = 1198
integer width = 2418
integer height = 152
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_hortplperiod
integer x = 1198
integer y = 1224
integer width = 1170
integer height = 656
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plage de périodicité"
end type

type dw_periode from u_dw within w_hortplperiod
event ue_update ( )
integer x = 1225
integer y = 232
integer width = 2359
integer height = 940
integer taborder = 20
string title = "none"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_update();if update() = 1 then
	commit using SQLCA;
	change = false
else
	rollback using SQLCA;
	error_type(50)
end if
end event

event editchanged;change = true
end event

event itemchanged;change = true
end event

type gb_3 from groupbox within w_hortplperiod
integer x = 1198
integer y = 160
integer width = 2418
integer height = 1032
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Périodicité"
end type

type gb_4 from groupbox within w_hortplperiod
integer width = 1193
integer height = 184
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Action"
end type

