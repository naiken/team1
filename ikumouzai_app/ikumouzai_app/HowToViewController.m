//
//  ViewController.m
//  HowToPlay
//
//  Created by saya on 2014/05/11.
//  Copyright (c) 2014年 marugen. All rights reserved.
//

#import "HowToViewController.h"
#import "ViewController.h"

@interface HowtoViewController (){
    UIView          *messageBgView;
    UIView          *myView1;
    UITextView      *messageView;
    NSString        *viewStr;
    NSTimer         *fukidashitime;
    int             k;
}
@end

@implementation HowtoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //フレームサイズを取得する
    UIImage *backPicture =[UIImage imageNamed:@"ossan-bg.png"];
    UIGraphicsBeginImageContext(self.view.frame.size);
    [backPicture drawInRect:self.view.bounds];
    UIImage *BackPicture = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:BackPicture];
    
    // メッセージ表示の背景
    messageBgView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 20.0, 300.0, 460.0)];
    messageBgView.layer.borderWidth = 1.0f;
    messageBgView.layer.borderColor = [UIColor whiteColor].CGColor;
    messageBgView.backgroundColor = [UIColor blackColor];
    messageBgView.alpha = 0.6f;
    [self.view addSubview:messageBgView];
    
    
    
    messageView = [[UITextView alloc] initWithFrame:CGRectMake(15.0, 25.0, 290.0, 450.0)];
    messageView.editable = NO;
    messageView.userInteractionEnabled = NO;
    messageView.textColor = [UIColor whiteColor];
    messageView.backgroundColor = [UIColor clearColor];
    messageView.font = [UIFont boldSystemFontOfSize:16.5f];
    [self.view addSubview:messageView];
    
    k = 0;
    fukidashitime = [NSTimer
                     scheduledTimerWithTimeInterval:0.06
                     target:self
                     selector:@selector(setTimer:)
                     userInfo:nil
                     repeats:YES];
    
    myView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    [self.view addSubview:myView1];
    
    UITapGestureRecognizer * tapGesture =
    [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    
    myView1.userInteractionEnabled = NO;
    [myView1 addGestureRecognizer:tapGesture];
    
}

- (void)tap:(UISwipeGestureRecognizer *)sender{
    UIViewController *ViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self presentViewController:ViewController animated:YES completion:nil];
}


-(void)setTimer:(NSTimer *)timer{
    viewStr = @"ごきげんよう～。\nぼくの名前は関西禿男(かんさいはげお)。25歳。  \n関西生まれの関西育ちやで。   \nまぁ、今は東京で働いているんやけどなぁ。   \nでも東京での仕事はびっくりするほど厳しくてなぁ～。   \n毎日上司にしごかれ、気づいたら髪がなくなってもうたぁ～。   \n給料も毎月14万しかないし。。   \nこの間は扇風機でカツラが飛んでって、みんなの笑い者になってもうたでwww   \nおいしかったけどな。   \n3年前まではフサフサで、キャバクラでもモテモテやってんけどな～。   \nははは。   \nまたあの頃に戻りたいなぁ～。   \nははは。   \n育毛剤でも使って見ようかなぁ～。\nははは。                    画面タッチ";
    messageView.text = [viewStr substringToIndex:k];
    k++;
    
    
    if(k > [viewStr length]){
        [fukidashitime invalidate];
        myView1.userInteractionEnabled = YES;
    }
    
}


@end
