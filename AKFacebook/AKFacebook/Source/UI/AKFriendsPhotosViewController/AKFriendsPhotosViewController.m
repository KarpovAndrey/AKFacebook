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

- (void)setPhotos:(NSArray *)photos {
    if (_photos != photos) {
        _photos = photos;
        
        [self.rootView.collectionView reloadData];
    }
}

#pragma mark -
#pragma mark View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.rootView.collectionView registerNib:[UINib loadFromNibWithClass:[AKFriendsPhotosCell class]] forCellWithReuseIdentifier:NSStringFromClass([AKFriendsPhotosCell class])];
    if (self.context.state == kAKModelLoadingState) {
        [self.rootView showLoadingViewWithDefaultMessageAnimated:YES];
    }
}

#pragma mark -
#pragma mark UICollectionViewDataSource Protool

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AKFriendsPhotosCell *cell = [collectionView
                                      dequeueReusableCellFromNibWithClass:[AKFriendsPhotosCell class]
                                      indexPath:indexPath];
    
    [cell fillWithPhoto:self.photos[indexPath.row]];
    
    return cell;
}

#pragma mark -
#pragma mark Public

- (void)userDidLoadWithObject:(NSArray *)photos {
    self.photos = photos;
    [self.rootView removeLoadingViewAnimated:YES];
}

//- (void)userDidFailToLoad {
//    [super userDidFailToLoad:user];
//    self.photos = [user.photos allObjects];
//    [self.rootView removeLoadingViewAnimated:YES];
//}

@end
