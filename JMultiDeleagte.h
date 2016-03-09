//
//  JMultiDeleagte.h
//  TechnologyStack
//
//  Created by 蔡杰Alan on 16/3/7.
//  Copyright © 2016年 Allan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMultiDeleagte : NSObject

@property (nonatomic,strong) NSArray   *delegates;

@property (nonatomic,weak)   id        mainDelegate;

@property (nonatomic, assign) BOOL silentWhenEmpty;

+(instancetype)newProxyMainDelegate:(id) aMainDelegate  other:(NSArray*)aDelegates silentWhenEmpty:(BOOL)aSilentWhenEmpty;

-(id)initWithMainDelegate:(id)aMainDelegate other:(NSArray*)aDelegates;

- (void)addDelegate:(id)delegate;
- (void)addDelegate:(id)delegate beforeDelegate:(id)otherDelegate;
- (void)addDelegate:(id)delegate afterDelegate:(id)otherDelegate;

- (void)removeDelegate:(id)delegate;
- (void)removeAllDelegates;

@end
