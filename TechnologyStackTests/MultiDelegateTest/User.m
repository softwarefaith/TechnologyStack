//
//  User.m
//  TechnologyStack
//
//  Created by 蔡杰Alan on 16/3/7.
//  Copyright © 2016年 Allan. All rights reserved.
//

#import "User.h"

@implementation User

-(void)excuteDelegate{
    
    BOOL b  = [self.delegate Myname];
    
    if (b) {
        NSLog(@"YES");
    }else{
       NSLog(@"NO");

    }
    
}
@end
