//
//  VMImageService.h
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VMImageResponse;

typedef enum{
    succsess,
    serverError,
    parseError,
    otherError
}ImageServiceResult;

typedef void (^ CallBackBlock)(VMImageResponse*);

@protocol VMImageServiceDelegate <NSObject>

@required
-(void)fetchDataForImageName:(NSString*)name withCallBackBlock:(CallBackBlock)callBackBlock;
@end

