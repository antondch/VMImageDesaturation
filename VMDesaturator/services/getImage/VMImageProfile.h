//
//  VMImageProfile.h
//  VMDesaturator
//
//  Created by jessie on 02.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMImageProfile : NSObject
@property (nonatomic) NSNumber *width;
@property (nonatomic) NSNumber *height;
@property (nonatomic) NSNumber *tbWidth;
@property (nonatomic) NSNumber *tbHeight;
@property (nonatomic) NSURL *url;
@property (nonatomic) NSURL *tbUrl;
@property (nonatomic, copy) NSString *title;
@end
