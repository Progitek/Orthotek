$PBExportHeader$w_cincout.srw
forward
global type w_cincout from w_child
end type
type pb_ou13 from picturebutton within w_cincout
end type
type pb_in13 from picturebutton within w_cincout
end type
type st_14 from statictext within w_cincout
end type
type st_t13 from statictext within w_cincout
end type
type pb_out12 from picturebutton within w_cincout
end type
type pb_in12 from picturebutton within w_cincout
end type
type st_t12 from statictext within w_cincout
end type
type st_station12 from statictext within w_cincout
end type
type st_13 from statictext within w_cincout
end type
type pb_out11 from picturebutton within w_cincout
end type
type pb_in11 from picturebutton within w_cincout
end type
type st_11 from statictext within w_cincout
end type
type st_t11 from statictext within w_cincout
end type
type st_station11 from statictext within w_cincout
end type
type cb_carte from commandbutton within w_cincout
end type
type pb_in10 from picturebutton within w_cincout
end type
type pb_out9 from picturebutton within w_cincout
end type
type pb_in9 from picturebutton within w_cincout
end type
type pb_out8 from picturebutton within w_cincout
end type
type pb_in8 from picturebutton within w_cincout
end type
type pb_out7 from picturebutton within w_cincout
end type
type pb_in7 from picturebutton within w_cincout
end type
type pb_out6 from picturebutton within w_cincout
end type
type pb_in6 from picturebutton within w_cincout
end type
type pb_out5 from picturebutton within w_cincout
end type
type pb_in5 from picturebutton within w_cincout
end type
type pb_out4 from picturebutton within w_cincout
end type
type pb_in4 from picturebutton within w_cincout
end type
type pb_out3 from picturebutton within w_cincout
end type
type pb_in3 from picturebutton within w_cincout
end type
type pb_out2 from picturebutton within w_cincout
end type
type pb_in2 from picturebutton within w_cincout
end type
type pb_in1 from picturebutton within w_cincout
end type
type pb_out1 from picturebutton within w_cincout
end type
type cb_2 from commandbutton within w_cincout
end type
type cb_1 from commandbutton within w_cincout
end type
type st_t10 from statictext within w_cincout
end type
type st_t9 from statictext within w_cincout
end type
type st_9 from statictext within w_cincout
end type
type st_10 from statictext within w_cincout
end type
type st_station10 from statictext within w_cincout
end type
type st_station9 from statictext within w_cincout
end type
type st_t7 from statictext within w_cincout
end type
type st_t6 from statictext within w_cincout
end type
type st_t5 from statictext within w_cincout
end type
type st_t4 from statictext within w_cincout
end type
type st_t3 from statictext within w_cincout
end type
type st_t2 from statictext within w_cincout
end type
type st_t1 from statictext within w_cincout
end type
type cb_refresh from commandbutton within w_cincout
end type
type st_time from statictext within w_cincout
end type
type cb_cout from commandbutton within w_cincout
end type
type st_station7 from statictext within w_cincout
end type
type st_station6 from statictext within w_cincout
end type
type st_station5 from statictext within w_cincout
end type
type st_8 from statictext within w_cincout
end type
type st_7 from statictext within w_cincout
end type
type st_6 from statictext within w_cincout
end type
type st_5 from statictext within w_cincout
end type
type st_4 from statictext within w_cincout
end type
type st_3 from statictext within w_cincout
end type
type st_2 from statictext within w_cincout
end type
type st_1 from statictext within w_cincout
end type
type cb_close from commandbutton within w_cincout
end type
type cb_cin from commandbutton within w_cincout
end type
type st_station8 from statictext within w_cincout
end type
type st_station1 from statictext within w_cincout
end type
type st_station2 from statictext within w_cincout
end type
type st_station3 from statictext within w_cincout
end type
type st_station4 from statictext within w_cincout
end type
type st_t8 from statictext within w_cincout
end type
type dw_horjour from u_dw within w_cincout
end type
type tab_cincout from tab within w_cincout
end type
type tabpage_pat from userobject within tab_cincout
end type
type st_totpat from statictext within tabpage_pat
end type
type dw_cincoutpat from u_dw within tabpage_pat
end type
type tabpage_pat from userobject within tab_cincout
st_totpat st_totpat
dw_cincoutpat dw_cincoutpat
end type
type tabpage_clinique from userobject within tab_cincout
end type
type mle_memo from multilineedit within tabpage_clinique
end type
type dw_cincoutreleased from u_dw within tabpage_clinique
end type
type dw_cincoutwaitingroom from u_dw within tabpage_clinique
end type
type gb_waitingroom from groupbox within tabpage_clinique
end type
type gb_seated from groupbox within tabpage_clinique
end type
type gb_released from groupbox within tabpage_clinique
end type
type dw_cincoutseated from u_dw within tabpage_clinique
end type
type tabpage_clinique from userobject within tab_cincout
mle_memo mle_memo
dw_cincoutreleased dw_cincoutreleased
dw_cincoutwaitingroom dw_cincoutwaitingroom
gb_waitingroom gb_waitingroom
gb_seated gb_seated
gb_released gb_released
dw_cincoutseated dw_cincoutseated
end type
type tabpage_quitte from userobject within tab_cincout
end type
type st_totpat2 from statictext within tabpage_quitte
end type
type st_12 from statictext within tabpage_quitte
end type
type dw_cincoutpatout from u_dw within tabpage_quitte
end type
type tabpage_quitte from userobject within tab_cincout
st_totpat2 st_totpat2
st_12 st_12
dw_cincoutpatout dw_cincoutpatout
end type
type tab_cincout from tab within w_cincout
tabpage_pat tabpage_pat
tabpage_clinique tabpage_clinique
tabpage_quitte tabpage_quitte
end type
type pb_out10 from picturebutton within w_cincout
end type
type st_station13 from statictext within w_cincout
end type
end forward

global type w_cincout from w_child
integer x = 214
integer y = 221
integer width = 4640
integer height = 2600
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
pb_ou13 pb_ou13
pb_in13 pb_in13
st_14 st_14
st_t13 st_t13
pb_out12 pb_out12
pb_in12 pb_in12
st_t12 st_t12
st_station12 st_station12
st_13 st_13
pb_out11 pb_out11
pb_in11 pb_in11
st_11 st_11
st_t11 st_t11
st_station11 st_station11
cb_carte cb_carte
pb_in10 pb_in10
pb_out9 pb_out9
pb_in9 pb_in9
pb_out8 pb_out8
pb_in8 pb_in8
pb_out7 pb_out7
pb_in7 pb_in7
pb_out6 pb_out6
pb_in6 pb_in6
pb_out5 pb_out5
pb_in5 pb_in5
pb_out4 pb_out4
pb_in4 pb_in4
pb_out3 pb_out3
pb_in3 pb_in3
pb_out2 pb_out2
pb_in2 pb_in2
pb_in1 pb_in1
pb_out1 pb_out1
cb_2 cb_2
cb_1 cb_1
st_t10 st_t10
st_t9 st_t9
st_9 st_9
st_10 st_10
st_station10 st_station10
st_station9 st_station9
st_t7 st_t7
st_t6 st_t6
st_t5 st_t5
st_t4 st_t4
st_t3 st_t3
st_t2 st_t2
st_t1 st_t1
cb_refresh cb_refresh
st_time st_time
cb_cout cb_cout
st_station7 st_station7
st_station6 st_station6
st_station5 st_station5
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
cb_close cb_close
cb_cin cb_cin
st_station8 st_station8
st_station1 st_station1
st_station2 st_station2
st_station3 st_station3
st_station4 st_station4
st_t8 st_t8
dw_horjour dw_horjour
tab_cincout tab_cincout
pb_out10 pb_out10
st_station13 st_station13
end type
global w_cincout w_cincout

type variables
private:

long il_idrdv,il_horshareid,il_couleurretard
integer ii_heurerdv,ii_method = 2,ii_horstep
integer t = 0,ii_edite = 0, ii_edits = 0, ii_editr = 0, ii_editp = 0
integer ii_int_refresh = 3, ii_late
long il_rdv[15]

public int ii_att 
end variables

forward prototypes
public function boolean uf_ispresent (integer ai_station)
public subroutine sauve ()
public subroutine uf_getpos ()
public subroutine uf_setpos ()
public subroutine uf_setposw ()
public subroutine uf_setposs ()
public subroutine uf_setposr ()
public subroutine uf_getposw ()
public subroutine uf_getposs ()
public subroutine uf_getposr ()
public subroutine of_setstation (dragobject source, integer ai_station, statictext sttext)
public subroutine of_setcout (long al_rdv)
public subroutine of_setstation (integer ai_station, statictext sttext)
end prototypes

public function boolean uf_ispresent (integer ai_station);integer i,li_rowcount,li_nostation
boolean lb_present = false

li_rowcount = tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount()
for i = 1 to li_rowcount
	li_nostation = tab_cincout.tabpage_clinique.dw_cincoutseated.getitemnumber(i,'t_rdv_nostation')
	if lb_present = false then
		if li_nostation = ai_station then
			lb_present = true
		end if
	end if
next

return lb_present
end function

public subroutine sauve ();if tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.update() = 1 then
	commit using sqlca;
else
	rollback using sqlca;
	error_type(50)
end if

if tab_cincout.tabpage_clinique.dw_cincoutseated.update() = 1 then
	commit using sqlca;
else
	rollback using sqlca;
	error_type(50)
end if

if tab_cincout.tabpage_clinique.dw_cincoutreleased.update() = 1 then
	commit using sqlca;
else
	rollback using sqlca;
	error_type(50)
end if

end subroutine

public subroutine uf_getpos ();Long ll_max, ll_row, ll_x[]

// get position : tab_cincout.tabpage_pat.dw_cincoutpat
ll_max=Long(tab_cincout.tabpage_pat.dw_cincoutpat.Describe('datawindow.column.count')) 
FOR ll_row = 1 TO ll_max 
    ll_x[ll_row] = Long(tab_cincout.tabpage_pat.dw_cincoutpat.Describe('#'+String(ll_row)+'.width')) 
	 RegistrySet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\cincout","Wa"+string(ll_row), RegString!,string(ll_x[ll_row]))
NEXT
// get position : tab_cincout.tabpage_clinique.dw_cincoutwaitingroom
ll_max=Long(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.Describe('datawindow.column.count')) 
FOR ll_row = 1 TO ll_max 
    ll_x[ll_row] = Long(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.Describe('#'+String(ll_row)+'.width')) 
	 RegistrySet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\cincout","Wb"+string(ll_row), RegString!,string(ll_x[ll_row]))
NEXT
// get position : tab_cincout.tabpage_clinique.dw_cincoutseated
ll_max=Long(tab_cincout.tabpage_clinique.dw_cincoutseated.Describe('datawindow.column.count')) 
FOR ll_row = 1 TO ll_max 
    ll_x[ll_row] = Long(tab_cincout.tabpage_clinique.dw_cincoutseated.Describe('#'+String(ll_row)+'.width')) 
	 if ll_row = 3 then messagebox(string(ll_row),string(ll_x[ll_row]))
	 RegistrySet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\cincout","Wc"+string(ll_row), RegString!,string(ll_x[ll_row]))
NEXT
// get position : tab_cincout.tabpage_clinique.dw_cincoutreleased
ll_max=Long(tab_cincout.tabpage_clinique.dw_cincoutreleased.Describe('datawindow.column.count')) 
FOR ll_row = 1 TO ll_max 
    ll_x[ll_row] = Long(tab_cincout.tabpage_clinique.dw_cincoutreleased.Describe('#'+String(ll_row)+'.width')) 
	 RegistrySet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\cincout","Wd"+string(ll_row), RegString!,string(ll_x[ll_row]))
NEXT
// get position : tab_cincout.tabpage_quitte.dw_cincoutpatout
ll_max=Long(tab_cincout.tabpage_quitte.dw_cincoutpatout.Describe('datawindow.column.count')) 
FOR ll_row = 1 TO ll_max 
    ll_x[ll_row] = Long(tab_cincout.tabpage_quitte.dw_cincoutpatout.Describe('#'+String(ll_row)+'.width')) 
	 RegistrySet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\cincout","We"+string(ll_row), RegString!,string(ll_x[ll_row]))
NEXT
end subroutine

public subroutine uf_setpos ();long ll_max,ll_row
string ls_w

messagebox('set','')
// set position : tab_cincout.tabpage_pat.dw_cincoutpat
ll_max=Long(tab_cincout.tabpage_pat.dw_cincoutpat.Describe('datawindow.column.count')) 
FOR ll_row = 1 TO ll_max 
	 RegistryGet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\cincout","Wa"+string(ll_row), RegString!, ls_w)
	 tab_cincout.tabpage_pat.dw_cincoutpat.Modify('#'+String(ll_row)+'.width='+ls_w)
NEXT 
// set position : tab_cincout.tabpage_clinique.dw_cincoutwaitingroom
ll_max=Long(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.Describe('datawindow.column.count')) 
FOR ll_row = 1 TO ll_max 
	 RegistryGet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\cincout","Wb"+string(ll_row), RegString!, ls_w)
	 tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.Modify('#'+String(ll_row)+'.width='+ls_w)
NEXT 
// set position : tab_cincout.tabpage_clinique.dw_cincoutseated
ll_max=Long(tab_cincout.tabpage_clinique.dw_cincoutseated.Describe('datawindow.column.count')) 
FOR ll_row = 1 TO ll_max 
	 RegistryGet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\cincout","Wc"+string(ll_row), RegString!, ls_w)
	 tab_cincout.tabpage_clinique.dw_cincoutseated.Modify('#'+String(ll_row)+'.width='+ls_w)
NEXT 
// set position : tab_cincout.tabpage_clinique.dw_cincoutreleased
ll_max=Long(tab_cincout.tabpage_clinique.dw_cincoutreleased.Describe('datawindow.column.count')) 
FOR ll_row = 1 TO ll_max 
	 RegistryGet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\cincout","Wd"+string(ll_row), RegString!, ls_w)
	 tab_cincout.tabpage_clinique.dw_cincoutreleased.Modify('#'+String(ll_row)+'.width='+ls_w)
NEXT 
// set position : tab_cincout.tabpage_quitte.dw_cincoutpatout
ll_max=Long(tab_cincout.tabpage_quitte.dw_cincoutpatout.Describe('datawindow.column.count')) 
FOR ll_row = 1 TO ll_max 
	 RegistryGet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\cincout","We"+string(ll_row), RegString!, ls_w)
	 tab_cincout.tabpage_quitte.dw_cincoutpatout.Modify('#'+String(ll_row)+'.width='+ls_w)
NEXT 
end subroutine

public subroutine uf_setposw ();long ll_wPat, ll_wRDV, ll_wArrive, ll_wRdvetat, ll_wAttente, ll_wTrait
long ll_wDuree, ll_wSalle, ll_count
double ldb_ratio

select count(*) into :ll_count from t_cincoutpos where ortho_id = :il_horshareid;

if ll_count > 0 then
	select wPat, wRDV, wArrive, wRdvetat,wAttente, wTrait, wDuree, wSalle
	into :ll_wPat, :ll_wRDV, :ll_wArrive, :ll_wRdvetat, :ll_wAttente, :ll_wTrait,
		  :ll_wDuree, :ll_wSalle
	from t_cincoutpos
	where ortho_id = :il_horshareid;

	ldb_ratio = double(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.width) / double(3054)

	tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.patnom.width = long(ll_wPat * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.rdvheure.width = long(ll_wRDV * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.heurearr.width = long(ll_wArrive * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.rdvetat.width = long(ll_wRdvetat * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.c_waiting.width = long(ll_wAttente * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.traitnom.width = long(ll_wTrait * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.duree.width = long(ll_wDuree * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.compute_1.width = long(ll_wSalle * ldb_ratio)
end if
end subroutine

public subroutine uf_setposs ();long ll_sSalle, ll_sPat, ll_sAssis, ll_sReady, ll_sAttente, ll_sTrait, ll_sDuree 
long ll_sNote, ll_sHeure, ll_count
double ldb_ratio

select count(*) into :ll_count from t_cincoutpos where ortho_id = :il_horshareid;
if ll_count > 0 then
	select isnull(sSalle,384), isnull(sPat,544), isnull(sAssis,297), isnull(sReady,297), 
			 isnull(sAttente,283), isnull(sTrait,475), isnull(sDuree,215), isnull(sNote,453),
			 isnull(sHeure,302)
	into :ll_sSalle, :ll_sPat, :ll_sAssis, :ll_sReady, :ll_sAttente, :ll_sTrait,
		  :ll_sDuree, :ll_sNote, :ll_sHeure
	from t_cincoutpos
	where ortho_id = :il_horshareid;
	
	ldb_ratio = double(tab_cincout.tabpage_clinique.dw_cincoutseated.width) / double(3054)
	
	tab_cincout.tabpage_clinique.dw_cincoutseated.object.station.width = long(ll_sSalle * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutseated.object.patnom.width = long(ll_sPat * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutseated.object.seated.width = long(ll_sAssis * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutseated.object.ready.width = long(ll_sReady * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutseated.object.compute_1.width = long(ll_sAttente * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutseated.object.traitnom.width = long(ll_sTrait * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutseated.object.duree.width = long(ll_sDuree * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutseated.object.t_rdv_cincoutnote.width = long(ll_sNote * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutseated.object.t_rdv_rdvheure.width = long(ll_sHeure * ldb_ratio)
end if

end subroutine

public subroutine uf_setposr ();long ll_rPat, ll_rFinTrait, ll_rAttente, ll_rNote, ll_count
double ldb_ratio

select count(*) into :ll_count from t_cincoutpos where ortho_id = :il_horshareid;

if ll_count > 0 then
	select isnull(rPat,1061), isnull(rFinTrait,402), isnull(rAttente,366), isnull(rNote,1029)
	into :ll_rPat, :ll_rFinTrait, :ll_rAttente, :ll_rNote
	from t_cincoutpos
	where ortho_id = :il_horshareid;
	
	ldb_ratio = double(tab_cincout.tabpage_clinique.dw_cincoutreleased.width) / double(3054)
	
	tab_cincout.tabpage_clinique.dw_cincoutreleased.object.patnom.width = long(ll_rPat * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutreleased.object.t_rdv_released.width = long(ll_rFinTrait * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutreleased.object.compute_1.width = long(ll_rAttente * ldb_ratio)
	tab_cincout.tabpage_clinique.dw_cincoutreleased.object.t_rdv_cincoutnote1.width = long(ll_rNote * ldb_ratio)
end if
end subroutine

public subroutine uf_getposw ();long ll_wPat, ll_wRDV, ll_wArrive, ll_wRdvetat, ll_wAttente, ll_wTrait
long ll_wDuree, ll_wSalle
long ll_count
double ldb_ratio

ldb_ratio = double(3054) / double(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.width)

ll_wPat = long(long(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.patnom.width) * ldb_ratio)
ll_wRDV = long(long(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.rdvheure.width) * ldb_ratio)
ll_wArrive = long(long(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.heurearr.width) * ldb_ratio)
ll_wRdvetat = long(long(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.rdvetat.width) * ldb_ratio)
ll_wAttente = long(long(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.c_waiting.width) * ldb_ratio)
ll_wTrait = long(long(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.traitnom.width) * ldb_ratio)
ll_wDuree = long(long(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.duree.width) * ldb_ratio)
ll_wSalle = long(long(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.compute_1.width) * ldb_ratio)

select count(*) into :ll_count from t_cincoutpos where ortho_id = :il_horshareid;
if ll_count > 0 then
	update t_cincoutpos set wPat = :ll_wPat,
									wRDV = :ll_wRDV, 
									wArrive = :ll_wArrive,
									wRdvetat = :ll_wRdvetat, 
									wAttente = :ll_wAttente, 
									wTrait = :ll_wTrait,
									wDuree = :ll_wDuree, 
									wSalle = :ll_wSalle
	where ortho_id = :il_horshareid;
	error_type(-1)
else
	insert into t_cincoutpos(wPat,wRDV,wArrive,wRdvetat,wAttente,wTrait,wDuree,wSalle,ortho_id) 
	values(:ll_wPat, :ll_wRDV, :ll_wArrive, :ll_wRdvetat, :ll_wAttente, :ll_wTrait, :ll_wDuree, :ll_wSalle, :il_horshareid);
	error_type(-1)
end if

end subroutine

public subroutine uf_getposs ();long ll_sSalle, ll_sPat, ll_sAssis, ll_sReady, ll_sAttente, ll_sTrait, ll_sDuree 
long ll_sNote, ll_sHeure 
long ll_count
double ldb_ratio

ldb_ratio = double(3054) / double(tab_cincout.tabpage_clinique.dw_cincoutseated.width)

ll_sSalle = long(long(tab_cincout.tabpage_clinique.dw_cincoutseated.object.station.width) * ldb_ratio)
ll_sPat = long(long(tab_cincout.tabpage_clinique.dw_cincoutseated.object.patnom.width) * ldb_ratio)
ll_sAssis = long(long(tab_cincout.tabpage_clinique.dw_cincoutseated.object.seated.width) * ldb_ratio)
ll_sReady = long(long(tab_cincout.tabpage_clinique.dw_cincoutseated.object.ready.width) * ldb_ratio)
ll_sAttente = long(long(tab_cincout.tabpage_clinique.dw_cincoutseated.object.compute_1.width) * ldb_ratio)
ll_sTrait = long(long(tab_cincout.tabpage_clinique.dw_cincoutseated.object.traitnom.width) * ldb_ratio)
ll_sDuree = long(long(tab_cincout.tabpage_clinique.dw_cincoutseated.object.duree.width) * ldb_ratio)
ll_sNote = long(long(tab_cincout.tabpage_clinique.dw_cincoutseated.object.t_rdv_cincoutnote.width) * ldb_ratio)
ll_sHeure = long(long(tab_cincout.tabpage_clinique.dw_cincoutseated.object.t_rdv_rdvheure.width) * ldb_ratio)

select count(*) into :ll_count from t_cincoutpos where ortho_id = :il_horshareid;
if ll_count > 0 then
	update t_cincoutpos set	sSalle = :ll_sSalle, 
				sPat = :ll_sPat,
				sAssis = :ll_sAssis,
				sReady = :ll_sReady, 
				sAttente = :ll_sAttente, 
				sTrait = :ll_sTrait, 
				sDuree = :ll_sDuree,
				sNote = :ll_sNote,
				sHeure = :ll_sHeure
	from t_cincoutpos
	where ortho_id = :il_horshareid;
	error_type(-1)
else
	insert into t_cincoutpos(sPat,sAssis,sReady,sAttente,sTrait,sDuree,sNote,sHeure,ortho_id)
	values(:ll_sPat,:ll_sAssis,:ll_sReady,:ll_sAttente,:ll_sTrait,:ll_sDuree,:ll_sNote,:ll_sHeure,:il_horshareid);
	error_type(-1)
end if
end subroutine

public subroutine uf_getposr ();long ll_rPat, ll_rFinTrait, ll_rAttente, ll_rNote
long ll_count
double ldb_ratio

ldb_ratio = double(3054) / double(tab_cincout.tabpage_clinique.dw_cincoutreleased.width)

ll_rPat = long(long(tab_cincout.tabpage_clinique.dw_cincoutreleased.object.patnom.width) * ldb_ratio)
ll_rFinTrait = long(long(tab_cincout.tabpage_clinique.dw_cincoutreleased.object.t_rdv_released.width) * ldb_ratio)
ll_rAttente = long(long(tab_cincout.tabpage_clinique.dw_cincoutreleased.object.compute_1.width) * ldb_ratio)
ll_rNote = long(long(tab_cincout.tabpage_clinique.dw_cincoutreleased.object.t_rdv_cincoutnote1.width) * ldb_ratio)

select count(*) into :ll_count from t_cincoutpos where ortho_id = :il_horshareid;
if ll_count > 0 then
	update t_cincoutpos set	rPat = :ll_rPat, 
				rFinTrait = :ll_rFinTrait, 
				rAttente = :ll_rAttente,
				rNote = :ll_rNote
	where ortho_id = :il_horshareid;
	error_type(-1)
else
	insert t_cincoutpos(rPat, rFinTrait, rAttente, rNote,ortho_id)
	values(:ll_rPat, :ll_rFinTrait, :ll_rAttente, :ll_rNote,:il_horshareid);
	error_type(-1)
end if


end subroutine

public subroutine of_setstation (dragobject source, integer ai_station, statictext sttext);time lt_seated
DataWindow ldw_Source
long ll_idpers, ll_operateurconsole

IF source.TypeOf() = DataWindow! THEN
	ldw_Source = source
END IF

if ii_heurerdv = 1 then
	lt_seated = tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.getitemtime(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.getrow(),'rdvheure')
else
	if ldw_Source.dataobject = 'd_cincoutseated' then
		lt_seated = tab_cincout.tabpage_clinique.dw_cincoutseated.getItemTime(tab_cincout.tabpage_clinique.dw_cincoutseated.getRow(),"seated")
	else
		lt_seated = now()
	end if
end if

select isnull(t_options.operateurconsole,0) into :ll_operateurconsole from t_options where ortho_id = :v_no_ortho;

if ll_operateurconsole = 1 then

	delete from t_operateurs where id_rdv = :il_idrdv;
	commit using SQLCA;
	
	open(w_operateurs)
	
	ll_idpers = message.doubleparm
	insert into t_operateurs(id_user,id_rdv) values(:ll_idpers,:il_idrdv);
	commit using sqlca;
	error_type(-1)
	
end if

update t_rdv set seated = :lt_seated,nostation = :ai_station,station = :sttext.text,color = 16777215 where id_rdv = :il_idrdv;
commit using sqlca;
error_type(-1)

tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.event ue_retrieve()
tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_retrieve()
sttext.drag(End!)
end subroutine

public subroutine of_setcout (long al_rdv);long ll_idrdv,ll_traitid
integer li_horstep,li_chrg
decimal{2} ld_duree,ld_taux,ld_chrgasslib
date ldt_rdvdate
time lt_heurearr,lt_heuredep,lt_seated,lt_released

// calcul de la charge
select hor_step into :li_horstep from t_options where ortho_id = :il_horshareid;

select 	 typetraitid,
			 seated
	into   :ll_traitid,:lt_seated
	from	 t_rdv inner join patient on t_rdv.patient_id = patient.patient_id
	where  t_rdv.id_rdv > :al_rdv;

select addtocharge into :li_chrg from type_de_traitement where ortho_id = :il_horshareid and type_traitement_id = :ll_traitid;
if li_chrg = 1 then
	select max(chargtaux) into :ld_taux from t_charges where ortho_id = :il_horshareid and chargdate <= :ldt_rdvdate;
	ld_chrgasslib = (SecondsAfter(lt_seated,lt_released) / 60) * ld_taux
else
	ld_chrgasslib = 0
end if


update t_rdv set released = now(),chrgasslib = :ld_chrgasslib where id_rdv = :al_rdv;
commit using sqlca;
error_type(-1)

tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_retrieve()
tab_cincout.tabpage_clinique.dw_cincoutreleased.event ue_retrieve()
end subroutine

public subroutine of_setstation (integer ai_station, statictext sttext);time lt_seated

open(w_operateurs)

if ii_heurerdv = 1 then
	lt_seated = tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.getitemtime(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.getrow(),'rdvheure')
else
	lt_seated = now()
end if

update t_rdv set seated = :lt_seated,nostation = :ai_station,station = :sttext.text,color = 16777215 where id_rdv = :il_idrdv;
commit using sqlca;
error_type(-1)

tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.event ue_retrieve()
tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_retrieve()
end subroutine

on w_cincout.create
int iCurrent
call super::create
this.pb_ou13=create pb_ou13
this.pb_in13=create pb_in13
this.st_14=create st_14
this.st_t13=create st_t13
this.pb_out12=create pb_out12
this.pb_in12=create pb_in12
this.st_t12=create st_t12
this.st_station12=create st_station12
this.st_13=create st_13
this.pb_out11=create pb_out11
this.pb_in11=create pb_in11
this.st_11=create st_11
this.st_t11=create st_t11
this.st_station11=create st_station11
this.cb_carte=create cb_carte
this.pb_in10=create pb_in10
this.pb_out9=create pb_out9
this.pb_in9=create pb_in9
this.pb_out8=create pb_out8
this.pb_in8=create pb_in8
this.pb_out7=create pb_out7
this.pb_in7=create pb_in7
this.pb_out6=create pb_out6
this.pb_in6=create pb_in6
this.pb_out5=create pb_out5
this.pb_in5=create pb_in5
this.pb_out4=create pb_out4
this.pb_in4=create pb_in4
this.pb_out3=create pb_out3
this.pb_in3=create pb_in3
this.pb_out2=create pb_out2
this.pb_in2=create pb_in2
this.pb_in1=create pb_in1
this.pb_out1=create pb_out1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.st_t10=create st_t10
this.st_t9=create st_t9
this.st_9=create st_9
this.st_10=create st_10
this.st_station10=create st_station10
this.st_station9=create st_station9
this.st_t7=create st_t7
this.st_t6=create st_t6
this.st_t5=create st_t5
this.st_t4=create st_t4
this.st_t3=create st_t3
this.st_t2=create st_t2
this.st_t1=create st_t1
this.cb_refresh=create cb_refresh
this.st_time=create st_time
this.cb_cout=create cb_cout
this.st_station7=create st_station7
this.st_station6=create st_station6
this.st_station5=create st_station5
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_close=create cb_close
this.cb_cin=create cb_cin
this.st_station8=create st_station8
this.st_station1=create st_station1
this.st_station2=create st_station2
this.st_station3=create st_station3
this.st_station4=create st_station4
this.st_t8=create st_t8
this.dw_horjour=create dw_horjour
this.tab_cincout=create tab_cincout
this.pb_out10=create pb_out10
this.st_station13=create st_station13
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_ou13
this.Control[iCurrent+2]=this.pb_in13
this.Control[iCurrent+3]=this.st_14
this.Control[iCurrent+4]=this.st_t13
this.Control[iCurrent+5]=this.pb_out12
this.Control[iCurrent+6]=this.pb_in12
this.Control[iCurrent+7]=this.st_t12
this.Control[iCurrent+8]=this.st_station12
this.Control[iCurrent+9]=this.st_13
this.Control[iCurrent+10]=this.pb_out11
this.Control[iCurrent+11]=this.pb_in11
this.Control[iCurrent+12]=this.st_11
this.Control[iCurrent+13]=this.st_t11
this.Control[iCurrent+14]=this.st_station11
this.Control[iCurrent+15]=this.cb_carte
this.Control[iCurrent+16]=this.pb_in10
this.Control[iCurrent+17]=this.pb_out9
this.Control[iCurrent+18]=this.pb_in9
this.Control[iCurrent+19]=this.pb_out8
this.Control[iCurrent+20]=this.pb_in8
this.Control[iCurrent+21]=this.pb_out7
this.Control[iCurrent+22]=this.pb_in7
this.Control[iCurrent+23]=this.pb_out6
this.Control[iCurrent+24]=this.pb_in6
this.Control[iCurrent+25]=this.pb_out5
this.Control[iCurrent+26]=this.pb_in5
this.Control[iCurrent+27]=this.pb_out4
this.Control[iCurrent+28]=this.pb_in4
this.Control[iCurrent+29]=this.pb_out3
this.Control[iCurrent+30]=this.pb_in3
this.Control[iCurrent+31]=this.pb_out2
this.Control[iCurrent+32]=this.pb_in2
this.Control[iCurrent+33]=this.pb_in1
this.Control[iCurrent+34]=this.pb_out1
this.Control[iCurrent+35]=this.cb_2
this.Control[iCurrent+36]=this.cb_1
this.Control[iCurrent+37]=this.st_t10
this.Control[iCurrent+38]=this.st_t9
this.Control[iCurrent+39]=this.st_9
this.Control[iCurrent+40]=this.st_10
this.Control[iCurrent+41]=this.st_station10
this.Control[iCurrent+42]=this.st_station9
this.Control[iCurrent+43]=this.st_t7
this.Control[iCurrent+44]=this.st_t6
this.Control[iCurrent+45]=this.st_t5
this.Control[iCurrent+46]=this.st_t4
this.Control[iCurrent+47]=this.st_t3
this.Control[iCurrent+48]=this.st_t2
this.Control[iCurrent+49]=this.st_t1
this.Control[iCurrent+50]=this.cb_refresh
this.Control[iCurrent+51]=this.st_time
this.Control[iCurrent+52]=this.cb_cout
this.Control[iCurrent+53]=this.st_station7
this.Control[iCurrent+54]=this.st_station6
this.Control[iCurrent+55]=this.st_station5
this.Control[iCurrent+56]=this.st_8
this.Control[iCurrent+57]=this.st_7
this.Control[iCurrent+58]=this.st_6
this.Control[iCurrent+59]=this.st_5
this.Control[iCurrent+60]=this.st_4
this.Control[iCurrent+61]=this.st_3
this.Control[iCurrent+62]=this.st_2
this.Control[iCurrent+63]=this.st_1
this.Control[iCurrent+64]=this.cb_close
this.Control[iCurrent+65]=this.cb_cin
this.Control[iCurrent+66]=this.st_station8
this.Control[iCurrent+67]=this.st_station1
this.Control[iCurrent+68]=this.st_station2
this.Control[iCurrent+69]=this.st_station3
this.Control[iCurrent+70]=this.st_station4
this.Control[iCurrent+71]=this.st_t8
this.Control[iCurrent+72]=this.dw_horjour
this.Control[iCurrent+73]=this.tab_cincout
this.Control[iCurrent+74]=this.pb_out10
this.Control[iCurrent+75]=this.st_station13
end on

on w_cincout.destroy
call super::destroy
destroy(this.pb_ou13)
destroy(this.pb_in13)
destroy(this.st_14)
destroy(this.st_t13)
destroy(this.pb_out12)
destroy(this.pb_in12)
destroy(this.st_t12)
destroy(this.st_station12)
destroy(this.st_13)
destroy(this.pb_out11)
destroy(this.pb_in11)
destroy(this.st_11)
destroy(this.st_t11)
destroy(this.st_station11)
destroy(this.cb_carte)
destroy(this.pb_in10)
destroy(this.pb_out9)
destroy(this.pb_in9)
destroy(this.pb_out8)
destroy(this.pb_in8)
destroy(this.pb_out7)
destroy(this.pb_in7)
destroy(this.pb_out6)
destroy(this.pb_in6)
destroy(this.pb_out5)
destroy(this.pb_in5)
destroy(this.pb_out4)
destroy(this.pb_in4)
destroy(this.pb_out3)
destroy(this.pb_in3)
destroy(this.pb_out2)
destroy(this.pb_in2)
destroy(this.pb_in1)
destroy(this.pb_out1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.st_t10)
destroy(this.st_t9)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.st_station10)
destroy(this.st_station9)
destroy(this.st_t7)
destroy(this.st_t6)
destroy(this.st_t5)
destroy(this.st_t4)
destroy(this.st_t3)
destroy(this.st_t2)
destroy(this.st_t1)
destroy(this.cb_refresh)
destroy(this.st_time)
destroy(this.cb_cout)
destroy(this.st_station7)
destroy(this.st_station6)
destroy(this.st_station5)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_close)
destroy(this.cb_cin)
destroy(this.st_station8)
destroy(this.st_station1)
destroy(this.st_station2)
destroy(this.st_station3)
destroy(this.st_station4)
destroy(this.st_t8)
destroy(this.dw_horjour)
destroy(this.tab_cincout)
destroy(this.pb_out10)
destroy(this.st_station13)
end on

event timer;call super::timer;long ll_color
integer i,li_rowcount,li_nostation,li_duree,li_var
time lt_seated,lt_station1
string ls_cincoutnote

st_time.text = String(now())

if this <> w_principal.getActiveSheet() then return 0

if t < ii_int_refresh then
	t ++
	return 0
end if

// faire un master refresh aux X secondes
timer(0, this)

tab_cincout.tabpage_pat.dw_cincoutpat.event ue_retrieve()
tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.event ue_retrieve()
tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_retrieve()
tab_cincout.tabpage_clinique.dw_cincoutreleased.event ue_retrieve()
tab_cincout.tabpage_quitte.dw_cincoutpatout.event ue_retrieve()

if ii_method = 1 then
	li_rowcount = tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount()
	if li_rowcount > 0 then
		for i = 1 to li_rowcount
			li_nostation = tab_cincout.tabpage_clinique.dw_cincoutseated.getitemnumber(i,'t_rdv_nostation')
			lt_seated = tab_cincout.tabpage_clinique.dw_cincoutseated.getitemtime(i,'seated')
			ll_color = tab_cincout.tabpage_clinique.dw_cincoutseated.getitemnumber(i,'t_rdv_color')
			ls_cincoutnote = tab_cincout.tabpage_clinique.dw_cincoutseated.getitemstring(i,'t_rdv_cincoutnote')
			if li_nostation = 1 then
				lt_station1 = relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()))
				st_station1.text = string(lt_station1)
				st_station1.BackColor = ll_color
				st_t1.Backcolor = ll_color
				st_t1.text = ls_cincoutnote
			elseif not uf_ispresent(1) then
				st_station1.text = ''
				st_station1.BackColor = 16777215
				st_t1.Backcolor = 16777215
				st_t1.text = ''
			end if
			if li_nostation = 2 then
				st_station2.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now())))
				st_station2.BackColor = ll_color
				st_t2.Backcolor = ll_color
				st_t2.text = ls_cincoutnote
			elseif not uf_ispresent(2) then
				st_station2.text = ''
				st_t2.text = ''
				st_station2.BackColor = 16777215
				st_t2.Backcolor = 16777215
			end if
			if li_nostation = 3 then
				st_station3.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now())))
				st_station3.BackColor = ll_color
				st_t3.Backcolor = ll_color
				st_t3.text = ls_cincoutnote
			elseif not uf_ispresent(3) then
				st_station3.text = ''
				st_t3.text = ''
				st_station3.BackColor = 16777215
				st_t3.Backcolor = 16777215
			end if
			if li_nostation = 4 then
				st_station4.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now())))
				st_station4.BackColor = ll_color
				st_t4.Backcolor = ll_color
				st_t4.text = ls_cincoutnote
			elseif not uf_ispresent(4) then
				st_station4.text = ''
				st_t4.text = ''
				st_station4.BackColor = 16777215
				st_t4.Backcolor = 16777215
			end if
			if li_nostation = 5 then
				st_station5.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now())))
				st_station5.BackColor = ll_color
				st_t5.Backcolor = ll_color
				st_t5.text = ls_cincoutnote
			elseif not uf_ispresent(5) then
				st_station5.text = ''
				st_t5.text = ''
				st_station5.BackColor = 16777215
				st_t5.Backcolor = 16777215
			end if
			if li_nostation = 6 then
				st_station6.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now())))
				st_station6.BackColor = ll_color
				st_t6.Backcolor = ll_color
				st_t6.text = ls_cincoutnote
			elseif not uf_ispresent(6) then
				st_station6.text = ''
				st_t6.text = ''
				st_station6.BackColor = 16777215
				st_t6.Backcolor = 16777215
			end if
			if li_nostation = 7 then
				st_station7.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now())))
				st_station7.BackColor = ll_color
				st_t7.Backcolor = ll_color
				st_t7.text = ls_cincoutnote
			elseif not uf_ispresent(7) then
				st_station7.text = ''
				st_t7.text = ''
				st_station7.BackColor = 16777215
				st_t7.Backcolor = 16777215
			end if
			if li_nostation = 8 then
				st_station8.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now())))
				st_station8.BackColor = ll_color
				st_t8.Backcolor = ll_color
				st_t8.text = ls_cincoutnote
			elseif not uf_ispresent(8) then
				st_station8.text = ''
				st_t8.text = ''
				st_station8.BackColor = 16777215
				st_t8.Backcolor = 16777215
			end if
			if li_nostation = 9 then
				st_station9.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now())))
				st_station9.BackColor = ll_color
				st_t9.Backcolor = ll_color
				st_t9.text = ls_cincoutnote
			elseif not uf_ispresent(9) then
				st_station9.text = ''
				st_t9.text = ''
				st_station9.BackColor = 16777215
				st_t9.Backcolor = 16777215
			end if
			if li_nostation = 10 then
				st_station10.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now())))
				st_station10.BackColor = ll_color
				st_t10.Backcolor = ll_color
				st_t10.text = ls_cincoutnote
			elseif not uf_ispresent(10) then
				st_station10.text = ''
				st_t10.text = ''
				st_station10.BackColor = 16777215
				st_t10.Backcolor = 16777215
			end if
			if li_nostation = 11 then
				st_station11.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now())))
				st_station11.BackColor = ll_color
				st_t11.Backcolor = ll_color
				st_t11.text = ls_cincoutnote
			elseif not uf_ispresent(11) then
				st_station11.text = ''
				st_t11.text = ''
				st_station11.BackColor = 16777215
				st_t11.Backcolor = 16777215
			end if
			if li_nostation = 12 then
				st_station12.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now())))
				st_station12.BackColor = ll_color
				st_t12.Backcolor = ll_color
				st_t12.text = ls_cincoutnote
			elseif not uf_ispresent(12) then
				st_station12.text = ''
				st_t12.text = ''
				st_station12.BackColor = 16777215
				st_t12.Backcolor = 16777215
			end if
			if li_nostation = 13 then
				st_station13.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now())))
				st_station13.BackColor = ll_color
				st_t13.Backcolor = ll_color
				st_t13.text = ls_cincoutnote
			elseif not uf_ispresent(13) then
				st_station13.text = ''
				st_t13.text = ''
				st_station13.BackColor = 16777215
				st_t13.Backcolor = 16777215
			end if
		next
	else
		st_station1.text = ''
		st_station1.BackColor = 16777215
		st_t1.Backcolor = 16777215
		st_station2.text = ''
		st_station2.BackColor = 16777215
		st_t2.Backcolor = 16777215
		st_station3.text = ''
		st_station3.BackColor = 16777215
		st_t3.Backcolor = 16777215
		st_station4.text = ''
		st_station4.BackColor = 16777215
		st_t4.Backcolor = 16777215
		st_station5.text = ''
		st_station5.BackColor = 16777215
		st_t5.Backcolor = 16777215
		st_station6.text = ''
		st_station6.BackColor = 16777215
		st_t6.Backcolor = 16777215
		st_station7.text = ''
		st_station7.BackColor = 16777215
		st_t7.Backcolor = 16777215
		st_station8.text = ''
		st_station8.BackColor = 16777215
		st_t8.Backcolor = 16777215
		st_station9.text = ''
		st_station9.BackColor = 16777215
		st_t9.Backcolor = 16777215
		st_station10.text = ''
		st_station10.BackColor = 16777215
		st_t10.Backcolor = 16777215
		st_station11.text = ''
		st_station11.BackColor = 16777215
		st_t11.Backcolor = 16777215
		st_station12.text = ''
		st_station12.BackColor = 16777215
		st_t12.Backcolor = 16777215
		st_station13.text = ''
		st_station13.BackColor = 16777215
		st_t13.Backcolor = 16777215
	end if
	tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.setredraw(true)
	tab_cincout.tabpage_clinique.dw_cincoutseated.setredraw(true)
	tab_cincout.tabpage_clinique.dw_cincoutreleased.setredraw(true)
elseif ii_method = 2 then
	li_rowcount = tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount()
	if li_rowcount > 0 then
		for i = 1 to li_rowcount
			li_nostation = tab_cincout.tabpage_clinique.dw_cincoutseated.getitemnumber(i,'t_rdv_nostation')
			lt_seated = tab_cincout.tabpage_clinique.dw_cincoutseated.getitemtime(i,'seated')
			ll_color = tab_cincout.tabpage_clinique.dw_cincoutseated.getitemnumber(i,'t_rdv_color')
			li_duree = tab_cincout.tabpage_clinique.dw_cincoutseated.getitemnumber(i,'duree')
			ls_cincoutnote = tab_cincout.tabpage_clinique.dw_cincoutseated.getitemstring(i,'t_rdv_cincoutnote')
			if li_nostation = 1 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station1.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if isnull(il_couleurretard) = false then
						st_station1.BackColor = il_couleurretard
						st_t1.Backcolor = il_couleurretard
					else
						st_station1.BackColor = ll_color
						st_t1.Backcolor = ll_color
					end if
				else
					st_station1.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station1.BackColor = ll_color
					st_t1.Backcolor = ll_color
				end if
				st_t1.text = ls_cincoutnote
			elseif not uf_ispresent(1) then
				st_station1.text = ''
				st_station1.BackColor = 16777215
				st_t1.Backcolor = 16777215
				st_t1.text = ''
			end if
			if li_nostation = 2 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station2.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if not isnull(il_couleurretard) then
						st_station2.BackColor = il_couleurretard
						st_t2.Backcolor = il_couleurretard
					else
						st_station2.BackColor = ll_color
						st_t2.Backcolor = ll_color
					end if
				else
					st_station2.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station2.BackColor = ll_color
					st_t2.Backcolor = ll_color
				end if
				st_t2.text = ls_cincoutnote
			elseif not uf_ispresent(2) then
				st_station2.text = ''
				st_station2.BackColor = 16777215
				st_t2.Backcolor = 16777215
				st_t2.text = ''
			end if
			if li_nostation = 3 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station3.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if not isnull(il_couleurretard) then
						st_station3.BackColor = il_couleurretard
						st_t3.Backcolor = il_couleurretard
					else
						st_station3.BackColor = ll_color
						st_t3.Backcolor = ll_color
					end if
				else
					st_station3.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station3.BackColor = ll_color
					st_t3.Backcolor = ll_color
				end if
				st_t3.text = ls_cincoutnote
			elseif not uf_ispresent(3) then
				st_station3.text = ''
				st_station3.BackColor = 16777215
				st_t3.Backcolor = 16777215
				st_t3.text = ''
			end if
			if li_nostation = 4 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station4.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if isnull(il_couleurretard) = false then
						st_station4.BackColor = il_couleurretard
						st_t4.Backcolor = il_couleurretard
					else
						st_station4.BackColor = ll_color
						st_t4.Backcolor = ll_color
					end if
				else
					st_station4.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station4.BackColor = ll_color
					st_t4.Backcolor = ll_color
				end if
				st_t4.text = ls_cincoutnote
			elseif not uf_ispresent(4) then
				st_station4.text = ''
				st_station4.BackColor = 16777215
				st_t4.Backcolor = 16777215
				st_t4.text = ''
			end if
			if li_nostation = 5 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station5.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if not isnull(il_couleurretard) then
						st_station5.BackColor = il_couleurretard
						st_t5.Backcolor = il_couleurretard
					else
						st_station5.BackColor = ll_color
						st_t5.Backcolor = ll_color
					end if
				else
					st_station5.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station5.BackColor = ll_color
					st_t5.Backcolor = ll_color
				end if
				st_t5.text = ls_cincoutnote
			elseif not uf_ispresent(5) then
				st_station5.text = ''
				st_station5.BackColor = 16777215
				st_t5.Backcolor = 16777215
				st_t5.text = ''
			end if
			if li_nostation = 6 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station6.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if isnull(il_couleurretard) = false then
						st_station6.BackColor = il_couleurretard
						st_t6.Backcolor = il_couleurretard
					else
						st_station6.BackColor = ll_color
						st_t6.Backcolor = ll_color
					end if
				else
					st_station6.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station6.BackColor = ll_color
					st_t6.Backcolor = ll_color
				end if
				st_t6.text = ls_cincoutnote
			elseif not uf_ispresent(6) then
				st_station6.text = ''
				st_station6.BackColor = 16777215
				st_t6.Backcolor = 16777215
				st_t6.text = ''
			end if
			if li_nostation = 7 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station7.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if not isnull(il_couleurretard) then
						st_station7.BackColor = il_couleurretard
						st_t7.Backcolor = il_couleurretard
					else
						st_station7.BackColor = ll_color
						st_t7.Backcolor = ll_color
					end if
				else
					st_station7.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station7.BackColor = ll_color
					st_t7.Backcolor = ll_color
				end if
				st_t7.text = ls_cincoutnote
			elseif not uf_ispresent(7) then
				st_station7.text = ''
				st_station7.BackColor = 16777215
				st_t7.Backcolor = 16777215
				st_t7.text = ''
			end if
			if li_nostation = 8 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station8.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if not isnull(il_couleurretard) then
						st_station8.BackColor = il_couleurretard
						st_t8.Backcolor = il_couleurretard
					else
						st_station8.BackColor = ll_color
						st_t8.Backcolor = ll_color
					end if
				else
					st_station8.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station8.BackColor = ll_color
					st_t8.Backcolor = ll_color
				end if
				st_t8.text = ls_cincoutnote
			elseif not uf_ispresent(8) then
				st_station8.text = ''
				st_station8.BackColor = 16777215
				st_t8.Backcolor = 16777215
				st_t8.text = ''
			end if
			if li_nostation = 9 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station9.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if not isnull(il_couleurretard) then
						st_station9.BackColor = il_couleurretard
						st_t9.Backcolor = il_couleurretard
					else
						st_station9.BackColor = ll_color
						st_t9.Backcolor = ll_color
					end if
				else
					st_station9.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station9.BackColor = ll_color
					st_t9.Backcolor = ll_color
				end if
				st_t9.text = ls_cincoutnote
			elseif not uf_ispresent(9) then
				st_station9.text = ''
				st_station9.BackColor = 16777215
				st_t9.Backcolor = 16777215
				st_t9.text = ''
			end if
			if li_nostation = 10 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station10.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if not isnull(il_couleurretard) then
						st_station10.BackColor = il_couleurretard
						st_t10.Backcolor = il_couleurretard
					else
						st_station10.BackColor = ll_color
						st_t10.Backcolor = ll_color
					end if
				else
					st_station10.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station10.BackColor = ll_color
					st_t10.Backcolor = ll_color
				end if
				st_t10.text = ls_cincoutnote
			elseif not uf_ispresent(10) then
				st_station10.text = ''
				st_station10.BackColor = 16777215
				st_t10.Backcolor = 16777215
				st_t10.text = ''
			end if
			if li_nostation = 11 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station11.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if not isnull(il_couleurretard) then
						st_station11.BackColor = il_couleurretard
						st_t11.Backcolor = il_couleurretard
					else
						st_station11.BackColor = ll_color
						st_t11.Backcolor = ll_color
					end if
				else
					st_station11.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station11.BackColor = ll_color
					st_t11.Backcolor = ll_color
				end if
				st_t11.text = ls_cincoutnote
			elseif not uf_ispresent(11) then
				st_station11.text = ''
				st_station11.BackColor = 16777215
				st_t11.Backcolor = 16777215
				st_t11.text = ''
			end if
			if li_nostation = 12 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station12.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if not isnull(il_couleurretard) then
						st_station12.BackColor = il_couleurretard
						st_t12.Backcolor = il_couleurretard
					else
						st_station12.BackColor = ll_color
						st_t12.Backcolor = ll_color
					end if
				else
					st_station12.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station12.BackColor = ll_color
					st_t12.Backcolor = ll_color
				end if
				st_t12.text = ls_cincoutnote
			elseif not uf_ispresent(12) then
				st_station12.text = ''
				st_station12.BackColor = 16777215
				st_t12.Backcolor = 16777215
				st_t12.text = ''
			end if
			if li_nostation = 13 then
				li_var = (li_duree * 60 * ii_horstep) - secondsafter(lt_seated,now())
				if li_var < 0 then
					st_station13.text = string(relativetime(time('00:00:00.000'),secondsafter(lt_seated,now()) - (li_duree * 60 * ii_horstep)))
					// option background en rouge si retard a lieu
					if not isnull(il_couleurretard) then
						st_station13.BackColor = il_couleurretard
						st_t13.Backcolor = il_couleurretard
					else
						st_station13.BackColor = ll_color
						st_t13.Backcolor = ll_color
					end if
				else
					st_station13.text = '-' + string(relativetime(time('00:00:00.000'),li_var))
					st_station13.BackColor = ll_color
					st_t13.Backcolor = ll_color
				end if
				st_t13.text = ls_cincoutnote
			elseif not uf_ispresent(13) then
				st_station13.text = ''
				st_station13.BackColor = 16777215
				st_t13.Backcolor = 16777215
				st_t13.text = ''
			end if
		next
	else
		st_station1.text = ''
		st_station1.BackColor = 16777215
		st_t1.Backcolor = 16777215
		st_station2.text = ''
		st_station2.BackColor = 16777215
		st_t2.Backcolor = 16777215
		st_station3.text = ''
		st_station3.BackColor = 16777215
		st_t3.Backcolor = 16777215
		st_station4.text = ''
		st_station4.BackColor = 16777215
		st_t4.Backcolor = 16777215
		st_station5.text = ''
		st_station5.BackColor = 16777215
		st_t5.Backcolor = 16777215
		st_station6.text = ''
		st_station6.BackColor = 16777215
		st_t6.Backcolor = 16777215
		st_station7.text = ''
		st_station7.BackColor = 16777215
		st_t7.Backcolor = 16777215
		st_station8.text = ''
		st_station8.BackColor = 16777215
		st_t8.Backcolor = 16777215
		st_station9.text = ''
		st_station9.BackColor = 16777215
		st_t9.Backcolor = 16777215
		st_station10.text = ''
		st_station10.BackColor = 16777215
		st_t10.Backcolor = 16777215
		st_station11.text = ''
		st_station11.BackColor = 16777215
		st_t11.Backcolor = 16777215
		st_station12.text = ''
		st_station12.BackColor = 16777215
		st_t12.Backcolor = 16777215
		st_station13.text = ''
		st_station13.BackColor = 16777215
		st_t13.Backcolor = 16777215
	end if
	tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.setredraw(true)
	tab_cincout.tabpage_clinique.dw_cincoutseated.setredraw(true)
	tab_cincout.tabpage_clinique.dw_cincoutreleased.setredraw(true)
end if

t = 0

ii_int_refresh = long(profileString(gnv_app.of_getAppIniFile(), "Console", "Frequence rafraichissement", "3"))
if ii_int_refresh < 1 or ii_int_refresh > 60 then ii_int_refresh = 3

timer(1, this)
end event

event open;call super::open;string ls1,ls2,ls3,ls4,ls5,ls6,ls7,ls8,ls9,ls10,ls11,ls12,ls13,ls14,ls15

select horshareid into :il_horshareid from t_options where ortho_id = :v_no_ortho;
select cincoutheurerdv,hor_step,cincoutcretard,temporet,horcol1,horcol2,horcol3,horcol4,horcol5,horcol6,horcol7,horcol8,horcol9,horcol10,horcol11,horcol12,horcol13,horcol14,horcol15
into :ii_heurerdv,:ii_horstep,:il_couleurretard,:ii_late,:ls1,:ls2,:ls3,:ls4,:ls5,:ls6,:ls7,:ls8,:ls9,:ls10,:ls11,:ls12,:ls13,:ls14,:ls15 from t_options 
where ortho_id = :il_horshareid;
if isnull(ls1) = false then st_1.text = ls1
if isnull(ls2) = false then st_2.text = ls2
if isnull(ls3) = false then st_3.text = ls3
if isnull(ls4) = false then st_4.text = ls4
if isnull(ls5) = false then st_5.text = ls5
if isnull(ls6) = false then st_6.text = ls6
if isnull(ls7) = false then st_7.text = ls7
if isnull(ls8) = false then st_8.text = ls8
if isnull(ls9) = false then st_9.text = ls9
if isnull(ls10) = false then st_10.text = ls10
if isnull(ls11) = false then st_11.text = ls11
if isnull(ls12) = false then st_13.text = ls12
if isnull(ls13) = false then st_14.text = ls13
timer(1)

// event post pfc_postopen()
end event

event pfc_postopen;call super::pfc_postopen;//uf_setPosw()
//uf_setPoss()
//uf_setPosr()
end event

type pb_ou13 from picturebutton within w_cincout
integer x = 411
integer y = 2472
integer width = 105
integer height = 64
integer taborder = 140
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[13])
end event

type pb_in13 from picturebutton within w_cincout
integer x = 411
integer y = 2404
integer width = 105
integer height = 64
integer taborder = 150
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(13,st_14)
il_rdv[13] = il_idrdv
end event

type st_14 from statictext within w_cincout
integer x = 9
integer y = 2340
integer width = 407
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 13"
boolean focusrectangle = false
end type

type st_t13 from statictext within w_cincout
integer y = 2468
integer width = 402
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station13.event dragdrop(source)
end event

type pb_out12 from picturebutton within w_cincout
integer x = 411
integer y = 2272
integer width = 105
integer height = 64
integer taborder = 150
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[12])
end event

type pb_in12 from picturebutton within w_cincout
integer x = 411
integer y = 2208
integer width = 105
integer height = 64
integer taborder = 130
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(12,st_13)
il_rdv[12] = il_idrdv
end event

type st_t12 from statictext within w_cincout
integer y = 2272
integer width = 402
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station12.event dragdrop(source)
end event

type st_station12 from statictext within w_cincout
integer y = 2208
integer width = 402
integer height = 128
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "12"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_13.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

event dragdrop;of_setStation(source,12,st_13)
il_rdv[12] = il_idrdv
end event

type st_13 from statictext within w_cincout
integer x = 9
integer y = 2144
integer width = 407
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 12"
boolean focusrectangle = false
end type

type pb_out11 from picturebutton within w_cincout
integer x = 411
integer y = 2076
integer width = 105
integer height = 64
integer taborder = 140
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[11])
end event

type pb_in11 from picturebutton within w_cincout
integer x = 411
integer y = 2012
integer width = 105
integer height = 64
integer taborder = 130
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(11,st_11)
il_rdv[11] = il_idrdv
end event

type st_11 from statictext within w_cincout
integer x = 5
integer y = 1940
integer width = 407
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 11"
boolean focusrectangle = false
end type

type st_t11 from statictext within w_cincout
integer y = 2072
integer width = 402
integer height = 64
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station11.event dragdrop(source)
end event

type st_station11 from statictext within w_cincout
integer y = 2008
integer width = 402
integer height = 128
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "11"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_11.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

event dragdrop;of_setStation(source,11,st_11)
il_rdv[11] = il_idrdv
end event

type cb_carte from commandbutton within w_cincout
integer x = 2688
integer y = 2488
integer width = 590
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Carte"
end type

event constructor;if v_langue = 'an' then
	this.text = 'Card'
end if
end event

event clicked;//Ici
long	ll_row, ll_patid, ll_openpat

IF ii_att = 1 THEN
	ll_row = parent.tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.GetRow()
END IF

IF ii_att = 2 THEN
	ll_row = parent.tab_cincout.tabpage_clinique.dw_cincoutseated.GetRow()
END IF

IF ii_att = 3 THEN 
	ll_row = parent.tab_cincout.tabpage_clinique.dw_cincoutreleased.GetRow()
END IF


IF ll_row > 0 THEN
	SELECT openpat INTO :ll_openpat FROM t_options;
	IF ll_openpat = 1 THEN  
		ll_patid = parent.tab_cincout.tabpage_clinique.dw_cincoutseated.object.patient_patient_id[ll_row]
	ELSE
		IF ii_att = 1 THEN
			ll_patid = parent.tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.object.patient_patient_id[ll_row]
		END IF
		
		IF ii_att = 2 THEN
			ll_patid = parent.tab_cincout.tabpage_clinique.dw_cincoutseated.object.patient_patient_id[ll_row]
		END IF
	
		IF ii_att = 3 THEN 
			ll_patid = parent.tab_cincout.tabpage_clinique.dw_cincoutreleased.object.patient_patient_id[ll_row]
		END IF
		
	END IF
	
	gnv_app.inv_entrepotglobal.of_ajoutedonnee( "lien cincout patient", "oui")
	if isvalid(w_dossier_patients) then
		SetPointer(HourGlass!)
		w_dossier_patients.cb_close.event clicked()
		Opensheetwithparm(w_dossier_patients,ll_patid,w_principal,2,layered!)
	else
		SetPointer(HourGlass!)
		Opensheetwithparm(w_dossier_patients,ll_patid,w_principal,2,layered!)
	end if
END IF
end event

type pb_in10 from picturebutton within w_cincout
integer x = 411
integer y = 1808
integer width = 105
integer height = 64
integer taborder = 110
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(10,st_10)
il_rdv[10] = il_idrdv
end event

type pb_out9 from picturebutton within w_cincout
integer x = 411
integer y = 1680
integer width = 105
integer height = 64
integer taborder = 100
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[9])
end event

type pb_in9 from picturebutton within w_cincout
integer x = 411
integer y = 1616
integer width = 105
integer height = 64
integer taborder = 90
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(9,st_9)
il_rdv[9] = il_idrdv
end event

type pb_out8 from picturebutton within w_cincout
integer x = 411
integer y = 1488
integer width = 105
integer height = 64
integer taborder = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[8])
end event

type pb_in8 from picturebutton within w_cincout
integer x = 411
integer y = 1416
integer width = 105
integer height = 64
integer taborder = 160
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(8,st_8)
il_rdv[8] = il_idrdv
end event

type pb_out7 from picturebutton within w_cincout
integer x = 411
integer y = 1292
integer width = 105
integer height = 64
integer taborder = 150
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[7])
end event

type pb_in7 from picturebutton within w_cincout
integer x = 411
integer y = 1224
integer width = 105
integer height = 64
integer taborder = 140
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(7,st_7)
il_rdv[7] = il_idrdv
end event

type pb_out6 from picturebutton within w_cincout
integer x = 411
integer y = 1100
integer width = 105
integer height = 64
integer taborder = 130
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[6])
end event

type pb_in6 from picturebutton within w_cincout
integer x = 411
integer y = 1036
integer width = 105
integer height = 64
integer taborder = 120
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(6,st_6)
il_rdv[6] = il_idrdv
end event

type pb_out5 from picturebutton within w_cincout
integer x = 411
integer y = 912
integer width = 105
integer height = 64
integer taborder = 110
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[5])
end event

type pb_in5 from picturebutton within w_cincout
integer x = 411
integer y = 844
integer width = 105
integer height = 64
integer taborder = 100
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(5,st_5)
il_rdv[5] = il_idrdv
end event

type pb_out4 from picturebutton within w_cincout
integer x = 411
integer y = 720
integer width = 105
integer height = 64
integer taborder = 90
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[4])
end event

type pb_in4 from picturebutton within w_cincout
integer x = 411
integer y = 652
integer width = 105
integer height = 64
integer taborder = 80
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(4,st_4)
il_rdv[4] = il_idrdv
end event

type pb_out3 from picturebutton within w_cincout
integer x = 416
integer y = 524
integer width = 105
integer height = 64
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[3])
end event

type pb_in3 from picturebutton within w_cincout
integer x = 411
integer y = 460
integer width = 105
integer height = 64
integer taborder = 60
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(3,st_3)
il_rdv[3] = il_idrdv
end event

type pb_out2 from picturebutton within w_cincout
integer x = 411
integer y = 328
integer width = 105
integer height = 64
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[2])
end event

type pb_in2 from picturebutton within w_cincout
integer x = 411
integer y = 260
integer width = 105
integer height = 64
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(2,st_2)
il_rdv[2] = il_idrdv
end event

type pb_in1 from picturebutton within w_cincout
integer x = 411
integer y = 60
integer width = 105
integer height = 64
integer taborder = 70
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Prior!"
boolean map3dcolors = true
end type

event clicked;of_setstation(1,st_1)
il_rdv[1] = il_idrdv
end event

type pb_out1 from picturebutton within w_cincout
integer x = 411
integer y = 132
integer width = 105
integer height = 64
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[1])
end event

type cb_2 from commandbutton within w_cincout
integer x = 3881
integer y = 2480
integer width = 146
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "+"
end type

event clicked;time lt_end, lt_start
long ll_heure, ll_step

select hor_fin_pm, hor_step into :ll_heure, :ll_step from t_options where ortho_id = :il_horshareid;

lt_start = relativetime(now(),ll_step * -1 * 60)
lt_end = time(string(ll_heure) + ':00')

if this.text = '+' then
	dw_horjour.visible = true
	this.text = '-'
	dw_horjour.retrieve(il_horshareid,today(),lt_start,lt_end)
else
	dw_horjour.visible = false
	this.text = '+'
end if
end event

type cb_1 from commandbutton within w_cincout
integer x = 3282
integer y = 2484
integer width = 590
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "X-RAY"
end type

event clicked;long ll_patid

ll_patid = tab_cincout.tabpage_clinique.dw_cincoutseated.getItemNumber(tab_cincout.tabpage_clinique.dw_cincoutseated.getRow(),'patient_patient_id')
gf_captureortho(ll_patid)
end event

type st_t10 from statictext within w_cincout
integer y = 1872
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station10.event dragdrop(source)
end event

type st_t9 from statictext within w_cincout
integer y = 1680
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station9.event dragdrop(source)
end event

type st_9 from statictext within w_cincout
integer x = 9
integer y = 1552
integer width = 471
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 9"
boolean focusrectangle = false
end type

type st_10 from statictext within w_cincout
integer x = 9
integer y = 1744
integer width = 471
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 10"
boolean focusrectangle = false
end type

type st_station10 from statictext within w_cincout
integer y = 1808
integer width = 402
integer height = 128
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "10"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_10.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

event dragdrop;of_setStation(source,10,st_10)
il_rdv[10] = il_idrdv
end event

type st_station9 from statictext within w_cincout
integer y = 1616
integer width = 402
integer height = 128
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "9"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_9.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

event dragdrop;of_setStation(source,9,st_9)
il_rdv[9] = il_idrdv
end event

type st_t7 from statictext within w_cincout
integer y = 1288
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station7.event dragdrop(source)
end event

type st_t6 from statictext within w_cincout
integer y = 1100
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station6.event dragdrop(source)
end event

type st_t5 from statictext within w_cincout
integer y = 908
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station5.event dragdrop(source)
end event

type st_t4 from statictext within w_cincout
integer y = 712
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station4.event dragdrop(source)
end event

type st_t3 from statictext within w_cincout
integer y = 516
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station3.event dragdrop(source)
end event

type st_t2 from statictext within w_cincout
integer y = 324
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station2.event dragdrop(source)
end event

type st_t1 from statictext within w_cincout
integer y = 128
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station1.event dragdrop(source)
end event

type cb_refresh from commandbutton within w_cincout
integer x = 2098
integer y = 2488
integer width = 590
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Image"
end type

event clicked;string ls_pathphoto, ls_acces
long ll_patid

ll_patid = tab_cincout.tabpage_clinique.dw_cincoutseated.getItemNumber(tab_cincout.tabpage_clinique.dw_cincoutseated.getRow(),'patient_patient_id')
select chemphoto, acces_img into :ls_pathphoto, :ls_acces from t_options where ortho_id = :v_no_ortho;
	
if DirectoryExists(ls_pathphoto) then
	IF ls_acces = "o" THEN
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("mode_montage", "oui" )
		Opensheetwithparm(w_imaging,ll_patid,w_principal,2,layered!)
		//If IsValid(w_imaging) THEN w_imaging.title = "Imagerie"
	ELSE
		error_type(1006)
	END IF
	
else
	
	error_type(191)
	
end if
end event

type st_time from statictext within w_cincout
integer x = 1701
integer y = 2488
integer width = 379
integer height = 100
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_cout from commandbutton within w_cincout
integer x = 1102
integer y = 2484
integer width = 590
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Cout"
end type

event clicked;tab_cincout.tabpage_clinique.dw_cincoutreleased.event ue_cout()
tab_cincout.tabpage_quitte.st_totpat2.text = string(tab_cincout.tabpage_quitte.dw_cincoutpatout.rowcount())
end event

type st_station7 from statictext within w_cincout
integer y = 1224
integer width = 402
integer height = 128
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "7"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;of_setStation(source,7,st_7)
il_rdv[7] = il_idrdv
end event

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_7.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

type st_station6 from statictext within w_cincout
integer y = 1036
integer width = 402
integer height = 128
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "6"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;of_setStation(source,6,st_6)
il_rdv[6] = il_idrdv
end event

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_6.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

type st_station5 from statictext within w_cincout
integer y = 844
integer width = 402
integer height = 128
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "5"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;of_setStation(source,5,st_5)
il_rdv[5] = il_idrdv
end event

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_5.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

type st_8 from statictext within w_cincout
integer x = 9
integer y = 1356
integer width = 471
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 8"
boolean focusrectangle = false
end type

type st_7 from statictext within w_cincout
integer x = 9
integer y = 1160
integer width = 471
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 7"
boolean focusrectangle = false
end type

type st_6 from statictext within w_cincout
integer x = 9
integer y = 972
integer width = 471
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 6"
boolean focusrectangle = false
end type

type st_5 from statictext within w_cincout
integer x = 9
integer y = 780
integer width = 471
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 5"
boolean focusrectangle = false
end type

type st_4 from statictext within w_cincout
integer x = 9
integer y = 584
integer width = 471
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 4"
boolean focusrectangle = false
end type

type st_3 from statictext within w_cincout
integer x = 9
integer y = 392
integer width = 471
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 3"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cincout
integer x = 9
integer y = 196
integer width = 471
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 2"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cincout
integer x = 9
integer width = 471
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Station 1"
boolean focusrectangle = false
end type

type cb_close from commandbutton within w_cincout
integer x = 4037
integer y = 2480
integer width = 590
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;//uf_getposw()
//uf_getposs()
//uf_getposr()
sauve()
close(parent)
end event

event constructor;if v_langue = 'an' then
	this.text = 'Close'
end if
end event

type cb_cin from commandbutton within w_cincout
integer x = 507
integer y = 2484
integer width = 590
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Cin"
end type

event clicked;tab_cincout.tabpage_pat.dw_cincoutpat.event ue_cin()

//long row
//
//tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.SetRedraw(false)
//row = tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.getrow()
//il_idrdv = tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.getitemnumber(row,'id_rdv')
//update t_rdv set heurearr = now() where id_rdv = :il_idrdv;
//commit using sqlca;
//error_type(-1)
//tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.Retrieve()
//tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.event ue_retrieve()
//tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.SetRedraw(true)
end event

event constructor;//if v_langue = 'an' then
//	this.text = 'Print'
//end if
end event

type st_station8 from statictext within w_cincout
integer y = 1420
integer width = 402
integer height = 128
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "8"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;of_setStation(source,8,st_8)
il_rdv[8] = il_idrdv
end event

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_8.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

type st_station1 from statictext within w_cincout
integer y = 64
integer width = 402
integer height = 128
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "1"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;of_setStation(source,1,st_1)
il_rdv[1] = il_idrdv


//time lt_seated
//DataWindow ldw_Source
//
//IF source.TypeOf() = DataWindow! THEN
//	ldw_Source = source
//END IF
//
//if ii_heurerdv = 1 then
//	lt_seated = tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.getitemtime(tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.getrow(),'rdvheure')
//else
//	if ldw_Source.dataobject = 'd_cincoutseated' then
//		lt_seated = tab_cincout.tabpage_clinique.dw_cincoutseated.getItemTime(tab_cincout.tabpage_clinique.dw_cincoutseated.getRow(),"seated")
//	else
//		lt_seated = now()
//	end if
//end if
//
//update t_rdv set seated = :lt_seated,nostation = 1,station = :st_1.text,color = 16777215 where id_rdv = :il_idrdv;
//commit using sqlca;
//error_type(-1)
//
//tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.event ue_retrieve()
//tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_retrieve()
//drag(End!)
end event

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_1.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

type st_station2 from statictext within w_cincout
integer y = 260
integer width = 402
integer height = 124
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "2"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;of_setStation(source,2,st_2)
il_rdv[2] = il_idrdv
end event

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_2.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

type st_station3 from statictext within w_cincout
integer y = 456
integer width = 402
integer height = 124
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "3"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;of_setStation(source,3,st_3)
il_rdv[3] = il_idrdv
end event

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_3.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

type st_station4 from statictext within w_cincout
integer y = 648
integer width = 402
integer height = 128
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "4"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;of_setStation(source,4,st_4)
il_rdv[4] = il_idrdv
end event

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_4.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

type st_t8 from statictext within w_cincout
integer y = 1484
integer width = 402
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;st_station8.event dragdrop(source)
end event

type dw_horjour from u_dw within w_cincout
boolean visible = false
integer x = 3931
integer y = 4
integer width = 672
integer height = 2460
integer taborder = 60
string dataobject = "d_sem_am_1"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

type tab_cincout from tab within w_cincout
integer x = 526
integer width = 4091
integer height = 2464
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean focusonbuttondown = true
boolean showpicture = false
boolean boldselectedtext = true
integer selectedtab = 2
tabpage_pat tabpage_pat
tabpage_clinique tabpage_clinique
tabpage_quitte tabpage_quitte
end type

on tab_cincout.create
this.tabpage_pat=create tabpage_pat
this.tabpage_clinique=create tabpage_clinique
this.tabpage_quitte=create tabpage_quitte
this.Control[]={this.tabpage_pat,&
this.tabpage_clinique,&
this.tabpage_quitte}
end on

on tab_cincout.destroy
destroy(this.tabpage_pat)
destroy(this.tabpage_clinique)
destroy(this.tabpage_quitte)
end on

event constructor;if v_langue = 'an' then
	tab_cincout.tabpage_pat.text = "Patient today"
	tab_cincout.tabpage_clinique.text = "Clinic"
	tab_cincout.tabpage_quitte.text = "Quit"
end if
end event

event selectionchanged;CHOOSE CASE newindex
	CASE 1
		tab_cincout.tabpage_pat.dw_cincoutpat.event ue_retrieve()
	CASE 2
		tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.event ue_retrieve()
		tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_retrieve()
		tab_cincout.tabpage_clinique.dw_cincoutreleased.event ue_retrieve()
		tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_fillrdv()
	CASE 3
		tab_cincout.tabpage_quitte.dw_cincoutpatout.event ue_retrieve()
END CHOOSE
end event

type tabpage_pat from userobject within tab_cincout
integer x = 18
integer y = 112
integer width = 4055
integer height = 2336
long backcolor = 67108864
string text = "Patient du jour"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_totpat st_totpat
dw_cincoutpat dw_cincoutpat
end type

on tabpage_pat.create
this.st_totpat=create st_totpat
this.dw_cincoutpat=create dw_cincoutpat
this.Control[]={this.st_totpat,&
this.dw_cincoutpat}
end on

on tabpage_pat.destroy
destroy(this.st_totpat)
destroy(this.dw_cincoutpat)
end on

type st_totpat from statictext within tabpage_pat
integer x = 407
integer y = 1764
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_cincoutpat from u_dw within tabpage_pat
event ue_retrieve ( )
event ue_cin ( )
integer width = 3374
integer height = 2316
integer taborder = 20
string title = "d_cincoutpat"
string dataobject = "d_cincoutpat"
boolean hscrollbar = true
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();long ll_row
string ls_vscrollpos

if ii_editp <= 0 then
	setredraw(false)
	ll_row = getrow()
	ls_vscrollpos = describe("DataWindow.VerticalScrollPosition")
	Retrieve(il_horshareid)
	scrolltorow(ll_row)
	object.DataWindow.VerticalScrollPosition = long(ls_vscrollpos)
	setredraw(true)
	ii_editp = 0
else
	ii_editp = ii_editp - 1
end if

st_totpat.text = string(rowcount())
end event

event ue_cin();long row
integer li_row, li_late
time lt_heure, lt_late
string ls_rdvetat

row = getrow()
SetRedraw(false)
il_idrdv = getitemnumber(row,'id_rdv')
lt_heure = getitemtime(row,'rdvheure')

// définir l'état du rdv
lt_late = relativeTime(lt_heure, (ii_late * 60))
if now() < lt_heure then
	ls_rdvetat = 'e'
elseif now() > lt_late then
	ls_rdvetat = 'l'
else
	ls_rdvetat = 'o'
end if

update t_rdv set heurearr = now(), rdvetat = :ls_rdvetat where id_rdv = :il_idrdv;
commit using sqlca;
error_type(-1)
tab_cincout.tabpage_clinique.dw_cincoutwaitingroom.event ue_retrieve()
li_row = getrow()
Retrieve(il_horshareid)
scrolltorow(li_row)
SetRedraw(true)
end event

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetRowFocusIndicator(FocusRect!)
event ue_retrieve()

if v_langue = 'an' then
	object.patnom_t.text = "Patient's name"
	object.rdv_t.text = "APP"
	object.trait_t.text = "Treatment"
	object.duree_t.text = "Duration"
end if
end event

event clicked;call super::clicked;scrolltorow(getclickedrow())
cb_cin.enabled = true
ii_editp = 1
end event

event doubleclicked;event ue_cin()
end event

type tabpage_clinique from userobject within tab_cincout
integer x = 18
integer y = 112
integer width = 4055
integer height = 2336
long backcolor = 67108864
string text = "Clinique"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
mle_memo mle_memo
dw_cincoutreleased dw_cincoutreleased
dw_cincoutwaitingroom dw_cincoutwaitingroom
gb_waitingroom gb_waitingroom
gb_seated gb_seated
gb_released gb_released
dw_cincoutseated dw_cincoutseated
end type

on tabpage_clinique.create
this.mle_memo=create mle_memo
this.dw_cincoutreleased=create dw_cincoutreleased
this.dw_cincoutwaitingroom=create dw_cincoutwaitingroom
this.gb_waitingroom=create gb_waitingroom
this.gb_seated=create gb_seated
this.gb_released=create gb_released
this.dw_cincoutseated=create dw_cincoutseated
this.Control[]={this.mle_memo,&
this.dw_cincoutreleased,&
this.dw_cincoutwaitingroom,&
this.gb_waitingroom,&
this.gb_seated,&
this.gb_released,&
this.dw_cincoutseated}
end on

on tabpage_clinique.destroy
destroy(this.mle_memo)
destroy(this.dw_cincoutreleased)
destroy(this.dw_cincoutwaitingroom)
destroy(this.gb_waitingroom)
destroy(this.gb_seated)
destroy(this.gb_released)
destroy(this.dw_cincoutseated)
end on

type mle_memo from multilineedit within tabpage_clinique
boolean visible = false
integer x = 206
integer y = 184
integer width = 1586
integer height = 516
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
end type

type dw_cincoutreleased from u_dw within tabpage_clinique
event ue_retrieve ( )
event ue_cout ( )
integer x = 18
integer y = 1900
integer width = 3954
integer height = 436
integer taborder = 70
string dragicon = "C:\ii4net\orthotek\images\DISTLSTL.ICO"
string title = "cincoutreleased"
string dataobject = "d_cincoutreleased"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();long ll_row
string ls_vscrollpos

//settransobject(SQLCA)
//datawindowchild dwc_typetrait
//if getChild("t_carterdv_type_traitement_id",dwc_typetrait) = -1 then
//	error_type(50)
//end if
//dwc_typetrait.setTransObject(SQLCA)
//dwc_typetrait.retrieve(v_no_ortho)

if ii_editr <= 0 then
	setredraw(false)
	ll_row = getrow()
	ls_vscrollpos = describe("DataWindow.VerticalScrollPosition")
	if this.update() = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
		error_type(50)
	end if
	Retrieve(il_horshareid)
	scrolltorow(ll_row)
	object.DataWindow.VerticalScrollPosition = long(ls_vscrollpos)
	setredraw(true)
	ii_editr = 0
else
	ii_editr = ii_editr - 1
end if
end event

event ue_cout();long ll_idrdv,ll_traitid
integer li_horstep,li_chrg
decimal{2} ld_duree,ld_taux,ld_chrgarrdep
date ldt_rdvdate
time lt_heurearr,lt_heuredep

// calcul de la charge
select hor_step into :li_horstep from t_options where ortho_id = :il_horshareid;

select 	 typetraitid,
			 heurearr
	into   :ll_traitid,:lt_heurearr
	from	 t_rdv inner join patient on t_rdv.patient_id = patient.patient_id
	where  t_rdv.id_rdv > :il_idrdv;

select addtocharge into :li_chrg from type_de_traitement where ortho_id = :il_horshareid and type_traitement_id = :ll_traitid;
if li_chrg = 1 then
	select max(chargtaux) into :ld_taux from t_charges where ortho_id = :il_horshareid and chargdate <= :ldt_rdvdate;
	ld_chrgarrdep = (SecondsAfter(lt_heurearr,lt_heuredep) / 60) * ld_taux
else
	ld_chrgarrdep = 0
end if

update t_rdv set heuredep = now(),chrgarrdep = :ld_chrgarrdep where id_rdv = :il_idrdv;
commit using sqlca;
error_type(-1)

this.event ue_retrieve()
tab_cincout.tabpage_quitte.dw_cincoutpatout.event ue_retrieve()
end event

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

if v_langue = 'an' then
	object.t_carterdv_typeds.values = "Days~t1/Weeks~t2/Months~t3/Years~t4"
else
	object.t_carterdv_typeds.values = "Jours~t1/Semaines~t2/Mois~t3/Années~t4"
end if


SetRowFocusIndicator(FocusRect!)
event ue_retrieve()

if v_langue = 'an' then
	object.patnom_t.text = "Patient's name"
	object.t_procrdv.text = "Next appointment"
	object.t_infocomp.text = "Complementary informations"
	object.t_duree.text = "Length"
	object.t_personnel.text = "Staff"
	object.t_temps.text = "Time"
end if
end event

event dragdrop;Datawindow ldw_source

ldw_source = source

if ldw_source.dataobject <> "d_cincoutreleased" then
	of_setcout(il_idrdv)
	drag(End!)
end if
end event

event doubleclicked;//il_idrdv = getitemnumber(row,'id_rdv')
//update t_rdv set heuredep = now() where id_rdv = :il_idrdv;
//commit using sqlca;
//error_type(-1)
//event ue_retrieve()
//tab_cincout.tabpage_quitte.dw_cincoutpatout.event ue_retrieve()
end event

event clicked;ii_att = 3
if row > 0 then
	il_idrdv = getitemnumber(row,'t_rdv_id_rdv')
	Drag(Begin!)
end if
cb_cout.enabled = true
end event

event editchanged;ii_editr = 1
end event

event rbuttondown;call super::rbuttondown;long ll_carterdv, ll_patid

IF row > 0 THEN
	if dwo.name = 'patnom' then
		ll_patid = getItemNumber(row,'patient_patient_id')
		ll_carterdv = getItemNumber(row,'t_carterdv_id_carterdv')
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("idcarterdvconsole", ll_carterdv)
		gnv_app.inv_entrepotglobal.of_ajoutedonnee("patientidconsole",ll_patid)
		open(w_infordvcarte)
	end if
END IF
end event

type dw_cincoutwaitingroom from u_dw within tabpage_clinique
event ue_retrieve ( )
integer x = 18
integer y = 68
integer width = 3995
integer height = 436
integer taborder = 30
string dragicon = "C:\ii4net\orthotek\images\Distlstl.ico"
string title = "cincoutwaitingroom"
string dataobject = "d_cincoutwaitingroom"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();long ll_row
string ls_vscrollpos

//settransobject(SQLCA)

if ii_edite <= 0 then
	setredraw(false)
	ll_row = getrow()
	ls_vscrollpos = describe("DataWindow.VerticalScrollPosition")
	if this.update() = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
		error_type(50)
	end if
	Retrieve(il_horshareid)
	scrolltorow(ll_row)
	object.DataWindow.VerticalScrollPosition = long(ls_vscrollpos)
	setredraw(true)
	ii_edite = 0
else
	ii_edite = ii_edite - 1
end if
end event

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetRowFocusIndicator(FocusRect!)
event ue_retrieve()

if v_langue = 'an' then
	this.object.rdvetat.values = 'Miss~tm/Cancel~tc/Late~tl/Early~te/On Time~to/On Deck~td'
	this.object.patnom_t.text = "Patient's name"
	this.object.rdv_t.text = "APP"
	this.object.arrive_t.text = "Arrive"
	this.object.etat_t.text = "Status"
	this.object.waiting_t.text = "Waiting"
	this.object.trait_t.text = "Treatment"
	this.object.duree_t.text = "Duration"
else
	this.object.rdvetat.values = 'Manqué~tm/Annulé~tc/Retard~tl/Avance~te/À Temps~to/On Deck~td'
end if
end event

event clicked;ii_att = 1
if row > 0 then
	scrolltorow(getclickedrow())
	il_idrdv = getitemnumber(row,'id_rdv')
	if getItemString(row,'t_rdv_memo') = "" or isnull(getItemString(row,'t_rdv_memo')) then	
		mle_memo.visible = false		
	else
		if dwo.name = 'patnom' then
			mle_memo.visible = true
			mle_memo.y = this.y + PixelsToUnits(ypos, YPixelsToUnits!) + integer(dwo.height)
			mle_memo.x = this.x + PixelsToUnits(xpos, XPixelsToUnits!)
			mle_memo.text = getItemString(row,'t_rdv_memo')
		else
			mle_memo.visible = false
		end if
	end if
	Drag(Begin!)
else
	mle_memo.visible = false
end if

if dwo.name = 'rdvetat' then
	ii_edite = 1
end if
end event

event dragdrop;call super::dragdrop;update t_rdv set seated = null,
						nostation = null,
						station = null,
						color = 16777215, 
						released = null,  
						ready = null,
						heuredep = null
where id_rdv = :il_idrdv;
commit using sqlca;
error_type(-1)

dw_cincoutwaitingroom.event ue_retrieve()
dw_cincoutseated.event ue_retrieve()
dw_cincoutreleased.event ue_retrieve()
drag(End!)
end event

event losefocus;call super::losefocus;mle_memo.visible = false
end event

event dragleave;call super::dragleave;mle_memo.visible = false
end event

type gb_waitingroom from groupbox within tabpage_clinique
integer y = 4
integer width = 4023
integer height = 512
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Salle d~'attente"
end type

event constructor;if v_langue = "an" then
	this.text = "Waiting room"
end if
end event

type gb_seated from groupbox within tabpage_clinique
integer y = 524
integer width = 4014
integer height = 1308
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "En traitement"
end type

event constructor;if v_langue = "an" then
	this.text = "In Treatment"
end if
end event

type gb_released from groupbox within tabpage_clinique
integer y = 1836
integer width = 4009
integer height = 500
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Terminé"
end type

event constructor;if v_langue = "an" then
	this.text = "Finished"
end if
end event

type dw_cincoutseated from u_dw within tabpage_clinique
event ue_retrieve ( )
event ue_traitetat ( )
event ue_fillrdv ( )
integer x = 32
integer y = 592
integer width = 3927
integer height = 1224
integer taborder = 60
string dragicon = "C:\ii4net\orthotek\images\Distlstl.ico"
boolean bringtotop = true
string title = "cincoutseated"
string dataobject = "d_cincoutseated"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();long ll_rdvid, ll_test
string ls_vscrollpos

//settransobject(SQLCA)

if ii_edits <= 0 then
	setredraw(false)
	if rowcount() > 0 then
		ll_rdvid = getItemNumber(getRow(),'t_rdv_id_rdv')
	else
		ll_rdvid = 0
	end if
	
	ls_vscrollpos = describe("DataWindow.VerticalScrollPosition")
	if this.update() = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
		error_type(50)
	end if
	ll_test = Retrieve(il_horshareid)
	event ue_fillrdv()
	scrolltorow(find('t_rdv_id_rdv = ' + string(ll_rdvid),0,rowcount()))
	object.DataWindow.VerticalScrollPosition = long(ls_vscrollpos)
	setredraw(true)
	ii_edits = 0
else
	ii_edits = ii_edits - 1
end if
end event

event ue_traitetat();s_cnslcoul lstr_cc
time lt_null

open(w_cincoutchoix)
lstr_cc = message.powerObjectParm
CHOOSE CASE lstr_cc.i_action
	CASE -3
		return
	CASE -2
		setNull(lt_null)
		setitem(getrow(),'ready',lt_null)
	CASE -1
		setitem(getrow(),'ready',now())
	CASE 0
		setitem(getrow(),'t_rdv_color',lstr_cc.l_couleur)
	CASE 1
		setitem(getrow(),'t_rdv_color',lstr_cc.l_couleur)
		setNull(lt_null)
		setitem(getrow(),'ready',lt_null)
	CASE 2
		setitem(getrow(),'t_rdv_color',lstr_cc.l_couleur)
		setitem(getrow(),'ready',now())
END CHOOSE
update()
commit;
end event

event ue_fillrdv();long i, ll_station

for i = 1 to rowcount()
	ll_station = getItemNumber(i,'t_rdv_nostation')
	il_rdv[ll_station] = getItemNumber(i,'t_rdv_id_rdv')
next
end event

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetRowFocusIndicator(FocusRect!)
event ue_retrieve()

if v_langue = 'an' then
	this.object.station_t.text = "Station"
	this.object.patnom_t.text = "Patient's name"
	this.object.seated_t.text = "Seated"
	this.object.ready_t.text = "Ready"
	this.object.waiting_t.text = "Waiting"
	this.object.trait_t.text = "Treatment"
	this.object.duree_t.text = "Duration"
end if
end event

event clicked;call super::clicked;ii_att = 2
if row > 0 then
	scrolltorow(getclickedrow())
	il_idrdv = getitemnumber(row,'t_rdv_id_rdv')
	if getItemString(row,'t_rdv_memo') = "" or isnull(getItemString(row,'t_rdv_memo')) then	
		mle_memo.visible = false		
	else
		if dwo.name = 'patnom' then
			mle_memo.visible = true
			mle_memo.y = this.y + PixelsToUnits(ypos, YPixelsToUnits!) + integer(dwo.height)
			mle_memo.x = this.x + PixelsToUnits(xpos, XPixelsToUnits!)
			mle_memo.text = getItemString(row,'t_rdv_memo')
		else
			mle_memo.visible = false
		end if
	end if
	Drag(Begin!)
else
	mle_memo.visible = false
end if
end event

event rbuttondown;event ue_traitetat()
end event

event itemchanged;//cb_update.enabled = true
end event

event editchanged;ii_edits = 1
end event

event losefocus;call super::losefocus;mle_memo.visible = false
end event

event dragleave;call super::dragleave;mle_memo.visible = false
end event

type tabpage_quitte from userobject within tab_cincout
integer x = 18
integer y = 112
integer width = 4055
integer height = 2336
long backcolor = 67108864
string text = "Quitté"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_totpat2 st_totpat2
st_12 st_12
dw_cincoutpatout dw_cincoutpatout
end type

on tabpage_quitte.create
this.st_totpat2=create st_totpat2
this.st_12=create st_12
this.dw_cincoutpatout=create dw_cincoutpatout
this.Control[]={this.st_totpat2,&
this.st_12,&
this.dw_cincoutpatout}
end on

on tabpage_quitte.destroy
destroy(this.st_totpat2)
destroy(this.st_12)
destroy(this.dw_cincoutpatout)
end on

type st_totpat2 from statictext within tabpage_quitte
integer x = 407
integer y = 1764
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_12 from statictext within tabpage_quitte
integer y = 1764
integer width = 416
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Total patient: "
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Patient's total"
end if
end event

type dw_cincoutpatout from u_dw within tabpage_quitte
event ue_retrieve ( )
integer width = 3090
integer height = 1768
integer taborder = 40
string title = "cincoutpatout"
string dataobject = "d_cincoutpatout"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();long ll_row
string ls_vscrollpos

setredraw(false)
ll_row = getrow()
ls_vscrollpos = describe("DataWindow.VerticalScrollPosition")
Retrieve(il_horshareid)
scrolltorow(ll_row)
object.DataWindow.VerticalScrollPosition = long(ls_vscrollpos)
setredraw(true)
end event

event constructor;call super::constructor;pro_resize luo_size
luo_size.uf_resizedw(this)

SetRowFocusIndicator(FocusRect!)
event ue_retrieve()

if v_langue = 'an' then
	object.patnom_t.text = "Patient's name"
	object.rdv_t.text = "APP"
	object.trait_t.text = "Treatment"
	object.duree_t.text = "Duration"
end if

st_totpat2.text = string(rowcount())
end event

type pb_out10 from picturebutton within w_cincout
integer x = 411
integer y = 1872
integer width = 105
integer height = 64
integer taborder = 120
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Next!"
boolean map3dcolors = true
end type

event clicked;of_setcout(il_rdv[10])
end event

type st_station13 from statictext within w_cincout
integer y = 2404
integer width = 402
integer height = 128
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 16777215
string text = "13"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

event clicked;long ll_rowfind

ll_rowfind = tab_cincout.tabpage_clinique.dw_cincoutseated.find("station = '" + st_14.text + "'",0,tab_cincout.tabpage_clinique.dw_cincoutseated.rowcount())
if ll_rowfind > 0 then
	tab_cincout.tabpage_clinique.dw_cincoutseated.scrolltorow(ll_rowfind)
	tab_cincout.tabpage_clinique.dw_cincoutseated.event ue_traitetat()
end if
end event

event dragdrop;of_setStation(source,13,st_14)
il_rdv[13] = il_idrdv
end event

