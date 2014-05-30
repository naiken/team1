//
//  CategoryDatabase.m
//  SqliteWordList
//
//  Created by Teo Paocheak on 5/19/14.
//  Copyright (c) 2014 TPC. All rights reserved.
//

#import "CategoryDatabase.h"
#import "CategoryInfo.h"
#import "WordCategory1ViewController.h"

@implementation CategoryDatabase

static CategoryDatabase *_database;

+ (CategoryDatabase*)database {
    if (_database == nil) {
        _database = [[CategoryDatabase alloc] init];
    }
    return _database;
}

- (id)init {
    if ((self = [super init])) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ListsDB" ofType:@"sqlite"];
        //NSLog(@"file = %@",path);
        if (sqlite3_open([path UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}


- (NSArray *)categoryInfos{
    
    NSMutableArray *retureValue = [[NSMutableArray alloc] init];
    NSString *query = [NSString stringWithFormat:@"SELECT wordID,word FROM tbWords WHERE category = '%@'",topp];
    
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int uniqueId = sqlite3_column_int(statement, 0);
            char *nameChars = (char *) sqlite3_column_text(statement, 1);
            NSString *name = [[NSString alloc] initWithUTF8String:nameChars];
            CategoryInfo *info = [[CategoryInfo alloc] initWithUniqueId:uniqueId categoryword:name];
            [retureValue addObject:info.categoryword];
        }
        sqlite3_finalize(statement);
    }
    return retureValue ;
}



- (MeaningInformation *) meaningDetails:(NSString *)vocab withCategory:(NSString *)cate {
    MeaningInformation *retval = nil;
    NSString *query = [NSString stringWithFormat:@"SELECT khmer,japan,english FROM tbWords WHERE word = '%@' and category='%@'", vocab,cate];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //int uniqueId = sqlite3_column_int(statement, 0);
            char *khmerChars = (char *) sqlite3_column_text(statement, 0);
            char *japanChars = (char *) sqlite3_column_text(statement, 1);
            char *englishChars = (char *) sqlite3_column_text(statement, 2);
            if (khmerChars == NULL) {
                khmerChars ="";
            }
            if (japanChars == NULL) {
                japanChars ="";
            }
            if (englishChars == NULL) {
                englishChars ="";
            }
            NSString *k = [[NSString alloc] initWithUTF8String:khmerChars];
            NSString *j = [[NSString alloc] initWithUTF8String:japanChars];
            NSString *e = [[NSString alloc] initWithUTF8String:englishChars];
            
            retval = [[MeaningInformation alloc]initWithKhmer:k Japan:j English:e];
            
        }
        sqlite3_finalize(statement);
    }
    return retval;
}


@end
