//
//  AppDelegate.m
//  FindingCharacter
//
//  Created by prom phanit on 4/30/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate{
    UIStoryboard *storyboard;
    NSString * storyBoardName;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
        
        // Windowスクリーンのサイズを取得
        CGRect r = [[UIScreen mainScreen] bounds];
        // 縦の長さが480の場合、古いiPhoneだと判定
        if(r.size.height == 480){
            // NSLog(@"Old iPhone");
            storyBoardName = @"iphone3.5";
        }else{
            // NSLog(@"New iPhone");
            storyBoardName =@"Main";
        }
    
    /*
    // StoryBoardのインスタンス化
    storyBoardName = @"Main";
    storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    
    // 画面の生成
    UIViewController *GamePlayController = [storyboard instantiateViewControllerWithIdentifier:@"HowToViewController"];
    
    // ルートウィンドウにひっつける
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = GamePlayController;
    [self.window makeKeyAndVisible];
    */
     
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
