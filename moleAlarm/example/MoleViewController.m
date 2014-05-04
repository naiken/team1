#import "PickerViewController.h"
#import "MoleViewController.h"
#import "MolehillView.h"
#import "Molehill.h"
#import "GameResultController.h"
#import "AVFoundation/AVFoundation.h"
#import "MoleViewController.h"

static const int MBMolehillCount = 11;    
static const NSTimeInterval MBSwitchingDelay = 0.5;

@interface MoleViewController ()<MolehillDelegate> {
    Molehill*         _molehills[MBMolehillCount];
    int                 _score;
    MolehillView*     _molehillViews[MBMolehillCount];
    UILabel*            _scoreView;
    UILabel*            _timerView;
    NSTimer*            _gameTimer;
    NSTimer*            _timerScore;
    NSDate*             _nowChange;
    NSDate*             _startDate;
    NSTimeInterval  MBGameDuration;
    NSTimeInterval secs;
    UIStoryboard *storyboard;
    FirstViewController *FirstViewController;
    NSString* str;
    AVAudioPlayer *bgsound;
    int sec;
}

@end

@implementation MoleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *senni2 = [NSUserDefaults standardUserDefaults];
    [senni2 setInteger:1 forKey:@"senni"];
    
    NSString *bgmPath = [[NSBundle mainBundle] pathForResource:@"game_maoudamashii_5_village07" ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    bgsound = [[AVAudioPlayer alloc]initWithContentsOfURL:bgmUrl error:nil];
    [bgsound setNumberOfLoops:-1];
    [bgsound play];
    CGPoint hillCenters[] = {
        {55, 160},
        {270, 175},
        {120, 200},
        {200, 220},
        {70, 295},
        {260, 320},
        {180, 358},
        {100, 400},
        {280, 450},
        {60, 490},
        {170, 525}
    };
    //  モグラの穴モデル、ビューを準備する。
    for (int i = 0; i < MBMolehillCount; i++) {
        MolehillView* molehillView = [[MolehillImageView alloc] initWithFrame:CGRectMake(0, 0, 75, 75)];
        molehillView.center = hillCenters[i];
        [molehillView addTarget:self
                         action:@selector(hit:)
               forControlEvents:UIControlEventTouchDown];
        [self.view addSubview:molehillView];
        _molehillViews[i] = molehillView;                   //  各モグラの穴ビューを_molehillViewsに保持する。
        
        //  モグラの穴モデル作成する。
        Molehill* molehill = [[Molehill alloc] init];
        molehill.tag = i;
        molehill.delegate = self;
        _molehills[i] = molehill;                           //  各モグラの穴モデルを_molehillsに保持する。
    }
    
    //得点
    _scoreView = [[UILabel alloc] initWithFrame:CGRectMake(40,45,100,80)];
    _scoreView.font = [UIFont boldSystemFontOfSize:40];
    _scoreView.textAlignment = NSTextAlignmentCenter;
    _scoreView.textColor = [UIColor orangeColor];
    _scoreView.shadowColor = [UIColor blackColor];
    _scoreView.backgroundColor = [UIColor clearColor];
    _scoreView.text = @"0点";
    [self.view addSubview:_scoreView];
    
    //タイム
    _timerView = [[UILabel alloc] initWithFrame:CGRectMake(160,45,150,80)];
    _timerView.font = [UIFont boldSystemFontOfSize:40];
    _timerView.textAlignment = NSTextAlignmentCenter;
    _timerView.textColor = [UIColor orangeColor];
    _timerView.shadowColor = [UIColor blackColor];
    _timerView.backgroundColor = [UIColor clearColor];
    _timerView.text = @"0";
    [self.view addSubview:_timerView];
    
    _nowChange = [NSDate date];
    
    [self startDemo];
}

- (void)one_second
{
    _startDate = [NSDate date];
    secs = floorf([_startDate timeIntervalSinceDate:_nowChange]);
    sec = secs;
    str = [NSString stringWithFormat:@"%d", sec];
    _timerView.text = str;
}

- (void)startDemo
{
    for (int i = 0; i < MBMolehillCount; i++) {
        _molehillViews[i].userInteractionEnabled = YES;
        [_molehills[i] start];
    }

    _timerScore = [NSTimer scheduledTimerWithTimeInterval:(1)
                                                   target:self
                                                 selector:@selector(one_second)
                                                 userInfo:nil
                                                  repeats:YES];
    
    NSUserDefaults *intdefaults = [NSUserDefaults standardUserDefaults];
    float pickernumber = [intdefaults integerForKey:@"pickerValue"];
    if (pickernumber == 0.0) {
         MBGameDuration = 60.0;
    }else{
         MBGameDuration = pickernumber;
    }
    
    _gameTimer = [NSTimer scheduledTimerWithTimeInterval:MBGameDuration
                                                  target:self
                                                selector:@selector(finish)
                                                userInfo:nil
                                                 repeats:NO];               
    
}

//  ゲームのデモンストレーション停止。
- (void)stopDemo
{
    for (int i = 0; i < MBMolehillCount; i++) {
        [_molehills[i] stop];       //  モグラ出し入れを停止。
        [_molehillViews[i] hide];   //  モグラも穴に引っ込めさせる。
    }
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

//  ゲーム開始。モグラをすべて穴に隠してからゲームを始める。
- (void)start
{
    [self stopDemo];                //  ゲームのデモンストレーション停止。
    double delayInSeconds = MBSwitchingDelay;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        _score = 0;                         //  得点初期化。
        for (int i = 0; i < MBMolehillCount; i++) {
            _molehillViews[i].userInteractionEnabled = YES;     // タップに反応するようにしておく。
            [_molehills[i] start];                              //  モグラ出し入れを実行。
        }
    });
}

//  ゲームが正常に終了。MBSwitchingDelay秒後にデモンストレーション開始。
- (void)finish
{
    _gameTimer = nil;
    [_timerScore invalidate];
        [bgsound stop];
    [self stop];
    UIStoryboard *secondStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    id secondViewController = [secondStoryboard instantiateViewControllerWithIdentifier:@"TBC"];
    [self presentViewController:(UIViewController*)secondViewController animated:YES completion:nil];
    
}

//  ゲームを停止する。
- (void)stop
{
    for (int i = 0; i < MBMolehillCount; i++) {
        _molehillViews[i].userInteractionEnabled = NO;  // タップに反応させないようにしておく。
        [_molehills[i] stop];
        [_molehillViews[i] hide];
    }
}

//  モグラを叩いたので得点を+1し得点ビューを更新する。
- (void)hit:(MolehillView*)molehillView
{
    _score++;
    _scoreView.text = [NSString stringWithFormat:@"%d点", _score];
    if (_score == 30){
        [_timerScore invalidate];
         [bgsound stop];
        [self stop];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setInteger:sec forKey:@"score_this"];
        GameResultController *GameResultController = [self.storyboard instantiateViewControllerWithIdentifier:@"GSB"];
        [self presentViewController:GameResultController animated:YES completion:nil];
    }
}

//  モグラを穴から出す。
- (void)molehillMoleComesout:(Molehill*)molehill
{
    [_molehillViews[molehill.tag] comesOut];
}

//  モグラを穴に隠す。
- (void)molehillMoleHide:(Molehill*)molehill
{
    [_molehillViews[molehill.tag] hide];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
