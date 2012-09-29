//
//  HomeController.h
//  Job Int App
//
//  Created by Viktor on 04.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface HomeController_ipad : UIViewController <ADBannerViewDelegate>
- (IBAction)goToPrep:(id)sender;
- (IBAction)goToInterview:(id)sender;
- (IBAction)goToIndex:(id)sender;
- (IBAction)goToMoreScreen:(id)sender;

@property (nonatomic,retain) ADBannerView * bannerView;

- (void)layoutAnimated:(BOOL)animated;

@end
