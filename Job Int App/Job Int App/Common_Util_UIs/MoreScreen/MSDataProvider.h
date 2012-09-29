//
//  MSDataProvider.h
//  aPilotsQuest free
//
//  Created by Viktor on 25.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadPool.h"

@protocol MSDataProviderDelegate <NSObject>

-(void) dataDidRecived: (NSArray*) data;

@end

@interface MSDataProvider : NSObject <DownloadDelegate>

@property (nonatomic,retain) NSObject<MSDataProviderDelegate> * delegate;


+(MSDataProvider*) provider;

@end
