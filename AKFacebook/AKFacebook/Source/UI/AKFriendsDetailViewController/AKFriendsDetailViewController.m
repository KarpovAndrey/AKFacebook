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
#import "AKFriendsPhotosViewController.h"

static NSString * const kAKNavigationItemTitle  = @"FRIEND DETAIL";
static NSString * const kAKLoadingViewMessage   = @"Show must go on";

@interface AKFriendsDetailViewController ()
@property (nonatomic, readonly) AKFriendsDetailView       *rootView;

- (void)load;

@end

@implementation AKFriendsDetailViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
#pragma mark Handling Interrface

- (IBAction)onClickShowPhotosButton:(id)sender {
    AKFriendsPhotosViewController *controller = [AKFriendsPhotosViewController new];
    controller.user = self.user;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Public

- (void)userDidLoadWithObject:(AKUserModel *)user {
    [self load];
}

- (void)userDidFailToLoad:(AKUserModel *)user {
    [super userDidFailToLoad:user];
    [self load];
}

#pragma mark -
#pragma mark Privete

- (void)load {
    AKFriendsDetailView *rootView = self.rootView;
    [rootView fillWithModel:self.user];
    [rootView removeLoadingViewAnimated:YES];
}

@end
