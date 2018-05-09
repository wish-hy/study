//
//  HYHomeViewController.m
//  study
//
//  Created by hy on 2018/3/28.
//  Copyright © 2018年 hy. All rights reserved.
//

#import "HYHomeViewController.h"
#import "HYScrollImageView.h"  // 轮播

#import "HYWaterfallFlowCell.h"  // 瀑布流cell

#import "HYImageDetialController.h"

#import "HYWaterfallFlowModel.h"
#import "HYLayout.h"

static NSString *const HYScrollImageViewID = @"HYScrollImageView";
static NSString *const HYRecommendViewCellID = @"HYRecommendViewCell";
static NSString *const HYWaterfallFlowCellID = @"HYWaterfallFlowCell";

@interface HYHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,HYWaterfallLayoutDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic ,strong) UICollectionView *collectionView;

@property (nonatomic ,strong) HYLayout *hylayout;

@end


@implementation HYHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.navigationItem.title = @"首页";
    self.collectionView.backgroundColor = [UIColor whiteColor];
//        self.title =@"我的关注";
        // 相当于下面两句
//        self.navigationItem.title = @"我的关注";
        // 无效果
//        self.tabBarItem.title = @"我的关注";
        //设置导航栏的颜色
    //    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    // 设置返回按钮字体的颜色
//        self.navigationController.navigationBar.tintColor = [UIColor yellowColor];
    
        // 设置导航栏左右两边的内容
        self.navigationItem.leftBarButtonItem = [HYItemTool itemWithImage:@"MainTagSubIcon" highImage:@"MainTagSubIconClick" target:self action:@selector(CYEssenceClick)];
//        self.navigationItem.rightBarButtonItem = [HYItemTool itemWithImage:@"nav_coin_icon" highImage:@"nav_coin_icon" target:self action:@selector(rightClick)];
    
        // 如并排创建两个按钮
//        UIBarButtonItem *moonButton = [CYItemTool itemWithImage:@"mine-moon-icon" highImage:@"mine-moon-icon-click" target:self action:@selector(moonClick)];
//        UIBarButtonItem *settingButton = [CYItemTool itemWithImage:@"mine-setting-icon" highImage:@"mine-setting-icon-click" target:self action:@selector(settingClick)];
//
//        self.navigationItem.rightBarButtonItems = @[settingButton,moonButton];
    
    
    
//    NSMutableDictionary *dic = @{
//                                 @"userId":@"3",
//                                 @"userName":@"biu~",
//                                 @"userSex":@"0",
//                                 @"userBirthday":@"1524311810000",
//                                 @"userNikename":@"hy",
//                                 @"userInfo":@"我的毕业设计"
//                                 };
//
//    NSString *str = [self UIUtilsFomateJsonWithDictionary:dic];
//
//    // 测试
//    NSMutableDictionary *param = [NSMutableDictionary dictionary];
//    param[@"phone"] = @"123";
//    param[@"pwd"] = @"333";
////    param[@"user"] = str;
//
//    [HYHttpTool POST:BaseUrl(login) parameters:param success:^(id responseObject) {
//        HYLog(@"请求成功%@",responseObject);
//    } failure:^(NSError *error) {
//        HYLog(@"请求失败 = %@",error);
//    }];
    

    
    
    //    获取路径
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"chatlog.plist"];
//    NSFileManager *fileM = [NSFileManager defaultManager];
//    HYLog(@"file path %@",filePath);
    //    判断文件是否存在，不存在则直接创建，存在则直接取出文件中的内容
//    if ([fileM fileExistsAtPath:filePath]) {
//        NSArray *chatLogArray = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
//        HYLog(@"array:%@",arrays);
//        NSMutableArray *chatLogArray = [NSMutableArray arrayWithContentsOfFile:filePath];
//        self.dataArray = [chatLogArray mutableCopy];
//        [self.collectionView reloadData];
//    }
    
    [self storeChatLogWithFile];
}

-(void)storeChatLogWithFile
{
    NSString *urlStr = [@"http://image.baidu.com/channel/listjson?pn=0&rn=50&tag1=美女&tag2=全部&ie=utf8" stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];

    [HYHttpTool POST:urlStr parameters:nil success:^(id responseObject) {
        NSMutableArray *array = [responseObject[@"data"] mutableCopy];
        [array removeLastObject];

//        //    获取路径
//        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"chatlog.plist"];
//        NSFileManager *fileM = [NSFileManager defaultManager];
//        //    判断文件是否存在，不存在则直接创建，存在则直接取出文件中的内容
//        if (![fileM fileExistsAtPath:filePath]) {
//            [fileM createFileAtPath:filePath contents:nil attributes:nil];
//        }
//        NSMutableArray *chatLogArray = [NSMutableArray arrayWithContentsOfFile:filePath];
//        if ((chatLogArray.count == 0)) {
//            chatLogArray = [NSMutableArray arrayWithCapacity:1];
//        }

        self.dataArray = [NSMutableArray array];
  
            // 并发队列的创建方法
            dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_CONCURRENT);
            // 异步执行任务创建方法
            dispatch_async(queue, ^{
                // 这里放异步执行任务代码
                
                for (NSDictionary *dic in array) {
                    //    要保存的自定义模型
                    HYWaterfallFlowModel *model = [[HYWaterfallFlowModel alloc]init];
                        int i = 0;
                model.imgURL = dic[@"image_url"];
//                CGSize sizes = [HYToolsKit getImageSizeWithURL:model.imgURL];
                
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.imgURL]];
                UIImage *image = [UIImage imageWithData:data];
                model.imgWidth = image.size.width;
                model.imgHeight = image.size.height;
                model.title = dic[@"abs"];
                    [self.dataArray addObject:model];
                    i++;
                    HYLog(@"%d,%@,%f,%f",i,model.imgURL,model.imgHeight,model.imgWidth);
                }
                
                [self.collectionView reloadData];
            });
            
            

//            [chatLogArray addObject:model];


//                [_collectionView reloadData];
        /*
         这是正常的保存和取出数组内容到文件
         存
         [chatLogArray writeToFile:filePath atomically:YES];
         取
         NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:filePath];
         */


        //    注意 数组中保存的是自定义模型，要想把数组保存在文件中，应该用下面的方法
        //    存
//        [NSKeyedArchiver archiveRootObject:chatLogArray toFile:filePath];
//        //    取
//        NSArray *arrays = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
//        HYLog(@"array:%@",arrays);
    } failure:^(NSError *error) {
        HYLog(@"请求错误--%@",error);
    }];
    
}



#pragma mark -- system collectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if (indexPath.section == 0) {
//        UICollectionViewCell *reusableview = nil;
//
////            HYScrollImageView *scrollImg = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HYScrollImageViewID forIndexPath:indexPath];
//            HYScrollImageView *scrollImg = [collectionView dequeueReusableCellWithReuseIdentifier:HYScrollImageViewID forIndexPath:indexPath];
//            scrollImg.imageGroupArray = @[
//                                          @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
//                                          @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
//                                          @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
//                                          ];
//            scrollImg.banner = ^(NSInteger i) {
//                HYLog(@"点击了%ld",(long)i);
//            };
//
//            reusableview = scrollImg;
//        [_collectionView reloadData];
//        return reusableview;
//    }else
////        if (indexPath.section == 1)
//    {
//        UICollectionViewCell *collectionCell = nil;
//        HYRecommendViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HYRecommendViewCellID forIndexPath:indexPath];
//        cell.backgroundColor = [UIColor redColor];
//        collectionCell = cell;
//        return collectionCell;
//    }
//        else{
        HYWaterfallFlowCell *cell = (HYWaterfallFlowCell *)[collectionView dequeueReusableCellWithReuseIdentifier:HYWaterfallFlowCellID forIndexPath:indexPath];
        cell.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
        cell.model = self.dataArray[indexPath.row];

        return cell;
//    }
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    HYWaterfallFlowModel *modes = self.dataArray[indexPath.row];
    HYLog(@"选中了第%ld个item",indexPath.row);
    HYImageDetialController *detial = [[HYImageDetialController alloc] init];
    detial.model = modes;
    [self.navigationController pushViewController:detial animated:YES];
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
//    if (kind == UICollectionElementKindSectionHeader) {
        HYScrollImageView *scrollImg = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HYScrollImageViewID forIndexPath:indexPath];

        scrollImg.imageGroupArray = @[
                                      @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
                                      @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
                                      @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
                                      ];
        scrollImg.banner = ^(NSInteger i) {
            HYLog(@"HYLog点击了%ld",(long)i);
            [ToastManage showCenterToastWith:[NSString stringWithFormat:@"点击了轮播图%ld",i] starY:500];
        };

        reusableview = scrollImg;
//    }

    return reusableview;
}


//// item宽高
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//
//    return CGSizeMake(ScreenWidth, 200);
//}


#pragma mark -- hylayout
// 计算item高度的代理方法，将item的高度与indexPath传递给外界
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(HYLayout *)collectionViewLayout heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPath
{
    HYWaterfallFlowModel *model = self.dataArray[indexPath.item];
//    return model.imgHeight / model.imgWidth * width;
    return (model.imgHeight + 400) / model.imgWidth * width;
}

// 区列数
-(NSInteger)collectionView:(UICollectionView *)collectionView layout:(HYLayout *)collectionViewLayout colCountForSectionAtIndex:(NSInteger)section
{
    return 2;
}

//区内边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(HYLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 5, 5, 5);
    
}

//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(HYLayout *)collectionViewLayout lineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}

//垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(HYLayout *)collectionViewLayout interitemSpacingForSectionAtIndex:(NSInteger)section
{
        return 5;
}

//
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(HYLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(CGRectGetWidth(collectionView.frame), 340);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(HYLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(CGRectGetWidth(collectionView.frame), 10);
}


#pragma mark -- lazy load
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        
        self.hylayout = [[HYLayout alloc] init];
        self.hylayout.delegate = self;
        
       self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:self.hylayout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
//        self.collectionView.showsVerticalScrollIndicator = NO;
        // 注册cell
       
        [self.collectionView registerClass:[HYScrollImageView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HYScrollImageViewID];
        
        [self.collectionView registerClass:[HYWaterfallFlowCell class] forCellWithReuseIdentifier:HYWaterfallFlowCellID];
        [self.view addSubview:_collectionView];

    }
    return _collectionView;
}

- (NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)CYEssenceClick
{
    HYLog(@"%s",__func__);
}

// 拼接json字符串
- (NSString *)UIUtilsFomateJsonWithDictionary:(NSDictionary *)dic {
    NSArray *keys = [dic allKeys];
    NSString *string = [NSString string];
    for (NSString *key in keys) {
        
        NSString *value = [dic objectForKey:key];
        
        value = [NSString stringWithFormat:@"\"%@\"",value];
        
        NSString *newkey = [NSString stringWithFormat:@"\"%@\"",key];
        
        if (!string.length) {
            string = [NSString stringWithFormat:@"%@:%@}",newkey,value];
        }else {
            string = [NSString stringWithFormat:@"%@:%@,%@",newkey,value,string];
        }
    }
    string = [NSString stringWithFormat:@"{%@",string];
    HYLog(@"===%@",string);
    return string;
}


@end
