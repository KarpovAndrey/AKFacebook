//
//  AKContext.h
//  AKFacebook
//
//  Created by Admin on 13.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "AKModel.h"

@class AKUserModel;

@interface AKContext : AKModel
@property (nonatomic, strong)       AKUserModel          *user;
@property (nonatomic, readonly)     NSDictionary    *requestParameters;

- (instancetype)initWithUser:(AKUserModel *)user;

- (void)cancel;

//these methods are called in subclasses
//you should never call these method directly from outside subclasses
- (void)parseData:(NSDictionary *)result;

@end
