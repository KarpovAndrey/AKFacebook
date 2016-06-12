//
//  AKUser.h
//  AKStudy
//
//  Created by Admin on 09.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKUser : NSObject
@property (nonatomic, copy)     NSString    *firstName;
@property (nonatomic, copy)     NSString    *lastName;
@property (nonatomic, copy)     NSString    *userID;
@property (nonatomic, copy)     NSString    *gender;
@property (nonatomic, copy)     NSString    *pictureURLPath;
@property (nonatomic, strong)   NSArray     *friends;
@property (nonatomic, readonly) NSString    *smallPicture;
@property (nonatomic, readonly) NSString    *largePicture;

+ (instancetype)userWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithUserID:(NSString *)userID;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
