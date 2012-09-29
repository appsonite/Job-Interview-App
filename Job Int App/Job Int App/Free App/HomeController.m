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
#import "IndexViewController.h"
#import "MoreScreenController.h"

@interface HomeController (){
	PreparationVC_iPhone * prepController;
	TrainingVC_iPhone * trainingController;
	IndexViewController * indexController;
}

@end

@implementation HomeController
@synthesize goToFlipCards = _goToFlipCards;
@synthesize bannerView=_bannerView;

- (id)init
{
    self = [super initWithNibName:@"HomeController" bundle:[NSBundle mainBundle]];
    if (self) {
        self.title = @"Home";
		prepController = [[PreparationVC_iPhone alloc]initWithNibName:@"PreparationVC_iPhone" bundle:[NSBundle mainBundle]];
		trainingController = [[TrainingVC_iPhone alloc] initWithNibName:@"TrainingVC_iPhone" bundle:[NSBundle mainBundle]];
		indexController= [[IndexViewController alloc]initWithNibName:@"IndexViewController" bundle:[NSBundle mainBundle]];
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
       // _bannerView.frame = bannerFrame;
		ApplicationNavigationController.view.frame = viewFrame;
    }];
}

- (IBAction)goToMoreScreen:(id)sender {
	[[MoreScreenController moreScreen] showMenu];
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
    [self setGoToFlipCards:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)goToChecklist:(id)sender {
}

- (IBAction)goToFlipCards:(UIButton *)sender {
}

- (IBAction)goToFlipCards:(UIButton *)sender {
}

- (IBAction)goToFlipCards:(UIButton *)sender {
}

- (IBAction)goToFlipCards:(UIButton *)sender {
}

- (IBAction)goToChecklist1:(UIButton *)sender {
}

- (IBAction)goToChecklist:(UIButton *)sender {
}

- (IBAction)goToPreparation:(UIButton *)sender {
	[ApplicationNavigationController pushViewController:prepController animated:YES];
	NSLog(@"%@",ApplicationNavigationController);
}

- (IBAction)goToChecklist:(id)sender {
}

- (IBAction)goToChecklist:(UIButton *)sender {
}

- (IBAction)goToInterview:(UIButton *)sender {
	[ApplicationNavigationController pushViewController:trainingController animated:YES];
}

- (IBAction)goToIndex:(id)sender {
	[ApplicationNavigationController pushViewController:indexController animated:YES];
}
- (void)dealloc {
    [_goToFlipCards release];
    [super dealloc];
}
@end