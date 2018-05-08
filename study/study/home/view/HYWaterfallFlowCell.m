//
//  HYWaterfallFlowCell.m
//  study
//
//  Created by hy on 2018/4/21.
//  Copyright © 2018年 hy. All rights reserved.
//

#import "HYWaterfallFlowCell.h"

@interface HYWaterfallFlowCell ()

@property (nonatomic ,strong)UIImageView *imgV;
@property (nonatomic ,strong)UIImageView *headerImage;

@property (nonatomic ,strong)UILabel *userName;
@property (nonatomic ,strong)UILabel *destript;

@end

@implementation HYWaterfallFlowCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatSubView];
        
    }
    return self;
}

- (void)creatSubView {
    
    _imgV = [[UIImageView alloc]init];
    _imgV.contentMode = UIViewContentModeScaleAspectFill;
    _imgV.clipsToBounds = YES;
    [self addSubview:_imgV];
   
    _headerImage = [[UIImageView alloc] init];
    _headerImage.contentMode = UIViewContentModeScaleToFill;
//    _headerImage.backgroundColor = [UIColor redColor];
    _headerImage.image = [UIImage imageNamed:@"activity_selected"];
    _headerImage.clipsToBounds = YES;
    _headerImage.layer.cornerRadius = 14;
    [self addSubview:_headerImage];
    
    
    _userName = [[UILabel alloc]init];
    _userName.font = [UIFont systemFontOfSize:15];
//    _userName.backgroundColor = [UIColor blueColor];
    _userName.text = @"wish";
    _userName.textColor = [UIColor blackColor];
    _userName.textAlignment = NSTextAlignmentLeft;
    [self addSubview: _userName];
    
    _destript = [[UILabel alloc] init];
    _destript.font = [UIFont systemFontOfSize:14];
//    _destript.backgroundColor = [UIColor blueColor];
    _destript.text = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    _destript.numberOfLines = 2;
    _destript.textColor = [UIColor colorWithHexString:@"888888"];
    _destript.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_destript];
    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left);
        make.bottom.mas_equalTo(self.mas_bottom).mas_offset(-80);
        make.right.mas_equalTo(self.mas_right);
    }];
    
    [_destript mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_imgV.mas_bottom).offset(8);
        make.left.mas_equalTo(self.mas_left).offset(5);
        make.right.mas_equalTo(self.mas_right).offset(-5);
        make.height.mas_equalTo(40);
    }];
    [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.destript.mas_bottom).offset(3);
        make.left.mas_equalTo(_destript.mas_left);
        make.width.mas_equalTo(28);
        make.height.mas_equalTo(28);
    }];
    
    [_userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.destript.mas_bottom).offset(3);
        make.left.mas_equalTo(self.headerImage.mas_right).offset(5);
        make.right.mas_equalTo(self.mas_right).offset(-5);
        make.height.mas_equalTo(30);
        
    }];
}

-(void)setModel:(HYWaterfallFlowModel *)model {
    _model = model;
    UIImageView *imgV = (UIImageView *)[self viewWithTag:10];
//    UIVisualEffectView *visulEffectView = (UIVisualEffectView *)[self viewWithTag:20];
//    UILabel *label = (UILabel *)[self viewWithTag:30];
    
    
//    visulEffectView.frame = CGRectMake(0, self.frame.size.height-16, self.frame.size.width, 16);
//    label.frame = CGRectMake(0, 3, CGRectGetWidth(visulEffectView.frame), 10);
    [_imgV sd_setImageWithURL:[NSURL URLWithString:model.imgURL] placeholderImage:[UIImage imageNamed:@"image"]];
//    [_imgV sd_setImageWithURL:[NSURL URLWithString:_model.imgURL]];
//    label.text = _model.title;
    
}


@end
