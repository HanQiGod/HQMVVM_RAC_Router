//
//  HQTabBarController.m
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import "HQTabBarController.h"
#import "HQNavigationController.h"
#import "UIImage+HQGImage.h"


@interface HQTabBarController ()
    
    @end

@implementation HQTabBarController
    
+ (instancetype)shareInstance {
    
    static HQTabBarController *tabbarC;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabbarC = [[HQTabBarController alloc] init];
    });
    return tabbarC;
}
    
+ (instancetype)tabBarControllerWithAddChildVCsBlock: (void(^)(HQTabBarController *tabBarC))addVCBlock {
    
    HQTabBarController *tabbarVC = [[HQTabBarController alloc] init];
    if (addVCBlock) {
        addVCBlock(tabbarVC);
    }
    
    return tabbarVC;
}
    
    
    /**
     *  根据参数, 创建并添加对应的子控制器
     *
     *  @param vc                需要添加的控制器(会自动包装导航控制器)
     *  @param isRequired             标题
     *  @param normalImageName   一般图片名称
     *  @param selectedImageName 选中图片名称
     */
- (void)addChildVC: (UIViewController *)vc title: (NSString *)title normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    
    if (isRequired) {
        HQNavigationController *nav = [[HQNavigationController alloc] initWithRootViewController:vc];
        vc.title = title;
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:[UIImage originImageWithName:normalImageName] selectedImage:[UIImage originImageWithName:selectedImageName]];
        [self addChildViewController:nav];
    }else {
        [self addChildViewController:vc];
    }
    
}
    
    
    @end

