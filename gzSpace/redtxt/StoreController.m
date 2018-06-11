//
//  StoreController.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/12.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "StoreController.h"
#import "MainHeadView.h"
#import "UIColor+YYAdd.h"
#import "SpaceController.h"
#import "MainMessageModel.h"
#import "ChannelTags.h"
#import "Channel.h"
#import "MainTabCell.h"
#import "HuaTiDetailController.h"
#import "NBLScrollTabController.h"
#import "MainMessageModel.h"
#import "WYWebController.h"
static NSString *mainTable = @"MainTabCell";
@interface StoreController ()<UITableViewDelegate,UITableViewDataSource,NBLScrollTabControllerDelegate> {
    UITableView *myTableView;
    __block NSMutableArray *_myTags;
    __block NSMutableArray *_recommandTags;
}
@property (nonatomic, strong)MainHeadView *headView;
@property (nonatomic, strong)NSMutableArray *btnArray;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property(nonatomic,getter=isNetworkActivityIndicatorVisible) BOOL networkActivityIndicatorVisible;
@property (nonatomic, strong) NBLScrollTabController *scrollTabController;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, strong) NSMutableArray *datasArray;
@end


@implementation StoreController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"爆文";
    self.tabBarItem.title = @"爆文";
    [self addTableView];
    [self loadData];
}

- (void) addTableView {
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-154) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    //    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.backgroundColor = NewViewBack;
    [myTableView registerNib:[UINib nibWithNibName:@"MainTabCell" bundle:nil] forCellReuseIdentifier:mainTable];
    //1 去除掉自动布局添加的边距
    myTableView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    //2 去掉iOS7的separatorInset边距
    myTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    myTableView.separatorColor = [UIColor colorWithHexString:@"DCDCDC"];
    [self.view addSubview:myTableView];
}

- (NBLScrollTabController *)scrollTabController {
    if (!_scrollTabController) {
        _scrollTabController = [[NBLScrollTabController alloc] init];
        _scrollTabController.view.frame =  CGRectMake(0, 0, WIDTH, HEIGHT);
        //        _scrollTabController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _scrollTabController.delegate = self;
        _scrollTabController.viewControllers = self.viewControllers;
    }
    return _scrollTabController;
}

- (void)loadData {
    NSString *urls = [NSString stringWithFormat:@"%@%@",Host,@"sucai/all/"];
    [CYXHttpRequest get:urls params:nil success:^(id responseObj) {
        NSMutableArray *dataArray = [NSJSONSerialization JSONObjectWithData:responseObj options:NSJSONReadingMutableLeaves error:nil];
        [self.dataArray removeAllObjects];
        self.dataArray=[NSMutableArray array];
        for (NSDictionary *dict in dataArray) {
            MainMessageModel *messageModel = [MainMessageModel yy_modelWithDictionary:dict];
            [self.dataArray addObject:messageModel];
        }
        [myTableView reloadData];
    } failure:^(NSError *error) {
    }];
}

#pragma mark - UITableViewDelaget
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 5)];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,WIDTH, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainMessageModel *model = self.dataArray[indexPath.row];
    MainTabCell *cellOne = [tableView dequeueReusableCellWithIdentifier:@"MainTabCell"];
    [cellOne loadData:model];
    cellOne.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    cellOne.selectionStyle = UITableViewCellSelectionStyleNone;
    return cellOne;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MainMessageModel *model = self.dataArray[indexPath.row];
    WYWebController *webVC = [WYWebController new];
    webVC.url = model.message_url;
    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
}


@end
