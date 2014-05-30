//
//  ViewController.h
//  ikumouzai_app
//
//  Created by marugen Co.,Ltd. on 2014/04/24.
//  Copyright (c) marugen Co.,Ltd. 2014. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LevelUpViewController.h"
//UIKitヘッダーをインポートする(関連プログラムの呼び出し)
//例：#import "クラス名.h"
//ヘッダファイルをまるごと読み込む。実装ファイル側で再度読み込む必要がない。C言語の#includeと違い、一度読み込んだファイルは再度読み込むことがない。

#import <AVFoundation/AVFoundation.h>
//AVFoundationヘッダーをインポートする(関連プログラムの呼び出し)

@interface ViewController : UIViewController{
    UIImageView     *image0;
    UIImageView     *moukon_baseimage;
    int             ptx;
    int             point_add;
    NSString        *point;
    UILabel         *labelday;
    UILabel         *labelPoint;
    UILabel         *syouhiPoint;
    AVAudioPlayer   *sePlayer1;
    AVAudioPlayer   *bgmPlayer;
}



//@interface ～ @endはクラス宣言
//@interface クラス名 : 親クラス(スーパークラス)名 <プロトコル>

@end
