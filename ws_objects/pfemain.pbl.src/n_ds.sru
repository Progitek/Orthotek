$PBExportHeader$n_ds.sru
$PBExportComments$Extension Datastore class
forward
global type n_ds from pro_n_ds
end type
end forward

global type n_ds from pro_n_ds
end type
global n_ds n_ds

type variables
public:

// Type d'imprimante
constant integer RAPPORT = 1
constant integer ETIQUETTE = 10
constant integer P-TOUCH = 15
constant integer COUPON = 20
end variables

on n_ds.create
call super::create
end on

on n_ds.destroy
call super::destroy
end on

