//
//  AKUserViewCell.h
//  AKStudy
//
//  Created by Admin on 05.05.16.
//  Copyright © 2016 Admin. All rights reserved.
//
//
#import <UIKit/UIKit.h>

@class AKImageView;
@class AKUserModel;

@interface AKFriendsViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UILabel        *cellLabel;
@property (nonatomic, strong) IBOutlet AKImageView    *customImageView;

- (void)fillWithModel:(AKUserModel *)user;

@end
