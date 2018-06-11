//
//  EditController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/5/16.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "EditController.h"

@interface EditController ()

@end

@implementation EditController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"文章详情";
    self.view.backgroundColor = NewViewBack;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(over)];
    rightItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightItem;
 
}

- (void)over {
    [SVProgressHUD showSuccessWithStatus:@"已存储,请在草稿箱查看"];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
