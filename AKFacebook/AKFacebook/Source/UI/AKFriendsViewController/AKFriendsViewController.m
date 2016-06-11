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
#import "AKFriendsView.h"
#import "AKLoadingView.h"
#import "AKFriendsViewCell.h"

static NSString * const kAKLoadingViewMessage = @"Loading...";

@interface AKFriendsViewController ()
@property (nonatomic, strong)   AKFriendsContext    *context;
@property (nonatomic, strong)   NSArray             *friends;
@property (nonatomic, readonly)   AKFriendsView       *rootView;
@property (nonatomic, strong)   AKLoadingView       *loadingView;

@end

@implementation AKFriendsViewController

#pragma mark -
#pragma mark View LifeCycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.rootView showLoadingViewWithMessage:kAKLoadingViewMessage animated:YES];

    self.navigationController.navigationBarHidden = NO;
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
////    self.rootView.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1406958748.jpg"]];
//}

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKFriendsView);

- (void)setUser:(AKUser *)user {
    if (_user != user) {
        _user = user;
        
        self.context = [[AKFriendsContext alloc] initWithUserID:_user.userID];
    }
}

- (void)setContext:(AKFriendsContext *)context {
    if (_context != context) {
        _context = context;
        
        AKWeakify;
        [_context addHandler:^(NSArray *friends) {
            AKStrongifyAndReturnIfNil(AKFriendsViewController)
            strongSelf.friends = friends;
            AKFriendsView *rootView = strongSelf.rootView;
            [rootView.tableView reloadData];
            [rootView removeLoadingViewAnimated:YES];
        }forState:kAKModelLoadedState
            object:self];
        
        [_context load];
    }
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

@end
