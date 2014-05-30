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
    
    UIButton *kounyuuBtn;
    
    //アイテム画像
    UIImage *itemImage[16];
    UIImage *image[4];
    NSString *itemName[16];
    
    NSString *boughtitem[12];
    NSString *imageName[4];
    NSInteger itemType[12];
    
    UIButton *itemButton[16];
    
    NSInteger genzaiPointToFlag;
    NSInteger siyouPointToFlag;
    NSInteger nokoriPointToFlag;
    
    UIImageView *imageView[4];
    
    NSInteger sutupt;
    NSInteger nectaipt;
    NSInteger meganept;
    NSInteger ikumoupt;
    NSNumber *sutu[12];
    
    //保持ポイント
    NSInteger pt;
    //合計の値段
    NSInteger totalpt;
    //今までの消費ポイント
    NSInteger spend_point;
    
    NSInteger differencept;
    
    UIAlertView *alert;
    
    UILabel *totalPointLabel;
    UILabel *itemPointLabel[4][4];
    UILabel *buyLabel[12];
    
    CGRect rect[4];
    
    BOOL buyFlag[12];
    
    NSDictionary *bought;
    int clickFlag[12];
    UIImage *yajirushiImage;
    UIImage *selectStampImage;
    UIImage *soldOutImage;
    UIImageView *itemPlateName[16];
    UIImageView *selectStampImageView[16];
    UIImageView *soldOutImageView[4];
    UIImageView *yajirushiImageView[16];
    UIImageView *boughtItemImageView[12];
}

@synthesize tryFlag1 = _tryFlag1;
@synthesize tryFlag2 = _tryFlag2;
@synthesize tryFlag3 = _tryFlag3;
@synthesize tryFlag4 = _tryFlag4;

const CGFloat kScrollObjHeight =  438.0;//(※1)1pageの高さ
const CGFloat kScrollObjWidth  = 320.0;//(※2)1pageの幅
const NSUInteger kNumImages    = 4;    //(※3)総page数

NSInteger SUTU_WIDTH = 110;
NSInteger SUTU_HEIGTH = 60;

NSInteger NECTAI_WIDTH = 40;
NSInteger NECTAI_HEIGTH = 70;

NSInteger MEGANE_WIDTH = 100;
NSInteger MEGANE_HEIGTH = 40;

NSInteger BOUGHT_WIDTH = 91;
NSInteger BOUGHT_HEIGTH = 35;

NSInteger RED_WAKU_WIDTH = 115;
NSInteger RED_WAKU_HEIGTH = 113;


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
    
    for (int i =0; i <= 11; i++) {
        clickFlag[i] = 0;
    }
    
    //フレームサイズを取得する
    UIImage *backPicture =[UIImage imageNamed:@"shop-bg.png"];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [backPicture drawInRect:self.view.bounds];
    UIImage *BackPicture = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:BackPicture];
    
    imageName[0] = [NSString stringWithFormat:@"shop-bg-ikumouzai.png"];
    imageName[1] = [NSString stringWithFormat:@"shop-sutu.png"];
    imageName[2] = [NSString stringWithFormat:@"shop-bg-nekutai.png"];
    imageName[3] = [NSString stringWithFormat:@"shop-bg-megane.png"];
    
    for (int i=0; i <=3; i++) {
        image[i] = [UIImage imageNamed:imageName[i]];
        imageView[i] = [[UIImageView alloc] initWithImage:image[i]];
        rect[i] = imageView[i].frame;
        rect[i].size.height = kScrollObjHeight;
        rect[i].size.width = kScrollObjWidth;
        imageView[i].frame = rect[i];
        imageView[i].tag = i + 1;
        [scrollView addSubview:imageView[i]];
    }
    
    [self layoutScrollImages];
    
    [self.view addSubview:pageControl];
    
    // アイテムの種類の画像
    
    itemName[0] = @"ikumouzai-ao.png";
    itemName[1] = @"ikumouzai-midori.png";
    itemName[2] = @"ikumouzai-kuro.png";
    itemName[3] = @"ikumouzai-aka.png";
    itemName[4] = @"sutu01.png";
    itemName[5] = @"sutu2.png";
    itemName[6] = @"sutu03.png";
    itemName[7] = @"sutu04.png";
    itemName[8] = @"nectai1.png";
    itemName[9] = @"nectai2.png";
    itemName[10] = @"nectai3.png";
    itemName[11] = @"nectai4.png";
    itemName[12] = @"megane-03.png";
    itemName[13] = @"megane02.png";
    itemName[14] = @"megane03.png";
    itemName[15] = @"megane04.png";
    
    selectStampImage = [UIImage imageNamed:@"shop-waku-red.png"];
    
    for (int i=0; i <=15; i++) {
        selectStampImageView[i] = [[UIImageView alloc] initWithImage:selectStampImage];
        selectStampImageView[i].tag = i +10;
    }
    
    //育毛剤売り切れ表示
    
    soldOutImage = [UIImage imageNamed:@"urikire.png"];
    
    for (int i=0; i <=3; i++) {
        soldOutImageView[i] = [[UIImageView alloc] initWithImage:soldOutImage];
        soldOutImageView[i].tag = i +30;
    }
    
    yajirushiImage = [UIImage imageNamed:@"kore-yajirushi.png"];
    
    for (int i=0; i <=11; i++) {
        yajirushiImageView[i] = [[UIImageView alloc] initWithImage:yajirushiImage];
        yajirushiImageView[i].tag = 34 +i;
    }
    
    for (int i= 0 ; i <=15; i++) {
        itemImage[i] = [UIImage imageNamed:itemName[i]];
    }
    
    pt = [[NSUserDefaults standardUserDefaults] integerForKey:@"reservePoint"];
    
    totalpt = ikumoupt + sutupt + nectaipt + meganept;
    
    differencept = pt - totalpt;
    
    totalPointLabel = [[UILabel alloc] init];
    totalPointLabel.frame = CGRectMake(30, 12, 300, 40);
    totalPointLabel.font = [UIFont boldSystemFontOfSize:25];
    totalPointLabel.text = [NSString stringWithFormat:@"所持ポイント　%ld P", (long)differencept];
    
    [self.view addSubview:totalPointLabel];
    
    //アイテムボタンの生成
    for (int i = 0;  i <= 15; i++) {
        itemButton[i]=[UIButton buttonWithType:UIButtonTypeCustom];
        [itemButton[i] setBackgroundImage:itemImage[i] forState:UIControlStateNormal];
    }
    
    [itemButton[0] setFrame:CGRectMake(82,120,42,88)];
    [itemButton[0] addTarget:self action:@selector(item01Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[1] setFrame:CGRectMake(209,125,42,88)];
    [itemButton[1] addTarget:self action:@selector(item02Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[2] setFrame:CGRectMake(89,270,28,85)];
    [itemButton[2] addTarget:self action:@selector(item03Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[3] setFrame:CGRectMake(214,260,32,92)];
    [itemButton[3] addTarget:self action:@selector(item04Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[4] setFrame:CGRectMake(370,150,SUTU_WIDTH,SUTU_HEIGTH)];
    [itemButton[4] addTarget:self action:@selector(item05Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[5] setFrame:CGRectMake(490,150,SUTU_WIDTH,SUTU_HEIGTH)];
    [itemButton[5] addTarget:self action:@selector(item06Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[6] setFrame:CGRectMake(370,295,SUTU_WIDTH,SUTU_HEIGTH)];
    [itemButton[6] addTarget:self action:@selector(item07Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[7] setFrame:CGRectMake(490,295,SUTU_WIDTH,SUTU_HEIGTH)];
    [itemButton[7] addTarget:self action:@selector(item08Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[8] setFrame:CGRectMake(725,135,NECTAI_WIDTH,NECTAI_HEIGTH)];
    [itemButton[8] addTarget:self action:@selector(item09Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[9] setFrame:CGRectMake(845,135,NECTAI_WIDTH,NECTAI_HEIGTH)];
    [itemButton[9] addTarget:self action:@selector(item10Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[10] setFrame:CGRectMake(725,282,NECTAI_WIDTH,NECTAI_HEIGTH)];
    [itemButton[10] addTarget:self action:@selector(item11Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[11] setFrame:CGRectMake(845,282,NECTAI_WIDTH,NECTAI_HEIGTH)];
    [itemButton[11] addTarget:self action:@selector(item12Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[12] setFrame:CGRectMake(1010,168,MEGANE_WIDTH,MEGANE_HEIGTH)];
    [itemButton[12] addTarget:self action:@selector(item13Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[13] setFrame:CGRectMake(1140,168,MEGANE_WIDTH,MEGANE_HEIGTH)];
    [itemButton[13] addTarget:self action:@selector(item14Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[14] setFrame:CGRectMake(1010,320,MEGANE_WIDTH,30)];
    [itemButton[14] addTarget:self action:@selector(item15Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    [itemButton[15] setFrame:CGRectMake(1140,320,MEGANE_WIDTH,30)];
    [itemButton[15] addTarget:self action:@selector(item16Buttom:) forControlEvents:UIControlEventTouchUpInside];
    
    for (int i = 0;  i <= 15; i++) {
        [scrollView addSubview:itemButton[i]];
    }
    
    UIImage *boughtItem = [UIImage imageNamed:@"bought.png"];
    
    boughtItemImageView[0] = [[UIImageView alloc] initWithImage:boughtItem];
    [boughtItemImageView[0] setFrame:CGRectMake(380,205,BOUGHT_WIDTH,BOUGHT_HEIGTH)];
    
    boughtItemImageView[1] = [[UIImageView alloc] initWithImage:boughtItem];
    [boughtItemImageView[1] setFrame:CGRectMake(500,205,BOUGHT_WIDTH,BOUGHT_HEIGTH)];
    
    boughtItemImageView[2] = [[UIImageView alloc] initWithImage:boughtItem];
    [boughtItemImageView[2] setFrame:CGRectMake(380,350,BOUGHT_WIDTH,BOUGHT_HEIGTH)];
    
    boughtItemImageView[3] = [[UIImageView alloc] initWithImage:boughtItem];
    [boughtItemImageView[3] setFrame:CGRectMake(500,350,BOUGHT_WIDTH,BOUGHT_HEIGTH)];
    
    boughtItemImageView[4] = [[UIImageView alloc] initWithImage:boughtItem];
    [boughtItemImageView[4] setFrame:CGRectMake(700,205,BOUGHT_WIDTH,BOUGHT_HEIGTH)];
    
    boughtItemImageView[5] = [[UIImageView alloc] initWithImage:boughtItem];
    [boughtItemImageView[5] setFrame:CGRectMake(820,205,BOUGHT_WIDTH,BOUGHT_HEIGTH)];
    
    boughtItemImageView[6] = [[UIImageView alloc] initWithImage:boughtItem];
    [boughtItemImageView[6] setFrame:CGRectMake(700,350,BOUGHT_WIDTH,BOUGHT_HEIGTH)];
    
    boughtItemImageView[7] = [[UIImageView alloc] initWithImage:boughtItem];
    [boughtItemImageView[7] setFrame:CGRectMake(820,350,BOUGHT_WIDTH,BOUGHT_HEIGTH)];
    
    boughtItemImageView[8] = [[UIImageView alloc] initWithImage:boughtItem];
    [boughtItemImageView[8] setFrame:CGRectMake(1016,205,BOUGHT_WIDTH,BOUGHT_HEIGTH)];
    
    boughtItemImageView[9] = [[UIImageView alloc] initWithImage:boughtItem];
    [boughtItemImageView[9] setFrame:CGRectMake(1146,205,BOUGHT_WIDTH,BOUGHT_HEIGTH)];
    
    boughtItemImageView[10] = [[UIImageView alloc] initWithImage:boughtItem];
    [boughtItemImageView[10] setFrame:CGRectMake(1016,350,BOUGHT_WIDTH,BOUGHT_HEIGTH)];
    
    boughtItemImageView[11] = [[UIImageView alloc] initWithImage:boughtItem];
    [boughtItemImageView[11] setFrame:CGRectMake(1146,350,BOUGHT_WIDTH,BOUGHT_HEIGTH)];
    
    //ポイントラベル
    for (int j = 0; j <= 3; j++) {
        for (int i = 0;  i <= 3; i++) {
            itemPointLabel[j][i] = [[UILabel alloc] init];
        }
    }
    
    itemPointLabel[0][0].frame = CGRectMake(87, 205, 150, 20);
    itemPointLabel[0][0].text = @"P:30";
    
    itemPointLabel[0][1].frame = CGRectMake(210, 205, 150, 20);
    itemPointLabel[0][1].text = @"P:80";
    
    itemPointLabel[0][2].frame = CGRectMake(87, 350, 150, 20);
    itemPointLabel[0][2].text = @"P:180";
    
    itemPointLabel[0][3].frame = CGRectMake(210, 350, 150, 20);
    itemPointLabel[0][3].text = @"P:330";
    
    itemPointLabel[1][0].frame = CGRectMake(405, 205, 150, 20);
    itemPointLabel[1][0].text = @"P:50";
    
    itemPointLabel[1][1].frame = CGRectMake(522, 205, 150, 20);
    itemPointLabel[1][1].text = @"P:200";
    
    itemPointLabel[1][2].frame = CGRectMake(400, 350, 150, 20);
    itemPointLabel[1][2].text = @"P:600";
    
    itemPointLabel[1][3].frame = CGRectMake(520, 350, 150, 20);
    itemPointLabel[1][3].text = @"P:1200";
    
    itemPointLabel[2][0].frame = CGRectMake(727, 205, 150, 20);
    itemPointLabel[2][0].text = @"P:50";
    
    itemPointLabel[2][1].frame = CGRectMake(840, 205, 150, 20);
    itemPointLabel[2][1].text = @"P:200";
    
    itemPointLabel[2][2].frame = CGRectMake(722, 350, 150, 20);
    itemPointLabel[2][2].text = @"P:600";
    
    itemPointLabel[2][3].frame = CGRectMake(838, 350, 150, 20);
    itemPointLabel[2][3].text = @"P:1200";
    
    itemPointLabel[3][0].frame = CGRectMake(1045, 205, 150, 20);
    itemPointLabel[3][0].text = @"P:50";
    
    itemPointLabel[3][1].frame = CGRectMake(1172, 205, 150, 20);
    itemPointLabel[3][1].text = @"P:200";
    
    itemPointLabel[3][2].frame = CGRectMake(1042, 350, 150, 20);
    itemPointLabel[3][2].text = @"P:600";
    
    itemPointLabel[3][3].frame = CGRectMake(1167, 350, 150, 20);
    itemPointLabel[3][3].text = @"P:1200";
    
    
    UIImage *itemPlate = [UIImage imageNamed:@"nehuda.png"];
    
    for (int i = 0;  i <= 15; i++) {
        itemPlateName[i] = [[UIImageView alloc] initWithImage:itemPlate];
    }
    
    [itemPlateName[0] setFrame:CGRectMake(60,205,91,22)];
    [itemPlateName[1] setFrame:CGRectMake(185,205,91,22)];
    [itemPlateName[2] setFrame:CGRectMake(60,350,91,22)];
    [itemPlateName[3] setFrame:CGRectMake(185,350,91,22)];
    [itemPlateName[4] setFrame:CGRectMake(380,205,91,22)];
    [itemPlateName[5] setFrame:CGRectMake(500,205,91,22)];
    [itemPlateName[6] setFrame:CGRectMake(380,350,91,22)];
    [itemPlateName[7] setFrame:CGRectMake(500,350,91,22)];
    [itemPlateName[8] setFrame:CGRectMake(700,205,91,22)];
    [itemPlateName[9] setFrame:CGRectMake(820,205,91,22)];
    [itemPlateName[10] setFrame:CGRectMake(700,350,91,22)];
    [itemPlateName[11] setFrame:CGRectMake(820,350,91,22)];
    [itemPlateName[12] setFrame:CGRectMake(1016,205,91,22)];
    [itemPlateName[13] setFrame:CGRectMake(1146,205,91,22)];
    [itemPlateName[14] setFrame:CGRectMake(1016,350,91,22)];
    [itemPlateName[15] setFrame:CGRectMake(1146,350,91,22)];
    
    for (int i = 0;  i <= 15; i++) {
        [scrollView addSubview:itemPlateName[i]];
    }
    
    for (int j = 0; j <= 3; j++) {
        for (int i = 0;  i <= 3; i++) {
            [scrollView addSubview:itemPointLabel[j][i]];
        }
    }
    
    //購入ボタンの実装
    kounyuuBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    kounyuuBtn.userInteractionEnabled = YES;
    kounyuuBtn.frame = CGRectMake(220, 511, 75, 50);
    [kounyuuBtn setImage:[UIImage imageNamed:@"kau.png"] forState:UIControlStateNormal];
    [kounyuuBtn addTarget:self action:@selector(kounyuu:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:kounyuuBtn];
    
    //購入ボタン押せないようにする
    [kounyuuBtn setEnabled:NO];
    
    //試着ボタンの実装
    UIButton *sisyakuBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    sisyakuBtn.userInteractionEnabled = YES;
    sisyakuBtn.frame = CGRectMake(120, 511, 75, 50);
    [sisyakuBtn setImage:[UIImage imageNamed:@"shicyaku.png"] forState:UIControlStateNormal];
    [sisyakuBtn addTarget:self action:@selector(sityaku:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sisyakuBtn];
    
    
    //戻るボタンの実装
    UIButton *modoruBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    modoruBtn.userInteractionEnabled = YES;
    modoruBtn.frame = CGRectMake(20, 511, 75, 50);
    [modoruBtn setImage:[UIImage imageNamed:@"modoru.png"] forState:UIControlStateNormal];
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
            
            [soldOutImageView[0] setFrame:CGRectMake(60,157,81,81)];
            [scrollView addSubview:soldOutImageView[0]];
            
            [soldOutImageView[1] setFrame:CGRectMake(190,157,81,81)];
            [scrollView addSubview:soldOutImageView[1]];
            
            [soldOutImageView[2] setFrame:CGRectMake(60,300,81,81)];
            [scrollView addSubview:soldOutImageView[2]];
            
            [soldOutImageView[3] setFrame:CGRectMake(190,300,81,81)];
            [scrollView addSubview:soldOutImageView[3]];
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
    
    totalpt = ikumoupt + sutupt + nectaipt + meganept;
    
    differencept = pt - totalpt;
    
    NSLog(@"totalpt %ld",(long)totalpt);
    
    if (pt < totalpt) {
        alert = [[UIAlertView alloc]
                 initWithTitle:@"購入できません"
                 message:@"ポイントが不足しています"
                 delegate:self
                 cancelButtonTitle:@"戻る"
                 otherButtonTitles:nil];
        
        
        _clickButton1 = 0;
        _clickButton2 = 0;
        _clickButton3 = 0;
        _clickButton4 = 0;
        _clickButton5 = 0;
        _clickButton6 = 0;
        _clickButton7 = 0;
        _clickButton8 = 0;
        _clickButton9 = 0;
        _clickButton10 = 0;
        _clickButton11 = 0;
        _clickButton12 = 0;
        _clickButton13 = 0;
        _clickButton14 = 0;
        _clickButton15 = 0;
        _clickButton16 = 0;
        
    }else{
        alert = [[UIAlertView alloc]
                 initWithTitle:nil
                 message:nil
                 delegate:self
                 cancelButtonTitle:@"戻る" otherButtonTitles:@"購入する", nil];
        
        NSString *messageStr = [NSString stringWithFormat:@"本当に購入しますか？\n残りの所持ポイント %ld P",(long)differencept];
        alert.message = messageStr;
        
    }
    [alert show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    //ポイント計算
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
            
            pt = pt - totalpt;
            
            
            [[NSUserDefaults standardUserDefaults] setInteger:pt forKey:@"reservePoint"];
            [[NSUserDefaults standardUserDefaults] setInteger:spend_point forKey:@"shyouhiPoint"];
            
            UIAlertView *alertx = [[UIAlertView alloc]
                                   initWithTitle:@"まいどありー"
                                   message:@"ご購入ありがとうございました"
                                   delegate:self
                                   cancelButtonTitle:@"戻る"
                                   otherButtonTitles:nil];
            
            [kounyuuBtn setEnabled:NO];
            
            NSInteger p = [[NSUserDefaults standardUserDefaults] integerForKey:@"reservePoint"];
            NSLog(@"pt2 %ld",(long)p);
            
            ikumoupt = 0;
            sutupt = 0;
            nectaipt = 0;
            meganept = 0;
            
            [(UIImageView *)[scrollView viewWithTag:10] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:11] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:12] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:13] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:14] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:15] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:16] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:17] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:18] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:19] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:20] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:21] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:22] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:23] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:24] removeFromSuperview];
            [(UIImageView *)[scrollView viewWithTag:25] removeFromSuperview];
            
            
            
            //アイテム購入したかの判定
            [self boughtitem];
            
            [self UserDefaultsBought];
            
            _clickButton1 = 0;
            _clickButton2 = 0;
            _clickButton3 = 0;
            _clickButton4 = 0;
            _clickButton5 = 0;
            _clickButton6 = 0;
            _clickButton7 = 0;
            _clickButton8 = 0;
            _clickButton9 = 0;
            _clickButton10 = 0;
            _clickButton11 = 0;
            _clickButton12 = 0;
            _clickButton13 = 0;
            _clickButton14 = 0;
            _clickButton15 = 0;
            _clickButton16 = 0;
            
            NSLog(@"買ったもの判定3 %@",bought);
            
            
            totalPointLabel.text = [NSString stringWithFormat:@"所持ポイント　%ld P", (long)differencept];
            [self.view addSubview:totalPointLabel];
            
            [alertx show];
            
            [self setIkumou];
            break;
    }
}

- (void) UserDefaultsBought{
    
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
    NSLog(@"ほぞーんされているか %@",bought);
    
}


- (void) boughtitem{
    
    NSDictionary *buy = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"buyType"];
    
    sutu[0] = (NSNumber *)[buy valueForKey:@"item01"];
    sutu[1] = (NSNumber *)[buy valueForKey:@"item02"];
    sutu[2] = (NSNumber *)[buy valueForKey:@"item03"];
    sutu[3] = (NSNumber *)[buy valueForKey:@"item04"];
    sutu[4] = (NSNumber *)[buy valueForKey:@"item05"];
    sutu[5] = (NSNumber *)[buy valueForKey:@"item06"];
    sutu[6] = (NSNumber *)[buy valueForKey:@"item07"];
    sutu[7] = (NSNumber *)[buy valueForKey:@"item08"];
    sutu[8] = (NSNumber *)[buy valueForKey:@"item09"];
    sutu[9] = (NSNumber *)[buy valueForKey:@"item10"];
    sutu[10] = (NSNumber *)[buy valueForKey:@"item11"];
    sutu[11] = (NSNumber *)[buy valueForKey:@"item12"];
    
    for (int i=0; i <=11; i++) {
        itemType[i] = [sutu[i] unsignedIntegerValue];
    }
    
    switch (itemType[0]) {
        case 0:
            if(_clickButton5 == 1){
                //アイテムを買ったときの処理
                clickFlag[0] = 1;
                [scrollView addSubview:boughtItemImageView[0]];
            }else if(_clickButton5 == 0){
                clickFlag[0] = 0;
            }
            break;
        case 1:
            clickFlag[0] = 1;
            [scrollView addSubview:boughtItemImageView[0]];
            break;
        case 2:
            if(_clickButton5 == 0){
                clickFlag[0] = 1;
                [scrollView addSubview:boughtItemImageView[0]];
            }
            break;
        default:
            break;
    }
    
    switch (itemType[1]) {
        case 0:
            if(_clickButton6 == 1){
                clickFlag[1] = 1;
                [scrollView addSubview:boughtItemImageView[1]];
            }else if(_clickButton6 == 0){
                clickFlag[1] = 0;
            }
            break;
        case 1:
            clickFlag[1] = 1;
            [scrollView addSubview:boughtItemImageView[1]];
            break;
        case 2:
            if(_clickButton6 == 0){
                clickFlag[1] = 1;
                [scrollView addSubview:boughtItemImageView[1]];
            }
            break;
        default:
            break;
    }
    
    switch (itemType[2]) {
        case 0:
            if(_clickButton7 == 1){
                clickFlag[2] = 1;
                [scrollView addSubview:boughtItemImageView[2]];
            }else if(_clickButton7 == 0){
                clickFlag[2] = 0;
            }
            break;
        case 1:
            clickFlag[2] = 1;
            [scrollView addSubview:boughtItemImageView[2]];
            break;
        case 2:
            if(_clickButton7 == 0){
                clickFlag[2] = 1;
                [scrollView addSubview:boughtItemImageView[2]];
                break;
            default:
                break;
            }
    }
    switch (itemType[3]) {
        case 0:
            if(_clickButton8 == 1){
                clickFlag[3] = 1;
                [scrollView addSubview:boughtItemImageView[3]];
            }else if(_clickButton8 == 0){
                clickFlag[3] = 0;
            }
            break;
        case 1:
            clickFlag[3] = 1;
            [scrollView addSubview:boughtItemImageView[3]];
            break;
        case 2:
            if(_clickButton8 == 0){
                clickFlag[3] = 1;
                [scrollView addSubview:boughtItemImageView[3]];
                break;
            default:
                break;
            }
    }
    switch (itemType[4]) {
        case 0:
            if(_clickButton9 == 1){
                clickFlag[4] = 1;
                [scrollView addSubview:boughtItemImageView[4]];
            }else if(_clickButton9 == 0){
                clickFlag[4] = 0;
            }
            break;
        case 1:
            clickFlag[4] = 1;
            [scrollView addSubview:boughtItemImageView[4]];
            break;
        case 2:
            if(_clickButton9 == 0){
                clickFlag[4] = 1;
                [scrollView addSubview:boughtItemImageView[4]];
                break;
            default:
                break;
            }
    }
    
    switch (itemType[5]) {
        case 0:
            if(_clickButton10 == 1){
                clickFlag[5] = 1;
                [scrollView addSubview:boughtItemImageView[5]];
            }else if(_clickButton10 == 0){
                clickFlag[5] = 0;
            }
            break;
        case 1:
            clickFlag[5] = 1;
            [scrollView addSubview:boughtItemImageView[5]];
            break;
        case 2:
            if(_clickButton10 == 0){
                clickFlag[5] = 1;
                [scrollView addSubview:boughtItemImageView[5]];
            }
            break;
        default:
            break;
    }
    
    switch (itemType[6]) {
        case 0:
            if(_clickButton11 == 1){
                clickFlag[6] = 1;
                [scrollView addSubview:boughtItemImageView[6]];
            }else if(_clickButton11 == 0){
                clickFlag[6] = 0;
            }
            break;
        case 1:
            clickFlag[6] = 1;
            [scrollView addSubview:boughtItemImageView[6]];
            break;
        case 2:
            if(_clickButton11 == 0){
                clickFlag[6] = 1;
                [scrollView addSubview:boughtItemImageView[6]];
                break;
            default:
                break;
            }
    }
    
    switch (itemType[7]) {
        case 0:
            if(_clickButton12 == 1){
                clickFlag[7] = 1;
                [scrollView addSubview:boughtItemImageView[7]];
            }else if(_clickButton12 == 0){
                clickFlag[7] = 0;
            }
            break;
        case 1:
            clickFlag[7] = 1;
            [scrollView addSubview:boughtItemImageView[7]];
            break;
        case 2:
            if(_clickButton12 == 0){
                clickFlag[7] = 1;
                [scrollView addSubview:boughtItemImageView[7]];
                break;
            default:
                break;
            }
    }
    switch (itemType[8]) {
        case 0:
            if(_clickButton13 == 1){
                clickFlag[8] = 1;
                [scrollView addSubview:boughtItemImageView[8]];
            }else if(_clickButton13 == 0){
                clickFlag[8] = 0;
            }
            break;
        case 1:
            clickFlag[8] = 1;
            [scrollView addSubview:boughtItemImageView[8]];
            break;
        case 2:
            if(_clickButton13 == 0){
                clickFlag[8] = 1;
                [scrollView addSubview:boughtItemImageView[8]];
                break;
            default:
                break;
            }
    }
    
    switch (itemType[9]) {
        case 0:
            if(_clickButton14 == 1){
                clickFlag[9] = 1;
                [scrollView addSubview:boughtItemImageView[9]];
            }else if(_clickButton14 == 0){
                clickFlag[9] = 0;
            }
            break;
        case 1:
            clickFlag[9] = 1;
            [scrollView addSubview:boughtItemImageView[9]];
            break;
        case 2:
            if(_clickButton14 == 0){
                clickFlag[9] = 1;
                [scrollView addSubview:boughtItemImageView[9]];
                break;
            default:
                break;
            }
    }
    
    switch (itemType[10]) {
        case 0:
            if(_clickButton15 == 1){
                clickFlag[10] = 1;
                [scrollView addSubview:boughtItemImageView[10]];
            }else if(_clickButton15 == 0){
                clickFlag[10] = 0;
            }
            break;
        case 1:
            clickFlag[10] = 1;
            [scrollView addSubview:boughtItemImageView[10]];
            break;
        case 2:
            if(_clickButton15 == 0){
                clickFlag[10] = 1;
                [scrollView addSubview:boughtItemImageView[10]];
                break;
            default:
                break;
            }
    }
    switch (itemType[11]) {
        case 0:
            if(_clickButton16 == 1){
                clickFlag[11] = 1;
                [scrollView addSubview:boughtItemImageView[11]];
            }else if(_clickButton16 == 0){
                clickFlag[11] = 0;
            }
            break;
        case 1:
            clickFlag[11] = 1;
            [scrollView addSubview:boughtItemImageView[11]];
            break;
        case 2:
            if(_clickButton16 == 0){
                clickFlag[11] = 1;
                [scrollView addSubview:boughtItemImageView[11]];
                break;
            default:
                break;
            }
    }
}

- (void)modoru:(UIButton*)sender {
    
    if(clickFlag[0] == 1  && _clickButton5 == 1){
        clickFlag[0] = 2;
        if(clickFlag[1] == 2){
            clickFlag[1] = 1;
        }else if(clickFlag[2] == 2){
            clickFlag[2] = 1;
        }else if(clickFlag[3] == 2){
            clickFlag[3] = 1;
        }
    }else if(clickFlag[1] == 1 && _clickButton6 == 1){
        clickFlag[1] = 2;
        if(clickFlag[0] == 2){
            clickFlag[0] = 1;
        }else if(clickFlag[2] == 2){
            clickFlag[2] = 1;
        }else if(clickFlag[3] == 2){
            clickFlag[3] = 1;
        }
    }else if(clickFlag[2] == 1 && _clickButton7 == 1){
        clickFlag[2] = 2;
        if(clickFlag[0] == 2){
            clickFlag[0] = 1;
        }else if(clickFlag[1] == 2){
            clickFlag[1] = 1;
        }else if(clickFlag[3] == 2){
            clickFlag[3] = 1;
        }
    }else if(clickFlag[3] == 1 && _clickButton8 == 1){
        clickFlag[3] = 2;
        if(clickFlag[0] == 2){
            clickFlag[0] = 1;
        }else if(clickFlag[1] == 2){
            clickFlag[1] = 1;
        }else if(clickFlag[2] == 2){
            clickFlag[2] = 1;
        }
    }
    
    if(clickFlag[4] == 1 && _clickButton9 == 1){
        clickFlag[4] = 2;
        if(clickFlag[5] == 2){
            clickFlag[5] = 1;
        }else if(clickFlag[6] == 2){
            clickFlag[6] = 1;
        }else if(clickFlag[7] == 2){
            clickFlag[7] = 1;
        }
    }else if(clickFlag[5] == 1 && _clickButton10 == 1){
        clickFlag[5] = 2;
        if(clickFlag[4] == 2){
            clickFlag[4] = 1;
        }else if(clickFlag[6] == 2){
            clickFlag[6] = 1;
        }else if(clickFlag[7] == 2){
            clickFlag[7] = 1;
        }
    }else if(clickFlag[6] == 1 && _clickButton11 == 1){
        clickFlag[6] = 2;
        if(clickFlag[4] == 2){
            clickFlag[4] = 1;
        }else if(clickFlag[5] == 2){
            clickFlag[5] = 1;
        }else if(clickFlag[7] == 2){
            clickFlag[7] = 1;
        }
    }else if(clickFlag[7] == 1 && _clickButton12 == 1){
        clickFlag[7] = 2;
        if(clickFlag[4] == 2){
            clickFlag[4] = 1;
        }else if(clickFlag[5] == 2){
            clickFlag[5] = 1;
        }else if(clickFlag[6] == 2){
            clickFlag[6] = 1;
        }
    }
    
    if(clickFlag[8] == 1 && _clickButton13 == 1 ){
        clickFlag[8] = 2;
        if(clickFlag[9] == 2){
            clickFlag[9] = 1;
        }else if(clickFlag[10] == 2){
            clickFlag[10] = 1;
        }else if(clickFlag[11] == 2){
            clickFlag[11] = 1;
        }
    }else if(clickFlag[9] == 1 && _clickButton14 == 1){
        clickFlag[9] = 2;
        if(clickFlag[8] == 2){
            clickFlag[8] = 1;
        }else if(clickFlag[10] == 2){
            clickFlag[10] = 1;
        }else if(clickFlag[11] == 2){
            clickFlag[11] = 1;
        }
    }else if(clickFlag[10] == 1 && _clickButton15 == 1){
        clickFlag[10] = 2;
        if(clickFlag[8] == 2){
            clickFlag[8] = 1;
        }else if(clickFlag[9] == 2){
            clickFlag[9] = 1;
        }else if(clickFlag[11] == 2){
            clickFlag[11] = 1;
        }
    }else if(clickFlag[11] == 1 && _clickButton16 == 1){
        clickFlag[11] = 2;
        if(clickFlag[8] == 2){
            clickFlag[8] = 1;
        }else if(clickFlag[9] == 2){
            clickFlag[9] = 1;
        }else if(clickFlag[10] == 2){
            clickFlag[10] = 1;
        }
    }
    
    [self UserDefaultsBought];
    
    NSLog(@"戻るボタン押したときの値 %@", bought);
    
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
        if(_clickButton2 == 0 && _clickButton3 == 0 && _clickButton4 == 0){
            ikumoupt = 30;
        }else if(_clickButton2 == 1){
            ikumoupt = 30;
        }else if(_clickButton3 == 1){
            ikumoupt = 30;
        }else if(_clickButton4 == 1){
            ikumoupt = 30;
        }else if(_clickButton5 == 0 && _clickButton6 == 0 && _clickButton7 == 0 && _clickButton8 == 0
                 && _clickButton9 == 0 && _clickButton10 == 0 && _clickButton11 == 0 && _clickButton12 == 0
                 && _clickButton13 == 0 && _clickButton14 == 0 && _clickButton15 == 0 && _clickButton16 == 0){
            ikumoupt = 0;
            [kounyuuBtn setEnabled:NO];
        }
        
        
        _clickButton2 = 0;
        _clickButton3 = 0;
        _clickButton4 = 0;
        self.btnFlag4 = 1;
        
        [selectStampImageView[0] setFrame:CGRectMake(55,110,100,100)];
        [scrollView addSubview:selectStampImageView[0]];
        
        [(UIImageView *)[scrollView viewWithTag:11] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:12] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:13] removeFromSuperview];
        
        [kounyuuBtn setEnabled:YES];
        
    }else {
        self.btnFlag4 = 0;
        [(UIImageView *)[scrollView viewWithTag:10] removeFromSuperview];
        ikumoupt = 0;
        totalpt = ikumoupt + sutupt + nectaipt + meganept;
        if(totalpt == 0){
            [kounyuuBtn setEnabled:NO];
        }
    }
    _clickButton1++;
    _clickButton1 = _clickButton1 % 2;
}



- (void)item02Buttom:(UIButton *)button {
    
    _clickButton2 = _clickButton2 % 2;
    
    if (_clickButton2 == 0) {
        if(_clickButton1 == 0 && _clickButton3 == 0 && _clickButton4 == 0){
            ikumoupt = 80;
        }else if(_clickButton1 == 1){
            ikumoupt = 80;
        }else if(_clickButton3 == 1){
            ikumoupt = 80;
        }else if(_clickButton4 == 1){
            ikumoupt = 80;
        }else if(_clickButton5 == 0 && _clickButton6 == 0 && _clickButton7 == 0 && _clickButton8 == 0
                 && _clickButton9 == 0 && _clickButton10 == 0 && _clickButton11 == 0 && _clickButton12 == 0
                 && _clickButton13 == 0 && _clickButton14 == 0 && _clickButton15 == 0 && _clickButton16 == 0){
            ikumoupt = 0;
            [kounyuuBtn setEnabled:NO];
        }
        
        
        _clickButton1 = 0;
        _clickButton3 = 0;
        _clickButton4 = 0;
        self.btnFlag4 = 2;
        
        
        [selectStampImageView[1] setFrame:CGRectMake(180,110,100,100)];
        [scrollView addSubview:selectStampImageView[1]];
        
        [(UIImageView *)[scrollView viewWithTag:10] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:12] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:13] removeFromSuperview];
        
        [kounyuuBtn setEnabled:YES];
        
    }else{
        self.btnFlag4 = 0;
        [(UIImageView *)[scrollView viewWithTag:11] removeFromSuperview];
        ikumoupt = 0;
        totalpt = ikumoupt + sutupt + nectaipt + meganept;
        if(totalpt == 0){
            [kounyuuBtn setEnabled:NO];
        }
    }
    _clickButton2++;
    _clickButton2 = _clickButton2 % 2;
    
}

- (void)item03Buttom:(UIButton *)button {
    
    _clickButton3 = _clickButton3 % 2;
    
    if (_clickButton3 == 0) {
        if(_clickButton1 == 0 && _clickButton2 == 0 && _clickButton4 == 0){
            ikumoupt = 180;
        }else if(_clickButton1 == 1){
            ikumoupt = 180;
        }else if(_clickButton2 == 1){
            ikumoupt = 180;
        }else if(_clickButton4 == 1){
            ikumoupt = 180;
        }else if(_clickButton5 == 0 && _clickButton6 == 0 && _clickButton7 == 0 && _clickButton8 == 0
                 && _clickButton9 == 0 && _clickButton10 == 0 && _clickButton11 == 0 && _clickButton12 == 0
                 && _clickButton13 == 0 && _clickButton14 == 0 && _clickButton15 == 0 && _clickButton16 == 0){
            ikumoupt = 0;
            [kounyuuBtn setEnabled:NO];
        }
        _clickButton1 = 0;
        _clickButton2 = 0;
        _clickButton4 = 0;
        self.btnFlag4 = 3;
        
        [selectStampImageView[2] setFrame:CGRectMake(55,255,100,100)];
        [scrollView addSubview:selectStampImageView[2]];
        
        [(UIImageView *)[scrollView viewWithTag:10] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:11] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:13] removeFromSuperview];
        
        [kounyuuBtn setEnabled:YES];
        
    }else{
        self.btnFlag4 = 0;
        [(UIImageView *)[scrollView viewWithTag:12] removeFromSuperview];
        
        ikumoupt = 0;
        totalpt = ikumoupt + sutupt + nectaipt + meganept;
        if(totalpt == 0){
            [kounyuuBtn setEnabled:NO];
        }
    }
    _clickButton3++;
    _clickButton3 = _clickButton3 % 2;
}

- (void)item04Buttom:(UIButton *)button {
    
    _clickButton4 = _clickButton4 % 2;
    
    if (_clickButton4 == 0) {
        if(_clickButton1 == 0 && _clickButton2 == 0 && _clickButton3 == 0){
            ikumoupt = 330;
        }else if(_clickButton1 == 1){
            ikumoupt = 330;
        }else if(_clickButton2 == 1){
            ikumoupt = 330;
        }else if(_clickButton3 == 1){
            ikumoupt = 330;
        }else if(_clickButton5 == 0 && _clickButton6 == 0 && _clickButton7 == 0 && _clickButton8 == 0
                 && _clickButton9 == 0 && _clickButton10 == 0 && _clickButton11 == 0 && _clickButton12 == 0
                 && _clickButton13 == 0 && _clickButton14 == 0 && _clickButton15 == 0 && _clickButton16 == 0){
            ikumoupt = 0;
            [kounyuuBtn setEnabled:NO];
        }
        _clickButton1 = 0;
        _clickButton2 = 0;
        _clickButton3 = 0;
        self.btnFlag4 = 4;
        
        [selectStampImageView[3] setFrame:CGRectMake(180,255,100,100)];
        [scrollView addSubview:selectStampImageView[3]];
        
        [(UIImageView *)[scrollView viewWithTag:10] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:11] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:12] removeFromSuperview];
        
        [kounyuuBtn setEnabled:YES];
        
    }else{
        self.btnFlag4 = 0;
        [(UIImageView *)[scrollView viewWithTag:13] removeFromSuperview];
        ikumoupt = 0;
        totalpt = ikumoupt + sutupt + nectaipt + meganept;
        if(totalpt == 0){
            [kounyuuBtn setEnabled:NO];
        }
    }
    
    _clickButton4++;
    _clickButton4 = _clickButton4 % 2;
}

- (void)item05Buttom:(UIButton *)button {
    
    _clickButton5 = _clickButton5 % 2;
    NSLog(@"回数5 %d",_clickButton5);
    if (_clickButton5 == 0) {
        
        //赤枠の表示
        [selectStampImageView[4] setFrame:CGRectMake(368,130,RED_WAKU_WIDTH,RED_WAKU_HEIGTH)];
        [scrollView addSubview:selectStampImageView[4]];
        
        //他の赤枠削除
        [(UIImageView *)[scrollView viewWithTag:15] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:16] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:17] removeFromSuperview];
        
        switch (clickFlag[0]) {
                
            case 0:
                [kounyuuBtn setEnabled:YES];
                sutupt = 50;
                break;
            case 1:
                break;
            case 2:
                if(itemType[1] == 2){
                    clickFlag[1] = 1;
                }
                if(itemType[2] == 2){
                    clickFlag[2] = 1;
                }
                if(itemType[3] == 2){
                    clickFlag[3] = 1;
                }
                break;
            default:
                break;
        }
        
        _clickButton6 = 0;
        _clickButton7 = 0;
        _clickButton8 = 0;
        self.btnFlag1 = 1;
        
    }else{
        
        [(UIImageView *)[scrollView viewWithTag:14] removeFromSuperview];
        
        self.btnFlag1 = 0;
        
        //ポイント計算
        if(clickFlag[0] == 0){
            sutupt = 0;
            totalpt = ikumoupt + sutupt + nectaipt + meganept;
            if(totalpt == 0){
                [kounyuuBtn setEnabled:NO];
            }
        }
        
    }
    _clickButton5++;
    _clickButton5 = _clickButton5 % 2;
}

- (void)item06Buttom:(UIButton *)button {
    
    _clickButton6 = _clickButton6 % 2;
    
    if (_clickButton6 == 0) {
        
        [selectStampImageView[5] setFrame:CGRectMake(488,130,RED_WAKU_WIDTH,RED_WAKU_HEIGTH)];
        [scrollView addSubview:selectStampImageView[5]];
        
        [(UIImageView *)[scrollView viewWithTag:14] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:16] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:17] removeFromSuperview];
        switch (clickFlag[1]) {
            case 0:
                [kounyuuBtn setEnabled:YES];
                sutupt = 200;
                break;
            case 1:
                break;
            case 2:
                if(itemType[0] == 2){
                    clickFlag[0] = 1;
                }
                if(itemType[2] == 2){
                    clickFlag[2] = 1;
                }
                if(itemType[3] == 2){
                    clickFlag[3] = 1;
                }
                break;
            default:
                break;
        }
        _clickButton5 = 0;
        _clickButton7 = 0;
        _clickButton8 = 0;
        self.btnFlag1 = 2;
        
    }else{
        [(UIImageView *)[scrollView viewWithTag:15] removeFromSuperview];
        
        self.btnFlag1 = 0;
        
        
        if(clickFlag[1] == 0){
            sutupt = 0;
            totalpt = ikumoupt + sutupt + nectaipt + meganept;
            if(totalpt == 0){
                [kounyuuBtn setEnabled:NO];
            }
        }
    }
    _clickButton6++;
    _clickButton6 = _clickButton6 % 2;
}

- (void)item07Buttom:(UIButton *)button {
    _clickButton7 = _clickButton7 % 2;
    
    if (_clickButton7 == 0) {
        [selectStampImageView[6] setFrame:CGRectMake(368,282,RED_WAKU_WIDTH,RED_WAKU_HEIGTH)];
        [scrollView addSubview:selectStampImageView[6]];
        
        [(UIImageView *)[scrollView viewWithTag:14] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:15] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:17] removeFromSuperview];
        
        switch (clickFlag[2]) {
            case 0:
                sutupt = 600;
                [kounyuuBtn setEnabled:YES];
                break;
            case 1:
                break;
            case  2:
                
                
                if(itemType[0] == 2){
                    clickFlag[0] = 1;
                }
                if(itemType[1] == 2){
                    clickFlag[1] = 1;
                }
                if(itemType[3] == 2){
                    clickFlag[3] = 1;
                }
                break;
            default:
                break;
        }
        
        _clickButton5 = 0;
        _clickButton6 = 0;
        _clickButton8 = 0;
        
        self.btnFlag1 = 3;
        
    }else{
        [(UIImageView *)[scrollView viewWithTag:16] removeFromSuperview];
        
        self.btnFlag1 = 0;
        
        if(clickFlag[2] == 0){
            sutupt = 0;
            totalpt = ikumoupt + sutupt + nectaipt + meganept;
            if(totalpt == 0){
                [kounyuuBtn setEnabled:NO];
            }
        }
    }
    _clickButton7++;
    _clickButton7 = _clickButton7 % 2;
}

- (void)item08Buttom:(UIButton *)button {
    _clickButton8 = _clickButton8 % 2;
    if (_clickButton8 == 0) {
        
        [selectStampImageView[7] setFrame:CGRectMake(488,282,RED_WAKU_WIDTH,RED_WAKU_HEIGTH)];
        [scrollView addSubview:selectStampImageView[7]];
        [(UIImageView *)[scrollView viewWithTag:14] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:15] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:16] removeFromSuperview];
        
        switch (clickFlag[3]) {
            case 0:
                [kounyuuBtn setEnabled:YES];
                sutupt = 1200;
                break;
            case 1:
                break;
            case 2:
                if(itemType[0] == 2){
                    clickFlag[0] = 1;
                }
                if(itemType[1] == 2){
                    clickFlag[1] = 1;
                }
                if(itemType[2] == 2){
                    clickFlag[2] = 1;
                }
                break;
            default:
                break;
        }
        _clickButton5 = 0;
        _clickButton6 = 0;
        _clickButton7 = 0;
        self.btnFlag1 = 4;
        
    }else{
        [(UIImageView *)[scrollView viewWithTag:17] removeFromSuperview];
        
        self.btnFlag1 = 0;
        
        if(clickFlag[3] == 0){
            sutupt = 0;
            totalpt = ikumoupt + sutupt + nectaipt + meganept;
            if(totalpt == 0){
                [kounyuuBtn setEnabled:NO];
            }
        }
    }
    _clickButton8++;
    _clickButton8 = _clickButton8 % 2;
}

- (void)item09Buttom:(UIButton *)button {
    _clickButton9 = _clickButton9 % 2;
    if (_clickButton9 == 0) {
        
        [selectStampImageView[8] setFrame:CGRectMake(688,130,RED_WAKU_WIDTH,RED_WAKU_HEIGTH)];
        [scrollView addSubview:selectStampImageView[8]];
        [(UIImageView *)[scrollView viewWithTag:19] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:20] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:21] removeFromSuperview];
        
        switch (clickFlag[4]) {
            case 0:
                [kounyuuBtn setEnabled:YES];
                nectaipt = 50;
                break;
            case 1:
                break;
            case 2:
                if(itemType[5] == 2){
                    clickFlag[5] = 1;
                }
                if(itemType[6] == 2){
                    clickFlag[6] = 1;
                }
                if(itemType[7] == 2){
                    clickFlag[7] = 1;
                }
                break;
            default:
                break;
        }
        
        _clickButton10 = 0;
        _clickButton11 = 0;
        _clickButton12 = 0;
        self.btnFlag2 = 1;
    }else{
        [(UIImageView *)[scrollView viewWithTag:18] removeFromSuperview];
        
        self.btnFlag2 = 0;
        
        if(clickFlag[4] == 0){
            nectaipt = 0;
            totalpt = ikumoupt + sutupt + nectaipt + meganept;
            if(totalpt == 0){
                [kounyuuBtn setEnabled:NO];
            }
        }
    }
    _clickButton9++;
    _clickButton9 = _clickButton9 % 2;
}

- (void)item10Buttom:(UIButton *)button {
    _clickButton10 = _clickButton10 % 2;
    
    if (_clickButton10 == 0) {
        [selectStampImageView[9] setFrame:CGRectMake(808,130,RED_WAKU_WIDTH,RED_WAKU_HEIGTH)];
        [scrollView addSubview:selectStampImageView[9]];
        
        [(UIImageView *)[scrollView viewWithTag:18] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:20] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:21] removeFromSuperview];
        
        
        switch (clickFlag[5]) {
            case 0:
                [kounyuuBtn setEnabled:YES];
                nectaipt = 200;
                break;
            case 1:
                break;
            case 2:
                if(itemType[4] == 2){
                    clickFlag[4] = 1;
                }
                if(itemType[6] == 2){
                    clickFlag[6] = 1;
                }
                if(itemType[7] == 2){
                    clickFlag[7] = 1;
                }
                break;
            default:
                break;
        }
        _clickButton9 = 0;
        _clickButton11 = 0;
        _clickButton12 = 0;
        
        self.btnFlag2 = 2;
        
    }else{
        [(UIImageView *)[scrollView viewWithTag:19] removeFromSuperview];
        self.btnFlag2 = 0;
        
        if(clickFlag[5] == 0){
            nectaipt = 0;
            totalpt = ikumoupt + sutupt + nectaipt + meganept;
            if(totalpt == 0){
                [kounyuuBtn setEnabled:NO];
            }
        }
    }
    _clickButton10++;
    _clickButton10 = _clickButton10 % 2;
}

- (void)item11Buttom:(UIButton *)button {
    _clickButton11 = _clickButton11 % 2;
    
    if (_clickButton11 == 0) {
        [selectStampImageView[10] setFrame:CGRectMake(688,280,RED_WAKU_WIDTH,RED_WAKU_HEIGTH)];
        [scrollView addSubview:selectStampImageView[10]];
        
        [(UIImageView *)[scrollView viewWithTag:18] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:19] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:21] removeFromSuperview];
        switch (clickFlag[6]) {
            case 0:
                [kounyuuBtn setEnabled:YES];
                nectaipt = 600;
                break;
            case 1:
                break;
            case 2:
                if(itemType[4] == 2){
                    clickFlag[4] = 1;
                }
                if(itemType[5] == 2){
                    clickFlag[5] = 1;
                }
                if(itemType[7] == 2){
                    clickFlag[7] = 1;
                }
                break;
            default:
                break;
        }
        _clickButton9 = 0;
        _clickButton10 = 0;
        _clickButton12 = 0;
        
        self.btnFlag2 = 3;
        
    }else{
        [(UIImageView *)[scrollView viewWithTag:20] removeFromSuperview];
        
        self.btnFlag2 = 0;
        
        if(clickFlag[6] == 0){
            nectaipt = 0;
            totalpt = ikumoupt + sutupt + nectaipt + meganept;
            if(totalpt == 0){
                [kounyuuBtn setEnabled:NO];
            }
        }
    }
    
    _clickButton11++;
    _clickButton11 = _clickButton11 % 2;
}

- (void)item12Buttom:(UIButton *)button {
    _clickButton12 = _clickButton12 % 2;
    
    [selectStampImageView[11] setFrame:CGRectMake(808,280,RED_WAKU_WIDTH,RED_WAKU_HEIGTH)];
    [scrollView addSubview:selectStampImageView[11]];
    
    [(UIImageView *)[scrollView viewWithTag:18] removeFromSuperview];
    [(UIImageView *)[scrollView viewWithTag:19] removeFromSuperview];
    [(UIImageView *)[scrollView viewWithTag:20] removeFromSuperview];
    
    if (_clickButton12 == 0) {
        
        switch (clickFlag[7]) {
            case 0:
                [kounyuuBtn setEnabled:YES];
                nectaipt = 1200;
                break;
            case 1:
                break;
            case 2:
                if(itemType[4] == 2){
                    clickFlag[4] = 1;
                }
                if(itemType[5] == 2){
                    clickFlag[5] = 1;
                }
                if(itemType[6] == 2){
                    clickFlag[6] = 1;
                }
                break;
            default:
                break;
        }
        _clickButton9 = 0;
        _clickButton10 = 0;
        _clickButton11 = 0;
        
        self.btnFlag2 = 4;
        
    }else{
        [(UIImageView *)[scrollView viewWithTag:21] removeFromSuperview];
        
        self.btnFlag2 = 0;
        
        if(clickFlag[7] == 0){
            nectaipt = 0;
            totalpt = ikumoupt + sutupt + nectaipt + meganept;
            if(totalpt == 0){
                [kounyuuBtn setEnabled:NO];
            }
        }
    }
    _clickButton12++;
    _clickButton12 = _clickButton12 % 2;
    
}

- (void)item13Buttom:(UIButton *)button {
    _clickButton13 = _clickButton13 % 2;
    
    if (_clickButton13 == 0) {
        
        [selectStampImageView[12] setFrame:CGRectMake(1003,130,RED_WAKU_WIDTH,RED_WAKU_HEIGTH)];
        [scrollView addSubview:selectStampImageView[12]];
        
        [(UIImageView *)[scrollView viewWithTag:23] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:24] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:25] removeFromSuperview];
        
        switch (clickFlag[8]) {
            case 0:
                [kounyuuBtn setEnabled:YES];
                meganept = 50;
                break;
            case 1:
                break;
            case 2:
                if(itemType[9] == 2){
                    clickFlag[9] = 1;
                }
                if(itemType[10] == 2){
                    clickFlag[10] = 1;
                }
                if(itemType[11] == 2){
                    clickFlag[11] = 1;
                }
                break;
            default:
                break;
        }
        _clickButton14 = 0;
        _clickButton15 = 0;
        _clickButton16 = 0;
        
        self.btnFlag3 = 1;
        
    }else{
        [(UIImageView *)[scrollView viewWithTag:22] removeFromSuperview];
        
        self.btnFlag3 = 0;
        
        if(clickFlag[8] == 0){
            meganept = 0;
            totalpt = ikumoupt + sutupt + nectaipt + meganept;
            if(totalpt == 0){
                [kounyuuBtn setEnabled:NO];
            }
        }
    }
    _clickButton13++;
    _clickButton13 = _clickButton13 % 2;
}

- (void)item14Buttom:(UIButton *)button {
    _clickButton14 = _clickButton14 % 2;
    
    if (_clickButton14 == 0) {
        [selectStampImageView[13] setFrame:CGRectMake(1133,130,RED_WAKU_WIDTH,RED_WAKU_HEIGTH)];
        [scrollView addSubview:selectStampImageView[13]];
        
        [(UIImageView *)[scrollView viewWithTag:22] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:24] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:25] removeFromSuperview];
        switch (clickFlag[9]) {
            case 0:
                [kounyuuBtn setEnabled:YES];
                meganept = 200;
                break;
            case 1:
                break;
            case 2:
                if(itemType[8] == 2){
                    clickFlag[8] = 1;
                }
                if(itemType[10] == 2){
                    clickFlag[10] = 1;
                }
                if(itemType[11] == 2){
                    clickFlag[11] = 1;
                }
                break;
            default:
                break;
        }
        _clickButton13 = 0;
        _clickButton15 = 0;
        _clickButton16 = 0;
        
        self.btnFlag3 = 2;
        
    }else{
        [(UIImageView *)[scrollView viewWithTag:23] removeFromSuperview];
        
        self.btnFlag3 = 0;
        
        if(clickFlag[9] == 0){
            meganept = 0;
            totalpt = ikumoupt + sutupt + nectaipt + meganept;
            if(totalpt == 0){
                [kounyuuBtn setEnabled:NO];
            }
        }
    }
    _clickButton14++;
    _clickButton14 = _clickButton14 % 2;
}

- (void)item15Buttom:(UIButton *)button {
    _clickButton15 = _clickButton15 % 2;
    
    if (_clickButton15 == 0) {
        [selectStampImageView[14] setFrame:CGRectMake(1003,280,RED_WAKU_WIDTH,RED_WAKU_HEIGTH)];
        [scrollView addSubview:selectStampImageView[14]];
        
        [(UIImageView *)[scrollView viewWithTag:22] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:23] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:25] removeFromSuperview];
        switch (clickFlag[10]) {
            case 0:
                [kounyuuBtn setEnabled:YES];
                meganept = 600;
                break;
            case 1:
                break;
            case 2:
                if(itemType[8] == 2){
                    clickFlag[8] = 1;
                }
                if(itemType[9] == 2){
                    clickFlag[9] = 1;
                }
                if(itemType[11] == 2){
                    clickFlag[11] = 1;
                }
                
                break;
            default:
                break;
        }
        _clickButton13 = 0;
        _clickButton14 = 0;
        _clickButton16 = 0;
        
        self.btnFlag3 = 3;
        
    }else{
        [(UIImageView *)[scrollView viewWithTag:24] removeFromSuperview];
        
        self.btnFlag3 = 0;
        
        if(clickFlag[10] == 0){
            meganept = 0;
            totalpt = ikumoupt + sutupt + nectaipt + meganept;
            if(totalpt == 0){
                [kounyuuBtn setEnabled:NO];
            }
        }
    }
    _clickButton15++;
    _clickButton15 = _clickButton15 % 2;
}

- (void)item16Buttom:(UIButton *)button {
    _clickButton16 = _clickButton16 % 2;
    
    if (_clickButton16 == 0) {
        
        [selectStampImageView[15] setFrame:CGRectMake(1133,280,RED_WAKU_WIDTH,RED_WAKU_HEIGTH)];
        [scrollView addSubview:selectStampImageView[15]];
        
        [(UIImageView *)[scrollView viewWithTag:22] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:23] removeFromSuperview];
        [(UIImageView *)[scrollView viewWithTag:24] removeFromSuperview];
        
        switch (clickFlag[11]) {
            case 0:
                [kounyuuBtn setEnabled:YES];
                meganept = 1200;
                break;
            case 1:
                break;
            case 2:
                if(itemType[8] == 2){
                    clickFlag[8] = 1;
                }
                if(itemType[9] == 2){
                    clickFlag[9] = 1;
                }
                if(itemType[10] == 2){
                    clickFlag[10] = 1;
                }
                break;
            default:
                break;
        }
        _clickButton13 = 0;
        _clickButton14 = 0;
        _clickButton15 = 0;
        
        self.btnFlag3 = 4;
        
    }else{
        [(UIImageView *)[scrollView viewWithTag:25] removeFromSuperview];
        
        self.btnFlag3 = 0;
        
        if(clickFlag[11] == 0){
            meganept = 0;
            totalpt = ikumoupt + sutupt + nectaipt + meganept;
            if(totalpt == 0){
                [kounyuuBtn setEnabled:NO];
            }
            
        }
    }
    _clickButton16++;
    _clickButton16 = _clickButton16 % 2;
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
