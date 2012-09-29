//
//  HomeController.h
//  Job Int App
//
//  Created by Viktor on 04.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKStoreManager.h"

@interface HomeController_ipad : UIViewController 
{
    IBOutlet UILabel *lblPoint;
    IBOutlet UILabel *lblPointDescription;
    IBOutlet UIImageView *imgPointSystem;
}
- (IBAction)goToPrep:(id)sender;
- (IBAction)goToInterview:(id)sender;
- (IBAction)goToIndex:(id)sender;
- (IBAction)goToMoreScreen:(id)sender;
- (IBAction)goToChecklist:(id)sender;
- (IBAction)goToFlipcard:(id)sender;
- (IBAction)gotoQuiz:(id)sender;
- (IBAction)restoreInApp;
@end
