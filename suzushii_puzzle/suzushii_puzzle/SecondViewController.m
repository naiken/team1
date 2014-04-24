//
//  SecondViewController.m
//
//  Created by Rento Sugiyama on 4/11/14.
//  Copyright (c) 2014 Rento Sugiyama. All rights reserved.
//

#import "SecondViewController.h"

#import "appCCloud.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
//SecondViewControllerクラスの実装

@synthesize flag = _flag;
//プロパティに書いたらシンセサイズに書かなくてはならない。

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



//#pragma mark - View lifecycle



- (void)viewDidLoad
{
    [super viewDidLoad];

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



    NSLog(@"%ld",(long)_flag);

    switch(_flag){
    case 1:
        fallSpeed = 0.6;
        break;

    case 2:
        fallSpeed = 0.4;
        break;

    case 3:
        fallSpeed = 0.3;
        break;

    case 4:
        fallSpeed = 0.2;
        break;

    case 5:
        fallSpeed = 0.1;
        break;


    default:
        // 上記の処理をbreakで抜けない限り常に処理
        break;
    }

        NSLog(@"%f", fallSpeed);


    UILabel *ruleLabelPoint = [[UILabel alloc] init];
    ruleLabelPoint.frame = CGRectMake(0, 20, 120, 30);
    ruleLabelPoint.text = @"Point:";
    ruleLabelPoint.textColor = [UIColor blackColor];
    ruleLabelPoint.backgroundColor = [UIColor whiteColor];
    ruleLabelPoint.font = [UIFont boldSystemFontOfSize:24];
    [self.view addSubview:ruleLabelPoint];


}





- (CALayer *)makeBlockLayerAtPoint:(CGPoint)pos type:(int)type
/*!
 @method makeBlockLayerAtPoint:type:
 指定された位置に、指定された種類のブロックを作成します。
 */

{
    CALayer *block = [CALayer layer];
    block.bounds = CGRectMake(0, 0, 60, 60);
    block.position = pos;
    NSString *blockName = [NSString stringWithFormat:@"block_%d", type];
    block.name = blockName;
    NSString *imageName = [blockName stringByAppendingPathExtension:@"png"];
    block.contents = (id)[UIImage imageNamed:imageName].CGImage;
    return block;
}





- (void)addNewBlock:(NSTimer *)timer
/*!
 @method addNewBlock:
 上から落ちてくるブロックを新しく追加します。
 */
{
    CALayer *baseLayer = [self.view layer];

    int blockType = rand() % 3;
    CALayer *block1 = [self makeBlockLayerAtPoint:CGPointMake(2 * 60 + 30 + 10, -30-10) type:blockType];
    [baseLayer addSublayer:block1];
    mLayer1 = block1;

    blockType = rand() % 3;
    CALayer *block2 = [self makeBlockLayerAtPoint:CGPointMake(2 * 60 + 30 + 10, -30-10) type:blockType];
    [baseLayer addSublayer:block2];
    mLayer2 = block2;

    [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(dropBlock:) userInfo:nil repeats:NO];
}






- (void)viewWillAppear:(BOOL)animated
/*!
 @method viewWillAppear:
 このビューが表示される直前に呼ばれます。
 ゲームの初期化は通常ここで行います。
 */
{
    // 乱数の初期化
    srand((unsigned int)time(NULL));

    // 背景画像の表示
    self.view.layer.contents = (id)[UIImage imageNamed:@"back.jpg"].CGImage;

    // オーディオ・プレーヤのセットアップ
    NSURL *bgm1URL = [[NSBundle mainBundle] URLForResource:@"newbgm" withExtension:@"mp3"];
    bgmPlayer1 = [[AVAudioPlayer alloc] initWithContentsOfURL:bgm1URL error:NULL];
    [bgmPlayer1 prepareToPlay];
    bgmPlayer1.numberOfLoops = -1;

    NSURL *se1URL = [[NSBundle mainBundle] URLForResource:@"se1" withExtension:@"caf"];
    sePlayer1 = [[AVAudioPlayer alloc] initWithContentsOfURL:se1URL error:NULL];
    [sePlayer1 prepareToPlay];

    NSURL *se2URL = [[NSBundle mainBundle] URLForResource:@"se2" withExtension:@"caf"];
    sePlayer2 = [[AVAudioPlayer alloc] initWithContentsOfURL:se2URL error:NULL];
    [sePlayer2 prepareToPlay];

    NSURL *se3URL = [[NSBundle mainBundle] URLForResource:@"se3" withExtension:@"caf"];
    sePlayer3 = [[AVAudioPlayer alloc] initWithContentsOfURL:se3URL error:NULL];
    [sePlayer3 prepareToPlay];

    // 各種ジェスチャ・リコグナイザのセットアップ
    UISwipeGestureRecognizer *swipeRecognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeRecognizerLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeRecognizerLeft];

    UISwipeGestureRecognizer *swipeRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeRecognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRecognizerRight];

    UISwipeGestureRecognizer *swipeRecognizerUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeRecognizerUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeRecognizerUp];

    UISwipeGestureRecognizer *swipeRecognizerDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    swipeRecognizerDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeRecognizerDown];

    // 初期配置のレイヤのセットアップ
    CALayer *baseLayer = [self.view layer];
    baseLayer.contents = (id)[UIImage imageNamed:@"back.jpg"].CGImage;

    int moonX = rand() % 3 + 1;

    for (int x = 0; x < 5; x++) {
        int height = rand() % 2 + 1;
        if (x == moonX) {
            height = 3;
        }
        for (int y = 0; y < height; y++) {
            int blockType = rand() % 3;
            CALayer *block = [self makeBlockLayerAtPoint:CGPointMake(x * 60 + 30 + 10, 480 - 10 - y * 60 - 30) type:blockType];
            [baseLayer addSublayer:block];
        }
        if (x == moonX) {
            CALayer *moon = [self makeBlockLayerAtPoint:CGPointMake(x * 60 + 30 + 10, 480 - 10 - height * 60 - 30) type:3];
            [baseLayer addSublayer:moon];
        }
    }

    // 新しいブロックを上から降らせる
    [self addNewBlock:nil];


    // BGMの再生
    [bgmPlayer1 play];
}





- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}





- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}





//- (void)viewDidDisappear:(BOOL)animated
//{
//	[super viewDidDisappear:animated];
//
//    [bgmPlayer1 release];
//    [sePlayer1 release];
//    [sePlayer2 release];
//    [sePlayer3 release];
//}





- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //ビューのメモリが足りなくなったときに呼ばれる
   }




- (void)dropFloatingBlocks
/*!
 @method dropFloatingBlocks
 空中に浮いたままになっているブロックを落とします。
 */
{
    CALayer *baseLayer = [self.view layer];

    int count = 0;
    BOOL clear = NO;
    BOOL over = NO;
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.3];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];

    for (int x = 0; x < 5; x++) {
        // 最初に空いている位置を探す
        int bottom = 8;
        for (int y = 0; y < 8; y++) {
            CALayer *layer = [baseLayer hitTest:CGPointMake(x * 60 + 30 + 10, 480 - 10 - y * 60 - 30)];
            if (layer == nil || layer.name == nil) {
                bottom = y;
                break;
            }
        }
        if (bottom == 8) {
            over = YES;
            break;
        }

        // その上のブロックを探す
        int up = 8;
        for (int y = bottom + 1; y < 8; y++) {
            CALayer *layer = [baseLayer hitTest:CGPointMake(x * 60 + 30 + 10, 480 - 10 - y * 60 - 30)];
            if (layer != nil && layer.name != nil) {
                up = y;
                break;
            }
        }

        // 間のブロックを削除する
        if (up < 8) {
            for (int y = up; y < 8; y++) {
                CALayer *layer = [baseLayer hitTest:CGPointMake(x * 60 + 30 + 10, 480 - 10 - y * 60 - 30)];
                if (layer == nil || layer.name == nil) {
                    break;
                }
                CGPoint pos = layer.position;
                pos.y += 60 * (up - bottom);
                layer.position = pos;
                count++;
                if ([layer.name isEqualToString:@"block_3"] && pos.y >= 440.0f) {
                    clear = YES;
                }
            }
        }
    }
    [CATransaction commit];

    if (clear) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"ゲームクリアです！！"
                              message:@"トップ画面に戻ります。"
                              delegate:self
                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];

        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

        // ユーザーデフォルトに整数を登録
        [userDefaults setInteger:_flag forKey:@"clear"];

        // 値をすぐに反映させる
        [userDefaults synchronize];

        return;

    }
    if (over) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"ゲームオーバーです。。。"
                              message:@"トップ画面に戻ります。"
                              delegate:self
                              cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];

//        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//
//        // ユーザーデフォルトに整数を登録
//        [userDefaults setInteger:_flag forKey:@"clear"];
//
//        // 値をすぐに反映させる
//        [userDefaults synchronize];

        return;
    }

    if (count == 0) {
        [self addNewBlock:nil];
    } else {
        [sePlayer2 pause];
        sePlayer2.currentTime = 0;
        [sePlayer2 play];
        [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(addNewBlock:) userInfo:nil repeats:NO];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex

{

     [bgmPlayer1 stop];

    //遷移先ViewControllerクラスのインスタンス生成
    UIViewController *ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"VC1"];
    //手順1で付けた名前

    switch (buttonIndex) {
               case 0://押したボタンがOKなら画面遷移
            [self presentViewController:ViewController animated:YES completion:nil];
            break;

    }
}


- (void)checkDeleteFromLayer:(CALayer *)layer
/*!
 @method checkDeleteFromLayer:
 指定されたレイヤを元に、削除できるレイヤがつながっているかどうかを判定し、削除の処理を行います。
 */
{
    CGPoint pos = layer.position;
    CALayer *baseLayer = [self.view layer];

    // X方向の削除判定
    int minX = 0;
    int maxX = 0;
    for (int x = 0; x < 5; x++) {
        CALayer *hitLayer = [baseLayer hitTest:CGPointMake(pos.x + (minX - 1) * 60, pos.y)];
        if (![hitLayer.name isEqualToString:layer.name]) {
            break;
        }
        minX--;
    }
    for (int x = 0; x < 5; x++) {
        CALayer *hitLayer = [baseLayer hitTest:CGPointMake(pos.x + (maxX + 1) * 60, pos.y)];
        if (![hitLayer.name isEqualToString:layer.name]) {
            break;
        }
        maxX++;
    }

    // Y方向の削除判定
    int minY = 0;
    int maxY = 0;
    for (int y = 0; y < 8; y++) {
        CALayer *hitLayer = [baseLayer hitTest:CGPointMake(pos.x, pos.y + (minY - 1) * 60)];
        if (![hitLayer.name isEqualToString:layer.name]) {
            break;
        }
        minY--;
    }
    for (int y = 0; y < 8; y++) {
        CALayer *hitLayer = [baseLayer hitTest:CGPointMake(pos.x, pos.y + (maxY + 1) * 60)];
        if (![hitLayer.name isEqualToString:layer.name]) {
            break;
        }
        maxY++;
    }

    // 削除の実行
    BOOL erased = NO;
    if ((maxX - minX + 1) >= 3) {
        erased = YES;
        for (int x = minX; x <= maxX; x++) {
            CALayer *layer = [baseLayer hitTest:CGPointMake(pos.x + x * 60, pos.y)];
            if (layer.name) {
                [layer removeFromSuperlayer];
                if (mLayer1 == layer) {
                    mLayer1 = nil;
                }
                if (mLayer2 == layer) {
                    mLayer2 = nil;
                }
            }
        }
    }
    if ((maxY - minY + 1) >= 3) {
        erased = YES;
        for (int y = minY; y <= maxY; y++) {
            CALayer *layer = [baseLayer hitTest:CGPointMake(pos.x, pos.y + y * 60)];
            if (layer.name) {
                [layer removeFromSuperlayer];
                if (mLayer1 == layer) {
                    mLayer1 = nil;
                }
                if (mLayer2 == layer) {
                    mLayer2 = nil;
                }
            }
        }
    }
    if (erased) {
        // SE3の再生
        [sePlayer3 pause];
        sePlayer3.currentTime = 0;
        [sePlayer3 play];

        sum += 10;

        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

        // ユーザーデフォルトに整数を登録
        [userDefaults setInteger:sum forKey:@"point"];

        // 値をすぐに反映させる
        [userDefaults synchronize];
        

        UILabel *ruleLabelScore = [[UILabel alloc] init];
        ruleLabelScore.frame = CGRectMake(75, 20, 50, 30);
        ruleLabelScore.text = [[NSString alloc] initWithFormat:@"%d", sum];
        ruleLabelScore.textColor = [UIColor blackColor];
        ruleLabelScore.backgroundColor = [UIColor whiteColor];
        ruleLabelScore.font = [UIFont boldSystemFontOfSize:24];
        [self.view addSubview:ruleLabelScore];

    }

}





- (void)dropBlock:(NSTimer *)timer
/*!
 @method dropBlock:
 落ちているブロックを1回分下に落とします。
 */
{
    CGPoint pos = mLayer1.position;
    pos.y += 60;

    CALayer *baseLayer = [self.view layer];
    CALayer *hitLayer = [baseLayer hitTest:pos];
    if (hitLayer.name || pos.y > 440.0f) {
        [self checkDeleteFromLayer:mLayer1];
        if (mLayer2) {
            [self checkDeleteFromLayer:mLayer2];
        }
        [self dropFloatingBlocks];
        
        return;
    }

    [CATransaction begin];
    [CATransaction setAnimationDuration:0.7];
    mLayer2.position = mLayer1.position;
    mLayer1.position = pos;
    [CATransaction commit];

    [NSTimer scheduledTimerWithTimeInterval:fallSpeed target:self selector:@selector(dropBlock:) userInfo:nil repeats:NO];
}



- (void)swipe:(UISwipeGestureRecognizer *)recognizer
/*!
 @method swipe:
 画面がスワイプされたときに呼ばれます。
 */
{
    // 下方向か上方向の場合
    if (recognizer.direction == UISwipeGestureRecognizerDirectionDown || recognizer.direction == UISwipeGestureRecognizerDirectionUp) {
        // SE1の再生
        [sePlayer1 pause];
        sePlayer1.currentTime = 0;
        [sePlayer1 play];

        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        CGPoint pos1 = mLayer1.position;
        mLayer1.position = mLayer2.position;
        mLayer2.position = pos1;
        [CATransaction commit];

        CALayer *layer1 = mLayer1;
        mLayer1 = mLayer2;
        mLayer2 = layer1;

        return;
    }

    // 左方向か右方向の場合
    CGPoint pos = mLayer1.position;
    if (recognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        pos.x -= 60;
    } else if (recognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        pos.x += 60;
    }

    CALayer *baseLayer = [self.view layer];
    CALayer *hitLayer = [baseLayer hitTest:pos];
    if (!hitLayer.name && pos.x > 0.0f && pos.x < 320.0f) {
        // SE1の再生
        [sePlayer1 pause];
        sePlayer1.currentTime = 0;
        [sePlayer1 play];

        // レイヤの左右移動
        [CATransaction begin];
        [CATransaction setDisableActions:YES];
        mLayer1.position = pos;
        pos.y -= 60;
        mLayer2.position = pos;
        [CATransaction commit];
    }
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
