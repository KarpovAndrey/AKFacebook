//
//  AKFriendsPhotosCell.h
//  AKFacebook
//
//  Created by Admin on 22.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKImageView;
@class AKUserImage;

@interface AKFriendsPhotosCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet AKImageView    *cellImageView;

- (void)fillWithPhoto:(AKUserImage *)photo;

@end
