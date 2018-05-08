//
//  HYWaterfallFlowModel.m
//  study
//
//  Created by hy on 2018/4/21.
//  Copyright © 2018年 hy. All rights reserved.
//

#import "HYWaterfallFlowModel.h"

@implementation HYWaterfallFlowModel

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.imgURL forKey:@"imgUrl"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeDouble:self.imgWidth forKey:@"imgWidth"];
    [aCoder encodeDouble:self.imgHeight forKey:@"imgHeight"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.imgURL = [aDecoder decodeObjectForKey:@"imgUrl"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.imgWidth = [aDecoder decodeDoubleForKey:@"imgWidth"];
        self.imgHeight = [aDecoder decodeDoubleForKey:@"imgHeight"];
    }
    return self;
}

@end
