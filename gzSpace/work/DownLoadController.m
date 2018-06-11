//
//  DownLoadController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/5/16.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "DownLoadController.h"
#import "StoreCell.h"
static NSString * identifier = @"cxCellID";
static CGFloat kMagin = 10.f;
static NSString * headIdentifier = @"cxHeadID";
@interface DownLoadController ()<UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView * collectionView;
@end

@implementation DownLoadController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"工具下载";
    [self.view addSubview:self.collectionView];
    UIView *navBottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 2)];
    navBottomView.backgroundColor = [UIColor whiteColor];
    navBottomView.layer.shadowColor = [UIColor blackColor].CGColor;
    navBottomView.layer.shadowOffset = CGSizeMake(0, 3);
    navBottomView.layer.shadowOpacity = 0.3;
    [self.view addSubview:navBottomView];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //自动网格布局
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        //设置单元格大小
        flowLayout.itemSize = CGSizeMake((WIDTH-30)/2, 174);
        //最小行间距(默认为10)
        flowLayout.minimumLineSpacing = 10;
        //最小item间距（默认为10）
        flowLayout.minimumInteritemSpacing = 10;
        //设置senction的内边距
        flowLayout.sectionInset = UIEdgeInsetsMake(kMagin, kMagin, kMagin, kMagin);
        //网格布局
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) collectionViewLayout:flowLayout];
        [_collectionView registerNib:[UINib nibWithNibName:@"StoreCell" bundle:nil] forCellWithReuseIdentifier:@"storeCell"];
        //注册cell
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
        //设置数据源代理
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

//有多少的分组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//每个分组里有多少个item
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //根据identifier从缓冲池里去出cell
    StoreCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"storeCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
    
}


@end
