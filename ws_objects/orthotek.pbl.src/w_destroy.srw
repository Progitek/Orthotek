$PBExportHeader$w_destroy.srw
forward
global type w_destroy from window
end type
type dw_tpd from u_dw within w_destroy
end type
end forward

global type w_destroy from window
boolean visible = false
integer x = 823
integer y = 360
integer width = 1646
integer height = 492
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
dw_tpd dw_tpd
end type
global w_destroy w_destroy

event open;long nb_row, i, t_id
dw_tpd.settransobject(SQLCA)
dw_tpd.retrieve(numero_patient)
nb_row = dw_tpd.rowcount()
if nb_row > 0 then
	if messagebox("Suppression","Des traitements sont liés à ce patient, voulez-vous supprimer ce patient?",Stopsign!,YesNo!) =1 then
		dw_tpd.scrolltorow(1)
		for i = 1 to nb_row
			t_id = dw_tpd.getitemnumber(dw_tpd.getrow(),"traitement_id")
			delete from paiement where traitement_patient_id = :t_id;
			delete from factures_traitements where traitement_patient_id = :t_id;
			delete from cheques_postdates where traitement_patient_id = :t_id;
			delete from paiement where traitement_patient_id = :t_id;
			dw_tpd.scrollnextrow()
		next
		delete from traitements where patient_id = :numero_patient;
		delete from rendez_vous where patient_id = :numero_patient;
		delete from description_patient where patient_id = :numero_patient;
		delete from assurance_formulaire where patient_id = :numero_patient;
		delete from patient where patient_id = :numero_patient;
		w_patient.dw_patient_master.deleterow(w_patient.dw_patient_master.getrow())
//		w_patient.dw_patient_master.retrieve(v_no_ortho)
	end if
else
	delete from traitements where patient_id = :numero_patient;
	delete from rendez_vous where patient_id = :numero_patient;
	delete from description_patient where patient_id = :numero_patient;
	delete from assurance_formulaire where patient_id = :numero_patient;
	delete from patient where patient_id = :numero_patient;
	w_patient.dw_patient_master.deleterow(w_patient.dw_patient_master.getrow())
//	w_patient.dw_patient_master.retrieve(v_no_ortho)
end if
commit;
close(W_destroy)

end event

on w_destroy.create
this.dw_tpd=create dw_tpd
this.Control[]={this.dw_tpd}
end on

on w_destroy.destroy
destroy(this.dw_tpd)
end on

type dw_tpd from u_dw within w_destroy
integer x = 50
integer y = 40
integer width = 1486
integer height = 292
integer taborder = 10
string dataobject = "d_traitement_destruction"
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

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

