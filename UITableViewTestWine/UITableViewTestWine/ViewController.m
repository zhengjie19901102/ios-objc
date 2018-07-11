//
//  ViewController.m
//  UITableViewTestWine
//
//  Created by 郑杰 on 2018/7/10.
//  Copyright © 2018年 heiketu. All rights reserved.
//

#import "ViewController.h"
#import "Wine.h"
@interface ViewController () <UITableViewDataSource>
@property(nonatomic,strong)NSArray *wineArr;
@property(nonatomic,strong)IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //获取到酒对应的plist文件
    NSString *path = [[NSBundle mainBundle] pathForResource:@"wine" ofType:@"plist"];
    NSArray *arrWine = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *tableArray = [NSMutableArray array];
    //通过kvc将数据设置到酒对象中
    for (NSDictionary *wineDict in arrWine) {
        Wine *wine = [[Wine alloc] init];
        [wine setValuesForKeysWithDictionary:wineDict];
        [tableArray addObject:wine];
    }
    self.wineArr = tableArray;
    
    //设置TableView的头部高度
    self.tableView.sectionHeaderHeight = 100;
    //设置TableView的尾部标题
    self.tableView.sectionFooterHeight = 100;
    //设置每行的高度
    self.tableView.rowHeight = 80;
    //设置tableView的分割线颜色
    self.tableView.separatorColor = [UIColor redColor];
    //设置tableView的分割线样式
    //如果分割线样式为none，则颜色属性设置无效
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //设置tableView的头部中的UIView
    //self.tableView.tableHeaderView = ...
    //同tableHeaderView
    //self.tableView.tableFooterView = ...
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//设置每组多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArr.count;
}

//设置每组的数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    //cell常用属性
    cell.backgroundColor = [UIColor blueColor];
    cell.backgroundView = [[UIView alloc] init];
    //设置选中时的背景视图
    //cell.selectedBackgroundView = [[UIView alloc] init];
    
    //cell中的labelText和detailText还有ImageView实际都是contentView的内部空间。TableVIewCell可以直接通过属性操作这三个空间
    //同时，cell中的contentView的是三个控件是懒加载
    NSLog(@"%p ----- %p", cell.imageView.subviews,cell.contentView);
    
    //当前行的酒数据
    Wine *wine = self.wineArr[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:wine.image];
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.money;
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"头部标题";
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"尾部标题";
}
@end
