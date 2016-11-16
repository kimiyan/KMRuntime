//
//  ViewController.m
//  KMRuntimeDemo
//
//  Created by KIMI on 16/11/16.
//  Copyright © 2016年 KIMI. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+runtime.h"
#import "Girl.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //返回类的属性数量以及明细
    NSArray *PropertyList = [UIView km_propertiesList];
    NSLog(@"%@",PropertyList);
    
    //返回类的成员变量以及明细
//    NSArray *ivarList= [UIView km_ivarsList];
    
    //返回类方法的成员变量以及明细
//    NSArray *methodList = [UIView km_methodList];
    
    //返回类的协议数量以及明细
//    NSArray *protocolList = [UIView km_protocolList];
   
    //传入一个字典,设置这个类对应的属性对应的对象
//    [self setGirl];
}

//传入一个字典,设置这个类对应的属性对应的对象
- (void)setGirl {

    NSDictionary *dict = @{@"name" : @"hyper",
                           @"age" : @25,
                           @"height" : @1.78,
                           @"job" : @"singer"
                           };
    Girl *girl = [Girl km_objWithDict:dict];
    NSLog(@"%@",girl);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
