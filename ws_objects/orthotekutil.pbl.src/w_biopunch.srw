$PBExportHeader$w_biopunch.srw
forward
global type w_biopunch from w_main
end type
type st_heure from statictext within w_biopunch
end type
type uo_toolbar from u_cst_toolbarstrip within w_biopunch
end type
type dw_biopunch from u_dw within w_biopunch
end type
type rr_1 from roundrectangle within w_biopunch
end type
end forward

global type w_biopunch from w_main
integer width = 2555
integer height = 1668
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 15793151
st_heure st_heure
uo_toolbar uo_toolbar
dw_biopunch dw_biopunch
rr_1 rr_1
end type
global w_biopunch w_biopunch

forward prototypes
public subroutine of_punch ()
public subroutine uf_traduction ()
end prototypes

public subroutine of_punch ();//of_punch

long		ll_id_user, ll_row, ll_id_rangee
string	ls_check
datetime	ldt_entree, ldt_sortie, ldt_now
boolean	lb_entree = FALSE
long		ll_opt
ll_row = dw_biopunch.GetRow()

IF ll_row > 0 THEN
	ll_id_user = dw_biopunch.object.id_personnel[ll_row]
	
	//Vérifier si l'utilisateur utilise la biometrie
	SELECT 	FIRST t_optiongen.utiliser_biometrie
	INTO 		:ll_opt
	FROM 		t_optiongen  USING SQLCA;
	
	gnv_app.inv_entrepotglobal.of_ajoutedonnee("biopunch user clicked", string(ll_id_user))
	SetNull(ll_id_user)
	
	IF ll_opt = 1 THEN
		//Ouvrir la fenêtre de saisie du mot de passe ou du fingerprint
		w_biometrie_password lw_biometrie_password
		open(lw_biometrie_password)
	ELSE
		//Ouvrir la fenêtre qui demande seulement le mot de passe
		w_pswbiopunch lw_pswbiopunch
		open(lw_pswbiopunch)
	END IF
	ll_id_user = long(gnv_app.inv_entrepotglobal.of_retournedonnee("biopunch user"))

	IF Not IsNull(ll_id_user) AND ll_id_user <> 0 THEN
		
		//Mettre à jour l'entrée ou la sortie
		ldt_entree = dw_biopunch.object.max_heureentree[ll_row]
		ldt_sortie = dw_biopunch.object.max_heuresortie[ll_row]
		
		IF IsNull(ldt_entree) AND IsNull(ldt_sortie) THEN
			lb_entree = TRUE
		ELSEIF Not IsNull(ldt_entree) AND NOT IsNull(ldt_sortie) THEN
			lb_entree = TRUE
		ELSE
			lb_entree = FALSE
		END IF

		ldt_now = datetime(today(),now())
		IF lb_entree = TRUE THEN
			//Insertion d'une nouvelle entrée
			INSERT INTO t_biopunch (id_personnel, heureentree) VALUES (:ll_id_user, :ldt_now);
			COMMIT USING SQLCA;
		ELSE
			//Update de la dernière rangée
			SELECT 	FIRST id_biopunch
			INTO		:ll_id_rangee
			FROM 		t_biopunch
			WHERE		id_personnel = :ll_id_user 
			ORDER BY heureentree DESC;
			
			IF Not isnull(ll_id_rangee) AND ll_id_rangee <> 0 THEN
				UPDATE t_biopunch SET heuresortie = :ldt_now WHERE id_biopunch = :ll_id_rangee ;
				COMMIT USING SQLCA;
			END IF
		END IF
		
		//Rafraichir
		dw_biopunch.retrieve(v_no_ortho)
	END IF
END IF
end subroutine

public subroutine uf_traduction ();title = "Biopunch"
uo_toolbar.of_settheme("classic")
uo_toolbar.of_DisplayBorder(true)
if gs_langue = "an" THEN
	dw_biopunch.object.nom_t.text = "Name"
	dw_biopunch.object.t_in.text = "In"
	dw_biopunch.object.t_out.text = "Out"
	uo_toolbar.of_AddItem("Close", "Exit!")
	
ELSE
	uo_toolbar.of_AddItem("Fermer", "Exit!")
END IF
uo_toolbar.of_displaytext(true)
end subroutine

on w_biopunch.create
int iCurrent
call super::create
this.st_heure=create st_heure
this.uo_toolbar=create uo_toolbar
this.dw_biopunch=create dw_biopunch
this.rr_1=create rr_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_heure
this.Control[iCurrent+2]=this.uo_toolbar
this.Control[iCurrent+3]=this.dw_biopunch
this.Control[iCurrent+4]=this.rr_1
end on

on w_biopunch.destroy
call super::destroy
destroy(this.st_heure)
destroy(this.uo_toolbar)
destroy(this.dw_biopunch)
destroy(this.rr_1)
end on

event open;call super::open;Timer(1)
This.event Timer()
end event

event timer;call super::timer;st_heure.text = string(date(today()), "dd-mm-yyyy") + " " + string(time(now()))
end event

type st_heure from statictext within w_biopunch
integer x = 37
integer y = 1476
integer width = 1321
integer height = 140
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 15793151
string text = "00-00-0000 00:00"
boolean focusrectangle = false
end type

type uo_toolbar from u_cst_toolbarstrip within w_biopunch
event destroy ( )
string tag = "resize=mrb"
integer x = 2021
integer y = 1496
integer width = 507
integer taborder = 20
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;Close(parent)
end event

type dw_biopunch from u_dw within w_biopunch
integer x = 55
integer y = 32
integer width = 2459
integer height = 1372
integer taborder = 10
string dataobject = "d_biopunch"
boolean border = false
end type

event constructor;call super::constructor;of_SetRowSelect(TRUE)
THIS.Retrieve(v_no_ortho)
end event

event clicked;call super::clicked;
CHOOSE CASE dwo.name
	CASE "p_rouge", "p_vert"
		of_punch()
		
END CHOOSE
end event

event doubleclicked;call super::doubleclicked;
IF row > 0 THEN
	of_punch()
END IF
end event

type rr_1 from roundrectangle within w_biopunch
long linecolor = 8421504
integer linethickness = 4
long fillcolor = 15780518
integer x = 18
integer y = 12
integer width = 2519
integer height = 1416
integer cornerheight = 40
integer cornerwidth = 46
end type

