//
//  MolehillView.h
//  example
//
//  Created by 谷尾 和是 on 2014/04/07.
//  Copyright (c) 2014年 Masa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MolehillView : UIControl

//  モグラを穴から出す。
- (void)comesOut;

// モグラを穴に引っ込める。
- (void)hide;
@end


// モグラと穴を画像で表現したモグラの穴ビュー。
@interface MolehillImageView : MolehillView
@end