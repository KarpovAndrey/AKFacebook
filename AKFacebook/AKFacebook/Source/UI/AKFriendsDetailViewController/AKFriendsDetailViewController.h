//
//  AKFriendsDetailViewController.h
//  AKStudy
//
//  Created by Admin on 08.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AKCustomViewController.h"

@class AKUser;

@interface AKFriendsDetailViewController : AKCustomViewController
@property (nonatomic, strong) AKUser *user;

@end
