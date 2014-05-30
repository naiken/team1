//
//  GameScreen2.m
//  FindingCharacter
//
//  Created by prom phanit on 4/30/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "GameScreen2.h"
#import "AnswerScreen.h"
#import "LevelSelected.h"
#import "GameScreen1.h"

@interface GameScreen2 (){

    NSString *name;
    CGFloat sp;
}


@end

@implementation GameScreen2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)stopTimer{
    if ([timer isValid]) {
        [timer invalidate];
    }
    timer = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.clickImage=@"";
    tapImage = @"";
    timer = [NSTimer scheduledTimerWithTimeInterval:1
                                             target:self
                                           selector:@selector(countTime)
                                           userInfo:nil
                                            repeats:YES
             ];
    timerMili = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(countMilisecond) userInfo:nil repeats:YES];
    
    
    count = 10;
    
    self.countLabel.text = [NSString stringWithFormat:@"%d", count];
    //self.screenOneImage = imageName;
    
    switch (levelNumber) {
        case 1:
            self.w=90;
            self.h=90;
            self.row=3;
            self.col=3;
            self.space=10;
            name = @"girl";
            sp = 2.5;
            //NSLog(@"%@",imageName);
            break;
        case 2:
            self.w=90;
            self.h=90;
            self.row=4;
            self.col=3;
            self.space=10;
             name = @"boy";
            sp = 2.0;
            break;
        case 3:
            self.w=75;
            self.h=75;
            self.row=5;
            self.col=3;
            self.space=10;
            name = @"cat";
            sp = 2.0;
            break;
        case 4:
            self.w=65;
            self.h=65;
            self.row=4;
            self.col=4;
            self.space=5;
            name = @"dog";
            sp = 1.5;
            break;
        case 5:
            self.w=65;
            self.h=65;
            self.row=4;
            self.col=4;
            self.space=5;
            name = @"hat";
            sp = 1.0;
            break;
        case 6:
            self.w=65;
            self.h=65;
            self.row=5;
            self.col=4;
            self.space=2;
            name = @"hana";
            sp = 1.0;
            break;
    }
    
    self.screenWidth = [[UIScreen mainScreen] bounds].size.width;
    self.screenHeight = [[UIScreen mainScreen] bounds].size.height;
    [self createImage:self.row :self.col withName:name withSpeed:sp];
    NSLog(@"%f * %f",self.screenWidth,self.screenHeight);
    
}

-(void) countMilisecond{
    mili++;

}

-(void) countTime{
    count--;
    
    self.countLabel.text = [NSString stringWithFormat:@"%d", count];
    if(count == 0){
        [self stopTimer];
        self.clickImage = @"";
        tapImage = @"";
       AnswerScreen *answerScreen = [self.storyboard instantiateViewControllerWithIdentifier:@"answer"];
       [self presentViewController:answerScreen animated:NO completion:nil];
    }
    
}

-(void)createImage:(int)row :(int)col withName:(NSString *) namePic withSpeed:(CGFloat) speed{
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:30];
    self.x=(self.screenWidth-(col*self.w+(col-1)*self.space))/2;
    self.y=(self.screenHeight-(row*self.h+(row-1)*self.space))/2;
    for(int i=0;i<row*col;i++){
        [images addObject:[NSString stringWithFormat:@"%@-%d.png",namePic,i+1]];
    }
    
    images=[self shuffleArray:images];
    
    //	NSMutableArray *shuffle = [NSMutableArray arrayWithArray:[images shuffledArray]];
    int index;
	int myX;
	int myY;
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    CGAffineTransform transform1 = CGAffineTransformMakeRotation(M_PI_2);
    CGAffineTransform transform2 = CGAffineTransformMakeRotation(M_PI);
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    perspective = CATransform3DRotate(perspective, M_PI_4, 0, 1, 0);
    
    for(int i=0;i<row;i++) {
        for(int j=0;j<col;j++) {
			index=i*col+j;
			myX=self.x+self.w*j+self.space*(j+1);
			myY=self.y+self.h*i+self.space*(i+1);
			
            CALayer* layer = [CALayer layer];
            [layer setName:[NSString stringWithFormat:@"%@",images[index]]];
            layer.contents = (id)[UIImage imageNamed:images[index]].CGImage;
            layer.bounds=CGRectMake(myX,myY, self.w, self.h);
            layer.position =CGPointMake(myX,myY);
            //layer.frame = CGRectMake(myX, myY, self.w, self.h);
            [self.myView.layer addSublayer:layer];
            
            // int rand=arc4random() % 6 +1;
            int rand = arc4random_uniform(10) + 1;
            
            //NSLog(@"%i",rand);
            switch (rand) {
                case 1:
                    [layer addAnimation:[self animation1:speed] forKey:nil];
                    break;
                case 2:
                    [layer addAnimation:[self animation1:speed] forKey:nil];
                    [layer addAnimation:[self animation2:speed] forKey:nil];
                    break;
                case 3:
                    [layer addAnimation:[self animation2:speed] forKey:nil];
                    [layer addAnimation:[self animation3:speed] forKey:nil];
                    break;
                case 4:
                    [layer addAnimation:[self animation1:speed] forKey:nil];
                    [layer addAnimation:[self animation3:speed] forKey:nil];
                    break;
                case 5:
                    [layer addAnimation:[self animation1:speed] forKey:nil];
                    [layer addAnimation:[self animation2:speed] forKey:nil];
                    [layer addAnimation:[self animation3:speed] forKey:nil];
                    break;
                case 6:
                    layer.affineTransform = transform;
                    [layer addAnimation:[self animation1:speed] forKey:nil];
                    break;
                case 7:
                    layer.affineTransform = CGAffineTransformMakeShear(0.5,0.5);
                    [layer addAnimation:[self animation2:speed] forKey:nil];
                    break;
                case 8:
                    layer.transform = perspective;
                    [layer addAnimation:[self animation1:speed] forKey:nil];
                    [layer addAnimation:[self animation3:speed] forKey:nil];
                    break;
                case 9:
                    layer.affineTransform = transform1;
                    [layer addAnimation:[self animation2:speed] forKey:nil];
                    [layer addAnimation:[self animation3:speed] forKey:nil];
                    break;
                case 10:
                    layer.affineTransform = transform2;
                    [layer addAnimation:[self animation1:speed] forKey:nil];
                    [layer addAnimation:[self animation2:speed] forKey:nil];
                    break;
                default:
                    break;
            }
            
            
        }
    }
}


CGAffineTransform CGAffineTransformMakeShear(CGFloat x, CGFloat y) {
    CGAffineTransform transform = CGAffineTransformIdentity; transform.c = -x;
    transform.b = y;
    return transform;
}


-(CABasicAnimation *) animation1:(CGFloat) speed{
	CABasicAnimation *a1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
	a1.fromValue = [NSNumber numberWithFloat:0.0];
	a1.toValue = [NSNumber numberWithFloat:M_PI * 2];
	a1.autoreverses = YES;
	a1.repeatCount = NSUIntegerMax;
	a1.duration = speed;
    return a1;
}


-(CABasicAnimation *) animation2:(CGFloat) speed{
	CABasicAnimation *a2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
	a2.fromValue = [NSNumber numberWithFloat:0.0];
	a2.toValue = [NSNumber numberWithFloat:M_PI * 2];
	a2.autoreverses = YES;
	a2.repeatCount = NSUIntegerMax;
	a2.duration = speed;
    return a2;
}

-(CABasicAnimation *) animation3:(CGFloat ) speed{
	CABasicAnimation *a3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	a3.fromValue = [NSNumber numberWithFloat:0.0];
	a3.toValue = [NSNumber numberWithFloat:M_PI * 2];
	a3.autoreverses = YES;
	a3.repeatCount = NSUIntegerMax;
	a3.duration = speed;
    return a3;
}


- (CALayer *)layerForTouch:(UITouch *)touch {
    UIView *view = self.view;
    
    CGPoint location = [touch locationInView:view];
    location = [view convertPoint:location toView:nil];
    
    CALayer *hitPresentationLayer = [view.layer.presentationLayer hitTest:location];
    if (hitPresentationLayer) {
        return hitPresentationLayer.modelLayer;
    }
    
    return nil;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CALayer *clickLayer = [self layerForTouch:touch];
    //self.clickLabel.text=[NSString stringWithFormat:@"%@", clickLayer.name];
	//self.clickLabel.text=clickLayer.name;
	self.clickImage=clickLayer.name;
    if (self.clickImage !=nil) {
        tapImage = clickLayer.name;
        [self stopTimer];
        if ([self checkResult]) {
            answer = @"You are correct";
            
            score = 1000 - mili;
        }else{
            answer = @"You are wrong";
            score = 0;
        }
        
        AnswerScreen *answerScreen = [self.storyboard instantiateViewControllerWithIdentifier:@"answer"];
        [self presentViewController:answerScreen animated:NO completion:nil];
    }

    
}

- (BOOL)checkResult{
	if([self.clickImage isEqualToString:imageName]){
		return YES;
	}
	else{
		return NO;
	}
   // self.checkResultLabel.text=[NSString stringWithFormat:@"%d",self.check];
	//return self.check;
}

- (NSMutableArray*) shuffleArray:(NSMutableArray*) array {
    NSMutableArray* temp = [NSMutableArray arrayWithArray:array];
    int c = [temp count] * 5;
    
    for (int i = 0; i < c; i++) {
        int index1 = i % [temp count];
        int index2 = arc4random() % [temp count];
        if (index1 != index2) {
            [temp exchangeObjectAtIndex:index1 withObjectAtIndex:index2];
        }
    }
    return temp;
}


@end
