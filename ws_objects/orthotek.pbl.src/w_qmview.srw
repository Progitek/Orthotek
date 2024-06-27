$PBExportHeader$w_qmview.srw
forward
global type w_qmview from w_child
end type
type cb_1 from commandbutton within w_qmview
end type
type ole_qm from olecustomcontrol within w_qmview
end type
type st_patnom from statictext within w_qmview
end type
type dw_qmlistview from datawindow within w_qmview
end type
type dw_qmview from datawindow within w_qmview
end type
type rr_1 from roundrectangle within w_qmview
end type
type rr_2 from roundrectangle within w_qmview
end type
type rr_3 from roundrectangle within w_qmview
end type
end forward

global type w_qmview from w_child
integer width = 3648
integer height = 2024
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
cb_1 cb_1
ole_qm ole_qm
st_patnom st_patnom
dw_qmlistview dw_qmlistview
dw_qmview dw_qmview
rr_1 rr_1
rr_2 rr_2
rr_3 rr_3
end type
global w_qmview w_qmview

type variables
public boolean change = false
public string is_link_ini 
public string is_apikey_ini
private long il_patid


end variables

forward prototypes
public subroutine sauve ()
public subroutine of_add ()
public subroutine of_delete ()
public subroutine of_question ()
public subroutine of_questlist (long al_idquestionnaire)
public subroutine of_save ()
end prototypes

public subroutine sauve ();
end subroutine

public subroutine of_add ();//dw_qm.insertrow(0)
end subroutine

public subroutine of_delete ();//dw_qm.deleterow(dw_qm.getrow())
end subroutine

public subroutine of_question ();/*long ll_idquestionnaire
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

dw_qm.retrieve(ll_idquestionnaire)*/


end subroutine

public subroutine of_questlist (long al_idquestionnaire);/*long ll_idquestion
long i

Delete From t_questlist Where id_questionnaire = :al_idquestionnaire;

For i =1 To dw_qm.rowcount()
	
	ll_idquestion = dw_qm.getItemNumber(i,'t_question_id_question')
	
	Insert Into t_questlist(id_question,id_questionnaire) Values (:ll_idquestion,:al_idquestionnaire);
	gf_sqlerr()
	
next
*/
end subroutine

public subroutine of_save ();/*long ll_idquestionnaire
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
*/

end subroutine

on w_qmview.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.ole_qm=create ole_qm
this.st_patnom=create st_patnom
this.dw_qmlistview=create dw_qmlistview
this.dw_qmview=create dw_qmview
this.rr_1=create rr_1
this.rr_2=create rr_2
this.rr_3=create rr_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.ole_qm
this.Control[iCurrent+3]=this.st_patnom
this.Control[iCurrent+4]=this.dw_qmlistview
this.Control[iCurrent+5]=this.dw_qmview
this.Control[iCurrent+6]=this.rr_1
this.Control[iCurrent+7]=this.rr_2
this.Control[iCurrent+8]=this.rr_3
end on

on w_qmview.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.ole_qm)
destroy(this.st_patnom)
destroy(this.dw_qmlistview)
destroy(this.dw_qmview)
destroy(this.rr_1)
destroy(this.rr_2)
destroy(this.rr_3)
end on

event open;call super::open;string ls_patnom 

il_patid = gnv_app.inv_entrepotglobal.of_retournedonnee('quest idpatient')
select patient_prenom + ' ' + patient_nom into :ls_patnom from patient where patient_id = :il_patid;

st_patnom.text = ls_patnom

dw_qmlistview.retrieve(il_patid)

is_link_ini = ProfileString("c:\ii4net\orthotek\ortho.ini", "Questionnaire", "LINK", "")
is_apikey_ini = ProfileString("c:\ii4net\orthotek\ortho.ini", "Questionnaire", "APIKEY", "")

dw_qmlistview.event rowfocuschanged(dw_qmlistview.getrow())
end event

type cb_1 from commandbutton within w_qmview
string tag = "resize=mrb"
integer x = 3223
integer y = 1896
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;close(parent)
end event

type ole_qm from olecustomcontrol within w_qmview
event statustextchange ( string text )
event progresschange ( long progress,  long progressmax )
event commandstatechange ( long command,  boolean enable )
event downloadbegin ( )
event downloadcomplete ( )
event titlechange ( string text )
event propertychange ( string szproperty )
event beforenavigate2 ( oleobject pdisp,  any url,  any flags,  any targetframename,  any postdata,  any headers,  ref boolean cancel )
event newwindow2 ( ref oleobject ppdisp,  ref boolean cancel )
event navigatecomplete2 ( oleobject pdisp,  any url )
event documentcomplete ( oleobject pdisp,  any url )
event onquit ( )
event onvisible ( boolean ocx_visible )
event ontoolbar ( boolean toolbar )
event onmenubar ( boolean menubar )
event onstatusbar ( boolean statusbar )
event onfullscreen ( boolean fullscreen )
event ontheatermode ( boolean theatermode )
event windowsetresizable ( boolean resizable )
event windowsetleft ( long left )
event windowsettop ( long top )
event windowsetwidth ( long ocx_width )
event windowsetheight ( long ocx_height )
event windowclosing ( boolean ischildwindow,  ref boolean cancel )
event clienttohostwindow ( ref long cx,  ref long cy )
event setsecurelockicon ( long securelockicon )
event filedownload ( boolean activedocument,  ref boolean cancel )
event navigateerror ( oleobject pdisp,  any url,  any frame,  any statuscode,  ref boolean cancel )
event printtemplateinstantiation ( oleobject pdisp )
event printtemplateteardown ( oleobject pdisp )
event updatepagestatus ( oleobject pdisp,  any npage,  any fdone )
event privacyimpactedstatechange ( boolean bimpacted )
event setphishingfilterstatus ( long phishingfilterstatus )
event newprocess ( long lcauseflag,  oleobject pwb2,  ref boolean cancel )
event redirectxdomainblocked ( oleobject pdisp,  any starturl,  any redirecturl,  any frame,  any statuscode )
event beforescriptexecute ( oleobject pdispwindow )
string tag = "resize=arb"
integer x = 855
integer y = 172
integer width = 2752
integer height = 1704
integer taborder = 20
boolean border = false
boolean focusrectangle = false
string binarykey = "w_qmview.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_patnom from statictext within w_qmview
string tag = "resize=ar"
integer x = 73
integer y = 48
integer width = 3502
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean focusrectangle = false
end type

type dw_qmlistview from datawindow within w_qmview
string tag = "resize=n"
integer x = 41
integer y = 172
integer width = 768
integer height = 1288
integer taborder = 20
string title = "none"
string dataobject = "d_qmlistview"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event rowfocuschanged;long ll_idquestpat
string ls_pathurl
string ls_apikey

ll_idquestpat = dw_qmlistview.getItemNumber(currentrow,'id_questpat')
ole_qm.object.navigate2(is_link_ini+"/pbqm/"+is_apikey_ini+"/"+string(ll_idquestpat))


end event

event clicked;long ll_idquestpat

if row > 0 then
	if dwo.name = "p_trash" then 
		ll_idquestpat = dw_qmlistview.getItemNumber(row,'id_questpat')
		if messagebox("Avertissement","Voulez-vous supprimer ce questionnaire ?",Question!,YesNo!,2) = 1 then
			Delete from t_reponse Where id_questpat = :ll_idquestpat;
			gf_sqlerr()
			Delete From t_questpat Where id_questpat = :ll_idquestpat;
			gf_sqlerr()
			dw_qmlistview.retrieve(il_patid)
		end if
	end if
end if

end event

event constructor;SetRowFocusIndicator(FocusRect!)
SetTransObject(SQLCA)
end event

type dw_qmview from datawindow within w_qmview
string tag = "resize=arb"
integer x = 1120
integer y = 184
integer width = 2491
integer height = 1676
integer taborder = 10
string title = "none"
string dataobject = "d_qmview"
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

type rr_1 from roundrectangle within w_qmview
string tag = "resize=ar"
integer linethickness = 4
long fillcolor = 16777215
integer x = 37
integer y = 28
integer width = 3589
integer height = 112
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_qmview
string tag = "resize=n"
integer linethickness = 4
long fillcolor = 16777215
integer x = 37
integer y = 160
integer width = 777
integer height = 1320
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_3 from roundrectangle within w_qmview
string tag = "resize=arb"
integer linethickness = 4
long fillcolor = 16777215
integer x = 832
integer y = 160
integer width = 2789
integer height = 1728
integer cornerheight = 40
integer cornerwidth = 46
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
06w_qmview.bin 
2500000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000975ee72001cf18ff00000003000001800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f00000000975ee72001cf18ff975ee72001cf18ff000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000030000009c000000000000000100000002fffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
26ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c00003e3800002c070000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004c00003e3800002c070000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
16w_qmview.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
