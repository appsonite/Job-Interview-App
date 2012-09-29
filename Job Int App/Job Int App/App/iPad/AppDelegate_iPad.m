//
//  AppDelegate_iPad.m
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate_iPad.h"
#import "HomeController_ipad.h"

@interface AppDelegate_iPad (){
	HomeController_ipad * homeController;
}

@end

@implementation AppDelegate_iPad

@synthesize window;
@synthesize tabBar;
@synthesize spView;
@synthesize pView;
@synthesize pLabel;
@synthesize logoView;
@synthesize a;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    [MKStoreManager loadPurchases];
    [MKStoreManager sharedManager];
    [window makeKeyAndVisible];
	//[window addSubview:tabBar.view];
	/*if (spView==NULL) {
	 spView=[[SplashScreen alloc]initWithNibName:@"SplashScreen" bundle:nil ];
	 }*/
	homeController = [[HomeController_ipad alloc] init];
	ApplicationNavigationController = [[[UINavigationController alloc] initWithRootViewController:homeController] retain];
	ApplicationNavigationController.navigationBar.barStyle = UIBarStyleBlack;
	
	[self.window addSubview:spView];
	[self.spView addSubview:pView];
	[self.spView addSubview:pLabel];
	[self.spView addSubview:self.logoView];
	
	
	for (int i=0; i<10 ;i++) {
		[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(progressAction) userInfo:nil repeats:YES];
		
	}
	[NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(tabView) userInfo:nil repeats:NO];
    
    return YES;
}

-(void)progressAction{
	
	a=a+1;
	
	[pView setProgress:pView.progress+0.01];
	[pLabel setText:[NSString stringWithFormat:@"Loading %i%%",a]];
	
}


-(void)tabView{
	
	[self.spView removeFromSuperview];
	[self.window removeFromSuperview];
	[self.window addSubview:ApplicationNavigationController.view];
	
}	

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[pLabel release];
	[pView release];
	[spView release];
	[tabBar release];
    [window release];
    [logoView release];
    [super dealloc];
}

@end