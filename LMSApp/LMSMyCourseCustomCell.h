//
//  LMSMyCourseCustomCell.h
//  LMSApp
//
//  Created by praveen on 07/10/15.
//  Copyright © 2015 Nesh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LDProgressView.h"
@interface LMSMyCourseCustomCell : UITableViewCell{

    LDProgressView *progressView;
}
@property (weak, nonatomic) IBOutlet UILabel *myCourseLbl;
@property (weak, nonatomic) IBOutlet UILabel *courseCatalogLbl;
@property (weak, nonatomic) IBOutlet UIProgressView *coursePrograss;
@property (weak, nonatomic) IBOutlet UIProgressView *progressBar;

@end
