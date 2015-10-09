//
//  LMSCommon.m
//  LMSApp
//
//  Created by praveen on 06/10/15.
//  Copyright © 2015 Nesh. All rights reserved.
//

#import "LMSCommon.h"
#import "LMSConstants.h"
#import <UIKit/UIKit.h>
#import "ReachabilityCheck.h"
@implementation LMSCommon

static LMSCommon * _sharedHelper;

/********************************************************************************************
 @Method Name  : sharedHelper
 @Param        : nil
 @Return       : EACommon
 @Description  :
 ********************************************************************************************/
+ (LMSCommon *) sharedHelper
{
    
    if (_sharedHelper != nil)
    {
        return _sharedHelper;
    }
    _sharedHelper = [[LMSCommon alloc] init];
    return _sharedHelper;
    
}


+(void) showAlert:(NSString *)aMessage
{

    UIAlertView *alert  = [[UIAlertView alloc]initWithTitle:APP_NAME  message:aMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil];
    [alert show];
    
}
/********************************************************************************************
 @Method Name  : isEmptyString
 @Param        : text - string to be checked
 @Return       : BOOL
 @Description  : To check if a given string is empty
 ********************************************************************************************/
+ (BOOL)isEmptyString:(NSString *)text
{
    text = [self trimWhiteSpaces:text];
    return (nil == text || YES == [text isEqualToString:@""] || [text length] == 0) ? YES : NO;
}

/********************************************************************************************
 @Method Name  : trimWhiteSpaces
 @Param        : text - string to be trimmed
 @Return       : NSString
 @Description  : To trim the whitespace and new line characters
 ********************************************************************************************/
+ (NSString *)trimWhiteSpaces:(NSString *)text
{
    return [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
/***********************************************************************************************
 // Purpose		: isNetworkConnected.
 // Parameters	: nil
 // Return type	: BOOL
 // Comments    : Function to check network connectivity
 ***********************************************************************************************/
+ (BOOL) isNetworkConnected
{
    BOOL status = YES;
    BOOL isWiFiConnected = [[ReachabilityCheck sharedReachability] internetConnectionStatus];
    if(!isWiFiConnected)
    {
        status = NO;
    }
    return status;
}

/***********************************************************************************************
 // Purpose		: saveLoginDetails in UserDefault.
 // Parameters	: nil
 // Return type	: BOOL
 // Comments    : Function to check network connectivity
 ***********************************************************************************************/

+ (void) saveUserloginDetails : (NSDictionary*) loginData{

    NSUserDefaults *loginDetails = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:loginData];
    [loginDetails setObject:data forKey:kLMSLoginData];

}
+ (NSDictionary*)getLoginDetails{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *dataOne = [defaults objectForKey:kLMSLoginData];
    NSDictionary  *dictinary = [NSKeyedUnarchiver unarchiveObjectWithData:dataOne];
    return dictinary;
}
@end
