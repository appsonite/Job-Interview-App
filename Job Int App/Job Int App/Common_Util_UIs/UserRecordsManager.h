//
//  UserRecordsManager.h
//  Job Int App
//
//  Created by Viktor on 06.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AVFoundation/AVFoundation.h"
#import "CoreAudio/CoreAudioTypes.h"
#import <Foundation/Foundation.h>



@interface UserRecordsManager : NSObject <AVAudioRecorderDelegate,AVAudioSessionDelegate,AVAudioPlayerDelegate>

@property (nonatomic,retain) UILabel * playLabel;

@property (nonatomic,retain) UIButton * recordButton;

-(void) recordSoundForKey:(NSString*) key;

-(void) playSoundForKey:(NSString*) key;

+(UserRecordsManager*) sharedManager;

@end
