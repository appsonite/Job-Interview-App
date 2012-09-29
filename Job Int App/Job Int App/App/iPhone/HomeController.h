//
//  HomeController.h
//  Job Int App
//
//  Created by Viktor on 04.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuizController.h"
#import "PointSystemManager.h"

@interface HomeController : UIViewController 
{
    IBOutlet UILabel *lblPoint;
    IBOutlet UILabel *lblPointDescription;
    IBOutlet UIImageView *imgPointSystem;
}

-(IBAction) goToPreparation:(UIButton *)sender;

-(IBAction) goToInterview:(UIButton *)sender;

-(IBAction) goToFlipCards:(UIButton *)sender;

-(IBAction) goToChecklist:(UIButton *)sender;

-(IBAction) goToIndex:(UIButton *)sender;

-(IBAction) goToMoreScreen:(UIButton *)sender;

-(IBAction) actionRestoreInApp;

-(IBAction) gotoQuiz:(id)sender;
@end
