$PBExportHeader$w_dosspatcartetrait.srw
forward
global type w_dosspatcartetrait from w_child
end type
type cb_close from commandbutton within w_dosspatcartetrait
end type
end forward

global type w_dosspatcartetrait from w_child
integer x = 214
integer y = 221
integer width = 3685
integer height = 2076
boolean border = false
windowstate windowstate = maximized!
boolean ib_isupdateable = false
event ue_post_open ( )
cb_close cb_close
end type
global w_dosspatcartetrait w_dosspatcartetrait

type variables
public boolean change = false
private boolean ib_minimize = false
public integer Maj_liste=0, chang_dossier = 0, chang_nom_prenom = 0, vi_mode_ajout = 0, is_naiss = 0
private string photoname
public DataWindowChild dddwin 
public DataWindowChild dddw_patstatus
public DataWindowChild dddw_sattelite
public DataWindowChild dddw_activite
public DataWindowChild dddw_dentist
public long il_patid
private integer ii_modeajout = 0
private boolean rchange = false
private integer ii_resp = 1
public string is_nom
end variables

on w_dosspatcartetrait.create
int iCurrent
call super::create
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_close
end on

on w_dosspatcartetrait.destroy
call super::destroy
destroy(this.cb_close)
end on

event open;pro_resize luo_size
luo_size.uf_resizew(this,1,1)

w_dossier_patients.postevent('ue_post_open')
end event

type cb_close from commandbutton within w_dosspatcartetrait
integer x = 2912
integer y = 1928
integer width = 709
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;Close (parent)


	
end event

event destructor;if Maj_liste = 1 then
	//w_patient.dw_patient_master.retrieve(v_no_ortho)
end if	
end event

event constructor;if v_langue = 'an' then
	cb_close.Text = "Close"
end if
end event

