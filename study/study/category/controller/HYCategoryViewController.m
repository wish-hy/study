//
//  HYCategoryViewController.m
//  study
//
//  Created by hy on 2018/3/28.
//  Copyright © 2018年 hy. All rights reserved.
//

#import "HYCategoryViewController.h"
#import "HYActivteCell.h"

@interface HYCategoryViewController ()<UITabBarDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,strong)UITableView *tableView;

@property (nonatomic ,strong)NSMutableArray *dataArr;


@end

@implementation HYCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动";
    self.tableView.backgroundColor = [UIColor whiteColor];
    _dataArr = [@[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""] mutableCopy];
    
    [self loadHeader];
    
    
}

-(void)loadHeader
{
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, ScreenWidth, 260);
    headerView.backgroundColor = [UIColor yellowColor];
    [self.tableView addSubview:headerView];
    self.tableView.tableHeaderView = headerView;
    
    
    UIView *scroll = [[UIView alloc] init];
    scroll.backgroundColor = [UIColor greenColor];
    [headerView addSubview:scroll];
    
    
    UIView *activite1 = [[UIView alloc] init];
    activite1.backgroundColor = [UIColor blueColor];
    [headerView addSubview:activite1];
    
    
    UIView *activite2 = [[UIView alloc] init];
    activite2.backgroundColor = [UIColor orangeColor];
    [headerView addSubview:activite2];
    
    [scroll mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo((ScreenWidth - 30)/3*2);
        make.height.mas_equalTo((ScreenWidth - 30)/3*2);
        make.top.mas_equalTo(headerView).mas_offset(10);
        make.left.mas_equalTo(headerView).mas_offset(10);
    }];
    
    [activite1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo((ScreenWidth - 30)/3);
        make.height.mas_equalTo((ScreenWidth - 30)/3);
        make.left.mas_equalTo(scroll.mas_right).offset(10);
        make.top.mas_equalTo(scroll.mas_top);
    }];
    
    [activite2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(activite1.mas_width);
        make.height.mas_equalTo(activite1.mas_height);
        make.bottom.mas_equalTo(scroll.mas_bottom);
        make.left.mas_equalTo(scroll.mas_right).offset(10);

    }];
}

#pragma mark --- tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HYActivteCell *cell = [HYActivteCell creatCellInTableView:tableView];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
