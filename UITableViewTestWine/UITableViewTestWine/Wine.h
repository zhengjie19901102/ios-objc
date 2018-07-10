//
//  Wine.h
//  UITableViewTestWine
//
//  Created by 郑杰 on 2018/7/10.
//  Copyright © 2018年 heiketu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Wine : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *money;
@property(nonatomic,copy)NSString *image;
+(instancetype)wineWithDict:(NSDictionary *)dict;
@end
