//
//  FlipCardView.h
//  Job Int App
//
//  Created by Liu Zixing on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlipCardView : UIView
{
    UILabel *frontCard;
    UILabel *backCard;
    BOOL isFlipped;
}
@property (assign, nonatomic) int point_index;
- (id)initWithFrame:(CGRect)frame Question:(NSString*)question Answer:(NSString*) answer;
@end
