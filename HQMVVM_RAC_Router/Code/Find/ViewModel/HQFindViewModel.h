//
//  HQFindViewModel.h
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HQFindViewModel : NSObject
    /**  请求命令  */
    @property (nonatomic,strong) RACCommand * requestCommand;
@end

NS_ASSUME_NONNULL_END
