//
//  ScoreScreen.m
//  FindingCharacter
//
//  Created by prom phanit on 5/5/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "ScoreScreen.h"
#import "AnswerScreen.h"

@interface ScoreScreen ()

@end

@implementation ScoreScreen

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
    
    NSArray *scoreLabel = [[NSArray alloc]initWithObjects:self.scoreLevel1,self.scoreLevel2,self.scoreLevel3,self.scoreLevel4,self.scoreLevel5,self.scoreLevel6, nil];
    
    NSArray *level = [[NSArray alloc]initWithObjects:@"level1",@"level2",@"level3",@"level4",@"level5",@"level6", nil];
    int i = 0;
        for (id obj in scoreLabel) {
            heightScore = [[NSUserDefaults standardUserDefaults] integerForKey:[NSString stringWithFormat:@"%@",level[i]]];
            i++;
            if ([obj isKindOfClass:[UILabel class]]) {
                UILabel *label = (UILabel *)obj;
                label.text = [NSString stringWithFormat:@"%i point",heightScore];
            }
        }
    
}

@end
