//
//  GameScreen2.h
//  FindingCharacter
//
//  Created by prom phanit on 4/30/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString *tapImage;
NSString *answer;
int score;
@interface GameScreen2 : UIViewController
{
    NSTimer *timer;
    NSTimer *timerMili;
    int count;
    int mili;
}

@property (weak, nonatomic) IBOutlet UILabel *countLabel;


@property (nonatomic) float x;
@property (nonatomic) float y;
@property (nonatomic) int w;
@property (nonatomic) int h;
@property (nonatomic) int level;
@property (nonatomic) int row;
@property (nonatomic) int col;
@property (nonatomic) int space;
@property (nonatomic) BOOL check;
@property (nonatomic) CGFloat screenWidth;
@property (nonatomic) CGFloat screenHeight;
@property (nonatomic) NSString *screenOneImage;
@property (nonatomic) NSString *clickImage;
@property (weak, nonatomic) IBOutlet UIView *myView;


@end
