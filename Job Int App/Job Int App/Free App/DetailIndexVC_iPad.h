//
//  DetailIndexVC_iPad.h
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IndexVC_iPad;
@class IndexViewController_ipad;
@interface DetailIndexVC_iPad : UITableViewController {
	NSMutableArray * introVideos;
	NSMutableArray * eduVideos;
	
	NSMutableArray * expVideos;
	NSMutableArray * profVideos;
	
	NSMutableArray * personVideos;
	NSMutableArray * careerVideos;
	
	NSMutableArray * ambiVideos;
	NSMutableArray * theJob;
	
	
	//	IndexVC_iPhone * detailViewController;
	IndexViewController_ipad * indexView;
	int  selectedIndex;
	int selectedCategory;
	
	
	
}

@property(nonatomic,assign)int selectedIndex;
@property(nonatomic,assign)int selectedCategory;
@property(nonatomic,retain)NSMutableArray * introVideos;
@property(nonatomic,retain)	NSMutableArray * eduVideos;

@property(nonatomic,retain)NSMutableArray * expVideos;
@property(nonatomic,retain)NSMutableArray * profVideos;

@property(nonatomic,retain)NSMutableArray * personVideos;
@property(nonatomic,retain)NSMutableArray * careerVideos;

@property(nonatomic,retain)NSMutableArray * ambiVideos;
@property(nonatomic,retain)NSMutableArray * theJob;
//@property(nonatomic,retain)IndexVC_iPhone * detailViewController;

@property(nonatomic,retain)IndexViewController_ipad * indexView;

-(void)loadRequestWithIndex:(NSInteger)Index;


@end
