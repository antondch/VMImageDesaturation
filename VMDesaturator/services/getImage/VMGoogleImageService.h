//
//  VMGoogleImageService.h
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMImageService.h"

@interface VMGoogleImageService : NSObject<VMImageServiceDelegate>{
    NSURLSession *_session;
}
-(void)fetchDataForImageName:(NSString *)name withCallBackBlock:(CallBackBlock)callBackBlock;
@end
