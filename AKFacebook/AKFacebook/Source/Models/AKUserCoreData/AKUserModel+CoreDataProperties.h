//
//  AKUserModel+CoreDataProperties.h
//  AKFacebook
//
//  Created by Admin on 22.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AKUserModel.h"
#import "AKUserImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface AKUserModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString                *firstName;
@property (nullable, nonatomic, retain) NSString                *gender;
@property (nullable, nonatomic, retain) NSString                *largePicture;
@property (nullable, nonatomic, retain) NSString                *lastName;
@property (nullable, nonatomic, retain) NSString                *pictureURLPath;
@property (nullable, nonatomic, retain) NSString                *smallPicture;
@property (nullable, nonatomic, retain) NSSet<AKUserModel *>    *friends;
@property (nullable, nonatomic, retain) NSSet<AKUserImage *>    *photos;

@end

@interface AKUserModel (CoreDataGeneratedAccessors)

- (void)addFriendsObject:(AKUserModel *)value;
- (void)removeFriendsObject:(AKUserModel *)value;
- (void)addFriends:(NSSet<AKUserModel *> *)values;
- (void)removeFriends:(NSSet<AKUserModel *> *)values;

- (void)addPhotosObject:(AKUserImage *)value;
- (void)removePhotosObject:(AKUserImage *)value;
- (void)addPhotos:(NSSet<AKUserImage *> *)values;
- (void)removePhotos:(NSSet<AKUserImage *> *)values;

@end

NS_ASSUME_NONNULL_END
