//
//  YKTabbar.h
//  YKDouyin
//
//  Created by pcsd on 2020/7/14.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^seleceIndexBlock)(NSInteger index);

NS_ASSUME_NONNULL_BEGIN

@interface YKTabbar : UITabBar

@property (nonatomic, copy)NSArray *titles;

@property (nonatomic, assign)NSUInteger selectIndex;

@property (nonatomic, copy)seleceIndexBlock selectBlock;

@property (nonatomic, copy)seleceIndexBlock publishBlock;


@end

NS_ASSUME_NONNULL_END
