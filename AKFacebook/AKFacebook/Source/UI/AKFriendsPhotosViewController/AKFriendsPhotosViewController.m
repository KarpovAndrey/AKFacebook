//
//  AKFriendsPhotosViewController.m
//  AKFacebook
//
//  Created by Admin on 22.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "AKFriendsPhotosViewController.h"
#import "AKFriendsPhotosCell.h"
#import "AKFriendsPhotosView.h"
#import "AKPhotosContext.h"
#import "AKUserModel.h"

static NSString * const kAKNavigationItemTitle  = @"FRIEND'S PHOTOS";

@interface AKFriendsPhotosViewController ()
@property (nonatomic, readonly) AKFriendsPhotosView     *rootView;
@property (nonatomic, strong)   NSArray                 *photos;

@end

@implementation AKFriendsPhotosViewController

#pragma mark -
#pragma mark Accessors

AKRootViewAndReturnIfNil(AKFriendsPhotosViewController);

- (void)setUser:(AKUserModel *)user {
    [super setUser:user];
    
    self.context = [[AKPhotosContext alloc] initWithUser:user];
}

- (NSString *)navigationItemTitle {
    return kAKNavigationItemTitle;
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.context.state == kAKModelLoadingState) {
        [self.rootView showLoadingViewWithDefaultMessageAnimated:YES];
    }
}

#pragma mark -
#pragma mark UITableViewDataSource Protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AKFriendsPhotosCell *cell = [tableView dequeueCellFromNibWithClass:[AKFriendsPhotosCell class]];
    [cell fillWithModel:self.photos[indexPath.row]];
    
    return cell;
}

#pragma mark -
#pragma mark Public

- (void)userDidLoadWithObject:(NSSet *)userPhotos {
    AKFriendsPhotosView *rootView = self.rootView;
    self.photos = [userPhotos allObjects];
    [rootView.tableView reloadData];
    [self.rootView removeLoadingViewAnimated:YES];
}

- (void)userDidFailToLoad:(AKUserModel *)user {
    [super userDidFailToLoad:user];
    AKFriendsPhotosView *rootView = self.rootView;
    self.photos = [user.photos allObjects];
    [rootView.tableView reloadData];
    [self.rootView removeLoadingViewAnimated:YES];
}

@end
