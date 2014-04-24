//
//  AppDelegate.m
//
//  Created by Rento Sugiyama on 4/8/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "AppDelegate.h"
//AppDelegate.hヘッダーファイルをインポート

#import "ViewController.h"
//ViewControllerヘッダーファイルをインポート

#import "SecondViewController.h"
//SecondViewControllerヘッダーファイルをインポート

#import "RuleViewController.h"


@implementation AppDelegate
//AppDelegateクラスの実装

@synthesize window = _window;
//書き方.....@synthesize 変数名１,変数名２,・・・;

@synthesize viewController = _viewController;
//上記はメモリのアドレスと、_viewControllerを紐付けるためのコード
//最近は、勝手に紐付けしてくれるので、@synthesizeでは書かない。
//インプリメントセクション（@implementation～@end）に記述するコンパイラディレクティブ。
//@propertyとセットで使用することで、アクセッサメソッドを記述しなくても、セッタメソッド、ゲッタメソッドが自動生成されます。

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
////アプリ起動時に呼ばれます。初期化処理を書くのに良い。
{
    // オーディオ再生の設定
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategorySoloAmbient error:NULL];
    [audioSession setActive:YES error:NULL];



//    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//
//    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
//    //インスタンスの生成・初期化を行い、id型の戻り値をself.viewControllerに代入
//    self.window.rootViewController = self.viewController;
//    [self.window makeKeyAndVisible];
//    //可視できるキーの作成

//上記コードは.xibファイルを使うときのみ必要となる。おそらく.xibファイルに登録するものではないか。
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application
////アプリがアクティブでなくなる直前に呼ばれます。
{
    }



- (void)applicationDidEnterBackground:(UIApplication *)application
//アプリがバックグラウンドになったときに呼ばれます。
{
    }

- (void)applicationWillEnterForeground:(UIApplication *)application
//アプリがフォアグラウンド(画面上で最も手前に表示されている項目や、現在選択している項目、優先順位の高い処理など)に戻ったときに呼ばれます。
{

}

- (void)applicationDidBecomeActive:(UIApplication *)application
//アプリがアクティブになったときに呼ばれます。
{
   }

- (void)applicationWillTerminate:(UIApplication *)application
//アプリが終了したときに呼ばれます。
{
   }

@end
