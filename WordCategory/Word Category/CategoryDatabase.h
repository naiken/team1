//
//  CategoryDatabase.h
//  SqliteWordList
//
//  Created by Teo Paocheak on 5/19/14.
//  Copyright (c) 2014 TPC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "MeaningInformation.h"


@interface CategoryDatabase : NSObject {
    sqlite3 *_database;
}

+ (CategoryDatabase *)database;
- (NSArray *) categoryInfos;
- (MeaningInformation *) meaningDetails:(NSString *)vocab withCategory:(NSString *)cate;

@end
