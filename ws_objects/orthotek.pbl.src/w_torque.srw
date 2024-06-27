$PBExportHeader$w_torque.srw
forward
global type w_torque from w_child
end type
type dw_torque from u_dw within w_torque
end type
type cb_5 from commandbutton within w_torque
end type
type cb_sauvegarder from commandbutton within w_torque
end type
type cb_supprimer from commandbutton within w_torque
end type
type cb_ajouter from commandbutton within w_torque
end type
type cb_fermer from commandbutton within w_torque
end type
end forward

global type w_torque from w_child
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
dw_torque dw_torque
cb_5 cb_5
cb_sauvegarder cb_sauvegarder
cb_supprimer cb_supprimer
cb_ajouter cb_ajouter
cb_fermer cb_fermer
end type
global w_torque w_torque

type variables
public long il_patid
public boolean change
end variables

forward prototypes
public subroutine of_ajouter ()
public subroutine of_save ()
public function string of_setbonding (integer al_row)
public function string of_settorque (integer al_row)
public function string of_setrotation (integer al_row)
public function string of_sethauteur (integer al_row)
public function string of_settip (integer al_row)
public subroutine of_gettorque (string as_torque[], long al_ligne)
public subroutine of_getbonding (string as_torque[], long al_ligne)
public subroutine of_getrotation (string as_torque[], long al_ligne)
public subroutine of_gethauteur (string as_torque[], integer al_ligne)
public subroutine of_gettip (string as_torque[], long al_ligne)
end prototypes

public subroutine of_ajouter ();long ll_row 

ll_row = dw_torque.insertRow(0)
dw_torque.setItem(ll_row,'datetorque',today())
dw_torque.setItem(ll_row,'id_patient',il_patid)
change = true
end subroutine

public subroutine of_save ();if change then
	if dw_torque.update() = 1 then
		commit using SQLCA;
		change = false
		
	else
		rollback using SQLCA;
	end if
end if
end subroutine

public function string of_setbonding (integer al_row);string ls_torque

if isnull(dw_torque.object.bonding11[al_row]) then
	ls_torque = "" + ";"
else
	ls_torque = string(dw_torque.object.bonding11[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding12[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding12[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding13[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding13[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding14[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding14[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding15[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding15[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding16[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding16[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding17[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding17[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding18[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding18[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding21[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding21[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding22[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding22[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding23[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding23[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding24[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding24[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding25[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding25[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding26[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding26[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding27[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding27[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding28[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding28[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding31[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding31[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding32[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding32[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding33[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding33[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding34[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding34[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding35[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding35[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding36[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding36[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding37[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding37[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding38[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding38[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding41[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding41[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding42[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding42[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding43[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding43[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding44[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding44[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding45[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding45[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding46[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding46[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding47[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding47[al_row]) + ";"
end if
if isnull(dw_torque.object.bonding48[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.bonding48[al_row]) + ";"
end if

return ls_torque

return ""
end function

public function string of_settorque (integer al_row);string ls_torque

if isnull(dw_torque.object.d11[al_row]) then
	ls_torque = "" + ";"
else
	ls_torque = string(dw_torque.object.d11[al_row]) + ";"
end if
if isnull(dw_torque.object.d12[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d12[al_row]) + ";"
end if
if isnull(dw_torque.object.d13[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d13[al_row]) + ";"
end if
if isnull(dw_torque.object.d14[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d14[al_row]) + ";"
end if
if isnull(dw_torque.object.d15[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d15[al_row]) + ";"
end if
if isnull(dw_torque.object.d16[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d16[al_row]) + ";"
end if
if isnull(dw_torque.object.d17[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d17[al_row]) + ";"
end if
if isnull(dw_torque.object.d18[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d18[al_row]) + ";"
end if
if isnull(dw_torque.object.d21[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d21[al_row]) + ";"
end if
if isnull(dw_torque.object.d22[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d22[al_row]) + ";"
end if
if isnull(dw_torque.object.d23[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d23[al_row]) + ";"
end if
if isnull(dw_torque.object.d24[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d24[al_row]) + ";"
end if
if isnull(dw_torque.object.d25[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d25[al_row]) + ";"
end if
if isnull(dw_torque.object.d26[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d26[al_row]) + ";"
end if
if isnull(dw_torque.object.d27[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d27[al_row]) + ";"
end if
if isnull(dw_torque.object.d28[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d28[al_row]) + ";"
end if
if isnull(dw_torque.object.d31[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d31[al_row]) + ";"
end if
if isnull(dw_torque.object.d32[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d32[al_row]) + ";"
end if
if isnull(dw_torque.object.d33[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d33[al_row]) + ";"
end if
if isnull(dw_torque.object.d34[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d34[al_row]) + ";"
end if
if isnull(dw_torque.object.d35[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d35[al_row]) + ";"
end if
if isnull(dw_torque.object.d36[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d36[al_row]) + ";"
end if
if isnull(dw_torque.object.d37[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d37[al_row]) + ";"
end if
if isnull(dw_torque.object.d38[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d38[al_row]) + ";"
end if
if isnull(dw_torque.object.d41[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d41[al_row]) + ";"
end if
if isnull(dw_torque.object.d42[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d42[al_row]) + ";"
end if
if isnull(dw_torque.object.d43[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d43[al_row]) + ";"
end if
if isnull(dw_torque.object.d44[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d44[al_row]) + ";"
end if
if isnull(dw_torque.object.d45[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d45[al_row]) + ";"
end if
if isnull(dw_torque.object.d46[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d46[al_row]) + ";"
end if
if isnull(dw_torque.object.d47[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d47[al_row]) + ";"
end if
if isnull(dw_torque.object.d48[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.d48[al_row]) + ";"
end if

return ls_torque
end function

public function string of_setrotation (integer al_row);string ls_torque

if isnull(dw_torque.object.rotation11[al_row]) then
	ls_torque = "" + ";"
else
	ls_torque = string(dw_torque.object.rotation11[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation12[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation12[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation13[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation13[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation14[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation14[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation15[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation15[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation16[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation16[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation17[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation17[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation18[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation18[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation21[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation21[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation22[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation22[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation23[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation23[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation24[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation24[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation25[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation25[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation26[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation26[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation27[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation27[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation28[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation28[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation31[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation31[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation32[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation32[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation33[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation33[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation34[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation34[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation35[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation35[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation36[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation36[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation37[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation37[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation38[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation38[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation41[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation41[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation42[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation42[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation43[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation43[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation44[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation44[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation45[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation45[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation46[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation46[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation47[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation47[al_row]) + ";"
end if
if isnull(dw_torque.object.rotation48[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.rotation48[al_row]) + ";"
end if

return ls_torque

return ""
end function

public function string of_sethauteur (integer al_row);string ls_torque

if isnull(dw_torque.object.hauteur11[al_row]) then
	ls_torque = "" + ";"
else
	ls_torque = string(dw_torque.object.hauteur11[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur12[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur12[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur13[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur13[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur14[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur14[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur15[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur15[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur16[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur16[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur17[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur17[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur18[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur18[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur21[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur21[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur22[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur22[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur23[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur23[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur24[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur24[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur25[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur25[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur26[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur26[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur27[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur27[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur28[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur28[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur31[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur31[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur32[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur32[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur33[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur33[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur34[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur34[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur35[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur35[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur36[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur36[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur37[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur37[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur38[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur38[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur41[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur41[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur42[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur42[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur43[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur43[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur44[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur44[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur45[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur45[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur46[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur46[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur47[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur47[al_row]) + ";"
end if
if isnull(dw_torque.object.hauteur48[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.hauteur48[al_row]) + ";"
end if

return ls_torque

return ""
end function

public function string of_settip (integer al_row);string ls_torque

if isnull(dw_torque.object.tip11[al_row]) then
	ls_torque = "" + ";"
else
	ls_torque = string(dw_torque.object.tip11[al_row]) + ";"
end if
if isnull(dw_torque.object.tip12[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip12[al_row]) + ";"
end if
if isnull(dw_torque.object.tip13[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip13[al_row]) + ";"
end if
if isnull(dw_torque.object.tip14[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip14[al_row]) + ";"
end if
if isnull(dw_torque.object.tip15[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip15[al_row]) + ";"
end if
if isnull(dw_torque.object.tip16[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip16[al_row]) + ";"
end if
if isnull(dw_torque.object.tip17[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip17[al_row]) + ";"
end if
if isnull(dw_torque.object.tip18[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip18[al_row]) + ";"
end if
if isnull(dw_torque.object.tip21[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip21[al_row]) + ";"
end if
if isnull(dw_torque.object.tip22[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip22[al_row]) + ";"
end if
if isnull(dw_torque.object.tip23[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip23[al_row]) + ";"
end if
if isnull(dw_torque.object.tip24[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip24[al_row]) + ";"
end if
if isnull(dw_torque.object.tip25[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip25[al_row]) + ";"
end if
if isnull(dw_torque.object.tip26[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip26[al_row]) + ";"
end if
if isnull(dw_torque.object.tip27[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip27[al_row]) + ";"
end if
if isnull(dw_torque.object.tip28[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip28[al_row]) + ";"
end if
if isnull(dw_torque.object.tip31[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip31[al_row]) + ";"
end if
if isnull(dw_torque.object.tip32[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip32[al_row]) + ";"
end if
if isnull(dw_torque.object.tip33[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip33[al_row]) + ";"
end if
if isnull(dw_torque.object.tip34[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip34[al_row]) + ";"
end if
if isnull(dw_torque.object.tip35[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip35[al_row]) + ";"
end if
if isnull(dw_torque.object.tip36[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip36[al_row]) + ";"
end if
if isnull(dw_torque.object.tip37[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip37[al_row]) + ";"
end if
if isnull(dw_torque.object.tip38[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip38[al_row]) + ";"
end if
if isnull(dw_torque.object.tip41[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip41[al_row]) + ";"
end if
if isnull(dw_torque.object.tip42[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip42[al_row]) + ";"
end if
if isnull(dw_torque.object.tip43[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip43[al_row]) + ";"
end if
if isnull(dw_torque.object.tip44[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip44[al_row]) + ";"
end if
if isnull(dw_torque.object.tip45[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip45[al_row]) + ";"
end if
if isnull(dw_torque.object.tip46[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip46[al_row]) + ";"
end if
if isnull(dw_torque.object.tip47[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip47[al_row]) + ";"
end if
if isnull(dw_torque.object.tip48[al_row]) then
	ls_torque += "" + ";"
else
	ls_torque += string(dw_torque.object.tip48[al_row]) + ";"
end if

return ls_torque

return ""
end function

public subroutine of_gettorque (string as_torque[], long al_ligne);	string ls_null
	
	setnull(ls_null)
	
	if as_torque[1] = '' then 
		dw_torque.setITem(al_ligne,'d11',ls_null)
	else
		dw_torque.setITem(al_ligne,'d11',as_torque[1])
	end if
	if as_torque[2] = '' then
		dw_torque.setITem(al_ligne,'d12',ls_null)
	else
		dw_torque.setITem(al_ligne,'d12',as_torque[2])
	end if
	if as_torque[3] = '' then
		dw_torque.setITem(al_ligne,'d13',ls_null)
	else
		dw_torque.setITem(al_ligne,'d13',as_torque[3])
	end if
	if as_torque[4] = '' then
		dw_torque.setITem(al_ligne,'d14',ls_null)
	else
		dw_torque.setITem(al_ligne,'d14',as_torque[4])
	end if
	if as_torque[5] = '' then
		dw_torque.setITem(al_ligne,'d15',ls_null)
	else
		dw_torque.setITem(al_ligne,'d15',as_torque[5])
	end if
	if as_torque[6] = '' then
		dw_torque.setITem(al_ligne,'d16',ls_null)
	else
		dw_torque.setITem(al_ligne,'d16',as_torque[6])
	end if
	if as_torque[7] = '' then
		dw_torque.setITem(al_ligne,'d17',ls_null)
	else
		dw_torque.setITem(al_ligne,'d17',as_torque[7])
		end if
	if as_torque[8] = '' then
		dw_torque.setITem(al_ligne,'d18',ls_null)
	else
		dw_torque.setITem(al_ligne,'d18',as_torque[8])
	end if
	if as_torque[9] = '' then 
		dw_torque.setITem(al_ligne,'d21',ls_null)
	else
		dw_torque.setITem(al_ligne,'d21',as_torque[9])
	end if
	if as_torque[10] = '' then
		dw_torque.setITem(al_ligne,'d22',ls_null)
	else
		dw_torque.setITem(al_ligne,'d22',as_torque[10])
	end if
	if as_torque[11] = '' then
		dw_torque.setITem(al_ligne,'d23',ls_null)
	else
		dw_torque.setITem(al_ligne,'d23',as_torque[11])
	end if
	if as_torque[12] = '' then
		dw_torque.setITem(al_ligne,'d24',ls_null)
	else
		dw_torque.setITem(al_ligne,'d24',as_torque[12])
	end if
	if as_torque[13] = '' then
		dw_torque.setITem(al_ligne,'d25',ls_null)
	else
		dw_torque.setITem(al_ligne,'d25',as_torque[13])
	end if
	if as_torque[14] = '' then
		dw_torque.setITem(al_ligne,'d26',ls_null)
	else
		dw_torque.setITem(al_ligne,'d26',as_torque[14])
	end if
	if as_torque[15] = '' then
		dw_torque.setITem(al_ligne,'d27',ls_null)
	else
		dw_torque.setITem(al_ligne,'d27',as_torque[15])
		end if
	if as_torque[16] = '' then
		dw_torque.setITem(al_ligne,'d28',ls_null)
	else
		dw_torque.setITem(al_ligne,'d28',as_torque[16])
		end if
	if as_torque[17] = '' then
		dw_torque.setITem(al_ligne,'d31',ls_null)
	else
		dw_torque.setITem(al_ligne,'d31',as_torque[17])
	end if
	if as_torque[18] = '' then
		dw_torque.setITem(al_ligne,'d32',ls_null)
	else
		dw_torque.setITem(al_ligne,'d32',as_torque[18])
		end if
	if as_torque[19] = '' then
		dw_torque.setITem(al_ligne,'d33',ls_null)
	else
		dw_torque.setITem(al_ligne,'d33',as_torque[19])
	end if
	if as_torque[20] = '' then
		dw_torque.setITem(al_ligne,'d34',ls_null)
	else
		dw_torque.setITem(al_ligne,'d34',as_torque[20])
	end if
	if as_torque[21] = '' then
		dw_torque.setITem(al_ligne,'d35',ls_null)
	else
		dw_torque.setITem(al_ligne,'d35',as_torque[21])
	end if
	if as_torque[22] = '' then
		dw_torque.setITem(al_ligne,'d36',ls_null)
	else
		dw_torque.setITem(al_ligne,'d36',as_torque[22])
	end if
	if as_torque[23] = '' then
		dw_torque.setITem(al_ligne,'d37',ls_null)
	else
		dw_torque.setITem(al_ligne,'d37',as_torque[23])
	end if
	if as_torque[24] = '' then
		dw_torque.setITem(al_ligne,'d38',ls_null)
	else
		dw_torque.setITem(al_ligne,'d38',as_torque[24])
	end if
	if as_torque[25] = '' then
		dw_torque.setITem(al_ligne,'d41',ls_null)
	else
		dw_torque.setITem(al_ligne,'d41',as_torque[25])
	end if
	if as_torque[26] = '' then
		dw_torque.setITem(al_ligne,'d42',ls_null)
	else
		dw_torque.setITem(al_ligne,'d42',as_torque[26])
	end if
	if as_torque[27] = '' then
		dw_torque.setITem(al_ligne,'d43',ls_null)
	else
		dw_torque.setITem(al_ligne,'d43',as_torque[27])
	end if
	if as_torque[28] = '' then
		dw_torque.setITem(al_ligne,'d44',ls_null)
	else
		dw_torque.setITem(al_ligne,'d44',as_torque[28])
	end if
	if as_torque[29] = '' then
		dw_torque.setITem(al_ligne,'d45',ls_null)
	else
		dw_torque.setITem(al_ligne,'d45',as_torque[29])
	end if
	if as_torque[30] = '' then
		dw_torque.setITem(al_ligne,'d46',ls_null)
	else
		dw_torque.setITem(al_ligne,'d46',as_torque[30])
	end if
	if as_torque[31] = '' then
		dw_torque.setITem(al_ligne,'d47',ls_null)
	else
		dw_torque.setITem(al_ligne,'d47',as_torque[31])
	end if
	if as_torque[32] = '' then
		dw_torque.setITem(al_ligne,'d48',ls_null)
	else
		dw_torque.setITem(al_ligne,'d48',as_torque[32])
	end if


end subroutine

public subroutine of_getbonding (string as_torque[], long al_ligne);	string ls_null
	
	setnull(ls_null)
	
	if as_torque[1] = '' then 
		dw_torque.object.bonding11[al_ligne] = ls_null
	else
		dw_torque.object.bonding11[al_ligne] = as_torque[1]
	end if
	if as_torque[2] = '' then
		dw_torque.object.bonding12[al_ligne] = ls_null
	else
		dw_torque.object.bonding12[al_ligne] = as_torque[2]
	end if
	if as_torque[3] = '' then
		dw_torque.object.bonding13[al_ligne] = ls_null
	else
		dw_torque.object.bonding13[al_ligne] = as_torque[3]
	end if
	if as_torque[4] = '' then
		dw_torque.object.bonding14[al_ligne] = ls_null
	else
		dw_torque.object.bonding14[al_ligne] = as_torque[4]
	end if
	if as_torque[5] = '' then
		dw_torque.object.bonding15[al_ligne] = ls_null
	else
		dw_torque.object.bonding15[al_ligne] = as_torque[5]
	end if
	if as_torque[6] = '' then
		dw_torque.object.bonding16[al_ligne] = ls_null
	else
		dw_torque.object.bonding16[al_ligne] = as_torque[6]
	end if
	if as_torque[7] = '' then
		dw_torque.object.bonding17[al_ligne] = ls_null
	else
		dw_torque.object.bonding17[al_ligne] = as_torque[7]
	end if
	if as_torque[8] = '' then
		dw_torque.object.bonding18[al_ligne] = ls_null
	else
		dw_torque.object.bonding18[al_ligne] = as_torque[8]
	end if
	if as_torque[9] = '' then 
		dw_torque.object.bonding21[al_ligne] = ls_null
	else
		dw_torque.object.bonding21[al_ligne] = as_torque[9]
	end if
	if as_torque[10] = '' then
		dw_torque.object.bonding22[al_ligne] = ls_null
	else
		dw_torque.object.bonding22[al_ligne] = as_torque[10]
	end if
	if as_torque[11] = '' then
		dw_torque.object.bonding23[al_ligne] = ls_null
	else
		dw_torque.object.bonding23[al_ligne] = as_torque[11]
	end if
	if as_torque[12] = '' then
		dw_torque.object.bonding24[al_ligne] = ls_null
	else
		dw_torque.object.bonding24[al_ligne] = as_torque[12]
	end if
	if as_torque[13] = '' then
		dw_torque.object.bonding25[al_ligne] = ls_null
	else
		dw_torque.object.bonding25[al_ligne] = as_torque[13]
	end if
	if as_torque[14] = '' then
		dw_torque.object.bonding26[al_ligne] = ls_null
	else
		dw_torque.object.bonding26[al_ligne] = as_torque[14]
	end if
	if as_torque[15] = '' then
		dw_torque.object.bonding27[al_ligne] = ls_null
	else
		dw_torque.object.bonding27[al_ligne] = as_torque[15]
	end if
	if as_torque[16] = '' then
		dw_torque.object.bonding28[al_ligne] = ls_null
	else
		dw_torque.object.bonding28[al_ligne] = as_torque[16]
	end if
	if as_torque[17] = '' then
		dw_torque.object.bonding31[al_ligne] = ls_null
	else
		dw_torque.object.bonding31[al_ligne] = as_torque[17]
	end if
	if as_torque[18] = '' then
		dw_torque.object.bonding32[al_ligne] = ls_null
	else
		dw_torque.object.bonding32[al_ligne] = as_torque[18]
	end if
	if as_torque[19] = '' then
		dw_torque.object.bonding33[al_ligne] = ls_null
	else
		dw_torque.object.bonding33[al_ligne] = as_torque[19]
	end if
	if as_torque[20] = '' then
		dw_torque.object.bonding34[al_ligne] = ls_null
	else
		dw_torque.object.bonding34[al_ligne] = as_torque[20]
	end if
	if as_torque[21] = '' then
		dw_torque.object.bonding35[al_ligne]= ls_null
	else
		dw_torque.object.bonding35[al_ligne] = as_torque[21]
	end if
	if as_torque[22] = '' then
		dw_torque.object.bonding36[al_ligne] = ls_null
	else
		dw_torque.object.bonding36[al_ligne] = as_torque[22]
	end if
	if as_torque[23] = '' then
		dw_torque.object.bonding37[al_ligne] = ls_null
	else
		dw_torque.object.bonding37[al_ligne] = as_torque[23]
	end if
	if as_torque[24] = '' then
		dw_torque.object.bonding38[al_ligne] = ls_null
	else
		dw_torque.object.bonding38[al_ligne] = as_torque[24]
	end if
	if as_torque[25] = '' then
		dw_torque.object.bonding41[al_ligne] = ls_null
	else
		dw_torque.object.bonding41[al_ligne] = as_torque[25]
	end if
	if as_torque[26] = '' then
		dw_torque.object.bonding42[al_ligne] = ls_null
	else
		dw_torque.object.bonding42[al_ligne] = as_torque[26]
	end if
	if as_torque[27] = '' then
		dw_torque.object.bonding43[al_ligne] = ls_null
	else
		dw_torque.object.bonding43[al_ligne] = as_torque[27]
	end if
	if as_torque[28] = '' then
		dw_torque.object.bonding44[al_ligne] = ls_null
	else
		dw_torque.object.bonding44[al_ligne] = as_torque[28]
	end if
	if as_torque[29] = '' then
		dw_torque.object.bonding45[al_ligne] = ls_null
	else
		dw_torque.object.bonding45[al_ligne] = as_torque[29]
	end if
	if as_torque[30] = '' then
		dw_torque.object.bonding46[al_ligne] = ls_null
	else
		dw_torque.object.bonding46[al_ligne] = as_torque[30]
	end if
	if as_torque[31] = '' then
		dw_torque.object.bonding47[al_ligne] = ls_null
	else
		dw_torque.object.bonding47[al_ligne] = as_torque[31]
	end if
	if as_torque[32] = '' then
		dw_torque.object.bonding48[al_ligne] = ls_null
	else
		dw_torque.object.bonding48[al_ligne] = as_torque[32]
	end if


end subroutine

public subroutine of_getrotation (string as_torque[], long al_ligne);	string ls_null
	
	setnull(ls_null)
	
	if as_torque[1] = '' then 
		dw_torque.object.rotation11[al_ligne] = ls_null
	else
		dw_torque.object.rotation11[al_ligne] = as_torque[1]
	end if
	if as_torque[2] = '' then
		dw_torque.object.rotation12[al_ligne] = ls_null
	else
		dw_torque.object.rotation12[al_ligne] = as_torque[2]
	end if
	if as_torque[3] = '' then
		dw_torque.object.rotation13[al_ligne] = ls_null
	else
		dw_torque.object.rotation13[al_ligne] = as_torque[3]
	end if
	if as_torque[4] = '' then
		dw_torque.object.rotation14[al_ligne] = ls_null
	else
		dw_torque.object.rotation14[al_ligne] = as_torque[4]
	end if
	if as_torque[5] = '' then
		dw_torque.object.rotation15[al_ligne] = ls_null
	else
		dw_torque.object.rotation15[al_ligne] = as_torque[5]
	end if
	if as_torque[6] = '' then
		dw_torque.object.rotation16[al_ligne] = ls_null
	else
		dw_torque.object.rotation16[al_ligne] = as_torque[6]
	end if
	if as_torque[7] = '' then
		dw_torque.object.rotation17[al_ligne] = ls_null
	else
		dw_torque.object.rotation17[al_ligne] = as_torque[7]
	end if
	if as_torque[8] = '' then
		dw_torque.object.rotation18[al_ligne] = ls_null
	else
		dw_torque.object.rotation18[al_ligne] = as_torque[8]
	end if
	if as_torque[9] = '' then 
		dw_torque.object.rotation21[al_ligne] = ls_null
	else
		dw_torque.object.rotation21[al_ligne] = as_torque[9]
	end if
	if as_torque[10] = '' then
		dw_torque.object.rotation22[al_ligne] = ls_null
	else
		dw_torque.object.rotation22[al_ligne] = as_torque[10]
	end if
	if as_torque[11] = '' then
		dw_torque.object.rotation23[al_ligne] = ls_null
	else
		dw_torque.object.rotation23[al_ligne] = as_torque[11]
	end if
	if as_torque[12] = '' then
		dw_torque.object.rotation24[al_ligne] = ls_null
	else
		dw_torque.object.rotation24[al_ligne] = as_torque[12]
	end if
	if as_torque[13] = '' then
		dw_torque.object.rotation25[al_ligne] = ls_null
	else
		dw_torque.object.rotation25[al_ligne] = as_torque[13]
	end if
	if as_torque[14] = '' then
		dw_torque.object.rotation26[al_ligne] = ls_null
	else
		dw_torque.object.rotation26[al_ligne] = as_torque[14]
	end if
	if as_torque[15] = '' then
		dw_torque.object.rotation27[al_ligne] = ls_null
	else
		dw_torque.object.rotation27[al_ligne] = as_torque[15]
	end if
	if as_torque[16] = '' then
		dw_torque.object.rotation28[al_ligne] = ls_null
	else
		dw_torque.object.rotation28[al_ligne] = as_torque[16]
	end if
	if as_torque[17] = '' then
		dw_torque.object.rotation31[al_ligne] = ls_null
	else
		dw_torque.object.rotation31[al_ligne] = as_torque[17]
	end if
	if as_torque[18] = '' then
		dw_torque.object.rotation32[al_ligne] = ls_null
	else
		dw_torque.object.rotation32[al_ligne] = as_torque[18]
	end if
	if as_torque[19] = '' then
		dw_torque.object.rotation33[al_ligne] = ls_null
	else
		dw_torque.object.rotation33[al_ligne] = as_torque[19]
	end if
	if as_torque[20] = '' then
		dw_torque.object.rotation34[al_ligne] = ls_null
	else
		dw_torque.object.rotation34[al_ligne] = as_torque[20]
	end if
	if as_torque[21] = '' then
		dw_torque.object.rotation35[al_ligne]= ls_null
	else
		dw_torque.object.rotation35[al_ligne] = as_torque[21]
	end if
	if as_torque[22] = '' then
		dw_torque.object.rotation36[al_ligne] = ls_null
	else
		dw_torque.object.rotation36[al_ligne] = as_torque[22]
	end if
	if as_torque[23] = '' then
		dw_torque.object.rotation37[al_ligne] = ls_null
	else
		dw_torque.object.rotation37[al_ligne] = as_torque[23]
	end if
	if as_torque[24] = '' then
		dw_torque.object.rotation38[al_ligne] = ls_null
	else
		dw_torque.object.rotation38[al_ligne] = as_torque[24]
	end if
	if as_torque[25] = '' then
		dw_torque.object.rotation41[al_ligne] = ls_null
	else
		dw_torque.object.rotation41[al_ligne] = as_torque[25]
	end if
	if as_torque[26] = '' then
		dw_torque.object.rotation42[al_ligne] = ls_null
	else
		dw_torque.object.rotation42[al_ligne] = as_torque[26]
	end if
	if as_torque[27] = '' then
		dw_torque.object.rotation43[al_ligne] = ls_null
	else
		dw_torque.object.rotation43[al_ligne] = as_torque[27]
	end if
	if as_torque[28] = '' then
		dw_torque.object.rotation44[al_ligne] = ls_null
	else
		dw_torque.object.rotation44[al_ligne] = as_torque[28]
	end if
	if as_torque[29] = '' then
		dw_torque.object.rotation45[al_ligne] = ls_null
	else
		dw_torque.object.rotation45[al_ligne] = as_torque[29]
	end if
	if as_torque[30] = '' then
		dw_torque.object.rotation46[al_ligne] = ls_null
	else
		dw_torque.object.rotation46[al_ligne] = as_torque[30]
	end if
	if as_torque[31] = '' then
		dw_torque.object.rotation47[al_ligne] = ls_null
	else
		dw_torque.object.rotation47[al_ligne] = as_torque[31]
	end if
	if as_torque[32] = '' then
		dw_torque.object.rotation48[al_ligne] = ls_null
	else
		dw_torque.object.rotation48[al_ligne] = as_torque[32]
	end if


end subroutine

public subroutine of_gethauteur (string as_torque[], integer al_ligne);	string ls_null
	
	setnull(ls_null)
	
	if as_torque[1] = '' then 
		dw_torque.object.hauteur11[al_ligne] = ls_null
	else
		dw_torque.object.hauteur11[al_ligne] = as_torque[1]
	end if
	if as_torque[2] = '' then
		dw_torque.object.hauteur12[al_ligne] = ls_null
	else
		dw_torque.object.hauteur12[al_ligne] = as_torque[2]
	end if
	if as_torque[3] = '' then
		dw_torque.object.hauteur13[al_ligne] = ls_null
	else
		dw_torque.object.hauteur13[al_ligne] = as_torque[3]
	end if
	if as_torque[4] = '' then
		dw_torque.object.hauteur14[al_ligne] = ls_null
	else
		dw_torque.object.hauteur14[al_ligne] = as_torque[4]
	end if
	if as_torque[5] = '' then
		dw_torque.object.hauteur15[al_ligne] = ls_null
	else
		dw_torque.object.hauteur15[al_ligne] = as_torque[5]
	end if
	if as_torque[6] = '' then
		dw_torque.object.hauteur16[al_ligne] = ls_null
	else
		dw_torque.object.hauteur16[al_ligne] = as_torque[6]
	end if
	if as_torque[7] = '' then
		dw_torque.object.hauteur17[al_ligne] = ls_null
	else
		dw_torque.object.hauteur17[al_ligne] = as_torque[7]
	end if
	if as_torque[8] = '' then
		dw_torque.object.hauteur18[al_ligne] = ls_null
	else
		dw_torque.object.hauteur18[al_ligne] = as_torque[8]
	end if
	if as_torque[9] = '' then 
		dw_torque.object.hauteur21[al_ligne] = ls_null
	else
		dw_torque.object.hauteur21[al_ligne] = as_torque[9]
	end if
	if as_torque[10] = '' then
		dw_torque.object.hauteur22[al_ligne] = ls_null
	else
		dw_torque.object.hauteur22[al_ligne] = as_torque[10]
	end if
	if as_torque[11] = '' then
		dw_torque.object.hauteur23[al_ligne] = ls_null
	else
		dw_torque.object.hauteur23[al_ligne] = as_torque[11]
	end if
	if as_torque[12] = '' then
		dw_torque.object.hauteur24[al_ligne] = ls_null
	else
		dw_torque.object.hauteur24[al_ligne] = as_torque[12]
	end if
	if as_torque[13] = '' then
		dw_torque.object.hauteur25[al_ligne] = ls_null
	else
		dw_torque.object.hauteur25[al_ligne] = as_torque[13]
	end if
	if as_torque[14] = '' then
		dw_torque.object.hauteur26[al_ligne] = ls_null
	else
		dw_torque.object.hauteur26[al_ligne] = as_torque[14]
	end if
	if as_torque[15] = '' then
		dw_torque.object.hauteur27[al_ligne] = ls_null
	else
		dw_torque.object.hauteur27[al_ligne] = as_torque[15]
	end if
	if as_torque[16] = '' then
		dw_torque.object.hauteur28[al_ligne] = ls_null
	else
		dw_torque.object.hauteur28[al_ligne] = as_torque[16]
	end if
	if as_torque[17] = '' then
		dw_torque.object.hauteur31[al_ligne] = ls_null
	else
		dw_torque.object.hauteur31[al_ligne] = as_torque[17]
	end if
	if as_torque[18] = '' then
		dw_torque.object.hauteur32[al_ligne] = ls_null
	else
		dw_torque.object.hauteur32[al_ligne] = as_torque[18]
	end if
	if as_torque[19] = '' then
		dw_torque.object.hauteur33[al_ligne] = ls_null
	else
		dw_torque.object.hauteur33[al_ligne] = as_torque[19]
	end if
	if as_torque[20] = '' then
		dw_torque.object.hauteur34[al_ligne] = ls_null
	else
		dw_torque.object.hauteur34[al_ligne] = as_torque[20]
	end if
	if as_torque[21] = '' then
		dw_torque.object.hauteur35[al_ligne]= ls_null
	else
		dw_torque.object.hauteur35[al_ligne] = as_torque[21]
	end if
	if as_torque[22] = '' then
		dw_torque.object.hauteur36[al_ligne] = ls_null
	else
		dw_torque.object.hauteur36[al_ligne] = as_torque[22]
	end if
	if as_torque[23] = '' then
		dw_torque.object.hauteur37[al_ligne] = ls_null
	else
		dw_torque.object.hauteur37[al_ligne] = as_torque[23]
	end if
	if as_torque[24] = '' then
		dw_torque.object.hauteur38[al_ligne] = ls_null
	else
		dw_torque.object.hauteur38[al_ligne] = as_torque[24]
	end if
	if as_torque[25] = '' then
		dw_torque.object.hauteur41[al_ligne] = ls_null
	else
		dw_torque.object.hauteur41[al_ligne] = as_torque[25]
	end if
	if as_torque[26] = '' then
		dw_torque.object.hauteur42[al_ligne] = ls_null
	else
		dw_torque.object.hauteur42[al_ligne] = as_torque[26]
	end if
	if as_torque[27] = '' then
		dw_torque.object.hauteur43[al_ligne] = ls_null
	else
		dw_torque.object.hauteur43[al_ligne] = as_torque[27]
	end if
	if as_torque[28] = '' then
		dw_torque.object.hauteur44[al_ligne] = ls_null
	else
		dw_torque.object.hauteur44[al_ligne] = as_torque[28]
	end if
	if as_torque[29] = '' then
		dw_torque.object.hauteur45[al_ligne] = ls_null
	else
		dw_torque.object.hauteur45[al_ligne] = as_torque[29]
	end if
	if as_torque[30] = '' then
		dw_torque.object.hauteur46[al_ligne] = ls_null
	else
		dw_torque.object.hauteur46[al_ligne] = as_torque[30]
	end if
	if as_torque[31] = '' then
		dw_torque.object.hauteur47[al_ligne] = ls_null
	else
		dw_torque.object.hauteur47[al_ligne] = as_torque[31]
	end if
	if as_torque[32] = '' then
		dw_torque.object.hauteur48[al_ligne] = ls_null
	else
		dw_torque.object.hauteur48[al_ligne] = as_torque[32]
	end if


end subroutine

public subroutine of_gettip (string as_torque[], long al_ligne);	string ls_null
	
	setnull(ls_null)
	
	if as_torque[1] = '' then 
		dw_torque.object.tip11[al_ligne] = ls_null
	else
		dw_torque.object.tip11[al_ligne] = as_torque[1]
	end if
	if as_torque[2] = '' then
		dw_torque.object.tip12[al_ligne] = ls_null
	else
		dw_torque.object.tip12[al_ligne] = as_torque[2]
	end if
	if as_torque[3] = '' then
		dw_torque.object.tip13[al_ligne] = ls_null
	else
		dw_torque.object.tip13[al_ligne] = as_torque[3]
	end if
	if as_torque[4] = '' then
		dw_torque.object.tip14[al_ligne] = ls_null
	else
		dw_torque.object.tip14[al_ligne] = as_torque[4]
	end if
	if as_torque[5] = '' then
		dw_torque.object.tip15[al_ligne] = ls_null
	else
		dw_torque.object.tip15[al_ligne] = as_torque[5]
	end if
	if as_torque[6] = '' then
		dw_torque.object.tip16[al_ligne] = ls_null
	else
		dw_torque.object.tip16[al_ligne] = as_torque[6]
	end if
	if as_torque[7] = '' then
		dw_torque.object.tip17[al_ligne] = ls_null
	else
		dw_torque.object.tip17[al_ligne] = as_torque[7]
	end if
	if as_torque[8] = '' then
		dw_torque.object.tip18[al_ligne] = ls_null
	else
		dw_torque.object.tip18[al_ligne] = as_torque[8]
	end if
	if as_torque[9] = '' then 
		dw_torque.object.tip21[al_ligne] = ls_null
	else
		dw_torque.object.tip21[al_ligne] = as_torque[9]
	end if
	if as_torque[10] = '' then
		dw_torque.object.tip22[al_ligne] = ls_null
	else
		dw_torque.object.tip22[al_ligne] = as_torque[10]
	end if
	if as_torque[11] = '' then
		dw_torque.object.tip23[al_ligne] = ls_null
	else
		dw_torque.object.tip23[al_ligne] = as_torque[11]
	end if
	if as_torque[12] = '' then
		dw_torque.object.tip24[al_ligne] = ls_null
	else
		dw_torque.object.tip24[al_ligne] = as_torque[12]
	end if
	if as_torque[13] = '' then
		dw_torque.object.tip25[al_ligne] = ls_null
	else
		dw_torque.object.tip25[al_ligne] = as_torque[13]
	end if
	if as_torque[14] = '' then
		dw_torque.object.tip26[al_ligne] = ls_null
	else
		dw_torque.object.tip26[al_ligne] = as_torque[14]
	end if
	if as_torque[15] = '' then
		dw_torque.object.tip27[al_ligne] = ls_null
	else
		dw_torque.object.tip27[al_ligne] = as_torque[15]
	end if
	if as_torque[16] = '' then
		dw_torque.object.tip28[al_ligne] = ls_null
	else
		dw_torque.object.tip28[al_ligne] = as_torque[16]
	end if
	if as_torque[17] = '' then
		dw_torque.object.tip31[al_ligne] = ls_null
	else
		dw_torque.object.tip31[al_ligne] = as_torque[17]
	end if
	if as_torque[18] = '' then
		dw_torque.object.tip32[al_ligne] = ls_null
	else
		dw_torque.object.tip32[al_ligne] = as_torque[18]
	end if
	if as_torque[19] = '' then
		dw_torque.object.tip33[al_ligne] = ls_null
	else
		dw_torque.object.tip33[al_ligne] = as_torque[19]
	end if
	if as_torque[20] = '' then
		dw_torque.object.tip34[al_ligne] = ls_null
	else
		dw_torque.object.tip34[al_ligne] = as_torque[20]
	end if
	if as_torque[21] = '' then
		dw_torque.object.tip35[al_ligne]= ls_null
	else
		dw_torque.object.tip35[al_ligne] = as_torque[21]
	end if
	if as_torque[22] = '' then
		dw_torque.object.tip36[al_ligne] = ls_null
	else
		dw_torque.object.tip36[al_ligne] = as_torque[22]
	end if
	if as_torque[23] = '' then
		dw_torque.object.tip37[al_ligne] = ls_null
	else
		dw_torque.object.tip37[al_ligne] = as_torque[23]
	end if
	if as_torque[24] = '' then
		dw_torque.object.tip38[al_ligne] = ls_null
	else
		dw_torque.object.tip38[al_ligne] = as_torque[24]
	end if
	if as_torque[25] = '' then
		dw_torque.object.tip41[al_ligne] = ls_null
	else
		dw_torque.object.tip41[al_ligne] = as_torque[25]
	end if
	if as_torque[26] = '' then
		dw_torque.object.tip42[al_ligne] = ls_null
	else
		dw_torque.object.tip42[al_ligne] = as_torque[26]
	end if
	if as_torque[27] = '' then
		dw_torque.object.tip43[al_ligne] = ls_null
	else
		dw_torque.object.tip43[al_ligne] = as_torque[27]
	end if
	if as_torque[28] = '' then
		dw_torque.object.tip44[al_ligne] = ls_null
	else
		dw_torque.object.tip44[al_ligne] = as_torque[28]
	end if
	if as_torque[29] = '' then
		dw_torque.object.tip45[al_ligne] = ls_null
	else
		dw_torque.object.tip45[al_ligne] = as_torque[29]
	end if
	if as_torque[30] = '' then
		dw_torque.object.tip46[al_ligne] = ls_null
	else
		dw_torque.object.tip46[al_ligne] = as_torque[30]
	end if
	if as_torque[31] = '' then
		dw_torque.object.tip47[al_ligne] = ls_null
	else
		dw_torque.object.tip47[al_ligne] = as_torque[31]
	end if
	if as_torque[32] = '' then
		dw_torque.object.tip48[al_ligne] = ls_null
	else
		dw_torque.object.tip48[al_ligne] = as_torque[32]
	end if


end subroutine

on w_torque.create
int iCurrent
call super::create
this.dw_torque=create dw_torque
this.cb_5=create cb_5
this.cb_sauvegarder=create cb_sauvegarder
this.cb_supprimer=create cb_supprimer
this.cb_ajouter=create cb_ajouter
this.cb_fermer=create cb_fermer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_torque
this.Control[iCurrent+2]=this.cb_5
this.Control[iCurrent+3]=this.cb_sauvegarder
this.Control[iCurrent+4]=this.cb_supprimer
this.Control[iCurrent+5]=this.cb_ajouter
this.Control[iCurrent+6]=this.cb_fermer
end on

on w_torque.destroy
call super::destroy
destroy(this.dw_torque)
destroy(this.cb_5)
destroy(this.cb_sauvegarder)
destroy(this.cb_supprimer)
destroy(this.cb_ajouter)
destroy(this.cb_fermer)
end on

event pfc_preopen;call super::pfc_preopen;il_patid = long(gnv_app.inv_entrepotglobal.of_retournedonnee("patientidtorque"))
end event

event open;call super::open;dw_torque.event ue_retrieve()
end event

type dw_torque from u_dw within w_torque
event ue_retrieve ( )
integer width = 3634
integer height = 1924
integer taborder = 10
string dataobject = "d_torque"
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
end type

event ue_retrieve();n_cst_string luo_string
string ls_tab[], ls_torque
long i, ll_null

setnull(ll_null)
dw_torque.retrieve(il_patid)
for i = 1 to dw_torque.rowcount()

	ls_torque = dw_torque.object.torque[i]
	luo_string.of_parsetoarray(ls_torque, ";", ls_tab)
	of_gettorque(ls_tab,i)
	ls_torque = dw_torque.object.bonding[i]
	luo_string.of_parsetoarray(ls_torque, ";", ls_tab)
	of_getbonding(ls_tab,i)
	ls_torque = dw_torque.object.rotation[i]
	luo_string.of_parsetoarray(ls_torque, ";", ls_tab)
	of_getrotation(ls_tab,i)
	ls_torque = dw_torque.object.hauteur[i]
	luo_string.of_parsetoarray(ls_torque, ";", ls_tab)
	of_gethauteur(ls_tab,i)
	ls_torque = dw_torque.object.tip[i]
	luo_string.of_parsetoarray(ls_torque, ";", ls_tab)
	of_gettip(ls_tab,i)

next





end event

event itemchanged;call super::itemchanged;string ls_torque

change = true

if row > 0 then
	
	dw_torque.acceptText()
	setITem(row,'torque',of_settorque(row))
	setITem(row,'bonding',of_setbonding(row))
	setITem(row,'rotation',of_setrotation(row))
	setITem(row,'hauteur',of_sethauteur(row))
	setITem(row,'tip',of_settip(row))
	
end if


end event

event editchanged;call super::editchanged;change = true
end event

type cb_5 from commandbutton within w_torque
integer x = 1243
integer y = 1924
integer width = 1147
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
end type

type cb_sauvegarder from commandbutton within w_torque
integer x = 2395
integer y = 1924
integer width = 617
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Sauvegarder"
end type

event clicked;of_save()
end event

type cb_supprimer from commandbutton within w_torque
integer x = 626
integer y = 1924
integer width = 617
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;dw_torque.deleteRow(dw_torque.getRow())
change = true
of_save()
end event

type cb_ajouter from commandbutton within w_torque
integer x = 9
integer y = 1924
integer width = 617
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;of_ajouter()
end event

type cb_fermer from commandbutton within w_torque
integer x = 3017
integer y = 1924
integer width = 617
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
end type

event clicked;if change then
	if error_type(200) = 1 then
		of_save()
	end if
end if
close(parent)
end event

