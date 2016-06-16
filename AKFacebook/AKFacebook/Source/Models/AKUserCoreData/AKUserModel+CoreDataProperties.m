//
//  AKUserModel+CoreDataProperties.m
//  AKFacebook
//
//  Created by Admin on 16.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AKUserModel+CoreDataProperties.h"

@implementation AKUserModel (CoreDataProperties)

@dynamic firstName;
@dynamic lastName;
@dynamic userID;
@dynamic gender;
@dynamic pictureURLPath;
@dynamic smallPicture;
@dynamic largePicture;
@dynamic friends;

@end
