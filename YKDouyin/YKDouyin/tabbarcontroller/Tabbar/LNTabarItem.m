//
//  LNTabarItem.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/14.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "LNTabarItem.h"

@interface LNTabarItem ()

@property (nonatomic, strong)UILabel *title;

@end

@implementation LNTabarItem

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        self.title.text = title;
        self.title.frame = frame;
        [self addSubview:self.title];
    }
    return self;
}

- (UILabel *)title{
    if (_title) {
        return _title;
    }
    _title = [[UILabel alloc] initWithFrame:CGRectZero];
    _title.font = [UIFont systemFontOfSize:14];
    return _title;
}
@end
