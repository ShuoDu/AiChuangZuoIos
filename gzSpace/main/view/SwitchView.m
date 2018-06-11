//
//  SwitchView.m
//  gzSpace
//
//  Created by 智享单车 on 2018/5/18.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "SwitchView.h"
#import "UIColor+YYAdd.h"
@interface SwitchView()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *myTable;
@property (weak, nonatomic) IBOutlet UIButton *one;
@property (weak, nonatomic) IBOutlet UIButton *two;
@property (weak, nonatomic) IBOutlet UIButton *three;
@property (weak, nonatomic) IBOutlet UIButton *four;
@property (weak, nonatomic) IBOutlet UIButton *five;
@property (nonatomic,copy)NSArray *btnArray;
@property (nonatomic,strong) UIButton *selectedBtn;
@property (nonatomic,copy) NSArray *titleArr;
@property (nonatomic,copy) NSArray *dataArray;
@property (nonatomic,copy) NSArray *contentArray;
@property (nonatomic,copy) NSArray *pingTaiArray;
@property (nonatomic,copy) NSArray *typeArray;
@property (nonatomic,copy) NSArray *lingYuArray;
@property (nonatomic,copy) NSArray *yueDuArray;
@property (nonatomic,copy) NSArray *pingLunArray;

@end
@implementation SwitchView
+ (instancetype)ins:(void(^)(NSInteger))callback {
    SwitchView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    return view;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.one.selected = YES;
    self.one.tintColor = [UIColor darkGrayColor];
}

- (IBAction)btnAction:(id)sender {
    
    self.myTable.hidden = NO;
    self.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
    UIButton *btn = (UIButton *)sender;
    if (btn!= self.selectedBtn) {
        self.selectedBtn.selected = NO;
        btn.selected = YES;
        self.selectedBtn = btn;
    
    }else{
        self.selectedBtn.selected = YES;
    }
    [btn setTintColor:[UIColor darkGrayColor]];
    if (btn!=self.one) {
        self.one.selected = NO;
    }
    self.dataArray =[NSArray arrayWithArray:self.contentArray[btn.tag-1000]];
    [self.myTable reloadData];
    self.myTable.frame =CGRectMake(0, 45.5, WIDTH, self.dataArray.count *40);

}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor =[[UIColor colorWithHexString:@"000000"]colorWithAlphaComponent:0.333];
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    //1 去除掉自动布局添加的边距
    self.myTable.layoutMargins = UIEdgeInsetsMake(0, 0, 0, 0);
    //2 去掉iOS7的separatorInset边距
    self.myTable.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.pingTaiArray = @[@"今日头条",@"百家号",@"企鹅号",@"网易号",@"趣头条",@"凤凰号",@"大风号"];
    self.lingYuArray = @[@"娱乐",@"历史",@"三农",@"社会",@"军事",@"影视",@"其他"];
    self.typeArray = @[@"视频",@"文章"];
    self.yueDuArray = @[@"0-10000",@"10000-100000",@"10w-100w",@"100w-1000w",@"1000w+"];
    self.pingLunArray = @[@"0-1000",@"1000-10000",@"1w-10w",@"10w-100w",@"100w+"];
    self.contentArray = @[self.pingTaiArray,self.lingYuArray,self.typeArray,self.yueDuArray,self.pingLunArray];
    self.dataArray = self.contentArray[0];
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(event)];
    [self addGestureRecognizer:tapGesture];
    //选择触发事件的方式（默认单机触发）
    [tapGesture setNumberOfTapsRequired:1];
}

- (void)event {
    self.frame = CGRectMake(0, 0, WIDTH, 45);
    self.myTable.hidden = YES;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.textLabel.text =[@"    " stringByAppendingString:self.dataArray[indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.myTable.hidden = YES;
    self.frame = CGRectMake(0, 0, WIDTH, 45);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
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



@end
