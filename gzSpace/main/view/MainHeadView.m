//
//  MainHeadView.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/11.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "MainHeadView.h"
#import "UIButton+JKImagePosition.h"
#import "SpaceController.h"
#import "CycleImageView.h"
#import "UIButton+JKImagePosition.h"
@interface MainHeadView()<CycleImageViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *backScrollView;
@property (nonatomic,copy)NSArray * logoArray;
@property (nonatomic,copy)NSArray * titleArray;
@property (nonatomic, copy) void (^callback)(NSInteger);
@end
@implementation MainHeadView

+ (instancetype)ins:(void(^)(NSInteger))callback {
    MainHeadView *view = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].firstObject;
    view.callback = callback;
    return view;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.backgroundColor = [UIColor whiteColor];
    [self.backScrollView setContentSize:CGSizeMake(WIDTH*2, 0)];
    self.backScrollView.showsVerticalScrollIndicator = FALSE;
    self.backScrollView.showsHorizontalScrollIndicator = FALSE;
    [self addBtn];
}

- (void)addBtn {
    self.logoArray = @[@"toutiao",@"baijiahao",@"qiehao",@"wangyihao",@"qutoutiao"];
    self.titleArray = @[@"头条号",@"百家号",@"企鹅号",@"网易号",@"趣头条号"];
    for (int i = 0; i<5; i++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake((i*80)+20, 5, 40, 45)];
        btn.backgroundColor = [UIColor redColor];
        UIImage *img = [UIImage imageNamed:self.logoArray[i]];
        [btn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [btn setImage:img forState:UIControlStateNormal];
        [btn setBackgroundImage:img forState:UIControlStateNormal];
//        btn.titleLabel.text = self.titleArray[i];
//        btn.titleLabel.textColor = [UIColor blackColor];
//        btn.titleLabel.font = [UIFont systemFontOfSize:9];
//        [btn jk_setImagePosition:2 spacing:15];
        [self.backScrollView addSubview:btn];
    }
}


#pragma mark - CycleImageViewDelegate
- (void)didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
}


@end
