//
//  LMSForgotUserName.m
//  LMSApp
//
//  Created by praveen on 06/10/15.
//  Copyright © 2015 Nesh. All rights reserved.
//

#import "LMSForgotUserName.h"

@interface LMSForgotUserName (){

    __weak IBOutlet UITextField *emailTxtField;
    
}

@end

@implementation LMSForgotUserName

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnTapped:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)submitBtnTapped:(id)sender {
    
    [emailTxtField resignFirstResponder];

    if ([self isValid]) {
        
        NSString *uName = emailTxtField.text;
        NSString *loginService = [NSString stringWithFormat:kLMS_ForgotUserNameSer,uName];
        Parssing *parsVc = [Parssing new];
        parsVc.delegate=self;
        [parsVc passUrl:loginService andTag:tagForgot];
    }
}

-(void)FinishParssingUrl:(NSData *)userData tagValue:(NSString *)isTag{
    
    if ([isTag isEqualToString:tagForgot]) {
        
        NSDictionary *respondData = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
        NSString *status = [respondData objectForKey:kLMSStatus];
        if ([status isEqualToString:@"0"]) {
            
            [LMSCommon showAlert:kLMSRequestSubmit];
            [self.navigationController popViewControllerAnimated:YES];

        }
        else{
        
             [LMSCommon showAlert:kLMSRequestFail];
            [self.navigationController popViewControllerAnimated:YES];

        }
    }
}

- (BOOL)isValid{
    
    BOOL isValid = NO;
    if (YES == [LMSCommon isEmptyString:emailTxtField.text]){
        
        [emailTxtField becomeFirstResponder];
        [emailTxtField setKeyboardType:UIKeyboardTypeDefault];
        // [self.signUpScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        [LMSCommon showAlert:EMAIL];
    }
    else{
        
        isValid = YES;
    }
    
    return isValid;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
