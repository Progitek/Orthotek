$PBExportHeader$n_cst_color.sru
$PBExportComments$Extension Color service
forward
global type n_cst_color from pro_n_cst_color
end type
end forward

global type n_cst_color from pro_n_cst_color
end type

forward prototypes
public function long of_getcouleurhyg (long al_spec)
end prototypes

public function long of_getcouleurhyg (long al_spec);//////////////////////////////////////////////////////////////////////////////
//
// Méthode:		of_GetCouleurHyg
//
// Accès:		Public
//
// Argument:	Long - L'ID du spécialist duquel on veut la couleur de fond d'horaire
//
// Retourne:	Long, la couleur d'hygiéniste du spécialiste passé en argument,
//							Nul si al_spec est nul,
//							-1 si on ne trouve pas la couleur
//
//////////////////////////////////////////////////////////////////////////////
//
// Historique
//
// Date			Programmeur				Description
// 2009-03-02	Sébastien Tremblay	Création de la fonction
//
//////////////////////////////////////////////////////////////////////////////

long ll_couleur

setNull(ll_couleur)

if isNull(al_spec) then return ll_couleur

select couleur_hyg into :ll_couleur from t_options where id_specialist = :al_spec;

if SQLCA.SQLCode <> 0 then ll_couleur = -1

return ll_couleur

end function

on n_cst_color.create
call super::create
end on

on n_cst_color.destroy
call super::destroy
end on

