//
//  HYImageDetialController.m
//  study
//
//  Created by hy on 2018/4/26.
//  Copyright © 2018年 hy. All rights reserved.
//

#import "HYImageDetialController.h"
#import "HYRecommendViewCell.h"
#import "ElPhotoBrowserView.h"

@interface HYImageDetialController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic ,strong)UIImageView *detailsImageV;

@property (nonatomic ,strong)UICollectionView *collectionView;

@property (nonatomic ,strong)NSMutableArray *dataArray;

@property (nonatomic ,strong)UITableView *tableView;

@property (nonatomic ,strong)UIView *headerView;

@property (strong , nonatomic)NSArray *countDownItem;

@end

@implementation HYImageDetialController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _model.title;
    
    [self creatUI];
}

-(void)creatUI
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    self.detailsImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.model.imgHeight / self.model.imgWidth * ScreenWidth)];
    self.detailsImageV.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(preview)];
    [self.detailsImageV addGestureRecognizer:tap];
    [self.detailsImageV sd_setImageWithURL:[NSURL URLWithString:self.model.imgURL] placeholderImage:[UIImage imageNamed:@""]];
    

    _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.detailsImageV.frame.size.height + 140)];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 5;
    layout.itemSize = CGSizeMake(80, 80);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal; //滚动方向
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView.frame = CGRectMake(10, self.detailsImageV.frame.size.height, ScreenWidth, 90);
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [_collectionView registerClass:[HYRecommendViewCell class] forCellWithReuseIdentifier:@"HYRecommendViewCell"];
    
    [_headerView addSubview:_collectionView];
    
    _countDownItem = @[@"",@"",@"",@"",@"",@"",@"",@"",@""];
    
    
    UILabel *label = [[UILabel  alloc] initWithFrame:CGRectMake(10, self.detailsImageV.frame.size.height + 100, ScreenWidth, 40)];
    label.text = @"哈哈哈哈。。。。。。";
    label.textColor = [UIColor grayColor];
    [self.headerView addSubview:label];
    [self.headerView addSubview:self.detailsImageV];
    _tableView.tableHeaderView = _headerView;
    
    
}

-(void)preview
{
    ElPhotoBrowserView * photoView = [[ElPhotoBrowserView alloc]init];
    photoView.indexPath = 0;
    photoView.originalUrls = @[self.model.imgURL];
//    photoView.smallUrls = self.smallUrls;
    [photoView show];
}

-(NSArray *)countDownItem
{
    if (!_countDownItem) {
        _countDownItem = [NSArray array];
    }
    return _countDownItem;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"identify";
    UITableViewCell*cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    cell.textLabel.text = @"123";
    return cell;
}


#pragma mark -- uicollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _countDownItem.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HYRecommendViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HYRecommendViewCell" forIndexPath:indexPath];
    //    cell.recommendItem = _countDownItem[indexPath.row];
    
    cell.backgroundColor = RandomColor;
    return cell;
}


#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //    NSString *str = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    //    if (_isPointBuy) {  // 普通积分购买
    //        self.didSelect(str,YES);
    //    }else{
    //        self.didSelect(str,NO);
    //    }
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 1;
}

@end
