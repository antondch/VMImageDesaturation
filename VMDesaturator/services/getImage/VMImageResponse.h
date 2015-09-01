//
//  VMImageProfile.h
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "VMImageService.h"

@interface VMImageResponse : NSObject
@property (nonatomic) CGSize size;
@property (nonatomic) CGSize tbSize;
@property (nonatomic) NSURL *url;
@property (nonatomic) NSURL *tbUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic) ImageServiceResult result;

-(instancetype)initProfileWithData:(NSData*)data NS_DESIGNATED_INITIALIZER;
@end

