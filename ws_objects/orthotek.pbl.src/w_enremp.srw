$PBExportHeader$w_enremp.srw
forward
global type w_enremp from w_response
end type
type st_con from u_st within w_enremp
end type
type cb_entsor from commandbutton within w_enremp
end type
type st_now from u_st within w_enremp
end type
type p_logo from picture within w_enremp
end type
type sle_pwd from singlelineedit within w_enremp
end type
type ddlb_listemp from u_ddlb within w_enremp
end type
type pb_quit from picturebutton within w_enremp
end type
end forward

global type w_enremp from w_response
integer width = 2587
integer height = 1168
boolean titlebar = false
boolean controlmenu = false
boolean border = false
long backcolor = 15780518
boolean center = true
boolean ib_isupdateable = false
st_con st_con
cb_entsor cb_entsor
st_now st_now
p_logo p_logo
sle_pwd sle_pwd
ddlb_listemp ddlb_listemp
pb_quit pb_quit
end type
global w_enremp w_enremp

type variables
Private:

boolean ib_in

end variables

on w_enremp.create
int iCurrent
call super::create
this.st_con=create st_con
this.cb_entsor=create cb_entsor
this.st_now=create st_now
this.p_logo=create p_logo
this.sle_pwd=create sle_pwd
this.ddlb_listemp=create ddlb_listemp
this.pb_quit=create pb_quit
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_con
this.Control[iCurrent+2]=this.cb_entsor
this.Control[iCurrent+3]=this.st_now
this.Control[iCurrent+4]=this.p_logo
this.Control[iCurrent+5]=this.sle_pwd
this.Control[iCurrent+6]=this.ddlb_listemp
this.Control[iCurrent+7]=this.pb_quit
end on

on w_enremp.destroy
call super::destroy
destroy(this.st_con)
destroy(this.cb_entsor)
destroy(this.st_now)
destroy(this.p_logo)
destroy(this.sle_pwd)
destroy(this.ddlb_listemp)
destroy(this.pb_quit)
end on

event open;call super::open;Title = "Enregistrement des employés"

timer(1)
end event

event timer;call super::timer;st_now.text = string(today(), "dddd, le d mmmm yyyy ") + string(now(), "hh:mm:ss")
end event

type st_con from u_st within w_enremp
integer x = 1271
integer y = 196
integer width = 946
integer height = 72
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 15780518
string text = ""
end type

type cb_entsor from commandbutton within w_enremp
integer x = 2121
integer y = 360
integer width = 215
integer height = 164
integer taborder = 30
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
end type

event clicked;long ll_id
string ls_pwd, ls_txt

ls_txt = sle_pwd.text
sle_pwd.text = ""

if ls_txt = "" then
	error_type(130)
	return 0
end if

if ddlb_listemp.of_findItem(ddlb_listemp.text, 0, true, true) = ddlb_listemp.of_SelectedItem() then
	ll_id = ddlb_listemp.of_getSelectedData()
	
	setNull(ls_pwd)
	
	select password
	  into :ls_pwd
	  from t_personnels
	 where id_personnel = :ll_id;
	
	if not isNull(ls_pwd) then
		if ls_pwd = ls_txt then
			if ib_in then
				update t_empentsor
					set sortie = current timestamp
				 where id_personnel = :ll_id
					and sortie is null;
			else
				insert into t_empentsor (id_personnel, entree)
						 values(:ll_id, current timestamp);
			end if
			
			return 0
		end if
	end if
	
	error_type(129)
end if

end event

type st_now from u_st within w_enremp
integer x = 27
integer y = 24
integer width = 2299
integer height = 120
integer textsize = -14
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 15780518
string text = ""
end type

type p_logo from picture within w_enremp
integer x = 5
integer y = 536
integer width = 2565
integer height = 620
boolean originalsize = true
string picturename = "C:\ii4net\orthotekdev\images\progitek.JPG"
boolean focusrectangle = false
end type

type sle_pwd from singlelineedit within w_enremp
integer x = 14
integer y = 312
integer width = 1006
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_listemp from u_ddlb within w_enremp
integer x = 14
integer y = 184
integer width = 1211
integer height = 480
integer taborder = 10
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean allowedit = true
boolean sorted = false
boolean ib_autoselect = true
boolean ib_rmbmenu = false
boolean ib_search = true
end type

event constructor;call super::constructor;long ll_idp
string ls_nom

DECLARE curEmp CURSOR FOR
  SELECT id_personnel,
  			nom || ' ' || prenom AS empnom 
	 FROM t_personnels
	WHERE actif = 1
ORDER BY empnom ASC;

OPEN curEmp;

FETCH curEmp INTO :ll_idp, :ls_nom;

do while SQLCA.SQLCode = 0
	of_addItem(ls_nom, ll_idp)
	
	FETCH curEmp INTO :ll_idp, :ls_nom;
loop

CLOSE curEmp;

end event

event selectionchanged;call super::selectionchanged;long ll_idp, ll_cnt
datetime ldtt_sor, ldtt_ent

ll_idp = long(of_getData(index))

select count(*)
  into :ll_cnt
  from t_empentsor
 where id_personnel = :ll_idp;

if ll_cnt = 0 then
	st_con.text = "Absent"
	cb_entsor.text = "E"
	ib_in = false
else
	  select first entree,
				sortie
		 into :ldtt_ent,
				:ldtt_sor
		 from t_empentsor
		where id_personnel = :ll_idp
	order by entree desc;
	
	if isNull(ldtt_sor) then
		st_con.text = "Arrivé(e) à " + string(ldtt_ent, "hh:mm:ss")
		cb_entsor.text = "S"
		ib_in = true
	else
		st_con.text = "Absent"
		cb_entsor.text = "E"
		ib_in = false
	end if
end if

end event

event losefocus;call super::losefocus;long ll_ind

//ll_ind = of_findItem(text, 0, true, true)
//
//if ll_ind <> of_SelectedItem() then
//	of_selectItem(ll_ind)
//end if

end event

type pb_quit from picturebutton within w_enremp
integer x = 2350
integer y = 360
integer width = 215
integer height = 164
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Exit!"
alignment htextalign = left!
end type

event clicked;close(parent)

end event

