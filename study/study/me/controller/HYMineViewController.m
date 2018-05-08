//
//  HYMineViewController.m
//  study
//
//  Created by hy on 2018/3/28.
//  Copyright © 2018年 hy. All rights reserved.
//

#import "HYMineViewController.h"
#import "HYCustomButton.h"

static NSInteger const cols = 3;
static CGFloat const minSpace = 5;
#define cellWH  (ScreenWidth - (cols-1)*minSpace)/cols

@interface HYMineViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic ,strong) UICollectionView *collectionView;


@property (nonatomic ,strong) UIImageView *backImage;
@property (nonatomic ,strong) UIView *shadowView;
@property (nonatomic ,strong) UIImageView *headerImage;
@property (nonatomic ,strong) UILabel *nickName;
@property (nonatomic ,strong) UILabel *descript;
@end

@implementation HYMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    [self setUpUI];
   
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = RandomColor;
    return cell;
}


-(void)setUpUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(cellWH, cellWH);
    flowLayout.headerReferenceSize = CGSizeMake(0, 345);
    flowLayout.minimumLineSpacing = minSpace;
    flowLayout.minimumInteritemSpacing = minSpace;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor clearColor];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    _backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paint"]];
    _backImage.frame = CGRectMake(0, 0, ScreenWidth, 180);

    _shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 180)];
    _shadowView.backgroundColor = [UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:0.8];

    _headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(30, 100, 100, 100)];
    _headerImage.layer.cornerRadius = 50;
    _headerImage.clipsToBounds = YES;
    _headerImage.layer.borderWidth = 2;
    _headerImage.layer.borderColor =[UIColor whiteColor].CGColor;
    _headerImage.image = [UIImage imageNamed:@"QQHead"];
    
    _nickName = [[UILabel alloc] initWithFrame:CGRectMake(30, 210, 200, 20)];
    _nickName.text = @"土豆泥err";
    _nickName.textColor = [UIColor blackColor];
    
    _descript = [[UILabel alloc] initWithFrame:CGRectMake(30, 230, ScreenWidth - 60, 50)];
    _descript.font = [UIFont systemFontOfSize:13];
    _descript.numberOfLines = 0;
    _descript.textColor = [UIColor darkGrayColor];
    _descript.text = @"哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈";
    
    HYCustomButton *collection = [[HYCustomButton alloc] initWithFrame:CGRectMake(20, 280, 60, 60)];
    [collection setTitle1:@"113" Title2:@"关注"];
    
    HYCustomButton *fans = [[HYCustomButton alloc] initWithFrame:CGRectMake(85, 280, 60, 60)];
    [fans setTitle1:@"113" Title2:@"粉丝"];
    
    HYCustomButton *zan = [[HYCustomButton alloc] initWithFrame:CGRectMake(145, 280, 60, 60)];
    [zan setTitle1:@"726" Title2:@"被赞"];
    
    [self.view addSubview:_backImage];
    [self.view addSubview:_shadowView];
    [self.view addSubview:_collectionView];
    [self.collectionView addSubview:_headerImage];
    [self.collectionView addSubview:_nickName];
    [self.collectionView addSubview:_descript];
    [self.collectionView addSubview:collection];
    [self.collectionView addSubview:fans];
    [self.collectionView addSubview:zan];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offY = scrollView.contentOffset.y;
    if (offY < 0) {
        self.backImage.frame = CGRectMake(offY / 4, 0, ScreenWidth - (offY / 2), 180 - offY);
        self.shadowView.frame = CGRectMake(offY / 4, 0, ScreenWidth - (offY / 2), 180 - offY);
        self.shadowView.alpha = 0.8 + (offY * 0.003);
    }else
    {
        self.backImage.frame = CGRectMake(0, -offY, ScreenWidth, 180 - (offY / 8));
        self.shadowView.frame = CGRectMake(0, -offY, ScreenWidth, 180 - (offY / 8));
    }
}

@end
