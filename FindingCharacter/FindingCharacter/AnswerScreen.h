//
//  AnswerScreen.h
//  FindingCharacter
//
//  Created by prom phanit on 4/30/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import <UIKit/UIKit.h>


NSInteger heightScore;
//NSInteger heightScore2;
//NSInteger heightScore3;

@interface AnswerScreen : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *tapImage;
@property (weak, nonatomic) IBOutlet UIImageView *answerImage;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end
