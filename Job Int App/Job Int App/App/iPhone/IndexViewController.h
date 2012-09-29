//
//  IndexViewController.h
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailIndexVC;
@interface IndexViewController : UITableViewController {
	
	
	NSMutableArray * categories;
	//DetailIndexVC * detailView;
	int selectedCategory;
	

}

@property(nonatomic,assign)int selectedCategory;
@property(nonatomic,retain)NSMutableArray * categories;
//@property(nonatomic,retain)	DetailIndexVC * detailView;


@end
