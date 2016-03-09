//
//  UIColor+Extention.m
//  TechnologyStack
//
//  Created by 蔡杰Alan on 16/3/7.
//  Copyright © 2016年 Allan. All rights reserved.
//

#import "UIColor+Extention.h"

@implementation UIColor (Extention)

+ (UIColor*)colorWithHexString:(NSString*)hexString{
    if(nil == hexString || hexString.length < 7){
        return nil;
    }
    
    unsigned int red, green, blue;
    
    NSRange range = NSMakeRange(1, 2);
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[hexString substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(CGFloat)(red/255.0f) green:(CGFloat)(green/255.0f) blue:(CGFloat)(blue/255.0f) alpha:1.0f];
}

@end
