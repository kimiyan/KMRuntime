# KMRuntime

##Installation
    #import "NSObject+runtime.h"
    
##Usage
#####get Class's properties
    NSArray *PropertyList = [UIView km_propertiesList];
######get Class's ivars
    NSArray *ivarList= [UIView km_ivarsList];
######get Class's methods
    NSArray *methodList = [UIView km_methodList];
######get Class's protocols
    NSArray *protocolList = [UIView km_protocolList];
###### give a dictionary return this class relative target
    NSDictionary *dict = @{@"name" : @"hyper",
                           @"age" : @25,
                           @"height" : @1.78,
                           @"job" : @"singer"
                           };
    Girl *girl = [Girl km_objWithDict:dict];
    NSLog(@"%@",girl);



   
