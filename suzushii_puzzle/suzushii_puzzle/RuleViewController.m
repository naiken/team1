//
//  RuleViewController.m
//
//  Created by Rento Sugiyama on 4/17/14.
//  Copyright (c) 2014 Rento Sugiyama. All rights reserved.
//

#import "RuleViewController.h"


@interface RuleViewController ()

@end

@implementation RuleViewController

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

    // create title label.
    UILabel *ruleLabel0 = [[UILabel alloc] init];
    ruleLabel0.frame = CGRectMake(5, 20, (self.view.bounds.size.width-20), 20);
    ruleLabel0.text = @"このゲームは3つ以上の絵柄を揃えて";
    ruleLabel0.textColor = [UIColor blueColor];
    ruleLabel0.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel0];

    UILabel *ruleLabel1 = [[UILabel alloc] init];
    ruleLabel1.frame = CGRectMake(5, 50, (self.view.bounds.size.width-20), 20);
    ruleLabel1.text = @"パズルを崩していくゲームです。";
    ruleLabel1.textColor = [UIColor blueColor];
    ruleLabel1.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel1 ];


    UILabel *ruleLabel2 = [[UILabel alloc] init];
    ruleLabel2 .frame = CGRectMake(5, 80, (self.view.bounds.size.width-20), 20);
    ruleLabel2 .text = @"縦方向に3つ以上、もしくは横方向に";
    ruleLabel2 .textColor = [UIColor blueColor];
    ruleLabel2 .font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel2 ];

    UILabel *ruleLabel3 = [[UILabel alloc] init];
    ruleLabel3 .frame = CGRectMake(5, 110, (self.view.bounds.size.width-20), 20);
    ruleLabel3 .text = @"3つ以上絵柄を揃えて下さい。";
    ruleLabel3 .textColor = [UIColor blueColor];
    ruleLabel3 .font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel3 ];

    UILabel *ruleLabel4 = [[UILabel alloc] init];
    ruleLabel4 .frame = CGRectMake(5, 140, (self.view.bounds.size.width-20), 20);
    ruleLabel4 .text = @"連鎖はできません。";
    ruleLabel4 .textColor = [UIColor blueColor];
    ruleLabel4 .font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel4 ];





    //まる画像1の実装
    CGRect maru = CGRectMake(5, 180, 50, 50);
    UIImageView *imageViewmaru = [[UIImageView alloc]initWithFrame:maru];

    // 画像の読み込み
    imageViewmaru.image = [UIImage imageNamed:@"maru.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewmaru];





    //縦画像1の実装
    CGRect tate = CGRectMake(80, 190, 40, 40);
    UIImageView *imageViewtate = [[UIImageView alloc]initWithFrame:tate];

    // 画像の読み込み
    imageViewtate.image = [UIImage imageNamed:@"block_0.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewtate];





    //縦画像2の実装
    CGRect tate2 = CGRectMake(80, 230, 40, 40);
    UIImageView *imageViewtate2 = [[UIImageView alloc]initWithFrame:tate2];

    // 画像の読み込み
    imageViewtate2.image = [UIImage imageNamed:@"block_0.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewtate2];





    //縦画像3の実装
    CGRect tate3 = CGRectMake(80, 270, 40, 40);
    UIImageView *imageViewtate3 = [[UIImageView alloc]initWithFrame:tate3];

    // 画像の読み込み
    imageViewtate3.image = [UIImage imageNamed:@"block_0.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewtate3];





    //横画像1の実装
    CGRect yoko1 = CGRectMake(160, 230, 40, 40);
    UIImageView *imageViewyoko1 = [[UIImageView alloc]initWithFrame:yoko1];

    // 画像の読み込み
    imageViewyoko1.image = [UIImage imageNamed:@"block_1.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewyoko1];





    //横画像2の実装
    CGRect yoko2 = CGRectMake(200, 230, 40, 40);
    UIImageView *imageViewyoko2 = [[UIImageView alloc]initWithFrame:yoko2];

    // 画像の読み込み
    imageViewyoko2.image = [UIImage imageNamed:@"block_1.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewyoko2];





    //横画像3の実装
    CGRect yoko3 = CGRectMake(240, 230, 40, 40);
    UIImageView *imageViewyoko3 = [[UIImageView alloc]initWithFrame:yoko3];

    // 画像の読み込み
    imageViewyoko3.image = [UIImage imageNamed:@"block_1.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewyoko3];





    //ばつ画像の実装
    CGRect batsu = CGRectMake(5, 320, 50, 50);
    UIImageView *imageViewbatsu = [[UIImageView alloc]initWithFrame:batsu];

    // 画像の読み込み
    imageViewbatsu.image = [UIImage imageNamed:@"batsu.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewbatsu];





    //カギ画像1の実装
    CGRect kagi1 = CGRectMake(80, 340, 40, 40);
    UIImageView *imageViewkagi1 = [[UIImageView alloc]initWithFrame:kagi1];

    // 画像の読み込み
    imageViewkagi1.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkagi1];





    //カギ画像2の実装
    CGRect kagi2 = CGRectMake(80, 380, 40, 40);
    UIImageView *imageViewkagi2 = [[UIImageView alloc]initWithFrame:kagi2];

    // 画像の読み込み
    imageViewkagi2.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkagi2];





    //カギ画像3の実装
    CGRect kagi3 = CGRectMake(120, 380, 40, 40);
    UIImageView *imageViewkagi3 = [[UIImageView alloc]initWithFrame:kagi3];

    // 画像の読み込み
    imageViewkagi3.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkagi3];





    //カギ画像4の実装
    CGRect kagi4 = CGRectMake(240, 340, 40, 40);
    UIImageView *imageViewkagi4 = [[UIImageView alloc]initWithFrame:kagi4];

    // 画像の読み込み
    imageViewkagi4.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkagi4];





    //カギ画像5の実装
    CGRect kagi5 = CGRectMake(240, 380, 40, 40);
    UIImageView *imageViewkagi5 = [[UIImageView alloc]initWithFrame:kagi5];

    // 画像の読み込み
    imageViewkagi5.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkagi5];





    //カギ画像6の実装
    CGRect kagi6 = CGRectMake(200, 380, 40, 40);
    UIImageView *imageViewkagi6 = [[UIImageView alloc]initWithFrame:kagi6];

    // 画像の読み込み
    imageViewkagi6.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkagi6];





    //カギ画像7の実装
    CGRect kagi7 = CGRectMake(80, 430, 40, 40);
    UIImageView *imageViewkagi7 = [[UIImageView alloc]initWithFrame:kagi7];

    // 画像の読み込み
    imageViewkagi7.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkagi7];





    //カギ画像8の実装
    CGRect kagi8 = CGRectMake(80, 470, 40, 40);
    UIImageView *imageViewkagi8 = [[UIImageView alloc]initWithFrame:kagi8];

    // 画像の読み込み
    imageViewkagi8.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkagi8];





    //カギ画像9の実装
    CGRect kagi9 = CGRectMake(120, 430, 40, 40);
    UIImageView *imageViewkagi9 = [[UIImageView alloc]initWithFrame:kagi9];

    // 画像の読み込み
    imageViewkagi9.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkagi9];





    //カギ画像10の実装
    CGRect kagi10 = CGRectMake(200, 430, 40, 40);
    UIImageView *imageViewkagi10 = [[UIImageView alloc]initWithFrame:kagi10];

    // 画像の読み込み
    imageViewkagi10.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkagi10];





    //カギ画像11の実装
    CGRect kagi11 = CGRectMake(240, 430, 40, 40);
    UIImageView *imageViewkagi11 = [[UIImageView alloc]initWithFrame:kagi11];

    // 画像の読み込み
    imageViewkagi11.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkagi11];





    //カギ画像12の実装
    CGRect kagi12 = CGRectMake(240, 470, 40, 40);
    UIImageView *imageViewkagi12 = [[UIImageView alloc]initWithFrame:kagi12];

    // 画像の読み込み
    imageViewkagi12.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkagi12];






    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(0, 520, 150, 50);
    [btn1 setTitle:@"TOPに戻る" forState:UIControlStateNormal];
    [btn1.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [btn1 addTarget:self action:@selector(tapMe3:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];

    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(130, 520, 250, 50);
    [btn2 setTitle:@"次へ進む" forState:UIControlStateNormal];
    [btn2.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [btn2 addTarget:self action:@selector(tapMe4:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];


}

- (void)tapMe3:(UIButton*)sender {

    //遷移先ViewControllerクラスのインスタンス生成
    UIViewController *toViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC1"];
    //手順1で付けた名前
   [self presentViewController:toViewController animated:YES completion:nil];



}

- (void)tapMe4:(UIButton*)sender {


    //遷移先ViewControllerクラスのインスタンス生成
    UIViewController *toRule2ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC4"];
    //手順1で付けた名前
    [self presentViewController:toRule2ViewController animated:YES completion:nil];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 常に回転させない
- (BOOL)shouldAutorotate
{
    return NO;
}

// 縦のみサポート
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
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

@end
