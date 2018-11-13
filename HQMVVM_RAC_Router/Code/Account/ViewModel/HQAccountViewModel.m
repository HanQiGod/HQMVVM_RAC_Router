//
//  HQAccountViewModel.m
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import "HQAccountViewModel.h"

@implementation HQAccountViewModel

- (instancetype)init
    {
        if(self = [super init])
        {
            [self setUp];
        }
        return self;
    }
    
- (void)setUp
    {
        _requestCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            // 创建信号
            RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                
                // 网络请求
                [MBProgressHUD showMessage:@"加载中.."];
                [HQNetworking getWithUrl:[NSString stringWithFormat:@"%@index.ashx",KHttpUrl] success:^(id response) {
                    
                    [MBProgressHUD hideHUD];
                    [subscriber sendNext:@"123"];
                    
                    
                    
                } fail:^(NSError *error) {
                    [MBProgressHUD hideHUD];
                    [MBProgressHUD showError:@"网络连接失败"];
                    [subscriber sendNext:@"123"];
                }];
                
                return nil;
            }];
            
            
            
            
            return signal;
        }];
    }
@end
