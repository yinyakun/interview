//
//  LNSugestViewController.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/15.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "LNSugestViewController.h"
#import "LNPlayTableViewCell.h"

@interface LNSugestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *datas;

@end

@implementation LNSugestViewController

static NSString * identifier = @"playcell";
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor brownColor];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LNPlayTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return k_screen_height;
}

- (UITableView *)tableView{
    if (_tableView) {
        return _tableView;
    }
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, k_screen_width, k_screen_height) style:UITableViewStylePlain];
    [_tableView registerNib:[UINib nibWithNibName:@"LNPlayTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:identifier];
//    _tableView.estimatedRowHeight = k_screen_height;
//    _tableView.rowHeight
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.pagingEnabled = YES;
    return _tableView;
    
}

- (NSMutableArray *)datas{
    if (_datas) {
        return _datas;
    }
    _datas = [NSMutableArray array];
    [_datas addObjectsFromArray:@[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"]];
    return _datas;
}

@end
