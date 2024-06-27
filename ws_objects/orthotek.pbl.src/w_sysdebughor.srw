$PBExportHeader$w_sysdebughor.srw
forward
global type w_sysdebughor from window
end type
type cb_2 from commandbutton within w_sysdebughor
end type
type cb_close from commandbutton within w_sysdebughor
end type
type dw_syshor from datawindow within w_sysdebughor
end type
type cb_1 from commandbutton within w_sysdebughor
end type
end forward

global type w_sysdebughor from window
integer width = 3680
integer height = 2488
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_2 cb_2
cb_close cb_close
dw_syshor dw_syshor
cb_1 cb_1
end type
global w_sysdebughor w_sysdebughor

on w_sysdebughor.create
this.cb_2=create cb_2
this.cb_close=create cb_close
this.dw_syshor=create dw_syshor
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.cb_close,&
this.dw_syshor,&
this.cb_1}
end on

on w_sysdebughor.destroy
destroy(this.cb_2)
destroy(this.cb_close)
destroy(this.dw_syshor)
destroy(this.cb_1)
end on

type cb_2 from commandbutton within w_sysdebughor
integer x = 864
integer y = 2172
integer width = 795
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter RDV Horaire"
end type

type cb_close from commandbutton within w_sysdebughor
integer x = 2761
integer y = 2172
integer width = 864
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type dw_syshor from datawindow within w_sysdebughor
event ue_insert ( long al_orthoid,  date adt,  time at,  integer ai_col,  string as_patnom,  string as_err )
integer width = 3625
integer height = 2152
integer taborder = 10
string title = "syshor"
string dataobject = "d_syshor"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_insert(long al_orthoid, date adt, time at, integer ai_col, string as_patnom, string as_err);long ll_newrow

ll_newrow = insertrow(0)
setitem(ll_newrow,'ortho',al_orthoid)
setitem(ll_newrow,'datecal',adt)
setitem(ll_newrow,'heure',at)
setitem(ll_newrow,'col',ai_col)
setitem(ll_newrow,'patnom',as_patnom)
setitem(ll_newrow,'erreur',as_err)
end event

event constructor;SetTransObject(SQLCA)
end event

event buttonclicked;date ldt

ldt = getitemdate(row,'datecal')

if isvalid(w_horaire) = false then
	opensheetwithparm(w_horaire,string(ldt),w_principal,2,layered!)
	w_principal.SetMicroHelp('Grille horaire')
	w_horaire.title = "Horaire des rendez-vous"
end if

//w_horaire.uo_1.uf_InitCal(date(v_date))
//istr_cal.caldate = date(v_date)
//select hor_depart_pm,hor_aff_pm into :v_hor_depart_pm,:v_hor_aff_pm from t_options;
////	messagebox(string(v_hor_depart_pm) + ':00:00',v_heure)
//if time(v_heure) >= time(string(v_hor_depart_pm) + ':00:00') and v_hor_aff_pm = 1 then
//	w_horaire.rb_am.checked = false
//	w_horaire.rb_pm.checked = true
//	w_horaire.affichage_creation()
////	v_row = w_horaire.dw_hor.find("string(heure) = string(" + v_heure + ")",1,w_horaire.dw_hor.RowCount())
//	w_horaire.dw_hor.scrolltorow(v_row)
//else
//	w_horaire.rb_am.checked = true
//	w_horaire.rb_pm.checked = false
//	w_horaire.affichage_creation()
////	v_row = w_horaire.dw_hor.find("string(heure) = string(" + v_heure + ")",1,w_horaire.dw_hor.RowCount())
//	w_horaire.dw_hor.scrolltorow(v_row)
//end if
w_horaire.SetFocus()
end event

type cb_1 from commandbutton within w_sysdebughor
integer y = 2172
integer width = 864
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "RDV Debug"
end type

event clicked;integer i,li_horduree,li_col,li_step,li_duree,li_duree1,li_duree2,li_duree3,li_duree4,li_duree5,li_duree6,li_duree7,li_duree8,li_duree9,li_duree10
long ll_newrow,ll_ortho,ll_idpat,ll_idpat1,ll_idpat2,ll_idpat3,ll_idpat4,ll_idpat5,ll_idpat6,ll_idpat7,ll_idpat8,ll_idpat9,ll_idpat10
long ll_idtrait1,ll_idtrait2,ll_idtrait3,ll_idtrait4,ll_idtrait5,ll_idtrait6,ll_idtrait7,ll_idtrait8,ll_idtrait9,ll_idtrait10
string ls_patnom,ls_patnom1,ls_patnom2,ls_patnom3,ls_patnom4,ls_patnom5,ls_patnom6,ls_patnom7,ls_patnom8,ls_patnom9,ls_patnom10
date ldt
time lt,lt_heure

dw_syshor.reset()
select hor_step into :li_step from t_options where ortho_id = :v_no_ortho;

Declare syshor Cursor For
 
	SELECT horaire.no_ortho,
			 horaire.datecal,
          horaire.heure,
          horaire.patient_id_1,
          horaire.patient_id_2,
          horaire.patient_id_3,
          horaire.patient_id_4,   
          horaire.patient_id_5,
			 horaire.patient_id_6,
          horaire.patient_id_7,
          horaire.patient_id_8,
          horaire.patient_id_9,
          horaire.patient_id_10,
			 (select patient_nom + ' ' + patient_prenom from patient where patient_id = horaire.patient_id_1) as patnom1,
			 (select patient_nom + ' ' + patient_prenom from patient where patient_id = horaire.patient_id_2) as patnom2,
			 (select patient_nom + ' ' + patient_prenom from patient where patient_id = horaire.patient_id_3) as patnom3,
			 (select patient_nom + ' ' + patient_prenom from patient where patient_id = horaire.patient_id_4) as patnom4,
			 (select patient_nom + ' ' + patient_prenom from patient where patient_id = horaire.patient_id_5) as patnom5,
			 (select patient_nom + ' ' + patient_prenom from patient where patient_id = horaire.patient_id_6) as patnom6,
			 (select patient_nom + ' ' + patient_prenom from patient where patient_id = horaire.patient_id_7) as patnom7,
			 (select patient_nom + ' ' + patient_prenom from patient where patient_id = horaire.patient_id_8) as patnom8,
			 (select patient_nom + ' ' + patient_prenom from patient where patient_id = horaire.patient_id_9) as patnom9,
			 (select patient_nom + ' ' + patient_prenom from patient where patient_id = horaire.patient_id_10) as patnom10,
          horaire.duree1,
          horaire.duree2,
          horaire.duree3,
          horaire.duree4,
          horaire.duree5,
          horaire.duree6,
          horaire.duree7,
          horaire.duree8,
          horaire.duree9,
          horaire.duree10,
			 traitementid1,
			 traitementid2,
			 traitementid3,
			 traitementid4,
			 traitementid5,
			 traitementid6,
			 traitementid7,
			 traitementid8,
			 traitementid9,
			 traitementid10
	FROM	 horaire
	WHERE	 horaire.no_ortho = :v_no_ortho and
			 horaire.datecal >= today()
ORDER BY	 horaire.no_ortho ASC,
			 horaire.datecal ASC,
          horaire.heure ASC;
           			
OPEN syshor;
	Fetch syshor Into :ll_ortho,
							:ldt,
							:lt,
							:ll_idpat1,
			            :ll_idpat2,
			            :ll_idpat3,
			            :ll_idpat4,
			            :ll_idpat5,
			            :ll_idpat6,
							:ll_idpat7,
			            :ll_idpat8,
			            :ll_idpat9,
			            :ll_idpat10,
							:ls_patnom1,
							:ls_patnom2,
							:ls_patnom3,
							:ls_patnom4,
							:ls_patnom5,
							:ls_patnom6,
							:ls_patnom7,
							:ls_patnom8,
							:ls_patnom9,
							:ls_patnom10,
			            :li_duree1,
							:li_duree2,
			            :li_duree3,
			            :li_duree4,
			            :li_duree5,
			            :li_duree6,
			            :li_duree7,
			            :li_duree8,
			            :li_duree9,
			            :li_duree10,
							:ll_idtrait1,
							:ll_idtrait2,
							:ll_idtrait3,
							:ll_idtrait4,
							:ll_idtrait5,
							:ll_idtrait6,
							:ll_idtrait7,
							:ll_idtrait8,
							:ll_idtrait9,
							:ll_idtrait10;
Do While SQLCA.SQLCode = 0
	//1
	if ll_idpat1 > 0 and li_duree1 > 0 and ll_idpat1 <> 2110 then
		lt_heure = lt
		// vérification de la durée
		for i = 1 to li_duree1
			select patient_id_1 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
			if ll_idpat1 <> ll_idpat then
				// erreur duree
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,1,ls_patnom1,'duree trop courte')
			end if
			lt_heure = relativetime(lt,i * li_step * 60)
		next
		ll_idpat = 0
		select patient_id_1 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
		if ll_idpat1 = ll_idpat then
			// erreur duree
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,1,ls_patnom1,'duree trop longue')
		end if
		// verification ds t_rdv
		li_duree = 0
		select duree into :li_duree from t_rdv where patient_id = :ll_idpat1 and rdvdate = :ldt and rdvheure = :lt;
		if li_duree1 <> li_duree then
			// erreur t_rdv
			delete from t_rdv where patient_id = :ll_idpat1 and rdvdate = :ldt and rdvheure = :lt;
			insert into t_rdv(patient_id,typetraitid,rdvdate,rdvheure,duree,colonne,chrgduree) values (:ll_idpat1,:ll_idtrait1,:ldt,:lt,:li_duree1,1,:li_duree1);
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,1,ls_patnom1,'t_rdv duree corrige')
		end if
	end if
	//2
	if ll_idpat2 > 0 and li_duree2 > 0 and ll_idpat2 <> 2110 then
		lt_heure = lt
		// vérification de la durée
		for i = 1 to li_duree2
			select patient_id_2 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
			if ll_idpat2 <> ll_idpat then
				// erreur duree
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,2,ls_patnom2,'duree trop courte')
			end if
			lt_heure = relativetime(lt,i * li_step * 60)
		next
		ll_idpat = 0
		select patient_id_2 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
		if ll_idpat2 = ll_idpat then
			// erreur duree
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,2,ls_patnom2,'duree trop longue')
		end if
		// verification ds t_rdv
		li_duree = 0
		select duree into :li_duree from t_rdv where patient_id = :ll_idpat2 and rdvdate = :ldt and rdvheure = :lt;
		if li_duree2 <> li_duree then
			// erreur t_rdv
			delete from t_rdv where patient_id = :ll_idpat2 and rdvdate = :ldt and rdvheure = :lt;
			insert into t_rdv(patient_id,typetraitid,rdvdate,rdvheure,duree,colonne,chrgduree) values (:ll_idpat2,:ll_idtrait2,:ldt,:lt,:li_duree2,2,:li_duree10);
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,2,ls_patnom2,'t_rdv duree corrige')
		end if
	end if
	//3
	if ll_idpat3 > 0 and li_duree3 > 0 and ll_idpat3 <> 2110 then
		lt_heure = lt
		// vérification de la durée
		for i = 1 to li_duree3
//			if ll_idpat3 = 2370 then messagebox('test','')
			select patient_id_3 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
			if ll_idpat3 <> ll_idpat then
				// erreur duree
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,3,ls_patnom3,'duree trop courte')
			end if
			lt_heure = relativetime(lt,i * li_step * 60)
		next
		ll_idpat = 0
		select patient_id_3 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
		if ll_idpat3 = ll_idpat then
			// erreur duree
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,3,ls_patnom3,'duree trop longue')
		end if
		// verification ds t_rdv
		li_duree = 0
		select duree into :li_duree from t_rdv where patient_id = :ll_idpat3 and rdvdate = :ldt and rdvheure = :lt;
		if li_duree3 <> li_duree then
			// erreur t_rdv
			delete from t_rdv where patient_id = :ll_idpat3 and rdvdate = :ldt and rdvheure = :lt;
			insert into t_rdv(patient_id,typetraitid,rdvdate,rdvheure,duree,colonne,chrgduree) values (:ll_idpat3,:ll_idtrait3,:ldt,:lt,:li_duree3,3,:li_duree10);
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,3,ls_patnom3,'t_rdv duree corrige')
		end if
	end if
	//4
	if ll_idpat4 > 0 and li_duree4 > 0 and ll_idpat4 <> 2110 then
		lt_heure = lt
		// vérification de la durée
		for i = 1 to li_duree4
			select patient_id_4 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
			if ll_idpat4 <> ll_idpat then
				// erreur duree
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,4,ls_patnom4,'duree trop courte')
			end if
			lt_heure = relativetime(lt,i * li_step * 60)
		next
		ll_idpat = 0
		select patient_id_4 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
		if ll_idpat4 = ll_idpat then
			// erreur duree
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,4,ls_patnom4,'duree trop longue')
		end if
		// verification ds t_rdv
		li_duree = 0
		select duree into :li_duree from t_rdv where patient_id = :ll_idpat4 and rdvdate = :ldt and rdvheure = :lt;
		if li_duree4 <> li_duree then
			// erreur t_rdv
			delete from t_rdv where patient_id = :ll_idpat4 and rdvdate = :ldt and rdvheure = :lt;
			insert into t_rdv(patient_id,typetraitid,rdvdate,rdvheure,duree,colonne,chrgduree) values (:ll_idpat4,:ll_idtrait4,:ldt,:lt,:li_duree4,4,:li_duree4);
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,4,ls_patnom4,'t_rdv duree corrige')
		end if
	end if
	//5
	if ll_idpat5 > 0 and li_duree5 > 0 and ll_idpat5 <> 2110 then
		lt_heure = lt
		// vérification de la durée
		for i = 1 to li_duree5
			select patient_id_5 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
			if ll_idpat5 <> ll_idpat then
				// erreur duree
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,5,ls_patnom5,'duree trop courte')
			end if
			lt_heure = relativetime(lt,i * li_step * 60)
		next
		ll_idpat = 0
		select patient_id_5 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
		if ll_idpat5 = ll_idpat then
			// erreur duree
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,5,ls_patnom5,'duree trop longue')
		end if
		// verification ds t_rdv
		li_duree = 0
		select duree into :li_duree from t_rdv where patient_id = :ll_idpat5 and rdvdate = :ldt and rdvheure = :lt;
		if li_duree5 <> li_duree then
			// erreur t_rdv
			delete from t_rdv where patient_id = :ll_idpat5 and rdvdate = :ldt and rdvheure = :lt;
			insert into t_rdv(patient_id,typetraitid,rdvdate,rdvheure,duree,colonne,chrgduree) values (:ll_idpat5,:ll_idtrait5,:ldt,:lt,:li_duree5,5,:li_duree5);
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,5,ls_patnom5,'t_rdv duree corrige')
		end if
	end if
	//6
	if ll_idpat6 > 0 and li_duree6 > 0 and ll_idpat6 <> 2110 then
		lt_heure = lt
		// vérification de la durée
		for i = 1 to li_duree6
			select patient_id_6 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
			if not ll_idpat6 = ll_idpat then
				// erreur duree
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,6,ls_patnom6,'duree trop courte')
			end if
			lt_heure = relativetime(lt,i * li_step * 60)
		next
		ll_idpat = 0
		select patient_id_6 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
		if not ll_idpat6 <> ll_idpat then
			// erreur duree
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,6,ls_patnom6,'duree trop longue')
		end if
		// verification ds t_rdv
		li_duree = 0
		select duree into :li_duree from t_rdv where patient_id = :ll_idpat6 and rdvdate = :ldt and rdvheure = :lt;
		if not li_duree6 = li_duree then
			// erreur t_rdv
			delete from t_rdv where patient_id = :ll_idpat6 and rdvdate = :ldt and rdvheure = :lt;
			insert into t_rdv(patient_id,typetraitid,rdvdate,rdvheure,duree,colonne,chrgduree) values (:ll_idpat6,:ll_idtrait6,:ldt,:lt,:li_duree6,6,:li_duree6);
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,6,ls_patnom6,'t_rdv duree corrige')
		end if
	end if
	//7
	if ll_idpat7 > 0 and li_duree7 > 0 and ll_idpat7 <> 2110 then
		lt_heure = lt
		// vérification de la durée
		for i = 1 to li_duree7
			select patient_id_7 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
			if not ll_idpat7 = ll_idpat then
				// erreur duree
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,7,ls_patnom7,'duree trop courte')
			end if
			lt_heure = relativetime(lt,i * li_step * 60)
		next
		ll_idpat = 0
		select patient_id_7 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
		if not ll_idpat7 <> ll_idpat then
			// erreur duree
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,7,ls_patnom7,'duree trop longue')
		end if
		// verification ds t_rdv
		li_duree = 0
		select duree into :li_duree from t_rdv where patient_id = :ll_idpat7 and rdvdate = :ldt and rdvheure = :lt;
		if not li_duree7 = li_duree then
			// erreur t_rdv
			delete from t_rdv where patient_id = :ll_idpat7 and rdvdate = :ldt and rdvheure = :lt;
			insert into t_rdv(patient_id,typetraitid,rdvdate,rdvheure,duree,colonne,chrgduree) values (:ll_idpat7,:ll_idtrait7,:ldt,:lt,:li_duree7,7,:li_duree7);
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,7,ls_patnom7,'t_rdv duree corrige')
		end if
	end if
	//8
	if ll_idpat8 > 0 and li_duree8 > 0 and ll_idpat8 <> 2110 then
		lt_heure = lt
		// vérification de la durée
		for i = 1 to li_duree8
			select patient_id_8 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
			if not ll_idpat8 = ll_idpat then
				// erreur duree
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,8,ls_patnom8,'duree trop courte')
			end if
			lt_heure = relativetime(lt,i * li_step * 60)
		next
		ll_idpat = 0
		select patient_id_8 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
		if not ll_idpat8 <> ll_idpat then
			// erreur duree
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,8,ls_patnom8,'duree trop longue')
		end if
		// verification ds t_rdv
		li_duree = 0
		select duree into :li_duree from t_rdv where patient_id = :ll_idpat8 and rdvdate = :ldt and rdvheure = :lt;
		if not li_duree8 = li_duree then
			// erreur t_rdv
			delete from t_rdv where patient_id = :ll_idpat8 and rdvdate = :ldt and rdvheure = :lt;
			insert into t_rdv(patient_id,typetraitid,rdvdate,rdvheure,duree,colonne,chrgduree) values (:ll_idpat8,:ll_idtrait8,:ldt,:lt,:li_duree8,8,:li_duree8);
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,8,ls_patnom8,'t_rdv duree corrige')
		end if
	end if
	//9
	if ll_idpat9 > 0 and li_duree9 > 0 and ll_idpat9 <> 2110 then
		lt_heure = lt
		// vérification de la durée
		for i = 1 to li_duree9
			select patient_id_9 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
			if not ll_idpat9 = ll_idpat then
				// erreur duree
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,9,ls_patnom9,'duree trop courte')
			end if
			lt_heure = relativetime(lt,i * li_step * 60)
		next
		ll_idpat = 0
		select patient_id_9 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
		if not ll_idpat9 <> ll_idpat then
			// erreur duree
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,9,ls_patnom9,'duree trop longue')
		end if
		// verification ds t_rdv
		li_duree = 0
		select duree into :li_duree from t_rdv where patient_id = :ll_idpat9 and rdvdate = :ldt and rdvheure = :lt;
		if not li_duree9 = li_duree then
			// erreur t_rdv
			delete from t_rdv where patient_id = :ll_idpat9 and rdvdate = :ldt and rdvheure = :lt;
			insert into t_rdv(patient_id,typetraitid,rdvdate,rdvheure,duree,colonne,chrgduree) values (:ll_idpat9,:ll_idtrait9,:ldt,:lt,:li_duree9,9,:li_duree9);
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,9,ls_patnom9,'t_rdv duree corrige')
		end if
	end if
	//10
	if ll_idpat10 > 0 and li_duree10 > 0 and ll_idpat10 <> 2110 then
		lt_heure = lt
		// vérification de la durée
		for i = 1 to li_duree10
			select patient_id_10 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
			if not ll_idpat10 = ll_idpat then
				// erreur duree
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,10,ls_patnom10,'duree trop courte')
			end if
			lt_heure = relativetime(lt,i * li_step * 60)
		next
		ll_idpat = 0
		select patient_id_10 into :ll_idpat from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt_heure;
		if not ll_idpat10 <> ll_idpat then
			// erreur duree
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,10,ls_patnom10,'duree trop longue')
		end if
		// verification ds t_rdv
		li_duree = 0
		select duree into :li_duree from t_rdv where patient_id = :ll_idpat10 and rdvdate = :ldt and rdvheure = :lt;
		if not li_duree10 = li_duree then
			// erreur t_rdv
			delete from t_rdv where patient_id = :ll_idpat10 and rdvdate = :ldt and rdvheure = :lt;
			insert into t_rdv(patient_id,typetraitid,rdvdate,rdvheure,duree,colonne,chrgduree) values (:ll_idpat10,:ll_idtrait10,:ldt,:lt,:li_duree10,10,:li_duree10);
			dw_syshor.event ue_insert(ll_ortho,ldt,lt,10,ls_patnom10,'t_rdv duree corrige')
		end if
	end if
	Fetch syshor Into :ll_ortho,
							:ldt,
							:lt,
							:ll_idpat1,
			            :ll_idpat2,
			            :ll_idpat3,
			            :ll_idpat4,
			            :ll_idpat5,
			            :ll_idpat6,
							:ll_idpat7,
			            :ll_idpat8,
			            :ll_idpat9,
			            :ll_idpat10,
							:ls_patnom1,
							:ls_patnom2,
							:ls_patnom3,
							:ls_patnom4,
							:ls_patnom5,
							:ls_patnom6,
							:ls_patnom7,
							:ls_patnom8,
							:ls_patnom9,
							:ls_patnom10,
			            :li_duree1,
							:li_duree2,
			            :li_duree3,
			            :li_duree4,
			            :li_duree5,
			            :li_duree6,
			            :li_duree7,
			            :li_duree8,
			            :li_duree9,
			            :li_duree10,
							:ll_idtrait1,
							:ll_idtrait2,
							:ll_idtrait3,
							:ll_idtrait4,
							:ll_idtrait5,
							:ll_idtrait6,
							:ll_idtrait7,
							:ll_idtrait8,
							:ll_idtrait9,
							:ll_idtrait10;
Loop

CLOSE syshor;

// verification de la table t_rdv
Declare sysrdv Cursor For
 
	SELECT (select no_ortho from patient where patient.patient_id = t_rdv.patient_id) as ortho,
			 rdvdate,
			 rdvheure,
			 duree,
			 colonne,
			 patient_id,
			 (select patient_nom + ' ' + patient_prenom from patient where patient.patient_id = t_rdv.patient_id) as patnom
	FROM	 t_rdv
	WHERE	 t_rdv.rdvdate >= today() and
			 ((t_rdv.rdvetat <> 'm' and
			 t_rdv.rdvetat <> 'c' and
			 t_rdv.rdvetat <> 'b') 
			 or t_rdv.rdvetat is null)
ORDER BY	 t_rdv.rdvdate ASC,
          t_rdv.rdvheure ASC;
           			
OPEN sysrdv;
	Fetch sysrdv Into :ll_ortho,
							:ldt,
							:lt,
							:li_duree,
							:li_col,
							:ll_idpat,
							:ls_patnom;
							
Do While SQLCA.SQLCode = 0
	choose case li_col
		case 1
			ll_idpat1 = 0
			li_horduree = 0
			select patient_id_1,duree1 into :ll_idpat1,:li_horduree from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt;
			if ll_idpat1 <> ll_idpat then
				select patient_nom + ' ' + patient_prenom into :ls_patnom1 from patient where patient_id = :ll_idpat;
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom1,'t_rdv id pas identique')
			end if
			if li_horduree <> li_duree then
				select patient_nom + ' ' + patient_prenom into :ls_patnom1 from patient where patient_id = :ll_idpat;
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom1,'t_rdv duree pas identique')
			end if
		case 2
			ll_idpat2 = 0
			li_horduree = 0
			select patient_id_2,duree2 into :ll_idpat2,:li_horduree from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt;
			if not ll_idpat2 = ll_idpat then
				select patient_nom + ' ' + patient_prenom into :ls_patnom2 from patient where patient_id = :ll_idpat;
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom2,'t_rdv id pas identique')
			end if
			if not li_horduree = li_duree then
				select patient_nom + ' ' + patient_prenom into :ls_patnom2 from patient where patient_id = :ll_idpat;
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom2,'t_rdv duree pas identique')
			end if
		case 3
			ll_idpat3 = 0
			li_horduree = 0
			select patient_id_3,duree3 into :ll_idpat3,:li_horduree from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt;
			if not ll_idpat3 = ll_idpat then
				select patient_nom + ' ' + patient_prenom into :ls_patnom3 from patient where patient_id = :ll_idpat;

				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom3,'t_rdv id pas identique')
			end if
			if not li_horduree = li_duree then
				select patient_nom + ' ' + patient_prenom into :ls_patnom3 from patient where patient_id = :ll_idpat;

				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom3,'t_rdv duree pas identique')
			end if
		case 4
			ll_idpat4 = 0
			li_horduree = 0
			select patient_id_4,duree4 into :ll_idpat4,:li_horduree from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt;
			if not ll_idpat4 = ll_idpat then
				select patient_nom + ' ' + patient_prenom into :ls_patnom4 from patient where patient_id = :ll_idpat;

				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom4,'t_rdv id pas identique')
			end if
			if not li_horduree = li_duree then
				select patient_nom + ' ' + patient_prenom into :ls_patnom4 from patient where patient_id = :ll_idpat;

				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom4,'t_rdv duree pas identique')
			end if
		case 5
			ll_idpat5 = 0
			li_horduree = 0
			select patient_id_5,duree5 into :ll_idpat5,:li_horduree from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt;
			if not ll_idpat5 = ll_idpat then
				select patient_nom + ' ' + patient_prenom into :ls_patnom5 from patient where patient_id = :ll_idpat;

				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom5,'t_rdv id pas identique')
			end if
			if not li_horduree = li_duree then
				select patient_nom + ' ' + patient_prenom into :ls_patnom5 from patient where patient_id = :ll_idpat;

				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom5,'t_rdv duree pas identique')
			end if
		case 6
			ll_idpat6 = 0
			li_horduree = 0
			select patient_id_6,duree6 into :ll_idpat6,:li_horduree from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt;
			if not ll_idpat6 = ll_idpat then
				messagebox('',string(ll_idpat6) + '=' + string(ll_idpat))
				select patient_nom + ' ' + patient_prenom into :ls_patnom6 from patient where patient_id = :ll_idpat;
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom6,'t_rdv id pas identique')
			end if
			if not li_horduree = li_duree then
				select patient_nom + ' ' + patient_prenom into :ls_patnom6 from patient where patient_id = :ll_idpat;

				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom6,'t_rdv duree pas identique')
			end if
		case 7
			ll_idpat7 = 0
			li_horduree = 0
			select patient_id_7,duree7 into :ll_idpat7,:li_horduree from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt;
			if not ll_idpat7 = ll_idpat then
				select patient_nom + ' ' + patient_prenom into :ls_patnom7 from patient where patient_id = :ll_idpat;

				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom7,'t_rdv id pas identique')
			end if
			if not li_horduree = li_duree then
				select patient_nom + ' ' + patient_prenom into :ls_patnom7 from patient where patient_id = :ll_idpat;

				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom7,'t_rdv duree pas identique')
			end if
		case 8
			ll_idpat8 = 0
			li_horduree = 0
			select patient_id_8,duree8 into :ll_idpat8,:li_horduree from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt;
			if not ll_idpat8 = ll_idpat then
				select patient_nom + ' ' + patient_prenom into :ls_patnom8 from patient where patient_id = :ll_idpat;
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom8,'t_rdv id pas identique')
			end if
			if not li_horduree = li_duree then
				select patient_nom + ' ' + patient_prenom into :ls_patnom8 from patient where patient_id = :ll_idpat;
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom8,'t_rdv duree pas identique')
			end if
		case 9
			ll_idpat9 = 0
			li_horduree = 0
			select patient_id_9,duree9 into :ll_idpat9,:li_horduree from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt;
			if not ll_idpat9 = ll_idpat then
				select patient_nom + ' ' + patient_prenom into :ls_patnom9 from patient where patient_id = :ll_idpat;
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom9,'t_rdv id pas identique')
			end if
			if not li_horduree = li_duree then
				select patient_nom + ' ' + patient_prenom into :ls_patnom9 from patient where patient_id = :ll_idpat;
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom9,'t_rdv duree pas identique')
			end if
		case 10
			ll_idpat10 = 0
			li_horduree = 0
			select patient_id_10,duree10 into :ll_idpat10,:li_horduree from horaire where no_ortho = :ll_ortho and datecal = :ldt and heure = :lt;
			if not ll_idpat10 = ll_idpat then
				select patient_nom + ' ' + patient_prenom into :ls_patnom10 from patient where patient_id = :ll_idpat;
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom10,'t_rdv id pas identique')
			end if
			if not li_horduree = li_duree then
				select patient_nom + ' ' + patient_prenom into :ls_patnom10 from patient where patient_id = :ll_idpat;
				dw_syshor.event ue_insert(ll_ortho,ldt,lt,li_col,ls_patnom10,'t_rdv duree pas identique')
			end if
	end choose

	Fetch sysrdv Into :ll_ortho,
							:ldt,
							:lt,
							:li_duree,
							:li_col,
							:ll_idpat,
							:ls_patnom;
Loop

CLOSE sysrdv;
messagebox('Terminé','')
end event

