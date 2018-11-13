//
//  MBProgressHUD+HQ.h
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <MBProgressHUD/MBProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (HQ)
    
    /**
     显示成功信息
     
     @param success 成功的信息
     */
+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
    
    
    /**
     显示错误信息
     
     @param error 错误信息
     */
+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;
    
    
    /**
     显示加载中
     
     @param message 加载中文字
     */
+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;
    
    
    
    /**
     关闭
     */
+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
