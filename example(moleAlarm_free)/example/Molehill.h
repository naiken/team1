//
//  Molehill.h
//  example
//
//  Created by 谷尾 和是 on 2014/04/07.
//  Copyright (c) 2014年 Masa. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Molehill;

//  デリゲート用プロトコル。
@protocol MolehillDelegate <NSObject>
// モグラが完全に隠れた。
- (void)molehillMoleHide:(Molehill*)molehill;

// モグラが出てきた。
- (void)molehillMoleComesout:(Molehill*)molehill;
@end

@interface Molehill : NSObject

@property (retain, nonatomic) id<MolehillDelegate> delegate;

// プログラマが自由に使えるint値。
@property int tag;

// 動作を始める。
- (void)start;

// 動作を止める。
- (void)stop;
@end
