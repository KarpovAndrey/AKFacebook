//
//  AKSharedCacheModel.h
//  AKStudy
//
//  Created by Admin on 02.06.16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKSharedCacheModel : NSObject <NSCoding>

+ (instancetype)sharedCache;

- (NSString *)URLStringForFileName:(NSString *)fileName;
- (BOOL)isCahedForURLString:(NSString *)URLString;
- (void)addFileNameForURLString:(NSString *)URLString;
- (void)removeFileNameForURLString:(NSString *)URLString;

@end
