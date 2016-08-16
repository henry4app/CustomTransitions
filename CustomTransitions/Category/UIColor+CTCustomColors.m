//
//  UIColor+CTCustomColors.m
//  CustomTransitions
//
//  Created by 顾晨洁 on 16/8/15.
//  Copyright © 2016年 alientech. All rights reserved.
//

#import "UIColor+CTCustomColors.h"

@implementation UIColor (CTCustomColors)

+ (UIColor *)customPurpleColor {
    return [self colorWithRed:91 green:75 blue:160];
}

+ (UIColor *)customGreenColor {
    return [self colorWithRed:57 green:202 blue:116];
}

+ (UIColor *)customGrayColor {
    return [self colorWithRed:127 green:140 blue:141];
}

+ (UIColor *)customWhiteColor {
    return [self colorWithRed:236 green:240 blue:241];
}

+ (UIColor *)colorWithRed:(CGFloat)red
                    green:(CGFloat)green
                     blue:(CGFloat)blue
{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

@end
