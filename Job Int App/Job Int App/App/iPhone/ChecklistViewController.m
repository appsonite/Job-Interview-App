//
//  ChecklistViewController.m
//  Job Int App
//
//  Created by Robin Grønvold on 7/18/12.
//  Copyright (c) 2012 Protrade. All rights reserved.
//

#import "ChecklistViewController.h"

@interface ChecklistViewController ()


@end

@implementation ChecklistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Checklists";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma  actions
-(void) actionAboutCompany:(id)sender
{
    [MKStoreManager sharedManager].pDelegate = self;
    if ([MKStoreManager featureCheckListPurchsed] == FALSE)
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:TRUE];
        [[MKStoreManager sharedManager] buyFeatureChecklist];
        return;
    }

    NSString *nibName = @"CheckListAnswer";
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone" , nibName];
    }else{
        nibName = [NSString stringWithFormat:@"%@_iPad" , nibName];        
    }
    
    CheckListAnswer *answerViewController = [[[CheckListAnswer alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]] autorelease];
    answerViewController.strTbleSetter = @"About the company";
    [self.navigationController pushViewController:answerViewController animated:TRUE];
}

-(void) actionAboutJob:(id)sender
{
    [MKStoreManager sharedManager].pDelegate = self;
    if ([MKStoreManager featureCheckListPurchsed] == FALSE)
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:TRUE];
        [[MKStoreManager sharedManager] buyFeatureChecklist];
        return;
    }

    NSString *nibName = @"CheckListAnswer";
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone" , nibName];
    }else{
        nibName = [NSString stringWithFormat:@"%@_iPad" , nibName];        
    }
    CheckListAnswer *answerViewController = [[[CheckListAnswer alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]]autorelease];
    answerViewController.strTbleSetter = @"About the Job";
    [self.navigationController pushViewController:answerViewController animated:TRUE];
}
-(void) actionKnowMyself:(id)sender
{
    [MKStoreManager sharedManager].pDelegate = self;
    if ([MKStoreManager featureCheckListPurchsed] == FALSE)
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:TRUE];
        [[MKStoreManager sharedManager] buyFeatureChecklist];
        return;
    }

    NSString *nibName = @"CheckListAnswer";
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone" , nibName];
    }else{
        nibName = [NSString stringWithFormat:@"%@_iPad" , nibName];        
    }
    CheckListAnswer *answerViewController = [[[CheckListAnswer alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]]autorelease];
    answerViewController.strTbleSetter = @"Know yourself";
    [self.navigationController pushViewController:answerViewController animated:TRUE];
}
-(void) actionPPractise:(id)sender
{
    [MKStoreManager sharedManager].pDelegate = self;
    if ([MKStoreManager featureCheckListPurchsed] == FALSE)
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:TRUE];
        [[MKStoreManager sharedManager] buyFeatureChecklist];
        return;
    }
    NSString *nibName = @"CheckListAnswer";
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone" , nibName];
    }else{
        nibName = [NSString stringWithFormat:@"%@_iPad" , nibName];        
    }
    CheckListAnswer *answerViewController = [[[CheckListAnswer alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]]autorelease];
    answerViewController.strTbleSetter = @"Practice";
    [self.navigationController pushViewController:answerViewController animated:TRUE];
}

-(void) actionInterview:(id)sender
{
    [MKStoreManager sharedManager].pDelegate = self;
    if ([MKStoreManager featureCheckListPurchsed] == FALSE)
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:TRUE];
        [[MKStoreManager sharedManager] buyFeatureChecklist];
        return;
    }

    NSString *nibName = @"CheckListAnswer";
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone" , nibName];
    }else{
        nibName = [NSString stringWithFormat:@"%@_iPad" , nibName];        
    }
    CheckListAnswer *answerViewController = [[[CheckListAnswer alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]]autorelease];
    answerViewController.strTbleSetter = @"Interview";
    [self.navigationController pushViewController:answerViewController animated:TRUE];
}
-(void) actionAtInterview:(id)sender
{
    [MKStoreManager sharedManager].pDelegate = self;
    if ([MKStoreManager featureCheckListPurchsed] == FALSE)
    {
        [MBProgressHUD showHUDAddedTo:self.view animated:TRUE];
        [[MKStoreManager sharedManager] buyFeatureChecklist];
        return;
    }

    NSString *nibName = @"CheckListAnswer";
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone" , nibName];
    }else{
        nibName = [NSString stringWithFormat:@"%@_iPad" , nibName];        
    }
    CheckListAnswer *answerViewController = [[[CheckListAnswer alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]]autorelease];
    answerViewController.strTbleSetter = @"At Interview";
    [self.navigationController pushViewController:answerViewController animated:TRUE];
}
#pragma mark - MKStoreDelegate
-(void) purchaseSuccessfullyDoned
{
    [MBProgressHUD hideHUDForView:self.view animated:TRUE];
    //[self.navigationController pushViewController:checklistController animated:TRUE];
}
-(void) storeManagerAlertShowed
{
    [MBProgressHUD hideHUDForView:self.view animated:TRUE];
}


@end
