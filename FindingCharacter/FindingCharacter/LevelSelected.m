//
//  LevelSelected.m
//  FindingCharacter
//
//  Created by prom phanit on 4/30/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "LevelSelected.h"
#import "GameScreen1.h"

@interface LevelSelected ()

@end

@implementation LevelSelected

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)level1:(UIButton *)sender {
    levelNumber = 1;
}

- (IBAction)level2:(UIButton *)sender {
    levelNumber = 2;
}

- (IBAction)level3:(UIButton *)sender {
    levelNumber = 3;
}

- (IBAction)level4:(UIButton *)sender {
    levelNumber = 4;
}

- (IBAction)level5:(UIButton *)sender {
    levelNumber = 5;
}

- (IBAction)level6:(UIButton *)sender {
    levelNumber = 6;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"segue"]) {
        GameScreen1 *gamescreen1 = segue.destinationViewController;
        gamescreen1.levelSelect = levelNumber;
    }
}

@end
