//
//  MSDataProvider.m
//  aPilotsQuest free
//
//  Created by Viktor on 25.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MSDataProvider.h"
#import "MSProduct.h"
#import "SBJSON.h"


MSDataProvider * _sharedProvider;


@interface MSDataProvider()
{
	DownloadPool * pool;	
}

@end

@implementation MSDataProvider
@synthesize delegate;

-(NSString*) getTestJson
{
	//return @"{ "product": [	{"title": "testTitle","description": "testDescription","imageUrl": "http://wowjp.net/_ph/2/299418629.jpg","link": "http://www.google.com/"	},	{"title": "testTitle2",	"description": "testDescription2","imageUrl": "http://megaobzor.com/load/stati/warcraft123patch1.jpg","link": "http://www.bing.com/"},{	"title": "testTitle3",	"description": "testDescription3","imageUrl": "http://www.simoncotter.com/wp-content/uploads/2011/11/Understanding-a-better-web-hosting.jpg",	"link": "http://www.yandex.com/"	}]}";
	return @"";
}

+(MSDataProvider *)provider
{
	if (!_sharedProvider) {
		_sharedProvider = [[MSDataProvider alloc] init];
	}
	return _sharedProvider;
}

- (id)init
{
    self = [super init];
    if (self) {
        //[_sharedProvider performSelector:@selector(testData) withObject:nil afterDelay:1];
		pool= [[DownloadPool alloc] init];
		[pool addNewDownloadFromURL:@"http://appsonite.com/more_screen_avi.json" withDelegate:self];
    }
    return self;
}

-(void) didFinishDownload:(Downloader *) downloaderInst
{
	NSMutableArray * data = [[NSMutableArray alloc] init];
	NSString * string = [[NSString alloc] initWithData:downloaderInst.downloadedData encoding:NSUTF8StringEncoding];
	NSLog(@"More Screen Json \n%@",string);
	
	SBJSON *jsonParser =[[SBJSON alloc] init];
	NSError *error = nil;
	NSDictionary *jsonObject = [jsonParser objectWithString:string error:&error];
	if (!error) {
		NSArray * products = [jsonObject valueForKey:@"product"];
		for (NSDictionary * prod in products) {
			MSProduct * pr = [[MSProduct alloc] init];
			pr.titleString = [prod valueForKey:@"title"];
			pr.descriptionString = [prod valueForKey:@"description"];
			pr.imageUrl =  [prod valueForKey:@"imageUrl"];
			pr.link = [prod valueForKey:@"link"];
			pr.isLoaded = NO;
			[data addObject:pr];
		}
	}
	else {
		NSLog(@"%@",error.debugDescription);
	}
	[self.delegate dataDidRecived:data];
}
@end