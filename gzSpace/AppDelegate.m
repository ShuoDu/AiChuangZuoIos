//
//  AppDelegate.m
//  gzSpace
//
//  Created by 智享单车 on 2017/12/11.
//  Copyright © 2017年 智享单车. All rights reserved.
//

#import "AppDelegate.h"
#import "GzTabBarViewController.h"

@interface AppDelegate ()<UITabBarControllerDelegate>
@property (nonatomic, strong)GzTabBarViewController *gzTabBarViewController;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.gzTabBarViewController = [[GzTabBarViewController alloc] init];
    self.gzTabBarViewController.delegate = self;
    self.window.rootViewController = self.gzTabBarViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {
  
}


@end
