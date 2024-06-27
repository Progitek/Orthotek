$PBExportHeader$uo_conn_info.sru
forward
global type uo_conn_info from nonvisualobject
end type
end forward

global type uo_conn_info from nonvisualobject
event nb_conn ( )
end type
global uo_conn_info uo_conn_info

forward prototypes
public subroutine of_nbconn (ref integer ai_nbconn)
end prototypes

event nb_conn();//verifier si il y a plus d'une connection a la base
string s_command, sName, sUserid, sLastReqTime, sProcessTime, sReqType, sCommLink, sNodeAddr, sNumber, sDBNumber, sPort, sLastidle, sCurrTaskSw 
string sBlockedOn,sLockName, sUncmtOps 
integer ai_conn = 0

DECLARE conn_info PROCEDURE FOR dbo.sa_conn_info; 
EXECUTE conn_info; 


	IF SQLCA.SQLCode <> 0 THEN 
		MessageBox("DB Error", SQLCA.SQLErrText) 
	END IF 


	do while sqlca.sqlcode = 0 
		
		FETCH conn_info 
		
		INTO  :sNumber, 
				:sName, 
				:sUserid, 
				:sDBNumber, 
				:sLastReqTime, 
				:sProcessTime, 
				:sPort, 
				:sReqType, 
				:sCommLink, 
				:sNodeAddr, 
				:sLastidle, 
				:sCurrTaskSw, 
				:sBlockedOn,
				:sLockName,
				:sUncmtOps; 
		  
// nodeaddr", sNumber+"/"+sName+"/"+sUserid+"/"+sDBNumber+"/"+sPort+"/"+sCommLink+"/"+sNodeAddr) 
//	s_command = "DROP CONNECTION " + sNumber 
	
//	messagebox("sql", s_command) 
//         EXECUTE IMMEDIATE :sNumber; 
	
	IF SQLCA.SQLCode <> 0 THEN 
		 MessageBox("DB Error", SQLCA.SQLErrText) 
	else 
		 ai_conn++
		 messagebox("User dropped", "Dropped connection # " + sNumber) 
	END IF 
loop 
messagebox('Nb',string(ai_conn))

CLOSE conn_info; 
end event

public subroutine of_nbconn (ref integer ai_nbconn);string s_command, sName, sUserid, sLastReqTime, sProcessTime, sReqType, sCommLink, sNodeAddr, sNumber, sDBNumber, sPort, sLastidle, sCurrTaskSw 
string sBlockedOn,sLockName, sUncmtOps 
ai_nbconn = 0

DECLARE conn_info PROCEDURE FOR dbo.sa_conn_info; 
EXECUTE conn_info; 


	IF SQLCA.SQLCode <> 0 THEN 
		MessageBox("DB Error", SQLCA.SQLErrText) 
	END IF 


	do while sqlca.sqlcode = 0 
		
		FETCH conn_info 
		
		INTO  :sNumber, 
				:sName, 
				:sUserid, 
				:sDBNumber, 
				:sLastReqTime, 
				:sProcessTime, 
				:sPort, 
				:sReqType, 
				:sCommLink, 
				:sNodeAddr, 
				:sLastidle, 
				:sCurrTaskSw, 
				:sBlockedOn,
				:sLockName,
				:sUncmtOps; 
		  
// nodeaddr", sNumber+"/"+sName+"/"+sUserid+"/"+sDBNumber+"/"+sPort+"/"+sCommLink+"/"+sNodeAddr) 
//	s_command = "DROP CONNECTION " + sNumber 
	
//	messagebox("sql", s_command) 
//         EXECUTE IMMEDIATE :sNumber; 
	
	IF SQLCA.SQLCode <> 0 THEN 
		 MessageBox("DB Error", SQLCA.SQLErrText) 
	else 
		 ai_nbconn++
		 messagebox("User dropped", "Dropped connection # " + sNumber) 
	END IF 
loop 
messagebox('Nb',string(ai_nbconn))

CLOSE conn_info;
end subroutine

on uo_conn_info.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_conn_info.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

