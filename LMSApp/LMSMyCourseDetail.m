//
//  LMSMyCourseDetail.m
//  LMSApp
//
//  Created by praveen on 08/10/15.
//  Copyright © 2015 Nesh. All rights reserved.
//

#import "LMSMyCourseDetail.h"
#import "LMSCommon.h"
#import "LMSConstants.h"
#import "LDProgressView.h"
@interface LMSMyCourseDetail (){

   
    __weak IBOutlet UIButton *readBtn;
    __weak IBOutlet UILabel *dueDate;
    __weak IBOutlet UILabel *courseScore;
    __weak IBOutlet UILabel *summerLbl;
    __weak IBOutlet UILabel *cataloguelbl;
    __weak IBOutlet UIButton *resumeBtn;
    __weak IBOutlet UILabel *progressLbl;
    __weak IBOutlet UILabel *courseNamelbl;
}

@end

@implementation LMSMyCourseDetail

- (void)viewDidLoad {
    [super viewDidLoad];
   self.title = @"Course Details";
    readBtn.hidden = YES;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *dataOne = [defaults objectForKey:kLMSMyCourseData];
    NSDictionary  *dictinary = [NSKeyedUnarchiver unarchiveObjectWithData:dataOne];
    NSLog(@"%@", dictinary);
    courseNamelbl.text = [dictinary objectForKey:kLMS_course_name];
    int progress = [[dictinary objectForKey:kLMS_course_progress]intValue];
    if (progress == 0) {
        progressLbl.text = kLMS_Notstarted;
        [resumeBtn setTitle:kLMS_Start forState:UIControlStateNormal];
    }
    else if (progress > 0 && progress < 100){
    progressLbl.text = kLMS_Progress;
         [resumeBtn setTitle:kLMS_Resume forState:UIControlStateNormal];
    }else {
        progressLbl.text = kLMS_Complete;
         [resumeBtn setTitle:kLMS_Review forState:UIControlStateNormal];
    }
    cataloguelbl.text = [dictinary objectForKey:kLMS_course_catalogue];
    courseScore.text = [dictinary objectForKey:kLMS_course_score];
    dueDate.text = [dictinary objectForKey:kLMS_course_dueby];
    
    LDProgressView *progressView;
    progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(15, progressLbl.frame.origin.y+30, self.view.frame.size.width-40,15)];
    progressView.color = [UIColor redColor];
    progressView.showText = @NO;
    progressView.progress = [[dictinary objectForKey:kLMS_course_progress] floatValue]/100.0;
    progressView.borderRadius = @0;
    progressView.animate = @NO;
    progressView.type = LDProgressSolid;
    [self.view addSubview:progressView];
}


/*
 {
 "course_catalogue" = "Center for Talent Development";
 "course_dueby" = "24 - May - 2015";
 "course_format" = "";
 "course_id" = 22;
 "course_name" = Journeyman;
 "course_progress" = 4;
 "course_score" = 0;
 "course_status" = ongoing;
 lang = en;
 }

 */

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backBtnTapped:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)shareBtnTapped:(id)sender {
}
- (IBAction)resumeBtnTapped:(id)sender {
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
