//
//  LNPlayTableViewCell.m
//  YKDouyin
//
//  Created by pcsd on 2020/7/15.
//  Copyright © 2020 pcsd. All rights reserved.
//

#import "LNPlayTableViewCell.h"

@interface LNPlayTableViewCell ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *datas;
@end

@implementation LNPlayTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    [self addSubview:self.tableView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.datas.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    static NSString *identifier = @"identifier";
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
//    cell.textLabel.text = @"hello world";
//    return cell;
//}
//
//- (UITableView *)tableView{
//    if (_tableView) {
//        return _tableView;
//    }
//    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,k_screen_height,k_screen_width) style:UITableViewStylePlain];
//    _tableView.delegate = self;
//    _tableView.dataSource = self;
//    _tableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
//    return _tableView;
//
//}
//
//- (NSMutableArray *)datas{
//    if (_datas) {
//        return _datas;
//    }
//    _datas = [NSMutableArray array];
//    [_datas addObjectsFromArray:@[@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1",@"1"]];
//    return _datas;
//}


@end
