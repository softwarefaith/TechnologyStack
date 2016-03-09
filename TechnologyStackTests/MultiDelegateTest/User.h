//
//  User.h
//  TechnologyStack
//
//  Created by 蔡杰Alan on 16/3/7.
//  Copyright © 2016年 Allan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserProtocol.h"

@interface User : NSObject

@property (nonatomic,weak) id<UserProtocol> delegate;

-(void)excuteDelegate;

@end
