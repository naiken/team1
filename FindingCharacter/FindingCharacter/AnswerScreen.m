//
//  AnswerScreen.m
//  FindingCharacter
//
//  Created by prom phanit on 4/30/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "AnswerScreen.h"
#import "GameScreen2.h"
#import "GameScreen1.h"
#import "LevelSelected.h"


@interface AnswerScreen ()


@end

@implementation AnswerScreen

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tapImage.image =[UIImage imageNamed:tapImage];
    self.answerImage.image = [UIImage imageNamed:imageName];
    self.answerLabel.text = answer;
    self.scoreLabel.text =[NSString stringWithFormat:@"Score: %i point",score];
    
    switch (levelNumber) {
        case 1:
            heightScore = [[NSUserDefaults standardUserDefaults]integerForKey:@"level1"];
            if (score > heightScore) {
                [[NSUserDefaults standardUserDefaults]setInteger:score forKey:@"level1"];
            }
            break;
        case 2:
            heightScore = [[NSUserDefaults standardUserDefaults]integerForKey:@"level2"];
            if (score > heightScore) {
                [[NSUserDefaults standardUserDefaults]setInteger:score forKey:@"level2"];
            }
            break;
        case 3:
            heightScore = [[NSUserDefaults standardUserDefaults]integerForKey:@"level3"];
            if (score > heightScore) {
                [[NSUserDefaults standardUserDefaults]setInteger:score forKey:@"level3"];
            }
            break;
        case 4:
            heightScore = [[NSUserDefaults standardUserDefaults]integerForKey:@"level4"];
            if (score > heightScore) {
                [[NSUserDefaults standardUserDefaults]setInteger:score forKey:@"level4"];
            }
            break;
        case 5:
            heightScore = [[NSUserDefaults standardUserDefaults]integerForKey:@"level5"];
            if (score > heightScore) {
                [[NSUserDefaults standardUserDefaults]setInteger:score forKey:@"level5"];
            }
            break;
        case 6:
            heightScore = [[NSUserDefaults standardUserDefaults]integerForKey:@"level6"];
            if (score > heightScore) {
                [[NSUserDefaults standardUserDefaults]setInteger:score forKey:@"level6"];
            }
            break;
            
        default:
            break;
    }
    
}



@end
