//
//  UIImage+HQGImage.h
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (HQGImage)
    
    // 加载最原始的图片，没有渲染
+ (UIImage *)originImageWithName: (NSString *)name;
    
    // 绘制圆角
- (void)WZX_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *image))completion;

@end

NS_ASSUME_NONNULL_END
