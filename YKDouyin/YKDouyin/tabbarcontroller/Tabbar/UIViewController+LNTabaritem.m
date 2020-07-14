//
//  UIViewController+LNTabaritem.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/14.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "UIViewController+LNTabaritem.h"
#import <objc/runtime.h>


@interface UIViewController ()

@end



@implementation UIViewController (LNTabaritem)




static const char YKTabarKey = 's';
- (void)setLnTabBarItem:(LNTabarItem *)lnTabBarItem
{
    if (lnTabBarItem != self.lnTabBarItem) {
        // 删除旧的，添加新的
        [self.lnTabBarItem removeFromSuperview];
        lnTabBarItem.frame = CGRectMake(0, self.view.frame.size.height - lnTabBarItem.frame.size.height, lnTabBarItem.frame.size.width, lnTabBarItem.frame.size.height);
                
        NSLog(@"====== %@", self.tabBarController.tabBar);
        [self.tabBarController.tabBar addSubview:lnTabBarItem];
        [self.tabBarController.tabBar bringSubviewToFront:lnTabBarItem];

        // 存储新的
        objc_setAssociatedObject(self, &YKTabarKey,
                                 lnTabBarItem, OBJC_ASSOCIATION_RETAIN);
    }
}

- (LNTabarItem *)lnTabBarItem
{
    return objc_getAssociatedObject(self, &YKTabarKey);
}


@end
