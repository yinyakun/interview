//
//  LNBaseTabbarViewController.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/14.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "LNBaseTabbarViewController.h"
#import "YKTabbar.h"
#import "LNMeViewController.h"
#import "LNInformationViewController.h"
#import "LNPublishViewController.h"
#import "LocationViewController.h"
#import "LNHomeViewController.h"
#import "LNTabarItem.h"
#import "UIViewController+LNTabaritem.h"
@interface LNBaseTabbarViewController ()<UITabBarDelegate,UITabBarControllerDelegate>

@end

@implementation LNBaseTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    YKTabbar *tabbar = [[YKTabbar alloc] init];
    tabbar.backgroundColor = [UIColor clearColor];
    [self setValue:tabbar forKey:@"tabBar"];
        
    self.tabBarController.delegate = self;
    self.tabBar.backgroundImage = [self imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
    self.tabBar.shadowImage = [UIImage new];
    self.selectedIndex = 0;
    
    LNHomeViewController *homeVC = [[LNHomeViewController alloc] init];
    LocationViewController *locationVC = [[LocationViewController alloc] init];
    LNInformationViewController *infoVC = [[LNInformationViewController alloc] init];
    LNMeViewController *meVC = [[LNMeViewController alloc] init];

    tabbar.titles = @[@"首页",@"海淀",@"消息",@"我的"];
    [self setViewControllers:@[homeVC,locationVC,infoVC,meVC]];
    tabbar.selectBlock = ^(NSInteger index) {
        self.selectedIndex = index;
        tabbar.selectIndex = index;
        if (index == 0) {
            self.tabBar.backgroundImage = [self imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
            self.selectedViewController.view.frame = CGRectMake(0, 0, k_screen_width, k_screen_height);
        }else{
            self.tabBar.backgroundImage = [self imageWithColor:[[UIColor blackColor] colorWithAlphaComponent:1]];
            self.tabBarController.selectedViewController.view.frame = CGRectMake(0, 0, k_screen_width, k_screen_height - 49);
        }
    };
    tabbar.publishBlock = ^(NSInteger index) {
      
    };
    tabbar.selectIndex = 0;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    
    
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f,0.0f, 1.0f,1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
