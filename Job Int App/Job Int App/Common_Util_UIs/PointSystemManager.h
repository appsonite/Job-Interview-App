//
//  PointSystemManager.h
//  Job Int App
//
//  Created by Liu Zixing on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
// pre- define - all point value
enum POINT_NAME
{
    
    POINT_ADD_PREPARATION_1 = 1,
    POINT_ADD_PREPARATION_2 = 2,
    POINT_ADD_PREPARATION_3 = 3,
    POINT_ADD_PREPARATION_4 = 4,
    POINT_ADD_PREPARATION_5 = 5,
    POINT_ADD_PREPARATION_6 = 6,
    //POINT_ADD_PREPARATION_7 = 7,
    POINT_ADD_VI_QUESTION_1 = 8,
    POINT_ADD_VI_QUESTION_40 = 47,
    POINT_ADD_VI_MENTOR_1 = 48,
    POINT_ADD_VI_MENTOR_40 = 87,
    POINT_ADD_VI_ANSWER_1 = 88,
    POINT_ADD_VI_ANSWER_40 = 127,
    POINT_ADD_FP_GENERAL_1 = 128,
    POINT_ADD_FP_GENERAL_43 = 170,
    POINT_ADD_FP_ACCOUNTING_1 = 171,
    POINT_ADD_FP_ACCOUNTING_48 = 218,
    POINT_ADD_FP_FINANCE_1 = 219,
    POINT_ADD_FP_FINANCE_42 = 260,
    POINT_ADD_FP_SALES_1 = 261,
    POINT_ADD_FP_SALES_42 = 302,
    POINT_ADD_FP_ENGINEERING_1 = 302,
    POINT_ADD_FP_ENGINEERING_42 = 343,
    POINT_ADD_FP_DIFFICULT_1 = 343,
    POINT_ADD_FP_DIFFICULT_28 = 370,
    POINT_ADD_CK_1 = 371,
    POINT_ADD_CK_44 = 414,
    POINT_ADD_QUIZ_1 = 415,
    POINT_ADD_QUIZ_20 = 434,
    
};

@interface PointSystemManager : NSObject
{
    NSMutableDictionary *dicPointRefData;
    NSArray *arrDescription;
    int point;
}
@property (assign, nonatomic) UILabel *lblPoint;
@property (assign, nonatomic) UILabel *lblDescription;
@property (assign, nonatomic) UIImageView *imageView;
+(id) sharedManager;
+(void) releaseManager;
-(void) initData;
-(void) updateUI;
@end
