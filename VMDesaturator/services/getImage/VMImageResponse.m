//
//  VMImageProfile.m
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import "VMImageResponse.h"

@implementation VMImageResponse

@synthesize resultCode = _resultCode;

-(instancetype)initProfileWithData:(NSData *)data{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}

-(NSArray*)profiles{
    return _privateProfiles;
}
@end
