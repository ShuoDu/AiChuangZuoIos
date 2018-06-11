//
//  HuaTiDetailController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/5/18.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "HuaTiDetailController.h"
#import "UIColor+YYAdd.h"
#import "SpaceController.h"
#import "MainMessageModel.h"
#import "ChannelTags.h"
#import "Channel.h"
#import "MainTabCell.h"
#import "MainOneCell.h"
#import "WYWebController.h"
static NSString *oneCell = @"MainOneCell";
@interface HuaTiDetailController ()<UITableViewDelegate,UITableViewDataSource> {
    UITableView *myTableView;
    __block NSMutableArray *_myTags;
    __block NSMutableArray *_recommandTags;
}
@property (nonatomic, strong)NSMutableArray *btnArray;
@property (nonatomic, strong)NSMutableArray *dataArray;
@end

@implementation HuaTiDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"话题库";
    [self addTableView];
    UIView *navBottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 2)];
    navBottomView.backgroundColor = [UIColor whiteColor];
    navBottomView.layer.shadowColor = [UIColor blackColor].CGColor;
    navBottomView.layer.shadowOffset = CGSizeMake(0, 3);
    navBottomView.layer.shadowOpacity = 0.3;
    [self.view addSubview:navBottomView];
}

- (void) addTableView {
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 7, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.backgroundColor = NewViewBack;
    [myTableView registerNib:[UINib nibWithNibName:@"MainOneCell" bundle:nil] forCellReuseIdentifier:oneCell];
    myTableView.separatorColor = [UIColor colorWithHexString:@"DCDCDC"];
    myTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:myTableView];
}

- (void)loadData:(NSString *)type {
    NSDictionary *parm = @{@"type":type};
    NSString *urls = [NSString stringWithFormat:@"%@%@",Host,@"main/type_mesage/"];
    [CYXHttpRequest get:urls params:parm success:^(id responseObj) {
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
    return 15;
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
    //    MainMessageModel *model = self.dataArray[indexPath.row];
    
    MainOneCell *cellOne = [tableView dequeueReusableCellWithIdentifier:@"MainOneCell"];
    cellOne.backgroundColor = [UIColor clearColor];
    //    [cellOne loadData:model];
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
    WYWebController *webVC = [WYWebController new];
    webVC.url = @"https://www.toutiao.com/a6556064475911291399/";
    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
}
//
//// 2.左滑后点击 delete 之后,会调用下面的方法
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"%@", indexPath);
//}

//// 注意:这个方法可以不去写,如果写了必须 return 的是UITableViewCellEditingStyleDelete,否则不会出现侧滑效果
//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewCellEditingStyleDelete;
//
//}
//
//- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
//    // 测试用
//    return @"haha";
//}

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
