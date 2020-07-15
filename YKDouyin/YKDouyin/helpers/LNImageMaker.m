//
//  LNImageMaker.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/15.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "LNImageMaker.h"

@implementation LNImageMaker
+ (instancetype)maker{
    static LNImageMaker *maker = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (maker == nil) {
            maker = [[self alloc] init];
        }
    });
    return maker;
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
