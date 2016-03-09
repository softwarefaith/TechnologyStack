//
//  UITextField+LimitExtention.h
//  TechnologyStack
//
//  Created by 蔡杰Alan on 16/3/7.
//  Copyright © 2016年 Allan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LimitExtention)

/**
 *  @brief Limiting the length of the input
 *
 */
-(BOOL)JAppLimitLengh_textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string lengthConstraint:(NSInteger)limitLengh;

/**
 *  @brief Decimal point length and position
 */
-(BOOL)JAppLimitRadixPoint_textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string radixPointNum:(NSInteger)aRaxixPointNum RadixPointFrontNumber:(NSInteger)aRadixPointFrontNumber;

@end
