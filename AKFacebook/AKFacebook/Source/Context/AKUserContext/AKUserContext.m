//
//  AKUserContext.m
//  AKFacebook
//
//  Created by Admin on 12.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "AKUserContext.h"
#import "AKUserModel.h"
#import "AKFacebookConstants.h"

@implementation AKUserContext

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)requestParameters {
    return kAKUserRequestParameters;
}

#pragma mark -
#pragma mark Public

- (void)parseData:(NSDictionary *)result {
    AKUserModel *user = self.user;
    user.gender = [result valueForKeyPath:kAKGenderKey];

    [self setState:kAKModelLoadedState withObject:user];
}

@end
