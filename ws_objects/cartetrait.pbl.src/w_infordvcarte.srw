$PBExportHeader$w_infordvcarte.srw
forward
global type w_infordvcarte from w_response
end type
type cb_save from commandbutton within w_infordvcarte
end type
type st_1 from statictext within w_infordvcarte
end type
type cb_fermer from commandbutton within w_infordvcarte
end type
type dw_infordvcarte from u_dw within w_infordvcarte
end type
end forward

global type w_infordvcarte from w_response
integer x = 214
integer y = 221
integer width = 2629
integer height = 856
boolean titlebar = false
boolean controlmenu = false
boolean center = true
boolean ib_isupdateable = false
cb_save cb_save
st_1 st_1
cb_fermer cb_fermer
dw_infordvcarte dw_infordvcarte
end type
global w_infordvcarte w_infordvcarte

type variables
public: 
	long il_carterdv
	boolean change = false
end variables

on w_infordvcarte.create
int iCurrent
call super::create
this.cb_save=create cb_save
this.st_1=create st_1
this.cb_fermer=create cb_fermer
this.dw_infordvcarte=create dw_infordvcarte
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_save
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.dw_infordvcarte
end on

on w_infordvcarte.destroy
call super::destroy
destroy(this.cb_save)
destroy(this.st_1)
destroy(this.cb_fermer)
destroy(this.dw_infordvcarte)
end on

event open;call super::open;long ll_row, ll_idpers, ll_idcarteentete, ll_patid, ll_idcartetrait, ll_cnt

il_carterdv = long(gnv_app.inv_entrepotglobal.of_retournedonnee("idcarterdvconsole"))
ll_patid = long(gnv_app.inv_entrepotglobal.of_retournedonnee("patientidconsole"))
if dw_infordvcarte.retrieve(il_carterdv) = 0 then
	
// Carte entete 
/* Code effectué par: Dave Tremblay 
                 Ver: 8.4.17
					  Date: 04-10-2010
*/
	
	select count(1) into :ll_cnt from t_carteentete where patient_id = :ll_patid;
	if ll_cnt = 0 then
		insert into t_carteentete(patient_id) values(:ll_patid);
		error_type(-1)
	end if
	select id_carteentete into :ll_idcarteentete from t_carteentete where patient_id = :ll_patid;
	select id_personnel into :ll_idpers from patient where patient_id = :ll_patid;
	
	select count(1) into :ll_cnt 
	from t_cartetrait 
	where id_carteentete = :ll_idcarteentete and 
			datecarte = today();
			
	if ll_cnt = 0 then
		insert into t_cartetrait(datecarte,patient_id,id_personnel,id_carteentete)
		values(today(),:ll_patid,:ll_idpers,:ll_idcarteentete);
		error_type(-1)
	end if
	select id_cartetrait into :ll_idcartetrait 
	from t_cartetrait
	where id_carteentete = :ll_idcarteentete and 
			datecarte = today(); 
	
	ll_row = dw_infordvcarte.insertRow(0)
	dw_infordvcarte.setItem(ll_row,'id_cartetrait',ll_idcartetrait)
	change = true
	
//	ll_row = dw_infordvcarte.insertRow(0)
//	dw_infordvcarte.setItem(ll_row,'datecarte',today())
//	dw_infordvcarte.setItem(ll_row,'patient_id',il_patid)
//	select id_personnel into :ll_idpers from patient where patient_id = :il_patid;
//	dw_infordvcarte.setItem(ll_row,'id_personnel',ll_idpers)
//	dw_infordvcarte.setItem(ll_row,'t_cartetrait_id_carteentete',ll_idcarteentete)
//	change = true

end if
end event

type cb_save from commandbutton within w_infordvcarte
integer x = 14
integer y = 724
integer width = 914
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder"
end type

event clicked;dw_infordvcarte.acceptText()
if dw_infordvcarte.update( ) = 1 then 
	commit using SQLCA;
	change = false
else
	rollback using SQLCA;
end if
end event

type st_1 from statictext within w_infordvcarte
integer x = 23
integer width = 2578
integer height = 76
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Information  sur le prochain rendez-vous"
boolean focusrectangle = false
end type

type cb_fermer from commandbutton within w_infordvcarte
integer x = 1687
integer y = 724
integer width = 914
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;//if change then
//	if error_type(200) = 1 then
//		if dw_infordvcarte.update( ) = 1 then 
//			commit using SQLCA;
//		else
//			rollback using SQLCA;
//		end if
//	end if
//end if
close(parent)
end event

type dw_infordvcarte from u_dw within w_infordvcarte
integer x = 23
integer y = 96
integer width = 2601
integer height = 632
integer taborder = 10
string dataobject = "d_infordvcarte"
boolean vscrollbar = false
boolean border = false
boolean livescroll = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event itemchanged;call super::itemchanged;change = true
long ll_color, ll_id, ll_duree

if dwo.name = 'type_traitement_id' then
	ll_id = long(data)
	select color, duree into :ll_color, :ll_duree
	from type_de_traitement LEFT OUTER JOIN t_color ON type_de_traitement.color_id = t_color.color_id
	where type_de_traitement.type_traitement_id = :ll_id;
	object.type_traitement_id.background.color =  ll_color
	setItem(row,'duree',ll_duree)
end if
end event

event editchanged;call super::editchanged;change = true
end event

event constructor;call super::constructor;datawindowchild dwc_typetrait

if v_langue = 'an' then
	object.typeds.values = "Days~t1/Weeks~t2/Months~t3/Years~t4"
else
	object.typeds.values = "Jours~t1/Semaines~t2/Mois~t3/Années~t4"
end if

if getChild("type_traitement_id",dwc_typetrait) = -1 then
	error_type(50)
end if
dwc_typetrait.setTransObject(SQLCA)
dwc_typetrait.retrieve(v_no_ortho)
end event

