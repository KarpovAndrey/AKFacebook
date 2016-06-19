//
//  AKCustomViewController.h
//  AKFacebook
//
//  Created by Admin on 13.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKUserModel;
@class AKContext;

@interface AKCustomViewController : UIViewController
@property (nonatomic, strong)       AKUserModel     *user;
@property (nonatomic, strong)       AKContext       *context;

- (void)userDidLoadWithObject:(id)object;
- (void)userDidFail:(id)object;

@end
