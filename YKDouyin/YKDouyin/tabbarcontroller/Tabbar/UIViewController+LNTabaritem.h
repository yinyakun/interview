//
//  UIViewController+LNTabaritem.h
//  YKDouyin
//
//  Created by pcsd on 2020/7/14.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LNTabarItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (LNTabaritem)
@property(null_resettable, nonatomic, strong) LNTabarItem *lnTabBarItem;
@end

NS_ASSUME_NONNULL_END
