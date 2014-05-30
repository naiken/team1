//
//  MeaningViewController.m
//  Word Category
//
//  Created by prom phanit on 5/24/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "MeaningViewController.h"
#import "MeaningInformation.h"
#import "CategoryDatabase.h"

@interface MeaningViewController ()

@end

@implementation MeaningViewController{

    NSArray *categoryInfos;
    
}

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
    self.title = self.caption;
    //topp = self.caption;
    categoryInfos = [[CategoryDatabase database] categoryInfos];
    categoryInfos = [categoryInfos sortedArrayUsingSelector:@selector(compare:)];
    

        NSMutableString *html = [NSMutableString stringWithString: @"<html><head><title></title></head><body>"];

    [html appendString:@"<br/><br/><br/><br/>"];

    for (NSString *obj in categoryInfos) {
        [html appendString:[NSString stringWithFormat:@"<font size='4' face='ArialMT' style='margin:0 0 0 15px;'><span>%@</span></font><br/> <hr color='#e2e3e4' />",obj]];
    }
    
        [html appendString:@"</body></html>"];
        
        //instantiate the web view
        UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.frame];
        
        //make the background transparent
        [webView setBackgroundColor:[UIColor clearColor]];
        
        //pass the string to the webview
        [webView loadHTMLString:[html description] baseURL:nil];
        
        //add it to the subview
        [self.view addSubview:webView];
        
    
}


@end
