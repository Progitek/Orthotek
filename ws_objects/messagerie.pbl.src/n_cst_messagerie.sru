$PBExportHeader$n_cst_messagerie.sru
forward
global type n_cst_messagerie from n_base
end type
end forward

global type n_cst_messagerie from n_base autoinstantiate
end type

type variables
window iw_win
long il_nbnouveaumsg
long il_user
string is_nomuser
long il_temps
end variables

forward prototypes
public function integer of_setwindow (window lw_win)
public function window of_getwindow ()
public function long of_getnbnouveaumsg ()
public function integer of_setnbnouveaumsg (long al_nbnouveaumsg)
public function integer of_setuser (long al_iduser)
public function long of_getuser ()
public function integer of_setnomuser (string as_nomuser)
public function string of_getnomuser ()
public function integer of_settemps (long al_temps)
public function long of_gettemps ()
end prototypes

public function integer of_setwindow (window lw_win);if isnull(lw_win) = false then
	iw_win = lw_win
	return 0
else
	return -1
end if
end function

public function window of_getwindow ();return iw_win
end function

public function long of_getnbnouveaumsg ();return il_nbnouveaumsg
end function

public function integer of_setnbnouveaumsg (long al_nbnouveaumsg);if isnull(al_nbnouveaumsg) = false then
	il_nbnouveaumsg = al_nbnouveaumsg
	return 0
else
	return -1
end if
end function

public function integer of_setuser (long al_iduser);if isnull(al_iduser) = false then
	il_user = al_iduser
	return 0
else
	return -1
end if
end function

public function long of_getuser ();return il_user
end function

public function integer of_setnomuser (string as_nomuser);if isnull(as_nomuser) = false then
	is_nomuser = as_nomuser
	return 0
else
	return -1
end if
end function

public function string of_getnomuser ();return  trim(is_nomuser)
end function

public function integer of_settemps (long al_temps);if isnull(al_temps) = false then
	il_temps = al_temps
	return 0
else
	return -1
end if
end function

public function long of_gettemps ();return il_temps
end function

on n_cst_messagerie.create
call super::create
end on

on n_cst_messagerie.destroy
call super::destroy
end on

