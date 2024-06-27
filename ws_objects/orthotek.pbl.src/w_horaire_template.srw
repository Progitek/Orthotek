$PBExportHeader$w_horaire_template.srw
forward
global type w_horaire_template from w_child
end type
type cb_1 from commandbutton within w_horaire_template
end type
type cb_delete from commandbutton within w_horaire_template
end type
type cb_tplprog from commandbutton within w_horaire_template
end type
type st_title from statictext within w_horaire_template
end type
type dw_templliste from u_dw within w_horaire_template
end type
type cb_close from commandbutton within w_horaire_template
end type
type uo_caltpl from u_calendartpl within w_horaire_template
end type
end forward

global type w_horaire_template from w_child
integer height = 2076
boolean border = false
windowstate windowstate = maximized!
long backcolor = 67108864
string pointer = "Arrow!"
boolean ib_isupdateable = false
cb_1 cb_1
cb_delete cb_delete
cb_tplprog cb_tplprog
st_title st_title
dw_templliste dw_templliste
cb_close cb_close
uo_caltpl uo_caltpl
end type
global w_horaire_template w_horaire_template

type variables
public long il_idtemplate
public string is_cellname
private integer ii_openmonth, ii_addsupptpl, ii_horcalcolor
public date idt_go
end variables

forward prototypes
public subroutine f_applytpl ()
public subroutine f_initrefresh ()
public subroutine if_destroytpl (date adt_tpl)
end prototypes

public subroutine f_applytpl ();SetPointer(HourGlass!)

update horaire left outer join t_templatedate on t_templatedate.tpldate = horaire.datecal
															and t_templatedate.ortho_id = horaire.no_ortho
					left outer join t_templateprog on t_templateprog.id_template = t_templatedate.id_template
															and t_templateprog.heures = horaire.heure
	set horaire.colortemplate1 = isnull(t_templateprog.c1, horaire.colortemplate1),
		 horaire.colortemplate2 = isnull(t_templateprog.c2, horaire.colortemplate2),
		 horaire.colortemplate3 = isnull(t_templateprog.c3, horaire.colortemplate3),
		 horaire.colortemplate4 = isnull(t_templateprog.c4, horaire.colortemplate4),
		 horaire.colortemplate5 = isnull(t_templateprog.c5, horaire.colortemplate5),
		 horaire.colortemplate6 = isnull(t_templateprog.c6, horaire.colortemplate6),
		 horaire.colortemplate7 = isnull(t_templateprog.c7, horaire.colortemplate7),
		 horaire.colortemplate8 = isnull(t_templateprog.c8, horaire.colortemplate8),
		 horaire.colortemplate9 = isnull(t_templateprog.c9, horaire.colortemplate9),
		 horaire.colortemplate10 = isnull(t_templateprog.c10, horaire.colortemplate10),
		 horaire.colortemplate11 = isnull(t_templateprog.c11, horaire.colortemplate11),
		 horaire.colortemplate12 = isnull(t_templateprog.c12, horaire.colortemplate12),
		 horaire.colortemplate13 = isnull(t_templateprog.c13, horaire.colortemplate13),
		 horaire.colortemplate14 = isnull(t_templateprog.c14, horaire.colortemplate14),
		 horaire.colortemplate15 = isnull(t_templateprog.c15, horaire.colortemplate15)
 where year(horaire.datecal) = year(:istr_caltpl.caldate)
	and month(horaire.datecal) = month(:istr_caltpl.caldate)
	and horaire.no_ortho = :v_no_ortho
 order by t_templatedate.dateapply asc;

if gf_sqlerr() then
	commit;
else
	rollback;
end if

ii_addsupptpl = 0

end subroutine

public subroutine f_initrefresh ();long i,j,ll_idtemplate,ll_tplcolor
string ls_tpldays,ls_celldata,ls_tpl
is_cellname = 'cell'
datastore ds_horairetpldates
ds_horairetpldates = create datastore
ds_horairetpldates.dataobject = "d_horairetpldates"
ds_horairetpldates.SetTransObject(SQLCA)
if isnull(idt_go) = false and idt_go  >= date(string('01-01-1990')) then
	ds_horairetpldates.retrieve(month(idt_go),year(idt_go),v_no_ortho)
	setnull(idt_go)
else
	ds_horairetpldates.retrieve(month(uo_caltpl.id_datetpl_selected),year(uo_caltpl.id_datetpl_selected),v_no_ortho)
end if

for i = 1 to ds_horairetpldates.rowcount()
	j = 1
	ls_tpldays = string(day(ds_horairetpldates.getitemdate(i,'tpldate')))
	ll_idtemplate = ds_horairetpldates.getitemnumber(i,'id_template')
	do while j <= 42
		is_cellname = 'cell' + string(j)
		ls_celldata = uo_caltpl.dw_cal.getitemstring(uo_caltpl.dw_cal.getrow(),is_cellname)
		if left(ls_celldata,2) = ls_tpldays or left(ls_celldata,1) = ls_tpldays then
			select nomtempl,tplcolor into :ls_tpl,:ll_tplcolor 
			from t_templates 
			where id_template = :ll_idtemplate and ortho_id = :v_no_ortho;
			uo_caltpl.dw_cal.setitem(uo_caltpl.dw_cal.getrow(),is_cellname,ls_celldata + '~r~n' + ls_tpl)
			if ll_tplcolor > 0 then
				uo_caltpl.dw_cal.modify(is_cellname+".background.color = "+string(ll_tplcolor))
			
			end if
			exit
		else
			j++
		end if
	loop
next
destroy ds_horairetpldates
ii_openmonth = month(uo_caltpl.id_datetpl_selected)
//verifier si le tpl a ete appliquer
if ii_addsupptpl = 1 then
	f_applytpl()
end if
end subroutine

public subroutine if_destroytpl (date adt_tpl);long ll_nil
SetNull(ll_nil)

if adt_tpl > 1900-01-01 and not isnull(adt_tpl) then
	update horaire set 	colortemplate1 = :ll_nil, 
								colortemplate2 = :ll_nil, 
								colortemplate3 = :ll_nil, 
								colortemplate4 = :ll_nil, 
								colortemplate5 = :ll_nil, 
								colortemplate6 = :ll_nil, 
								colortemplate7 = :ll_nil, 
								colortemplate8 = :ll_nil, 
								colortemplate9 = :ll_nil, 
								colortemplate10 = :ll_nil,
								colortemplate11 = :ll_nil,
								colortemplate12 = :ll_nil,
								colortemplate13 = :ll_nil,
								colortemplate14 = :ll_nil,
								colortemplate15 = :ll_nil 
	where datecal = :adt_tpl and no_ortho = :v_no_ortho; 
	if error_type(-1) = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
		error_type(50)
	end if
	
	update t_templatedate set flagapply = 0
	where tpldate = :adt_tpl and ortho_id = :v_no_ortho; 
	if error_type(-1) = 1 then
		commit using sqlca;
	else
		rollback using sqlca;
		error_type(50)
	end if
	
end if
end subroutine

on w_horaire_template.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_delete=create cb_delete
this.cb_tplprog=create cb_tplprog
this.st_title=create st_title
this.dw_templliste=create dw_templliste
this.cb_close=create cb_close
this.uo_caltpl=create uo_caltpl
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_delete
this.Control[iCurrent+3]=this.cb_tplprog
this.Control[iCurrent+4]=this.st_title
this.Control[iCurrent+5]=this.dw_templliste
this.Control[iCurrent+6]=this.cb_close
this.Control[iCurrent+7]=this.uo_caltpl
end on

on w_horaire_template.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_delete)
destroy(this.cb_tplprog)
destroy(this.st_title)
destroy(this.dw_templliste)
destroy(this.cb_close)
destroy(this.uo_caltpl)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

this.inv_resize.of_Register(uo_caltpl.pb_yrnext,inv_resize.SCALE)
this.inv_resize.of_Register(uo_caltpl.pb_yrprev,inv_resize.SCALE)
this.inv_resize.of_Register(uo_caltpl.pb_monnext,inv_resize.SCALE)
this.inv_resize.of_Register(uo_caltpl.pb_monprev,inv_resize.SCALE)
this.inv_resize.of_Register(uo_caltpl.dw_cal,inv_resize.SCALE)

select horcalcolor into :ii_horcalcolor from t_options where ortho_id = :v_no_ortho;
uo_caltpl.id_datetpl_selected = date(message.stringparm)
uo_caltpl.uf_InitCal(uo_caltpl.id_datetpl_selected)
setnull(idt_go)
uo_caltpl.PostEvent("ue_aff_horaire")
end event

type cb_1 from commandbutton within w_horaire_template
integer x = 914
integer y = 1928
integer width = 914
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Périodicité"
end type

event constructor;if v_langue = 'an' then
	this.text = 'Period'
end if
end event

event clicked;opensheet(w_hortplperiod,w_principal,2,layered!)
w_hortplperiod.title = 'Périodicité des templates'
end event

type cb_delete from commandbutton within w_horaire_template
integer x = 1829
integer y = 1928
integer width = 914
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Supprimer"
end type

event clicked;uo_caltpl.setredraw(false)
delete from t_templatedate where tpldate = :istr_caltpl.caldate and ortho_id = :v_no_ortho;
uo_caltpl.uf_InitCal(istr_caltpl.caldate)

// Éliminer le tpl de l'horaire
if_destroytpl(istr_caltpl.caldate)

ii_addsupptpl = 1
//dw_horairetpldatetpl.retrieve(il_idtemplate)
setnull(idt_go)
ii_openmonth = 0
uo_caltpl.PostEvent("ue_aff_horaire")
uo_caltpl.setredraw(true)




end event

event constructor;if v_langue = 'an' then
	this.text = "Delete"
end if
end event

type cb_tplprog from commandbutton within w_horaire_template
integer y = 1928
integer width = 914
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Programmation templates"
end type

event clicked;opensheet(w_horairetemplateprog,w_principal,2,layered!)
w_horairetemplateprog.Title = 'Programmation des templates'
w_principal.SetMicroHelp('Programmation des templates')
end event

event constructor;if v_langue = 'an' then
	this.text = "Programing templates"
end if
end event

type st_title from statictext within w_horaire_template
integer width = 1179
integer height = 92
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Template"
boolean focusrectangle = false
end type

type dw_templliste from u_dw within w_horaire_template
integer y = 96
integer width = 1179
integer height = 1828
integer taborder = 40
string dragicon = "Project!"
string title = "templliste"
string dataobject = "d_templliste"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;il_idtemplate = this.getitemnumber(row,'id_template')
w_principal.SetMicroHelp("Template (" + string(il_idtemplate)+")")
Drag(Begin!)


end event

event constructor;SetTransObject(SQLCA)
//SetRowFocusIndicator(FocusRect!)
dw_templliste.Retrieve(v_no_ortho)
//if getrow() > 0 then
//	il_idtemplate = dw_templliste.getitemnumber(getrow(),'id_template')
//	dw_horairetpldatetpl.retrieve(il_idtemplate)
//end if
w_principal.SetMicroHelp("Programmation du template (" + string(il_idtemplate)+")")
dw_templliste.object.nomtpl.TabSequence = 0
end event

event doubleclicked;il_idtemplate = this.getitemnumber(row,'id_template')
opensheetwithparm(w_horairetemplateprog,il_idtemplate,w_principal,2,layered!)
w_principal.SetMicroHelp('Programmation du template (' + string(il_idtemplate) + ')')
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

type cb_close from commandbutton within w_horaire_template
integer x = 2743
integer y = 1928
integer width = 869
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Arrow!"
string text = "Fermer"
end type

event clicked;//verifier si le tpl a ete appliquer
//if ii_addsupptpl = 1 then
//	f_applytpl()
//end if
if isvalid(w_horaire) then
//	w_horaire.istr_cal.caldate = date(string(Today()))
	w_horaire.uo_1.uf_InitCal(istr_cal.caldate)
	w_horaire.affichage_creation()
end if
close(parent)

end event

event constructor;if v_langue = 'an' then
		this.Text = "Close"
end if
end event

type uo_caltpl from u_calendartpl within w_horaire_template
event destroy ( )
integer x = 1198
integer width = 2414
integer height = 1928
integer taborder = 40
boolean bringtotop = true
borderstyle borderstyle = styleraised!
end type

on uo_caltpl.destroy
call u_calendartpl::destroy
end on

event ue_aff_horaire;call super::ue_aff_horaire;integer i,j,li_cellinc,li_tplexist
string ls_tpldays,ls_celldata,ls_tpl
long ll_row, ll_idtemplate, ll_nbrow, ll_tplcolor

istr_caltpl.caldate = id_datetpl_selected
select count(*) into :li_tplexist from t_templatedate where tpldate = :istr_caltpl.caldate and ortho_id = :v_no_ortho;
ll_idtemplate = il_idtemplate
//premiere ouverture
if ii_openmonth <> month(id_datetpl_selected) then
	f_initrefresh()
//elseif li_tplexist > 2 then
//	if error_type(218) = 1 then
//		error_type(140)
//	end if
elseif il_idtemplate > 0 and isnull(is_cellname) = false then
//	if error_type(218) = 1 then
//		if ii_horcalcolor = 1 then
//			openwithparm(w_choixcouleur,3)
//		end if
		select count(*) into :ll_nbrow from t_templatedate where tpldate = :id_datetpl_selected and id_template = :il_idtemplate &
		and ortho_id = :v_no_ortho;
		if ll_nbrow = 0 then
			ls_celldata = uo_caltpl.dw_cal.getitemstring(uo_caltpl.dw_cal.getrow(),is_cellname)
			select isnull(nomtempl,''),isnull(tplcolor,0) into :ls_tpl, :ll_tplcolor 
			from t_templates 
			where id_template = :il_idtemplate and ortho_id = :v_no_ortho;
			uo_caltpl.dw_cal.setitem(uo_caltpl.dw_cal.getrow(),is_cellname,ls_celldata + '~r~n' + ls_tpl)
			if ll_tplcolor > 0 then
				uo_caltpl.dw_cal.modify(is_cellname+".background.color = "+string(ll_tplcolor))
			end if
			insert into t_templatedate(tpldate,id_template,ortho_id) values(:id_datetpl_selected,:il_idtemplate,:v_no_ortho);
			error_type(-1)
			update t_templatedate set flagapply = 0 where id_template = :il_idtemplate and tpldate = :id_datetpl_selected;
			commit using sqlca;
			ii_addsupptpl = 1
//			dw_horairetpldatetpl.retrieve(il_idtemplate)
		else
			error_type(141)
		end if
//	end if
end if
end event

