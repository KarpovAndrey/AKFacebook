//
//  AKContext.m
//  AKFacebook
//
//  Created by Admin on 13.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AKContext.h"
#import "AKFacebookConstants.h"
#import "AKUser.h"

@implementation AKContext

#pragma mark -
#pragma mark Initialization & Deallocation

- (instancetype)initWithUser:(AKUser *)user {
    self = [super init];
    if (self) {
        self.user = user;
    }
    
    return self;
}

#pragma mark -
#pragma mark Private

- (void)parseData:(NSDictionary *)result {
    
}

#pragma mark -
#pragma mark Public

- (void)setupLoad {
    NSString *path = [NSString stringWithFormat:@"/%@", self.user.userID];

    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:path
                                  parameters:self.requestParameters
                                  HTTPMethod:kAKRequestHTTPMethod];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          NSDictionary *result,
                                          NSError *error)
    {
        [self parseData:result];
    }];
}

@end
