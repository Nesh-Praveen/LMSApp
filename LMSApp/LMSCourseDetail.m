//
//  LMSCourseDetail.m
//  LMSApp
//
//  Created by praveen on 08/10/15.
//  Copyright © 2015 Nesh. All rights reserved.
//

#import "LMSCourseDetail.h"
#import "LMSCommon.h"
#import "LMSConstants.h"
@interface LMSCourseDetail (){

    
    __weak IBOutlet UIButton *readBtn;
    __weak IBOutlet UILabel *courseName;
    __weak IBOutlet UILabel *courseCataloge;
    __weak IBOutlet UILabel *summerylbl;
}

@end

@implementation LMSCourseDetail
@synthesize courseDict;
@synthesize array;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *dataOne = [defaults objectForKey:kLMSPassData];
    NSDictionary  *dictinary = [NSKeyedUnarchiver unarchiveObjectWithData:dataOne];
    NSLog(@"%@", dictinary);
    self.title = @"Course Details";
    [readBtn setHidden:YES];
    courseName.text = [dictinary objectForKey:kLMS_course_name];
    courseCataloge.text = [dictinary objectForKey:kLMS_course_catalogue];
//    courseDict = [NSDictionary dictionary];
//    NSLog(@"%@",courseDict);
//    array = [[NSMutableArray alloc] init];
//    NSLog(@"array %@",array);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)back:(id)sender {
    
     [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)readMoreBtnTapped:(id)sender {
    
}
- (IBAction)registorBtn:(id)sender {
    
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
