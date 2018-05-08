//
//  HYRecommendViewCell.m
//  study
//
//  Created by hy on 2018/4/24.
//  Copyright © 2018年 hy. All rights reserved.
//

#import "HYRecommendViewCell.h"

@implementation HYRecommendViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatSubView];
        
    }
    return self;
}

-(void)creatSubView
{
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.width)];
    imageV.image = [UIImage imageNamed:@"recommend"];
    [self addSubview:imageV];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    
}
@end
