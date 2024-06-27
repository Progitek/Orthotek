$PBExportHeader$w_tempsdoc.srw
forward
global type w_tempsdoc from w_response
end type
type p_titre from u_p within w_tempsdoc
end type
type st_titre from u_st within w_tempsdoc
end type
type dw_tempsdoc from u_dw within w_tempsdoc
end type
type uo_tb_annuler from u_cst_toolbarstrip within w_tempsdoc
end type
type uo_tb_ok from u_cst_toolbarstrip within w_tempsdoc
end type
type rr_1 from roundrectangle within w_tempsdoc
end type
type rr_2 from roundrectangle within w_tempsdoc
end type
end forward

global type w_tempsdoc from w_response
integer x = 214
integer y = 221
integer width = 2048
integer height = 1292
boolean controlmenu = false
long backcolor = 15780518
boolean center = true
p_titre p_titre
st_titre st_titre
dw_tempsdoc dw_tempsdoc
uo_tb_annuler uo_tb_annuler
uo_tb_ok uo_tb_ok
rr_1 rr_1
rr_2 rr_2
end type
global w_tempsdoc w_tempsdoc

type variables
Protected:

long il_trait, il_orthoid, il_coulhyg, il_coulspec
boolean ib_change = false
end variables

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();string ls_nomtrait

uo_tb_ok.of_settheme("classic")
uo_tb_ok.of_DisplayBorder(true)
uo_tb_annuler.of_settheme("classic")
uo_tb_annuler.of_DisplayBorder(true)

ls_nomtrait = gnv_app.inv_entrepotglobal.of_retournedonnee("Temps doc nom trait")

if gnv_app.of_getlangue() = 'an' then
	st_titre.text = "Doctor time for " + ls_nomtrait
	this.title = "Doctor time for " + ls_nomtrait
	
	uo_tb_ok.of_AddItem("Ok", "C:\ii4net\dentitek\images\ok.gif")
	uo_tb_annuler.of_AddItem("Cancel", "C:\ii4net\dentitek\images\annuler.gif")
else
	st_titre.text = "Temps docteur pour " + ls_nomtrait
	this.title = "Temps docteur pour " + ls_nomtrait
	
	uo_tb_ok.of_AddItem("Ok", "C:\ii4net\dentitek\images\ok.gif")
	uo_tb_annuler.of_AddItem("Annuler", "C:\ii4net\dentitek\images\annuler.gif")
end if

uo_tb_ok.of_displaytext(true)
uo_tb_annuler.of_displaytext(true)
end subroutine

on w_tempsdoc.create
int iCurrent
call super::create
this.p_titre=create p_titre
this.st_titre=create st_titre
this.dw_tempsdoc=create dw_tempsdoc
this.uo_tb_annuler=create uo_tb_annuler
this.uo_tb_ok=create uo_tb_ok
this.rr_1=create rr_1
this.rr_2=create rr_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_titre
this.Control[iCurrent+2]=this.st_titre
this.Control[iCurrent+3]=this.dw_tempsdoc
this.Control[iCurrent+4]=this.uo_tb_annuler
this.Control[iCurrent+5]=this.uo_tb_ok
this.Control[iCurrent+6]=this.rr_1
this.Control[iCurrent+7]=this.rr_2
end on

on w_tempsdoc.destroy
call super::destroy
destroy(this.p_titre)
destroy(this.st_titre)
destroy(this.dw_tempsdoc)
destroy(this.uo_tb_annuler)
destroy(this.uo_tb_ok)
destroy(this.rr_1)
destroy(this.rr_2)
end on

event pfc_preopen;call super::pfc_preopen;long ll_row, ll_dureetot, ll_num, ll_doc
string ls_requete = "", ls_poste
n_cst_color lnv_coul

il_trait = gnv_app.inv_entrepotglobal.of_retournedonnee("Temps doc traitement")
il_orthoid = gnv_app.inv_entrepotglobal.of_retournedonnee("Temps doc spec")
ll_dureetot = gnv_app.inv_entrepotglobal.of_retournedonnee("Temps doc duree trait")

select isnull(color,65280) into :il_coulhyg from t_color where ortho_id =:v_no_ortho and hyg = 1;
select isnull(color,16737380) into :il_coulspec from t_color where ortho_id =:v_no_ortho and spec = 1;

ls_requete = "create table #tmp_listint(number integer not null)"
execute immediate :ls_requete;

delete from #tmp_listint;

for ll_row = 1 to ll_dureetot
	insert into #tmp_listint values(:ll_row);
next

declare curTD cursor for
  select isnull(t_tempsdoc.doc, 0)
	 from #tmp_listint as plage left outer join type_de_traitement on type_de_traitement.duree >= plage.number
	 																							and type_de_traitement.ortho_id = :il_orthoid
																								and type_de_traitement.type_traitement_id = :il_trait
								 left outer join t_tempsdoc on t_tempsdoc.type_traitement_id = type_de_traitement.type_traitement_id
																	and t_tempsdoc.ortho_id = type_de_traitement.ortho_id
																	and t_tempsdoc.debut <= plage.number
																	and t_tempsdoc.fin >= plage.number
order by plage.number asc;

open curTD;

fetch curTD into :ll_doc;

do while SQLCA.SQLCode = 0
	ll_row = dw_tempsdoc.insertRow(0)
	if ll_doc = 1 then
		dw_tempsdoc.object.ortho_id[ll_row] = 1
		dw_tempsdoc.object.dr[ll_row] = 'DR'
		dw_tempsdoc.object.couleur[ll_row] = il_coulspec
	else
		dw_tempsdoc.object.ortho_id[ll_row] = 0
		dw_tempsdoc.object.dr[ll_row] = 'HG'
		dw_tempsdoc.object.couleur[ll_row] = il_coulhyg
	end if
	
	fetch curTD into :ll_doc;
loop

close curTD;

end event

type p_titre from u_p within w_tempsdoc
integer x = 27
integer y = 24
integer width = 82
integer height = 72
string picturename = "C:\ii4net\Dentitek\images\note_act.gif"
end type

type st_titre from u_st within w_tempsdoc
integer x = 114
integer y = 16
integer width = 1893
integer height = 84
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 15793151
string text = "Temps docteur"
end type

type dw_tempsdoc from u_dw within w_tempsdoc
integer x = 18
integer y = 128
integer width = 1998
integer height = 952
integer taborder = 20
string dataobject = "d_tempsdocdef"
boolean border = false
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event clicked;call super::clicked;long ll_spec

if row <= 0 then return 0
if left(dwo.name, 2) <> 'dr' then return 0

ll_spec = this.object.ortho_id[row]

choose case ll_spec
	case 0
		this.object.ortho_id[row] = 1
		this.object.dr[row] = 'DR'
		this.object.couleur[row] = il_coulspec// rgb(100, 100, 255)
	case 1
		this.object.ortho_id[row] = 0
		this.object.dr[row] = 'HG'
		this.object.couleur[row] = il_coulhyg
end choose

ib_change = true

end event

type uo_tb_annuler from u_cst_toolbarstrip within w_tempsdoc
integer x = 1458
integer y = 1100
integer width = 567
integer taborder = 30
end type

on uo_tb_annuler.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;close(parent)
end event

type uo_tb_ok from u_cst_toolbarstrip within w_tempsdoc
integer x = 9
integer y = 1100
integer width = 567
integer taborder = 20
end type

on uo_tb_ok.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;long ll_row, ll_nbrows, ll_spec, ll_specprec = -1, ll_rowdebut = 0

if ib_change then
	
	// Enegistre dans la BD le temps docteur pour ce traitement
	
	delete from t_tempsdoc where type_traitement_id = :il_trait and ortho_id = :il_orthoid;
	gf_sqlerr()
	
	dw_tempsdoc.acceptText()
	ll_nbrows = dw_tempsdoc.rowCount()
	
	for ll_row = 1 to ll_nbrows
		
		ll_spec = dw_tempsdoc.object.ortho_id[ll_row]
		
		if ll_spec <> ll_specprec then
			if ll_rowdebut > 0 then
				insert into t_tempsdoc (type_traitement_id, ortho_id, debut, fin, doc)
					  values (:il_trait, :il_orthoid, :ll_rowdebut, :ll_row - 1, :ll_specprec);
				gf_sqlerr()
			end if
			
			ll_rowdebut = ll_row
			ll_specprec = ll_spec
		end if
	next
	
	insert into t_tempsdoc (type_traitement_id, ortho_id, debut, fin, doc)
		  values (:il_trait, :il_orthoid, :ll_rowdebut, :ll_nbrows, :ll_specprec);
	gf_sqlerr()
	
	commit;
	
end if

close(parent)
end event

type rr_1 from roundrectangle within w_tempsdoc
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 12639424
integer x = 9
integer y = 120
integer width = 2016
integer height = 968
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_tempsdoc
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15793151
integer x = 9
integer y = 8
integer width = 2016
integer height = 100
integer cornerheight = 40
integer cornerwidth = 46
end type

