//
//  UIColor+HQ.h
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HQ)
    
    // #开头的六位十六进制数仅仅表示颜色
    // 0x开头的数字表示包括颜色在内的一般数值。
    
    // 透明度固定为1，以0x开头的十六进制转换成的颜色
+ (UIColor *)colorWithWzx:(long)hexColor;
    
    // 0x开头的十六进制转换成的颜色,透明度可调整
+ (UIColor *)colorWithWzx:(long)hexColor alpha:(float)opacity;
    
    // 颜色转换三：iOS中十六进制的颜色（以#开头）转换为UIColor
+ (UIColor *)colorWithWzxString:(NSString *)color;

@end

NS_ASSUME_NONNULL_END
