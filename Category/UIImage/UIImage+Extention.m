//
//  UIImage+Extention.m
//  TechnologyStack
//
//  Created by 蔡杰Alan on 16/3/8.
//  Copyright © 2016年 Allan. All rights reserved.
//

#import "UIImage+Extention.h"

#define JAppCurrentWindow [[UIApplication sharedApplication].windows firstObject]


@implementation UIImage (Extention)

-(UIImage *)JApp_cropEqualScaleImageToSize:(CGSize)aSize{
    
    CGFloat scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(aSize, NO, scale);
    
    CGSize aspectFitsSize = CGSizeZero;
    if (self.size.width != 0 && self.size.height != 0) {
        CGFloat rateWith = aSize.width / self.size.width;
        CGFloat rateHeight = aSize.height / self.size.height;
        
        CGFloat rate = MIN(rateWith, rateHeight);
        aspectFitsSize = CGSizeMake(self.size.width*rate, self.size.height*rate);
    }
    
    [self drawInRect:CGRectMake(0, 0, aspectFitsSize.width, aspectFitsSize.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+(NSString *)JApp_getLaunchImageName{
    
    NSString *viewOrientation = @"Portrait";
    if (UIInterfaceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        viewOrientation = @"Landscape";
    }
    NSString *launchImageName = nil;
    NSArray* imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    CGSize viewSize = JAppCurrentWindow.bounds.size;
    for (NSDictionary* dict in imagesDict)
    {
        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
        
        if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]])
        {
            launchImageName = dict[@"UILaunchImageName"];
        }
    }
    return launchImageName;

}
+(UIImage *)JApp_getLauchImage{
    return [UIImage imageNamed:[self JApp_getLaunchImageName]];
}
@end
