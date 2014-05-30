//
//  BuyItemViewController.h
//  ikumouzai_app
//
//  Created by marugen Co.,Ltd. on 2014/04/24.
//  Copyright (c) marugen Co.,Ltd. 2014. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
//AVFoundationヘッダーをインポートする(関連プログラムの呼び出し)

#import <UIKit/UIKit.h>
//UIKitヘッダーをインポートする(関連プログラムの呼び出し)
//#import
//例：#import "クラス名.h"
//ヘッダファイルをまるごと読み込む。実装ファイル側で再度読み込む必要がない。C言語の#includeと違い、一度読み込んだファイルは再度読み込むことがない。

@interface BuyItemViewController : UIViewController<UIScrollViewDelegate>{
    //@interface ～ @endはクラス宣言
    //@interface クラス名 : 親クラス(スーパークラス)名 <プロトコル>
    
    AVAudioPlayer   *bgmPlayer1;
    
}

@property int tryFlag1;
@property int tryFlag2;
@property int tryFlag3;
@property int tryFlag4;

@end
