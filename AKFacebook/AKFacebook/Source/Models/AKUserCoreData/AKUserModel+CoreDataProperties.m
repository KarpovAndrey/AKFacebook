//
//  AKUserModel+CoreDataProperties.m
//  AKFacebook
//
//  Created by Admin on 18.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AKUserModel+CoreDataProperties.h"
#import "AKFacebookConstants.h"
#import "IDPActiveRecordKit.h"

@implementation AKUserModel (CoreDataProperties)

@dynamic firstName;
@dynamic gender;
@dynamic largePicture;
@dynamic lastName;
@dynamic pictureURLPath;
@dynamic smallPicture;
@dynamic friends;

//#pragma marl -
//#pragma mark Class Methods
//
//+ (instancetype)userWithDictionary:(NSDictionary *)dictionary {
//    return [[self alloc] initWithDictionary:dictionary];
//}
//
//#pragma mark -
//#pragma mark Initializations and Deallocatins
//
//- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
//    self = [super init];
//    if (self) {
//        self.firstName = [dictionary valueForKey:kAKFirstNameKey];
//        self.lastName = [dictionary valueForKey:kAKLastNameKey];
//        self.pictureURLPath = [dictionary valueForKeyPath:kAKPictureURLKeyPath];
//        self.friends = [dictionary valueForKey:kAKFriendsKey];
//    }
//    
//    return self;
//}

#pragma mark -
#pragma mark Accessors

- (void)setFirstName:(NSString *)firstName {
    [self setCustomValue:firstName forKey:kAKFirstNameKey];
}

- (NSString *)firstName {
    return [self customValueForKey:kAKFirstNameKey];
}

@end
