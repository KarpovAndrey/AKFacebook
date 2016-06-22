//
//  AKFriendsPhotosCell.m
//  AKFacebook
//
//  Created by Admin on 22.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "AKFriendsPhotosCell.h"
#import "AKImageView.h"
#import "AKUserModel.h"
#import "AKUserImage.h"

@implementation AKFriendsPhotosCell

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(AKUserModel *)user {
    NSString *path = nil;
    
    for (AKUserImage *image in [user.photos allObjects]) {
        path = image.imageURLPath;
    }
    
    self.cellImageView.URL = [NSURL URLWithString:path];
}

@end
