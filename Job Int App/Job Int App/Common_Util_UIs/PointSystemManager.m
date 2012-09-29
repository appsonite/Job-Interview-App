//
//  PointSystemManager.m
//  Job Int App
//
//  Created by Liu Zixing on 8/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PointSystemManager.h"

static PointSystemManager* _shared_instance = nil;
@implementation PointSystemManager
@synthesize lblPoint;
@synthesize lblDescription;
@synthesize imageView;

+(id) sharedManager
{
    if (_shared_instance == nil)
        _shared_instance = [[PointSystemManager alloc] init];
    return _shared_instance;
}
+(void) releaseManager
{
    if (_shared_instance != nil)
    {
        [_shared_instance release];
    }
}
-(id) init
{
    if (self = [super init] )
    {
        dicPointRefData = [[NSMutableDictionary alloc] initWithCapacity:1];
        arrDescription = [[NSArray arrayWithObjects:@"Novice",@"Medium Novice",@"Advanced beginner",@"Competent",
                          @"Medium Competent",@"Advanced Competent",@"Proficient",@"Medium Proficient",@"Advanced Proficient",@"Professional",@"Medium Professional",
                          @"Advanced Professional",@"Expert",@"Medium Expert",@"Advanced Expert",@"Guru",@"Medium Guru" ,@"Advanced Guru", @"Champion",nil] retain];
    }
    return self;
}

-(void) dealloc 
{
    [dicPointRefData release];
    [super dealloc];
}
-(void) initData
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addPoint:) name:@"addpoint" object:nil];
    point = 0;
    // get arrays from nsuserdefault
    NSArray *arrAlreadyPointed = [[NSUserDefaults standardUserDefaults] objectForKey:@"PointSystem"];   
    // make
    for (NSNumber *a in arrAlreadyPointed)
    {
        [dicPointRefData setObject: @"TRUE" forKey: a];
        if (a.integerValue < 128)
        {
            // point to 5
            point += 5;
        }
        else {
            point++;
        }
    }
}
-(void) upgradeValue
{
    int point_level = point/50 + 1;
    self.lblPoint.text = [NSString stringWithFormat:@"%d Point", point];
    self.lblDescription.text = [arrDescription objectAtIndex: point_level -1];;
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",point_level]];
    imageView.image = image;
    
    // animation
    lblPoint.alpha =0;
    float posX = self.lblDescription.bounds.size.width * -1;
    CGRect frame = self.lblDescription.frame;
    self.lblDescription.frame = CGRectMake(posX, frame.origin.y, frame.size.width, frame.size.height);
    
    CGRect rc = self.imageView.bounds;
    CGPoint pt = self.imageView.center;
    float fScale = 0.75f;
    self.imageView.frame = CGRectMake( pt.x - rc.size.width *fScale, pt.y - rc.size.height *fScale, rc.size.width * fScale*2, rc.size.height * fScale*2);
    [UIView beginAnimations:@"tableAppear" context:UIGraphicsGetCurrentContext()];
    [UIView setAnimationDuration:0.3];
    lblPoint.alpha =1;
    self.lblDescription.frame = CGRectMake(2, 384, 81, 19);
    fScale = 0.5f;
    self.imageView.frame = CGRectMake( pt.x - rc.size.width *fScale, pt.y - rc.size.height *fScale, rc.size.width * fScale*2, rc.size.height * fScale*2);
    [UIView commitAnimations];
    //save
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d", point_level] forKey:@"point_level"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
-(void) updateUI
{
    int point_level = point/50 + 1;
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"point_level"] ;
    if ( str == nil)
        str = @"1";
    if ( [str integerValue] != point_level)
    {
        //new update set and perform animation
        [self performSelector:@selector(upgradeValue) withObject:nil afterDelay:0.8];
    }
    else {
        self.lblPoint.text = [NSString stringWithFormat:@"%d Point", point];
        self.lblDescription.text = [arrDescription objectAtIndex: point_level -1];;
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",point_level]];
        imageView.image = image;
    }
}
-(void) addPoint:(NSNotification*) noti
{
    NSNumber *number = (NSNumber*) [noti object];
    if ( [dicPointRefData objectForKey:number] == nil)
    {
        if (number.integerValue < 128)
            point +=5;
        else {
            point ++;
        }
        [dicPointRefData setObject:@"TRUE" forKey:number];        
    }
    
    // save it 
    NSArray *arr = dicPointRefData.allKeys;
    
    [[NSUserDefaults standardUserDefaults] setObject:arr forKey:@"PointSystem"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //[self updateUI];
    return;
}
@end
