//
//  TrainingVC_iPad.h
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "IAPHelper.h"
#import "PointSystemManager.h"

@interface TrainingVC_iPad : UIViewController {
	
	MPMoviePlayerViewController * theMovie;
	NSMutableArray * videos;
	NSMutableArray * mentorVideos;
	NSMutableArray * AnswerVideos;
	
	NSString * videoName;
	
	UIButton * nextButton;
	UIButton * previousButton;
	
	int selectedIndex;
	NSString  * MoviePath;
	NSBundle  * Bundle;
	NSURL * MovieURL;
    IAPHelper * helper;
    
    //in app purchase additions
    MBProgressHUD * hud;
    
}

- (IBAction)playAnswer:(UIButton *)sender;

- (IBAction)recordAnswer:(id)sender;

//in app purchase additions
@property (retain)    IAPHelper * helper;
@property (retain) MBProgressHUD *hud;
-(void)purchaseProduct;-(IBAction)playButtonAction;
-(IBAction)playNextButtonAction;
-(IBAction)playPreviousButtonAction;
-(IBAction)playMentorButtonAction;
-(IBAction)playAnswerButtonAction;

@property(nonatomic,retain) IBOutlet UILabel * playLabel;
@property(nonatomic,retain) IBOutlet UIButton * recordButton;

@property(nonatomic,retain)IBOutlet UIButton * nextButton;
@property(nonatomic,retain)IBOutlet UILabel * titlelabel;
@property(nonatomic,retain)IBOutlet UIButton * previousButton;
@property(nonatomic,assign)int selectedIndex;
@property(readwrite,retain) MPMoviePlayerViewController * theMovie;
@property(nonatomic,retain)NSMutableArray * videos;
@property(nonatomic,retain)NSMutableArray * mentorVideos;
@property(nonatomic,retain)NSMutableArray * AnswerVideos;
@property(nonatomic,retain)NSString * videoName;
@property(nonatomic,retain)NSString * MoviePath;
@property(nonatomic,retain)NSBundle * Bundle;
@property(nonatomic,retain)NSURL * MovieURL;

@end
