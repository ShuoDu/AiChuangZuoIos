//
//  MainOneCell.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/12.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "MainOneCell.h"
#import "MainMessageModel.h"
@interface MainOneCell()
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UILabel *type;
@property (strong, nonatomic) IBOutlet UILabel *yuedu;
@property (strong, nonatomic) IBOutlet UILabel *pinglun;
@end
@implementation MainOneCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.backView.layer.shadowOffset = CGSizeMake(1,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.backView.layer.shadowOpacity = 0.3;//阴影透明度，默认0
    self.backView.layer.shadowRadius = 3;//阴影半径，默认3
    self.backView.layer.cornerRadius = 8;
}

- (void)loadData:(MainMessageModel *)data{
    self.title.text = data.title;
    self.time.text = data.time;
    self.yuedu.text =[NSString stringWithFormat:@"阅读%d",data.yuedu_count];
    self.pinglun.text = [NSString stringWithFormat:@"评论%d",data.pinglun_count];
    if (data.message_type == 2) {
        self.photo.image = [UIImage imageNamed:@"shipin"];
    }
}

@end
