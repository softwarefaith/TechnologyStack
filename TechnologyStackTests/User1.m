//
//  User1.m
//  TechnologyStack
//
//  Created by 蔡杰Alan on 16/3/7.
//  Copyright © 2016年 Allan. All rights reserved.
//

#import "User1.h"

@implementation User1
-(BOOL)Myname{
    
    NSLog(@"%@-%@",NSStringFromClass([self class]),@"你好");
    
    return YES;
}
@end
