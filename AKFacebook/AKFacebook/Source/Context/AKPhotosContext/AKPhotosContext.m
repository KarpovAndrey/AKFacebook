//
//  AKPhotosContext.m
//  AKFacebook
//
//  Created by Admin on 22.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "AKPhotosContext.h"

#import "AKUserContext.h"
#import "AKUserModel.h"
#import "AKFacebookConstants.h"
#import "AKUserImage.h"

@implementation AKPhotosContext

#pragma mark -
#pragma mark Accessors

- (NSDictionary *)requestParameters {
    return kAKPhotosRequestParameters;
}

#pragma mark -
#pragma mark Public

- (void)parseData:(NSDictionary *)result {
    AKUserModel *user = self.user;
    NSArray *array = [result valueForKeyPath:kAKAlbumsDataKey];
    for (NSDictionary *album in array) {
        NSArray *photos = [album valueForKeyPath:kAKPhotoDataKey];
        for (NSDictionary *photoDictionaty in photos) {
            NSString *IDString = [photoDictionaty valueForKey:kAKUserIDKey];
            AKUserImage *userPhoto = [AKUserImage objectWithID:IDString];
            NSString *URLString = [photoDictionaty valueForKey:kAKPictureKey];
            userPhoto.imageURLPath = URLString;
            userPhoto.user = self.user;
            
            [user addPhotosObject:userPhoto];
        }
    }
    
    [self setState:kAKModelLoadedState withObject:[user.photos allObjects]];
}

@end
