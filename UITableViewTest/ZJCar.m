//
//  ZJCar.m
//  UITableViewTest
//
//  Created by 郑杰 on 2018/7/8.
//  Copyright © 2018年 heiketu. All rights reserved.
//

#import "ZJCar.h"

@implementation ZJCar
+(instancetype)carWithName:(NSString *)name imgName:(NSString *)img{
    ZJCar *car = [[self alloc] init];
    car.name = name;
    car.img = img;
    return car;
}

+(instancetype)carWithDict:(NSDictionary *)dict{
    ZJCar *car = [[self alloc] init];
    car.name = dict[@"name"];
    return car;
}
@end
