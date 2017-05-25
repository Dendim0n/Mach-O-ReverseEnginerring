//
//  HelloWorldHook.m
//  HelloWorldHook
//
//  Created by 任岐鸣 on 2017/5/25.
//  Copyright © 2017年 任岐鸣. All rights reserved.
//

#import "HelloWorldHook.h"
#import <objc/runtime.h>

@implementation HelloWorldHook

-(void)methodYouUseToReplace {
    NSLog(@"Hooked.");
}

+(void)load{
    //Here is the Method you want to Hook.
    Method origMethod =  class_getInstanceMethod
    (NSClassFromString(@"NSObject"), NSSelectorFromString(@"MethodYouWantToHook"));
    
    Method newMethod = class_getInstanceMethod
    ([HelloWorldHook class], @selector(methodYouUseToReplace));
    
    method_exchangeImplementations(origMethod, newMethod);
    NSLog(@"Method Swizzled.");
}
@end
