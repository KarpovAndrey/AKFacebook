//
//  AKFriendsViewController.m
//  AKStudy
//
//  Created by Admin on 07.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <QuartzCore/QuartzCore.h>

#import "IDPActiveRecordKit.h"

#import "AKFriendsContext.h"
#import "AKUserModel.h"
#import "AKFriendsViewController.h"
#import "AKFriendsDetailViewController.h"
#import "AKFriendsView.h"
#import "AKLoadingView.h"
#import "AKFriendsViewCell.h"

#define kAKPurpleColor colorWithRed:.8 green:.8 blue:1 alpha:1
#define kAKTransitionDuration 0.5f;

static NSString * const kAKLoadingViewMessage   = @"Loading...";
static NSString * const kAKNavigationItemTitle  = @"FRIENDS";

@interface AKFriendsViewController ()
@property (nonatomic, strong)       NSArray             *friends;
@property (nonatomic, readonly)     AKFriendsView       *rootView;
@property (nonatomic, strong)       AKLoadingView       *loadingView;

- (void)loadWithFriends:(NSArray *)friends;
- (void)performTransition;

@end

@implementation AKFriendsViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.rootView showLoadingViewAnimated:YES];
}

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKFriendsView);

- (void)setUser:(AKUserModel *)user {
    [super setUser:user];
    
    self.context = [[AKFriendsContext alloc] initWithUser:user];
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
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    AKFriendsDetailViewController *controller = [AKFriendsDetailViewController new];
    controller.user = self.friends[indexPath.row];
    [self performTransition];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark Public

- (void)userDidLoadWithObject:(NSArray *)friends {
    [self loadWithFriends:friends];
}

- (void)userDidFailToLoad:(AKUserModel *)user {
    [super userDidFailToLoad:user];
    
    [self loadWithFriends:[user.friends allObjects]];
}

#pragma mark -
#pragma mark Private

- (void)loadWithFriends:(NSArray *)friends {
    self.friends = friends;
    AKFriendsView *rootView = self.rootView;
    [rootView.tableView reloadData];
    [self.rootView removeLoadingViewAnimated:YES];
}

- (void)performTransition  {
    CATransition *transition = [CATransition animation];
    transition.duration = kAKTransitionDuration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
}

@end
