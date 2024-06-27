$PBExportHeader$w_biometrie_password.srw
forward
global type w_biometrie_password from window
end type
type cb_1 from commandbutton within w_biometrie_password
end type
type uo_biometrie from pro_u_biometrie within w_biometrie_password
end type
type fpctrl_sensor_info from structure within w_biometrie_password
end type
type fpctrl_set_initparam from structure within w_biometrie_password
end type
type fpminu_minu_pos from structure within w_biometrie_password
end type
type fpverify_select_minu from structure within w_biometrie_password
end type
type fpverify_verify_result from structure within w_biometrie_password
end type
type point from structure within w_biometrie_password
end type
type fpdb_system_info from structure within w_biometrie_password
end type
type fpdb_enroll_info from structure within w_biometrie_password
end type
type fpdb_verify_info from structure within w_biometrie_password
end type
type fpdb_group_identify from structure within w_biometrie_password
end type
type fpdb_user_info from structure within w_biometrie_password
end type
type fpdb_enroll_dialog_info from structure within w_biometrie_password
end type
type fpdb_verify_dialog_info from structure within w_biometrie_password
end type
type fpdb_live_image_dialog_info from structure within w_biometrie_password
end type
type fpdb_verify_event_data from structure within w_biometrie_password
end type
type fpdb_minutiae_dialog_info from structure within w_biometrie_password
end type
type fpdb_minutiae_info from structure within w_biometrie_password
end type
end forward

type FPCTRL_SENSOR_INFO from structure
	integer		nRow
	integer		nColumn
	string		Version
end type

type FPCTRL_SET_INITPARAM from structure
	byte		DTR
	byte		DCR
	byte		PGC
	byte		DMY
	integer		SROW
	integer		SCOL
	integer		EROW
	integer		ECOL
end type

type FPMINU_MINU_POS from structure
	integer		x
	integer		y
end type

type fpverify_select_minu from structure
	long		minutiae
	long		nminutiae
end type

type fpverify_verify_result from structure
	long		machcnt
	long		securitylevelmach[6]
	long		securitylevelthreshold[6]
end type

type point from structure
	long		x
	long		y
end type

type fpdb_system_info from structure
	systemtime		lastupdate
	byte		databaseid[16]
	long		sensor
	byte		auth360
	byte		autogainctrl
	byte		biometric
	byte		imagerotate
	byte		iccardreager[64]
	long		iccardtype
	long		securitylevel
	byte		reserved[144]
	byte		freesystemdata[256]
end type

type fpdb_enroll_info from structure
	long		enrolltimelimit
	byte		maxfingernum
	byte		enrollguidance
	byte		enrollgridline
	byte		reserved[57]
end type

type fpdb_verify_info from structure
	long		verifytimelimit
	long		privfpauth
	long		privhotkeyauth
	byte		verifydispfinger
	byte		verifygridline
	byte		verifyfaillimit
	byte		verifyusehotkey
	long		verifyhotkeytype1
	long		verifyhotkeykey1
	long		verifyhotkeytype2
	long		verifyhotkeykey2
	byte		reserved[32]
end type

type fpdb_group_identify from structure
	integer		usgroup1
	integer		usgroup2
	integer		usgroup3
	integer		usgroup4
	byte		reserved[8]
end type

type fpdb_user_info from structure
	systemtime		stlastupdate
	long		priv
	long		userid
	string		hotkeyid
	string		hotkeypass
	long		securitylevel
	long		fpsize
	long		fpdata
	byte		freeuserdata[16]
	byte		reserved[18]
end type

type fpdb_enroll_dialog_info from structure
	byte		reserved[3]
	byte		modeless
	long		fpballoonhelp
	long		fphintbutton
	long		fphelpbutton
	byte		balloonhelp
	byte		hintbutton
	byte		helpbutton
	byte		dispwatermark
	point		point
	unsignedlong		parents
end type

type fpdb_verify_dialog_info from structure
	byte		reserved[3]
	byte		modeless
	byte		dispwatermark
	byte		notdispwindow
	point		point
	unsignedlong		parents
end type

type fpdb_live_image_dialog_info from structure
	unsignedlong		parents
	point		point
	byte		modeless
	byte		reserved[3]
end type

type fpdb_verify_event_data from structure
	long		result
end type

type fpdb_minutiae_dialog_info from structure
	long		sensor
	byte		auth360
	byte		autogainctrl
	byte		biometric
	byte		imagerotate
	string		iccardreader[64]
	long		iccardtype
	long		securitylevel
	long		verifytimelimit
	byte		verifydispfinger
	byte		verifygridline
	byte		verifyfaillimit
	byte		notdispwindow
	unsignedlong		parents
	point		point
	byte		dispwatermark
	byte		modeless
	byte		reserved[3]
end type

type fpdb_minutiae_info from structure
	byte		minutiae
	long		nminutiae
	long		nqualitylevel
end type

global type w_biometrie_password from window
integer width = 951
integer height = 1372
boolean titlebar = true
string title = "Identification"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event of_identification ( )
cb_1 cb_1
uo_biometrie uo_biometrie
end type
global w_biometrie_password w_biometrie_password

type prototypes
FUNCTION int vbfpctrlInit(int fpctrlParam) LIBRARY "FPVBWRAP.DLL" //ACheck
FUNCTION integer vbfpctrlOpenSensor() LIBRARY "FPVBWRAP.DLL" ALIAS FOR "fpctrlOpenSensor"
FUNCTION int fpctrlInit(int fpctrlParam) LIBRARY "fpctrl.DLL"
FUNCTION int fpctrlOpenSensor() LIBRARY "fpctrl.DLL"
FUNCTION int fpctrlCloseSensor() LIBRARY "fpctrl.DLL"
FUNCTION int fpctrlSetLed() LIBRARY "fpctrl.DLL"
FUNCTION int fpctrlSensorInformation(ref FPCTRL_SENSOR_INFO SensorInfo) LIBRARY "fpctrl.DLL" //ACheck
//SUBROUTINE fpctrlSetParameter() LIBRARY "fpctrl.DLL"
FUNCTION int fpctrlGetImage(ref string Image, ref int Status) LIBRARY "fpctrl.DLL" //ACheck
//FUNCTION int fpctrlSetUSBDeviceID(ULong DeviceID) LIBRARY "fpctrl.DLL"
FUNCTION int fpctrlCheckDust() LIBRARY "fpctrl.DLL" //ACheck
FUNCTION int fpctrlCheckSensorConnect() LIBRARY "fpctrl.DLL"
FUNCTION int fpctrlQueryFingerprintImage(ref byte Image) LIBRARY "fpctrl.DLL" //ACheck
//-FUNCTION int fpctrlSetEventFunction(boolean pEventFunc, LPVOID pParam, int TimeOut) LIBRARY "fpctrl.DLL"
//-ENVENTPROC
SUBROUTINE fpminuInit(int fpminuParam) LIBRARY "fpminu.DLL" //ACheck
//SUBROUTINE fpminuAlloc(int MinutiaeCnt) LIBRARY "fpminu.DLL"
//fpminufree()
//fpminuAllocSize()
FUNCTION int fpminuGetMinutiae(ref byte Image, ref byte Minutiae, long nMaxMinutiae) LIBRARY "fpminu.DLL" //ACheck
SUBROUTINE fpminuGetMinutiaePos(ref byte Minutiae, int nMinutiae,ref FPMINU_MINU_POS MinuPos) LIBRARY "fpminu.DLL"
FUNCTION int fpminuQualityLevel(ref byte Minutiae, int nMinutiae) LIBRARY "fpminu.DLL"
FUNCTION int fpminuQualityLevelValue() LIBRARY "fpminu.DLL"
FUNCTION int fpverifySelectMinutiae(ref FPVERIFY_SELECT_MINU MinutiaeList, int SamCount) LIBRARY "fpverify.DLL"
FUNCTION int fpverifyVerifyMinutiae(ref byte Minutiae1, long nMinutiae1, ref byte Minutiae2, long nMinutiae) LIBRARY "fpverify.DLL"
FUNCTION int fpverifySecturityLevel(long SecurityLevel) LIBRARY "fpverify.DLL"
FUNCTION int fpverifyAllowableRotate(long verifyAngle) LIBRARY "fpverify.DLL"
SUBROUTINE fpverifyVerifyResult(ref FPVERIFY_VERIFY_RESULT VerifyResult) LIBRARY "fpverify.DLL"
FUNCTION int fpdbInit(ref string DatabasePath, ref string DatabaseId, ref string AdminId, ref string AdminPass) LIBRARY "FPDATABASE.DLL"
FUNCTION int fpdbOpen(string DatabasePath, string DatabaseId) LIBRARY "fpdatabase.DLL"
FUNCTION int fbdpSetSystem(FPDB_SYSTEM_INFO Fsi, FPDB_ENROLL_INFO Fei, FPDB_VERIFY_INFO Fvi) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbGetSystem(FPDB_SYSTEM_INFO Fsi, FPDB_ENROLL_INFO Fei, FPDB_VERIFY_INFO Fvi) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbAddGroup(ref FPDB_GROUP_IDENTIFY Fgid) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbDeleteGroup(ref FPDB_GROUP_IDENTIFY Fgid) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbSetGroupUsers(ref FPDB_GROUP_IDENTIFY Fgid, ref long UserID, long Num) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbGetGroupUsers(ref FPDB_GROUP_IDENTIFY Fgid, ref long UserID, ref long Num) LIBRARY "fpdatabase.DLL"
FUNCTION int fpbdGetGroups(ref FPDB_GROUP_IDENTIFY Fgid, ref long Num) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbAddUser(ref long UserId) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbDeleteUser(long UserId) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbSetUserInfo(long UserID, ref FPDB_USER_INFO Fui, ref boolean AllData) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbGetUserInfo(long UserID, ref FPDB_USER_INFO Fui, ref boolean AllData) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbEnroll(ref FPDB_ENROLL_INFO Fei, ref FPDB_ENROLL_DIALOG_INFO Fedi, ref byte FpData, ref uint FpSize) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbVerify(ref FPDB_VERIFY_INFO Fvi, ref FPDB_VERIFY_DIALOG_INFO Fvdi, uint UserId) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbIdentify(ref FPDB_VERIFY_INFO Fvi, ref FPDB_VERIFY_DIALOG_INFO Fvdi, ref FPDB_GROUP_IDENTIFY Fgid, long GroupNum, ref long UserId, ref uint UserNum) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbLiveImage(ref FPDB_LIVE_IMAGE_DIALOG_INFO Flidi, ref long ImageData) LIBRARY "fpdatabase.DLL"
//FUNCTION int fpdbSetGuiFunction(ref FPDB_GUI_EVENTPROC EventProc, LPVOID Param) LIBRARY "fpdatabase.DLL"
//FUNCTION boolean fpdb_gui_eventproc(int Events, LPVOID Data, LPVOID Param) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbCloseGui() LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbGetMinutiae(ref FPDB_MINUTIAE_INFO Fmi, ref FPDB_MINUTIAE_DIALOG_INFO Fmdi, int nMaxMinutiae) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbVerifyMinutiae(ref FPDB_MINUTIAE_DIALOG_INFO Fmdia, Byte VerifyMode, ref Long FingerData, Long FingerSize) LIBRARY "fpdatabase.DLL"
//FUNCTION int fpdbFirmUpdate(boolean bForce) LIBRARY "fpdatabase.DLL"
FUNCTION int fpdbVerifyFpData(ref byte FpData, long FpSize, ref FPDB_MINUTIAE_INFO Fmi, long SecurityLevel) LIBRARY "fpdatabase.DLL"

end prototypes

type variables

end variables

forward prototypes
public function integer of_setbioscan (long al_id, character ac_type)
public function string of_getbioscan ()
end prototypes

event of_identification();Long ll_id
ll_id = uo_biometrie.of_getid()
//w_cincoutreg.of_identification(ll_id)
end event

public function integer of_setbioscan (long al_id, character ac_type);uo_biometrie.of_registersingleprintshortu( al_id, ac_type, al_id)
return 1
end function

public function string of_getbioscan ();String ls_result
ls_result = uo_biometrie.of_identifyquick("5")
return ls_result
end function

on w_biometrie_password.create
this.cb_1=create cb_1
this.uo_biometrie=create uo_biometrie
this.Control[]={this.cb_1,&
this.uo_biometrie}
end on

on w_biometrie_password.destroy
destroy(this.cb_1)
destroy(this.uo_biometrie)
end on

event open;uo_biometrie.of_setimagedisplaymode()
end event

type cb_1 from commandbutton within w_biometrie_password
integer x = 32
integer y = 1308
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Register"
end type

event clicked;//Integer li_i
//li_i = 1223
//uo_biometrie.of_registersingleprintshortu( li_i, 'p', 'simon1')
end event

type uo_biometrie from pro_u_biometrie within w_biometrie_password
integer x = 5
integer y = 4
integer width = 910
integer taborder = 20
end type

on uo_biometrie.destroy
call pro_u_biometrie::destroy
end on

