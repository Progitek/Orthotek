$PBExportHeader$w_exportorthocom.srw
forward
global type w_exportorthocom from w_child
end type
type st_2 from statictext within w_exportorthocom
end type
type em_date from editmask within w_exportorthocom
end type
type st_1 from statictext within w_exportorthocom
end type
type cb_4 from commandbutton within w_exportorthocom
end type
type cb_3 from commandbutton within w_exportorthocom
end type
type cb_2 from commandbutton within w_exportorthocom
end type
type cb_1 from commandbutton within w_exportorthocom
end type
type dw_exportorthocom from u_dw within w_exportorthocom
end type
end forward

global type w_exportorthocom from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
st_2 st_2
em_date em_date
st_1 st_1
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_exportorthocom dw_exportorthocom
end type
global w_exportorthocom w_exportorthocom

type variables
transaction bdorthocom
end variables

on w_exportorthocom.create
int iCurrent
call super::create
this.st_2=create st_2
this.em_date=create em_date
this.st_1=create st_1
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_exportorthocom=create dw_exportorthocom
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.em_date
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.cb_4
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.cb_2
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.dw_exportorthocom
end on

on w_exportorthocom.destroy
call super::destroy
destroy(this.st_2)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_exportorthocom)
end on

event open;call super::open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

bdorthocom = create transaction

bdorthocom.DBMS       = 'ODBC'
bdorthocom.DbParm     = "ConnectString='DSN=orthocom;ConnectOption='SQL_DRIVER_CONNECT,SQL_DRIVER_NOPROMPT'"
connect using bdorthocom;
if bdorthocom.SqlCode = 0 then
//	messagebox("Information","Vous êtes maintenant connecté à la base de données",Information!,Ok!)
else
	messagebox("Information",bdorthocom.SqlErrText,Information!,Ok!)
end if
dw_exportorthocom.setTransObject(bdorthocom)
end event

type st_2 from statictext within w_exportorthocom
integer width = 1760
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Exportation des rendez-vous vers orthocom"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = 'Export to ORTHOCOM'
end if
end event

type em_date from editmask within w_exportorthocom
integer x = 2235
integer y = 1920
integer width = 526
integer height = 104
integer taborder = 40
integer textsize = -10
integer weight = 700
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

event constructor;this.text = string(today())
end event

type st_1 from statictext within w_exportorthocom
integer x = 1947
integer y = 1944
integer width = 229
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date"
boolean focusrectangle = false
end type

type cb_4 from commandbutton within w_exportorthocom
integer x = 1266
integer y = 1920
integer width = 631
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Exporter"
end type

event clicked;date ldt_date, ldt_rdv, ldt_datenais, ldt_opendoss, ldt_today
time lt_rdv
long ll_duree, ll_colonne, ll_patid, ll_horstep, ll_count, ll_idcont, ll_pat
string ls_patnumr, ls_date, ls_time, ls_col, ls_month, ls_day, ls_sql, ls_daterdv
string ls_nompat, ls_adresse, ls_vilprov, ls_zip, ls_telres, ls_telbur
string ls_sex, ls_langue, ls_datenais, ls_opendoss, ls_today, ls_showtime
string ls_timecode, ls_respname, ls_address, ls_ville, ls_relation


ldt_date = gf_emtodate(em_date.text)
ldt_today = today()
ls_month = string(month(ldt_today))
if len(ls_month) = 1 then ls_month = "0" + ls_month
ls_day = string(day(ldt_today))
if len(ls_day) = 1 then ls_day = "0" + ls_day
ls_today = string(year(ldt_today)) + ls_month + ls_day

// Effacer la journne

ls_month = string(month(ldt_date))
if len(ls_month) = 1 then ls_month = "0" + ls_month
ls_day = string(day(ldt_date))
if len(ls_day) = 1 then ls_day = "0" + ls_day
ls_date = string(year(ldt_date)) + ls_month + ls_day

ls_sql = "delete from appt where apptdate = '" + ls_date + "'"
execute immediate :ls_sql using bdorthocom;
commit using bdorthocom;
if bdorthocom.SQLCode <> 0 then
	messagebox("dfd",bdorthocom.SQLErrText)
end if

// horstep

select hor_step into :ll_horstep from t_options where ortho_id = :v_no_ortho;

DECLARE listrdv CURSOR FOR
	select 	patient_id,
				rdvdate,
				rdvheure,
				duree,
				colonne
	from t_rdv where rdvdate = :ldt_date;
	
OPEN listrdv;

FETCH listrdv INTO :ll_patid,
						 :ldt_rdv,
						 :lt_rdv,
						 :ll_duree,
						 :ll_colonne;
						 
DO WHILE SQLCA.SQLCode = 0

	ls_patnumr = remplir(string(ll_patid),6,'0',true)
	ls_month = string(month(ldt_rdv))
	if len(ls_month) = 1 then ls_month = "0" + ls_month
	ls_day = string(day(ldt_rdv))
	if len(ls_day) = 1 then ls_day = "0" + ls_day
	ls_daterdv = string(year(ldt_rdv)) + ls_month + ls_day
	ls_time = string(lt_rdv,"hh:mm")
	ll_duree = ll_duree * ll_horstep
	ls_col = remplir(string(ll_colonne),2,' ',true)
	
	ls_showtime = string(lt_rdv,"hh:mmA/P")
	if right(ls_showtime,1) = 'A' then
		ls_timecode = 'AM'
	else
		ls_timecode = 'PM'
	end if
	
	// Ajouter le patient dans ORTHCOM s'il ne l'est pas
	
	select count(*) into :ll_count from patmast where patnumr = :ls_patnumr using bdorthocom;
	if ll_count = 0 then
		
		SELECT 	patient_nom || ', ' || patient_prenom,adresse,
					ville || ', ' || province,code_postale,
					tel_maison,tel_bureau,date_naissance,sex,langue,opendoss, id_contact 
		INTO		:ls_nompat,:ls_adresse,:ls_vilprov,:ls_zip,:ls_telres,:ls_telbur,
					:ldt_datenais,:ls_sex,:ls_langue,:ldt_opendoss, :ll_idcont
		FROM		patient 
		where patient_id = :ll_patid;
		
		ls_zip = string(ls_zip,"@@@ @@@")
		ls_telres = string(ls_telres,"(@@@)@@@-@@@@")
		ls_telbur = string(ls_telbur,"(@@@)@@@-@@@@")
		ls_month = string(month(ldt_datenais))
		if len(ls_month) = 1 then ls_month = "0" + ls_month
		ls_day = string(day(ldt_datenais))
		if len(ls_day) = 1 then ls_day = "0" + ls_day
		ls_datenais = string(year(ldt_datenais)) + ls_month + ls_day
		if ls_langue = 'E' then ls_langue = 'A' else ls_langue = 'F'
		ls_month = string(month(ldt_opendoss))
		if len(ls_month) = 1 then ls_month = "0" + ls_month
		ls_day = string(day(ldt_opendoss))
		if len(ls_day) = 1 then ls_day = "0" + ls_day
		ls_opendoss = string(year(ldt_opendoss)) + ls_month + ls_day
		
		// Responsable 
		
		select isnull(nom,''), + ' ' + isnull(prenom,''), adresse, isnull(ville,'') + ' ( ' +  isnull(province,'') + ' ) ',zip, pat
		into :ls_respname, :ls_address, :ls_ville,:ls_zip,:ll_pat
		from t_contact
		where id_contact = :ll_idcont;
		
		if ll_pat = 1 then
			ls_relation = 'Self'
		else
			ls_relation = 'Parent'
		end if
		
		insert into patmast(patnumr,office,practnr,paddress,ptown,postcode,homephne,
									workphne,patsex,birtdate,patname,language,owing,provider,
									rcomment,hcomment,datesyst,rxphase,status,refd,inscov,invcopy)
		values(:ls_patnumr,'A','A',:ls_adresse,:ls_vilprov,:ls_zip,:ls_telres,
				 :ls_telbur,:ls_sex,:ls_datenais,:ls_nompat,:ls_langue,1,'A',0,0,:ls_opendoss,'B','A','N','N',1)
				 using bdorthocom;
				 
		insert into rpty(rporder,patnumr,resname,office,practnr,provider,relation,address,town,postcode)
		values('0001',:ls_patnumr,:ls_respname,'A','A','A',:ls_relation,:ls_address,:ls_ville,:ls_zip) using bdorthocom;
		
		insert into patacc(patnumr,billp,aphase,curphase,status,office,practnr)
		values(:ls_patnumr,'1','1','1','A','A','A') using bdorthocom;
	
	else
		
		SELECT 	tel_maison,tel_bureau 
		INTO		:ls_telres,:ls_telbur
		FROM		patient 
		where patient_id = :ll_patid;
		
		ls_telres = string(ls_telres,"(@@@)@@@-@@@@")
		ls_telbur = string(ls_telbur,"(@@@)@@@-@@@@")
		
		// Ajuster les information sur ses téléphones
		
		update patmast set homephne = :ls_telres , workphne = :ls_telbur where patnumr = :ls_patnumr using bdorthocom;

	end if
	
	// Ajouter le rendez-vous dans ORTHOCOM
	
	insert into appt(patnumr,apptdate,appttime24,length,chair,apptcode,office,provider,
	practnr,nprovider,dbdate,showtime,timecode,status)
	values(:ls_patnumr,:ls_daterdv,:ls_time,:ll_duree,:ls_col,'ADJ','A','A','A',
	       1,:ls_today,:ls_showtime,:ls_timecode,'U')
	using bdorthocom;

	FETCH listrdv INTO :ll_patid,
							 :ldt_rdv,
							 :lt_rdv,
							 :ll_duree,
							 :ll_colonne;
LOOP

CLOSE listrdv;

dw_exportorthocom.retrieve(ls_date)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Export'
end if
end event

type cb_3 from commandbutton within w_exportorthocom
integer x = 635
integer y = 1920
integer width = 631
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Rechercher"
end type

event clicked;date ldt_date
string ls_date, ls_month, ls_day

ldt_date = gf_emtodate(em_date.text)
ls_month = string(month(ldt_date))
if len(ls_month) = 1 then ls_month = "0" + ls_month
ls_day = string(day(ldt_date))
if len(ls_day) = 1 then ls_day = "0" + ls_day
ls_date = string(year(ldt_date)) + ls_month + ls_day

dw_exportorthocom.retrieve(ls_date)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Search'
end if
end event

type cb_2 from commandbutton within w_exportorthocom
integer x = 5
integer y = 1920
integer width = 631
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;gb_datawindow = true
openwithparm(w_print_options,dw_exportorthocom)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Print'
end if
end event

type cb_1 from commandbutton within w_exportorthocom
integer x = 2784
integer y = 1920
integer width = 855
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer "
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type dw_exportorthocom from u_dw within w_exportorthocom
integer x = 5
integer y = 116
integer width = 3630
integer height = 1796
integer taborder = 10
string dataobject = "d_exportorthocom"
end type

