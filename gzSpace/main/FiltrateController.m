//
//  FiltrateController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/5/25.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "FiltrateController.h"
#import "RHFiltrateView.h"

@interface FiltrateController ()<RHFiltrateViewDelegate>
@property (nonatomic,strong)RHFiltrateView * filtrate ;
@property (nonatomic,strong)UIButton *btn;
@end

@implementation FiltrateController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = NewViewBack;
  
    self.filtrate = [[RHFiltrateView alloc] initWithTitles:@[@"平台", @"类型", @"领域", @"阅读量", @"评论量"] items:@[@[@"全部", @"今日头条",@"百家号",@"企鹅号",@"网易号",@"趣头条",@"凤凰号",@"大风号"], @[@"全部", @"视频",@"文章"],  @[@"全部",@"娱乐",@"历史",@"三农",@"社会",@"军事",@"影视",@"其他"],@[@"全部",@"0-10000",@"10000-100000",@"10w-100w",@"100w-1000w",@"1000w+"], @[@"全部", @"0-1000",@"1000-10000",@"1w-10w",@"10w-100w",@"100w+"]]];
    self.filtrate.frame = CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height);
    self.filtrate.delegate = self;
    self.filtrate.layer.shadowColor = [UIColor blackColor].CGColor;
    self.filtrate.layer.shadowOffset = CGSizeMake(1,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.filtrate.layer.shadowOpacity = 0.3;//阴影透明度，默认0
    self.filtrate.layer.shadowRadius = 3;//阴影半径，默认3
    [self.view addSubview: self.filtrate];
    
    self.btn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-60, 30, 50, 40)];
    [self.btn setTitle:@"取消" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(cancle) forControlEvents:UIControlEventTouchUpInside];
    self.btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:self.btn];
}

- (void)cancle {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)filtrateView:(RHFiltrateView *)filtrateView didSelectAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
    [self.btn setTitle:@"完成" forState:UIControlStateNormal];
}

@end
