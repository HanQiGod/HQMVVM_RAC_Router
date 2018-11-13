//
//  HQTabBarController.h
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HQTabBarController : UITabBarController

    /**
     获取单例对象
     
     @return TabBarController
     */
+ (instancetype)shareInstance;
    
    
    /**
     添加子控制器的block
     
     @param addVCBlock 添加代码块
     
     @return TabBarController
     */
+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(HQTabBarController *tabBarC))addVCBlock;
    
    
    /**
     添加子控制器
     
     @param vc                子控制器
     @param normalImageName   普通状态下图片
     @param selectedImageName 选中图片
     @param isRequired        是否需要包装导航控制器
     */
- (void)addChildVC: (UIViewController *)vc title: (NSString *)title normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired;
@end

NS_ASSUME_NONNULL_END
