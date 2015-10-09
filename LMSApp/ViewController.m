//
//  ViewController.m
//  LMSApp
//
//  Created by praveen on 06/10/15.
//  Copyright © 2015 Nesh. All rights reserved.
//

#import "ViewController.h"
#import "LMSConstants.h"
#import "LMSCommon.h"

@interface ViewController (){

    
    __weak IBOutlet UIScrollView *loginScrollView;
    __weak IBOutlet UITextField *userNameTxt;
    __weak IBOutlet UITextField *passWordTxt;
    __weak IBOutlet UIButton *signInBtn;
    IBOutlet UIView *termCondVc;
    __weak IBOutlet UITextView *termTxtView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSObject * object = [prefs objectForKey:kLMSLoginData];
    if(object != nil){
        
        NSDictionary *lDict = [LMSCommon getLoginDetails];
        NSString *kid = [lDict objectForKey:kLMSid];
        NSString *kapiKey = [lDict objectForKey:kLMSapiKey];
        NSString *loginService = [NSString stringWithFormat:kLMS_AuthenticationSer,kid,kapiKey];
        Parssing *parsVc = [Parssing new];
        parsVc.delegate=self;
        [parsVc passUrl:loginService andTag:tagAuthentication];
    }
    else{
    
      
    }
   
 
}
- (void)viewWillAppear:(BOOL)animated{

      [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)didReceiveMemoryWarning {
  
    [super didReceiveMemoryWarning];
   
}
- (IBAction)signInBtnTapped:(id)sender {
    
    [userNameTxt resignFirstResponder];
    [passWordTxt resignFirstResponder];
  //  if ([self isValid]) {
        
        NSString *uName = userNameTxt.text;
        NSString *pWord = passWordTxt.text;
        NSString *loginService = [NSString stringWithFormat:kLMS_LoginService,@"user1",@"P@ssw0rd"];
        Parssing *parsVc = [Parssing new];
        parsVc.delegate=self;
       [parsVc passUrl:loginService andTag:tagLogin];
  //  }
}

-(void)FinishParssingUrl:(NSData *)userData tagValue:(NSString *)isTag{
    
    if ([isTag isEqualToString:tagLogin]) {
        
        NSDictionary *respondData = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
        NSString *stauts = [respondData objectForKey:kLMSStatus];
        if ([stauts  isEqualToString:kLMSPassed]) {
            
            [LMSCommon saveUserloginDetails:respondData];
            [self callTermsConditionService];
            
        }
        else
        {
        
            [LMSCommon showAlert:kLMSInvalidUsernamePassword];
        }
   
    }
    else if ([isTag isEqualToString:tagAuthentication]){
    
        NSDictionary *respondData = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
       
        NSNumber *stauts = [respondData objectForKey:kLMSStatus];
       
        if (stauts == 0) {
            
            // Move to MainVeiw View
            [self performSegueWithIdentifier:@"dashBoardPwd" sender:self];
            [LMSCommon showAlert:kLMSStatusZero];
        }
        else{
        
            [self performSegueWithIdentifier:@"dashBoardPwd" sender:self];
            [LMSCommon showAlert:kLMSStatusOne];
        }
      
    }
    else if ([isTag isEqualToString:tagTermsConditon]){
        
        NSDictionary *respondData = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
        NSString *stauts = [respondData objectForKey:kLMSStatus];
        if ([stauts isEqualToString:@"0"]) {
            
            NSString *showC = [[respondData objectForKey:kLMSdata] objectForKey:kLMSshow];
            if ([showC isEqualToString:kLMStrue]) {
                
                //Add Terms Conditin View to superview and show data
                 [self.view addSubview:termCondVc];
            }
            else{
                
                 [self performSegueWithIdentifier:@"dashBoardPwd" sender:self];
                [LMSCommon showAlert:kLMSShowFalse];
            }
        }
        else{
        
        }
        
    }
    else if ([isTag isEqualToString:tagTermAgree]){
    
        NSDictionary *respondData = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
        NSString *stauts = [respondData objectForKey:kLMSPassed];
        if ([stauts isEqualToString:@"0"]) {
            
            [self performSegueWithIdentifier:kLMS_DashSegue sender:self];
            [LMSCommon showAlert:kLMSStatusZero];
        }
        else{
            
            [LMSCommon showAlert:kLMSStatusOne];
        }
    }
    
}


-(void)callTermsConditionService{

    NSDictionary *lDict = [LMSCommon getLoginDetails];
    NSString *kid = [lDict objectForKey:kLMSid];
    NSString *termCService = [NSString stringWithFormat:kLMS_Termscondition,kid];
    Parssing *parsVc = [Parssing new];
    parsVc.delegate=self;
    [parsVc passUrl:termCService andTag:tagTermsConditon];
}
- (IBAction)agreeBtnTapped:(id)sender {
    
    NSDictionary *lDict = [LMSCommon getLoginDetails];
    NSString *kid = [lDict objectForKey:kLMSid];
    NSString *termAgreeService = [NSString stringWithFormat:kLMS_Termscondition,kid];
    Parssing *parsVc = [Parssing new];
    parsVc.delegate=self;
    [parsVc passUrl:termAgreeService andTag:tagTermAgree];
}
- (IBAction)disAgreeBtnTapped:(id)sender {
    
    [termCondVc removeFromSuperview];
}

- (IBAction)forgotPasswordTapped:(id)sender {
    
     [self performSegueWithIdentifier:kLMS_ForgotPassSegue sender:self];
  
}
- (IBAction)forgotUserTapped:(id)sender {
    
     [self performSegueWithIdentifier:kLMS_ForgotUserSegue sender:self];
  
}
- (IBAction)needHelpTapped:(id)sender {
}

- (BOOL)isValid{

    BOOL isValid = NO;
    if (YES == [LMSCommon isEmptyString:userNameTxt.text]){
        
        [userNameTxt becomeFirstResponder];
        [userNameTxt setKeyboardType:UIKeyboardTypeDefault];
       // [self.signUpScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        [LMSCommon showAlert:EMAIL];
    }
    else if (YES == [LMSCommon isEmptyString:passWordTxt.text]){
        
        [passWordTxt becomeFirstResponder];
        [passWordTxt setKeyboardType:UIKeyboardTypeNumbersAndPunctuation];
        //[self scrollToPositionUP:YES withTxtField:self.zipTxtField];
        [LMSCommon showAlert:PASSWORD];
    }
    else{
        
        isValid = YES;
    }

    return isValid;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if ([textField isEqual:userNameTxt])
    {
        [passWordTxt becomeFirstResponder];
        
    }
    else
    {
        
        [passWordTxt resignFirstResponder];
       // self.loginScroll.contentSize = ([FCCommon isRetina4]) ? CGSizeMake(0.0,0.0) : CGSizeMake(0.0,500.0);
      //  [self.loginScroll setContentOffset:CGPointMake(0, 0) animated:YES];
        
    }
    return YES;
}




@end
