//
//  LMSCommon.h
//  LMSApp
//
//  Created by praveen on 06/10/15.
//  Copyright © 2015 Nesh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LMSCommon : NSObject{

}
+(void) showAlert:(NSString *)aMessage;
+ (BOOL)isEmptyString:(NSString *)text;
+ (NSString *)trimWhiteSpaces:(NSString *)text;
+ (BOOL) isNetworkConnected;
+ (void) saveUserloginDetails : (NSDictionary*) loginData;
+ (NSDictionary*)getLoginDetails;
@end
