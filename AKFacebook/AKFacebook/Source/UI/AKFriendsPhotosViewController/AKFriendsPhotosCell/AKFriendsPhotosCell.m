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

- (void)fillWithPhoto:(AKUserImage *)photo {
    self.cellImageView.URL = [NSURL URLWithString:photo.imageURLPath];
}

@end
