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
    
    NSMutableSet *userPhotos = [NSMutableSet new];
    NSLog(@"%@", [result valueForKeyPath:kAKAlbumsKey]);
    NSDictionary *albums = [result valueForKeyPath:kAKAlbumsKey];
    NSDictionary *data = [albums valueForKey:@"data"];
    NSDictionary *photos = [data valueForKey:@"photos"];
    NSDictionary *photosData = [photos valueForKey:@"data"];
    NSArray *images = [photosData valueForKey:@"images"];
    for (NSArray *array in images) {
        for (NSArray *smallArray in array) {
            for (NSDictionary *dictionary in smallArray) {
                NSLog(@"%@", [dictionary valueForKey:@"source"]);
                AKUserImage *userImage = [AKUserImage objectWithID:self.user.ID];
                userImage.imageURLPath = [dictionary valueForKey:@"source"];
                
                [userPhotos addObject:userImage];
            }
        }
    }
    
    user.photos = userPhotos;
    
    [self setState:kAKModelLoadedState withObject:userPhotos];
}

@end
