$PBExportHeader$w_qm.srw
forward
global type w_qm from w_child
end type
type uo_toolbar2 from u_cst_toolbarstrip within w_qm
end type
type uo_toolbar from u_cst_toolbarstrip within w_qm
end type
type dw_qmlist from datawindow within w_qm
end type
type dw_qm from datawindow within w_qm
end type
end forward

global type w_qm from w_child
integer x = 214
integer y = 221
integer width = 3648
integer height = 2044
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowstate windowstate = maximized!
string icon = "C:\ii4net\orthotek\images\orthotek.ico"
boolean ib_isupdateable = false
event ue_post_open ( )
uo_toolbar2 uo_toolbar2
uo_toolbar uo_toolbar
dw_qmlist dw_qmlist
dw_qm dw_qm
end type
global w_qm w_qm

type variables
public boolean change = false
end variables

forward prototypes
public subroutine sauve ()
public subroutine of_add ()
public subroutine of_delete ()
public subroutine of_question ()
public subroutine of_questlist (long al_idquestionnaire)
public subroutine of_save ()
public subroutine uf_traduction ()
end prototypes

public subroutine sauve ();
end subroutine

public subroutine of_add ();long ll_idquestion
long ll_idquestionnaire

Insert into t_question(question)Values('');

if gf_sqlerr() then
	Select max(id_question) Into :ll_idquestion From t_question;
	ll_idquestionnaire = dw_qmlist.getItemNumber(dw_qmlist.getrow(),'t_questionnaire_id_questionnaire')
	Insert Into t_questlist(id_question,id_questionnaire) Values (:ll_idquestion,:ll_idquestionnaire);
	gf_sqlerr()
	dw_qm.retrieve(ll_idquestionnaire)
end if

/*
long ll_row 

ll_row = dw_qm.insertrow(0)
ll_idquestion = dw_qm.getItemNumber(i,'t_question_id_question')
ls_questlistetat = dw_qm.getItemString(i,'t_questlistetat')
Choose case ls_questlistetat
case 'A'		

Insert Into t_questlist(id_question,id_questionnaire) Values (:ll_idquestion,:al_idquestionnaire);
*/
end subroutine

public subroutine of_delete ();long ll_idquestion
long ll_idquestionnaire

if messagebox("Avertissement","Êtes-vous sûr de vouloir supprimer cette question ?",Information!,YesNo!) = 1 Then
	ll_idquestion = dw_qm.getItemNumber(dw_qm.getrow(),'t_question_id_question')
	ll_idquestionnaire = dw_qmlist.getItemNumber(dw_qmlist.getrow(),'t_questionnaire_id_questionnaire')
	Delete From t_question Where id_question = :ll_idquestion;
	if gf_sqlerr() then
		Delete From t_questlist Where id_question = :ll_idquestion;
		gf_sqlerr()
		dw_qm.retrieve(ll_idquestionnaire)
	end if
end if
end subroutine

public subroutine of_question ();long ll_idquestionnaire
long ll_idquestion
long ll_type
long ll_step
decimal ld_ordre
integer i
string ls_question
string ls_detail

dw_qm.accepttext( )

ll_idquestionnaire = dw_qmlist.getItemNumber(dw_qmlist.getrow(),'t_questionnaire_id_questionnaire')

delete from t_question  where id_questionnaire = :ll_idquestionnaire;
delete from t_questlist where id_questionnaire = :ll_idquestionnaire;

for i =1 to dw_qm.rowcount()
	ll_idquestion = dw_qm.getItemNumber(i,'')
	ls_question = dw_qm.getItemString(i,'t_question_question')
	ls_detail   = dw_qm.getItemString(i,'t_question_detail')
	ll_type     = dw_qm.getItemNumber(i,'t_question_type')
	ll_step     = dw_qm.getItemNumber(i,'t_question_step')
	ld_ordre    = dw_qm.getItemDecimal(i,'t_question_ordre')
	insert into t_question(question,detail,type,step,ordre) values (:ls_question,:ls_detail,:ll_type,:ll_step,:ld_ordre);		
	gf_sqlerr()

	select max(id_question) into :ll_idquestion from t_question;

	insert into t_questlist(id_question,id_questionnaire) values (:ll_idquestion,:ll_idquestionnaire);
	gf_sqlerr()
	
next

dw_qm.retrieve(ll_idquestionnaire)


end subroutine

public subroutine of_questlist (long al_idquestionnaire);/*
string ls_questlistetat
long ll_idquestion
long i

For i = 1 To dw_qm.rowcount()
	ll_idquestion = dw_qm.getItemNumber(i,'t_question_id_question')
	ls_questlistetat = dw_qm.getItemString(i,'t_questlistetat')
	Choose case ls_questlistetat
		case 'A'
			Insert Into t_questlist(id_question,id_questionnaire) Values (:ll_idquestion,:al_idquestionnaire);
	End choose
Next

Delete From t_questlist Where id_questionnaire = :al_idquestionnaire;

For i =1 To dw_qm.rowcount()
	
	ll_idquestion = dw_qm.getItemNumber(i,'t_question_id_question')
	
	Insert Into t_questlist(id_question,id_questionnaire) Values (:ll_idquestion,:al_idquestionnaire);
	gf_sqlerr()
	
next
*/
end subroutine

public subroutine of_save ();long ll_idquestionnaire
long ll_idquestion
long ll_type
long ll_step
decimal ld_ordre
integer i
string ls_question
string ls_detail

dw_qm.accepttext( )

ll_idquestionnaire = dw_qmlist.getItemNumber(dw_qmlist.getrow(),'t_questionnaire_id_questionnaire')

if dw_qm.update() = 1 then
	commit USING SQLCA;
else
	rollback USING SQLCA;
end if

of_questlist(ll_idquestionnaire)

dw_qm.retrieve(ll_idquestionnaire)


end subroutine

public subroutine uf_traduction ();uo_toolbar.of_settheme("classic")
uo_toolbar.of_DisplayBorder(true)

uo_toolbar2.of_settheme("classic")
uo_toolbar2.of_DisplayBorder(true)

if gnv_app.of_getlangue() = 'an' then
	uo_toolbar.of_AddItem("Add", "C:\ii4net\dentitek\images\Ajouter.ico")
	uo_toolbar.of_AddItem("Delete", "c:\ii4net\dentitek\images\supprimer.ico")
	uo_toolbar.of_AddItem("Save", "Save!")
	uo_toolbar.of_AddItem("Close", "Exit!")
	
	uo_toolbar2.of_AddItem("Add", "C:\ii4net\dentitek\images\Ajouter.ico")
	uo_toolbar2.of_AddItem("Delete", "c:\ii4net\dentitek\images\supprimer.ico")
	uo_toolbar2.of_AddItem("Save", "Save!")
else
	uo_toolbar.of_AddItem("Ajouter","C:\ii4net\dentitek\images\Ajouter.ico")
   uo_toolbar.of_AddItem("Supprimer", "c:\ii4net\dentitek\images\supprimer.ico")
	uo_toolbar.of_AddItem("Sauvegarder", "Save!")
	uo_toolbar.of_AddItem("Fermer", "Exit!")
	
	uo_toolbar2.of_AddItem("Ajouter","C:\ii4net\dentitek\images\Ajouter.ico")
   uo_toolbar2.of_AddItem("Supprimer", "c:\ii4net\dentitek\images\supprimer.ico")
	uo_toolbar2.of_AddItem("Sauvegarder", "Save!")
end if

uo_toolbar.of_displaytext(true)
uo_toolbar2.of_displaytext(true)
end subroutine

on w_qm.create
int iCurrent
call super::create
this.uo_toolbar2=create uo_toolbar2
this.uo_toolbar=create uo_toolbar
this.dw_qmlist=create dw_qmlist
this.dw_qm=create dw_qm
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_toolbar2
this.Control[iCurrent+2]=this.uo_toolbar
this.Control[iCurrent+3]=this.dw_qmlist
this.Control[iCurrent+4]=this.dw_qm
end on

on w_qm.destroy
call super::destroy
destroy(this.uo_toolbar2)
destroy(this.uo_toolbar)
destroy(this.dw_qmlist)
destroy(this.dw_qm)
end on

event open;call super::open;dw_qmlist.retrieve()

end event

type uo_toolbar2 from u_cst_toolbarstrip within w_qm
integer x = 5
integer y = 632
integer width = 882
integer taborder = 40
end type

on uo_toolbar2.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;choose case as_button
	case "Ajouter", "Add"
		long ll_row
		ll_row = dw_qmlist.insertrow(0)
	case "Supprimer","Delete"
		dw_qmlist.deleterow(dw_qmlist.getrow( ))
	case "Sauvegarder", "Save"
		if dw_qmlist.update() = 1 then
			commit using sqlca;
		else
			rollback using sqlca;
		end if
end choose



end event

type uo_toolbar from u_cst_toolbarstrip within w_qm
integer x = 18
integer y = 1916
integer width = 3607
integer taborder = 30
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;choose case as_button
	case "Ajouter", "Add"
		of_add()
	case "Sauvegarder", "Save"
		of_save()
	case "Supprimer", "Delete"
		of_delete()
	case "Fermer", "Close"
		close(parent)
end choose

end event

type dw_qmlist from datawindow within w_qm
integer x = 9
integer y = 24
integer width = 878
integer height = 608
integer taborder = 20
string title = "none"
string dataobject = "d_qmlist"
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;if currentrow > 0 then dw_qm.retrieve(dw_qmlist.getItemNumber(currentrow,'t_questionnaire_id_questionnaire'))


end event

event clicked;if row > 0 then
		dw_qmlist.selectrow(0,false)
		dw_qmlist.selectrow(row,true)
		dw_qmlist.scrollToRow(row)
end if
end event

event constructor;SetRowFocusIndicator(FocusRect!)
SetTransObject(SQLCA)
end event

type dw_qm from datawindow within w_qm
integer x = 919
integer y = 28
integer width = 2706
integer height = 1868
integer taborder = 10
string title = "none"
string dataobject = "d_qm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;change = true
end event

event constructor;SetTransObject(SQLCA)
end event

event editchanged;change = true
end event

