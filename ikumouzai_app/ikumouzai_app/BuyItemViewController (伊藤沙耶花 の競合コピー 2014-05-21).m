//
//  ViewController.m
//  SampleItemPage
//
//  Created by saya on 2014/04/28.
//  Copyright (c) 2014年 marugen. All rights reserved.
//

#import "BuyItemViewController.h"
#import "TryFittingScreen.h"

@interface BuyItemViewController ()

@property (nonatomic) int selectButton;
@property (nonatomic) int number;
@property (nonatomic) int clickButton;

@property (nonatomic) int clickButton1;
@property (nonatomic) int clickButton2;
@property (nonatomic) int clickButton3;
@property (nonatomic) int clickButton4;
@property (nonatomic) int clickButton5;
@property (nonatomic) int clickButton6;
@property (nonatomic) int clickButton7;
@property (nonatomic) int clickButton8;
@property (nonatomic) int clickButton9;
@property (nonatomic) int clickButton10;
@property (nonatomic) int clickButton11;
@property (nonatomic) int clickButton12;
@property (nonatomic) int clickButton13;
@property (nonatomic) int clickButton14;
@property (nonatomic) int clickButton15;
@property (nonatomic) int clickButton16;

@property (nonatomic) int btnFlag1;
@property (nonatomic) int btnFlag2;
@property (nonatomic) int btnFlag3;
@property (nonatomic) int btnFlag4;

@end

@implementation BuyItemViewController{

    IBOutlet UIScrollView *scrollView;
    IBOutlet UIPageControl *pageControl;
    IBOutlet UIButton *btn;

    //アイテム画像
    UIImage *itemImage[16];
    NSString *itemName[16];
    
    NSString *boughtitem[12];
    NSInteger itemType01;
    NSInteger itemType02;
    NSInteger itemType03;
    NSInteger itemType04;
    NSInteger itemType05;
    NSInteger itemType06;
    NSInteger itemType07;
    NSInteger itemType08;
    NSInteger itemType09;
    NSInteger itemType10;
    NSInteger itemType11;
    NSInteger itemType12;
    
    UIButton *itemButton[16];

    NSInteger genzaiPointToFlag;
    NSInteger siyouPointToFlag;
    NSInteger nokoriPointToFlag;
    
    //保持ポイント
    NSInteger pt;
    //合計の値段
    NSInteger totalpt;
    //今までの消費ポイント
    NSInteger spend_point;
    
    UIAlertView *alert;
    
    UILabel *itemPointLabel[4][4];
    UILabel *buyLabel[12];
    
    BOOL buyFlag[12];
    
    NSDictionary *bought;
    int clickFlag[12];


}

@synthesize tryFlag1 = _tryFlag1;
@synthesize tryFlag2 = _tryFlag2;
@synthesize tryFlag3 = _tryFlag3;
@synthesize tryFlag4 = _tryFlag4;

const CGFloat kScrollObjHeight =  393.0;//(※1)1pageの高さ
const CGFloat kScrollObjWidth  = 320.0;//(※2)1pageの幅
const NSUInteger kNumImages    = 4;    //(※3)総page数

//ScrollViewの設定
- (void)layoutScrollImages
{
    UIImageView *view = nil;
    NSArray *subviews = [scrollView subviews];

    CGFloat curXLoc = 0;
    for (view in subviews)
    {
        if ([view isKindOfClass:[UIImageView class]] && view.tag > 0)
        {
            CGRect frame = view.frame;
            frame.origin = CGPointMake(curXLoc, 0);
            view.frame = frame;

            curXLoc += (kScrollObjWidth);
        }
    }

    //スクロールの総範囲
    [scrollView setContentSize:CGSizeMake((kNumImages * kScrollObjWidth), kScrollObjHeight)];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //フレームサイズを取得する
    UIImage *backPicture =[UIImage imageNamed:@"shopscreen.png"];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [backPicture drawInRect:self.view.bounds];
    UIImage *BackPicture = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:BackPicture];
    
    /*
    UIImageView *ossan1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ossan-kao.png"]];
    ossan1.frame = CGRectMake(70, 150,170,230);
    [self.view addSubview:ossan1];
    */

    NSUInteger i;
    for (i = 1; i <= kNumImages; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"shop-bg.png"];
        UIImage *image = [UIImage imageNamed:imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];

        CGRect rect = imageView.frame;
        rect.size.height = kScrollObjHeight;
        rect.size.width = kScrollObjWidth;
        imageView.frame = rect;
        imageView.tag = i;
        [scrollView addSubview:imageView];
    }

    [self layoutScrollImages];

    [self.view addSubview:pageControl];

    // アイテムの種類の画像
    
    itemName[0] = @"ikumouzai-ao.png";
    itemName[1] = @"ikumouzai-midori.png";
    itemName[2] = @"ikumouzai-kuro.png";
    itemName[3] = @"ikumouzai-aka.png";
    itemName[4] = @"sutu1.png";
    itemName[5] = @"sutu2.png";
    itemName[6] = @"sutu3.png";
    itemName[7] = @"sutu4.png";
    itemName[8] = @"nectai1.png";
    itemName[9] = @"nectai2.png";
    itemName[10] = @"nectai3.png";
    itemName[11] = @"nectai4.png";
    itemName[12] = @"megane-01.png";
    itemName[13] = @"megane-02.png";
    itemName[14] = @"megane-03.png";
    itemName[15] = @"megane-04.png";

    
    
    for (int i= 0 ; i <=15; i++) {
        itemImage[i] = [UIImage imageNamed:itemName[i]];
    }

    //アイテムボタンの生成
    for (int i = 0;  i <= 15; i++) {
        itemButton[i]=[UIButton buttonWithType:UIButtonTypeCustom];
        [itemButton[i] setBackgroundImage:itemImage[i] forState:UIControlStateNormal];
    }
    
    //育毛剤
    [itemButton[0] setFrame:CGRectMake(75,95,50,100)];
    [itemButton[0] addTarget:self action:@selector(item01Buttom:) forControlEvents:UIControlEventTouchUpInside];

    [itemButton[1] setFrame:CGRectMake(75,248,50,100)];
    [itemButton[1] addTarget:self action:@selector(item02Buttom:) forControlEvents:UIControlEventTouchUpInside];

    [itemButton[2] setFrame:CGRectMake(205,95,35,100)];
    [itemButton[2] addTarget:self action:@selector(item03Buttom:) forControlEvents:UIControlEventTouchUpInside];

    [itemButton[3] setFrame:CGRectMake(205,248,40,100)];
    [itemButton[3] addTarget:self action:@selector(item04Buttom:) forControlEvents:UIControlEventTouchUpInside];

    //スーツ
    [itemButton[4] setFrame:CGRectMake(360,100,100,100)];
    [itemButton[4] addTarget:self action:@selector(item05Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[5] setFrame:CGRectMake(360,248,100,100)];
    [itemButton[5] addTarget:self action:@selector(item06Buttom:) forControlEvents:UIControlEventTouchUpInside];

    [itemButton[6] setFrame:CGRectMake(500,100,100,100)];
    [itemButton[6] addTarget:self action:@selector(item07Buttom:) forControlEvents:UIControlEventTouchUpInside];

    [itemButton[7] setFrame:CGRectMake(500,248,100,100)];
    [itemButton[7] addTarget:self action:@selector(item08Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    //ネクタイ
    [itemButton[8] setFrame:CGRectMake(690,100,80,100)];
    [itemButton[8] addTarget:self action:@selector(item09Buttom:) forControlEvents:UIControlEventTouchUpInside];

    [itemButton[9] setFrame:CGRectMake(690,248,80,100)];
    [itemButton[9] addTarget:self action:@selector(item10Buttom:) forControlEvents:UIControlEventTouchUpInside];

    [itemButton[10] setFrame:CGRectMake(830,100,80,100)];
    [itemButton[10] addTarget:self action:@selector(item11Buttom:) forControlEvents:UIControlEventTouchUpInside];

    [itemButton[11] setFrame:CGRectMake(830,248,80,100)];
    [itemButton[11] addTarget:self action:@selector(item12Buttom:) forControlEvents:UIControlEventTouchUpInside];

    //眼鏡
    [itemButton[12] setFrame:CGRectMake(1000,120,100,80)];
    [itemButton[12] addTarget:self action:@selector(item13Buttom:) forControlEvents:UIControlEventTouchUpInside];

    [itemButton[13] setFrame:CGRectMake(1000,268,100,80)];
    [itemButton[13] addTarget:self action:@selector(item14Buttom:) forControlEvents:UIControlEventTouchUpInside];

    [itemButton[14] setFrame:CGRectMake(1140,120,100,80)];
    [itemButton[14] addTarget:self action:@selector(item15Buttom:) forControlEvents:UIControlEventTouchUpInside];

    [itemButton[15] setFrame:CGRectMake(1140,268,100,80)];
    [itemButton[15] addTarget:self action:@selector(item16Buttom:) forControlEvents:UIControlEventTouchUpInside];

    for (int i = 0;  i <= 15; i++) {
        [scrollView addSubview:itemButton[i]];
    }

    //ポイントラベル
    for (int j = 0; j <= 3; j++) {
        for (int i = 0;  i <= 3; i++) {
            itemPointLabel[j][i] = [[UILabel alloc] init];
        }
    }
    
    //育毛剤
    itemPointLabel[0][0].frame = CGRectMake(85, 187, 150, 20);
    itemPointLabel[0][0].text = @"30 P";

    itemPointLabel[0][1].frame = CGRectMake(85, 335, 150, 20);
    itemPointLabel[0][1].text = @"80 P";

    itemPointLabel[0][2].frame = CGRectMake(210, 187, 150, 20);
    itemPointLabel[0][2].text = @"180 P";

    itemPointLabel[0][3].frame = CGRectMake(210, 335, 150, 20);
    itemPointLabel[0][3].text = @"330 P";

    //スーツ
    itemPointLabel[1][0].frame = CGRectMake(395, 187, 150, 20);
    itemPointLabel[1][0].text = @"50 P";

    itemPointLabel[1][1].frame = CGRectMake(395, 335, 150, 20);
    itemPointLabel[1][1].text = @"200 P";

    itemPointLabel[1][2].frame = CGRectMake(530, 187, 150, 20);
    itemPointLabel[1][2].text = @"600 P";

    itemPointLabel[1][3].frame = CGRectMake(530, 335, 150, 20);
    itemPointLabel[1][3].text = @"1200 P";

    //ネクタイ
    itemPointLabel[2][0].frame = CGRectMake(705, 187, 150, 20);
    itemPointLabel[2][0].text = @"50 P";

    itemPointLabel[2][1].frame = CGRectMake(705, 335, 150, 20);
    itemPointLabel[2][1].text = @"200 P";

    itemPointLabel[2][2].frame = CGRectMake(850, 187, 150, 20);
    itemPointLabel[2][2].text = @"600 P";

    itemPointLabel[2][3].frame = CGRectMake(850, 335, 150, 20);
    itemPointLabel[2][3].text = @"1200 P";

    //眼鏡
    itemPointLabel[3][0].frame = CGRectMake(1025, 187, 150, 20);
    itemPointLabel[3][0].text = @"50 P";

    itemPointLabel[3][1].frame = CGRectMake(1025, 335, 150, 20);
    itemPointLabel[3][1].text = @"200 P";
    
    itemPointLabel[3][2].frame = CGRectMake(1175, 187, 150, 20);
    itemPointLabel[3][2].text = @"600 P";

    itemPointLabel[3][3].frame = CGRectMake(1170, 335, 150, 20);
    itemPointLabel[3][3].text = @"1200 P";
    
    UILabel *titleLavel = [[UILabel alloc] init];
    titleLavel.frame = CGRectMake(120, 45, 150, 30);
    titleLavel.text = @"育毛剤";
    [scrollView addSubview:titleLavel];
    
    UILabel *titleLavel2 = [[UILabel alloc] init];
    titleLavel2.frame = CGRectMake(450, 45, 150, 30);
    titleLavel2.text = @"スーツ";
    [scrollView addSubview:titleLavel2];

    UILabel *titleLavel3 = [[UILabel alloc] init];
    titleLavel3.frame = CGRectMake(770, 45, 150, 30);
    titleLavel3.text = @"ネクタイ";
    [scrollView addSubview:titleLavel3];

    UILabel *titleLavel4 = [[UILabel alloc] init];
    titleLavel4.frame = CGRectMake(1100, 45, 150, 30);
    titleLavel4.text = @"眼鏡";
    [scrollView addSubview:titleLavel4];
    
    UIImage *itemPlate = [UIImage imageNamed:@"nehuda.png"];

    //育毛剤
    UIImageView *itemPlateName01 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName01 setFrame:CGRectMake(60,187,91,22)];
    [scrollView addSubview:itemPlateName01];

    UIImageView *itemPlateName02 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName02 setFrame:CGRectMake(60,335,91,22)];
    [scrollView addSubview:itemPlateName02];
    
    UIImageView *itemPlateName03 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName03 setFrame:CGRectMake(185,187,91,22)];
    [scrollView addSubview:itemPlateName03];
    
    UIImageView *itemPlateName04 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName04 setFrame:CGRectMake(185,335,91,22)];
    [scrollView addSubview:itemPlateName04];
    
    //スーツ
    UIImageView *itemPlateName05 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName05 setFrame:CGRectMake(370,187,91,22)];
    [scrollView addSubview:itemPlateName05];
    
    UIImageView *itemPlateName06 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName06 setFrame:CGRectMake(370,335,91,22)];
    [scrollView addSubview:itemPlateName06];
    
    UIImageView *itemPlateName07 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName07 setFrame:CGRectMake(510,187,91,22)];
    [scrollView addSubview:itemPlateName07];

    UIImageView *itemPlateName08 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName08 setFrame:CGRectMake(510,335,91,22)];
    [scrollView addSubview:itemPlateName08];
    
    //ネクタイ
    UIImageView *itemPlateName09 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName09 setFrame:CGRectMake(685,187,91,22)];
    [scrollView addSubview:itemPlateName09];
    
    UIImageView *itemPlateName10 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName10 setFrame:CGRectMake(685,335,91,22)];
    [scrollView addSubview:itemPlateName10];
    
    UIImageView *itemPlateName11 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName11 setFrame:CGRectMake(830,187,91,22)];
    [scrollView addSubview:itemPlateName11];
    
    UIImageView *itemPlateName12 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName12 setFrame:CGRectMake(830,335,91,22)];
    [scrollView addSubview:itemPlateName12];
    
    //眼鏡
    UIImageView *itemPlateName13 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName13 setFrame:CGRectMake(1000,187,91,22)];
    [scrollView addSubview:itemPlateName13];
    
    UIImageView *itemPlateName14 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName14 setFrame:CGRectMake(1000,335,91,22)];
    [scrollView addSubview:itemPlateName14];
    
    UIImageView *itemPlateName15 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName15 setFrame:CGRectMake(1150,187,91,22)];
    [scrollView addSubview:itemPlateName15];
    
    UIImageView *itemPlateName16 = [[UIImageView alloc] initWithImage:itemPlate];
    [itemPlateName16 setFrame:CGRectMake(1150,335,91,22)];
    [scrollView addSubview:itemPlateName16];
    
    
    for (int j = 0; j <= 3; j++) {
        for (int i = 0;  i <= 3; i++) {
            [scrollView addSubview:itemPointLabel[j][i]];
        }
    }

    switch (self.tryFlag1) {
        case 1:
            [itemButton[0] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
            [scrollView addSubview:itemButton[0]];
            self.btnFlag1 = 1;
            _clickButton1 = 1;
            break;
        case 2:
            [itemButton[1] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
            [scrollView addSubview:itemButton[1]];
            self.btnFlag1 = 2;
            _clickButton2 = 1;
            break;
        case 3:
            [itemButton[2] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
            [scrollView addSubview:itemButton[2]];
            self.btnFlag1 = 3;
            _clickButton3 = 1;
            break;
        case 4:
            [itemButton[3] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
            [scrollView addSubview:itemButton[3]];
            self.btnFlag1 = 4;
            _clickButton4 = 1;
            break;
        default:
            break;
    }

    switch (self.tryFlag2) {
        case 1:
            [itemButton[4] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
            [scrollView addSubview:itemButton[4]];
            self.btnFlag2 = 1;
            _clickButton5 = 1;
            break;
        case 2:
            [itemButton[5] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
            [scrollView addSubview:itemButton[5]];
            self.btnFlag2 = 2;
            _clickButton6 = 1;
            break;
        case 3:
            [itemButton[6] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
            [scrollView addSubview:itemButton[6]];
            self.btnFlag2 = 3;
            _clickButton7 = 1;
            break;
        case 4:
            [itemButton[7] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
            [scrollView addSubview:itemButton[7]];
            self.btnFlag2 = 4;
            _clickButton8 = 1;
            break;
        default:
            break;
    }
    
    switch (self.tryFlag3) {
        case 1:
            [itemButton[8] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
            [scrollView addSubview:itemButton[8]];
            self.btnFlag3 = 1;
            _clickButton9 = 1;
            break;
        case 2:
            [itemButton[9] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
            [scrollView addSubview:itemButton[9]];
            self.btnFlag3 = 2;
            _clickButton10 = 1;
            break;
        case 3:
            [itemButton[10] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
            [scrollView addSubview:itemButton[10]];
            self.btnFlag3 = 3;
            _clickButton11 = 1;
            break;
        case 4:
            [itemButton[11] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
            [scrollView addSubview:itemButton[11]];
            self.btnFlag3 = 4;
            _clickButton12 = 1;
            break;
        default:
            break;
    }

    //購入ボタンの実装
    UIButton *kounyuuBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    kounyuuBtn.userInteractionEnabled = YES;
    kounyuuBtn.frame = CGRectMake(220, 490, 75, 75);
    [kounyuuBtn setImage:[UIImage imageNamed:@"kart-button.png"] forState:UIControlStateNormal];
    [kounyuuBtn addTarget:self action:@selector(kounyuu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:kounyuuBtn];


    //試着ボタンの実装
    UIButton *sisyakuBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    sisyakuBtn.userInteractionEnabled = YES;
    sisyakuBtn.frame = CGRectMake(120, 490, 75, 75);
    [sisyakuBtn setImage:[UIImage imageNamed:@"kigae-button.png"] forState:UIControlStateNormal];
    [sisyakuBtn addTarget:self action:@selector(sityaku:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sisyakuBtn];


    //戻るボタンの実装
    UIButton *modoruBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    modoruBtn.userInteractionEnabled = YES;
    modoruBtn.frame = CGRectMake(20, 490, 75, 75);
    
     //   NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
     //   [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    
    [modoruBtn setImage:[UIImage imageNamed:@"modoru-button.png"] forState:UIControlStateNormal];
    [modoruBtn addTarget:self action:@selector(modoru:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:modoruBtn];
    
         [self boughtitem];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    pt = [[NSUserDefaults standardUserDefaults] integerForKey:@"reservePoint"];
    NSLog(@"pt %ld",(long)pt);
    
    spend_point = [[NSUserDefaults standardUserDefaults] integerForKey:@"shyouhiPoint"];
    
    [self setIkumou];
}

- (void)setIkumou{
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"limit_ikumou"] != 0) {
        for ( int i = 0; i <= 3; i++) {
            [itemButton[i] setEnabled:NO];
        }
    }else{
        for ( int i = 0; i <= 3; i++) {
            [itemButton[i] setEnabled:YES];
        }
    }
}

- (void)sityaku:(UIButton*)sender {

    [self performSegueWithIdentifier:@"ToTryFittingScreenSegue" sender:self];
}


- (void)kounyuu:(UIButton*)sender {
    
    if (_clickButton1 >= 1) {
        totalpt += 30;
    }else if (_clickButton2 >= 1){
        totalpt +=80;
    }else if (_clickButton3 >= 1){
        totalpt +=180;
    }else if (_clickButton4 >= 1){
        totalpt +=280;
    }
    
    if ((_clickButton5 >= 1)&& (buyFlag[0] == YES)) {
        totalpt += 50;
    }else if ((_clickButton6 >= 1)&& (buyFlag[1] == YES)){
        totalpt +=200;
    }else if ((_clickButton7 >= 1)&& (buyFlag[2] == YES)){
        totalpt +=600;
    }else if ((_clickButton8 >= 1)&& (buyFlag[3] == YES)){
        totalpt +=1200;
    }
    
    if ((_clickButton9 >= 1)&& (buyFlag[4] == YES)) {
        totalpt += 50;
    }else if ((_clickButton10 >= 1)&& (buyFlag[5] == YES)){
        totalpt +=200;
    }else if ((_clickButton11 >= 1)&& (buyFlag[6] == YES)){
        totalpt +=600;
    }else if ((_clickButton12 >= 1)&& (buyFlag[7] == YES)){
        totalpt +=1200;
    }
    
    if ((_clickButton13 >= 1)&& (buyFlag[8] == YES)) {
        totalpt += 50;
    }else if ((_clickButton14 >= 1)&& (buyFlag[9] == YES)){
        totalpt +=200;
    }else if ((_clickButton15 >= 1)&& (buyFlag[10] == YES)){
        totalpt +=600;
    }else if ((_clickButton16 >= 1)&& (buyFlag[11] == YES)){
        totalpt +=1200;
    }
    NSLog(@"totalpt %ld",(long)totalpt);
    
    
    if (pt < totalpt) {
        alert = [[UIAlertView alloc]
                 initWithTitle:@"購入できません"
                 message:@"ポイントが不足しています"
                 delegate:self
                 cancelButtonTitle:@"戻る"
                 otherButtonTitles:nil];
    }else{
        alert = [[UIAlertView alloc]
                          initWithTitle:nil
                          message:nil
                          delegate:self
                          cancelButtonTitle:@"戻る" otherButtonTitles:@"購入する", nil];

    NSString *messageStr = [NSString stringWithFormat:@"本当に購入しますか？\n現在のポイント %ld P - %d P\n残りのポイント %d P",(long)pt,50,50];
    alert.message = messageStr;
    
    }
    [alert show];

}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    //ポイント計算
    pt = pt - totalpt;
    spend_point = spend_point + totalpt;

    switch (buttonIndex) {

        case 1:
            
            if (_clickButton1 >= 1) {
                [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"ikumou_number"];
                [[NSUserDefaults standardUserDefaults] setInteger:7 forKey:@"limit_ikumou"];
                [self setIkumou];
            }else if (_clickButton2 >= 1){
                [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"ikumou_number"];
                [[NSUserDefaults standardUserDefaults] setInteger:7 forKey:@"limit_ikumou"];
                [self setIkumou];
            }else if (_clickButton3 >= 1){
                [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"ikumou_number"];
                [[NSUserDefaults standardUserDefaults] setInteger:7 forKey:@"limit_ikumou"];
                [self setIkumou];
            }else if (_clickButton4 >= 1){
                [[NSUserDefaults standardUserDefaults] setInteger:3 forKey:@"ikumou_number"];
                [[NSUserDefaults standardUserDefaults] setInteger:7 forKey:@"limit_ikumou"];
                [self setIkumou];
            }
            
            if ((_clickButton5 >= 1)&& (buyFlag[0] == YES)) {
                buyFlag[0] = NO;
            }else if ((_clickButton6 >= 1)&& (buyFlag[1] == YES)){
                buyFlag[1] = NO;
            }else if ((_clickButton7 >= 1)&& (buyFlag[2] == YES)){
                buyFlag[2] = NO;
            }else if ((_clickButton8 >= 1)&& (buyFlag[3] == YES)){
                buyFlag[3] = NO;
            }
            
            if ((_clickButton9 >= 1)&& (buyFlag[4] == YES)) {
                totalpt += 50;
            }else if ((_clickButton10 >= 1)&& (buyFlag[5] == YES)){
                totalpt +=200;
            }else if ((_clickButton11 >= 1)&& (buyFlag[6] == YES)){
                totalpt +=600;
            }else if ((_clickButton12 >= 1)&& (buyFlag[7] == YES)){
                totalpt +=1200;
            }
            
            if ((_clickButton13 >= 1)&& (buyFlag[8] == YES)) {
                totalpt += 50;
            }else if ((_clickButton14 >= 1)&& (buyFlag[9] == YES)){
                totalpt +=200;
            }else if ((_clickButton15 >= 1)&& (buyFlag[10] == YES)){
                totalpt +=600;
            }else if ((_clickButton16 >= 1)&& (buyFlag[11] == YES)){
                totalpt +=1200;
            }

            
            [[NSUserDefaults standardUserDefaults] setInteger:pt forKey:@"reservePoint"];
            [[NSUserDefaults standardUserDefaults] setInteger:spend_point forKey:@"shyouhiPoint"];
            
            UIAlertView *alertx = [[UIAlertView alloc]
                     initWithTitle:@"まいどありー"
                     message:@"ご購入ありがとうございました"
                     delegate:self
                     cancelButtonTitle:@"戻る"
                     otherButtonTitles:nil];
            
            //アイテム購入したかの判定
            [self boughtitem];
            
            bought = [NSDictionary dictionaryWithObjectsAndKeys:
                      [NSNumber numberWithInt:clickFlag[0]], @"item01",
                      [NSNumber numberWithInt:clickFlag[1]], @"item02",
                      [NSNumber numberWithInt:clickFlag[2]], @"item03",
                      [NSNumber numberWithInt:clickFlag[3]], @"item04",
                      [NSNumber numberWithInt:clickFlag[4]], @"item05",
                      [NSNumber numberWithInt:clickFlag[5]], @"item06",
                      [NSNumber numberWithInt:clickFlag[6]], @"item07",
                      [NSNumber numberWithInt:clickFlag[7]], @"item08",
                      [NSNumber numberWithInt:clickFlag[8]], @"item09",
                      [NSNumber numberWithInt:clickFlag[9]], @"item10",
                      [NSNumber numberWithInt:clickFlag[10]], @"item11",
                      [NSNumber numberWithInt:clickFlag[11]], @"item12",
                      nil];
            
            [[NSUserDefaults standardUserDefaults] setObject:bought forKey:@"buyType"];
            
            NSLog(@"買ったもの判定3 %@",bought);
            
            [alertx show];
            
            [self setIkumou];
            break;
        }
}


- (void) boughtitem{
    
    
    
    NSDictionary *buy = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"buyType"];
    
    NSNumber *sutu1 = (NSNumber *)[buy valueForKey:@"item01"];
    itemType01 = [sutu1 unsignedIntegerValue];
    
    NSNumber *sutu2 = (NSNumber *)[buy valueForKey:@"item02"];
    itemType02 = [sutu2 unsignedIntegerValue];
    
    NSNumber *sutu3 = (NSNumber *)[buy valueForKey:@"item03"];
    itemType03 = [sutu3 unsignedIntegerValue];
    
    NSNumber *sutu4 = (NSNumber *)[buy valueForKey:@"item04"];
    itemType04 = [sutu4 unsignedIntegerValue];
    
    NSNumber *sutu5 = (NSNumber *)[buy valueForKey:@"item05"];
    itemType05 = [sutu5 unsignedIntegerValue];
    
    NSNumber *sutu6 = (NSNumber *)[buy valueForKey:@"item06"];
    itemType06 = [sutu6 unsignedIntegerValue];
    
    NSNumber *sutu7 = (NSNumber *)[buy valueForKey:@"item07"];
    itemType07 = [sutu7 unsignedIntegerValue];
    
    NSNumber *sutu8 = (NSNumber *)[buy valueForKey:@"item08"];
    itemType08 = [sutu8 unsignedIntegerValue];
    
    NSNumber *sutu9 = (NSNumber *)[buy valueForKey:@"item09"];
    itemType09 = [sutu9 unsignedIntegerValue];
    
    NSNumber *sutu10 = (NSNumber *)[buy valueForKey:@"item10"];
    itemType10 = [sutu10 unsignedIntegerValue];
    
    NSNumber *sutu11 = (NSNumber *)[buy valueForKey:@"item11"];
    itemType11 = [sutu11 unsignedIntegerValue];
    
    NSNumber *sutu12 = (NSNumber *)[buy valueForKey:@"item12"];
    itemType12 = [sutu12 unsignedIntegerValue];
    
    if(itemType01 == 0){
        if(_clickButton5 == 1){
            clickFlag[0] = 1;
            buyLabel[0] = [[UILabel alloc] init];
            buyLabel[0].frame = CGRectMake(370, 150, 150, 20);
            buyLabel[0].text = @"購入済み";
            [scrollView addSubview:buyLabel[0]];
        }else if(_clickButton5 == 0){
            clickFlag[0] = 0;
        }
    }else if(itemType01 == 1){
        if(_clickButton5 == 0){
            clickFlag[0] = 1;
            buyLabel[0] = [[UILabel alloc] init];
            buyLabel[0].frame = CGRectMake(370, 150, 150, 20);
            buyLabel[0].text = @"購入済み";
            [scrollView addSubview:buyLabel[0]];
        }else if(_clickButton5 == 0){
            clickFlag[0] = 1;
            buyLabel[0] = [[UILabel alloc] init];
            buyLabel[0].frame = CGRectMake(370, 150, 150, 20);
            buyLabel[0].text = @"購入済み";
            [scrollView addSubview:buyLabel[0]];
        }
    }
    
    if(itemType02 == 0){
        if(_clickButton6 == 1){
            clickFlag[1] = 1;
            buyLabel[1] = [[UILabel alloc] init];
            buyLabel[1].frame = CGRectMake(370, 300, 150, 20);
            buyLabel[1].text = @"購入済み";
            [scrollView addSubview:buyLabel[1]];
        }else{
            clickFlag[1] = 0;
        }
    }else if(itemType02 == 1){
        if(_clickButton6 == 0){
            clickFlag[1] = 1;
            buyLabel[1] = [[UILabel alloc] init];
            buyLabel[1].frame = CGRectMake(370, 300, 150, 20);
            buyLabel[1].text = @"購入済み";
            [scrollView addSubview:buyLabel[1]];
        }else{
            clickFlag[1] = 1;
            buyLabel[1] = [[UILabel alloc] init];
            buyLabel[1].frame = CGRectMake(370, 300, 150, 20);
            buyLabel[1].text = @"購入済み";
            [scrollView addSubview:buyLabel[1]];
        }
    }
    
    if(itemType03 == 0){
        if(_clickButton7 == 1){
            clickFlag[2] = 1;
            buyLabel[2] = [[UILabel alloc] init];
            buyLabel[2].frame = CGRectMake(510, 150, 150, 20);
            buyLabel[2].text = @"購入済み";
            [scrollView addSubview:buyLabel[2]];
        }else{
            clickFlag[2] = 0;
        }
    }else if(itemType03 == 1){
        if(_clickButton7 == 0){
            clickFlag[2] = 1;
            buyLabel[2] = [[UILabel alloc] init];
            buyLabel[2].frame = CGRectMake(510, 150, 150, 20);
            buyLabel[2].text = @"購入済み";
            [scrollView addSubview:buyLabel[2]];
        }else{
            clickFlag[2] = 1;
            buyLabel[2] = [[UILabel alloc] init];
            buyLabel[2].frame = CGRectMake(510, 150, 150, 20);
            buyLabel[2].text = @"購入済み";
            [scrollView addSubview:buyLabel[2]];
        }
    }
    
    if(itemType04 == 0){
        if(_clickButton8 == 1){
            clickFlag[3] = 1;
            buyLabel[3] = [[UILabel alloc] init];
            buyLabel[3].frame = CGRectMake(510, 300, 150, 20);
            buyLabel[3].text = @"購入済み";
            [scrollView addSubview:buyLabel[3]];
        }else{
            clickFlag[3] = 0;
        }
    }else if(itemType04 == 1){
        if(_clickButton8 == 0){
            clickFlag[3] = 1;
            buyLabel[3] = [[UILabel alloc] init];
            buyLabel[3].frame = CGRectMake(510, 300, 150, 20);
            buyLabel[3].text = @"購入済み";
            [scrollView addSubview:buyLabel[3]];
        }else{
            clickFlag[3] = 1;
            buyLabel[3] = [[UILabel alloc] init];
            buyLabel[3].frame = CGRectMake(510, 300, 150, 20);
            buyLabel[3].text = @"購入済み";
            [scrollView addSubview:buyLabel[3]];
        }
    }
    
    if(itemType05 == 0){
        if(_clickButton9 == 1){
            clickFlag[4] = 1;
            buyLabel[4] = [[UILabel alloc] init];
            buyLabel[4].frame = CGRectMake(700, 150, 150, 20);
            buyLabel[4].text = @"購入済み";
            [scrollView addSubview:buyLabel[4]];
        }else{
            clickFlag[4] = 0;
        }
    }else if(itemType05 == 1){
        if(_clickButton9 == 0){
            clickFlag[4] = 1;
            buyLabel[4] = [[UILabel alloc] init];
            buyLabel[4].frame = CGRectMake(700, 150, 150, 20);
            buyLabel[4].text = @"購入済み";
            [scrollView addSubview:buyLabel[4]];
        }else{
            clickFlag[4] = 1;
            buyLabel[4] = [[UILabel alloc] init];
            buyLabel[4].frame = CGRectMake(700, 150, 150, 20);
            buyLabel[4].text = @"購入済み";
            [scrollView addSubview:buyLabel[4]];
        }
    }
    
    if(itemType06 == 0){
        if(_clickButton10 == 1){
            clickFlag[5] = 1;
            buyLabel[5] = [[UILabel alloc] init];
            buyLabel[5].frame = CGRectMake(700, 300, 150, 20);
            buyLabel[5].text = @"購入済み";
            [scrollView addSubview:buyLabel[5]];
        }else{
            clickFlag[5] = 0;
        }
    }else if(itemType06 == 1){
        if(_clickButton10 == 0){
            clickFlag[5] = 1;
            buyLabel[5] = [[UILabel alloc] init];
            buyLabel[5].frame = CGRectMake(700, 300, 150, 20);
            buyLabel[5].text = @"購入済み";
            [scrollView addSubview:buyLabel[5]];
        }else{
            clickFlag[5] = 1;
            buyLabel[5] = [[UILabel alloc] init];
            buyLabel[5].frame = CGRectMake(700, 300, 150, 20);
            buyLabel[5].text = @"購入済み";
            [scrollView addSubview:buyLabel[5]];
        }
    }
    
    if(itemType07 == 0){
        if(_clickButton11 == 1){
            clickFlag[6] = 1;
            buyLabel[6] = [[UILabel alloc] init];
            buyLabel[6].frame = CGRectMake(840, 150, 150, 20);
            buyLabel[6].text = @"購入済み";
            [scrollView addSubview:buyLabel[6]];
        }else{
            clickFlag[6] = 0;
        }
    }else if(itemType07 == 1){
        if(_clickButton11 == 0){
            clickFlag[6] = 1;
            buyLabel[6] = [[UILabel alloc] init];
            buyLabel[6].frame = CGRectMake(840, 150, 150, 20);
            buyLabel[6].text = @"購入済み";
            [scrollView addSubview:buyLabel[6]];
        }else{
            clickFlag[6] = 1;
            buyLabel[6] = [[UILabel alloc] init];
            buyLabel[6].frame = CGRectMake(840, 150, 150, 20);
            buyLabel[6].text = @"購入済み";
            [scrollView addSubview:buyLabel[6]];
        }
    }
    
    if(itemType08 == 0){
        if(_clickButton12 == 1){
            clickFlag[7] = 1;
            buyLabel[7] = [[UILabel alloc] init];
            buyLabel[7].frame = CGRectMake(840, 300, 150, 20);
            buyLabel[7].text = @"購入済み";
            [scrollView addSubview:buyLabel[7]];
        }else{
            clickFlag[7] = 0;
        }
    }else if(itemType08 == 1){
        if(_clickButton12 == 0){
            clickFlag[7] = 1;
            buyLabel[7] = [[UILabel alloc] init];
            buyLabel[7].frame = CGRectMake(840, 300, 150, 20);
            buyLabel[7].text = @"購入済み";
            [scrollView addSubview:buyLabel[7]];
        }else{
            clickFlag[7] = 1;
            buyLabel[7] = [[UILabel alloc] init];
            buyLabel[7].frame = CGRectMake(840, 300, 150, 20);
            buyLabel[7].text = @"購入済み";
            [scrollView addSubview:buyLabel[7]];
        }
    }
    
    if(itemType09 == 0){
        if(_clickButton13 == 1){
            clickFlag[8] = 1;
            buyLabel[8] = [[UILabel alloc] init];
            buyLabel[8].frame = CGRectMake(1030, 150, 150, 20);
            buyLabel[8].text = @"購入済み";
            [scrollView addSubview:buyLabel[8]];
        }else{
            clickFlag[8] = 0;
        }
    }else if(itemType09 == 1){
        if(_clickButton13 == 0){
            clickFlag[8] = 1;
            buyLabel[8] = [[UILabel alloc] init];
            buyLabel[8].frame = CGRectMake(1030, 150, 150, 20);
            buyLabel[8].text = @"購入済み";
            [scrollView addSubview:buyLabel[8]];
        }else{
            clickFlag[8] = 1;
            buyLabel[8] = [[UILabel alloc] init];
            buyLabel[8].frame = CGRectMake(1030, 150, 150, 20);
            buyLabel[8].text = @"購入済み";
            [scrollView addSubview:buyLabel[8]];
        }
    }
    
    if(itemType10 == 0){
        if(_clickButton14 == 1){
            clickFlag[9] = 1;
            buyLabel[9] = [[UILabel alloc] init];
            buyLabel[9].frame = CGRectMake(1030, 300, 150, 20);
            buyLabel[9].text = @"購入済み";
            [scrollView addSubview:buyLabel[9]];
        }else{
            clickFlag[9] = 0;
        }
    }else if(itemType10 == 1){
        if(_clickButton14 == 0){
            clickFlag[9] = 1;
            buyLabel[9] = [[UILabel alloc] init];
            buyLabel[9].frame = CGRectMake(1030, 300, 150, 20);
            buyLabel[9].text = @"購入済み";
            [scrollView addSubview:buyLabel[9]];
        }else{
            clickFlag[9] = 1;
            buyLabel[9] = [[UILabel alloc] init];
            buyLabel[9].frame = CGRectMake(1030, 300, 150, 20);
            buyLabel[9].text = @"購入済み";
            [scrollView addSubview:buyLabel[9]];
        }
    }
    
    if(itemType11 == 0){
        if(_clickButton15 == 1){
            clickFlag[10] = 1;
            buyLabel[10] = [[UILabel alloc] init];
            buyLabel[10].frame = CGRectMake(1150, 150, 150, 20);
            buyLabel[10].text = @"購入済み";
            [scrollView addSubview:buyLabel[10]];
        }else{
            clickFlag[10] = 0;
        }
    }else if(itemType11 == 1){
        if(_clickButton15 == 0){
            clickFlag[10] = 1;
            buyLabel[10] = [[UILabel alloc] init];
            buyLabel[10].frame = CGRectMake(1150, 150, 150, 20);
            buyLabel[10].text = @"購入済み";
            [scrollView addSubview:buyLabel[10]];
        }else{
            clickFlag[10] = 1;
            buyLabel[10] = [[UILabel alloc] init];
            buyLabel[10].frame = CGRectMake(1150, 150, 150, 20);
            buyLabel[10].text = @"購入済み";
            [scrollView addSubview:buyLabel[10]];
        }
    }
    
    if(itemType12 == 0){
        if(_clickButton16 == 1){
            clickFlag[11] = 1;
            buyLabel[11] = [[UILabel alloc] init];
            buyLabel[11].frame = CGRectMake(1150, 300, 150, 20);
            buyLabel[11].text = @"購入済み";
            [scrollView addSubview:buyLabel[11]];
        }else{
            clickFlag[11] = 0;
        }
    }else if(itemType12 == 1){
        if(_clickButton16 == 0){
            clickFlag[11] = 1;
            buyLabel[11] = [[UILabel alloc] init];
            buyLabel[11].frame = CGRectMake(1150, 300, 150, 20);
            buyLabel[11].text = @"購入済み";
            [scrollView addSubview:buyLabel[11]];
        }else{
            clickFlag[11] = 1;
            buyLabel[11] = [[UILabel alloc] init];
            buyLabel[11].frame = CGRectMake(1150, 300, 150, 20);
            buyLabel[11].text = @"購入済み";
            [scrollView addSubview:buyLabel[11]];

        }
    }
    
}

- (void)modoru:(UIButton*)sender {
    //この画面を削除して戻る
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (void)scrollViewDidScroll:(UIScrollView *)sender {
    CGFloat pageWidth = scrollView.frame.size.width;
    if (fmod(scrollView.contentOffset.x , pageWidth) == 0.0) {
        pageControl.currentPage = scrollView.contentOffset.x / pageWidth;
    }
}

//タイプフラグが１のときの動作
- (void)item01Buttom:(UIButton *)button {

    _clickButton1 = _clickButton1 % 2;

    if (_clickButton1 == 0) {
        [itemButton[0] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[0]];

        [itemButton[1] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[1]];
        [itemButton[2] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[2]];
        [itemButton[3] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[3]];
        _clickButton2 = 0;
        _clickButton3 = 0;
        _clickButton4 = 0;
        self.btnFlag1 = 1;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[0] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[0]];
        self.btnFlag1 = 0;
    }
    _clickButton1++;
    NSLog(@"click %d",_clickButton1);
}


- (void)item02Buttom:(UIButton *)button {

    _clickButton2 = _clickButton2 % 2;

    if (_clickButton2 == 0) {
        [itemButton[0] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[0]];
        [itemButton[1] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[1]];
        [itemButton[2] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[2]];
        [itemButton[3] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[3]];
        _clickButton1 = 0;
        _clickButton3 = 0;
        _clickButton4 = 0;
        self.btnFlag1 = 2;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[3] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[3]];
        self.btnFlag1 = 0;
    }
    _clickButton2++;
}

- (void)item03Buttom:(UIButton *)button {

    _clickButton3 = _clickButton3 % 2;

    if (_clickButton3 == 0) {
        [itemButton[0] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[0]];
        [itemButton[1] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[1]];
        [itemButton[2] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[2]];
        [itemButton[3] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[3]];
        _clickButton1 = 0;
        _clickButton2 = 0;
        _clickButton4 = 0;
        self.btnFlag1 = 3;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[2] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[2]];
        self.btnFlag1 = 0;
    }
    _clickButton3++;
}

- (void)item04Buttom:(UIButton *)button {

    _clickButton4 = _clickButton4 % 2;

    if (_clickButton4 == 0) {
        [itemButton[0] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[0]];
        [itemButton[1] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[1]];
        [itemButton[2] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[2]];
        [itemButton[3] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[3]];
        _clickButton1 = 0;
        _clickButton2 = 0;
        _clickButton3 = 0;
        self.btnFlag1 = 4;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[3] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[3]];
        self.btnFlag1 = 0;
    }

    _clickButton4++;
}

- (void)item05Buttom:(UIButton *)button {

    _clickButton5 = _clickButton5 % 2;

    if (_clickButton5 == 0) {
        [itemButton[4] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[4]];

        [itemButton[5] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[5]];
        [itemButton[6] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[6]];
        [itemButton[7] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[7]];
        _clickButton6 = 0;
        _clickButton7 = 0;
        _clickButton8 = 0;
        self.btnFlag2 = 1;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[4] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[4]];
        self.btnFlag2 = 0;
    }
    _clickButton5++;
}

- (void)item06Buttom:(UIButton *)button {

    _clickButton6 = _clickButton6 % 2;

    if (_clickButton6 == 0) {
        [itemButton[4] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[4]];
        [itemButton[5] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[5]];
        [itemButton[6] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[6]];
        [itemButton[7] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[7]];
        _clickButton5 = 0;
        _clickButton7 = 0;
        _clickButton8 = 0;
        self.btnFlag2 = 2;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[5] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[5]];
        self.btnFlag2 = 0;
    }
    _clickButton6++;
}

- (void)item07Buttom:(UIButton *)button {
    _clickButton7 = _clickButton7 % 2;

    if (_clickButton7 == 0) {
        [itemButton[4] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[4]];
        [itemButton[5] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[5]];
        [itemButton[6] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[6]];
        [itemButton[7] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[7]];
        _clickButton5 = 0;
        _clickButton6 = 0;
        _clickButton8 = 0;
        self.btnFlag2 = 3;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[6] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[6]];
        self.btnFlag2 = 0;
    }
    _clickButton7++;
}

- (void)item08Buttom:(UIButton *)button {
    _clickButton8 = _clickButton8 % 2;

    if (_clickButton8 == 0) {
        [itemButton[4] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[4]];
        [itemButton[5] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[5]];
        [itemButton[6] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[6]];
        [itemButton[7] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[7]];
        _clickButton5 = 0;
        _clickButton6 = 0;
        _clickButton7 = 0;
        self.btnFlag2 = 4;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[7] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[7]];
        self.btnFlag2 = 0;
    }
    _clickButton8++;
}

- (void)item09Buttom:(UIButton *)button {
    _clickButton9 = _clickButton9 % 2;

    if (_clickButton9 == 0) {
        [itemButton[8] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[8]];
        [itemButton[9] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[9]];
        [itemButton[10] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[10]];
        [itemButton[11] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[11]];
        _clickButton10 = 0;
        _clickButton11 = 0;
        _clickButton12 = 0;
        self.btnFlag3 = 1;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[8] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[8]];
        self.btnFlag3 = 0;
    }
    _clickButton9++;
}

- (void)item10Buttom:(UIButton *)button {
    _clickButton10 = _clickButton10 % 2;

    if (_clickButton10 == 0) {
        [itemButton[8] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[8]];
        [itemButton[9] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[9]];
        [itemButton[10] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[10]];
        [itemButton[11] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[11]];
        _clickButton9 = 0;
        _clickButton11 = 0;
        _clickButton12 = 0;
        self.btnFlag3 = 2;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[9] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[9]];
        self.btnFlag3 = 0;
    }
    _clickButton10++;
}

- (void)item11Buttom:(UIButton *)button {
    _clickButton11 = _clickButton11 % 2;

    if (_clickButton11 == 0) {
        [itemButton[8] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[8]];
        [itemButton[9] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[9]];
        [itemButton[10] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[10]];
        [itemButton[11] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[11]];
        _clickButton9 = 0;
        _clickButton10 = 0;
        _clickButton12 = 0;
        self.btnFlag3 = 3;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[10] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[10]];
        self.btnFlag3 = 0;
    }
    _clickButton11++;
}

- (void)item12Buttom:(UIButton *)button {
    _clickButton12 = _clickButton12 % 2;

    if (_clickButton12 == 0) {
        [itemButton[8] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[8]];
        [itemButton[9] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[9]];
        [itemButton[10] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[10]];
        [itemButton[11] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[11]];
        _clickButton9 = 0;
        _clickButton10 = 0;
        _clickButton11 = 0;
        self.btnFlag3 = 4;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[11] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[11]];
        self.btnFlag3 = 0;
    }
    _clickButton12++;
}

- (void)item13Buttom:(UIButton *)button {
    _clickButton13 = _clickButton13 % 2;

    if (_clickButton13 == 0) {
        [itemButton[12] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[12]];
        [itemButton[13] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[13]];
        [itemButton[14] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[14]];
        [itemButton[15] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[15]];
        _clickButton14 = 0;
        _clickButton15 = 0;
        _clickButton16 = 0;
        self.btnFlag4 = 1;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[12] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[12]];
        self.btnFlag4 = 0;
    }
    _clickButton13++;
}

- (void)item14Buttom:(UIButton *)button {
    _clickButton14 = _clickButton14 % 2;

    if (_clickButton14 == 0) {
        [itemButton[12] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[12]];
        [itemButton[13] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[13]];
        [itemButton[14] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[14]];
        [itemButton[15] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[15]];
        _clickButton13 = 0;
        _clickButton15 = 0;
        _clickButton16 = 0;
        self.btnFlag4 = 2;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[13] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[13]];
        self.btnFlag4 = 0;
    }
    _clickButton14++;
}

- (void)item15Buttom:(UIButton *)button {
    _clickButton15 = _clickButton15 % 2;

    if (_clickButton15 == 0) {
        [itemButton[12] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[12]];
        [itemButton[13] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[13]];
        [itemButton[14] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[14]];
        [itemButton[15] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[15]];
        _clickButton13 = 0;
        _clickButton14 = 0;
        _clickButton16 = 0;
        self.btnFlag4 = 3;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[14] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[14]];
        self.btnFlag4 = 0;
    }
    _clickButton15++;
}

- (void)item16Buttom:(UIButton *)button {
    _clickButton16 = _clickButton16 % 2;

    if (_clickButton16 == 0) {
        [itemButton[12] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[12]];
        [itemButton[13] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[13]];
        [itemButton[14] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[14]];
        [itemButton[15] setBackgroundImage:itemImage[1] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[15]];
        _clickButton13 = 0;
        _clickButton14 = 0;
        _clickButton15 = 0;
        self.btnFlag4 = 4;
        NSLog(@"%d", _btnFlag1);
        NSLog(@"%d", _btnFlag2);
        NSLog(@"%d", _btnFlag3);
        NSLog(@"%d", _btnFlag4);

    }else{
        [itemButton[15] setBackgroundImage:itemImage[0] forState:UIControlStateNormal];
        [scrollView addSubview:itemButton[15]];
        self.btnFlag4 = 0;
    }
    _clickButton16++;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    //2つ目の画面にパラメータを渡して遷移する
    if ([segue.identifier isEqualToString:@"ToTryFittingScreenSegue"]) {
        //ここでパラメータを渡す
        TryFittingScreen *tryFittingScreen = segue.destinationViewController;
        tryFittingScreen.btnFlag1 = _btnFlag1;
        tryFittingScreen.btnFlag2 = _btnFlag2;
        tryFittingScreen.btnFlag3 = _btnFlag3;
        tryFittingScreen.btnFlag4 = _btnFlag4;
    }
}


@end
