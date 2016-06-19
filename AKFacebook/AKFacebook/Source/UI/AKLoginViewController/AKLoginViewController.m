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
             controller.user = [AKUserModel objectWithID:result.token.userID];
             controller.user.wasLogged = YES;
             [controller.user saveManagedObject];
             [self.navigationController pushViewController:controller animated:NO];
         } else {
             NSLog(@"Not logged in");
             UIAlertController* alert = [UIAlertController alertControllerWithTitle:kAKAllertControllerTitle
                                                                            message:kAKAllertControllerMessage
                                                                     preferredStyle:UIAlertControllerStyleAlert];
             
             UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:kAKActionTitle style:UIAlertActionStyleCancel
                                                                   handler:^(UIAlertAction * action) {
                                                                   }];
             
             [alert addAction:defaultAction];
             [self presentViewController:alert animated:YES completion:nil];
         }
     }];
}

@end
