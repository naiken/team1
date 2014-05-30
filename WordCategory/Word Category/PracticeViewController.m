//
//  PracticeViewController.m
//  Word Category
//
//  Created by prom phanit on 5/24/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "PracticeViewController.h"
#import "WordCategory1ViewController.h"


@interface PracticeViewController ()

@end

@implementation PracticeViewController

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
    self.title = self.item;
    self.stopGame=NO;
    topp = self.item;

    self.givenNSArray = [[CategoryDatabase database] categoryInfos];
	self.space=7;
	self.w=35;
	self.h=35;
    self.screenWidth = [[UIScreen mainScreen] bounds].size.width;
    self.screenHeight = [[UIScreen mainScreen] bounds].size.height;
	self.countRight=1;
	self.countWrong=0;
	
	self.imgview = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40, 300, 200)];
	[self.imgview setImage:[UIImage imageNamed:@"default.png"]];
	[self.imgview setContentMode:UIViewContentModeScaleAspectFit];
	[self.view addSubview:self.imgview];
    
	[self createLabel];
    [self createButton];
    
    
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    AudioServicesDisposeSystemSoundID(PlaySoundID);

}

-(void)createLabel{
    
	int s=2;
    int myX;
	int myY=270;
    int w=20;
    int h=20;
    NSInteger rand;
    self.la=[[NSMutableArray alloc] init];
    again:
	rand=arc4random() % [self.givenNSArray count];
	self.correctedWord=self.givenNSArray[rand];
    //self.correctedWord = @"apple";
    if([self.correctedWord rangeOfString:@" "].location!=NSNotFound || [self.correctedWord  length] > 12){
        goto again;
    }
    self.correctedWord=self.correctedWord.uppercaseString;
	self.wordLength=[self.correctedWord length];
	NSInteger rand1=arc4random() % self.wordLength;
    int x=(self.screenWidth-(self.wordLength*w+(self.wordLength-1)*s))/2;
    
	for(int i=0;i<self.wordLength;i++) {
		myX=x+w*i+s*i;
		UILabel *label = [[UILabel alloc] init];
		label.tag = i+1;
        if(i==rand1){
            label.text=[NSString stringWithFormat:@"%c",[self.correctedWord characterAtIndex:i]];
        }
        else{
            label.text=@"_";
        }
        
        label.frame = CGRectMake(myX, myY, w, h);
        [self.view addSubview:label];
        [self.la addObject:label];
	}
    
}

-(void)createButton{
    NSArray *buttonText = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", @"Q", @"R", @"S", @"T", @"U", @"V", @"W", @"X", @"Y", @"Z"];
    
    int index;
	int myX;
	int myY;
    self.x=(self.screenWidth-(7*self.w+6*self.space))/2;
    self.y=self.screenHeight-(4*self.h+3*self.space)-20;
    
    for(int i=0;i<4;i++) {
        for(int j=0;j<7;j++) {
			index=i*7+j;
			myX=self.x+self.w*j+self.space*j;
			myY=self.y+self.h*i+self.space*i;
			
			UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
			[button addTarget:self action:@selector(checkResult:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitle:buttonText[index] forState:UIControlStateNormal];
            button.backgroundColor=[UIColor blackColor];
			button.tag = index+1;
			button.frame = CGRectMake(myX, myY, self.w, self.h);
			[self.view addSubview:button];
            if(index==25)return;
        }
    }
}

- (void)drawImage:(int) wrong{
	switch (wrong) {
        case 1:
			[self.imgview setImage:[UIImage imageNamed:@"1.png"]];
            break;
        case 2:
			[self.imgview setImage:[UIImage imageNamed:@"2.png"]];
            break;
		case 3:
			[self.imgview setImage:[UIImage imageNamed:@"3.png"]];
            break;
        case 4:
			[self.imgview setImage:[UIImage imageNamed:@"4.png"]];
            break;
		case 5:
			[self.imgview setImage:[UIImage imageNamed:@"5.png"]];
            break;
        case 6:
			[self.imgview setImage:[UIImage imageNamed:@"6.png"]];
            break;
	}
}

- (IBAction)checkResult:(id)sender{
    
    if(!self.stopGame){
    [sender setBackgroundColor:(__bridge CGColorRef)([UIColor redColor])];
	self.check=NO;
	for (int i=0;i<self.wordLength;i++) {
        if([[[sender titleLabel] text] characterAtIndex:0]==[self.correctedWord characterAtIndex:i]){
            UILabel *label =(UILabel*)self.la[i];
            label.text=[[sender titleLabel] text];
            self.check=YES;
			self.countRight++;
            
            int n=0;
            for(int k=0;k<[self.la count];k++){
                if(![[(UILabel*)self.la[k] text] isEqual:@"_"]){
                    n++;
                }
            }
            
            if(n==self.wordLength){
               // [self showAlertView:@"You Win!"];
                NSArray *wins = @[[UIImage imageNamed:@"win1.png"],[UIImage imageNamed:@"win2.png"],[UIImage imageNamed:@"win3.png"]];
                //NSArray *wins = [NSArray alloc]ini
                
                NSArray *imageNames = @[@"banana1.tiff", @"banana2.tiff", @"banana3.tiff", @"banana4.tiff",
                                        @"banana5.tiff", @"banana6.tiff", @"banana7.tiff", @"banana8.tiff"];
                
                NSMutableArray *images = [[NSMutableArray alloc] init];
                for (int i = 0; i < imageNames.count; i++) {
                    [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
                }
                
            
                self.imgview.frame = CGRectMake(10, 50, 100, 200);
                self.imgview.animationImages = images;
                self.imgview.animationDuration = 0.8;
                [self.imgview startAnimating];
                
                UIImageView *winImageView = [[UIImageView alloc] initWithFrame:CGRectMake(110, 80, 200, 100)];
                winImageView.animationImages = wins;
                winImageView.animationDuration = 0.8;
                [self.view addSubview:winImageView];
                [winImageView startAnimating];

               
                NSString *music = [[NSBundle mainBundle] pathForResource:@"winsound1" ofType:@"mp3"];
                NSURL *bgmu = [NSURL fileURLWithPath:music];
                soundPlay = [[AVAudioPlayer alloc]initWithContentsOfURL:bgmu error:nil];
                [soundPlay setNumberOfLoops:-1];
                [soundPlay play];
                self.stopGame=YES;
                
				return;
            }
		}
	}
	if(!self.check){
        
		self.countWrong++;
		if(self.countWrong==7){
			//[self showAlertView:@"You Lose!"];
            //[self.imgview setImage:[UIImage imageNamed:@"Boom.png"]];
            
            NSArray *lose = @[[UIImage imageNamed:@"Boom.png"],[UIImage imageNamed:@"Boom3.png"]];
            self.imgview.animationImages = lose;
            self.imgview.animationDuration = 0.8;
            [self.imgview startAnimating];
            
            NSURL *SoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"boom" ofType:@"wav"]];
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)SoundURL, &PlaySoundID);
             AudioServicesPlaySystemSound(PlaySoundID);
            for(int i=0;i<self.wordLength;i++) {
                UILabel *label =(UILabel*)self.la[i];
                //NSLog(@"%c",[self.correctedWord characterAtIndex:i]);
                if([label.text isEqualToString:@"_"]){
                    [label setTextColor:[UIColor redColor]];
                    label.text=[NSString stringWithFormat:@"%c",[self.correctedWord characterAtIndex:i]];
                }
            }
             self.stopGame=YES;
            
			return;
		}
		[self drawImage:self.countWrong];
	}
   
    [sender setEnabled:NO];
    }
}

-(void)showAlertView:(NSString*) msg{
	UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:  @"" message:msg delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
	[alertView show];
}



@end
