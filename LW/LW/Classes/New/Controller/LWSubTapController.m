//
//  LWSubTapController.m
//  LW
//
//  Created by 刘威 on 2018/1/25.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWSubTapController.h"
#import "LWNetworkManager.h"
#import "LWSubTapItem.h"
#import "LWSubTapCell.h"

@interface LWSubTapController ()
//保存模型数据
@property (nonatomic, strong)NSArray *subTapItems;

@end

@implementation LWSubTapController
static NSString *resueID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    //加载网络数据
    [self loadData];
    //注册LWSubTapCell的Nib
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([LWSubTapCell class]) bundle:nil] forCellReuseIdentifier:resueID];
    //设置cell分割线 1.隐藏系统tableView的cell分割线 2.设置tableView的背景颜色为系统背景颜色 3.重写tableViewCell的setFrame方法 修改tableViewCell 的高度减一
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = LWColor(220, 220, 220);
}

- (void)loadData{
    //设置get请求参数
    NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    //发送请求 获取数据
    [[LWNetworkManager shared] requestWithMothod:GET url:@"http://api.budejie.com/api/api_open.php" parameters:parameters completion:^(id responseDate, BOOL isSuccess) {
        if (isSuccess) {
            self.subTapItems = [LWSubTapItem subTapItemsWithArray:responseDate];
            //获得数据后 刷新表格
            [self.tableView reloadData];
        }
    }];
}
//返回tableViewd的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.subTapItems.count;
}
//返回tableViewCell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //从cell重用池中获取cell
    LWSubTapCell *cell = [tableView dequeueReusableCellWithIdentifier:resueID];
    //设置tableCell数据
    cell.item = self.subTapItems[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
//返回tableView高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

@end
