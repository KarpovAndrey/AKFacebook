//
//  AKFriendsViewCell.m
//  AKStudy
//
//  Created by Admin on 05.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKFriendsViewCell.h"
#import "AKImageView.h"
#import "AKUserModel.h"

@implementation AKFriendsViewCell

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(AKUserModel *)user {
    NSString *labelString = [NSString stringWithFormat:@"%@ %@", user.firstName, user.lastName];
    self.cellLabel.text = labelString;
    self.customImageView.URL = [NSURL URLWithString:user.pictureURLPath];
}

@end
