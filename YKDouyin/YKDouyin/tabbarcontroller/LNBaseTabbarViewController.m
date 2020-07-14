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
    

//    YKTabbar *tabBar = [[YKTabbar alloc] initWithFrame:CGRectZero];
//    tabBar.backgroundColor = [UIColor redColor];
//    [self setValue:tabBar forKey:@"tabBar"];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor orangeColor];
    btn.frame = CGRectMake(0, 0, k_screen_width / 5.0, 49);
    btn.center = self.tabBar.center;
    [self.view addSubview:btn];
    
    
    
    self.tabBarController.delegate = self;
    
    self.tabBar.backgroundImage = [self imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
    self.tabBar.shadowImage = [UIImage new];
    self.selectedIndex = 1;
    
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"首页" image:nil tag:1];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"海淀" image:nil tag:2];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"+" image:nil tag:3];
    UITabBarItem *item3 = [[UITabBarItem alloc] initWithTitle:@"消息" image:nil tag:4];
    UITabBarItem *item4 = [[UITabBarItem alloc] initWithTitle:@"我" image:nil tag:5];
    
    LNTabarItem *item6 = [[LNTabarItem alloc] initWithFrame:CGRectMake(0, 0, 60, 49) andTitle:@"首页"];
    
    

    LNHomeViewController *homeVC = [[LNHomeViewController alloc] init];
    LocationViewController *locationVC = [[LocationViewController alloc] init];
    LNPublishViewController *publishVC = [[LNPublishViewController alloc] init];
    LNInformationViewController *infoVC = [[LNInformationViewController alloc] init];
    LNMeViewController *meVC = [[LNMeViewController alloc] init];
    
    homeVC.tabBarItem       = item;
    

    
    locationVC.tabBarItem   = item1;
    publishVC.tabBarItem    = item2;
    infoVC.tabBarItem       = item3;
    meVC.tabBarItem         = item4;
    [self setViewControllers:@[homeVC,locationVC,publishVC,infoVC,meVC]]; // 会生成对应数量的tabbarbutton
//    [self setViewControllers:@[locationVC]]; // 会生成对应数量的tabbarbutton

//    locationVC.lnTabBarItem = item6;

}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    
    
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSLog(@"%d",tabBar.selectedItem.tag);
    if (item.tag == 1) {
        self.tabBar.backgroundImage = [self imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
        self.tabBar.shadowImage = [UIImage new];
    }else{
        self.tabBar.backgroundImage = [self imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
//        self.tabBar.shadowImage = [UIImage new];
    }
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
