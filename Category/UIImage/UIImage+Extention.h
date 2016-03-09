//
//  UIImage+Extention.h
//  TechnologyStack
//
//  Created by 蔡杰Alan on 16/3/8.
//  Copyright © 2016年 Allan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extention)


/**
*  @brief  Equal scaling
 
            Color Misaligned Images
            图片像素不对齐（也就是图片带alpha通道）时，会在图片上面加一层洋红色来标识；
            而图片被缩放时，会加一层黄色来标识。
*/
-(nonnull UIImage *)JApp_cropEqualScaleImageToSize:(CGSize)aSize;


/**
 *  @brief
 */
+(NSString *)JApp_getLaunchImageName;

+(UIImage *)JApp_getLauchImage;

@end
