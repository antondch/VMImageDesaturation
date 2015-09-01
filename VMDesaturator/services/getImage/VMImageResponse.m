//
//  VMImageProfile.m
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import "VMImageResponse.h"

@implementation VMImageResponse
@synthesize size = _size;
@synthesize tbSize = _tbSize;
@synthesize url = _url;
@synthesize tbUrl = _tbUrl;
@synthesize title = _title;
@synthesize result = _result;

-(instancetype)initProfileWithData:(NSData *)data{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)]
                                 userInfo:nil];
}
@end
