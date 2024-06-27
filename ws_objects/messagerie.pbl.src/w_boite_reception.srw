$PBExportHeader$w_boite_reception.srw
forward
global type w_boite_reception from w_sheet
end type
type uo_boite from u_cst_boite_reception within w_boite_reception
end type
end forward

global type w_boite_reception from w_sheet
integer width = 4585
integer height = 2608
string title = "Boîte de réception"
uo_boite uo_boite
end type
global w_boite_reception w_boite_reception

type variables

end variables

on w_boite_reception.create
int iCurrent
call super::create
this.uo_boite=create uo_boite
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_boite
end on

on w_boite_reception.destroy
call super::destroy
destroy(this.uo_boite)
end on

event open;call super::open;// Timer supprimé à la demande d'Éric Vézina
// le 2011-06-27 suite par Christian Rivard
// Trop de plaintes, c'est fatikant
Timer(5) 
end event

event timer;call super::timer;
//Vérifier si de nouveaux messages sont entrés
long	ll_nbligne, ll_row, ll_messageid, ll_nbnouveaumsg
n_ds	lds_tempo

IF uo_boite.dw_boite_reception.visible = TRUE THEN
	
	//Vérifier si le focus est sur une rangée nouvelle, si oui updater le flag lu
	ll_row = uo_boite.dw_boite_reception.GetRow()
	IF ll_row > 0 THEN
		IF uo_boite.dw_boite_reception.object.statut_lu[ll_row] = "n" THEN
			//Faire le update
			uo_boite.dw_boite_reception.object.statut_lu[ll_row] = "o"
			ll_messageid = uo_boite.dw_boite_reception.object.id_message[ll_row]
			
			UPDATE t_message
			set statut_lu = 'o'
			WHERE id_message = :ll_messageid
			USING SQLCA;
			
			Commit using SQLCA;
			
//			w_app.il_nbnouveaumsg --
			ll_nbnouveaumsg = gnv_app.inv_messagerie.of_getnbnouveaumsg() - 1
			gnv_app.inv_messagerie.of_setnbnouveaumsg(ll_nbnouveaumsg)
			
		END IF
	END IF
	
	//Rafraichir la boite de réception
	lds_tempo = create n_ds
	lds_tempo.dataobject = "d_boite_reception"
	lds_tempo.SetTransObject( SQLCA )
	
	ll_nbligne = lds_tempo.Retrieve(uo_boite.is_nom)
	
	IF ll_nbligne <> uo_boite.dw_boite_reception.RowCount() THEN
		//Le nombre de lignes a changé, il faut rafraichir
		uo_boite.of_afficherdw(1)
	END IF

	If IsValid(lds_tempo) THEN Destroy(lds_tempo)
	
ELSEIF uo_boite.dw_boite_reception_envoye.visible = TRUE THEN
	//Rafraichir les éléments envoyer
	lds_tempo = create n_ds
	lds_tempo.dataobject = "d_boite_reception_envoye"
	lds_tempo.SetTransObject( SQLCA )
	
	ll_nbligne = lds_tempo.Retrieve(uo_boite.is_nom)
	
	IF ll_nbligne <> uo_boite.dw_boite_reception_envoye.RowCount() THEN
		//Le nombre de lignes a changé, il faut rafraichir
		uo_boite.of_afficherdw(2)
	END IF

	If IsValid(lds_tempo) THEN Destroy(lds_tempo)
	
END IF
end event

event pfc_preopen;call super::pfc_preopen;THIS.WindowState = Maximized!
end event

event activate;call super::activate;THIS.WindowState = Maximized!
end event

type uo_boite from u_cst_boite_reception within w_boite_reception
string tag = "resize=arb"
integer width = 4526
integer taborder = 20
end type

on uo_boite.destroy
call u_cst_boite_reception::destroy
end on

