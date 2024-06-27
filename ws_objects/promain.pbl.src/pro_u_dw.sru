$PBExportHeader$pro_u_dw.sru
$PBExportComments$(PRO) Extension DataWindow class
forward
global type pro_u_dw from pfc_u_dw
end type
end forward

global type pro_u_dw from pfc_u_dw
end type
global pro_u_dw pro_u_dw

type variables
string	is_objet_rbutton
end variables

event rbuttondown;call super::rbuttondown;long 		ll_pos, ll_cpt, ll_cptobject, ll_posobjet
string	ls_library, ls_librarylist[], ls_objectslist[], &
			ls_dataobject, ls_objects, ls_vide[], ls_nom, ls_libarietrouvee
boolean 	lb_trouve = FALSE, lb_ctrl

n_cst_string	lnv_string

lb_ctrl = KeyDown(KeyControl!)

is_objet_rbutton = THIS.GetObjectAtPointer()
ll_pos = POS(is_objet_rbutton, "~t")
is_objet_rbutton = MID(is_objet_rbutton, 1, ll_pos - 1)

// Faire afficher un messagebox du nom de l'objet et du pbl
// sur Right-click et CTRL
IF lb_ctrl = TRUE THEN

	ls_dataobject = THIS.Dataobject
	ls_library = GetLibraryList()
	lnv_string.of_ParseToArray ( ls_library, ",", ls_librarylist)

	//Faire le tour de tous les PBL
	FOR ll_cpt = 1 TO UpperBound(ls_librarylist)

		//name ~t date/time modified ~t comments ~n
		ls_objects = LibraryDirectory (ls_librarylist[ll_cpt], DirDatawindow!)
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

on pro_u_dw.create
call super::create
end on

on pro_u_dw.destroy
call super::destroy
end on

event constructor;call super::constructor;try
	SetTransObject(SQLCA)
catch ( throwable error )
	
end try
end event

