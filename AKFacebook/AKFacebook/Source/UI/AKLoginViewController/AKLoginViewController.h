//
//  AKLoginViewController.h
//  FBProject
//
//  Created by Admin on 06.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AKUserModel;

@interface AKLoginViewController : UIViewController
@property (nonatomic, strong) AKUserModel *user;

- (IBAction)onClickLoginButton:(id)sender;

@end

