//
//  NSString+HQString.h
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HQString)
    
    /*小写加密*/
+ (NSString *)md5HexDigest:(NSString*)input;
    
    /*大写加密*/
+ (NSString *)MD5HexDigest:(NSString*)input;
    
    /*16位MD5加密方式   大写*/
+ (NSString *)md5sss:(NSString *)str;
    
    /*32位MD5加密方式   大写*/
+ (NSString *)md5sssLiu:(NSString *)str;
    
    /*验证身份证*/
+ (BOOL)checkIdentityCardNo:(NSString*)cardNo;
    
    /*验证手机*/
+ (BOOL)validateMobile:(NSString *)mobile;
    
    /*验证邮箱*/
+ (BOOL)validateEmail:(NSString *)email;
    
    /*验证密码长度*/
+ (BOOL)validatePassword:(NSString *)passwordStr;

@end

NS_ASSUME_NONNULL_END
