//
//  HomeController.h
//  Job Int App
//
//  Created by Viktor on 04.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface HomeController : UIViewController <ADBannerViewDelegate>

- (IBAction)goToPreparation:(UIButton *)sender;

- (IBAction)goToInterview:(UIButton *)sender;

- (IBAction)goToIndex:(id)sender;

@property (nonatomic,retain) ADBannerView * bannerView;

- (void) layoutAnimated:(BOOL)animated;
- (IBAction)goToMoreScreen:(id)sender;

@end
