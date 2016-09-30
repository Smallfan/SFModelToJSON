//
//  ViewController.m
//  SFModelToJSON
//
//  Created by Smallfan on 2016/9/30.
//  Copyright © 2016年 Smallfan. All rights reserved.
//

#import "ViewController.h"
#import "SFModelToJSON.h"
#import "TestObj.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self test];
}

- (void)test {
    
    TestObj *testObj = [[TestObj alloc] init];
    testObj.intTest = 5;
    testObj.boolTest = true;
    testObj.stringTest = @"StringTest";
    testObj.arrayTest = @[@"1",@"2",@"3"];
    testObj.dictionaryTest = @{@"keyTest": @"valueTest"};
    
    TestObj *childObj = [[TestObj alloc] init];
    childObj.intTest = 10;
    childObj.boolTest = false;
    childObj.stringTest = @"childStringTest";
    childObj.arrayTest = @[@"4",@"5",@"6"];
    childObj.dictionaryTest = @{@"childKeyTest": @"childValueTest"};
    
    testObj.objectTest = childObj;
    
    [SFModelToJSON print:testObj];
}

@end
