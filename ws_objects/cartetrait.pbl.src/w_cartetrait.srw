$PBExportHeader$w_cartetrait.srw
forward
global type w_cartetrait from w_response
end type
type st_1 from statictext within w_cartetrait
end type
type pb_1 from picturebutton within w_cartetrait
end type
type pb_delrdv from picturebutton within w_cartetrait
end type
type pb_addrdv from picturebutton within w_cartetrait
end type
type dw_carterdv from u_dw within w_cartetrait
end type
type rte_tempon from richtextedit within w_cartetrait
end type
type pb_del from picturebutton within w_cartetrait
end type
type pb_add from picturebutton within w_cartetrait
end type
type dw_cartetraitelast from u_dw within w_cartetrait
end type
type cb_3 from commandbutton within w_cartetrait
end type
type cb_close from commandbutton within w_cartetrait
end type
type cb_ok from commandbutton within w_cartetrait
end type
type dw_cartetrait from u_dw within w_cartetrait
end type
end forward

global type w_cartetrait from w_response
integer x = 214
integer y = 221
integer width = 3954
integer height = 2812
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 15793151
boolean center = true
boolean ib_isupdateable = false
boolean ib_disableclosequery = true
st_1 st_1
pb_1 pb_1
pb_delrdv pb_delrdv
pb_addrdv pb_addrdv
dw_carterdv dw_carterdv
rte_tempon rte_tempon
pb_del pb_del
pb_add pb_add
dw_cartetraitelast dw_cartetraitelast
cb_3 cb_3
cb_close cb_close
cb_ok cb_ok
dw_cartetrait dw_cartetrait
end type
global w_cartetrait w_cartetrait

type variables
s_pat ist_pat
long il_cartetrait
private boolean ib_change = false
boolean	ib_readonly = FALSE
end variables

on w_cartetrait.create
int iCurrent
call super::create
this.st_1=create st_1
this.pb_1=create pb_1
this.pb_delrdv=create pb_delrdv
this.pb_addrdv=create pb_addrdv
this.dw_carterdv=create dw_carterdv
this.rte_tempon=create rte_tempon
this.pb_del=create pb_del
this.pb_add=create pb_add
this.dw_cartetraitelast=create dw_cartetraitelast
this.cb_3=create cb_3
this.cb_close=create cb_close
this.cb_ok=create cb_ok
this.dw_cartetrait=create dw_cartetrait
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.pb_delrdv
this.Control[iCurrent+4]=this.pb_addrdv
this.Control[iCurrent+5]=this.dw_carterdv
this.Control[iCurrent+6]=this.rte_tempon
this.Control[iCurrent+7]=this.pb_del
this.Control[iCurrent+8]=this.pb_add
this.Control[iCurrent+9]=this.dw_cartetraitelast
this.Control[iCurrent+10]=this.cb_3
this.Control[iCurrent+11]=this.cb_close
this.Control[iCurrent+12]=this.cb_ok
this.Control[iCurrent+13]=this.dw_cartetrait
end on

on w_cartetrait.destroy
call super::destroy
destroy(this.st_1)
destroy(this.pb_1)
destroy(this.pb_delrdv)
destroy(this.pb_addrdv)
destroy(this.dw_carterdv)
destroy(this.rte_tempon)
destroy(this.pb_del)
destroy(this.pb_add)
destroy(this.dw_cartetraitelast)
destroy(this.cb_3)
destroy(this.cb_close)
destroy(this.cb_ok)
destroy(this.dw_cartetrait)
end on

event open;call super::open;string	ls_retour, ls_modif = ""
long		ll_col

ls_retour = gnv_app.inv_entrepotglobal.of_retournedonnee( "read only carte")
IF lower(ls_retour) = "oui" THEN
	ib_readonly = TRUE
	pb_add.visible = FALSE
	pb_del.visible = FALSE
	pb_addrdv.visible = FALSE
	pb_delrdv.visible = FALSE
	cb_ok.enabled = FALSE
//	dw_cartetrait.Object.DataWindow.ReadOnly="Yes"
	for ll_col = 1 to long(dw_cartetrait.object.datawindow.column.count)
		if dw_cartetrait.describe("#" + string(ll_col) + ".name") <> 'cartenote' then
			dw_cartetrait.setTabOrder(ll_col, 0)
		end if
	next
	dw_cartetrait.object.cartenote.RichEdit.DisplayOnly="Yes"
	dw_cartetrait.richTextToolbarActivation = RichTextToolbarActivationNever!
	dw_cartetrait.Object.DataWindow.column.count
	dw_cartetraitelast.Object.DataWindow.ReadOnly="Yes"
	dw_cartetrait.Object.shl_changer_couleur.visible = 0
	dw_cartetrait.Object.shl_type.visible = 0
	dw_carterdv.Object.DataWindow.ReadOnly="Yes"
ELSE
	ib_readonly = FALSE
//	pb_add.enabled = true
//	pb_del.enabled = true
	//cb_ok.event clicked()
END IF
end event

event close;call super::close;IF ib_readonly = FALSE and ib_change = true THEN
	if error_type(200) = 1 then
		IF cb_ok.event clicked() <> 0 THEN RETURN
	end if
END IF

if isvalid(w_dossier_patients) then
	w_dossier_patients.tab_dosspat.tabpage_cartetrait.dw_cartetrait.Retrieve(ist_pat.patid)
end if

close(this)
end event

type st_1 from statictext within w_cartetrait
integer x = 3758
integer y = 540
integer width = 174
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 16711680
long backcolor = 15793151
string text = "Idem"
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;long ll_row, ll_patid
string ls_forcegauche, ls_forcedroite, ls_dureegauche, ls_dureedroite
long ll_idelastypeh, ll_idelastypeb, ll_cebd1, ll_cebd2, ll_cebd3, ll_cebd4, ll_cebd5, ll_cebd6, ll_cebd7
long ll_cebg1, ll_cebg2, ll_cebg3, ll_cebg4, ll_cebg5, ll_cebg6, ll_cebg7, ll_cehd1, ll_cehd2, ll_cehd3
long ll_cehd4, ll_cehd5, ll_cehd6, ll_cehd7, ll_cehg1, ll_cehg2, ll_cehg3, ll_cehg4, ll_cehg5, ll_cehg6
long ll_cehg7, ll_cro123, ll_cro223, ll_cro323, ll_cro423

ib_change = TRUE	
IF cb_ok.event clicked() = 0 THEN

	select patient_id into :ll_patid from t_cartetrait where id_cartetrait = :il_cartetrait; 
	
	declare cartetrait cursor for
	
		select forcegauche,forcedroite,dureegauche,dureedroite, id_elastypeh,id_elastypeb,cebd1,cebd2,cebd3,cebd4,cebd5,cebd6,cebd7,cebg1,cebg2,cebg3,cebg4,cebg5,cebg6,cebg7,cehd1,cehd2,cehd3,cehd4,cehd5,cehd6,cehd7,cehg1,cehg2,cehg3,cehg4,cehg5,cehg6,cehg7,cro123,cro223,cro323,cro423
		  from t_cartetraitelast 
		 where id_cartetrait = (select first id_cartetrait
		                                from t_cartetraitelast 
		                               where id_cartetrait <> :il_cartetrait and id_cartetrait in (select id_cartetrait from t_cartetrait where patient_id = :ll_patid)  
	                               order by id_cartetrait desc);
	
	open cartetrait;
	
	fetch cartetrait into :ls_forcegauche, :ls_forcedroite, :ls_dureegauche, :ls_dureedroite,:ll_idelastypeh,:ll_idelastypeb,:ll_cebd1,:ll_cebd2,:ll_cebd3,:ll_cebd4,:ll_cebd5,:ll_cebd6,:ll_cebd7,:ll_cebg1,:ll_cebg2,:ll_cebg3,:ll_cebg4,:ll_cebg5,:ll_cebg6,:ll_cebg7,:ll_cehd1,:ll_cehd2,:ll_cehd3,:ll_cehd4,:ll_cehd5,:ll_cehd6,:ll_cehd7,:ll_cehg1,:ll_cehg2,:ll_cehg3,:ll_cehg4,:ll_cehg5,:ll_cehg6,:ll_cehg7,:ll_cro123,:ll_cro223,:ll_cro323,:ll_cro423;
	
	do while SQLCA.SQLCode = 0
		ll_row = dw_cartetraitelast.insertRow(0)
		dw_cartetraitelast.setItem(ll_row,"forcegauche",ls_forcegauche)
		dw_cartetraitelast.setItem(ll_row,"forcedroite",ls_forcedroite)
		dw_cartetraitelast.setItem(ll_row,"dureegauche",ls_dureegauche)
		dw_cartetraitelast.setItem(ll_row,"dureedroite",ls_dureedroite)
		dw_cartetraitelast.setItem(ll_row,'id_cartetrait',il_cartetrait)
		dw_cartetraitelast.setItem(ll_row,"id_elastypeh",ll_idelastypeh)
		dw_cartetraitelast.setItem(ll_row,"id_elastypeb",ll_idelastypeb)
		dw_cartetraitelast.setItem(ll_row,"cebd1",ll_cebd1)
		dw_cartetraitelast.setItem(ll_row,"cebd2",ll_cebd2)
		dw_cartetraitelast.setItem(ll_row,"cebd3",ll_cebd3)
		dw_cartetraitelast.setItem(ll_row,"cebd4",ll_cebd4)
		dw_cartetraitelast.setItem(ll_row,"cebd5",ll_cebd5)
		dw_cartetraitelast.setItem(ll_row,"cebd6",ll_cebd6)
		dw_cartetraitelast.setItem(ll_row,"cebd7",ll_cebd7)
		dw_cartetraitelast.setItem(ll_row,"cebg1",ll_cebg1)
		dw_cartetraitelast.setItem(ll_row,"cebg2",ll_cebg2)
		dw_cartetraitelast.setItem(ll_row,"cebg3",ll_cebg3)
		dw_cartetraitelast.setItem(ll_row,"cebg4",ll_cebg4)
		dw_cartetraitelast.setItem(ll_row,"cebg5",ll_cebg5)
		dw_cartetraitelast.setItem(ll_row,"cebg6",ll_cebg6)
		dw_cartetraitelast.setItem(ll_row,"cebg7",ll_cebg7)
		dw_cartetraitelast.setItem(ll_row,"cehd1",ll_cehd1)
		dw_cartetraitelast.setItem(ll_row,"cehd2",ll_cehd2)
		dw_cartetraitelast.setItem(ll_row,"cehd3",ll_cehd3)
		dw_cartetraitelast.setItem(ll_row,"cehd4",ll_cehd4)
		dw_cartetraitelast.setItem(ll_row,"cehd5",ll_cehd5)
		dw_cartetraitelast.setItem(ll_row,"cehd6",ll_cehd6)
		dw_cartetraitelast.setItem(ll_row,"cehd7",ll_cehd7)
		dw_cartetraitelast.setItem(ll_row,"cehg1",ll_cehg1)
		dw_cartetraitelast.setItem(ll_row,"cehg2",ll_cehg2)
		dw_cartetraitelast.setItem(ll_row,"cehg3",ll_cehg3)
		dw_cartetraitelast.setItem(ll_row,"cehg4",ll_cehg4)
		dw_cartetraitelast.setItem(ll_row,"cehg5",ll_cehg5)
		dw_cartetraitelast.setItem(ll_row,"cehg6",ll_cehg6)
		dw_cartetraitelast.setItem(ll_row,"cehg7",ll_cehg7)
		dw_cartetraitelast.setItem(ll_row,"cro123",ll_cro123)
		dw_cartetraitelast.setItem(ll_row,"cro223",ll_cro223)
		dw_cartetraitelast.setItem(ll_row,"cro323",ll_cro323)
		dw_cartetraitelast.setItem(ll_row,"cro423",ll_cro423)
		dw_cartetraitelast.setrow(ll_row)
		dw_cartetraitelast.scrolltorow(ll_row)
		dw_cartetraitelast.setfocus()
		
		fetch cartetrait into :ls_forcegauche, :ls_forcedroite, :ls_dureegauche, :ls_dureedroite,:ll_idelastypeh,:ll_idelastypeb,:ll_cebd1,:ll_cebd2,:ll_cebd3,:ll_cebd4,:ll_cebd5,:ll_cebd6,:ll_cebd7,:ll_cebg1,:ll_cebg2,:ll_cebg3,:ll_cebg4,:ll_cebg5,:ll_cebg6,:ll_cebg7,:ll_cehd1,:ll_cehd2,:ll_cehd3,:ll_cehd4,:ll_cehd5,:ll_cehd6,:ll_cehd7,:ll_cehg1,:ll_cehg2,:ll_cehg3,:ll_cehg4,:ll_cehg5,:ll_cehg6,:ll_cehg7,:ll_cro123,:ll_cro223,:ll_cro323,:ll_cro423;
	loop
	
	close cartetrait;

	ib_change = TRUE	
END IF
end event

type pb_1 from picturebutton within w_cartetrait
string tag = "resize=n"
integer x = 3790
integer y = 420
integer width = 119
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Print!"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;datastore ds_elastique

ds_elastique = create datastore
ds_elastique.dataobject = "d_cartetraitelastimp"
ds_elastique.setTransObject(SQLCA)
ds_elastique.retrieve(il_cartetrait)

gb_datawindow = false
openwithparm(w_print_options,ds_elastique)
end event

type pb_delrdv from picturebutton within w_cartetrait
string tag = "resize=n"
integer x = 3790
integer y = 1932
integer width = 119
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\stop.gif"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_carterdv.deleteRow(dw_carterdv.getRow())
if dw_carterdv.DeletedCount() > 0 then
	if dw_carterdv.update() = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
end if

ib_change = TRUE
end event

type pb_addrdv from picturebutton within w_cartetrait
string tag = "resize=n"
integer x = 3790
integer y = 1824
integer width = 119
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\ajout.jpg"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;long ll_row

ib_change = TRUE	
IF cb_ok.event clicked() = 0 THEN
	ll_row = dw_carterdv.insertRow(0)
	dw_carterdv.setItem(ll_row,'id_cartetrait',il_cartetrait)
	dw_carterdv.setItem(ll_row,'ortho_id',v_no_ortho)
	dw_carterdv.setrow(ll_row)
	dw_carterdv.scrolltorow(ll_row)
	dw_carterdv.setfocus()
	ib_change = TRUE	
END IF


end event

type dw_carterdv from u_dw within w_cartetrait
string tag = "resize=n"
integer x = 18
integer y = 1820
integer width = 3904
integer height = 772
integer taborder = 40
string dataobject = "d_cartetrairrdv"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;datawindowchild dwc_typetrait

if getChild("type_traitement_id",dwc_typetrait) = -1 then
	error_type(50)
end if
dwc_typetrait.setTransObject(SQLCA)
dwc_typetrait.retrieve(v_no_ortho)

if v_langue = 'an' then
	object.typeds.values = "Days~t1/Weeks~t2/Months~t3/Years~t4"
else
	object.typeds.values = "Jours~t1/Semaines~t2/Mois~t3/Années~t4"
end if

end event

event itemchanged;call super::itemchanged;long ll_data, ll_duree
ib_change = TRUE

if dwo.name = 'type_traitement_id' then
	
	ll_data = long(data)
	select duree into :ll_duree from type_de_traitement where type_traitement_id = :ll_data and ortho_id = :v_no_ortho;
	setITem(row,'duree',ll_duree)
	
end if
end event

event editchanged;call super::editchanged;ib_change = TRUE
end event

type rte_tempon from richtextedit within w_cartetrait
boolean visible = false
integer width = 197
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type pb_del from picturebutton within w_cartetrait
string tag = "resize=n"
integer x = 3790
integer y = 316
integer width = 119
integer height = 104
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\stop.gif"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;dw_cartetraitelast.deleteRow(dw_cartetraitelast.getRow())
if dw_cartetraitelast.DeletedCount() > 0 then
	if dw_cartetraitelast.update() = 1 then
		commit using SQLCA;
	else
		rollback using SQLCA;
	end if
end if

ib_change = TRUE
end event

type pb_add from picturebutton within w_cartetrait
string tag = "resize=n"
integer x = 3790
integer y = 212
integer width = 119
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "C:\ii4net\orthotek\images\ajout.jpg"
alignment htextalign = left!
boolean map3dcolors = true
end type

event clicked;long ll_row

ib_change = TRUE	
IF cb_ok.event clicked() = 0 THEN
	ll_row = dw_cartetraitelast.insertRow(0)
	dw_cartetraitelast.setItem(ll_row,'id_cartetrait',il_cartetrait)
	dw_cartetraitelast.setrow(ll_row)
	dw_cartetraitelast.scrolltorow(ll_row)
	dw_cartetraitelast.setfocus()
	
	ib_change = TRUE	
END IF


end event

type dw_cartetraitelast from u_dw within w_cartetrait
string tag = "resize=n"
integer x = 1737
integer y = 132
integer width = 1989
integer height = 1064
integer taborder = 20
string dataobject = "d_cartetraitelast"
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;call super::clicked;string ls_name
long ll_valeur

CHOOSE CASE left(dwo.name,6) 
	CASE 't_cehd', 't_cehg', 't_cebd', 't_cebg'
		ls_name = mid(dwo.name,3)
		ll_valeur = getItemNumber(row, ls_name)
		if isNull(ll_valeur) then ll_valeur = 0
		
		setItem(row, ls_name, 1 - ll_valeur)
END CHOOSE

end event

event itemchanged;call super::itemchanged;ib_change = TRUE
end event

event constructor;call super::constructor;datawindowchild dwc_dureegauche, dwc_dureedroite, dwc_forcegauche, dwc_forcedroite

if getChild("dureegauche",dwc_dureegauche) = -1 then
	error_type(50)
end if
dwc_dureegauche.setTransObject(SQLCA)
dwc_dureegauche.retrieve(v_no_ortho)

if getChild("dureedroite",dwc_dureedroite) = -1 then
	error_type(50)
end if
dwc_dureedroite.setTransObject(SQLCA)
dwc_dureedroite.retrieve(v_no_ortho)

if getChild("forcegauche",dwc_forcegauche) = -1 then
	error_type(50)
end if
dwc_forcegauche.setTransObject(SQLCA)
dwc_forcegauche.retrieve(v_no_ortho)

if getChild("forcedroite",dwc_forcedroite) = -1 then
	error_type(50)
end if
dwc_forcedroite.setTransObject(SQLCA)
dwc_forcedroite.retrieve(v_no_ortho)

end event

event buttonclicked;call super::buttonclicked;CHOOSE CASE dwo.name
	CASE 'b_copygauche'
         setItem(row,'id_elastypeb',getItemNumber(row,'id_elastypeh'))
         setItem(row,'forcegauche',getItemString(row,'forcedroite'))
			setItem(row,'dureegauche',getItemString(row,'dureedroite'))
			setItem(row,'cebg1',getItemNumber(row,'cebd1'))
			setItem(row,'cebg2',getItemNumber(row,'cebd2')) 
			setItem(row,'cebg3',getItemNumber(row,'cebd3')) 
			setItem(row,'cebg4',getItemNumber(row,'cebd4')) 
			setItem(row,'cebg5',getItemNumber(row,'cebd5')) 
			setItem(row,'cebg6',getItemNumber(row,'cebd6')) 
			setItem(row,'cebg7',getItemNumber(row,'cebd7'))
			setItem(row,'cehg1',getItemNumber(row,'cehd1'))
			setItem(row,'cehg2',getItemNumber(row,'cehd2')) 
			setItem(row,'cehg3',getItemNumber(row,'cehd3')) 
			setItem(row,'cehg4',getItemNumber(row,'cehd4')) 
			setItem(row,'cehg5',getItemNumber(row,'cehd5')) 
			setItem(row,'cehg6',getItemNumber(row,'cehd6')) 
			setItem(row,'cehg7',getItemNumber(row,'cehd7')) 
			setItem(row,'cro223',getItemNumber(row,'cro123')) 
			setItem(row,'cro323',getItemNumber(row,'cro423')) 
	CASE 'b_copydroit'
         setItem(row,'id_elastypeh',getItemNumber(row,'id_elastypeb'))
			setItem(row,'forcedroite',getItemString(row,'forcegauche'))
			setItem(row,'dureedroite',getItemString(row,'dureegauche'))
			setItem(row,'cebd1',getItemNumber(row,'cebg1'))
			setItem(row,'cebd2',getItemNumber(row,'cebg2')) 
			setItem(row,'cebd3',getItemNumber(row,'cebg3')) 
			setItem(row,'cebd4',getItemNumber(row,'cebg4')) 
			setItem(row,'cebd5',getItemNumber(row,'cebg5')) 
			setItem(row,'cebd6',getItemNumber(row,'cebg6')) 
			setItem(row,'cebd7',getItemNumber(row,'cebg7')) 
			setItem(row,'cehd1',getItemNumber(row,'cehg1'))
			setItem(row,'cehd2',getItemNumber(row,'cehg2')) 
			setItem(row,'cehd3',getItemNumber(row,'cehg3')) 
			setItem(row,'cehd4',getItemNumber(row,'cehg4')) 
			setItem(row,'cehd5',getItemNumber(row,'cehg5')) 
			setItem(row,'cehd6',getItemNumber(row,'cehg6')) 
			setItem(row,'cehd7',getItemNumber(row,'cehg7')) 
			setItem(row,'cro123',getItemNumber(row,'cro223')) 
			setItem(row,'cro423',getItemNumber(row,'cro323')) 
END CHOOSE

end event

type cb_3 from commandbutton within w_cartetrait
string tag = "resize=n"
integer x = 841
integer y = 2600
integer width = 2249
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_close from commandbutton within w_cartetrait
string tag = "resize=n"
integer x = 3095
integer y = 2600
integer width = 827
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
boolean cancel = true
end type

event clicked;IF ib_readonly = FALSE and ib_change = true THEN
	if error_type(200) = 1 then
		IF cb_ok.event clicked() <> 0 THEN RETURN
	end if
END IF

if isvalid(w_dossier_patients) then
	w_dossier_patients.tab_dosspat.tabpage_cartetrait.dw_cartetrait.Retrieve(ist_pat.patid)
end if

close(parent)
end event

type cb_ok from commandbutton within w_cartetrait
string tag = "resize=n"
integer x = 14
integer y = 2600
integer width = 827
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Enregistrer"
end type

event clicked;long	ll_row, ll_null, ll_iduser
string ls_poste, ls_obu, ls_oju
SetNull(ll_null)

if ib_change then
	ll_row = dw_cartetrait.GetRow()
	IF ll_row > 0 THEN
		ll_iduser = dw_cartetrait.getItemNumber(ll_row,'t_cartetrait_id_usersigne')
		select postocc into :ls_poste from t_personnels where id_personnel = :ll_iduser;
		if ls_poste <> 'O' then dw_cartetrait.object.t_cartetrait_id_orthosigne[ll_row] = ll_null
		dw_cartetrait.AcceptText()
	END IF
	if dw_cartetrait.update() = 1 then
		commit using SQLCA;
		il_cartetrait = dw_cartetrait.getItemNumber(dw_cartetrait.getRow(),'id_cartetrait')
		dw_cartetraitelast.enabled = true
		pb_add.enabled = true
		pb_del.enabled = true
		if dw_cartetraitelast.update() = 1 then
			commit using SQLCA;
			ib_change = false
		END IF
		dw_carterdv.enabled = true
		pb_addrdv.enabled = true
		pb_delrdv.enabled = true
		if dw_carterdv.update() = 1 then
			commit using SQLCA;
			ib_change = false
		END IF
		// Sauver les unités de mesure par défaut
		
		ll_row = dw_cartetrait.getRow()
		if ll_row > 0 then
			ls_obu = dw_cartetrait.getItemString(ll_row, 't_cartetrait_obu')
			ls_oju = dw_cartetrait.getItemString(ll_row, 't_cartetrait_oju')
			
			update t_options set obu = :ls_obu,
										oju = :ls_oju
								where ortho_id = :v_no_ortho;
		end if
		
		RETURN 0
	else
		rollback using SQLCA;
		RETURN 1
	end if
end if
RETURN 0



end event

type dw_cartetrait from u_dw within w_cartetrait
string tag = "resize=n"
integer width = 3941
integer height = 1816
integer taborder = 10
string dataobject = "d_cartetrait"
boolean vscrollbar = false
boolean border = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;call super::constructor;ist_pat = message.powerobjectparm
long ll_row, ll_idcarteentete, ll_idpersonnel, ll_id, ll_iduser
datawindowchild dwc_app
string	ls_user, ls_obu, ls_oju
il_cartetrait = long(gnv_app.inv_entrepotglobal.of_retournedonnee( "id carte traitement modifier"))

setTransObject(SQLCA)

if getChild("t_cartetrait_id_app",dwc_app) = -1 then
	error_type(50)
end if
dwc_app.setTransObject(SQLCA)
dwc_app.retrieve(v_no_ortho)

if retrieve(il_cartetrait) = 0 then
	ll_row = insertRow(0)
	setitem(ll_row,'patient_id',ist_pat.patid)
	ls_user = string(gnv_app.inv_entrepotglobal.of_retournedonnee("authenuser"))
	ll_id = long(ls_user)
	setitem(ll_row,'t_cartetrait_id_usersigne',ll_id)
	
	//Si c'est l'ortho, on vire au vert tout de suite
	select id_personnel into :ll_iduser from t_personnels where id_personnel = :ll_id
	AND ( postocc = 'O' OR postocc = 'P' );
	
	IF ll_iduser <> 0 AND not isnull(ll_iduser) THEN
		setItem(ll_row,'t_cartetrait_id_orthosigne',ll_iduser)
	END IF
	
	select id_carteentete into :ll_idcarteentete from t_carteentete where patient_id = :ist_pat.patid;
	setItem(ll_row,'t_cartetrait_id_carteentete',ll_idcarteentete)
	setitem(ll_row,'datecarte',today())
	setitem(ll_row,'cebd7',0)
	setitem(ll_row,'cebd6',0)  
	setitem(ll_row,'cebd5',0)
	setitem(ll_row,'cebd4',0)
	setitem(ll_row,'cebd3',0)
	setitem(ll_row,'cebd2',0)
	setitem(ll_row,'cebd1',0)
	setitem(ll_row,'cebg7',0)
	setitem(ll_row,'cebg6',0)
	setitem(ll_row,'cebg5',0)
	setitem(ll_row,'cebg4',0)
	setitem(ll_row,'cebg3',0)
	setitem(ll_row,'cebg2',0)
	setitem(ll_row,'cebg1',0)
	setitem(ll_row,'cehd7',0)
	setitem(ll_row,'cehd6',0)
	setitem(ll_row,'cehd5',0)
	setitem(ll_row,'cehd4',0)
	setitem(ll_row,'cehd3',0)
	setitem(ll_row,'cehd2',0)
	setitem(ll_row,'cehd1',0)
	setitem(ll_row,'cehg7',0)
	setitem(ll_row,'cehg6',0)
	setitem(ll_row,'cehg5',0)
	setitem(ll_row,'cehg4',0)
	setitem(ll_row,'cehg3',0)
	setitem(ll_row,'cehg2',0)
	setitem(ll_row,'cehg1',0)
	
//	//Mettre le personnel
//	select id_personnel into :ll_idpersonnel from patient where patient_id = :ist_pat.patid ;
//	setitem(ll_row,'t_cartetrait_id_personnel',ll_idpersonnel)
//	
//	//Si c'est l'ortho, on vire au vert tout de suite
//	select id_personnel into :ll_iduser from t_personnels where id_personnel = :ll_id
//	AND ( postocc = 'O' OR postocc = 'P' );
//	
//	IF ll_iduser <> 0 AND not isnull(ll_iduser) THEN
//		setItem(ll_row,'t_cartetrait_id_orthosigne',ll_iduser)
//	END IF
	
	// Mettre l'unité de mesure par défaut
	
	select oju, obu into :ls_oju, :ls_obu from t_options where ortho_id = :v_no_ortho;
	setitem(ll_row,'t_cartetrait_oju',ls_oju)
	setitem(ll_row,'t_cartetrait_obu',ls_obu)
	
	//ib_change = true
//	dw_cartetraitelast.enabled = false
//	pb_add.enabled = false
//	pb_del.enabled = false
//	dw_carterdv.enabled = false
//	pb_addrdv.enabled = false
//	pb_delrdv.enabled = false

	
else
	
	dw_cartetraitelast.retrieve(il_cartetrait)
	dw_cartetraitelast.enabled = true
	pb_add.enabled = true
	pb_del.enabled = true
	dw_carterdv.retrieve(il_cartetrait)
	dw_carterdv.enabled = true
	pb_addrdv.enabled = true
	pb_delrdv.enabled = true
	ls_user = string(gnv_app.inv_entrepotglobal.of_retournedonnee("authenuser"))
	ll_id = long(ls_user)
	setitem(getRow(),'t_cartetrait_id_usersigne',ll_id)
	
	//Si c'est l'ortho, on vire au vert tout de suite
	select id_personnel into :ll_iduser from t_personnels where id_personnel = :ll_id
	AND ( postocc = 'O' OR postocc = 'P' );
	
	IF ll_iduser <> 0 AND not isnull(ll_iduser) THEN
		setItem(getRow(),'t_cartetrait_id_orthosigne',ll_iduser)
	END IF
	
end if


end event

event itemchanged;call super::itemchanged;long ll_color, ll_id, ll_duree

if dwo.name = 'type_traitement_id' then
	ll_id = long(data)
	select color, duree into :ll_color, :ll_duree
	from type_de_traitement LEFT OUTER JOIN t_color ON type_de_traitement.color_id = t_color.color_id
	where type_de_traitement.type_traitement_id = :ll_id and
			type_de_traitement.ortho_id = :v_no_ortho;
	
	object.type_traitement_id.background.color =  ll_color
	object.duree[getrow()] =  ll_duree
	
end if
ib_change = true
end event

event editchanged;call super::editchanged;ib_change = true
end event

event clicked;call super::clicked;string ls_name, ls_phrase , ls_phrase_orig
long ll_valeur, ll_color, ll_retour

IF row > 0 THEN
	CHOOSE CASE left(dwo.name,6) 
		CASE 't_cehd', 't_cehg', 't_cebd', 't_cebg'
			ls_name = mid(dwo.name,3)
			ll_valeur = getItemNumber(row,ls_name)
			if ll_valeur = 1 then
				setItem(row,ls_name,0)
			else
				setItem(row,ls_name,1)
			end if
			
		CASE "shl_ty"
			//Ouvrir l'interface de choix de phrase
			w_choix_phrase_type lw_open
			
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("lien tableau datastore sg","d_souscategoriephrase")
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("lien tableau datastore g","ds_categoriephrase")
			gnv_app.inv_entrepotglobal.of_ajoutedonnee("lien tableau phrase","")
			Open(lw_open)
			
			ls_phrase = gnv_app.inv_entrepotglobal.of_retournedonnee("lien tableau phrase")
			
			If Isnull(ls_phrase) THEN ls_phrase = ""
			
			rte_tempon.selectTextAll()
			
			THIS.AcceptText()
			ls_phrase_orig = THIS.object.cartenote[row]
			If Isnull(ls_phrase_orig) THEN
				rte_tempon.replaceText("")
			ELSE
				rte_tempon.pasteRTF(ls_phrase_orig)
				rte_tempon.replaceText("~r~n")
			END IF
			
			rte_tempon.replaceText(ls_phrase)

			ls_phrase = rte_tempon.copyRTF(false)
			
			THIS.object.cartenote[row] = ls_phrase
			
			dw_cartetrait.AcceptText()
			ib_change = true
			

		CASE "shl_ch" 
			ll_color = THIS.Object.t_cartetrait_couleur_texte[row]
			IF Isnull(ll_color) THEN ll_color = 0
			
			ll_retour = ChooseColor ( ll_color) 
			if ll_retour > 0 then
			
				THIS.Object.t_cartetrait_couleur_texte[row] = ll_color
				THIS.AcceptText()
				THIS.GroupCalc()
				THIS.SetFocus()
				THIS.Setcolumn("cartenote")
			END IF
			
		
			
	END CHOOSE
END IF
end event

