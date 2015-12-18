//
//  ViewController.m
//  TestReachability2G3G4GDemo
//
//  Created by wr on 15/12/16.
//  Copyright © 2015年 WR. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
{
    UIAlertController * ac;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"网络监测" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [button setFrame:CGRectMake(0, 0, 100, 50)];
    [button setCenter:CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2)];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    
}
- (void)buttonClick:(UIButton *)sender
{
    AppDelegate * appDele = [UIApplication sharedApplication].delegate;
    NSString * tips = @"";
    switch (appDele.hostReach.currentReachabilityStatus)
    {
        case NotReachable:
            tips = @"无网络连接";
            break;
            
        case ReachableViaWiFi:
        case ReachableViaWWAN:
            tips = @"Wifi或WWAN";
            break;
            
        case wrReachableVia2G:
            tips = @"2G";
            break;
            
        case wrReachableVia3G:
            tips = @"3G";
            break;
            
        case wrReachableVia4G:
            tips = @"4G";
            break;
    }
    NSLog(@"tips = %@",tips);
    ac = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"当前网络状态为:%@",tips] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * aa = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [ac dismissViewControllerAnimated:YES completion:nil];
        ac = nil;
    }];
    [ac addAction:aa];
    [self presentViewController:ac animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
