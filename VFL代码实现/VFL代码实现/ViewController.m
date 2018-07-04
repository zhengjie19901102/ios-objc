//
//  ViewController.m
//  VFL代码实现
//
//  Created by 郑杰 on 2018/7/3.
//  Copyright © 2018年 heiketu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    //修正默认约束转换
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    //VFL表达式
    NSString *redViewH = @"H:|-20-[redView]-20-|";
    NSString *redViewV = @"V:[redView(40)]-10-|";
    
    //字典集
    NSDictionary *dict = @{@"redView":redView};
    
    //设置layoutContraints约束
    //kNilOptions -> 空枚举选项
    NSArray *arrH = [NSLayoutConstraint constraintsWithVisualFormat:redViewH options:kNilOptions metrics:nil views:dict];
    [self.view addConstraints:arrH];
    NSArray *arrV = [NSLayoutConstraint constraintsWithVisualFormat:redViewV options:kNilOptions metrics:nil views:dict];
    [self.view addConstraints:arrV];
}
@end
