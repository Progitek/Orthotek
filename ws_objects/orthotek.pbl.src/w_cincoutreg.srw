$PBExportHeader$w_cincoutreg.srw
forward
global type w_cincoutreg from window
end type
type p_1 from picture within w_cincoutreg
end type
type st_texte from statictext within w_cincoutreg
end type
type st_9 from statictext within w_cincoutreg
end type
type st_8 from statictext within w_cincoutreg
end type
type st_6 from statictext within w_cincoutreg
end type
type st_5 from statictext within w_cincoutreg
end type
type st_4 from statictext within w_cincoutreg
end type
type st_3 from statictext within w_cincoutreg
end type
type st_2 from statictext within w_cincoutreg
end type
type st_7 from statictext within w_cincoutreg
end type
type st_1 from statictext within w_cincoutreg
end type
type em_time from editmask within w_cincoutreg
end type
type dw_cincoutreg from u_dw within w_cincoutreg
end type
type cb_1 from commandbutton within w_cincoutreg
end type
type r_1 from rectangle within w_cincoutreg
end type
end forward

global type w_cincoutreg from window
integer width = 4690
integer height = 3088
boolean titlebar = true
string title = "ORTHOTEK - ACCUEIL PATIENT"
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_1 p_1
st_texte st_texte
st_9 st_9
st_8 st_8
st_6 st_6
st_5 st_5
st_4 st_4
st_3 st_3
st_2 st_2
st_7 st_7
st_1 st_1
em_time em_time
dw_cincoutreg dw_cincoutreg
cb_1 cb_1
r_1 r_1
end type
global w_cincoutreg w_cincoutreg

type variables
private datetime idt_daterefresh = datetime(today(),now())
private date idt_datejour
private long il_ortho
end variables

forward prototypes
public subroutine of_identification (long al_id)
end prototypes

public subroutine of_identification (long al_id);Long ll_patid, ll_row
String ls_stat
Time lt_heure
ll_row = dw_cincoutreg.getRow()
ll_patid = dw_cincoutreg.getItemNumber(ll_row,'patient_id')
ls_stat =  dw_cincoutreg.getItemString(ll_row,'flags')
lt_heure = dw_cincoutreg.getItemTime(ll_row,'heure')
//MessageBox(string(al_id),string(ll_patid))
if al_id = ll_patid then
	update t_rdv set heurearr = now(), rdvetat = :ls_stat where patient_id = :ll_patid and rdvheure = :lt_heure and rdvdate = today();
		
	if error_type(-1) = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
	
	if ls_stat = 'l' then
		update patient set retards = retards - 1 where patient_id = :ll_patid;
		commit using SQLCA;
	end if
	
	insert into t_horlogrefresh(rdvdate,rdvheure,updateheure) 
	values(today(),now(),current timestamp);
else
	messagebox("Avertissement","Recommencez l'identification")
end if
end subroutine

on w_cincoutreg.create
this.p_1=create p_1
this.st_texte=create st_texte
this.st_9=create st_9
this.st_8=create st_8
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_7=create st_7
this.st_1=create st_1
this.em_time=create em_time
this.dw_cincoutreg=create dw_cincoutreg
this.cb_1=create cb_1
this.r_1=create r_1
this.Control[]={this.p_1,&
this.st_texte,&
this.st_9,&
this.st_8,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_7,&
this.st_1,&
this.em_time,&
this.dw_cincoutreg,&
this.cb_1,&
this.r_1}
end on

on w_cincoutreg.destroy
destroy(this.p_1)
destroy(this.st_texte)
destroy(this.st_9)
destroy(this.st_8)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_7)
destroy(this.st_1)
destroy(this.em_time)
destroy(this.dw_cincoutreg)
destroy(this.cb_1)
destroy(this.r_1)
end on

event open;string	ls_texte
long 		ll_count, ll_ortho

il_ortho = message.doubleparm
dw_cincoutreg.event ue_retrieve()
timer(1)

if il_ortho = 0 then
	select first message_moniteur
	INTO 		:ls_texte
	FROM		t_options
	where horshareid is not null
	order by ortho_id asc;
else
	SELECT 	message_moniteur
	INTO 		:ls_texte
	FROM		t_options
	where ortho_id = :il_ortho
	USING SQLCA;
end if

IF Not IsNull(ls_texte) AND ls_texte <> "" THEN
	st_texte.text = ls_texte
	st_texte.visible = true
END IF
end event

event timer;int i
time lt_time, lt_timervm, lt_timeret, lt_timerdv
long ll_timervm, ll_timeret, ll_patid, ll_count
string ls_state
n_cst_datetime lnv_dt

em_time.text = string(now())

select count(1) into :ll_count from t_horlogrefresh where updateheure > :idt_daterefresh and updateheure <= current timestamp;
if ll_count > 0 or lnv_dt.of_secondsafter(idt_daterefresh,datetime(today(),now())) > 30 then
	dw_cincoutreg.setRedraw(false)
	dw_cincoutreg.event ue_retrieve()
	dw_cincoutreg.setRedraw(true)
end if

for i = 1 to dw_cincoutreg.rowcount()
	ll_patid = dw_cincoutreg.getItemNumber(i,'patient_id')
	ls_state = dw_cincoutreg.getItemString(i,'flags')
	if ls_state = 'm' then
		dw_cincoutreg.deleteRow(i)
		update patient set rvmanques = rvmanques + 1 where patient_id = :ll_patid;
		commit using SQLCA;
	end if
next

end event

type p_1 from picture within w_cincoutreg
integer x = 3995
integer y = 212
integer width = 599
integer height = 452
string picturename = "C:\ii4net\orthotek\images\logo.bmp"
boolean focusrectangle = false
end type

type st_texte from statictext within w_cincoutreg
boolean visible = false
integer x = 3927
integer y = 636
integer width = 745
integer height = 1648
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
boolean focusrectangle = false
end type

type st_9 from statictext within w_cincoutreg
integer x = 3927
integer y = 1152
integer width = 745
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "registration"
boolean focusrectangle = false
end type

type st_8 from statictext within w_cincoutreg
integer x = 3927
integer y = 1076
integer width = 745
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "reception after your"
boolean focusrectangle = false
end type

type st_6 from statictext within w_cincoutreg
integer x = 3927
integer y = 1000
integer width = 745
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Please go to the "
boolean focusrectangle = false
end type

type st_5 from statictext within w_cincoutreg
integer x = 3927
integer y = 824
integer width = 745
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "votre enregistrement"
boolean focusrectangle = false
end type

type st_4 from statictext within w_cincoutreg
integer x = 3927
integer y = 748
integer width = 745
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "à la réception après"
boolean focusrectangle = false
end type

type st_3 from statictext within w_cincoutreg
integer x = 3927
integer y = 672
integer width = 745
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Veuillez vous présenter"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cincoutreg
integer x = 9
integer y = 100
integer width = 3895
integer height = 96
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
string text = "Select your name and then click the ~"OK~" key at the bottom of the screen."
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_cincoutreg
integer x = 5
integer y = 2724
integer width = 3904
integer height = 272
integer textsize = -28
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 134217752
string text = "ORTHOTEK"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_cincoutreg
integer x = 9
integer y = 4
integer width = 3895
integer height = 96
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217752
string text = "Sélectionnez votre nom, ensuite appuyez sur la touche ~"OK~" au bas de cet écran. "
alignment alignment = center!
boolean focusrectangle = false
end type

type em_time from editmask within w_cincoutreg
integer x = 3954
integer y = 40
integer width = 677
integer height = 180
integer textsize = -24
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "none"
boolean border = false
alignment alignment = center!
boolean displayonly = true
maskdatatype maskdatatype = timemask!
string mask = "hh:mm:ss"
end type

type dw_cincoutreg from u_dw within w_cincoutreg
event ue_retrieve ( )
integer x = 5
integer y = 200
integer width = 3909
integer height = 2524
integer taborder = 20
string title = "none"
string dataobject = "d_cincoutreg"
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();long ll_timervm, ll_timeret, ll_ortho, ll_idpat, ll_row
time lt_time

if il_ortho = 0 then 
	setnull(ll_ortho)
else
	ll_ortho = il_ortho
end if

// idt_datejour = today()
idt_daterefresh = datetime(today(),now())
if isNull(ll_ortho) then
	select first temporvm, temporet
	into :ll_timervm, :ll_timeret
	from t_options	where horshareid is not null
	order by ortho_id asc;
else
	select temporvm, temporet into :ll_timervm, :ll_timeret from t_options where ortho_id = :ll_ortho;
end if

lt_time = relativeTime(now(),(ll_timervm * 60 * -1))
if dw_cincoutreg.getRow() > 0 then
	ll_idpat = dw_cincoutreg.getItemNumber(dw_cincoutreg.getRow(),'patient_id')
end if
dw_cincoutreg.retrieve(lt_time,ll_ortho)
ll_row = dw_cincoutreg.find('patient_id = ' + string(ll_idpat),1,dw_cincoutreg.rowcount())
if ll_row > 0 then dw_cincoutreg.scrollToRow(ll_row)

end event

event constructor;setTransObject(SQLCA)
setRowFocusIndicator(hand!)
end event

event clicked;scrollToRow(getClickedRow())
selectRow(0,false)
if row > 0 then  selectRow(row,true)

end event

event rowfocuschanged;call super::rowfocuschanged;selectRow(0,false)
if currentrow > 0 then  selectRow(currentrow,true)
end event

type cb_1 from commandbutton within w_cincoutreg
integer x = 3927
integer y = 2312
integer width = 727
integer height = 540
integer taborder = 30
boolean bringtotop = true
integer textsize = -24
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "HyperLink!"
string text = "OK"
end type

event clicked;s_cincout lstr_cincout
string ls_trait, ls_stat, ls_result
long ll_patid, ll_chaise, ll_duree, ll_personnel, ll_row, ll_id
time lt_heure, lt_check
boolean lb_utiliserbiometrie
Integer li_biopunch

ll_row = dw_cincoutreg.getRow()
IF ll_row = 0 THEN RETURN
ll_patid = dw_cincoutreg.getItemNumber(ll_row,'patient_id')
ls_trait = dw_cincoutreg.getItemString(ll_row,'traitement')
ll_chaise = dw_cincoutreg.getItemNumber(ll_row,'chaise')
lt_heure = dw_cincoutreg.getItemTime(ll_row,'heure')
ll_duree = dw_cincoutreg.getItemNumber(ll_row,'duree')
//ll_couleur = dw_cincoutreg.getItemNumber(ll_row,'couleur')
ls_stat =  dw_cincoutreg.getItemString(ll_row,'flags')
select id_personnel into :ll_personnel from patient where patient_id = :ll_patid;
lt_check = now()
lstr_cincout.id_personnel = ll_personnel
lstr_cincout.status = ls_stat
lstr_cincout.patient_id = ll_patid
lstr_cincout.chaise = ll_chaise
lstr_cincout.traitementnom = ls_trait
lstr_cincout.duree = ll_duree
lstr_cincout.heure = lt_heure
lstr_cincout.row = ll_row

SELECT utiliser_biometrie INTO :lb_utiliserbiometrie FROM t_options WHERE :il_ortho = ortho_id;

select 1 into :li_biopunch from PERSON where IDPATIENT = :ll_patid;

if lb_utiliserbiometrie = false or li_biopunch <> 1 then
	openwithparm(w_datenais, lstr_cincout)
else 
	w_biometrie lw_biometrie
	open(lw_biometrie)
	ll_id = 0
	lw_biometrie.of_getbioscan()
end if


end event

type r_1 from rectangle within w_cincoutreg
long linecolor = 134217752
integer linethickness = 4
long fillcolor = 134217752
integer x = 3913
integer y = 4
integer width = 759
integer height = 2992
end type

