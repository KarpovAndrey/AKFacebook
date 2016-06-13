//
//  AKFriendsViewController.h
//  AKStudy
//
//  Created by Admin on 07.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AKCustomViewController.h"

@class AKUser;

@interface AKFriendsViewController : AKCustomViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) AKUser    *user;

@end
