//
//  IndexVC_iPad.h
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MBProgressHUD.h"
#import "Reachability.h"
#import "IAPHelper.h"


@interface IndexVC_iPad : UIViewController {
	MPMoviePlayerViewController * theMovie;
	NSMutableArray * IntroVideos;
	NSMutableArray * profVideos;
	NSMutableArray * eduVideos;
	NSMutableArray * expVideos;
	NSMutableArray * persnalVideos;
	NSMutableArray * ambitionVideos;
	NSMutableArray * theJobVideos;
	NSMutableArray * careerVideos;
	
	
	NSMutableArray * IntroMentorVideos;
	NSMutableArray * profMentorVideos;
	NSMutableArray * eduMentorVideos;
	NSMutableArray * expMentorVideos;
	NSMutableArray * persnalMentorVideos;
	NSMutableArray * ambitionMentorVideos;
	NSMutableArray * theJobMentorvideos;
	NSMutableArray * careerMentorVideos;
	
	NSMutableArray * IntroAnswerVideos;
	NSMutableArray * profAnswerVideos;
	NSMutableArray * eduAnswerVideos;
	NSMutableArray * expAnswerVideos;
	NSMutableArray * persnalAnswerVideos;
	NSMutableArray * ambitionAnswerVideos;
	NSMutableArray * theJobAnswervideos;
	NSMutableArray * careerAnswerVideos;
	
	int selectedIndex;
	int selectedCategory;
    
    IAPHelper * helper;
    MBProgressHUD * hud;
	
	
	UIButton * nextButton;
	UIButton * previousButton;
	
	NSString  * MoviePath;
	NSString * videoName;
	NSBundle  * Bundle;
	NSURL * MovieURL;
    
    
	
	
}
- (IBAction)playAnswer:(id)sender;

- (IBAction)recordAnswer:(id)sender;

-(void)purchaseProduct;

-(IBAction)playButtonAction;

-(IBAction)playMentorButtonAction;
-(IBAction)playAnswerButtonAction;
- (IBAction)goMenu:(id)sender;

@property(nonatomic,retain) IBOutlet UILabel * playLabel;
@property(nonatomic,retain) IBOutlet UILabel * recordLabel;

@property (retain)    IAPHelper * helper;
@property (retain) MBProgressHUD *hud;
@property(nonatomic,retain)IBOutlet UIButton * nextButton;
@property(nonatomic,retain)IBOutlet UIButton * previousButton;
@property (retain, nonatomic) IBOutlet UILabel *videoTitle;
@property(nonatomic,assign)int selectedIndex;
@property(nonatomic,assign) int selectedCategory;
@property(nonatomic,retain) MPMoviePlayerViewController * theMovie;
@property(nonatomic,retain)NSMutableArray * IntroVideos;
@property(nonatomic,retain)NSMutableArray * profVideos;
@property(nonatomic,retain)NSMutableArray * eduVideos;
@property(nonatomic,retain)NSMutableArray * expVideos;
@property(nonatomic,retain)NSMutableArray * persnalVideos;
@property(nonatomic,retain)NSMutableArray * ambitionVideos;
@property(nonatomic,retain)NSMutableArray * theJobVideos;
@property(nonatomic,retain)NSMutableArray * careerVideos;


@property(nonatomic,retain)NSMutableArray * IntroMentorVideos;
@property(nonatomic,retain)NSMutableArray * profMentorVideos;
@property(nonatomic,retain)NSMutableArray * eduMentorVideos;
@property(nonatomic,retain)NSMutableArray * expMentorVideos;
@property(nonatomic,retain)NSMutableArray * persnalMentorVideos;
@property(nonatomic,retain)NSMutableArray * ambitionMentorVideos;
@property(nonatomic,retain)NSMutableArray * theJobMentorVideos;
@property(nonatomic,retain)NSMutableArray * careerMentorVideos;

@property(nonatomic,retain)NSMutableArray * IntroAnswerVideos;
@property(nonatomic,retain)NSMutableArray * profAnswerVideos;
@property(nonatomic,retain)NSMutableArray * eduAnswerVideos;
@property(nonatomic,retain)NSMutableArray * expAnswerVideos;
@property(nonatomic,retain)NSMutableArray * persnalAnswerVideos;
@property(nonatomic,retain)NSMutableArray * ambitionAnswerVideos;
@property(nonatomic,retain)NSMutableArray * theJobAnswerVideos;
@property(nonatomic,retain)NSMutableArray * careerAnswerVideos;
@property(nonatomic,retain)NSString * videoName;
@property(nonatomic,retain)NSString * MoviePath;
@property(nonatomic,retain)NSBundle * Bundle;
@property(nonatomic,retain)NSURL * MovieURL;

-(void)loadRequestWithIndex:(NSInteger)Index :(NSInteger)Category :(NSString*) _videoTitle;



@end
