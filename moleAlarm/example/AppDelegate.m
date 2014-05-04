#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SettingTableController.h"
#import "GameResultController.h"
#import "MoleViewController.h"
@interface AppDelegate (){
    UIStoryboard *storyboard;
    NSString * storyBoardName;
    NSTimer *timeralarm;
    NSUserDefaults *hourdefaults;
    NSInteger minute;
    NSInteger hour;
    NSDateFormatter *formatterhour;
    NSDateFormatter *formatterminute;
    NSString *nowHour;
    NSString *nowMinute;
    NSInteger hourNumb;
    NSInteger minuteNumb;
    NSDate *activeTime;
}
- (void)onesecond;
@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSUserDefaults *first_score = [NSUserDefaults standardUserDefaults];
    [first_score setInteger:1000 forKey:@"first"];
    
    NSUserDefaults *second_score = [NSUserDefaults standardUserDefaults];
    [second_score setInteger:1000 forKey:@"second"];
    
    NSUserDefaults *third_score = [NSUserDefaults standardUserDefaults];
    [third_score setInteger:1000 forKey:@"third"];

    NSUserDefaults *time_set = [NSUserDefaults standardUserDefaults];
    [time_set setObject:[NSDate date] forKey:@"date_set"];
    
    storyBoardName = @"Main";
    storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
    
    UIViewController *GamePlayController = [storyboard instantiateViewControllerWithIdentifier:@"HowToViewController"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = GamePlayController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
        storyBoardName = @"Game";
        storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
        
        UIViewController *GamePlayController = [storyboard instantiateInitialViewController];
        
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = GamePlayController;
        [self.window makeKeyAndVisible];
    
    
}

- (void)onesecond
{
    hourdefaults = [NSUserDefaults standardUserDefaults];
    hour = [hourdefaults integerForKey:@"hourValue"];
    minute = [hourdefaults integerForKey:@"minuteValue"];
    
    formatterhour = [[NSDateFormatter alloc] init];
    formatterminute = [[NSDateFormatter alloc] init];
    [formatterhour setDateFormat: @"HH"];
    [formatterminute setDateFormat: @"mm"];
    nowHour = [formatterhour stringFromDate:activeTime];
    nowMinute = [formatterminute stringFromDate:activeTime];
    hourNumb = nowHour.intValue;
    minuteNumb = nowMinute.intValue;
}
//アプリが非ACtiveになる直前に呼び出される
- (void)applicationWillResignActive:(UIApplication *)application
{
}

//アプリが非Activeになりバックグランド実行になった際に呼び出される
- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

//2回目以降の起動時に呼び出される(Backgroundにアプリがある場合)
- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

//アプリがActiveになった際に呼び出される
- (void)applicationDidBecomeActive:(UIApplication *)application
{
    
    activeTime = [NSDate date];
    [self onesecond];
    
    NSUserDefaults *defaul = [NSUserDefaults standardUserDefaults];
    NSInteger ZZZ = [defaul integerForKey:@"senni"];
    if (ZZZ == 0) {
        storyBoardName = @"Main";
        storyboard = [UIStoryboard storyboardWithName:storyBoardName bundle:nil];
        
        UIViewController *GamePlayController = [storyboard instantiateInitialViewController];
        
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = GamePlayController;
        [self.window makeKeyAndVisible];
    }
}

//システムからのアプリ終了の際に呼び出される
- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
