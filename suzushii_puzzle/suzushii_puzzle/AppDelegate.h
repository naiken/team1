//
//  AppDelegate.h
//
//  Created by Rento Sugiyama on 4/8/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
//UIKitヘッダーをインポートする(関連プログラムの呼び出し)

#import <AVFoundation/AVFoundation.h>
//AVFoundationヘッダーをインポートする(関連プログラムの呼び出し)

@class ViewController;
@class SecondViewController;

//「これはクラス名だよ」と宣言するだけ。実際に読み込みは行われない。「#import」と違い、実装ファイル側でヘッダーファイルを読み込む必要がある。


@interface AppDelegate : UIResponder <UIApplicationDelegate>
//クラス宣言

@property (strong, nonatomic) UIWindow *window;
//プロパティとは便利なメンバ変数、フィールドみたいなもの。

@property (strong, nonatomic) ViewController *viewController;

//プロパティを指定すると、外部のクラスからアクセスできるようになる。
//「ViewController *viewController;」→→　「型　メモリのアドレス(ポインタ)」


@end
