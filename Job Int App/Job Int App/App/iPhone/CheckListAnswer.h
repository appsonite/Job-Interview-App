//
//  CheckListAnswer.h
//  Job Int App
//
//  Created by Liu Zixing on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MKStoreManager.h"
#import "PointSystemManager.h"

@interface CheckListAnswer : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSDictionary *data;
    
}
@property (retain) NSString *strTbleSetter;
@end
