//
//  FlipCardsAnswerController.m
//  Job Int App
//
//  Created by Liu Zixing on 8/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlipCardsAnswerController.h"
#import "PointSystemManager.h"

@interface FlipCardsAnswerController ()

@end

@implementation FlipCardsAnswerController

@synthesize refData;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        numsOfFreeCards = 10;
    }
    return self;
}
-(void) dealloc
{
    [super dealloc];
    self.refData = nil;
    [arrAnswer release];
    [arrQuestion release];
}
-(void) getAnswer
{
    NSString *filename = [NSString stringWithFormat:@"answer_%@.txt", self.refData];
    NSString *path =  [[NSBundle mainBundle] pathForResource:filename ofType:@""];
    //NSLog(@"%@" , path);
    NSString *fileContents  = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //NSLog(@"contents is %@" , fileContents);
    NSArray *arr = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    arrAnswer = [[NSMutableArray alloc] init];
    
    for (int i =0; i<[ arr count]; i++)
    {
        NSString *strF = (NSString*)[arr objectAtIndex:i];
        if ([strF isEqualToString:@""] == FALSE ) 
        {
            [arrAnswer addObject:strF];
            //NSLog(@"added:%@" , strF);
        }
    }

}
-(void) getQuestion
{
    NSString *filename = [NSString stringWithFormat:@"question_%@.txt", self.refData];
    NSString *path =  [[NSBundle mainBundle] pathForResource:filename ofType:@""];
    //NSLog(@"%@" , path);
    NSString *fileContents  = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    //NSLog(@"contents is %@" , fileContents);
    NSArray *arr = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    arrQuestion = [[NSMutableArray alloc] init];
    
    for (int i =0; i<[ arr count]; i++)
    {
        NSString *strF = (NSString*)[arr objectAtIndex:i];
        if ([strF isEqualToString:@""] == FALSE ) 
        {
            [arrQuestion addObject:strF];
           //NSLog(@"added:%@" , strF);
        }
    }
    numsOfQuestion = [arrQuestion count];
}

-(BOOL) isAlreadyPurchased
{
    
    if ( [self.refData isEqualToString:@"difficult"] )
    {
        return [MKStoreManager featureFlipcardDifficultPurchased];
    }else if ( [self.refData isEqualToString:@"general"] )
    {
        return [MKStoreManager featureFlipcardGeneralPurchased];
    }else if ( [self.refData isEqualToString:@"finance"] )
    {
        return [MKStoreManager featureFlipcardFinancePurchased];
    }else if ( [self.refData isEqualToString:@"accounting"] )
    {
        return [MKStoreManager featureFlipcardAccountingPurchased];
    }else if ( [self.refData isEqualToString:@"sales"] )
    {
        return [MKStoreManager featureFlipcardSalesPurchased];
    }else if ( [self.refData isEqualToString:@"engineering"] )
    {
        return [MKStoreManager featureFlipcardEngineeringPurchased];
    }
    return FALSE;
}

-(void) buyItems
{
    
    [MBProgressHUD showHUDAddedTo:self.view animated:TRUE];
    [MKStoreManager sharedManager].pDelegate = self;
    if ( [self.refData isEqualToString:@"difficult"] )
    {
        [[MKStoreManager sharedManager] buyFeatureFlipcardDifficult];
    }else if ( [self.refData isEqualToString:@"general"] )
    {
        [[MKStoreManager sharedManager] buyFeatureFlipcardGeneral];
    }else if ( [self.refData isEqualToString:@"finance"] )
    {
        [[MKStoreManager sharedManager] buyFeatureFlipcardFinance];
    }else if ( [self.refData isEqualToString:@"accounting"] )
    {
        [[MKStoreManager sharedManager] buyFeatureFlipcardAccounting];
    }else if ( [self.refData isEqualToString:@"sales"] )
    {
        [[MKStoreManager sharedManager] buyFeatureFlipcardSales];
    }else if ( [self.refData isEqualToString:@"engineering"] )
    {
        [[MKStoreManager sharedManager] buyFeatureFlipcardEngineering];
    }
}
-(int) getPointIndex
{
    if ( [self.refData isEqualToString:@"difficult"] )
    {
        return  POINT_ADD_FP_DIFFICULT_1;
    }else if ( [self.refData isEqualToString:@"general"] )
    {
        return  POINT_ADD_FP_GENERAL_1;
    }else if ( [self.refData isEqualToString:@"finance"] )
    {
        return  POINT_ADD_FP_FINANCE_1;
    }else if ( [self.refData isEqualToString:@"accounting"] )
    {
        return  POINT_ADD_FP_ACCOUNTING_1;
    }else if ( [self.refData isEqualToString:@"sales"] )
    {
        return  POINT_ADD_FP_SALES_1;
    }else if ( [self.refData isEqualToString:@"engineering"] )
    {
        return  POINT_ADD_FP_ENGINEERING_1;
    }

    return 0;
}
-(void) showFlipcards
{
    // first get datas
    [self getAnswer];
    [self getQuestion];
    // add Flipcards
    int nFlipCardNum = numsOfQuestion;
    scrollSize = scrollFlipCard.bounds.size;
    float xOffSet = 40;
    float yOffSet = 50;
    
    if ( [arrAnswer count] != numsOfQuestion )
    {
        NSLog(@"Error Not Equal Nums!!");
        NSLog(@"%d", numsOfQuestion);
        NSLog(@"%d", [arrAnswer count]);
        [MBProgressHUD hideHUDForView:self.view animated:TRUE];
        return;
    }
    
    [lblPage setText:[NSString stringWithFormat:@"%d/%d", 1, numsOfQuestion]];
    for ( int i = 0; i< nFlipCardNum; i++)
    {
        
        CGRect FlipFrame = CGRectMake( xOffSet + scrollSize.width*i, yOffSet, scrollSize.width - xOffSet*2, scrollSize.height - yOffSet*2);
        FlipCardView *view = [[FlipCardView alloc] initWithFrame:FlipFrame Question:[arrQuestion objectAtIndex:i] Answer:[arrAnswer objectAtIndex:i]];
        view.point_index = [self getPointIndex] + i;
        [scrollFlipCard addSubview:view];
    }
    int nTemp = nFlipCardNum;
    if ( [self isAlreadyPurchased] == FALSE)
        nTemp = numsOfFreeCards;
    [scrollFlipCard setContentSize:CGSizeMake(scrollSize.width*nTemp, scrollSize.height-20)];
    
    [MBProgressHUD hideHUDForView:self.view animated:TRUE];

}

- (void)viewDidLoad
{

    [super viewDidLoad];
    [MBProgressHUD showHUDAddedTo:self.view animated:TRUE];
    [self performSelector:@selector(showFlipcards) withObject:nil afterDelay:0.05];
    self.title = @"Flipcards";
}
-(void) viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



-(void) actionNext
{
    CGFloat pageWidth = scrollFlipCard.frame.size.width;
    int currentPage = floor( (scrollFlipCard.contentOffset.x - pageWidth/2) /pageWidth) +  1;
    CGPoint pt = scrollFlipCard.contentOffset;
    pt.x = scrollSize.width * (currentPage +1);
    [scrollFlipCard scrollRectToVisible:CGRectMake( pt.x, pt.y, scrollSize.width, scrollSize.height) animated:TRUE];
}
-(void) actionFirst
{
    CGPoint pt = scrollFlipCard.contentOffset;
    pt.x = 0;
    [scrollFlipCard scrollRectToVisible:CGRectMake( pt.x, pt.y, scrollSize.width, scrollSize.height) animated:TRUE];
}

-(void) actionPrev
{
    CGFloat pageWidth = scrollFlipCard.frame.size.width;
    int currentPage = floor( (scrollFlipCard.contentOffset.x - pageWidth/2) /pageWidth) + 1;
    CGPoint pt = scrollFlipCard.contentOffset;
    pt.x = scrollSize.width * (currentPage -1);
    [scrollFlipCard scrollRectToVisible:CGRectMake( pt.x, pt.y, scrollSize.width, scrollSize.height) animated:TRUE];
}

-(void) actionLast
{
    CGPoint pt = scrollFlipCard.contentOffset;
    pt.x = scrollFlipCard.contentSize.width - scrollSize.width;
    [scrollFlipCard scrollRectToVisible:CGRectMake( pt.x, pt.y, scrollSize.width, scrollSize.height) animated:TRUE];    
}

-(void) resetLable
{
    CGFloat pageWidth = scrollFlipCard.frame.size.width;
    int currentPage = floor( (scrollFlipCard.contentOffset.x - pageWidth/2) /pageWidth) +  2;
    NSString *strTemp = lblPage.text;
    lblPage.text = [NSString stringWithFormat:@"%d/%d", currentPage, numsOfQuestion];   
    
    if ( (![strTemp isEqualToString:lblPage.text]) && currentPage == numsOfFreeCards && [self isAlreadyPurchased] == FALSE)
    {
        //if ([MBProgressHUD
        [self buyItems];
        // 
        //[self purchaseSuccessfullyDoned];
    }
}
-(void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self resetLable];
    
}
-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    [self resetLable];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self resetLable];
}

#pragma mark - in app delegate

-(void) purchaseSuccessfullyDoned
{
    [MBProgressHUD hideHUDForView:self.view animated:TRUE];
    // update content size
    [scrollFlipCard setContentSize:CGSizeMake(scrollSize.width* numsOfQuestion, scrollSize.height-20)];
}
-(void) storeManagerAlertShowed
{
    [MBProgressHUD hideHUDForView:self.view animated:TRUE];
}
@end
