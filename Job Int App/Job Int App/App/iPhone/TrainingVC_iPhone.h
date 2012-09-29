//
//  TrainingVC_iPhone.h
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MediaPlayer/MPMoviePlayerViewController.h>
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "IAPHelper.h"



@interface TrainingVC_iPhone : UIViewController<UIAlertViewDelegate> {
	
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
    //in app purchase additions
@property (retain)    IAPHelper * helper;
@property (retain) MBProgressHUD *hud;
-(void)purchaseProduct;

-(IBAction)playButtonAction;
-(IBAction)playNextButtonAction;
-(IBAction)playPreviousButtonAction;
-(IBAction)playMentorButtonAction;
-(IBAction)playAnswerButtonAction;
-(IBAction)recordAnswer:(id)sender;
-(IBAction)PlayAnswer:(id)sender;
- (IBAction)goMenu:(id)sender;

@property(nonatomic,retain) IBOutlet UILabel * playLabel;
@property(nonatomic,retain) IBOutlet UIButton * recordButton;

@property(nonatomic,retain)IBOutlet UIButton * nextButton;
@property(nonatomic,retain)IBOutlet UILabel * titleLabel;
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
