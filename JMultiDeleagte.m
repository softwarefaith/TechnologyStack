//
//  JMultiDeleagte.m
//  TechnologyStack
//
//  Created by 蔡杰Alan on 16/3/7.
//  Copyright © 2016年 Allan. All rights reserved.
//

#import "JMultiDeleagte.h"

@interface JMultiDeleagte ()

@property (nonatomic,strong)  NSPointerArray  *delegatesPointerArray;

@end
@implementation JMultiDeleagte

#pragma mark - Initialization -
+(instancetype)newProxyMainDelegate:(id) aMainDelegate  other:(NSArray*)aDelegates silentWhenEmpty:(BOOL)aSilentWhenEmpty{
    
    
    JMultiDeleagte *delegate = [[JMultiDeleagte alloc] initWithMainDelegate:aMainDelegate other:aDelegates];
    delegate.silentWhenEmpty = aSilentWhenEmpty;
    return delegate;
}

-(id)initWithMainDelegate:(id)aMainDelegate other:(NSArray*)aDelegates{
    
    self = [super init];
    if (!self)
        return nil;
    
    [self setDelegates:aDelegates];
    self.mainDelegate = aMainDelegate;
    return self;
}
#pragma mark - Public Method

#pragma mark - Message Forwarding -
-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [[self.mainDelegate class] instanceMethodSignatureForSelector:sel];

}
-(BOOL)respondsToSelector:(SEL)aSelector{
    
    if ([self.mainDelegate respondsToSelector:aSelector]) {
        return YES;
    }
    for (id delegateObj in self.delegatesPointerArray.allObjects) {
        if ([delegateObj respondsToSelector:aSelector]) {
            return YES;
        }
    }
    return NO;
}

-(void)forwardInvocation:(NSInvocation *)invocation{
    
    BOOL methodReturnSomething = (![[NSString stringWithCString:invocation.methodSignature.methodReturnType encoding:NSUTF8StringEncoding]isEqualToString:@"v"]);
    
    BOOL responded = NO;
    
    if ([self.mainDelegate respondsToSelector:invocation.selector]) {
        [invocation invokeWithTarget:self.mainDelegate];
    }
    
    // make another fake invocation with the same method signature and send the same messages to the other delegates (ignoring return values)

    NSInvocation *targetInvocation = invocation;
    if (methodReturnSomething) {
        targetInvocation = [NSInvocation invocationWithMethodSignature:invocation.methodSignature];
        [targetInvocation setSelector:invocation.selector];
    }
    
    for (id delegateObj in self.delegatesPointerArray.allObjects) {
        if ([delegateObj respondsToSelector:invocation.selector]) {
            [targetInvocation invokeWithTarget:delegateObj];
        }
    }
    
    if (!responded && !self.silentWhenEmpty)
        [self doesNotRecognizeSelector:[invocation selector]];
}

#pragma mark - Properties -

- (void)setDelegates:(NSArray *)aNewDelegates {
    self.delegatesPointerArray = [NSPointerArray weakObjectsPointerArray];
    [aNewDelegates enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [self.delegatesPointerArray addPointer:(__bridge void *)obj];
    }];
}

- (NSArray *) delegates {
    return self.delegatesPointerArray.allObjects;
}

@end
