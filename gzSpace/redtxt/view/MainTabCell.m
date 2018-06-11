//
//  MainTabCell.m
//  gzSpace
//
//  Created by 智享单车 on 2018/5/15.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "MainTabCell.h"
#import "UIButton+JKImagePosition.h"
#import "MainMessageModel.h"
@interface MainTabCell ()
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *lingyu;
@property (strong, nonatomic) IBOutlet UILabel *yuedu;
@property (strong, nonatomic) IBOutlet UILabel *pinglun;
@property (strong, nonatomic) IBOutlet UILabel *time;
@end

@implementation MainTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)loadData:(MainMessageModel *)data {
    self.title.text = data.title;
    self.time.text = data.time;
    self.yuedu.text =[NSString stringWithFormat:@"阅读%d",data.yuedu_count];
    self.pinglun.text = [NSString stringWithFormat:@"评论%d",data.pinglun_count];
}

@end
