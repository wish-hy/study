//
//  HYWaterfallFlowModel.h
//  study
//
//  Created by hy on 2018/4/21.
//  Copyright © 2018年 hy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYWaterfallFlowModel : NSObject<NSCoding>

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *imgURL;
@property(nonatomic,assign)CGFloat imgWidth;
@property(nonatomic,assign)CGFloat imgHeight;

@end
