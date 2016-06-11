//
//  AKUser.m
//  AKStudy
//
//  Created by Admin on 09.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKUser.h"

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
        self.name = [dictionary valueForKey:@"first_name"];
        self.lastName = [dictionary valueForKey:@"last_name"];
        self.gender = [dictionary valueForKey:@"gender"];
        self.userID = [dictionary valueForKey:@"id"];
        self.pictureURLPath = [dictionary valueForKeyPath:@"picture.data.url"];
        self.friends = [dictionary valueForKey:@"friends"];
    }
    
    return self;
}

@end
