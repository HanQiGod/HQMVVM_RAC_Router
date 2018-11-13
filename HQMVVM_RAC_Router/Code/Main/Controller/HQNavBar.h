//
//  HQNavBar.h
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HQNavBar : UINavigationBar
    /**
     *  设置全局的导航栏背景图片
     *
     *  @param globalImg 全局导航栏背景图片
     */
+ (void)setGlobalBackGroundImage: (UIImage *)globalImg;
    /**
     *  设置全局导航栏标题颜色, 和文字大小
     *
     *  @param globalTextColor 全局导航栏标题颜色
     *  @param fontSize        全局导航栏文字大小
     */
+ (void)setGlobalTextColor: (UIColor *)globalTextColor andFontSize: (CGFloat)fontSize;

@end

NS_ASSUME_NONNULL_END
