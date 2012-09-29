//
//  ChecklistViewController.h
//  Job Int App
//
//  Created by Robin Grønvold on 7/18/12.
//  Copyright (c) 2012 Protrade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CheckListAnswer.h"
#import "MKStoreManager.h"
#import "MBProgressHUD.h"

@interface ChecklistViewController : UIViewController <MKStoreManagerDelegate> 

-(IBAction) actionAboutCompany:(id)sender;
-(IBAction) actionAboutJob:(id)sender;
-(IBAction) actionKnowMyself:(id)sender;
-(IBAction) actionPPractise:(id)sender;
-(IBAction) actionInterview:(id)sender;
-(IBAction) actionAtInterview:(id)sender;
@end
