//
//  LNTabarItem.h
//  YKDouyin
//
//  Created by pcsd on 2020/7/14.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickedItemBlock)(NSString *_Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface LNTabarItem : UIView

@property (nonatomic, assign)BOOL selected;

@property (nonatomic, copy)NSString *badgeNumber;

@property (nonatomic, copy)clickedItemBlock clickedBlock;

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
