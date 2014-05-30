//
//  ViewController.m
//  ikumouzai_app
//
//  Created by marugen Co.,Ltd. on 2014/04/24.
//  Copyright (c) marugen Co.,Ltd. 2014. All rights reserved.
//

#import "ViewController.h"
#import "AVFoundation/AVFoundation.h"
#import "appCCloud.h"

@interface ViewController (){
    AVAudioPlayer   *soundStart;
    AVAudioPlayer   *soundLevelUp;
    AVAudioPlayer   *ikumouNuru;
    AVAudioPlayer   *ikumouEnd;
    AVAudioPlayer   *ikumouPush;
    AVAudioPlayer   *fukidashiSound;
    NSTimer         *timerobj;
    NSTimer         *fukidashitime;
    UIImage         *ikumou_img[4][8];
    UIImage         *item_img[3][4];
    UIImage         *tanktop;
    UIImageView     *yakusyokuGazouInstance;
    UIImageView     *mememe;
    UIImageView     *suitView;
    UIImageView     *meganeView;
    UIImageView     *nekutaiView;
    UIImageView     *katura[6];
    UIImageView     *ossan1;
    UIImageView     *yajirushiView;
    UIImageView     *kuti;
    UIImage         *backpicture[6];
    UIImage         *rank[6];
    UIImage         *backgroundImage;
    UIImage         *kutistyle[2];
    UIImage         *base_moukon;
    UITextView      *messageView;
    UIButton        *btn;
    UIButton        *UIButtonBuyItem;
    NSArray         *moukonList;
    NSArray         *message[6];
    UIView          *messageBgView;
    UIView          *statusBgView;
    UIView          *myView3;
    UIView          *myView1;
    NSString        *viewStr;
    NSString        *rankName[5];
    NSString        *BGM;
    NSInteger       spend_point;
    NSInteger       limit_ikumou;
    NSInteger       level;
    NSInteger       ikumou_number;
    NSInteger       itemType[12];
    NSInteger       pt;
    NSInteger       com_number;
    NSNumber        *sutu[12];
    BOOL            ikumou_flag;
    BOOL            levelBOOL[5];
    BOOL            flag;
    int             levelupPoint[5];
    int             naderu_number;
    int             kind_ikumouzai;
    int             moukon_condition;
    int             daynumber;
    int             k;
    int             suit;
    int             glasses;
    int             tie;
    float           XX;
    NSDate          *date;
    NSDate          *now;
}

@property (nonatomic,retain) NSString *sppoint;

-(void)moukonkun:(UIImage *)moukon_number feeling:(int)feel;
-(void)addpoint:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BGM = @"kouchanojikan";
    
    date = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone] secondsFromGMT]];
    [[NSUserDefaults standardUserDefaults] setObject:date forKey:@"cdate"];

    [self music];
    
    for(int i=0;i<6;i++){
        levelBOOL[i] = YES;
    }
    
    UIImage *yajirushiImage = [UIImage imageNamed:@"shirushi.png"];
    yajirushiView = [[UIImageView alloc] initWithImage:yajirushiImage];
    
    levelupPoint[0] = 100;
    levelupPoint[1] = 500;
    levelupPoint[2] = 1200;
    levelupPoint[3] = 2500;
    levelupPoint[4] = 4200;
    
    rankName[0] = @"課長";
    rankName[1] = @"部長";
    rankName[2] = @"役員";
    rankName[3] = @"副社長";
    rankName[4] = @"社長";
    
    
    // もうこんくんアニメーション用の画像
    UIImage *moukon1 = [UIImage imageNamed:@"moukon1.jpg"];
    UIImage *moukon2 = [UIImage imageNamed:@"moukon2.jpg"];
    UIImage *moukon3 = [UIImage imageNamed:@"moukon3.jpg"];
    UIImage *moukon4 = [UIImage imageNamed:@"moukon4.jpg"];
    UIImage *moukon5 = [UIImage imageNamed:@"moukon5.jpg"];
    
    moukonList = [NSArray arrayWithObjects:moukon1, moukon2,
                  moukon3, moukon4, moukon5, nil];
    
    //背景画像の設定
    backpicture[0] =[UIImage imageNamed:@"bg01.png"];
    backpicture[1] =[UIImage imageNamed:@"bg02.png"];
    backpicture[2] =[UIImage imageNamed:@"bg03.png"];
    backpicture[3] =[UIImage imageNamed:@"bg04.png"];
    backpicture[4] =[UIImage imageNamed:@"bg05.png"];
    backpicture[5] =[UIImage imageNamed:@"bg06.png"];

    
    [self setBack:0];
    
    katura[0] = [[UIImageView alloc] initWithFrame:CGRectMake(65, 200,180,55)];
    katura[1] = [[UIImageView alloc] initWithFrame:CGRectMake(67, 145,180,102)];
    katura[2] = [[UIImageView alloc] initWithFrame:CGRectMake(68, 142,182,110)];
    katura[3] = [[UIImageView alloc] initWithFrame:CGRectMake(66, 138,181,110)];
    katura[4] = [[UIImageView alloc] initWithFrame:CGRectMake(57, 142,192,110)];
    
    NSString *katuralv[5];
    for (int i = 0; i <=4; i++) {
        katuralv[i] = [NSString stringWithFormat:@"kami-0%d.png",i+2];
        katura[i].image = [UIImage imageNamed:katuralv[i]];
    }
    
    tanktop = [UIImage imageNamed:@"tanktop.png"];
    item_img[0][0] = [UIImage imageNamed:@"sutu01.png"];
    item_img[0][1] = [UIImage imageNamed:@"sutu2.png"];
    item_img[0][2] = [UIImage imageNamed:@"sutu03.png"];
    item_img[0][3] = [UIImage imageNamed:@"sutu04.png"];
    item_img[1][0] = [UIImage imageNamed:@"nectai1.png"];
    item_img[1][1] = [UIImage imageNamed:@"nectai2.png"];
    item_img[1][2] = [UIImage imageNamed:@"nectai3.png"];
    item_img[1][3] = [UIImage imageNamed:@"nectai4.png"];
    item_img[2][0] = [UIImage imageNamed:@"megane-03.png"];
    item_img[2][1] = [UIImage imageNamed:@"megane02.png"];
    item_img[2][2] = [UIImage imageNamed:@"megane03.png"];
    item_img[2][3] = [UIImage imageNamed:@"megane04.png"];
    
    //おっさんのスーツ
    suitView = [[UIImageView alloc] initWithFrame:CGRectMake(94, 359,130,65)];
    suitView.image = tanktop;
    [self.view addSubview:suitView];
    
    nekutaiView = [[UIImageView alloc] initWithFrame:CGRectMake(142, 375,35,35)];
    
    //おっさんの写真
    ossan1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"kao.png"]];
    ossan1.frame = CGRectMake(62, 140,190,238);
    [self.view addSubview:ossan1];
    
    meganeView = [[UIImageView alloc] initWithFrame:CGRectMake(80, 242, 150, 40)];
    //おっさんの毎日の得れるポイント
    point_add = 15;
    
    // 役職の画像
    NSString *rankLabel[6];
    for (int i = 0; i <=5; i++) {
        rankLabel[i] = [NSString stringWithFormat:@"label-lank0%d.png",i+1];
        rank[i]= [UIImage imageNamed:rankLabel[i]];
    }
    
    yakusyokuGazouInstance = [[UIImageView alloc]initWithFrame:CGRectMake(105, 75, 120, 55)];
    yakusyokuGazouInstance.image = rank[0];
    [self.view addSubview:yakusyokuGazouInstance];
    
    //tapgestureが感知可能な範囲
    myView3 = [[UIView alloc]initWithFrame:CGRectMake(70, 240, 180, 120)];
    [self.view addSubview:myView3];
    
    //おっさんを押したときにコメントがでてくる
    UITapGestureRecognizer * tapGesture =
    [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fukidashi:)];
    
    myView3.userInteractionEnabled = YES;
    [myView3 addGestureRecognizer:tapGesture];
    
    [self wink];
    
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(260, 330, 40, 95);
    
    NSString *ikumouName[4][8];
    for (int i = 0; i <=7; i++) {
        ikumouName[0][i] = [NSString stringWithFormat:@"ao0%d.png",7-i];
        ikumou_img[0][i] = [UIImage imageNamed:ikumouName[0][i]];
    }
    for (int i = 0; i <=7; i++) {
        ikumouName[1][i] = [NSString stringWithFormat:@"midori0%d.png",7-i];
        ikumou_img[1][i] = [UIImage imageNamed:ikumouName[1][i]];
    }
    for (int i = 0; i <=7; i++) {
        ikumouName[2][i] = [NSString stringWithFormat:@"kuro0%d.png",7-i];
        ikumou_img[2][i] = [UIImage imageNamed:ikumouName[2][i]];
    }
    for (int i = 0; i <=7; i++) {
        ikumouName[3][i] = [NSString stringWithFormat:@"aka0%d.png",7-i];
        ikumou_img[3][i] = [UIImage imageNamed:ikumouName[3][i]];
    }
    
    limit_ikumou = 0;
    ikumou_number = [[NSUserDefaults standardUserDefaults] integerForKey:@"ikumou_number"];
    
    [btn setBackgroundImage:ikumou_img[ikumou_number][limit_ikumou] forState:UIControlStateNormal];
    [btn addTarget:self
            action:@selector(ikumouOn) forControlEvents:UIControlEventTouchUpInside];
    ikumou_flag = YES;
    [self.view addSubview:btn];
    
    //アイテム購入ボタンに飛ぶためのボタンの実装
    UIButtonBuyItem = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButtonBuyItem.frame = CGRectMake(20, 370, 55, 55);
    [UIButtonBuyItem setImage:[UIImage imageNamed:@"shop-button.png"] forState:UIControlStateNormal];
    [UIButtonBuyItem addTarget:self action:@selector(tapBuyItemButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:UIButtonBuyItem];
    
    //スワイプされる範囲のビューの追加
    myView1 = [[UIView alloc]initWithFrame:CGRectMake(50, 150, 220, 90)];
    [self.view addSubview:myView1];
    
    // 左スワイプ
    UISwipeGestureRecognizer* swipeLeftGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(Swipe1:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    // 右スワイプ
    UISwipeGestureRecognizer* swipeRightGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(Swipe2:)];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    
    // ビューにジェスチャーを追加
    [myView1 addGestureRecognizer:swipeLeftGesture];
    [myView1 addGestureRecognizer:swipeRightGesture];
    
    // メッセージ表示の背景
    messageBgView = [[UIView alloc] initWithFrame:CGRectMake(5.0, 430.0, 225.0, 75.0)];
    messageBgView.layer.borderWidth = 1.0f;
    messageBgView.layer.borderColor = [UIColor whiteColor].CGColor;
    messageBgView.backgroundColor = [UIColor blackColor];
    messageBgView.alpha = 0.7f;
    [self.view addSubview:messageBgView];
    
    // メッセージ表示の背景
    messageView = [[UITextView alloc] initWithFrame:CGRectMake(5.0, 430.0, 225.0, 75.0)];
    messageView.editable = NO;
    messageView.userInteractionEnabled = NO;
    messageView.textColor = [UIColor whiteColor];
    messageView.backgroundColor = [UIColor clearColor];
    messageView.font = [UIFont boldSystemFontOfSize:16.0f];
    [self.view addSubview:messageView];
    
    statusBgView = [[UIView alloc] initWithFrame:CGRectMake(5.0, 5.0, 310.0, 60.0)];
    statusBgView.layer.borderWidth = 1.0f;
    statusBgView.layer.borderColor = [UIColor whiteColor].CGColor;
    statusBgView.backgroundColor = [UIColor blackColor];
    statusBgView.alpha = 0.7f;
    [self.view addSubview:statusBgView];
    
    //ポイントを書く部分を実装
    labelPoint = [[UILabel alloc] init];
    labelPoint.frame = CGRectMake(150, 10, 180, 35);
    labelPoint.textColor = [UIColor whiteColor];
    labelPoint.font = [UIFont boldSystemFontOfSize:19];
    
    //ポイントの初期値
    pt = [[NSUserDefaults standardUserDefaults] integerForKey:@"reservePoint"];
    [self.view addSubview:labelPoint];
    
    //消費ポイントを書く部分を実装
    syouhiPoint = [[UILabel alloc] init];
    //フレームの位置と大きさを指定
    syouhiPoint.frame = CGRectMake(15, 37, 200 , 30);
    syouhiPoint.textColor = [UIColor whiteColor];
    syouhiPoint.font = [UIFont boldSystemFontOfSize:12];
    //今までの消費ポイント
    spend_point = 0;
    [self.view addSubview:syouhiPoint];
    
    //経過日付を書くラベル
    labelday = [[UILabel alloc] init];
    labelday.frame = CGRectMake(20, 10, (self.view.bounds.size.width-30), 35);
    labelday.textColor = [UIColor whiteColor];
    labelday.font = [UIFont boldSystemFontOfSize:22];
    labelday.text = @"0 日目";
    [self.view addSubview:labelday];
    
    kutistyle[0] = [UIImage imageNamed:@"kuti-01.png"];
    kutistyle[1] = [UIImage imageNamed:@"kuti-03.png"];
    kuti = [[UIImageView alloc] initWithFrame:CGRectMake(125, 315,65,15)];
    kuti.image = kutistyle[0];
    [self closespeaking];
    
    [self serifu];
    
    moukon_condition = 0;
    [self moukonkun:moukonList[moukon_condition] feeling:moukon_condition];
    
    [self ad];
}


-(void)fukidashi:(UITapGestureRecognizer*)sender
{
    [fukidashiSound play];
    [self comment:6];
}


-(void)comment:(int)number
{
    [self openspeaking];
    
    myView3.userInteractionEnabled = NO;
    btn.userInteractionEnabled = NO;
    UIButtonBuyItem.userInteractionEnabled = NO;
    myView1.userInteractionEnabled = NO;
    
    fukidashitime =[NSTimer
                    scheduledTimerWithTimeInterval:0.1
                    target:self
                    selector:@selector(setTimer:)
                    userInfo:nil
                    repeats:YES];
    k = 0;
    if (number == 0) {
        viewStr = @"もう育毛剤があらへん。はよ買いにいかんとー。";
    }else if(number ==1){
        viewStr = @"育毛剤あらへんゆうてるやろーあほかー。";
    }else if(number ==2){
        viewStr = @"ふーっ。気持ちええわー。";
    }else if(number ==3){
        viewStr = @"育毛剤は１日１回しか塗れへんでー。";
    }else if(number ==8){
        viewStr = @"まずはショップに育毛剤買いにいくでー。";
    }else if(number ==9){
        viewStr = @"次に育毛剤をタップするんや!";
    }else if(number ==10){
        viewStr = @"最後に頭に育毛剤塗ってやー。";
    }else{
        viewStr = [message[level] objectAtIndex:arc4random() %([message[level] count]-1)];
    }
}


-(void)setTimer:(NSTimer *)timer{
    messageView.text = [viewStr substringToIndex:k];
    k++;
    if(k > [viewStr length]){
        //TimerStop
        [fukidashitime invalidate];
        [self closespeaking];
        myView3.userInteractionEnabled = YES;
        myView1.userInteractionEnabled = YES;
        btn.userInteractionEnabled = YES;
        UIButtonBuyItem.userInteractionEnabled = YES;
    }
}

-(void)setBack:(int)number{
    UIGraphicsBeginImageContext(self.view.frame.size);
    [backpicture[number] drawInRect:self.view.bounds];
    backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
}

-(void)openspeaking{
    kuti.image = kutistyle[1];
    [self.view addSubview:kuti];
    [self.view bringSubviewToFront:kuti];
}

-(void)closespeaking{
    kuti.image = kutistyle[0];
    [self.view addSubview:kuti];
    [self.view bringSubviewToFront:kuti];
}


//左スワイプ
- (void)Swipe1:(UISwipeGestureRecognizer *)sender
{
    [self swipe];
}

//右スワイプ
- (void)Swipe2:(UISwipeGestureRecognizer *)sender
{
    [self swipe];
}

//育毛剤ボタンを押した時
-(void)ikumouOn{
    com_number = [[NSUserDefaults standardUserDefaults] integerForKey:@"comment"];
    if (limit_ikumou == 0) {
        [self comment:0];
    }else{
        if (ikumou_flag == NO) {
            [self comment:3];
        }
        if (com_number == 2){
            [self comment:10];
            [yajirushiView setFrame:CGRectMake(145, 96, 30, 40)];
            [self.view addSubview:yajirushiView];
            [[NSUserDefaults standardUserDefaults] setInteger:3  forKey:@"comment"];
        }
        [ikumouPush play];
        naderu_number = 0;
    }
}

//スワイプしたときに実行するメゾット
-(void)swipe{
    if (limit_ikumou == 0) {
        [self comment:1];
    }else{
        if (ikumou_flag == YES) {
            //スワイプ５回目まではこのif文で起こる
            if( naderu_number <= 3){
                naderu_number += 1;
                [ikumouNuru play];
            }else{
                [yajirushiView removeFromSuperview];
                [mememe stopAnimating];
                [ikumouEnd play];
                [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(egao) userInfo:nil repeats:NO];
                ikumou_flag = NO;
                [soundLevelUp play];
                [self comment:2];
                switch (ikumou_number) {
                    case 0:
                        spend_point += 5;
                        break;
                    case 1:
                        spend_point += 15;
                        break;
                    case 2:
                        spend_point += 35;
                        break;
                    case 3:
                        spend_point += 50;
                        break;
                    default:
                        break;
                }
                [self shouhiPoint];
                [self after_ikumouzai];
            }
        }
    }
}


-(void)after_ikumouzai{
    limit_ikumou -= 1;
    [btn setBackgroundImage: ikumou_img[ikumou_number][limit_ikumou] forState:UIControlStateNormal];
    [self levelup];
    
}

//レベルアップするときに使うメゾット
- (void)levelup{
    if ((spend_point >= levelupPoint[0]) && (levelBOOL[0] == YES)) {
        levelBOOL[0] = NO;
        level = 1;
        point_add = 40;
        [self leveltimer];
    }else if ((spend_point >= levelupPoint[1]) && (levelBOOL[1] == YES)){
        levelBOOL[1] = NO;
        level = 2;
        point_add = 80;
        [self leveltimer];
    }else if ((spend_point >= levelupPoint[2]) && (levelBOOL[2] == YES)){
        levelBOOL[2] = NO;
        level = 3;
        point_add = 165;
        [self leveltimer];
    }else if((spend_point >= levelupPoint[3]) && (levelBOOL[3] == YES)){
        levelBOOL[3] = NO;
        level = 4;
        point_add = 320;
        [self leveltimer];
    }else if((spend_point >= levelupPoint[4]) && (levelBOOL[4] == YES)){
        levelBOOL[4] = NO;
        level = 5;
        point_add = 550;
        [self leveltimer];
    }
}

-(void)leveltimer{
    
    myView3.userInteractionEnabled = NO;
    btn.userInteractionEnabled = NO;
    myView1.userInteractionEnabled = NO;
    UIButtonBuyItem.userInteractionEnabled = NO;
    
    [[NSUserDefaults standardUserDefaults] setInteger:level forKey:@"level"];
    timerobj = [NSTimer scheduledTimerWithTimeInterval:4
                                                target:self
                                              selector:@selector(hoge:)
                                              userInfo:nil
                                               repeats:NO];
}

-(void)hoge:(NSTimer*)timer{
    [self performSegueWithIdentifier:@"level" sender:self];
}

//もうこんくんのアニメーション
-(void)moukonkun:(UIImage *)moukon_number feeling:(int)feel
{
    base_moukon = [UIImage imageNamed:@"moukon-bg.png"];
    
    CGRect moukonrect = CGRectMake(253, 429, 49, 68);
    CGRect moukonbaserect = CGRectMake(236, 430, 78, 75);
    
    image0 = [[UIImageView alloc] initWithFrame:moukonrect];
    moukon_baseimage = [[UIImageView alloc] initWithFrame:moukonbaserect];
    
    CGFloat cx = image0.center.x;
    CGFloat cy = image0.center.y;
    
    UIViewAnimationOptions animeOptions =
    UIViewAnimationCurveEaseInOut
    |UIViewAnimationOptionAutoreverse
    |UIViewAnimationOptionRepeat;
    
    image0.image = moukon_number;
    moukon_baseimage.image = base_moukon;
    
    [self.view addSubview:moukon_baseimage];
    [self.view addSubview:image0];
    
    switch (feel) {
        case 0:
            XX = 0.5;
            break;
        case 1:
            XX = 1.0;
            break;
        case 2:
            XX = 1.5;
            break;
        case 3:
            XX = 2.0;
            break;
        case 4:
            XX = 2.5;
            break;
        default:
            break;
    }
    
    [UIView animateWithDuration:XX
                          delay:0.2
                        options:animeOptions
                     animations:^{
                         image0.center = CGPointMake(cx, cy+10);
                     }
                     completion:Nil];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    myView3.userInteractionEnabled = YES;
    btn.userInteractionEnabled = YES;
    myView1.userInteractionEnabled = YES;
    UIButtonBuyItem.userInteractionEnabled = YES;
    
    [self after_levelup];
    [soundStart play];
    
    [self moukonkun:moukonList[moukon_condition] feeling:moukon_condition];
    
    spend_point = [[NSUserDefaults standardUserDefaults] integerForKey:@"shyouhiPoint"];
    
    pt = [[NSUserDefaults standardUserDefaults] integerForKey:@"reservePoint"];
    point = [NSString stringWithFormat:@"現在 %ld pt 保持",(long)pt];
    labelPoint.text = point;
    
    [self shouhiPoint];
    
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"limit_ikumou"] == 7) {
        limit_ikumou = 7;
        ikumou_number = [[NSUserDefaults standardUserDefaults] integerForKey:@"ikumou_number"];
        [btn setBackgroundImage:ikumou_img[ikumou_number][limit_ikumou] forState:UIControlStateNormal];
    }
    
    [self  kisekaeMegane:[self meganeitem]];
    [self  kisekaetie:[self tieitem]];
    [self  kisekaeSuit:[self suititem]];
    
    [self levelup];
    
    
    com_number = [[NSUserDefaults standardUserDefaults] integerForKey:@"comment"];
    if (com_number == 0) {
        [[NSUserDefaults standardUserDefaults] setInteger:1  forKey:@"comment"];
        [yajirushiView setFrame:CGRectMake(33, 328, 30, 40)];
        [self.view addSubview:yajirushiView];
        [self comment:8];
    }else if(com_number == 1){
        [[NSUserDefaults standardUserDefaults] setInteger:2  forKey:@"comment"];
        [yajirushiView setFrame:CGRectMake(263, 287, 30, 40)];
        [self.view addSubview:yajirushiView];
        [self comment:9];
    }else{
        [self comment:7];
    }
}

-(void)shouhiPoint{
    int needPoint = levelupPoint[level] - (int)spend_point;
    if (needPoint > 0) {
        _sppoint =  [NSString stringWithFormat:@"%@に昇進まで %ld pt 消費が必要",rankName[level],levelupPoint[level] - spend_point];
    }else if ((needPoint <= 0)&&(level <=3)){
        _sppoint =  [NSString stringWithFormat:@"%@に昇進まで 0 pt 消費が必要",rankName[level]];
    }else{
        _sppoint = @"もう社長やで！";
    }
    syouhiPoint.text = _sppoint;
}

-(int)suititem{
    NSDictionary *buy = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"buyType"];
    
    sutu[0] = (NSNumber *)[buy valueForKey:@"item01"];
    sutu[1] = (NSNumber *)[buy valueForKey:@"item02"];
    sutu[2] = (NSNumber *)[buy valueForKey:@"item03"];
    sutu[3] = (NSNumber *)[buy valueForKey:@"item04"];
    
    for (int i= 0; i <= 3; i++) {
        itemType[i] = [sutu[i] unsignedIntegerValue];
    }
    
    if (itemType[0] == 2) {
        suit = 1;
    }else if (itemType[1] == 2){
        suit = 2;
    }else if (itemType[2] == 2){
        suit = 3;
    }else if (itemType[3] == 2){
        suit = 4;
    }else{
        suit = 0;
    }
    
    return suit;
}

-(int)tieitem{
    NSDictionary *buy = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"buyType"];
    
    sutu[4] = (NSNumber *)[buy valueForKey:@"item05"];
    sutu[5] = (NSNumber *)[buy valueForKey:@"item06"];
    sutu[6] = (NSNumber *)[buy valueForKey:@"item07"];
    sutu[7] = (NSNumber *)[buy valueForKey:@"item08"];
    
    for (int i= 4; i <= 7; i++) {
        itemType[i] = [sutu[i] unsignedIntegerValue];
    }
    
    if (itemType[4] == 2) {
        tie = 1;
    }else if (itemType[5] == 2){
        tie = 2;
    }else if (itemType[6] == 2){
        tie = 3;
    }else if (itemType[7] == 2){
        tie = 4;
    }else{
        tie = 0;
    }
    
    return tie;
}

-(int)meganeitem{
    NSDictionary *buy = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"buyType"];
    
    sutu[8] = (NSNumber *)[buy valueForKey:@"item09"];
    sutu[9] = (NSNumber *)[buy valueForKey:@"item10"];
    sutu[10] = (NSNumber *)[buy valueForKey:@"item11"];
    sutu[11] = (NSNumber *)[buy valueForKey:@"item12"];
    
    for (int i= 8; i <= 11; i++) {
        itemType[i] = [sutu[i] unsignedIntegerValue];
    }
    
    if (itemType[8] == 2) {
        glasses = 1;
    }else if (itemType[9] == 2){
        glasses = 2;
    }else if (itemType[10] == 2){
        glasses = 3;
    }else if (itemType[11] == 2){
        glasses = 4;
    }else{
        glasses = 0;
    }
    
    return glasses;
}


-(void)kisekaeMegane:(int)number
{
    switch (number) {
        case 1:
            meganeView.image = item_img[2][0];
            [self.view addSubview:meganeView];
            break;
        case 2:
            meganeView.image = item_img[2][1];
            [self.view addSubview:meganeView];
            break;
        case 3:
            meganeView.image = item_img[2][2];
            [self.view addSubview:meganeView];
            break;
        case 4:
            meganeView.image = item_img[2][3];
            [self.view addSubview:meganeView];
            break;
        default:
            [meganeView removeFromSuperview];
            break;
    }
}

-(void)kisekaeSuit:(int)number
{
    switch (number) {
        case 1:
            suitView.image = item_img[0][0];
            [self.view addSubview:suitView];
            [self.view sendSubviewToBack:suitView];
            break;
        case 2:
            suitView.image = item_img[0][1];
            [self.view bringSubviewToFront:suitView];
            [self.view sendSubviewToBack:suitView];
            break;
        case 3:
            suitView.image = item_img[0][2];
            [self.view bringSubviewToFront:suitView];
            [self.view sendSubviewToBack:suitView];
            break;
        case 4:
            suitView.image = item_img[0][3];
            [self.view bringSubviewToFront:suitView];
            [self.view sendSubviewToBack:suitView];
            break;
        default:
            suitView.image = tanktop;
            [self.view bringSubviewToFront:suitView];
            [self.view sendSubviewToBack:suitView];
            break;
    }    
}

-(void)kisekaetie:(int)number
{
    switch (number) {
        case 1:
            nekutaiView.image = item_img[1][0];
            [self.view addSubview:nekutaiView];
            [self.view bringSubviewToFront:nekutaiView];
            break;
        case 2:
            nekutaiView.image = item_img[1][1];
            [self.view addSubview:nekutaiView];
            [self.view bringSubviewToFront:nekutaiView];
            break;
        case 3:
            nekutaiView.image = item_img[1][2];
            [self.view addSubview:nekutaiView];
            [self.view bringSubviewToFront:nekutaiView];
            break;
        case 4:
            nekutaiView.image = item_img[1][3];
            [self.view addSubview:nekutaiView];
            [self.view bringSubviewToFront:nekutaiView];
            break;
        default:
            [nekutaiView removeFromSuperview];
            break;
    }
}

//レベルアップ後の表示
-(void)after_levelup{
    
    NSInteger level_now = [[NSUserDefaults standardUserDefaults] integerForKey:@"level_now"];
    
    switch (level_now) {
        case 1:
            BGM = @"itemviewbgm";
            [self setBack:1];
            yakusyokuGazouInstance.image = rank[1];
            [self.view addSubview:yakusyokuGazouInstance];
            [self.view addSubview:katura[0]];
            break;
        case 2:
            BGM = @"afterlevelupbgm";
            [self setBack:2];
            yakusyokuGazouInstance.image = rank[2];
            [self.view addSubview:yakusyokuGazouInstance];
            [katura[0] removeFromSuperview];
            [self.view addSubview:katura[1] ];
            break;
        case 3:
            [self setBack:3];
            yakusyokuGazouInstance.image = rank[3];
            [self.view addSubview:yakusyokuGazouInstance];
            [katura[1] removeFromSuperview];
            [self.view addSubview:katura[2] ];
            break;
        case 4:
            [self setBack:4];
            yakusyokuGazouInstance.image = rank[4];
            [self.view addSubview:yakusyokuGazouInstance];
            [katura[2] removeFromSuperview];
            [self.view addSubview:katura[3] ];
            break;
        case 5:
            [self setBack:5];
            yakusyokuGazouInstance.image = rank[5];
            [self.view addSubview:yakusyokuGazouInstance];
            [katura[3] removeFromSuperview];
            [self.view addSubview:katura[4] ];
            break;
        default:
            break;
    }
}

//瞬きのアニメーションのタイミング
- (void)wink{
    CGRect rect = CGRectMake(109, 230, 95, 40);
    mememe = [[UIImageView alloc]initWithFrame:rect];
    mememe.image = [UIImage imageNamed:@"me-01-a.png"];
    [self.view addSubview:mememe];
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(mabataki) userInfo:nil repeats:YES];
    
}

//瞬きのアニメーション
-(void)mabataki{
    // アニメーション用画像を配列にセット
    NSMutableArray *imageList = [NSMutableArray array];
    UIImage *imgeye = [UIImage imageNamed:@"me-01-b.png"];
    [imageList addObject:imgeye];
    // アニメーション用画像をセット
    mememe.animationImages = imageList;
    // アニメーションの速度
    mememe.animationDuration = 0.2;
    mememe.animationRepeatCount = 1;
    [mememe startAnimating];
    
}

//笑顔のアニメーション
-(void)egao{
    mememe.image = [UIImage imageNamed:@"me-01-c.png"];
    [self.view addSubview:mememe];
    [NSTimer scheduledTimerWithTimeInterval:3.5f target:self selector:@selector(afteregao) userInfo:nil repeats:NO];
}

-(void)afteregao{
    mememe.image = [UIImage imageNamed:@"me-01-a.png"];
    [self.view addSubview:mememe];
    [mememe startAnimating];
}

//アイテム購入画面への遷移
- (void)tapBuyItemButton:(UIButton*)sender {
    
    UIViewController *toBuyItemViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"BuyItemViewController"];
    [self presentViewController:toBuyItemViewController animated:YES completion:nil];
}

//activeになったときに実行される
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addpoint:) name:UIApplicationDidBecomeActiveNotification object:nil];
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [soundStart stop];
    
    [[NSUserDefaults standardUserDefaults] setInteger:level forKey:@"level"];
    [[NSUserDefaults standardUserDefaults] setInteger:limit_ikumou forKey:@"limit_ikumou"];
    [[NSUserDefaults standardUserDefaults] setInteger:pt forKey:@"reservePoint"];
    [[NSUserDefaults standardUserDefaults] setInteger:spend_point forKey:@"shyouhiPoint"];
    [[NSUserDefaults standardUserDefaults] setObject:date forKey:@"cdate"];
    if (flag == NO) {
        [[NSUserDefaults standardUserDefaults] setObject:now forKey:@"date_before"];
        [[NSUserDefaults standardUserDefaults] setBool:flag forKey:@"time_flag"];
    }
}

//１日の決まった時間にポイントを加えるメゾット
-(void)addpoint:(id)sender
{
    [self moukonkun:moukonList[moukon_condition] feeling:moukon_condition];
    
    //日付の表示(ローカル時間に対応)
    now = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone] secondsFromGMT]];
    
    //nowの時間を00:00:00にして日付だけ比べられるようにする
    NSDateFormatter *nowFormatter = [[NSDateFormatter alloc] init];
    [nowFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *now_string = [nowFormatter stringFromDate:now];
    NSString* now_new_string = [NSString stringWithFormat:@"%@ 00:00:00" ,now_string];
    
    NSDateFormatter *now_again = [[NSDateFormatter alloc] init];
    [now_again setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    //ここでnowの時間を00:00:00にしたNSDateを再び取得(標準時間)
    NSDate* nowformatterDate = [now_again dateFromString:now_new_string];
    NSTimeZone *tz = [NSTimeZone systemTimeZone];
    NSInteger seconds0 = [tz secondsFromGMTForDate: nowformatterDate];
    
    //ここでnowの時間を00:00:00にしたNSDateを再び取得(ローカル時間に対応)
    NSDate *localdate = [nowformatterDate dateByAddingTimeInterval:seconds0];
    
    //次にnowの時間だけ取得する(日付関係なし)
    NSDateFormatter *now_hour = [[NSDateFormatter alloc] init];
    [now_hour setDateFormat:@"HH:mm:ss"];
    NSString *now_month = [now_hour stringFromDate:now];
    NSDateFormatter *compare_this = [[NSDateFormatter alloc] init];
    [compare_this setDateFormat:@"HH:mm:ss"];
    //ここでnowの日付を統一したNSDateを再び取得
    NSDate *compare_day = [compare_this dateFromString:now_month];
    
    
    //アプリを始めた日の取得
    NSDate *download_date = [[NSUserDefaults standardUserDefaults] objectForKey:@"cdate"];
    
    //アプリを始めた日から今まで差分をfloatで取得
    float spend_time = [now timeIntervalSinceDate:download_date];
    
    //アプリを始めた日から今まで何日経ったか計算
    int spend_date = floorf((float)(spend_time/ 86400));
    
    //アプリを始めた日から今までの日付の表示
    NSString * hizuke = [NSString stringWithFormat:@"%d 日目",spend_date];
    //テキストの内容を指定
    labelday.text = hizuke;
    
    //初期化時にflagをYESにセット、次にアクティブになったときにNOになる
    flag = [[NSUserDefaults standardUserDefaults] boolForKey:@"time_flag"];
    if ((flag == NO) && (spend_date == 0)) {
        flag = YES;
        [[NSUserDefaults standardUserDefaults] setBool:flag forKey:@"time_flag"];
        [[NSUserDefaults standardUserDefaults] setObject:now forKey:@"date_before"];
        
        pt += point_add;
        point = [NSString stringWithFormat:@"現在 %ld pt 所持",(long)pt];;
        labelPoint.text = point;
        
    }else if(flag == YES) {
        NSDate *date_before = [[NSUserDefaults standardUserDefaults] objectForKey:@"date_before"];
        
        NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
        [outputFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *maenohi = [outputFormatter stringFromDate:date_before];
        
        //一個前のviewdidLoadで表示したときの日まで
        NSString* dateString = [NSString stringWithFormat:@"%@ 00:00:00" ,maenohi];
        NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
        [inputFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate* formatterDate = [inputFormatter dateFromString:dateString];
        
        //標準時間から現地時間に変更
        NSInteger seconds = [tz secondsFromGMTForDate: formatterDate];
        NSDate *old_localdate = [formatterDate dateByAddingTimeInterval:seconds];
        
        NSDateFormatter *download_hour = [[NSDateFormatter alloc] init];
        [download_hour setDateFormat:@"HH:mm:ss"];
        NSString *download_string = [download_hour stringFromDate:download_date];
        
        //result_dayで比較するためにresult_dayに再び変更
        NSDateFormatter *download_compare= [[NSDateFormatter alloc] init];
        [download_compare setDateFormat:@"HH:mm:ss"];
        NSDate *compare_that = [download_compare dateFromString:download_string];
        
        NSComparisonResult result = [old_localdate compare:localdate];
        NSComparisonResult result_day = [compare_that compare:compare_day];
        
        if (result == NSOrderedSame) {
            //前の日から今まで何日経ったか計算
            float spend_day = [now timeIntervalSinceDate:date_before];
            daynumber = floorf((float)(spend_day/ 86400));
        
            if((result_day == NSOrderedAscending) || (result_day == NSOrderedSame)){
                
                daynumber = floorf((float)(spend_day/ 86400));
                ptx = daynumber * point_add;
                pt += ptx;
                point =  [NSString stringWithFormat:@"%ld pt",(long)pt];
                [self moukon_condition];
                
            }else if ((result_day == NSOrderedDescending) && (daynumber >= 2)){
                //前の日から今まで何日経ったか計算
                daynumber = floorf((float)(spend_day/ 86400)) - 1;
                ptx = daynumber * point_add;
                pt += ptx;
                point =  [NSString stringWithFormat:@"%ld pt",(long)pt];
                [self moukon_condition];
            }
        }
    }
}

//もうこんくんの状態変更
-(void)moukon_condition{
    ikumou_flag = YES;
    if (daynumber == 1) {
        moukon_condition = 0;
    }else if((daynumber > 1)&& (daynumber <=2)){
        moukon_condition = 1;
    }else if((daynumber > 2)&& (daynumber <=3) ){
        moukon_condition = 2;
    }else if((daynumber > 3)&& (daynumber <=5) ){
        moukon_condition = 3;
    }else if((daynumber > 5)&& (daynumber <=7)){
        moukon_condition = 3;
    }else if(daynumber > 8){
        moukon_condition = 4;
        pt = 0;
        point =  [NSString stringWithFormat:@"%ld pt",(long)pt];
    }
    
    [self moukonkun:moukonList[moukon_condition] feeling:moukon_condition];
}


-(void)music{
    NSString *messageStr = [NSString stringWithFormat:@"%@",BGM];
    
    //ゲームシーンに入ったときに鳴る音
    NSString *bgmPath = [[NSBundle mainBundle] pathForResource:messageStr ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    soundStart = [[AVAudioPlayer alloc]initWithContentsOfURL:bgmUrl error:nil];
    [soundStart setNumberOfLoops:-1];
    
    
    //レベルアップ時に鳴る音
    NSString *bgmPath_level = [[NSBundle mainBundle] pathForResource:@"ban1"
                                                              ofType:@"mp3"];
    NSURL *bgmUrl_level = [NSURL fileURLWithPath:bgmPath_level];
    soundLevelUp = [[AVAudioPlayer alloc]initWithContentsOfURL:bgmUrl_level error:nil];
    [soundLevelUp setNumberOfLoops:0];
    
    //レベルアップ時に鳴る音
    NSString *tap_level = [[NSBundle mainBundle] pathForResource:@"wao1"
                                                              ofType:@"mp3"];
    NSURL *bgm_level = [NSURL fileURLWithPath:tap_level];
    fukidashiSound = [[AVAudioPlayer alloc]initWithContentsOfURL:bgm_level error:nil];
    [fukidashiSound setNumberOfLoops:0];
    
    //育毛剤を塗っている時に鳴る音
    NSString *bgmPath_nuru = [[NSBundle mainBundle] pathForResource:@"switch1"
                                                             ofType:@"mp3"];
    NSURL *bgmUrl_nuru = [NSURL fileURLWithPath:bgmPath_nuru];
    ikumouNuru = [[AVAudioPlayer alloc]initWithContentsOfURL:bgmUrl_nuru error:nil];
    [ikumouNuru setNumberOfLoops:0];
    
    //育毛剤が塗り終わった時に鳴る音
    NSString *bgmPath_end = [[NSBundle mainBundle] pathForResource:@"eye-shine1"
                                                            ofType:@"mp3"];
    NSURL *bgmUrl_end = [NSURL fileURLWithPath:bgmPath_end];
    ikumouEnd = [[AVAudioPlayer alloc]initWithContentsOfURL:bgmUrl_end error:nil];
    [ikumouEnd setNumberOfLoops:0];
    
    //育毛剤を押した時に鳴る音
    NSString *bgmPath_osu = [[NSBundle mainBundle] pathForResource:@"puyon1"
                                                            ofType:@"mp3"];
    NSURL *bgmUrl_osu = [NSURL fileURLWithPath:bgmPath_osu];
    ikumouPush = [[AVAudioPlayer alloc]initWithContentsOfURL:bgmUrl_osu error:nil];
    [ikumouPush setNumberOfLoops:0];
}

//広告
-(void)ad{
    [appCCloud setupAppCWithMediaKey:@"12345" option:APPC_CLOUD_AD];
    appCSimpleView* advertisement = [[appCSimpleView alloc]
                                     initWithViewController:self vertical:appCVerticalBottom];
    [self.view addSubview:advertisement];
}


-(void)serifu{
    message[0] = @[@"今日も上司に怒られたわー。もうへとへとやー。",
                   @"雨がどしゃぶりやのに、洗濯物外にほっしぱなしやがなー",
                   @"残業手当出えへんのに、今日も残業やがなー、ふー",
                   @"今日は飲み会でつぶれてもうたがなー",
                   @"つまみが全然あらへんがなー、買いにいこ。",
                   @"婚活パーティーでも全然もてへんなー",
                   @"原チャリのタイヤいたずらされとるがなー!キー!!",
                   @"ううう、完全に二日酔いや。ウェッ！！",
                   @"給料変わらへんなー。飲み会セーブせんと。。",
                   @"おれの足くっさー",
                   @"今日も夜ご飯もやしやなー。ビンボーやなー",
                   @"そろそろ窓際族になってまうでー。",
                   @"また後輩が昇進やー。ほんま勘弁してやー。。。",
                   @"やっと給料日か。。。新しい育毛剤なんて俺の給料じゃ買えへんわ。",
                   @"おっ、お腹イタイ。。。",
                   @"ひげジョリジョリやー気持ちいー！",
                   @"タバコの消費税どんだけやねん、キー！",
                   @"お腹もぽっこり出てもうてるわー",
                   @"肌のハリツヤどこに消えたんやー",
                   @"もう年やなー。シワシワお化けやがな！！",
                   @"顔にシミができてもーたー",
                   @"最近はもう白髪も生えんわー",
                   @"お金がないわーお金がないわーお金がないわー",
                   @"今日は心底疲れてもうたわー。誰か肩叩いてくれんかなー",
                   @"ゴキブリ怖いわー。こんな年になっても怖いもんは怖いわー",
                   @"風呂トイレ別・南向きで敷金礼金安いところに住みたいわー",
                   @"本格的に節約せんとホンマ厳しいわー。人生厳しいわー"
                   ];
    
    message[1] = @[@"久しぶりにハイキングでもいこかー！",
                   @"今日は朝からパチンコやでー。うっほーい。",
                   @"彼女からまた分かれようって言われたわー。",
                   @"もうちょっといい育毛剤がほしいなー。",
                   @"かつら被ってるのばれてもうたー",
                   @"新しく入った新人の女の子可愛かったなぁ。",
                   @"今日も接待。はー、二日酔いなのにー！",
                   @"彼女からまた分かれようって言われたわー。",
                   @"あいつも結婚したんかー。わしも夢ん中では可愛い奥さんおるけどんな。",
                   @"ほんま使えない部下が多くて嫌になるわ。",
                   @"バカにしやがってー！！ハゲは男の主張やー！！",
                   @"明日スーパーの特売日やー。早く仕事終えんと！！",
                   @"重要な書類家に忘れてきてもーた。どうしよう。。",
                   @"キンキンに冷えたビールもってこーい!",
                   @"部下のマネジメントは難しいわ。",
                   @"英語の勉強せんとあかんわー。ぐっどーモーニング。",
                   @"汚いカバン変えたいけど・・・まだまだ買えんな。。",
                   @"やっと給料日か。。。新しい育毛剤なんて俺の給料じゃ買えへんわ。",
                   @"髪の毛が後退してきてるわー。ピンチやわー",
                   @"実家に帰る度、髪が薄くなってるお父さんをみるとおじさんになってくなあと思うわ",
                   @"ヒゲにも白髪が混じってきたでー。そろそろ生えてこなくなるでー",
                   @"加齢臭が気になるでー。エチケットは大事やもんねー",
                   @"オヤジギャグ言ったら、お姉さんにヒールでグリグリされたでー。怖いわー",
                   @"痛風が辛いわー。泣きたいほど辛いわー。プリン体の文字見るのも嫌やわー",
                   @"同期がどんどん出世していくでー。こんな悲しいことはないで。",
                   @"ど根性野菜のニュースやってたで。自分もどんなところでもグングン伸びたるで！！",
                   @"今日は部屋にヤモリちゃんがいたでー。カワイイけど落ち着かんなー",
                   @"朝ごはんしっかり食べなあかんな。早起きして一日三食しっかり食べな！！",
                   @"お風呂の排水口に髪の毛溜まってきたでー。あーハゲていくー",
                   @"シャンプー変えたら頭かゆくなってしもうたわー。失敗やー",
                   @"取引先の相手と食事したら意気投合したわー。いい風吹いてるでー",
                   @"今日は集中力が続かんなー。。。いかんいかん！！自分しっかりせーや！！",
                   @"気分を変えて、新しい服装にしたいわー。ビシッとかっこよくキメたいわー"
                   ];
    
    message[2] = @[@"今日もはりっきっていくぜー！",
                   @"この前、トヨタの新車買っちゃったよ。",
                   @"彼女にプロポーズしたらOKだったよ。",
                   @"ボーナス100万！結果だしってっからねー。",
                   @"この育毛剤なかなかいいなー。",
                   @"いい部下をたくさんもったよ。",
                   @"俺は世界一の幸せ者かもしれない。",
                   @"やることがいっぱいあることは良いことだなぁ。",
                   @"この育毛剤なかなかいいなー。",
                   @"カツラはもう被らんでもいいかな。嬉しいわー",
                   @"ああ・・・俺も部長になったんやな。。。",
                   @"I can speak English fluently",
                   @"最近は婚活でモテモテで女の子選び放題や!これなら将来安心だな",
                   @"やっぱり育毛剤は高いものに限るなー。",
                   @"久しぶりにゴルフでも行こうかな。",
                   @"そろそろ窓際族になってまうでー。",
                   @"また後輩が昇進やー。ほんま勘弁してやー。。。",
                   @"やっと給料日か。。。新しい育毛剤なんて俺の給料じゃ買えへんわ。",
                   @"階段を上ったときに、息が切れるわー。でも頑張らなあかんな！！",
                   @"最近、出無精やわー。このまま溶けてなくなってしまうんちゃうかー",
                   @"最近の若いもんはホンマどうしようもないなー。地べたに座るなやー",
                   @"腰が痛いわー。たんが絡むわー。足がしびれるわー",
                   @"この頃、何でもかんでもヨッコイショって言ってまうわー",
                   @"久しぶりに旅行でも行ってリラックスしてこよかなー",
                   @"新しい趣味でも始めてみよかなー。どんなことしてみよかなー",
                   @"今日も疲れたわー。マッサージしてもらいたいわー",
                   @"頭皮マッサージしてもらおかな！！この頭ならやり放題やで。",
                   @"人生前向きやでー。どんなことでもくじけず頑張らんとなー！！"
                   ];
    
    message[3] = @[@"今度、部下にごちそうするかー！",
                   @"そろそろ都内に一戸建ての家を買おうかなー。",
                   @"貯金も結構溜まってきたなー、株の資金に回そう。",
                   @"早起きはビジネスマンの基本。",
                   @"今日は息子の授業参観日だ、楽しみだなー。",
                   @"愛人できたわー。両手に抱えきれんぐらいできたわー",
                   @"今の立場もみんなのおかげや。謙虚に生きなきゃあきまへん。",
                   @"気づけば嫌いだった上司より立場が上になってたわー。",
                   @"継続は力なりやでー。初心を忘れず毎日育毛剤使おうや。",
                   @"俺は世界一の幸せ者かもしれない。",
                   @"彼女にプロポーズしたらOKだったよ。",
                   @"この育毛剤なかなかいいなー。",
                   @"いい部下をたくさんもったよ。",
                   @"最近は髪の毛が抜けにくくなった気がするなぁ",
                   @"俺は世界一の幸せ者かもしれない。",
                   @"久しぶりにゴルフでも行こうかな。",
                   @"そろそろ窓際族になってまうでー。",
                   @"また後輩が昇進やー。ほんま勘弁してやー。。。",
                   @"やっと給料日か。。。新しい育毛剤なんて俺の給料じゃ買えへんわ。",
                   @"今日もやる気出して頑張ろか！！人生山あり谷ありやで。",
                   @"男にはやらなきゃいけないときがある。誰かが言ってたでー",
                   @"この仕事も悪くないなー。最近やっとそう思えてきたわー",
                   @"髪の毛の調子がすこぶるいいわー。しっかり育毛剤塗ってるからやなー",
                   @"今日は奥さんにお花買って行ってあげようかな。",
                   @"今日はすこぶる調子がいいでー。めっちゃ元気やでー",
                   @"俺らがバシバシ働いて、日本元気にするでー",
                   @"気抜いてると追い越されそうやー。シャキッとせなあかんなー",
                   @"今日は毛穴の調子がいい感じやでー。おっさんわかるでー",
                   @"しっかり貯金せんとすぐなくなってまうなー"
                   ];
    
    message[4] = @[@"髪の毛満足しとらんぞー！！もっともっと増やすんやー",
                   @"やったー大手クライアントと業務提携や!",
                   @"今度の休みは家族でグアム旅行に行こうかー",
                   @"サグラダファミリア2026年に完成やでー。社長になってお金貯めんとー",
                   @"今日の会食の服は何にしようかなー。",
                   @"この地位に甘んじてはいかんな。日々勉強や。日々努力やで。",
                   @"社長しっかりしろやー。俺が社長になっていい会社作りたいわー",
                   @"景気のいい間にどんどん仕掛けていくぞ！",
                   @"人材の採用にもっと力を入れねばあかんわ。",
                   @"髪の毛満足しとらんぞー！！もっともっと増やすんやー。",
                   @"久しぶりの休日、妻とゆっくり過ごそうかな。",
                   @"最近の育毛剤は安くて、効果絶大らしいんやー。",
                   @"部下の失態は上司にある。自分が責任とらんと！",
                   @"社員数が増えてきたな。もうそろそろ移転を考えんと。",
                   @"そろそろ窓際族になってまうでー。",
                   @"また後輩が昇進やー。ほんま勘弁してやー。。。",
                   @"やっと給料日か。。。新しい育毛剤なんて俺の給料じゃ買えへんわ。",
                   @"しっかり社長をサポートするで！！俺にしかできない仕事もあるんや！！",
                   @"あとちょっとで社長や。ここまで来たからには社長になりたいなー",
                   @"そろそろ自分のためじゃなくて、社会のためにお金を使いたくなってきたでー",
                   @"奥さんにはなかなか言えんけど、今の奥さんでよかったなーと思うで！！",
                   @"いくつになってもお腹は減るもんやなー。今日もいっぱい食べるでー",
                   @"お金は使った分だけ入ってくるんやでー、どんどん使おうやー",
                   @"最近の若者は演歌聞かんのかいな。いい歌多いねんけどなー",
                   @"コミュニケーションの基本は人の話を聞くことやねんなー",
                   @"昔みた夢はだいたい叶ってしもうたな。嬉しいけど寂しいような。。。",
                   @"近頃は、髪の毛で排水口が詰まることもなくなってきたでー。嬉しいわー",
                   ];
    
    message[5] = @[@"このままではいけない、一丸となって、世界に勝つんやー!",
                   @"この世に不可能ということはないんやでー!",
                   @"日本は技術力で勝負するしかないんやー。",
                   @"うちの会社の株価が上がっているなー、よしよし。",
                   @"未来はきっとよくなる、今を一生懸命がんばるんや。",
                   @"おし、久しぶりに髪の毛でも切りにいくか。",
                   @"とうとうここまできたのか。。感慨深いでー",
                   @"自分がしっかりせな皆が路頭に迷うんや。しっかりせんと！！",
                   @"さんちゃん今日もおもろいなー。自分もおもろくなりたいわー",
                   @"今日は会社のみんなでパーティーするでー！",
                   @"息子も大きくなったなぁ。今度二人で飲みに行くか。",
                   @"ここまできたんや。一番いい育毛剤使ったるでー。",
                   @"継続力は力なり。続けて何事にも取り組めば結果に繋がるんや。",
                   @"今のうちにアジアのシェアをどんどん伸ばしていくでー",
                   @"そろそろ窓際族になってまうでー。",
                   @"また後輩が昇進やー。ほんま勘弁してやー。。。",
                   @"やっと給料日か。。。新しい育毛剤なんて俺の給料じゃ買えへんわ。",
                   @"いくつになってもお腹は減るもんやなー。今日もいっぱい食べるでー",
                   @"みんなどんどんウチの株買ってやー。絶対損させまへんでー",
                   @"もういい年やから体調管理をしっかりせんとな。よし、人間ドッグや！！",
                   @"ライバルがいっぱいいてハラハラドキドキやわー。胃もキリキリするわー",
                   @"日本にはスゴイ経営者がいっぱいいるから見習わんと。日々勉強や！！",
                   @"前進あるのみ！！昨日できなかったことは今日できるようになろう",
                   @"みんなどんどんウチの株買ってやー。絶対損させまへんでー",
                   @"もういい年やから体調管理をしっかりせんとな。よし、人間ドッグや！！",
                   @"ライバルがいっぱいいてハラハラドキドキやわー。胃もキリキリするわー",
                   @"日本にはスゴイ経営者がいっぱいいるから見習わんと。日々勉強や！！",
                   @"前進あるのみ！！昨日できなかったことは今日できるようになろう",
                   @"オシャレは足元からや。靴は毎日ピカピカに磨かんとな！！",
                   @"爪は毎日切っておこう。清潔感もあるし、お客さんを傷つけたら大変やからなー",
                   @"社長がこんなに大変だとは知らんかったわー。寝る暇ないわー。。。",
                   @"最近運動不足やでー。時間作ってしっかり動かなメタボになるでー",
                   @"ここまで支えてくれた奥さんにホンマに感謝やでー。なんぼ言うても伝えきれんわー",
                   ];
}
@end