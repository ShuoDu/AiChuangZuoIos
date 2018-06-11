//
//  SpaceController.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/12.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "SpaceController.h"
#import "NBLScrollTabController.h"
#import "SpaceOneController.h"
#import "EditController.h"
#import "WenJianCell.h"
#import "HuaTiCell.h"
#import "HuaTiDetailController.h"
static NSString *oneCellID = @"HuaTiCell";
@interface SpaceController ()<UITableViewDataSource,UITableViewDelegate> {
    UITableView *myTableView;
}
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation SpaceController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"热门话题";
    [self addConfigView];
    UIView *navBottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 2)];
    navBottomView.backgroundColor = [UIColor whiteColor];
    navBottomView.layer.shadowColor = [UIColor blackColor].CGColor;
    navBottomView.layer.shadowOffset = CGSizeMake(0, 3);
    navBottomView.layer.shadowOpacity = 0.3;
    [self.view addSubview:navBottomView];
}

- (void)addConfigView {
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-50)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
//    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //1 去除掉自动布局添加的边距
    myTableView.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    //2 去掉iOS7的separatorInset边距
    myTableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    myTableView.backgroundColor = NewViewBack;
    [myTableView registerNib:[UINib nibWithNibName:@"HuaTiCell" bundle:nil] forCellReuseIdentifier:oneCellID];
    [self.view addSubview:myTableView];
    self.view.backgroundColor = NewViewBack;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self editView];
}

- (void)editView {
    HuaTiDetailController *spaceDetail  = [[HuaTiDetailController alloc]init];
    spaceDetail.hidesBottomBarWhenPushed = YES;
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.4];
    [animation setType: kCATransitionFade];
    [animation setSubtype: kCATransitionFromTop];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [self.navigationController pushViewController:spaceDetail animated:NO];
    [self.navigationController.view.layer addAnimation:animation forKey:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HuaTiCell *cellOne = [tableView dequeueReusableCellWithIdentifier:oneCellID];
    cellOne.selectionStyle = UITableViewCellSelectionStyleNone;
    cellOne.backgroundColor = [UIColor whiteColor];
    NSString *s = [NSString stringWithFormat:@"%ld",indexPath.row+1];
    NSString * b = [@"Top"stringByAppendingString:s];
    cellOne.title.text = b;
    if (indexPath.row == 0) {
        cellOne.title.font = [UIFont systemFontOfSize:24];
        cellOne.title.textColor =  [UIColor redColor];
    } else if (indexPath.row == 1) {
        cellOne.title.font = [UIFont systemFontOfSize:20];
        cellOne.title.textColor =  [UIColor redColor];
    } else if (indexPath.row == 2) {
        cellOne.title.font = [UIFont systemFontOfSize:16];
        cellOne.title.textColor =  [UIColor redColor];
    } else {
        cellOne.title.font = [UIFont systemFontOfSize:13];
        cellOne.title.textColor =  [UIColor darkGrayColor];
    }
    return cellOne;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0,WIDTH, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 5)];
    return view;
}

@end
