//
//  AKFriendsDetailView.m
//  AKFacebook
//
//  Created by Admin on 12.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "AKFriendsDetailView.h"
#import "AKUser.h"
#import "AKImageView.h"

@implementation AKFriendsDetailView

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(AKUser *)user {
    NSString *name = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
    self.nameLabel.text = name;
    self.genderLabel.text = user.gender;
    self.userImage.URL = [NSURL URLWithString:user.largePicture];
}

@end
