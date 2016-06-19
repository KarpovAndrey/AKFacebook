//
//  AKFriendsContext.m
//  AKStudy
//
//  Created by Admin on 09.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKFriendsContext.h"
#import "AKUserModel.h"
#import "AKUser.h"
#import "AKFacebookConstants.h"

@implementation AKFriendsContext

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)requestParameters {
    return kAKFriendsRequestParameters;
}

#pragma mark -
#pragma mark Public

- (void)parseData:(NSDictionary *)result {
    NSArray *friends = [result valueForKeyPath:kAKFriendsKeyPath];
    NSMutableArray *friendsArray = [NSMutableArray array];
    for (NSDictionary *dictionary in friends) {
        AKUserModel *userModel = [AKUserModel objectWithID:[dictionary valueForKey:kAKUserIDKey]];
        userModel.firstName = [dictionary valueForKey:kAKFirstNameKey];
        userModel.lastName = [dictionary valueForKey:kAKLastNameKey];
        userModel.pictureURLPath = [dictionary valueForKeyPath:kAKPictureURLKeyPath];
        
        NSMutableSet *friendsSet = [NSMutableSet new];
        NSDictionary *friendsDictionary = [[dictionary valueForKey:kAKFriendsKey] valueForKey:kAKDataKey];
        for (NSDictionary *dictionary in friendsDictionary) {
            AKUserModel *friendUser = [AKUserModel objectWithID:[dictionary valueForKey:kAKUserIDKey]];
            [friendsSet addObject:friendUser];
        }
        
        userModel.friends = friendsSet;

        [friendsArray addObject:userModel];
    }
    
    [self setState:kAKModelLoadedState withObject:[friendsArray copy]];
}

@end
