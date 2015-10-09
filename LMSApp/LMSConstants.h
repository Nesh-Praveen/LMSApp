//
//  LMSConstants.h
//  LMSApp
//
//  Created by praveen on 06/10/15.
//  Copyright © 2015 Nesh. All rights reserved.
//

#ifndef LMSConstants_h
#define LMSConstants_h


#define APP_NAME                            @"LMS"
#define EMAIL                               @"Enter Email address."
#define PASSWORD                            @"Enter Password."

#define tagLogin                            @"login"
#define tagForgot                           @"forgot"
#define tagAuthentication                   @"authentication"
#define tagTermsConditon                    @"termsConditon"
#define tagTermAgree                        @"termAgree"
#define tagleftMenu                         @"leftMenu"
#define tagallcourses                       @"allcourses"
#define tagMycourses                        @"mycourses"

#define kLMSStatusZero                      @"Status Get 0"
#define kLMSStatusOne                       @"Status Get 1"
#define kLMSShowFalse                       @"Get respond show false"
#define kLMS_Status_0                       @"0"
#define kLMS_Status_1                       @"1"
#define kLMS_Status_2                       @"2"





#define kLMSStatus                          @"status"
#define kLMSPassed                          @"Passed"
#define kLMSRequestSubmit                   @"Request submit successfully"
#define kLMSRequestFail                     @"Request submit failed"
#define kLMSInvalidUsernamePassword         @"Invalid username or password"
#define kLMSLoginData                       @"loginData"
#define kLMSPassData                        @"PassData"
#define kLMSMyCourseData                    @"MyCourseData"
#define kLMS_Notstarted                     @"Not Started"
#define kLMS_Progress                       @"In Progress"
#define kLMS_Complete                       @"Complete"
#define kLMS_Start                          @"Start"
#define kLMS_Resume                         @"Resume"
#define kLMS_Review                         @"Review"

#define kLMSid                              @"id"
#define kLMSapiKey                          @"apiKey"
#define kLMSdata                            @"data"
#define kLMSshow                            @"show"
#define kLMSfalse                           @"false"
#define kLMStrue                            @"true"
#define kLMScontent                         @"content"
#define kLMS_menu_items                     @"menu_items"
#define kLMS_menu_item_name                 @"menu_item_name"
#define kLMS_menu_item_notification_count   @"menu_item_notification_count"
#define kLMS_course_name                    @"course_name"
#define kLMS_course_catalogue               @"course_catalogue"
#define kLMS_course_progress                @"course_progress"
#define kLMS_course_score                   @"course_score"
#define kLMS_course_dueby                   @"course_dueby"


#define kLMS_DashSegue                      @"dashBoardPwd"
#define kLMS_ForgotPassSegue                @"forgotPwd"
#define kLMS_ForgotUserSegue                @"forgotUserPwd"
#define kLMS_courseDetPwd                   @"courseDetPwd"
#define kLMS_myCoursePwd                    @"myCDetailPwd"



//Service URLS
#define kLMS_LoginService                   @"http://dfs.originkonnect.com/services/user.api.php?request=login&username=%@&pwd=%@"
#define kLMS_ForgotUserNameSer              @"http://dfs.originkonnect.com/services/user.api.php?request=forgotusername&email=%@"
#define kLMS_ForgotPasswordSer              @"http://dfs.originkonnect.com/services/user.api.php?request=forgotpassword&email=%@"
#define kLMS_AuthenticationSer              @"http://dfs.originkonnect.com/services/user.api.php?request=authentication&id=%@&key=%@"
#define kLMS_Termscondition                 @"http://dfs.originkonnect.com/services/user.api.php?request=termscondition&id=%@"
#define kLMS_Termscondition_accept          @"http://dfs.originkonnect.com/services/user.api.php?request=termscondition_accept&id=%@"
#define kLMS_left_menu_section              @"http://dfs.originkonnect.com/services/social.notification.api.php?request=left_menu_section&id=%@"
#define kLMS_allcoursesSer                  @"http://dfs.originkonnect.com/services/learning.api.php?request=allcourses"
#define kLMS_mycourseSer                    @"http://dfs.originkonnect.com/services/learning.api.php?request=mycourses&id=%@"






#endif
