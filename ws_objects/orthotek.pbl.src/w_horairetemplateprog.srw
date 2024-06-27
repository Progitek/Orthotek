$PBExportHeader$w_horairetemplateprog.srw
forward
global type w_horairetemplateprog from w_child
end type
type cbx_c15 from checkbox within w_horairetemplateprog
end type
type cbx_c14 from checkbox within w_horairetemplateprog
end type
type cbx_c13 from checkbox within w_horairetemplateprog
end type
type cbx_c12 from checkbox within w_horairetemplateprog
end type
type cbx_c11 from checkbox within w_horairetemplateprog
end type
type cb_3 from commandbutton within w_horairetemplateprog
end type
type cb_2 from commandbutton within w_horairetemplateprog
end type
type cb_1 from commandbutton within w_horairetemplateprog
end type
type cb_tplcolor from commandbutton within w_horairetemplateprog
end type
type cbx_c10 from checkbox within w_horairetemplateprog
end type
type cbx_c9 from checkbox within w_horairetemplateprog
end type
type cbx_c8 from checkbox within w_horairetemplateprog
end type
type cbx_c7 from checkbox within w_horairetemplateprog
end type
type cbx_c6 from checkbox within w_horairetemplateprog
end type
type cb_apply from commandbutton within w_horairetemplateprog
end type
type cbx_c5 from checkbox within w_horairetemplateprog
end type
type cbx_c4 from checkbox within w_horairetemplateprog
end type
type cbx_c3 from checkbox within w_horairetemplateprog
end type
type cbx_c2 from checkbox within w_horairetemplateprog
end type
type cbx_c1 from checkbox within w_horairetemplateprog
end type
type st_chaises from statictext within w_horairetemplateprog
end type
type em_end from editmask within w_horairetemplateprog
end type
type st_a from statictext within w_horairetemplateprog
end type
type st_de from statictext within w_horairetemplateprog
end type
type st_plage from statictext within w_horairetemplateprog
end type
type em_start from editmask within w_horairetemplateprog
end type
type sle_color from singlelineedit within w_horairetemplateprog
end type
type st_1 from statictext within w_horairetemplateprog
end type
type cb_delete from commandbutton within w_horairetemplateprog
end type
type st_num from statictext within w_horairetemplateprog
end type
type cb_choice from commandbutton within w_horairetemplateprog
end type
type cb_update from commandbutton within w_horairetemplateprog
end type
type cb_insert from commandbutton within w_horairetemplateprog
end type
type st_pm from statictext within w_horairetemplateprog
end type
type st_am from statictext within w_horairetemplateprog
end type
type st_title from statictext within w_horairetemplateprog
end type
type cb_close from commandbutton within w_horairetemplateprog
end type
type dw_templpm from u_dw within w_horairetemplateprog
end type
type dw_templam from u_dw within w_horairetemplateprog
end type
type dw_templliste from u_dw within w_horairetemplateprog
end type
type dw_traitements from u_dw within w_horairetemplateprog
end type
end forward

global type w_horairetemplateprog from w_child
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string pointer = "Arrow!"
boolean toolbarvisible = false
boolean ib_isupdateable = false
event ue_post_open ( )
cbx_c15 cbx_c15
cbx_c14 cbx_c14
cbx_c13 cbx_c13
cbx_c12 cbx_c12
cbx_c11 cbx_c11
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_tplcolor cb_tplcolor
cbx_c10 cbx_c10
cbx_c9 cbx_c9
cbx_c8 cbx_c8
cbx_c7 cbx_c7
cbx_c6 cbx_c6
cb_apply cb_apply
cbx_c5 cbx_c5
cbx_c4 cbx_c4
cbx_c3 cbx_c3
cbx_c2 cbx_c2
cbx_c1 cbx_c1
st_chaises st_chaises
em_end em_end
st_a st_a
st_de st_de
st_plage st_plage
em_start em_start
sle_color sle_color
st_1 st_1
cb_delete cb_delete
st_num st_num
cb_choice cb_choice
cb_update cb_update
cb_insert cb_insert
st_pm st_pm
st_am st_am
st_title st_title
cb_close cb_close
dw_templpm dw_templpm
dw_templam dw_templam
dw_templliste dw_templliste
dw_traitements dw_traitements
end type
global w_horairetemplateprog w_horairetemplateprog

type variables
long il_idtemplate, il_color, il_tplcolor
integer ii_changetpl = 0, ii_changeprog = 0, ii_modeajout = 0

end variables

forward prototypes
public subroutine f_refresh ()
public subroutine sauve ()
public subroutine affichage ()
end prototypes

event ue_post_open();if message.doubleparm > 0 then
	il_idtemplate = message.doubleparm  //parametre externe
	if il_idtemplate > 0 then
		dw_templam.VScrollBar = TRUE
		dw_templpm.VScrollBar = TRUE
		dw_templliste.visible = false
		dw_traitements.visible = true
		dw_templam.enabled = true
		dw_templpm.enabled = true
		affichage()
		sle_color.enabled = true
		em_start.enabled = true
		em_end.enabled = true
		cbx_c1.enabled = true
		cbx_c2.enabled = true
		cbx_c3.enabled = true
		cbx_c4.enabled = true
		cbx_c5.enabled = true
		cbx_c6.enabled = true
		cbx_c7.enabled = true
		cbx_c8.enabled = true
		cbx_c9.enabled = true
		cbx_c10.enabled = true
		cbx_c11.enabled = true
		cbx_c12.enabled = true
		cbx_c13.enabled = true
		cbx_c14.enabled = true
		cbx_c15.enabled = true
		cb_apply.enabled = true
	end if
end if
end event

public subroutine f_refresh ();if ii_modeajout = 1 then
	cb_choice.enabled = false
	cb_insert.enabled = false
	cb_delete.enabled = false
	dw_templliste.enabled = true
	dw_templliste.visible = true
	dw_traitements.visible = false
	dw_templam.reset()
	dw_templpm.reset()
else
	dw_templam.VScrollBar = true
	dw_templpm.VScrollBar = true
	dw_templliste.visible = false
	dw_traitements.visible = true
	dw_templam.enabled = true
	dw_templpm.enabled = true
	dw_templliste.enabled = true
	cb_insert.enabled = true
	sle_color.enabled = true
	em_start.enabled = true
	em_end.enabled = true
	cbx_c1.enabled = true
	cbx_c2.enabled = true
	cbx_c3.enabled = true
	cbx_c4.enabled = true
	cbx_c5.enabled = true
	cbx_c6.enabled = true
	cbx_c7.enabled = true
	cbx_c8.enabled = true
	cbx_c9.enabled = true
	cbx_c10.enabled = true
	cbx_c11.enabled = true
	cbx_c12.enabled = true
	cbx_c13.enabled = true
	cbx_c14.enabled = true
	cbx_c15.enabled = true
	cb_apply.enabled = true
end if
end subroutine

public subroutine sauve ();long ll_row
if ii_changetpl = 1 then
	if dw_templliste.update() = 1 then
		commit;
		dw_templliste.SetRedraw(false)
		ll_row = dw_templliste.getrow()
		dw_templliste.retrieve(v_no_ortho)
		dw_templliste.scrolltorow(ll_row)
		dw_templliste.SetRedraw(true)
		ii_changetpl = 0
		if ii_modeajout = 1 then affichage()
		ii_modeajout = 0
	else
		error_type(50)
		rollback;
	end if
end if
if ii_changeprog = 1 then
	if dw_templam.update(true,false) = 1 then
		if dw_templpm.update(true,false) = 1 then
			commit;
			ii_changeprog = 0
			update t_templatedate set flagapply = 0 where id_template = :il_idtemplate;
			commit;
		else
			error_type(50)
			rollback;
		end if
	end if
end if
//f_refresh()
end subroutine

public subroutine affichage ();long vartest, m, h, v,w
string v_fin, ls_tpl
time var_heure, v_heure_fin_am, v_heure_fin_pm
int v_hor_depart_am, v_hor_fin_am, v_hor_depart_pm, v_hor_fin_pm, v_step, v_option
//refresh cb
cb_choice.enabled = true
//pour obtenir la couleur de fond de base
setnull(w)
select nomtempl into :ls_tpl from t_templates where id_template = :il_idtemplate;
st_num.text = string(ls_tpl)
//if ii_changetpl = 1 then
//	sauve()
//end if
SELECT hor_depart_am,hor_depart_pm,hor_fin_am,hor_fin_pm,hor_step,hor_aff_pm into :v_hor_depart_am,:v_hor_depart_pm,:v_hor_fin_am,:v_hor_fin_pm,:v_step,:v_option from t_options where ortho_id = :v_no_ortho;
v_fin = string(v_hor_fin_am) + ':55'
v_heure_fin_am = time(v_fin)
v_fin = string(v_hor_depart_pm) + ':00'
v_heure_fin_pm = time(v_fin)
// Vérifier si les enregistrements sont créés pour cette date
vartest = dw_templam.retrieve(il_idtemplate,v_heure_fin_am)
dw_templpm.retrieve(il_idtemplate,v_heure_fin_am)
// Créer les enregistrements
CHOOSE CASE v_step
CASE 5
if vartest = 0 then
	for h=v_hor_depart_am to v_hor_fin_am
		for m=0 to 55 step 5
			var_heure=time(string(h)+":"+string(m))
			insert into t_templateprog (id_template,heures,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15)
			values (:il_idtemplate,:var_heure,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w);
		next
	next 
	if v_option = 1 then
		for h=v_hor_depart_pm to v_hor_fin_pm
			for m=0 to 55 step 5
				var_heure=time(string(h)+":"+string(m))
				insert into t_templateprog (id_template,heures,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15)
				values (:il_idtemplate,:var_heure,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w);
			next
		next 
	end if
	commit;
else
	return
end if

CASE 10
if vartest = 0 then
	for h=v_hor_depart_am to v_hor_fin_am
		for m=0 to 50 step 10
			var_heure=time(string(h)+":"+string(m))
			insert into t_templateprog (id_template,heures,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15)
			values (:il_idtemplate,:var_heure,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w);
		next
	next 
	if v_option = 1 then
		for h=v_hor_depart_pm to v_hor_fin_pm
			for m=0 to 50 step 10
				var_heure=time(string(h)+":"+string(m))
				insert into t_templateprog (id_template,heures,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15)
				values (:il_idtemplate,:var_heure,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w);
			next
		next 
	end if
	commit;
else
	return
end if

CASE 15
if vartest = 0 then
	for h=v_hor_depart_am to v_hor_fin_am
		for m=0 to 45 step 15
			var_heure=time(string(h)+":"+string(m))
			insert into t_templateprog (id_template,heures,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15)
			values (:il_idtemplate,:var_heure,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w);
		next
	next 
	if v_option = 1 then
		for h=v_hor_depart_pm to v_hor_fin_pm
			for m=0 to 45 step 15
				var_heure=time(string(h)+":"+string(m))
				insert into t_templateprog (id_template,heures,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15)
				values (:il_idtemplate,:var_heure,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w,:w);
			next
		next 
	end if
	commit;
else
	return
end if
CASE ELSE
	error_type(0)
END CHOOSE
// Afficher les informations
dw_templam.retrieve(il_idtemplate,v_heure_fin_am)
dw_templpm.retrieve(il_idtemplate,v_heure_fin_am)
end subroutine

on w_horairetemplateprog.create
int iCurrent
call super::create
this.cbx_c15=create cbx_c15
this.cbx_c14=create cbx_c14
this.cbx_c13=create cbx_c13
this.cbx_c12=create cbx_c12
this.cbx_c11=create cbx_c11
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_tplcolor=create cb_tplcolor
this.cbx_c10=create cbx_c10
this.cbx_c9=create cbx_c9
this.cbx_c8=create cbx_c8
this.cbx_c7=create cbx_c7
this.cbx_c6=create cbx_c6
this.cb_apply=create cb_apply
this.cbx_c5=create cbx_c5
this.cbx_c4=create cbx_c4
this.cbx_c3=create cbx_c3
this.cbx_c2=create cbx_c2
this.cbx_c1=create cbx_c1
this.st_chaises=create st_chaises
this.em_end=create em_end
this.st_a=create st_a
this.st_de=create st_de
this.st_plage=create st_plage
this.em_start=create em_start
this.sle_color=create sle_color
this.st_1=create st_1
this.cb_delete=create cb_delete
this.st_num=create st_num
this.cb_choice=create cb_choice
this.cb_update=create cb_update
this.cb_insert=create cb_insert
this.st_pm=create st_pm
this.st_am=create st_am
this.st_title=create st_title
this.cb_close=create cb_close
this.dw_templpm=create dw_templpm
this.dw_templam=create dw_templam
this.dw_templliste=create dw_templliste
this.dw_traitements=create dw_traitements
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_c15
this.Control[iCurrent+2]=this.cbx_c14
this.Control[iCurrent+3]=this.cbx_c13
this.Control[iCurrent+4]=this.cbx_c12
this.Control[iCurrent+5]=this.cbx_c11
this.Control[iCurrent+6]=this.cb_3
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.cb_tplcolor
this.Control[iCurrent+10]=this.cbx_c10
this.Control[iCurrent+11]=this.cbx_c9
this.Control[iCurrent+12]=this.cbx_c8
this.Control[iCurrent+13]=this.cbx_c7
this.Control[iCurrent+14]=this.cbx_c6
this.Control[iCurrent+15]=this.cb_apply
this.Control[iCurrent+16]=this.cbx_c5
this.Control[iCurrent+17]=this.cbx_c4
this.Control[iCurrent+18]=this.cbx_c3
this.Control[iCurrent+19]=this.cbx_c2
this.Control[iCurrent+20]=this.cbx_c1
this.Control[iCurrent+21]=this.st_chaises
this.Control[iCurrent+22]=this.em_end
this.Control[iCurrent+23]=this.st_a
this.Control[iCurrent+24]=this.st_de
this.Control[iCurrent+25]=this.st_plage
this.Control[iCurrent+26]=this.em_start
this.Control[iCurrent+27]=this.sle_color
this.Control[iCurrent+28]=this.st_1
this.Control[iCurrent+29]=this.cb_delete
this.Control[iCurrent+30]=this.st_num
this.Control[iCurrent+31]=this.cb_choice
this.Control[iCurrent+32]=this.cb_update
this.Control[iCurrent+33]=this.cb_insert
this.Control[iCurrent+34]=this.st_pm
this.Control[iCurrent+35]=this.st_am
this.Control[iCurrent+36]=this.st_title
this.Control[iCurrent+37]=this.cb_close
this.Control[iCurrent+38]=this.dw_templpm
this.Control[iCurrent+39]=this.dw_templam
this.Control[iCurrent+40]=this.dw_templliste
this.Control[iCurrent+41]=this.dw_traitements
end on

on w_horairetemplateprog.destroy
call super::destroy
destroy(this.cbx_c15)
destroy(this.cbx_c14)
destroy(this.cbx_c13)
destroy(this.cbx_c12)
destroy(this.cbx_c11)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_tplcolor)
destroy(this.cbx_c10)
destroy(this.cbx_c9)
destroy(this.cbx_c8)
destroy(this.cbx_c7)
destroy(this.cbx_c6)
destroy(this.cb_apply)
destroy(this.cbx_c5)
destroy(this.cbx_c4)
destroy(this.cbx_c3)
destroy(this.cbx_c2)
destroy(this.cbx_c1)
destroy(this.st_chaises)
destroy(this.em_end)
destroy(this.st_a)
destroy(this.st_de)
destroy(this.st_plage)
destroy(this.em_start)
destroy(this.sle_color)
destroy(this.st_1)
destroy(this.cb_delete)
destroy(this.st_num)
destroy(this.cb_choice)
destroy(this.cb_update)
destroy(this.cb_insert)
destroy(this.st_pm)
destroy(this.st_am)
destroy(this.st_title)
destroy(this.cb_close)
destroy(this.dw_templpm)
destroy(this.dw_templam)
destroy(this.dw_templliste)
destroy(this.dw_traitements)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

this.postevent('ue_post_open')

end event

type cbx_c15 from checkbox within w_horairetemplateprog
integer x = 1522
integer y = 892
integer width = 361
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 15"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 15"
end if
end event

type cbx_c14 from checkbox within w_horairetemplateprog
integer x = 1522
integer y = 816
integer width = 361
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 14"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 14"
end if
end event

type cbx_c13 from checkbox within w_horairetemplateprog
integer x = 1522
integer y = 740
integer width = 361
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 13"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 13"
end if
end event

type cbx_c12 from checkbox within w_horairetemplateprog
integer x = 1522
integer y = 664
integer width = 361
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 12"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 12"
end if
end event

type cbx_c11 from checkbox within w_horairetemplateprog
integer x = 1522
integer y = 584
integer width = 361
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 11"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 11"
end if
end event

type cb_3 from commandbutton within w_horairetemplateprog
integer x = 1170
integer y = 1788
integer width = 695
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;datastore ds_tplimp

ds_tplimp = create datastore
ds_tplimp.dataobject = 'd_imptpl'
ds_tplimp.setTransObject(SQLCA)
ds_tplimp.retrieve(dw_templliste.getItemNumber(dw_templliste.getRow(),'id_template'))
gb_datawindow = false
openwithparm(w_print_options,ds_tplimp)

destroy ds_tplimp
end event

type cb_2 from commandbutton within w_horairetemplateprog
integer x = 1701
integer y = 1924
integer width = 553
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Copie template"
end type

event clicked;long ll_tplcolor, ll_idtplnew, ll_c1, ll_c2, ll_c3, ll_c4, ll_c5, ll_c6, ll_c7, ll_c8, ll_c9, ll_c10, ll_c11, ll_c12, ll_c13, ll_c14, ll_c15
long ll_idtplold
string ls_nomtpl
time lt_heure

if error_type(258) = 1 then
	ll_idtplold = dw_templliste.getItemNumber(dw_templliste.getRow(),'id_template')
	ll_tplcolor = dw_templliste.getItemNumber(dw_templliste.getRow(),'tplcolor')
	ls_nomtpl = dw_templliste.getItemString(dw_templliste.getRow(),'nomtpl')
	
	ls_nomtpl += "_1"
	
	// Insérer le template
	
	insert into t_templates(nomtempl,ortho_id,tplcolor)
	values(:ls_nomtpl,:v_no_ortho,:ll_tplcolor);
	error_type(-1)
	
	// Insérer les templates
	
	select max(id_template) into :ll_idtplnew from t_templates;
	
	DECLARE listtpl CURSOR FOR
		select heures, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15
		from t_templateprog 
		where id_template = :ll_idtplold;
	
	OPEN listtpl;
	
	FETCH listtpl into :lt_heure, :ll_c1, :ll_c2, :ll_c3, :ll_c4, :ll_c5, :ll_c6, :ll_c7, :ll_c8, :ll_c9, :ll_c10, :ll_c11, :ll_c12, :ll_c13, :ll_c14, :ll_c15;

	DO WHILE SQLCA.SQLCode = 0
	
		insert into t_templateprog(id_template,heures,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15)
		values(:ll_idtplnew,:lt_heure, :ll_c1, :ll_c2, :ll_c3, :ll_c4, :ll_c5, :ll_c6, :ll_c7, :ll_c8, :ll_c9, :ll_c10, :ll_c11, :ll_c12, :ll_c13, :ll_c14, :ll_c15);
		error_type(-1)
		
		FETCH listtpl into :lt_heure, :ll_c1, :ll_c2, :ll_c3, :ll_c4, :ll_c5, :ll_c6, :ll_c7, :ll_c8, :ll_c9, :ll_c10, :ll_c11, :ll_c12, :ll_c13, :ll_c14, :ll_c15;

	LOOP
	
	CLOSE listtpl;

end if

dw_templliste.Retrieve(v_no_ortho)


end event

type cb_1 from commandbutton within w_horairetemplateprog
integer x = 1170
integer y = 1672
integer width = 695
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Éliminer couleur TPL"
end type

event clicked;long ll_nul

SetNull(ll_nul)
update t_templates set tplcolor = :ll_nul where id_template = :il_idtemplate;
if error_type(-1) = 1 then
	commit using sqlca;
	dw_templliste.setitem(dw_templliste.getrow(),'tplcolor',ll_nul)
else
	rollback using sqlca;
	error_type(50)
end if
end event

type cb_tplcolor from commandbutton within w_horairetemplateprog
integer x = 1170
integer y = 1556
integer width = 695
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Couleur TPL"
end type

event clicked;openwithparm(w_choixcouleur,3)
update t_templates set tplcolor = :il_tplcolor where id_template = :il_idtemplate;
if error_type(-1) = 1 then
	commit using sqlca;
	dw_templliste.setitem(dw_templliste.getrow(),'tplcolor',il_tplcolor)
else
	rollback using sqlca;
	error_type(50)
end if
end event

type cbx_c10 from checkbox within w_horairetemplateprog
integer x = 1161
integer y = 1272
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 10"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 10"
end if
end event

type cbx_c9 from checkbox within w_horairetemplateprog
integer x = 1161
integer y = 1196
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 9"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 9"
end if
end event

type cbx_c8 from checkbox within w_horairetemplateprog
integer x = 1161
integer y = 1120
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 8"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 8"
end if
end event

type cbx_c7 from checkbox within w_horairetemplateprog
integer x = 1161
integer y = 1044
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 7"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 7"
end if
end event

type cbx_c6 from checkbox within w_horairetemplateprog
integer x = 1161
integer y = 968
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 6"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 6"
end if
end event

type cb_apply from commandbutton within w_horairetemplateprog
integer x = 1170
integer y = 1408
integer width = 695
integer height = 144
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
boolean enabled = false
string text = "Appliquer"
end type

event clicked;time lt_start, lt_end, lt_row
integer i
lt_start = time(em_start.text)
lt_end = time(em_end.text)
for i = 1 to dw_templam.rowcount()
	lt_row = dw_templam.getitemtime(i,'heures')
	if lt_row >= lt_start and lt_row <= lt_end then
		if cbx_c1.checked then
			dw_templam.setitem(i,'c1',il_color)
			ii_changeprog = 1
		end if
		if cbx_c2.checked then
			dw_templam.setitem(i,'c2',il_color)
			ii_changeprog = 1
		end if
		if cbx_c3.checked then
			dw_templam.setitem(i,'c3',il_color)
			ii_changeprog = 1
		end if
		if cbx_c4.checked then
			dw_templam.setitem(i,'c4',il_color)
			ii_changeprog = 1
		end if
		if cbx_c5.checked then
			dw_templam.setitem(i,'c5',il_color)
			ii_changeprog = 1
		end if
		if cbx_c6.checked then
			dw_templam.setitem(i,'c6',il_color)
			ii_changeprog = 1
		end if
		if cbx_c7.checked then
			dw_templam.setitem(i,'c7',il_color)
			ii_changeprog = 1
		end if
		if cbx_c8.checked then
			dw_templam.setitem(i,'c8',il_color)
			ii_changeprog = 1
		end if
		if cbx_c9.checked then
			dw_templam.setitem(i,'c9',il_color)
			ii_changeprog = 1
		end if
		if cbx_c10.checked then
			dw_templam.setitem(i,'c10',il_color)
			ii_changeprog = 1
		end if
		if cbx_c11.checked then
			dw_templam.setitem(i,'c11',il_color)
			ii_changeprog = 1
		end if
		if cbx_c12.checked then
			dw_templam.setitem(i,'c12',il_color)
			ii_changeprog = 1
		end if
		if cbx_c13.checked then
			dw_templam.setitem(i,'c13',il_color)
			ii_changeprog = 1
		end if
		if cbx_c14.checked then
			dw_templam.setitem(i,'c14',il_color)
			ii_changeprog = 1
		end if
		if cbx_c15.checked then
			dw_templam.setitem(i,'c15',il_color)
			ii_changeprog = 1
		end if
	end if
next
for i = 1 to dw_templpm.rowcount()
	lt_row = dw_templpm.getitemtime(i,'heures')
	if lt_row >= lt_start and lt_row <= lt_end then
		if cbx_c1.checked then
			dw_templpm.setitem(i,'c1',il_color)
			ii_changeprog = 1
		end if
		if cbx_c2.checked then
			dw_templpm.setitem(i,'c2',il_color)
			ii_changeprog = 1
		end if
		if cbx_c3.checked then
			dw_templpm.setitem(i,'c3',il_color)
			ii_changeprog = 1
		end if
		if cbx_c4.checked then
			dw_templpm.setitem(i,'c4',il_color)
			ii_changeprog = 1
		end if
		if cbx_c5.checked then
			dw_templpm.setitem(i,'c5',il_color)
			ii_changeprog = 1
		end if
		if cbx_c6.checked then
			dw_templpm.setitem(i,'c6',il_color)
			ii_changeprog = 1
		end if
		if cbx_c7.checked then
			dw_templpm.setitem(i,'c7',il_color)
			ii_changeprog = 1
		end if
		if cbx_c8.checked then
			dw_templpm.setitem(i,'c8',il_color)
			ii_changeprog = 1
		end if
		if cbx_c9.checked then
			dw_templpm.setitem(i,'c9',il_color)
			ii_changeprog = 1
		end if
		if cbx_c10.checked then
			dw_templpm.setitem(i,'c10',il_color)
			ii_changeprog = 1
		end if
		if cbx_c11.checked then
			dw_templpm.setitem(i,'c11',il_color)
			ii_changeprog = 1
		end if
		if cbx_c12.checked then
			dw_templpm.setitem(i,'c12',il_color)
			ii_changeprog = 1
		end if
		if cbx_c13.checked then
			dw_templpm.setitem(i,'c13',il_color)
			ii_changeprog = 1
		end if
		if cbx_c14.checked then
			dw_templpm.setitem(i,'c14',il_color)
			ii_changeprog = 1
		end if
		if cbx_c15.checked then
			dw_templpm.setitem(i,'c15',il_color)
			ii_changeprog = 1
		end if
	end if
next
end event

event constructor;if v_langue = 'an' then
	this.text = "Apply"
end if
end event

type cbx_c5 from checkbox within w_horairetemplateprog
integer x = 1161
integer y = 892
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 5"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 5"
end if
end event

type cbx_c4 from checkbox within w_horairetemplateprog
integer x = 1161
integer y = 816
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 4"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 4"
end if
end event

type cbx_c3 from checkbox within w_horairetemplateprog
integer x = 1161
integer y = 740
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 3"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 3"
end if
end event

type cbx_c2 from checkbox within w_horairetemplateprog
integer x = 1161
integer y = 664
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 2"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 2"
end if
end event

type cbx_c1 from checkbox within w_horairetemplateprog
integer x = 1161
integer y = 584
integer width = 357
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaise 1"
end type

event constructor;if v_langue = 'an' then
	this.text = "Chair 1"
end if
end event

type st_chaises from statictext within w_horairetemplateprog
integer x = 1161
integer y = 516
integer width = 704
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Chaises applicable"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Applicable chairs"
end if
end event

type em_end from editmask within w_horairetemplateprog
integer x = 1477
integer y = 408
integer width = 389
integer height = 88
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event constructor;integer li_end

select hor_fin_pm into :li_end from t_options;
em_end.text = string(li_end) + ':55'
end event

type st_a from statictext within w_horairetemplateprog
integer x = 1161
integer y = 428
integer width = 201
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
boolean enabled = false
string text = "A :"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "To :"
end if
end event

type st_de from statictext within w_horairetemplateprog
integer x = 1161
integer y = 336
integer width = 201
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
boolean enabled = false
string text = "De :"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "From :"
end if
end event

type st_plage from statictext within w_horairetemplateprog
integer x = 1161
integer y = 248
integer width = 704
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Plage applicable"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Applicable range"
end if
end event

type em_start from editmask within w_horairetemplateprog
integer x = 1477
integer y = 320
integer width = 389
integer height = 88
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
end type

event constructor;integer li_start

select hor_depart_am into :li_start from t_options;
em_start.text = string(li_start)
end event

type sle_color from singlelineedit within w_horairetemplateprog
integer x = 1161
integer y = 160
integer width = 699
integer height = 72
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
boolean enabled = false
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

type st_1 from statictext within w_horairetemplateprog
integer x = 1161
integer y = 88
integer width = 704
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Couleur applicable"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Applicable color"
end if
end event

type cb_delete from commandbutton within w_horairetemplateprog
integer x = 1097
integer y = 1924
integer width = 599
integer height = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supp. template"
end type

event clicked;if error_type(219) = 1 then
	delete from t_templateprog where id_template = :il_idtemplate;
	delete from t_templatedate where id_template = :il_idtemplate;
	delete from t_templates where id_template = :il_idtemplate;
	dw_templliste.deleterow(dw_templliste.getrow())
	il_idtemplate = dw_templliste.getitemnumber(dw_templliste.getrow(),'id_template')
	affichage()
end if
end event

event constructor;if v_langue = 'an' then
	this.text = "Delete template"
end if
end event

type st_num from statictext within w_horairetemplateprog
integer x = 978
integer width = 882
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_choice from commandbutton within w_horairetemplateprog
integer x = 549
integer y = 1924
integer width = 549
integer height = 112
integer taborder = 110
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Choisir template"
end type

event clicked;sauve()
cb_insert.enabled = true
cb_delete.enabled = true
dw_templliste.visible = true
dw_traitements.visible = false
dw_templam.enabled = false
dw_templpm.enabled = false
st_num.text = ''
sle_color.enabled = false
em_start.enabled = false
em_end.enabled = false
cbx_c1.enabled = false
cbx_c2.enabled = false
cbx_c3.enabled = false
cbx_c4.enabled = false
cbx_c5.enabled = false
cbx_c6.enabled = false
cbx_c7.enabled = false
cbx_c8.enabled = false
cbx_c9.enabled = false
cbx_c10.enabled = false
cbx_c11.enabled = false
cbx_c12.enabled = false
cbx_c13.enabled = false
cbx_c14.enabled = false
cbx_c15.enabled = false
cb_apply.enabled = false
dw_templam.VScrollBar = false
dw_templpm.VScrollBar = false
end event

event constructor;if v_langue = 'an' then
	this.text = "Choose template"
end if
end event

type cb_update from commandbutton within w_horairetemplateprog
integer x = 2254
integer y = 1924
integer width = 686
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Sauvegarde"
end type

event clicked;sauve()
end event

event constructor;if v_langue = 'an' then
	this.text = "Save"
end if
end event

type cb_insert from commandbutton within w_horairetemplateprog
integer x = 14
integer y = 1924
integer width = 535
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Ajout template"
end type

event clicked;long ll_newrow
string ls_nomtpl

ll_newrow = dw_templliste.insertrow(0)
select max(id_template) into :il_idtemplate from t_templates where ortho_id = :v_no_ortho;
il_idtemplate++
w_principal.SetMicroHelp("Programmation du template (" + string(il_idtemplate)+")")
ls_nomtpl = 'Template ' + string(il_idtemplate)
dw_templliste.setitem(ll_newrow,'nomtpl',ls_nomtpl)
dw_templliste.setitem(ll_newrow,'id_template',il_idtemplate)
dw_templliste.setitem(ll_newrow,'ortho_id',v_no_ortho)
dw_templliste.setitem(ll_newrow,'actif',1)
dw_templliste.scrolltorow(ll_newrow)
dw_templliste.SetFocus()
ii_changetpl = 1
ii_modeajout = 1
f_refresh()
end event

event constructor;if v_langue = 'an' then
	this.text = "Add a template"
end if
end event

type st_pm from statictext within w_horairetemplateprog
integer x = 2757
integer width = 869
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "PM"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_am from statictext within w_horairetemplateprog
integer x = 1883
integer width = 869
integer height = 56
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "AM"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_title from statictext within w_horairetemplateprog
integer width = 974
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
long textcolor = 8388608
long backcolor = 67108864
string text = "Programmation du template"
boolean focusrectangle = false
end type

event constructor;if v_langue = 'an' then
	this.text = "Programing of template"
end if
end event

type cb_close from commandbutton within w_horairetemplateprog
integer x = 2939
integer y = 1924
integer width = 695
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;if ii_changetpl = 1 or ii_changeprog = 1 then
	if error_type(200) = 1 then
		sauve()
	end if
end if
if isvalid(w_horaire_template) then
	w_horaire_template.dw_templliste.event constructor()
	w_horaire_template.uo_caltpl.uf_InitCal(w_horaire_template.uo_caltpl.id_datetpl_selected)
	w_horaire_template.f_initrefresh()
end if
close(parent)


end event

event constructor;if v_langue = 'an' then
	this.text = "Close"
end if
end event

type dw_templpm from u_dw within w_horairetemplateprog
integer x = 2766
integer y = 64
integer width = 869
integer height = 1856
integer taborder = 100
boolean enabled = false
string dataobject = "d_templprogpm"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;long nul
SetNull(nul)
choose case dwo.name
	case 'c1'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c1.checked = true
		if this.getitemnumber(row,'c1') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c1')) then
			this.setitem(row,'c1',il_color)
		else
			this.setitem(row,'c1',nul)
		end if
	case 'c2'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c2.checked = true
		if this.getitemnumber(row,'c2') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c2')) then
			this.setitem(row,'c2',il_color)
		else
			this.setitem(row,'c2',nul)
		end if
	case 'c3'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c3.checked = true
		if this.getitemnumber(row,'c3') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c3')) then
			this.setitem(row,'c3',il_color)
		else
			this.setitem(row,'c3',nul)
		end if
	case 'c4'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c4.checked = true
		if this.getitemnumber(row,'c4') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c4')) then
			this.setitem(row,'c4',il_color)
		else
			this.setitem(row,'c4',nul)
		end if
	case 'c5'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c5.checked = true
		if this.getitemnumber(row,'c5') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c5')) then
			this.setitem(row,'c5',il_color)
		else
			this.setitem(row,'c5',nul)
		end if
	case 'c6'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c6.checked = true
		if this.getitemnumber(row,'c6') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c6')) then
			this.setitem(row,'c6',il_color)
		else
			this.setitem(row,'c6',nul)
		end if
	case 'c7'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c7.checked = true
		if this.getitemnumber(row,'c7') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c7')) then
			this.setitem(row,'c7',il_color)
		else
			this.setitem(row,'c7',nul)
		end if
	case 'c8'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c8.checked = true
		if this.getitemnumber(row,'c8') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c8')) then
			this.setitem(row,'c8',il_color)
		else
			this.setitem(row,'c8',nul)
		end if
	case 'c9'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c9.checked = true
		if this.getitemnumber(row,'c9') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c9')) then
			this.setitem(row,'c9',il_color)
		else
			this.setitem(row,'c9',nul)
		end if
	case 'c10'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c10.checked = true
		if this.getitemnumber(row,'c10') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c10')) then
			this.setitem(row,'c10',il_color)
		else
			this.setitem(row,'c10',nul)
		end if
	case 'c11'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c11.checked = true
		if this.getitemnumber(row,'c11') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c11')) then
			this.setitem(row,'c11',il_color)
		else
			this.setitem(row,'c11',nul)
		end if
	case 'c12'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c12.checked = true
		if this.getitemnumber(row,'c12') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c12')) then
			this.setitem(row,'c12',il_color)
		else
			this.setitem(row,'c12',nul)
		end if
	case 'c13'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c13.checked = true
		if this.getitemnumber(row,'c13') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c13')) then
			this.setitem(row,'c13',il_color)
		else
			this.setitem(row,'c13',nul)
		end if
	case 'c14'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c14.checked = true
		if this.getitemnumber(row,'c14') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c14')) then
			this.setitem(row,'c14',il_color)
		else
			this.setitem(row,'c14',nul)
		end if
	case 'c15'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c15.checked = true
		if this.getitemnumber(row,'c15') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c15')) then
			this.setitem(row,'c15',il_color)
		else
			this.setitem(row,'c15',nul)
		end if
end choose
ii_changeprog = 1
end event

event doubleclicked;long nul
SetNull(nul)
choose case dwo.name
	case 'c1'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c1.checked = true
		if this.getitemnumber(row,'c1') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c1')) then
			this.setitem(row,'c1',il_color)
		else
			this.setitem(row,'c1',nul)
		end if
	case 'c2'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c2.checked = true
		if this.getitemnumber(row,'c2') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c2')) then
			this.setitem(row,'c2',il_color)
		else
			this.setitem(row,'c2',nul)
		end if
	case 'c3'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c3.checked = true
		if this.getitemnumber(row,'c3') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c3')) then
			this.setitem(row,'c3',il_color)
		else
			this.setitem(row,'c3',nul)
		end if
	case 'c4'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c4.checked = true
		if this.getitemnumber(row,'c4') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c4')) then
			this.setitem(row,'c4',il_color)
		else
			this.setitem(row,'c4',nul)
		end if
	case 'c5'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c5.checked = true
		if this.getitemnumber(row,'c5') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c5')) then
			this.setitem(row,'c5',il_color)
		else
			this.setitem(row,'c5',nul)
		end if
	case 'c6'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c6.checked = true
		if this.getitemnumber(row,'c6') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c6')) then
			this.setitem(row,'c6',il_color)
		else
			this.setitem(row,'c6',nul)
		end if
	case 'c7'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c7.checked = true
		if this.getitemnumber(row,'c7') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c7')) then
			this.setitem(row,'c7',il_color)
		else
			this.setitem(row,'c7',nul)
		end if
	case 'c8'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c8.checked = true
		if this.getitemnumber(row,'c5') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c8')) then
			this.setitem(row,'c8',il_color)
		else
			this.setitem(row,'c8',nul)
		end if
	case 'c9'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c9.checked = true
		if this.getitemnumber(row,'c9') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c9')) then
			this.setitem(row,'c9',il_color)
		else
			this.setitem(row,'c9',nul)
		end if
	case 'c10'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c10.checked = true
		if this.getitemnumber(row,'c10') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c10')) then
			this.setitem(row,'c10',il_color)
		else
			this.setitem(row,'c10',nul)
		end if
	case 'c11'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c11.checked = true
		if this.getitemnumber(row,'c11') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c11')) then
			this.setitem(row,'c11',il_color)
		else
			this.setitem(row,'c11',nul)
		end if
	case 'c12'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c12.checked = true
		if this.getitemnumber(row,'c12') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c12')) then
			this.setitem(row,'c12',il_color)
		else
			this.setitem(row,'c12',nul)
		end if
	case 'c13'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c13.checked = true
		if this.getitemnumber(row,'c13') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c13')) then
			this.setitem(row,'c13',il_color)
		else
			this.setitem(row,'c13',nul)
		end if
	case 'c14'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c14.checked = true
		if this.getitemnumber(row,'c14') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c14')) then
			this.setitem(row,'c14',il_color)
		else
			this.setitem(row,'c14',nul)
		end if
	case 'c15'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c15.checked = true
		if this.getitemnumber(row,'c15') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c15')) then
			this.setitem(row,'c15',il_color)
		else
			this.setitem(row,'c15',nul)
		end if
end choose
ii_changeprog = 1
end event

event itemchanged;ii_changeprog = 1
end event

event editchanged;ii_changeprog = 1
end event

event rbuttondown;long nul
SetNull(nul)
choose case dwo.name
	case 'c1'
		em_end.text = string(this.getitemtime(row,'heures'))
		if this.getitemnumber(row,'c1') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c1')) then
			this.setitem(row,'c1',il_color)
		else
			this.setitem(row,'c1',nul)
		end if
	case 'c2'
		em_end.text = string(this.getitemtime(row,'heures'))
		if this.getitemnumber(row,'c2') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c2')) then
			this.setitem(row,'c2',il_color)
		else
			this.setitem(row,'c2',nul)
		end if
	case 'c3'
		em_end.text = string(this.getitemtime(row,'heures'))
		if this.getitemnumber(row,'c3') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c3')) then
			this.setitem(row,'c3',il_color)
		else
			this.setitem(row,'c3',nul)
		end if
	case 'c4'
		em_end.text = string(this.getitemtime(row,'heures'))
		if this.getitemnumber(row,'c4') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c4')) then
			this.setitem(row,'c4',il_color)
		else
			this.setitem(row,'c4',nul)
		end if
	case 'c5'
		em_end.text = string(this.getitemtime(row,'heures'))
		if this.getitemnumber(row,'c5') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c5')) then
			this.setitem(row,'c5',il_color)
		else
			this.setitem(row,'c5',nul)
		end if
	case 'c6'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c6.checked = true
		if this.getitemnumber(row,'c6') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c6')) then
			this.setitem(row,'c6',il_color)
		else
			this.setitem(row,'c6',nul)
		end if
	case 'c7'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c7.checked = true
		if this.getitemnumber(row,'c7') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c7')) then
			this.setitem(row,'c7',il_color)
		else
			this.setitem(row,'c7',nul)
		end if
	case 'c8'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c8.checked = true
		if this.getitemnumber(row,'c8') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c8')) then
			this.setitem(row,'c8',il_color)
		else
			this.setitem(row,'c8',nul)
		end if
	case 'c9'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c9.checked = true
		if this.getitemnumber(row,'c9') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c9')) then
			this.setitem(row,'c9',il_color)
		else
			this.setitem(row,'c9',nul)
		end if
	case 'c10'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c10.checked = true
		if this.getitemnumber(row,'c10') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c10')) then
			this.setitem(row,'c10',il_color)
		else
			this.setitem(row,'c10',nul)
		end if
	case 'c11'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c11.checked = true
		if this.getitemnumber(row,'c11') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c11')) then
			this.setitem(row,'c11',il_color)
		else
			this.setitem(row,'c11',nul)
		end if
	case 'c12'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c12.checked = true
		if this.getitemnumber(row,'c12') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c12')) then
			this.setitem(row,'c12',il_color)
		else
			this.setitem(row,'c12',nul)
		end if
	case 'c13'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c13.checked = true
		if this.getitemnumber(row,'c13') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c13')) then
			this.setitem(row,'c13',il_color)
		else
			this.setitem(row,'c13',nul)
		end if
	case 'c14'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c14.checked = true
		if this.getitemnumber(row,'c14') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c14')) then
			this.setitem(row,'c14',il_color)
		else
			this.setitem(row,'c14',nul)
		end if
	case 'c15'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c15.checked = true
		if this.getitemnumber(row,'c15') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c15')) then
			this.setitem(row,'c15',il_color)
		else
			this.setitem(row,'c15',nul)
		end if
end choose
ii_changeprog = 1
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

type dw_templam from u_dw within w_horairetemplateprog
integer x = 1893
integer y = 64
integer width = 869
integer height = 1856
integer taborder = 90
boolean enabled = false
string dataobject = "d_templprogam"
boolean hscrollbar = true
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event doubleclicked;long nul
SetNull(nul)
choose case dwo.name
	case 'c1'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c1.checked = true
		if this.getitemnumber(row,'c1') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c1')) then
			this.setitem(row,'c1',il_color)
		else
			this.setitem(row,'c1',nul)
		end if
	case 'c2'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c2.checked = true
		if this.getitemnumber(row,'c2') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c2')) then
			this.setitem(row,'c2',il_color)
		else
			this.setitem(row,'c2',nul)
		end if
	case 'c3'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c3.checked = true
		if this.getitemnumber(row,'c3') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c3')) then
			this.setitem(row,'c3',il_color)
		else
			this.setitem(row,'c3',nul)
		end if
	case 'c4'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c4.checked = true
		if this.getitemnumber(row,'c4') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c4')) then
			this.setitem(row,'c4',il_color)
		else
			this.setitem(row,'c4',nul)
		end if
	case 'c5'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c5.checked = true
		if this.getitemnumber(row,'c5') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c5')) then
			this.setitem(row,'c5',il_color)
		else
			this.setitem(row,'c5',nul)
		end if
	case 'c6'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c6.checked = true
		if this.getitemnumber(row,'c6') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c6')) then
			this.setitem(row,'c6',il_color)
		else
			this.setitem(row,'c6',nul)
		end if
	case 'c7'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c7.checked = true
		if this.getitemnumber(row,'c7') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c7')) then
			this.setitem(row,'c7',il_color)
		else
			this.setitem(row,'c7',nul)
		end if
	case 'c8'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c8.checked = true
		if this.getitemnumber(row,'c8') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c8')) then
			this.setitem(row,'c8',il_color)
		else
			this.setitem(row,'c8',nul)
		end if
	case 'c9'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c9.checked = true
		if this.getitemnumber(row,'c9') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c9')) then
			this.setitem(row,'c9',il_color)
		else
			this.setitem(row,'c9',nul)
		end if
	case 'c10'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c10.checked = true
		if this.getitemnumber(row,'c10') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c10')) then
			this.setitem(row,'c10',il_color)
		else
			this.setitem(row,'c10',nul)
		end if
	case 'c11'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c11.checked = true
		if this.getitemnumber(row,'c11') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c11')) then
			this.setitem(row,'c11',il_color)
		else
			this.setitem(row,'c11',nul)
		end if
	case 'c12'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c12.checked = true
		if this.getitemnumber(row,'c12') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c12')) then
			this.setitem(row,'c12',il_color)
		else
			this.setitem(row,'c12',nul)
		end if
	case 'c13'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c13.checked = true
		if this.getitemnumber(row,'c13') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c13')) then
			this.setitem(row,'c13',il_color)
		else
			this.setitem(row,'c13',nul)
		end if
	case 'c14'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c14.checked = true
		if this.getitemnumber(row,'c14') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c14')) then
			this.setitem(row,'c14',il_color)
		else
			this.setitem(row,'c14',nul)
		end if
	case 'c15'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c15.checked = true
		if this.getitemnumber(row,'c15') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c15')) then
			this.setitem(row,'c15',il_color)
		else
			this.setitem(row,'c15',nul)
		end if
end choose
ii_changeprog = 1

end event

event clicked;long nul
SetNull(nul)
choose case dwo.name
	case 'c1'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c1.checked = true
		if this.getitemnumber(row,'c1') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c1')) then
			this.setitem(row,'c1',il_color)
		else
			this.setitem(row,'c1',nul)
		end if
	case 'c2'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c2.checked = true
		if this.getitemnumber(row,'c2') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c2')) then
			this.setitem(row,'c2',il_color)
		else
			this.setitem(row,'c2',nul)
		end if
	case 'c3'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c3.checked = true
		if this.getitemnumber(row,'c3') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c3')) then
			this.setitem(row,'c3',il_color)
		else
			this.setitem(row,'c3',nul)
		end if
	case 'c4'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c4.checked = true
		if this.getitemnumber(row,'c4') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c4')) then
			this.setitem(row,'c4',il_color)
		else
			this.setitem(row,'c4',nul)
		end if
	case 'c5'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c5.checked = true
		if this.getitemnumber(row,'c5') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c5')) then
			this.setitem(row,'c5',il_color)
		else
			this.setitem(row,'c5',nul)
		end if
	case 'c6'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c6.checked = true
		if this.getitemnumber(row,'c6') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c6')) then
			this.setitem(row,'c6',il_color)
		else
			this.setitem(row,'c6',nul)
		end if
	case 'c7'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c7.checked = true
		if this.getitemnumber(row,'c7') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c7')) then
			this.setitem(row,'c7',il_color)
		else
			this.setitem(row,'c7',nul)
		end if
	case 'c8'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c8.checked = true
		if this.getitemnumber(row,'c8') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c8')) then
			this.setitem(row,'c8',il_color)
		else
			this.setitem(row,'c8',nul)
		end if
	case 'c9'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c9.checked = true
		if this.getitemnumber(row,'c9') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c9')) then
			this.setitem(row,'c9',il_color)
		else
			this.setitem(row,'c9',nul)
		end if
	case 'c10'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c10.checked = true
		if this.getitemnumber(row,'c10') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c10')) then
			this.setitem(row,'c10',il_color)
		else
			this.setitem(row,'c10',nul)
		end if
	case 'c11'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c11.checked = true
		if this.getitemnumber(row,'c11') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c11')) then
			this.setitem(row,'c11',il_color)
		else
			this.setitem(row,'c11',nul)
		end if
	case 'c12'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c12.checked = true
		if this.getitemnumber(row,'c12') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c12')) then
			this.setitem(row,'c12',il_color)
		else
			this.setitem(row,'c12',nul)
		end if
	case 'c13'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c13.checked = true
		if this.getitemnumber(row,'c13') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c13')) then
			this.setitem(row,'c13',il_color)
		else
			this.setitem(row,'c13',nul)
		end if
	case 'c14'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c14.checked = true
		if this.getitemnumber(row,'c14') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c14')) then
			this.setitem(row,'c14',il_color)
		else
			this.setitem(row,'c14',nul)
		end if
	case 'c15'
		em_start.text = string(this.getitemtime(row,'heures'))
		cbx_c15.checked = true
		if this.getitemnumber(row,'c15') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c15')) then
			this.setitem(row,'c15',il_color)
		else
			this.setitem(row,'c15',nul)
		end if
end choose
ii_changeprog = 1

end event

event itemchanged;ii_changeprog = 1
end event

event editchanged;ii_changeprog = 1
end event

event rbuttondown;long nul
SetNull(nul)
choose case dwo.name
	case 'c1'
		em_end.text = string(this.getitemtime(row,'heures'))
		if this.getitemnumber(row,'c1') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c1')) then
			this.setitem(row,'c1',il_color)
		else
			this.setitem(row,'c1',nul)
		end if
	case 'c2'
		em_end.text = string(this.getitemtime(row,'heures'))
		if this.getitemnumber(row,'c2') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c2')) then
			this.setitem(row,'c2',il_color)
		else
			this.setitem(row,'c2',nul)
		end if
	case 'c3'
		em_end.text = string(this.getitemtime(row,'heures'))
		if this.getitemnumber(row,'c3') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c3')) then
			this.setitem(row,'c3',il_color)
		else
			this.setitem(row,'c3',nul)
		end if
	case 'c4'
		em_end.text = string(this.getitemtime(row,'heures'))
		if this.getitemnumber(row,'c4') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c4')) then
			this.setitem(row,'c4',il_color)
		else
			this.setitem(row,'c4',nul)
		end if
	case 'c5'
		em_end.text = string(this.getitemtime(row,'heures'))
		if this.getitemnumber(row,'c5') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c5')) then
			this.setitem(row,'c5',il_color)
		else
			this.setitem(row,'c5',nul)
		end if
	case 'c6'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c6.checked = true
		if this.getitemnumber(row,'c6') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c6')) then
			this.setitem(row,'c6',il_color)
		else
			this.setitem(row,'c6',nul)
		end if
	case 'c7'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c7.checked = true
		if this.getitemnumber(row,'c7') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c7')) then
			this.setitem(row,'c7',il_color)
		else
			this.setitem(row,'c7',nul)
		end if
	case 'c8'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c8.checked = true
		if this.getitemnumber(row,'c8') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c8')) then
			this.setitem(row,'c8',il_color)
		else
			this.setitem(row,'c8',nul)
		end if
	case 'c9'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c9.checked = true
		if this.getitemnumber(row,'c9') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c9')) then
			this.setitem(row,'c9',il_color)
		else
			this.setitem(row,'c9',nul)
		end if
	case 'c10'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c10.checked = true
		if this.getitemnumber(row,'c10') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c10')) then
			this.setitem(row,'c10',il_color)
		else
			this.setitem(row,'c10',nul)
		end if
	case 'c11'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c11.checked = true
		if this.getitemnumber(row,'c11') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c11')) then
			this.setitem(row,'c11',il_color)
		else
			this.setitem(row,'c11',nul)
		end if
	case 'c12'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c12.checked = true
		if this.getitemnumber(row,'c12') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c12')) then
			this.setitem(row,'c12',il_color)
		else
			this.setitem(row,'c12',nul)
		end if
	case 'c13'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c13.checked = true
		if this.getitemnumber(row,'c13') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c13')) then
			this.setitem(row,'c13',il_color)
		else
			this.setitem(row,'c13',nul)
		end if
	case 'c14'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c14.checked = true
		if this.getitemnumber(row,'c14') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c14')) then
			this.setitem(row,'c14',il_color)
		else
			this.setitem(row,'c14',nul)
		end if
	case 'c15'
		em_end.text = string(this.getitemtime(row,'heures'))
		cbx_c15.checked = true
		if this.getitemnumber(row,'c15') = rgb(255,255,255) or isnull(this.getitemnumber(row,'c15')) then
			this.setitem(row,'c15',il_color)
		else
			this.setitem(row,'c15',nul)
		end if
end choose
ii_changeprog = 1
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

type dw_templliste from u_dw within w_horairetemplateprog
integer y = 92
integer width = 1138
integer height = 1828
integer taborder = 10
string title = "templliste"
string dataobject = "d_templliste"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event constructor;long ll_newrow
string ls_nomtpl
this.SetTransObject(SQLCA)
dw_templam.settransobject(sqlca)
dw_templpm.settransobject(sqlca)
this.SetRowFocusIndicator(FocusRect!)
//premiere ouverture
if this.Retrieve(v_no_ortho) <= 0 then
	cb_insert.enabled = false
	dw_templliste.enabled = false
	dw_templliste.visible = true
	dw_traitements.visible = false
	ll_newrow = dw_templliste.insertrow(0)
	dw_templliste.setitem(ll_newrow,'ortho_id',v_no_ortho)
	il_idtemplate = 1
	w_principal.SetMicroHelp("Programmation du template (" + string(il_idtemplate)+")")
	ls_nomtpl = 'Template ' + string(il_idtemplate)
	dw_templliste.setitem(ll_newrow,'nomtpl',ls_nomtpl)
	dw_templliste.setitem(ll_newrow,'id_template',1)
	ii_changetpl = 1
end if
//fin premiere ouverture
il_idtemplate = this.getitemnumber(1,'id_template')
w_principal.SetMicroHelp("Programmation du template (" + string(il_idtemplate)+")")
affichage()

end event

event doubleclicked;if il_idtemplate > 0 then
	cb_delete.enabled = false
	cb_insert.enabled = false
	dw_templam.VScrollBar = TRUE
	dw_templpm.VScrollBar = TRUE
	dw_templliste.visible = false
	dw_traitements.visible = true
	dw_templam.enabled = true
	dw_templpm.enabled = true
	affichage()
	sle_color.enabled = true
	em_start.enabled = true
	em_end.enabled = true
	cbx_c1.enabled = true
	cbx_c2.enabled = true
	cbx_c3.enabled = true
	cbx_c4.enabled = true
	cbx_c5.enabled = true
	cbx_c6.enabled = true
	cbx_c7.enabled = true
	cbx_c8.enabled = true
	cbx_c9.enabled = true
	cbx_c10.enabled = true
	cbx_c11.enabled = true
	cbx_c12.enabled = true
	cbx_c13.enabled = true
	cbx_c14.enabled = true
	cbx_c15.enabled = true
	cb_apply.enabled = true
end if
end event

event clicked;il_idtemplate = this.getitemnumber(row,'id_template')
w_principal.SetMicroHelp("Programmation du template (" + string(il_idtemplate)+")")
affichage()

end event

event itemchanged;ii_changetpl = 1
end event

event editchanged;ii_changetpl = 1
end event

event updateend;long ll_row, ll_idtemplate
integer test
if rowsinserted <> 0 then
	ll_row = this.getrow()
	select max(id_template) into :ll_idtemplate from t_templateprog;
	if isnull(ll_idtemplate) then ll_idtemplate = 1
	this.setitem(ll_row,'id_template',ll_idtemplate)
	if ii_modeajout = 1 then
	  test = this.setitemstatus(ll_row,'nomtpl',primary!,notmodified!)
	  test = this.setitemstatus(ll_row,'ortho_id',primary!,notmodified!)
	end if
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

type dw_traitements from u_dw within w_horairetemplateprog
boolean visible = false
integer y = 92
integer width = 1138
integer height = 1828
integer taborder = 20
string title = "types_traitements_hor"
string dataobject = "d_types_traitements_hor_rech"
end type

event constructor;this.SetTransObject(sqlca)
this.SetRowFocusIndicator(Hand!)
this.retrieve(v_no_ortho)
SetNull(il_color)
sle_color.backcolor = rgb(255,255,255)
if v_langue = 'an' then
	sle_color.text = '********** EMPTY **********'
else
	sle_color.text = '********** VIDE **********'
end if
end event

event clicked;if row = 1 then
	SetNull(il_color)
	sle_color.backcolor = rgb(255,255,255)
	if v_langue = 'an' then
		sle_color.text = '********** EMPTY **********'
	else
		sle_color.text = '********** VIDE **********'
	end if
else
	il_color = this.getitemnumber(row,'t_color_color')
	sle_color.backcolor = il_color
	sle_color.text = ''
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

