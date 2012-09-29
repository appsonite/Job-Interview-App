//
//  MSProduct.h
//  aPilotsQuest free
//
//  Created by Viktor on 23.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSProduct : NSObject

@property(retain,nonatomic) NSString * imageUrl;
@property(retain,nonatomic) NSString * titleString;
@property(retain,nonatomic) NSString * descriptionString;
@property(retain,nonatomic) NSString * link;
@property(retain,nonatomic) UIImage  * image;
@property(assign,nonatomic) BOOL isLoaded;



@end
