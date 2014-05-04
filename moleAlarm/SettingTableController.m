#import "SettingTableController.h"
#import "TopDesignController.h"
#import "PickerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface SettingTableController () {
    UISwitch *sw;
    UIDatePicker *datePicker;
    NSInteger minuteSave;
    NSInteger hourSave;
    NSUserDefaults *myDefaults;
    UILocalNotification *localNotification;
    NSString *dateSave;
    NSDate *date_converted;
    UITableViewCell* cell;
    int cellnumber;
}
@property (nonatomic, strong) AVQueuePlayer *player;
@property (nonatomic, strong) id timeObserver;

- (void)saveDefault;
- (void)setAlarmTime;
@end

@implementation SettingTableController

- (void)awakeFromNib
{
    [super awakeFromNib];
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
- (void)viewDidLoad
{
    [super viewDidLoad];

    sw = [[UISwitch alloc] initWithFrame:CGRectZero];
    [sw addTarget:self action:@selector(tapSwich:) forControlEvents:UIControlEventTouchUpInside];
    datePicker= [[UIDatePicker alloc]init];
    datePicker.datePickerMode = UIDatePickerModeTime;
    datePicker.minuteInterval = 1;
    [datePicker addTarget:self
                   action:@selector(datePicker_ValueChanged:)
         forControlEvents:UIControlEventValueChanged];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

//テーブルビューのセクション数の決めるメゾット
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//テーブルビューのセル数の決めるメゾット
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static const id identifiers[4] = { @"datepickerCell", @"switchCell",@"termCell", @"backgroundCell"};
    NSString* identifier = identifiers[ indexPath.row ];
    cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    cellnumber = indexPath.row;
    if(indexPath.row==0){
        [cell.contentView addSubview:datePicker];
    }else if(indexPath.row==1){
        cell.accessoryView = sw;
        cell.textLabel.text = @"アラーム";
    }else if(indexPath.row==2){
        cell.textLabel.text = @"最大駆動時間";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        cell.textLabel.text = @"背景設定";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
    
}

// UISwitchがタップされた際に呼び出されるメソッド。
-(void)tapSwich:(id)sender
{
    sw = (UISwitch *)sender;
    if (sw.on) {
        [self setAlarmTime];
    }else{
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    }
    NSUserDefaults *senni3 = [NSUserDefaults standardUserDefaults];
    [senni3 setInteger:1 forKey:@"senni"];
    [self saveDefault];
}
- (void)datePicker_ValueChanged:(id)sender
{
    if (sw.on) {
    datePicker = sender;

    NSDateFormatter *dminute = [[NSDateFormatter alloc]init];
    dminute.dateFormat = @"mm";
    minuteSave = [[dminute stringFromDate:datePicker.date] integerValue];
    
    NSDateFormatter *dhour = [[NSDateFormatter alloc]init];
    dhour.dateFormat = @"HH";
    hourSave = [[dhour stringFromDate:datePicker.date] integerValue];
        
    NSUserDefaults *time_set = [NSUserDefaults standardUserDefaults];
    [time_set setObject:datePicker.date forKey:@"date_set"];
    [self saveDefault];
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    [self setAlarmTime];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==3){
        //５つめのセルがタップされたら画面遷移
        [self performSegueWithIdentifier:@"settingToBack" sender:self];
    }else if(indexPath.row==2){
        //４つめのセルがタップされたら画面遷移
        [self performSegueWithIdentifier:@"termsegue" sender:self];
    }
}

- (void)saveDefault
{
    //データを保存するクラスの作成
    myDefaults = [NSUserDefaults standardUserDefaults];
    [myDefaults setBool:sw.on forKey:@"switchValue"];
    [myDefaults setInteger:0 forKey:@"secondValue"];
    [myDefaults setInteger:minuteSave forKey:@"minuteValue"];
    [myDefaults setInteger:hourSave forKey:@"hourValue"];
    [myDefaults setObject:dateSave forKey:@"datePickerValue"];
    [myDefaults synchronize];
}

//viewが表示される直前に実行されるメゾット
-(void)viewWillAppear:(BOOL)animated
{
    myDefaults = [NSUserDefaults standardUserDefaults];
    //スイッチの値を前回保存した値でセット
    sw.on = [myDefaults boolForKey:@"switchValue"];
    //datepickerの値を前回保存した値でセット
    datePicker.date = [myDefaults objectForKey:@"date_set"];
}

- (void)setAlarmTime
{
    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponets= [[NSDateComponents alloc] init];
    [dateComponets setTimeZone:[NSTimeZone systemTimeZone]];
    // NSDateを時・分・秒に分解する設定
    dateComponets= [currentCalendar components:(NSYearCalendarUnit | NSMonthCalendarUnit
                                   | NSDayCalendarUnit | NSHourCalendarUnit
                                   | NSMinuteCalendarUnit | NSSecondCalendarUnit)fromDate:[NSDate date]];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [dateComponets setHour:[userDefaults integerForKey:@"hourValue"]];
    [dateComponets setMinute:[userDefaults integerForKey:@"minuteValue"]];
    [dateComponets setSecond:[userDefaults integerForKey:@"secondValue"]];
    
    NSDate *notificationDate = [currentCalendar dateFromComponents:dateComponets];
    
    // １：UILocalNotificationインスタンスを生成する。
    localNotification = [[UILocalNotification alloc] init];
    if(localNotification == nil) {
        return;
    }
    
    localNotification.fireDate = notificationDate;
    localNotification.timeZone = [NSTimeZone systemTimeZone];
    
    localNotification.alertAction = @"ゲームを開始";
    localNotification.alertBody = @"アラーム";
    localNotification.hasAction = YES;
    
    localNotification.soundName = @"clock.wav";
    localNotification.repeatInterval = NSDayCalendarUnit;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

@end
