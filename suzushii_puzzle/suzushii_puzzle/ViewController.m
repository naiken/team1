//
//  ViewController.m
//
//  Created by Rento Sugiyama on 4/8/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

#import "appCCloud.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSInteger difficultlyFlag;
}

- (void)viewDidLoad
//ビューが読み込まれたときに呼ばれるメソッド。初期化処理などをする
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.



    //メディアキーを指定します。管理画面内にて確認できるメディアキーを指定しないと成果が取得できません。
    [appCCloud setupAppCWithMediaKey:@"7b447d385b78d28e1579b185b84d2167aa3d2e18" option:APPC_CLOUD_AD];

    /*
     *左上：horizontal:appCHorizontalLeft vertical:appCVerticalTop
     *中央上：horizontal:appCHorizontalCenter vertical:appCVerticalTop
     *右上：horizontal:appCHorizontalRight vertical:appCVerticalTop
     *左下：horizontal:appCHorizontalLeft vertical:appCVerticalBottom
     *中央下：horizontal:appCHorizontalCenter vertical:appCVerticalBottom
     *右下：horizontal:appCHorizontalRight vertical:appCVerticalBottom
     *autoreleaseはARC非対応時のみ記述してください。
     */

    appCMoveIconView* view = [[appCMoveIconView alloc] initWithViewController:self horizontal:appCHorizontalCenter vertical:appCVerticalBottom];

    ////広告viewは最後に追加してください。表示されないケースがあります。
    [self.view addSubview:view];




    NSUserDefaults *userDefaultsclear = [NSUserDefaults standardUserDefaults];

    // ユーザーデフォルトから整数を取得
    NSInteger stageClear = [userDefaultsclear integerForKey:@"clear"];



    NSUserDefaults *userDefaultspoint = [NSUserDefaults standardUserDefaults];

    // ユーザーデフォルトから整数を取得
    NSInteger maxPoint = [userDefaultspoint integerForKey:@"point"];

    UILabel *ruleLabelHighScore = [[UILabel alloc] init];
    ruleLabelHighScore.frame = CGRectMake(5, 200, 200, 35);
    ruleLabelHighScore.text = @"ハイスコア：";
    ruleLabelHighScore.textColor = [UIColor blackColor];
    ruleLabelHighScore.backgroundColor = [UIColor whiteColor];
    ruleLabelHighScore.font = [UIFont boldSystemFontOfSize:32];
    [self.view addSubview:ruleLabelHighScore];

    UILabel *ruleLabelScore = [[UILabel alloc] init];
    ruleLabelScore.frame = CGRectMake(205, 200, 60, 35);
    ruleLabelScore.text = [[NSString alloc] initWithFormat:@"%ld", (long)maxPoint];
    ruleLabelScore.textColor = [UIColor blackColor];
    ruleLabelScore.backgroundColor = [UIColor whiteColor];
    ruleLabelScore.font = [UIFont boldSystemFontOfSize:34];
    [self.view addSubview:ruleLabelScore];



    NSLog(@"%ld", (long)stageClear);

    UIButton *hanamaru1 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *hanamaru2 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *hanamaru3 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *hanamaru4 = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *hanamaru5 = [UIButton buttonWithType:UIButtonTypeCustom];




    switch(stageClear){
            
        case 1:
            // ボタンの位置とサイズを指定
            hanamaru1.frame = CGRectMake(42, 330, 40, 40);

            // 画像を指定
            [hanamaru1 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];


            // ビューに追加
            [self.view addSubview:hanamaru1];
                       break;





        case 2:
            hanamaru1.frame = CGRectMake(42, 330, 40, 40);
            hanamaru2.frame = CGRectMake(142, 330, 40, 40);

            [hanamaru1 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];
            [hanamaru2 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];

            [self.view addSubview:hanamaru1];
            [self.view addSubview:hanamaru2];

            break;





        case 3:

            // ボタンの位置とサイズを指定
            hanamaru1.frame = CGRectMake(42, 330, 40, 40);
            hanamaru2.frame = CGRectMake(142, 330, 40, 40);
            hanamaru3.frame = CGRectMake(242, 330, 40, 40);

            [hanamaru1 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];
            [hanamaru2 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];
            [hanamaru3 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];

            [self.view addSubview:hanamaru1];
            [self.view addSubview:hanamaru2];
            [self.view addSubview:hanamaru3];


            break;





        case 4:
            // ボタンの位置とサイズを指定
            hanamaru1.frame = CGRectMake(42, 330, 40, 40);
            hanamaru2.frame = CGRectMake(142, 330, 40, 40);
            hanamaru3.frame = CGRectMake(242, 330, 40, 40);
            hanamaru4.frame = CGRectMake(42, 455, 40, 40);

            [hanamaru1 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];
            [hanamaru2 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];
            [hanamaru3 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];
            [hanamaru4 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];

            [self.view addSubview:hanamaru1];
            [self.view addSubview:hanamaru2];
            [self.view addSubview:hanamaru3];
            [self.view addSubview:hanamaru4];

            break;





        case 5:

            // ボタンの位置とサイズを指定
            hanamaru1.frame = CGRectMake(42, 330, 40, 40);
            hanamaru2.frame = CGRectMake(142, 330, 40, 40);
            hanamaru3.frame = CGRectMake(242, 330, 40, 40);
            hanamaru4.frame = CGRectMake(42, 455, 40, 40);
            hanamaru5.frame = CGRectMake(142, 455, 40, 40);

            // 画像を指定
            [hanamaru1 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];
            [hanamaru2 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];
            [hanamaru3 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];
            [hanamaru4 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];
            [hanamaru5 setImage:[UIImage imageNamed:@"hanamaru.png"] forState:UIControlStateNormal];

            // ビューに追加
            [self.view addSubview:hanamaru1];
            [self.view addSubview:hanamaru2];
            [self.view addSubview:hanamaru3];
            [self.view addSubview:hanamaru4];
            [self.view addSubview:hanamaru5];


            break;
            
            



        default:
            // 上記の処理をbreakで抜けない限り常に処理
            break;
    }

    
    //1枚の背景画像を画面一杯に拡げて表示する方法。
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"Top_Back.jpg"] drawInRect:self.view.bounds];
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    
    
    
    
    
    //Level1ボタンの実装
    UIButton *tapMeBtnLevel1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // タッチイベントを有効にする
    tapMeBtnLevel1.userInteractionEnabled = YES;

    tapMeBtnLevel1.tag = 1;
    
    // ボタンの位置とサイズを指定
    tapMeBtnLevel1.frame = CGRectMake(25, 250, 75, 75);
    
    // 画像を指定
    [tapMeBtnLevel1 setImage:[UIImage imageNamed:@"NEWkessyou1.png"] forState:UIControlStateNormal];
    
    // タップ時にコールされるメソッドを指定
    [tapMeBtnLevel1 addTarget:self action:@selector(tapMe:) forControlEvents:UIControlEventTouchUpInside];
    
    // ビューに追加
    [self.view addSubview:tapMeBtnLevel1];
    
    
    
    
    
    
    //Level2ボタンの実装
    UIButton *tapMeBtnLevel2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // タッチイベントを有効にする
    tapMeBtnLevel2.userInteractionEnabled = YES;

    tapMeBtnLevel2.tag = 2;
    
    // ボタンの位置とサイズを指定
    tapMeBtnLevel2.frame = CGRectMake(125, 250, 75, 75);
    
    // 画像を指定
    [tapMeBtnLevel2 setImage:[UIImage imageNamed:@"NEWkessyou2.png"] forState:UIControlStateNormal];
    
    // タップ時にコールされるメソッドを指定
    [tapMeBtnLevel2 addTarget:self action:@selector(tapMe:) forControlEvents:UIControlEventTouchUpInside];
    
    // ビューに追加
    [self.view addSubview:tapMeBtnLevel2];
    
    
    
    
    
    
    
    
    //Level3ボタンの実装
    UIButton *tapMeBtnLevel3 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // タッチイベントを有効にする
    tapMeBtnLevel3.userInteractionEnabled = YES;

    tapMeBtnLevel3.tag = 3;
    
    // ボタンの位置とサイズを指定
    tapMeBtnLevel3.frame = CGRectMake(225, 250, 75, 75);
    
    // 画像を指定
    [tapMeBtnLevel3 setImage:[UIImage imageNamed:@"NEWkessyou3.png"] forState:UIControlStateNormal];
    
    // タップ時にコールされるメソッドを指定
    [tapMeBtnLevel3 addTarget:self action:@selector(tapMe:) forControlEvents:UIControlEventTouchUpInside];
    
    // ビューに追加
    [self.view addSubview:tapMeBtnLevel3];
    
    
    
    
    
    
    
    
    //Level4ボタンの実装
    UIButton *tapMeBtnLevel4 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // タッチイベントを有効にする
    tapMeBtnLevel4.userInteractionEnabled = YES;

    tapMeBtnLevel4.tag = 4;
    
    // ボタンの位置とサイズを指定
    tapMeBtnLevel4.frame = CGRectMake(25, 375, 75, 75);
    
    // 画像を指定
    [tapMeBtnLevel4 setImage:[UIImage imageNamed:@"NEWkessyou4.png"] forState:UIControlStateNormal];
    
    // タップ時にコールされるメソッドを指定
    [tapMeBtnLevel4 addTarget:self action:@selector(tapMe:) forControlEvents:UIControlEventTouchUpInside];
    
    // ビューに追加
    [self.view addSubview:tapMeBtnLevel4];
    
    
    
    
    
    
    
    
    //Level5ボタンの実装
    UIButton *tapMeBtnLevel5 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // タッチイベントを有効にする
    tapMeBtnLevel5.userInteractionEnabled = YES;

    tapMeBtnLevel5.tag = 5;
    
    // ボタンの位置とサイズを指定
    tapMeBtnLevel5.frame = CGRectMake(125, 375, 75, 75);
    
    // 画像を指定
    [tapMeBtnLevel5 setImage:[UIImage imageNamed:@"NEWkessyou5.png"] forState:UIControlStateNormal];
    
    // タップ時にコールされるメソッドを指定
    [tapMeBtnLevel5 addTarget:self action:@selector(tapMe:) forControlEvents:UIControlEventTouchUpInside];
    
    // ビューに追加
    [self.view addSubview:tapMeBtnLevel5];







    //リセットボタンの実装
    UIButton *Rule = [UIButton buttonWithType:UIButtonTypeCustom];

    // タッチイベントを有効にする
    Rule.userInteractionEnabled = YES;

    // ボタンの位置とサイズを指定
    Rule.frame = CGRectMake(225, 375, 75, 75);

    // 画像を指定
    [Rule setImage:[UIImage imageNamed:@"Rule.png"] forState:UIControlStateNormal];

    [Rule addTarget:self action:@selector(tapMe2:) forControlEvents:UIControlEventTouchUpInside];

    // ビューに追加
    [self.view addSubview:Rule];





    //Title1画像の実装
    // UIImageViewの初期化
    CGRect Title1 = CGRectMake(10, 50, 300, 70);
    UIImageView *imageViewTitle1 = [[UIImageView alloc]initWithFrame:Title1];

    // 画像の読み込み
    imageViewTitle1.image = [UIImage imageNamed:@"Title1.png"];

    // UIImageViewのインスタンスをビューに追加
    [self.view addSubview:imageViewTitle1];

    
    
//    
//    //Title2画像の実装
//    // UIImageViewの初期化
//    CGRect Title2 = CGRectMake(100, 120, 200, 30);
//    UIImageView *imageViewTitle2 = [[UIImageView alloc]initWithFrame:Title2];
//
//    // 画像の読み込み
//    imageViewTitle2.image = [UIImage imageNamed:@"Title2.png"];
//
//    // UIImageViewのインスタンスをビューに追加
//    [self.view addSubview:imageViewTitle2];

}








- (void)tapMe:(UIButton*)sender {

    difficultlyFlag = sender.tag;

    NSLog(@"%d",(int)sender.tag);
    [self performSegueWithIdentifier:@"ToGameSegue" sender:self];
}





- (void)tapMe2:(UIButton*)sender {

//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

//    // 削除
//    [userDefaults removeObjectForKey:@"clear"];
//    [userDefaults removeObjectForKey:@"point"];
//
//    [userDefaults synchronize];


    [self performSegueWithIdentifier:@"ToRule1Segue" sender:self];
}





- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    SecondViewController* secondVC = segue.destinationViewController;
    if([segue.identifier isEqualToString:@"ToGameSegue"]){

        secondVC.flag = difficultlyFlag;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //ビューのメモリが足りなくなったときに呼ばれる
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

@end
