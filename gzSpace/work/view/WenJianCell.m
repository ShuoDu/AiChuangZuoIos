//
//  WenJianCell.m
//  gzSpace
//
//  Created by 智享单车 on 2018/5/17.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "WenJianCell.h"
@interface WenJianCell()
@property (strong, nonatomic) IBOutlet UIView *backView;

@end
@implementation WenJianCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.backView.layer.shadowOffset = CGSizeMake(1,1);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
    self.backView.layer.shadowOpacity = 0.3;//阴影透明度，默认0
    self.backView.layer.shadowRadius = 3;//阴影半径，默认3
    self.backView.layer.cornerRadius = 8;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
