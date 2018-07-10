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
}

//设置每组多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wineArr.count;
}

//设置每组的数据
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    //当前行的酒数据
    Wine *wine = self.wineArr[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:wine.image];
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.money;
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end
