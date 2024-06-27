﻿$PBExportHeader$pro_u_ddlb.sru
$PBExportComments$(PRO) Extension DropDownListBox class
forward
global type pro_u_ddlb from pfc_u_ddlb
end type
end forward

global type pro_u_ddlb from pfc_u_ddlb
end type
global pro_u_ddlb pro_u_ddlb

type variables
Protected:
n_lbi inv_items[]
integer ii_selectedItem
string is_sorted = ""
boolean ib_blankopt = false
any ia_blankoptvalue
end variables

forward prototypes
public function string of_getsorted ()
public function integer of_setsorted (string as_critere)
public function integer of_additem (string as_item)
public function integer of_deleteitem (integer ai_index)
protected function integer of_insert (n_lbi anv_item, integer ai_index)
public function integer of_additem (string as_item, any aa_data)
protected function integer of_additem (n_lbi anv_item)
protected function integer of_binsearchdc (ref n_lbi anv_item, integer ai_g, integer ai_d)
protected function integer of_binsearchdd (ref n_lbi anv_item, integer ai_g, integer ai_d)
protected function integer of_binsearchlc (ref n_lbi anv_item, integer ai_g, integer ai_d)
protected function integer of_binsearchld (ref n_lbi anv_item, integer ai_g, integer ai_d)
protected function integer swap (ref n_lbi anv_item1, ref n_lbi anv_item2)
public function integer of_finditem (any aa_item, integer ai_index, boolean ab_label)
public function integer of_insertitem (string as_item, integer ai_index)
public function integer of_insertitem (string as_item, any aa_data, integer ai_index)
public function integer of_reset ()
protected subroutine of_quicksortdc (unsignedinteger ai_g, unsignedinteger ai_d)
protected subroutine of_quicksortdd (unsignedinteger ai_g, unsignedinteger ai_d)
protected subroutine of_quicksortlc (unsignedinteger ai_g, unsignedinteger ai_d)
protected subroutine of_quicksortld (unsignedinteger ai_g, unsignedinteger ai_d)
public function integer of_selectitem (any aa_item, integer ai_index, boolean ab_label)
public function integer of_selecteditem ()
public function string of_getlabel (integer ai_index)
public function any of_getdata (integer ai_index)
public function any of_getselecteddata ()
public function any of_getselectedlabel ()
public function integer of_selectitem (integer ai_index)
public function integer of_finditem (any aa_item, integer ai_index, boolean ab_label, boolean ab_exact)
public function integer of_selectitem (any aa_item, integer ai_index, boolean ab_label, boolean ab_exact)
public function boolean of_getblankopt (ref any aa_value)
public function integer of_setblankopt (boolean ab_blankopt, any aa_value)
public function integer of_deleteitem (any aa_item, integer ai_index, boolean ab_label, boolean ab_exact)
public function integer of_deleteitem (any aa_item, integer ai_index, boolean ab_label)
public function integer of_setblankopt (boolean ab_blankopt)
end prototypes

public function string of_getsorted ();// Retourne la valeur de la propriété sorted
// L - Label, ascendant
// D - Data, ascendant
// LA - Label, ascendant
// DA - Data, ascendant
// LD - Label, descendant
// DD - Data, descendant

return is_sorted

end function

public function integer of_setsorted (string as_critere);// Trie le vecteur d'items (et celui de données)
// L - Label, ascendant
// D - Data, ascendant
// LA - Label, ascendant
// DA - Data, ascendant
// LD - Label, descendant
// DD - Data, descendant
//
// Retourne un entier :
// 1 - success
// -1 - échec, peut être un argument invalide
//
// Note : attention, si les données sont un vecteur, une structure ou un objet
// et qu'on essaie de trier par les donées, cette fonction ne le détectera pas,
// mais générera une erreur à l'exécution

integer i

setNull(i)

if isNull(as_critere) then return i

choose case upper(trim(as_critere))
	case 'L', 'LA'
		of_quicksortlc(1, upperbound(inv_items))
	case 'LD'
		of_quicksortld(1, upperbound(inv_items))
	case 'D', 'DA'
		of_quicksortdc(1, upperbound(inv_items))
	case 'DD'
		of_quicksortdd(1, upperbound(inv_items))
	case '' // Retirer le tri, rien à faire
		is_sorted = ''
		return 1
	case else
		return -1
end choose

is_sorted = upper(trim(as_critere))

sorted = false
reset()
for i = 1 to upperbound(inv_items)
	addItem(inv_items[i].of_getlabel())
next

return 1

end function

public function integer of_additem (string as_item);// Ajouter un item et sans données
any la_null
setNull(la_null)

return of_additem(as_item, la_null)

end function

public function integer of_deleteitem (integer ai_index);// supprime l'item à la position ai_index avec ses données
// puis décale les autres

integer i, li_index = 0
n_lbi lnv_items[]

setNull(i)

if isNull(ai_index) then return i

for i = 1 to upperbound(inv_items)
	if i <> ai_index then
		li_index ++
		lnv_items[li_index] = inv_items[i]
	end if
next

if ii_selectedItem = ai_index then ii_selectedItem = 0

inv_items = lnv_items

return deleteItem(ai_index)

end function

protected function integer of_insert (n_lbi anv_item, integer ai_index);// Fonction protégée qui ne fait aucune validation de tri et qui
// insère l'élément as_item à la position ai_index
// Retourne un entier
// positif - position
// -1 - échec

integer i, li_index = 0
n_lbi lnv_items[]
any la_items[], la_data[]

if isNull(ai_index) then return -1
if ai_index < 0 or ai_index > upperbound(inv_items) + 1 then return -1

// Copier la première partie du vecteur
for i = 1 to ai_index - 1
	li_index ++
	lnv_items[li_index] = inv_items[i]
next

// Insérer l'item à la position voulue
li_index ++
lnv_items[li_index] = anv_item

// Copier la 2e partie du vecteur
for i = ai_index to upperbound(inv_items)
	li_index ++
	lnv_items[li_index] = inv_items[i]
next

inv_items = lnv_items

return insertItem(anv_item.of_getlabel(), ai_index)

end function

public function integer of_additem (string as_item, any aa_data);// Ajouter un item et ses données
integer li_null
n_lbi lnv_item

setNull(li_null)
if isNull(as_item) then return li_null

lnv_item.of_setlabel(as_item)
lnv_item.of_setdata(aa_data)

return of_additem(lnv_item)

end function

protected function integer of_additem (n_lbi anv_item);// Ajouter un item et ses données
// Retourne un entier
// positif - position de l'item ajouté
integer li_pos

setNull(li_pos)
if isNull(anv_item) then return li_pos

choose case is_sorted
	case ''
		li_pos = 0
	case 'L', 'LA'
		li_pos = of_binsearchlc(anv_item, 1, upperbound(inv_items))
	case 'LD'
		li_pos = of_binsearchld(anv_item, 1, upperbound(inv_items))
	case 'D', 'DA'
		li_pos = of_binsearchdc(anv_item, 1, upperbound(inv_items))
	case 'DD'
		li_pos = of_binsearchdd(anv_item, 1, upperbound(inv_items))
end choose

if li_pos < 0 then return li_pos

if li_pos = 0 or li_pos > upperbound(inv_items) then
	li_pos = upperbound(inv_items) + 1
	
	inv_items[li_pos] = anv_item
	
	if AddItem(anv_item.of_getlabel()) = li_pos then
		return li_pos
	else
		return -1
	end if
else
	if of_insert(anv_item, li_pos) = li_pos then
		return li_pos
	else
		return -1
	end if
end if

end function

protected function integer of_binsearchdc (ref n_lbi anv_item, integer ai_g, integer ai_d);// Fonction protégée qui effectue une recherche binaire dans
// le vecteur d'items et retourne la position de l'item devant
// être placé après anv_item

integer li_posmed

if ai_g > ai_d then
	return ai_g
elseif ai_g = ai_d then
	if anv_item.of_getdata() < inv_items[ai_g].of_getdata() then return ai_g else return ai_g + 1
else
	li_posmed = int((ai_g + ai_d) / 2)
	
	choose case true
		case anv_item.of_getdata() < inv_items[li_posmed].of_getdata()
			return of_binsearchlc(anv_item, ai_g, li_posmed - 1)
		case anv_item.of_getdata() > inv_items[li_posmed].of_getdata()
			return of_binsearchlc(anv_item, li_posmed + 1, ai_d)
		case anv_item.of_getdata() = inv_items[li_posmed].of_getdata()
			do
				li_posmed ++
			loop while anv_item.of_getdata() = inv_items[li_posmed].of_getdata() and li_posmed < upperbound(inv_items)
			
			if anv_item.of_getdata() = inv_items[li_posmed].of_getdata() then li_posmed ++
			return li_posmed
	end choose
end if

end function

protected function integer of_binsearchdd (ref n_lbi anv_item, integer ai_g, integer ai_d);// Fonction protégée qui effectue une recherche binaire dans
// le vecteur d'items et retourne la position de l'item devant
// être placé après anv_item

integer li_posmed

if ai_g > ai_d then
	return ai_g
elseif ai_g = ai_d then
	if anv_item.of_getdata() > inv_items[ai_g].of_getdata() then return ai_g else return ai_g + 1
else
	li_posmed = int((ai_g + ai_d) / 2)
	
	choose case true
		case anv_item.of_getdata() > inv_items[li_posmed].of_getdata()
			return of_binsearchlc(anv_item, ai_g, li_posmed - 1)
		case anv_item.of_getdata() < inv_items[li_posmed].of_getdata()
			return of_binsearchlc(anv_item, li_posmed + 1, ai_d)
		case anv_item.of_getdata() = inv_items[li_posmed].of_getdata()
			do
				li_posmed ++
			loop while anv_item.of_getdata() = inv_items[li_posmed].of_getdata() and li_posmed < upperbound(inv_items)
			
			if anv_item.of_getdata() = inv_items[li_posmed].of_getdata() then li_posmed ++
			return li_posmed
	end choose
end if

end function

protected function integer of_binsearchlc (ref n_lbi anv_item, integer ai_g, integer ai_d);// Fonction protégée qui effectue une recherche binaire dans
// le vecteur d'items et retourne la position de l'item devant
// être placé après anv_item

integer li_posmed

if ai_g > ai_d then
	return ai_g
elseif ai_g = ai_d then
	if anv_item.of_getlabel() < inv_items[ai_g].of_getlabel() then return ai_g else return ai_g + 1
else
	li_posmed = int((ai_g + ai_d) / 2)
	
	choose case true
		case anv_item.of_getlabel() < inv_items[li_posmed].of_getlabel()
			return of_binsearchlc(anv_item, ai_g, li_posmed - 1)
		case anv_item.of_getlabel() > inv_items[li_posmed].of_getlabel()
			return of_binsearchlc(anv_item, li_posmed + 1, ai_d)
		case anv_item.of_getlabel() = inv_items[li_posmed].of_getlabel()
			do
				li_posmed ++
			loop while anv_item.of_getlabel() = inv_items[li_posmed].of_getlabel() and li_posmed < upperbound(inv_items)
			
			if anv_item.of_getlabel() = inv_items[li_posmed].of_getlabel() then li_posmed ++
			return li_posmed
	end choose
end if

end function

protected function integer of_binsearchld (ref n_lbi anv_item, integer ai_g, integer ai_d);// Fonction protégée qui effectue une recherche binaire dans
// le vecteur d'items et retourne la position de l'item devant
// être placé après anv_item

integer li_posmed

if ai_g > ai_d then
	return ai_g
elseif ai_g = ai_d then
	if anv_item.of_getlabel() > inv_items[ai_g].of_getlabel() then return ai_g else return ai_g + 1
else
	li_posmed = int((ai_g + ai_d) / 2)
	
	choose case true
		case anv_item.of_getlabel() > inv_items[li_posmed].of_getlabel()
			return of_binsearchlc(anv_item, ai_g, li_posmed - 1)
		case anv_item.of_getlabel() < inv_items[li_posmed].of_getlabel()
			return of_binsearchlc(anv_item, li_posmed + 1, ai_d)
		case anv_item.of_getlabel() = inv_items[li_posmed].of_getlabel()
			do
				li_posmed ++
			loop while anv_item.of_getlabel() = inv_items[li_posmed].of_getlabel() and li_posmed < upperbound(inv_items)
			
			if anv_item.of_getlabel() = inv_items[li_posmed].of_getlabel() then li_posmed ++
			return li_posmed
	end choose
end if

end function

protected function integer swap (ref n_lbi anv_item1, ref n_lbi anv_item2);// Fonction qui interchange 2 n_lbi
//
// Retourne un entier
// 1 - Succès
// -1 - Échec

n_lbi lnv_tmp

lnv_tmp = anv_item1
anv_item1 = anv_item2
anv_item2 = lnv_tmp

return 1

end function

public function integer of_finditem (any aa_item, integer ai_index, boolean ab_label);// Trouve le premier item dont l'étiquette commence par aa_item
// ou dont les données sont aa_item après l'indice ai_index.
return of_findItem(aa_item, ai_index, ab_label, false)

end function

public function integer of_insertitem (string as_item, integer ai_index);// Insère l'item as_item à la position ai_index

any la_null

setNull(la_null)

return of_insertItem(as_item, la_null, ai_index)

end function

public function integer of_insertitem (string as_item, any aa_data, integer ai_index);// Insère l'item as_item à la position ai_index
// si la liste n'est pas triée.
// Si elle l'est, insère à la bonne position

integer li_null
n_lbi lnv_item

setNull(li_null)
if isNull(as_item) then return li_null
if isNull(ai_index) then return li_null

lnv_item.of_setlabel(as_item)
lnv_item.of_setdata(aa_data)

if is_sorted = "" then return of_insert(lnv_item, ai_index) else return of_additem(lnv_item)

end function

public function integer of_reset ();// Vide la liste de tous ses éléments

n_lbi lnv_items[]

inv_items = lnv_items
ii_selectedItem = 0

return reset()

end function

protected subroutine of_quicksortdc (unsignedinteger ai_g, unsignedinteger ai_d);any la_pivot
uint i, j, k

if ai_g = ai_d - 1 then
	if inv_items[ai_g].of_getdata() > inv_items[ai_d].of_getdata() then
		// Échanger les valeurs des vercteurs 1 et 2
		swap(inv_items[ai_g], inv_items[ai_d])
	end if
elseif ai_g < ai_d then
	// Sélection du pivot
	k = int((ai_g + ai_d) / 2)
	i = ai_g
	j = ai_d
	
	if inv_items[i].of_getdata() < inv_items[j].of_getdata() then
		if inv_items[k].of_getdata() < inv_items[i].of_getdata() then
			la_pivot = inv_items[i].of_getdata()
		elseif inv_items[k].of_getdata() < inv_items[j].of_getdata() then
			la_pivot = inv_items[k].of_getdata()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[k])
		else
			la_pivot = inv_items[j].of_getdata()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[j])
		end if
	else
		if inv_items[k].of_getdata() < inv_items[j].of_getdata() then
			la_pivot = inv_items[j].of_getdata()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[j])
		elseif inv_items[k].of_getdata() < inv_items[i].of_getdata() then
			la_pivot = inv_items[k].of_getdata()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[k])
		else
			la_pivot = inv_items[i].of_getdata()
		end if
	end if
	
	do while i < j
		do while inv_items[i].of_getdata() <= la_pivot
			i ++
		loop

		do while inv_items[j].of_getdata() >= la_pivot
			j --
		loop
		
		if i < j then
			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[i], inv_items[j])
		end if
	loop

	// Échanger les valeurs des vercteurs 1 et 2
	swap(inv_items[ai_g], inv_items[j])
	
	of_quicksortdc(ai_g, j - 1)
	of_quicksortdc(j + 1, ai_d)
end if

end subroutine

protected subroutine of_quicksortdd (unsignedinteger ai_g, unsignedinteger ai_d);any la_pivot
uint i, j, k

if ai_g = ai_d - 1 then
	if inv_items[ai_g].of_getdata() < inv_items[ai_d].of_getdata() then
		// Échanger les valeurs des vercteurs 1 et 2
		swap(inv_items[ai_g], inv_items[ai_d])
	end if
elseif ai_g < ai_d then
	// Sélection du pivot
	k = int((ai_g + ai_d) / 2)
	i = ai_g
	j = ai_d
	
	if inv_items[i].of_getdata() > inv_items[j].of_getdata() then
		if inv_items[k].of_getdata() > inv_items[i].of_getdata() then
			la_pivot = inv_items[i].of_getdata()
		elseif inv_items[k].of_getdata() > inv_items[j].of_getdata() then
			la_pivot = inv_items[k].of_getdata()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[k])
		else
			la_pivot = inv_items[j].of_getdata()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[j])
		end if
	else
		if inv_items[k].of_getdata() > inv_items[j].of_getdata() then
			la_pivot = inv_items[j].of_getdata()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[j])
		elseif inv_items[k].of_getdata() > inv_items[i].of_getdata() then
			la_pivot = inv_items[k].of_getdata()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[k])
		else
			la_pivot = inv_items[i].of_getdata()
		end if
	end if
	
	do while i < j
		do while inv_items[i].of_getdata() >= la_pivot
			i ++
		loop

		do while inv_items[j].of_getdata() <= la_pivot
			j --
		loop
		
		if i < j then
			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[i], inv_items[j])
		end if
	loop

	// Échanger les valeurs des vercteurs 1 et 2
	swap(inv_items[ai_g], inv_items[j])
	
	of_quicksortdd(ai_g, j - 1)
	of_quicksortdd(j + 1, ai_d)
end if

end subroutine

protected subroutine of_quicksortlc (unsignedinteger ai_g, unsignedinteger ai_d);string ls_pivot
uint i, j, k

if ai_g = ai_d - 1 then
	if inv_items[ai_g].of_getlabel() > inv_items[ai_d].of_getlabel() then
		// Échanger les valeurs des vercteurs 1 et 2
		swap(inv_items[ai_g], inv_items[ai_d])
	end if
elseif ai_g < ai_d then
	// Sélection du pivot
	k = int((ai_g + ai_d) / 2)
	i = ai_g
	j = ai_d
	
	if inv_items[i].of_getlabel() < inv_items[j].of_getlabel() then
		if inv_items[k].of_getlabel() < inv_items[i].of_getlabel() then
			ls_pivot = inv_items[i].of_getlabel()
		elseif inv_items[k].of_getlabel() < inv_items[j].of_getlabel() then
			ls_pivot = inv_items[k].of_getlabel()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[k])
		else
			ls_pivot = inv_items[j].of_getlabel()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[j])
		end if
	else
		if inv_items[k].of_getlabel() < inv_items[j].of_getlabel() then
			ls_pivot = inv_items[j].of_getlabel()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[j])
		elseif inv_items[k].of_getlabel() < inv_items[i].of_getlabel() then
			ls_pivot = inv_items[k].of_getlabel()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[k])
		else
			ls_pivot = inv_items[i].of_getlabel()
		end if
	end if
	
	do while i < j
		do while inv_items[i].of_getlabel() <= ls_pivot
			i ++
		loop

		do while inv_items[j].of_getlabel() >= ls_pivot
			j --
		loop
		
		if i < j then
			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[i], inv_items[j])
		end if
	loop

	// Échanger les valeurs des vercteurs 1 et 2
	swap(inv_items[ai_g], inv_items[j])
	
	of_quicksortlc(ai_g, j - 1)
	of_quicksortlc(j + 1, ai_d)
end if

end subroutine

protected subroutine of_quicksortld (unsignedinteger ai_g, unsignedinteger ai_d);string ls_pivot
uint i, j, k

if ai_g = ai_d - 1 then
	if inv_items[ai_g].of_getlabel() < inv_items[ai_d].of_getlabel() then
		// Échanger les valeurs des vercteurs 1 et 2
		swap(inv_items[ai_g], inv_items[ai_d])
	end if
elseif ai_g < ai_d then
	// Sélection du pivot
	k = int((ai_g + ai_d) / 2)
	i = ai_g
	j = ai_d
	
	if inv_items[i].of_getlabel() > inv_items[j].of_getlabel() then
		if inv_items[k].of_getlabel() > inv_items[i].of_getlabel() then
			ls_pivot = inv_items[i].of_getlabel()
		elseif inv_items[k].of_getlabel() > inv_items[j].of_getlabel() then
			ls_pivot = inv_items[k].of_getlabel()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[k])
		else
			ls_pivot = inv_items[j].of_getlabel()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[j])
		end if
	else
		if inv_items[k].of_getlabel() > inv_items[j].of_getlabel() then
			ls_pivot = inv_items[j].of_getlabel()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[j])
		elseif inv_items[k].of_getlabel() > inv_items[i].of_getlabel() then
			ls_pivot = inv_items[k].of_getlabel()

			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[ai_g], inv_items[k])
		else
			ls_pivot = inv_items[i].of_getlabel()
		end if
	end if
	
	do while i < j
		do while inv_items[i].of_getlabel() >= ls_pivot
			i ++
		loop

		do while inv_items[j].of_getlabel() <= ls_pivot
			j --
		loop
		
		if i < j then
			// Échanger les valeurs des vercteurs 1 et 2
			swap(inv_items[i], inv_items[j])
		end if
	loop

	// Échanger les valeurs des vercteurs 1 et 2
	swap(inv_items[ai_g], inv_items[j])
	
	of_quicksortld(ai_g, j - 1)
	of_quicksortld(j + 1, ai_d)
end if

end subroutine

public function integer of_selectitem (any aa_item, integer ai_index, boolean ab_label);// Trouve et sélectionne le premier item dont l'étiquette commence par aa_item
// ou dont les données sont aa_item après l'indice ai_index.
return of_selectItem(aa_item, ai_index, ab_label, false)

end function

public function integer of_selecteditem ();// Retourne l'indice de l'item sélectionné
return ii_selectedItem

end function

public function string of_getlabel (integer ai_index);// Retourne l'étiquette de l'item à la position ai_index s'il existe
// Retourne '' sinon
// Retourne Null si ai_index est null

string ls_label

setNull(ls_label)
if isNull(ai_index) then return ls_label

if ai_index < 1 or ai_index > upperbound(inv_items) then return ''

return inv_items[ai_index].of_getlabel()

end function

public function any of_getdata (integer ai_index);// Retourne les données de l'item à la position ai_index s'il existe
// Retourne Null sinon ou si ai_index est null

any la_data

setNull(la_data)
if isNull(ai_index) then return la_data

if ai_index < 1 or ai_index > upperbound(inv_items) then return la_data

return inv_items[ai_index].of_getdata()

end function

public function any of_getselecteddata ();// Retourne les données de l'item courrant s'il existe
// Retourne Null sinon ou si aucun item n'est sélectionné

any la_data

setNull(la_data)
if isNull(ii_selectedItem) then return la_data

if ii_selectedItem < 1 or ii_selectedItem > upperbound(inv_items) then return la_data

return inv_items[ii_selectedItem].of_getdata()

end function

public function any of_getselectedlabel ();// Retourne l'étiquette de l'item courrant s'il existe
// Retourne '' sinon ou si aucun item n'est sélectionné

if isNull(ii_selectedItem) then return ''

if ii_selectedItem < 1 or ii_selectedItem > upperbound(inv_items) then return ''

return inv_items[ii_selectedItem].of_getlabel()

end function

public function integer of_selectitem (integer ai_index);// Sélectionne l'item à l'indice ai_index.
integer li_index

setNull(li_index)

if isNull(ai_index) then return li_index

li_index = selectItem(ai_index)

if li_index > 0 then	ii_selectedItem = li_index

return li_index

end function

public function integer of_finditem (any aa_item, integer ai_index, boolean ab_label, boolean ab_exact);// Trouve le premier item dont l'étiquette est ou commence par aa_item
// ou dont les données sont aa_item après l'indice ai_index.
integer i, li_nbitems, li_idxtmp

setNull(i)

if isNull(aa_item) then return i
if isNull(ai_index) then return i
if isNull(ab_label) then return i
if isNull(ab_exact) then return i

li_nbitems = upperbound(inv_items)
if ai_index < 0 or ai_index >= li_nbitems then ai_index = 0

if ab_label then
	if classname(aa_item) <> 'string' then return -1
	
	if ab_exact then
		for i = 0 to li_nbitems - 1
			li_idxtmp = mod(ai_index + i, li_nbitems) + 1
			if inv_items[li_idxtmp].of_getlabel() = string(aa_item) then return li_idxtmp
		next
	else
		for i = 0 to li_nbitems - 1
			li_idxtmp = mod(ai_index + i, li_nbitems) + 1
			if left(inv_items[li_idxtmp].of_getlabel(), len(string(aa_item))) = string(aa_item) then return li_idxtmp
		next
	end if
else
	for i = 0 to li_nbitems - 1
		li_idxtmp = mod(ai_index + i, li_nbitems) + 1
		if inv_items[li_idxtmp].of_getdata() = aa_item then return li_idxtmp
	next
end if

return -1

end function

public function integer of_selectitem (any aa_item, integer ai_index, boolean ab_label, boolean ab_exact);// Trouve et sélectionne le premier item dont l'étiquette est ou commence par aa_item
// ou dont les données sont aa_item après l'indice ai_index.
integer li_index

li_index = of_findItem(aa_item, ai_index, ab_label, ab_exact)

if isNull(li_index) then return li_index

if li_index > 0 then ii_selectedItem = selectItem(li_index)

return li_index

end function

public function boolean of_getblankopt (ref any aa_value);// Retourne la propriété blank option et, si blankopt est vrai, place
// la valeur de l'option vide dans l'argument aa_value passé par référence,
// sinon, l'argument aa_value est initialisé à null

if ib_blankopt then
	aa_value = ia_blankoptvalue
end if

return ib_blankopt

end function

public function integer of_setblankopt (boolean ab_blankopt, any aa_value);// Affecte l'option vide ainsi que la valeur retournée quand l'utilisateur la choisit.
// Si on lui donne la valeur false, élimine l'option vide de la liste
//
// Retourne un entier :
// 1 - success
// -1 - échec, peut être un argument invalide
//
// Note : attention, c'est un any qui est passé en paramètre, on doit donc s'assurer
// de fournir un paramètre du bon type explicitement car on ne peut plus changer
// le type par la suite

long ll_index
integer i

setNull(i)

if isNull(ab_blankopt) then return i

if ab_blankopt and not ib_blankopt then
	if of_insertItem("", aa_value, 1) > 0 then
		ia_blankoptvalue = aa_value
		ib_blankopt = true
		return 1
	else
		return -1
	end if
elseif not ab_blankopt and ib_blankopt then
	ll_index = of_findItem("", 0, true, true)
	if ia_blankoptvalue = of_getdata(ll_index) then
		if of_deleteItem(ll_index) >= 0 then
			setNull(ia_blankoptvalue)
			ib_blankopt = false
			return 1
		else
			return -1
		end if
	else
		return -1
	end if
end if

return 1

end function

public function integer of_deleteitem (any aa_item, integer ai_index, boolean ab_label, boolean ab_exact);// Supprime le premier item dont l'étiquette est ou commence par aa_item
// ou dont les données sont aa_item après l'indice ai_index, puis décale les autres.
integer li_index

li_index = of_findItem(aa_item, ai_index, ab_label, ab_exact)

if isNull(li_index) then return li_index

if li_index > 0 then return of_deleteitem(li_index) else return -1

end function

public function integer of_deleteitem (any aa_item, integer ai_index, boolean ab_label);// Supprime le premier item dont l'étiquette commence par aa_item
// ou dont les données sont aa_item après l'indice ai_index, puis décale les autres.
return of_deleteItem(aa_item, ai_index, ab_label, false)

end function

public function integer of_setblankopt (boolean ab_blankopt);// Affecte l'option vide ainsi que la valeur retournée quand l'utilisateur la choisit.
// Si on lui donne la valeur false, élimine l'option vide de la liste
//
// Retourne un entier :
// 1 - success
// -1 - échec, peut être un argument invalide

any la_null

setNull(la_null)

return of_setblankopt(ab_blankopt, la_null)

end function

on pro_u_ddlb.create
call super::create
end on

on pro_u_ddlb.destroy
call super::destroy
end on

event constructor;call super::constructor;sorted = false

end event

event selectionchanged;call super::selectionchanged;ii_selectedItem = index

end event

