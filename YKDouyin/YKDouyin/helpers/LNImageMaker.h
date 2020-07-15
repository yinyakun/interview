//
//  LNImageMaker.h
//  YKDouyin
//
//  Created by pcsd on 2020/7/15.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface LNImageMaker : NSObject

+ (instancetype)maker;
- (UIImage *)imageWithColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
