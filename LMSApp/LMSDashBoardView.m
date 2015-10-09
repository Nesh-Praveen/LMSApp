//
//  LMSDashBoardView.m
//  LMSApp
//
//  Created by praveen on 07/10/15.
//  Copyright © 2015 Nesh. All rights reserved.
//

#import "LMSDashBoardView.h"
#import  "LMSCourseCustomCell.h"
#import "LMSMyCourseCustomCell.h"
#import "LDProgressView.h"

@interface LMSDashBoardView (){

    __weak IBOutlet UIButton *showMyCourseBtn;
    __weak IBOutlet UIButton *groupBtn;
    __weak IBOutlet UIButton *activeBtn;
    __weak IBOutlet UIButton *courseBtn;
    __weak IBOutlet UIView *buttonView;
    __weak IBOutlet UILabel *messageLbl;
    __weak IBOutlet UILabel *friendlbl;
    __weak IBOutlet UILabel *globeLbl;
    __weak IBOutlet UIButton *searchBtn;
    __weak IBOutlet UIButton *messageBtn;
    __weak IBOutlet UIButton *friendBtn;
    __weak IBOutlet UIButton *globleBtn;
    __weak IBOutlet UIButton *menuBtn;
    __weak IBOutlet UIView *headerView;
    __weak IBOutlet UITableView *courseTable;
    __weak IBOutlet UITableView *myCourseTable;

    NSMutableArray *menuLsitContainer;
    NSMutableArray *allCourseContainer;
    NSMutableArray *myCourseContainer;
    NSDictionary *lDict;
}

@end

@implementation LMSDashBoardView

- (void)viewDidLoad {
   
    [super viewDidLoad];
    myCourseTable.hidden = YES;
    [self createRoundedlbls];
    lDict = [LMSCommon getLoginDetails];
    NSString *kid = [lDict objectForKey:kLMSid];
    NSString *loginService = [NSString stringWithFormat:kLMS_left_menu_section,kid];
    Parssing *parsVc = [Parssing new];
    parsVc.delegate=self;
    [parsVc passUrl:loginService andTag:tagleftMenu];
}


- (void)FinishParssingUrl:(NSData *)userData tagValue:(NSString *)isTag{
    
    if ([isTag isEqualToString:tagleftMenu]) {
        
        NSDictionary *respondData = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
        NSString *stauts = [respondData objectForKey:kLMSStatus];
        if ([stauts isEqualToString:kLMS_Status_0]) {
            
            menuLsitContainer = [[NSMutableArray alloc] init];
            menuLsitContainer = [[respondData objectForKey:kLMSdata] objectForKey:kLMS_menu_items];
            globeLbl.text = [NSString stringWithFormat:@"%@",[[menuLsitContainer objectAtIndex:5] objectForKey:kLMS_menu_item_notification_count]];
            friendlbl.text = [NSString stringWithFormat:@"%@",[[menuLsitContainer objectAtIndex:6] objectForKey:kLMS_menu_item_notification_count]];
            messageLbl.text = [NSString stringWithFormat:@"%@",[[menuLsitContainer objectAtIndex:7] objectForKey:kLMS_menu_item_notification_count]];
        }
        else{
        
        }
        [courseTable reloadData];
        [self getCouserlist];
    }
    else if ([isTag isEqualToString:tagallcourses]){
    
        NSDictionary *respondData = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
        NSString *stauts = [respondData objectForKey:kLMSStatus];
        if([stauts isEqualToString:kLMS_Status_0]){
        
            allCourseContainer = [respondData objectForKey:kLMSdata];
        }
        else if ([stauts isEqualToString:kLMS_Status_1]){}
        else{
        }
        [courseTable reloadData];
    }
    else if ([isTag isEqualToString:tagMycourses]){
    
        NSDictionary *respondData = [NSJSONSerialization JSONObjectWithData:userData options:0 error:nil];
        NSString *stauts = [respondData objectForKey:kLMSStatus];
        if([stauts isEqualToString:kLMS_Status_0]){
            
            myCourseContainer = [NSMutableArray alloc];
            myCourseContainer = [respondData objectForKey:kLMSdata];
        }
        else if ([stauts isEqualToString:kLMS_Status_1]){}
        else{
        }
        [myCourseTable reloadData];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)menuBtnTapped:(id)sender {
}
- (IBAction)globeBtnTapped:(id)sender {
}
- (IBAction)friendBtnTapped:(id)sender {
}
- (IBAction)messageBtnTapped:(id)sender {
}
- (IBAction)searchBtnTapped:(id)sender {
}
- (IBAction)courseBtnTapped:(id)sender {
    
    myCourseTable.hidden = YES;
    courseTable.hidden = NO;

}
- (IBAction)activitiveBtnTapped:(id)sender {
}
- (IBAction)groupBtnTapped:(id)sender {
}
- (IBAction)showmyCourseBtnTapped:(id)sender {
    myCourseTable.hidden = NO;
    courseTable.hidden = YES;
    NSString *kid = [lDict objectForKey:kLMSid];
    NSString *myCService = [NSString stringWithFormat:kLMS_mycourseSer,kid];
    Parssing *parsVc = [Parssing new];
    parsVc.delegate=self;
    [parsVc passUrl:myCService andTag:tagMycourses];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView == courseTable) {
        
        return 44.0;
    }
    else{
        return 69.0;
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    if (tableView == courseTable) {
        return allCourseContainer.count;
    }
    else{
        return myCourseContainer.count;
    }
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView == courseTable) {
        
        LMSCourseCustomCell *cell;
        static NSString *MyIdentifier = @"CoursesCell";
        if (cell == nil)
        {
            cell= (LMSCourseCustomCell *)[courseTable dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.courseTitle.text = [[allCourseContainer objectAtIndex:indexPath.row] objectForKey:kLMS_course_name];
        cell.courseDetailslbl.text = [[allCourseContainer objectAtIndex:indexPath.row] objectForKey:kLMS_course_catalogue];
        return cell;
    }
    else{
    
        LMSMyCourseCustomCell *cell;
        static NSString *MyIdentifier = @"MyCoursesCell";
        if (cell == nil)
        {
            cell= (LMSMyCourseCustomCell *)[myCourseTable dequeueReusableCellWithIdentifier:MyIdentifier forIndexPath:indexPath];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.myCourseLbl.text = [[myCourseContainer objectAtIndex:indexPath.row] objectForKey:kLMS_course_name];
        cell.courseCatalogLbl.text = [[myCourseContainer objectAtIndex:indexPath.row] objectForKey:kLMS_course_catalogue];
        NSLog(@"myCourseContainer %@",[myCourseContainer objectAtIndex:indexPath.row]);
        //cell.coursePrograss.progress =  [[[myCourseContainer objectAtIndex:indexPath.row] objectForKey:kLMS_course_progress] floatValue];
        //cell.progressBar.progress = 50.0;
        //cell.progressBar
        cell.progressBar.progress = [[[myCourseContainer objectAtIndex:indexPath.row] objectForKey:kLMS_course_progress] floatValue];
       // progressView.progress = [[dictinary objectForKey:kLMS_course_progress] floatValue];
       LDProgressView *progressView = [[LDProgressView alloc] initWithFrame:CGRectMake(15, cell.myCourseLbl.frame.origin.y+30, cell.frame.size.width-40,15)];
        progressView.color = [UIColor redColor];
        progressView.showText = @NO;
        
        progressView.progress = [[[myCourseContainer objectAtIndex:indexPath.row] objectForKey:kLMS_course_progress] floatValue]/100.0;
        progressView.borderRadius = @0;
        progressView.animate = @NO;
        progressView.type = LDProgressSolid;
        [cell.contentView addSubview:progressView];
        
        
        return cell;
    }
   
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (tableView == courseTable) {
    
        NSUserDefaults *loginDetails = [NSUserDefaults standardUserDefaults];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[allCourseContainer objectAtIndex:indexPath.row]];
        [loginDetails setObject:data forKey:kLMSPassData];
        [self performSegueWithIdentifier:kLMS_courseDetPwd sender:self];
    }
    else{
    
        NSUserDefaults *loginDetails = [NSUserDefaults standardUserDefaults];
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[myCourseContainer objectAtIndex:indexPath.row]];
        [loginDetails setObject:data forKey:kLMSMyCourseData];
        [self performSegueWithIdentifier:kLMS_myCoursePwd sender:self];
        //kLMSMyCourseData
    }
   
    
}

//
//[LMSCommon showAlert:kLMSStatusZero];

- (void) getCouserlist{

    NSString *loginService = [NSString stringWithFormat:kLMS_allcoursesSer];
    Parssing *parsVc = [Parssing new];
    parsVc.delegate=self;
    [parsVc passUrl:loginService andTag:tagallcourses];
}

- (void) createRoundedlbls{
    
    
    globeLbl.backgroundColor = [UIColor redColor];
    globeLbl.textColor = [UIColor whiteColor];
    globeLbl.textAlignment = NSTextAlignmentCenter;
    globeLbl.layer.cornerRadius = 10.0;
    globeLbl.text = @"1";
    
    friendlbl.backgroundColor = [UIColor redColor];
    friendlbl.textColor = [UIColor whiteColor];
    friendlbl.textAlignment = NSTextAlignmentCenter;
    friendlbl.layer.cornerRadius = 10.0;
    friendlbl.text = @"1";
    
    messageLbl.backgroundColor = [UIColor redColor];
    messageLbl.textColor = [UIColor whiteColor];
    messageLbl.textAlignment = NSTextAlignmentCenter;
    messageLbl.layer.cornerRadius = 10.0;
    messageLbl.text = @"1";
}





/*
 static NSString *cellIdentifier = @"MenuCell";
 FCMenuCustomCell *menuCell = (FCMenuCustomCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
 if (menuCell == nil) {
 
 NSArray *nibviews = [[NSBundle mainBundle] loadNibNamed:MENUCUSTOMCELL owner:self options:nil];
 menuCell = (FCMenuCustomCell*)[nibviews objectAtIndex:0];
 }

 */



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
