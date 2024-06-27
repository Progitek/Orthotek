﻿$PBExportHeader$pro_u_acomba.sru
forward
global type pro_u_acomba from nonvisualobject
end type
end forward

global type pro_u_acomba from nonvisualobject
end type
global pro_u_acomba pro_u_acomba

type variables
Private:

//Déclaration des interfaces
OLEObject iobj_Acomba
OLEObject iobj_UserIndex
OLEObject iobj_TransactionData

end variables

forward prototypes
public function integer uf_connecte (string as_cie, string as_acomba, string as_usager, string as_mdp, ref string as_erreur)
public function integer uf_deconnecte ()
private subroutine uf_getcustomerinfo (long al_cardpos)
private function long uf_getproductgroupcardpos (long al_numgrprod)
private function long uf_getproductcardpos (string as_noproduit)
private function long uf_getcustomercardpos (string as_nocli)
public function decimal uf_getinvoicetaxable ()
public function integer uf_ajoutfact (string as_ref, string as_desc, string as_noclient, str_lignefact astr_lignes[], ref string as_erreur)
end prototypes

public function integer uf_connecte (string as_cie, string as_acomba, string as_usager, string as_mdp, ref string as_erreur);integer li_err

iobj_Acomba = create OLEObject

// Connexion à l'objet Acomba
li_err = iobj_Acomba.ConnectToNewObject("AcoX0127.AcombaX")
if li_err <> 0 then
	as_erreur = "Impossible de se connecter à l'objet Acomba :~r~n"
	choose case li_err
		case -1
			as_erreur += "Invalid Call: the argument is the Object property of a control"
		case -2
			as_erreur += "Class name not found"
		case -3
			as_erreur += "Object could not be created"
		case -4
			as_erreur += "Could not connect to object"
		case -9
			as_erreur += "Other error"
		case -15
			as_erreur += "COM+ is not loaded on this computer"
		case -16
			as_erreur += "Invalid Call: this function not applicable"
	end choose
	return li_err
end if

// Vérificvation de la compagnie
li_err = iobj_Acomba.CompanyExists(as_cie)
if li_err = 0 then
	as_erreur = "Dossier de la société invalide"
	return li_err
end if

// Connexion à la cie
li_err = iobj_Acomba.OpenCompany(as_acomba, as_cie)
if li_err <> 0 then
	as_erreur = string(iobj_Acomba.GetErrorMessage(li_err))
	return li_err
end if

iobj_UserIndex = create OLEObject

// Connexion à l'objet UserIndex
li_err = iobj_UserIndex.ConnectToNewObject("AcoX0127.UserKey")
if li_err <> 0 then
	as_erreur = "Impossible de se connecter à l'objet UsagerIndex :~r~n"
	choose case li_err
		case -1
			as_erreur += "Invalid Call: the argument is the Object property of a control"
		case -2
			as_erreur += "Class name not found"
		case -3
			as_erreur += "Object could not be created"
		case -4
			as_erreur += "Could not connect to object"
		case -9
			as_erreur += "Other error"
		case -15
			as_erreur += "COM+ is not loaded on this computer"
		case -16
			as_erreur += "Invalid Call: this function not applicable"
	end choose
	return li_err
end if

//Recherche de l'usager as_usager pour trouver son CardPos
iobj_UserIndex.UsNumber = as_usager

li_err = iobj_UserIndex.XFindKey(1)
if li_err <> 0 then
	as_erreur = string(iobj_Acomba.GetErrorMessage(li_err))
	return li_err
end if

//Connexion de l'usager as_usager avec le mot de passe as_mdp
li_err = iobj_Acomba.LogCurrentUser(iobj_UserIndex.UsCardPos, as_mdp)
if li_err <> 0 then
	as_erreur = string(iobj_Acomba.GetErrorMessage(li_err))
	return li_err
end if

return 0

end function

public function integer uf_deconnecte ();if not isNull(iobj_TransactionData) and isValid(iobj_TransactionData) then
	destroy iobj_TransactionData
end if

if not isNull(iobj_UserIndex) and isValid(iobj_UserIndex) then
	destroy iobj_UserIndex
end if

if not isNull(iobj_Acomba) and isValid(iobj_Acomba) then
	iobj_Acomba.closeCompany()
	destroy iobj_Acomba
end if

return 0

end function

private subroutine uf_getcustomerinfo (long al_cardpos);OLEObject lobj_CustomerData
integer li_err

if isNull(iobj_Acomba) or not isValid(iobj_Acomba) then return
if isNull(iobj_TransactionData) or not isValid(iobj_TransactionData) then return

lobj_CustomerData = create OLEObject

if lobj_CustomerData.ConnectToNewObject("AcoX0127.Customer") <> 0 then
	destroy lobj_CustomerData
	return
end if

//Consultation de la fiche du client
li_err = lobj_CustomerData.XGetCard(al_CardPos)
If li_err <> 0 Then
	destroy lobj_CustomerData
	return
end if

//CardPos du client à facturer
iobj_TransactionData.InInvoicedToCP = lobj_CustomerData.CuInvoicedToCP

//Numéro du compte recevable du client auquel la facturation est associé
iobj_TransactionData.InReceivableOffset = lobj_CustomerData.CuReceivable

destroy lobj_CustomerData

end subroutine

private function long uf_getproductgroupcardpos (long al_numgrprod);OLEObject lobj_ProductGroupIndex
long ll_ret

if isNull(iobj_Acomba) or not isValid(iobj_Acomba) then return 0

lobj_ProductGroupIndex = create OLEObject

if lobj_ProductGroupIndex.ConnectToNewObject("AcoX0127.ProductGroupKey") <> 0 then
	destroy lobj_ProductGroupIndex
	return 0
end if

//Initialisation de la propriété PGNumber
lobj_ProductGroupIndex.PGNumber = al_numgrprod

//Recherche du groupe de produit dans l'index 1 pour obtenir son CardPos
if lobj_ProductGroupIndex.XFindKey(1) = 0 then
	ll_ret = lobj_ProductGroupIndex.PGCardPos
	
	destroy lobj_ProductGroupIndex
	return ll_ret
end if

return 0

end function

private function long uf_getproductcardpos (string as_noproduit);OLEObject lobj_ProductIndex
long li_ret

if isNull(iobj_Acomba) or not isValid(iobj_Acomba) then return 0

lobj_ProductIndex = create OLEObject

if lobj_ProductIndex.ConnectToNewObject("AcoX0127.ProductKey") <> 0 then
	destroy lobj_ProductIndex
	return 0
end if

//Initialisation de la propriété PrNumber
lobj_ProductIndex.PrNumber = as_noproduit

//Recherche du produit dans l'index 1 pour obtenir son CardPos
if lobj_ProductIndex.XFindKey(1) = 0 then
	li_ret = lobj_ProductIndex.PrCardPos
	
	destroy lobj_ProductIndex
	return li_ret
end if

destroy lobj_ProductIndex
return 0

end function

private function long uf_getcustomercardpos (string as_nocli);OLEObject lobj_CustomerIndex
long ll_ret

if isNull(iobj_Acomba) or not isValid(iobj_Acomba) then return 0

lobj_CustomerIndex = create OLEObject

if lobj_CustomerIndex.ConnectToNewObject("AcoX0127.CustomerKey") <> 0 then
	destroy lobj_CustomerIndex
	return 0
end if

//Initialiser la propriété CuNumber
lobj_CustomerIndex.CuNumber = as_nocli

//Recherche du client dans l'index 1 pour obtenir son CardPos
if lobj_CustomerIndex.XFindKey(1) = 0 then
	ll_ret = lobj_CustomerIndex.CuCardPos
	
	destroy lobj_CustomerIndex
	return ll_ret
end if

destroy lobj_CustomerIndex
return 0

end function

public function decimal uf_getinvoicetaxable ();decimal{2} ld_Total = 0
long i

if isNull(iobj_Acomba) or not isValid(iobj_Acomba) then return 0
if isNull(iobj_TransactionData) or not isValid(iobj_TransactionData) then return 0

//Pour toutes les lignes de la facture
For i = 1 To iobj_TransactionData.TANumLines
	//Si c'est une ligne de saisie de produits
	If iobj_TransactionData.ILLineNumber[i] < 991 Then
		//Augmenter le montant total taxable
		ld_Total += iobj_TransactionData.ILSellingPrice[i] * iobj_TransactionData.ILInvoicedQty[i]
	End If
Next

return ld_Total

end function

public function integer uf_ajoutfact (string as_ref, string as_desc, string as_noclient, str_lignefact astr_lignes[], ref string as_erreur);OLEObject lobj_ControlCustomerData
OLEObject lobj_ProductData
OLEObject lobj_TaxIndex
OLEObject lobj_TaxData
integer li_err, i, li_cpt = 0, li_cptprd = 0, li_cpttxtr = 990
boolean lb_ProdTrouve

if not isNull(iobj_TransactionData) and isValid(iobj_TransactionData) then
	destroy iobj_TransactionData
end if

iobj_TransactionData = create OLEObject
lobj_ControlCustomerData = create OLEObject
lobj_ProductData = create OLEObject
lobj_TaxIndex = create OLEObject
lobj_TaxData = create OLEObject

// Connexion à l'objet Transaction
li_err = iobj_TransactionData.ConnectToNewObject("AcoX0127.Transaction")
if li_err <> 0 then
	as_erreur = "Impossible de se connecter à l'objet Transaction :~r~n"
	choose case li_err
		case -1
			as_erreur += "Invalid Call: the argument is the Object property of a control"
		case -2
			as_erreur += "Class name not found"
		case -3
			as_erreur += "Object could not be created"
		case -4
			as_erreur += "Could not connect to object"
		case -9
			as_erreur += "Other error"
		case -15
			as_erreur += "COM+ is not loaded on this computer"
		case -16
			as_erreur += "Invalid Call: this function not applicable"
	end choose
	destroy iobj_TransactionData
	destroy lobj_ControlCustomerData
	destroy lobj_ProductData
	destroy lobj_TaxIndex
	destroy lobj_TaxData
	return li_err
end if

// Connexion à l'objet ControlCustomer
li_err = lobj_ControlCustomerData.ConnectToNewObject("AcoX0127.ControlCustomer")
if li_err <> 0 then
	as_erreur = "Impossible de se connecter à l'objet ControlCustomer :~r~n"
	choose case li_err
		case -1
			as_erreur += "Invalid Call: the argument is the Object property of a control"
		case -2
			as_erreur += "Class name not found"
		case -3
			as_erreur += "Object could not be created"
		case -4
			as_erreur += "Could not connect to object"
		case -9
			as_erreur += "Other error"
		case -15
			as_erreur += "COM+ is not loaded on this computer"
		case -16
			as_erreur += "Invalid Call: this function not applicable"
	end choose
	destroy iobj_TransactionData
	destroy lobj_ControlCustomerData
	destroy lobj_ProductData
	destroy lobj_TaxIndex
	destroy lobj_TaxData
	return li_err
end if

// Connexion à l'objet Product
li_err = lobj_ProductData.ConnectToNewObject("AcoX0127.Product")
if li_err <> 0 then
	as_erreur = "Impossible de se connecter à l'objet Product :~r~n"
	choose case li_err
		case -1
			as_erreur += "Invalid Call: the argument is the Object property of a control"
		case -2
			as_erreur += "Class name not found"
		case -3
			as_erreur += "Object could not be created"
		case -4
			as_erreur += "Could not connect to object"
		case -9
			as_erreur += "Other error"
		case -15
			as_erreur += "COM+ is not loaded on this computer"
		case -16
			as_erreur += "Invalid Call: this function not applicable"
	end choose
	destroy iobj_TransactionData
	destroy lobj_ControlCustomerData
	destroy lobj_ProductData
	destroy lobj_TaxIndex
	destroy lobj_TaxData
	return li_err
end if

// Connexion à l'objet TaxKey
li_err = lobj_TaxIndex.ConnectToNewObject("AcoX0127.TaxKey")
if li_err <> 0 then
	as_erreur = "Impossible de se connecter à l'objet TaxKey :~r~n"
	choose case li_err
		case -1
			as_erreur += "Invalid Call: the argument is the Object property of a control"
		case -2
			as_erreur += "Class name not found"
		case -3
			as_erreur += "Object could not be created"
		case -4
			as_erreur += "Could not connect to object"
		case -9
			as_erreur += "Other error"
		case -15
			as_erreur += "COM+ is not loaded on this computer"
		case -16
			as_erreur += "Invalid Call: this function not applicable"
	end choose
	destroy iobj_TransactionData
	destroy lobj_ControlCustomerData
	destroy lobj_ProductData
	destroy lobj_TaxIndex
	destroy lobj_TaxData
	return li_err
end if

// Connexion à l'objet Tax
li_err = lobj_TaxData.ConnectToNewObject("AcoX0127.Tax")
if li_err <> 0 then
	as_erreur = "Impossible de se connecter à l'objet Tax :~r~n"
	choose case li_err
		case -1
			as_erreur += "Invalid Call: the argument is the Object property of a control"
		case -2
			as_erreur += "Class name not found"
		case -3
			as_erreur += "Object could not be created"
		case -4
			as_erreur += "Could not connect to object"
		case -9
			as_erreur += "Other error"
		case -15
			as_erreur += "COM+ is not loaded on this computer"
		case -16
			as_erreur += "Invalid Call: this function not applicable"
	end choose
	destroy iobj_TransactionData
	destroy lobj_ControlCustomerData
	destroy lobj_ProductData
	destroy lobj_TaxIndex
	destroy lobj_TaxData
	return li_err
end if

//Met toutes les propriétés de l'interface de fiche à vide
iobj_TransactionData.XBlankCard()

//Chargement de la fiche de contrôle des comptes clients
li_err = lobj_ControlCustomerData.XGetCard(1)
If li_err <> 0 Then
	destroy iobj_TransactionData
	destroy lobj_ControlCustomerData
	destroy lobj_ProductData
	destroy lobj_TaxIndex
	destroy lobj_TaxData
	as_erreur = string(iobj_Acomba.GetErrorMessage(li_err))
	return li_err
end if

// Initialisation des propriétés de l'en-tête de la facturation

//La facturation est de type facture
iobj_TransactionData.InInvoiceType = 1
iobj_TransactionData.InReference = as_ref
iobj_TransactionData.InDescription = as_desc
iobj_TransactionData.InCurrentDay = 1
iobj_TransactionData.InTransactionActive = 1

//Numéro du client associé à la facture
iobj_TransactionData.InCustomerSupplierCP = uf_GetCustomerCardPos(as_noclient)

//Si le client existe
If iobj_TransactionData.InCustomerSupplierCP = 0 Then
	destroy iobj_TransactionData
	destroy lobj_ControlCustomerData
	destroy lobj_ProductData
	destroy lobj_TaxIndex
	destroy lobj_TaxData
	as_erreur = "Ce client n'existe pas dans cette société."
	return -1
end if

//Initialisation des propriétés concernant le client associé à la facture
uf_GetCustomerInfo (iobj_TransactionData.InCustomerSupplierCP)

//Assigner le nombre total de lignes incluses dans la facturation à la propriété TANumLines
iobj_TransactionData.TANumLines = upperbound(astr_lignes) - lowerbound(astr_lignes) + 1

//Initialiser les propriétés de chaque ligne de la facturation
for i = lowerbound(astr_lignes) to upperbound(astr_lignes)
	//La première ligne de la facturation est une ligne de saisie de produits
	li_cpt ++
	iobj_TransactionData.ILType[li_cpt] = astr_lignes[i].i_type
	
	iobj_TransactionData.ILProductNumber[li_cpt] = astr_lignes[i].s_noproduit
	choose case iobj_TransactionData.ILType[li_cpt]
		case 1 // Produit
			li_cptprd ++
			iobj_TransactionData.ILLineNumber[li_cpt] = li_cptprd
			iobj_TransactionData.ILProductCP[li_cpt] = uf_GetProductCardPos(iobj_TransactionData.ILProductNumber[li_cpt])
			
			//Initialisation de lb_ProdTrouve
			lb_ProdTrouve = False
			
			If iobj_TransactionData.ILProductCP[li_cpt] > 0 Then
				//Met toutes les propriétés de l'interface de fiche à vide
				lobj_ProductData.XBlankCard()
				
				//Si le produit existe dans l'inventaire, consultation de sa fiche pour obtenir les valeurs
				//à assigner aux propriétés le concernant dans la facturation
				li_err = lobj_ProductData.XGetCard(iobj_TransactionData.ILProductCP[li_cpt])
				If li_err = 0 Then
					iobj_TransactionData.ILDescription[li_cpt] = lobj_ProductData.PrDescription[1]
					iobj_TransactionData.ILSellingPrice[li_cpt] = lobj_ProductData.PrSellingPrice[0, 1]
					iobj_TransactionData.ILProductGroupCP[li_cpt] = lobj_ProductData.PrProductGroupCP
					//Indique que le produit a bien été consulté
					lb_ProdTrouve = True
				End If
			End If
						 
			//Si le produit n'existe pas dans l'inventaire, les valeurs à assigner aux propriétés le
			//concernant dans la facturation doivent provenir d'une autre source que l'inventaire d'Acomba
			If Not lb_ProdTrouve Then
				iobj_TransactionData.ILDescription[li_cpt] = astr_lignes[i].s_descproduit
				iobj_TransactionData.ILSellingPrice[li_cpt] = astr_lignes[i].dbl_prixproduit
				iobj_TransactionData.ILProductGroupCP[li_cpt] = uf_GetProductGroupCardPos(astr_lignes[i].l_grpproduit)
			End If
			
			iobj_TransactionData.ILInvoicedQty[li_cpt] = astr_lignes[i].dbl_qteproduit
			
		case 7 // Transport
			li_cpttxtr ++
			iobj_TransactionData.ILLineNumber[li_cpt] = li_cpttxtr
			
			//CardPos du compte dans le plan comptable pour les frais de transport selon la définition
			//du compte recevable
			iobj_TransactionData.ILCharterCP[li_cpt] = lobj_ControlCustomerData.CCARCharterCP(iobj_TransactionData.InReceivableOffset, 13)
			iobj_TransactionData.ILTotalAmount[li_cpt] = astr_lignes[i].dbl_prixproduit
		case 8 // Taxes
			li_cpttxtr ++
			iobj_TransactionData.ILLineNumber[li_cpt] = li_cpttxtr
			
			//Recherche de la taxe pour obtenir son CardPos
			lobj_TaxIndex.TaNumber = astr_lignes[i].s_noproduit
			li_err = lobj_TaxIndex.XFindKey(1)
			If li_err <> 0 Then
				destroy iobj_TransactionData
				destroy lobj_ControlCustomerData
				destroy lobj_ProductData
				destroy lobj_TaxIndex
				destroy lobj_TaxData
				as_erreur = string(iobj_Acomba.GetErrorMessage(li_err))
				return li_err
			end if
			
			iobj_TransactionData.ILProductCP[li_cpt] = lobj_TaxIndex.TaCardPos
			li_err = lobj_TaxData.XGetCard(lobj_TaxIndex.TaCardPos)
			If li_err <> 0 Then
				destroy iobj_TransactionData
				destroy lobj_ControlCustomerData
				destroy lobj_ProductData
				destroy lobj_TaxIndex
				destroy lobj_TaxData
				as_erreur = string(iobj_Acomba.GetErrorMessage(li_err))
				return li_err
			End If
			
			//CardPos du compte dans le plan comptable pour les taxes perçues
			iobj_TransactionData.ILCharterCP[li_cpt] = lobj_TaxData.TaCollectedTaxesCharterCP
			
			iobj_TransactionData.ILTotalAmount[li_cpt] = astr_lignes[i].dbl_prixproduit
	end choose
next

//Ajout de la facture

//Ajout de la fiche TransactionData
li_err = iobj_TransactionData.XModifyCard(2147483647, 0)
If li_err <> 0 Then
	destroy iobj_TransactionData
	destroy lobj_ControlCustomerData
	destroy lobj_ProductData
	destroy lobj_TaxIndex
	destroy lobj_TaxData
	as_erreur = string(iobj_Acomba.GetErrorMessage(li_err))
	return li_err
End If

destroy iobj_TransactionData
destroy lobj_ControlCustomerData
destroy lobj_ProductData
destroy lobj_TaxIndex
destroy lobj_TaxData

return 0
end function

event destructor;uf_deconnecte()

end event

on pro_u_acomba.create
call super::create
TriggerEvent( this, "constructor" )
end on

on pro_u_acomba.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

