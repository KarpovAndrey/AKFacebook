//
//  AKFriendsDetailViewController.m
//  AKStudy
//
//  Created by Admin on 08.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "IDPActiveRecordKit.h"

#import "AKFriendsDetailViewController.h"
#import "AKFriendsDetailView.h"
#import "AKUserContext.h"
#import "AKUserModel.h"

static NSString * const kAKNavigationItemTitle  = @"FRIEND DETAIL";
static NSString * const kAKLoadingViewMessage   = @"Show must go on";

@interface AKFriendsDetailViewController ()
@property (nonatomic, readonly) AKFriendsDetailView       *rootView;

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

- (void)setUser:(AKUserModel *)user {
    [super setUser:user];
    
    self.context = [[AKUserContext alloc] initWithUser:user];
}

- (NSString *)navigationItemTitle {
    return kAKNavigationItemTitle;
}

#pragma mark -
#pragma mark Private

- (void)userDidLoadWithObject:(AKUserModel *)user {
    [user saveManagedObject];
    AKFriendsDetailView *rootView = self.rootView;
    [rootView fillWithModel:self.user];
    [rootView removeLoadingViewAnimated:YES];
}

- (void)userDidFail:(AKUserModel *)user {
    [super userDidFail:user];
    
    AKFriendsDetailView *rootView = self.rootView;
    [rootView fillWithModel:self.user];
    [rootView removeLoadingViewAnimated:YES];
}

@end
