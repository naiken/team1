//
//  PracticeInfoViewController.m
//  Word Category
//
//  Created by prom phanit on 5/24/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "PracticeInfoViewController.h"

@interface PracticeInfoViewController ()

@end

@implementation PracticeInfoViewController

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
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"pic1" ofType:@"png"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"pic2" ofType:@"png"];
    NSString *path3 = [[NSBundle mainBundle] pathForResource:@"arrow" ofType:@"png"];
    
    NSMutableString *html = [NSMutableString stringWithString: @"<html><head><title></title></head><body>"];
    
    //continue building the string
    
    [html appendString:@"<br/><br/>"];
//    [html appendString:[NSString stringWithFormat:@"<img style='border-radius:15px;margin-left:100px;' src=\'file://%@\' width=\'100\' height=\'100\' />",path]];
    [html appendString:@"<br/><br/><center><font size='4'>Information<br/>Practice Screen</font></center>"];
    
    [html appendString:@"<br/><p style='margin:0 15px 0 15px;color:#9d9b9c;' align='justify'>The application will random a word, and you have 6 chances to guess for the word. You will have to select a letter from buttons repersenting each letter of the alphabet. It is ok if the user can tap a correct letter of the word and the letter will be shown. However, if the word does not contain the selected letter, no word will appear in the placeholders. Meanwhile, one part of the bomb rope will burn in the gallows area, starting with a long rope until little rope if you guess the word wrong. Like the pictures below.</p>"];
    
    [html appendString:[NSString stringWithFormat:@"<img style='margin-left:10px;'src=\'file://%@\' width=\'160\' height=\'90\' />",path1]];
    
    [html appendString:[NSString stringWithFormat:@"<img style='margin-left:5px;'src=\'file://%@\' width=\'60\' height=\'60\' />",path3]];
    
     [html appendString:[NSString stringWithFormat:@"<img style='margin-left:8px;' src=\'file://%@\' width=\'50\' height=\'60\' />",path2]];
    
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
