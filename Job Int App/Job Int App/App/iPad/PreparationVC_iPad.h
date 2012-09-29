//
//  PreparationVC_iPad.h
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "PointSystemManager.h"

@interface PreparationVC_iPad : UIViewController {
	
	MPMoviePlayerViewController * theMovie;
	UIView * view1;
	
	int selectedIndex;
	NSMutableArray * videos;
	NSString * videoName;
	UILabel * prepLabel;	
	
	
}


-(IBAction)playNextButtonAction;
-(IBAction)playPreviousButtonAction;
-(IBAction)go;

@property(nonatomic,retain)NSString * videoName;
@property(nonatomic,retain)NSString * MoviePath;
@property(nonatomic,retain)NSBundle * Bundle;
@property(nonatomic,retain)NSURL * MovieURL;
@property(nonatomic,retain)MPMoviePlayerViewController * theMovie;
@property(nonatomic,assign)int selectedIndex;
@property(nonatomic,retain)NSMutableArray * videos;
@property(nonatomic,retain)IBOutlet UILabel * prepLabel;


@end
