//
//  AKUser.m
//  AKStudy
//
//  Created by Admin on 09.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKUser.h"
#import "AKFacebookConstans.h"

@implementation AKUser

#pragma marl -
#pragma mark Class Methods

+ (instancetype)userWithDictionary:(NSDictionary *)dictionary {
    return [[self alloc] initWithDictionary:dictionary];
}

#pragma mark -
#pragma mark Initializations and Deallocatins

- (instancetype)initWithUserID:(NSString *)userID {
    self = [super init];
    if (self) {
        self.userID = userID;
    }
    
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.firstName = [dictionary valueForKey:kAKFirstNameKey];
        self.lastName = [dictionary valueForKey:kAKLastNameKey];
        self.gender = [dictionary valueForKey:kAKGenderKey];
        self.userID = [dictionary valueForKey:kAKUserIDKey];
        self.pictureURLPath = [dictionary valueForKeyPath:kAKPictureURLKeyPath];
        self.friends = [dictionary valueForKey:kAKFriendsKey];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)largePicture {
    return [NSString stringWithFormat:kAKLargePictureURL, self.userID];
}

- (NSString *)smallPicture {
    return [NSString stringWithFormat:kAKSmallPictureURL, self.userID];
}

@end
