//
//  HQUtils.h
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HQUtils : NSObject

    /*小写加密*/
+ (NSString *)md5HexDigest:(NSString*)input;
    /*大写加密*/
+ (NSString *)MD5HexDigest:(NSString*)input;
    
    //16位MD5加密方式   大写
+(NSString *)md5sss:(NSString *)str;
    
    //32位MD5加密方式   大写
    
+(NSString *)md5sssLiu:(NSString *)str;
    
    
#pragma mark - 身份证识别
+(BOOL)checkIdentityCardNo:(NSString*)cardNo;
    
@end

NS_ASSUME_NONNULL_END
