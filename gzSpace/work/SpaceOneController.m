//
//  SpaceOneController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/1/24.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "SpaceOneController.h"
#import "MainOneCell.h"
#import "SpaceModel.h"
#import "ToolHeaderView.h"
#import "EditController.h"
#import "DownLoadController.h"
#import "CaoGaoController.h"
#import "TxtKuController.h"
#import "UIButton+JKImagePosition.h"
static NSString *oneCellID = @"MainOneCell";
@interface SpaceOneController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *myTableView;
}
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)UIButton *btn;
@end

@implementation SpaceOneController

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
//    [SVProgressHUD showErrorWithStatus:@"暂无素材，创作一个吧"];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"工作台";
//    [self addConfigView];
    ToolHeaderView *header = [ToolHeaderView ins:^(NSInteger tag) {
        if (tag == 444) {
            [self editView];
        } else if (tag == 445){
            CaoGaoController *caogao = [[CaoGaoController alloc]init];
            caogao.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:caogao animated:YES];
        } else if (tag == 446){
            TxtKuController *wenjian = [[TxtKuController alloc]init];
            wenjian.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:wenjian animated:YES];
        } else if (tag == 447){
            DownLoadController *store = [[DownLoadController alloc]init];
            store.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:store animated:YES];
        }
    }];
    header.frame = CGRectMake(0, 0, WIDTH, 150);
    header.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    header.layer.shadowOffset = CGSizeMake(0, 5);
    header.layer.shadowOpacity = 0.3;
    [self.view addSubview:header];
}

- (void)loadData:(NSString *)type {
    NSDictionary *parm = @{@"type":type};
    NSString *url = [NSString stringWithFormat:@"%@%@",Host,@"main/service_message/"];
    [CYXHttpRequest get:url params:parm success:^(id responseObj) {
        NSMutableArray *dataArray = [NSJSONSerialization JSONObjectWithData:responseObj options:NSJSONReadingMutableLeaves error:nil];
        [self.dataArray removeAllObjects];
        self.dataArray=[NSMutableArray array];
        for (NSDictionary *dict in dataArray) {
            SpaceModel *spaceModel = [SpaceModel yy_modelWithDictionary:dict];
            [self.dataArray addObject:spaceModel];
        }
        [myTableView reloadData];
        NSLog(@"服务信息%@",dataArray);
    } failure:^(NSError *error) {
        
    }];
}

- (void)addConfigView {
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 102, self.view.frame.size.width, self.view.frame.size.height)];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTableView.backgroundColor = NewViewBack;
    [myTableView registerNib:[UINib nibWithNibName:@"MainOneCell" bundle:nil] forCellReuseIdentifier:oneCellID];
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
//    CATransition *animation = [CATransition animation];
//    [animation setDuration:0.4];
//    [animation setType: kCATransitionFade];
//    [animation setSubtype: kCATransitionFromTop];
//    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    [self.navigationController pushViewController:spaceDetail animated:YES];
//    [self.navigationController.view.layer addAnimation:animation forKey:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainOneCell *cellOne = [tableView dequeueReusableCellWithIdentifier:oneCellID];
//    SpaceModel *model = self.dataArray[indexPath.row];
//    [cellOne loadData:model];
    cellOne.backgroundColor = NewViewBack;
    cellOne.selectionStyle = UITableViewCellSelectionStyleNone;
    return cellOne;
}


@end
