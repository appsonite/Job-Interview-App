//
//  IndexVC_iPhone.m
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate_iPhone.h"
#import "HomeController.h"
#import "IndexVC_iPhone.h"
#import "InAppRageIAPHelper.h"
#import "UserRecordsManager.h"

@interface IndexVC_iPhone ()

-(NSString*) getVideoName;

@end


@implementation IndexVC_iPhone


@synthesize theMovie;
@synthesize selectedCategory;
@synthesize selectedIndex;
@synthesize  videoName,MoviePath,MovieURL,Bundle;
@synthesize previousButton;
@synthesize videoTitle;
@synthesize nextButton;

@synthesize IntroVideos;
@synthesize profVideos;
@synthesize eduVideos;
@synthesize expVideos;
@synthesize persnalVideos;
@synthesize ambitionVideos;
@synthesize theJobVideos;
@synthesize careerVideos;

@synthesize IntroMentorVideos;
@synthesize profMentorVideos;
@synthesize eduMentorVideos;
@synthesize expMentorVideos;
@synthesize persnalMentorVideos;
@synthesize ambitionMentorVideos;
@synthesize theJobMentorVideos;
@synthesize careerMentorVideos;


@synthesize IntroAnswerVideos;
@synthesize profAnswerVideos;
@synthesize eduAnswerVideos;
@synthesize expAnswerVideos;
@synthesize persnalAnswerVideos;
@synthesize ambitionAnswerVideos;
@synthesize theJobAnswerVideos,careerAnswerVideos;
@synthesize  helper,hud;
@synthesize playLabel,recordLabel;
#pragma mark -
#pragma in app
- (void)dismissHUD:(id)arg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    self.hud = nil;
    
}

- (void)productsLoaded:(NSNotification *)notification {
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    SKProduct *product = [[InAppRageIAPHelper sharedHelper].products objectAtIndex:0];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:product.priceLocale];
    NSString *formattedString = [numberFormatter stringFromNumber:product.price];
    
    UIAlertView * purchaseAlert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%@ %@",product.localizedTitle , formattedString] message:@"Click OK to purchase" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel Purchase", nil];
    purchaseAlert.tag = 1;
    [purchaseAlert show];
    [purchaseAlert release];
    
}

- (void)timeout:(id)arg {
    
    hud.labelText = @"Timeout!";
    hud.detailsLabelText = @"Please try again later.";
    hud.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]] autorelease];
	hud.mode = MBProgressHUDModeCustomView;
    [self performSelector:@selector(dismissHUD:) withObject:nil afterDelay:3.0];
    
}

- (void)updateInterfaceWithReachability: (Reachability*) curReach {
    
    
}


- (void)productPurchased:(NSNotification *)notification {
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [MBProgressHUD hideHUDForView:self.view animated:YES];    
    
    NSString *productIdentifier = (NSString *) notification.object;
    NSLog(@"Purchased: %@", productIdentifier);
    
    // [self.tableView reloadData];    
    
}

-(NSString *)getVideoName
{
	
	if (selectedCategory==0) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[eduVideos objectAtIndex:selectedIndex]];
		return vdName;
		NSLog(@" videoName: %@",vdName);
	}
	if (selectedCategory==1) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[expVideos objectAtIndex:selectedIndex]];
		return vdName;
		NSLog(@" videoName: %@",vdName);
	}
	
	if (selectedCategory==2) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[profVideos objectAtIndex:selectedIndex]];
		return vdName;
		NSLog(@" videoName: %@",vdName);
	}
	if (selectedCategory==3) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[persnalVideos objectAtIndex:selectedIndex]];
		return vdName;
		NSLog(@" videoName: %@",vdName);
	}
	if (selectedCategory==4) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[careerVideos objectAtIndex:selectedIndex]];
		return vdName;
		NSLog(@" videoName: %@",vdName);	}
	if (selectedCategory==5) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[ambitionVideos objectAtIndex:selectedIndex]];
		return vdName;
		NSLog(@" videoName: %@",vdName);
		
		
	}
	if (selectedCategory==6) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[theJobVideos objectAtIndex:selectedIndex]];
		return vdName;
		NSLog(@" videoName: %@",vdName);
		
	}
	return nil;
}


- (void)productPurchaseFailed:(NSNotification *)notification {
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    SKPaymentTransaction * transaction = (SKPaymentTransaction *) notification.object;    
    if (transaction.error.code != SKErrorPaymentCancelled) {    
        UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Error!" 
                                                         message:transaction.error.localizedDescription 
                                                        delegate:nil 
                                               cancelButtonTitle:nil 
                                               otherButtonTitles:@"OK", nil] autorelease];
        
        [alert show];
    }
    
}

-(void)backButtonPressed{	
	
	if (theMovie) {
		[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:theMovie ];
	}
	
	[self.navigationController  popViewControllerAnimated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewWillAppear:(BOOL)animated
{
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productsLoaded:) name:kProductsLoadedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productPurchased:) name:kProductPurchasedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productPurchaseFailed:) name:kProductPurchaseFailedNotification object: nil];
	[UserRecordsManager sharedManager].playLabel = self.playLabel;
	[UserRecordsManager sharedManager].recoedLabel = self.recordLabel;
	[homeController performSelector:@selector(layoutAnimated:) withObject:self afterDelay:0.5];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
    [super viewDidLoad];
	UIButton *backButtonInternal = [[UIButton alloc] initWithFrame:CGRectMake(0,0,54,30)];
	
	[backButtonInternal setBackgroundImage:[UIImage imageNamed:@"button-1.png"] forState:UIControlEventTouchUpInside];
	[backButtonInternal setTitle:@"Index" forState:UIControlStateNormal];
	[backButtonInternal addTarget:self action:@selector(backButtonPressed) forControlEvents:UIControlEventTouchUpInside];
	UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithCustomView:backButtonInternal];   
	[backButtonInternal release];
	[[self navigationItem] setLeftBarButtonItem:backBarButton];
	[backBarButton release];
	
	//selectedIndex=0;
	
	
	
	
	 profVideos=[[NSMutableArray alloc]init];
	[profVideos addObject:@"7Q"];
	[profVideos addObject:@"8Q"];
	[profVideos addObject:@"9Q"];
	[profVideos addObject:@"10Q"];
	[profVideos addObject:@"11Q"];
	[profVideos addObject:@"12Q"];
	[profVideos addObject:@"13Q"];
	[profVideos addObject:@"41Q"];
	
	
	
	 eduVideos=[[NSMutableArray alloc]init];
	[eduVideos addObject:@"1Q"];
	[eduVideos addObject:@"2Q"];
	[eduVideos addObject:@"3Q"];
	
	
	
	 expVideos=[[NSMutableArray alloc]init];
	[expVideos addObject:@"4Q"];
	[expVideos addObject:@"5Q"];
	[expVideos addObject:@"6Q"];
	
	
	
	 persnalVideos=[[NSMutableArray alloc]init];
	
	[persnalVideos addObject:@"25Q"];
	[persnalVideos addObject:@"26Q"];
	[persnalVideos addObject:@"27Q"];
	[persnalVideos addObject:@"28Q"];
	[persnalVideos addObject:@"29Q"];
	[persnalVideos addObject:@"30Q"];
	[persnalVideos addObject:@"31Q"];
	[persnalVideos addObject:@"32Q"];
	[persnalVideos addObject:@"33Q"];
	[persnalVideos addObject:@"34Q"];
	[persnalVideos addObject:@"47Q"];
	[persnalVideos addObject:@"22Q"];
	
	
	 ambitionVideos=[[NSMutableArray alloc]init];
	[ambitionVideos addObject:@"23Q"];
	[ambitionVideos addObject:@"46Q"];

	
	
	theJobVideos=[[NSMutableArray alloc]init];
	[theJobVideos addObject:@"24Q"];
	[theJobVideos addObject:@"38Q"];
	[theJobVideos addObject:@"39Q"];
	[theJobVideos addObject:@"43Q"];
	[theJobVideos addObject:@"44Q"];
	[theJobVideos addObject:@"45Q"];
	
	
	
	 careerVideos=[[NSMutableArray alloc]init];
	[careerVideos addObject:@"14Q"];
	[careerVideos addObject:@"15Q"];
	[careerVideos addObject:@"16Q"];
	[careerVideos addObject:@"17Q"];
	[careerVideos addObject:@"18Q"];
	[careerVideos addObject:@"19Q"];
	[careerVideos addObject:@"20Q"];
	[careerVideos addObject:@"21Q"];
	[careerVideos addObject:@"35Q"];
	[careerVideos addObject:@"36Q"];
	[careerVideos addObject:@"37Q"];
	[careerVideos addObject:@"40Q"];
	[careerVideos addObject:@"42Q"];
	
	
	
	
	
	
	profMentorVideos=[[NSMutableArray alloc]init];
	[profMentorVideos addObject:@"7M"];
	[profMentorVideos addObject:@"8M"];
	[profMentorVideos addObject:@"9M"];
	[profMentorVideos addObject:@"10M"];
	[profMentorVideos addObject:@"11M"];
	[profMentorVideos addObject:@"12M"];
	[profMentorVideos addObject:@"13M"];
	[profMentorVideos addObject:@"41M"];
	
	
	
	eduMentorVideos=[[NSMutableArray alloc]init];
	[eduMentorVideos addObject:@"1M"];
	[eduMentorVideos addObject:@"2M"];
	[eduMentorVideos addObject:@"3M"];
	
	
	
	expMentorVideos=[[NSMutableArray alloc]init];
	
	[expMentorVideos addObject:@"4M"];
	[expMentorVideos addObject:@"5M"];
	[expMentorVideos addObject:@"6M"];
	
	
	persnalMentorVideos=[[NSMutableArray alloc]init];
	
	[persnalMentorVideos addObject:@"25M"];
	[persnalMentorVideos addObject:@"26M"];
	[persnalMentorVideos addObject:@"27M"];
	[persnalMentorVideos addObject:@"28M"];
	[persnalMentorVideos addObject:@"29M"];
	[persnalMentorVideos addObject:@"30M"];
	[persnalMentorVideos addObject:@"31M"];
	[persnalMentorVideos addObject:@"32M"];
	[persnalMentorVideos addObject:@"33M"];
	[persnalMentorVideos addObject:@"34M"];
	[persnalMentorVideos addObject:@"47M"];
	[persnalMentorVideos addObject:@"22M"];
	
	
	ambitionMentorVideos=[[NSMutableArray alloc]init];
	[ambitionMentorVideos addObject:@"23M"];
	[ambitionMentorVideos addObject:@"46M"];
	
	
	
	theJobMentorVideos=[[NSMutableArray alloc]init];
	[theJobMentorVideos addObject:@"24M"];
	[theJobMentorVideos addObject:@"38M"];
	[theJobMentorVideos addObject:@"39M"];
	[theJobMentorVideos addObject:@"43M"];
	[theJobMentorVideos addObject:@"44M"];
	[theJobMentorVideos addObject:@"45M"];
	
	
	careerMentorVideos=[[NSMutableArray alloc]init];
	[careerMentorVideos addObject:@"14M"];
	[careerMentorVideos addObject:@"15M"];
	[careerMentorVideos addObject:@"16M"];
	[careerMentorVideos addObject:@"17M"];
	[careerMentorVideos addObject:@"18M"];
	[careerMentorVideos addObject:@"19M"];
	[careerMentorVideos addObject:@"20M"];
	[careerMentorVideos addObject:@"21M"];
	[careerMentorVideos addObject:@"35M"];
	[careerMentorVideos addObject:@"36M"];
	[careerMentorVideos addObject:@"37M"];
	[careerMentorVideos addObject:@"40M"];
	[careerMentorVideos addObject:@"42M"];
	
	
	

	
	
	profAnswerVideos=[[NSMutableArray alloc]init];
	[profAnswerVideos addObject:@"7A"];
	[profAnswerVideos addObject:@"8A"];
	[profAnswerVideos addObject:@"9A"];
	[profAnswerVideos addObject:@"10A"];
	[profAnswerVideos addObject:@"11A"];
	[profAnswerVideos addObject:@"12A"];
	[profAnswerVideos addObject:@"13A"];
	[profAnswerVideos addObject:@"41A"];
	
	
	
	eduAnswerVideos=[[NSMutableArray alloc]init];
	[eduAnswerVideos addObject:@"1A"];
	[eduAnswerVideos addObject:@"2A"];
	[eduAnswerVideos addObject:@"3A"];
	
	
	
	expAnswerVideos=[[NSMutableArray alloc]init];
	
	[expAnswerVideos addObject:@"4A"];
	[expAnswerVideos addObject:@"5A"];
	[expAnswerVideos addObject:@"6A"];
	
	
	persnalAnswerVideos=[[NSMutableArray alloc]init];
	
	[persnalAnswerVideos addObject:@"25A"];
	[persnalAnswerVideos addObject:@"26A"];
	[persnalAnswerVideos addObject:@"27A"];
	[persnalAnswerVideos addObject:@"28A"];
	[persnalAnswerVideos addObject:@"29A"];
	[persnalAnswerVideos addObject:@"30A"];
	[persnalAnswerVideos addObject:@"31A"];
	[persnalAnswerVideos addObject:@"32A"];
	[persnalAnswerVideos addObject:@"33A"];
	[persnalAnswerVideos addObject:@"34A"];
	[persnalAnswerVideos addObject:@"47A"];
	[persnalAnswerVideos addObject:@"22A"];
	
	
	ambitionAnswerVideos=[[NSMutableArray alloc]init];
	[ambitionAnswerVideos addObject:@"23A"];
	[ambitionAnswerVideos addObject:@"46A"];
	
	
	
	theJobAnswerVideos=[[NSMutableArray alloc]init];
	[theJobAnswerVideos addObject:@"24A"];
	[theJobAnswerVideos addObject:@"38A"];
	[theJobAnswerVideos addObject:@"39A"];
	[theJobAnswerVideos addObject:@"43A"];
	[theJobAnswerVideos addObject:@"44A"];
	[theJobAnswerVideos addObject:@"45A"];
	
	
	
	careerAnswerVideos=[[NSMutableArray alloc]init];
	[careerAnswerVideos addObject:@"14A"];
	[careerAnswerVideos addObject:@"15A"];
	[careerAnswerVideos addObject:@"16A"];
	[careerAnswerVideos addObject:@"17A"];
	[careerAnswerVideos addObject:@"18A"];
	[careerAnswerVideos addObject:@"19A"];
	[careerAnswerVideos addObject:@"20A"];
	[careerAnswerVideos addObject:@"21A"];
	[careerAnswerVideos addObject:@"35A"];
	[careerAnswerVideos addObject:@"36A"];
	[careerAnswerVideos addObject:@"37A"];
	[careerAnswerVideos addObject:@"40A"];
	[careerAnswerVideos addObject:@"42A"];
	
	
}

- (IBAction)goMenu:(id)sender {
	[ApplicationNavigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)playAnswer:(id)sender {
	[[UserRecordsManager sharedManager] playSoundForKey:[self getVideoName]];
}

- (IBAction)recordAnswer:(id)sender {
	[[UserRecordsManager sharedManager] recordSoundForKey:[self getVideoName]];
}

-(void)purchaseProduct{
   /* UIAlertView * purchaseAlert = [[UIAlertView alloc] initWithTitle:@"Request Full Version" message:@"Only request for purchase will be sent, not actuall purchase" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel Purchase ", nil];
    purchaseAlert.tag = 0;
    [purchaseAlert show];
    [purchaseAlert release];*/
	Reachability *reach = [Reachability reachabilityForInternetConnection];	
	NetworkStatus netStatus = [reach currentReachabilityStatus];    
	if (netStatus == NotReachable) {        
		NSLog(@"No internet connection!");        
	} else {        
		//if ([InAppRageIAPHelper sharedHelper].products == nil) {
		
		[[InAppRageIAPHelper sharedHelper] requestProducts];
		
		self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
		hud.labelText = @"Loading Items...";
		[self performSelector:@selector(timeout:) withObject:nil afterDelay:30.0];
	}
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0 && alertView.tag == 1) {
        SKProduct *product = [[InAppRageIAPHelper sharedHelper].products objectAtIndex:0];
        
        NSLog(@"Buying %@...", product.productIdentifier);
        [[InAppRageIAPHelper sharedHelper] buyProductIdentifier:product.productIdentifier];
        
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"Buying aVirtualInterview...";
        [self performSelector:@selector(timeout:) withObject:nil afterDelay:60*5];
    }
    if (buttonIndex == 0 && alertView.tag == 0) {
        
       /* Reachability *reach = [Reachability reachabilityForInternetConnection];	
        NetworkStatus netStatus = [reach currentReachabilityStatus];    
        if (netStatus == NotReachable) {        
            NSLog(@"No internet connection!");        
        } else {        
            //if ([InAppRageIAPHelper sharedHelper].products == nil) {
                
                [[InAppRageIAPHelper sharedHelper] requestProducts];
                self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.labelText = @"Loading comics...";
                [self performSelector:@selector(timeout:) withObject:nil afterDelay:30.0];
                
           // }        
        }*/
    }
    
    
}


-(void)loadRequestWithIndex:(NSInteger)Index :(NSInteger)Category :(NSString *)_videoTitle{
	
	selectedIndex=Index;
	selectedCategory=Category;
	
	self.videoTitle.text = _videoTitle;
	
	Bundle=[NSBundle mainBundle];
	MoviePath=[[NSString alloc]init ];
	videoName=[[NSString alloc]init ];
	MovieURL=[[NSURL alloc]init ];
	
	NSBundle * bundle=[NSBundle mainBundle];
	self.Bundle=bundle;
	NSLog(@" bundle: %@",bundle);
	//[bundle release];
	
	
	//[self.view addSubview:movieView];
	
	
	
	if (selectedCategory==0) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[eduVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==1) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[expVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
    
    BOOL status = [[NSUserDefaults standardUserDefaults] boolForKey:@"com.MWS.aVirtualInterview"];
    if ((selectedCategory >= 2) && (!status)){
        [self purchaseProduct];
        
    }
    else{
        
    
    
	if (selectedCategory==2) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[profVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==3) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[persnalVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==4) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[careerVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==5) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[ambitionVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];
		
	}
	if (selectedCategory==6) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[theJobVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	
	}
	
	
	NSString * moviepath=[Bundle pathForResource:videoName ofType:@"mp4"] ;
	self.MoviePath=moviepath;
	NSLog(@" movie Path: %@",moviepath);
	//[moviepath release];
	
	NSURL * url=[NSURL fileURLWithPath:MoviePath];
	NSLog(@" URL Path: %@",url);
	self.MovieURL=url;
//	[url release];	
	
	MPMoviePlayerViewController * player=[[MPMoviePlayerViewController alloc]initWithContentURL:MovieURL ];
	if (player) {
		[self presentMoviePlayerViewControllerAnimated:player];
		[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player];
	}	
	
	[player release];
	//[bundle release];
	//[url release];
	//[moviepath release];
	//[vdName release];
}
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


#pragma mark -
#pragma mark Actions

-(IBAction)playMentorButtonAction{
	
	
	Bundle=[NSBundle mainBundle];
	MoviePath=[[NSString alloc]init ];
	videoName=[[NSString alloc]init ];
	MovieURL=[[NSURL alloc]init ];
	
	NSBundle * bundle=[NSBundle mainBundle];
	self.Bundle=bundle;
	NSLog(@" bundle: %@",bundle);
	[bundle release];
	
	
	if (selectedCategory==0) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[eduMentorVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==1) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[expMentorVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
    
    
    BOOL status = [[NSUserDefaults standardUserDefaults] boolForKey:@"com.MWS.aVirtualInterview"];
    if ((selectedCategory >= 2) && (!status)){
        [self purchaseProduct];
        
    }
    else{
        
	if (selectedCategory==2) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[profMentorVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==3) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[persnalMentorVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==4) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[careerMentorVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==5) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[ambitionMentorVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];
		
	}
	if (selectedCategory==6) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[theJobMentorVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	
	}
	
	
	NSString * moviepath=[Bundle pathForResource:videoName ofType:@"mp4"] ;
	self.MoviePath=moviepath;
	NSLog(@" movie Path: %@",moviepath);
	[moviepath release];
	
	NSURL * url=[NSURL fileURLWithPath:MoviePath];
	NSLog(@" URL Path: %@",url);
	self.MovieURL=url;
	[url release];	
	
	MPMoviePlayerViewController * player=[[MPMoviePlayerViewController alloc]initWithContentURL:MovieURL ];
	if (player) {
		[self presentMoviePlayerViewControllerAnimated:player];
		[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player ];
	}	
	
	[player release];
    }

}
-(IBAction)playAnswerButtonAction{
	Bundle=[NSBundle mainBundle];
	MoviePath=[[NSString alloc]init ];
	videoName=[[NSString alloc]init ];
	MovieURL=[[NSURL alloc]init ];
	
	NSBundle * bundle=[NSBundle mainBundle];
	self.Bundle=bundle;
	NSLog(@" bundle: %@",bundle);
	[bundle release];
	
	
	if (selectedCategory==0) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[eduAnswerVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==1) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[expAnswerVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
    
    BOOL status = [[NSUserDefaults standardUserDefaults] boolForKey:@"com.MWS.aVirtualInterview"];
    if ((selectedCategory >= 2) && (!status)){
        [self purchaseProduct];
        
    }
    else{
        
	if (selectedCategory==2) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[profAnswerVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==3) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[persnalAnswerVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==4) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[careerAnswerVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==5) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[ambitionAnswerVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];
		
	}
	if (selectedCategory==6) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[theJobAnswerVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	
	}
	
	
	NSString * moviepath=[Bundle pathForResource:videoName ofType:@"mp4"] ;
	self.MoviePath=moviepath;
	NSLog(@" movie Path: %@",moviepath);
	[moviepath release];
	
	NSURL * url=[NSURL fileURLWithPath:MoviePath];
	NSLog(@" URL Path: %@",url);
	self.MovieURL=url;
	[url release];	
	
	MPMoviePlayerViewController * player=[[MPMoviePlayerViewController alloc]initWithContentURL:MovieURL ];
	if (player) {
		[self presentMoviePlayerViewControllerAnimated:player];
		[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player ];
	}	
	
	[player release];

    }
}


-(IBAction)playButtonAction{
	
	Bundle=[NSBundle mainBundle];
	MoviePath=[[NSString alloc]init ];
	videoName=[[NSString alloc]init ];
	MovieURL=[[NSURL alloc]init ];
	
	NSBundle * bundle=[NSBundle mainBundle];
	self.Bundle=bundle;
	NSLog(@" bundle: %@",bundle);
	[bundle release];
	
	
	//[self.view addSubview:movieView];
	
	

	if (selectedCategory==0) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[eduVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==1) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[expVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
    BOOL status = [[NSUserDefaults standardUserDefaults] boolForKey:@"com.MWS.aVirtualInterview"];
    if ((selectedCategory >= 2) && (!status)){
        [self purchaseProduct];
        
    }
    else{
        
	if (selectedCategory==2) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[profVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==3) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[persnalVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==4) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[careerVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	}
	if (selectedCategory==5) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[ambitionVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];
		
	}
	if (selectedCategory==6) {
		NSString * vdName=[NSString stringWithFormat:@"%@",[theJobVideos objectAtIndex:selectedIndex]];
		self.videoName=vdName;
		NSLog(@" videoName: %@",vdName);
		[vdName release];	
	}
	
	
	NSString * moviepath=[Bundle pathForResource:videoName ofType:@"mp4"] ;
	self.MoviePath=moviepath;
	NSLog(@" movie Path: %@",moviepath);
	[moviepath release];
	
	NSURL * url=[NSURL fileURLWithPath:MoviePath];
	NSLog(@" URL Path: %@",url);
	self.MovieURL=url;
	[url release];	
	
	MPMoviePlayerViewController * player=[[MPMoviePlayerViewController alloc]initWithContentURL:MovieURL ];
	if (player) {
		[self presentMoviePlayerViewControllerAnimated:player];
		[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player ];
	}	
	
	[player release];
    }

}



/*
 -(IBAction)playPreviousButtonAction{
	
	
	
	
	if (selectedIndex-1 >=0) {
		
		selectedIndex --;
		
		Bundle=[NSBundle mainBundle];
		MoviePath=[[NSString alloc]init ];
		videoName=[[NSString alloc]init ];
		MovieURL=[[NSURL alloc]init ];
		
		NSBundle * bundle=[NSBundle mainBundle];
		self.Bundle=bundle;
		NSLog(@" bundle: %@",bundle);
		[bundle release];
		
		
		//[self.view addSubview:movieView];
		
		
		if (selectedCategory==0) {
			NSString * vdName=[NSString stringWithFormat:@"%@",[IntroVideos objectAtIndex:selectedIndex]];
			self.videoName=vdName;
			NSLog(@" videoName: %@",vdName);
			[vdName release];	
		}
		if (selectedCategory==1) {
			NSString * vdName=[NSString stringWithFormat:@"%@",[eduVideos objectAtIndex:selectedIndex]];
			self.videoName=vdName;
			NSLog(@" videoName: %@",vdName);
			[vdName release];	}
		if (selectedCategory==2) {
			NSString * vdName=[NSString stringWithFormat:@"%@",[expVideos objectAtIndex:selectedIndex]];
			self.videoName=vdName;
			NSLog(@" videoName: %@",vdName);
			[vdName release];	}
		if (selectedCategory==3) {
			NSString * vdName=[NSString stringWithFormat:@"%@",[profVideos objectAtIndex:selectedIndex]];
			self.videoName=vdName;
			NSLog(@" videoName: %@",vdName);
			[vdName release];	}
		if (selectedCategory==4) {
			NSString * vdName=[NSString stringWithFormat:@"%@",[persnalVideos objectAtIndex:selectedIndex]];
			self.videoName=vdName;
			NSLog(@" videoName: %@",vdName);
			[vdName release];	}
		if (selectedCategory==5) {
			NSString * vdName=[NSString stringWithFormat:@"%@",[careerVideos objectAtIndex:selectedIndex]];
			self.videoName=vdName;
			NSLog(@" videoName: %@",vdName);
			[vdName release];	}
		if (selectedCategory==6) {
			NSString * vdName=[NSString stringWithFormat:@"%@",[ambitionVideos objectAtIndex:selectedIndex]];
			self.videoName=vdName;
			NSLog(@" videoName: %@",vdName);
			[vdName release];
			
		}
		if (selectedCategory==7) {
			NSString * vdName=[NSString stringWithFormat:@"%@",[theJobVideos objectAtIndex:selectedIndex]];
			self.videoName=vdName;
			NSLog(@" videoName: %@",vdName);
			[vdName release];	
		}
		
		
		NSString * moviepath=[Bundle pathForResource:videoName ofType:@"mp4"] ;
		self.MoviePath=moviepath;
		NSLog(@" movie Path: %@",moviepath);
		[moviepath release];
		
		NSURL * url=[NSURL URLWithString:MoviePath];
		NSLog(@" URL Path: %@",url);
		self.MovieURL=url;
		[url release];	
		
		MPMoviePlayerViewController * player=[[MPMoviePlayerViewController alloc]initWithContentURL:MovieURL ];
		if (player) {
			[self presentMoviePlayerViewControllerAnimated:player];
			[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player ];
		}	
		
		[player release];
	}
	
	
	else {
		UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"Videos Ended" message:@"Please Push Next Button" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil ];
		[alert show];
		[alert release];
	}
	
	


	
}



	*/
	
	
-(void)movieFinishedCallback:(NSNotification *)aNotification {
		
		
		
		
		MPMoviePlayerViewController * player=[aNotification object];

	
		
	
		[[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:player];
		[self dismissMoviePlayerViewControllerAnimated];
	
		[player release];
		
		
		
	
		
		
		Bundle=nil;
		MoviePath=nil;
		MovieURL=nil;
		videoName=nil;
		
		
	
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	[self setVideoTitle:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}



- (void)dealloc {
	[videoTitle release];
	[super dealloc];
}
@end
