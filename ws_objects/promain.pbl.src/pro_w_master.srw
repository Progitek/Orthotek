$PBExportHeader$pro_w_master.srw
$PBExportComments$(PRO) Extension Master Window class
forward
global type pro_w_master from pfc_w_master
end type
end forward

global type pro_w_master from pfc_w_master
end type
global pro_w_master pro_w_master

forward prototypes
public subroutine uf_traduction ()
end prototypes

public subroutine uf_traduction ();//Fonction pour la traduction des libellés
end subroutine

on pro_w_master.create
call super::create
end on

on pro_w_master.destroy
call super::destroy
end on

event open;call super::open;uf_traduction()
pro_resize luo_size
luo_size.uf_resizew(this,1,1)
end event

event rbuttondown;call super::rbuttondown;long 		ll_pos, ll_cpt, ll_cptobject, ll_posobjet
string	ls_library, ls_librarylist[], ls_objectslist[], &
			ls_dataobject, ls_objects, ls_vide[], ls_nom, ls_libarietrouvee, ls_objet_rbutton
boolean 	lb_trouve = FALSE, lb_ctrl

n_cst_string	lnv_string

lb_ctrl = KeyDown(KeyControl!)

// Faire afficher un messagebox du nom de l'objet et du pbl
// sur Right-click et CTRL
IF lb_ctrl = TRUE THEN

	ls_dataobject = THIS.classname()
	ls_library = GetLibraryList()
	lnv_string.of_ParseToArray ( ls_library, ",", ls_librarylist)

	//Faire le tour de tous les PBL
	FOR ll_cpt = 1 TO UpperBound(ls_librarylist)

		//name ~t date/time modified ~t comments ~n
		ls_objects = LibraryDirectory (ls_librarylist[ll_cpt], DirWindow!)
		lnv_string.of_ParseToArray ( ls_objects, "~n", ls_objectslist)

		//Faire le tour de tous les objets de la librarie
		FOR ll_cptobject = 1 TO UpperBound(ls_objectslist)
			ll_posobjet = POS(ls_objectslist[ll_cptobject], "~t")
			IF ll_posobjet > 0 THEN
				ls_nom = LEFT(ls_objectslist[ll_cptobject], ll_posobjet - 1)
				IF ls_nom = ls_dataobject THEN
					//Objet trouvé, sortir
					lb_trouve = TRUE
					ls_libarietrouvee = ls_librarylist[ll_cpt]
					EXIT
				END IF
			END IF
		END FOR
		ls_objectslist[] = ls_vide[]

		IF lb_trouve = TRUE THEN EXIT

	END FOR

	IF lb_trouve = TRUE THEN
		Messagebox(ls_libarietrouvee, ls_dataobject)
	END IF

END IF
end event

