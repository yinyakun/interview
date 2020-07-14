//
//  LNHomeViewController.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/14.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "LNHomeViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface LNHomeViewController ()

@end

@implementation LNHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor brownColor];
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
    }];
    
    UITableView *tab;
    tab.mj_header;
}

@end
