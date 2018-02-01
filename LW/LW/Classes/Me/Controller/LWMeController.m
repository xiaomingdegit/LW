//
//  LWMeController.m
//  LW
//
//  Created by 刘威 on 2018/1/19.
//  Copyright © 2018年 刘威. All rights reserved.
//

#import "LWMeController.h"
#import "LWSettingController.h"
#import "LWNetworkManager.h"
#import "LWCollectionItem.h"
#import "LWCollectionViewCell.h"
//collectionViewCell间距
static int const margin = 1;
//collecionView列数
static int const cols = 4;
//collectionViewCell的宽高
#define itemWH ((screenWidth - (cols + 1) * margin) / cols)

@interface LWMeController ()<UICollectionViewDataSource>
//保存collectionItem的数据
@property (nonatomic,strong) NSMutableArray *collectionItems;
@property (nonatomic,weak) UICollectionView *collectionView;

@end

@implementation LWMeController

-(instancetype)init{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航条内容
    [self setNavigationItem];
    //设置尾部view
    [self setFooterView];
    //加载尾部view数据
    [self loadDate];
    
    //设置tableView布局
    self.tableView.contentInset = UIEdgeInsetsMake(-15, 0, 0, 0);
    self.tableView.sectionFooterHeight = 20;
    self.tableView.sectionHeaderHeight = 0;
}

#pragma mark - 加载尾部view数据
-(void)loadDate{
    [[LWNetworkManager shared] requestWithMothod:GET url:@"http://api.budejie.com/api/api_open.php" parameters:@{@"a":@"square",@"c":@"topic"} completion:^(id responseDate, BOOL isSuccess) {
        if (isSuccess) {
            //将网络数据转化为模型数组
            self.collectionItems = [LWCollectionItem conllectionItemsWithInfoArray:responseDate[@"square_list"]];
            //设置collectionView得高度
            self.collectionView.lw_height = ((self.collectionItems.count - 1) / cols + 1) * itemWH;
            //添加collectionItem
            [self resloveDate];
            //刷新collectionView
            [self.collectionView reloadData];
            //刷新tableFooterView的高度
            self.tableView.tableFooterView = self.collectionView;
        }
    }];
}

//补充少的cell
-(void)resloveDate{
    int n = cols - self.collectionItems.count % cols;
    for (int i = 0; i < n; i++) {
        LWCollectionItem *item = [[LWCollectionItem alloc] init];
        [self.collectionItems addObject:item];
    }
}

#pragma mark - 设置尾部view数据
-(void)setFooterView{
    //设置collectionView的布局
    UICollectionViewFlowLayout *layout = ({
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = margin;
        layout.minimumInteritemSpacing = margin;
        layout.itemSize = CGSizeMake(itemWH, itemWH);
        layout;
    });
    
    UICollectionView *footerView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) collectionViewLayout:layout];
    //设置collection不能滚动
    footerView.scrollEnabled = NO;
    footerView.backgroundColor = self.tableView.backgroundColor;
    footerView.dataSource = self;
    self.collectionView = footerView;
    self.tableView.tableFooterView = footerView;
    //注册collectionView
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LWCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"reuseId"];
}

#pragma mark - 设置NavigationItem
- (void)setNavigationItem{
    self.navigationItem.title = @"我的";
    UIBarButtonItem *nightButtonItem = [UIBarButtonItem itemWithImageName:@"mine-moon-icon" selectImageName:@"mine-moon-icon-click" addTarget:self action:@selector(nightCick:)];
    UIBarButtonItem *settingButtonItem = [UIBarButtonItem itemWithImageName:@"mine-setting-icon" clickImageName:@"mine-setting-icon-click" addTarget:self action:@selector(settingCick)];
    self.navigationItem.rightBarButtonItems = @[settingButtonItem,nightButtonItem];
}

-(void)nightCick:(UIButton *)nightButton{
    nightButton.selected = !nightButton.selected;
}

-(void)settingCick{
    LWSettingController *settingController = [[LWSettingController alloc] init];
    [self.navigationController pushViewController:settingController animated:YES];
}

#pragma mark - tableViewDateSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseId = @"reuseId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    if (indexPath.section == 0) {
        cell.imageView.image = [UIImage imageNamed:@"setup-head-default"];
        cell.textLabel.text = @"登录/注册";
    }else{
        cell.textLabel.text = @"离线下载";
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - collectionViewDateSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.collectionItems.count;
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    LWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseId" forIndexPath:indexPath];
    cell.item = self.collectionItems[indexPath.row];
    return cell;
}

@end
