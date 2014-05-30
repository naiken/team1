//
//  MeaningInformation.h
//  Word Lists
//
//  Created by prom phanit on 5/20/14.
//  Copyright (c) 2014 promphanit. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeaningInformation : NSObject
@property (nonatomic,strong) NSString *khmer;
@property (nonatomic,strong) NSString *japan;
@property (nonatomic ,strong) NSString *english;
-(id) initWithKhmer:(NSString *)kh Japan:(NSString *)jp English:(NSString *)en;
@end
