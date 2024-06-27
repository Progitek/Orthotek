$PBExportHeader$w_imaging_print.srw
forward
global type w_imaging_print from w_child
end type
type uo_toolbar3 from u_cst_toolbarstrip within w_imaging_print
end type
type ddlb_orientation from u_ddlb within w_imaging_print
end type
type st_2 from statictext within w_imaging_print
end type
type sle_paylarg from editmask within w_imaging_print
end type
type sle_portlarg from editmask within w_imaging_print
end type
type st_explpos from statictext within w_imaging_print
end type
type shl_def from uo_hyperlink_transparent within w_imaging_print
end type
type st_parm from st_uo_transparent within w_imaging_print
end type
type p_1 from picture within w_imaging_print
end type
type p_18 from picture within w_imaging_print
end type
type st_pp from st_uo_transparent within w_imaging_print
end type
type st_expl from statictext within w_imaging_print
end type
type rr_2 from roundrectangle within w_imaging_print
end type
type uo_toolbar from u_cst_toolbarstrip within w_imaging_print
end type
type uo_toolbar2 from u_cst_toolbarstrip within w_imaging_print
end type
type shl_appliquer from uo_hyperlink_transparent within w_imaging_print
end type
type st_sel from statictext within w_imaging_print
end type
type st_dispo from statictext within w_imaging_print
end type
type cb_14 from commandbutton within w_imaging_print
end type
type ddlb_montage from u_ddlb within w_imaging_print
end type
type cb_13 from commandbutton within w_imaging_print
end type
type cb_12 from commandbutton within w_imaging_print
end type
type cb_11 from commandbutton within w_imaging_print
end type
type cb_10 from commandbutton within w_imaging_print
end type
type cb_9 from commandbutton within w_imaging_print
end type
type cb_2 from commandbutton within w_imaging_print
end type
type st_8 from statictext within w_imaging_print
end type
type st_7 from statictext within w_imaging_print
end type
type st_6 from statictext within w_imaging_print
end type
type st_5 from statictext within w_imaging_print
end type
type cb_apply from commandbutton within w_imaging_print
end type
type sle_payhaut from singlelineedit within w_imaging_print
end type
type sle_porthaut from singlelineedit within w_imaging_print
end type
type st_pahauteur from statictext within w_imaging_print
end type
type st_palargeur from statictext within w_imaging_print
end type
type st_phauteur from statictext within w_imaging_print
end type
type st_plargeur from statictext within w_imaging_print
end type
type p_size from picture within w_imaging_print
end type
type cb_1 from commandbutton within w_imaging_print
end type
type cb_8 from commandbutton within w_imaging_print
end type
type cb_7 from commandbutton within w_imaging_print
end type
type cb_6 from commandbutton within w_imaging_print
end type
type cb_5 from commandbutton within w_imaging_print
end type
type cb_4 from commandbutton within w_imaging_print
end type
type st_1 from statictext within w_imaging_print
end type
type cb_3 from commandbutton within w_imaging_print
end type
type cb_cancel from commandbutton within w_imaging_print
end type
type cb_print from commandbutton within w_imaging_print
end type
type dw_preview from u_dw within w_imaging_print
end type
type gb_dim from groupbox within w_imaging_print
end type
type gb_pos from groupbox within w_imaging_print
end type
type rr_1 from roundrectangle within w_imaging_print
end type
type rr_3 from roundrectangle within w_imaging_print
end type
type rr_4 from roundrectangle within w_imaging_print
end type
end forward

global type w_imaging_print from w_child
integer x = 214
integer y = 221
integer width = 4677
integer height = 2640
boolean titlebar = false
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
long backcolor = 67108864
string icon = "AppIcon!"
boolean ib_isupdateable = false
uo_toolbar3 uo_toolbar3
ddlb_orientation ddlb_orientation
st_2 st_2
sle_paylarg sle_paylarg
sle_portlarg sle_portlarg
st_explpos st_explpos
shl_def shl_def
st_parm st_parm
p_1 p_1
p_18 p_18
st_pp st_pp
st_expl st_expl
rr_2 rr_2
uo_toolbar uo_toolbar
uo_toolbar2 uo_toolbar2
shl_appliquer shl_appliquer
st_sel st_sel
st_dispo st_dispo
cb_14 cb_14
ddlb_montage ddlb_montage
cb_13 cb_13
cb_12 cb_12
cb_11 cb_11
cb_10 cb_10
cb_9 cb_9
cb_2 cb_2
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
cb_apply cb_apply
sle_payhaut sle_payhaut
sle_porthaut sle_porthaut
st_pahauteur st_pahauteur
st_palargeur st_palargeur
st_phauteur st_phauteur
st_plargeur st_plargeur
p_size p_size
cb_1 cb_1
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
st_1 st_1
cb_3 cb_3
cb_cancel cb_cancel
cb_print cb_print
dw_preview dw_preview
gb_dim gb_dim
gb_pos gb_pos
rr_1 rr_1
rr_3 rr_3
rr_4 rr_4
end type
global w_imaging_print w_imaging_print

type variables
public long il_patid = 0
public long il_progressid = 0
private long il_index, il_index_orientation
string is_image []
string is_imgselected
string is_imgpos
s_imaging_image  is_imagename

// Crop
boolean ib_dragcrop = false

string	is_application = ""

long	il_x1, il_x2, il_x3, il_x4, il_x5, il_x6, il_x7, il_x8, il_x9, il_x10
long	il_y1, il_y2, il_y3, il_y4, il_y5, il_y6, il_y7, il_y8, il_y9, il_y10


end variables

forward prototypes
public subroutine uf_insertpictures (ref datastore dwo, boolean ab_original)
public subroutine uf_insertpictures (ref datawindow dwo, boolean ab_original)
public subroutine uf_setpos (datawindow dwo)
public subroutine uf_setpos (datastore dwo)
public subroutine uf_setmontage10 (ref datastore dwo, boolean ab_original)
public subroutine uf_setmontage10 (ref datawindow dwo, boolean ab_original)
public subroutine uf_refreshpic (string as_path)
public subroutine uf_traduction ()
public subroutine of_charger_position_defaut (string as_dataobject)
public subroutine uf_resizepicture (string as_photo, string as_nom)
public subroutine uf_montageaco (ref datawindow dwo, boolean ab_original)
public subroutine uf_montageaco (ref datastore dwo, boolean ab_original)
public subroutine uf_montageaco2 (ref datawindow dwo, boolean ab_original)
public subroutine uf_montageaco2 (ref datastore dwo, boolean ab_original)
end prototypes

public subroutine uf_insertpictures (ref datastore dwo, boolean ab_original);int job,result,li_count = 1,li_hiderect
ulong lul_phaut,lul_plarg,lul_occlhaut,lul_occllarg
ulong lul_width, lul_height, picwidth, picheight
long ll_spec, ll_retour
dec {5} var = 1, pvar,uvar
string ls_image, img_type, img_dsiplay, ls_patnom, ls_nodoss, ls_retour
string ls_query, ls_sqlinsert, ls_sqlvalues, ls_langue, ls_logo
string ls_specnom,ls_spectitle,ls_specadd,ls_specville,ls_specprov,ls_speczip
OLEObject myImage
date ldt_naiss, ldt_datemont
boolean	lb_continue = TRUE

					
IF is_application = "dentitek" THEN
	select isnull(plargeur, 165),
			 isnull(phauteur, 236),
			 isnull(occllargeur, 266),
			 isnull(occlhauteur, 175),
			 chemlogo
	into :lul_plarg,
		  :lul_phaut,
		  :lul_occllarg,
		  :lul_occlhaut,
		  :ls_logo
	from t_optiongen;
ELSE
	select plargeur,phauteur,occllargeur,occlhauteur, chemin_logo
	into :lul_plarg,:lul_phaut,:lul_occllarg,:lul_occlhaut, :ls_logo
	from t_options
	where ortho_id = :v_no_ortho;
	
	if isnull(lul_plarg) then lul_plarg = 165
	if isnull(lul_phaut) then lul_phaut = 236
	if isnull(lul_occllarg) then lul_occllarg = 266
	if isnull(lul_occlhaut) then lul_occlhaut = 175
END IF

sle_portlarg.text = string(lul_plarg) //165
sle_porthaut.text = string(lul_phaut) //236
sle_paylarg.text = string(lul_occllarg) //266
sle_payhaut.text = string(lul_occlhaut) //175

//dwo.SetRedraw(false)
// declaration des variables
il_patid = w_imaging.il_patid
//il_progressid = message.doubleparm

// position des images
declare config_cursor CURSOR FOR
	select img from t_imagingconf where ortho_id = :v_no_ortho order by id_imgconf;
	
open config_cursor;

fetch config_cursor into :is_image[li_count];

do while SQLCA.SQLcode = 0
	li_count ++
	fetch config_cursor into :is_image[li_count];
loop 

close config_cursor;

// nom des fichiers
if w_imaging.is_imgtype = 'v' then
	// vistadent
	is_imagename.anterioroccl = '1006Anterior Occlusion-Initial.jpg'
	is_imagename.front_smile = '1002Frontal Smile-Initial.jpg'
	is_imagename.frontal = '1001Frontal-Initial.jpg'
	is_imagename.lateral = '1000Lateral-Initial.jpg'
	is_imagename.leftoccl = '1007Left Occlusion-Initial.jpg'
	is_imagename.loweroccl = '1004Lower Occlusal-Initial.jpg'
	is_imagename.rightoccl = '1005Right Occlusion-Initial.jpg'
	is_imagename.upperoccl = '1003Upper Occlusal-Initial.jpg'
	is_imagename.xray3_1 = ''
	is_imagename.xray3_2 = ''
	is_imagename.logo = ''
else
	select anterioroccl, front_smile, frontal, "lateral", leftoccl, loweroccl, rightoccl, upperoccl, xray3_1, xray3_2, logo, datemont
	into :is_imagename.anterioroccl, :is_imagename.front_smile, :is_imagename.frontal, :is_imagename.lateral,
	:is_imagename.leftoccl, :is_imagename.loweroccl, :is_imagename.rightoccl, :is_imagename.upperoccl,
	:is_imagename.xray3_1, :is_imagename.xray3_2, :is_imagename.logo, :ldt_datemont
	from t_imagerie where patient_id = :il_patid
	and sequence = :il_progressid;
end if

// preparation de la datawindow
//dwo.Object.DataWindow.Zoom= 48
dwo.setTransObject(SQLCA)
if dwo.retrieve(il_patid,il_progressid) = 0 then
	dwo.insertRow(0)
end if

// positionner les images
li_count = 1
MyImage = CREATE OLEObject
result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

do while li_count <= 12
		
	img_type = is_image[li_count]
	lb_continue = TRUE
	
	choose case img_type
		case "Frontal"
			img_dsiplay = is_imagename.frontal
		case "Frontal smile"
			img_dsiplay = is_imagename.front_smile
		case "Lateral"
			img_dsiplay = is_imagename.lateral
		case "Anterior occlusion"
			img_dsiplay = is_imagename.anterioroccl
		case "Left occlusion"
			img_dsiplay = is_imagename.leftoccl
		case "Lower occlusion"
			img_dsiplay = is_imagename.loweroccl	
		case "Right occlusion"
			img_dsiplay = is_imagename.rightoccl
		case "Upper occlusion"
			img_dsiplay = is_imagename.upperoccl
		case "Xray 1"
			img_dsiplay = is_imagename.xray3_1
		case "Xray 2"
			img_dsiplay = is_imagename.xray3_2
		case "Logo"
			//img_dsiplay = is_imagename.logo
			img_dsiplay = ls_logo
		case "Patient"
			img_dsiplay = 'Patient'
		case "Orthodontiste"
			img_dsiplay = 'Ortho'
		case "Dentiste"
			img_dsiplay = 'Dentiste'
		case else
			lb_continue = FALSE		
	end choose
	
	if isnull(img_dsiplay) = false and img_dsiplay <> '' and lb_continue = TRUE then
		
		//début
		IF is_application = "dentitek" THEN
			select prenom + ' ' + nom,
					 nodos,
					 datenais,
					 langue,
					 id_specialist
			  into :ls_patnom,
					 :ls_nodoss,
					 :ldt_naiss,
					 :ls_langue,
					 :ll_spec
			from t_patients
			where id_patient = :w_imaging.il_patid;
			
			select isnull(dr_titre, '') || ' ' || isnull(dr_prenom, '') || ' ' || isnull(dr_nom, ''),classe,dr_adresse,dr_ville,dr_province,dr_zip
			into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
			from t_specialists 
			where id_specialist = :ll_spec;
			
			if ls_langue = 'A' then
				choose case ls_spectitle
					case '0'
						ls_spectitle = "General Practitioner"
					case '1'
						ls_spectitle = "Public Health Dentist"
					case '2'
						ls_spectitle = "Endodontist"
					case '3'
						ls_spectitle = "Oral Pathologist"
					case '4'
						ls_spectitle = "Oral Surgeon"
					case '5'
						ls_spectitle = "Orthodontist"
					case '6'
						ls_spectitle = "Pedodontist"
					case '7'
						ls_spectitle = "Periodontist"
					case '8'
						ls_spectitle = "Radiologist"
					case '9'
						ls_spectitle = "Prosthodonstist"
				end choose
			else
				choose case ls_spectitle
					case '0'
						ls_spectitle = "Dentiste généraliste"
					case '1'
						ls_spectitle = "Dentiste de la santé publique"
					case '2'
						ls_spectitle = "Endodontiste"
					case '3'
						ls_spectitle = "Anatomopathologiste buccal"
					case '4'
						ls_spectitle = "Chirurgien buccal"
					case '5'
						ls_spectitle = "Orthodontiste"
					case '6'
						ls_spectitle = "Pédodontiste"
					case '7'
						ls_spectitle = "Parodontiste"
					case '8'
						ls_spectitle = "Radiologiste"
					case '9'
						ls_spectitle = "Prosthodontiste"
				end choose
			end if
		ELSE
			
		END IF
			
			
		if w_imaging.is_imgtype = 'v' then
			// vistadent
			ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+img_dsiplay
		else
			// orthotek
			if ab_original then
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" +img_dsiplay
			else
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" +img_dsiplay
			end if
		end if
		
		p_size.PictureName = ls_image
		p_size.OriginalSize = True
		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	
		If not(li_count < 7) THEN
			pvar = lul_width / lul_height
			uvar = lul_occllarg / lul_occlhaut
			
			//if pvar > uvar then
				picwidth = lul_occllarg
				picheight = lul_occllarg / pvar
//			else
//				picwidth = lul_occlhaut * pvar
//				picheight = lul_occlhaut
//			end if
		ELSE
			pvar = lul_width / lul_height
			uvar = lul_plarg / lul_phaut
			
			//if pvar > uvar then
				picwidth = lul_plarg
				picheight = lul_plarg / pvar
//			else
//				picwidth = lul_phaut * pvar
//				picheight = lul_phaut
//			end if			
		END IF		
		
		choose case string(li_count)
			case "1"
				choose case img_type
					case 'Orthodontiste', "Ortho", "Dentiste"
						dwo.object.t_1.visible = true
						dwo.object.t_2.visible = true
						dwo.object.t_3.visible = true
						dwo.object.t_4.visible = true

						IF is_application <> "dentitek" THEN
							select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
							into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
							from ortho_id 
							where ortho_id = :v_no_ortho;
							
							if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'
						END IF
						
						dwo.object.t_1.text = ls_specnom
						dwo.object.t_2.text = ls_spectitle
						dwo.object.t_3.text = ls_specadd
						dwo.object.t_4.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

					case 'Patient'
						dwo.object.t_1.visible = true
						dwo.object.t_2.visible = true
						dwo.object.t_3.visible = true
						dwo.object.t_4.visible = true
						
						IF is_application <> "dentitek" THEN
							select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
							into :ls_patnom, :ls_nodoss, :ldt_naiss 
							from patient 
							where patient_id = :w_imaging.il_patid;
						END IF	
						
						dwo.object.t_1.text = ls_patnom
						dwo.object.t_2.text = ls_nodoss
						dwo.object.t_3.text = calculagerelatif(ldt_naiss, ldt_datemont)
						dwo.object.t_4.text = string(ldt_naiss)

						
					case 'Logo'
						dwo.object.t_1.visible = false
						dwo.object.t_2.visible = false
						dwo.object.t_3.visible = false
						dwo.object.t_4.visible = false						
						dwo.object.p_10.visible = true
	//					uf_resizePicture(ls_photo)
						dwo.object.p_10.filename = ls_logo
						uf_resizepicture(ls_logo,"10")
						
						
				end choose
			case "2"
				choose case img_type
					case 'Orthodontiste', "Ortho", "Dentiste"
						dwo.object.t_5.visible = true
						dwo.object.t_6.visible = true
						dwo.object.t_7.visible = true
						dwo.object.t_8.visible = true
						
						IF is_application <> "dentitek" THEN
							select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
							into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
							from ortho_id 
							where ortho_id = :v_no_ortho;
						END IF
						
						
						dwo.object.t_5.text = ls_specnom
						dwo.object.t_6.text = ls_spectitle
						dwo.object.t_7.text = ls_specadd
						dwo.object.t_8.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

					case 'Patient'
						dwo.object.t_5.visible = true
						dwo.object.t_6.visible = true
						dwo.object.t_7.visible = true
						dwo.object.t_8.visible = true
						
						IF is_application <> "dentitek" THEN
								select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
								into :ls_patnom,:ls_nodoss,:ldt_naiss 
								from patient 
								where patient_id = :w_imaging.il_patid;
						END IF
						
						dwo.object.t_5.text = ls_patnom
						dwo.object.t_6.text = ls_nodoss
						dwo.object.t_7.text = calculagerelatif(ldt_naiss, ldt_datemont)
						dwo.object.t_8.text = string(ldt_naiss)
						
					case 'Logo'
						dwo.object.t_5.visible = false
						dwo.object.t_6.visible = false
						dwo.object.t_7.visible = false
						dwo.object.t_8.visible = false						
						dwo.object.p_11.visible = true
						dwo.object.p_11.filename = ls_logo
						uf_resizepicture(ls_logo,"11")
						
				end choose
			case "3"
				choose case img_type
					case 'Orthodontiste', "Ortho", "Dentiste"
						dwo.object.t_9.visible = true
						dwo.object.t_10.visible = true
						dwo.object.t_11.visible = true
						dwo.object.t_12.visible = true

						IF is_application <> "dentitek" THEN
							select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
							into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
							from ortho_id 
							where ortho_id = :v_no_ortho;
						END IF
						
						if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'
						
						
						dwo.object.t_9.text = ls_specnom
						dwo.object.t_10.text = ls_spectitle
						dwo.object.t_11.text = ls_specadd
						dwo.object.t_12.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

					case 'Patient'
						dwo.object.t_9.visible = true
						dwo.object.t_10.visible = true
						dwo.object.t_11.visible = true
						dwo.object.t_12.visible = true
						
						IF is_application <> "dentitek" THEN
							select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
							into :ls_patnom,:ls_nodoss,:ldt_naiss 
							from patient 
							where patient_id = :w_imaging.il_patid;
						END IF

						dwo.object.t_9.text = ls_patnom
						dwo.object.t_10.text = ls_nodoss
						dwo.object.t_11.text = calculagerelatif(ldt_naiss, ldt_datemont)
						dwo.object.t_12.text = string(ldt_naiss)
						
					case 'Logo'
						dwo.object.t_9.visible = false
						dwo.object.t_10.visible = false
						dwo.object.t_11.visible = false
						dwo.object.t_12.visible = false						
						dwo.object.p_12.visible = true
						dwo.object.p_12.filename = ls_logo	
						uf_resizepicture(ls_logo,"12")
						
				end choose
				
			case "4"
				ls_retour = dwo.modify("p_1.width = " + string(picwidth))
				ls_retour = dwo.modify("p_1.height = " + string(picheight))
				dwo.object.p_1.FileName = ls_image
				dwo.object.p_1.tag = img_type

			case "5"
				dwo.modify("p_2.width = " + string(picwidth))
				dwo.modify("p_2.height = " + string(picheight))
				dwo.object.p_2.FileName = ls_image
				dwo.object.p_2.tag = img_type
	
			case "6"
				dwo.modify("p_3.width = " + string(picwidth))
				dwo.modify("p_3.height = " + string(picheight))
				dwo.object.p_3.FileName = ls_image
				dwo.object.p_3.tag = img_type
				
			case "7"
				ls_retour = dwo.modify("p_4.width = " + string(picwidth))
				ls_retour = dwo.modify("p_4.height = " + string(picheight))
				dwo.object.p_4.FileName = ls_image
				dwo.object.p_4.tag = img_type
				
			case "8"
				dwo.modify("p_5.width = " + string(picwidth))
				dwo.modify("p_5.height = " + string(picheight))
				dwo.object.p_5.FileName = ls_image
				dwo.object.p_5.tag = img_type
				
			case "9"
				dwo.modify("p_6.width = " + string(picwidth))
				dwo.modify("p_6.height = " + string(picheight))
				dwo.object.p_6.FileName = ls_image
				dwo.object.p_6.tag = img_type
				
			case "10"
				dwo.modify("p_7.width = " + string(picwidth))
				dwo.modify("p_7.height = " + string(picheight))
				dwo.object.p_7.FileName = ls_image
				dwo.object.p_7.tag = img_type
				
			case "11"
				dwo.modify("p_8.width = " + string(picwidth))
				dwo.modify("p_8.height = " + string(picheight))
				dwo.object.p_8.FileName = ls_image
				dwo.object.p_8.tag = img_type
				
			case "12"
				dwo.modify("p_9.width = " + string(picwidth))
				dwo.modify("p_9.height = " + string(picheight))
				dwo.object.p_9.FileName = ls_image
				dwo.object.p_9.tag = img_type
		end choose
	end if
	li_count ++
loop
uf_setpos(dwo)
SetPointer(Arrow!)
end subroutine

public subroutine uf_insertpictures (ref datawindow dwo, boolean ab_original);int job,result,li_count = 1,li_hiderect
ulong lul_phaut,lul_plarg,lul_occlhaut,lul_occllarg
ulong lul_width, lul_height, picwidth, picheight
long ll_spec
dec {5} var = 1, pvar,uvar
string ls_image,img_type, img_dsiplay,ls_patnom,ls_nodoss, ls_retour, ls_logo
string ls_query, ls_sqlinsert, ls_sqlvalues, ls_langue
string ls_specnom,ls_spectitle,ls_specadd,ls_specville,ls_specprov,ls_speczip
OLEObject myImage
boolean	lb_continue = TRUE
date ldt_naiss, ldt_datemont

IF is_application = "dentitek" THEN
	select isnull(plargeur, 165),
			 isnull(phauteur, 236),
			 isnull(occllargeur, 266),
			 isnull(occlhauteur, 175),
			 chemlogo
	into :lul_plarg,
		  :lul_phaut,
		  :lul_occllarg,
		  :lul_occlhaut,
		  :ls_logo
	from t_optiongen;
ELSE
	select plargeur,phauteur,occllargeur,occlhauteur, chemin_logo
	into :lul_plarg,:lul_phaut,:lul_occllarg,:lul_occlhaut, :ls_logo
	from t_options
	where ortho_id = :v_no_ortho;
	
	if isnull(lul_plarg) then lul_plarg = 165
	if isnull(lul_phaut) then lul_phaut = 236
	if isnull(lul_occllarg) then lul_occllarg = 266
	if isnull(lul_occlhaut) then lul_occlhaut = 175
END IF

sle_portlarg.text = string(lul_plarg) //165
sle_porthaut.text = string(lul_phaut) //236
sle_paylarg.text = string(lul_occllarg) //266
sle_payhaut.text = string(lul_occlhaut) //175

//dwo.SetRedraw(false)
// declaration des variables
il_patid = w_imaging.il_patid
//il_progressid = message.doubleparm

// position des images
declare config_cursor CURSOR FOR
	select img from t_imagingconf where ortho_id = :v_no_ortho order by id_imgconf;
	
open config_cursor;

fetch config_cursor into :is_image[li_count];

do while SQLCA.SQLcode = 0
	li_count ++
	fetch config_cursor into :is_image[li_count];
loop 

close config_cursor;

// nom des fichiers
if w_imaging.is_imgtype = 'v' then
	// vistadent
	is_imagename.anterioroccl = '1006Anterior Occlusion-Initial.jpg'
	is_imagename.front_smile = '1002Frontal Smile-Initial.jpg'
	is_imagename.frontal = '1001Frontal-Initial.jpg'
	is_imagename.lateral = '1000Lateral-Initial.jpg'
	is_imagename.leftoccl = '1007Left Occlusion-Initial.jpg'
	is_imagename.loweroccl = '1004Lower Occlusal-Initial.jpg'
	is_imagename.rightoccl = '1005Right Occlusion-Initial.jpg'
	is_imagename.upperoccl = '1003Upper Occlusal-Initial.jpg'
	is_imagename.xray3_1 = ''
	is_imagename.xray3_2 = ''
	is_imagename.logo = ''
else
	select anterioroccl, front_smile, frontal, "lateral", leftoccl, loweroccl, rightoccl, upperoccl, xray3_1, xray3_2, logo, datemont
	into :is_imagename.anterioroccl, :is_imagename.front_smile, :is_imagename.frontal, :is_imagename.lateral,
	:is_imagename.leftoccl, :is_imagename.loweroccl, :is_imagename.rightoccl, :is_imagename.upperoccl,
	:is_imagename.xray3_1, :is_imagename.xray3_2, :is_imagename.logo, :ldt_datemont
	from t_imagerie where patient_id = :il_patid
	and sequence = :il_progressid;
end if

// preparation de la datawindow
dwo.Object.DataWindow.Zoom= 48
dwo.setTransObject(SQLCA)
if dwo.retrieve(il_patid,il_progressid) = 0 then
	dwo.insertRow(0)
end if

// positionner les images
li_count = 1
MyImage = CREATE OLEObject
result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

do while li_count <= 12
		
	img_type = is_image[li_count]
	lb_continue = TRUE
	
	choose case img_type
		case "Frontal"
			img_dsiplay = is_imagename.frontal
		case "Frontal smile"
			img_dsiplay = is_imagename.front_smile
		case "Lateral"
			img_dsiplay = is_imagename.lateral
		case "Anterior occlusion"
			img_dsiplay = is_imagename.anterioroccl
		case "Left occlusion"
			img_dsiplay = is_imagename.leftoccl
		case "Lower occlusion"
			img_dsiplay = is_imagename.loweroccl	
		case "Right occlusion"
			img_dsiplay = is_imagename.rightoccl
		case "Upper occlusion"
			img_dsiplay = is_imagename.upperoccl
		case "Xray 1"
			img_dsiplay = is_imagename.xray3_1
		case "Xray 2"
			img_dsiplay = is_imagename.xray3_2
		case "Logo"
			//img_dsiplay = is_imagename.logo
			img_dsiplay = ls_logo
		case "Patient"
			img_dsiplay = 'Patient'
		case "Orthodontiste"
			img_dsiplay = 'Ortho'
		case "Dentiste"
			img_dsiplay = 'Dentiste'
		case else
			lb_continue = FALSE		
	end choose
	
	if isnull(img_dsiplay) = false and img_dsiplay <> '' and lb_continue = TRUE then
		
		//début
		IF is_application = "dentitek" THEN
			select prenom + ' ' + nom,
					 nodos,
					 datenais,
					 langue,
					 id_specialist
			  into :ls_patnom,
					 :ls_nodoss,
					 :ldt_naiss,
					 :ls_langue,
					 :ll_spec
			from t_patients
			where id_patient = :w_imaging.il_patid;
			
			select isnull(dr_titre, '') || ' ' || isnull(dr_prenom, '') || ' ' || isnull(dr_nom, ''),classe,dr_adresse,dr_ville,dr_province,dr_zip
			into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
			from t_specialists 
			where id_specialist = :ll_spec;
			
			if ls_langue = 'A' then
				choose case ls_spectitle
					case '0'
						ls_spectitle = "General Practitioner"
					case '1'
						ls_spectitle = "Public Health Dentist"
					case '2'
						ls_spectitle = "Endodontist"
					case '3'
						ls_spectitle = "Oral Pathologist"
					case '4'
						ls_spectitle = "Oral Surgeon"
					case '5'
						ls_spectitle = "Orthodontist"
					case '6'
						ls_spectitle = "Pedodontist"
					case '7'
						ls_spectitle = "Periodontist"
					case '8'
						ls_spectitle = "Radiologist"
					case '9'
						ls_spectitle = "Prosthodonstist"
				end choose
			else
				choose case ls_spectitle
					case '0'
						ls_spectitle = "Dentiste généraliste"
					case '1'
						ls_spectitle = "Dentiste de la santé publique"
					case '2'
						ls_spectitle = "Endodontiste"
					case '3'
						ls_spectitle = "Anatomopathologiste buccal"
					case '4'
						ls_spectitle = "Chirurgien buccal"
					case '5'
						ls_spectitle = "Orthodontiste"
					case '6'
						ls_spectitle = "Pédodontiste"
					case '7'
						ls_spectitle = "Parodontiste"
					case '8'
						ls_spectitle = "Radiologiste"
					case '9'
						ls_spectitle = "Prosthodontiste"
				end choose
			end if
		ELSE
			//Orthotek
		END IF
			
			
		//ici
		if w_imaging.is_imgtype = 'v' then
			// vistadent
			ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+img_dsiplay
		else
			// orthotek
			if ab_original then
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" +img_dsiplay
			else
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" +img_dsiplay
			end if
		end if
		
		p_size.PictureName = ls_image
		p_size.OriginalSize = True
		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	
		If not(li_count < 7) THEN
			
			
			pvar = lul_width / lul_height
			uvar = lul_occllarg / lul_occlhaut
			
			//if pvar > uvar then
				picwidth = lul_occllarg
				picheight = lul_occllarg / pvar
//			else
//				picwidth = lul_occlhaut * pvar
//				picheight = lul_occlhaut
//			end if
		ELSE
			pvar = lul_width / lul_height
			uvar = lul_plarg / lul_phaut
			
			//if pvar > uvar then
				picwidth = lul_plarg
				picheight = lul_plarg / pvar
//			else
//				picwidth = lul_phaut * pvar
//				picheight = lul_phaut
//			end if			
		END IF
		
		
		//
		choose case string(li_count)
			case "1"
				choose case img_type
					case 'Orthodontiste', "Ortho", "Dentiste"
						dwo.object.t_1.visible = true
						dwo.object.t_2.visible = true
						dwo.object.t_3.visible = true
						dwo.object.t_4.visible = true

						IF is_application <> "dentitek" THEN
							select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
							into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
							from ortho_id 
							where ortho_id = :v_no_ortho;
							
							if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'
						END IF
						
						dwo.object.t_1.text = ls_specnom
						dwo.object.t_2.text = ls_spectitle
						dwo.object.t_3.text = ls_specadd
						dwo.object.t_4.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

					case 'Patient'
						dwo.object.t_1.visible = true
						dwo.object.t_2.visible = true
						dwo.object.t_3.visible = true
						dwo.object.t_4.visible = true
						
						IF is_application <> "dentitek" THEN
							select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
							into :ls_patnom, :ls_nodoss, :ldt_naiss 
							from patient 
							where patient_id = :w_imaging.il_patid;
						END IF	
						
						dwo.object.t_1.text = ls_patnom
						dwo.object.t_2.text = ls_nodoss
						dwo.object.t_3.text = calculagerelatif(ldt_naiss, ldt_datemont)
						dwo.object.t_4.text = string(ldt_naiss)
						
					case 'Logo'
						dwo.object.t_1.visible = false
						dwo.object.t_2.visible = false
						dwo.object.t_3.visible = false
						dwo.object.t_4.visible = false						
						dwo.object.p_10.visible = true
						dwo.object.p_10.filename = ls_logo
						uf_resizepicture(ls_logo,"10")
						
				end choose
			case "2"
				choose case img_type
					case 'Orthodontiste', "Ortho", "Dentiste"
						dwo.object.t_5.visible = true
						dwo.object.t_6.visible = true
						dwo.object.t_7.visible = true
						dwo.object.t_8.visible = true
						
						IF is_application <> "dentitek" THEN
							select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
							into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
							from ortho_id 
							where ortho_id = :v_no_ortho;
						END IF
						
						
						dwo.object.t_5.text = ls_specnom
						dwo.object.t_6.text = ls_spectitle
						dwo.object.t_7.text = ls_specadd
						dwo.object.t_8.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

					case 'Patient'
						dwo.object.t_5.visible = true
						dwo.object.t_6.visible = true
						dwo.object.t_7.visible = true
						dwo.object.t_8.visible = true
						
						IF is_application <> "dentitek" THEN
								select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
								into :ls_patnom,:ls_nodoss,:ldt_naiss 
								from patient 
								where patient_id = :w_imaging.il_patid;
						END IF
						
						dwo.object.t_5.text = ls_patnom
						dwo.object.t_6.text = ls_nodoss
						dwo.object.t_7.text = calculagerelatif(ldt_naiss, ldt_datemont)
						dwo.object.t_8.text = string(ldt_naiss)
						
					case 'Logo'
						dwo.object.t_5.visible = false
						dwo.object.t_6.visible = false
						dwo.object.t_7.visible = false
						dwo.object.t_8.visible = false						
						dwo.object.p_11.visible = true
						dwo.object.p_11.filename = ls_logo
						uf_resizepicture(ls_logo,"11")
						
				end choose
			case "3"
				choose case img_type
					case 'Orthodontiste', "Ortho", "Dentiste"
						dwo.object.t_9.visible = true
						dwo.object.t_10.visible = true
						dwo.object.t_11.visible = true
						dwo.object.t_12.visible = true

						IF is_application <> "dentitek" THEN
							select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
							into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
							from ortho_id 
							where ortho_id = :v_no_ortho;
						END IF
						
						if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'
						
						
						dwo.object.t_9.text = ls_specnom
						dwo.object.t_10.text = ls_spectitle
						dwo.object.t_11.text = ls_specadd
						dwo.object.t_12.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

					case 'Patient'
						dwo.object.t_9.visible = true
						dwo.object.t_10.visible = true
						dwo.object.t_11.visible = true
						dwo.object.t_12.visible = true
						
						IF is_application <> "dentitek" THEN
							select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
							into :ls_patnom,:ls_nodoss,:ldt_naiss 
							from patient 
							where patient_id = :w_imaging.il_patid;
						END IF

						dwo.object.t_9.text = ls_patnom
						dwo.object.t_10.text = ls_nodoss
						dwo.object.t_11.text = calculagerelatif(ldt_naiss, ldt_datemont)
						dwo.object.t_12.text = string(ldt_naiss)
						
					case 'Logo'
						dwo.object.t_9.visible = false
						dwo.object.t_10.visible = false
						dwo.object.t_11.visible = false
						dwo.object.t_12.visible = false						
						dwo.object.p_12.visible = true
						dwo.object.p_12.filename = ls_logo						
						uf_resizepicture(ls_logo,"12")
						
				end choose
				
			case "4"
				ls_retour = dwo.modify("p_1.width = " + string(picwidth))
				ls_retour = dwo.modify("p_1.height = " + string(picheight))
				dwo.object.p_1.FileName = ls_image
				dwo.object.p_1.tag = img_type

			case "5"
				dwo.modify("p_2.width = " + string(picwidth))
				dwo.modify("p_2.height = " + string(picheight))
				dwo.object.p_2.FileName = ls_image
				dwo.object.p_2.tag = img_type
	
			case "6"
				dwo.modify("p_3.width = " + string(picwidth))
				dwo.modify("p_3.height = " + string(picheight))
				dwo.object.p_3.FileName = ls_image
				dwo.object.p_3.tag = img_type
				
			case "7"
				ls_retour = dwo.modify("p_4.width = " + string(picwidth))
				ls_retour = dwo.modify("p_4.height = " + string(picheight))
				dwo.object.p_4.FileName = ls_image
				dwo.object.p_4.tag = img_type
				
			case "8"
				dwo.modify("p_5.width = " + string(picwidth))
				dwo.modify("p_5.height = " + string(picheight))
				dwo.object.p_5.FileName = ls_image
				dwo.object.p_5.tag = img_type
				
			case "9"
				dwo.modify("p_6.width = " + string(picwidth))
				dwo.modify("p_6.height = " + string(picheight))
				dwo.object.p_6.FileName = ls_image
				dwo.object.p_6.tag = img_type
				
			case "10"
				dwo.modify("p_7.width = " + string(picwidth))
				dwo.modify("p_7.height = " + string(picheight))
				dwo.object.p_7.FileName = ls_image
				dwo.object.p_7.tag = img_type
				
			case "11"
				dwo.modify("p_8.width = " + string(picwidth))
				dwo.modify("p_8.height = " + string(picheight))
				dwo.object.p_8.FileName = ls_image
				dwo.object.p_8.tag = img_type
				
			case "12"
				dwo.modify("p_9.width = " + string(picwidth))
				dwo.modify("p_9.height = " + string(picheight))
				dwo.object.p_9.FileName = ls_image
				dwo.object.p_9.tag = img_type
		end choose
	end if
	li_count ++
loop
uf_setpos(dwo)
SetPointer(Arrow!)
end subroutine

public subroutine uf_setpos (datawindow dwo);string ls_x1,ls_x2,ls_x3,ls_x4,ls_x5,ls_x6,ls_x7,ls_x8,ls_x9, ls_x10
string ls_y1,ls_y2,ls_y3,ls_y4,ls_y5,ls_y6,ls_y7,ls_y8,ls_y9, ls_y10

select 	x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,
			y1,y2,y3,y4,y5,y6,y7,y8,y9,y10
into 		:ls_x1,:ls_x2,:ls_x3,:ls_x4,:ls_x5,:ls_x6,:ls_x7,:ls_x8,:ls_x9,:ls_x10,
			:ls_y1,:ls_y2,:ls_y3,:ls_y4,:ls_y5,:ls_y6,:ls_y7,:ls_y8,:ls_y9,:ls_y10
from 		t_imgsettings;

// set position : p_1
dwo.Modify('p_1.X='+ls_x1)
dwo.Modify('p_1.Y='+ls_y1)

// set position : p_2
dwo.Modify('p_2.X='+ls_x2)
dwo.Modify('p_2.Y='+ls_y2)

// set position : p_3
dwo.Modify('p_3.X='+ls_x3)
dwo.Modify('p_3.Y='+ls_y3)

// set position : p_4
dwo.Modify('p_4.X='+ls_x4)
dwo.Modify('p_4.Y='+ls_y4)

// set position : p_5
dwo.Modify('p_5.X='+ls_x5)
dwo.Modify('p_5.Y='+ls_y5)

// set position : p_6
dwo.Modify('p_6.X='+ls_x6)
dwo.Modify('p_6.Y='+ls_y6)

// set position : p_7
dwo.Modify('p_7.X='+ls_x7)
dwo.Modify('p_7.Y='+ls_y7)

// set position : p_8
dwo.Modify('p_8.X='+ls_x8)
dwo.Modify('p_8.Y='+ls_y8)

// set position : p_9
dwo.Modify('p_9.X='+ls_x9)
dwo.Modify('p_9.Y='+ls_y9)

// set position : p_10
//RegistryGet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\img","X10", RegString!, ls_x)
//RegistryGet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\img","Y10", RegString!, ls_y)
dwo.Modify('p_10.X='+ls_x10)
dwo.Modify('p_10.Y='+ls_y10)
end subroutine

public subroutine uf_setpos (datastore dwo);string ls_x1,ls_x2,ls_x3,ls_x4,ls_x5,ls_x6,ls_x7,ls_x8,ls_x9, ls_x10
string ls_y1,ls_y2,ls_y3,ls_y4,ls_y5,ls_y6,ls_y7,ls_y8,ls_y9, ls_y10

select 	x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,
			y1,y2,y3,y4,y5,y6,y7,y8,y9,y10
into 		:ls_x1,:ls_x2,:ls_x3,:ls_x4,:ls_x5,:ls_x6,:ls_x7,:ls_x8,:ls_x9,:ls_x10,
			:ls_y1,:ls_y2,:ls_y3,:ls_y4,:ls_y5,:ls_y6,:ls_y7,:ls_y8,:ls_y9,:ls_y10
from 		t_imgsettings;

// set position : p_1
dwo.Modify('p_1.X='+ls_x1)
dwo.Modify('p_1.Y='+ls_y1)

// set position : p_2
dwo.Modify('p_2.X='+ls_x2)
dwo.Modify('p_2.Y='+ls_y2)

// set position : p_3
dwo.Modify('p_3.X='+ls_x3)
dwo.Modify('p_3.Y='+ls_y3)

// set position : p_4
dwo.Modify('p_4.X='+ls_x4)
dwo.Modify('p_4.Y='+ls_y4)

// set position : p_5
dwo.Modify('p_5.X='+ls_x5)
dwo.Modify('p_5.Y='+ls_y5)

// set position : p_6
dwo.Modify('p_6.X='+ls_x6)
dwo.Modify('p_6.Y='+ls_y6)

// set position : p_7
dwo.Modify('p_7.X='+ls_x7)
dwo.Modify('p_7.Y='+ls_y7)

// set position : p_8
dwo.Modify('p_8.X='+ls_x8)
dwo.Modify('p_8.Y='+ls_y8)

// set position : p_9
dwo.Modify('p_9.X='+ls_x9)
dwo.Modify('p_9.Y='+ls_y9)

// set position : p_10
//RegistryGet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\img","X10", RegString!, ls_x)
//RegistryGet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\img","Y10", RegString!, ls_y)
dwo.Modify('p_10.X='+ls_x10)
dwo.Modify('p_10.Y='+ls_y10)
end subroutine

public subroutine uf_setmontage10 (ref datastore dwo, boolean ab_original);int job,result,li_count = 1,li_hiderect
ulong lul_phaut,lul_plarg,lul_occlhaut,lul_occllarg
ulong lul_width, lul_height, picwidth, picheight
long ll_spec
dec {5} var = 1, pvar,uvar
string ls_image,img_type, img_dsiplay, ls_patnom, ls_nodoss, ls_logo
string ls_query, ls_sqlinsert, ls_sqlvalues, ls_langue
string ls_specnom,ls_spectitle,ls_specadd,ls_specville,ls_specprov,ls_speczip
OLEObject myImage
date ldt_naiss, ldt_datemont
boolean	lb_continue = TRUE

IF is_application = "dentitek" THEN
	select isnull(plargeur, 165),
			 isnull(phauteur, 236),
			 isnull(occllargeur, 266),
			 isnull(occlhauteur, 175),
			 chemlogo
	into :lul_plarg,
		  :lul_phaut,
		  :lul_occllarg,
		  :lul_occlhaut,
		  :ls_logo
	from t_optiongen;
ELSE
	select plargeur,phauteur,occllargeur,occlhauteur, chemin_logo
	into :lul_plarg,:lul_phaut,:lul_occllarg,:lul_occlhaut, :ls_logo
	from t_options
	where ortho_id = :v_no_ortho;
	
	if isnull(lul_plarg) then lul_plarg = 165
	if isnull(lul_phaut) then lul_phaut = 236
	if isnull(lul_occllarg) then lul_occllarg = 266
	if isnull(lul_occlhaut) then lul_occlhaut = 175
END IF

sle_portlarg.text = string(lul_plarg) //165
sle_porthaut.text = string(lul_phaut) //236
sle_paylarg.text = string(lul_occllarg) //266
sle_payhaut.text = string(lul_occlhaut) //175

//dwo.SetRedraw(false)
// declaration des variables
il_patid = w_imaging.il_patid
//il_progressid = message.doubleparm

// position des images
declare config_cursor CURSOR FOR
	select img from t_imagingconf where ortho_id = :v_no_ortho order by id_imgconf;
	
open config_cursor;

fetch config_cursor into :is_image[li_count];

do while SQLCA.SQLcode = 0
	li_count ++
	fetch config_cursor into :is_image[li_count];
loop 

close config_cursor;

// nom des fichiers
if w_imaging.is_imgtype = 'v' then
	// vistadent
	is_imagename.anterioroccl = '1006Anterior Occlusion-Initial.jpg'
	is_imagename.front_smile = '1002Frontal Smile-Initial.jpg'
	is_imagename.frontal = '1001Frontal-Initial.jpg'
	is_imagename.lateral = '1000Lateral-Initial.jpg'
	is_imagename.leftoccl = '1007Left Occlusion-Initial.jpg'
	is_imagename.loweroccl = '1004Lower Occlusal-Initial.jpg'
	is_imagename.rightoccl = '1005Right Occlusion-Initial.jpg'
	is_imagename.upperoccl = '1003Upper Occlusal-Initial.jpg'
	is_imagename.xray3_1 = ''
	is_imagename.xray3_2 = ''
	is_imagename.logo = ''
else
	// orthotek
	select anterioroccl, front_smile, frontal, "lateral", leftoccl, loweroccl, rightoccl, upperoccl, xray3_1, xray3_2, logo, imagesupp, datemont
	into :is_imagename.anterioroccl, :is_imagename.front_smile, :is_imagename.frontal, :is_imagename.lateral,
	:is_imagename.leftoccl, :is_imagename.loweroccl, :is_imagename.rightoccl, :is_imagename.upperoccl,
	:is_imagename.xray3_1, :is_imagename.xray3_2, :is_imagename.logo, :is_imagename.imagesupp, :ldt_datemont
	from t_imagerie where patient_id = :il_patid
	and sequence = :il_progressid;
end if

// preparation de la datawindow
//dwo.Object.DataWindow.Zoom= 48
dwo.setTransObject(SQLCA)
if dwo.retrieve(il_patid,il_progressid) = 0 then
	dwo.insertRow(0)
end if

// positionner les images
li_count = 1
MyImage = CREATE OLEObject
result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

do while li_count <= 13
		
	img_type = is_image[li_count]
	lb_continue = TRUE
		
	choose case img_type
		case "Frontal"
			img_dsiplay = is_imagename.frontal
		case "Frontal smile"
			img_dsiplay = is_imagename.front_smile
		case "Lateral"
			img_dsiplay = is_imagename.lateral
		case "Anterior occlusion"
			img_dsiplay = is_imagename.anterioroccl
		case "Left occlusion"
			img_dsiplay = is_imagename.leftoccl
		case "Lower occlusion"
			img_dsiplay = is_imagename.loweroccl	
		case "Right occlusion"
			img_dsiplay = is_imagename.rightoccl
		case "Upper occlusion"
			img_dsiplay = is_imagename.upperoccl
		case "Xray 1"
			img_dsiplay = is_imagename.xray3_1
		case "Xray 2"
			img_dsiplay = is_imagename.xray3_2
		case "Logo"
			//img_dsiplay = is_imagename.logo
			img_dsiplay = ls_logo
		case "Patient"
			img_dsiplay = 'Patient'
		case "Orthodontiste"
			img_dsiplay = 'Ortho'
		case "Dentiste"
			img_dsiplay = 'Dentiste'
		case "imagesupp", "image_10"
			img_dsiplay = is_imagename.imagesupp
		case else
			lb_continue = FALSE		
	end choose
	
	if isnull(img_dsiplay) = false and img_dsiplay <> '' and lb_continue = TRUE then
		IF is_application = "dentitek" THEN
			select prenom + ' ' + nom,
					 nodos,
					 datenais,
					 langue,
					 id_specialist
			  into :ls_patnom,
					 :ls_nodoss,
					 :ldt_naiss,
					 :ls_langue,
					 :ll_spec
			from t_patients
			where id_patient = :w_imaging.il_patid;
			
			select isnull(dr_titre, '') || ' ' || isnull(dr_prenom, '') || ' ' || isnull(dr_nom, ''),classe,dr_adresse,dr_ville,dr_province,dr_zip
			into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
			from t_specialists 
			where id_specialist = :ll_spec;
			
			if ls_langue = 'A' then
				choose case ls_spectitle
					case '0'
						ls_spectitle = "General Practitioner"
					case '1'
						ls_spectitle = "Public Health Dentist"
					case '2'
						ls_spectitle = "Endodontist"
					case '3'
						ls_spectitle = "Oral Pathologist"
					case '4'
						ls_spectitle = "Oral Surgeon"
					case '5'
						ls_spectitle = "Orthodontist"
					case '6'
						ls_spectitle = "Pedodontist"
					case '7'
						ls_spectitle = "Periodontist"
					case '8'
						ls_spectitle = "Radiologist"
					case '9'
						ls_spectitle = "Prosthodonstist"
				end choose
			else
				choose case ls_spectitle
					case '0'
						ls_spectitle = "Dentiste généraliste"
					case '1'
						ls_spectitle = "Dentiste de la santé publique"
					case '2'
						ls_spectitle = "Endodontiste"
					case '3'
						ls_spectitle = "Anatomopathologiste buccal"
					case '4'
						ls_spectitle = "Chirurgien buccal"
					case '5'
						ls_spectitle = "Orthodontiste"
					case '6'
						ls_spectitle = "Pédodontiste"
					case '7'
						ls_spectitle = "Parodontiste"
					case '8'
						ls_spectitle = "Radiologiste"
					case '9'
						ls_spectitle = "Prosthodontiste"
				end choose
			end if
		ELSE
			//Orthotek
		END IF
		
		//ICI
		if w_imaging.is_imgtype = 'v' then
			// vistadent
			ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+img_dsiplay
		else
			// orthotek
			if ab_original then
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" +img_dsiplay
			else
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" +img_dsiplay
			end if
		end if
		p_size.PictureName = ls_image
		p_size.OriginalSize = True
		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	
		If not(li_count < 7 OR li_count = 13) THEN
			pvar = lul_width / lul_height
			uvar = lul_occllarg / lul_occlhaut
			
			//if pvar > uvar then
				picwidth = lul_occllarg
				picheight = lul_occllarg / pvar
//			else
//				picwidth = lul_occlhaut * pvar
//				picheight = lul_occlhaut
//			end if
		ELSE
			pvar = lul_width / lul_height
			uvar = lul_plarg / lul_phaut
			
			//if pvar > uvar then
				picwidth = lul_plarg
				picheight = lul_plarg / pvar
//			else
//				picwidth = lul_phaut * pvar
//				picheight = lul_phaut
//			end if			
		END IF
		
		choose case string(li_count)
			case "1"
				choose case img_type
					case 'Orthodontiste', "Ortho", "Dentiste"
						dwo.object.t_1.visible = true
						dwo.object.t_2.visible = true
						dwo.object.t_3.visible = true
						dwo.object.t_4.visible = true
						
						IF is_application <> "dentitek" THEN
							select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
							into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
							from ortho_id 
							where ortho_id = :v_no_ortho;
							
							if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'
						END IF
						
						
						dwo.object.t_1.text = ls_specnom
						dwo.object.t_2.text = ls_spectitle
						dwo.object.t_3.text = ls_specadd
						dwo.object.t_4.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

					case 'Patient'
						dwo.object.t_1.visible = true
						dwo.object.t_2.visible = true
						dwo.object.t_3.visible = true
						dwo.object.t_4.visible = true
						
						IF is_application <> "dentitek" THEN
							select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
							into :ls_patnom, :ls_nodoss, :ldt_naiss 
							from patient 
							where patient_id = :w_imaging.il_patid;
						END IF							
						
						dwo.object.t_1.text = ls_patnom
						dwo.object.t_2.text = ls_nodoss
						dwo.object.t_3.text = calculagerelatif(ldt_naiss, ldt_datemont)
						dwo.object.t_4.text = string(ldt_naiss)
						
					case 'Logo'
						dwo.object.t_1.visible = false
						dwo.object.t_2.visible = false
						dwo.object.t_3.visible = false
						dwo.object.t_4.visible = false						
						dwo.object.p_11.visible = true
						dwo.object.p_11.filename = ls_logo
						
				end choose
			case "2"
				choose case img_type
					case 'Orthodontiste', "Ortho", "Dentiste"
						dwo.object.t_5.visible = true
						dwo.object.t_6.visible = true
						dwo.object.t_7.visible = true
						dwo.object.t_8.visible = true
						
						IF is_application <> "dentitek" THEN
							select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
							into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
							from ortho_id 
							where ortho_id = :v_no_ortho;
							
							if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'
						END IF
						
						dwo.object.t_5.text = ls_specnom
						dwo.object.t_6.text = ls_spectitle
						dwo.object.t_7.text = ls_specadd
						dwo.object.t_8.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

					case 'Patient'
						dwo.object.t_5.visible = true
						dwo.object.t_6.visible = true
						dwo.object.t_7.visible = true
						dwo.object.t_8.visible = true
						
						IF is_application <> "dentitek" THEN
							select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
							into :ls_patnom, :ls_nodoss, :ldt_naiss 
							from patient 
							where patient_id = :w_imaging.il_patid;
						END IF							
						
						dwo.object.t_5.text = ls_patnom
						dwo.object.t_6.text = ls_nodoss
						dwo.object.t_7.text = calculagerelatif(ldt_naiss, ldt_datemont)
						dwo.object.t_8.text = string(ldt_naiss)
						
					case 'Logo'
						dwo.object.t_5.visible = false
						dwo.object.t_6.visible = false
						dwo.object.t_7.visible = false
						dwo.object.t_8.visible = false						
						dwo.object.p_12.visible = true
						dwo.object.p_12.filename = ls_logo						
						
				end choose
			case "3"
				choose case img_type
					case 'Orthodontiste', "Ortho", "Dentiste"
						dwo.object.t_9.visible = true
						dwo.object.t_10.visible = true
						dwo.object.t_11.visible = true
						dwo.object.t_12.visible = true
						
						IF is_application <> "dentitek" THEN
							select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
							into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
							from ortho_id 
							where ortho_id = :v_no_ortho;
							
							if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'
						END IF
						
						dwo.object.t_9.text = ls_specnom
						dwo.object.t_10.text = ls_spectitle
						dwo.object.t_11.text = ls_specadd
						dwo.object.t_12.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

					case 'Patient'
						dwo.object.t_9.visible = true
						dwo.object.t_10.visible = true
						dwo.object.t_11.visible = true
						dwo.object.t_12.visible = true

						IF is_application <> "dentitek" THEN
							select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
							into :ls_patnom, :ls_nodoss, :ldt_naiss 
							from patient 
							where patient_id = :w_imaging.il_patid;
						END IF	
						
						dwo.object.t_9.text = ls_patnom
						dwo.object.t_10.text = ls_nodoss
						dwo.object.t_11.text = calculagerelatif(ldt_naiss, ldt_datemont)
						dwo.object.t_12.text = string(ldt_naiss)
						
					case 'Logo'
						dwo.object.t_9.visible = false
						dwo.object.t_10.visible = false
						dwo.object.t_11.visible = false
						dwo.object.t_12.visible = false						
						dwo.object.p_13.visible = true
						dwo.object.p_13.filename = ls_logo						
						
				end choose
			case "4"
				dwo.modify("p_1.width = " + string(picwidth))
				dwo.modify("p_1.height = " + string(picheight))
				dwo.object.p_1.FileName = ls_image
				dwo.object.p_1.tag = img_type

			case "5"
				dwo.modify("p_2.width = " + string(picwidth))
				dwo.modify("p_2.height = " + string(picheight))
				dwo.object.p_2.FileName = ls_image
				dwo.object.p_2.tag = img_type
	
			case "6"
				dwo.modify("p_3.width = " + string(picwidth))
				dwo.modify("p_3.height = " + string(picheight))
				dwo.object.p_3.FileName = ls_image
				dwo.object.p_3.tag = img_type
				
			case "7"
				dwo.modify("p_4.width = " + string(picwidth))
				dwo.modify("p_4.height = " + string(picheight))
				dwo.object.p_4.FileName = ls_image
				dwo.object.p_4.tag = img_type
				
			case "8"
				dwo.modify("p_5.width = " + string(picwidth))
				dwo.modify("p_5.height = " + string(picheight))
				dwo.object.p_5.FileName = ls_image
				dwo.object.p_5.tag = img_type
				
			case "9"
				dwo.modify("p_6.width = " + string(picwidth))
				dwo.modify("p_6.height = " + string(picheight))
				dwo.object.p_6.FileName = ls_image
				dwo.object.p_6.tag = img_type
				
			case "10"
				dwo.modify("p_7.width = " + string(picwidth))
				dwo.modify("p_7.height = " + string(picheight))
				dwo.object.p_7.FileName = ls_image
				dwo.object.p_7.tag = img_type
				
			case "11"
				dwo.modify("p_8.width = " + string(picwidth))
				dwo.modify("p_8.height = " + string(picheight))
				dwo.object.p_8.FileName = ls_image
				dwo.object.p_8.tag = img_type
				
			case "12"
				dwo.modify("p_9.width = " + string(picwidth))
				dwo.modify("p_9.height = " + string(picheight))
				dwo.object.p_9.FileName = ls_image
				dwo.object.p_9.tag = img_type
				
			case "13"
				dwo.modify("p_10.width = " + string(picwidth))
				dwo.modify("p_10.height = " + string(picheight))
				dwo.object.p_10.FileName = ls_image
				dwo.object.p_10.tag = img_type
		end choose
	end if
	li_count ++
loop
uf_setpos(dwo)
SetPointer(Arrow!)
end subroutine

public subroutine uf_setmontage10 (ref datawindow dwo, boolean ab_original);int job,result,li_count = 1,li_hiderect
ulong lul_phaut,lul_plarg,lul_occlhaut,lul_occllarg
ulong lul_width, lul_height, picwidth, picheight
long ll_spec
dec {5} var = 1, pvar,uvar
string ls_image,img_type, img_dsiplay,ls_patnom,ls_nodoss, ls_logo
string ls_query, ls_sqlinsert, ls_sqlvalues, ls_langue
string ls_specnom,ls_spectitle,ls_specadd,ls_specville,ls_specprov,ls_speczip
OLEObject myImage
date ldt_naiss, ldt_datemont
boolean	lb_continue = TRUE

IF is_application = "dentitek" THEN
	select isnull(plargeur, 165),
			 isnull(phauteur, 236),
			 isnull(occllargeur, 266),
			 isnull(occlhauteur, 175),
			 chemlogo
	into :lul_plarg,
		  :lul_phaut,
		  :lul_occllarg,
		  :lul_occlhaut,
		  :ls_logo
	from t_optiongen;
ELSE
	select plargeur,phauteur,occllargeur,occlhauteur, chemin_logo
	into :lul_plarg,:lul_phaut,:lul_occllarg,:lul_occlhaut, :ls_logo
	from t_options
	where ortho_id = :v_no_ortho;
	
	if isnull(lul_plarg) then lul_plarg = 165
	if isnull(lul_phaut) then lul_phaut = 236
	if isnull(lul_occllarg) then lul_occllarg = 266
	if isnull(lul_occlhaut) then lul_occlhaut = 175
END IF

sle_portlarg.text = string(lul_plarg) //165
sle_porthaut.text = string(lul_phaut) //236
sle_paylarg.text = string(lul_occllarg) //266
sle_payhaut.text = string(lul_occlhaut) //175

//dwo.SetRedraw(false)
// declaration des variables
il_patid = w_imaging.il_patid
//il_progressid = message.doubleparm

// position des images
declare config_cursor CURSOR FOR
	select img from t_imagingconf where ortho_id = :v_no_ortho order by id_imgconf;
	
open config_cursor;

fetch config_cursor into :is_image[li_count];

	do while SQLCA.SQLcode = 0
		li_count ++
		fetch config_cursor into :is_image[li_count];
	loop 

close config_cursor;

// nom des fichiers
if w_imaging.is_imgtype = 'v' then
	// vistadent
	is_imagename.anterioroccl = '1006Anterior Occlusion-Initial.jpg'
	is_imagename.front_smile = '1002Frontal Smile-Initial.jpg'
	is_imagename.frontal = '1001Frontal-Initial.jpg'
	is_imagename.lateral = '1000Lateral-Initial.jpg'
	is_imagename.leftoccl = '1007Left Occlusion-Initial.jpg'
	is_imagename.loweroccl = '1004Lower Occlusal-Initial.jpg'
	is_imagename.rightoccl = '1005Right Occlusion-Initial.jpg'
	is_imagename.upperoccl = '1003Upper Occlusal-Initial.jpg'
	is_imagename.xray3_1 = ''
	is_imagename.xray3_2 = ''
	is_imagename.logo = ''
else
	// orthotek
	select anterioroccl, front_smile, frontal, "lateral", leftoccl, loweroccl, rightoccl, upperoccl, xray3_1, xray3_2, logo, imagesupp, datemont
	into :is_imagename.anterioroccl, :is_imagename.front_smile, :is_imagename.frontal, :is_imagename.lateral,
	:is_imagename.leftoccl, :is_imagename.loweroccl, :is_imagename.rightoccl, :is_imagename.upperoccl,
	:is_imagename.xray3_1, :is_imagename.xray3_2, :is_imagename.logo, :is_imagename.imagesupp, :ldt_datemont
	from t_imagerie where patient_id = :il_patid
	and sequence = :il_progressid;
end if

// preparation de la datawindow
dwo.Object.DataWindow.Zoom= 48
dwo.setTransObject(SQLCA)
if dwo.retrieve(il_patid,il_progressid) = 0 then
	dwo.insertRow(0)
end if

// positionner les images
li_count = 1
MyImage = CREATE OLEObject
result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

do while li_count <= 13
		
	img_type = is_image[li_count]
	lb_continue = TRUE
		
	choose case img_type
		case "Frontal"
			img_dsiplay = is_imagename.frontal
		case "Frontal smile"
			img_dsiplay = is_imagename.front_smile
		case "Lateral"
			img_dsiplay = is_imagename.lateral
		case "Anterior occlusion"
			img_dsiplay = is_imagename.anterioroccl
		case "Left occlusion"
			img_dsiplay = is_imagename.leftoccl
		case "Lower occlusion"
			img_dsiplay = is_imagename.loweroccl	
		case "Right occlusion"
			img_dsiplay = is_imagename.rightoccl
		case "Upper occlusion"
			img_dsiplay = is_imagename.upperoccl
		case "Xray 1"
			img_dsiplay = is_imagename.xray3_1
		case "Xray 2"
			img_dsiplay = is_imagename.xray3_2
		case "imagesupp", "image_10"
			img_dsiplay = is_imagename.imagesupp
		case "Logo"
			//img_dsiplay = is_imagename.logo
			img_dsiplay = ls_logo
		case "Patient"
			img_dsiplay = 'Patient'
		case "Orthodontiste"
			img_dsiplay = 'Ortho'
		case "Dentiste"
			img_dsiplay = 'Dentiste'
		case else
			lb_continue = FALSE		
	end choose
	
	if isnull(img_dsiplay) = false and img_dsiplay <> '' and lb_continue = TRUE then
		
		IF is_application = "dentitek" THEN
			select prenom + ' ' + nom,
					 nodos,
					 datenais,
					 langue,
					 id_specialist
			  into :ls_patnom,
					 :ls_nodoss,
					 :ldt_naiss,
					 :ls_langue,
					 :ll_spec
			from t_patients
			where id_patient = :w_imaging.il_patid;
			
			select isnull(dr_titre, '') || ' ' || isnull(dr_prenom, '') || ' ' || isnull(dr_nom, ''),classe,dr_adresse,dr_ville,dr_province,dr_zip
			into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
			from t_specialists 
			where id_specialist = :ll_spec;
			
			if ls_langue = 'A' then
				choose case ls_spectitle
					case '0'
						ls_spectitle = "General Practitioner"
					case '1'
						ls_spectitle = "Public Health Dentist"
					case '2'
						ls_spectitle = "Endodontist"
					case '3'
						ls_spectitle = "Oral Pathologist"
					case '4'
						ls_spectitle = "Oral Surgeon"
					case '5'
						ls_spectitle = "Orthodontist"
					case '6'
						ls_spectitle = "Pedodontist"
					case '7'
						ls_spectitle = "Periodontist"
					case '8'
						ls_spectitle = "Radiologist"
					case '9'
						ls_spectitle = "Prosthodonstist"
				end choose
			else
				choose case ls_spectitle
					case '0'
						ls_spectitle = "Dentiste généraliste"
					case '1'
						ls_spectitle = "Dentiste de la santé publique"
					case '2'
						ls_spectitle = "Endodontiste"
					case '3'
						ls_spectitle = "Anatomopathologiste buccal"
					case '4'
						ls_spectitle = "Chirurgien buccal"
					case '5'
						ls_spectitle = "Orthodontiste"
					case '6'
						ls_spectitle = "Pédodontiste"
					case '7'
						ls_spectitle = "Parodontiste"
					case '8'
						ls_spectitle = "Radiologiste"
					case '9'
						ls_spectitle = "Prosthodontiste"
				end choose
			end if
			
		ELSE
			//Orthotek
			
		END IF
		
		//Ici
		if w_imaging.is_imgtype = 'v' then
			// vistadent
			ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+img_dsiplay
		else
			// orthotek
			if ab_original then
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" +img_dsiplay
			else
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" +img_dsiplay
			end if
		end if
		p_size.PictureName = ls_image
		p_size.OriginalSize = True
		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	
		If not(li_count < 7 OR li_count = 13) THEN
			pvar = lul_width / lul_height
			uvar = lul_occllarg / lul_occlhaut
			
			//if pvar > uvar then
				picwidth = lul_occllarg
				picheight = lul_occllarg / pvar
//			else
//				picwidth = lul_occlhaut * pvar
//				picheight = lul_occlhaut
//			end if
		ELSE
			pvar = lul_width / lul_height
			uvar = lul_plarg / lul_phaut
			
			//if pvar > uvar then
				picwidth = lul_plarg
				picheight = lul_plarg / pvar
//			else
//				picwidth = lul_phaut * pvar
//				picheight = lul_phaut
//			end if			

		END IF
				
		choose case string(li_count)
			case "1"
				choose case img_type
					case 'Orthodontiste'
						dwo.object.t_1.visible = true
						dwo.object.t_2.visible = true
						dwo.object.t_3.visible = true
						dwo.object.t_4.visible = true
						
						IF is_application <> "dentitek" THEN
							select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
							into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
							from ortho_id 
							where ortho_id = :v_no_ortho;
							
							if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'
						END IF
						
						dwo.object.t_1.text = ls_specnom
						dwo.object.t_2.text = ls_spectitle
						dwo.object.t_3.text = ls_specadd
						dwo.object.t_4.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

					case 'Patient'
						dwo.object.t_1.visible = true
						dwo.object.t_2.visible = true
						dwo.object.t_3.visible = true
						dwo.object.t_4.visible = true

						IF is_application <> "dentitek" THEN
							select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
							into :ls_patnom, :ls_nodoss, :ldt_naiss 
							from patient 
							where patient_id = :w_imaging.il_patid;
						END IF							
						
						dwo.object.t_1.text = ls_patnom
						dwo.object.t_2.text = ls_nodoss
						dwo.object.t_3.text = calculagerelatif(ldt_naiss, ldt_datemont)
						dwo.object.t_4.text = string(ldt_naiss)
						
					case 'Logo'
						dwo.object.t_1.visible = false
						dwo.object.t_2.visible = false
						dwo.object.t_3.visible = false
						dwo.object.t_4.visible = false						
						dwo.object.p_11.visible = true
						dwo.object.p_11.filename = ls_logo						
						
				end choose
			case "2"
				choose case img_type
					case 'Orthodontiste'
						dwo.object.t_5.visible = true
						dwo.object.t_6.visible = true
						dwo.object.t_7.visible = true
						dwo.object.t_8.visible = true
						
						IF is_application <> "dentitek" THEN
							select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
							into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
							from ortho_id 
							where ortho_id = :v_no_ortho;
							
							if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'
						END IF
						
						dwo.object.t_5.text = ls_specnom
						dwo.object.t_6.text = ls_spectitle
						dwo.object.t_7.text = ls_specadd
						dwo.object.t_8.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

					case 'Patient'
						dwo.object.t_5.visible = true
						dwo.object.t_6.visible = true
						dwo.object.t_7.visible = true
						dwo.object.t_8.visible = true

						IF is_application <> "dentitek" THEN
							select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
							into :ls_patnom, :ls_nodoss, :ldt_naiss 
							from patient 
							where patient_id = :w_imaging.il_patid;
						END IF							
						
						dwo.object.t_5.text = ls_patnom
						dwo.object.t_6.text = ls_nodoss
						dwo.object.t_7.text = calculagerelatif(ldt_naiss, ldt_datemont)
						dwo.object.t_8.text = string(ldt_naiss)
						
					case 'Logo'
						dwo.object.t_5.visible = false
						dwo.object.t_6.visible = false
						dwo.object.t_7.visible = false
						dwo.object.t_8.visible = false						
						dwo.object.p_12.visible = true
						dwo.object.p_12.filename = ls_logo						

					end choose
			case "3"
				choose case img_type
					case 'Orthodontiste'
						dwo.object.t_9.visible = true
						dwo.object.t_10.visible = true
						dwo.object.t_11.visible = true
						dwo.object.t_12.visible = true
						
						IF is_application <> "dentitek" THEN
							select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
							into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
							from ortho_id 
							where ortho_id = :v_no_ortho;
							
							if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'
						END IF
						
						dwo.object.t_9.text = ls_specnom
						dwo.object.t_10.text = ls_spectitle
						dwo.object.t_11.text = ls_specadd
						dwo.object.t_12.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

					case 'Patient'
						dwo.object.t_9.visible = true
						dwo.object.t_10.visible = true
						dwo.object.t_11.visible = true
						dwo.object.t_12.visible = true
						
						IF is_application <> "dentitek" THEN
							select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
							into :ls_patnom, :ls_nodoss, :ldt_naiss 
							from patient 
							where patient_id = :w_imaging.il_patid;
						END IF							

						dwo.object.t_9.text = ls_patnom
						dwo.object.t_10.text = ls_nodoss
						dwo.object.t_11.text = calculagerelatif(ldt_naiss, ldt_datemont)
						dwo.object.t_12.text = string(ldt_naiss)
						
					case 'Logo'
						dwo.object.t_9.visible = false
						dwo.object.t_10.visible = false
						dwo.object.t_11.visible = false
						dwo.object.t_12.visible = false						
						dwo.object.p_13.visible = true
						dwo.object.p_13.filename = ls_logo						
						
				end choose
			case "4"
				dwo.modify("p_1.width = " + string(picwidth))
				dwo.modify("p_1.height = " + string(picheight))
				dwo.object.p_1.FileName = ls_image
				dwo.object.p_1.tag = img_type

			case "5"
				dwo.modify("p_2.width = " + string(picwidth))
				dwo.modify("p_2.height = " + string(picheight))
				dwo.object.p_2.FileName = ls_image
				dwo.object.p_2.tag = img_type
	
			case "6"
				dwo.modify("p_3.width = " + string(picwidth))
				dwo.modify("p_3.height = " + string(picheight))
				dwo.object.p_3.FileName = ls_image
				dwo.object.p_3.tag = img_type
				
			case "7"
				dwo.modify("p_4.width = " + string(picwidth))
				dwo.modify("p_4.height = " + string(picheight))
				dwo.object.p_4.FileName = ls_image
				dwo.object.p_4.tag = img_type
				
			case "8"
				dwo.modify("p_5.width = " + string(picwidth))
				dwo.modify("p_5.height = " + string(picheight))
				dwo.object.p_5.FileName = ls_image
				dwo.object.p_5.tag = img_type
				
			case "9"
				dwo.modify("p_6.width = " + string(picwidth))
				dwo.modify("p_6.height = " + string(picheight))
				dwo.object.p_6.FileName = ls_image
				dwo.object.p_6.tag = img_type
				
			case "10"
				dwo.modify("p_7.width = " + string(picwidth))
				dwo.modify("p_7.height = " + string(picheight))
				dwo.object.p_7.FileName = ls_image
				dwo.object.p_7.tag = img_type
				
			case "11"
				dwo.modify("p_8.width = " + string(picwidth))
				dwo.modify("p_8.height = " + string(picheight))
				dwo.object.p_8.FileName = ls_image
				dwo.object.p_8.tag = img_type
				
			case "12"
				dwo.modify("p_9.width = " + string(picwidth))
				dwo.modify("p_9.height = " + string(picheight))
				dwo.object.p_9.FileName = ls_image
				dwo.object.p_9.tag = img_type
			case "13"
				dwo.modify("p_10.width = " + string(picwidth))
				dwo.modify("p_10.height = " + string(picheight))
				dwo.object.p_10.FileName = ls_image
				dwo.object.p_10.tag = img_type
		end choose
	end if
	img_dsiplay = ""
	li_count ++
loop
uf_setpos(dwo)
SetPointer(Arrow!)
end subroutine

public subroutine uf_refreshpic (string as_path);dw_preview.modify(is_imgpos + ".filename='"+as_path+"'")

end subroutine

public subroutine uf_traduction ();uo_toolbar.of_settheme("classic")
uo_toolbar.of_DisplayBorder(true)
uo_toolbar2.of_settheme("classic")
uo_toolbar2.of_DisplayBorder(true)
uo_toolbar3.of_settheme("classic")
uo_toolbar3.of_DisplayBorder(true)

if gs_langue = 'an' then
	cb_3.text = "Vertical Flip"
	cb_4.text = "Horizontal Flip"
	cb_5.text = "Rotate"
	cb_6.text = "Crop"
	cb_7.text = "+ Brightness"
	cb_8.text = "- Brightness"
	cb_14.text = "Cancel Crop"
	cb_apply.text = "Apply"
	cb_print.text = "Print"
	cb_cancel.text = "Cancel"
	
	uo_toolbar3.of_AddItem("Export", "Export5!")
	uo_toolbar.of_AddItem("Print", "Print!")
	uo_toolbar2.of_AddItem("Close", "Exit!")
	
	st_pp.text = "Print preview"
	st_parm.text = "Parameters"
	st_dispo.text = "Display"
	gb_dim.text = "Pictures size"
	st_plargeur.text = "Portrait pictures width"
	st_phauteur.text = "Portrait pictures height"
	st_palargeur.text = "Landscape pictures width"
	st_pahauteur.text = "Landscape pictures height"
	shl_appliquer.text = "Apply"
	gb_pos.text = "Pictures position"
	st_explpos.text = "You can move pictures with the mouse on the left pane"
	shl_def.text = "Set pictures position to default"
	st_expl.text = "* Double-click on picture to modify it"
	st_sel.text = "Selected picture"
	
ELSE
	
	uo_toolbar3.of_AddItem("Exporter", "Export5!")
	uo_toolbar.of_AddItem("Imprimer", "Print!")
	uo_toolbar2.of_AddItem("Fermer", "Exit!")
	
end if


uo_toolbar.of_displaytext(true)
uo_toolbar2.of_displaytext(true)
uo_toolbar3.of_displaytext(true)

end subroutine

public subroutine of_charger_position_defaut (string as_dataobject);//mettre les valeurs par défaut des positions de photos

il_x1 = long(dw_preview.object.p_1.x)
il_y1 = long(dw_preview.object.p_1.y)

il_x2 = long(dw_preview.object.p_2.x)
il_y2 = long(dw_preview.object.p_2.y)

il_x3 = long(dw_preview.object.p_3.x)
il_y3 = long(dw_preview.object.p_3.y)

il_x4 = long(dw_preview.object.p_4.x)
il_y4 = long(dw_preview.object.p_4.y)

il_x5 = long(dw_preview.object.p_5.x)
il_y5 = long(dw_preview.object.p_5.y)

il_x6 = long(dw_preview.object.p_6.x)
il_y6 = long(dw_preview.object.p_6.y)

il_x7 = long(dw_preview.object.p_7.x)
il_y7 = long(dw_preview.object.p_7.y)

il_x8 = long(dw_preview.object.p_8.x)
il_y8 = long(dw_preview.object.p_8.y)

if as_dataobject <> 'dw_imaging_print3_ortho' then
	il_x9 = long(dw_preview.object.p_9.x)
	il_y9 = long(dw_preview.object.p_9.y)
end if

IF left(as_dataobject, 17) = "dw_imaging_print2" THEN
	//10 photos => Afficher
	il_x10 = long(dw_preview.object.p_10.x)
	il_y10 = long(dw_preview.object.p_10.y)
ELSE
	SetNull(il_x10)
	SetNull(il_y10)
END IF
end subroutine

public subroutine uf_resizepicture (string as_photo, string as_nom);long ll_row
ulong lul_width, lul_height, picwidth, picheight
double ldb_ratiopic, ldb_ratiocnt

if FileExists(as_photo) then
	p_size.OriginalSize = True
	p_size.PictureName = as_photo
	picwidth = UnitsToPixels(p_size.Width, XUnitsToPixels!)
	picheight = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	ldb_ratiopic = picwidth / double(picheight)
	
	CHOOSE CASE as_nom 
		CASE '10'
			lul_width = UnitsToPixels(integer(dw_preview.object.r_size10.width), XUnitsToPixels!)
			lul_height = UnitsToPixels(integer(dw_preview.object.r_size10.height), YUnitsToPixels!)
		CASE '11'
			lul_width = UnitsToPixels(integer(dw_preview.object.r_size11.width), XUnitsToPixels!)
			lul_height = UnitsToPixels(integer(dw_preview.object.r_size11.height), YUnitsToPixels!)
		CASE '12'
			lul_width = UnitsToPixels(integer(dw_preview.object.r_size12.width), XUnitsToPixels!)
			lul_height = UnitsToPixels(integer(dw_preview.object.r_size12.height), YUnitsToPixels!)
	END CHOOSE
	
	ldb_ratiocnt = lul_width / double(lul_height)
	
	// Si la photo est plus large que le contenant
	if ldb_ratiopic > ldb_ratiocnt then
		CHOOSE CASE as_nom 
			CASE '10'
				dw_preview.object.p_10.width = dw_preview.object.r_size10.width
				dw_preview.object.p_10.height = PixelsToUnits(long(UnitsToPixels(integer(dw_preview.object.r_size10.width), XUnitsToPixels!) / ldb_ratiopic), YPixelsToUnits!)
			CASE '11'
				dw_preview.object.p_11.width = dw_preview.object.r_size11.width
				dw_preview.object.p_11.height = PixelsToUnits(long(UnitsToPixels(integer(dw_preview.object.r_size11.width), XUnitsToPixels!) / ldb_ratiopic), YPixelsToUnits!)				
			CASE '12'
				dw_preview.object.p_12.width = dw_preview.object.r_size12.width
				dw_preview.object.p_12.height = PixelsToUnits(long(UnitsToPixels(integer(dw_preview.object.r_size12.width), XUnitsToPixels!) / ldb_ratiopic), YPixelsToUnits!)				
		END CHOOSE
	else
		CHOOSE CASE as_nom
			CASE '10'
				dw_preview.object.p_10.height = dw_preview.object.r_size10.height
				dw_preview.object.p_10.width = PixelsToUnits(long(UnitsToPixels(integer(dw_preview.object.r_size10.height), YUnitsToPixels!) * ldb_ratiopic), XPixelsToUnits!)
			CASE '11'
				dw_preview.object.p_11.height = dw_preview.object.r_size11.height
				dw_preview.object.p_11.width = PixelsToUnits(long(UnitsToPixels(integer(dw_preview.object.r_size11.height), YUnitsToPixels!) * ldb_ratiopic), XPixelsToUnits!)
			CASE '12'
				dw_preview.object.p_12.height = dw_preview.object.r_size12.height
				dw_preview.object.p_12.width = PixelsToUnits(long(UnitsToPixels(integer(dw_preview.object.r_size12.height), YUnitsToPixels!) * ldb_ratiopic), XPixelsToUnits!)
		END CHOOSE
	end if
		
END IF
end subroutine

public subroutine uf_montageaco (ref datawindow dwo, boolean ab_original);int job,result,li_count = 1,li_hiderect
ulong lul_phaut,lul_plarg,lul_occlhaut,lul_occllarg
ulong lul_width, lul_height, picwidth, picheight
long ll_spec
dec {5} var = 1, pvar,uvar
string ls_image,img_type, img_dsiplay,ls_patnom,ls_nodoss, ls_retour, ls_logo
string ls_query, ls_sqlinsert, ls_sqlvalues, ls_langue
string ls_specnom,ls_spectitle,ls_specadd,ls_specville,ls_specprov,ls_speczip
OLEObject myImage
boolean	lb_continue = TRUE
date ldt_naiss, ldt_datemont

select plargeur,phauteur,occllargeur,occlhauteur, chemin_logo
into :lul_plarg,:lul_phaut,:lul_occllarg,:lul_occlhaut, :ls_logo
from t_options
where ortho_id = :v_no_ortho;

if isnull(lul_plarg) then lul_plarg = 165
if isnull(lul_phaut) then lul_phaut = 236
if isnull(lul_occllarg) then lul_occllarg = 266
if isnull(lul_occlhaut) then lul_occlhaut = 175
sle_portlarg.text = string(lul_plarg) //165
sle_porthaut.text = string(lul_phaut) //236
sle_paylarg.text = string(lul_occllarg) //266
sle_payhaut.text = string(lul_occlhaut) //175

// declaration des variables
il_patid = w_imaging.il_patid
//il_progressid = message.doubleparm

// position des images
declare config_cursor CURSOR FOR
	select img from t_imagingconf where ortho_id = :v_no_ortho order by id_imgconf;
	
open config_cursor;

fetch config_cursor into :is_image[li_count];

do while SQLCA.SQLcode = 0
	li_count ++
	fetch config_cursor into :is_image[li_count];
loop 

close config_cursor;

// nom des fichiers
if w_imaging.is_imgtype = 'v' then
	// vistadent
	is_imagename.anterioroccl = '1006Anterior Occlusion-Initial.jpg'
	is_imagename.front_smile = '1002Frontal Smile-Initial.jpg'
	is_imagename.frontal = '1001Frontal-Initial.jpg'
	is_imagename.lateral = '1000Lateral-Initial.jpg'
	is_imagename.leftoccl = '1007Left Occlusion-Initial.jpg'
	is_imagename.loweroccl = '1004Lower Occlusal-Initial.jpg'
	is_imagename.rightoccl = '1005Right Occlusion-Initial.jpg'
	is_imagename.upperoccl = '1003Upper Occlusal-Initial.jpg'
	is_imagename.xray3_1 = ''
	is_imagename.xray3_2 = ''
	is_imagename.logo = ''
else
	select anterioroccl, front_smile, frontal, "lateral", leftoccl, loweroccl, rightoccl, upperoccl, xray3_1, xray3_2, logo, datemont
	into :is_imagename.anterioroccl, :is_imagename.front_smile, :is_imagename.frontal, :is_imagename.lateral,
	:is_imagename.leftoccl, :is_imagename.loweroccl, :is_imagename.rightoccl, :is_imagename.upperoccl,
	:is_imagename.xray3_1, :is_imagename.xray3_2, :is_imagename.logo, :ldt_datemont
	from t_imagerie where patient_id = :il_patid
	and sequence = :il_progressid;
	
end if

// preparation de la datawindow
dwo.Object.DataWindow.Zoom= 48
dwo.setTransObject(SQLCA)
if dwo.retrieve(il_patid,il_progressid) = 0 then
	dwo.insertRow(0)
end if

// positionner les images
li_count = 1
MyImage = CREATE OLEObject
result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

do while li_count <= 12
		
	img_type = is_image[li_count]
	lb_continue = TRUE
	
	choose case img_type
		case "Frontal"
			img_dsiplay = is_imagename.frontal
		case "Frontal smile"
			img_dsiplay = is_imagename.front_smile
		case "Lateral"
			img_dsiplay = is_imagename.lateral
		case "Anterior occlusion"
			img_dsiplay = is_imagename.anterioroccl
		case "Left occlusion"
			img_dsiplay = is_imagename.leftoccl
		case "Lower occlusion"
			img_dsiplay = is_imagename.loweroccl	
		case "Right occlusion"
			img_dsiplay = is_imagename.rightoccl
		case "Upper occlusion"
			img_dsiplay = is_imagename.upperoccl
		case "Vide","Xray 1","Xray 2", "Patient", "Orthodontiste", "Dentiste"
			//img_dsiplay = is_imagename.logo
			img_dsiplay = "CHOIX1"
		case else
			lb_continue = FALSE		
	end choose
	
	if isnull(img_dsiplay) = false and img_dsiplay <> '' and lb_continue = TRUE then	
			
		//ici
		if w_imaging.is_imgtype = 'v' then
			// vistadent
			ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+img_dsiplay
		else
			// orthotek
			if ab_original then
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" +img_dsiplay
			else
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" +img_dsiplay
			end if
				
		end if
		
		p_size.PictureName = ls_image
		p_size.OriginalSize = True
		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	
		If not(li_count < 7) THEN
						
			pvar = lul_width / lul_height
			uvar = lul_occllarg / lul_occlhaut				
			picwidth = lul_occllarg
			picheight = lul_occllarg / pvar
			
		ELSE
			
			pvar = lul_width / lul_height
			uvar = lul_plarg / lul_phaut
			picwidth = lul_plarg
			picheight = lul_plarg / pvar

		END IF
		
		choose case string(li_count)
			case "1"
				select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
				into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
				from ortho_id 
				where ortho_id = :v_no_ortho;

				select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
				into :ls_patnom, :ls_nodoss, :ldt_naiss 
				from patient 
				where patient_id = :w_imaging.il_patid;
          
				if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'
				
				dwo.object.t_spec1.text = ls_specnom
				dwo.object.t_spec2.text = ls_spectitle
				dwo.object.t_spec3.text = ls_specadd
				dwo.object.t_spec4.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

				if isnull(ls_nodoss) then ls_nodoss = ""
				
				dwo.object.t_age.text = calculage(dw_preview.getitemdate(dw_preview.getrow(),'patient_date_naissance'))
				
				dwo.object.t_pat1.text = ls_patnom + " ( " + ls_nodoss + " ) "
				dwo.object.t_pat2.text = calculagerelatif(ldt_naiss, ldt_datemont)
				dwo.object.t_pat3.text = string(ldt_naiss)
				
				dwo.object.p_10.filename = ls_logo
		   	uf_resizepicture(ls_logo,"10")
			
			
			case "4"
				dwo.modify("p_1.width = " + string(picwidth))
				dwo.modify("p_1.height = " + string(picheight))
				dwo.object.p_1.FileName = ls_image
				dwo.object.p_1.tag = img_type

			case "5"
				dwo.modify("p_2.width = " + string(picwidth))
				dwo.modify("p_2.height = " + string(picheight))
				dwo.object.p_2.FileName = ls_image
				dwo.object.p_2.tag = img_type
	
			case "6"
				dwo.modify("p_3.width = " + string(picwidth))
				dwo.modify("p_3.height = " + string(picheight))
				dwo.object.p_3.FileName = ls_image
				dwo.object.p_3.tag = img_type
				
			case "7"
				dwo.modify("p_4.width = " + string(picwidth))
				dwo.modify("p_4.height = " + string(picheight))
				dwo.object.p_4.FileName = ls_image
				dwo.object.p_4.tag = img_type
				
			case "8"
				dwo.modify("p_5.width = " + string(picwidth))
				dwo.modify("p_5.height = " + string(picheight))
				dwo.object.p_5.FileName = ls_image
				dwo.object.p_5.tag = img_type
				
			case "9"
				dwo.modify("p_6.width = " + string(picwidth))
				dwo.modify("p_6.height = " + string(picheight))
				dwo.object.p_6.FileName = ls_image
				dwo.object.p_6.tag = img_type
				
			case "10"
				dwo.modify("p_7.width = " + string(picwidth))
				dwo.modify("p_7.height = " + string(picheight))
				dwo.object.p_7.FileName = ls_image
				dwo.object.p_7.tag = img_type
				
			case "11"
				dwo.modify("p_8.width = " + string(picwidth))
				dwo.modify("p_8.height = " + string(picheight))
				dwo.object.p_8.FileName = ls_image
				dwo.object.p_8.tag = img_type
				
			case "12"
				//dwo.modify("p_9.width = " + string(picwidth))
				//dwo.modify("p_9.height = " + string(picheight))
				//dwo.object.p_9.FileName = ls_image
				//dwo.object.p_9.tag = img_type
		end choose
		
	end if
	
	li_count ++
loop
uf_setpos(dwo)
SetPointer(Arrow!)
end subroutine

public subroutine uf_montageaco (ref datastore dwo, boolean ab_original);int job,result,li_count = 1,li_hiderect
ulong lul_phaut,lul_plarg,lul_occlhaut,lul_occllarg
ulong lul_width, lul_height, picwidth, picheight
long ll_spec
dec {5} var = 1, pvar,uvar
string ls_image,img_type, img_dsiplay,ls_patnom,ls_nodoss, ls_retour, ls_logo
string ls_query, ls_sqlinsert, ls_sqlvalues, ls_langue
string ls_specnom,ls_spectitle,ls_specadd,ls_specville,ls_specprov,ls_speczip
OLEObject myImage
boolean	lb_continue = TRUE
date ldt_naiss, ldt_datemont

select plargeur,phauteur,occllargeur,occlhauteur, chemin_logo
into :lul_plarg,:lul_phaut,:lul_occllarg,:lul_occlhaut, :ls_logo
from t_options
where ortho_id = :v_no_ortho;

if isnull(lul_plarg) then lul_plarg = 165
if isnull(lul_phaut) then lul_phaut = 236
if isnull(lul_occllarg) then lul_occllarg = 266
if isnull(lul_occlhaut) then lul_occlhaut = 175
sle_portlarg.text = string(lul_plarg) //165
sle_porthaut.text = string(lul_phaut) //236
sle_paylarg.text = string(lul_occllarg) //266
sle_payhaut.text = string(lul_occlhaut) //175

// declaration des variables
il_patid = w_imaging.il_patid
//il_progressid = message.doubleparm

// position des images
declare config_cursor CURSOR FOR
	select img from t_imagingconf where ortho_id = :v_no_ortho order by id_imgconf;
	
open config_cursor;

fetch config_cursor into :is_image[li_count];

do while SQLCA.SQLcode = 0
	li_count ++
	fetch config_cursor into :is_image[li_count];
loop 

close config_cursor;

// nom des fichiers
if w_imaging.is_imgtype = 'v' then
	// vistadent
	is_imagename.anterioroccl = '1006Anterior Occlusion-Initial.jpg'
	is_imagename.front_smile = '1002Frontal Smile-Initial.jpg'
	is_imagename.frontal = '1001Frontal-Initial.jpg'
	is_imagename.lateral = '1000Lateral-Initial.jpg'
	is_imagename.leftoccl = '1007Left Occlusion-Initial.jpg'
	is_imagename.loweroccl = '1004Lower Occlusal-Initial.jpg'
	is_imagename.rightoccl = '1005Right Occlusion-Initial.jpg'
	is_imagename.upperoccl = '1003Upper Occlusal-Initial.jpg'
	is_imagename.xray3_1 = ''
	is_imagename.xray3_2 = ''
	is_imagename.logo = ''
else
	select anterioroccl, front_smile, frontal, "lateral", leftoccl, loweroccl, rightoccl, upperoccl, xray3_1, xray3_2, logo, datemont
	into :is_imagename.anterioroccl, :is_imagename.front_smile, :is_imagename.frontal, :is_imagename.lateral,
	:is_imagename.leftoccl, :is_imagename.loweroccl, :is_imagename.rightoccl, :is_imagename.upperoccl,
	:is_imagename.xray3_1, :is_imagename.xray3_2, :is_imagename.logo, :ldt_datemont
	from t_imagerie where patient_id = :il_patid
	and sequence = :il_progressid;
end if

// preparation de la datawindow
//dwo.Object.DataWindow.Zoom= 48
dwo.setTransObject(SQLCA)
if dwo.retrieve(il_patid,il_progressid) = 0 then
	dwo.insertRow(0)
end if

// positionner les images
li_count = 1
MyImage = CREATE OLEObject
result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

do while li_count <= 12
		
	img_type = is_image[li_count]
	lb_continue = TRUE
	
	choose case img_type
		case "Frontal"
			img_dsiplay = is_imagename.frontal
		case "Frontal smile"
			img_dsiplay = is_imagename.front_smile
		case "Lateral"
			img_dsiplay = is_imagename.lateral
		case "Anterior occlusion"
			img_dsiplay = is_imagename.anterioroccl
		case "Left occlusion"
			img_dsiplay = is_imagename.leftoccl
		case "Lower occlusion"
			img_dsiplay = is_imagename.loweroccl	
		case "Right occlusion"
			img_dsiplay = is_imagename.rightoccl
		case "Upper occlusion"
			img_dsiplay = is_imagename.upperoccl
		case "Vide","Xray 1","Xray 2", "Patient", "Orthodontiste", "Dentiste"
			//img_dsiplay = is_imagename.logo
			img_dsiplay = "CHOIX1"
		case else
			lb_continue = FALSE		
	end choose
	
	if isnull(img_dsiplay) = false and img_dsiplay <> '' and lb_continue = TRUE then	
			
		//ici
		if w_imaging.is_imgtype = 'v' then
			// vistadent
			ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+img_dsiplay
		else
			// orthotek
			if ab_original then
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" +img_dsiplay
			else
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" +img_dsiplay
			end if
		end if
		
		p_size.PictureName = ls_image
		p_size.OriginalSize = True
		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	
		If not(li_count < 7) THEN
						
			pvar = lul_width / lul_height
			uvar = lul_occllarg / lul_occlhaut				
			picwidth = lul_occllarg
			picheight = lul_occllarg / pvar
			
		ELSE
			
			pvar = lul_width / lul_height
			uvar = lul_plarg / lul_phaut
				picwidth = lul_plarg
				picheight = lul_plarg / pvar

		END IF
		
		
		choose case string(li_count)
			case "1"

				select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
				into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
				from ortho_id 
				where ortho_id = :v_no_ortho;
				
				select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
				into :ls_patnom, :ls_nodoss, :ldt_naiss 
				from patient 
				where patient_id = :w_imaging.il_patid;

				
				if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'
				
				
				dwo.object.t_spec1.text = ls_specnom
				dwo.object.t_spec2.text = ls_spectitle
				dwo.object.t_spec3.text = ls_specadd
				dwo.object.t_spec4.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

				if isnull(ls_nodoss) then ls_nodoss = ""
				
				dwo.object.t_age.text = calculage(dw_preview.getitemdate(dw_preview.getrow(),'patient_date_naissance'))
				
				dwo.object.t_pat1.text = ls_patnom + " ( " + ls_nodoss + " ) "
				dwo.object.t_pat2.text = calculagerelatif(ldt_naiss, ldt_datemont)
				dwo.object.t_pat3.text = string(ldt_naiss)
				
				dwo.object.p_10.filename = ls_logo
		//		uf_resizepicture(ls_logo,"10")
				
			case "4"
				dwo.modify("p_1.width = " + string(picwidth))
				dwo.modify("p_1.height = " + string(picheight))
				dwo.object.p_1.FileName = ls_image
				dwo.object.p_1.tag = img_type

			case "5"
				dwo.modify("p_2.width = " + string(picwidth))
				dwo.modify("p_2.height = " + string(picheight))
				dwo.object.p_2.FileName = ls_image
				dwo.object.p_2.tag = img_type
	
			case "6"
				dwo.modify("p_3.width = " + string(picwidth))
				dwo.modify("p_3.height = " + string(picheight))
				dwo.object.p_3.FileName = ls_image
				dwo.object.p_3.tag = img_type
				
			case "7"
				dwo.modify("p_4.width = " + string(picwidth))
				dwo.modify("p_4.height = " + string(picheight))
				dwo.object.p_4.FileName = ls_image
				dwo.object.p_4.tag = img_type
				
			case "8"
				dwo.modify("p_5.width = " + string(picwidth))
				dwo.modify("p_5.height = " + string(picheight))
				dwo.object.p_5.FileName = ls_image
				dwo.object.p_5.tag = img_type
				
			case "9"
				dwo.modify("p_6.width = " + string(picwidth))
				dwo.modify("p_6.height = " + string(picheight))
				dwo.object.p_6.FileName = ls_image
				dwo.object.p_6.tag = img_type
				
			case "10"
			   dwo.modify("p_7.width = " + string(picwidth))
			   dwo.modify("p_7.height = " + string(picheight))
				dwo.object.p_7.FileName = ls_image
				dwo.object.p_7.tag = img_type
				
			case "11"
				dwo.modify("p_8.width = " + string(picwidth))
				dwo.modify("p_8.height = " + string(picheight))
				dwo.object.p_8.FileName = ls_image
				dwo.object.p_8.tag = img_type
				
			case "12"
				//dwo.modify("p_9.width = " + string(picwidth))
				//dwo.modify("p_9.height = " + string(picheight))
				//dwo.object.p_9.FileName = ls_image
				//dwo.object.p_9.tag = img_type
		end choose
	end if
	li_count ++
loop
uf_setpos(dwo)
SetPointer(Arrow!)
end subroutine

public subroutine uf_montageaco2 (ref datawindow dwo, boolean ab_original);int job,result,li_count = 1,li_hiderect
ulong lul_phaut,lul_plarg,lul_occlhaut,lul_occllarg
ulong lul_width, lul_height, picwidth, picheight, lul_tabw[],lul_tabh[]
long ll_spec
dec {5} var = 1, pvar,uvar
string ls_image,img_type, img_dsiplay,ls_patnom,ls_nodoss, ls_retour, ls_logo
string ls_query, ls_sqlinsert, ls_sqlvalues, ls_langue
string ls_specnom,ls_spectitle,ls_specadd,ls_specville,ls_specprov,ls_speczip
OLEObject myImage
boolean	lb_continue = TRUE
date ldt_naiss, ldt_datemont

select plargeur,phauteur,occllargeur,occlhauteur, chemin_logo
into :lul_plarg,:lul_phaut,:lul_occllarg,:lul_occlhaut, :ls_logo
from t_options
where ortho_id = :v_no_ortho;

if isnull(lul_plarg) then lul_plarg = 165
if isnull(lul_phaut) then lul_phaut = 236
if isnull(lul_occllarg) then lul_occllarg = 266
if isnull(lul_occlhaut) then lul_occlhaut = 175
sle_portlarg.text = string(lul_plarg) //165
sle_porthaut.text = string(lul_phaut) //236
sle_paylarg.text = string(lul_occllarg) //266
sle_payhaut.text = string(lul_occlhaut) //175

// declaration des variables
il_patid = w_imaging.il_patid
//il_progressid = message.doubleparm

// position des images
declare config_cursor CURSOR FOR
	select img from t_imagingconf where ortho_id = :v_no_ortho order by id_imgconf;
	
open config_cursor;

fetch config_cursor into :is_image[li_count];

do while SQLCA.SQLcode = 0
	li_count ++
	fetch config_cursor into :is_image[li_count];
loop 

close config_cursor;

// nom des fichiers
if w_imaging.is_imgtype = 'v' then
	// vistadent
	is_imagename.anterioroccl = '1006Anterior Occlusion-Initial.jpg'
	is_imagename.front_smile = '1002Frontal Smile-Initial.jpg'
	is_imagename.frontal = '1001Frontal-Initial.jpg'
	is_imagename.lateral = '1000Lateral-Initial.jpg'
	is_imagename.leftoccl = '1007Left Occlusion-Initial.jpg'
	is_imagename.loweroccl = '1004Lower Occlusal-Initial.jpg'
	is_imagename.rightoccl = '1005Right Occlusion-Initial.jpg'
	is_imagename.upperoccl = '1003Upper Occlusal-Initial.jpg'
	is_imagename.xray3_1 = ''
	is_imagename.xray3_2 = ''
	is_imagename.logo = ''
else
	select anterioroccl, front_smile, frontal, "lateral", leftoccl, loweroccl, rightoccl, upperoccl, xray3_1, xray3_2, logo, datemont
	into :is_imagename.anterioroccl, :is_imagename.front_smile, :is_imagename.frontal, :is_imagename.lateral,
	:is_imagename.leftoccl, :is_imagename.loweroccl, :is_imagename.rightoccl, :is_imagename.upperoccl,
	:is_imagename.xray3_1, :is_imagename.xray3_2, :is_imagename.logo, :ldt_datemont
	from t_imagerie where patient_id = :il_patid
	and sequence = :il_progressid;
end if

// preparation de la datawindow
dwo.Object.DataWindow.Zoom= 48
dwo.setTransObject(SQLCA)
if dwo.retrieve(il_patid,il_progressid) = 0 then
	dwo.insertRow(0)
end if

// positionner les images
li_count = 1
MyImage = CREATE OLEObject
result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

do while li_count <= 13
		
	img_type = is_image[li_count]
	lb_continue = TRUE
	
	choose case img_type
		case "Frontal"
			img_dsiplay = is_imagename.frontal
		case "Frontal smile"
			img_dsiplay = is_imagename.front_smile
		case "Lateral"
			img_dsiplay = is_imagename.lateral
		case "Anterior occlusion"
			img_dsiplay = is_imagename.anterioroccl
		case "Left occlusion"
			img_dsiplay = is_imagename.leftoccl
		case "Lower occlusion"
			img_dsiplay = is_imagename.loweroccl	
		case "Right occlusion"
			img_dsiplay = is_imagename.rightoccl
		case "Upper occlusion"
			img_dsiplay = is_imagename.upperoccl
		case "Xray 1"
			img_dsiplay = is_imagename.xray3_1
		case "Vide","Xray 2", "Patient", "Orthodontiste", "Dentiste"
			//img_dsiplay = is_imagename.logo
			img_dsiplay = "CHOIX1"
		case else
			lb_continue = FALSE		
	end choose
	
	if isnull(img_dsiplay) = false and img_dsiplay <> '' and lb_continue = TRUE then	
			
		//ici
		if w_imaging.is_imgtype = 'v' then
			// vistadent
			ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+img_dsiplay
		else
			// orthotek
			if ab_original then
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" +img_dsiplay
			else
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" +img_dsiplay
			end if
				
		end if
		
		p_size.PictureName = ls_image
		p_size.OriginalSize = True
		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	
		If not(li_count < 7) THEN
	
			pvar = lul_width / lul_height
			uvar = lul_occllarg / lul_occlhaut				
			picwidth = lul_occllarg
			picheight = lul_occllarg / pvar

		ELSE
			
			//pvar = lul_width / lul_height
			//uvar = lul_plarg / lul_phaut
		   //picwidth = lul_plarg
		   //picheight = lul_plarg / pvar
			picwidth = 230
			picheight = (230 * lul_height) / lul_width

		END IF

		choose case string(li_count)
			case "1"
				select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
				into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
				from ortho_id 
				where ortho_id = :v_no_ortho;
				
				select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
				into :ls_patnom, :ls_nodoss, :ldt_naiss 
				from patient 
				where patient_id = :w_imaging.il_patid;

				
				if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'

				dwo.object.t_spec1.text = ls_specnom
				dwo.object.t_spec2.text = ls_spectitle
				dwo.object.t_spec3.text = ls_specadd
				dwo.object.t_spec4.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')
 
				if isnull(ls_nodoss) then ls_nodoss = ""
				
				//dwo.object.t_age.text = calculage(dw_preview.getitemdate(dw_preview.getrow(),'patient_date_naissance'))
				dwo.object.t_age.text = calculagerelatif(ldt_naiss,ldt_datemont)
								
				dwo.object.t_pat1.text = ls_patnom + " ( " + ls_nodoss + " ) "
				dwo.object.t_pat2.text = calculagerelatif(ldt_naiss, ldt_datemont)
				dwo.object.t_pat3.text = string(ldt_naiss)
				
				dwo.object.p_10.filename = ls_logo
	      	uf_resizepicture(ls_logo,"10")
			
			case "4"
				dwo.modify("p_1.width = " + string(picwidth))
				dwo.modify("p_1.height = " + string(picheight))
				dwo.object.p_1.FileName = ls_image
				dwo.object.p_1.tag = img_type

			case "5"
				dwo.modify("p_2.width = " + string(picwidth))
				dwo.modify("p_2.height = " + string(picheight))
				dwo.object.p_2.FileName = ls_image
				dwo.object.p_2.tag = img_type
	
			case "6"
				dwo.modify("p_3.width = " + string(picwidth))
				dwo.modify("p_3.height = " + string(picheight))
				dwo.object.p_3.FileName = ls_image
				dwo.object.p_3.tag = img_type
				
			case "7"
				dwo.modify("p_4.width = " + string(picwidth))
				dwo.modify("p_4.height = " + string(picheight))
				dwo.object.p_4.FileName = ls_image
				dwo.object.p_4.tag = img_type
				
			case "8"
				dwo.modify("p_5.width = " + string(picwidth))
				dwo.modify("p_5.height = " + string(picheight))
				dwo.object.p_5.FileName = ls_image
				dwo.object.p_5.tag = img_type
				
			case "9"
				dwo.modify("p_6.width = " + string(picwidth))
				dwo.modify("p_6.height = " + string(picheight))
				dwo.object.p_6.FileName = ls_image
				dwo.object.p_6.tag = img_type
				
			case "10"
				dwo.modify("p_7.width = " + string(picwidth))
				dwo.modify("p_7.height = " + string(picheight))
				dwo.object.p_7.FileName = ls_image
				dwo.object.p_7.tag = img_type
				
			case "11"
				dwo.modify("p_8.width = " + string(picwidth))
				dwo.modify("p_8.height = " + string(picheight))
				dwo.object.p_8.FileName = ls_image
				dwo.object.p_8.tag = img_type
				
			case "12"
				dwo.modify("p_9.width = " + string(picwidth))
				dwo.modify("p_9.height = " + string(picheight))
				dwo.object.p_9.FileName = ls_image
				dwo.object.p_9.tag = img_type
		end choose
		
	end if
	
	li_count ++
loop
uf_setpos(dwo)
SetPointer(Arrow!)
end subroutine

public subroutine uf_montageaco2 (ref datastore dwo, boolean ab_original);int job,result,li_count = 1,li_hiderect
ulong lul_phaut,lul_plarg,lul_occlhaut,lul_occllarg,lul_tabw,lul_tabh
ulong lul_width, lul_height, picwidth, picheight,lul_ratio,lul_maxwidth, lul_maxheight
long ll_spec, ll_count = 1,ll_photoheight[]
dec {5} var = 1, pvar,uvar
string ls_image,img_type, img_dsiplay,ls_patnom,ls_nodoss, ls_retour, ls_logo
string ls_query, ls_sqlinsert, ls_sqlvalues, ls_langue
string ls_specnom,ls_spectitle,ls_specadd,ls_specville,ls_specprov,ls_speczip
OLEObject myImage
boolean	lb_continue = TRUE
date ldt_naiss, ldt_datemont

select plargeur,phauteur,occllargeur,occlhauteur, chemin_logo
into :lul_plarg,:lul_phaut,:lul_occllarg,:lul_occlhaut, :ls_logo
from t_options
where ortho_id = :v_no_ortho;

if isnull(lul_plarg) then lul_plarg = 165
if isnull(lul_phaut) then lul_phaut = 236
if isnull(lul_occllarg) then lul_occllarg = 266
if isnull(lul_occlhaut) then lul_occlhaut = 175
sle_portlarg.text = string(lul_plarg) //165
sle_porthaut.text = string(lul_phaut) //236
sle_paylarg.text = string(lul_occllarg) //266
sle_payhaut.text = string(lul_occlhaut) //175

// declaration des variables
il_patid = w_imaging.il_patid
//il_progressid = message.doubleparm

// position des images
declare config_cursor CURSOR FOR
	select img from t_imagingconf where ortho_id = :v_no_ortho order by id_imgconf;
	
open config_cursor;

fetch config_cursor into :is_image[li_count];

do while SQLCA.SQLcode = 0
	li_count ++
	fetch config_cursor into :is_image[li_count];
loop 

close config_cursor;

// nom des fichiers
if w_imaging.is_imgtype = 'v' then
	// vistadent
	is_imagename.anterioroccl = '1006Anterior Occlusion-Initial.jpg'
	is_imagename.front_smile = '1002Frontal Smile-Initial.jpg'
	is_imagename.frontal = '1001Frontal-Initial.jpg'
	is_imagename.lateral = '1000Lateral-Initial.jpg'
	is_imagename.leftoccl = '1007Left Occlusion-Initial.jpg'
	is_imagename.loweroccl = '1004Lower Occlusal-Initial.jpg'
	is_imagename.rightoccl = '1005Right Occlusion-Initial.jpg'
	is_imagename.upperoccl = '1003Upper Occlusal-Initial.jpg'
	is_imagename.xray3_1 = ''
	is_imagename.xray3_2 = ''
	is_imagename.logo = ''
else
	select anterioroccl, front_smile, frontal, "lateral", leftoccl, loweroccl, rightoccl, upperoccl, xray3_1, xray3_2, logo, datemont
	into :is_imagename.anterioroccl, :is_imagename.front_smile, :is_imagename.frontal, :is_imagename.lateral,
	:is_imagename.leftoccl, :is_imagename.loweroccl, :is_imagename.rightoccl, :is_imagename.upperoccl,
	:is_imagename.xray3_1, :is_imagename.xray3_2, :is_imagename.logo, :ldt_datemont
	from t_imagerie where patient_id = :il_patid
	and sequence = :il_progressid;
end if

// preparation de la datawindow
//dwo.Object.DataWindow.Zoom= 48
dwo.setTransObject(SQLCA)
if dwo.retrieve(il_patid,il_progressid) = 0 then
	dwo.insertRow(0)
end if

// positionner les images
li_count = 1
MyImage = CREATE OLEObject
result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

do while li_count <= 12
		
	img_type = is_image[li_count]
	lb_continue = TRUE
	
	choose case img_type
		case "Frontal"
			img_dsiplay = is_imagename.frontal
		case "Frontal smile"
			img_dsiplay = is_imagename.front_smile
		case "Lateral"
			img_dsiplay = is_imagename.lateral
		case "Anterior occlusion"
			img_dsiplay = is_imagename.anterioroccl
		case "Left occlusion"
			img_dsiplay = is_imagename.leftoccl
		case "Lower occlusion"
			img_dsiplay = is_imagename.loweroccl	
		case "Right occlusion"
			img_dsiplay = is_imagename.rightoccl
		case "Upper occlusion"
			img_dsiplay = is_imagename.upperoccl
		case "Xray 1"
			img_dsiplay = is_imagename.xray3_1
		case "Vide","Xray 2", "Patient", "Orthodontiste", "Dentiste"
			//img_dsiplay = is_imagename.logo
			img_dsiplay = "CHOIX1"
		case else
			lb_continue = FALSE		
	end choose
	
	if isnull(img_dsiplay) = false and img_dsiplay <> '' and lb_continue = TRUE then	
			
		//ici
		if w_imaging.is_imgtype = 'v' then
			// vistadent
			ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+img_dsiplay
		else
			// orthotek
			if ab_original then
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" +img_dsiplay
			else
				ls_image = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" +img_dsiplay
			end if
		end if
		
		p_size.PictureName = ls_image
		p_size.OriginalSize = True
		lul_width = UnitsToPixels(p_size.Width, XUnitsToPixels!)
		lul_height = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	
	
		If not(li_count < 7) THEN
			
			pvar = lul_width / lul_height
			uvar = lul_occllarg / lul_occlhaut				
			picwidth = lul_occllarg
			picheight = lul_occllarg / pvar
			
		ELSE
			
			//pvar = lul_width / lul_height
			//uvar = lul_plarg / lul_phaut
		   //picwidth = lul_plarg
		   //picheight = lul_plarg / pvar
			
			picwidth = 230
		   picheight = (230 * lul_height) / lul_width
			
		END IF
		
		choose case string(li_count)
			case "1"

				select dr_nom_complet,dr_special,dr_adresse,dr_ville,dr_province,dr_code_postal 
				into :ls_specnom,:ls_spectitle,:ls_specadd,:ls_specville,:ls_specprov,:ls_speczip 
				from ortho_id 
				where ortho_id = :v_no_ortho;
				
				select patient_prenom + ' ' + patient_nom, new_dossier, date_naissance 
				into :ls_patnom, :ls_nodoss, :ldt_naiss 
				from patient 
				where patient_id = :w_imaging.il_patid;

				
				if ls_spectitle = 'O' then ls_spectitle = 'Orthodontiste'

				dwo.object.t_spec1.text = ls_specnom
				dwo.object.t_spec2.text = ls_spectitle
				dwo.object.t_spec3.text = ls_specadd
				dwo.object.t_spec4.text = ls_specville+' '+ls_specprov+' '+string(ls_speczip,'@@@ @@@')

				if isnull(ls_nodoss) then ls_nodoss = ""
				
				//dwo.object.t_age.text = calculage(dw_preview.getitemdate(dw_preview.getrow(),'patient_date_naissance'))
				dwo.object.t_age.text = calculagerelatif(ldt_naiss,ldt_datemont)
								
				dwo.object.t_pat1.text = ls_patnom + " ( " + ls_nodoss + " ) "
				dwo.object.t_pat2.text = calculagerelatif(ldt_naiss, ldt_datemont)
				dwo.object.t_pat3.text = string(ldt_naiss)
				
				dwo.object.p_10.filename = ls_logo
	      	uf_resizepicture(ls_logo,"10")
			
			case "4"
				dwo.modify("p_1.width = " + string(picwidth))
				dwo.modify("p_1.height = " + string(picheight))
				dwo.object.p_1.FileName = ls_image
				dwo.object.p_1.tag = img_type

			case "5"
				dwo.modify("p_2.width = " + string(picwidth))
				dwo.modify("p_2.height = " + string(picheight))
				dwo.object.p_2.FileName = ls_image
				dwo.object.p_2.tag = img_type
	
			case "6"
				dwo.modify("p_3.width = " + string(picwidth))
				dwo.modify("p_3.height = " + string(picheight))
				dwo.object.p_3.FileName = ls_image
				dwo.object.p_3.tag = img_type
	
			case "7"
				dwo.modify("p_4.width = " + string(picwidth))
				dwo.modify("p_4.height = " + string(picheight))
				dwo.object.p_4.FileName = ls_image
				dwo.object.p_4.tag = img_type
				
			case "8"
				dwo.modify("p_5.width = " + string(picwidth))
				dwo.modify("p_5.height = " + string(picheight))
				dwo.object.p_5.FileName = ls_image
				dwo.object.p_5.tag = img_type
				
			case "9"
				dwo.modify("p_6.width = " + string(picwidth))
				dwo.modify("p_6.height = " + string(picheight))
				dwo.object.p_6.FileName = ls_image
				dwo.object.p_6.tag = img_type
				
			case "10"
			   dwo.modify("p_7.width = " + string(picwidth))
			   dwo.modify("p_7.height = " + string(picheight))
				dwo.object.p_7.FileName = ls_image
				dwo.object.p_7.tag = img_type
				
			case "11"
				dwo.modify("p_8.width = " + string(picwidth))
				dwo.modify("p_8.height = " + string(picheight))
				dwo.object.p_8.FileName = ls_image
				dwo.object.p_8.tag = img_type
				
			case "12"
				dwo.modify("p_9.width = " + string(picwidth))
				dwo.modify("p_9.height = " + string(picheight))
				dwo.object.p_9.FileName = ls_image
				dwo.object.p_9.tag = img_type
			//case "13"
			//	dwo.modify("p_10.width = " + string(picwidth))
			//	dwo.modify("p_10.height = " + string(picheight))
			//	dwo.object.p_10.FileName = ls_image
			//	dwo.object.p_10.tag = img_type
		end choose
	end if
	li_count ++
loop
			
uf_setpos(dwo)
SetPointer(Arrow!)
end subroutine

on w_imaging_print.create
int iCurrent
call super::create
this.uo_toolbar3=create uo_toolbar3
this.ddlb_orientation=create ddlb_orientation
this.st_2=create st_2
this.sle_paylarg=create sle_paylarg
this.sle_portlarg=create sle_portlarg
this.st_explpos=create st_explpos
this.shl_def=create shl_def
this.st_parm=create st_parm
this.p_1=create p_1
this.p_18=create p_18
this.st_pp=create st_pp
this.st_expl=create st_expl
this.rr_2=create rr_2
this.uo_toolbar=create uo_toolbar
this.uo_toolbar2=create uo_toolbar2
this.shl_appliquer=create shl_appliquer
this.st_sel=create st_sel
this.st_dispo=create st_dispo
this.cb_14=create cb_14
this.ddlb_montage=create ddlb_montage
this.cb_13=create cb_13
this.cb_12=create cb_12
this.cb_11=create cb_11
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_2=create cb_2
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.cb_apply=create cb_apply
this.sle_payhaut=create sle_payhaut
this.sle_porthaut=create sle_porthaut
this.st_pahauteur=create st_pahauteur
this.st_palargeur=create st_palargeur
this.st_phauteur=create st_phauteur
this.st_plargeur=create st_plargeur
this.p_size=create p_size
this.cb_1=create cb_1
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.st_1=create st_1
this.cb_3=create cb_3
this.cb_cancel=create cb_cancel
this.cb_print=create cb_print
this.dw_preview=create dw_preview
this.gb_dim=create gb_dim
this.gb_pos=create gb_pos
this.rr_1=create rr_1
this.rr_3=create rr_3
this.rr_4=create rr_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_toolbar3
this.Control[iCurrent+2]=this.ddlb_orientation
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.sle_paylarg
this.Control[iCurrent+5]=this.sle_portlarg
this.Control[iCurrent+6]=this.st_explpos
this.Control[iCurrent+7]=this.shl_def
this.Control[iCurrent+8]=this.st_parm
this.Control[iCurrent+9]=this.p_1
this.Control[iCurrent+10]=this.p_18
this.Control[iCurrent+11]=this.st_pp
this.Control[iCurrent+12]=this.st_expl
this.Control[iCurrent+13]=this.rr_2
this.Control[iCurrent+14]=this.uo_toolbar
this.Control[iCurrent+15]=this.uo_toolbar2
this.Control[iCurrent+16]=this.shl_appliquer
this.Control[iCurrent+17]=this.st_sel
this.Control[iCurrent+18]=this.st_dispo
this.Control[iCurrent+19]=this.cb_14
this.Control[iCurrent+20]=this.ddlb_montage
this.Control[iCurrent+21]=this.cb_13
this.Control[iCurrent+22]=this.cb_12
this.Control[iCurrent+23]=this.cb_11
this.Control[iCurrent+24]=this.cb_10
this.Control[iCurrent+25]=this.cb_9
this.Control[iCurrent+26]=this.cb_2
this.Control[iCurrent+27]=this.st_8
this.Control[iCurrent+28]=this.st_7
this.Control[iCurrent+29]=this.st_6
this.Control[iCurrent+30]=this.st_5
this.Control[iCurrent+31]=this.cb_apply
this.Control[iCurrent+32]=this.sle_payhaut
this.Control[iCurrent+33]=this.sle_porthaut
this.Control[iCurrent+34]=this.st_pahauteur
this.Control[iCurrent+35]=this.st_palargeur
this.Control[iCurrent+36]=this.st_phauteur
this.Control[iCurrent+37]=this.st_plargeur
this.Control[iCurrent+38]=this.p_size
this.Control[iCurrent+39]=this.cb_1
this.Control[iCurrent+40]=this.cb_8
this.Control[iCurrent+41]=this.cb_7
this.Control[iCurrent+42]=this.cb_6
this.Control[iCurrent+43]=this.cb_5
this.Control[iCurrent+44]=this.cb_4
this.Control[iCurrent+45]=this.st_1
this.Control[iCurrent+46]=this.cb_3
this.Control[iCurrent+47]=this.cb_cancel
this.Control[iCurrent+48]=this.cb_print
this.Control[iCurrent+49]=this.dw_preview
this.Control[iCurrent+50]=this.gb_dim
this.Control[iCurrent+51]=this.gb_pos
this.Control[iCurrent+52]=this.rr_1
this.Control[iCurrent+53]=this.rr_3
this.Control[iCurrent+54]=this.rr_4
end on

on w_imaging_print.destroy
call super::destroy
destroy(this.uo_toolbar3)
destroy(this.ddlb_orientation)
destroy(this.st_2)
destroy(this.sle_paylarg)
destroy(this.sle_portlarg)
destroy(this.st_explpos)
destroy(this.shl_def)
destroy(this.st_parm)
destroy(this.p_1)
destroy(this.p_18)
destroy(this.st_pp)
destroy(this.st_expl)
destroy(this.rr_2)
destroy(this.uo_toolbar)
destroy(this.uo_toolbar2)
destroy(this.shl_appliquer)
destroy(this.st_sel)
destroy(this.st_dispo)
destroy(this.cb_14)
destroy(this.ddlb_montage)
destroy(this.cb_13)
destroy(this.cb_12)
destroy(this.cb_11)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_2)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.cb_apply)
destroy(this.sle_payhaut)
destroy(this.sle_porthaut)
destroy(this.st_pahauteur)
destroy(this.st_palargeur)
destroy(this.st_phauteur)
destroy(this.st_plargeur)
destroy(this.p_size)
destroy(this.cb_1)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.st_1)
destroy(this.cb_3)
destroy(this.cb_cancel)
destroy(this.cb_print)
destroy(this.dw_preview)
destroy(this.gb_dim)
destroy(this.gb_pos)
destroy(this.rr_1)
destroy(this.rr_3)
destroy(this.rr_4)
end on

type uo_toolbar3 from u_cst_toolbarstrip within w_imaging_print
event destroy ( )
string tag = "resize=mrb"
integer x = 2917
integer y = 2412
integer width = 507
integer taborder = 80
end type

on uo_toolbar3.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;string ls_path, ls_file, ls_rep
int li_rc

//li_rc = GetFileSaveName ( "Enregistrer sous", ls_path, ls_file, "JPG", "Image (*.JPG) ,*.JPG" , "C:\ii4net\orthotek", 32770)

//IF li_rc = 1 Then
	   
//	messagebox(ls_file,ls_path)
	
//	ls_rep = left(ls_path,lastpos(ls_path,'\') - 1)
	
//	gnv_app.inv_filesrv.of_filewrite("c:\ii4net\orthotek\batchprint.txt", "save.path=" + ls_rep + "~r~n" + &
//															"save.filename=" + ls_file + "~r~n" + &
//															"save.filexistact=1~r~n" + &
//															"save.dialog=2~r~n" + &
//															"image.format=2",false)
															
	
//	dw_preview.Object.DataWindow.Print.PrinterName='Numerisateur Progitek'
//	dw_preview.print()

//End If

dw_preview.event ue_getpos()


//printsetup()

datastore ds_imgprint
ds_imgprint = create datastore
CHOOSE CASE il_index 
	CASE 2
		ds_imgprint.dataobject = 'dw_imaging_print2_ortho'
	CASE 3
		ds_imgprint.dataobject = 'dw_imaging_print3_ortho'
	CASE ELSE
		ds_imgprint.dataobject = 'dw_imaging_print1_ortho'
END CHOOSE
		
ds_imgprint.SetTransObject(SQLCA)

CHOOSE CASE il_index 
	CASE 2
		uf_setmontage10(ds_imgprint,true)
	CASE 3
		uf_montageaco(ds_imgprint,false)
	CASE ELSE
		uf_insertpictures(ds_imgprint,true)
END CHOOSE

SetPointer(HourGlass!)

gnv_app.inv_filesrv.of_filewrite("c:\ii4net\orthotek\batchprint.txt", "save.filexistact=1~r~n" + &
														"save.dialog=0~r~n" + &
														"image.format=2~r~n" + &
														"image.color=3~r~n" + & 
														"image.compression=0~r~n" + & 
														"gpd.papersize=LETTER",false)
														
run("C:\Program Files\zvprt50\zvprtcfg.exe Numerisateur Progitek print.script=c:\ii4net\orthotek\batchprint.txt",Minimized!)


ds_imgprint.Object.DataWindow.Print.PrinterName='Numerisateur Progitek'
ds_imgprint.print()

//ds_imgprint.print(TRUE, true)
destroy ds_imgprint
end event

type ddlb_orientation from u_ddlb within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 3150
integer y = 432
integer width = 1115
integer height = 948
integer taborder = 90
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean ib_rmbmenu = false
end type

event constructor;call super::constructor;
if gs_langue = 'an' then
	addItem("Portrait")
	addItem("Landscape")
else
	addItem("Portrait")
	addItem("Paysage")
end if
selectItem(1)
il_index_orientation = 1
end event

event selectionchanged;call super::selectionchanged;CHOOSE CASE index 
	CASE 1
	CASE 2
END CHOOSE

il_index_orientation = index

end event

type st_2 from statictext within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 2587
integer y = 444
integer width = 535
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Orientation:"
boolean focusrectangle = false
end type

type sle_paylarg from editmask within w_imaging_print
string tag = "resize=frbsr"
integer x = 3653
integer y = 976
integer width = 270
integer height = 80
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 5
string minmax = "100~~300"
end type

type sle_portlarg from editmask within w_imaging_print
string tag = "resize=frbsr"
integer x = 3653
integer y = 864
integer width = 270
integer height = 80
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 5
string minmax = "100~~300"
end type

type st_explpos from statictext within w_imaging_print
integer x = 2834
integer y = 1588
integer width = 1413
integer height = 152
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Il est possible de déplacer les photos avec la souris dans la partie de gauche"
boolean focusrectangle = false
end type

type shl_def from uo_hyperlink_transparent within w_imaging_print
integer x = 3145
integer y = 1796
integer width = 827
integer height = 68
integer textsize = -10
long backcolor = 15793151
string text = "Mettre les positions par défaut"
alignment alignment = center!
end type

event ue_vrai_clicked;call super::ue_vrai_clicked;//mettre les valeurs par défaut des positions de photos

dw_preview.object.p_1.x = il_x1
dw_preview.object.p_1.y = il_y1

dw_preview.object.p_2.x = il_x2
dw_preview.object.p_2.y = il_y2

dw_preview.object.p_3.x = il_x3
dw_preview.object.p_3.y = il_y3

dw_preview.object.p_4.x = il_x4
dw_preview.object.p_4.y = il_y4

dw_preview.object.p_5.x = il_x5
dw_preview.object.p_5.y = il_y5

dw_preview.object.p_6.x = il_x6
dw_preview.object.p_6.y = il_y6

dw_preview.object.p_7.x = il_x7
dw_preview.object.p_7.y = il_y7

dw_preview.object.p_8.x = il_x8
dw_preview.object.p_8.y = il_y8

dw_preview.object.p_9.x = il_x9
dw_preview.object.p_9.y = il_y9

IF left(dw_preview.dataobject, 17) = "dw_imaging_print2" THEN
	//10 photos
	dw_preview.object.p_10.x = il_x10
	dw_preview.object.p_10.y = il_y10
ELSE
	SetNull(il_x10)
	SetNull(il_y10)
END IF
end event

type st_parm from st_uo_transparent within w_imaging_print
string tag = "resize=frbsr"
integer x = 2638
integer y = 104
integer width = 782
integer height = 64
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 15793151
string text = "Paramètres du montage"
end type

type p_1 from picture within w_imaging_print
string tag = "resize=frb"
integer x = 2528
integer y = 100
integer width = 87
integer height = 72
string picturename = "C:\ii4net\imgpro\autreinfo.jpg"
boolean focusrectangle = false
end type

type p_18 from picture within w_imaging_print
string tag = "resize=frb"
integer x = 123
integer y = 100
integer width = 87
integer height = 72
string picturename = "C:\ii4net\imgpro\listview_picture.bmp"
boolean focusrectangle = false
end type

type st_pp from st_uo_transparent within w_imaging_print
string tag = "resize=frbsr"
integer x = 233
integer y = 104
integer width = 782
integer height = 64
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
long backcolor = 15793151
string text = "Aperçu avant impression"
end type

type st_expl from statictext within w_imaging_print
string tag = "resize=frbsr"
integer x = 233
integer y = 2260
integer width = 1166
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "* Double-cliquez sur l~'image pour la modifier"
boolean focusrectangle = false
end type

type rr_2 from roundrectangle within w_imaging_print
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15793151
integer x = 2423
integer y = 16
integer width = 2190
integer height = 2336
integer cornerheight = 40
integer cornerwidth = 46
end type

type uo_toolbar from u_cst_toolbarstrip within w_imaging_print
event destroy ( )
string tag = "resize=mrb"
integer x = 3502
integer y = 2412
integer width = 507
end type

on uo_toolbar.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_print.event clicked( )
end event

type uo_toolbar2 from u_cst_toolbarstrip within w_imaging_print
event destroy ( )
string tag = "resize=mrb"
integer x = 4087
integer y = 2412
integer width = 507
end type

on uo_toolbar2.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_clicked_anywhere;call super::ue_clicked_anywhere;cb_cancel.event clicked( )
end event

type shl_appliquer from uo_hyperlink_transparent within w_imaging_print
integer x = 3346
integer y = 1136
integer height = 68
integer textsize = -10
long backcolor = 15793151
string text = "Appliquer"
alignment alignment = center!
end type

event ue_vrai_clicked;call super::ue_vrai_clicked;cb_apply.event clicked( )
end event

type st_sel from statictext within w_imaging_print
integer x = 233
integer y = 2380
integer width = 535
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Image sélectionnée:"
boolean focusrectangle = false
end type

type st_dispo from statictext within w_imaging_print
integer x = 2587
integer y = 300
integer width = 535
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Disposition:"
boolean focusrectangle = false
end type

type cb_14 from commandbutton within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 2610
integer y = 2524
integer width = 507
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler Rognage"
end type

event clicked;if gs_langue = 'an' then
	cb_6.text = "Crop"
else
	cb_6.text = "Rognage"
end if
visible = false

dw_preview.object.r_crop.visible = false

end event

type ddlb_montage from u_ddlb within w_imaging_print
string tag = "resize=frbsr"
integer x = 3150
integer y = 296
integer width = 1115
integer height = 948
integer taborder = 80
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean ib_rmbmenu = false
end type

event constructor;call super::constructor;il_progressid = Message.DoubleParm
if gs_langue = 'an' then
	addItem("9 pictures template")
	addItem("10 pictures template")
	addItem("ADO template")
	addItem("CAO template")
else
	addItem("Montage 9 photos")
	addItem("Montage 10 photos")
	addItem("Montage ADO")
	addItem("Montage ACO")
end if
selectItem(1)
il_index = 1

application l_app
l_app = GetApplication()
is_application = l_app.AppName 

IF is_application = "dentitek" THEN
	dw_preview.dataobject = 'dw_imaging_print1'
ELSE
	dw_preview.dataobject = 'dw_imaging_print1_ortho'
END IF

of_charger_position_defaut(dw_preview.dataobject)

uf_insertpictures(dw_preview,false)
dw_preview.event ue_setpos( )
dw_preview.event ue_getpos( )


end event

event selectionchanged;call super::selectionchanged;CHOOSE CASE index 
	CASE 2
		IF is_application = "dentitek" THEN
			dw_preview.dataobject = 'dw_imaging_print2'
		ELSE
			dw_preview.dataobject = 'dw_imaging_print2_ortho'
		END IF
		of_charger_position_defaut(dw_preview.dataobject)
		uf_setmontage10(dw_preview,false)
	CASE 3
		dw_preview.dataobject = 'dw_imaging_print3_ortho'
		of_charger_position_defaut(dw_preview.dataobject)
		uf_montageaco(dw_preview,false)
	CASE 4
		dw_preview.dataobject = 'dw_imaging_print4_ortho'
		of_charger_position_defaut(dw_preview.dataobject)
		uf_montageaco2(dw_preview,false)
	CASE ELSE
		IF is_application = "dentitek" THEN
			dw_preview.dataobject = 'dw_imaging_print1'
		ELSE
			dw_preview.dataobject = 'dw_imaging_print1_ortho'
		END IF
		of_charger_position_defaut(dw_preview.dataobject)
		uf_insertpictures(dw_preview,false)
END CHOOSE

il_index = index

end event

type cb_13 from commandbutton within w_imaging_print
integer x = 1490
integer y = 276
integer width = 594
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "T"
end type

event clicked;string ls_x
// get X position : p_3
ls_x = string(dw_preview.Describe('p_3.X'))

update t_imgsettings set x3 = :ls_x, x6 = :ls_x, x9 = :ls_x;
if gf_sqlerr() then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

dw_preview.Modify('p_6.X='+ls_x)
dw_preview.Modify('p_9.X='+ls_x)

end event

type cb_12 from commandbutton within w_imaging_print
integer x = 887
integer y = 276
integer width = 603
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "T"
end type

event clicked;string ls_x
// get X position : p_2
ls_x = string(dw_preview.Describe('p_2.X'))

update t_imgsettings set x2 = :ls_x, x5 = :ls_x, x8 = :ls_x;
if gf_sqlerr() then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

dw_preview.Modify('p_5.X='+ls_x)
dw_preview.Modify('p_8.X='+ls_x)

end event

type cb_11 from commandbutton within w_imaging_print
integer x = 283
integer y = 276
integer width = 603
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "T"
end type

event clicked;string ls_x
// get X position : p_1
ls_x = string(dw_preview.Describe('p_1.X'))

update t_imgsettings set x1 = :ls_x, x4 = :ls_x, x7 = :ls_x;
if gf_sqlerr() then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

dw_preview.Modify('p_4.X='+ls_x)
dw_preview.Modify('p_7.X='+ls_x)

end event

type cb_10 from commandbutton within w_imaging_print
integer x = 210
integer y = 1596
integer width = 78
integer height = 640
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "|--"
end type

event clicked;string ls_y
// get Y position : p_7
ls_y = string(dw_preview.Describe('p_7.Y'))

update t_imgsettings set y7 = :ls_y, y8 = :ls_y, y9 = :ls_y;
if gf_sqlerr() then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

dw_preview.Modify('p_8.Y='+ls_y)
dw_preview.Modify('p_9.Y='+ls_y)

end event

type cb_9 from commandbutton within w_imaging_print
integer x = 210
integer y = 956
integer width = 78
integer height = 640
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "|--"
end type

event clicked;string ls_y
// get Y position : p_4
ls_y = string(dw_preview.Describe('p_4.Y'))

update t_imgsettings set y4 = :ls_y, y5 = :ls_y, y6 = :ls_y;
if gf_sqlerr() then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

dw_preview.Modify('p_5.Y='+ls_y)
dw_preview.Modify('p_6.Y='+ls_y)

end event

type cb_2 from commandbutton within w_imaging_print
integer x = 210
integer y = 344
integer width = 78
integer height = 612
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "|--"
end type

event clicked;string ls_y
// get Y position : p_1
ls_y = string(dw_preview.Describe('p_1.Y'))

update t_imgsettings set y1 = :ls_y, y2 = :ls_y, y3 = :ls_y;
if gf_sqlerr() then
	commit using SQLCA;
else
	rollback using SQLCA;
end if

dw_preview.Modify('p_2.Y='+ls_y)
dw_preview.Modify('p_3.Y='+ls_y)

end event

type st_8 from statictext within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 3790
integer y = 620
integer width = 169
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "pixels"
boolean focusrectangle = false
end type

type st_7 from statictext within w_imaging_print
integer x = 3963
integer y = 972
integer width = 169
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "pixels"
boolean focusrectangle = false
end type

type st_6 from statictext within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 3790
integer y = 552
integer width = 169
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "pixels"
boolean focusrectangle = false
end type

type st_5 from statictext within w_imaging_print
integer x = 3963
integer y = 856
integer width = 169
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "pixels"
boolean focusrectangle = false
end type

type cb_apply from commandbutton within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 3328
integer y = 2400
integer width = 613
integer height = 104
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Appliquer"
end type

event clicked;integer li_plargeur,li_phauteur,li_occllargeur,li_occlhauteur

li_plargeur = integer(sle_portlarg.text)
li_phauteur = integer(sle_porthaut.text)
li_occllargeur = integer(sle_paylarg.text)
li_occlhauteur = integer(sle_payhaut.text)

IF is_application = "dentitek" THEN
	update t_optiongen set plargeur = :li_plargeur,
								  phauteur = :li_phauteur,
								  occllargeur = :li_occllargeur,
								  occlhauteur = :li_occlhauteur ;
	commit using sqlca;
ELSE
	update t_options set plargeur = :li_plargeur,
								  phauteur = :li_phauteur,
								  occllargeur = :li_occllargeur,
								  occlhauteur = :li_occlhauteur where ortho_id = :v_no_ortho;
	commit using sqlca;
	
END IF

dw_preview.event ue_getpos()
ddlb_montage.event selectionchanged(il_index)
//dw_preview.event ue_retrieve()
end event

type sle_payhaut from singlelineedit within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 3488
integer y = 620
integer width = 251
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type sle_porthaut from singlelineedit within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 3488
integer y = 552
integer width = 251
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type st_pahauteur from statictext within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 2642
integer y = 620
integer width = 832
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Hauteur des photos paysages:"
boolean focusrectangle = false
end type

type st_palargeur from statictext within w_imaging_print
integer x = 2816
integer y = 972
integer width = 832
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Largeur des photos paysages:"
boolean focusrectangle = false
end type

type st_phauteur from statictext within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 2642
integer y = 552
integer width = 832
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Hauteur des photos portraits:"
boolean focusrectangle = false
end type

type st_plargeur from statictext within w_imaging_print
integer x = 2816
integer y = 856
integer width = 832
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Largeur des photos portraits:"
boolean focusrectangle = false
end type

type p_size from picture within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 2533
integer y = 2512
integer width = 165
integer height = 144
boolean originalsize = true
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 4101
integer y = 2408
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

event clicked;//Int li_width, li_height
// 
// p_1.PictureName = "C:\ii4net\orthotek\photo\195\1\195-25-11-2004.jpg"
// p_1.OriginalSize = True
// li_width = UnitsToPixels(p_1.Width, XUnitsToPixels!)
// li_height = UnitsToPixels(p_1.Width, YUnitsToPixels!)
// MessageBox(String(li_width), li_height)
end event

type cb_8 from commandbutton within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 2875
integer y = 2396
integer width = 434
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "- Luminosité"
end type

event clicked;OLEObject myImage
int result

string dwresult

SetPointer(HourGlass!)


MyImage = CREATE OLEObject

result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

myImage.mogrify( "-modulate", "90", w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" + is_imgselected )
myImage.mogrify( "-modulate", "90", w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" + is_imgselected )

dwresult=dw_preview.modify(is_imgpos + ".filename='"+w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" + is_imgselected+"'")



end event

type cb_7 from commandbutton within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 2455
integer y = 2396
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "+ Luminosité"
end type

event clicked;OLEObject myImage
int result

string dwresult

SetPointer(HourGlass!)


MyImage = CREATE OLEObject

result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

myImage.mogrify( "-modulate", "110", w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" + is_imgselected )
myImage.mogrify( "-modulate", "110",w_imaging. is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" + is_imgselected )

dwresult=dw_preview.modify(is_imgpos + ".filename='"+w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" + is_imgselected+"'")

end event

type cb_6 from commandbutton within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 2875
integer y = 2268
integer width = 434
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Rognage"
end type

event clicked;long ll_x, ll_y, ll_w, ll_h
string ls_path, ls_pathsmall

if dw_preview.object.r_crop.visible = '1' then
	long ll_xi, ll_yi, ll_wi, ll_hi, ll_wj, ll_hj, ll_xf, ll_yf, ll_hf, ll_wf
	OLEObject myImage
	int result
	
	string dwresult

	SetPointer(HourGlass!)
	
	if gs_langue = 'an' then
		text = "Crop"
	else
		text = "Rognage"
	end if
	cb_14.visible = false
	dw_preview.object.r_crop.visible = false

	ll_x = long(dw_preview.object.r_crop.x)
	ll_y = long(dw_preview.object.r_crop.y)
	ll_w = long(dw_preview.object.r_crop.width)
	ll_h = long(dw_preview.object.r_crop.height)
	ll_xi = long(dw_preview.describe(is_imgpos + ".x"))
	ll_yi = long(dw_preview.describe(is_imgpos + ".y"))
	ll_wi = long(dw_preview.describe(is_imgpos + ".width"))
	ll_hi = long(dw_preview.describe(is_imgpos + ".height"))
	
	ls_path = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" + is_imgselected
	ls_pathsmall = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" + is_imgselected

	p_size.PictureName = ls_path
	p_size.OriginalSize = True
	ll_wj = UnitsToPixels(p_size.Width, XUnitsToPixels!)
	ll_hj = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	
	ll_xf = long(ll_wj * double((ll_x - ll_xi) / ll_hi))
	ll_yf = long(ll_hj * double((ll_y - ll_yi) / ll_wi))
	ll_hf = long(ll_hj * double(ll_h / ll_hi))
	ll_wf = long(ll_wj * double(ll_w / ll_wi))
	
	run("C:\ii4net\orthotek\convert " + ls_path + " -crop " + string(ll_wf) + "x" + string(ll_hf) + "+" + string(ll_xf) + "+" + string(ll_yf) + " -resize " + string(ll_wj) + "x" + string(ll_hj) + "! " + ls_path, minimized!)

	p_size.PictureName = ls_pathsmall
	p_size.OriginalSize = True
	ll_wj = UnitsToPixels(p_size.Width, XUnitsToPixels!)
	ll_hj = UnitsToPixels(p_size.Height, YUnitsToPixels!)
	
	ll_xf = long(ll_wj * double((ll_x - ll_xi) / ll_hi))
	ll_yf = long(ll_hj * double((ll_y - ll_yi) / ll_wi))
	ll_hf = long(ll_hj * double(ll_h / ll_hi))
	ll_wf = long(ll_wj * double(ll_w / ll_wi))

	run("C:\ii4net\orthotek\convert " + ls_pathsmall + " -crop " + string(ll_wf) + "x" + string(ll_hf) + "+" + string(ll_xf) + "+" + string(ll_yf) + " -resize " + string(ll_wj) + "x" + string(ll_hj) + "! " + ls_pathsmall, minimized!)

	sleep(2)
	
	dwresult=dw_preview.modify(is_imgpos + ".filename='"+ls_path+"'")
else
	text = "Ok"
	cb_14.visible = true
	
	ll_x = long(dw_preview.describe(is_imgpos + ".x"))
	ll_y = long(dw_preview.describe(is_imgpos + ".y"))
	ll_w = long(dw_preview.describe(is_imgpos + ".width"))
	ll_h = long(dw_preview.describe(is_imgpos + ".height"))
	
	dw_preview.object.r_crop.x = ll_x
	dw_preview.object.r_crop.y = ll_y
	dw_preview.object.r_crop.width = ll_w
	dw_preview.object.r_crop.height = ll_h
	dw_preview.object.r_crop.visible = true
end if

end event

type cb_5 from commandbutton within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 2455
integer y = 2268
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Rotation"
end type

event clicked;OLEObject myImage
int result
string dwresult, ls_width, ls_height, ls_angle, ls_path, ls_pathsmall

open(w_rotation)
ls_angle = message.stringParm

if ls_angle = "" then return 0

ls_path = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" + is_imgselected
ls_pathsmall = w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" + is_imgselected

SetPointer(HourGlass!)

MyImage = CREATE OLEObject

result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

if right(ls_angle, 1) = 'R' then
	ls_angle = left(ls_angle, len(ls_angle) - 1)

	p_size.PictureName = ls_path
	p_size.OriginalSize = True
	ls_width = string(UnitsToPixels(p_size.Width, XUnitsToPixels!))
	ls_height = string(UnitsToPixels(p_size.Height, YUnitsToPixels!))

	myImage.mogrify( "-rotate", ls_angle, "-resize", ls_width+"x"+ls_height+"!", ls_path )

	p_size.PictureName = ls_pathsmall
	p_size.OriginalSize = True
	ls_width = string(UnitsToPixels(p_size.Width, XUnitsToPixels!))
	ls_height = string(UnitsToPixels(p_size.Height, YUnitsToPixels!))

	myImage.mogrify( "-rotate", ls_angle, "-resize", ls_width+"x"+ls_height+"!", ls_pathsmall )
else
	run("C:\ii4net\orthotek\convert " + ls_path + " ( +clone -rotate " + ls_angle + " ) -gravity center -compose src -composite " + ls_path, minimized!)
	run("C:\ii4net\orthotek\convert " + ls_pathsmall + " ( +clone -rotate " + ls_angle + " ) -gravity center -compose src -composite " + ls_pathsmall, minimized!)
	
	sleep(2)
end if

dwresult=dw_preview.modify(is_imgpos + ".filename='"+ls_path+"'")
destroy MyImage

end event

type cb_4 from commandbutton within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 2875
integer y = 2140
integer width = 608
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Symétrie Horizontale"
end type

event clicked;OLEObject myImage
int result

string dwresult

SetPointer(HourGlass!)


MyImage = CREATE OLEObject

result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

myImage.mogrify( "-flop", w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" + is_imgselected )
myImage.mogrify( "-flop", w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" + is_imgselected )

dwresult=dw_preview.modify(is_imgpos + ".filename='"+w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" + is_imgselected+"'")


end event

type st_1 from statictext within w_imaging_print
string tag = "resize=frbsr"
integer x = 782
integer y = 2372
integer width = 1115
integer height = 88
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean border = true
boolean focusrectangle = false
end type

type cb_3 from commandbutton within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 2313
integer y = 2140
integer width = 544
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Symétrie Verticale"
end type

event clicked;OLEObject myImage
int result

string dwresult

SetPointer(HourGlass!)


MyImage = CREATE OLEObject

result = myImage.ConnectToNewObject ("ImageMagickObject.MagickImage")

myImage.mogrify( "-flip", w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" + is_imgselected )
myImage.mogrify( "-flip", w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\small\" + is_imgselected )

dwresult=dw_preview.modify(is_imgpos + ".filename='"+w_imaging.is_pathphoto+"\"+w_imaging.is_imgfolder+"\"+string(il_progressid)+"\" + is_imgselected+"'")


end event

type cb_cancel from commandbutton within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 1851
integer y = 2428
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fermer"
boolean cancel = true
end type

event clicked;w_imaging.event get_image();

close(w_imaging_print)
end event

type cb_print from commandbutton within w_imaging_print
string tag = "resize=n"
boolean visible = false
integer x = 1431
integer y = 2428
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Imprimer"
end type

event clicked;string ls_mail[], ls_courriel
long k

dw_preview.event ue_getpos()


//printsetup()

datastore ds_imgprint
ds_imgprint = create datastore
CHOOSE CASE il_index 
	CASE 2
		ds_imgprint.dataobject = 'dw_imaging_print2_ortho'
	CASE 3
		ds_imgprint.dataobject = 'dw_imaging_print3_ortho'
	CASE 4
		ds_imgprint.dataobject = 'dw_imaging_print4_ortho'
	CASE ELSE
		ds_imgprint.dataobject = 'dw_imaging_print1_ortho'
	
END CHOOSE
		
ds_imgprint.SetTransObject(SQLCA)

CHOOSE CASE il_index 
	CASE 2
		uf_setmontage10(ds_imgprint,true)
	CASE 3
		uf_montageaco(ds_imgprint, true)
	CASE 4
		uf_montageaco2(ds_imgprint, true)
	CASE ELSE
		uf_insertpictures(ds_imgprint,true)
END CHOOSE

SetPointer(HourGlass!)

k = 1
DECLARE listemail CURSOR FOR 

	select top 3 courriel from (
		select email as courriel from t_contact where patient_id = :il_patid and isnull(email,'') <> ''
		union
		select email from patient where patient_id = :il_patid and isnull(email,'') <> ''
		union
		select email2 from patient where patient_id = :il_patid and isnull(email2,'') <> ''
		union
		select email3 from patient where patient_id = :il_patid and isnull(email3,'') <> ''
	) as t_courlist;

OPEN listemail;

	FETCH listemail INTO :ls_mail[k];
		
	DO WHILE SQLCA.SQLCODE = 0
		k++
		FETCH listemail INTO :ls_mail[k];
	LOOP
CLOSE listemail;


ls_courriel = unsplit(ls_mail,';')

/*
select isnull(email,''), isnull(email2,''), isnull(email3,'') 
	into :ls_email, :ls_email2,:ls_email3 
from patient where patient_id = :il_patid;

ls_courriel = ls_email
if not isnull(ls_email2) and ls_email2 <> "" then ls_courriel += ";" + ls_email2
if not isnull(ls_email3) and ls_email3 <> "" then ls_courriel +=	';' + ls_email3 
*/

gnv_app.inv_entrepotglobal.of_ajoutedonnee("impemail",ls_courriel)

gb_datawindow = false
openwithparm(w_print_options,ds_imgprint)
destroy ds_imgprint
end event

type dw_preview from u_dw within w_imaging_print
event ue_retrieve ( )
event ue_getpos ( )
event ue_setpos ( )
event key pbm_dwnkey
event lbuttonup pbm_lbuttonup
event ue_drop ( )
integer x = 283
integer y = 348
integer width = 1801
integer height = 1888
integer taborder = 10
boolean vscrollbar = false
boolean livescroll = false
borderstyle borderstyle = stylebox!
boolean ib_isupdateable = false
boolean ib_rmbmenu = false
boolean ib_rmbfocuschange = false
string is_updatesallowed = ""
end type

event ue_getpos();//Long ll_x=0, ll_y=0
string ls_x1, ls_x2, ls_x3, ls_x4, ls_x5, ls_x6, ls_x7, ls_x8, ls_x9, ls_x10
string ls_y1, ls_y2, ls_y3, ls_y4, ls_y5, ls_y6, ls_y7, ls_y8, ls_y9, ls_y10
long ll_count

// get position : p_1
ls_x1 = string(this.Describe('p_1.X'))
ls_y1 = string(this.Describe('p_1.Y'))
// get position : p_2
ls_x2 = string(this.Describe('p_2.X'))
ls_y2 = string(this.Describe('p_2.Y'))
// get position : p_3
ls_x3 = string(this.Describe('p_3.X'))
ls_y3 = string(this.Describe('p_3.Y'))
// get position : p_4
ls_x4 = string(this.Describe('p_4.X'))
ls_y4 = string(this.Describe('p_4.Y'))
// get position : p_5
ls_x5 = string(this.Describe('p_5.X'))
ls_y5 = string(this.Describe('p_5.Y'))
// get position : p_6
ls_x6 = string(this.Describe('p_6.X'))
ls_y6 = string(this.Describe('p_6.Y'))
// get position : p_7
ls_x7 = string(this.Describe('p_7.X'))
ls_y7 = string(this.Describe('p_7.Y'))
// get position : p_8
ls_x8 = string(this.Describe('p_8.X'))
ls_y8 = string(this.Describe('p_8.Y'))
// get position : p_9
ls_x9 = string(this.Describe('p_9.X'))
ls_y9 = string(this.Describe('p_9.Y'))
// get position : p_10
ls_x10 = string(this.Describe('p_10.X'))
ls_y10 = string(this.Describe('p_10.Y'))

select count(*) into :ll_count from t_imgsettings;
if ll_count = 0 then
	insert into t_imgsettings(x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,y1,y2,y3,y4,y5,y6,y7,y8,y9,y10) 
	values(:ls_x1,:ls_x2,:ls_x3,:ls_x4,:ls_x5,:ls_x6,:ls_x7,:ls_x8,:ls_x9,:ls_x10,
			 :ls_y1,:ls_y2,:ls_y3,:ls_y4,:ls_y5,:ls_y6,:ls_y7,:ls_y8,:ls_y9,:ls_y10);
else
	update t_imgsettings set 	x1 = :ls_x1,
										x2 = :ls_x2,
										x3 = :ls_x3,
										x4 = :ls_x4,
										x5 = :ls_x5,
										x6 = :ls_x6,
										x7 = :ls_x7,
										x8 = :ls_x8,
										x9 = :ls_x9,
										x10 = :ls_x10,
										y1 = :ls_y1, 
										y2 = :ls_y2, 
										y3 = :ls_y3,
										y4 = :ls_y4,
										y5 = :ls_y5,
										y6 = :ls_y6,
										y7 = :ls_y7,
										y8 = :ls_y8,
										y9 = :ls_y9,
										y10 = :ls_y10;
end if
if gf_sqlerr() then
	commit using SQLCA;
else
	rollback using SQLCA;
end if
end event

event ue_setpos();long	ll_count
string ls_x1,ls_x2,ls_x3,ls_x4,ls_x5,ls_x6,ls_x7,ls_x8,ls_x9, ls_x10
string ls_y1,ls_y2,ls_y3,ls_y4,ls_y5,ls_y6,ls_y7,ls_y8,ls_y9, ls_y10

select 	x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,
			y1,y2,y3,y4,y5,y6,y7,y8,y9,y10
into 		:ls_x1,:ls_x2,:ls_x3,:ls_x4,:ls_x5,:ls_x6,:ls_x7,:ls_x8,:ls_x9,:ls_x10,
			:ls_y1,:ls_y2,:ls_y3,:ls_y4,:ls_y5,:ls_y6,:ls_y7,:ls_y8,:ls_y9,:ls_y10
from 		t_imgsettings;

select count(*) into :ll_count from t_imgsettings;
if ll_count > 0 then

	// set position : p_1
	this.Modify('p_1.X='+ls_x1)
	this.Modify('p_1.Y='+ls_y1)
	
	// set position : p_2
	this.Modify('p_2.X='+ls_x2)
	this.Modify('p_2.Y='+ls_y2)
	
	// set position : p_3
	this.Modify('p_3.X='+ls_x3)
	this.Modify('p_3.Y='+ls_y3)
	
	// set position : p_4
	this.Modify('p_4.X='+ls_x4)
	this.Modify('p_4.Y='+ls_y4)
	
	// set position : p_5
	this.Modify('p_5.X='+ls_x5)
	this.Modify('p_5.Y='+ls_y5)
	
	// set position : p_6
	this.Modify('p_6.X='+ls_x6)
	this.Modify('p_6.Y='+ls_y6)
	
	// set position : p_7
	this.Modify('p_7.X='+ls_x7)
	this.Modify('p_7.Y='+ls_y7)
	
	// set position : p_8
	this.Modify('p_8.X='+ls_x8)
	this.Modify('p_8.Y='+ls_y8)
	
	// set position : p_9
	this.Modify('p_9.X='+ls_x9)
	this.Modify('p_9.Y='+ls_y9)
	
	// set position : p_10
	//RegistryGet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\img","X10", RegString!, ls_x)
	//RegistryGet("HKEY_LOCAL_MACHINE\Software\progitek\orthotek\img","Y10", RegString!, ls_y)
	this.Modify('p_10.X='+ls_x10)
	this.Modify('p_10.Y='+ls_y10)
END IF
end event

event key;if left(is_imgpos, 1) = 'p' then
	choose case key
		case keyUpArrow!
			modify(is_imgpos + ".Y='"+ string(long(describe(is_imgpos + ".Y")) - 1) + "'")
		case keyDownArrow!
			modify(is_imgpos + ".Y='"+ string(long(describe(is_imgpos + ".Y")) + 1) + "'")
		case keyLeftArrow!
			modify(is_imgpos + ".X='"+ string(long(describe(is_imgpos + ".X")) - 1) + "'")
		case keyRightArrow!
			modify(is_imgpos + ".X='"+ string(long(describe(is_imgpos + ".X")) + 1) + "'")
	end choose
	SetRedraw(true)
end if

end event

event lbuttonup;event post ue_drop()
end event

event ue_drop();if ib_dragcrop then
	long ll_x, ll_y, ll_w, ll_h
	double ldb_ratioasporg, ldb_ratioaspfin
	
	ll_x = long(describe(is_imgpos + ".x"))
	ll_y = long(describe(is_imgpos + ".y"))
	ll_w = long(describe(is_imgpos + ".width"))
	ll_h = long(describe(is_imgpos + ".height"))
	
	ldb_ratioasporg = ll_w / double(ll_h)
	ldb_ratioaspfin = long(object.r_crop.width) / double(object.r_crop.height)

	if ldb_ratioasporg < ldb_ratioaspfin then
		object.r_crop.width = long(long(object.r_crop.height) * ldb_ratioasporg)
	elseif ldb_ratioasporg > ldb_ratioaspfin then
		object.r_crop.height = long(long(object.r_crop.width) / ldb_ratioasporg)
	end if

	if long(object.r_crop.width) > ll_w or long(object.r_crop.height) > ll_h then
		object.r_crop.width = ll_w
		object.r_crop.height = ll_h
		object.r_crop.x = ll_x
		object.r_crop.y = ll_y
	end if
	
	if long(object.r_crop.x) < ll_x then
		object.r_crop.x = ll_x
	elseif long(object.r_crop.x) + long(object.r_crop.width) > ll_x + ll_w then
		object.r_crop.x = ll_x + ll_w - long(object.r_crop.width)
	end if
	
	if long(object.r_crop.y) < ll_y then
		object.r_crop.y = ll_y
	elseif long(object.r_crop.y) + long(object.r_crop.height) > ll_y + ll_h then
		object.r_crop.y = ll_y + ll_h - long(object.r_crop.height)
	end if
	
	ib_dragcrop = false
end if

end event

event constructor;SetTransObject(SQLCA)



end event

event clicked;string img_type
integer	li_arr

if left(dwo.name, 2) = 'p_' then
	IF dwo.tag <> "?" THEN
		st_1.text = dwo.tag
	END IF
	
	this.modify(is_imgpos + ".border=0")
	is_imgpos = dwo.name
	
	li_arr = integer(mid(dwo.name, 3))+3
	
	IF li_arr > UpperBound(is_image) THEN RETURN
	
	img_type = is_image[li_arr]
	
	choose case img_type
			
			case "Frontal"
				is_imgselected = is_imagename.frontal
			
			case "Frontal smile"
				is_imgselected = is_imagename.front_smile
			
			case "Lateral"
				is_imgselected = is_imagename.lateral
			
			case "Anterior occlusion"
				is_imgselected = is_imagename.anterioroccl
			
			case "Left occlusion"
				is_imgselected = is_imagename.leftoccl
		
			case "Lower occlusion"
				is_imgselected = is_imagename.loweroccl	
			
			case "Right occlusion"
				is_imgselected = is_imagename.rightoccl
				
			case "Upper occlusion"
				is_imgselected = is_imagename.upperoccl
				
			case "Xray 1"
				is_imgselected = is_imagename.xray3_1
				
			case "Xray 2"
				is_imgselected = is_imagename.xray3_2

			case "logo"
				is_imgselected = is_imagename.logo
				
			case "imagesupp", "image_10"
				is_imgselected = is_imagename.imagesupp
				
		end choose
	
	dwo.border = 6
	
	cb_3.enabled = true
	cb_4.enabled = true
	cb_5.enabled = true
	cb_6.enabled = true
	cb_7.enabled = true
	cb_8.enabled = true
	ib_dragcrop = false
elseif dwo.name = 'r_crop' then
	ib_dragcrop = true
else
	ib_dragcrop = false
end if

end event

event doubleclicked;if left(dwo.name, 2) = 'p_' then
	string img_type
	s_imaging_parm lstr_imgparm
	
	lstr_imgparm.sl_patid = il_patid
	lstr_imgparm.sl_progressid = il_progressid
	
	img_type = is_image[integer(mid(dwo.name, 3)) + 3]
	
	choose case img_type
			
			case "Frontal"
				is_imgselected = is_imagename.frontal
			
			case "Frontal smile"
				is_imgselected = is_imagename.front_smile
			
			case "Lateral"
				is_imgselected = is_imagename.lateral
			
			case "Anterior occlusion"
				is_imgselected = is_imagename.anterioroccl
			
			case "Left occlusion"
				is_imgselected = is_imagename.leftoccl
		
			case "Lower occlusion"
				is_imgselected = is_imagename.loweroccl	
			
			case "Right occlusion"
				is_imgselected = is_imagename.rightoccl
				
			case "Upper occlusion"
				is_imgselected = is_imagename.upperoccl
				
			case "Xray 1"
				is_imgselected = is_imagename.xray3_1
				
			case "Xray 2"
				is_imgselected = is_imagename.xray3_2

			case "logo"
				is_imgselected = is_imagename.logo
				
			case "imagesupp", "image_10"
				is_imgselected = is_imagename.imagesupp
				
		end choose
	
	lstr_imgparm.ss_imgname = is_imgselected
	opensheetwithparm(w_modimg, lstr_imgparm ,gw_frame,2,layered!)
end if

end event

type gb_dim from groupbox within w_imaging_print
integer x = 2757
integer y = 744
integer width = 1554
integer height = 532
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Dimension des photos"
end type

type gb_pos from groupbox within w_imaging_print
integer x = 2757
integer y = 1492
integer width = 1554
integer height = 400
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Position des photos"
end type

type rr_1 from roundrectangle within w_imaging_print
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15780518
integer x = 32
integer y = 16
integer width = 2304
integer height = 2500
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_3 from roundrectangle within w_imaging_print
string tag = "resize=frbsr"
long linecolor = 8421504
integer linethickness = 4
long fillcolor = 15793151
integer x = 91
integer y = 80
integer width = 2171
integer height = 108
integer cornerheight = 75
integer cornerwidth = 75
end type

type rr_4 from roundrectangle within w_imaging_print
string tag = "resize=frbsr"
long linecolor = 8421504
integer linethickness = 4
long fillcolor = 15793151
integer x = 2496
integer y = 80
integer width = 2030
integer height = 108
integer cornerheight = 75
integer cornerwidth = 75
end type

