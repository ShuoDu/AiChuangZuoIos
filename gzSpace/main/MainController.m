//
//  MainController.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/11.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "MainController.h"
#import "MainHeadView.h"
#import "UIColor+YYAdd.h"
#import "SpaceController.h"
#import "MainMessageModel.h"
#import "ChannelTags.h"
#import "Channel.h"
#import "MainTabCell.h"
#import "MainOneCell.h"
#import "WYWebController.h"
#import "SwitchView.h"
#import "RHFiltrateView.h"
static NSString *oneCell = @"MainOneCell";
@interface MainController ()<UITableViewDelegate,UITableViewDataSource,RHFiltrateViewDelegate,UITabBarDelegate> {
    UITableView *myTableView;
    __block NSMutableArray *_myTags;
    __block NSMutableArray *_recommandTags;
}
@property (nonatomic, strong)MainHeadView *headView;
@property (nonatomic, strong)SwitchView *switchView;
@property (nonatomic, strong)NSMutableArray *btnArray;
@property (nonatomic, strong)NSMutableArray *dataArray;
@property (nonatomic,strong)RHFiltrateView * filtrate ;
@property (nonatomic,strong) UIBarButtonItem *rightItem;
@property(nonatomic,getter=isNetworkActivityIndicatorVisible) BOOL networkActivityIndicatorVisible;
@end

@implementation MainController

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"素材";
    self.tabBarItem.title = @"素材";
    self.rightItem = [[UIBarButtonItem alloc]initWithTitle:@"筛选" style:UIBarButtonItemStyleDone target:self action:@selector(shaixuan)];
    self.rightItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = self.rightItem;
    [self addTableView];
    [self loadData];
}

- (void)test {
    [self hideTabBar];
//    self.rightItem.title = @"筛选";
    if (self.filtrate != nil) {
        [self.filtrate removeFromSuperview];
        [self.headView removeFromSuperview];
        [self addHeader];
    } else {
        self.rightItem.title = @"完成";
        self.navigationItem.title = @"条件筛选";
        [self.headView removeFromSuperview];
        self.view.backgroundColor = [UIColor whiteColor];
        self.filtrate = [[RHFiltrateView alloc] initWithTitles:@[@"平台", @"类型", @"领域", @"阅读量", @"评论量"] items:@[@[@"全部", @"今日头条",@"百家号",@"企鹅号",@"网易号",@"趣头条",@"凤凰号",@"大风号",@"一点号",@"凤凰号",@"秒拍号"], @[@"全部", @"视频",@"文章"],  @[@"全部",@"娱乐",@"历史",@"三农",@"社会",@"军事",@"影视",@"其他"],@[@"全部",@"0-10000",@"10000-100000",@"10w-100w",@"100w-1000w",@"1000w+"], @[@"全部", @"0-1000",@"1000-10000",@"1w-10w",@"10w-100w",@"100w+"]]];
        self.filtrate.frame = CGRectMake(0, 1, WIDTH, self.view.frame.size.height);
        self.filtrate.delegate = self;
        self.filtrate.layer.borderWidth = 0.5;
        self.filtrate.layer.borderColor = [UIColor lightGrayColor].CGColor;
        [self.view addSubview: self.filtrate];
    }
}


- (void)hideTabBar {
    if (self.tabBarController.tabBar.hidden == YES) {
        return;
    }
    UIView *contentView;
    if ( [[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    else
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x,  contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height + self.tabBarController.tabBar.frame.size.height);
    self.tabBarController.tabBar.hidden = YES;
}


- (void)showTabBar {
    if (self.tabBarController.tabBar.hidden == NO)
    {
        return;
    }
    UIView *contentView;
    if ([[self.tabBarController.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]])
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:1];
    
    else
        
        contentView = [self.tabBarController.view.subviews objectAtIndex:0];
    contentView.frame = CGRectMake(contentView.bounds.origin.x, contentView.bounds.origin.y,  contentView.bounds.size.width, contentView.bounds.size.height);
    self.tabBarController.tabBar.hidden = NO;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    [self.filtrate removeFromSuperview];
}

- (void)filtrateView:(RHFiltrateView *)filtrateView didSelectAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
  
}

- (void)shaixuan {

    if (self.switchView != nil) {
         [self.switchView removeFromSuperview];
         [self.headView removeFromSuperview];
         [self addHeader];
    } else {
        [self.headView removeFromSuperview];
        self.switchView = [SwitchView ins:nil];
        self.switchView.frame = CGRectMake(0, 0, WIDTH,HEIGHT);
        //添加阴影
        self.switchView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.switchView.layer.shadowOffset = CGSizeMake(0, 5);
        self.switchView.layer.shadowOpacity = 0.3;
        [self.view addSubview:self.switchView];

    }
}

- (void)addTableView {
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-121) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.backgroundColor = NewViewBack;
    [myTableView registerNib:[UINib nibWithNibName:@"MainOneCell" bundle:nil] forCellReuseIdentifier:oneCell];
    myTableView.separatorColor = [UIColor colorWithHexString:@"DCDCDC"];
    myTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:myTableView];
    [self addHeader];
}

- (void)addHeader {
    self.rightItem.title = @"筛选";
    self.switchView = nil;
    self.headView = [MainHeadView ins:nil];
    self.headView.frame = CGRectMake(0, 0, WIDTH,60);
    //添加阴影
    self.headView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.headView.layer.shadowOffset = CGSizeMake(0, 5);
    self.headView.layer.shadowOpacity = 0.3;
    [self.view addSubview:self.headView];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 1)];
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
    NSLog(@"%@",model.title);
    MainOneCell *cellOne = [tableView dequeueReusableCellWithIdentifier:@"MainOneCell"];
    cellOne.backgroundColor = [UIColor clearColor];
    [cellOne loadData:model];
    cellOne.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    cellOne.selectionStyle = UITableViewCellSelectionStyleNone;
    return cellOne;
}

// 1.确保cell 可以被编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
     MainOneCell *cellOne = [tableView dequeueReusableCellWithIdentifier:@"MainOneCell"];
    if (indexPath.row%2 ==0) {
        [cellOne.photo setImage:[UIImage imageNamed:@"shipin"]];
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    MainMessageModel *model = self.dataArray[indexPath.row];
    WYWebController *webVC = [WYWebController new];
    webVC.url = model.message_url;
    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 使用 Block 回调,实现点击后的方法
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"加入工作台" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"%@", indexPath);
        [SVProgressHUD showSuccessWithStatus:@"添加成功，请在工作台使用!"];
    }];
    action.backgroundColor = YzColor;
    
//    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"减少" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
//        NSLog(@"%@", indexPath);
//    }];
    // 苹果的习惯,右侧的多个按钮,显示位置是反着的
    return @[action];
}



@end
