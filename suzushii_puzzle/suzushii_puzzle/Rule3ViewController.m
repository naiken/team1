//
//  Rule3ViewController.m
//
//  Created by Rento Sugiyama on 4/17/14.
//  Copyright (c) 2014 Rento Sugiyama. All rights reserved.
//

#import "Rule3ViewController.h"

@interface Rule3ViewController ()

@end

@implementation Rule3ViewController

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
    UILabel *ruleLabel12 = [[UILabel alloc] init];
    ruleLabel12.frame = CGRectMake(5, 20, (self.view.bounds.size.width-20), 20);
    ruleLabel12.text = @"キツネちゃんをパズルの一番下の段に";
    ruleLabel12.textColor = [UIColor blueColor];
    ruleLabel12.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel12];

    // create title label.
    UILabel *ruleLabel13 = [[UILabel alloc] init];
    ruleLabel13.frame = CGRectMake(5, 50, (self.view.bounds.size.width-20), 20);
    ruleLabel13.text = @"連れてくることができたら・・・";
    ruleLabel13.textColor = [UIColor blueColor];
    ruleLabel13.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel13];

    // create title label.
    UILabel *ruleLabel14 = [[UILabel alloc] init];
    ruleLabel14.frame = CGRectMake(5, 80, (self.view.bounds.size.width-20), 40);
    ruleLabel14.text = @"クリアです!!";
    ruleLabel14.textColor = [UIColor redColor];
    ruleLabel14.font = [UIFont boldSystemFontOfSize:34];
    [self.view addSubview:ruleLabel14];


    // create title label.
    UILabel *ruleLabel15 = [[UILabel alloc] init];
    ruleLabel15.frame = CGRectMake(5, 290, (self.view.bounds.size.width-20), 20);
    ruleLabel15.text = @"クリアすると、TOP画面の";
    ruleLabel15.textColor = [UIColor blueColor];
    ruleLabel15.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel15];


    // create title label.
    UILabel *ruleLabel16 = [[UILabel alloc] init];
    ruleLabel16.frame = CGRectMake(5, 320, (self.view.bounds.size.width-20), 20);
    ruleLabel16.text = @"Levelボタンの下に";
    ruleLabel16.textColor = [UIColor blueColor];
    ruleLabel16.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel16];


    // create title label.
    UILabel *ruleLabel17 = [[UILabel alloc] init];
    ruleLabel17.frame = CGRectMake(5, 350, (self.view.bounds.size.width-20), 20);
    ruleLabel17.text = @"はなまるマークがつきます！！";
    ruleLabel17.textColor = [UIColor blueColor];
    ruleLabel17.font = [UIFont boldSystemFontOfSize:17];
    [self.view addSubview:ruleLabel17];





    

    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn5.frame = CGRectMake(0, 520, 150, 50);
    [btn5 setTitle:@"前画面に戻る" forState:UIControlStateNormal];
    [btn5.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [btn5 addTarget:self action:@selector(tapMe5:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn5];

    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn6.frame = CGRectMake(130, 520, 250, 50);
    [btn6 setTitle:@"終了する" forState:UIControlStateNormal];
    [btn6.titleLabel setFont:[UIFont systemFontOfSize:24]];
    [btn6 addTarget:self action:@selector(tapMe6:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn6];



    //キツネ画像の実装
    CGRect kitsune = CGRectMake(80, 130, 150, 150);
    UIImageView *imageViewkitsune = [[UIImageView alloc]initWithFrame:kitsune];

    // 画像の読み込み
    imageViewkitsune.image = [UIImage imageNamed:@"block_3.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewkitsune];




    //はなまる画像の実装
    CGRect hanamaru = CGRectMake(80, 375, 150, 150);
    UIImageView *imageViewhanamaru = [[UIImageView alloc]initWithFrame:hanamaru];

    // 画像の読み込み
    imageViewhanamaru.image = [UIImage imageNamed:@"hanamaru.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewhanamaru];



    
}

- (void)tapMe5:(UIButton*)sender {

    //遷移先ViewControllerクラスのインスタンス生成
    UIViewController *toRule2ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC4"];
    //手順1で付けた名前
    [self presentViewController:toRule2ViewController animated:YES completion:nil];



}

- (void)tapMe6:(UIButton*)sender {


    //遷移先ViewControllerクラスのインスタンス生成
    UIViewController *toViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC1"];
    //手順1で付けた名前
    [self presentViewController:toViewController animated:YES completion:nil];
    
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
