//
//  ViewController.m
//  ScrollViewXib轮播图测试
//
//  Created by 郑杰 on 2018/6/29.
//  Copyright © 2018年 heiketu. All rights reserved.
//

#import "ViewController.h"
#import "PageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载xib文件
    PageView *pageView = [PageView pageView];
    pageView.bounds = CGRectMake(0, 0, 300, 130);
    //pageView.backgroundColor = [UIColor redColor];
    [pageView setImages:@[@"1",@"2",@"3"]];
    pageView.center = self.view.center;
    [self.view addSubview:pageView];
}
@end
