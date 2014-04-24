//
//  TopDesignController.m
//  example
//
//  Created by 谷尾 和是 on 2014/03/19.
//  Copyright (c) 2014年 Masa. All rights reserved.
//

#import "TopDesignController.h"

@interface TopDesignController (){
    NSInteger X;
    NSInteger Y;
}
-(void)saveDefault;
@end

@implementation TopDesignController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//テーブルのセクション数を決めるメゾット
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//セルの数を決定するメゾット
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

//アプリを起動したときに実行するメゾット
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //10個の名前を作成
    static const id identifiers[10] = { @"greenCell", @"pinkCell", @"blueCell",@"brownCell", @"sakuraCell",@"kirairaCell",@"hyoCell",@"oceanCell",@"heartCell",@"rainbowCell"};
    //配列を文字列クラスで取り出せるようにする
    NSString* identifier = identifiers[ indexPath.row ];
    //セルの作成
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        //セルの初期化
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    //保存していた数値を取り出すためのクラスを作成
    NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
    //保存していた数値を取り出す(Yはプロパティ宣言済み)
    Y = [myDefaults integerForKey:@"checkCellNumber"];
    
    if(indexPath.row==0){
        //初めのセルにテキストを追加
        cell.textLabel.text = @"グリーン";
        if (Y == 0) {
            //以前に選択されたらチェックマークを追加
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }else if(indexPath.row==1){
        cell.textLabel.text = @"ピンク";
        if (Y == 1) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }else if(indexPath.row==2){
        cell.textLabel.text = @"ブルー";
        if (Y == 2) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }else if(indexPath.row==3){
        cell.textLabel.text = @"ブラウン";
        if (Y == 3) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }else if(indexPath.row==4){
        cell.textLabel.text = @"サクラ";
        if (Y == 4) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }else if(indexPath.row==5){
        cell.textLabel.text = @"スター";
        if (Y == 5) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }else if(indexPath.row==6){
        cell.textLabel.text = @"チェック";
        if (Y == 6) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }else if(indexPath.row==7){
        cell.textLabel.text = @"クリスタル";
        if (Y == 7) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }else if(indexPath.row==8){
        cell.textLabel.text = @"ハート";
        if (Y == 8) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }else{
        cell.textLabel.text = @"レインボー";
        if (Y == 9) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    
    return cell;
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

//セルを選択したときに実行するメゾット
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // テーブルを更新
    [self.tableView reloadData];
    NSUserDefaults *backtext = [NSUserDefaults standardUserDefaults];
    // すべてのセルのチェックを取る
    for (NSInteger index=0; index<[self.tableView numberOfRowsInSection:0]; index++) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
        cell.accessoryType = UITableViewCellAccessoryNone;
        // 選択したセルだけチェックする
        if (indexPath.row == index) {
            //Xに選択したセルの数値を代入(Xはプロパティ宣言済み)
            X = indexPath.row;
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            [backtext setObject:cell.textLabel.text forKey:@"backpic"];
            //チェックしたセルを保存
            [self saveDefault];
        }
    }
    
}

//チェックしたセルを保存するためのメゾット
-(void)saveDefault
{
    //チェックしたセルを保存するためのクラスを作る
    NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
    //Xを保存
    [myDefaults setInteger:X forKey:@"checkCellNumber"];
    //データを更新
    [myDefaults synchronize];
}

@end
