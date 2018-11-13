//
//  HQHomeViewController.m
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import "HQHomeViewController.h"
#import "HQHomeViewModel.h"

@interface HQHomeViewController ()
    
@end

@implementation HQHomeViewController
    
- (void)viewWillAppear:(BOOL)animated
    {
        [super viewWillAppear:animated];
        // white.png图片自己下载个纯白色的色块，或者自己ps做一个
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg@3x"] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        
    }
- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
}
    
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *clickBtn = [[UIButton alloc]init];
    [clickBtn setTitle:@"点击按钮网络请求，请求完路由跳转页面" forState:UIControlStateNormal];
    [clickBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [clickBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickBtn];
    clickBtn.sd_layout
    .leftSpaceToView(self.view, 50)
    .rightSpaceToView(self.view, 50)
    .topSpaceToView(self.view, 100)
    .heightIs(50);
    
}
    
    
- (void)click{
    
    // 发送请求
    RACSignal *signal = [[[HQHomeViewModel alloc]init].requestCommand execute:@{@"code":@"Home"}];
    [signal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
        NSString *customURL = @"HQMVVMRACRouter://NaviPush/TwoViewController?name=home&userId=99999&age=18&adbc=29";
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:customURL] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:nil];
    }];
}
    
    
    
 @end

