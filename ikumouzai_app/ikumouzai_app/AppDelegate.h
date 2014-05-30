//
//  AppDelegate.h
//  ikumouzai_app
//
//  Created by marugen Co.,Ltd. on 2014/04/24.
//  Copyright (c) marugen Co.,Ltd. 2014. All rights reserved.
//

#import <UIKit/UIKit.h>
//UIKitヘッダーをインポートする(関連プログラムの呼び出し)
//#import
//例：#import "クラス名.h"
//ヘッダファイルをまるごと読み込む。実装ファイル側で再度読み込む必要がない。C言語の#includeと違い、一度読み込んだファイルは再度読み込むことがない。
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
//@interface クラス名 : 親クラス(スーパークラス)名 <プロトコル>


@property (strong, nonatomic) UIWindow *window;
//@property (属性１,属性２,・・・) データ型またはオブジェクト型 変数名;
//プロパティとは便利なメンバ変数、フィールドみたいなもの。このプロパティを通して変数の中身をいじれるようになる。

@end
