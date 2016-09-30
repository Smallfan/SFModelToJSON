//
//  SFModelToJSON.h
//  SFModelToJSON
//
//  Created by Smallfan on 2016/9/30.
//  Copyright © 2016年 Smallfan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFModelToJSON : NSObject

+ (NSData *)modelToJSON:(id)obj options:(NSJSONWritingOptions)options error:(NSError**)error;
+ (void)print:(id)obj;

@end
