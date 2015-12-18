//
//  AppDelegate.h
//  TestReachability2G3G4GDemo
//
//  Created by wr on 15/12/16.
//  Copyright © 2015年 WR. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic , strong) Reachability * hostReach;

@end

