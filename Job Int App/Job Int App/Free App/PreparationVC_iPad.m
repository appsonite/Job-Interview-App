    //
//  PreparationVC_iPad.m
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate_iPad.h"
#import "PreparationVC_iPad.h"
#import "VideosTitles.h"


@implementation PreparationVC_iPad
@synthesize theMovie;
@synthesize selectedIndex;
@synthesize videos;
@synthesize videoName,MoviePath,MovieURL,Bundle;
@synthesize prepLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	selectedIndex=0;
	self.prepLabel.text = [VideosTitles getPrepTitleByIndex:selectedIndex];
	
	videos=[[NSMutableArray alloc]init];
	
	[videos addObject:@"1P"];
	[videos addObject:@"2P"];
	[videos addObject:@"3P"];
	[videos addObject:@"4P"];
	[videos addObject:@"5P"];
	[videos addObject:@"6P"];
}


- (IBAction)go {
	self.prepLabel.text = [VideosTitles getPrepTitleByIndex:selectedIndex];
	
	
	
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
	
	
	
	MPMoviePlayerViewController * player=[[MPMoviePlayerViewController alloc]initWithContentURL:MovieURL ];
	
	if (player) {
		
		
		[self presentMoviePlayerViewControllerAnimated:player];
		
		[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player ];
		
		
		
		
		
	}
	[player release];
}


-(void)viewWillAppear:(BOOL)animated
{
	[homeController performSelector:@selector(layoutAnimated:) withObject:self afterDelay:0.5];
}

-(IBAction)playNextButtonAction{
	
	if (selectedIndex+1 < [videos count]) {
		
		selectedIndex ++;
		self.prepLabel.text = [VideosTitles getPrepTitleByIndex:selectedIndex];
		
		NSLog(@"Selected Index: %i",selectedIndex);
		
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
		
		
		
		/*MPMoviePlayerViewController * player=[[MPMoviePlayerViewController alloc]initWithContentURL:MovieURL ];
		
		if (player) {
			
			
			[self presentMoviePlayerViewControllerAnimated:player];
			
			[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player ];
			
		}
		[player release];*/
	}
	else {
		
		UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"Videos Ended" message:@"All videos are ended please push previous button" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil ];
		[alert show];
		[alert release];
		
	}
	
	
	
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
	
	return YES;
}

-(void)movieFinishedCallback:(NSNotification *)aNotification {
	
	
	
	
	MPMoviePlayerViewController * player=[aNotification object];
	
	[[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:player];
	[self dismissMoviePlayerViewControllerAnimated];
	
	
	[player release];
	
	
	
}

-(IBAction)playPreviousButtonAction{
	
	
	if (selectedIndex-1 >=0) {
		
		selectedIndex --;
		self.prepLabel.text = [VideosTitles getPrepTitleByIndex:selectedIndex];
		
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
		
		
		
		/*MPMoviePlayerViewController * player=[[MPMoviePlayerViewController alloc]initWithContentURL:MovieURL ];
		
		if (player) {
			
			
			[self presentMoviePlayerViewControllerAnimated:player];
			
			[[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:) name:MPMoviePlayerPlaybackDidFinishNotification object:player ];
			
			
			
			
			
		}
		[player release];*/
		
	}
	
	else {
		UIAlertView * alert=[[UIAlertView alloc]initWithTitle:@"Videos Ended" message:@"Please Push Next Button" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil ];
		[alert show];
		[alert release];
	}
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}






@end
