//
//  AKFacebookConstans.h
//  AKFacebook
//
//  Created by Admin on 12.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#ifndef AKFacebookConstans_h
#define AKFacebookConstans_h

#define kAKFriendsRequestParameters @{@"fields":@"friends{id,first_name,last_name,friends,picture}",}
#define kAKUserRequestParameters @{@"fields":@"id,first_name,last_name,gender,picture",}

#define kAKFacebookPermissions @[@"public_profile", @"user_friends"]

static NSString * const kAKRequestHTTPMethod  = @"GET";
static NSString * const kAKFriendsKeyPath     = @"friends.data";

static NSString * const kAKFirstNameKey       = @"first_name";
static NSString * const kAKLastNameKey        = @"last_name";
static NSString * const kAKGenderKey          = @"gender";
static NSString * const kAKUserIDKey          = @"id";
static NSString * const kAKPictureURLKeyPath  = @"picture.data.url";
static NSString * const kAKFriendsKey         = @"friends";
static NSString * const kAKDataKey            = @"data";

static NSString * const kAKLargePictureURL    = @"https://graph.facebook.com/%@/picture?type=large";
static NSString * const kAKSmallPictureURL    = @"https://graph.facebook.com/%@/picture?type=small";

#endif /* AKFacebookConstans_h */
