//
//  ViewController.m
//  UITableViewTest
//
//  Created by 郑杰 on 2018/7/8.
//  Copyright © 2018年 heiketu. All rights reserved.
//

#import "ViewController.h"

#import "ZJCar.h"
#import "ZJCarGroup.h"
@interface ViewController () <UITableViewDataSource>
//车组对象
@property(nonatomic,strong)NSArray *carGroups;
//车辆
//@property(nonatomic,strong)ZJCar *car;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"arr.plist" ofType:nil];
    NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"%@",arr);
    
    //组数据
    NSMutableArray *mutableArr = [NSMutableArray array];
    
    for (NSDictionary * dict in arr) {
        NSLog(@"%@",dict);
        ZJCarGroup *carGroup = [ZJCarGroup carGroupWithDict:dict];
        [mutableArr addObject:carGroup];
    }
    
    //NSArray *arr = @[carGroup0,carGroup1];
    
    //设置数据
    self.carGroups = mutableArr;
    
}
//组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //组的数就是车组长度
    //NSInteger co = self.carGroups.count;
    return self.carGroups.count;
}
//每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    ZJCarGroup *group = self.carGroups[section];
    return group.cars.count;
}

//每组的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZJCarGroup *group = self.carGroups[indexPath.section];
    ZJCar *car = group.cars[indexPath.row];

    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = car.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

//每组的头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    ZJCarGroup *group = self.carGroups[section];
    return group.header;
}

//每组的尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    ZJCarGroup *group = self.carGroups[section];
    return group.footer;
}

@end
