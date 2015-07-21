//
//  ViewController.m
//  网页
//
//  Created by mac on 15-7-18.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "ViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalized = @"请继续扫描你的指纹";
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:myLocalized reply:^(BOOL success, NSError *error) {
            if (success) {
                NSLog(@"成功");
                if (!success) {
                    NSLog(@"%@",error);
                }
            }else {
                NSLog(@"authentication failed");
                if (!success) {
                    NSLog(@"%@",error);
                }
            }
        }];
    }
    //    else{
    //        NSLog(@"发生一个错误");
    //        if(!success){
    //            NSLog(@"%@",error);
    //        }
    //    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
