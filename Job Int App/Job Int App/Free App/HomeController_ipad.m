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

@interface HomeController_ipad (){
	PreparationVC_iPad * prepController;
	TrainingVC_iPad * trainingController;
	IndexViewController_ipad * indexController;
}

@end

@implementation HomeController_ipad

@synthesize bannerView =_bannerView;

-(id)init
{
	self = [super initWithNibName:@"HomeController_ipad" bundle:[NSBundle mainBundle]];
    if (self) {
		prepController = [[PreparationVC_iPad alloc] initWithNibName:@"PreparationVC_iPad" bundle:[NSBundle mainBundle]];
		trainingController = [[TrainingVC_iPad alloc] initWithNibName:@"TrainingVC_iPad" bundle:[NSBundle mainBundle]];
		indexController = [[IndexViewController_ipad alloc] initWithNibName:@"IndexViewController_ipad" bundle:[NSBundle mainBundle]];
    }
    return self;
}

- (void)layoutAnimated:(BOOL)animated
{
	_bannerView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
	_bannerView.hidden = NO;
    
	CGRect bannerFrame = _bannerView.frame;
	CGRect viewFrame = ApplicationNavigationController.view.frame;
	CGRect winSize = [[[[UIApplication sharedApplication] windows] objectAtIndex:0] frame];
	
	
	NSLog(@"%f %f %f %f",bannerFrame.origin.x,bannerFrame.origin.y,bannerFrame.size.width,bannerFrame.size.height);
    
	if (![[NSUserDefaults standardUserDefaults] boolForKey:@"com.MWS.aVirtualInterview"]) {
		
		if (_bannerView.bannerLoaded) {
			bannerFrame.origin.y = 0 - bannerFrame.size.height;
			viewFrame.size.height = winSize.size.height-bannerFrame.size.height;
			viewFrame.origin.y = 0 + bannerFrame.size.height;
		} 
		else {
			bannerFrame.origin.y = 0 - bannerFrame.size.height;
		}
	}
	else {
		bannerFrame.origin.y = 0 - bannerFrame.size.height;
	}
	
    [UIView animateWithDuration: animated ? 0.25 : 0 animations:^{
        [self.view layoutIfNeeded];
        //_bannerView.frame = bannerFrame;
		ApplicationNavigationController.view.frame = viewFrame;
    }];
}

-(void)viewWillAppear:(BOOL)animated
{
	[self layoutAnimated:YES];
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [self layoutAnimated:YES];
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [self layoutAnimated:YES];
	NSLog(@"%@",error.debugDescription);
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)goToPrep:(id)sender {
	[ApplicationNavigationController pushViewController:prepController animated:YES];
}

- (IBAction)goToInterview:(id)sender {
	[ApplicationNavigationController pushViewController:trainingController animated:YES];
}

- (IBAction)goToIndex:(id)sender {
	[ApplicationNavigationController pushViewController:indexController animated:YES];
}

- (IBAction)goToMoreScreen:(id)sender {
	[[MoreScreenController moreScreen] showMenu];
}
@end
