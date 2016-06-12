//
//  AKUserContext.m
//  AKFacebook
//
//  Created by Admin on 12.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AKUserContext.h"
#import "AKUser.h"
#import "AKFacebookConstans.h"

@interface AKUserContext ()
@property (nonatomic, copy) NSString *userID;

@end

@implementation AKUserContext

#pragma mark -
#pragma mark Initialization & Deallocation

- (instancetype)initWithUserID:(NSString *)userID {
    self = [super init];
    if (self) {
        self.userID = userID;
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)setupLoad {
    NSString *path = [NSString stringWithFormat:@"/%@", self.userID];
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:path
                                  parameters:kAKUserRequestParameters
                                  HTTPMethod:kAKRequestHTTPMethod];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
        AKUser *user = [AKUser new];
        user.firstName = [result valueForKeyPath:kAKFirstNameKey];
        user.lastName = [result valueForKeyPath:kAKLastNameKey];
        user.gender = [result valueForKeyPath:kAKGenderKey];
        user.pictureURLPath = [result valueForKeyPath:kAKPictureURLKeyPath];

        [self setState:kAKModelLoadedState withObject:user];
    }];
}

@end
