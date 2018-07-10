//
//  Wine.m
//  UITableViewTestWine
//
//  Created by 郑杰 on 2018/7/10.
//  Copyright © 2018年 heiketu. All rights reserved.
//

#import "Wine.h"

@implementation Wine
+(instancetype)wineWithDict:(NSDictionary *)dict{
    Wine *wine = [[self alloc] init];
    wine.name = dict[@"name"];
    wine.image = dict[@"image"];
    wine.money = dict[@"money"];
    return wine;
}
@end
