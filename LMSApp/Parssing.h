//
//  Parssing.h
//  PaessingClass
//
//  Created by Saikat on 08/04/13.
//  Copyright (c) 2013 Tulieservices. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ParssingDelegate

-(void)FinishParssingUrl:(NSData *)userData tagValue:(NSString *)isTag;
//- (void)showNetWorkMessage;
@end



@interface Parssing : NSObject<NSURLConnectionDataDelegate>{
    
    id<ParssingDelegate> delegate;
    NSMutableData *webData;
    NSURLConnection *connection;
}

@property (nonatomic,strong) id<ParssingDelegate> delegate;
@property (nonatomic,strong) NSString *tag;

-(void)passUrl:(NSString*)urlString andTag:(NSString *)theTag;
- (id)initWithTag:(NSString*)theTag withURL:(NSString*)theUrl andDelegate:(id)theDelegate;
//- (void)passUrlWithTagValue:(NSString *)urlString andTag:(NSString *)theTag;
@end
