//
//  JMultiDelegateTestCase.m
//  TechnologyStack
//
//  Created by 蔡杰Alan on 16/3/7.
//  Copyright © 2016年 Allan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "JMultiDeleagte.h"

#import "User.h"
#import "User1.h"
#import "User2.h"
#import "UserProtocol.h"

@interface JMultiDelegateTestCase : XCTestCase <UserProtocol>{
    
    JMultiDeleagte		*multiDelegateProxy;
}

@property (nonatomic,strong) User *user;

@property (nonatomic,strong) User1 *u1;
@property (nonatomic,strong) User2 *u2;


@end

@implementation JMultiDelegateTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.user = [[User alloc] init];
    self.u1 = [[User1 alloc] init];
   self.u2= [[User2 alloc] init];
    multiDelegateProxy = [JMultiDeleagte newProxyMainDelegate:self.u1 other:@[self.u2] silentWhenEmpty:YES];
    self.user.delegate = ((id<UserProtocol>) multiDelegateProxy);
}
-(BOOL)Myname{
    
    NSLog(@"JMultiDelegateTestCase");
    
    return YES;
}
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testMultiDelegate{
    [self.user excuteDelegate];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
