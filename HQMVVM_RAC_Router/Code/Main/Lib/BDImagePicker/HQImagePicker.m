//
//  HQImagePicker.m
//  HQMVVM_RAC_Router
//
//  Created by Mr_Han on 2018/11/13.
//  Copyright © 2018 Mr_Han. All rights reserved.
//  CSDN <https://blog.csdn.net/u010960265>
//  GitHub <https://github.com/HanQiGod>
//

#import "HQImagePicker.h"

@interface HQImagePicker()<UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
    
    @property (nonatomic, weak) UIViewController *viewController;
    @property (nonatomic, copy) HQImagePickerFinishAction finishAction;
    @property (nonatomic, assign) BOOL allowsEditing;
    
@end


static HQImagePicker *hqImagePickerInstance = nil;

@implementation HQImagePicker
    
+ (void)showImagePickerFromViewController:(UIViewController *)viewController allowsEditing:(BOOL)allowsEditing finishAction:(HQImagePickerFinishAction)finishAction {
    if (hqImagePickerInstance == nil) {
        hqImagePickerInstance = [[HQImagePicker alloc] init];
    }
    
    [hqImagePickerInstance showImagePickerFromViewController:viewController
                                               allowsEditing:allowsEditing
                                                finishAction:finishAction];
}
    
- (void)showImagePickerFromViewController:(UIViewController *)viewController
                            allowsEditing:(BOOL)allowsEditing
                             finishAction:(HQImagePickerFinishAction)finishAction {
    _viewController = viewController;
    _finishAction = finishAction;
    _allowsEditing = allowsEditing;
    
    UIActionSheet *sheet = nil;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        sheet = [[UIActionSheet alloc] initWithTitle:nil
                                            delegate:self
                                   cancelButtonTitle:@"取消"
                              destructiveButtonTitle:nil
                                   otherButtonTitles:@"拍照", @"从相册选择", nil];
    }else {
        sheet = [[UIActionSheet alloc] initWithTitle:nil
                                            delegate:self
                                   cancelButtonTitle:@"取消"
                              destructiveButtonTitle:nil
                                   otherButtonTitles:@"从相册选择", nil];
    }
    
    UIView *window = [UIApplication sharedApplication].keyWindow;
    [sheet showInView:window];
}
    
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([title isEqualToString:@"拍照"]) {
        
        //        NSString *mediaType = AVMediaTypeVideo;//读取媒体类型
        //        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];//读取设备授权状态
        //        if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        //            NSString *errorStr = @"应用相机权限受限,请在设置中启用";
        //            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:errorStr delegate:nil cancelButtonTitle:nil otherButtonTitles:@"取消", nil];
        //            [alert show];
        //            return;
        //        }
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.allowsEditing = _allowsEditing;
        
        [_viewController presentViewController:picker animated:YES completion:nil];
        
    }else if ([title isEqualToString:@"从相册选择"]) {
        
        
        //        if (![[TZImageManager manager] authorizationStatusAuthorized]) {
        //
        //            NSString *appName = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleDisplayName"];
        //            if (!appName) appName = [[NSBundle mainBundle].infoDictionary valueForKey:@"CFBundleName"];
        //            NSString *tips = [NSString stringWithFormat:@"请在%@的\"设置-隐私-照片\"选项中，\r允许%@访问你的手机相册。",[UIDevice currentDevice].model,appName];
        //            UIAlertView  *aler = [[UIAlertView alloc]initWithTitle:@"提示" message:tips delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        //            [aler show];
        //
        //
        //            return;
        //
        //        }
        
        
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        [_viewController presentViewController:picker animated:YES completion:nil];
    }else {
        hqImagePickerInstance = nil;
    }
}
    
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = info[UIImagePickerControllerEditedImage];
    if (image == nil) {
        image = info[UIImagePickerControllerOriginalImage];
    }
    
    if (_finishAction) {
        _finishAction(image);
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    hqImagePickerInstance = nil;
}
    
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if (_finishAction) {
        _finishAction(nil);
    }
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    hqImagePickerInstance = nil;
}
    
    @end

