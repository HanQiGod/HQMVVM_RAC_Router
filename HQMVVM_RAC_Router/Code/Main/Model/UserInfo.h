//
//  UserInfo.h
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfo : NSObject

    /**  avatar  */
    @property (nonatomic, copy) NSString * avatar;
    
    /**  birthday  */
    @property (nonatomic, copy) NSString * birthday;
    
    /**  group_id  */
    @property (nonatomic, copy) NSString * group_id;
    
    /**  mobile  */
    @property (nonatomic, copy) NSString * mobile;
    
    /**  nick_name  */
    @property (nonatomic, copy) NSString * nick_name;
    
    /**  password  */
    @property (nonatomic, copy) NSString * password;
    
    /**  school_id  */
    @property (nonatomic, copy) NSString * school_id;
    
    /**  sex  */
    @property (nonatomic, copy) NSString * sex;
    
    /**  user_id  */
    @property (nonatomic, copy) NSString * user_id;
    
    /**  user_name  */
    @property (nonatomic, copy) NSString * user_name;
    
    /**  user_token  */
    @property (nonatomic, copy) NSString * user_token;
    
+ (void)UserinfoWithImage:(NSString *)username;
    
    // 方法
    // 得到单例对象的类方法
+ (UserInfo *)shareUserInfo;
    //share+类名
    //default+类名
    

@end

NS_ASSUME_NONNULL_END
