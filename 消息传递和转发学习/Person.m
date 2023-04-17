//
//  Person.m
//  消息传递和转发学习
//
//  Created by 翟旭博 on 2023/4/16.
//

#import "Person.h"
#import "NiuBiPerson.h"
@implementation Person
//+(BOOL)resolveInstanceMethod:(SEL)sel {
//    NSLog(@"%s, sel = %@", __func__, NSStringFromSelector(sel));
//    return [super resolveInstanceMethod:sel];
//}

- (void)addMethod {
    NSLog(@"%s", __func__);
}
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"%s, sel = %@", __func__, NSStringFromSelector(sel));
    if(sel == @selector(print)) {
        IMP imp = class_getMethodImplementation(self, @selector(addMethod));
        class_addMethod(self, sel, imp, "v@:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

////利用forwardingTargetForSelector:(SEL)aSelector 方法进行消息快速转发。
//- (id)forwardingTargetForSelector:(SEL)aSelector {
//    if (aSelector == @selector(print)) {
//        NSLog(@"%s, aSelector = %@",__func__, NSStringFromSelector(aSelector));
//        return [NiuBiPerson alloc];
//    }
//    return [super forwardingTargetForSelector:aSelector];
//}

//利用methodSignatureForSelector:(SEL)aSelector 方法进行消息慢速转发。
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"%s, aSelector = %@",__func__, NSStringFromSelector(aSelector));
    return [NSMethodSignature signatureWithObjCTypes:"v@:"];
}
//这个方法需要搭配forwardInvocation：
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    
}


@end
