//
//  AppDelegate_iPhone.h
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeController;

UINavigationController * ApplicationNavigationController;
HomeController * homeController;

@interface AppDelegate_iPhone : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UITabBarController * tabBar;
	UIView * spView;
	UIProgressView * pView;
	UILabel * pLabel;
	int a;
}

@property(nonatomic,assign)int a;
@property (nonatomic,retain) IBOutlet UIWindow *window;
@property (nonatomic,retain) IBOutlet	UITabBarController * tabBar;

@property (nonatomic,retain)IBOutlet	UIView * spView;
@property (nonatomic,retain)IBOutlet	UIProgressView * pView;
@property (nonatomic,retain)IBOutlet UILabel * pLabel;
@property (nonatomic,retain)IBOutlet UIView * mainMenuView;
+(UINavigationController*) getNavigation;
+(AppDelegate_iPhone*) appDelegate;
@end

