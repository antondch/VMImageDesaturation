//
//  PicSearchViewController.h
//  VMDesaturator
//
//  Created by jessie on 01.09.15.
//  Copyright (c) 2015 DCH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMImageService.h"

@interface VMPicSearchViewController : UIViewController{
    id<VMImageServiceDelegate> _imageService;
}
@end
