//
//  NSObject+runtime.h
//  KMRuntime
//
//  Created by KIMI on 16/11/16.
//  Copyright © 2016年 KIMI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (runtime)

//返回类的属性列表
+ (NSArray *)km_propertiesList;
//返回类的成员变量列表
+ (NSArray *)km_ivarsList;
//返回类方法列表
+ (NSArray *)km_methodList;
//返回类协议方法
+ (NSArray *)km_protocolList;

//传入一个字典, 创建"self"类属性对应的对象
+ (instancetype)km_objWithDict: (NSDictionary *)dict;
@end
