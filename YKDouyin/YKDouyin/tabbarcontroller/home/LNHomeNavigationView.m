//
//  LNHomeNavigationView.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/15.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "LNHomeNavigationView.h"

@interface LNHomeNavigationView ()
@property (nonatomic, strong)UILabel *indirectorLabel;
@property (nonatomic, strong)UIButton *focusBtn;
@end

@implementation LNHomeNavigationView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    
    UIImageView *backIamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, k_screen_width, 64)];
    UIImage *img = [[LNImageMaker maker] imageWithColor:[UIColor clearColor]];
    backIamgeView.image = img;
    [self addSubview:backIamgeView];
    
    UIButton *onlinePlayBtn = [self makeButtonPlay];
    [self addSubview:onlinePlayBtn];
    
    UIButton *focusBtn;
    focusBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    focusBtn.frame = CGRectMake(k_screen_width / 2.f - 60, 10, 40, 40);
    [focusBtn setTitle:@"关注" forState:UIControlStateNormal];
    [focusBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    focusBtn.titleLabel.font = [UIFont systemFontOfSize:16.f weight:2.f];
    [focusBtn addTarget:self action:@selector(didClickBtnFocus:) forControlEvents:UIControlEventTouchUpInside];
    _focusBtn = focusBtn;
    
    UIButton *sugestBtn;
    sugestBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sugestBtn.frame = CGRectMake(k_screen_width / 2.f + 20, 10, 40, 40);
    [sugestBtn setTitle:@"推荐" forState:UIControlStateNormal];
    [sugestBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    sugestBtn.titleLabel.font = [UIFont systemFontOfSize:16.f weight:2.f];
    [sugestBtn addTarget:self action:@selector(didClickBtnSuggest:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:focusBtn];
    [self addSubview:sugestBtn];
    
    self.indirectorLabel.center = CGPointMake(focusBtn.center.x, focusBtn.center.y + focusBtn.frame.size.height / 2.f + 1);
    [self addSubview:self.indirectorLabel];
}

- (void)setIndirectorX:(CGFloat)indirectorX{
    indirectorX = indirectorX > k_screen_width ? k_screen_width : indirectorX;
    indirectorX = indirectorX < 0 ? 0 : indirectorX;
    CGFloat offsetX = (indirectorX/k_screen_width) * 80.f;
    self.indirectorLabel.center = CGPointMake(self.focusBtn.center.x + offsetX, self.indirectorLabel.center.y);
}

- (UIButton *)makeButtonPlay{
    UIButton *innerBtn;
    innerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    innerBtn.frame = CGRectMake(16, 10, 40, 40);
    [innerBtn addTarget:self action:@selector(didClickBtnOnlinePlay:) forControlEvents:UIControlEventTouchUpInside];
    [innerBtn setImage:[UIImage imageNamed:@"online"] forState:UIControlStateNormal];
    return innerBtn;
}

- (void)didClickBtnOnlinePlay:(UIButton *)sender{
    
}

- (UILabel *)indirectorLabel{
    if (_indirectorLabel) {
        return _indirectorLabel;
    }
    _indirectorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 3)];
    _indirectorLabel.backgroundColor = [UIColor blueColor];
    _indirectorLabel.layer.masksToBounds = YES;
    _indirectorLabel.layer.cornerRadius = 1.5;
    return _indirectorLabel;
}


@end
