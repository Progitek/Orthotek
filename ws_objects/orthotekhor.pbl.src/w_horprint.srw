$PBExportHeader$w_horprint.srw
forward
global type w_horprint from window
end type
type cbx_col15 from checkbox within w_horprint
end type
type cbx_col14 from checkbox within w_horprint
end type
type cbx_col13 from checkbox within w_horprint
end type
type cbx_col12 from checkbox within w_horprint
end type
type cbx_col11 from checkbox within w_horprint
end type
type cbx_col10 from checkbox within w_horprint
end type
type cbx_col9 from checkbox within w_horprint
end type
type cbx_col8 from checkbox within w_horprint
end type
type cbx_col7 from checkbox within w_horprint
end type
type cbx_col6 from checkbox within w_horprint
end type
type cbx_col5 from checkbox within w_horprint
end type
type cbx_col4 from checkbox within w_horprint
end type
type cbx_col3 from checkbox within w_horprint
end type
type cbx_col2 from checkbox within w_horprint
end type
type cbx_col1 from checkbox within w_horprint
end type
type ddlb_tridet from u_ddlb within w_horprint
end type
type st_7 from statictext within w_horprint
end type
type ddlb_tri from u_ddlb within w_horprint
end type
type st_tri from statictext within w_horprint
end type
type st_4 from statictext within w_horprint
end type
type st_2 from statictext within w_horprint
end type
type em_endpm2 from editmask within w_horprint
end type
type em_startpm2 from editmask within w_horprint
end type
type em_endam2 from editmask within w_horprint
end type
type em_startam2 from editmask within w_horprint
end type
type st_6 from statictext within w_horprint
end type
type st_5 from statictext within w_horprint
end type
type cbx_hordetailfin from checkbox within w_horprint
end type
type st_3 from statictext within w_horprint
end type
type st_1 from statictext within w_horprint
end type
type em_endpm1 from editmask within w_horprint
end type
type em_startpm1 from editmask within w_horprint
end type
type em_endam1 from editmask within w_horprint
end type
type em_startam1 from editmask within w_horprint
end type
type cbx_hordetail from checkbox within w_horprint
end type
type cbx_hor from checkbox within w_horprint
end type
type cbx_tellist from checkbox within w_horprint
end type
type cb_3 from commandbutton within w_horprint
end type
type cb_2 from commandbutton within w_horprint
end type
type cb_ok from commandbutton within w_horprint
end type
type dw_horprint from datawindow within w_horprint
end type
end forward

global type w_horprint from window
integer width = 2281
integer height = 1540
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
string pointer = "Arrow!"
boolean center = true
event ue_ok ( )
event ue_cancel ( )
event ue_printer ( )
cbx_col15 cbx_col15
cbx_col14 cbx_col14
cbx_col13 cbx_col13
cbx_col12 cbx_col12
cbx_col11 cbx_col11
cbx_col10 cbx_col10
cbx_col9 cbx_col9
cbx_col8 cbx_col8
cbx_col7 cbx_col7
cbx_col6 cbx_col6
cbx_col5 cbx_col5
cbx_col4 cbx_col4
cbx_col3 cbx_col3
cbx_col2 cbx_col2
cbx_col1 cbx_col1
ddlb_tridet ddlb_tridet
st_7 st_7
ddlb_tri ddlb_tri
st_tri st_tri
st_4 st_4
st_2 st_2
em_endpm2 em_endpm2
em_startpm2 em_startpm2
em_endam2 em_endam2
em_startam2 em_startam2
st_6 st_6
st_5 st_5
cbx_hordetailfin cbx_hordetailfin
st_3 st_3
st_1 st_1
em_endpm1 em_endpm1
em_startpm1 em_startpm1
em_endam1 em_endam1
em_startam1 em_startam1
cbx_hordetail cbx_hordetail
cbx_hor cbx_hor
cbx_tellist cbx_tellist
cb_3 cb_3
cb_2 cb_2
cb_ok cb_ok
dw_horprint dw_horprint
end type
global w_horprint w_horprint

type variables
 string is_prntrs, is_sort = ""
 DataWindowChild dddw_printers
 private string is_serial
end variables

forward prototypes
public subroutine wf_print ()
public subroutine wf_set_printer ()
public subroutine wf_validnewdoss (ref datastore ads_horimp, ref datastore ads_horimp1, integer ai_nbcol)
public subroutine printhor2 ()
public function any of_filllistcol ()
end prototypes

event ue_ok();string ls_selectedtext
ls_selectedtext = ddlb_tri.text

IF ls_selectedtext = "Chair" THEN ls_selectedtext = "Chaise"

IF IsNull(ls_selectedtext) THEN ls_selectedtext = ""

is_sort = ls_selectedtext

// Appeller la fonction print d'une datawindow
wf_print()



Close(this)
end event

event ue_cancel();// Fermer la fenêtre

gi_qteimp = 0
Close(this)
end event

event ue_printer();// Setup de l'imprimante

if PrintSetup() = 1 then
	setnull(is_prntrs)
end if
wf_set_printer()
end event

public subroutine wf_print ();//////////////////////////////////
// Créé par : Éric Vézina
// Créé le  : 11/12/2003
// Demande  : Tous
// Version  : 7.6.8
// Modifié par:
//	Modifié le :
//////////////////////////////////

long j,nb_row,v_id_patient,v_option, ll_retour, ll_imphorlist, ll_horsharedid
integer li_copies,li_startam,li_endam,li_startpm,li_endpm,li_horcolnb,li_pos,li_horalpha,li_bac,li_bac1,li_bac2,li_bac3
string ls_dos,ls_printer
time lt_startam1,lt_endam1,lt_startpm1,lt_endpm1
time lt_startam2,lt_endam2,lt_startpm2,lt_endpm2
long v_traitement_id
int v_prochain_cpd, li_translate = 657 , li_hormodele
dec{2} ld_totfact, ld_totfactdu, ld_totpaie, ld_solde, ld_montantdu
string ls_c1,ls_c2,ls_c3,ls_c4,ls_c5,ls_c6,ls_c7,ls_c8,ls_c9,ls_c10,ls_c11,ls_c12,ls_c13,ls_c14,ls_c15, ls_typeimphor
n_listcol luo_listcol
long il_col[]

select modimphor, isnull(imphorlist,0), horshareid,isnull(hormodele,1) into :ls_typeimphor, :ll_imphorlist, :ll_horsharedid, :li_hormodele from t_options where ortho_id = :v_no_ortho;
if li_hormodele = 7 then li_hormodele = 6
ls_printer = dw_horprint.object.printer[1]
//choix du bac d'alimentation
li_bac = dw_horprint.object.bac[1]
select bac1,bac2,bac3 into :li_bac1,:li_bac2,:li_bac3 
from t_printers 
where pname = :ls_printer and serialnumber = :is_serial AND id_personnel = :gl_idpers;
if isnull(li_bac1) then li_bac1 = 1
if isnull(li_bac2) then li_bac2 = 1
if isnull(li_bac3) then li_bac3 = 1

//grille horaire
if cbx_hor.checked then
	
	if ls_typeimphor = 'B' then
		printhor2()
	elseif ls_typeimphor = 'C' then
		
		datastore ds_horimppays
		ds_horimppays = create datastore
		ds_horimppays.dataobject = "r_horimppaysage"
		ds_horimppays.SetTransObject(SQLCA)
		
		SELECT hor_depart_am,hor_depart_pm,hor_fin_am,hor_fin_pm,horcolnb,horcol1,horcol2,horcol3,horcol4,horcol5,horcol6 
		into :li_startam,:li_endam,:li_startpm,:li_endpm,:li_horcolnb,:ls_c1,:ls_c2,:ls_c3,:ls_c4,:ls_c5,:ls_c6
		from t_options where ortho_id = :ll_horsharedid;
		
		if v_langue = 'an' then
			ds_horimppays.object.t_squedfor.text = 'Schedule for:'
			if isnull(ls_c1) then 
				ds_horimppays.object.t_c1.text = 'Chair 1'
			else
				ds_horimppays.object.t_c1.text = ls_c1
			end if
			if isnull(ls_c2) then 
				ds_horimppays.object.t_c2.text = 'Chair 2'
			else
				ds_horimppays.object.t_c2.text = ls_c2
			end if
			if isnull(ls_c3) then 
				ds_horimppays.object.t_c3.text = 'Chair 3'
			else
				ds_horimppays.object.t_c3.text = ls_c3
			end if
			if isnull(ls_c4) then 
				ds_horimppays.object.t_c4.text = 'Chair 4'
			else
				ds_horimppays.object.t_c4.text = ls_c4
			end if
			if isnull(ls_c5) then 
				ds_horimppays.object.t_c5.text = 'Chair 5'
			else
				ds_horimppays.object.t_c5.text = ls_c5
			end if
			ds_horimppays.object.t_squedfor.text = 'Schedule for:'
			if isnull(ls_c6) then 
				ds_horimppays.object.t_c6.text = 'Chair 6'
			else
				ds_horimppays.object.t_c6.text = ls_c6
			end if
		end if
		
		lt_startam1 = time(em_startam1.text)
		lt_endam1 = time(em_endam1.text)
		lt_startpm1 = time(em_startpm1.text)
		lt_endpm1 = time(em_endpm1.text)
		lt_startam2 = time(em_startam2.text)
		if isnull(lt_startam2) then setnull(lt_startam2)
		lt_endam2 = time(em_endam2.text)
		if isnull(lt_endam2) then setnull(lt_endam2)
		lt_startpm2 = time(em_startpm2.text)
		if isnull(lt_startpm2) then setnull(lt_startpm2)
		lt_endpm2 = time(em_endpm2.text)
		if isnull(lt_endpm2) then setnull(lt_endpm2)
		// start - impression AM
		if ds_horimppays.retrieve(ll_horsharedid,istr_cal.caldate,lt_startam1,lt_endam1,lt_startam2,lt_endam2) > 0 then
			ds_horimppays.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
			//2007-08-07 Mathieu Gendron  Code décaler, le retrieve était pas encore fait
			//wf_validnewdoss(ds_horimp,ds_horimp1,li_horcolnb)
			// start - impression AM des colonnes > 5
			
			//2007-08-07 Mathieu Gendron  Code décaler, le retrieve était pas encore fait
//			wf_validnewdoss(ds_horimp,ds_horimp1,li_horcolnb)
			
			
			if dw_horprint.acceptText() = -1 then return
			li_copies = dw_horprint.object.copies[1]
			
			if li_copies > 0 then
				ds_horimppays.object.datawindow.print.copies = li_copies
				choose case li_bac
					case 1
						ds_horimppays.object.datawindow.print.Paper.Source = li_bac1
					case 2
						ds_horimppays.object.datawindow.print.Paper.Source = li_bac2
					case 3
						ds_horimppays.object.datawindow.print.Paper.Source = li_bac3
				end choose
			end if
			if ds_horimppays.print() <> 1 then
				error_type(52)
			end if
		end if
		// end - impression AM
		// start - impression PM
		if ds_horimppays.retrieve(ll_horsharedid,istr_cal.caldate,lt_startpm1,lt_endpm1,lt_startpm2,lt_endpm2) > 0 then
			ds_horimppays.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
//			wf_validnewdoss(ds_horimp,ds_horimp1,li_horcolnb)
			//print
			if dw_horprint.acceptText() = -1 then return
			li_copies = dw_horprint.object.copies[1]
			if li_copies > 0 then
				ds_horimppays.object.datawindow.print.copies = li_copies
			end if
			if ds_horimppays.print() <> 1 then
				error_type(52)
			end if
		end if
		// end - impression PM
		destroy ds_horimppays
		
		
	elseif ls_typeimphor = 'D' then
		
		datastore ds_horimppayslegal
		ds_horimppayslegal = create datastore
		ds_horimppayslegal.dataobject = "r_horimppaysagelegal"
		ds_horimppayslegal.SetTransObject(SQLCA)
		
		SELECT hor_depart_am,hor_depart_pm,hor_fin_am,hor_fin_pm,horcolnb,isnull(horcol1,'Chaise 1'),
				 isnull(horcol2,'Chaise 2'),isnull(horcol3,'Chaise 3'),isnull(horcol4,'Chaise 4'),
				 isnull(horcol5,'Chaise 5'),isnull(horcol6,'Chaise 6'),isnull(horcol7,'Chaise 7'),
				 isnull(horcol8,'Chaise 8') 
		into :li_startam,:li_endam,:li_startpm,:li_endpm,:li_horcolnb,:ls_c1,:ls_c2,:ls_c3,:ls_c4,:ls_c5,:ls_c6,:ls_c7,:ls_c8
		from t_options where ortho_id = :ll_horsharedid;
		
		if v_langue = 'an' then
			ds_horimppayslegal.object.t_squedfor.text = 'Schedule for:'
		end if
		
		ds_horimppayslegal.object.t_c1.text = ls_c1
		ds_horimppayslegal.object.t_c2.text = ls_c2
		ds_horimppayslegal.object.t_c3.text = ls_c3
		ds_horimppayslegal.object.t_c4.text = ls_c4
		ds_horimppayslegal.object.t_c5.text = ls_c5
		ds_horimppayslegal.object.t_c6.text = ls_c6
		ds_horimppayslegal.object.t_c7.text = ls_c7
		ds_horimppayslegal.object.t_c8.text = ls_c8
		
		lt_startam1 = time(em_startam1.text)
		lt_endam1 = time(em_endam1.text)
		lt_startpm1 = time(em_startpm1.text)
		lt_endpm1 = time(em_endpm1.text)
		lt_startam2 = time(em_startam2.text)
		if isnull(lt_startam2) then setnull(lt_startam2)
		lt_endam2 = time(em_endam2.text)
		if isnull(lt_endam2) then setnull(lt_endam2)
		lt_startpm2 = time(em_startpm2.text)
		if isnull(lt_startpm2) then setnull(lt_startpm2)
		lt_endpm2 = time(em_endpm2.text)
		if isnull(lt_endpm2) then setnull(lt_endpm2)
		// start - impression AM
		if ds_horimppayslegal.retrieve(ll_horsharedid,istr_cal.caldate,lt_startam1,lt_endam1,lt_startam2,lt_endam2) > 0 then
			ds_horimppayslegal.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
			//2007-08-07 Mathieu Gendron  Code décaler, le retrieve était pas encore fait
			//wf_validnewdoss(ds_horimp,ds_horimp1,li_horcolnb)
			// start - impression AM des colonnes > 5
			
			//2007-08-07 Mathieu Gendron  Code décaler, le retrieve était pas encore fait
//			wf_validnewdoss(ds_horimp,ds_horimp1,li_horcolnb)
			
			
			if dw_horprint.acceptText() = -1 then return
			li_copies = dw_horprint.object.copies[1]
			
			if li_copies > 0 then
				ds_horimppayslegal.object.datawindow.print.copies = li_copies
				choose case li_bac
					case 1
						ds_horimppayslegal.object.datawindow.print.Paper.Source = li_bac1
					case 2
						ds_horimppayslegal.object.datawindow.print.Paper.Source = li_bac2
					case 3
						ds_horimppayslegal.object.datawindow.print.Paper.Source = li_bac3
				end choose
			end if
			if ds_horimppayslegal.print() <> 1 then
				error_type(52)
			end if
		end if
		// end - impression AM
		// start - impression PM
		if ds_horimppayslegal.retrieve(ll_horsharedid,istr_cal.caldate,lt_startpm1,lt_endpm1,lt_startpm2,lt_endpm2) > 0 then
			ds_horimppayslegal.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
//			wf_validnewdoss(ds_horimp,ds_horimp1,li_horcolnb)
			//print
			if dw_horprint.acceptText() = -1 then return
			li_copies = dw_horprint.object.copies[1]
			if li_copies > 0 then
				ds_horimppayslegal.object.datawindow.print.copies = li_copies
			end if
			if ds_horimppayslegal.print() <> 1 then
				error_type(52)
			end if
		end if
		// end - impression PM
		destroy ds_horimppayslegal
		
	else
//		datastore ds_horimp
//		ds_horimp = create datastore
//		ds_horimp.dataobject = "r_horimp"
//		datastore ds_horimp1
//		ds_horimp.SetTransObject(SQLCA)
//		ds_horimp1 = create datastore
//		if li_hormodele = 2 then
//			ds_horimp1.dataobject = "r_horimp1a"
//		else
//			ds_horimp1.dataobject = "r_horimp1"
//		end if
//		
		
		datastore ds_horimp
		ds_horimp = create datastore
		if li_hormodele = 5 or li_hormodele = 6 then
			ds_horimp.dataobject = "r_horimp12"
	   else
			ds_horimp.dataobject = "r_horimp"
		end if
		ds_horimp.SetTransObject(SQLCA)
		
		datastore ds_horimp1
		ds_horimp1 = create datastore
		
		choose case li_hormodele
			case 2 
				ds_horimp1.dataobject = "r_horimp1a"
			case 5, 6
				ds_horimp1.dataobject = "r_horimp12a"
			case else
				ds_horimp1.dataobject = "r_horimp1"
		end choose
		
		ds_horimp1.SetTransObject(SQLCA)
		
		datastore ds_horimp2
		ds_horimp2 = create datastore
		ds_horimp2.dataobject = "r_horimp12b"
		ds_horimp2.SetTransObject(SQLCA)
		
		SELECT hor_depart_am,hor_depart_pm,hor_fin_am,hor_fin_pm,horcolnb,horcol1,horcol2,horcol3,horcol4,horcol5,horcol6,horcol7,horcol8,horcol9,horcol10,horcol11,horcol12,horcol13,horcol14,horcol15
		into :li_startam,:li_endam,:li_startpm,:li_endpm,:li_horcolnb,:ls_c1,:ls_c2,:ls_c3,:ls_c4,:ls_c5,:ls_c6,:ls_c7,:ls_c8,:ls_c9,:ls_c10,:ls_c11,:ls_c12,:ls_c13,:ls_c14,:ls_c15 
		from t_options where ortho_id = :ll_horsharedid;
		
		if v_langue = 'an' then
			ds_horimp.object.t_squedfor.text = 'Schedule for:'
			if isnull(ls_c1) then 
				ds_horimp.object.t_c1.text = 'Chair 1'
			else
				ds_horimp.object.t_c1.text = ls_c1
			end if
			if isnull(ls_c2) then 
				ds_horimp.object.t_c2.text = 'Chair 2'
			else
				ds_horimp.object.t_c2.text = ls_c2
			end if
			if isnull(ls_c3) then 
				ds_horimp.object.t_c3.text = 'Chair 3'
			else
				ds_horimp.object.t_c3.text = ls_c3
			end if
			if isnull(ls_c4) then 
				ds_horimp.object.t_c4.text = 'Chair 4'
			else
				ds_horimp.object.t_c4.text = ls_c4
			end if
			if isnull(ls_c5) then 
				ds_horimp.object.t_c5.text = 'Chair 5'
			else
				ds_horimp.object.t_c5.text = ls_c5
			end if
			ds_horimp1.object.t_squedfor.text = 'Schedule for:'
			if isnull(ls_c6) then 
				ds_horimp1.object.t_c6.text = 'Chair 6'
			else
				ds_horimp1.object.t_c6.text = ls_c6
			end if
			if isnull(ls_c7) then 
				ds_horimp1.object.t_c7.text = 'Chair 7'
			else
				ds_horimp1.object.t_c7.text = ls_c7
			end if
			if isnull(ls_c8) then 
				ds_horimp1.object.t_c8.text = 'Chair 8'
			else
				ds_horimp1.object.t_c8.text = ls_c8
			end if
			if isnull(ls_c9) then 
				ds_horimp1.object.t_c9.text = 'Chair 9'
			else
				ds_horimp1.object.t_c9.text = ls_c9
			end if
			if isnull(ls_c10) then 
				ds_horimp1.object.t_c10.text = 'Chair 10'
			else
				ds_horimp1.object.t_c10.text = ls_c10
			end if
			
			/*
			if isnull(ls_c11) then 
				ds_horimp2.object.t_c11.text = 'Chair 11'
			else
				ds_horimp2.object.t_c11.text = ls_c11
			end if
			if isnull(ls_c12) then 
				ds_horimp2.object.t_c12.text = 'Chair 12'
			else
				ds_horimp2.object.t_c12.text = ls_c12
			end if
			if isnull(ls_c13) then 
				ds_horimp2.object.t_c13.text = 'Chair 13'
			else
				ds_horimp2.object.t_c13.text = ls_c13
			end if
			if isnull(ls_c14) then 
				ds_horimp2.object.t_c14.text = 'Chair 14'
			else
				ds_horimp2.object.t_c14.text = ls_c14
			end if
			if isnull(ls_c15) then 
				ds_horimp2.object.t_c15.text = 'Chair 15'
			else
				ds_horimp2.object.t_c15.text = ls_c15
			end if
			*/
		end if
		
		lt_startam1 = time(em_startam1.text)
		lt_endam1 = time(em_endam1.text)
		lt_startpm1 = time(em_startpm1.text)
		lt_endpm1 = time(em_endpm1.text)
		lt_startam2 = time(em_startam2.text)
		if isnull(lt_startam2) then setnull(lt_startam2)
		lt_endam2 = time(em_endam2.text)
		if isnull(lt_endam2) then setnull(lt_endam2)
		lt_startpm2 = time(em_startpm2.text)
		if isnull(lt_startpm2) then setnull(lt_startpm2)
		lt_endpm2 = time(em_endpm2.text)
		if isnull(lt_endpm2) then setnull(lt_endpm2)
		// start - impression AM
		if ds_horimp.retrieve(ll_horsharedid,istr_cal.caldate,lt_startam1,lt_endam1,lt_startam2,lt_endam2) > 0 then
			ds_horimp.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
			//2007-08-07 Mathieu Gendron  Code décaler, le retrieve était pas encore fait
			//wf_validnewdoss(ds_horimp,ds_horimp1,li_horcolnb)
			// start - impression AM des colonnes > 5
			if li_horcolnb > 5 then
				ds_horimp1.retrieve(ll_horsharedid,istr_cal.caldate,lt_startam1,lt_endam1,lt_startam2,lt_endam2)
				ds_horimp1.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
				choose case li_horcolnb
					case 6
						li_pos = integer(ds_horimp1.object.l_12a.X2)
						ds_horimp1.object.l_12a.X2 = string(li_pos - (li_translate * 4))
						li_pos = integer(ds_horimp1.object.l_1.X2)
						ds_horimp1.object.l_1.X2 = string(li_pos - (li_translate * 4))
						li_pos = integer(ds_horimp1.object.l_2.X2)
						ds_horimp1.object.l_2.X2 = string(li_pos - (li_translate * 4))
						ds_horimp1.object.compute_7.visible = false
						ds_horimp1.object.compute_8.visible = false
						ds_horimp1.object.compute_9.visible = false
						ds_horimp1.object.compute_10.visible = false
						
						ds_horimp1.object.c7.visible = false
						ds_horimp1.object.c8.visible = false
						ds_horimp1.object.c9.visible = false
						ds_horimp1.object.c10.visible = false
						
						
						ds_horimp1.object.l_8a.visible = false
						ds_horimp1.object.l_9a.visible = false
						ds_horimp1.object.l_10a.visible = false
						ds_horimp1.object.l_11a.visible = false
						ds_horimp1.object.l_12a.visible = false
						ds_horimp1.object.t_c7.visible = false
						ds_horimp1.object.t_c8.visible = false
						ds_horimp1.object.t_c9.visible = false
						ds_horimp1.object.t_c10.visible = false
						
						if ds_horimp1.dataobject = "r_horimp1a" then
							ds_horimp1.object.compute_11.visible = false
							ds_horimp1.object.c11.visible = false
							ds_horimp1.object.t_c11.visible = false
						end if
					case 7
						li_pos = integer(ds_horimp1.object.l_12a.X2)
						ds_horimp1.object.l_12a.X2 = string(li_pos - (li_translate * 3))
						li_pos = integer(ds_horimp1.object.l_1.X2)
						ds_horimp1.object.l_1.X2 = string(li_pos - (li_translate * 3))
						li_pos = integer(ds_horimp1.object.l_2.X2)
						ds_horimp1.object.l_2.X2 = string(li_pos - (li_translate * 3))
	//					ds_horimp1.object.compute_7.visible = false
						ds_horimp1.object.compute_8.visible = false
						ds_horimp1.object.compute_9.visible = false
						ds_horimp1.object.compute_10.visible = false
	//					ds_horimp1.object.compute_11.visible = false
	//					ds_horimp1.object.c7.visible = false
						ds_horimp1.object.c8.visible = false
						ds_horimp1.object.c9.visible = false
						ds_horimp1.object.c10.visible = false
	//					ds_horimp1.object.l_8a.visible = false
						ds_horimp1.object.l_9a.visible = false
						ds_horimp1.object.l_10a.visible = false
						ds_horimp1.object.l_11a.visible = false
						ds_horimp1.object.l_12a.visible = false
	//					ds_horimp1.object.t_c7.visible = false
						ds_horimp1.object.t_c8.visible = false
						ds_horimp1.object.t_c9.visible = false
						ds_horimp1.object.t_c10.visible = false
//						ds_horimp1.object.t_c11.visible = false
						if ds_horimp1.dataobject = "r_horimp1a" then
							ds_horimp1.object.compute_11.visible = false
							ds_horimp1.object.c11.visible = false
							ds_horimp1.object.t_c11.visible = false
						end if
					case 8
						li_pos = integer(ds_horimp1.object.l_12a.X2)
						ds_horimp1.object.l_12a.X2 = string(li_pos - (li_translate * 2))
						li_pos = integer(ds_horimp1.object.l_1.X2)
						ds_horimp1.object.l_1.X2 = string(li_pos - (li_translate * 2))
						li_pos = integer(ds_horimp1.object.l_2.X2)
						ds_horimp1.object.l_2.X2 = string(li_pos - (li_translate * 2))
	//					ds_horimp1.object.compute_7.visible = false
	//					ds_horimp1.object.compute_8.visible = false
						ds_horimp1.object.compute_9.visible = false
						ds_horimp1.object.compute_10.visible = false
	//					ds_horimp1.object.compute_11.visible = false
	//					ds_horimp1.object.c7.visible = false
	//					ds_horimp1.object.c8.visible = false
						ds_horimp1.object.c9.visible = false
						ds_horimp1.object.c10.visible = false
	//					ds_horimp1.object.l_8a.visible = false
	//					ds_horimp1.object.l_9a.visible = false
						ds_horimp1.object.l_10a.visible = false
						ds_horimp1.object.l_11a.visible = false
						ds_horimp1.object.l_12a.visible = false
	//					ds_horimp1.object.t_c7.visible = false
	//					ds_horimp1.object.t_c8.visible = false
						ds_horimp1.object.t_c9.visible = false
						ds_horimp1.object.t_c10.visible = false
	//					ds_horimp1.object.t_c11.visible = false
						if ds_horimp1.dataobject = "r_horimp1a" then
							ds_horimp1.object.compute_11.visible = false
							ds_horimp1.object.c11.visible = false
							ds_horimp1.object.t_c11.visible = false
						end if
					case 9
						li_pos = integer(ds_horimp1.object.l_12a.X2)
						ds_horimp1.object.l_12a.X2 = string(li_pos - (li_translate * 1))
						li_pos = integer(ds_horimp1.object.l_1.X2)
						ds_horimp1.object.l_1.X2 = string(li_pos - (li_translate * 1))
						li_pos = integer(ds_horimp1.object.l_2.X2)
						ds_horimp1.object.l_2.X2 = string(li_pos - (li_translate * 1))
	//					ds_horimp1.object.compute_7.visible = false
	//					ds_horimp1.object.compute_8.visible = false
	//					ds_horimp1.object.compute_9.visible = false
						ds_horimp1.object.compute_10.visible = false
	//					ds_horimp1.object.compute_11.visible = false
	//					ds_horimp1.object.c7.visible = false
	//					ds_horimp1.object.c8.visible = false
	//					ds_horimp1.object.c9.visible = false
						ds_horimp1.object.c10.visible = false
	//					ds_horimp1.object.c11.visible = false
	//					ds_horimp1.object.l_8a.visible = false
	//					ds_horimp1.object.l_9a.visible = false
	//					ds_horimp1.object.l_10a.visible = false
						ds_horimp1.object.l_11a.visible = false
						ds_horimp1.object.l_12a.visible = false
						ds_horimp1.object.t_c7.visible = false
	//					ds_horimp1.object.t_c8.visible = false
	//					ds_horimp1.object.t_c9.visible = false
	//					ds_horimp1.object.t_c10.visible = false
						if ds_horimp1.dataobject = "r_horimp1a" then
							ds_horimp1.object.compute_11.visible = false
							ds_horimp1.object.c11.visible = false
							ds_horimp1.object.t_c11.visible = false
						end if
					case 10
						li_pos = integer(ds_horimp1.object.l_12a.X2)
						ds_horimp1.object.l_12a.X2 = string(li_pos - (li_translate * 1))
						li_pos = integer(ds_horimp1.object.l_1.X2)
						ds_horimp1.object.l_1.X2 = string(li_pos - (li_translate * 1))
						li_pos = integer(ds_horimp1.object.l_2.X2)
						ds_horimp1.object.l_2.X2 = string(li_pos - (li_translate * 1))
	//					ds_horimp1.object.compute_7.visible = false
	//					ds_horimp1.object.compute_8.visible = false
	//					ds_horimp1.object.compute_9.visible = false
//						ds_horimp1.object.compute_10.visible = false
//						ds_horimp1.object.compute_11.visible = false
	//					ds_horimp1.object.c7.visible = false
	//					ds_horimp1.object.c8.visible = false
	//					ds_horimp1.object.c9.visible = false
//						ds_horimp1.object.c10.visible = false
//						ds_horimp1.object.c11.visible = false
	//					ds_horimp1.object.l_8a.visible = false
	//					ds_horimp1.object.l_9a.visible = false
	//					ds_horimp1.object.l_10a.visible = false
						ds_horimp1.object.l_11a.visible = false
						ds_horimp1.object.l_12a.visible = false
						ds_horimp1.object.t_c7.visible = false
	//					ds_horimp1.object.t_c8.visible = false
	//					ds_horimp1.object.t_c9.visible = false
	//					ds_horimp1.object.t_c10.visible = false
						if ds_horimp1.dataobject = "r_horimp1a" then
							ds_horimp1.object.compute_11.visible = false
							ds_horimp1.object.c11.visible = false
							ds_horimp1.object.t_c11.visible = false
						end if
				end choose
			end if
			// end - impression des colonnes > 5
			
			if li_hormodele = 6 then
				ds_horimp2.retrieve(ll_horsharedid,istr_cal.caldate,lt_startam1,lt_endam1,lt_startam2,lt_endam2)
				ds_horimp2.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
			end if
			
			
			//print
			
			//2007-08-07 Mathieu Gendron  Code décaler, le retrieve était pas encore fait
			wf_validnewdoss(ds_horimp,ds_horimp1,li_horcolnb)
			
			
			if dw_horprint.acceptText() = -1 then return
			li_copies = dw_horprint.object.copies[1]
			
			if li_copies > 0 then
				ds_horimp.object.datawindow.print.copies = li_copies
				choose case li_bac
					case 1
						ds_horimp.object.datawindow.print.Paper.Source = li_bac1
					case 2
						ds_horimp.object.datawindow.print.Paper.Source = li_bac2
					case 3
						ds_horimp.object.datawindow.print.Paper.Source = li_bac3
				end choose
			end if
			if ds_horimp.print() <> 1 then
				error_type(52)
			end if
			if li_horcolnb > 5 then
				if li_copies > 0 then
					ds_horimp1.object.datawindow.print.copies = li_copies
					choose case li_bac
						case 1
							ds_horimp1.object.datawindow.print.Paper.Source = li_bac1
						case 2
							ds_horimp1.object.datawindow.print.Paper.Source = li_bac2
						case 3
							ds_horimp1.object.datawindow.print.Paper.Source = li_bac3
					end choose
				end if
				if ds_horimp1.print() <> 1 then
					error_type(52)
				end if
			end if
			
			if li_hormodele = 6 then
				if li_copies > 0 then
					ds_horimp2.object.datawindow.print.copies = li_copies
					choose case li_bac
						case 1
							ds_horimp2.object.datawindow.print.Paper.Source = li_bac1
						case 2
							ds_horimp2.object.datawindow.print.Paper.Source = li_bac2
						case 3
							ds_horimp2.object.datawindow.print.Paper.Source = li_bac3
					end choose
				end if
				if ds_horimp2.print() <> 1 then
					error_type(52)
				end if
			end if
			
		end if
		// end - impression AM
		// start - impression PM
		if ds_horimp.retrieve(ll_horsharedid,istr_cal.caldate,lt_startpm1,lt_endpm1,lt_startpm2,lt_endpm2) > 0 then
			ds_horimp.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
			wf_validnewdoss(ds_horimp,ds_horimp1,li_horcolnb)
			// start - impression PM des colonnes > 5
			if li_horcolnb > 5 then
				ds_horimp1.retrieve(ll_horsharedid,istr_cal.caldate,lt_startpm1,lt_endpm1,lt_startpm2,lt_endpm2)
				ds_horimp1.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
			end if
			if li_hormodele = 6 then
				ds_horimp2.retrieve(ll_horsharedid,istr_cal.caldate,lt_startpm1,lt_endpm1,lt_startpm2,lt_endpm2)
				ds_horimp2.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
			end if
			// end - impression PM des colonnes > 5
			//print
			if dw_horprint.acceptText() = -1 then return
			li_copies = dw_horprint.object.copies[1]
			if li_copies > 0 then
				ds_horimp.object.datawindow.print.copies = li_copies
			end if
			if ds_horimp.print() <> 1 then
				error_type(52)
			end if
			if li_horcolnb > 5 then
				if li_copies > 0 then
					ds_horimp1.object.datawindow.print.copies = li_copies
				end if
				if ds_horimp1.print() <> 1 then
					error_type(52)
				end if
			end if
			if li_hormodele = 6 then
				if li_copies > 0 then
					ds_horimp2.object.datawindow.print.copies = li_copies
				end if
				if ds_horimp2.print() <> 1 then
					error_type(52)
				end if
			end if
			
		end if
		// end - impression PM
		destroy ds_horimp1
		destroy ds_horimp
		destroy ds_horimp2
	end if
end if

//liste telephonique
if cbx_tellist.checked then
	datastore ds_imp_patient
	ds_imp_patient = create datastore
	ds_imp_patient.dataobject = "r_imp_patient"
	if v_langue = 'an' then
		ds_imp_patient.modify("compute_3.expression = '~"PHONE LIST FOR : ~" + ortho_id_dr_nom_complet'")
		ds_imp_patient.object.t_chair.text = 'Chair'
		ds_imp_patient.object.t_patname.text = 'Patient name'
		ds_imp_patient.object.t_mothername.text = 'Mother name:'
		ds_imp_patient.object.t_fathername.text = 'Father name:'
		ds_imp_patient.object.t_telbur.text = 'Office phone:'
		ds_imp_patient.object.t_telmais.text = 'Home phone:'
		ds_imp_patient.object.t_telcell.text = 'Cell. phone:'
		ds_imp_patient.object.t_telautre.text = 'Other phone:'
		ds_imp_patient.object.t_nodoss.text = 'File #'
		ds_imp_patient.object.t_langue.text = 'Language:'
		ds_imp_patient.object.t_printedon.text = 'Printed on'
		ds_imp_patient.object.t_genre.text = "Gender:"
		ds_imp_patient.object.t_age.text = "Age:"
		ds_imp_patient.object.t_alerte.text = "Medical alert:"
		ds_imp_patient.object.t_memo.text = "Memo"
	end if
	
	ds_imp_patient.SetTransObject(SQLCA)
	IF is_sort = "Heure" OR is_sort = "Hour" THEN
		ll_retour = ds_imp_patient.SetSort("horaire_patient_id_heure_rv asc, horaire_patient_id_no_chaise asc")
		ds_imp_patient.sort()
	END IF
	
	delete from horaire_patient_id;
	il_col = of_filllistcol()
	luo_listcol.of_setcol(il_col)
	w_horaire.implistetel(luo_listcol)
	
	
	ds_imp_patient.retrieve(ll_horsharedid)
	nb_row = ds_imp_patient.rowcount()
	for j = 1 to nb_row
		v_id_patient = ds_imp_patient.getitemnumber(j,"patient_patient_id")
		Select max(traitement_id) into :v_traitement_id from traitements where patient_id = :v_id_patient;
		if isnull(v_traitement_id) = false then
			Select count(*) into :v_prochain_cpd from cheques_postdates where traitement_patient_id = :v_traitement_id and date_cheque > today();
			if v_prochain_cpd > 0 then
				ds_imp_patient.SetItem(j,"patient_couleur_postdate",rgb(255,255,255))
			else
				Select sum(montant) into :ld_totfact from factures_traitements where traitement_id = :v_traitement_id;
				if isnull(ld_totfact) then ld_totfact = 0
				Select sum(montant) into :ld_totfactdu from factures_traitements where traitement_id = :v_traitement_id and date_facture <= today();
				if isnull(ld_totfactdu) then ld_totfactdu = 0
				select sum(montant_recu) into :ld_totpaie from paiement where traitement_patient_id = :v_traitement_id;
				if isnull(ld_totpaie) then ld_totpaie = 0
				ld_solde = ld_totfact - ld_totpaie
				ld_montantdu = ld_totfactdu - ld_totpaie
				if ld_montantdu > 0 and ld_solde > 0 then
					ds_imp_patient.SetItem(j,"patient_couleur_postdate",rgb(255,200,200))
				else
					ds_imp_patient.SetItem(j,"patient_couleur_postdate",rgb(255,255,255))
				end if
			end if
		else
			ds_imp_patient.SetItem(j,"patient_couleur_postdate",rgb(255,255,255))
		end if
	next
	ds_imp_patient.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
	//print
	if dw_horprint.acceptText() = -1 then return
	li_copies = dw_horprint.object.copies[1]
	//Choix du bac d'alimentation
	choose case li_bac
		case 1
			ds_imp_patient.object.datawindow.print.Paper.Source = li_bac1
		case 2
			ds_imp_patient.object.datawindow.print.Paper.Source = li_bac2
		case 3
			ds_imp_patient.object.datawindow.print.Paper.Source = li_bac3
	end choose
	if li_copies > 0 then
		ds_imp_patient.object.datawindow.print.copies = li_copies
	end if
	if ds_imp_patient.print() <> 1 then
		error_type(52)
	end if
	destroy ds_imp_patient
end if

//horaire detaille
if cbx_hordetail.checked then
	delete from horaire_patient_id;
	
	// Cocher les colonnes necessaire
	
	il_col = of_filllistcol()
	luo_listcol.of_setcol(il_col)
	w_horaire.implistetel(luo_listcol)
//	select horimpdetail into :v_option from t_options where ortho_id = :v_no_ortho;
	datastore ds_horimpcond
	ds_horimpcond = create datastore
	if ll_imphorlist = 1 then
		ds_horimpcond.dataobject = "r_horimpcond"
	else
		ds_horimpcond.dataobject = "r_horimpcond2"
	end if
	if v_langue = 'an' then
		ds_horimpcond.modify("compute_3.expression =  '~"DETAILLED SQUEDULE FOR : ~" +  ortho_id_dr_nom_complet '")
		ds_horimpcond.object.t_heure.text = 'Time'
		ds_horimpcond.object.t_chair.text = 'Chair'
		ds_horimpcond.object.t_patientname.text = 'Patient name (box #)'
		ds_horimpcond.object.t_trait.text = 'Procedure'
		ds_horimpcond.object.t_langue.text = 'Language:'
		ds_horimpcond.object.t_printedon.text = 'Printed on'
//		ds_horimpcond.object.t_memo.text = 'Memo'
	end if
	if ddlb_tridet.text = "Chronologique" OR ddlb_tridet.text = "Chronologic" then
		ds_horimpcond.setSort("horaire_patient_id_heure_rv A")
		ds_horimpcond.sort()
	else
		ds_horimpcond.setSort("patient_no_boite A")
		ds_horimpcond.sort()
	end if
	ds_horimpcond.SetTransObject(SQLCA)
	ds_horimpcond.retrieve(ll_horsharedid)
	ds_horimpcond.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
	//si par ordre alphabetique ou pas
	select horalpha into :li_horalpha from t_options where ortho_id = :ll_horsharedid;
	if li_horalpha = 1 then
		ds_horimpcond.setsort('patient_patient_nom A,patient_patient_prenom A')
		ds_horimpcond.sort()
	end if
	//print
	if dw_horprint.acceptText() = -1 then return
	li_copies = dw_horprint.object.copies[1]
	//Choix du bac d'alimentation
	choose case li_bac
		case 1
			ds_horimpcond.object.datawindow.print.Paper.Source = li_bac1
		case 2
			ds_horimpcond.object.datawindow.print.Paper.Source = li_bac2
		case 3
			ds_horimpcond.object.datawindow.print.Paper.Source = li_bac3
	end choose
	if li_copies > 0 then
		ds_horimpcond.object.datawindow.print.copies = li_copies
	end if
	if ds_horimpcond.print() <> 1 then
		error_type(52)
	end if
	destroy ds_horimpcond
end if

//horaire detaille avec finances du jour
if cbx_hordetailfin.checked then
	delete from horaire_patient_id;
	il_col = of_filllistcol()
	luo_listcol.of_setcol(il_col)
	w_horaire.implistetel(luo_listcol)
//	select horimpdetail into :v_option from t_options where ortho_id = :v_no_ortho;
	datastore ds_horimpfindetail
	ds_horimpfindetail = create datastore
	ds_horimpfindetail.dataobject = "r_horimpfindetail"
	if v_langue = 'an' then
		ds_horimpfindetail.modify("compute_3.expression =  '~"DAILY FINANCIAL BREAKDOWN FOR : ~" +  ortho_id_dr_nom_complet '")
		ds_horimpfindetail.object.t_heure.text = 'Time'
		ds_horimpfindetail.object.t_paid.text = 'Paid'
		ds_horimpfindetail.object.t_patientname.text = 'Patient name (box #)'
		ds_horimpfindetail.object.t_montantdu.text = 'Amount due'
		ds_horimpfindetail.object.t_trait.text = 'Procedure'
		ds_horimpfindetail.object.t_nextpdc.text = 'Next PDC'
		ds_horimpfindetail.object.t_montantpdc.text = 'Amount'
		ds_horimpfindetail.object.t_solde.text = 'Balance'
		ds_horimpfindetail.object.t_printedon.text = 'Printed on'
	end if
	ds_horimpfindetail.SetTransObject(SQLCA)
	ds_horimpfindetail.retrieve(v_no_ortho)
	ds_horimpfindetail.object.t_date.text = w_horaire.sle_day.text + ' ' + w_horaire.sle_day2.text
	//si par ordre alphabetique ou pas
	select horalpha into :li_horalpha from t_options where ortho_id = :v_no_ortho;
	if li_horalpha = 1 then
		ds_horimpfindetail.setsort('patient_patient_nom A,patient_patient_prenom A')
		ds_horimpfindetail.sort()
	end if
	//print
	if dw_horprint.acceptText() = -1 then return
	li_copies = dw_horprint.object.copies[1]
	//Choix du bac d'alimentation
	choose case li_bac
		case 1
			ds_horimpfindetail.object.datawindow.print.Paper.Source = li_bac1
		case 2
			ds_horimpfindetail.object.datawindow.print.Paper.Source = li_bac2
		case 3
			ds_horimpfindetail.object.datawindow.print.Paper.Source = li_bac3
	end choose
	if li_copies > 0 then
		ds_horimpfindetail.object.datawindow.print.copies = li_copies
	end if
	if ds_horimpfindetail.print() <> 1 then
		error_type(52)
	end if
	destroy ds_horimpfindetail
end if

end subroutine

public subroutine wf_set_printer ();integer li_pos
if isnull(is_prntrs) then
	is_prntrs = PrintGetPrinter()
end if
PrintSetPrinter (is_prntrs)
if match(is_prntrs,'~t') then
	li_pos = pos(is_prntrs,'~t') - 1
	dw_horprint.object.printer[1] = left(is_prntrs,li_pos)
else
	dw_horprint.object.printer[1] = is_prntrs
end if
end subroutine

public subroutine wf_validnewdoss (ref datastore ads_horimp, ref datastore ads_horimp1, integer ai_nbcol);long ll_patid
integer i,j,li_duree
string ls_dos

if ai_nbcol > 0 then
	for i = 1 to ads_horimp.rowcount()
		for j = 1 to 5
			ll_patid = ads_horimp.getitemnumber(i,'horaire_patient_id_'+string(j))
			li_duree = ads_horimp.getitemnumber(i,'horaire_duree'+string(j))
			if ll_patid > 0 and li_duree > 0 then
				select new_dossier into :ls_dos from patient where patient_id = :ll_patid;
				ads_horimp.setitem(i,'horaire_no_dossier'+string(j),ls_dos)
			end if
		next
	next
	for i = 1 to ads_horimp1.rowcount()
		for j = 6 to ai_nbcol
			ll_patid = ads_horimp1.getitemnumber(i,'horaire_patient_id_'+string(j))
			li_duree = ads_horimp1.getitemnumber(i,'horaire_duree'+string(j))
			if ll_patid > 0 and li_duree > 0 then
				select new_dossier into :ls_dos from patient where patient_id = :ll_patid;
				ads_horimp1.setitem(i,'horaire_no_dossier'+string(j),ls_dos)
			end if
		next
	next
else
	error_type(149)
end if
end subroutine

public subroutine printhor2 ();date ldt_datecal
time lt_heure
string  ls_pat1, ls_pat2, ls_pat3, ls_pat4, ls_pat5, ls_pat6, ls_pat7, ls_pat8, ls_pat9, ls_pat10, ls_pat11, ls_pat12, ls_pat13, ls_pat14, ls_pat15
string ls_trait1, ls_trait2, ls_trait3, ls_trait4, ls_trait5, ls_trait6, ls_trait7, ls_trait8,ls_trait9,ls_trait10,ls_trait11,ls_trait12,ls_trait13,ls_trait14,ls_trait15
string ls_c1, ls_c2, ls_c3, ls_c4, ls_c5, ls_c6, ls_c7, ls_c8, ls_c9, ls_c10, ls_c11, ls_c12, ls_c13, ls_c14, ls_c15
string ls_c1t, ls_c2t, ls_c3t, ls_c4t, ls_c5t, ls_c6t, ls_c7t, ls_c8t, ls_c9t, ls_c10t, ls_c11t, ls_c12t, ls_c13t, ls_c14t, ls_c15t
string ls_nomortho
long ll_duree1, ll_duree2, ll_duree3, ll_duree4, ll_duree5, ll_duree6, ll_duree7, ll_duree8 
long ll_duree9, ll_duree10, ll_duree11, ll_duree12, ll_duree13, ll_duree14, ll_duree15, ll_row, ll_orthoid
integer li_step


datastore ds_horimp1
ds_horimp1 = create datastore
ds_horimp1.dataobject = "r_horimp2"

datastore ds_horimp2
ds_horimp2 = create datastore
ds_horimp2.dataobject = "r_horimp2a"

select horshareid into :ll_orthoid from t_options where ortho_id = :v_no_ortho;

select hor_step,horcol1,horcol2,horcol3,horcol4,horcol5,horcol6,horcol7,horcol8,horcol9,horcol10,horcol11,horcol12,horcol13,horcol14,horcol15
into :li_step, :ls_c1t,:ls_c2t,:ls_c3t,:ls_c4t,:ls_c5t,:ls_c6t,:ls_c7t,:ls_c8t,:ls_c9t,:ls_c10t,:ls_c11t,:ls_c12t,:ls_c13t,:ls_c14t,:ls_c15t from t_options where ortho_id = :ll_orthoid;

ds_horimp1.object.c1_t.text = ls_c1t
ds_horimp1.object.c2_t.text = ls_c2t
ds_horimp1.object.c3_t.text = ls_c3t
ds_horimp1.object.c4_t.text = ls_c4t
ds_horimp1.object.c5_t.text = ls_c5t
ds_horimp2.object.c6_t.text = ls_c6t
ds_horimp2.object.c7_t.text = ls_c7t
ds_horimp2.object.c8_t.text = ls_c8t
ds_horimp2.object.c9_t.text = ls_c9t
ds_horimp2.object.c10_t.text = ls_c10t
ds_horimp2.object.c11_t.text = ls_c11t
ds_horimp2.object.c12_t.text = ls_c12t
ds_horimp2.object.c13_t.text = ls_c13t
ds_horimp2.object.c14_t.text = ls_c14t
ds_horimp2.object.c15_t.text = ls_c15t


DECLARE listrdv CURSOR FOR  
  SELECT horaire.datecal,   
			horaire.heure,   
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_1),'') as patnom1,   
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_2),'') as patnom2,    
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_3),'') as patnom3,    
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_4),'') as patnom4,    
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_5),'') as patnom5,    
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_6),'') as patnom6,   
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_7),'') as patnom7,   
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_8),'') as patnom8,   
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_9),'') as patnom9,    
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_10),'') as patnom10, 
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_11),'') as patnom11,   
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_12),'') as patnom12,   
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_13),'') as patnom13,   
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_14),'') as patnom14,   
			isnull((select patient_nom + ',' + patient_prenom from patient where patient_id = horaire.patient_id_15),'') as patnom15,   
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid1 and ortho_id = :ll_orthoid),'') as trait1,  
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid2 and ortho_id = :ll_orthoid),'') as trait2,   
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid3 and ortho_id = :ll_orthoid),'') as trait3,   
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid4 and ortho_id = :ll_orthoid),'') as trait4,   
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid5 and ortho_id = :ll_orthoid),'') as trait5,   
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid6 and ortho_id = :ll_orthoid),'') as trait6,   
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid7 and ortho_id = :ll_orthoid),'') as trait7,   
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid8 and ortho_id = :ll_orthoid),'') as trait8,   
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid9 and ortho_id = :ll_orthoid),'') as trait9,  
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid10 and ortho_id = :ll_orthoid),'') as trait10, 
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid11 and ortho_id = :ll_orthoid),'') as trait11,   
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid12 and ortho_id = :ll_orthoid),'') as trait12,   
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid13 and ortho_id = :ll_orthoid),'') as trait13,   
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid14 and ortho_id = :ll_orthoid),'') as trait14,   
			isnull((select nip_traitement from type_de_traitement where type_traitement_id = horaire.traitementid15 and ortho_id = :ll_orthoid),'') as trait15,   
			isnull(horaire.duree1,0),   
			isnull(horaire.duree2,0),   
			isnull(horaire.duree3,0),   
			isnull(horaire.duree4,0),   
			isnull(horaire.duree5,0),   
			isnull(horaire.duree6,0),   
			isnull(horaire.duree7,0),   
			isnull(horaire.duree8,0),   
			isnull(horaire.duree9,0),   
			isnull(horaire.duree10,0),
			isnull(horaire.duree11,0),
			isnull(horaire.duree12,0),
			isnull(horaire.duree13,0),
			isnull(horaire.duree14,0),
			isnull(horaire.duree15,0)
	 FROM horaire  
	WHERE horaire.datecal = :istr_cal.caldate and horaire.no_ortho = :ll_orthoid;



OPEN listrdv;

FETCH listrdv INTO 	:ldt_datecal,   
							:lt_heure,
							:ls_pat1, 
							:ls_pat2, 
							:ls_pat3, 
							:ls_pat4, 
							:ls_pat5, 
							:ls_pat6, 
							:ls_pat7, 
							:ls_pat8,
							:ls_pat9, 
							:ls_pat10,
							:ls_pat11,
							:ls_pat12,
							:ls_pat13,
							:ls_pat14,
							:ls_pat15,
							:ls_trait1, 
							:ls_trait2, 
							:ls_trait3, 
							:ls_trait4, 
							:ls_trait5, 
							:ls_trait6, 
							:ls_trait7, 
							:ls_trait8,
							:ls_trait9,
							:ls_trait10,
							:ls_trait11,
							:ls_trait12,
							:ls_trait13,
							:ls_trait14,
							:ls_trait15,
							:ll_duree1, 
							:ll_duree2, 
							:ll_duree3, 
							:ll_duree4, 
							:ll_duree5, 
							:ll_duree6, 
							:ll_duree7, 
							:ll_duree8,
							:ll_duree9, 
							:ll_duree10,
							:ll_duree11,
							:ll_duree12,
							:ll_duree13,
							:ll_duree14,
							:ll_duree15;

DO WHILE SQLCA.SQLCode = 0

	if ll_duree1 > 0 or ll_duree2 > 0 or ll_duree3 > 0 or ll_duree4 > 0 or ll_duree5 > 0 or ll_duree6 > 0 or &
	ll_duree7 > 0 or ll_duree8 > 0 or ll_duree9 > 0 or ll_duree10 > 0 or ll_duree11 > 0 or ll_duree12 > 0 or ll_duree13 > 0 or ll_duree14 > 0 or ll_duree15 > 0  then
	
		select dr_nom_complet into :ls_nomortho from ortho_id where ortho_id.ortho_id = :v_no_ortho;
		ll_row = ds_horimp1.insertRow(0)
		ds_horimp1.setItem(ll_row,'id_spec',ls_nomortho)
		ds_horimp1.setItem(ll_row,'caldate',ldt_datecal)
		ds_horimp1.setItem(ll_row,'heure',lt_heure)
		SetNull(ll_row)
		ll_row = ds_horimp2.insertRow(0)
		ds_horimp2.setItem(ll_row,'id_spec',ls_nomortho)
		ds_horimp2.setItem(ll_row,'caldate',ldt_datecal)
		ds_horimp2.setItem(ll_row,'heure',lt_heure)
		if ll_duree1 > 0 then
			ls_c1 = ls_pat1 + ' ' + ls_trait1 + ' ' + string(ll_duree1 * li_step)
		else
			ls_c1 = ""
		end if
		ds_horimp1.setItem(ll_row,'c1',ls_c1)
		if ll_duree2 > 0 then
			ls_c2 = ls_pat2 + ' ' + ls_trait2 + ' ' + string(ll_duree2 * li_step)
		else
			ls_c2 = ""
		end if
		ds_horimp1.setItem(ll_row,'c2',ls_c2)
		if ll_duree3 > 0 then
			ls_c3 = ls_pat3 + ' ' + ls_trait3 + ' ' + string(ll_duree3 * li_step)
		else
			ls_c3 = ""
		end if
		ds_horimp1.setItem(ll_row,'c3',ls_c3)
		if ll_duree4 > 0 then
			ls_c4 = ls_pat4 + ' ' + ls_trait4 + ' ' + string(ll_duree4 * li_step)
		else
			ls_c4 = ""
		end if
		ds_horimp1.setItem(ll_row,'c4',ls_c4)
		if ll_duree5 > 0 then
			ls_c5 = ls_pat5 + ' ' + ls_trait5 + ' ' + string(ll_duree5 * li_step)
		else
			ls_c5 = ""
		end if
		ds_horimp1.setItem(ll_row,'c5',ls_c5)
		if ll_duree6 > 0 then
			ls_c6 = ls_pat6 + ' ' + ls_trait6 + ' ' + string(ll_duree6 * li_step)
		else
			ls_c6 = ""
		end if
		ds_horimp2.setItem(ll_row,'c6',ls_c6)
		if ll_duree7 > 0 then
			ls_c7 = ls_pat7 + ' ' + ls_trait7 + ' ' + string(ll_duree7 * li_step)
		else
			ls_c7 = ""
		end if
		ds_horimp2.setItem(ll_row,'c7',ls_c7)
		if ll_duree8 > 0 then
			ls_c8 = ls_pat8 + ' ' + ls_trait8 + ' ' + string(ll_duree8 * li_step)
		else
			ls_c8 = ""
		end if	
		ds_horimp2.setItem(ll_row,'c8',ls_c8)
		if ll_duree9 > 0 then
			ls_c9 = ls_pat9 + ' ' + ls_trait9 + ' ' + string(ll_duree9 * li_step)
		else
			ls_c9 = ""
		end if	
		ds_horimp2.setItem(ll_row,'c9',ls_c9)
		if ll_duree10 > 0 then
			ls_c10 = ls_pat10 + ' ' + ls_trait10 + ' ' + string(ll_duree10 * li_step)
		else
			ls_c10 = ""
		end if	
		ds_horimp2.setItem(ll_row,'c10',ls_c10)
		
		if ll_duree11 > 0 then
			ls_c11 = ls_pat11 + ' ' + ls_trait11 + ' ' + string(ll_duree11 * li_step)
		else
			ls_c11 = ""
		end if	
		ds_horimp2.setItem(ll_row,'c11',ls_c11)
		if ll_duree12 > 0 then
			ls_c12 = ls_pat12 + ' ' + ls_trait12 + ' ' + string(ll_duree12 * li_step)
		else
			ls_c12 = ""
		end if	
		ds_horimp2.setItem(ll_row,'c12',ls_c12)
		if ll_duree13 > 0 then
			ls_c13 = ls_pat13 + ' ' + ls_trait13 + ' ' + string(ll_duree13 * li_step)
		else
			ls_c13 = ""
		end if	
		ds_horimp2.setItem(ll_row,'c13',ls_c13)
		if ll_duree14 > 0 then
			ls_c14 = ls_pat14 + ' ' + ls_trait14 + ' ' + string(ll_duree14 * li_step)
		else
			ls_c14 = ""
		end if	
		ds_horimp2.setItem(ll_row,'c14',ls_c14)
		if ll_duree15 > 0 then
			ls_c15 = ls_pat15 + ' ' + ls_trait15 + ' ' + string(ll_duree15 * li_step)
		else
			ls_c15 = ""
		end if	
		ds_horimp2.setItem(ll_row,'c15',ls_c15)
		
	end if
	
	FETCH listrdv INTO 	:ldt_datecal,   
								:lt_heure,
								:ls_pat1, 
								:ls_pat2, 
								:ls_pat3, 
								:ls_pat4, 
								:ls_pat5, 
								:ls_pat6, 
								:ls_pat7, 
								:ls_pat8,
								:ls_pat9, 
								:ls_pat10,
								:ls_pat11,
								:ls_pat12,
								:ls_pat13,
								:ls_pat14,
								:ls_pat15,
								:ls_trait1, 
								:ls_trait2, 
								:ls_trait3, 
								:ls_trait4, 
								:ls_trait5, 
								:ls_trait6, 
								:ls_trait7, 
								:ls_trait8,
								:ls_trait9,
								:ls_trait10,
								:ls_trait11,
								:ls_trait12,
								:ls_trait13,
								:ls_trait14,
								:ls_trait15,
								:ll_duree1, 
								:ll_duree2, 
								:ll_duree3, 
								:ll_duree4, 
								:ll_duree5, 
								:ll_duree6, 
								:ll_duree7, 
								:ll_duree8,
								:ll_duree9, 
								:ll_duree10,
								:ll_duree11,
								:ll_duree12,
								:ll_duree13,
								:ll_duree14,
								:ll_duree15;
	
LOOP

CLOSE listrdv;

ds_horimp1.print()
ds_horimp2.print()

//gb_datawindow = false
//openwithparm(w_print_options,ds_horimp)
end subroutine

public function any of_filllistcol ();long il_col[]

if cbx_col1.checked then
	 il_col[1] = 1
else
	 il_col[1] = 0
end if

if cbx_col2.checked then
	 il_col[2] = 1
else
	 il_col[2] = 0
end if

if cbx_col3.checked then
	 il_col[3] = 1
else
	 il_col[3] = 0
end if

if cbx_col4.checked then
	 il_col[4] = 1
else
	 il_col[4] = 0
end if

if cbx_col5.checked then
	 il_col[5] = 1
else
	 il_col[5] = 0
end if

if cbx_col6.checked then
	 il_col[6] = 1
else
	 il_col[6] = 0
end if

if cbx_col7.checked then
	 il_col[7] = 1
else
	 il_col[7] = 0
end if

if cbx_col8.checked then
	 il_col[8] = 1
else
	 il_col[8] = 0
end if

if cbx_col9.checked then
	 il_col[9] = 1
else
	 il_col[9] = 0
end if

if cbx_col10.checked then
	 il_col[10] = 1
else
	 il_col[10] = 0
end if

if cbx_col11.checked then
	 il_col[11] = 1
else
	 il_col[11] = 0
end if

if cbx_col12.checked then
	 il_col[12] = 1
else
	 il_col[12] = 0
end if

if cbx_col13.checked then
	 il_col[13] = 1
else
	 il_col[13] = 0
end if

if cbx_col14.checked then
	 il_col[14] = 1
else
	 il_col[14] = 0
end if

if cbx_col15.checked then
	 il_col[15] = 1
else
	 il_col[15] = 0
end if

return il_col
end function

on w_horprint.create
this.cbx_col15=create cbx_col15
this.cbx_col14=create cbx_col14
this.cbx_col13=create cbx_col13
this.cbx_col12=create cbx_col12
this.cbx_col11=create cbx_col11
this.cbx_col10=create cbx_col10
this.cbx_col9=create cbx_col9
this.cbx_col8=create cbx_col8
this.cbx_col7=create cbx_col7
this.cbx_col6=create cbx_col6
this.cbx_col5=create cbx_col5
this.cbx_col4=create cbx_col4
this.cbx_col3=create cbx_col3
this.cbx_col2=create cbx_col2
this.cbx_col1=create cbx_col1
this.ddlb_tridet=create ddlb_tridet
this.st_7=create st_7
this.ddlb_tri=create ddlb_tri
this.st_tri=create st_tri
this.st_4=create st_4
this.st_2=create st_2
this.em_endpm2=create em_endpm2
this.em_startpm2=create em_startpm2
this.em_endam2=create em_endam2
this.em_startam2=create em_startam2
this.st_6=create st_6
this.st_5=create st_5
this.cbx_hordetailfin=create cbx_hordetailfin
this.st_3=create st_3
this.st_1=create st_1
this.em_endpm1=create em_endpm1
this.em_startpm1=create em_startpm1
this.em_endam1=create em_endam1
this.em_startam1=create em_startam1
this.cbx_hordetail=create cbx_hordetail
this.cbx_hor=create cbx_hor
this.cbx_tellist=create cbx_tellist
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_ok=create cb_ok
this.dw_horprint=create dw_horprint
this.Control[]={this.cbx_col15,&
this.cbx_col14,&
this.cbx_col13,&
this.cbx_col12,&
this.cbx_col11,&
this.cbx_col10,&
this.cbx_col9,&
this.cbx_col8,&
this.cbx_col7,&
this.cbx_col6,&
this.cbx_col5,&
this.cbx_col4,&
this.cbx_col3,&
this.cbx_col2,&
this.cbx_col1,&
this.ddlb_tridet,&
this.st_7,&
this.ddlb_tri,&
this.st_tri,&
this.st_4,&
this.st_2,&
this.em_endpm2,&
this.em_startpm2,&
this.em_endam2,&
this.em_startam2,&
this.st_6,&
this.st_5,&
this.cbx_hordetailfin,&
this.st_3,&
this.st_1,&
this.em_endpm1,&
this.em_startpm1,&
this.em_endam1,&
this.em_startam1,&
this.cbx_hordetail,&
this.cbx_hor,&
this.cbx_tellist,&
this.cb_3,&
this.cb_2,&
this.cb_ok,&
this.dw_horprint}
end on

on w_horprint.destroy
destroy(this.cbx_col15)
destroy(this.cbx_col14)
destroy(this.cbx_col13)
destroy(this.cbx_col12)
destroy(this.cbx_col11)
destroy(this.cbx_col10)
destroy(this.cbx_col9)
destroy(this.cbx_col8)
destroy(this.cbx_col7)
destroy(this.cbx_col6)
destroy(this.cbx_col5)
destroy(this.cbx_col4)
destroy(this.cbx_col3)
destroy(this.cbx_col2)
destroy(this.cbx_col1)
destroy(this.ddlb_tridet)
destroy(this.st_7)
destroy(this.ddlb_tri)
destroy(this.st_tri)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.em_endpm2)
destroy(this.em_startpm2)
destroy(this.em_endam2)
destroy(this.em_startam2)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.cbx_hordetailfin)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.em_endpm1)
destroy(this.em_startpm1)
destroy(this.em_endam1)
destroy(this.em_startam1)
destroy(this.cbx_hordetail)
destroy(this.cbx_hor)
destroy(this.cbx_tellist)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_ok)
destroy(this.dw_horprint)
end on

event open;/********************************************************
 * Initialise les varaibles d'instance
 * Insert une ligne et initialise les valeurs des colonnes
 **********************************************************/

dw_horprint.InsertRow(0)
dw_horprint.Object.copies[1] = 1
dw_horprint.Object.bac[1] = 0
wf_set_printer()

	 
 
 
 
 
end event

event close;gi_imp = 1

//replace l'imprimante par default
PrintSetPrinter(gs_defaultprinter)
end event

type cbx_col15 from checkbox within w_horprint
boolean visible = false
integer x = 2002
integer y = 1012
integer width = 201
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "15"
boolean checked = true
end type

type cbx_col14 from checkbox within w_horprint
boolean visible = false
integer x = 2002
integer y = 936
integer width = 201
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "14"
boolean checked = true
end type

type cbx_col13 from checkbox within w_horprint
boolean visible = false
integer x = 2002
integer y = 860
integer width = 201
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "13"
boolean checked = true
end type

type cbx_col12 from checkbox within w_horprint
boolean visible = false
integer x = 2002
integer y = 780
integer width = 201
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "12"
boolean checked = true
end type

type cbx_col11 from checkbox within w_horprint
boolean visible = false
integer x = 2002
integer y = 708
integer width = 201
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "11"
boolean checked = true
end type

type cbx_col10 from checkbox within w_horprint
boolean visible = false
integer x = 1765
integer y = 1012
integer width = 155
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "10"
boolean checked = true
end type

type cbx_col9 from checkbox within w_horprint
boolean visible = false
integer x = 1765
integer y = 936
integer width = 155
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "9"
boolean checked = true
end type

type cbx_col8 from checkbox within w_horprint
boolean visible = false
integer x = 1765
integer y = 860
integer width = 155
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "8"
boolean checked = true
end type

type cbx_col7 from checkbox within w_horprint
boolean visible = false
integer x = 1765
integer y = 784
integer width = 155
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "7"
boolean checked = true
end type

type cbx_col6 from checkbox within w_horprint
boolean visible = false
integer x = 1765
integer y = 708
integer width = 155
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "6"
boolean checked = true
end type

type cbx_col5 from checkbox within w_horprint
boolean visible = false
integer x = 1563
integer y = 1012
integer width = 155
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "5"
boolean checked = true
end type

type cbx_col4 from checkbox within w_horprint
boolean visible = false
integer x = 1563
integer y = 936
integer width = 155
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "4"
boolean checked = true
end type

type cbx_col3 from checkbox within w_horprint
boolean visible = false
integer x = 1563
integer y = 860
integer width = 155
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "3"
boolean checked = true
end type

type cbx_col2 from checkbox within w_horprint
boolean visible = false
integer x = 1559
integer y = 784
integer width = 155
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "2"
boolean checked = true
end type

type cbx_col1 from checkbox within w_horprint
boolean visible = false
integer x = 1563
integer y = 708
integer width = 155
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1"
boolean checked = true
end type

type ddlb_tridet from u_ddlb within w_horprint
integer x = 1431
integer y = 1208
integer width = 809
integer height = 296
integer taborder = 110
string item[] = {"Chronologique","Numéro de boîte"}
end type

event constructor;call super::constructor;if v_langue = 'an' then
	THIS.Reset()
	THIS.Additem( "Chronologic" )
	THIS.Additem( "Box number" )
END IF
end event

type st_7 from statictext within w_horprint
boolean visible = false
integer x = 1170
integer y = 1208
integer width = 261
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Trié par:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Sorted by:'
	
end if

end event

type ddlb_tri from u_ddlb within w_horprint
boolean visible = false
integer x = 1431
integer y = 1108
integer width = 809
integer height = 292
integer taborder = 100
string item[] = {"Chaise","Heure"}
end type

event constructor;call super::constructor;if v_langue = 'an' then
	THIS.Reset()
	THIS.Additem( "Chair" )
	THIS.Additem( "Hour" )
END IF
end event

type st_tri from statictext within w_horprint
boolean visible = false
integer x = 1170
integer y = 1108
integer width = 261
integer height = 72
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Trié par:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Sorted by:'
	
end if

end event

type st_4 from statictext within w_horprint
integer x = 1138
integer y = 896
integer width = 105
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "A:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'End PM:'
end if
end event

type st_2 from statictext within w_horprint
integer x = 1138
integer y = 700
integer width = 105
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "A:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'End PM:'
end if
end event

type em_endpm2 from editmask within w_horprint
integer x = 1271
integer y = 984
integer width = 270
integer height = 88
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event constructor;integer li_horpm,li_horstep,li_end
time lt_horpm

SELECT defhorpm4 into :lt_horpm from t_options
where ortho_id = (select horshareid from t_options where ortho_id = :v_no_ortho);

if isnull(lt_horpm) then
	em_endpm2.text = '00:00'
else
	em_endpm2.text = string(lt_horpm)
end if
end event

type em_startpm2 from editmask within w_horprint
integer x = 512
integer y = 984
integer width = 270
integer height = 88
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event constructor;integer li_horpm,li_horstep,li_end
time lt_horpm

SELECT defhorpm3 into :lt_horpm from t_options 
where ortho_id = (select horshareid from t_options where ortho_id = :v_no_ortho);

if isnull(lt_horpm) then
	em_startpm2.text = '00:00'
else
	em_startpm2.text = string(lt_horpm)
end if
end event

type em_endam2 from editmask within w_horprint
integer x = 1271
integer y = 792
integer width = 270
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event constructor;integer li_horam,li_horstep
time lt_horam

SELECT defhoram4 into :lt_horam from t_options 
where ortho_id = (select horshareid from t_options where ortho_id = :v_no_ortho);

if isnull(lt_horam) then
	em_endam2.text = '00:00'
else
	em_endam2.text = string(lt_horam)
end if
end event

type em_startam2 from editmask within w_horprint
integer x = 512
integer y = 792
integer width = 270
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event constructor;integer li_horam,li_horstep
time lt_horam

SELECT defhoram3 into :lt_horam 
from t_options 
where ortho_id = (select horshareid from t_options where ortho_id = :v_no_ortho);

if isnull(lt_horam) then
	em_startam2.text = '00:00'
else
	em_startam2.text = string(lt_horam)
end if
end event

type st_6 from statictext within w_horprint
integer x = 402
integer y = 896
integer width = 105
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DE:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'End PM:'
end if
end event

type st_5 from statictext within w_horprint
integer x = 402
integer y = 704
integer width = 105
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "DE:"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'End PM:'
end if
end event

type cbx_hordetailfin from checkbox within w_horprint
integer x = 87
integer y = 1308
integer width = 2153
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Impression de l~'horaire détaillé avec finance"
end type

event constructor;integer li_etat

if v_langue = 'an' then
	this.text = 'Print finance detailled schedule'
end if

//SELECT horimpdetail into :li_etat from t_options where ortho_id = :v_no_ortho;
//if li_etat = 1 then
//	cbx_hordetail.checked = true
//else
//	cbx_hordetail.checked = false
//end if
end event

event clicked;if cbx_hordetail.checked or cbx_hordetailfin.checked then
	cbx_col1.visible = true
	cbx_col2.visible = true
	cbx_col3.visible = true
	cbx_col4.visible = true
	cbx_col5.visible = true
	cbx_col6.visible = true
	cbx_col7.visible = true
	cbx_col8.visible = true
	cbx_col9.visible = true
	cbx_col10.visible = true
	cbx_col11.visible = true
	cbx_col12.visible = true
	cbx_col13.visible = true
	cbx_col14.visible = true
	cbx_col15.visible = true
else
	cbx_col1.visible = false
	cbx_col2.visible = false
	cbx_col3.visible = false
	cbx_col4.visible = false
	cbx_col5.visible = false
	cbx_col6.visible = false
	cbx_col7.visible = false
	cbx_col8.visible = false
	cbx_col9.visible = false
	cbx_col10.visible = false
	cbx_col11.visible = false
	cbx_col12.visible = false
	cbx_col13.visible = false
	cbx_col14.visible = false
	cbx_col15.visible = false
end if
end event

type st_3 from statictext within w_horprint
integer x = 78
integer y = 896
integer width = 302
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Feuille 2:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Start PM:'
end if
end event

type st_1 from statictext within w_horprint
integer x = 91
integer y = 704
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Feuille 1:"
alignment alignment = right!
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Start AM:'
end if
end event

type em_endpm1 from editmask within w_horprint
integer x = 1271
integer y = 888
integer width = 270
integer height = 88
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event constructor;integer li_horpm,li_horstep,li_end
time lt_horpm

SELECT defhorpm2,hor_fin_pm,hor_step into :lt_horpm,:li_horpm,:li_horstep from t_options 
where ortho_id = (select horshareid from t_options where ortho_id = :v_no_ortho);

if isnull(lt_horpm) then
	li_end = 60 - li_horstep
	em_endpm1.text = string(li_horpm) + ':' + string(li_end)
else
	em_endpm1.text = string(lt_horpm)
end if
end event

type em_startpm1 from editmask within w_horprint
integer x = 512
integer y = 888
integer width = 270
integer height = 88
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event constructor;integer li_horpm,li_horstep,li_end
time lt_horpm

SELECT defhorpm1,hor_depart_pm,hor_step into :lt_horpm,:li_horpm,:li_horstep from t_options 
where ortho_id = (select horshareid from t_options where ortho_id = :v_no_ortho);

if isnull(lt_horpm) then
	em_startpm1.text = string(li_horpm) + ':00'
else
	em_startpm1.text = string(lt_horpm)
end if
end event

type em_endam1 from editmask within w_horprint
integer x = 1271
integer y = 696
integer width = 270
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event constructor;integer li_horam,li_horstep,li_end
time lt_horam

SELECT defhoram2,hor_fin_am,hor_step 
into :lt_horam,:li_horam,:li_horstep 
from t_options 
where ortho_id = (select horshareid from t_options where ortho_id = :v_no_ortho);

if isnull(lt_horam) then
	li_end = 60 - li_horstep
	em_endam1.text = string(li_horam) + ':' + string(li_end)
else
	em_endam1.text = string(lt_horam)
end if


end event

type em_startam1 from editmask within w_horprint
integer x = 512
integer y = 696
integer width = 270
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event constructor;integer li_horam
time lt_horam

SELECT defhoram1,hor_depart_am
into :lt_horam,:li_horam
from t_options 
where ortho_id = (select horshareid from t_options where ortho_id = :v_no_ortho);

if isnull(lt_horam) then
	this.text = string(li_horam) + ':00'
else
	this.text = string(lt_horam)
end if

end event

type cbx_hordetail from checkbox within w_horprint
integer x = 87
integer y = 1212
integer width = 2153
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Impression de l~'horaire détaillé"
end type

event constructor;integer li_etat

if v_langue = 'an' then
	this.text = 'Print detailled schedule'
end if

SELECT horimpdetail into :li_etat from t_options where ortho_id = :v_no_ortho;
if li_etat = 1 then
	cbx_hordetail.checked = true
else
	cbx_hordetail.checked = false
end if
ddlb_tridet.selectitem(1)
end event

event clicked;if cbx_hordetail.checked or cbx_hordetailfin.checked then
	cbx_col1.visible = true
	cbx_col2.visible = true
	cbx_col3.visible = true
	cbx_col4.visible = true
	cbx_col5.visible = true
	cbx_col6.visible = true
	cbx_col7.visible = true
	cbx_col8.visible = true
	cbx_col9.visible = true
	cbx_col10.visible = true
	cbx_col11.visible = true
	cbx_col12.visible = true
	cbx_col13.visible = true
	cbx_col14.visible = true
	cbx_col15.visible = true
else
	cbx_col1.visible = false
	cbx_col2.visible = false
	cbx_col3.visible = false
	cbx_col4.visible = false
	cbx_col5.visible = false
	cbx_col6.visible = false
	cbx_col7.visible = false
	cbx_col8.visible = false
	cbx_col9.visible = false
	cbx_col10.visible = false
	cbx_col11.visible = false
	cbx_col12.visible = false
	cbx_col13.visible = false
	cbx_col14.visible = false
	cbx_col15.visible = false
end if
end event

type cbx_hor from checkbox within w_horprint
integer x = 87
integer y = 604
integer width = 2153
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Impression de la grille horaire"
boolean checked = true
end type

event constructor;if v_langue = 'an' then
	this.text = 'Print schedule'
end if
end event

type cbx_tellist from checkbox within w_horprint
integer x = 87
integer y = 1116
integer width = 2153
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Impression de la liste téléphonique"
end type

event constructor;integer li_etat

if v_langue = 'an' then
	this.text = 'Print phone list'
	
end if

SELECT horimplistetel into :li_etat from t_options where ortho_id = :v_no_ortho;
if li_etat = 1 then
	cbx_tellist.checked = true
	st_tri.visible = TRUE
	ddlb_tri.visible = TRUE
	ddlb_tri.selectitem(1)
else
	cbx_tellist.checked = false
end if
end event

event clicked;IF THIS.Checked = TRUE THEN
	st_tri.visible = TRUE
	ddlb_tri.visible = TRUE
	ddlb_tri.selectitem(1)
ELSE
	st_tri.visible = False
	ddlb_tri.visible = False
END IF
end event

type cb_3 from commandbutton within w_horprint
integer x = 763
integer y = 1408
integer width = 741
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Imprimante..."
end type

event clicked;parent.event ue_printer()
end event

event constructor;if v_langue = 'an' then
	this.text = 'Printer...'
end if
end event

type cb_2 from commandbutton within w_horprint
integer x = 1504
integer y = 1408
integer width = 741
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Cancel"
end type

event clicked;parent.event ue_cancel()
end event

type cb_ok from commandbutton within w_horprint
integer x = 23
integer y = 1408
integer width = 741
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "OK"
end type

event clicked;Parent.event ue_ok()
end event

type dw_horprint from datawindow within w_horprint
integer x = 87
integer width = 2153
integer height = 580
integer taborder = 10
string title = "horprint"
string dataobject = "d_horprint"
boolean border = false
borderstyle borderstyle = stylelowered!
end type

event constructor;is_serial = string(gf_orthoini('printer','UniqueId', '', false))

if v_langue = 'an' then
	this.object.t_printer.text = 'Printer:'
	this.object.t_document.text = 'Document:'
	this.object.t_copies.text = 'Copy:'
	this.object.t_printer1.text = 'Printer'
end if

select first pname into :is_prntrs 
from t_printers where jobtype = 1 and serialnumber = :is_serial AND id_personnel = :gl_idpers
order by ordre asc;
if GetChild('printer', dddw_printers) = -1 then
	error_type(0)
end if
dddw_printers.SetTransObject(SQLCA)
dddw_printers.retrieve(is_serial,gl_idpers)
end event

event itemchanged;PrintSetPrinter(data)
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

