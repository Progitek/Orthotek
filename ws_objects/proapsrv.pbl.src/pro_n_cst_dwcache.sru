﻿$PBExportHeader$pro_n_cst_dwcache.sru
$PBExportComments$(PRO) Extension DataWindow Caching service
forward
global type pro_n_cst_dwcache from pfc_n_cst_dwcache
end type
end forward

global type pro_n_cst_dwcache from pfc_n_cst_dwcache
end type
global pro_n_cst_dwcache pro_n_cst_dwcache

on pro_n_cst_dwcache.create
TriggerEvent( this, "constructor" )
end on

on pro_n_cst_dwcache.destroy
TriggerEvent( this, "destructor" )
end on

