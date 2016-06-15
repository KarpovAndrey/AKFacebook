//
//  AKCustomViewController.m
//  AKFacebook
//
//  Created by Admin on 13.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "AKCustomViewController.h"
#import "AKView.h"

static NSString * const kAKNavigationItemTitle  = @"TITLE";

@interface AKCustomViewController ()
@property (nonatomic, readonly) NSString    *loadingViewMessage;
@property (nonatomic, readonly) NSString    *navigationItemTitle;

- (void)leftButtonClick;
- (void)showNavigationBar;

@end

@implementation AKCustomViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self showNavigationBar];
}

#pragma mark -
#pragma mark Accessors

- (NSString *)navigationItemTitle {
    return kAKNavigationItemTitle;
}

#pragma mark -
#pragma mark Private

- (void)leftButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showNavigationBar {
    self.navigationController.navigationBarHidden = NO;
    self.navigationItem.title = self.navigationItemTitle;
    
    UIImage *backButtonImage = [UIImage imageNamed:@"BackButton"];
    backButtonImage = [backButtonImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backButtonImage
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(leftButtonClick)];;
    
    
    
    //    UIButton *backButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 54.0f, 30.0f)];
    //    [backButton setImage:[UIImage imageNamed:@"BackButton.png"]  forState:UIControlStateNormal];
    //    [backButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

@end