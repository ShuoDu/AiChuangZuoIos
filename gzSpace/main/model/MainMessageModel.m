//
//  MainMessageModel.m
//  gzSpace
//
//  Created by 智享单车 on 2018/2/27.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "MainMessageModel.h"

@implementation MainMessageModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"_id" : @"id",
             @"desc" : @"description"
             };
}
@end
