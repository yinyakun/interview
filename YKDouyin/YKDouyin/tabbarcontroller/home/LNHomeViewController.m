//
//  LNHomeViewController.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/14.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "LNHomeViewController.h"

#import "LNFocusViewController.h"
#import "LNSugestViewController.h"

#import "LNPlayTableViewCell.h"
#import "LNHomeNavigationView.h"
#import "LNRightSocialView.h"

@interface LNHomeViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)LNHomeNavigationView *navView;
@end

@implementation LNHomeViewController


- (void)viewDidLoad{
    [super viewDidLoad];
    [self buildUI];
}

- (void)buildUI{
    LNHomeNavigationView *navView = [[LNHomeNavigationView alloc] initWithFrame:CGRectMake(0, 22, k_screen_width, 64)];
    _navView = navView;
      [self.view addSubview: navView];
      LNFocusViewController *focusVC = [[LNFocusViewController alloc] init];
      LNSugestViewController *sugestVC = [[LNSugestViewController alloc] init];
      [self addChildViewController:focusVC];
      [self addChildViewController:sugestVC];
      [self.view addSubview:self.scrollView];
      sugestVC.view.frame = CGRectMake(k_screen_width, 0, k_screen_width, k_screen_height);
      [self.scrollView addSubview:focusVC.view];
      [self.scrollView addSubview:sugestVC.view];
      [self.view bringSubviewToFront:navView];
    LNRightSocialView *rightView = [[LNRightSocialView alloc] initWithFrame:CGRectMake(k_screen_width - 60, k_screen_height - 400, 70, 250)];
    [self.view addSubview:rightView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat x = scrollView.contentOffset.x;
    [self.navView setIndirectorX:x];
}

- (UIScrollView *)scrollView{
    if (_scrollView) {
        return _scrollView;
    }
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, k_screen_width, k_screen_height)];
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(k_screen_width * 2, k_screen_height);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    return _scrollView;
}


@end
