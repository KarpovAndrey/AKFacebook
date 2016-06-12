//
//  AKFriendsContext.m
//  AKStudy
//
//  Created by Admin on 09.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AKFriendsContext.h"
#import "AKUser.h"
#import "AKFacebookConstans.h"

@interface AKFriendsContext ()
@property (nonatomic, copy) NSString *userID;

@end

@implementation AKFriendsContext

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
                                  parameters:kAKFriendsRequestParameters
                                  HTTPMethod:kAKRequestHTTPMethod];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, NSDictionary *result, NSError *error) {
        NSArray *friends = [result valueForKeyPath:kAKFriendsKeyPath];
        NSMutableArray *friendsArray = [NSMutableArray array];
        for (NSDictionary *dictionary in friends) {
            AKUser *user = [AKUser userWithDictionary:dictionary];
            [friendsArray addObject:user];
        }
        
        [self setState:kAKModelLoadedState withObject:[friendsArray copy]];
    }];
}

@end
