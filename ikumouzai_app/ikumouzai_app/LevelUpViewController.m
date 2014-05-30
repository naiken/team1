//
//  LevelUpViewController.m
//  ikumouzai_app
//
//  Created by 谷尾 和是 on 2014/05/03.
//  Copyright (c) 2014年 谷尾 和是. All rights reserved.
//

#import "LevelUpViewController.h"
#import "AVFoundation/AVFoundation.h"

@interface LevelUpViewController (){
    AVAudioPlayer                    *sound;
    UISwipeGestureRecognizer         *tapTransition;
    UIImage                          *imagex[7];
    UIImage                          *levelossann1[5];
    UIImage                          *levelossann2[5];
    UIImageView                      *imageViewx[7];
    UIImageView                      *imageViewy;
    UIImageView                      *imageComment;
    NSInteger                        level;
    CGRect                           rectx[7];
    CGRect                           ossan;
    
}
@property (strong, nonatomic) UIWindow *window;

-(IBAction)tap:(id)sender;
@end

@implementation LevelUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self change];
    
    levelossann1[0] = [UIImage imageNamed:@"hira01.png"];
    levelossann1[1] = [UIImage imageNamed:@"kacho01.png"];
    levelossann1[2] = [UIImage imageNamed:@"bucho01.png"];
    levelossann1[3] = [UIImage imageNamed:@"yakuin01.png"];
    levelossann1[4] = [UIImage imageNamed:@"hukusyacho01.png"];
    
    levelossann2[0] = [UIImage imageNamed:@"hira02.png"];
    levelossann2[1] = [UIImage imageNamed:@"kacho02.png"];
    levelossann2[2] = [UIImage imageNamed:@"bucho02.png"];
    levelossann2[3] = [UIImage imageNamed:@"yakuin02.png"];
    levelossann2[4] = [UIImage imageNamed:@"hukusyacho02.png"];
    
    ossan = CGRectMake(5, 568, 120, 160);
    
    UISwipeGestureRecognizer *tapGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:tapGesture];
    self.view.userInteractionEnabled = NO;
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(change)
                                                 name:UIApplicationDidBecomeActiveNotification object:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(labelappear) userInfo:nil repeats:NO];
}

-(void)labelappear{
    UIImage *image = [UIImage imageNamed:@"levelupscreen.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    CGRect rect = CGRectMake(-188, -55, 700, 700);
    imageView.frame = rect;
    [self.view addSubview:imageView];
    
    UIViewAnimationOptions animeOptions= UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveLinear;
    
    [UIView animateWithDuration:30.0f
                          delay:0.1
                        options:animeOptions
                     animations:^{
                         imageView.transform = CGAffineTransformMakeRotation(M_PI);
                     }
                     completion:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAnime1) userInfo:nil repeats:NO];
    
    level = [[NSUserDefaults standardUserDefaults] integerForKey:@"level_now"];
    level += 1;
    [[NSUserDefaults standardUserDefaults] setInteger:level forKey:@"level_now"];
}

-(void)timerAnime1{
    imagex[0] = [UIImage imageNamed:@"re.png"];
    imageViewx[0] = [[UIImageView alloc]initWithImage:imagex[0]];
    rectx[0] = CGRectMake(93, 190, 5, 5);
    imageViewx[0].frame = rectx[0];
    [self.view addSubview:imageViewx[0]];
    
    [UIView animateWithDuration:0.2f
                     animations:^{
                         imageViewx[0].transform = CGAffineTransformMakeScale(11.5, 13.5);
                     }
                     completion:^(BOOL finished){
                         [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAnime2) userInfo:nil repeats:NO];
                     }];
}

-(void)timerAnime2{
    imagex[1] = [UIImage imageNamed:@"be.png"];
    imageViewx[1] = [[UIImageView alloc]initWithImage:imagex[1]];
    rectx[1] = CGRectMake(155, 190, 5, 5);
    imageViewx[1].frame = rectx[1];
    [self.view addSubview:imageViewx[1]];
    
    [UIView animateWithDuration:0.2f
                     animations:^{
                         imageViewx[1].transform = CGAffineTransformMakeScale(11.5, 13.8);
                     }
                     completion:^(BOOL finished){
                         [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAnime3) userInfo:nil repeats:NO];
                     }];
}

-(void)timerAnime3{
    imagex[2] = [UIImage imageNamed:@"ru.png"];
    imageViewx[2] = [[UIImageView alloc]initWithImage:imagex[2]];
    rectx[2] = CGRectMake(220, 190, 5, 5);
    imageViewx[2].frame = rectx[2];
    [self.view addSubview:imageViewx[2]];
    
    [UIView animateWithDuration:0.2f
                     animations:^{
                         imageViewx[2].transform = CGAffineTransformMakeScale(11.5, 13.5);
                     }
                     completion:^(BOOL finished){
                         [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAnime4) userInfo:nil repeats:NO];
                     }];
}

-(void)timerAnime4{
    imagex[3] = [UIImage imageNamed:@"a.png"];
    imageViewx[3] = [[UIImageView alloc]initWithImage:imagex[3]];
    rectx[3] = CGRectMake(73, 270, 5, 5);
    imageViewx[3].frame = rectx[3];
    [self.view addSubview:imageViewx[3]];
    
    [UIView animateWithDuration:0.2f
                     animations:^{
                         imageViewx[3].transform = CGAffineTransformMakeScale(11.5, 13.5);
                     }
                     completion:^(BOOL finished){
                         [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAnime5) userInfo:nil repeats:NO];
                     }];
}

-(void)timerAnime5{
    imagex[4] = [UIImage imageNamed:@"xtu.png"];
    imageViewx[4] = [[UIImageView alloc]initWithImage:imagex[4]];
    rectx[4] = CGRectMake(130, 280, 5, 5);
    imageViewx[4].frame = rectx[4];
    [self.view addSubview:imageViewx[4]];
    
    [UIView animateWithDuration:0.2f
                     animations:^{
                         imageViewx[4].transform = CGAffineTransformMakeScale(9.5, 11.5);
                     }
                     completion:^(BOOL finished){
                         [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAnime6) userInfo:nil repeats:NO];
                     }];
}

-(void)timerAnime6{
    imagex[5] = [UIImage imageNamed:@"pu.png"];
    imageViewx[5] = [[UIImageView alloc]initWithImage:imagex[5]];
    rectx[5] = CGRectMake(190, 268, 5, 5);
    imageViewx[5].frame = rectx[5];
    [self.view addSubview:imageViewx[5]];
    
    [UIView animateWithDuration:0.2f
                     animations:^{
                         imageViewx[5].transform = CGAffineTransformMakeScale(11.5, 15.5);
                     }
                     completion:^(BOOL finished){
                         [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerAnime7) userInfo:nil repeats:NO];
                     }];
}

-(void)timerAnime7{
    imagex[6] = [UIImage imageNamed:@"bikkuri.png"];
    imageViewx[6] = [[UIImageView alloc]initWithImage:imagex[6]];
    rectx[6] = CGRectMake(250, 270, 5, 5);
    imageViewx[6].frame = rectx[6];
    [self.view addSubview:imageViewx[6]];
    
    [UIView animateWithDuration:0.2f
                     animations:^{
                         imageViewx[6].transform = CGAffineTransformMakeScale(9.5, 13.5);
                     }
                     completion:^(BOOL finished){
                         [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(ossan) userInfo:nil repeats:NO];
                     }];
}

-(void)ossan{
    imageViewy = [[UIImageView alloc]initWithFrame:ossan];
    imageViewy.image = levelossann1[level-1];
    [self.view addSubview:imageViewy];
    
    [UIView animateWithDuration:0.5
                          delay:0.01
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         imageViewy.frame = CGRectMake(0, 413, 120, 160);
                     }
                     completion:^(BOOL finished){
                         [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(ato) userInfo:nil repeats:NO];
                     }];
}

-(void)ato{
    imageViewy.image = levelossann2[level-1];
    imageComment = [[UIImageView alloc]initWithFrame:CGRectMake(135, 350, 170, 130)];
    imageComment.image = [UIImage imageNamed:@"hukidashi.png"];
    [self.view addSubview:imageComment];
    self.view.userInteractionEnabled = YES;
}

- (IBAction)tap:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)change
{
    NSString *bgmPath_nade = [[NSBundle mainBundle] pathForResource:@"ban1"
                                                             ofType:@"mp3"];
    NSURL *bgmUrl_nade = [NSURL fileURLWithPath:bgmPath_nade];
    sound = [[AVAudioPlayer alloc]initWithContentsOfURL:bgmUrl_nade error:nil];
    [sound setNumberOfLoops:0];
    [sound play];
}

@end
