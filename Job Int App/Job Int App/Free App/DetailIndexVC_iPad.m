//
//  DetailIndexVC_iPad.m
//  aVirtualInterView
//
//  Created by Nusrrat Rathore on 9/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailIndexVC_iPad.h"
#import "IndexVC_iPad.h"
#import "IndexViewController_ipad.h"


@implementation DetailIndexVC_iPad
@synthesize introVideos;
//@synthesize detailViewController;
@synthesize eduVideos,expVideos,profVideos,personVideos,careerVideos,ambiVideos;
@synthesize indexView;
@synthesize selectedIndex;
@synthesize theJob;
@synthesize selectedCategory;

#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	
	
	
	
	
	eduVideos=[[NSMutableArray alloc]init ];
	[eduVideos addObject:@"Tell me about your education"];
	[eduVideos addObject:@"Tell me about your grades"];
	[eduVideos addObject:@"Extracurricular activities"];
	
	
	
	expVideos=[[NSMutableArray alloc]init ];
	[expVideos addObject:@"Your previous experience"];
	[expVideos addObject:@"Tasks and responsibilities"];
	[expVideos addObject:@"Which tasks did you dislike"];
	
	
	profVideos=[[NSMutableArray alloc]init ];
	[profVideos addObject:@"Best quality?"];
	[profVideos addObject:@"Weaknesses?"];
	[profVideos addObject:@"Improvement of weaknesses?"];
	[profVideos addObject:@"Large workloads?"];
	[profVideos addObject:@"Pressure and deadlines?"];
	[profVideos addObject:@"Stress?"];
	[profVideos addObject:@"Reaction under stress?"];
	[profVideos addObject:@"Why hire you?"];
	
	
	
	
	personVideos=[[NSMutableArray alloc]init ];
	[personVideos addObject:@"About you?"];
	[personVideos addObject:@"Describe yourself?"];
	[personVideos addObject:@"Friends perception of you?"];
	[personVideos addObject:@"Coworkers perception of you?"];
	[personVideos addObject:@"Three strengths?"];
	[personVideos addObject:@"Three weaknesses?"];
	[personVideos addObject:@"Motivation?"];
	[personVideos addObject:@"Demotivation?"];
	
	[personVideos addObject:@"Leader?"];
	[personVideos addObject:@"Leadership?"];
	[personVideos addObject:@"Salary motivator?"];
	[personVideos addObject:@"Best attribute?"];
	
	
	
	careerVideos=[[NSMutableArray alloc]init ];
	[careerVideos addObject:@"Satisfaction with career?"];
	[careerVideos addObject:@"Successful accomplishment?"];
	[careerVideos addObject:@"Failures?"];
	[careerVideos addObject:@"Career challenges?"];
	[careerVideos addObject:@"Career goals?"];
	[careerVideos addObject:@"Team work?"];
	[careerVideos addObject:@"Role in team work?"];
	[careerVideos addObject:@"Best manager?"];
	
	[careerVideos addObject:@"Difficult decisions?"];
	[careerVideos addObject:@"Creativity?"];
	[careerVideos addObject:@"Presentations?"];
	
	[careerVideos addObject:@"Important attributes in job?"];
	[careerVideos addObject:@"Why leave current job?"];
	
	
	ambiVideos=[[NSMutableArray alloc]init ];
	[ambiVideos addObject:@"Why work here?"];
	[ambiVideos addObject:@"Salary?"];
	
	
	theJob=[[NSMutableArray alloc]init ];
	
	[theJob addObject:@"Attractiveness of position?"];
	[theJob addObject:@"Knowledge of company?"];
	[theJob addObject:@"Why you fit for position?"];
	[theJob addObject:@"Expectations of this job?"];
	[theJob addObject:@"Your contribution to enviroment?"];
	[theJob addObject:@"Your expectation of supervisor?"];
	
	
	
	
	
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */
/*
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 }
 */
/*
 - (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
 }
 */
/*
 - (void)viewDidDisappear:(BOOL)animated {
 [super viewDidDisappear:animated];
 }
 */
/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

-(void)loadRequestWithIndex:(NSInteger)Index{
	
	selectedCategory=Index;
	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
   
	if (selectedCategory==0) {
		return [eduVideos count];
	}
	if (selectedCategory==1) {
		return [expVideos count];
	}
	if (selectedCategory==2) {
		return [profVideos count];
	}
	if (selectedCategory==3) {
		return [personVideos count];
	}
	if (selectedCategory==4) {
		return [careerVideos count];
	}
	
	if (selectedCategory==5) {
		return [ambiVideos count];
	}
	
	if(selectedCategory==6) {
		return [theJob count];
	}
	
	else {
		return 0;
	}
	
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
	//cell.textLabel.text=[introVideos objectAtIndex:indexPath.row];
    
	
	if (selectedCategory==0) {
		cell.textLabel.text=[eduVideos objectAtIndex:indexPath.row];
	}
	if (selectedCategory==1) {
		cell.textLabel.text=[expVideos objectAtIndex:indexPath.row];
	}
	if (selectedCategory==2) {
		cell.textLabel.text=[profVideos objectAtIndex:indexPath.row];
	}
	if (selectedCategory==3) {
		cell.textLabel.text=[personVideos objectAtIndex:indexPath.row];
	}
	if (selectedCategory==4) {
		cell.textLabel.text=[careerVideos objectAtIndex:indexPath.row];
	}
	
	if (selectedCategory==5) {
		cell.textLabel.text=[ambiVideos objectAtIndex:indexPath.row];
	}
	
	if (selectedCategory==6) {
		cell.textLabel.text=[theJob objectAtIndex:indexPath.row];
	}
	[self.tableView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"ipadbg.png"]]];
    return cell;
}
/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	
	return 80;
}
/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
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
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	IndexVC_iPad *	detailView=[[IndexVC_iPad alloc]initWithNibName:@"IndexVC_iPad" bundle:nil ];
	[self.navigationController pushViewController:detailView animated:YES];
	
	NSString* videoTitle=@"";
	
	NSLog(@"%d",selectedCategory);
	
	if (selectedCategory==0) {
		videoTitle=[eduVideos objectAtIndex:indexPath.row];
	}
	if (selectedCategory==1) {
		videoTitle=[expVideos objectAtIndex:indexPath.row];
	}
	if (selectedCategory==2) {
		videoTitle=[profVideos objectAtIndex:indexPath.row];
	}
	if (selectedCategory==3) {
		videoTitle=[personVideos objectAtIndex:indexPath.row];
	}
	if (selectedCategory==4) {
		videoTitle=[careerVideos objectAtIndex:indexPath.row];
	}
	
	if (selectedCategory==5) {
		videoTitle=[ambiVideos objectAtIndex:indexPath.row];
	}
	
	if (selectedCategory==6) {
		videoTitle=[theJob objectAtIndex:indexPath.row];
	}

	[detailView loadRequestWithIndex:indexPath.row :selectedCategory :videoTitle];
	//[detailView release];	 
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}




@end

