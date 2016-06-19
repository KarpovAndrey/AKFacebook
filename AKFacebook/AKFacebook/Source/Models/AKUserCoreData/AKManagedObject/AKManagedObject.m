//
//  AKManagedObject.m
//  AKFacebook
//
//  Created by Admin on 18.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "IDPActiveRecordKit.h"

#import "AKManagedObject.h"
#import "AKCoreDataConstants.h"

@implementation AKManagedObject
@dynamic ID;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)objectWithID:(NSString *)ID {
    AKManagedObject *object = [self findObjectWithID:ID];
    if (object) {
        return object;
    }
    
    object = [self managedObject];
    object.ID = ID;
    
    return object;
}


+ (instancetype)findObjectWithID:(NSString *)ID {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %@", kAKIDKey, ID];
    
    return [[[self class] fetchEntityWithSortDescriptors:nil predicate:predicate prefetchPaths:nil] firstObject];
}


#pragma mark -
#pragma mark Accessors

- (void)setID:(NSString *)ID {
    [self setCustomValue:ID forKey:kAKIDKey];
}

- (NSString *)ID {
    return [self customValueForKey:kAKIDKey];
}

@end
