//
//  Rule2ViewController.m
//
//  Created by Rento Sugiyama on 4/17/14.
//  Copyright (c) 2014 Rento Sugiyama. All rights reserved.
//

#import "Rule2ViewController.h"

@interface Rule2ViewController ()

@end

@implementation Rule2ViewController

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

    // create title label.
    UILabel *ruleLabel5 = [[UILabel alloc] init];
    ruleLabel5.frame = CGRectMake(5, 20, (self.view.bounds.size.width-20), 20);
    ruleLabel5.text = @"縦方向にフリックすると降ってくる";
    ruleLabel5.textColor = [UIColor blueColor];
    ruleLabel5.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel5];

    // create title label.
    UILabel *ruleLabel6 = [[UILabel alloc] init];
    ruleLabel6.frame = CGRectMake(5, 50, (self.view.bounds.size.width-20), 20);
    ruleLabel6.text = @"ピースの上下を交換できます。";
    ruleLabel6.textColor = [UIColor blueColor];
    ruleLabel6.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel6];


    // create title label.
    UILabel *yajirusi = [[UILabel alloc] init];
    yajirusi.frame = CGRectMake(120, 130, (self.view.bounds.size.width-20), 20);
    yajirusi.text = @"→";
    yajirusi.textColor = [UIColor blackColor];
    yajirusi.font = [UIFont boldSystemFontOfSize:72];
    [self.view addSubview:yajirusi];


    // create title label.
    UILabel *ruleLabel7 = [[UILabel alloc] init];
    ruleLabel7.frame = CGRectMake(5, 200, (self.view.bounds.size.width-20), 20);
    ruleLabel7.text = @"しかし、降ってくるパズルの向きを";
    ruleLabel7.textColor = [UIColor blueColor];
    ruleLabel7.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel7];


    // create title label.
    UILabel *ruleLabel8 = [[UILabel alloc] init];
    ruleLabel8.frame = CGRectMake(5, 230, (self.view.bounds.size.width-20), 20);
    ruleLabel8.text = @"変えることはできません。";
    ruleLabel8.textColor = [UIColor blueColor];
    ruleLabel8.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel8];

    // create title label.
    UILabel *yajirusi1 = [[UILabel alloc] init];
    yajirusi1.frame = CGRectMake(120, 310, (self.view.bounds.size.width-20), 20);
    yajirusi1.text = @"→";
    yajirusi1.textColor = [UIColor blackColor];
    yajirusi1.font = [UIFont boldSystemFontOfSize:72];
    [self.view addSubview:yajirusi1];


    // create title label.
    UILabel *ruleLabel9 = [[UILabel alloc] init];
    ruleLabel9.frame = CGRectMake(5, 390, (self.view.bounds.size.width-20), 20);
    ruleLabel9.text = @"降ってくるピースを横方向に";
    ruleLabel9.textColor = [UIColor blueColor];
    ruleLabel9.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel9];



    // create title label.
    UILabel *ruleLabel10 = [[UILabel alloc] init];
    ruleLabel10.frame = CGRectMake(5, 420, (self.view.bounds.size.width-20), 20);
    ruleLabel10.text = @"フリックすれば、ピースを落とす";
    ruleLabel10.textColor = [UIColor blueColor];
    ruleLabel10.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel10];


    // create title label.
    UILabel *ruleLabel11 = [[UILabel alloc] init];
    ruleLabel11.frame = CGRectMake(5, 450, (self.view.bounds.size.width-20), 20);
    ruleLabel11.text = @"位置を変えることができます。";
    ruleLabel11.textColor = [UIColor blueColor];
    ruleLabel11.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel11];




    //上下画像1の実装
    CGRect jouge1 = CGRectMake(50, 85, 50, 50);
    UIImageView *imageViewjouge1 = [[UIImageView alloc]initWithFrame:jouge1];

    // 画像の読み込み
    imageViewjouge1.image = [UIImage imageNamed:@"block_0.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewjouge1];





    //上下画像2の実装
    CGRect jouge2 = CGRectMake(50, 135, 50, 50);
    UIImageView *imageViewjouge2 = [[UIImageView alloc]initWithFrame:jouge2];

    // 画像の読み込み
    imageViewjouge2.image = [UIImage imageNamed:@"block_1.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewjouge2];





    //上下画像3の実装
    CGRect jouge3 = CGRectMake(210, 85, 50, 50);
    UIImageView *imageViewjouge3 = [[UIImageView alloc]initWithFrame:jouge3];

    // 画像の読み込み
    imageViewjouge3.image = [UIImage imageNamed:@"block_1.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewjouge3];





    //上下画像4の実装
    CGRect jouge4 = CGRectMake(210, 135, 50, 50);
    UIImageView *imageViewjouge4 = [[UIImageView alloc]initWithFrame:jouge4];

    // 画像の読み込み
    imageViewjouge4.image = [UIImage imageNamed:@"block_0.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewjouge4];





    //ばつ2の実装
    CGRect batsu2 = CGRectMake(125, 295, 50, 50);
    UIImageView *imageViewbatsu2 = [[UIImageView alloc]initWithFrame:batsu2];

    // 画像の読み込み
    imageViewbatsu2.image = [UIImage imageNamed:@"batsu.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewbatsu2];





    //上下画像5の実装
    CGRect jouge5 = CGRectMake(50, 270, 50, 50);
    UIImageView *imageViewjouge5 = [[UIImageView alloc]initWithFrame:jouge5];

    // 画像の読み込み
    imageViewjouge5.image = [UIImage imageNamed:@"block_1.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewjouge5];








    //上下画像6の実装
    CGRect jouge6 = CGRectMake(50, 320, 50, 50);
    UIImageView *imageViewjouge6 = [[UIImageView alloc]initWithFrame:jouge6];

    // 画像の読み込み
    imageViewjouge6.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewjouge6];





    //横置き画像1の実装
    CGRect yokooki1 = CGRectMake(200, 295, 50, 50);
    UIImageView *imageViewyokooki1 = [[UIImageView alloc]initWithFrame:yokooki1];

    // 画像の読み込み
    imageViewyokooki1.image = [UIImage imageNamed:@"block_2.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewyokooki1];





    //横置き画像2の実装
    CGRect yokooki2 = CGRectMake(250, 295, 50, 50);
    UIImageView *imageViewyokooki2 = [[UIImageView alloc]initWithFrame:yokooki2];

    // 画像の読み込み
    imageViewyokooki2.image = [UIImage imageNamed:@"block_1.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewyokooki2];









    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.frame = CGRectMake(0, 520, 150, 50);
    [btn3 setTitle:@"前画面に戻る" forState:UIControlStateNormal];
    [btn3.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [btn3 addTarget:self action:@selector(tapMe5:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];

    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn4.frame = CGRectMake(130, 520, 250, 50);
    [btn4 setTitle:@"次へ進む" forState:UIControlStateNormal];
    [btn4.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [btn4 addTarget:self action:@selector(tapMe6:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn4];
    
    
}


- (void)tapMe5:(UIButton*)sender {

    //遷移先ViewControllerクラスのインスタンス生成
    UIViewController *toRuleViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC3"];
    //手順1で付けた名前
    [self presentViewController:toRuleViewController animated:YES completion:nil];



}

- (void)tapMe6:(UIButton*)sender {


    //遷移先ViewControllerクラスのインスタンス生成
    UIViewController *toRule3ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC5"];
    //手順1で付けた名前
    [self presentViewController:toRule3ViewController animated:YES completion:nil];
    
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
