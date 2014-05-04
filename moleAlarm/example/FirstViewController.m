#import "FirstViewController.h"
#import "SettingTableController.h"
#import "TopDesignController.h"
#import "appCCloud.h"

@interface FirstViewController ()
{
    NSTimer *timerobj;
    NSString *str;
    UIImage *bgImage;
    UIScreen *screen;
    NSInteger numb;
}
@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) IBOutlet UILabel *now_Date;
@property (weak, nonatomic) IBOutlet UILabel *now_Time;


- (void)oneminute_date;
- (void)changeBackground;

@end
@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self oneminute_date];
    
    timerobj = [NSTimer scheduledTimerWithTimeInterval:5
                                     target:self
                                   selector:@selector(oneminute_date)
                                   userInfo:nil
                                    repeats:YES];

    UIButton *info = [UIButton buttonWithType:UIButtonTypeInfoDark];
    info.frame = CGRectMake(10, 450, 50, 50);
    [info addTarget:self action:@selector(how_to:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:info];
    
    NSUserDefaults *senni1 = [NSUserDefaults standardUserDefaults];
    [senni1 setInteger:1 forKey:@"senni"];
    
    UIButton *button_ad = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button_ad.frame = CGRectMake(130,345,65,65);
    
    UIImage *image_ad= [UIImage imageNamed:@"appcc_simple_appc_icon.png"];
    
    [button_ad setBackgroundImage:image_ad forState:UIControlStateNormal];
    [button_ad setShowsTouchWhenHighlighted:YES];
    
    [button_ad addTarget:self action:@selector(touchButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button_ad];


}

- (BOOL)shouldAutorotate
{
    return NO;
}

// 縦のみサポート
- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

-(void)touchButton
{
    
    [super viewDidLoad];
    
    [appCCloud setupAppCWithMediaKey:@"bc4ecb2247a9cee2142065c790591c1bedeba103" option:APPC_CLOUD_AD];
    
 
    __block appCCutinView* cutin = [[appCCutinView alloc]
                                    initWithViewController:self  closeBlock:^(id sender_){
                                        [cutin removeFromSuperview];
                                    }];
    
    [self.view addSubview:cutin];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) how_to:(UIButton *)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *GamePlayController = [storyboard instantiateViewControllerWithIdentifier:@"HowToViewController"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = GamePlayController;
    [self.window makeKeyAndVisible];

}


- (void)oneminute_date
{
    // NsDate => NSString変換用のフォーマッタを作成
    NSDateFormatter *formatterTime = [[NSDateFormatter alloc] init];
    [formatterTime setDateFormat: @"HH:mm"];
    [formatterTime setLocale:[NSLocale systemLocale]];
    [formatterTime setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *now = [formatterTime stringFromDate:[NSDate date]];
    _now_Time.text = now;
    
    NSDateFormatter *formatterDate = [[NSDateFormatter alloc] init];
    [formatterDate setDateFormat: @"yyyy/MM/dd(EEE)"];
    [formatterDate setLocale:[NSLocale systemLocale]];
    [formatterDate setTimeZone:[NSTimeZone systemTimeZone]];
    NSString *today = [formatterDate stringFromDate:[NSDate date]];
    _now_Date.text = today;
}

-(void) viewWillAppear:(BOOL)animated
{
    [self changeBackground];
}

-(void) changeBackground
{
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    numb = [defaults integerForKey:@"checkCellNumber"];
    switch(numb){
    case 0:
        bgImage = [UIImage imageNamed:@"green499.png"];
        break;
    case 1:
        bgImage = [UIImage imageNamed:@"pink518.png"];
        break;
    case 2:
        bgImage = [UIImage imageNamed:@"blue499.png"];
        break;
    case 3:
        bgImage = [UIImage imageNamed:@"brown499.png"];
        break;
    case 4:
        bgImage = [UIImage imageNamed:@"sakura1038.png"];
        break;
    case 5:
        bgImage = [UIImage imageNamed:@"star1038.png"];
        break;
    case 6:
        bgImage = [UIImage imageNamed:@"check1036.png"];
        break;
    case 7:
        bgImage = [UIImage imageNamed:@"crystal1036.png"];
        break;
    case 8:
        bgImage = [UIImage imageNamed:@"heart1036.png"];
        break;
    case 9:
        bgImage = [UIImage imageNamed:@"rainbow519.png"];
        break;
    default:
        break;
    }
    screen = [UIScreen mainScreen];
    CGRect rect = [screen applicationFrame];
    UIGraphicsBeginImageContext( CGSizeMake( rect.size.width, rect.size.height ) );
    [bgImage drawInRect:CGRectMake( 0, 0, rect.size.width, rect.size.height ) ];
    bgImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [ UIColor colorWithPatternImage:bgImage ];
}

@end
