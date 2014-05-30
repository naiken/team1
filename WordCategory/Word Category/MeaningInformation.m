//
//  MeaningInformation.m
//  Word Lists
//
//  Created by prom phanit on 5/20/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import "MeaningInformation.h"

@implementation MeaningInformation


-(id)initWithKhmer:(NSString *)kh Japan:(NSString *)jp English:(NSString *)en{
    if (self == [super init]) {
        self.khmer = kh;
        self.japan =jp;
        self.english = en;
    }

    return self;
}


@end
