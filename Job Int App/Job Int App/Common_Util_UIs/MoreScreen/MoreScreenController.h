//
//  MoreScreenController.h
//  aPilotsQuest free
//
//  Created by Viktor on 20.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSDataProvider.h"
#import "DownloadPool.h"

@interface MoreScreenController : UIViewController <UITableViewDelegate,UITableViewDataSource,MSDataProviderDelegate,DownloadDelegate>

@property (nonatomic,retain) IBOutlet UITableView * tableView;

+(MoreScreenController*) moreScreen;

- (IBAction)backToMen:(id)sender;

- (void) setData:(NSArray*) dataContent;

- (void) showMenu;



@end
