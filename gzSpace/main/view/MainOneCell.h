//
//  MainOneCell.h
//  gzSpace
//
//  Created by 智享单车 on 2017/12/12.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainMessageModel;
@interface MainOneCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet UIButton *wenjian;
-(void)loadData:(MainMessageModel *)data;
@end
