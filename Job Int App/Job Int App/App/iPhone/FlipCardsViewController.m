//
//  FlipCardsViewController.m
//  Job Int App
//
//  Created by Robin Grønvold on 7/20/12.
//  Copyright (c) 2012 Protrade. All rights reserved.
//

#import "FlipCardsViewController.h"

@interface FlipCardsViewController ()

@end

@implementation FlipCardsViewController

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
    
    self.title = @"Flipcards";
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

#pragma actions

-(IBAction) actionGenearl
{
    NSString *nibName = @"FlipCardsAnswerController";
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone" , nibName];
    }else{
        nibName = [NSString stringWithFormat:@"%@_iPad" , nibName];        
    }
    FlipCardsAnswerController *controller = [[[FlipCardsAnswerController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]]autorelease];
    controller.refData = @"general";
    [self.navigationController pushViewController:controller animated:TRUE];

}

-(IBAction) actionFinance
{
    NSString *nibName = @"FlipCardsAnswerController";
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone" , nibName];
    }else{
        nibName = [NSString stringWithFormat:@"%@_iPad" , nibName];        
    }
    FlipCardsAnswerController *controller = [[[FlipCardsAnswerController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]]autorelease];
    controller.refData = @"finance";
    [self.navigationController pushViewController:controller animated:TRUE];
}

-(IBAction) actionAccounting
{
    NSString *nibName = @"FlipCardsAnswerController";
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone" , nibName];
    }else{
        nibName = [NSString stringWithFormat:@"%@_iPad" , nibName];        
    }
    FlipCardsAnswerController *controller = [[[FlipCardsAnswerController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]]autorelease];
    controller.refData = @"accounting";
    [self.navigationController pushViewController:controller animated:TRUE];
}

-(IBAction) actionSales
{
    NSString *nibName = @"FlipCardsAnswerController";
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone" , nibName];
    }else{
        nibName = [NSString stringWithFormat:@"%@_iPad" , nibName];        
    }
    FlipCardsAnswerController *controller = [[[FlipCardsAnswerController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]]autorelease];
    controller.refData = @"sales";
    [self.navigationController pushViewController:controller animated:TRUE];
}

-(IBAction) actionEngineering
{
    NSString *nibName = @"FlipCardsAnswerController";
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone" , nibName];
    }else{
        nibName = [NSString stringWithFormat:@"%@_iPad" , nibName];        
    }
    FlipCardsAnswerController *controller = [[[FlipCardsAnswerController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]]autorelease];
    controller.refData = @"engineering";
    [self.navigationController pushViewController:controller animated:TRUE];
    
}

-(IBAction) actionDifficult
{
    NSString *nibName = @"FlipCardsAnswerController";
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        nibName = [NSString stringWithFormat:@"%@_iPhone" , nibName];
    }else{
        nibName = [NSString stringWithFormat:@"%@_iPad" , nibName];        
    }
    FlipCardsAnswerController *controller = [[[FlipCardsAnswerController alloc] initWithNibName:nibName bundle:[NSBundle mainBundle]]autorelease];
    controller.refData = @"difficult";
    [self.navigationController pushViewController:controller animated:TRUE];
}

@end
