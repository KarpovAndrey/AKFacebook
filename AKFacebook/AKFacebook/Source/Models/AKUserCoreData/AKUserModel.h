//
//  AKUserModel.h
//  AKFacebook
//
//  Created by Admin on 16.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AKManagedObject.h"

NS_ASSUME_NONNULL_BEGIN


@interface AKUserModel : AKManagedObject
@property (nonatomic, assign) BOOL                wasLogged;

@end

NS_ASSUME_NONNULL_END

#import "AKUserModel+CoreDataProperties.h"
