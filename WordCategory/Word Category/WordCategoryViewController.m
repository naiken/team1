//
//  WordCategoryViewController.m
//  Word Category
//
//  Created by prom phanit on 5/24/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "WordCategoryViewController.h"
#import "WordCategory1ViewController.h"

@interface WordCategoryViewController () <UITableViewDataSource,UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation WordCategoryViewController{
    NSDictionary *names;
    NSArray *keys;
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
    
    if (self.help) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"wordcategory" ofType:@"plist"];
        names = [NSDictionary dictionaryWithContentsOfFile:path];
    }else{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"wordcate" ofType:@"plist"];
        names = [NSDictionary dictionaryWithContentsOfFile:path];
    }
    keys = [[names allKeys]sortedArrayUsingSelector:@selector(compare:)];
    
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
        return [keys count];
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
        
        cell.textLabel.text = [keys objectAtIndex:indexPath.row];
    }
    
    return cell;
}


- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", searchText];
    searchResult = [keys filteredArrayUsingPredicate:predicate];
    
}


-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showcategory"]) {
        NSIndexPath *indexPath = nil;
        NSString *t = nil;

        if (self.searchDisplayController.active) {

            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            t = [searchResult objectAtIndex:indexPath.row];

        } else {

            indexPath = [self.tableView indexPathForSelectedRow];
            t = [keys objectAtIndex:indexPath.row];
    
        }
        WordCategory1ViewController *dest = segue.destinationViewController;
        dest.cap = t;
        dest.help = self.help;

    }
}



@end
