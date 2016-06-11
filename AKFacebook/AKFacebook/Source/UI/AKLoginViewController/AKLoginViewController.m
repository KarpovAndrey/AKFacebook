//
//  AKLoginViewController.m
//  FBProject
//
//  Created by Admin on 06.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AKLoginViewController.h"
#import "AKLoginView.h"
#import "AKFriendsViewController.h"
#import "AKUser.h"

#define kAKFacebookPermissions @[@"public_profile", @"user_friends"]

@interface AKLoginViewController ()
@property (nonatomic, readonly) AKLoginView    *rootView;

@end

@implementation AKLoginViewController

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKLoginView);

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark -
#pragma mark Handling Interrface

- (IBAction)onClickLoginButton:(id)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logOut];

    [login
     logInWithReadPermissions:kAKFacebookPermissions
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (!error && !result.isCancelled) {
             NSLog(@"Logged in");
             AKFriendsViewController *controller = [AKFriendsViewController new];
             controller.user = [[AKUser alloc] initWithUserID:result.token.userID];
             [self.navigationController pushViewController:controller animated:NO];
         } else {
             NSLog(@"Not logged in");
         }
     }];
}

@end
