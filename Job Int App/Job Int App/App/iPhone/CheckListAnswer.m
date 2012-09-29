//
//  CheckListAnswer.m
//  Job Int App
//
//  Created by Liu Zixing on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CheckListAnswer.h"

@interface CheckListAnswer ()

@end

@implementation CheckListAnswer
@synthesize strTbleSetter;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        NSArray *arrCompany = [NSArray arrayWithObjects:@"Have you checked the company's website?",
                               @"Have you googled the company?", 
                               @"Do you know the company mission and philosopy?",
                               @"Do you know which players are in market?",
                               @"Do you know the company's history?", 
                               @"Do you know who is the onwer of the company?", 
                               @"Do you know who is the management team?",
                               @"Do you know their main products?",
                               @"Do you know any recent newstories about the company?", 
                               @"Do you know the financials of the company?",
                               nil];
        //10
        NSArray *arrJob = [NSArray arrayWithObjects:@"Have you read the job description in detail?",
                           @"Do you know which skills is required for job?",
                           @"Do you know which experience is needed",
                           @"Do you know which qualities they are looking for?",
                           @"Do you know the salary range?", nil];
        //15
        NSArray *arrKnowYourself = [NSArray arrayWithObjects:@"Can you explain your strengts?",
                                    @"Can you explain your weaknesses?",
                                    @"Can you explain your career goals",
                                    @"Can you explain why you want to change jobs?", nil];
        //19
        NSArray *arrPractice = [NSArray arrayWithObjects:@"Have you reviewed the preparation videos?",
                                @"Have you answered all the questions in Job Interview Videos",
                                @"Have you trained with the flip cards",
                                @"Have you practiced you five minute personal story?",
                                @"Have you practiced explaining your resume?", nil];
        //24
        NSArray *arrInterview = [NSArray arrayWithObjects:@"Do you have the time and plance of interview",
                                 @"Do you have the name of the person you will meet?",
                                 @"Do you have directions to the offices?",
                                 @"Do you now where to park?",
                                 @"Have you estimated the time it takes to get there?",
                                 @"Do you have extra resumes?",
                                 @"Do you have your business cards?",
                                 @"Do you have pen and paper for taking notes?",
                                 @"Do you have appropriate clothes for interview?",
                                 @"Do you have list of references?",
                                 @"Do you have at least five relevant questions to the interviwer?", nil];
        //35
        NSArray *arrAtInterview = [NSArray arrayWithObjects:@"Arrive 10 minute early",
                                   @"Smile when you meet the interviewer",
                                   @"Give firm handshake.",
                                   @"Look into interviewers eyes",
                                   @"Sit up straight",
                                   @"Be enthusiastic",
                                   @"Turn off your mobile phone",
                                   @"Don't talk bad about current or previous employers",
                                   @"Don't talk about money unless interviewer brings it up.", nil];
        //44
        data = [[NSDictionary dictionaryWithObjectsAndKeys:arrCompany,@"About the company" , arrJob,@"About the Job",  arrKnowYourself,@"Know yourself",  arrPractice,@"Practice", arrInterview,@"Interview", arrAtInterview, @"At Interview", nil] retain];
        
    }
    return self;
}
-(void) dealloc
{
    NSMutableArray *arrSaveValue = [[[NSMutableArray alloc] init] autorelease];
    
    NSArray *arrTableData = [data objectForKey:self.strTbleSetter];
    UITableView *tblView = (UITableView*) self.view;
    for ( int i =0; i < [arrTableData count]; i++)
    {
        UITableViewCell *cell = [tblView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
        {
            [arrSaveValue addObject:@"yes"];

            if ( [self.strTbleSetter isEqualToString:@"About the company"] )
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"addpoint" object:[NSNumber numberWithInt: POINT_ADD_CK_1+i]];
            } else if ( [self.strTbleSetter isEqualToString:@"About the Job"] )
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"addpoint" object:[NSNumber numberWithInt: POINT_ADD_CK_1+10+i]];

            } else if ( [self.strTbleSetter isEqualToString:@"Know yourself"] )
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"addpoint" object:[NSNumber numberWithInt: POINT_ADD_CK_1+15+i]];

            } else if ( [self.strTbleSetter isEqualToString:@"Practice"] )
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"addpoint" object:[NSNumber numberWithInt: POINT_ADD_CK_1+19+i]];
            } else if ( [self.strTbleSetter isEqualToString:@"Interview"] )
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"addpoint" object:[NSNumber numberWithInt: POINT_ADD_CK_1+24+i]];
            } else if ( [self.strTbleSetter isEqualToString:@"At Interview"] )
            {
                [[NSNotificationCenter defaultCenter] postNotificationName:@"addpoint" object:[NSNumber numberWithInt: POINT_ADD_CK_1+35+i]];
            }
        }
        else {
            [arrSaveValue addObject:@"no"];
        }
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:arrSaveValue forKey:self.strTbleSetter];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [data release];
    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Checklists";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    //   save all  setting data;
    // first get nsuserdefault
    //NSDictionary *dic = [[NSUserDefaults standardUserDefaults] objectForKey:[self.strTbleSetter]];
   
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arrData = [data objectForKey:self.strTbleSetter];
    return [arrData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellRRR";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // check meata data 
    NSArray *arrCheckData =  (NSArray*) [[NSUserDefaults standardUserDefaults] objectForKey:self.strTbleSetter];
    
    NSString *isMarked =  [arrCheckData objectAtIndex:indexPath.row];
    if ([isMarked isEqualToString:@"yes"])
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
     NSArray *arrData = [data objectForKey:strTbleSetter];
    cell.textLabel.text = [arrData objectAtIndex:indexPath.row];
    [cell.textLabel setNumberOfLines:0];
    if ( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone  ) 
        [cell.textLabel setFont: [UIFont systemFontOfSize:12]];
    else {
        [cell.textLabel setFont: [UIFont systemFontOfSize:18]];
    }
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark)
        cell.accessoryType = UITableViewCellAccessoryNone;
    else
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
}

@end
