//
//  AKFriendsContext.m
//  AKStudy
//
//  Created by Admin on 09.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKFriendsContext.h"
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

- (void)performWorkingWithResult:(NSDictionary *)result {
    NSArray *friends = [result valueForKeyPath:kAKFriendsKeyPath];
    NSMutableArray *friendsArray = [NSMutableArray array];
    for (NSDictionary *dictionary in friends) {
        AKUser *user = [AKUser userWithDictionary:dictionary];
        [friendsArray addObject:user];
    }
    
    [self setState:kAKModelLoadedState withObject:[friendsArray copy]];

}

@end
