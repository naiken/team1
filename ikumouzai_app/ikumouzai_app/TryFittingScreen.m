//
//  TryFittingScreen.m
//  SampleItemPage
//
//  Created by saya on 2014/04/29.
//  Copyright (c) 2014年 marugen. All rights reserved.
//

#import "TryFittingScreen.h"
#import "BuyItemViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface TryFittingScreen ()

@property (nonatomic) int tryFlag1;
@property (nonatomic) int tryFlag2;
@property (nonatomic) int tryFlag3;
@property (nonatomic) int tryFlag4;

- (IBAction)backbtn:(UIButton *)sender;
@end

@implementation TryFittingScreen{
    NSString        *itemName[12];
    UIImageView     *katura[6];
    UIImageView     *ossan1;
    UIImage         *tanktop;
    UIImageView     *suitView;
    UIImageView     *mememe;
    UIImageView     *kuti;
    NSInteger       itemType[12];
    UIImage         *itemFitImage[12];
    UIImageView     *itemFitImageView[12];
    NSNumber        *sutu[12];
    AVAudioPlayer   *bgmPlayer1;
    
    UIImageView *animeImageView;
}

@synthesize btnFlag1 = _btnFlag1;
@synthesize btnFlag2 = _btnFlag2;
@synthesize btnFlag3 = _btnFlag3;
@synthesize btnFlag4 = _btnFlag4;

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    // オーディオ・プレーヤのセットアップ
    NSURL *bgm1URL = [[NSBundle mainBundle] URLForResource:@"Curtain01-1" withExtension:@"mp3"];
    bgmPlayer1 = [[AVAudioPlayer alloc] initWithContentsOfURL:bgm1URL error:NULL];
    [bgmPlayer1 prepareToPlay];
    bgmPlayer1.numberOfLoops = 0;
    
    // BGMの再生
    [bgmPlayer1 play];
    
    [NSTimer
     scheduledTimerWithTimeInterval:0.01f
     target:self
     selector:@selector(slideInAnimation:)
     userInfo:nil
     repeats:NO
     ];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [bgmPlayer1 stop];
    
}

//スライドインアニメーション
- (void)slideInAnimation:(NSTimer *)timer
{
    
    //アニメーション開始
    [UIView beginAnimations:nil context:NULL];
    //アニメーション秒数
    [UIView setAnimationDuration:1.5f];
    
    //デリゲート指定
    [UIView setAnimationDelegate:self];
    [animeImageView setFrame:CGRectMake(self.view.frame.size.width - 15, 0, 320, 568)];
    //アニメーション実行
    [UIView commitAnimations];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    katura[0] = [[UIImageView alloc] initWithFrame:CGRectMake(50, 210,217,55)];
    katura[1] = [[UIImageView alloc] initWithFrame:CGRectMake(53, 140,214,127)];
    katura[2] = [[UIImageView alloc] initWithFrame:CGRectMake(50, 138,220,127)];
    katura[3] = [[UIImageView alloc] initWithFrame:CGRectMake(50, 134,220,130)];
    katura[4] = [[UIImageView alloc] initWithFrame:CGRectMake(36, 134,240,130)];
    
    katura[0].image = [UIImage imageNamed:@"kami-02.png"];
    katura[1].image = [UIImage imageNamed:@"kami-03.png"];
    katura[2].image = [UIImage imageNamed:@"kami-04.png"];
    katura[3].image = [UIImage imageNamed:@"kami-05.png"];
    katura[4].image = [UIImage imageNamed:@"kami-06.png"];
    
    tanktop = [UIImage imageNamed:@"tanktop.png"];
    
    itemName[0] = @"sutu01.png";
    itemName[1] = @"sutu2.png";
    itemName[2] = @"sutu03.png";
    itemName[3] = @"sutu04.png";
    itemName[4] = @"nectai1.png";
    itemName[5] = @"nectai2.png";
    itemName[6] = @"nectai3.png";
    itemName[7] = @"nectai4.png";
    itemName[8] = @"megane-03.png";
    itemName[9] = @"megane02.png";
    itemName[10] = @"megane03.png";
    itemName[11] = @"megane04.png";
    
    [self.view addSubview:itemFitImageView[4]];
    [self.view bringSubviewToFront:itemFitImageView[4]];
    
    
    //おっさんのスーツ
    suitView = [[UIImageView alloc] initWithFrame:CGRectMake(80, 388,156,78)];
    suitView.image = tanktop;
    [self.view addSubview:suitView];
    
    //おっさんの写真
    ossan1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kao.png"]];
    ossan1.frame = CGRectMake(45, 135,230,276);
    [self.view addSubview:ossan1];
    
    
    for (int i = 0; i<=11; i++) {
        itemFitImage[i] =[UIImage imageNamed:itemName[i]];
        itemFitImageView[i] = [[UIImageView alloc] initWithImage:itemFitImage[i]];
    }
    
    for (int i = 0; i<=3; i++) {
        [itemFitImageView[i] setFrame:CGRectMake(86, 385,146,78)];
    }
    
    for (int i = 4; i<=7; i++) {
        [itemFitImageView[i] setFrame:CGRectMake(139, 410, 37, 37)];
    }
    
    for (int i = 8; i<=11; i++) {
        [itemFitImageView[i] setFrame:CGRectMake(64,252,185,40)];
    }
    
    NSDictionary *buy = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"buyType"];
    
    NSString *item[12];
    for (int i= 0; i<=11; i++) {
        item[i] = [NSString stringWithFormat:@"item0%d",i];
        sutu[i] = (NSNumber *)[buy valueForKey:item[i]];
        itemType[i] = [sutu[i] unsignedIntegerValue];
    }
    
    switch (self.btnFlag1) {
        case 1:
            suitView.image = itemFitImage[0];
            self.tryFlag1 = 1;
            break;
        case 2:
            suitView.image = itemFitImage[1];
            self.tryFlag1 = 2;
            break;
        case 3:
            suitView.image = itemFitImage[2];
            self.tryFlag1 = 3;
            break;
        case 4:
            suitView.image = itemFitImage[3];
            self.tryFlag1 = 4;
            break;
        default:
            break;
    }
    
    switch (self.btnFlag2) {
        case 1:
            [self.view addSubview:itemFitImageView[4]];
            [self.view bringSubviewToFront:itemFitImageView[4]];
            self.tryFlag2 = 1;
            break;
        case 2:
            [self.view addSubview:itemFitImageView[5]];
            [self.view bringSubviewToFront:itemFitImageView[5]];
            self.tryFlag2 = 2;
            break;
        case 3:
            [self.view addSubview:itemFitImageView[6]];
            [self.view bringSubviewToFront:itemFitImageView[6]];
            self.tryFlag2 = 3;
            break;
        case 4:
            [self.view addSubview:itemFitImageView[7]];
            [self.view bringSubviewToFront:itemFitImageView[7]];
            self.tryFlag2 = 4;
        default:
            break;
    }
    
    switch (self.btnFlag3) {
        case 1:
            [self.view addSubview:itemFitImageView[8]];
            self.tryFlag3 = 1;
            break;
        case 2:
            [self.view addSubview:itemFitImageView[9]];
            self.tryFlag3 = 2;
            break;
        case 3:
            [self.view addSubview:itemFitImageView[10]];
            self.tryFlag3 = 3;
            break;
        case 4:
            [self.view addSubview:itemFitImageView[11]];
            self.tryFlag3 = 4;
        default:
            break;
    }
    
    //おっさんの瞬き
    [self wink];
    
    kuti= [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kuti-01.png"]];
    kuti.frame = CGRectMake(120, 338,75,16);
    [self.view addSubview:kuti];
    
    
    NSInteger level_now = [[NSUserDefaults standardUserDefaults] integerForKey:@"level_now"];
    
    switch (level_now) {
        case 1:
            [self.view addSubview:katura[0]];
            break;
        case 2:
            [self.view addSubview:katura[1] ];
            break;
        case 3:
            [self.view addSubview:katura[2] ];
            break;
        case 4:
            [self.view addSubview:katura[3] ];
            break;
        case 5:
            [self.view addSubview:katura[4] ];
            break;
        default:
            break;
    }
    
    //背景画像
    UIImage *backPicture =[UIImage imageNamed:@"shicyaku-bg.png"];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [backPicture drawInRect:self.view.bounds];
    UIImage *BackPicture = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:BackPicture];
    
    
    UIImage *animImage =[UIImage imageNamed:@"ka-ten.png"];
    animeImageView = [[UIImageView alloc] initWithImage:animImage];
    [self.view addSubview:animeImageView];
}

//瞬きのアニメーションのタイミング
- (void)wink{
    CGRect rect = CGRectMake(102, 237, 116, 40);
    mememe = [[UIImageView alloc]initWithFrame:rect];
    mememe.image = [UIImage imageNamed:@"me-01-a.png"];
    [self.view addSubview:mememe];
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(mabataki) userInfo:nil repeats:YES];
    
}

//瞬きのアニメーション
-(void)mabataki{
    // アニメーション用画像を配列にセット
    NSMutableArray *imageList = [NSMutableArray array];
    UIImage *imgeye = [UIImage imageNamed:@"me-01-b.png"];
    [imageList addObject:imgeye];
    // アニメーション用画像をセット
    mememe.animationImages = imageList;
    // アニメーションの速度
    mememe.animationDuration = 0.2;
    mememe.animationRepeatCount = 1;
    [mememe startAnimating];
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //2つ目の画面にパラメータを渡して遷移する
    if ([segue.identifier isEqualToString:@"ReturnToTryFittingScreenSegue"]) {
        //ここでパラメータを渡す
        BuyItemViewController *buyItemviewController = segue.destinationViewController;
        buyItemviewController.tryFlag1 = _tryFlag1;
        buyItemviewController.tryFlag2 = _tryFlag2;
        buyItemviewController.tryFlag3 = _tryFlag3;
        buyItemviewController.tryFlag4 = _tryFlag4;
    }
}
- (IBAction)backbtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
