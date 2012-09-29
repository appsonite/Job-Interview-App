//
//  FlipCardView.m
//  Job Int App
//
//  Created by Liu Zixing on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlipCardView.h"

@implementation FlipCardView

@synthesize point_index;
- (id)initWithFrame:(CGRect)frame Question:(NSString*)question Answer:(NSString*) answer;
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGRect textRect = self.bounds;
        textRect.origin.x = 20;
        textRect.origin.y = 20;
        textRect.size.width = textRect.size.width - 40;
        textRect.size.height = textRect.size.height- 40;
        frontCard = [[UILabel alloc] initWithFrame:textRect];
        backCard = [[UILabel alloc] initWithFrame:textRect];
        
        // for testing 
        [frontCard setText:question];
        frontCard.numberOfLines = 0;
        if (self.bounds.size.width > 320) 
            frontCard.font = [UIFont systemFontOfSize:20.0f];
        else
            frontCard.font = [UIFont systemFontOfSize:14.0f];
        frontCard.textAlignment = UITextAlignmentCenter;
        //frontCard.backgroundColor = [UIColor colorWithRed:0.5 green:0.2 blue:0.2 alpha:1];
        //frontCard.backgroundColor = [UIColor clearColor];
        frontCard.backgroundColor = [UIColor whiteColor];
        
        
        [backCard  setText:answer];
        backCard.numberOfLines = 0;
        if (self.bounds.size.width > 320) 
            backCard.font = [UIFont systemFontOfSize:20.0f];
        else
            backCard.font = [UIFont systemFontOfSize:14.0f];
        backCard.textAlignment = UITextAlignmentCenter;
        frontCard.backgroundColor = [UIColor whiteColor];
        //backCard.backgroundColor = [UIColor clearColor];
        //backCard.backgroundColor = [UIColor colorWithRed:0.2 green:0.5 blue:0.2 alpha:1];
        backCard.hidden = TRUE;
        [backCard setTextColor:[UIColor colorWithRed:0.1f green:0.1f blue:0.6f alpha:1.0f]];
        
        [self addSubview:backCard];
        [self addSubview:frontCard];
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [self addGestureRecognizer:gesture];
        
        isFlipped = FALSE;
    }
    return self;
}

- (void) handleTap:(UITapGestureRecognizer*) sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"addpoint" object:[NSNumber numberWithInt:self.point_index]];
        
        // trans flip
         backCard.hidden = FALSE;
        if ( isFlipped == FALSE)
            [UIView transitionFromView:frontCard toView:backCard duration:0.8 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL completion){ 
                isFlipped = TRUE;
               
            }];
        else {
            [UIView transitionFromView:backCard toView:frontCard duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL completion){ 
                isFlipped = FALSE;
            }];            
        }
        
    }
}

-(void) dealloc
{
    [super dealloc];
    [frontCard release];
    [backCard release];
}
@end
