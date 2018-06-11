//
//  GzTabBarViewController.m
//  GzCustomTabbar
//
//  Created by Dushuo on 2017/11/26.
//  Copyright © 2016年. All rights reserved.

#define BACKGROUND_IMAGE (__bridge id)[UIImage imageNamed:@"application_bg"].CGImage
#import "GzTabBarViewController.h"
#import "MainController.h"
#import "MeController.h"
#import "SpaceController.h"
#import "StoreController.h"
#import "MainMessageController.h"
#import "SpaceOneController.h"
@interface GzTabBarViewController ()
@end

@implementation GzTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    MainController *mainVc = [[MainController alloc] init];
    UINavigationController * mainNav = [[UINavigationController alloc]initWithRootViewController:mainVc];
    MainMessageController *baoWen = [[MainMessageController alloc] init];
    UINavigationController * baoWenNc = [[UINavigationController alloc]initWithRootViewController:baoWen];
    SpaceOneController *tool = [[SpaceOneController alloc]init];
    UINavigationController * toolNav = [[UINavigationController alloc]initWithRootViewController:tool];
    SpaceController *huati = [[SpaceController alloc] init];
    UINavigationController * huatiNc = [[UINavigationController alloc]initWithRootViewController:huati];
    
    MeController *viewController4 = [[MeController alloc] init];
    UINavigationController * meNav = [[UINavigationController alloc]initWithRootViewController:viewController4];
    
    self.viewControllers = @[mainNav,baoWenNc,toolNav,huatiNc,meNav];
    
    [self setupTabBar];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    //添加阴影
    self.tabBar.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -5);
    self.tabBar.layer.shadowOpacity = 0.3;
}

- (void)setupTabBar {
    
    [UITabBar appearance].translucent = NO;
    
    [self.viewControllers enumerateObjectsUsingBlock:^(UIViewController *obj, NSUInteger idx, BOOL *stop) {
        
        switch (idx) {
            case 0:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"main_noselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"main"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"素材";
            } break;
            case 1:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"space"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"space_select"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"爆文";
                
            } break;
            case 2:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"main_noselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"main"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"工作台";
                
            } break;
            case 3:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"main_noselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"main"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"话题库";
                
            } break;
            case 4:{
                obj.tabBarItem.image = [[UIImage imageNamed:@"me_noselect"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.selectedImage = [[UIImage imageNamed:@"me"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                obj.tabBarItem.title=@"个人中心";
           
            } break;
           
            default:
                break;
        }
    }];
    
    //修改文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[[UIColor blackColor] colorWithAlphaComponent:0.5], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = [UIColor darkGrayColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: titleHighlightedColor, NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
//    self.customSelectViews  = [[NSMutableArray alloc] init];
//    for(UIView *UITabBarButton in self.tabBar.subviews) {
//        if ([@"UITabBarButton" isEqualToString:NSStringFromClass([UITabBarButton class])]) {
//            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(UITabBarButton.frame.origin.x+UITabBarButton.frame.size.width/2-5, UITabBarButton.frame.origin.y+UITabBarButton.frame.size.height-5, 10, 5)];
//            imageView.image = [UIImage imageNamed:@"main_point"];
//            [self.tabBar addSubview:imageView];
//            [self.customSelectViews addObject:imageView];
//        }
//    }
//
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-37.5 , -15, 75, 75)];
//    button.layer.cornerRadius = 37.5;
//    button.layer.masksToBounds = YES;
//    [button setBackgroundColor:[UIColor whiteColor]];
//    button.imageView.contentMode = UIViewContentModeScaleAspectFit;
//    [button setImage:[UIImage imageNamed:@"camera"] forState:UIControlStateNormal];
//    [self.tabBar addSubview:button];
//    [self.tabBar bringSubviewToFront:button];
//    [button addTarget:self action:@selector(addTool) forControlEvents:UIControlEventTouchUpInside];
}

- (void)addTool {

   self.selectedIndex = 1;
}

@end
