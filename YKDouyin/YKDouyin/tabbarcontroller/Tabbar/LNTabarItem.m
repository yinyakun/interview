//
//  LNTabarItem.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/14.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "LNTabarItem.h"

@interface LNTabarItem ()

@property (nonatomic, strong)UIButton *titleBtn;
@property (nonatomic, strong)UIButton *badgeBtn;
@property (nonatomic, strong)UILabel *indiractorLabel;
@end

@implementation LNTabarItem

- (instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title{
    self = [super initWithFrame:frame];
    if (self) {
        [self.titleBtn setTitle:title forState:UIControlStateNormal];
        self.titleBtn.frame = frame;
        self.indiractorLabel.frame = CGRectMake(4, frame.size.height - 5, frame.size.width - 8, 3);
    }
    return self;
}

- (void)setSelected:(BOOL)selected{
    _selected = selected;
    CGRect oldFrame = self.indiractorLabel.frame;
    CGRect frame = oldFrame;
    [self.indiractorLabel setHidden:!selected];
    self.indiractorLabel.frame = CGRectMake(frame.origin.x + frame.size.width / 4.f, frame.origin.y, frame.size.width - 30, frame.size.height);
    [UIView animateWithDuration:0.26 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.indiractorLabel.frame = oldFrame;
    } completion:^(BOOL finished) {
        self.indiractorLabel.frame = oldFrame;
    }];
    if (_selected) {
        [self.titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.indiractorLabel.backgroundColor  = [UIColor whiteColor];
        self.titleBtn.titleLabel.font = [UIFont systemFontOfSize:16.f];
    }else{
        [self.titleBtn setTitleColor:[[UIColor whiteColor] colorWithAlphaComponent:0.7] forState:UIControlStateNormal];
        self.indiractorLabel.backgroundColor  = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        self.titleBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
    }
}

- (void)setBadgeNumber:(NSString *)badgeNumber{
    _badgeNumber = badgeNumber;
    if ([badgeNumber intValue] > 0) {
        self.badgeBtn.hidden = NO;
    }else{
        self.badgeBtn.hidden = YES;
    }
    self.badgeBtn.frame = CGRectMake(self.frame.size.width - 20, 3, 20, 20);
    [self.badgeBtn setTitle:badgeNumber forState:UIControlStateNormal];
}

- (UIButton *)titleBtn{
    if (_titleBtn) {
        return _titleBtn;
    }
    _titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
   _titleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
   _titleBtn.frame = CGRectMake(0, 0, self.frame.size.width / 5.f, self.frame.size.height);
   _titleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
   [_titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _titleBtn.titleLabel.font = [UIFont systemFontOfSize:14.f];
   [_titleBtn addTarget:self action:@selector(didClickItem:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_titleBtn];
    return _titleBtn;
}

- (UILabel *)indiractorLabel{
    
    if (_indiractorLabel) {
        return _indiractorLabel;
    }
    
    _indiractorLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _indiractorLabel.backgroundColor = [UIColor whiteColor];
    
    _indiractorLabel.frame = CGRectMake(0,0,k_screen_width / 5. - 4, 3);
    _indiractorLabel.layer.cornerRadius = 1.5;
    _indiractorLabel.layer.masksToBounds = YES;
    _indiractorLabel.hidden = YES;
    [self addSubview:_indiractorLabel];
    return _indiractorLabel;
}

- (UIButton *)badgeBtn{
    if (_badgeBtn) {
        return _badgeBtn;
    }
    UIButton *innerBtn;
    innerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    innerBtn.frame = CGRectMake(0, 0, 20, 20);
    innerBtn.backgroundColor = [UIColor orangeColor];
    innerBtn.layer.masksToBounds = YES;
    innerBtn.layer.cornerRadius = 10.f;
    innerBtn.titleLabel.font = [UIFont systemFontOfSize:12.f];
    [innerBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    innerBtn.hidden = YES;
    _badgeBtn = innerBtn;
    [self addSubview:innerBtn];
    return _badgeBtn;
}


- (void)didClickItem:(UIButton *)sender{
    if (self.clickedBlock) {
        self.clickedBlock(@"");
    }
}

@end
