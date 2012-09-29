//
//  HomeController.m
//  Job Int App
//
//  Created by Viktor on 04.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "AppDelegate_iPhone.h"
#import "HomeController.h"
#import "PreparationVC_iPhone.h"
#import "TrainingVC_iPhone.h"
#import "FlipCardsViewController.h"
#import "ChecklistViewController.h"
#import "IndexViewController.h"
#import "MoreScreenController.h"

@interface HomeController (){
	PreparationVC_iPhone * prepController;
	TrainingVC_iPhone * trainingController;
    FlipCardsViewController * flipcardsController;
    ChecklistViewController * checklistController;
	IndexViewController * indexController;
    QuizController      *quizController;
}

@end

@implementation HomeController

-(id) init
{
    self = [super initWithNibName:@"HomeController" bundle:[NSBundle mainBundle]];
    if (self) {
        self.title = @"Home";
		prepController = [[PreparationVC_iPhone alloc]initWithNibName:@"PreparationVC_iPhone" bundle:[NSBundle mainBundle]];
		trainingController = [[TrainingVC_iPhone alloc] initWithNibName:@"TrainingVC_iPhone" bundle:[NSBundle mainBundle]];
        flipcardsController = [[FlipCardsViewController alloc] initWithNibName:@"FlipCardsViewController_iPhone" bundle:[NSBundle mainBundle]];
        checklistController = [[ChecklistViewController alloc] initWithNibName:@"ChecklistViewController_iPhone" bundle:[NSBundle mainBundle]];
		indexController= [[IndexViewController alloc]initWithNibName:@"IndexViewController" bundle:[NSBundle mainBundle]];
        quizController = [[QuizController alloc] initWithNibName:@"QuizController_iPhone" bundle:[NSBundle mainBundle]];
    }
    return self;
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    [[PointSystemManager sharedManager] initData];
    PointSystemManager *psm = [PointSystemManager sharedManager];
    psm.lblDescription = lblPointDescription;
    psm.lblPoint = lblPoint;
    psm.imageView = imgPointSystem;

}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[PointSystemManager sharedManager] updateUI];
    
}
-(void) viewDidUnload
{
    [super viewDidUnload];
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(IBAction) goToPreparation:(UIButton *)sender {
	[ApplicationNavigationController pushViewController:prepController animated:YES];
	NSLog(@"%@",ApplicationNavigationController);
}

-(IBAction) goToInterview:(UIButton *)sender {
	[ApplicationNavigationController pushViewController:trainingController animated:YES];
}

-(IBAction) goToFlipCards:(UIButton *)sender {
	[ApplicationNavigationController pushViewController:flipcardsController animated:YES];
}

-(IBAction) goToChecklist:(UIButton *)sender {
    [self.navigationController pushViewController:checklistController animated:TRUE];
}


-(IBAction) goToIndex:(UIButton *)sender {
	[ApplicationNavigationController pushViewController:indexController animated:YES];
}

-(IBAction) goToMoreScreen:(id)sender {
	[[MoreScreenController moreScreen] showMenu];
}

-(IBAction) gotoQuiz:(id)sender
{
    [ApplicationNavigationController pushViewController:quizController animated:TRUE];
}

-(IBAction) actionRestoreInApp
{
    [MKStoreManager sharedManager].pDelegate = nil;
    [[MKStoreManager sharedManager] restoreAllPurchases];
}

@end