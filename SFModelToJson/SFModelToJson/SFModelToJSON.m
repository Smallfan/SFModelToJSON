//
//  SFModelToJSON.m
//  SFModelToJSON
//
//  Created by Smallfan on 2016/9/30.
//  Copyright © 2016年 Smallfan. All rights reserved.
//

#import "SFModelToJSON.h"
#import <objc/runtime.h>

@implementation SFModelToJSON

+ (NSDictionary *)modelToDictionary:(id)model {
    
    //Initialization Parameter
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    unsigned int propsCount;
    
    //Get model property data by Runtime
    objc_property_t *props = class_copyPropertyList([model class], &propsCount);
    
    //Analysis property data
    for(int i = 0;i < propsCount; i++) {
        objc_property_t prop = props[i];
        
        NSString *propName = [NSString stringWithUTF8String:property_getName(prop)];
        id value = [model valueForKey:propName];
        
        if(value == nil) {
            value = [NSNull null];
        } else {
            value = [self analysisProperties:value];
        }
        
        [dic setObject:value forKey:propName];
    }
    return dic;
}

//Private method
+ (id)analysisProperties:(id)obj {
    
    if([obj isKindOfClass:[NSString class]]
       || [obj isKindOfClass:[NSNumber class]]
       || [obj isKindOfClass:[NSNull class]]) {
        return obj;
    }
    
    //Analysis [NSArray] data which used recursion
    if([obj isKindOfClass:[NSArray class]]) {
        NSArray *objArray = obj;
        NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:objArray.count];
        
        for(int i = 0;i < objArray.count; i++) {
            [mutableArray setObject:[self analysisProperties:[objArray objectAtIndex:i]] atIndexedSubscript:i];
        }
        
        return mutableArray;
    }
    
    //Analysis [NSDictionary] data which used recursion
    if([obj isKindOfClass:[NSDictionary class]]) {
        NSDictionary *objDictionary = obj;
        NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithCapacity:[objDictionary count]];
        
        for(NSString *key in objDictionary.allKeys) {
            [mutableDictionary setObject:[self analysisProperties:[objDictionary objectForKey:key]] forKey:key];
        }
        
        return mutableDictionary;
    }
    
    return [self modelToDictionary:obj];
}

+ (NSData *)modelToJSON:(id)obj options:(NSJSONWritingOptions)options error:(NSError**)error {
    return [NSJSONSerialization dataWithJSONObject:[self modelToDictionary:obj] options:options error:error];
}

+ (void)print:(id)obj {
    NSLog(@"Model To Dictionary:\n%@", [self modelToDictionary:obj]);
    NSLog(@"Model To JSON:\n%@", [self modelToJSON:obj options:NSJSONWritingPrettyPrinted error:nil]);
}

@end
