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

static NSString * const kAKNavigationItemTitle  = @"FRIEND DETAIL";
static NSString * const kAKLoadingViewMessage   = @"Show must go on";

@interface AKFriendsDetailViewController ()
@property (nonatomic, readonly) AKFriendsDetailView       *rootView;
@property (nonatomic, strong)   AKUserContext             *context;

- (void)load;

@end

@implementation AKFriendsDetailViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.rootView showLoadingViewWithMessage:kAKLoadingViewMessage animated:YES];
}

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKFriendsDetailView);

- (void)setUser:(AKUser *)user {
    if (_user != user) {
        _user = user;
        
        self.context = [[AKUserContext alloc] initWithUser:_user];
    }
}

- (void)setContext:(AKUserContext *)context {
    if (_context != context) {
        _context = context;
        
        AKWeakify;
        [_context addHandler:^(AKUser *user) {
            AKStrongifyAndReturnIfNil(AKFriendsDetailViewController)
            strongSelf.user = user;
            [strongSelf load];
        }forState:kAKModelLoadedState
                      object:self];
        
        [_context load];
    }
}

- (NSString *)navigationItemTitle {
    return kAKNavigationItemTitle;
}

#pragma mark -
#pragma mark Private

- (void)load {
    AKFriendsDetailView *rootView = self.rootView;
    [rootView fillWithModel:self.user];
    [rootView removeLoadingViewAnimated:YES];
}

@end
