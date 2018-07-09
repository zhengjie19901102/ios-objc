#import <Foundation/Foundation.h>
@interface ZJCarGroup : NSObject
/**  tableGroup头部标题  */
@property(nonatomic,copy)NSString *header;
/**  tableGroup尾部标题  */
@property(nonatomic,copy)NSString *footer;
/**  car内容组  */
@property(nonatomic,copy)NSArray *cars;

+(instancetype)carGroupWithDict:(NSDictionary *)dict;

@end
