
//
//  Parssing.m
//  PaessingClass
//
//  Created by Saikat on 08/04/13.
//  Copyright (c) 2013 Tulieservices. All rights reserved.
//

#import "Parssing.h"
#import "LMSCommon.h"
@implementation Parssing

@synthesize delegate;
@synthesize tag;


-(void)passUrl:(NSString*)urlString andTag:(NSString *)theTag{
   
    if ([LMSCommon isNetworkConnected]) {
    
        NSString *urlStr = urlString;
        NSURL *url = [NSURL URLWithString:urlStr];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        connection = [NSURLConnection connectionWithRequest:request delegate:self];
        if(connection)
        {
            webData = [[NSMutableData alloc]init];
            self.tag = theTag;
            NSLog(@"self.tag %@",self.tag);
        }

    }
    else{
    
           [LMSCommon showAlert:@"Network is not available, Please check your network settings."];
          // [self.delegate showNetWorkMessage];
    }

}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"ERROR: %@",[NSString stringWithFormat:@"%@",error]);
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
     if (webData) {
        
         [self.delegate FinishParssingUrl:webData tagValue:self.tag];
    }

}
- (id)initWithTag:(NSString*)theTag withURL:(NSString*)theUrl andDelegate:(id)theDelegate {

    NSString  *url = theUrl ;
	NSURL* theURL=[[NSURL alloc] initWithString:url] ;
	NSMutableURLRequest* request = [[NSMutableURLRequest alloc] initWithURL:theURL];
	connection=[[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:TRUE];
	
	if(connection) {
		self.tag = theTag;
		self.delegate=theDelegate ;
		
		webData = [[NSMutableData alloc]init];;
		return self;
	} else
    {
		return nil ;
	}
}


@end
