$PBExportHeader$n_cst_imp_info.sru
forward
global type n_cst_imp_info from n_base
end type
end forward

global type n_cst_imp_info from n_base autoinstantiate
end type

type variables
public:

// Type d'imprimante
constant integer RAPPORT = 1
constant integer ETIQUETTE = 10
constant integer P-TOUCH = 15
constant integer COUPON = 20

datawindow idw_imp
datastore ids_imp
integer ii_type_impression = RAPPORT
boolean ib_imprimer = true
integer ii_nb_copies = 1
string is_etendue = ''
integer ii_etendue_inclu = 0
string is_nom_document = ''
string is_nom_fichier = ''
integer ii_taille_papier = 0
integer ii_source_papier = 0
string is_imprimante = ''

boolean ib_arriereplan = false
boolean ib_boutons = true
boolean ib_coller = true
integer ii_couleur = 1
integer ii_mager_haut = 0
integer ii_mager_bas = 0
integer ii_mager_gauche = 0
integer ii_mager_droite = 0
integer ii_orientation = 0
integer ii_qualite = 0
integer ii_echelle = 100
end variables

on n_cst_imp_info.create
call super::create
end on

on n_cst_imp_info.destroy
call super::destroy
end on

