//
//  AllConstants.h
//  Tinder
//
//  Created by Elluminati - macbook on 08/04/14.
//  Copyright (c) 2014 AppDupe. All rights reserved.
//



//Api Url
//#define API_URL    @""//Local
//#define API_URL    @"http://www.appdupe.info/uber_alpha/ws/"//Development


//bhoj raj sir url
//#define API_URL @"http://uber.globusapps.com/uber_alpha/ws/"

//#define API_URL    @""//Live
//ankit Sir url
#define API_URL  @"http://uber.globusapps.com/ws/"


#define URL_ABOUT   @"http://www.appdupe.info/uber_alpha/ws/about_us.php"


#define DEVICE_TYPE @"1"
#define USER_TYPE   @"0"


typedef enum : NSUInteger{
    GenderMale=0,
    GenderFemale=1
}Gender;

typedef enum : NSUInteger{
    DriverStatAvailable=0,
    DriverStatNotAvailable=1
}DriverStat;

typedef enum : NSUInteger{
    PushClientIdPickUpTimeSet=1,
    PushClientIdJobDone=2,
    PushClientIdDeleteRequest=4,
    PushClientIdDriverReched=5
}PushClientID;


#define APPDELEGATE (AppDelegate*)[[UIApplication sharedApplication] delegate]


#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

//iOS7 Or less
#define ISIOS7 (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)
//iPad/iPhone
#define IS_iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_iPhone ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)


//Colors
#define COLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]


//iPhone5 helper
#define IS_iPhone5 ([UIScreen mainScreen].bounds.size.height == 568.0)
#define ASSET_BY_SCREEN_HEIGHT(regular) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : [regular stringByAppendingString:@"-568h"])

#define SET_XIB(regular) (isiPhone ? regular : [regular stringByAppendingString:@"_iPad"])


#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#   define DLog(...)
#endif


//////////Macro Helper///////////
#define COLOR_BACKGROUND [UIColor colorWithRed:(230.0/255) green:(224.0/255) blue:(202.0/255) alpha:1.0]
#define DATE_FORMATE_DOB        @"yyyy-MM-dd"

//Webservice fix response
#define WS_UBER_ALPHA           @"uber_alpha"
#define WS_STATUS               @"status"
#define WS_MESSAGE              @"message"
#define WS_STATUS_SUCCESS       @"success"
#define WS_STATUS_FAIL          @"fail"
#define WS_DETAILS              @"details"

//Fonts Helper
//extern NSString *const FontRegular;
//extern NSString *const FontBold;

//Entity Helper
//extern NSString *const ENTITY_GETPROFILE;//GetProfile

//Title Navigation
extern NSString *const TITLE_REGISTER;//Register
extern NSString *const TITLE_HOME;//Pick Me Up
extern NSString *const TITLE_WAITING;//Waiting
extern NSString *const TITLE_CALLOPERATOR;//ETA
extern NSString *const TITLE_THANKYOU;//ETA
extern NSString *const TITLE_FEEDBACK;//FEEDBACK
extern NSString *const TITLE_SETTING;//About
extern NSString *const TITLE_ACCOUNT;//My Account
extern NSString *const TITLE_HISTORY;//History
extern NSString *const TITLE_HISTORYDETAIL;//History Details

//Button Text
extern NSString *const BTN_TEXT_SERVICE;

//Lable Text
extern NSString *const LBL_TEXT_WAIT_DRIVER_RESPONSE;
extern NSString *const LBL_TEXT_JOB_START;

//File Name for Webservice
extern NSString *const FILE_CLIENT_REGISTER;//client_register.php
extern NSString *const FILE_LOGIN;//login.php
extern NSString *const FILE_CLIENT_PICK_REQUEST;//client_pick_request.php
extern NSString *const FILE_RATE_TRIP;//rate_trip.php
extern NSString *const FILE_EDIT_PROFILE;//edit_profile.php
extern NSString *const FILE_GET_HISTORY;//get_history.php
extern NSString *const FILE_GET_OPERATOR;//get_operator.php
extern NSString *const FILE_GET_PROFILE;//get_profile.php
extern NSString *const FILE_CLIENT_PUSH;//client_push.php
extern NSString *const FILE_GET_DRIVER_LOCATION;
extern NSString *const FILE_CLIENT_DROP_OFF;//get_driver_location.php
extern NSString *const FILE_PAYMENT_DONE;//payment_done.php
extern NSString *const FILE_CAR_Detail;
extern NSString *const FILE_CLIENT_CAR_Detail;
extern NSString *const FILE_PAYMENT_DETAIL;
extern NSString *const FILE_PAYPAL_REFRESH_TOKEN;
extern NSString *const FILE_PAYPAL_POST_PAYMENT;
extern NSString *const FILE_PAYPAL_CLIENT_REFRESH_TOKEN;

//PARAMS
extern NSString *const PARAM_NAME;//name
extern NSString *const PARAM_EMAIL;//email
extern NSString *const PARAM_PASSWORD;//password
extern NSString *const PARAM_CONTACT;//contact
extern NSString *const PARAM_DATE_OF_BIRTH;//date_of_birth
extern NSString *const PARAM_DEVICE_TOKEN;//device_token
extern NSString *const PARAM_DEVICE_TYPE;//device_type
extern NSString *const PARAM_REFERENCE_NO;//reference_no
extern NSString *const PARAM_LATTITUDE;//lattitude
extern NSString *const PARAM_LOGITUDE;//logitude
extern NSString *const PARAM_IS_DRIVER;//is_driver
extern NSString *const PARAM_CLIENT_ID;//client_id
extern NSString *const PARAM_RANDOM_ID;//random_id       (trip_unique_id)
extern NSString *const PARAM_COMMENT;//comment
extern NSString *const PARAM_RATING;//rating
extern NSString *const PARAM_USER_ID;//user_id         (client or driver id)
extern NSString *const PARAM_GENDER;//gender          (optional) if given then updated
extern NSString *const PARAM_COUNTRY_CODE;//country_code

//PARAMS VALUE
extern NSString *const VALUE_GENDER_MALE;//Male
extern NSString *const VALUE_GENDER_FEMALE;//Female

