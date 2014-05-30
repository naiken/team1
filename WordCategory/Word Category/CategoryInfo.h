//
//  Category.h
//  SqliteWordList
//
//  Created by CKCC on 5/19/14.
//  Copyright (c) 2014 TPC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryInfo : NSObject

@property (nonatomic, assign) int uniqueId;
@property (nonatomic, copy) NSString *categoryword;

- (id)initWithUniqueId:(int)uniqueId categoryword:(NSString *)word;

@end
