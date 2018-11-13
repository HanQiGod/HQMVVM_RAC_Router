//
//  NSDictionary+HQ.m
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import "NSDictionary+HQ.h"
#import <objc/runtime.h>
@implementation NSDictionary (HQ)
    
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self exchangeOriginalMethod:class_getInstanceMethod(objc_getClass("__NSDictionaryI"), @selector(dictionaryWithObjects:forKeys:count:)) withNewMethod:class_getInstanceMethod(object_getClass(@"__NSDictionaryI"), @selector(wzx_dictionaryWithObjects:forKeys:count:))];
        [self exchangeOriginalMethod:class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(setObject:forKey:)) withNewMethod:class_getInstanceMethod(objc_getClass("__NSDictionaryM"), @selector(wzx_setObject:forKey:))];
    });
}
    
    
+ (instancetype)wzx_dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)count{
    id validObjects[count];
    id<NSCopying> validKeys[count];
    NSUInteger cnt = 0;
    for (NSUInteger i = 0; i < count; i++)
    {
        if (objects[i] && keys[i])
        {
            validObjects[cnt] = objects[i];
            validKeys[cnt] = keys[i];
            count ++;
        }
        else
        {
            NSLog(@"[%@ %@] NIL object or key at index{%lu}.",
                  NSStringFromClass(self),
                  NSStringFromSelector(_cmd),
                  (unsigned long)i);
        }
    }
    
    return [self wzx_dictionaryWithObjects:validObjects forKeys:validKeys count:count];
    
}
    
- (void)wzx_setObject:(id)object forKey:(NSString *)key{
    if(!object){
        @try{
            [self wzx_setObject:object forKey:key];
        } @catch(NSException *exception){
            NSLog(@"---------- %s 字典添加为空 %s  ----------\n", class_getName(self.class), __func__);
            NSLog(@"%@", [exception callStackSymbols]);
            object = [NSString stringWithFormat:@""];
            [self wzx_setObject:object forKey:key];
        } @finally{
            
        }
    }else{
        [self wzx_setObject:object forKey:key];
    }
}
    
+ (void)exchangeOriginalMethod:(Method)originalMethod withNewMethod:(Method)newMethod
    {
        method_exchangeImplementations(originalMethod, newMethod);
    }
    @end
