//
//  TestObj.h
//  SFModelToJson
//
//  Created by Smallfan on 2016/9/30.
//  Copyright © 2016年 Smallfan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObj : NSObject

@property (nonatomic, assign)       NSInteger       intTest;
@property (nonatomic, assign)       BOOL            boolTest;

@property (nonatomic, strong)       NSString        *stringTest;
@property (nonatomic, strong)       NSString        *nullStringTest;

@property (nonatomic, strong)       NSArray         *arrayTest;
@property (nonatomic, strong)       NSDictionary    *dictionaryTest;

@property (nonatomic, strong)       TestObj         *objectTest;

@end
