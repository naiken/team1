//
//  ViewController.m
//  Word Category
//
//  Created by prom phanit on 5/24/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "ViewController.h"
#import "WordCategoryViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.navigationController.navigationBarHidden = YES;
    //self.learn.backgroundColor = [UIColor colorWithRed:67/255.f green:168/255.f blue:238/255.f alpha:1.0];
     //self.practice.backgroundColor = [UIColor colorWithRed:67/255.f green:168/255.f blue:238/255.f alpha:1.0];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    BOOL help;
    if ([segue.identifier isEqualToString:@"learnWord"]) {
        help = YES;
        WordCategoryViewController *wordCat = segue.destinationViewController;
        wordCat.help = help;
    }else if ([segue.identifier isEqualToString:@"practiceWord"]){
        help = NO;
        WordCategoryViewController *wordCat = segue.destinationViewController;
        wordCat.help = help;
    }

    
}


@end
