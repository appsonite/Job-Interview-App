//
//  MoreScreenController.m
//  aPilotsQuest free
//
//  Created by Viktor on 20.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MoreScreenController.h"
#import "MoreScreenCell.h"
#import "MSProduct.h"


MoreScreenController * _moreController; 

@interface MoreScreenController (){
	NSArray * data;
	DownloadPool * pool;
	
}

- (void) startLoadImages;

@end

@implementation MoreScreenController

@synthesize tableView;

+(MoreScreenController *)moreScreen
{
	if (!_moreController) {
		_moreController = [[MoreScreenController alloc] init];
	}
	return _moreController;
}

- (IBAction)backToMen:(id)sender {
	
	CGRect viewFrame = self.view.frame;
	viewFrame.origin.y = -viewFrame.size.height;
	
	[UIView animateWithDuration:0.25 animations:^(void){
		self.view.frame = viewFrame;
	}];
	
}

-(void)startLoadImages
{
	for (MSProduct * product in data) {
		[pool addNewDownloadFromURL:product.imageUrl withDelegate:self];
	}
}


-(void)didFinishDownload:(Downloader *)downloaderInst
{
	for (MSProduct * product in data) {
		if ([product.imageUrl isEqualToString:downloaderInst.downloadURL]) {
			product.image = [UIImage imageWithData:downloaderInst.downloadedData];
			product.isLoaded = YES;
			[self.tableView reloadData];
		}
	}
}

-(void)dataDidRecived:(NSArray *)_data
{
	data = _data;
	[self startLoadImages];
	[tableView reloadData];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	MSProduct * product = [data objectAtIndex:indexPath.row];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString: product.link]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CustomCell";
    
    MoreScreenCell * cell = (MoreScreenCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	NSArray *nib;
    if (!cell) {
		if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
			nib = [[NSBundle mainBundle] loadNibNamed:@"MoreScreenCell_iPad" owner:self options:nil];
		else 
			nib = [[NSBundle mainBundle] loadNibNamed:@"MoreScreenCell" owner:self options:nil];
		
        cell = [nib objectAtIndex:0];
    }
    MSProduct * product = [data objectAtIndex:indexPath.row];
	if (product.isLoaded) {
		[cell stopActivity];
	}
	else {
		[cell startActivity];
	}
	[cell setImageURL:product.image titleText:product.titleString description:product.descriptionString];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 125;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return data.count;
}

- (id)init
{
	
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
		{
		self = [super initWithNibName:@"MoreScreenController_iPad" bundle:[NSBundle mainBundle]];
		}
	else
		{
		self = [super initWithNibName:@"MoreScreenController" bundle:[NSBundle mainBundle]];
		}
	
    if (self) {
		
		CGRect viewFrame = self.view.frame;
		viewFrame.origin.y = -viewFrame.size.height;
		self.view.frame = viewFrame;
		pool = [[DownloadPool alloc] init];
		
		[MSDataProvider provider].delegate = self;
		//[[CCDirector sharedDirector].openGLView addSubview:self.view];
		[[[UIApplication sharedApplication].windows objectAtIndex:0] addSubview:self.view];
		//[[[UIApplication sharedApplication].windows objectAtIndex:0] addSubview:self.view];
		
    }
    return self;
}

- (void) showMenu
{
	CGRect viewFrame = self.view.frame;
	viewFrame.origin.y = 0;
	
	
	[UIView animateWithDuration:0.5 animations:^(void){
		self.view.frame = viewFrame;
	}];
}


-(void)dealloc
{
	[pool release];
	pool = nil;
	[super dealloc];
}

-(void)setData:(NSArray *)dataContent
{
	data = dataContent;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (UIInterfaceOrientationIsLandscape(interfaceOrientation));
}

@end