//
//  LoginVC.h
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginVC : UIViewController
    
    @property (assign, nonatomic) BOOL select;
    
+(void)requestWithUserInfo;
    //点击登陆后的操作
- (void)loginWithUsername:(NSString *)username password:(NSString *)password;
    
@end

NS_ASSUME_NONNULL_END
