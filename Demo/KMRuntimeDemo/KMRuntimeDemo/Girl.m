//
//  Girl.m
//  KMRuntime
//
//  Created by KIMI on 16/11/16.
//  Copyright © 2016年 KIMI. All rights reserved.
//

#import "Girl.h"

@implementation Girl
//重写description方法
- (NSString *)description {
    
    NSArray *keys = @[@"name",@"job",@"age",@"height"];
    return [self dictionaryWithValuesForKeys:keys].description ;
}
@end
