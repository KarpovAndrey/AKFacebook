//
//  AKCustomViewController.m
//  AKFacebook
//
//  Created by Admin on 13.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "AKCustomViewController.h"
#import "AKView.h"
#import "AKContext.h"
#import "AKUserModel.h"

static NSString * const kAKNavigationItemTitle  = @"TITLE";

static NSString * const kAKAllertControllerTitle    = @"No Interner Connection";
static NSString * const kAKAllertControllerMessage  = @"Make sure your device is connected to the internet";
static NSString * const kAKActionTitle              = @"OK";

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

- (void)setUser:(AKUserModel *)user {
    if (_user != user) {
        _user = user;
    }
}

- (void)setContext:(AKContext *)context {
    if (_context != context) {
        [_context cancel];
        _context = context;
        
        AKWeakify;
        [_context addHandler:^(id object) {
            AKStrongifyAndReturnIfNil
            [strongSelf userDidLoadWithObject:object];
        }forState:kAKModelLoadedState
                      object:self];
        
        [_context load];
        
        [_context addHandler:^(id object) {
            AKStrongifyAndReturnIfNil
            [strongSelf userDidFail:object];
        }forState:kAKModelFailedState
                      object:self];
        
        [_context load];
    }
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

#pragma mark -
#pragma mark Public

- (void)userDidLoadWithObject:(id)object {
    
}

- (void)userDidFail:(id)object {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:kAKAllertControllerTitle
                                                                   message:kAKAllertControllerMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:kAKActionTitle style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                          }];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
