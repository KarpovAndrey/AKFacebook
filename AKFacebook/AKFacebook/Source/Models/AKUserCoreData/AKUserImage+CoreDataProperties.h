//
//  AKUserImage+CoreDataProperties.h
//  AKFacebook
//
//  Created by Admin on 22.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AKUserImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface AKUserImage (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString    *imageURLPath;
@property (nullable, nonatomic, retain) AKUserModel *user;

@end

NS_ASSUME_NONNULL_END
