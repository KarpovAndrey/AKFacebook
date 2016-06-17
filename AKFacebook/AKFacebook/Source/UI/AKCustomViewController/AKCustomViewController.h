//
//  AKCustomViewController.h
//  AKFacebook
//
//  Created by Admin on 13.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKUser;
@class AKContext;

@interface AKCustomViewController : UIViewController
@property (nonatomic, strong)       AKUser *user;
@property (nonatomic, strong)       AKContext    *context;

- (void)userDidLoadWithObject:(id)object;

@end
