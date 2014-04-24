//
//  GameResultController.m
//  example
//
//  Created by 谷尾 和是 on 2014/04/09.
//  Copyright (c) 2014年 Masa. All rights reserved.
//

#import "GameResultController.h"
#import "MoleViewController.h"
#import "AppDelegate.h"
#import "Social/Social.h"
#import "MoleViewController.h"

@interface GameResultController (){
       UILabel*      timerView;
    int    score_today;
       UILabel*      firstscore;
       UILabel*      secondscore;
       UILabel*      thirdscore;
    IBOutlet UIButton *facebookB;
    IBOutlet UIButton *twitterB;
    NSString *scoretoday;
    NSString *kotoba;
}

@end

@implementation GameResultController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)Facebookbutton:(id)sender
{
    kotoba = [NSString stringWithFormat:@"moleAlarm 今日のあなたの得点は %@ 秒でした！",scoretoday];
    SLComposeViewController *facebookPostVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    [facebookPostVC setInitialText:kotoba];
    [self presentViewController:facebookPostVC animated:YES completion:nil];
    
}

-(IBAction)Twitterbutton:(id)sender
{
    kotoba = [NSString stringWithFormat:@"moleAlarm 今日のあなたの得点は %@ 秒でした！",scoretoday];
    SLComposeViewController *twitterPostVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    [twitterPostVC setInitialText:kotoba];
    [self presentViewController:twitterPostVC animated:YES completion:nil];
}
/*
- (BOOL)shouldAutorotate
{
    return NO;
}

// 縦のみサポート
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *button_tw = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *button_fb = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(75,490,190,50);
    button_tw.frame = CGRectMake(75,400,60,60);
    button_fb.frame = CGRectMake(185,400,60,60);
    
    UIImage *image_tw= [UIImage imageNamed:@"twitter.png"];
    UIImage *image_fb= [UIImage imageNamed:@"facebook_1.png"];
    
    [button_fb setBackgroundImage:image_fb forState:UIControlStateNormal];
    [button_tw setBackgroundImage:image_tw forState:UIControlStateNormal];
    [button_fb setShowsTouchWhenHighlighted:YES];
    [button_tw setShowsTouchWhenHighlighted:YES];
    
    [button_tw addTarget:self action:@selector(Twitterbutton:) forControlEvents:UIControlEventTouchUpInside];
    [button_fb addTarget:self action:@selector(Facebookbutton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button_tw];
    [self.view addSubview:button_fb];
    
    UIImage * imageData = [UIImage imageNamed:@"buttonx.png"];
    [button setBackgroundImage:imageData forState:UIControlStateNormal];
    [button setShowsTouchWhenHighlighted:YES];
    
    [button addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    NSUserDefaults *today_score = [NSUserDefaults standardUserDefaults];
    score_today = [today_score integerForKey:@"score_this"];
    scoretoday = [NSString stringWithFormat : @"%d", score_today];
    
    
    timerView = [[UILabel alloc] initWithFrame:CGRectMake(118,38,150,80)];
    timerView.font = [UIFont boldSystemFontOfSize:46];
    timerView.textAlignment = NSTextAlignmentCenter;
    timerView.textColor = [UIColor orangeColor];
    timerView.shadowColor = [UIColor blackColor];
    timerView.backgroundColor = [UIColor clearColor];
    timerView.text = scoretoday;
    [self.view addSubview:timerView];
    
    firstscore = [[UILabel alloc] initWithFrame:CGRectMake(28,140,150,80)];
    firstscore.font = [UIFont boldSystemFontOfSize:42];
    firstscore.textAlignment = NSTextAlignmentCenter;
    firstscore.textColor = [UIColor blackColor];
    firstscore.backgroundColor = [UIColor clearColor];
    firstscore.text = @"---";
    
    NSUserDefaults *first_score = [NSUserDefaults standardUserDefaults];
    NSInteger first = [first_score integerForKey:@"first"];
    NSUserDefaults *second_score = [NSUserDefaults standardUserDefaults];
    NSInteger second = [second_score integerForKey:@"second"];
    NSUserDefaults *third_score = [NSUserDefaults standardUserDefaults];
    NSInteger third = [third_score integerForKey:@"third"];
    
    NSString* firstTime = [NSString stringWithFormat : @"%ld", (long)first ];
    if (first != 1000) {
        firstscore.text = firstTime;
    }
    [self.view addSubview:firstscore];
    
    secondscore = [[UILabel alloc] initWithFrame:CGRectMake(78,223,150,80)];
    secondscore.font = [UIFont boldSystemFontOfSize:42];
    secondscore.textAlignment = NSTextAlignmentCenter;
    secondscore.textColor = [UIColor blackColor];
    secondscore.backgroundColor = [UIColor clearColor];
    secondscore.text = @"---";
    
    NSString* secondTime = [NSString stringWithFormat : @"%ld", (long)second ];
    if (second != 1000) {
        secondscore.text = secondTime;
    }
    [self.view addSubview:secondscore];
    
    thirdscore = [[UILabel alloc] initWithFrame:CGRectMake(128,305,150,80)];
    thirdscore.font = [UIFont boldSystemFontOfSize:42];
    thirdscore.textAlignment = NSTextAlignmentCenter;
    thirdscore.textColor = [UIColor blackColor];
    thirdscore.backgroundColor = [UIColor clearColor];
    thirdscore.text = @"---";
    
    NSString* thirdTime = [NSString stringWithFormat : @"%ld", (long)third ];
    
    if (third != 1000) {
        thirdscore.text = thirdTime;
    }
    [self.view addSubview:thirdscore];
    
    if (score_today < first) {
        firstscore.text = scoretoday;
        first_score = [NSUserDefaults standardUserDefaults];
        [first_score setInteger:score_today forKey:@"first"];
        second_score = [NSUserDefaults standardUserDefaults];
        [second_score setInteger:first forKey:@"second"];
        third_score = [NSUserDefaults standardUserDefaults];
        [third_score setInteger:second forKey:@"third"];
        
        NSInteger Xsecond = first;
        NSInteger Xthird = second;
        
        CGRect rect = CGRectMake(178, 171, 40, 20);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
        imageView.image = [UIImage imageNamed:@"new2.png"];
        [self.view addSubview:imageView];
        
        if (Xsecond !=1000) {
            secondscore.text = [NSString stringWithFormat : @"%ld", (long)first ];
            if (Xthird !=1000) {
                thirdscore.text = [NSString stringWithFormat : @"%ld",(long)second ];
            }
        }
    }else if(score_today < second){
        secondscore.text = scoretoday;
        second_score = [NSUserDefaults standardUserDefaults];
        [second_score setInteger:score_today forKey:@"second"];
        third_score = [NSUserDefaults standardUserDefaults];
        [third_score setInteger:second forKey:@"third"];
        
        NSInteger Ysecond = second;
        
        CGRect rect = CGRectMake(228, 255, 40, 20);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
        imageView.image = [UIImage imageNamed:@"new2.png"];
        [self.view addSubview:imageView];
        
        if (Ysecond !=1000) {
            thirdscore.text = [NSString stringWithFormat : @"%ld",(long)second ];
        }

    }else if(score_today < third){
        thirdscore.text = scoretoday;
        third_score = [NSUserDefaults standardUserDefaults];
        [third_score setInteger:score_today forKey:@"third"];
        CGRect rect = CGRectMake(278, 340, 40, 20);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
        imageView.image = [UIImage imageNamed:@"new2.png"];
        [self.view addSubview:imageView];
    }
}

-(void) next:(UIButton *)sender
{
    UIStoryboard *secondStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    id secondViewController = [secondStoryboard instantiateViewControllerWithIdentifier:@"TBC"];
    [self presentViewController:(UIViewController*)secondViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
