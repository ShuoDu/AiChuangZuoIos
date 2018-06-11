//
//  ChannelCell.m
//  ChannelTag
//
//  Created by Shin on 2017/11/26.
//  Copyright © 2017年 Shin. All rights reserved.
//

#import "ChannelCell.h"

@interface ChannelCell (){
    
}



@end

@implementation ChannelCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //title
        _title = [[UILabel alloc]init];
        [self.contentView addSubview:_title];
        _title.frame = CGRectMake(5, 5, frame.size.width-10, frame.size.height-10);
        _title.backgroundColor = [UIColor colorWithRed:255/255.0 green:100/255.0 blue:59/255.0 alpha:0.92] ;
        _title.layer.masksToBounds = YES;
        _title.layer.cornerRadius = 22;
//        _title.layer.borderWidth = 1;
//        _title.layer.borderColor = MainNavColor.CGColor;
        _title.font = [UIFont systemFontOfSize:15];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.numberOfLines = 0;
//        _title.textColor = [UIColor colorWithRed:0.36 green:0.36 blue:0.36 alpha:1.00];
         _title.textColor = [UIColor blackColor];
        _delBtn = [[UIButton alloc]init];
        [self.contentView addSubview:_delBtn];
        _delBtn.frame = CGRectMake(frame.size.width-18, 0, 18, 18);
        [_delBtn setImage:[UIImage imageNamed:@"del"] forState:UIControlStateNormal];
        [_delBtn addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

-(void)setModel:(Channel *)model{
    
    _model = model;
    
    if (model.tagType == MyChannel) {
        if ([model.title containsString:@"＋"]) {
            model.title = [model.title substringFromIndex:1];
        }
        if (model.editable) {
        }else{
            model.editable = YES;
        }
        if (model.resident) {
            _delBtn.hidden = YES;
        }else{
            _delBtn.hidden = NO;
        }
        
        //选择出来的tag高亮显示
        if (model.selected) {
            _title.textColor = [UIColor colorWithRed:0.36 green:0.36 blue:0.36 alpha:1.0];
        }else{
            _title.textColor = [UIColor colorWithRed:0.36 green:0.36 blue:0.36 alpha:1.0];
        }
        
    }else if (model.tagType == RecommandChannel){
        if (![model.title containsString:@"＋"]) {
            model.title = [@"＋" stringByAppendingString:model.title];
            _title.textColor = [UIColor blackColor];
        }
        if (model.editable) {
            model.editable = NO;
        }else{
        }
//        if (model.resident) {
//            _delBtn.hidden = YES;
//        }else{
//            _delBtn.hidden = NO;
//        }
        _delBtn.hidden = YES;
    }
    _title.text = model.title;
    
}



- (void)delete:(UIButton *)sender{
    
    [_delegate deleteCell:sender];
}



@end
