//
//  AKFriendsViewController.m
//  AKStudy
//
//  Created by Admin on 07.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "AKFriendsContext.h"
#import "AKUser.h"
#import "AKFriendsViewController.h"
#import "AKFriendsDetailViewController.h"
#import "AKFriendsView.h"
#import "AKLoadingView.h"
#import "AKFriendsViewCell.h"

#define kAKPurpleColor colorWithRed:.8 green:.8 blue:1 alpha:1

static NSString * const kAKLoadingViewMessage   = @"Loading...";
static NSString * const kAKNavigationItemTitle  = @"FRIENDS";

@interface AKFriendsViewController ()
@property (nonatomic, strong)       NSArray             *friends;
@property (nonatomic, readonly)     AKFriendsView       *rootView;
@property (nonatomic, strong)       AKLoadingView       *loadingView;

@end

@implementation AKFriendsViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.context.state != kAKModelLoadedState) {
        [self.rootView showLoadingViewWithMessage:kAKLoadingViewMessage animated:YES];
    }
}

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKFriendsView);

- (void)setUser:(AKUser *)user {
    [super setUser:user];
    
    self.context = [[AKFriendsContext alloc] initWithUser:user];
}

- (void)setFriends:(NSArray *)friends {
    if (_friends != friends) {
        _friends = friends;
        
        AKFriendsView *rootView = self.rootView;
        [rootView.tableView reloadData];
        [rootView removeLoadingViewAnimated:YES];
    }
}

- (NSString *)loadingViewMessage {
    return kAKLoadingViewMessage;
}

- (NSString *)navigationItemTitle {
    return kAKNavigationItemTitle;
}

#pragma mark -
#pragma mark UITableViewDataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.friends.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AKFriendsViewCell *cell = [tableView dequeueCellFromNibWithClass:[AKFriendsViewCell class]];
    [cell fillWithModel:self.friends[indexPath.row]];
    [cell setBackgroundColor:[UIColor kAKPurpleColor]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AKFriendsDetailViewController *controller = [AKFriendsDetailViewController new];
    controller.user = self.friends[indexPath.row];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Public

- (void)userDidLoadWithObject:(NSArray *)friends {
    self.friends = friends;
}

@end
