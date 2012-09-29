//
//  UserRecordsManager.m
//  Job Int App
//
//  Created by Viktor on 06.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UserRecordsManager.h"



UserRecordsManager * _sharedManager;

@interface UserRecordsManager ()
{
	AVAudioRecorder * recorder;	
	BOOL isRecord;
	AVAudioPlayer * player;
}

@end

@implementation UserRecordsManager

@synthesize playLabel,recordButton;

-(void)recordSoundForKey:(NSString *)key
{
	NSLog(@"The key is:%@",key);
	if (isRecord) {
		[recorder stop];
		isRecord = NO;
        [self.recordButton setSelected:FALSE];
		//self.recoedLabel.text = @"Record Answer";
		return;
	}
	if (player.isPlaying) {
		[player stop];
		self.playLabel.text = @"Play Answer";
	}
	OSStatus result = AudioSessionInitialize(NULL, NULL, NULL, NULL);
    if (!result)
        NSLog(@"Error initializing audio session! %ld", result);
	
	[[AVAudioSession sharedInstance] setDelegate: self];
    NSError *setCategoryError = nil;
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error: &setCategoryError];
    if (setCategoryError)
        NSLog(@"Error setting category! %d", (int)setCategoryError);
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *dirPath =[paths objectAtIndex:0]; 

	NSURL * recordUrl = [NSURL fileURLWithPath:[dirPath stringByAppendingPathComponent: key]];
	recorder = [[AVAudioRecorder alloc] initWithURL:recordUrl settings:nil error:nil];
	[recorder setDelegate:self];
	[recorder prepareToRecord];
	[recorder record];
	isRecord = YES;
    [self.recordButton setSelected:TRUE];
	//self.recoedLabel.text = @"Stop Recoding";
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
	self.playLabel.text = @"Play Answer";
}

-(void)playSoundForKey:(NSString *)key
{
		NSLog(@"The key is:%@",key);
	if (isRecord) {
		[recorder stop];
		isRecord = NO;
        [self.recordButton setSelected:FALSE];
		//self.recoedLabel.text = @"Record Answer";
	}
	if (player.isPlaying) {
		[player stop];
		self.playLabel.text = @"Play Answer";
		return;
	}
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *dirPath =[paths objectAtIndex:0]; 
	NSURL * recordUrl = [NSURL fileURLWithPath:[dirPath stringByAppendingPathComponent:key]];  
	player = [[AVAudioPlayer alloc] initWithContentsOfURL: recordUrl error:nil];
	if (player) {
		
	player.volume=1;
	[player setDelegate:self];
	[player play];
	self.playLabel.text = @"Stop Playing";
	}
}

+(UserRecordsManager *)sharedManager
{
	if (!_sharedManager) {
		_sharedManager = [[UserRecordsManager alloc] init];
	}
	return _sharedManager;
}

@end
