//
//  SecondViewController.h
//
//  Created by Rento Sugiyama on 4/11/14.
//  Copyright (c) 2014 Rento Sugiyama. All rights reserved.
//

#import <UIKit/UIKit.h>
//UIKitヘッダーをインポートする(関連プログラムの呼び出し)

#import <AVFoundation/AVFoundation.h>
//AVFoundationヘッダーをインポートする(関連プログラムの呼び出し)

@interface SecondViewController : UIViewController{

//@interface ～ @endはクラス宣言
//@interface クラス名 : 親クラス(スーパークラス)名 <プロトコル>
CALayer     *mLayer1;
CALayer     *mLayer2;


AVAudioPlayer   *bgmPlayer1;
AVAudioPlayer   *sePlayer1;
AVAudioPlayer   *sePlayer2;
AVAudioPlayer   *sePlayer3;

float fallSpeed;
int sum;
//クラス内で使う変数の宣言
}


@property NSInteger flag;

@end
