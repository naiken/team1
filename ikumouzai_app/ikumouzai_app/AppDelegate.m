//
//  AppDelegate.m
//  ikumouzai_app
//
//  Created by marugen Co.,Ltd. on 2014/04/24.
//  Copyright (c) marugen Co.,Ltd. 2014. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate
//@implementation ～ @end・・・AppDelegateクラスの実装


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //現在時刻を保存
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone] secondsFromGMT]];;
    [[NSUserDefaults standardUserDefaults] setObject:date forKey:@"cdate"];
    
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"time_flag"];
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"Integer_first"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"level_now"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:30 forKey:@"reservePoint"];
    [[NSUserDefaults standardUserDefaults] setInteger:0  forKey:@"shyouhiPoint"];
    [[NSUserDefaults standardUserDefaults] setInteger:0  forKey:@"comment"];
    [[NSUserDefaults standardUserDefaults] setInteger:0  forKey:@"ikumou_number"];
    [[NSUserDefaults standardUserDefaults] setInteger:0  forKey:@"limit_ikumou"];
    
    return YES;
}




//アプリがアクティブでなくなる直前に呼ばれます。
- (void)applicationWillResignActive:(UIApplication *)application
{
}


//アプリがバックグラウンドになったときに呼ばれます。
- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

//アプリがフォアグラウンド(画面上で最も手前に表示されている項目や、現在選択している項目、優先順位の高い処理など)に戻ったときに呼ばれます。
- (void)applicationWillEnterForeground:(UIApplication *)application
{
}



//アプリがアクティブになったときに呼ばれます。
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
}

//アプリが終了したときに呼ばれます。
- (void)applicationWillTerminate:(UIApplication *)application
{
}



@end
