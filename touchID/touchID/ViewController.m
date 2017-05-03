//
//  ViewController.m
//  touchID
//
//  Copyright © 2017年 yangxutao. All rights reserved.
//

#import "ViewController.h"

#import <LocalAuthentication/LocalAuthentication.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchIdTest];
}


- (void)touchIdTest {
    LAContext *context = [[LAContext alloc] init];
//    context.localizedCancelTitle = @"cancel";
    context.localizedFallbackTitle = @"手动输入密码";
    BOOL isAuth= [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil];
    if (isAuth) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"指纹支付" reply:^(BOOL success, NSError * _Nullable error) {
            
            if (success) {
                NSLog(@"支付成功 刷新页面 做自己的事");
            } else {
                NSLog(@"没有支付成功");
                NSInteger status = error.code;
                switch (status) {
                    case  LAErrorAppCancel:
                        ;
                        break;
                    case LAErrorUserCancel://呗用户取消 用户点击了取消按钮
                        NSLog(@"用户取消验证Touch ID");
                        break;
                        
                        
                    case LAErrorSystemCancel://被系统取消，例如当另一个应用被拉到前台
                        NSLog(@"系统取消授权，如其他APP切入");
                        break;
                        
                    case LAErrorUserFallback://用户没有用指纹，使用的是输入密码
                        NSLog(@"用户选择输入密码");
                        break;
                        
                    case LAErrorInvalidContext:
                        break;
                        
                        
                    case LAErrorPasscodeNotSet: //密码没有设置
                        NSLog(@"系统未设置密码");
                        break;
                        
                        
                    case LAErrorTouchIDLockout://touch id 锁住了
                        NSLog(@"touch id lock");
                        break;
                        
                    case LAErrorTouchIDNotEnrolled://touch id 没有录入手指指纹
                        NSLog(@"设备Touch ID不可用，用户未录入");
                        break;
                        
                    case LAErrorTouchIDNotAvailable://touch id不可用
                        NSLog(@"设备Touch ID不可用，例如未打开");
                        break;
                        
                    case LAErrorAuthenticationFailed://授权失败
                        NSLog(@"授权失败");
                        break;
                        
                    default:
                        break;
                }
            }
            
        }];
    } else {
        NSLog(@"不支持指纹识别");
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
