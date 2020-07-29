//
//  LNRightSocialView.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/15.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "LNRightSocialView.h"
#import "LNImageMaker.h"

@interface LNRightSocialView ()
@property (nonatomic, assign)CGRect oframe;
@end

@implementation LNRightSocialView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _oframe = frame;
        [self buildUI];
    }
    return self;
}

- (void)buildUI{
    UIImageView *backIamgeView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.oframe.size.width, self.oframe.size.height)];
     UIImage *img = [[LNImageMaker maker] imageWithColor:[UIColor clearColor]];
     backIamgeView.image = img;
     [self addSubview:backIamgeView];
    
    UIButton *headBtn;
    headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    headBtn.frame = CGRectMake(0, 5, 55, 55);
    headBtn.titleLabel.font = [UIFont systemFontOfSize:16.f weight:2.f];
    [headBtn addTarget:self action:@selector(didClickBtnHead:) forControlEvents:UIControlEventTouchUpInside];
    headBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [headBtn setTitle:@"头像" forState:UIControlStateNormal];
    [headBtn setImage:[UIImage imageNamed:@"head"] forState:UIControlStateNormal];
    

    NSArray *titles = @[@{@"icon":@"heart",@"title":@"50"},@{@"icon":@"chat",@"title":@"23"},@{@"icon":@"share",@"title":@"1"}];
    
    for (int i = 0; i < titles.count; i++) {
        NSDictionary *dict = titles[i];
        UIButton *socialBtn;
        socialBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        socialBtn.frame = CGRectMake(7, 65 * i + CGRectGetMaxY(headBtn.frame) + 25 , 40, 40);
        socialBtn.titleLabel.font = [UIFont systemFontOfSize:16.f weight:2.f];
        [socialBtn addTarget:self action:@selector(didClickBtnFocus:) forControlEvents:UIControlEventTouchUpInside];
        socialBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [socialBtn setImage:[UIImage imageNamed:[dict objectForKey:@"icon"]] forState:UIControlStateNormal];
        [socialBtn setTitle:[dict objectForKey:@"title"] forState:UIControlStateNormal];
        socialBtn.imageEdgeInsets = UIEdgeInsetsMake(0,5,10,5);
        socialBtn.titleEdgeInsets = UIEdgeInsetsMake(35, -25, 0, 5);
//        socialBtn.titleLabel.backgroundColor = [UIColor redColor];
//        socialBtn.imageView.backgroundColor = [UIColor greenColor];

        [self addSubview:socialBtn];
    }
    
    
    [self addSubview:headBtn];
    
}


@end
