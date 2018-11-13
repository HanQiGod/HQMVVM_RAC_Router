//
//  TwoViewController.m
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import "TwoViewController.h"
#import "HQTwoViewModel.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
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
    
    UILabel *label = [[UILabel alloc]init];
    label.text = [NSString stringWithFormat:@"页面ID=%@",self.userId];
    [self.view addSubview:label];
    label.sd_layout
    .leftSpaceToView(self.view, 50)
    .rightSpaceToView(self.view, 50)
    .topSpaceToView(clickBtn, 10)
    .heightIs(50);
}


- (void)click{
    
    // 发送请求
    RACSignal *signal = [[[HQTwoViewModel alloc]init].requestCommand execute:nil];
    [signal subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
        NSString *customURL = [NSString stringWithFormat:@"HQMVVMRACRouter://NaviPush/TwoViewController?name=home&userId=%ld&age=18",[self.userId integerValue]-10];
        [[UIApplication sharedApplication]openURL:[NSURL URLWithString:customURL] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:nil];        
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"navigation=%@",self.navigationController);
}

@end
