//
//  AKFriendsDetailView.h
//  AKFacebook
//
//  Created by Admin on 12.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "AKView.h"

@class AKImageView;
@class AKUserModel;

@interface AKFriendsDetailView : AKView
@property (nonatomic, strong) IBOutlet  UILabel     *nameLabel;
@property (nonatomic, strong) IBOutlet  UILabel     *genderLabel;
@property (nonatomic, strong) IBOutlet  AKImageView *userImage;

- (void)fillWithModel:(AKUserModel *)user;

@end
