//
//  TrainingVC_iPad.m
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TrainingVC_iPad.h"
#import "InAppRageIAPHelper.h"
#import "VideosTitles.h"
#import "UserRecordsManager.h"
#import "AppDelegate_iPad.h"


@implementation TrainingVC_iPad

@synthesize theMovie=_theMovie;
@synthesize videos,mentorVideos,AnswerVideos;
@synthesize selectedIndex;
@synthesize  videoName;
@synthesize previousButton;
@synthesize nextButton;
@synthesize MoviePath;
@synthesize Bundle;
@synthesize MovieURL , hud;
@synthesize  helper;
@synthesize titlelabel;
@synthesize recordLabel;
@synthesize playLabel;

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

	
	selectedIndex = 0;
	
	self.titlelabel.text = [VideosTitles getTitleByIndex:selectedIndex];
	
	videos=[[NSMutableArray alloc]init];
	
	[videos addObject:@"1Q"];
	[videos addObject:@"2Q"];
	[videos addObject:@"3Q"];
	[videos addObject:@"4Q"];
	[videos addObject:@"5Q"];
	[videos addObject:@"6Q"];
	[videos addObject:@"7Q"];
	
	[videos addObject:@"8Q"];
	[videos addObject:@"9Q"];
	[videos addObject:@"10Q"];
	
	[videos addObject:@"11Q"];
	[videos addObject:@"12Q"];
	[videos addObject:@"13Q"];
	[videos addObject:@"14Q"];
	[videos addObject:@"15Q"];
	[videos addObject:@"16Q"];
	[videos addObject:@"17Q"];
	[videos addObject:@"18Q"];
	[videos addObject:@"19Q"];
	[videos addObject:@"20Q"];
	
	[videos addObject:@"21Q"];
	[videos addObject:@"22Q"];
	[videos addObject:@"23Q"];
	[videos addObject:@"24Q"];
	[videos addObject:@"25Q"];
	[videos addObject:@"26Q"];
	[videos addObject:@"27Q"];
	[videos addObject:@"28Q"];
	[videos addObject:@"29Q"];
	[videos addObject:@"30Q"];
	
	
	[videos addObject:@"31Q"];
	[videos addObject:@"32Q"];
	[videos addObject:@"33Q"];
	[videos addObject:@"34Q"];
	[videos addObject:@"35Q"];
	[videos addObject:@"36Q"];
	[videos addObject:@"37Q"];
	[videos addObject:@"38Q"];
	[videos addObject:@"39Q"];
	[videos addObject:@"40Q"];
	
	
	[videos addObject:@"41Q"];
	[videos addObject:@"42Q"];
	[videos addObject:@"43Q"];
	[videos addObject:@"44Q"];
	[videos addObject:@"45Q"];
	[videos addObject:@"46Q"];
	[videos addObject:@"47Q"];
	
	
	
	mentorVideos=[[NSMutableArray alloc]init ];
	
	[mentorVideos addObject:@"1M"];
	[mentorVideos addObject:@"2M"];
	[mentorVideos addObject:@"3M"];
	[mentorVideos addObject:@"4M"];
	[mentorVideos addObject:@"5M"];
	[mentorVideos addObject:@"6M"];
	[mentorVideos addObject:@"7M"];
	[mentorVideos addObject:@"8M"];
	[mentorVideos addObject:@"9M"];
	[mentorVideos addObject:@"10M"];
	
	[mentorVideos addObject:@"11M"];
	[mentorVideos addObject:@"12M"];
	[mentorVideos addObject:@"13M"];
	[mentorVideos addObject:@"14M"];
	[mentorVideos addObject:@"15M"];
	[mentorVideos addObject:@"16M"];
	[mentorVideos addObject:@"17M"];
	[mentorVideos addObject:@"18M"];
	[mentorVideos addObject:@"19M"];
	[mentorVideos addObject:@"20M"];
	
	[mentorVideos addObject:@"21M"];
	[mentorVideos addObject:@"22M"];
	[mentorVideos addObject:@"23M"];
	[mentorVideos addObject:@"24M"];
	[mentorVideos addObject:@"25M"];
	[mentorVideos addObject:@"26M"];
	[mentorVideos addObject:@"27M"];
	[mentorVideos addObject:@"28M"];
	[mentorVideos addObject:@"29M"];
	[mentorVideos addObject:@"30M"];
	
	
	[mentorVideos addObject:@"31M"];
	[mentorVideos addObject:@"32M"];
	[mentorVideos addObject:@"33M"];
	[mentorVideos addObject:@"34M"];
	[mentorVideos addObject:@"35M"];
	[mentorVideos addObject:@"36M"];
	[mentorVideos addObject:@"37M"];
	[mentorVideos addObject:@"38M"];
	[mentorVideos addObject:@"39M"];
	[mentorVideos addObject:@"40M"];
	
	[mentorVideos addObject:@"41M"];
	[mentorVideos addObject:@"42M"];
	[mentorVideos addObject:@"43M"];
	[mentorVideos addObject:@"44M"];
	[mentorVideos addObject:@"45M"];
	[mentorVideos addObject:@"46M"];
	[mentorVideos addObject:@"47M"];
    
	
	
	AnswerVideos=[[NSMutableArray alloc]init ];
	
	[AnswerVideos addObject:@"1A"];
	[AnswerVideos addObject:@"2A"];
	[AnswerVideos addObject:@"3A"];
	[AnswerVideos addObject:@"4A"];
	[AnswerVideos addObject:@"5A"];
	[AnswerVideos addObject:@"6A"];
	[AnswerVideos addObject:@"7A"];
	[AnswerVideos addObject:@"8A"];
	[AnswerVideos addObject:@"9A"];
	[AnswerVideos addObject:@"10A"];
	
	[AnswerVideos addObject:@"11A"];
	[AnswerVideos addObject:@"12A"];
	[AnswerVideos addObject:@"13A"];
	[AnswerVideos addObject:@"14A"];
	[AnswerVideos addObject:@"15A"];
	[AnswerVideos addObject:@"16A"];
	[AnswerVideos addObject:@"17A"];
	[AnswerVideos addObject:@"18A"];
	[AnswerVideos addObject:@"19A"];
	[AnswerVideos addObject:@"20A"];
	
	[AnswerVideos addObject:@"21A"];
	[AnswerVideos addObject:@"22A"];
	[AnswerVideos addObject:@"23A"];
	[AnswerVideos addObject:@"24A"];
	[AnswerVideos addObject:@"25A"];
	[AnswerVideos addObject:@"26A"];
	[AnswerVideos addObject:@"27A"];
	[AnswerVideos addObject:@"28A"];
	[AnswerVideos addObject:@"29A"];
	[AnswerVideos addObject:@"30A"];
	
	[AnswerVideos addObject:@"31A"];
	[AnswerVideos addObject:@"32A"];
	[AnswerVideos addObject:@"33A"];
	[AnswerVideos addObject:@"34A"];
	[AnswerVideos addObject:@"35A"];
	[AnswerVideos addObject:@"36A"];
	[AnswerVideos addObject:@"37A"];
	[AnswerVideos addObject:@"38A"];
	[AnswerVideos addObject:@"39A"];
	[AnswerVideos addObject:@"40A"];
	
	[AnswerVideos addObject:@"41A"];
	[AnswerVideos addObject:@"42A"];
	[AnswerVideos addObject:@"43A"];
	[AnswerVideos addObject:@"44A"];
	[AnswerVideos addObject:@"45A"];
	[AnswerVideos addObject:@"46A"];
	[AnswerVideos addObject:@"47A"];
    
	Bundle=[NSBundle mainBundle];
	MoviePath=[[NSString alloc]init ];
	videoName=[[NSString alloc]init ];
	MovieURL=[[NSURL alloc]init ];
	
	
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

-(void)purchaseProduct{
  /*  UIAlertView * purchaseAlert = [[UIAlertView alloc] initWithTitle:@"Request Full Version" message:@"Only request for purchase will be sent, not actuall purchase" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel Purchase ", nil];
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
                hud.labelText = @"Loading Items...";
                [self performSelector:@selector(timeout:) withObject:nil afterDelay:30.0];
        }*/
    }
    
    
}
#pragma mark -
#pragma mark Actions
-(IBAction)playNextButtonAction{
    
	if (selectedIndex+1 < [videos count]) 
	{ 
        //See if the product is purchased or not
        BOOL status = [[NSUserDefaults standardUserDefaults] boolForKey:@"com.MWS.aVirtualInterview"];
        if ((selectedIndex+1 >5) && (!status)){
            [self purchaseProduct];
            
        }
        else{
            
            selectedIndex++;
			self.titlelabel.text = [VideosTitles getTitleByIndex:selectedIndex];
            Bundle=[NSBundle mainBundle];
            MoviePath=[[NSString alloc]init ];
            videoName=[[NSString alloc]init ];
            MovieURL=[[NSURL alloc]init ];
            NSBundle * bundle=[NSBundle mainBundle];
            self.Bundle=bundle;
            NSLog(@" bundle: %@",bundle);
            [bundle release];
            NSString * vdName=[NSString stringWithFormat:@"%@",[videos objectAtIndex:selectedIndex]];
            
            self.videoName=vdName;
            
            
            NSLog(@" videoName: %@",vdName);
            [vdName release];
            NSString * moviepath=[Bundle pathForResource:videoName ofType:@"mp4"] ;
            
            self.MoviePath=moviepath;
            
            
            NSLog(@" movie Path: %@",moviepath);
            [moviepath release];
            NSURL * url=[NSURL fileURLWithPath:MoviePath];
            
            NSLog(@" URL Path: %@",url);
            
            self.MovieURL=url;
            [url release];
            
			
			//theMovie = [[MPMoviePlayerViewController alloc] init];
			/*MPMoviePlayerViewController * player=[[MPMoviePlayerViewController alloc]initWithContentURL:MovieURL ];
            
            if (player) {
                
                
                [self presentMoviePlayerViewControllerAnimated:player];
                
                [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player ];
            }
            
            
            [player release];*/
        }  
	}
	
	else {
		
		///[self.view addSubview:movieView];
		UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"Videos Ended" message:@"All videos are ended please push previous button" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil ];
		[alert show];
		//[self.view addSubview:alert];
		[alert release];
		
        
	}
	
	
	
    
}
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


-(IBAction)playPreviousButtonAction{
	
	
	if (selectedIndex-1 >=0) {
        
        selectedIndex --;
        self.titlelabel.text = [VideosTitles getTitleByIndex:selectedIndex];
        if ((selectedIndex > 5) && (!helper.productPurchased)){
            [self purchaseProduct];
            
        }
        else {
            Bundle=[NSBundle mainBundle];
            MoviePath=[[NSString alloc]init ];
            videoName=[[NSString alloc]init ];
            MovieURL=[[NSURL alloc]init ];
            
            NSBundle * bundle=[NSBundle mainBundle];
            self.Bundle=bundle;
            
            
            NSLog(@" bundle: %@",bundle);
            [bundle release];
            NSString * vdName=[NSString stringWithFormat:@"%@",[videos objectAtIndex:selectedIndex]];
            
            self.videoName=vdName;
            
            
            NSLog(@" videoName: %@",vdName);
            [vdName release];
            NSString * moviepath=[Bundle pathForResource:videoName ofType:@"mp4"] ;
            
            self.MoviePath=moviepath;
            
            
            NSLog(@" movie Path: %@",moviepath);
            [moviepath release];
            NSURL * url=[NSURL fileURLWithPath:MoviePath];
            
            NSLog(@" URL Path: %@",url);
            
            self.MovieURL=url;
            [url release];
            
            
            
           /* MPMoviePlayerViewController * player=[[MPMoviePlayerViewController alloc]initWithContentURL:MovieURL ];
            
            if (player) {
                
                [self presentMoviePlayerViewControllerAnimated:player];
                [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player ];
            }
            
            [player release];*/
        }
    }
	
    
	
	else {
		UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"Videos Ended" message:@"Please Push Next Button" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil ];
		[alert show];
		[alert release];
	}
    
    
	
    
}
-(IBAction)playMentorButtonAction{
	
    BOOL status = [[NSUserDefaults standardUserDefaults] boolForKey:@"com.MWS.aVirtualInterview"];
    if ((selectedIndex >5) && (!status)){
        [self purchaseProduct];
        
    }
    else{
        
        Bundle=[NSBundle mainBundle];
        MoviePath=[[NSString alloc]init ];
        videoName=[[NSString alloc]init ];
        MovieURL=[[NSURL alloc]init ];
        
        NSBundle * bundle=[NSBundle mainBundle];
        self.Bundle=bundle;
        
        
        NSLog(@" bundle: %@",bundle);
        [bundle release];
        NSString * vdName=[NSString stringWithFormat:@"%@",[mentorVideos objectAtIndex:selectedIndex]];
        
        self.videoName=vdName;
        
        
        NSLog(@" videoName: %@",vdName);
        [vdName release];
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
            
            [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player];
            
            
            
		}
        [player release];
    }
}
-(IBAction)playAnswerButtonAction{
    BOOL status = [[NSUserDefaults standardUserDefaults] boolForKey:@"com.MWS.aVirtualInterview"];
    if ((selectedIndex >5) && (!status)){
        [self purchaseProduct];
        
    }
    else{
        
        Bundle=[NSBundle mainBundle];
        MoviePath=[[NSString alloc]init ];
        videoName=[[NSString alloc]init ];
        MovieURL=[[NSURL alloc]init ];
        
        NSBundle * bundle=[NSBundle mainBundle];
        self.Bundle=bundle;
        
        
        NSLog(@" bundle: %@",bundle);
        [bundle release];
        NSString * vdName=[NSString stringWithFormat:@"%@",[AnswerVideos objectAtIndex:selectedIndex]];
        
        self.videoName=vdName;
        
        
        NSLog(@" videoName: %@",vdName);
        [vdName release];
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
    BOOL status = [[NSUserDefaults standardUserDefaults] boolForKey:@"com.MWS.aVirtualInterview"];
    if ((selectedIndex >5) && (!status)){
        [self purchaseProduct];
        
    }
    else{
        Bundle=[NSBundle mainBundle];
        MoviePath=[[NSString alloc]init ];
        videoName=[[NSString alloc]init ];
        MovieURL=[[NSURL alloc]init ];
        
        NSBundle * bundle=[NSBundle mainBundle];
        self.Bundle=bundle;
        
        
        NSLog(@" bundle: %@",bundle);
        [bundle release];
        NSString * vdName=[NSString stringWithFormat:@"%@",[videos objectAtIndex:selectedIndex]];
        
        self.videoName=vdName;
        
        
        NSLog(@" videoName: %@",vdName);
        [vdName release];
        NSString * moviepath=[Bundle pathForResource:videoName ofType:@"mp4"] ;
        
        self.MoviePath=moviepath;
        
        
        NSLog(@" movie Path: %@",moviepath);
        [moviepath release];
        NSURL * url=[NSURL fileURLWithPath:MoviePath];
        
        NSLog(@" URL Path: %@",url);
        
        self.MovieURL=url;
        [url release];
        
        
        //theMovie = [[MPMoviePlayerViewController alloc] init];
        MPMoviePlayerViewController * player=[[MPMoviePlayerViewController alloc]initWithContentURL:MovieURL ];
        
        if (player) {
            
            
            [self presentMoviePlayerViewControllerAnimated:player];
            [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player ];
			
        }
        [player release];
    }
}




- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    
	//[theMovie release];
	Bundle=nil;
	videoName=nil;
	MovieURL=nil;
	MoviePath=nil;
	
	[super didReceiveMemoryWarning];
	
	
	[Bundle release];
	[videoName release];
	[MoviePath release];
	[MovieURL release];

    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
	[UserRecordsManager sharedManager].playLabel = self.playLabel;
	[UserRecordsManager sharedManager].recoedLabel = self.recordLabel;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (IBAction)playAnswer:(UIButton *)sender {
	[[UserRecordsManager sharedManager] playSoundForKey:[videos objectAtIndex:selectedIndex]];
	NSLog(@"%@",[videos objectAtIndex:selectedIndex]);
}

- (IBAction)recordAnswer:(id)sender {
	[[UserRecordsManager sharedManager] recordSoundForKey:[videos objectAtIndex:selectedIndex]];
	NSLog(@"%@",[videos objectAtIndex:selectedIndex]);
}

@end