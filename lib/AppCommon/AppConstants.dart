//APP Related Information

const APP_NAME = "TEST APP";
const APPSTORELINK = "";
const PLAYSTORELINK = "";

/* font sizes*/
const textSizeSmall = 12.0;
const textSizeSMedium = 14.0;
const textSizeMedium = 16.0;
const textSizeLargeMedium = 18.0;
const textSizeNormal = 20.0;
const textSizeLarge = 24.0;
const textSizeXLarge = 30.0;

/*SharedPreferences Variables*/
const ISAUTOLOGIN             = "ISAUTOLOGIN";
const LOGINDATA               = "LOGINDATA";


/*API Related Constant */
const BASEURL = "https://cupidknot.kuldip.dev/";

const RECORDPERPAGE                   = 50;
const SAVEDSEARCHRECORD               = 500;
//User Related API
const API_USER                        = "api/";
const API_LOGIN                       = API_USER + "login";
const API_REGISTERUSER                = API_USER + "register";
const API_LOGOUT                      = API_USER + "logout";
const API_PROFILE                     = API_USER + "user";
const API_GETUSERLIST                 = API_USER + "users";
const API_UPDATEPROFILE               = API_USER + "update_user";
//////



//ERROR Message
const NOINTERNETCONNECTION =
    "No internet connection. Please check your internet connection and try again.";
//Status code 400
const INVALIDREQUEST = "User does not exist or invalid username or password.";
//Status code 401
const UNAUTHORIZEDACCESS = "Unauthorized Access.";
//Status code 403
const FORBIDDENREQUEST = "You don't have permission to access this.";
//Status code 404
const PAGENOTFOUND = "This link is no longer available.";
//Status code 500
const INTERNALSERVER =
    "Internal server error. Please try again after sometime.";
//Status code 503
const SERVERUNAVAILABLE =
    "Internal server error. Please try again after sometime.";
//Other Status Code if any
const OTHERISSUE =
    "Error occured while Communication with Server with StatusCode : ";

