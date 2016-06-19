//
//  AKUserModel.m
//  AKFacebook
//
//  Created by Admin on 16.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "IDPActiveRecordKit.h"

#import "AKUserModel.h"
#import "AKCoreDataConstants.h"
#import "AKFacebookConstants.h"

@implementation AKUserModel
@dynamic wasLogged;

- (void)setWasLogged:(BOOL)wasLogged {
    NSNumber *number = [NSNumber numberWithBool:wasLogged];
    [self setCustomValue:number forKey:kAKWasLoggedKey];
}

- (BOOL)wasLogged {
    NSNumber *number = [self customValueForKey:kAKWasLoggedKey];
    
    return [number boolValue];
}

- (NSString *)largePicture {
    return [NSString stringWithFormat:kAKLargePictureURL, self.ID];
}

- (NSString *)smallPicture {
    return [NSString stringWithFormat:kAKSmallPictureURL, self.ID];
}

@end
