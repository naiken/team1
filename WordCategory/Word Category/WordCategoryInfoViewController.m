//
//  WordCategoryInfoViewController.m
//  Word Category
//
//  Created by prom phanit on 5/24/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "WordCategoryInfoViewController.h"

@interface WordCategoryInfoViewController ()

@end

@implementation WordCategoryInfoViewController

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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"wordcategory" ofType:@"png"];

    NSMutableString *html = [NSMutableString stringWithString: @"<html><head><title></title></head><body>"];
    
    //continue building the string
    
    [html appendString:@"<br/><br/><br/><br/>"];
    [html appendString:[NSString stringWithFormat:@"<img style='border-radius:15px;margin-left:100px;' src=\'file://%@\' width=\'100\' height=\'100\' />",path]];
    [html appendString:@"<br/><br/><center><font color='#9d9b9c' >Word Category Application<br/>Version : 1.0</font></center>"];
    [html appendString:@"<br/><p style='margin:0 15px 0 15px;' align='justify'>All the words in this application have been carefully written by English specialists. It consists of many words from many categories of technical words. Moreover, It contains more than three thousand words in all category.</p> <br/><p style='margin:0 15px 0 15px;' align='justify'>When user go to the List of words of the selected category, user can make a long tap on a word and then a pop up bar appears, consisting of options, so the user can choose [Define] bar and the definition of that word will appear. If the user wants more translation, they can tap on [Manage] button which is at the bottom left of the screen.</p>"];
    

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
   
}



@end
