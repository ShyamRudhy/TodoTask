import 'package:flutter/material.dart';

class Constants{


  //APP VERSION
  static const String APP_VERSION = "1.0.0";
  static const String BUILD_VERSION = "1";
  static const String  SERVICE_UPDATE_VERSION = "1.0";

  //APP URL
  static const String BASE_URL = 'https://google.com/';

  static const String APP_STORE_URL = "";
  static const String PLAY_STORE_URL = "";
  static const String PRIVACY_TERMS_URL = "";

  static String APP_PLATFORM = "";

  //FONT
  static const String FONT_NAME_POPPINS = "Poppins";


  //SHARED PREFERENCE KEY
  static const String USER_ID_KEY = 'USER_ID';
  static const String USER_NAME_KEY = 'USER_NAME';
  static const String USER_MAIL_ID_KEY = 'USER_MAIL_ID';
  static const String LOGIN_STATUS_KEY ="IS_LOGIN_ACTIVE";

  //routes
  static const String HOME_PAGE_ROUTE = '/homePage';
  static const String ADD_CAMPAIGN_PAGE_ROUTE = '/CampaignPage';

  //states
  static const String STATE_SUCCESS = 'SUCCESS';
  static const String STATE_FAILURE = 'FAILURE';
  static const String STATE_LOADING = 'LOADING';

  //Error Text
  static const String NO_INTERNET = "No Internet Connection";
  static const String INVALID_USER_CREDENTIALS = "Invalid User Credentials";
  static const String SOMETHING_WENT_WRONG = "something went wrong!!!";
  static const String SERVICE_IN_PROGRESS = "Service in progress";

  //common
  static const String OKAY = "Okay";
  static const String CANCEL = "Cancel";
  static const String YES = "YES";
  static const String NO = "NO";

  //Title
  static const String HOME_PAGE_TITLE = "Followup";
  static const String CAMPAIGN_PAGE_TITLE = "Campaign";

  /*PAGES***********************************************************************/

  //campaign page
  static const String CAMPAIGN_PAGE_SUBHEAD_TITLE ="Campaign";
  static const String EMAIL_ID_TEXT_INPUT_HINT = "Email ID";
  static const String EMAIL_ID_TEXT_INPUT_ERROR = "Please enter valid Email ID";
  static const String LEAD_ID_TEXT_INPUT_HINT = "Lead ID";
  static const String LEAD_ID_TEXT_INPUT_ERROR = "Please enter valid Lead ID";
  static const String LAST_DATE_TEXT_INPUT_HINT = "Last Followup date";
  static const String LAST_DATE_TEXT_INPUT_ERROR = "Please enter valid date";
  static const String NEXT_DATE_TEXT_INPUT_HINT = "Next Followup date";
  static const String NEXT_DATE_TEXT_INPUT_ERROR = "Please enter valid date";

  static const String EMPTY_TASK_MESSAGE = "No task found";


}