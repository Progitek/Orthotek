﻿$PBExportHeader$pro_graphe.sru
forward
global type pro_graphe from nonvisualobject
end type
end forward

global type pro_graphe from nonvisualobject autoinstantiate
end type

type variables
protected:

boolean ib_oriente = false		// Si le graphe est orienté
boolean ib_pondere = true		// Si le graphe est pondéré
boolean ib_etiquete = false	// Si le graphe est étiqueté

n_cst_list inv_noeuds				// Liste des noeuds
n_cst_list inv_aretes				// Liste des arêtes

end variables

forward prototypes
public function long of_destroy ()
public function integer of_retirernoeud (ref n_cst_linkedlistnode anv_noeud)
public function boolean of_estoriente ()
public function boolean of_estpondere ()
public function boolean of_estvide ()
public function integer of_asgoriente (boolean ab_int)
public function integer of_asgpondere (boolean ab_int)
public function integer of_retirerarete (ref n_cst_linkedlistnode anv_arete)
public function long of_successeurs (n_cst_linkedlistnode anv_noeud, ref n_cst_linkedlistnode anv_successeurs[])
public function integer of_fermeturetransitive (ref pro_graphe anv_fermeture)
public function long of_predecesseurs (n_cst_linkedlistnode anv_noeud, ref n_cst_linkedlistnode anv_predecesseurs[])
public function integer of_ajouterarete (n_cst_linkedlistnode anv_noeudorigine, n_cst_linkedlistnode anv_noeudfin)
public function integer of_ajouternoeud (n_cst_linkedlistnode anv_nouveaunoeud)
public function boolean of_contient (n_cst_linkedlistnode anv_noeudouarete)
public function integer of_degre (n_cst_linkedlistnode anv_noeud, ref long al_degre)
public function integer of_degreentrant (n_cst_linkedlistnode anv_noeud, ref long al_degre)
public function integer of_degresortant (n_cst_linkedlistnode anv_noeud, ref long al_degre)
public function integer of_ajouterarete (n_cst_linkedlistnode anv_noeudorigine, n_cst_linkedlistnode anv_noeudfin, double ad_poids)
public function integer of_obtenirnoeud (ref n_cst_linkedlistnode anv_noeud, n_cst_linkedlistnode anv_cle)
public function boolean of_estetiquete ()
public function integer of_asgetiquete (boolean ab_int)
public function integer of_ajouterarete (n_cst_linkedlistnode anv_noeudorigine, n_cst_linkedlistnode anv_noeudfin, double ad_poids, string as_etiquette)
public function integer of_ajouterarete (n_cst_linkedlistnode anv_noeudorigine, n_cst_linkedlistnode anv_noeudfin, string as_etiquette)
public function integer of_ajouternoeud (any aa_data, string as_cle)
public function integer of_ajouternoeud (any aa_data)
public function integer of_estconnexe ()
public function long of_compte ()
public function integer of_retirernoeud (string as_cle)
protected function long of_marche (n_cst_linkedlistnode anv_depart, n_cst_linkedlistnode anv_arrivee)
public function long of_obtenir (ref n_cst_linkedlistnode anv_liste[])
public function long of_obtenirarete (ref n_cst_linkedlistnode anv_arete[], n_cst_linkedlistnode anv_cleorigine, n_cst_linkedlistnode anv_clefin)
public function double of_chemin (n_cst_linkedlistnode anv_depart, n_cst_linkedlistnode anv_arrivee)
public function long of_aretesentrantes (n_cst_linkedlistnode anv_noeud, ref n_cst_linkedlistnode anv_aretes[])
public function long of_aretessortantes (n_cst_linkedlistnode anv_noeud, ref n_cst_linkedlistnode anv_aretes[])
public function integer of_ajouterarete (n_cst_linkedlistnode anv_nouvellearete)
end prototypes

public function long of_destroy ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Destroy
//
//	Access:  public
//
//	Arguments : None
//
//	Returns:  
//	long : the number of nodes destroyed in the list
//	-1 error.
//	
//	Description:  
//	Destroys all of the nodes in the list
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

If inv_aretes.of_destroy() = -1 Then Return -1

Return inv_noeuds.of_destroy()

end function

public function integer of_retirernoeud (ref n_cst_linkedlistnode anv_noeud);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RetirerNoeud
//
//	Access:  Public
//
//	Arguments : 
//	anv_noeud  (by ref) The actual node to be removed from the list.
//
//	Returns:  integer
//	1 = success
//	-1 = failure
//
//	Description:  
//	Removes the passed in node from the list, resetting any nodes previous 
//	and after that point to it. 
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_listearetes[]
long i
any la_tmp, la_vide
string ls_cle
string ls_clenoeud

// Validation des arguments
If isNull(anv_noeud) Or Not isValid(anv_noeud) Then Return -1

// Récupérer la clé du noeud à retirer
anv_noeud.of_getKey(la_tmp)
ls_clenoeud = string(la_tmp)

inv_aretes.of_get(lnv_listearetes)

// Retirer toutes les arêtes qui ont anv_noeud comme extrémité
For i = 1 To upperbound(lnv_listearetes)
	// Comparer les clés du noeud t de l'arête
	la_tmp = la_vide
	lnv_listearetes[i].of_getKey(la_tmp)
	ls_cle = string(la_tmp)
	If ls_clenoeud = left(ls_cle, pos(ls_cle, '~r~n') - 1) &
	Or ls_clenoeud = mid(ls_cle, pos(ls_cle, '~r~n') + 2) Then
		inv_aretes.of_remove(lnv_listearetes[i])
		// Supprimer l'arête de la mémoire
		Destroy lnv_listearetes[i]
	End If
Next

Return inv_noeuds.of_Remove(anv_noeud)

end function

public function boolean of_estoriente ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_EstOriente
//
//	Access:
//	Public
//
//	Arguments: None
//
//	Returns: boolean
//	State of option
//
//	Description:
//	Returns the state of the ib_sorted instance variable.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

return ib_oriente
end function

public function boolean of_estpondere ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_EstPondere
//
//	Access:
//	Public
//
//	Arguments: None
//
//	Returns: boolean
//	State of option
//
//	Description:
//	Returns the state of the ib_sorted instance variable.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

return ib_pondere
end function

public function boolean of_estvide ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_EstVide
//
//	Access:  public
//
//	Arguments : None
//
//	Returns:  boolean
//	True - The List is empty.
// False - The List has at least one node.
//
//	Description:  
//	Determines if the list is currently empty.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Return inv_noeuds.of_isempty() And inv_aretes.of_isempty()
end function

public function integer of_asgoriente (boolean ab_int);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_AsgOriente
//
//	Access:
//	Public
//
//	Arguments:
//	ab_int  State of option
//
//	Returns: integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Called to make graph oriented or not oriented.
//	Only applicable to empty lists.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

// Validate parameters.
if IsNull(ab_int) then
	return -1
end if

If ib_oriente = ab_int Then
	Return 1
End If

//	Only applicable to empty lists.
If of_EstVide() Then 
	ib_oriente = ab_int
	Return 1
End If

Return -1
end function

public function integer of_asgpondere (boolean ab_int);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_AsgPondere
//
//	Access:
//	Public
//
//	Arguments:
//	ab_int  State of option
//
//	Returns: integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Called to make graph weighted or unweighted.
//	Only applicable to empty lists.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

// Validate parameters.
if IsNull(ab_int) then
	return -1
end if

If ib_pondere = ab_int Then
	Return 1
End If

//	Only applicable to empty lists.
If of_EstVide() Then 
	ib_pondere = ab_int
	Return 1
End If

Return -1
end function

public function integer of_retirerarete (ref n_cst_linkedlistnode anv_arete);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RetirerArete
//
//	Access:  Public
//
//	Arguments : 
//	anv_arrete  (by ref) The actual arête to be removed from the list.
//
//	Returns:  integer
//	1 = success
//	-1 = failure
//
//	Description:  
//	Removes the passed in node from the list, resetting any nodes previous 
//	and after that point to it. 
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

string ls_cle
string ls_origine
string ls_fin
any la_tmp
n_cst_linkedlistnode lnv_cle
n_cst_linkedlistnode lnv_arcinverse

If isNull(anv_arete) Or Not isValid(anv_arete) Then Return -1

If Not ib_oriente Then
	anv_arete.of_getkey(la_tmp)
	ls_cle = string(la_tmp)
	
	// Obtenir la cle du noeud d'origine
	ls_origine = left(ls_cle, pos(ls_cle, '~r~n') - 1)
	
	// Obtenir la cle du noeud de fin
	ls_fin = mid(ls_cle, pos(ls_cle, '~r~n') + 2)
	
	// Création de l'arrete ayant la clé à rechercher
	lnv_cle = create n_cst_linkedlistnode
	
	lnv_cle.of_setkey(ls_fin + '~r~n' + ls_origine)
	
	If inv_aretes.of_find(lnv_arcinverse, lnv_cle) = 1 then
		If inv_aretes.of_Remove(lnv_arcinverse) = -1 Then
			destroy lnv_cle
			Return -1
		End If
		
		// Supprimer l'arête de la mémoire
		Destroy lnv_arcinverse
		
		destroy lnv_cle
	Else
		destroy lnv_cle
		Return -1
	End If
End If

Return inv_aretes.of_Remove(anv_arete)

end function

public function long of_successeurs (n_cst_linkedlistnode anv_noeud, ref n_cst_linkedlistnode anv_successeurs[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_successeurs
//
//	Access:  public
//
//	Arguments : 
//	anv_noeud			noeud duquel on veut les successeurs.
//	anv_successeurs[]	(par référence) vecteur qui contiendra les successeurs du
//							noeud.
//
//	Returns:  long
//	Nombre de successeurs
//	-1 : échec
//
//	Description:  
//	Retourne les successeurs d'un noeud, soit le nombre d'arcs ou d'aretes qui
// ont ce noeud comme origine.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_cle
n_cst_linkedlistnode lnv_aretes[]
long ll_nbaretes, i, ll_count
string ls_cle, ls_clenoeud
any la_tmp, la_vide

// Intialise la variable
ll_count = 0

// Si le noeud n'est pas valide, la fonction échoue
If isNull(anv_noeud) Or Not isValid(anv_noeud) Then Return -1

// Si le noeud ne fait pas partie du graphe, la fonction échoue
If Not of_Contient(anv_noeud) Then Return -1

// Obtenir la cle du noeud
anv_noeud.of_getKey(la_tmp)
ls_clenoeud = string(la_tmp)

lnv_cle = create n_cst_linkedlistnode

ll_nbaretes = inv_aretes.of_get(lnv_aretes)
If ll_nbaretes = -1 Then Return -1

// Si le graphe est étiqueté
If ib_etiquete Then
	string ls_cleprec = ""
	
	// Parcourir les aretes en comptant celles qui ont le noeud comme origine
	For i = 1 To ll_nbaretes
		la_tmp = la_vide
		lnv_aretes[i].of_getKey(la_tmp)
		ls_cle = string(la_tmp)
		If ls_cle <> ls_cleprec Then
			If ls_clenoeud = left(ls_cle, pos(ls_cle, '~r~n') - 1) Then
				lnv_cle.of_setKey(mid(ls_cle, pos(ls_cle, '~r~n') + 2))
				ll_count ++
				// Ajouter le noeud au vecteur à retourner
				If inv_noeuds.of_find(anv_successeurs[ll_count], lnv_cle) = -1 Then
					Return -1
				End If
			End If
			
			ls_cleprec = ls_cle
		End If
	Next
Else
	// Parcourir les aretes en comptant celles qui ont le noeud comme origine
	For i = 1 To ll_nbaretes
		la_tmp = la_vide
		lnv_aretes[i].of_getKey(la_tmp)
		ls_cle = string(la_tmp)
		If ls_clenoeud = left(ls_cle, pos(ls_cle, '~r~n') - 1) Then
			lnv_cle.of_setKey(mid(ls_cle, pos(ls_cle, '~r~n') + 2))
			ll_count ++
			// Ajouter le noeud au vecteur à retourner
			If inv_noeuds.of_find(anv_successeurs[ll_count], lnv_cle) = -1 Then
				Return -1
			End If
		End If
	Next
End If

destroy lnv_cle

Return ll_count
end function

public function integer of_fermeturetransitive (ref pro_graphe anv_fermeture);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_FermetureTransitive
//
//	Access:  public
//
//	Arguments : 
// anv_fermeture		(par référence) Un graphe représentant la fermeture transitive
//							du graphe
//
//	Returns:  integer
//	1 = success
//	-1 = failure
//	
//	Description:
//	Crée et renvoie la fermeture transitive du graphe
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////


// Initialise le nouveau graphe
If Not isNull(anv_fermeture) Then
	If anv_fermeture.of_destroy() = -1 Then Return -1
End If

anv_fermeture = this

// À programmer si besoin !

Return 1

end function

public function long of_predecesseurs (n_cst_linkedlistnode anv_noeud, ref n_cst_linkedlistnode anv_predecesseurs[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_predecesseurs
//
//	Access:  public
//
//	Arguments : 
//	anv_noeud				noeud duquel on veut les prédécesseurs.
//	anv_predecesseurs[]	(par référence) vecteur qui contiendra les prédécesseurs
//								du noeud.
//
//	Returns:  long
//	Nombre de prédécesseurs
//	-1 : échec
//
//	Description:  
//	Retourne les prédécesseurs d'un noeud, soit les nombre d'arcs ou d'aretes qui
// ont ce noeud comme extrémité.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_cle
n_cst_linkedlistnode lnv_aretes[]
long ll_nbaretes, i, ll_count
string ls_cle, ls_clenoeud
any la_tmp, la_vide

// Intialise la variable
ll_count = 0

// Si le noeud n'est pas valide, la fonction échoue
If isNull(anv_noeud) Or Not isValid(anv_noeud) Then Return -1

// Si le noeud ne fait pas partie du graphe, la fonction échoue
If Not of_Contient(anv_noeud) Then Return -1

// Obtenir la cle du noeud
anv_noeud.of_getKey(la_tmp)
ls_clenoeud = string(la_tmp)

lnv_cle = create n_cst_linkedlistnode

ll_nbaretes = inv_aretes.of_get(lnv_aretes)
If ll_nbaretes = -1 Then Return -1

// Si le graphe est étiqueté
If ib_etiquete Then
	string ls_cleprec = ""
	
	// Parcourir les aretes en comptant celles qui ont le noeud comme origine
	For i = 1 To ll_nbaretes
		la_tmp = la_vide
		lnv_aretes[i].of_getKey(la_tmp)
		ls_cle = string(la_tmp)
		If ls_cle <> ls_cleprec Then
			If ls_clenoeud = mid(ls_cle, pos(ls_cle, '~r~n') + 2) Then
				lnv_cle.of_setKey(left(ls_cle, pos(ls_cle, '~r~n') - 1))
				ll_count ++
				// Ajouter le noeud au vecteur à retourner
				If inv_noeuds.of_find(anv_predecesseurs[ll_count], lnv_cle) = -1 Then
					Return -1
				End If
			End If
			
			ls_cleprec = ls_cle
		End If
	Next
Else
	// Parcourir les aretes en comptant celles qui ont le noeud comme fin
	For i = 1 To ll_nbaretes
		la_tmp = la_vide
		lnv_aretes[i].of_getKey(la_tmp)
		ls_cle = string(la_tmp)
		If ls_clenoeud = mid(ls_cle, pos(ls_cle, '~r~n') + 2) Then
			lnv_cle.of_setKey(left(ls_cle, pos(ls_cle, '~r~n') - 1))
			ll_count ++
			// Ajouter le noeud au vecteur à retourner
			If inv_noeuds.of_find(anv_predecesseurs[ll_count], lnv_cle) = -1 Then
				Return -1
			End If
		End If
	Next
End If

destroy lnv_cle

Return ll_count
end function

public function integer of_ajouterarete (n_cst_linkedlistnode anv_noeudorigine, n_cst_linkedlistnode anv_noeudfin);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ajouterarete
//
//	Access:  public
//
//	Arguments :  
//	anv_noeudorigine	le noeud d'où part l'arc ou l'arrete
// anv_noeudfin		le noeud où se termine l'arc ou l'arrete
//
//	Returns:  integer
//	1 = success
//	-1 = failure (could be duplicate on list that does not allow duplicates)
//
//	Description:  
//	Put a node on list.
//
//	Note:
//	Depending on attributes lists can allow duplicates.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Return of_ajouterarete(anv_noeudorigine, anv_noeudfin, 0, "")

end function

public function integer of_ajouternoeud (n_cst_linkedlistnode anv_nouveaunoeud);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ajouternoeud
//
//	Access:  public
//
//	Arguments :  
//	anv_nouveaunoeud noeudgraphe
//
//	Returns:  integer
//	1 = success
//	-1 = failure (could be duplicate on list that does not allow duplicates)
//
//	Description:  
//	Put a node on list.
//
//	Note:
//	Depending on attributes lists can allow duplicates.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Return inv_noeuds.of_Add(anv_nouveaunoeud)

end function

public function boolean of_contient (n_cst_linkedlistnode anv_noeudouarete);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Contient
//
//	Access:  public
//
//	Arguments : 
//	anv_noeudouarrete  Node contain data to search for.
//
//	Returns:  Boolean
//	True - Yes in list.
// False - Not found.
//
//	Description:  
//	Determines if the Key Values in the node passed in are already in the list.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Return inv_noeuds.of_isinlist(anv_noeudouarete) Or inv_aretes.of_isinlist(anv_noeudouarete)
end function

public function integer of_degre (n_cst_linkedlistnode anv_noeud, ref long al_degre);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_degre
//
//	Access:  public
//
//	Arguments : 
//	anv_noeud noeud duquel on veut le degré.
//	al_degre	 (par référence) degré du noeud.
//
//	Returns:  integer
//	 1 : succès
//	-1 : échec
//
//	Description:  
//	Retourne le degré d'un noeud, soit le nombre d'arcs ou d'aretes qui
// ont ce noeud comme extrémité.
//
//	Note:
// Même chose que le degré entrant et sortant si le graphe est non-orienté.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_noeud
n_cst_linkedlistnode lnv_aretes[]
long ll_nbaretes, i
string ls_cle, ls_clenoeud
any la_tmp, la_vide

// Intialise la variable
al_degre = 0

// Si le noeud n'est pas valide, la fonction échoue
If isNull(anv_noeud) Or Not isValid(anv_noeud) Then Return -1

// Si le noeud ne fait pas partie du graphe, la fonction échoue
If Not of_Contient(anv_noeud) Then Return -1

// Trouver le noeud dans le graphe
If inv_noeuds.of_find(lnv_noeud, anv_noeud) <> 1 Then Return -1

// Obtenir la cle du noeud
lnv_noeud.of_getKey(la_tmp)
ls_clenoeud = string(la_tmp)

ll_nbaretes = inv_aretes.of_get(lnv_aretes)
If ll_nbaretes = -1 Then Return -1

// Parcourir les aretes en comptant celles qui ont le noeud comme fin
For i = 1 To ll_nbaretes
	la_tmp = la_vide
	lnv_aretes[i].of_getKey(la_tmp)
	ls_cle = string(la_tmp)
	If ls_clenoeud = left(ls_cle, pos(ls_cle, '~r~n') - 1) Or &
		(ls_clenoeud = mid(ls_cle, pos(ls_cle, '~r~n') + 2) And ib_oriente) Then al_degre ++
Next

Return 1
end function

public function integer of_degreentrant (n_cst_linkedlistnode anv_noeud, ref long al_degre);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_degreentrant
//
//	Access:  public
//
//	Arguments : 
//	anv_noeud noeud duquel on veut le degré.
//	al_degre	 (par référence) degré entrant du noeud.
//
//	Returns:  integer
//	 1 : succès
//	-1 : échec
//
//	Description:  
//	Retourne le degré entrant d'un noeud, soit le nombre d'arcs ou d'aretes qui
// aboutissent à ce noeud.
//
//	Note:
// Même chose que le degré sortant si le graphe est non-orienté.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_noeud
n_cst_linkedlistnode lnv_aretes[]
long ll_nbaretes, i
string ls_cle, ls_clenoeud
any la_tmp, la_vide

// Intialise la variable
al_degre = 0

// Si le noeud n'est pas valide, la fonction échoue
If isNull(anv_noeud) Or Not isValid(anv_noeud) Then Return -1

// Si le noeud ne fait pas partie du graphe, la fonction échoue
If Not of_Contient(anv_noeud) Then Return -1

// Trouver le noeud dans le graphe
If inv_noeuds.of_find(lnv_noeud, anv_noeud) <> 1 Then Return -1

// Obtenir la cle du noeud
lnv_noeud.of_getKey(la_tmp)
ls_clenoeud = string(la_tmp)

ll_nbaretes = inv_aretes.of_get(lnv_aretes)
If ll_nbaretes = -1 Then Return -1

// Parcourir les aretes en comptant celles qui ont le noeud comme fin
For i = 1 To ll_nbaretes
	la_tmp = la_vide
	lnv_aretes[i].of_getKey(la_tmp)
	ls_cle = string(la_tmp)
	If ls_clenoeud = mid(ls_cle, pos(ls_cle, '~r~n') + 2) Then al_degre ++
Next

Return 1
end function

public function integer of_degresortant (n_cst_linkedlistnode anv_noeud, ref long al_degre);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_degresortant
//
//	Access:  public
//
//	Arguments : 
//	anv_noeud noeud duquel on veut le degré.
//	al_degre	 (par référence) degré sortant du noeud.
//
//	Returns:  integer
//	 1 : succès
//	-1 : échec
//
//	Description:  
//	Retourne le degré sortant d'un noeud, soit le nombre d'arcs ou d'aretes qui
// débutent à ce noeud.
//
//	Note:
// Même chose que le degré entrant si le graphe est non-orienté.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_noeud
n_cst_linkedlistnode lnv_aretes[]
long ll_nbaretes, i
string ls_cle, ls_clenoeud
any la_tmp, la_vide

// Intialise la variable
al_degre = 0

// Si le noeud n'est pas valide, la fonction échoue
If isNull(anv_noeud) Or Not isValid(anv_noeud) Then Return -1

// Si le noeud ne fait pas partie du graphe, la fonction échoue
If Not of_Contient(anv_noeud) Then Return -1

// Trouver le noeud dans le graphe
If inv_noeuds.of_find(lnv_noeud, anv_noeud) <> 1 Then Return -1

// Obtenir la cle du noeud
lnv_noeud.of_getKey(la_tmp)
ls_clenoeud = string(la_tmp)

ll_nbaretes = inv_aretes.of_get(lnv_aretes)
If ll_nbaretes = -1 Then Return -1

// Parcourir les aretes en comptant celles qui ont le noeud comme fin
For i = 1 To ll_nbaretes
	la_tmp = la_vide
	lnv_aretes[i].of_getKey(la_tmp)
	ls_cle = string(la_tmp)
	If ls_clenoeud = left(ls_cle, pos(ls_cle, '~r~n') - 1) Then al_degre ++
Next

Return 1
end function

public function integer of_ajouterarete (n_cst_linkedlistnode anv_noeudorigine, n_cst_linkedlistnode anv_noeudfin, double ad_poids);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ajouterarete
//
//	Access:  public
//
//	Arguments :  
//	anv_noeudorigine	le noeud d'où part l'arc ou l'arrete
// anv_noeudfin		le noeud où se termine l'arc ou l'arrete
// ad_poids				le poids de l'arc ou l'arrete
//
//	Returns:  integer
//	1 = success
//	-1 = failure (could be duplicate on list that does not allow duplicates)
//
//	Description:  
//	Put a node on list.
//
//	Note:
//	Depending on attributes lists can allow duplicates.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Return of_ajouterarete(anv_noeudorigine, anv_noeudfin, ad_poids, "")

end function

public function integer of_obtenirnoeud (ref n_cst_linkedlistnode anv_noeud, n_cst_linkedlistnode anv_cle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_obtenirnoeud
//
//	Access:  public
//
//	Arguments : 
//	anv_noeud	(par réference) noeud trouvée et renvoyée par le graphe.
//	anv_cle		Noeud contenant la clé à rechercher.
//
//	Returns:  Entier
//	 1 : trouvé
//	 0 : non trouvé
//	-1 : échec
//
//	Description:  
//	Trouve et retourne le noeud dont la clé est passée en paramètre.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Return inv_noeuds.of_find(anv_noeud, anv_cle)

end function

public function boolean of_estetiquete ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_EstEtiquete
//
//	Access:
//	Public
//
//	Arguments: None
//
//	Returns: boolean
//	State of option
//
//	Description:
//	Returns the state of the ib_etiquete instance variable.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

return ib_etiquete
end function

public function integer of_asgetiquete (boolean ab_int);//////////////////////////////////////////////////////////////////////////////
//
//	Function:
//	of_AsgEtiquete
//
//	Access:
//	Public
//
//	Arguments:
//	ab_int  State of option
//
//	Returns: integer
//	SUCCESS = 1
//	ERROR = -1
//
//	Description:
//	Called to make graph labelled or not labelled.
//	Only applicable to empty lists.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

// Validate parameters.
if IsNull(ab_int) then
	return -1
end if

If ib_etiquete = ab_int Then
	Return 1
End If

//	Only applicable to empty graphs.
If of_EstVide() Then 
	ib_etiquete = ab_int
	inv_aretes.of_setduplicatesallowed(ab_int)
	Return 1
End If

Return -1
end function

public function integer of_ajouterarete (n_cst_linkedlistnode anv_noeudorigine, n_cst_linkedlistnode anv_noeudfin, double ad_poids, string as_etiquette);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ajouterarete
//
//	Access:  public
//
//	Arguments :  
//	anv_noeudorigine	le noeud d'où part l'arc ou l'arête
// anv_noeudfin		le noeud où se termine l'arc ou l'arête
// ad_poids				le poids de l'arc ou l'arête
// as_etiquette		l'étiquette de l'arc ou l'arête
//
//	Returns:  integer
//	1 = success
//	-1 = failure (could be duplicate on list that does not allow duplicates)
//
//	Description:  
//	Put a node on list.
//
//	Note:
//	Depending on attributes lists can allow duplicates.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_arete
n_cst_linkedlistnode lnv_arete1
any la_tmp, la_vide
string ls_cleorigine
string ls_clefin
integer li_resajout1
integer li_resajout2 = 1

// Validation des arguments
If isNull(anv_noeudorigine) Or not isValid(anv_noeudorigine) Then Return -1
If isNull(anv_noeudfin) Or not isValid(anv_noeudfin) Then Return -1

anv_noeudorigine.of_getkey(la_tmp)
ls_cleorigine = string(la_tmp)
la_tmp = la_vide
anv_noeudfin.of_getkey(la_tmp)
ls_clefin = string(la_tmp)

lnv_arete = create n_cst_linkedlistnode

lnv_arete.of_setkey(ls_cleorigine + '~r~n' + ls_clefin)

// Si le graphe est étiqueté
If ib_etiquete Then
	str_aretedata lstr_donnees
	
	If isNull(as_etiquette) Then as_etiquette = ""
	
	lstr_donnees.s_etiquette = as_etiquette
	
	// Si le graphe est pondéré, on affecte le poids
	// Mais si le poids est null, on le remplace par 1
	If ib_pondere and not isNull(ad_poids) then
		lstr_donnees.db_poids = ad_poids
	else
		lstr_donnees.db_poids = 1
	end if
	
	lnv_arete.of_setdata(lstr_donnees)
Else
	// Si le graphe est pondéré, on affecte le poids
	// Mais si le poids est null, on le remplace par 1
	If ib_pondere and not isNull(ad_poids) then
		lnv_arete.of_setdata(ad_poids)
	else
		lnv_arete.of_setdata(1)
	end if
End If

li_resajout1 = inv_aretes.of_add(lnv_arete)

// Si l'ajout n'a pas fonctionné, détruire l'arête (pour libérer de l'espace mémoire)
If li_resajout1 = -1 Then
	destroy lnv_arete
End If

// Si le graphe n'est pas orienté, on ajoute l'arc dans l'autre sens, pour compléter l'arête
If Not ib_oriente Then
	lnv_arete1 = create n_cst_linkedlistnode
	la_tmp = la_vide
	lnv_arete.of_getData(la_tmp)
	lnv_arete1.of_setdata(la_tmp)
	lnv_arete1.of_setkey(ls_clefin + '~r~n' + ls_cleorigine)
	li_resajout2 = inv_aretes.of_add(lnv_arete1)

	// Si l'ajout n'a pas fonctionné, détruire l'arête (pour libérer de l'espace mémoire)
	If li_resajout2 = -1 Then
		destroy lnv_arete1
	End If
End If

If li_resajout1 + li_resajout2 = 2 Then Return 1 Else Return -1

end function

public function integer of_ajouterarete (n_cst_linkedlistnode anv_noeudorigine, n_cst_linkedlistnode anv_noeudfin, string as_etiquette);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ajouterarete
//
//	Access:  public
//
//	Arguments :  
//	anv_noeudorigine	le noeud d'où part l'arc ou l'arrete
// anv_noeudfin		le noeud où se termine l'arc ou l'arrete
// as_etiquette		l'étiquette de l'arc ou l'arrete
//
//	Returns:  integer
//	1 = success
//	-1 = failure (could be duplicate on list that does not allow duplicates)
//
//	Description:  
//	Put a node on list.
//
//	Note:
//	Depending on attributes lists can allow duplicates.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Return of_ajouterarete(anv_noeudorigine, anv_noeudfin, 0, as_etiquette)

end function

public function integer of_ajouternoeud (any aa_data, string as_cle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ajouternoeud
//
//	Access:  public
//
//	Arguments :  
//	aa_data	La donnée à mettre dans le noeud
// as_cle	La clé du noeud (valeur unique qui identifie le noeud)
//
//	Returns:  integer
//	1 = success
//	-1 = failure (could be duplicate on list that does not allow duplicates)
//
//	Description:  
//	Put a node on list.
//
//	Note:
//	Depending on attributes lists can allow duplicates.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_noeud

// Si la clé n'est pas valide
If isNull(as_cle) Then Return -1
If as_cle = "" Then Return -1

lnv_noeud = create n_cst_linkedlistnode

// Affecte les données et la clé au noeud nouvellement créé
lnv_noeud.of_setdata(aa_data)
lnv_noeud.of_setkey(as_cle)

// Ajoute le noeud
If inv_noeuds.of_Add(lnv_noeud) = -1 Then
	destroy lnv_noeud
	Return -1
Else
	Return 1
End If

end function

public function integer of_ajouternoeud (any aa_data);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ajouternoeud
//
//	Access:  public
//
//	Arguments :  
//	aa_data	La donnée à mettre dans le noeud
//
//	Returns:  integer
//	1 = success
//	-1 = failure (could be duplicate on list that does not allow duplicates)
//
//	Description:  
//	Ajoute un noeud au graphe en lui affectant un numéro séquentiel automatique.
//
//	Note:
//	Depending on attributes lists can allow duplicates.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_noeud
long ll_cle = 0

lnv_noeud = create n_cst_linkedlistnode

// Affecte les données au noeud nouvellement créé
lnv_noeud.of_setdata(aa_data)

// Affecte séquentiellement les nombres à partir de 1 à la clé du noeud à ajouter
// et teste si un noeud avec cette clé appartient déjà au graphe
do
	ll_cle ++
	lnv_noeud.of_setkey(string(ll_cle))
loop while inv_noeuds.of_isInList(lnv_noeud)

// Ajoute le noeud
If inv_noeuds.of_Add(lnv_noeud) = -1 Then
	destroy lnv_noeud
	Return  -1
Else
	Return 1
End If

end function

public function integer of_estconnexe ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_estConnexe
//
//	Access:  public
//
//	Arguments :  Aucun
//
//	Returns:  integer
//	2 = fortement connexe
// 1 = faiblement connexe
// 0 = non connexe
//	-1 = erreur
//
//	Description:  
//	Détermine si un graphe est connexe.
//
//	Note:
//	Un graphe est fortement connexe s'il existe un chemin entre chaque paire de
// noeuds, il est faiblement connexe s'il est orienté et qu'il existe une
// connexion (dans un sens ou dans l'autre) entre chaque paire de noeuds et
// il n'est pas connexe s'il y a au moins un noeud qui ne peut être atteint à
// partir d'un autre et que cet autre ne peut être atteint à partir du premier.
//
//////////////////////////////////////////////////////////////////////////////

integer li_con = 2, i, j, li_res1, li_res2
n_cst_linkedlistnode lnv_liste[]

inv_noeuds.of_get(lnv_liste)

// Pour chaque noeud dans le graphe
For i = 1 To upperbound(lnv_liste) - 1
	// Pour chaque autre noeud dans le graphe
	For j = i + 1 To upperbound(lnv_liste)
		// Calculer les chemins entre les 2 noeuds
		li_res1 = of_chemin(lnv_liste[i], lnv_liste[j])
		li_res2 = of_chemin(lnv_liste[j], lnv_liste[i])
		If li_res1 = -2 Or li_res2 = -2 Then Return -1
		
		// S'il n'y a pas de chemin entre les noeuds A et B ou entre
		// les noeuds B et A, le graphe ne peut être fortement connexe
		If li_res1 < 0 Or li_res2 < 0 Then li_con = 1
		
		// S'il n'y a pas de chemin entre les noeuds A et B ni entre
		// les noeuds B et A, on vérifie qu'il y a une marche entre
		// les noeuds A et B
		If li_res1 < 0 And li_res2 < 0 Then
			li_res1 = of_marche(lnv_liste[i], lnv_liste[j])
			Choose Case li_res1
				Case -2
					Return -1
				Case -1
					// S'il n'y a pas de marche, le graphe est non connexe
					Return 0
			End Choose
		End If
	Next
Next

Return li_con

end function

public function long of_compte ();//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_compte
//
//	Access:  public
//
//	Arguments :  Aucun
//
//	Returns:  integer
//	Nombre de noeuds dans le graphe
//
//	Description:  
//	Retourne le nombre de noeuds dans le graphe.
//
//////////////////////////////////////////////////////////////////////////////

Return inv_noeuds.of_count()

end function

public function integer of_retirernoeud (string as_cle);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_RetirerNoeud
//
//	Access:  Public
//
//	Arguments : 
//	as_cle  la clé du noeud à retirer.
//
//	Returns:  integer
//	1 = success
//	-1 = failure
//
//	Description:  
//	Removes the passed in node from the list, resetting any nodes previous 
//	and after that point to it. 
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_listearetes[]
n_cst_linkedlistnode lnv_noeud
n_cst_linkedlistnode lnv_cle
long i
any la_tmp, la_vide
string ls_cle

// Validation des arguments
If isNull(as_cle) Then Return -1
If as_cle = "" Then Return -1

// Récupérer le noeud à retirer
lnv_cle = create n_cst_linkedlistnode
lnv_cle.of_setKey(as_cle)

i = of_obtenirnoeud(lnv_noeud, lnv_cle)
If i = 0 Then Return 1
If i = -1 Then Return -1

inv_aretes.of_get(lnv_listearetes)

// Retirer toutes les arêtes qui ont anv_noeud comme extrémité
For i = 1 To upperbound(lnv_listearetes)
	// Comparer les clés du noeud t de l'arête
	la_tmp = la_vide
	lnv_listearetes[i].of_getKey(la_tmp)
	ls_cle = string(la_tmp)
	If as_cle = left(ls_cle, pos(ls_cle, '~r~n') - 1) &
	Or as_cle = mid(ls_cle, pos(ls_cle, '~r~n') + 2) Then
		inv_aretes.of_remove(lnv_listearetes[i])
	End If
Next

Return inv_noeuds.of_Remove(lnv_noeud)

end function

protected function long of_marche (n_cst_linkedlistnode anv_depart, n_cst_linkedlistnode anv_arrivee);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_marche
//
//	Access:  protected
//
//	Arguments :  
//	anv_depart		le noeud d'où part la marche
// anv_arrivee		le noeud où se termine la amrche
//
//	Returns:  double
//	La longueur de la marche entre anv_depart et anv_arrivee
// 0 = anv_depart est égal à anv_arrivee
// -1 = Il n'existe pas de marche entre anv_depart et anv_arrivee
//	-2 = erreur
//
//	Description:  
//	Retourne la longueur (s'il y a lieu), en poids, de la marche la plus
// courte entre 2 noeuds.
//
//	Note:
// Effectue une recherche en largeur
//
//////////////////////////////////////////////////////////////////////////////

long i, j
double ldb_lng
double ldb_minpoids
any la_tmp, la_vide
str_aretedata lstr_data
n_cst_list lnv_ouvert
n_cst_list lnv_ferme
n_cst_linkedlistnode lnv_noeudouvert
n_cst_linkedlistnode lnv_cle
n_cst_linkedlistnode lnv_predetsuc[]
n_cst_linkedlistnode lnv_aretespes[]
n_cst_linkedlistnode lnv_vide[]
n_cst_linkedlistnodecompare lnv_compare

// Valide les arguments
If isNull(anv_depart) Or Not isValid(anv_depart) Then Return -2
If isNull(anv_arrivee) Or Not isValid(anv_arrivee) Then Return -2

If Not inv_noeuds.of_isinlist(anv_depart) Then Return -2
If Not inv_noeuds.of_isinlist(anv_arrivee) Then Return -2

// Initialise les listes de noeuds ouverts et fermés
lnv_ouvert.of_setsorted(true)
lnv_ouvert.of_setduplicatesallowed(true)
lnv_ferme.of_setsorted(true)
lnv_ferme.of_setduplicatesallowed(false)

// Initialise l'objet de comparaison
lnv_compare = Create n_cst_linkedlistnodecompare

// Ajoute le noeud de départ dans la file des noeuds ouverts
lnv_noeudouvert = Create n_cst_linkedlistnode
anv_depart.of_getKey(la_tmp)
lnv_noeudouvert.of_setData(la_tmp)
lnv_noeudouvert.of_setKey(0) // Profondeur de 0 (c'est le noeud de départ)
lnv_ouvert.of_add(lnv_noeudouvert)

// Boucler tant que la file de noeuds n'est pas vide
Do While Not lnv_ouvert.of_isEmpty()
	// Récupérer le premier noeud de la file
	If lnv_ouvert.of_removehead(lnv_noeudouvert) = -1 Then
		lnv_ouvert.of_destroy()
		lnv_ferme.of_destroy()
		Destroy lnv_compare
		Destroy lnv_cle
		Return -2
	End If
	
	// Initialise le noeud de comparaison
	lnv_cle = Create n_cst_linkedlistnode
	
	// Affecter la clé
	la_tmp = la_vide
	lnv_noeudouvert.of_getData(la_tmp)
	lnv_cle.of_setKey(la_tmp)
	
	// Récupérer la profondeur du noeud ouvert
	la_tmp = la_vide
	lnv_noeudouvert.of_getKey(la_tmp)
	ldb_lng = double(la_tmp)
	
	Destroy lnv_noeudouvert

	// Si on ne l'a pas déjà étudié
	If lnv_ferme.of_isInList(lnv_cle) Then
		Destroy lnv_cle
	Else
		// Si c'est le noeud qu'on cherche
		If lnv_compare.of_compare(lnv_cle, anv_arrivee) = lnv_compare.EQUAL Then
			lnv_ouvert.of_destroy()
			lnv_ferme.of_destroy()
			Destroy lnv_compare
			Destroy lnv_cle
			Return ldb_lng
		End If
		
		// L'ajouter à la liste des noeuds étudiés
		If lnv_ferme.of_add(lnv_cle) = -1 Then
			lnv_ouvert.of_destroy()
			lnv_ferme.of_destroy()
			Destroy lnv_compare
			Destroy lnv_cle
			Return -2
		End If
		
		// Récupérer les prédécesseurs du noeud ouvert
		lnv_predetsuc = lnv_vide
		If of_predecesseurs(lnv_cle, lnv_predetsuc) = -1 Then
			lnv_ouvert.of_destroy()
			lnv_ferme.of_destroy()
			Destroy lnv_compare
			Destroy lnv_cle
			Return -2
		End If

		// Ajouter tous les prédécesseurs du noeud ouvert à la file en leur affectant
		// une profondeur de 1 plus grande que celle du noeud ouvert
		For i = 1 To upperbound(lnv_predetsuc)
			lnv_aretespes = lnv_vide

			// Récupérer le poids de l'arête entre le noeud et son successeur
			If of_obtenirarete(lnv_aretespes, lnv_predetsuc[i], lnv_cle) < 1 Then
				lnv_ouvert.of_destroy()
				lnv_ferme.of_destroy()
				Destroy lnv_compare
				Destroy lnv_cle
				Return -2
			End If
			
			// Trouver l'arête au poids le plus faible
			// Si le graphe est étiqueté, il peut avoir plusieurs arêtes entre 2 noeuds
			If ib_etiquete Then
				la_tmp = la_vide
				lnv_aretespes[1].of_getData(la_tmp)
				lstr_data = la_tmp
				// Faire du poids de la première arête le poids minimal
				ldb_minpoids = lstr_data.db_poids

				For j = 2 To upperBound(lnv_aretespes)
					la_tmp = la_vide
					lnv_aretespes[j].of_getData(la_tmp)
					lstr_data = la_tmp
					// Si cette arête a un poids inférieur au poids minimal trouvé
					If lstr_data.db_poids < ldb_minpoids Then
						// En faire le nouveau poids minimal
						ldb_minpoids = lstr_data.db_poids
					End If
				Next
			Else
				// Si Le graphe n'est pas étiqueté, il n'y a qu'une arête possible
				// entre 2 noeuds donnés, alors prendre la première
				la_tmp = la_vide
				lnv_aretespes[1].of_getData(la_tmp)
				ldb_minpoids = double(la_tmp)
			End If

			lnv_noeudouvert = create n_cst_linkedlistnode
			
			// Donner la nouvelle distance au successeur
			lnv_noeudouvert.of_setKey(ldb_lng + ldb_minpoids)
			
			la_tmp = la_vide
			lnv_predetsuc[i].of_getKey(la_tmp)
			lnv_noeudouvert.of_setData(la_tmp)
			lnv_ouvert.of_add(lnv_noeudouvert)
		Next
		
		// Récupérer les successeurs du noeud ouvert
		lnv_predetsuc = lnv_vide
		If of_successeurs(lnv_cle, lnv_predetsuc) = -1 Then
			lnv_ouvert.of_destroy()
			lnv_ferme.of_destroy()
			Destroy lnv_compare
			Destroy lnv_cle
			Return -2
		End If
		
		// Ajouter tous les successeurs du noeud ouvert à la file en leur affectant
		// une profondeur de 1 plus grande que celle du noeud ouvert
		For i = 1 To upperbound(lnv_predetsuc)
			lnv_aretespes = lnv_vide
			
			// Récupérer le poids de l'arête entre le noeud et son successeur
			If of_obtenirarete(lnv_aretespes, lnv_cle, lnv_predetsuc[i]) < 1 Then
				lnv_ouvert.of_destroy()
				lnv_ferme.of_destroy()
				Destroy lnv_compare
				Destroy lnv_cle
				Return -2
			End If
			
			// Trouver l'arête au poids le plus faible
			// Si le graphe est étiqueté, il peut avoir plusieurs arêtes entre 2 noeuds
			If ib_etiquete Then
				la_tmp = la_vide
				lnv_aretespes[1].of_getData(la_tmp)
				lstr_data = la_tmp
				// Faire du poids de la première arête le poids minimal
				ldb_minpoids = lstr_data.db_poids

				For j = 2 To upperBound(lnv_aretespes)
					la_tmp = la_vide
					lnv_aretespes[j].of_getData(la_tmp)
					lstr_data = la_tmp
					// Si cette arête a un poids inférieur au poids minimal trouvé
					If lstr_data.db_poids < ldb_minpoids Then
						// En faire le nouveau poids minimal
						ldb_minpoids = lstr_data.db_poids
					End If
				Next
			Else
				// Si Le graphe n'est pas étiqueté, il n'y a qu'une arête possible
				// entre 2 noeuds donnés, alors prendre la première
				la_tmp = la_vide
				lnv_aretespes[1].of_getData(la_tmp)
				ldb_minpoids = double(la_tmp)
			End If

			lnv_noeudouvert = create n_cst_linkedlistnode
			
			// Donner la nouvelle distance au successeur
			lnv_noeudouvert.of_setKey(ldb_lng + ldb_minpoids)
			
			la_tmp = la_vide
			lnv_predetsuc[i].of_getKey(la_tmp)
			lnv_noeudouvert.of_setData(la_tmp)
			lnv_ouvert.of_add(lnv_noeudouvert)
		Next
	End If
Loop

lnv_ferme.of_destroy()
Destroy lnv_compare
Return -1

end function

public function long of_obtenir (ref n_cst_linkedlistnode anv_liste[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_Obtenir
//
//	Access:  public
//
//	Arguments : 
//	anv_liste[]  (by reference) an array of nodes.
//
//	Returns:  long
//	The number of nodes in the list.
//  -1 : Error
//
//	Description:  
//	Retourne dans un vecteur dynamique tous les noeuds du graphe.
//
// Note:
//	
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Return inv_noeuds.of_get(anv_liste)
end function

public function long of_obtenirarete (ref n_cst_linkedlistnode anv_arete[], n_cst_linkedlistnode anv_cleorigine, n_cst_linkedlistnode anv_clefin);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_obtenirarete
//
//	Access:  public
//
//	Arguments : 
//	anv_arete		(par réference) vecteur d'arêtes trouvées et renvoyées par le graphe.
//	anv_cleorigine	Noeud contenant la clé de l'origine de l'arc (graphe oriente) ou
//						de l'une des extrêmité de l'arête (graphe non-orienté).
//	anv_clefin		Noeud contenant la clé de la fin de l'arc (graphe oriente) ou
//						de l'une des extrêmité de l'arête (graphe non-orienté).
//
//	Returns:  Long
//	 Nombre d'arêtes trouvées
//	 0 : non trouvé
//	-1 : échec
//
//	Description:  
//	Trouve et retourne l'arête dont les extrémités sont passées en paramètre.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

string ls_origine
string ls_fin
integer li_result
long ll_cpt = 1
any la_tmp, la_vide
n_cst_linkedlistnode lnv_cle
n_cst_linkedlistnode lnv_resultat

If isNull(anv_cleorigine) Or Not isValid(anv_cleorigine) Then Return -1
If isNull(anv_clefin) Or Not isValid(anv_clefin) Then Return -1

// Obtenir la cle du noeud d'origine
anv_cleorigine.of_getkey(la_tmp)
ls_origine = string(la_tmp)

// Obtenir la cle du noeud de fin
la_tmp = la_vide
anv_clefin.of_getkey(la_tmp)
ls_fin = string(la_tmp)

// Création de l'arrete ayant la clé à rechercher
lnv_cle = Create n_cst_linkedlistnode

lnv_cle.of_setkey(ls_origine + '~r~n' + ls_fin)

li_result = inv_aretes.of_find(lnv_resultat, lnv_cle)

// Si le graphe est étiqueté, il peut y en avoir plus
// Chercher les autres
If ib_etiquete Then
	// Tant qu'on en trouve
	do while li_result = 1
		// Affecte l'arête trouvée à la position suivante du vecteur
		anv_arete[ll_cpt] = lnv_resultat
		li_result = inv_aretes.of_find(lnv_resultat, lnv_cle, anv_arete[ll_cpt])
		ll_cpt ++
	loop
	
	Destroy lnv_cle
	
	// Si on a trouvé au moins une
	If upperbound(anv_arete) > 0 Then
		Return upperbound(anv_arete)
	Else
		Return li_result
	End If
else
	// Si une arête a été trouvée, l'affecter au premier élément du vecteur
	If li_result = 1 Then
		anv_arete[1] = lnv_resultat
	End If
	
	Destroy lnv_cle
	Return li_result
end if
end function

public function double of_chemin (n_cst_linkedlistnode anv_depart, n_cst_linkedlistnode anv_arrivee);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_chemin
//
//	Access:  public
//
//	Arguments :  
//	anv_depart		le noeud d'où part le chemin
// anv_arrivee		le noeud où se termine le chemin
//
//	Returns:  integer
//	La longueur du chemin entre anv_depart et anv_arrivee
// 0 = anv_depart est égal à anv_arrivee
// -1 = Il n'existe pas de chemin entre anv_depart et anv_arrivee
//	-2 = Erreur
//
//	Description:  
//	Retourne la longueur (s'il y a lieu), en nombre d'arêtes, du chemin le plus
// court entre 2 noeuds.
//
//	Note:
// Effectue une recherche en largeur
//
//////////////////////////////////////////////////////////////////////////////

long i, j
double ldb_lng
double ldb_minpoids
any la_tmp, la_vide
str_aretedata lstr_data
n_cst_list lnv_ouvert
n_cst_list lnv_ferme
n_cst_linkedlistnode lnv_noeudouvert
n_cst_linkedlistnode lnv_cle
n_cst_linkedlistnode lnv_successeurs[]
n_cst_linkedlistnode lnv_aretessucc[]
n_cst_linkedlistnode lnv_vide[]
n_cst_linkedlistnodecompare lnv_compare

// Valide les arguments
If isNull(anv_depart) Or Not isValid(anv_depart) Then Return -2
If isNull(anv_arrivee) Or Not isValid(anv_arrivee) Then Return -2

If Not inv_noeuds.of_isinlist(anv_depart) Then Return -2
If Not inv_noeuds.of_isinlist(anv_arrivee) Then Return -2

// Initialise les listes de noeuds ouverts et fermés
lnv_ouvert.of_setsorted(true)
lnv_ouvert.of_setduplicatesallowed(true)
lnv_ferme.of_setsorted(true)
lnv_ferme.of_setduplicatesallowed(false)

// Initialise l'objet de comparaison
lnv_compare = Create n_cst_linkedlistnodecompare

// Ajoute le noeud de départ dans la file des noeuds ouverts
lnv_noeudouvert = Create n_cst_linkedlistnode
anv_depart.of_getKey(la_tmp)
lnv_noeudouvert.of_setData(la_tmp)
lnv_noeudouvert.of_setKey(0) // Profondeur de 0 (c'est le noeud de départ)
lnv_ouvert.of_add(lnv_noeudouvert)

// Boucler tant que la file de noeuds n'est pas vide
Do While Not lnv_ouvert.of_isEmpty()
	// Récupérer le premier noeud de la file
	If lnv_ouvert.of_removehead(lnv_noeudouvert) = -1 Then
		Destroy lnv_compare
		Destroy lnv_cle
		Return -2
	End If
	
	// Initialise le noeud de comparaison
	lnv_cle = Create n_cst_linkedlistnode
	
	// Affecter la clé
	la_tmp = la_vide
	lnv_noeudouvert.of_getData(la_tmp)
	lnv_cle.of_setKey(la_tmp)

	// Récupérer la profondeur du noeud ouvert
	la_tmp = la_vide
	lnv_noeudouvert.of_getKey(la_tmp)
	ldb_lng = double(la_tmp)
	
	Destroy lnv_noeudouvert

	// Si on ne l'a pas déjà étudié
	If lnv_ferme.of_isInList(lnv_cle) Then
		Destroy lnv_cle
	Else
		// Si c'est le noeud qu'on cherche
		If lnv_compare.of_compare(lnv_cle, anv_arrivee) = lnv_compare.EQUAL Then
			lnv_ouvert.of_destroy()
			lnv_ferme.of_destroy()
			Destroy lnv_compare
			Destroy lnv_cle
			Return ldb_lng
		End If
		
		// L'ajouter à la liste des noeuds étudiés
		If lnv_ferme.of_add(lnv_cle) = -1 Then
			lnv_ouvert.of_destroy()
			lnv_ferme.of_destroy()
			Destroy lnv_compare
			Destroy lnv_cle
			Return -2
		End If
		
		// Récupérer les successeurs du noeud ouvert
		lnv_successeurs = lnv_vide
		If of_successeurs(lnv_cle, lnv_successeurs) = -1 Then
			lnv_ouvert.of_destroy()
			lnv_ferme.of_destroy()
			Destroy lnv_compare
			Destroy lnv_cle
			Return -2
		End If

		// Ajouter tous les successeurs du noeud ouvert à la file en leur affectant
		// une profondeur de 1 plus grande que celle du noeud ouvert
		For i = 1 To upperbound(lnv_successeurs)
			lnv_aretessucc = lnv_vide
			
			// Récupérer le poids de l'arête entre le noeud et son successeur
			If of_obtenirarete(lnv_aretessucc, lnv_cle, lnv_successeurs[i]) < 1 Then
				lnv_ouvert.of_destroy()
				lnv_ferme.of_destroy()
				Destroy lnv_compare
				Destroy lnv_cle
				Return -2
			End If
			
			// Trouver l'arête au poids le plus faible
			// Si le graphe est étiqueté, il peut avoir plusieurs arêtes entre 2 noeuds
			If ib_etiquete Then
				la_tmp = la_vide
				lnv_aretessucc[1].of_getData(la_tmp)
				lstr_data = la_tmp
				// Faire du poids de la première arête le poids minimal
				ldb_minpoids = lstr_data.db_poids

				For j = 2 To upperBound(lnv_aretessucc)
					la_tmp = la_vide
					lnv_aretessucc[j].of_getData(la_tmp)
					lstr_data = la_tmp
					// Si cette arête a un poids inférieur au poids minimal trouvé
					If lstr_data.db_poids < ldb_minpoids Then
						// En faire le nouveau poids minimal
						ldb_minpoids = lstr_data.db_poids
					End If
				Next
			Else
				// Si Le graphe n'est pas étiqueté, il n'y a qu'une arête possible
				// entre 2 noeuds donnés, alors prendre la première
				la_tmp = la_vide
				lnv_aretessucc[1].of_getData(la_tmp)
				ldb_minpoids = double(la_tmp)
			End If

			lnv_noeudouvert = create n_cst_linkedlistnode
			
			// Donner la nouvelle distance au successeur
			lnv_noeudouvert.of_setKey(ldb_lng + ldb_minpoids)
			
			la_tmp = la_vide
			lnv_successeurs[i].of_getKey(la_tmp)
			lnv_noeudouvert.of_setData(la_tmp)
			lnv_ouvert.of_add(lnv_noeudouvert)
		Next
	End If
Loop

lnv_ferme.of_destroy()
Destroy lnv_compare
Return -1

end function

public function long of_aretesentrantes (n_cst_linkedlistnode anv_noeud, ref n_cst_linkedlistnode anv_aretes[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_aretesEntrantes
//
//	Access:  public
//
//	Arguments : 
//	anv_noeud		noeud duquel on veut les arêtes entrantes.
//	anv_aretes[]	(par référence) vecteur qui contiendra les arêtes entrant
//						dans le noeud.
//
//	Returns:  long
//	Nombre d'arêtes entrantes
//	-1 : échec
//
//	Description:  
//	Retourne les arcs ou les arêtes qui ont un certain noeud comme extrémité.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_aretes[]
long ll_nbaretes, i, ll_count
string ls_cle, ls_clenoeud
any la_tmp, la_vide

// Intialise la variable
ll_count = 0

// Si le noeud n'est pas valide, la fonction échoue
If isNull(anv_noeud) Or Not isValid(anv_noeud) Then Return -1

// Si le noeud ne fait pas partie du graphe, la fonction échoue
If Not of_Contient(anv_noeud) Then Return -1

// Obtenir la cle du noeud
anv_noeud.of_getKey(la_tmp)
ls_clenoeud = string(la_tmp)

ll_nbaretes = inv_aretes.of_get(lnv_aretes)
If ll_nbaretes = -1 Then Return -1

// Parcourir les aretes en comptant celles qui ont le noeud comme fin
For i = 1 To ll_nbaretes
	la_tmp = la_vide
	lnv_aretes[i].of_getKey(la_tmp)
	ls_cle = string(la_tmp)
	If ls_clenoeud = mid(ls_cle, pos(ls_cle, '~r~n') + 2) Then
		ll_count ++
		// Ajouter l'arête au vecteur à retourner
		anv_aretes[ll_count] = lnv_aretes[i]
	End If
Next

Return ll_count
end function

public function long of_aretessortantes (n_cst_linkedlistnode anv_noeud, ref n_cst_linkedlistnode anv_aretes[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_aretesSortantes
//
//	Access:  public
//
//	Arguments : 
//	anv_noeud		noeud duquel on veut les arêtes sortantes.
//	anv_aretes[]	(par référence) vecteur qui contiendra les arêtes sortant
//						du noeud.
//
//	Returns:  long
//	Nombre d'arêtes sortantes
//	-1 : échec
//
//	Description:  
//	Retourne les arcs ou les arêtes qui ont un certain noeud comme origine.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_aretes[]
long ll_nbaretes, i, ll_count
string ls_cle, ls_clenoeud
any la_tmp, la_vide

// Intialise la variable
ll_count = 0

// Si le noeud n'est pas valide, la fonction échoue
If isNull(anv_noeud) Or Not isValid(anv_noeud) Then Return -1

// Si le noeud ne fait pas partie du graphe, la fonction échoue
If Not of_Contient(anv_noeud) Then Return -1

// Obtenir la cle du noeud
anv_noeud.of_getKey(la_tmp)
ls_clenoeud = string(la_tmp)

ll_nbaretes = inv_aretes.of_get(lnv_aretes)
If ll_nbaretes = -1 Then Return -1

// Parcourir les aretes en comptant celles qui ont le noeud comme fin
For i = 1 To ll_nbaretes
	la_tmp = la_vide
	lnv_aretes[i].of_getKey(la_tmp)
	ls_cle = string(la_tmp)
	If ls_clenoeud = left(ls_cle, pos(ls_cle, '~r~n') - 1) Then
		ll_count ++
		// Ajouter l'arête au vecteur à retourner
		anv_aretes[ll_count] = lnv_aretes[i]
	End If
Next

Return ll_count
end function

public function integer of_ajouterarete (n_cst_linkedlistnode anv_nouvellearete);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ajouterarete
//
//	Access:  public
//
//	Arguments :  
//	anv_nouvellearete	l'arc ou l'arête à ajouter
//
//	Returns:  integer
//	1 = success
//	-1 = failure (could be duplicate on list that does not allow duplicates)
//
//	Description:  
//	Put a node on list.
//
//	Note:
//	Depending on attributes lists can allow duplicates.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_linkedlistnode lnv_arete
n_cst_linkedlistnode lnv_noeud
any la_tmp, la_vide
string ls_cleorigine
string ls_clefin

// Validation des arguments
If isNull(anv_nouvellearete) Or not isValid(anv_nouvellearete) Then Return -1

anv_nouvellearete.of_getkey(la_tmp)
ls_cleorigine = left(string(la_tmp), pos(string(la_tmp), '~r~n') - 1)
ls_clefin = mid(string(la_tmp), pos(string(la_tmp), '~r~n') + 2)

lnv_noeud = create n_cst_linkedlistnode

// Si un des noeuds n'est pas dans le graphe, la fonction échoue
lnv_noeud.of_setkey(ls_cleorigine)
If Not inv_noeuds.of_isInList(lnv_noeud) Then
	Destroy lnv_noeud
	Return -1
End If

lnv_noeud.of_setkey(ls_clefin)
If Not inv_noeuds.of_isInList(lnv_noeud) Then
	Destroy lnv_noeud
	Return -1
End If

// Si l'ajout échoue, la fonction échoue également
If inv_aretes.of_add(anv_nouvellearete) = -1 Then
	Destroy lnv_arete
	Destroy lnv_noeud
	Return -1
End If

// Si le graphe n'est pas orienté, on ajoute l'arc dans l'autre sens, pour compléter l'arête
If Not ib_oriente Then
	lnv_noeud.of_setkey(ls_clefin + '~r~n' + ls_cleorigine)
	If Not inv_aretes.of_isInList(lnv_noeud) Then
		lnv_arete = Create n_cst_linkedlistnode
		
		lnv_arete.of_setkey(ls_clefin + '~r~n' + ls_cleorigine)
		la_tmp = la_vide
		anv_nouvellearete.of_getData(la_tmp)
		lnv_arete.of_setdata(la_tmp)
		If inv_aretes.of_add(lnv_arete) = -1 Then
			Destroy lnv_arete
			Destroy lnv_noeud
			Return -1
		End If
	End If
End If

Destroy lnv_noeud
Return 1

end function

on pro_graphe.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pro_graphe.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:  destructor
//
//	Arguments : 
//	None
//
//	Returns:  
//	None
//
//	Description:  
//	Perform cleanup.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	1.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 2005 ii4net, Inc. and its subsidiaries. All rights reserved.
//	Any distribution of the ii4net Foundation Classes
//	source code by other than ii4net, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

// Destroy any outstanding nodes.
of_Destroy() 

end event

event constructor;inv_noeuds.of_setduplicatesallowed(False)
inv_noeuds.of_setsorted(True)

inv_aretes.of_setsorted(True)

end event

