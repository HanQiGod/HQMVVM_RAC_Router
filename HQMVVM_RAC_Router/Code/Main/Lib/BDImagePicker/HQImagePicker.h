//
//  HQImagePicker.h
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import <Foundation/Foundation.h>

typedef void (^HQImagePickerFinishAction)(UIImage *image);

@interface HQImagePicker : NSObject
    
    /**
     @param viewController  用于present UIImagePickerController对象
     @param allowsEditing   是否允许用户编辑图像
     */
+ (void)showImagePickerFromViewController:(UIViewController *)viewController
                            allowsEditing:(BOOL)allowsEditing
                             finishAction:(HQImagePickerFinishAction)finishAction;
    
    @end
