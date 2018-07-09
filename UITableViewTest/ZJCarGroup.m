#import "ZJCarGroup.h"
#import "ZJCar.h"
@implementation ZJCarGroup
+(instancetype)carGroupWithDict:(NSDictionary *)dict{
    
    ZJCarGroup *carGroup = [[self alloc] init];
    carGroup.header = dict[@"header"];
    carGroup.footer = dict[@"footer"];
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *car in dict[@"cars"]) {
        ZJCar *zjCar = [ZJCar carWithDict:car];
        [mutableArray addObject:zjCar];
    }
    
    carGroup.cars = mutableArray;
    
    return carGroup;
}
@end
