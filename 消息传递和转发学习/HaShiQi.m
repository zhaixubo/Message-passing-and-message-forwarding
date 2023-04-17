//
//  HaShiQi.m
//  消息传递和转发学习
//
//  Created by 翟旭博 on 2023/4/12.
//

#import "HaShiQi.h"

@implementation HaShiQi
- (instancetype)init {
    if (self = [super init]) {
        NSLog(@"%@", [self class]);
        NSLog(@"%@", [super class]);
    }
    return self;
}
- (void)run {
    NSLog(@"run");
}
@end
