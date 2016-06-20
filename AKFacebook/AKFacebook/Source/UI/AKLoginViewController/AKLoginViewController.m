//
//  AKLoginViewController.m
//  FBProject
//
//  Created by Admin on 06.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "IDPActiveRecordKit.h"

#import "AKLoginViewController.h"
#import "AKLoginView.h"
#import "AKFriendsViewController.h"
#import "AKUser.h"
#import "AKFacebookConstants.h"
#import "AKUserModel.h"
#import "AKUserModel.h"
#import "AKCoreDataConstants.h"
#import "AKManagedObject.h"

static NSString * const kAKAllertControllerTitle    = @"Error ";
static NSString * const kAKAllertControllerMessage  = @"you have entered an incorrect password";
static NSString * const kAKActionTitle              = @"OK";

@interface AKLoginViewController ()
@property (nonatomic, readonly) AKLoginView             *rootView;
@property (nonatomic, strong)   AKFriendsViewController *friendsViewController;

- (void)showAlert;

@end

@implementation AKLoginViewController

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKLoginView);

- (void)setUser:(AKUserModel *)user {
    if (_user != user) {
        _user = user;
        
        _user.wasLogged = YES;
        AKFriendsViewController *controller = self.friendsViewController;
        controller.user = user;
        [self.navigationController pushViewController:controller animated:NO];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark -
#pragma mark Handling Interrface

- (IBAction)onClickLoginButton:(id)sender {
    self.friendsViewController = [AKFriendsViewController new];

    FBSDKAccessToken *token = [FBSDKAccessToken currentAccessToken];
    if (token) {
        self.user = [AKUserModel objectWithID:token.userID];
    } else {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login
         logInWithReadPermissions:kAKFacebookPermissions
         fromViewController:self
         handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
             if (!error && !result.isCancelled) {
                 self.user = [AKUserModel objectWithID:result.token.userID];
             } else {
                 [self showAlert];
             }
         }];
    }
}

#pragma mark -
#pragma mark Private

- (void)showAlert {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:kAKAllertControllerTitle
                                                                   message:kAKAllertControllerMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:kAKActionTitle style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * action) {
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
