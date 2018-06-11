//
//  MeController.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/11.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "MeController.h"
#import "UIView+YYAdd.h"
#import "UIButton+JKImagePosition.h"
#import "LoginController.h"
@interface MeController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *myTableView;
}
@property(nonatomic,copy)NSArray *dataArray;
@property(nonatomic,strong)UIImageView *photo;
@property(nonatomic,strong)UILabel *phone;
@end

@implementation MeController
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:100/255.0 blue:59/255.0 alpha:1];
    self.view.backgroundColor = [UIColor darkGrayColor];
    self.tabBarItem.title = @"我的";
    [self addMeContent];
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,160, self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height) style:(UITableViewStyleGrouped)];
    myTableView.layer.masksToBounds = YES;
    myTableView.layer.cornerRadius = 18;
    myTableView.delegate = self;
    myTableView.dataSource = self;
    myTableView.scrollEnabled = NO;
    myTableView.backgroundColor = NewViewBack;
    [self.view addSubview:myTableView];
    [myTableView registerNib:[UINib nibWithNibName:@"MeOneCell" bundle:nil] forCellReuseIdentifier:@"meOneCell"];
    [myTableView registerNib:[UINib nibWithNibName:@"MeTwoCell" bundle:nil] forCellReuseIdentifier:@"meTwoCell"];
    self.dataArray = @[@[@"登录",@"我的收藏"],@[@"设置",@"关于我们"]];
}

- (void)addMeContent {
    self.photo = [[UIImageView alloc]initWithFrame:CGRectMake(10, 35, 70, 70)];
    self.photo.centerX = self.view.centerX;
    self.photo.image = [UIImage imageNamed:@"photo"];
    self.photo.layer.cornerRadius = self.photo.frame.size.width / 2;
    self.photo.layer.masksToBounds = YES;
    [self.view addSubview:self.photo];
    self.phone = [[UILabel alloc]initWithFrame:CGRectMake(10, 103, 200, 40)];
    self.phone.centerX = self.view.centerX;
    self.phone.text = @"18801114226";
    self.phone.textAlignment = NSTextAlignmentCenter;
    self.phone.textColor = [UIColor whiteColor];
    [self.view addSubview:self.phone];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 0 ||indexPath.section == 1) {
//        if (indexPath.row ==1) {
//            return 77;
//        }
//    }
    return 55;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 3) {
        return 250;
    }
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, myTableView.frame.size.width, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, myTableView.frame.size.width, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType  = UITableViewCellAccessoryDisclosureIndicator; //显示最右边的箭
    }
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row ==0) {
        LoginController *login = [[LoginController alloc]init];
        [self presentViewController:login animated:YES completion:nil];
    }
}



@end
