//
//  CaoGaoController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/5/17.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "CaoGaoController.h"
#import "EditController.h"
#import "MainOneCell.h"
static NSString *oneCellID = @"MainOneCell";
@interface CaoGaoController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *myTableView;
}
@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation CaoGaoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"草稿箱";
    [self addConfigView];
    UIView *navBottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 2)];
    navBottomView.backgroundColor = [UIColor whiteColor];
    navBottomView.layer.shadowColor = [UIColor blackColor].CGColor;
    navBottomView.layer.shadowOffset = CGSizeMake(0, 3);
    navBottomView.layer.shadowOpacity = 0.3;
    [self.view addSubview:navBottomView];
}

- (void)addConfigView {
    //    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"格子铺" style:UIBarButtonItemStylePlain target:nil action:nil];
    //    self.navigationItem.leftBarButtonItem = left;
    //
    //    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"shopping_car"] style:(UIBarButtonItemStylePlain) target:nil action:nil];
    //    self.navigationItem.rightBarButtonItem = right;
    
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
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
    return 95;
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
    MainOneCell *cellOne = [tableView dequeueReusableCellWithIdentifier:oneCellID];
    cellOne.wenjian.hidden = NO;
    [cellOne.wenjian addTarget:self action:@selector(shijian) forControlEvents:UIControlEventTouchUpInside];
    //    SpaceModel *model = self.dataArray[indexPath.row];
    //    [cellOne loadData:model];
    cellOne.backgroundColor = NewViewBack;
    cellOne.photo.image = [UIImage imageNamed:@"caogao"];
    cellOne.selectionStyle = UITableViewCellSelectionStyleNone;
    return cellOne;
}

- (void)shijian {
    [SVProgressHUD showSuccessWithStatus:@"正在生成文件"];
//    //创建文件管理器
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    //获取document路径,括号中属性为当前应用程序独享
//    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
//    NSString *documentDirectory = [directoryPaths objectAtIndex:0];
//    //定义记录文件全名以及路径的字符串filePath
//    NSString *filePath = [documentDirectory stringByAppendingPathComponent:@"韩国大胃王.txt"];
//    //查找文件，如果不存在，就创建一个文件
//    if (![fileManager fileExistsAtPath:filePath]) {
//        [fileManager createFileAtPath:filePath contents:nil attributes:nil];
//    }
//    
//    [SVProgressHUD showSuccessWithStatus:filePath];
    
   // 如果想检视文件有没有生成，可以在视图上添加一个Label，加一行代码显示地址。
    
//    Label.text = documentDirectory;
//
//    //或者
//
//    Label.text = filePath;
    
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
