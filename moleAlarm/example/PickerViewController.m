#import "PickerViewController.h"

@interface PickerViewController (){
    NSArray *choices;
    NSDictionary *boxTime;
    int yyy;
    int dataSave;
    UIPickerView *pickerView ;
}

@end

@implementation PickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
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
    choices = @[@"1 min", @"3 min", @"5 min", @"7 min", @"9 min", @"11 min", @"13 min", @"15 min"];
    boxTime = @{@"1 min":@60.0,@"3 min":@180.0,@"5 min":@300.0,@"7 min":@420.0,@"9 min":@540.0,@"11 min":@660.0,@"13 min":@780.0,@"15 min":@900.0};
    
    pickerView = [[UIPickerView alloc] init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
    [pickerView selectRow:1 inComponent:0 animated:NO];
    
    CGPoint pt = self.view.center;
    pt.y -= 125;
    pickerView.center = pt;
    [self.view addSubview:pickerView];
}

-(void)viewWillAppear:(BOOL)animated
{
    NSUserDefaults *myDefaults = [NSUserDefaults standardUserDefaults];
    dataSave = [myDefaults integerForKey:@"picker"];
    [pickerView selectRow:dataSave inComponent:0 animated:NO];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
// コンポーネント数（列数）
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// 行数
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [choices count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [choices objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSUserDefaults *pickers = [NSUserDefaults standardUserDefaults];
    [pickers setObject:[choices objectAtIndex:row] forKey:@"pickers"];
    
    yyy = [boxTime[[choices objectAtIndex:row]] intValue];
    NSUserDefaults *pickerDefaults = [NSUserDefaults standardUserDefaults];
    [pickerDefaults setInteger:yyy forKey:@"pickerValue"];
    
    NSUserDefaults *pickerDefault = [NSUserDefaults standardUserDefaults];
    [pickerDefault setInteger:row forKey:@"picker"];
}

@end
