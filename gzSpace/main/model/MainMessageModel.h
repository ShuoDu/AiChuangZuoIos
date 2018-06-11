//
//  MainMessageModel.h
//  gzSpace
//
//  Created by 智享单车 on 2018/2/27.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainMessageModel : NSObject<YYModel>
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *message_content;
@property(nonatomic,assign)int pinglun_count;
@property(nonatomic,assign)int yuedu_count;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,assign)int message_type;
@property(nonatomic,strong)NSString *message_url;
@end
