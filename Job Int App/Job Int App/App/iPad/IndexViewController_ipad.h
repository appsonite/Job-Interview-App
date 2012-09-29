//
//  IndexViewController_ipad.h
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailIndexVC_iPad;
@interface IndexViewController_ipad : UITableViewController {

	
	
	
			
		NSMutableArray * categories;
	//	DetailIndexVC_iPad * detailView;
		int seletedIndex;
		
		
	}
	
	@property(nonatomic,assign)int seletedIndex;
	@property(nonatomic,retain)NSMutableArray * categories;
	//@property(nonatomic,retain)	DetailIndexVC_iPad * detailView;
	
	


@end
