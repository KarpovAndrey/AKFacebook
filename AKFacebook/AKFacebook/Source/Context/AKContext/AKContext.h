//
//  AKContext.h
//  AKFacebook
//
//  Created by Admin on 13.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "AKModel.h"

@class AKUser;

@interface AKContext : AKModel
@property (nonatomic, strong)   AKUser  *user;

- (instancetype)initWithUser:(AKUser *)user;

@end
