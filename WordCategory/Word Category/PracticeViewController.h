//
//  PracticeViewController.h
//  Word Category
//
//  Created by prom phanit on 5/24/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryDatabase.h"
#import <AudioToolbox/AudioToolbox.h>
#import <AVFoundation/AVFoundation.h>

@interface PracticeViewController : UIViewController
{
    SystemSoundID PlaySoundID;
    AVAudioPlayer *soundPlay;
    
}
@property (strong,nonatomic) NSString *item;

@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) int w;
@property (nonatomic) int h;
@property (nonatomic) int space;
@property (nonatomic) BOOL check;
@property (nonatomic) BOOL stopGame;
@property (nonatomic) int wordLength;
@property (nonatomic) int countRight;
@property (nonatomic) int countWrong;
@property (nonatomic) CGFloat screenWidth;
@property (nonatomic) CGFloat screenHeight;
@property (nonatomic) NSArray *givenNSArray;
@property (nonatomic) NSString *correctedWord;
@property (nonatomic) UIImageView *imgview;
@property (nonatomic) NSMutableArray *la;

@end
