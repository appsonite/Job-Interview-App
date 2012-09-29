//
//  FlipCardsAnswerController.h
//  Job Int App
//
//  Created by Liu Zixing on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlipCardView.h"
#import "MBProgressHUD.h"
#import "MKStoreManager.h"

@interface FlipCardsAnswerController : UIViewController <UIScrollViewDelegate , MKStoreManagerDelegate>
{
    IBOutlet UIScrollView   *scrollFlipCard;
    IBOutlet UILabel        *lblPage;
    
    CGSize                  scrollSize;
    NSMutableArray          *arrAnswer;
    NSMutableArray          *arrQuestion;
    int                     numsOfQuestion;
    int                     numsOfFreeCards;
}
@property (retain , nonatomic) NSString *refData;

- (void) resetLable;
- (IBAction) actionFirst;
- (IBAction) actionPrev;
- (IBAction) actionNext;
- (IBAction) actionLast;
@end
