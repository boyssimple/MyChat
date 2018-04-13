//
//  Toast.m
//  MyChat
//
//  Created by simple on 2018/4/12.
//  Copyright © 2018年 simple. All rights reserved.
//

#import "Toast.h"

@implementation Toast

+(void)showToast:(NSString*)text with:(UIView*)view withTime:(CGFloat)time{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = text;
    [hud show:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideAllHUDsForView:view animated:YES];
    });
}


+(void)showToast:(NSString*)text mode:(MBProgressHUDMode)mode with:(UIView*)view withTime:(CGFloat)time{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view.navigationController.view animated:YES];
    hud.mode = mode;
    hud.labelText = text;
    [hud show:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:view animated:YES];
    });
}

+(void)showSuccessToast:(NSString*)text with:(UIView*)view withTime:(CGFloat)time{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
    UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"check-mark"]];
    img.frame = CGRectMake(5, 0, 20, 20);
    [v addSubview:img];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = v;
    hud.labelText = text;
    [hud show:YES];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // Do something...
        [MBProgressHUD hideHUDForView:view.navigationController.view animated:YES];
    });
}
@end
