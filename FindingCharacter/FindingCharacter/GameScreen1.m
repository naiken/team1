//
//  GameScreen1.m
//  FindingCharacter
//
//  Created by prom phanit on 4/30/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "GameScreen1.h"
#import "GameScreen2.h"

@interface GameScreen1 ()

@end

@implementation GameScreen1

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countTime) userInfo:nil repeats:YES];
    
    switch (self.levelSelect) {
        case 1:
            count=5;
            self.levelLabel.text = [NSString stringWithFormat:@"Level %d", self.levelSelect];
            self.timeLabel.text = [NSString stringWithFormat:@"%d", count];
            imageNumber = arc4random() % 9 + 1;
            imageName = [NSString stringWithFormat:@"girl-%i.png",imageNumber];
            [self changeImage:imageName];
            break;
        case 2:
            count=5;
            self.levelLabel.text = [NSString stringWithFormat:@"Level %d", self.levelSelect];
            self.timeLabel.text = [NSString stringWithFormat:@"%d", count];
            imageNumber = arc4random() % 12 + 1;
            imageName = [NSString stringWithFormat:@"boy-%i.png",imageNumber];
            [self changeImage:imageName];
            break;
        case 3:
            count=4;
            self.levelLabel.text = [NSString stringWithFormat:@"Level %d", self.levelSelect];
            self.timeLabel.text = [NSString stringWithFormat:@"%d", count];
            imageNumber = arc4random() % 15 + 1;
            imageName = [NSString stringWithFormat:@"cat-%i.png",imageNumber];
            [self changeImage:imageName];
            break;
        case 4:
            count=3;
            self.levelLabel.text = [NSString stringWithFormat:@"Level %d", self.levelSelect];
            self.timeLabel.text = [NSString stringWithFormat:@"%d", count];
            imageNumber = arc4random() % 16 + 1;
            imageName = [NSString stringWithFormat:@"dog-%i.png",imageNumber];
            [self changeImage:imageName];
            break;
        case 5:
            count=2;
            self.levelLabel.text = [NSString stringWithFormat:@"Level %d", self.levelSelect];
            self.timeLabel.text = [NSString stringWithFormat:@"%d", count];
            imageNumber = arc4random() % 16 + 1;
            imageName = [NSString stringWithFormat:@"hat-%i.png",imageNumber];
            [self changeImage:imageName];
            break;
        case 6:
            count=2;
            self.levelLabel.text = [NSString stringWithFormat:@"Level %d", self.levelSelect];
            self.timeLabel.text = [NSString stringWithFormat:@"%d", count];
            imageNumber = arc4random() % 20 + 1;
            imageName = [NSString stringWithFormat:@"hana-%i.png",imageNumber];
            [self changeImage:imageName];
            break;
        default:
            break;
    }
    
    // Do any additional setup after loading the view.
}

-(void) countTime{
    count--;
    
    self.timeLabel.text = [NSString stringWithFormat:@"%d", count];
    if(count == 0){
        [timer invalidate];
        GameScreen2 *gamescreen2 = [self.storyboard instantiateViewControllerWithIdentifier:@"Game2"];
        [self presentViewController:gamescreen2 animated:NO completion:nil];
    }
    
}

-(void)changeImage:(NSString *)imgName{
    self.imageFrame.image=[UIImage imageNamed:imgName];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
