//
//  AKPhotosContext.h
//  AKFacebook
//
//  Created by Admin on 22.06.16.
//  Copyright © 2016 Karpov Andrey. All rights reserved.
//

#import "AKContext.h"

@class AKUserImage;

@interface AKPhotosContext : AKContext
@property (nonatomic, strong) AKUserImage *userImage;
@end
