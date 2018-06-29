//
//  PageView.h
//  ScrollViewXib轮播图测试
//
//  Created by 郑杰 on 2018/6/29.
//  Copyright © 2018年 heiketu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageView : UIView
+(instancetype)pageView;
-(void)setImages:(NSArray *)images;
@end
