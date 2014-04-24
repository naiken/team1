//
//  MolehillView.m
//  example
//
//  Created by 谷尾 和是 on 2014/04/07.
//  Copyright (c) 2014年 Masa. All rights reserved.
//

#import "MolehillView.h"

static const NSTimeInterval MolehillViewAnimateDuration = 0.4;    //  モグラの出し入れ時のアニメーション時間（秒）。

@implementation MolehillView {
    BOOL    _moleHidden;    //  モグラが隠れている状態ならYES。
    BOOL    _tapped;        //  モグラが表示中のタップに1度しか反応させないためのフラグ。
    UIView* _mole;          //  モグラをイメージしたサブビュー。
    NSTimer *character;
}

- (id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if (self) {
        _mole = [self setupViews];  //  モグラの穴、モグラのサブビューを作成、モグラのサブビューはインスタンス変数_moleとして保持する。
        _moleHidden = YES;          //  モグラは隠れた状態。
    }
    return self;
}

//  モグラの穴とモグラをサブビューとして自身に追加する。モグラのビューを戻す。
- (UIView*)setupViews
{
    //  穴の用意。
    UIView* holl = [[UIView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 20, self.bounds.size.width, 20)];
    holl.backgroundColor = [UIColor blackColor];    //  黒色で塗りつぶす。
    holl.userInteractionEnabled = NO;               //  タップには反応させない。
    [self addSubview:holl];
    
    //  モグラの用意。
    UIView* mole = [[UIView alloc] initWithFrame:CGRectMake(10, self.bounds.size.height, self.bounds.size.width - 20, 60)];
    mole.backgroundColor = [UIColor redColor];      //  赤色で塗りつぶす。
    mole.userInteractionEnabled = NO;               //  タップには反応させない。
    [self addSubview:mole];
    
    self.clipsToBounds = YES;                       //  自分の矩形外に画像を出さないようにする。
    return mole;
}

//  モグラが完全に隠れた時のモグラビューの原点yの位置。
- (float)moleVerticalHiddenOrigin
{
    return self.bounds.size.height;
}

//  モグラが完全に現れた時のモグラビューの原点yの位置。
- (float)moleVerticalComesoutOrigin
{
    return (self.bounds.size.height - _mole.frame.size.height);
}

/*
 　モグラは穴から少しでも見えている状態なら見えている状態と判断し、インスタンス変数_moleHiddenを
 NOにするようになっている。そのため現れるアニメーション開始前に_moleHiddenをNOとしている。
 */
- (void)comesOut
{
    if (_mole.frame.origin.y == self.moleVerticalComesoutOrigin)  //  すでに現れているので何もしない。
        return;
    
    _moleHidden = NO;           //  アニメーションで徐々に現れるが、_moleHidden自体はすぐに表示状態にする。
    _tapped = NO;               //  現れてから1度もタップされていない状態に初期化。
    
    [UIView animateWithDuration:MolehillViewAnimateDuration   //  アニメーションの時間(秒)。
                     animations:^{
                         // モグラの矩形を自分の矩形内にする。
                         CGRect frame = _mole.frame;
                         frame.origin.y = self.moleVerticalComesoutOrigin;
                         _mole.frame = frame;
                     }];
}

/*
 　モグラは穴から少しでも見えている状態なら見えている状態と判断し、インスタンス変数_moleHiddenを
 NOにするようになっている。そのため隠れるアニメーションの終了まで_moleHiddenをYESにはしない。
 
 　また、finishedがNOの時はアニメーションがキャンセルされた状態で、これは「穴に隠れる」アニメーション中に
 「穴から出る」アニメーションが実行された、またはアプリケーションがホームボタン等で中断された場合が考えられる。
 
 　「穴から出る」アニメーションが実行された場合、モグラは穴に隠れずに見えたままとなるので_moleHiddenを
 YESにはしてはならない。
 　アプリケーションがホームボタン等で中断された場合は、そのままゲームを続行すると矛盾が生じるので
 コントローラ側でゲーム自体を強制終了する等の処理が必要。
 　このMBMolehillViewに-suspendといった一時停止用の機能を持たせて、ゲームを中断できるようにするのも面白いが
 　このサンプルでは実装しない。
 */
- (void)hide
{
    if (_mole.frame.origin.y == self.moleVerticalHiddenOrigin)  //  すでに隠されているので何もしない。
        return;
    
    [UIView animateWithDuration:MolehillViewAnimateDuration   //  アニメーションの時間(秒)。
                     animations:^{
                         // モグラの矩形を自分の矩形位置より下にする。
                         CGRect frame = _mole.frame;
                         frame.origin.y = self.moleVerticalHiddenOrigin;
                         _mole.frame = frame;
                     }
                     completion:^(BOOL finished) {
                         if (finished)
                             _moleHidden = YES;
                         //     モグラを引っ込めている最中に表示の命令が来た場合、モグラを途中の位置から引き換えさせるアニメーションにしたいところだが
                         //     UIViewの機能単独での実現はできない、これにはCALayerとCAAnimationを使うか、CALayerのpresentationLayerを利用する必要がある。
                     }];
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event
{
    if ((_moleHidden == NO) && (_tapped == NO)) {
        //  表示中であり、まだ1度もタップされていない。
        _tapped = YES;                                              //  タップされたことをフラグにセット。
        [self sendActionsForControlEvents:UIControlEventTouchDown]; //  ターゲットのアクション実行。
    }
    return NO;  //  指が放れるまでの対応はしない。
}
@end
@implementation MolehillImageView

//  贅沢な表示にするためにオーバーライド。すべて置き換えるのでsuperは呼ばない。
- (UIView*)setupViews
{
    //  穴の用意。
    UIImageView* holl = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 20, self.bounds.size.width, 20)];
    holl.image = [UIImage imageNamed:@"ana.png"];  //  穴のイメージを割り付ける。
    [self addSubview:holl];
    
    //  モグラを穴の中に隠すためのビューを用意。
    CGRect frame = self.bounds;
    frame.size.height -= 5;
    UIView* clipBox = [[UIView alloc] initWithFrame:frame];
    clipBox.clipsToBounds = YES;
    clipBox.userInteractionEnabled = NO;
    [self addSubview:clipBox];
    
    //  モグラの用意。
    UIImageView* mole = [[UIImageView alloc] initWithFrame:CGRectMake(10, self.bounds.size.height, self.bounds.size.width - 20, 60)];
    int XX = arc4random()%4;
    NSArray *array = @[@"mole2.png", @"mole3.png", @"unko2.png",@"mole4.png"];
    NSString *moleimage = array[XX];
    mole.image = [UIImage imageNamed:moleimage];      //  モグラのイメージを割り付ける。
    [clipBox addSubview:mole];
    
    //  穴の盛り上がり部分の用意。
    UIImageView* hill = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height - 15, self.bounds.size.width, 20)];
    hill.image = [UIImage imageNamed:@"model.png"];  //  穴の盛り上がり部分のイメージを割り付ける。
    [self addSubview:hill];
    
    return mole;
}

@end

