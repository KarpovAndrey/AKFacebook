//
//  AKFriendsDetailViewController.m
//  AKStudy
//
//  Created by Admin on 08.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "AKFriendsDetailViewController.h"
#import "AKFriendsDetailView.h"
#import "AKUserContext.h"
#import "AKUser.h"

static NSString * const kAKNavigationItemTitle = @"FRIEND DETAIL";

@interface AKFriendsDetailViewController ()
@property (nonatomic, readonly) AKFriendsDetailView       *rootView;
//@property (nonatomic, strong)   AKUserContext             *context;

@end

@implementation AKFriendsDetailViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UINavigationController *controller = self.navigationController;
    controller.navigationBarHidden = NO;
    self.navigationItem.title = kAKNavigationItemTitle;
    [self.rootView fillWithModel:self.user];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKFriendsDetailView);

- (void)setUser:(AKUser *)user {
    if (_user != user) {
        _user = user;
        
//        self.context = [[AKUserContext alloc] initWithUserID:_user.userID];
    }
}

//- (void)setContext:(AKUserContext *)context {
//    if (_context != context) {
//        _context = context;
//        
//        AKWeakify;
//        [_context addHandler:^(AKUser *user) {
//            AKStrongifyAndReturnIfNil(AKFriendsDetailViewController)
//            strongSelf.user = user;
//            AKFriendsDetailView *rootView = strongSelf.rootView;
//            [rootView removeLoadingViewAnimated:YES];
//        }forState:kAKModelLoadedState
//                      object:self];
//        
//        [_context load];
//    }
//}

@end
