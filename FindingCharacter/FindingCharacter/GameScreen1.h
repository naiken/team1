//
//  GameScreen1.h
//  FindingCharacter
//
//  Created by prom phanit on 4/30/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import <UIKit/UIKit.h>

NSString *imageName;
int imageNumber;
@interface GameScreen1 : UIViewController
{
    NSTimer *timer;
    int count;
}


@property (nonatomic) int levelSelect;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageFrame;


@end
