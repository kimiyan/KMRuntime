//
//  NSObject+runtime.m
//  KMRuntime
//
//  Created by KIMI on 16/11/16.
//  Copyright © 2016年 KIMI. All rights reserved.
//

#import "NSObject+runtime.h"
#import <objc/runtime.h>
@implementation NSObject (runtime)

//字典转模型
+ (instancetype)km_objWithDict: (NSDictionary *)dict {
    
    id object = [[self alloc]init];
    
    //获取self 属性列表
    NSArray *propertiesList = [self km_propertiesList];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        //判断key是否存在于propertiesList属性列表中
        if ([propertiesList containsObject:key]) {
            
            //属性存在,使用KVC赋值
            [object setValue:obj forKey:key];
        }
    }];
    return object;
}

const char * kPropertiesKey = "kPropertiesKey";

//返回一个类属性列表的方法
+ (NSArray *)km_propertiesList {
    
    /**
     获取关联对象,动态添加属性
     
     参数1:对象
     参数2:动态属性的key
     */
    NSArray *result = objc_getAssociatedObject(self, kPropertiesKey);
    if (result != nil) {
        return result;
    }
    unsigned int count = 0;
   /**
    
    返回一个类属性列表的方法
    参数1: 要获取的的类
    参数2: 类中属性的个数(指针)
    
    */
    objc_property_t *proList = class_copyPropertyList([self class], &count);
    
    NSLog(@"属性数量为%d",count);
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    //遍历所有属性
    for (unsigned int i = 0; i < count; i++) {
        
        objc_property_t pty = proList[i];
        
        //从"pty"中获取属性名称
        const char *cName = property_getName(pty);
        
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        [arrM addObject:name];
    }
    
    //释放数组
    free(proList);
    
    /**
     利用关联对象,动态添加属性
     参数1:对象
     参数2:动态添加属性的key
     参数3:动态添加属性的值
     参数4:对象的引用关系
     */
    objc_setAssociatedObject(self, kPropertiesKey, arrM.copy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return arrM.copy;
}

const char * kIvarsKey = "kIvarsKey";

+(NSArray *)km_ivarsList {
    
    NSArray *result = objc_getAssociatedObject(self, kIvarsKey);
    if (result != nil) {
        return result;
    }
    
    unsigned int count = 0;
    
    Ivar * ivarList = class_copyIvarList([self class], &count);
    
    NSLog(@"成员变量数量为%d",count);
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (unsigned int i = 0; i < count; i++) {
        
        Ivar ivar = ivarList[i];
        
        const char *cName = ivar_getName(ivar);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        [arrM addObject:name];
    }
    
    free(ivarList);
    
    objc_setAssociatedObject(self, kIvarsKey, arrM.copy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return arrM.copy;
}

const char * kMethodList = "kMethodList";

+(NSArray *)km_methodList {
    
    NSArray *result = objc_getAssociatedObject(self, kMethodList);
    if (result != nil) {
        return result;
    }
    
    unsigned int count = 0;
    
    Method *methodList = class_copyMethodList([self class], &count);
    
    NSLog(@"方法数量为%d",count);
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (unsigned int i = 0; i < count; i++) {
        
        Method method = methodList[i];
        
        SEL selector = method_getName(method);
        NSString *name = NSStringFromSelector(selector);
        
        [arrM addObject:name];
    }
    
    free(methodList);
    
    objc_setAssociatedObject(self, kMethodList, arrM.copy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return arrM.copy;
}

const char * kProtocolList = "kProtocolList";

+(NSArray *)km_protocolList {
    
    NSArray *result = objc_getAssociatedObject(self, kProtocolList);
    if (result != nil) {
        return result;
    }
    
    unsigned int count = 0;
    
    __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    
    NSLog(@"协议数量为%d",count);
    
    NSMutableArray *arrM = [NSMutableArray array];
    
    for (unsigned int i = 0; i < count; i++) {
        
        Protocol *protocol = protocolList[i];
        
        const char *cName = protocol_getName(protocol);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        
        [arrM addObject:name];
    }
    
    free(protocolList);
    
    objc_setAssociatedObject(self, kProtocolList, arrM.copy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    return arrM.copy;
}

@end
