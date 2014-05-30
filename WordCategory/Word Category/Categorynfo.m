//
//  Category.m
//  SqliteWordList
//
//  Created by CKCC on 5/19/14.
//  Copyright (c) 2014 TPC. All rights reserved.
//

#import "CategoryInfo.h"

@implementation CategoryInfo


- (id)initWithUniqueId:(int)uniqueId categoryword:(NSString *)word {
    if ((self = [super init])) {
        self.uniqueId = uniqueId;
        self.categoryword = word;
    }
    return self;
}

@end
