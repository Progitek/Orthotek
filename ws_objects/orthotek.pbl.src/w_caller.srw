$PBExportHeader$w_caller.srw
forward
global type w_caller from w_child
end type
type dw_caller from u_dw within w_caller
end type
type st_title from statictext within w_caller
end type
type cb_update from commandbutton within w_caller
end type
type cb_close from commandbutton within w_caller
end type
end forward

global type w_caller from w_child
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
dw_caller dw_caller
st_title st_title
cb_update cb_update
cb_close cb_close
end type
global w_caller w_caller

type variables
Private pfc_n_cst_filesrvwin32 io_file
Private u_ftp uo_ftpobj

Private transaction orthocom

//Private String sProgressMessage
//Private Double dTransferedFileSize = 0

//Private string is_ftpservername, is_ftpusername, is_ftppassword, is_ftpuploadpath
end variables

on w_caller.create
int iCurrent
call super::create
this.dw_caller=create dw_caller
this.st_title=create st_title
this.cb_update=create cb_update
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_caller
this.Control[iCurrent+2]=this.st_title
this.Control[iCurrent+3]=this.cb_update
this.Control[iCurrent+4]=this.cb_close
end on

on w_caller.destroy
call super::destroy
destroy(this.dw_caller)
destroy(this.st_title)
destroy(this.cb_update)
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

orthocom = create transaction

orthocom.DBMS = 'ODBC'
orthocom.DBParm = "ConnectString='DSN=orthocom1'"

connect using orthocom;

if orthocom.SQLCode <> 0 then
	messagebox('','Ish !')
end if
end event

event close;disconnect using orthocom;

destroy orthocom
end event

type dw_caller from u_dw within w_caller
integer y = 88
integer width = 3602
integer height = 1828
integer taborder = 10
string dataobject = "d_caller"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;//choose case dwo.name
//	case 'filename_t'
//		this.setsort("filename A")
//		this.sort()
//	case 'moddate_t'
//		this.setsort("moddate A")
//		this.sort()
//	case 'statut_t'
//		this.setsort("statut A")
//		this.sort()
//end choose
end event

type st_title from statictext within w_caller
integer width = 3602
integer height = 96
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "CALLER"
boolean focusrectangle = false
end type

type cb_update from commandbutton within w_caller
integer x = 2715
integer y = 1924
integer width = 544
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Set caller"
end type

event clicked;integer li_duree,li_colonne
long ll_patid,ll_newrow, ll_count
string ls_patnom,ls_langue,ls_newdoss,ls_telres,ls_telbur,ls_traitnip
string ls_patid
date ra_date, ldt_rdv
time lt_rdv

ra_date = date('2005-04-19')
// inserer au calendrier
DECLARE caller CURSOR FOR

	select t_rdv.patient_id,
			 (patient.patient_nom + ', ' + patient.patient_prenom),
			 patient.langue,
			 patient.new_dossier,
			 patient.tel_maison,
			 patient.tel_bureau,
			 t_rdv.rdvdate,
			 t_rdv.rdvheure,
			 t_rdv.duree,
			 t_rdv.colonne,
			 type_de_traitement.nip_traitement
	from	 t_rdv INNER JOIN patient ON t_rdv.patient_id = patient.patient_id
					 INNER JOIN type_de_traitement ON type_de_traitement.type_traitement_id = t_rdv.typetraitid
	where	 t_rdv.rdvdate = :ra_date;

OPEN caller;

FETCH caller INTO :ll_patid,
						:ls_patnom,
						:ls_langue,
						:ls_newdoss,
						:ls_telres,
						:ls_telbur,
						:ldt_rdv,
						:lt_rdv,
						:li_duree,
						:li_colonne,
						:ls_traitnip;

DO WHILE SQLCA.SQLCode = 0
	
	ll_newrow = dw_caller.insertrow(0)
	dw_caller.setitem(ll_newrow,'patid',ll_patid)
	dw_caller.setitem(ll_newrow,'patnom',ls_patnom)
	if ls_langue = 'A' then ls_langue = 'E'
	dw_caller.setitem(ll_newrow,'patlangue',ls_langue)
	dw_caller.setitem(ll_newrow,'patnewdoss',ls_newdoss)
	dw_caller.setitem(ll_newrow,'pattelres',ls_telres)
	dw_caller.setitem(ll_newrow,'pattelbur',ls_telbur)
	dw_caller.setitem(ll_newrow,'rdvdate',ldt_rdv)
	dw_caller.setitem(ll_newrow,'rdvtime',lt_rdv)
	dw_caller.setitem(ll_newrow,'rdvduree',li_duree)
	ls_traitnip = left(ls_traitnip,3)
	dw_caller.setitem(ll_newrow,'rdvtrait',ls_traitnip)
	
	ls_patid = string(ll_patid,'000000')
	
	select count(*) into :ll_count from patmast where patnumr = :ls_patid using orthocom;
	if ll_count <> 0 then
		delete from patmast where patnumr = :ls_patid using orthocom;
	end if

	insert into patmast(patnumr,office,practnr,pattype,paddress,ptown,postcode,longhome,homephne,longwork,workphne,
	dentnumr,patsex,birtdate,inscov,socins,datesyst,begrxdat,endactdt,endrx,status,refsourc,recldate,modelno,extension,
	refd,refdent,bill2,patname,psal,rxphase,language,corresto,owing,lastseen,mtick,atick,dtick,detick,fmlmdnum,specnum,
	refto1,refto2,ctype,rxlen,dprogid,prfreq,lprdate,invcopy,school,tcase,sifdate,maintain,stmts,provider,rcomment,
	hcomment,ver,race,paddress2,email,longcell,mobphone,commonname,longfax,faxphone,country,family,nondentref,genind)
	values(:ls_patid,' ',' ','     ','                                   ','                         ','          ',' ','             ',' ','             ',
	'     ',' ','        ',' ','           ','        ','        ','        ','        ',' ','                    ','        ','           ','    ',
	' ','     ',' ','Progitek                     ','      ',' ',' ',' ',0,'                  ',' ',' ',' ',' ','     ','     ',
	'     ','     ','          ',0,' ',0,'        ',0,'               ',' ','        ',' ',' ',' ',0,
	0,'  ',' ','                                   ','                         ',' ','               ','               ',' ','               ','   ','      ','          ',' ')
	using orthocom;
	
	select count(*) into :ll_count from appt where patnumr = :ls_patid using orthocom;
	if ll_count <> 0 then
		delete from appt where patnumr = :ls_patid using orthocom;
	end if

	insert into appt(patnumr,user,apptdate,appttime,arrived,seen,seated,timecode,apptcode,nprovider,rx,
	comments,length,status,chair,dbdate,office,practnr,provider,appttime24,showtime,confirm)
	values(:ls_patid,'               ','        ','     ','     ','     ','     ','  ','   ',0,'                ',
	'                   ',0,' ','  ','        ',' ',' ',' ','     ','      ',' ')
	using orthocom;
	
	commit using orthocom;
	
	FETCH caller INTO :ll_patid,
							:ls_patnom,
							:ls_langue,
							:ls_newdoss,
							:ls_telres,
							:ls_telbur,
							:ldt_rdv,
							:lt_rdv,
							:li_duree,
							:li_colonne,
							:ls_traitnip;
LOOP

CLOSE caller;

end event

type cb_close from commandbutton within w_caller
integer x = 3259
integer y = 1924
integer width = 361
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Close"
end type

event clicked;Close(Parent)
end event

