//
//  AKManagedObject.h
//  AKFacebook
//
//  Created by Admin on 18.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface AKManagedObject : NSManagedObject
@property (nonatomic, copy) NSString             *ID;

+ (instancetype)objectWithID:(NSString *)ID;
+ (instancetype)findObjectWithID:(NSString *)ID;

@end
