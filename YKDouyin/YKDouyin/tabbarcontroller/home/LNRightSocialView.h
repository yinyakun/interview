//
//  LNRightSocialView.h
//  YKDouyin
//
//  Created by pcsd on 2020/7/15.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickBlock)(void *_Nullable);

NS_ASSUME_NONNULL_BEGIN

@interface LNRightSocialView : UIView

@property (nonatomic, copy)ClickBlock headClickedBlock;

@property (nonatomic, copy)ClickBlock heartBlock;
@property (nonatomic, copy)ClickBlock chatBlock;
@property (nonatomic, copy)ClickBlock shareBlock;

@end

NS_ASSUME_NONNULL_END
