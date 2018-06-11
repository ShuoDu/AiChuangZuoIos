//
//  MainMessageController.m
//  gzSpace
//
//  Created by 智享单车 on 2018/3/5.
//  Copyright © 2018年 智享单车. All rights reserved.
//

#import "MainMessageController.h"
#import "NBLScrollTabController.h"
#import "SpaceOneController.h"
#import "StoreController.h"
#import "SwitchView.h"
#import "RHFiltrateView.h"
@interface MainMessageController ()<NBLScrollTabControllerDelegate,RHFiltrateViewDelegate>
@property (nonatomic, strong) NBLScrollTabController *scrollTabController;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, strong) NSMutableArray *datasArray;
@property (nonatomic, strong)SwitchView *switchView;
@property (nonatomic,strong) RHFiltrateView *filtrate;
@end

@implementation MainMessageController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"爆文";
    NSArray *dataArray = @[@"1万+",@"10万+",@"100万+",@"1000万+"];
    self.datasArray = [NSMutableArray arrayWithArray:dataArray];
    [self.view addSubview:self.scrollTabController.view];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"筛选" style:UIBarButtonItemStyleDone target:self action:@selector(test)];
    rightItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
}

- (void)test {
    if (self.filtrate != nil) {
        [self.filtrate removeFromSuperview];
    } else {
        self.view.backgroundColor = NewViewBack;
        self.filtrate = [[RHFiltrateView alloc] initWithTitles:@[@"平台", @"类型", @"领域", @"阅读量", @"评论量"] items:@[@[@"全部", @"今日头条",@"百家号",@"企鹅号",@"网易号",@"趣头条",@"凤凰号",@"大风号"], @[@"全部", @"视频",@"文章"],  @[@"全部",@"娱乐",@"历史",@"三农",@"社会",@"军事",@"影视",@"其他"],@[@"全部",@"0-10000",@"10000-100000",@"10w-100w",@"100w-1000w",@"1000w+"], @[@"全部", @"0-1000",@"1000-10000",@"1w-10w",@"10w-100w",@"100w+"]]];
        self.filtrate.frame = CGRectMake(0, 2, self.view.frame.size.width, self.view.frame.size.height);
        self.filtrate.delegate = self;
        [self.view addSubview: self.filtrate];
    }
}

- (void)shaixuan {
        self.switchView = [SwitchView ins:nil];
        self.switchView.frame = CGRectMake(0, 0, WIDTH,HEIGHT);
        //添加阴影
        self.switchView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.switchView.layer.shadowOffset = CGSizeMake(0, 5);
        self.switchView.layer.shadowOpacity = 0.3;
        [self.view addSubview:self.switchView];
}

- (NBLScrollTabController *)scrollTabController {
    if (!_scrollTabController) {
        _scrollTabController = [[NBLScrollTabController alloc] init];
        _scrollTabController.view.frame =  CGRectMake(0, 0, WIDTH, HEIGHT);
        //        _scrollTabController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _scrollTabController.delegate = self;
        _scrollTabController.viewControllers = self.viewControllers;
    }
    return _scrollTabController;
}

- (NSArray *)viewControllers {
    if (!_viewControllers) {
        NSMutableArray *data = [[NSMutableArray alloc]init];
        for (int i=0; i<self.datasArray.count; i++) {
            StoreController *demo0 = [[StoreController alloc] init];
            demo0.view.backgroundColor = [UIColor clearColor];
            NBLScrollTabItem *demo0Item = [[NBLScrollTabItem alloc] init];
            demo0Item.title = self.datasArray[i];
            
            demo0Item.textColor = [UIColor darkGrayColor];
            demo0Item.highlightColor = [UIColor blackColor];
            demo0Item.hideBadge = YES;//每个title可以做个性化配置
            demo0.tabItem = demo0Item;
            [data addObject:demo0];
        }
        _viewControllers = data;
    }
    return _viewControllers;
}


- (void)tabController:(NBLScrollTabController * __nonnull)tabController didSelectViewController:( UIViewController * __nonnull)viewController {
    //业务逻辑处理
}


@end
