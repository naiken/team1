//
//  Molehill.m
//  example
//
//  Created by 谷尾 和是 on 2014/04/07.
//  Copyright (c) 2014年 Masa. All rights reserved.
//

#import "Molehill.h"

static const NSTimeInterval MBMolehillRepeatMargin = 1.2;   //  モグラが穴に隠れて再び現れるまでの最低限あけておく間隔（秒）。

@implementation Molehill {
    BOOL        _moleHidden;        //  モグラが隠れているならYES。
    NSTimer*    _timer;             //  モグラを出したり、隠したりするスケジュールを管理する。
    NSDate*     _startDate;         //  開始時間。
}

- (void)start
{
    [self stop];                    //  動いているなら停止させる。
    _startDate = [NSDate date];     //  開始時刻を記録する。
    _moleHidden = YES;              //  モグラは隠れた状態から始める。
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.nextComesOutTimeInterval  //  今からself.nextComesOutTimeIntervalで指定した秒数後に実行。
                                              target:self                           //  自分をターゲットとする。
                                            selector:@selector(comesoutTime)        //  -comesoutTimeメソッドをアクションとして呼び出す。
                                            userInfo:nil                            //  追加情報は必要ないのでnil。
                                             repeats:NO];                           //  繰り返さない。
}

- (void)stop
{
    [_timer invalidate];                    //  タイマーをキャンセル（_timer == nil の時は何もおこらない）する。
    _timer = nil;
}

//  モグラが穴から出る時が来た
- (void)comesoutTime
{
    if (_moleHidden == NO)                  //  すでに出ているので何もしない。
        return;
    _moleHidden = NO;                       //  モグラが出たのでNOにする。
    [_delegate molehillMoleComesout:self];  //  デリゲートに連携。
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.outDuration       //  今からoutDurationで指定した秒数後に実行。
                                              target:self                   //  自分をターゲットとする。
                                            selector:@selector(hideTime)    //  -hideTimeメソッドをアクションとして呼び出す。
                                            userInfo:nil                    //  追加情報は必要ないのでnil。
                                             repeats:NO];                   //  繰り返さない。
}

//  モグラを穴に隠す時が来た。
- (void)hideTime
{
    if (_moleHidden == YES)             //  すでに隠れているので何もしない。
        return;
    _moleHidden = YES;                  //  モグラを隠す。
    [_delegate molehillMoleHide:self];  //  デリゲートに連携。
    _timer = [NSTimer scheduledTimerWithTimeInterval:self.nextComesOutTimeInterval + MBMolehillRepeatMargin       //  今からself.nextComesOutTimeInterval + MBMolehillHideDuration で指定した秒数後に実行。
                                              target:self                       //  自分をターゲットとする。
                                            selector:@selector(comesoutTime)    //  -comesoutTimeメソッドをアクションとして呼び出す。
                                            userInfo:nil                        //  追加情報は必要ないのでnil。
                                             repeats:NO];                       //  繰り返さない。
}

//  モグラを穴から出す時間を決定（現在時刻から0.0〜2.0秒の間）。
- (NSTimeInterval)nextComesOutTimeInterval
{
    return (float)(rand() % 100) / 100.0 * 4.5;
}

//  モグラが穴から現れて穴に戻ろうとするまでの間隔（秒）。
- (NSTimeInterval)outDuration
{
    return 0.4;
}
@end

