//
//  MoreScreenCell.h
//  aPilotsQuest free
//
//  Created by Viktor on 20.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadPool.h"

@interface MoreScreenCell : UITableViewCell 

@property(nonatomic,retain) IBOutlet UIImageView * image;
@property(nonatomic,retain) IBOutlet UILabel     * title;
@property(nonatomic,retain) IBOutlet UITextView  * descriptionText;
@property(nonatomic,retain) IBOutlet UIActivityIndicatorView * activity;

-(void) setImageURL: (UIImage*) _image titleText:(NSString*) _title description:(NSString*) _description;
-(void) stopActivity;
-(void) startActivity;
@end
