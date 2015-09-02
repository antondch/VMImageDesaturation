//
//  VMImageProfile.h
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMImageService.h"

@interface VMImageResponse : NSObject{
    ImageServiceResult _resultCode;
    NSMutableArray *_privateProfiles;
}

@property (nonatomic, readonly) NSArray *profiles;
@property (nonatomic) ImageServiceResult resultCode;

-(instancetype)initProfileWithData:(NSData*)data;
@end

