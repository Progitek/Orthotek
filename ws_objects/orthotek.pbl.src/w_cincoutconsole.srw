$PBExportHeader$w_cincoutconsole.srw
forward
global type w_cincoutconsole from w_child
end type
type cb_delall from commandbutton within w_cincoutconsole
end type
type cb_5 from commandbutton within w_cincoutconsole
end type
type cb_4 from commandbutton within w_cincoutconsole
end type
type cb_1 from commandbutton within w_cincoutconsole
end type
type cb_insert from commandbutton within w_cincoutconsole
end type
type st_heure from statictext within w_cincoutconsole
end type
type st_4 from statictext within w_cincoutconsole
end type
type cb_close from commandbutton within w_cincoutconsole
end type
type st_2 from statictext within w_cincoutconsole
end type
type dw_cincoutconsolearr from u_dw within w_cincoutconsole
end type
type dw_cincoutconsoleatt from u_dw within w_cincoutconsole
end type
type st_1 from statictext within w_cincoutconsole
end type
type cb_3 from commandbutton within w_cincoutconsole
end type
end forward

global type w_cincoutconsole from w_child
boolean visible = false
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
string pointer = "Arrow!"
boolean ib_isupdateable = false
event ue_timer ( integer pl_time )
cb_delall cb_delall
cb_5 cb_5
cb_4 cb_4
cb_1 cb_1
cb_insert cb_insert
st_heure st_heure
st_4 st_4
cb_close cb_close
st_2 st_2
dw_cincoutconsolearr dw_cincoutconsolearr
dw_cincoutconsoleatt dw_cincoutconsoleatt
st_1 st_1
cb_3 cb_3
end type
global w_cincoutconsole w_cincoutconsole

type variables
public string is_nom
end variables

forward prototypes
public subroutine affichedata ()
public subroutine addall ()
end prototypes

event ue_timer(integer pl_time);Timer(pl_time)
end event

public subroutine affichedata ();/* Copyright II4net Inc.
   créer le: 13-04-2003
	modifier le: 13-04-2003
	Auteur dernière modif: Dave Tremblay
*/

/* Cette fonction remplie les données nécessaires pour 
   emplir le bas de la datawindow Rendez-vous ne attente
*/

long ll_duree1, ll_duree2, ll_duree3, ll_duree4, ll_duree5
long ll_patid1, ll_patid2, ll_patid3, ll_patid4, ll_patid5
long ll_row, ll_timervm, ll_timeret, ll_count
date ldt_today
string ls_nom1, ls_nom2, ls_nom3, ls_nom4, ls_nom5
string ls_trait1, ls_trait2, ls_trait3, ls_trait4, ls_trait5
time lt_today, lt_time

 // Aller chercher les buffers dans la table t_options
 
select temporvm, temporet into :ll_timervm, :ll_timeret from t_options where ortho_id = :v_no_ortho;

ldt_today = today()
lt_time = relativeTime(now(),(ll_timervm * 60 * -1))

// Déclaration du curseur
 
Declare curseur Cursor For
 
SELECT 	HORAIRE.patient_nom_1,
         HORAIRE.patient_nom_2,
			HORAIRE.patient_nom_3,
			HORAIRE.patient_nom_4,
			HORAIRE.patient_nom_5,
			HORAIRE.patient_id_1,
			HORAIRE.patient_id_2,
			HORAIRE.patient_id_3,
			HORAIRE.patient_id_4,
			HORAIRE.patient_id_5,
			HORAIRE.heure,
			HORAIRE.duree1,
			HORAIRE.duree2,
			HORAIRE.duree3,
			HORAIRE.duree4,
			HORAIRE.duree5,
			HORAIRE.traitementnom1,
			HORAIRE.traitementnom2,
			HORAIRE.traitementnom3,
			HORAIRE.traitementnom4,
			HORAIRE.traitementnom5
FROM 		HORAIRE
WHERE 	HORAIRE.datecal = :ldt_today and
         HORAIRE.heure >= :lt_time and
			HORAIRE.no_ortho = :v_no_ortho
ORDER BY HORAIRE.heure ASC;

OPEN curseur;

Do While SQLCA.SQLCode = 0
	
   Fetch curseur Into :ls_nom1,
							 :ls_nom2,
							 :ls_nom3,
			             :ls_nom4,
			             :ls_nom5,
							 :ll_patid1,
							 :ll_patid2,
							 :ll_patid3,
							 :ll_patid4,
							 :ll_patid5,
			             :lt_today,
			             :ll_duree1,
			             :ll_duree2,
			             :ll_duree3,
			             :ll_duree4,
			             :ll_duree5,
							 :ls_trait1,
							 :ls_trait2,
							 :ls_trait3,
							 :ls_trait4,
							 :ls_trait5;
			            
	if SQLCA.SQLCode = 0 then
		select count(*) into :ll_count from t_cincout where patient_id = :ll_patid1 and heure = :lt_today; 
		if ll_patid1 > 0 and ll_count < 1 and ll_duree1 > 0 then
			ll_row = dw_cincoutconsoleatt.insertRow(0)
			dw_cincoutconsoleatt.setItem(ll_row,'nom',ls_nom1)
			dw_cincoutconsoleatt.setItem(ll_row,'heure',lt_today)
			dw_cincoutconsoleatt.setItem(ll_row,'duree',ll_duree1)
			dw_cincoutconsoleatt.setItem(ll_row,'chaise',1)
			dw_cincoutconsoleatt.setItem(ll_row,'traitement',ls_trait1)
			dw_cincoutconsoleatt.setItem(ll_row,'patient_id',ll_patid1)
			dw_cincoutconsoleatt.setItem(ll_row,'status',"En attente")
		end if
		select count(*) into :ll_count from t_cincout where patient_id = :ll_patid2 and heure = :lt_today;
		if ll_patid2 > 0 and ll_count < 1 and ll_duree2 > 0 then
			ll_row = dw_cincoutconsoleatt.insertRow(0)
			dw_cincoutconsoleatt.setItem(ll_row,'nom',ls_nom2)
			dw_cincoutconsoleatt.setItem(ll_row,'heure',lt_today)
			dw_cincoutconsoleatt.setItem(ll_row,'duree',ll_duree2)
			dw_cincoutconsoleatt.setItem(ll_row,'chaise',2)
			dw_cincoutconsoleatt.setItem(ll_row,'traitement',ls_trait2)
			dw_cincoutconsoleatt.setItem(ll_row,'patient_id',ll_patid2)
			dw_cincoutconsoleatt.setItem(ll_row,'status',"En attente")
		end if
		select count(*) into :ll_count from t_cincout where patient_id = :ll_patid3 and heure = :lt_today;
		if ll_patid3 > 0 and ll_count < 1 and ll_duree3 > 0 then
			ll_row = dw_cincoutconsoleatt.insertRow(0)
			dw_cincoutconsoleatt.setItem(ll_row,'nom',ls_nom3)
			dw_cincoutconsoleatt.setItem(ll_row,'heure',lt_today)
			dw_cincoutconsoleatt.setItem(ll_row,'duree',ll_duree3)
			dw_cincoutconsoleatt.setItem(ll_row,'chaise',3)
			dw_cincoutconsoleatt.setItem(ll_row,'traitement',ls_trait3)
			dw_cincoutconsoleatt.setItem(ll_row,'patient_id',ll_patid3)
			dw_cincoutconsoleatt.setItem(ll_row,'status',"En attente")
		end if
		select count(*) into :ll_count from t_cincout where patient_id = :ll_patid4 and heure = :lt_today;
		if ll_patid4 > 0 and ll_count < 1 and ll_duree4 > 0 then
			ll_row = dw_cincoutconsoleatt.insertRow(0)
			dw_cincoutconsoleatt.setItem(ll_row,'nom',ls_nom4)
			dw_cincoutconsoleatt.setItem(ll_row,'heure',lt_today)
			dw_cincoutconsoleatt.setItem(ll_row,'duree',ll_duree4)
			dw_cincoutconsoleatt.setItem(ll_row,'chaise',4)
			dw_cincoutconsoleatt.setItem(ll_row,'traitement',ls_trait4)
			dw_cincoutconsoleatt.setItem(ll_row,'patient_id',ll_patid4)
			dw_cincoutconsoleatt.setItem(ll_row,'status',"En attente")
		end if
		select count(*) into :ll_count from t_cincout where patient_id = :ll_patid5 and heure = :lt_today;
		if ll_patid5 > 0 and ll_count < 1 and ll_duree5 > 0 then
			ll_row = dw_cincoutconsoleatt.insertRow(0)
			dw_cincoutconsoleatt.setItem(ll_row,'nom',ls_nom5)
			dw_cincoutconsoleatt.setItem(ll_row,'heure',lt_today)
			dw_cincoutconsoleatt.setItem(ll_row,'duree',ll_duree5)
			dw_cincoutconsoleatt.setItem(ll_row,'chaise',5)
			dw_cincoutconsoleatt.setItem(ll_row,'traitement',ls_trait5)
			dw_cincoutconsoleatt.setItem(ll_row,'patient_id',ll_patid5)
			dw_cincoutconsoleatt.setItem(ll_row,'status',"En attente")
		end if
	end if
Loop

CLOSE curseur;
addAll()

end subroutine

public subroutine addall ();/* Copyright II4net Inc.
   créer le: 01-07-2003
	modifier le: 01-07-2003
	Auteur dernière modif: Dave Tremblay
*/

// Procédure CHECK-IN

long ll_personnel, ll_att, ll_patid, ll_chaise, ll_duree
string ls_stat, ls_nom, ls_trait 
time lt_check, lt_heure, lt_time
long ll_timeret, ll_timervm
integer i

// Aller chercher les tempons dans la fenetre t_options

select temporet, temporvm into :ll_timeret, :ll_timervm from t_options where ortho_id = :v_no_ortho;
lt_time = relativeTime(now(),(ll_timervm * 60 * -1))

// Ajout la ligne à la datawindow de la salle d'attente
for i = 1 to dw_cincoutconsoleatt.rowCount()
	ll_patid = dw_cincoutconsoleatt.getItemNumber(i,'patient_id')
	ls_trait = dw_cincoutconsoleatt.getItemString(i,'traitement')
	ll_chaise = dw_cincoutconsoleatt.getItemNumber(i,'chaise')
	lt_heure = dw_cincoutconsoleatt.getItemTime(i,'heure')
	ll_duree = dw_cincoutconsoleatt.getItemNumber(i,'duree')
	select id_personnel into :ll_personnel from patient where patient_id = :ll_patid;
//	lt_check = now()
	// ls_stat = dw_cincoutconsoleatt.getItemString(dw_cincoutconsoleatt.getRow(),'status')
//	if lt_time < lt_check then 
//		ls_stat = "En retard"
//	else
//		ls_stat = "À temps"
//	end if
	ls_stat = 'En attente'
	insert into t_cincout(id_personnel,patient_id, chaise, status, heure, traitement,duree)
	values(:ll_personnel,:ll_patid,:ll_chaise, :ls_stat,:lt_heure,:ls_trait,:ll_duree);
	commit using SQLCA;
next
dw_cincoutconsolearr.retrieve()
commit using SQLCA;
dw_cincoutconsoleatt.deleteRow(dw_cincoutconsoleatt.getRow())
end subroutine

on w_cincoutconsole.create
int iCurrent
call super::create
this.cb_delall=create cb_delall
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_1=create cb_1
this.cb_insert=create cb_insert
this.st_heure=create st_heure
this.st_4=create st_4
this.cb_close=create cb_close
this.st_2=create st_2
this.dw_cincoutconsolearr=create dw_cincoutconsolearr
this.dw_cincoutconsoleatt=create dw_cincoutconsoleatt
this.st_1=create st_1
this.cb_3=create cb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_delall
this.Control[iCurrent+2]=this.cb_5
this.Control[iCurrent+3]=this.cb_4
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_insert
this.Control[iCurrent+6]=this.st_heure
this.Control[iCurrent+7]=this.st_4
this.Control[iCurrent+8]=this.cb_close
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.dw_cincoutconsolearr
this.Control[iCurrent+11]=this.dw_cincoutconsoleatt
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.cb_3
end on

on w_cincoutconsole.destroy
call super::destroy
destroy(this.cb_delall)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_1)
destroy(this.cb_insert)
destroy(this.st_heure)
destroy(this.st_4)
destroy(this.cb_close)
destroy(this.st_2)
destroy(this.dw_cincoutconsolearr)
destroy(this.dw_cincoutconsoleatt)
destroy(this.st_1)
destroy(this.cb_3)
end on

event timer;/* Copyright II4net Inc.
   créer le: 01-07-2003
	modifier le: 01-07-2003
	Auteur dernière modif: Dave Tremblay
*/

int i, j
long ll_timervm
long ll_timeret, ll_patid, ll_count, ll_idcincout
string ls_nom, ls_prenom, ls_status
time lt_heure, lt_timervm

select temporvm, temporet into :ll_timervm, :ll_timeret from t_options where ortho_id = :v_no_ortho;

lt_timervm = relativeTime(now(),(ll_timervm * 60 * -1))
// Tenir l'heure courante

st_heure.text = string(now())

// Parcourrir tous les rendez-vous et faire les traitements qui
// s'impose en fonction du temps

dw_cincoutconsolearr.retrieve()
for i = 1 to dw_cincoutconsolearr.rowCount()		
	ll_patid = dw_cincoutconsolearr.getItemNumber(i,'patient_id')
	lt_heure = dw_cincoutconsolearr.getItemTime(i,'heure')
	ls_status = dw_cincoutconsolearr.getItemString(i,'status')
	if ls_status = 'En attente' and lt_heure < lt_timervm then
		ll_idcincout = dw_cincoutconsolearr.getItemNumber(i,'id_cincout')
		update t_cincout set status = 'RDV manqué' where id_cincout = :ll_idcincout;
		commit using SQLCA;
	end if
next
end event

event open;/* Copyright II4net Inc.
   créer le: 01-07-2003
	modifier le: 01-07-2003
	Auteur dernière modif: Dave Tremblay
*/

// Démarrage du timer

pro_resize luo_size
luo_size.uf_resizew(this,1,1)

afficheData()
dw_cincoutconsolearr.retrieve()
event ue_timer(1)
end event

type cb_delall from commandbutton within w_cincoutconsole
integer x = 1701
integer y = 1928
integer width = 421
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "DEL. ALL"
end type

event clicked;if error_type(246) = 1 then
	delete from t_cincout;
	commit using SQLCA;
	error_type(-1)
end if
end event

type cb_5 from commandbutton within w_cincoutconsole
integer x = 2121
integer y = 1928
integer width = 434
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "CANCEL"
end type

event clicked;long ll_personnel, ll_att, ll_patid, ll_chaise, ll_duree
string ls_stat, ls_nom, ls_trait 
time lt_check, lt_heure, lt_timervm, lt_timeret
long ll_timeret, ll_timervm, ll_row, ll_idcincout

select temporet, temporvm into :ll_timeret, :ll_timervm from t_options where ortho_id = :v_no_ortho;
lt_timervm = relativeTime(now(),(ll_timervm * 60 * -1))
lt_timeret = relativeTime(now(),(ll_timeret * 60 * -1))
// Faire la procédure de "Check-In" sur le patient sélectionné

ll_row = dw_cincoutconsolearr.getRow()
ll_idcincout = dw_cincoutconsolearr.getItemNumber(ll_row,'id_cincout')
update t_cincout set status = 'Annulé' where id_cincout = :ll_idcincout;
commit using SQLCA;
dw_cincoutconsolearr.retrieve()
commit using SQLCA;
parent.event ue_timer(1)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Cancel'
end if
end event

type cb_4 from commandbutton within w_cincoutconsole
integer x = 1275
integer y = 1928
integer width = 425
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "CHECK OUT"
end type

event clicked;/* Copyright II4net Inc.
   créer le: 01-07-2003
	modifier le: 01-07-2003
	Auteur dernière modif: Dave Tremblay
*/

// Procédure CHECK-OUT


date ldt_today
time lt_heure, lt_arrive, lt_depart
long ll_idcincout, ll_patid, ll_row


// Mise-à-jour de la table rendez-vous

ll_row = dw_cincoutconsolearr.getRow()
ldt_today = today()
lt_arrive = dw_cincoutconsolearr.getItemTime(ll_row,'checkin')
lt_heure = dw_cincoutconsolearr.getItemTime(ll_row,'heure')
ll_idcincout = dw_cincoutconsolearr.getItemNumber(ll_row,'id_cincout')
lt_depart = now()
ll_patid = dw_cincoutconsolearr.getItemNumber(ll_row,'patient_id')
update t_rdv set heurearr = :lt_arrive, heuredep = :lt_depart where rdvdate = :ldt_today and rdvheure = :lt_heure and patient_id = :ll_patid;
commit using SQLCA;
// Procédure de check-out
delete from t_cincout where id_cincout = :ll_idcincout;
commit using SQLCA;
parent.event ue_timer(1)
end event

type cb_1 from commandbutton within w_cincoutconsole
integer x = 709
integer y = 1928
integer width = 567
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "UNDO CHECK IN"
end type

event clicked;/* Copyright II4net Inc.
   créer le: 01-07-2003
	modifier le: 01-07-2003
	Auteur dernière modif: Dave Tremblay
*/

// Procédure CHECK-IN

long  ll_row, ll_idcincout

// Faire la procédure de "Undo Check-In" sur le patient sélectionné

ll_row = dw_cincoutconsolearr.getRow()
ll_idcincout = dw_cincoutconsolearr.getItemNumber(ll_row,'id_cincout')
update t_cincout set checkin = null, status = 'En attente' where id_cincout = :ll_idcincout;
commit using SQLCA;
dw_cincoutconsolearr.retrieve()
commit using SQLCA;
parent.event ue_timer(1)
end event

type cb_insert from commandbutton within w_cincoutconsole
integer x = 32
integer y = 1928
integer width = 672
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "CHECK IN"
end type

event clicked;/* Copyright II4net Inc.
   créer le: 01-07-2003
	modifier le: 01-07-2003
	Auteur dernière modif: Dave Tremblay
*/

// Procédure CHECK-IN

long ll_personnel, ll_att, ll_patid, ll_chaise, ll_duree
string ls_stat, ls_nom, ls_trait 
time lt_check, lt_heure, lt_timervm, lt_timeret
long ll_timeret, ll_timervm, ll_row, ll_idcincout

// Aller chercher les tempons dans la fenetre t_options

select temporet, temporvm into :ll_timeret, :ll_timervm from t_options where ortho_id = :v_no_ortho;
lt_timervm = relativeTime(now(),(ll_timervm * 60 * -1))
lt_timeret = relativeTime(now(),(ll_timeret * 60 * -1))
// Faire la procédure de "Check-In" sur le patient sélectionné

ll_row = dw_cincoutconsolearr.getRow()
ll_idcincout = dw_cincoutconsolearr.getItemNumber(ll_row,'id_cincout')
//ll_patid = dw_cincoutconsolearr.getItemNumber(ll_row,'patient_id')
//ls_trait = dw_cincoutconsolearr.getItemString(ll_row,'traitement')
//ll_chaise = dw_cincoutconsolearr.getItemNumber(ll_row,'chaise')
lt_heure = dw_cincoutconsolearr.getItemTime(ll_row,'heure')
//ll_duree = dw_cincoutconsolearr.getItemNumber(ll_row,'duree')
//ll_personnel = dw_cincoutconsolearr.getItemNumber(ll_row,'id_personnel')
lt_check = now()
//// ls_stat = dw_cincoutconsoleatt.getItemString(dw_cincoutconsoleatt.getRow(),'status')
if lt_timeret > lt_heure then 
	ls_stat = "En retard"
else
	ls_stat = "À temps"
end if
update t_cincout set checkin = :lt_check, status = :ls_stat where id_cincout = :ll_idcincout;
//insert into t_cincout(id_personnel,status,checkin,patient_id, chaise, heure, traitement,duree)
//values(:ll_personnel,:ls_stat,:lt_check,:ll_patid,:ll_chaise,:lt_heure,:ls_trait,:ll_duree);
commit using SQLCA;
dw_cincoutconsolearr.retrieve()
commit using SQLCA;
//dw_cincoutconsoleatt.deleteRow(dw_cincoutconsoleatt.getRow())
parent.event ue_timer(1)
end event

event constructor;if v_langue = 'an' then
	this.text = "Add"
end if
end event

type st_heure from statictext within w_cincoutconsole
integer x = 690
integer y = 140
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_4 from statictext within w_cincoutconsole
integer x = 334
integer y = 136
integer width = 370
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Heure locale"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Local time"
end if
end event

type cb_close from commandbutton within w_cincoutconsole
integer x = 2985
integer y = 1928
integer width = 645
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "CLOSE"
end type

event clicked;close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

type st_2 from statictext within w_cincoutconsole
integer x = 1627
integer y = 152
integer width = 827
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Liste des patients arrivés"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "List of arrivals"
end if
end event

type dw_cincoutconsolearr from u_dw within w_cincoutconsole
integer x = 37
integer y = 224
integer width = 3589
integer height = 1696
integer taborder = 20
string title = "none"
string dataobject = "d_cincoutconsolearr"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

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

event constructor;if v_langue = 'an' then
	this.object.nom_t.text = "Name"
	this.object.heure_t.text = "TimeAp"
	this.object.t_1.text = "TimeArr"
	this.object.duree_t.text = "Length"
	this.object.t_3.text = "Waiting"
	this.object.t_4.text = "Chair"
	this.object.t_5.text = "Staff"
	this.object.t_6.text = "Treatment"
end if
end event

event clicked;scrollToRow(getClickedRow())
parent.event ue_timer(0)
end event

event itemchanged;long ll_idcincout

if dwo.name = 'status' then
	ll_idcincout = getItemNumber(row,'id_cincout')
	update t_cincout set status = :data where id_cincout = :ll_idcincout;
	commit using SQLCA;
end if

end event

type dw_cincoutconsoleatt from u_dw within w_cincoutconsole
integer x = 37
integer y = 1124
integer width = 3589
integer height = 796
integer taborder = 10
string title = "none"
string dataobject = "d_cincoutmonitoratt"
end type

event constructor;/* Copyright II4net Inc.
   créer le: 13-04-2003
	modifier le: 13-04-2003
	Auteur dernière modif: Dave Tremblay
*/

dw_cincoutconsoleatt.settransobject(SQLCA)
dw_cincoutconsoleatt.setRowFocusIndicator(Hand!)
dw_cincoutconsolearr.settransobject(SQLCA)
dw_cincoutconsolearr.setRowFocusIndicator(Hand!)

if v_langue = 'an' then
	this.object.nom_t.text = "Name"
	this.object.heure_t.text = "TimeAp"
	this.object.duree_t.text = "Length"	
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

type st_1 from statictext within w_cincoutconsole
integer x = 32
integer width = 402
integer height = 92
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
string text = "Console"
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_cincoutconsole
boolean visible = false
integer x = 2555
integer y = 1928
integer width = 425
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "ADD ALL"
end type

event constructor;if v_langue = 'an' then
	this.text = "Delete"
end if
end event

event clicked;/* Copyright II4net Inc.
   créer le: 01-07-2003
	modifier le: 01-07-2003
	Auteur dernière modif: Dave Tremblay
*/

// Procédure CHECK-IN

long ll_personnel, ll_att, ll_patid, ll_chaise, ll_duree
string ls_stat, ls_nom, ls_trait 
time lt_check, lt_heure, lt_time
long ll_timeret, ll_timervm
integer i

// Aller chercher les tempons dans la fenetre t_options

select temporet, temporvm into :ll_timeret, :ll_timervm from t_options where ortho_id = :v_no_ortho;
lt_time = relativeTime(now(),(ll_timervm * 60 * -1))

// Ajout la ligne à la datawindow de la salle d'attente
for i = 1 to dw_cincoutconsoleatt.rowCount()
	ll_patid = dw_cincoutconsoleatt.getItemNumber(i,'patient_id')
	ls_trait = dw_cincoutconsoleatt.getItemString(i,'traitement')
	ll_chaise = dw_cincoutconsoleatt.getItemNumber(i,'chaise')
	lt_heure = dw_cincoutconsoleatt.getItemTime(i,'heure')
	ll_duree = dw_cincoutconsoleatt.getItemNumber(i,'duree')
	select id_personnel into :ll_personnel from patient where patient_id = :ll_patid;
//	lt_check = now()
	// ls_stat = dw_cincoutconsoleatt.getItemString(dw_cincoutconsoleatt.getRow(),'status')
//	if lt_time < lt_check then 
//		ls_stat = "En retard"
//	else
//		ls_stat = "À temps"
//	end if
	ls_stat = 'En attente'
	insert into t_cincout(id_personnel,patient_id, chaise, status, heure, traitement,duree)
	values(:ll_personnel,:ll_patid,:ll_chaise, :ls_stat,:lt_heure,:ls_trait,:ll_duree);
	commit using SQLCA;
next
dw_cincoutconsolearr.retrieve()
commit using SQLCA;
dw_cincoutconsoleatt.deleteRow(dw_cincoutconsoleatt.getRow())
end event

