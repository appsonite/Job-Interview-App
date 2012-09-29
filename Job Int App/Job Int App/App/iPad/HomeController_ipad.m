//
//  HomeController.m
//  Job Int App
//
//  Created by Viktor on 04.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#include "AppDelegate_iPad.h"
#import "HomeController_ipad.h"
#import "PreparationVC_iPad.h"
#import "TrainingVC_iPad.h"
#import "IndexViewController_ipad.h"
#import "MoreScreenController.h"
#import "ChecklistViewController.h"
#import "FlipCardsViewController.h"
#import "QuizController.h"
#import "PointSystemManager.h"

@interface HomeController_ipad (){
	PreparationVC_iPad * prepController;
	TrainingVC_iPad * trainingController;
	IndexViewController_ipad * indexController;
    ChecklistViewController *checklistController;
    FlipCardsViewController *flipCardViewController;
    QuizController          *quizController;
}

@end

@implementation HomeController_ipad

-(id)init
{
	self = [super initWithNibName:@"HomeController_ipad" bundle:[NSBundle mainBundle]];
    if (self) {
		prepController = [[PreparationVC_iPad alloc] initWithNibName:@"PreparationVC_iPad" bundle:[NSBundle mainBundle]];
		trainingController = [[TrainingVC_iPad alloc] initWithNibName:@"TrainingVC_iPad" bundle:[NSBundle mainBundle]];
		indexController = [[IndexViewController_ipad alloc] initWithNibName:@"IndexViewController_ipad" bundle:[NSBundle mainBundle]];
        checklistController = [[ChecklistViewController alloc] initWithNibName:@"CheckListViewController_iPad" bundle:[NSBundle mainBundle]];
        flipCardViewController = [[FlipCardsViewController alloc] initWithNibName:@"FlipCardsViewController_iPad" bundle:[NSBundle mainBundle]];
        quizController = [[QuizController alloc] initWithNibName:@"QuizController_iPad" bundle:nil];
        
    }
    return self;
}



-(void) viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Home";
    [[PointSystemManager sharedManager] initData];
    PointSystemManager *psm = [PointSystemManager sharedManager];
    psm.lblDescription = lblPointDescription;
    psm.lblPoint = lblPoint;
    psm.imageView = imgPointSystem;
}

-(void) viewDidUnload
{
    [prepController release];
    [trainingController release];
    [indexController release];
    [checklistController release];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[PointSystemManager sharedManager] updateUI];
    
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(IBAction) goToPrep:(id)sender {
	[ApplicationNavigationController pushViewController:prepController animated:YES];
}

-(IBAction) goToInterview:(id)sender {
	[ApplicationNavigationController pushViewController:trainingController animated:YES];
}

-(IBAction) goToIndex:(id)sender {
	[ApplicationNavigationController pushViewController:indexController animated:YES];
}

-(IBAction) gotoQuiz:(id)sender
{
    [ApplicationNavigationController pushViewController:quizController animated:YES];
}

-(IBAction) goToMoreScreen:(id)sender {
	[[MoreScreenController moreScreen] showMenu];
}

-(IBAction) goToChecklist:(id)sender
{
    [self.navigationController pushViewController:checklistController animated:TRUE];
}
-(IBAction) goToFlipcard:(id)sender
{
    [self.navigationController pushViewController:flipCardViewController animated:YES];
}
-(IBAction) restoreInApp
{
    [MKStoreManager sharedManager].pDelegate = nil;
    [[MKStoreManager sharedManager] restoreAllPurchases];
}
@end
