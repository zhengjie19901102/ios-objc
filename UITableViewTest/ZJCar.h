//
//  ZJCar.h
//  UITableViewTest
//
//  Created by 郑杰 on 2018/7/8.
//  Copyright © 2018年 heiketu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJCar : NSObject
/** car的title */
@property(nonatomic,copy)NSString *name;
/** car的img名 */
@property(nonatomic,copy)NSString *img;

+(instancetype)carWithName:(NSString *)name imgName:(NSString *)img;
+(instancetype)carWithDict:(NSDictionary *)dict;
@end
