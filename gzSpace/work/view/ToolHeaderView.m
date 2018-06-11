//
//  ToolHeaderView.m
//  gzSpace
//
//  Created by 智享单车 on 2018/5/16.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "ToolHeaderView.h"
#import "UIButton+JKImagePosition.h"
@interface ToolHeaderView()
@property (nonatomic, copy) void (^callback)(NSInteger);
@property (strong, nonatomic) IBOutlet UIButton *chuangzuo;
@property (strong, nonatomic) IBOutlet UIButton *tongji;
@property (strong, nonatomic) IBOutlet UIButton *jiance;
@property (strong, nonatomic) IBOutlet UIButton *xiazai;
@end

@implementation ToolHeaderView

+ (instancetype)ins:(void(^)(NSInteger))callback {
    ToolHeaderView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    view.callback = callback;
    view.backgroundColor = [UIColor whiteColor];
    
    return view;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.chuangzuo jk_setImagePosition:2 spacing:10];
    [self.tongji jk_setImagePosition:2 spacing:10];
    [self.jiance jk_setImagePosition:2 spacing:10];
    [self.xiazai jk_setImagePosition:2 spacing:10];
}

- (void)layoutSubviews {
    
}
- (IBAction)chuangzuoAction:(id)sender {
    UIButton *btn = (UIButton *)sender;
    if (self.callback) {
        self.callback(btn.tag);
    }
    NSLog(@"点我干嘛");
}




@end
