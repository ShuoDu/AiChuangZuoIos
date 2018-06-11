//
//  MainTabCell.h
//  gzSpace
//
//  Created by 智享单车 on 2018/5/15.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainMessageModel;
@interface MainTabCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *photo;
-(void)loadData:(MainMessageModel *)data;
@end
