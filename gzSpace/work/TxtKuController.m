//
//  TxtKuController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/5/17.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "TxtKuController.h"
#import "EditController.h"
#import "WenJianCell.h"
static NSString *oneCellID = @"WenJianCell";
@interface TxtKuController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *myTableView;
}
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation TxtKuController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"文件库";
    [self addConfigView];
    UIView *navBottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 2)];
    navBottomView.backgroundColor = [UIColor whiteColor];
    navBottomView.layer.shadowColor = [UIColor blackColor].CGColor;
    navBottomView.layer.shadowOffset = CGSizeMake(0, 3);
    navBottomView.layer.shadowOpacity = 0.3;
    [self.view addSubview:navBottomView];
}

- (void)addConfigView {
    //    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shopping_car"] style:(UIBarButtonItemStylePlain) target:nil action:nil];
    //    self.navigationItem.rightBarButtonItem = right;
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.backgroundColor = NewViewBack;
    [myTableView registerNib:[UINib nibWithNibName:@"WenJianCell" bundle:nil] forCellReuseIdentifier:oneCellID];
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
    EditController *spaceDetail  = [[EditController alloc]init];
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
    WenJianCell *cellOne = [tableView dequeueReusableCellWithIdentifier:oneCellID];
    //    [cellOne loadData:model];
    cellOne.backgroundColor = NewViewBack;
    cellOne.selectionStyle = UITableViewCellSelectionStyleNone;
    return cellOne;
}

- (void)shijian {
    [SVProgressHUD showSuccessWithStatus:@"正在生成文件"];
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// 注意:这个方法可以不去写,如果写了必须 return 的是UITableViewCellEditingStyleDelete,否则不会出现侧滑效果
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 测试用
    return @"删除";
}

@end
