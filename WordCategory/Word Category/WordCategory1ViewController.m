//
//  WordCategory1ViewController.m
//  Word Category
//
//  Created by prom phanit on 5/24/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "WordCategory1ViewController.h"
#import "PracticeViewController.h"
#import "MeaningViewController.h"

//#import "WordViewController.h"

@interface WordCategory1ViewController () <UITableViewDataSource,UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation WordCategory1ViewController{
    NSDictionary *names;
    NSArray *catInfos;
    NSArray *searchResult;
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
    self.title = self.cap;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"wordcategory" ofType:@"plist"];
    names = [NSDictionary dictionaryWithContentsOfFile:path];
    catInfos = names[self.cap];
    catInfos = [catInfos sortedArrayUsingSelector:@selector(compare:)];
 
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResult count];
    }else{
        return [catInfos count];
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set up the cell...
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [searchResult objectAtIndex:indexPath.row];
    }else{
        
        cell.textLabel.text = [catInfos objectAtIndex:indexPath.row];
    }
    
    return cell;
}


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", searchText];
    searchResult = [catInfos filteredArrayUsingPredicate:predicate];
    
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *t = nil;
    
    if (self.searchDisplayController.active) {
        t = [searchResult objectAtIndex:indexPath.row];
    }else{
        t = [catInfos objectAtIndex:indexPath.row];
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    if (self.help) {
        
        MeaningViewController *mean = [storyboard instantiateViewControllerWithIdentifier:@"meaning"];
        mean.caption = t;
        topp = t;
        [self.navigationController pushViewController:mean animated:YES];
        
    }else{
        PracticeViewController *pra = [storyboard instantiateViewControllerWithIdentifier:@"PracticeView"];
        pra.item = t;
        [self.navigationController pushViewController:pra animated:YES];
    }
    
    
}


@end
