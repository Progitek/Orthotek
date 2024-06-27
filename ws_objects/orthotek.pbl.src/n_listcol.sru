$PBExportHeader$n_listcol.sru
forward
global type n_listcol from n_base
end type
end forward

global type n_listcol from n_base autoinstantiate
end type

type variables
boolean ib_col1, ib_col2, ib_col3, ib_col4, ib_col5, ib_col6, ib_col7, ib_col8, ib_col9, ib_col10
boolean ib_col11, ib_col12, ib_col13, ib_col14, ib_col15
long il_col[]
end variables

forward prototypes
public function integer of_setcol1 (boolean ab_etat)
public function boolean of_getcol1 ()
public function integer of_setcol2 (boolean ab_etat)
public function boolean of_getcol2 ()
public function integer of_setcol3 (boolean ab_etat)
public function boolean of_getcol3 ()
public function integer of_setcol4 (boolean ab_etat)
public function boolean of_getcol4 ()
public function integer of_setcol5 (boolean ab_etat)
public function boolean of_getcol5 ()
public function integer of_setcol6 (boolean ab_etat)
public function boolean of_getcol6 ()
public function integer of_setcol7 (boolean ab_etat)
public function boolean of_getcol7 ()
public function integer of_setcol8 (boolean ab_etat)
public function boolean of_getcol8 ()
public function integer of_setcol9 (boolean ab_etat)
public function boolean of_getcol9 ()
public function integer of_setcol10 (boolean ab_etat)
public function boolean of_getcol10 ()
public function integer of_setcol11 (boolean ab_etat)
public function boolean of_getcol11 ()
public function integer of_setcol12 (boolean ab_etat)
public function boolean of_getcol12 ()
public function integer of_setcol13 (boolean ab_etat)
public function boolean of_getcol13 ()
public function integer of_setcol14 (boolean ab_etat)
public function boolean of_getcol14 ()
public function integer of_setcol15 (boolean ab_etat)
public function any of_getcol ()
public function boolean of_getcol15 ()
public function integer of_setcol (long al_etat[])
end prototypes

public function integer of_setcol1 (boolean ab_etat);ib_col1 = ab_etat
Return 1
end function

public function boolean of_getcol1 ();return ib_col1
end function

public function integer of_setcol2 (boolean ab_etat);ib_col2 = ab_etat
Return 1
end function

public function boolean of_getcol2 ();return ib_col2
end function

public function integer of_setcol3 (boolean ab_etat);ib_col3 = ab_etat
Return 1
end function

public function boolean of_getcol3 ();return ib_col3
end function

public function integer of_setcol4 (boolean ab_etat);ib_col4 = ab_etat
Return 1
end function

public function boolean of_getcol4 ();return ib_col4
end function

public function integer of_setcol5 (boolean ab_etat);ib_col5 = ab_etat
Return 1
end function

public function boolean of_getcol5 ();return ib_col5
end function

public function integer of_setcol6 (boolean ab_etat);ib_col6 = ab_etat
Return 1
end function

public function boolean of_getcol6 ();return ib_col6
end function

public function integer of_setcol7 (boolean ab_etat);ib_col7 = ab_etat
Return 1
end function

public function boolean of_getcol7 ();return ib_col7
end function

public function integer of_setcol8 (boolean ab_etat);ib_col8 = ab_etat
Return 1
end function

public function boolean of_getcol8 ();return ib_col8
end function

public function integer of_setcol9 (boolean ab_etat);ib_col9 = ab_etat
Return 1
end function

public function boolean of_getcol9 ();return ib_col9
end function

public function integer of_setcol10 (boolean ab_etat);ib_col10 = ab_etat
Return 1
end function

public function boolean of_getcol10 ();return ib_col10
end function

public function integer of_setcol11 (boolean ab_etat);ib_col11 = ab_etat
Return 1
end function

public function boolean of_getcol11 ();return ib_col11
end function

public function integer of_setcol12 (boolean ab_etat);ib_col12 = ab_etat
Return 1
end function

public function boolean of_getcol12 ();return ib_col12
end function

public function integer of_setcol13 (boolean ab_etat);ib_col13 = ab_etat
Return 1
end function

public function boolean of_getcol13 ();return ib_col13
end function

public function integer of_setcol14 (boolean ab_etat);ib_col14 = ab_etat
Return 1
end function

public function boolean of_getcol14 ();return ib_col14
end function

public function integer of_setcol15 (boolean ab_etat);ib_col15 = ab_etat
Return 1
end function

public function any of_getcol ();return il_col
end function

public function boolean of_getcol15 ();return ib_col15
end function

public function integer of_setcol (long al_etat[]);il_col = al_etat
Return 1
end function

on n_listcol.create
call super::create
end on

on n_listcol.destroy
call super::destroy
end on

