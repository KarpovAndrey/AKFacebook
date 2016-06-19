//
//  AppDelegate.m
//  FBProject
//
//  Created by Admin on 06.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "IDPActiveRecordKit.h"

#import "AKAppDelegate.h"
#import "AKLoginViewController.h"
#import "AKCoreDataConstants.h"
@implementation AKAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    [IDPCoreDataManager sharedManagerWithMomName:kAKMomName];
    
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    AKLoginViewController *viewController = [AKLoginViewController new];
    UINavigationController *controller = [[UINavigationController alloc]
                                          initWithRootViewController:viewController];
    [[UINavigationBar appearance] setBarTintColor:[UIColor grayColor]];

    window.rootViewController = controller;
    [window makeKeyAndVisible];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation
            ];
}

@end
