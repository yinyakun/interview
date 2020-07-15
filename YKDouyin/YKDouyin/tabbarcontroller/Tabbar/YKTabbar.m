//
//  YKTabbar.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/14.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "YKTabbar.h"

#import "LNTabarItem.h"

@interface YKTabbar ()
@property (nonatomic, weak) UIButton *publishButton;

@end


@implementation YKTabbar

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setTitles:(NSArray *)titles{
    _titles = titles;
    for (int i = 0; i < titles.count; i++) {
        LNTabarItem *item = [[LNTabarItem alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width / 5.f, self.frame.size.height) andTitle:titles[i]];
        item.tag = i + 100;
        item.clickedBlock = ^(NSString * _Nullable title) {
            NSInteger selectedIndex = item.tag - 100;
            if (self.selectBlock) {
                self.selectBlock(selectedIndex);
            }
        };
        if (i == 2) {
            item.badgeNumber = @"2";
        }
        [self addSubview:item];
    }
    
}

- (void)setSelectIndex:(NSUInteger)selectIndex{
    _selectIndex = selectIndex;
    LNTabarItem *item = [self viewWithTag:selectIndex + 100];
    for (int i = 0; i < self.subviews.count; i++) {
        UIView *subView = self.subviews[i];
        if (subView.class != NSClassFromString(@"LNTabarItem")) continue;
        LNTabarItem *subitem = (LNTabarItem *)subView;
        subitem.selected = NO;
    }
    item.selected = YES;
}

/** 发布按钮 */
- (UIButton *)publishButton
{
    if (!_publishButton) {
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage imageNamed:@"plus"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        _publishButton = publishButton;
    }
    return _publishButton;
}
/**
 *  布局子控件
 */
- (void)layoutSubviews
{
    [super layoutSubviews];
    /**** 设置所有UITabBarButton的frame ****/
    // 按钮的尺寸
    CGFloat buttonW = self.frame.size.width / 5;
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonY = 0;
    // 按钮索引
    int buttonIndex = 0;
    for (UIView *subview in self.subviews) {
        // 过滤掉非UITabBarButton
//        if (![@"UITabBarButton" isEqualToString:NSStringFromClass(subview.class)]) continue;
        if (subview.class != NSClassFromString(@"UITabBarButton") && (subview.class != NSClassFromString(@"LNTabarItem")) ) continue;
        
        // 设置frame
        CGFloat buttonX = buttonIndex * buttonW;
        if (buttonIndex >= 2) { // 右边的2个UITabBarButton
            buttonX += buttonW;
        }
        subview.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        // 增加索引
        buttonIndex++;
    }
    /**** 设置中间的发布按钮的frame ****/
    self.publishButton.frame = CGRectMake(0, 0, buttonW, buttonH);
    self.publishButton.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
}


- (void)publishClick{
    if (self.publishBlock) {
           self.publishBlock(1);
       }
       
}


@end
