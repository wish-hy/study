//
//  HYEssenceViewController.m
//  study
//
//  Created by hy on 2018/3/28.
//  Copyright © 2018年 hy. All rights reserved.
//

#import "HYEssenceViewController.h"
#import "HYEssenceCell.h"

@interface HYEssenceViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong)UITableView *tableView;

@property (nonatomic ,strong)NSMutableArray *dataArr;

@end

@implementation HYEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"专题";
    self.view.backgroundColor = [UIColor redColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    _dataArr = [@[@"",@"",@"",@"",@"",@"",@"",@"",@"",@"",@""] mutableCopy];
}


#pragma mark --- tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HYEssenceCell *cell = [HYEssenceCell creatCellInTableView:tableView];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 138;
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
