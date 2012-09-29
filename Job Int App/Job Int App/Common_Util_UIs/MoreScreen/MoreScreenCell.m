//
//  MoreScreenCell.m
//  aPilotsQuest free
//
//  Created by Viktor on 20.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MoreScreenCell.h"

@interface MoreScreenCell()
{

}


-(void) loadImageFromUrl:(NSURL*) url;

@end

@implementation MoreScreenCell

@synthesize image,title,descriptionText,activity;

-(void)stopActivity
{
	[self.activity stopAnimating];
}
-(void)startActivity
{
	[self.activity startAnimating];
}

-(void) setImageURL: (UIImage*) _image titleText:(NSString*) _title description:(NSString*) _description
{
	self.descriptionText.text = _description;
	self.title.text = _title;
	self.image.image = _image;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
