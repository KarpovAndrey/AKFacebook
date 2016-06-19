//
//  AKUserModel+CoreDataProperties.h
//  AKFacebook
//
//  Created by Admin on 18.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AKUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AKUserModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString                *firstName;
@property (nullable, nonatomic, retain) NSString                *gender;
@property (nullable, nonatomic, retain) NSString                *largePicture;
@property (nullable, nonatomic, retain) NSString                *lastName;
@property (nullable, nonatomic, retain) NSString                *pictureURLPath;
@property (nullable, nonatomic, retain) NSString                *smallPicture;
@property (nullable, nonatomic, retain) NSSet<AKUserModel *>    *friends;

//+ (instancetype)userWithDictionary:(NSDictionary *)dictionary;
//
//- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

@interface AKUserModel (CoreDataGeneratedAccessors)

- (void)addFriendsObject:(AKUserModel *)value;
- (void)removeFriendsObject:(AKUserModel *)value;
- (void)addFriends:(NSSet<AKUserModel *> *)values;
- (void)removeFriends:(NSSet<AKUserModel *> *)values;

@end

NS_ASSUME_NONNULL_END
